import streamlit as st
import mysql.connector
import pandas as pd
import os

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="waddahali+1122", 
        database="onlinestore"    
    )

def load_queries_from_file(filepath="sql/Operations.sql"):
    """Load SQL queries from Operations.sql file"""
    if not os.path.exists(filepath):
        return {}
    
    with open(filepath, 'r') as f:
        content = f.read()
    
    queries = [q.strip() for q in content.split(';') if q.strip()]
    
    query_dict = {
        "1. Electronics Inventory": queries[0] if len(queries) > 0 else "",
        "2. Products per Category": queries[1] if len(queries) > 1 else "",
        "3. Order Details (Order #1)": queries[2] if len(queries) > 2 else "",
        "4. Top Spenders": queries[3] if len(queries) > 3 else "",
        "5. Payment History": queries[4] if len(queries) > 4 else "",
        "6. Pending Shipments": queries[5] if len(queries) > 5 else "",
        "7. Product Ratings": queries[6] if len(queries) > 6 else "",
        "8. Low Stock Alert": queries[7] if len(queries) > 7 else "",
        "9. Top 10 Best Sellers": queries[8] if len(queries) > 8 else "",
        "10. Never Ordered Products": queries[9] if len(queries) > 9 else "",
    }
    
    return {k: v for k, v in query_dict.items() if v}

st.set_page_config(page_title="Store Admin Panel", layout="wide")
st.title("🛒 Online Store - Admin Dashboard")

menu = st.sidebar.selectbox("Menu", ["View Tables", "Add Customer", "Analytics (Queries)"])

if menu == "View Tables":
    st.header("📂 Database Viewer")
    
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SHOW TABLES")
    tables = [table[0] for table in cursor.fetchall()]
    
    selected_table = st.selectbox("Select a Table to View", tables)
    
    if selected_table:
        query = f"SELECT * FROM {selected_table}"
        df = pd.read_sql(query, conn)
        st.dataframe(df) 
    conn.close()

elif menu == "Add Customer":
    st.header("👤 Register New Customer")
    
    with st.form("customer_form"):
        f_name = st.text_input("First Name")
        l_name = st.text_input("Last Name")
        email = st.text_input("Email")
        street = st.text_input("Street Address")
        city = st.text_input("City")
        
        submitted = st.form_submit_button("Add Customer")
        
        if submitted:
            try:
                conn = get_connection()
                cursor = conn.cursor()
                query = "INSERT INTO Customer (First_Name, Last_Name, Email, Street, City) VALUES (%s, %s, %s, %s, %s)"
                cursor.execute(query, (f_name, l_name, email, street, city))
                conn.commit()
                st.success(f"Success! {f_name} {l_name} has been added.")
                conn.close()
            except Exception as e:
                st.error(f"Error: {e}")

elif menu == "Analytics (Queries)":
    st.header("📊 Business Intelligence")
    
    query_options = load_queries_from_file()
    
    if not query_options:
        st.error("Could not load queries from Operations.sql")
    else:
        selection = st.selectbox("Select a Report", list(query_options.keys()))
        
        if st.button("Run Report"):
            try:
                conn = get_connection()
                df = pd.read_sql(query_options[selection], conn)
                st.dataframe(df)
                if not df.empty and len(df.columns) <= 3:
                    st.bar_chart(df.set_index(df.columns[0]))
                conn.close()
            except Exception as e:
                st.error(f"Error running query: {e}") 
