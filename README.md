# 🛒 Online Store Database System

A comprehensive MySQL database system for managing an online store, with an interactive web-based GUI for administration and analytics.

## 📋 Project Overview

This database project implements a complete e-commerce system with the following features:
- Customer management with contact information
- Product catalog with categories and suppliers
- Order processing and tracking
- Payment handling
- Shipment tracking
- Product reviews and ratings
- **Interactive Web GUI** for database management

## 🗂️ Database Structure

The database consists of 10 interconnected tables:

1. **Customer** - Store customer information
2. **Customer_Phone** - Multiple phone numbers per customer
3. **Supplier** - Product supplier details
4. **Category** - Product categories
5. **Product** - Product catalog with pricing and inventory
6. **Orders** - Customer orders
7. **Order_Details** - Line items for each order
8. **Payment** - Payment transactions
9. **Shipment** - Shipping information
10. **Product_Review** - Customer product reviews

## 📁 Project Structure

```
Project/
│
├── sql/
│   ├── database_setup.sql      # Database schema and table creation
│   ├── Insert.sql              # Sample data insertion
│   ├── Operations.sql          # Business intelligence queries
│   └── Viewing tables.sql      # Basic table viewing queries
│
├── diagrams/
│   ├── ERRD.png                # Entity-Relationship Diagram
│   ├── Conceptual Schema.png   # Conceptual database schema
│   └── Transaction Path Way.png # Transaction flow diagram
│
├── GUI.py                       # Streamlit web application
├── requirements.txt             # Python dependencies
├── Online Store DataBase System.mwb  # MySQL Workbench model
└── README.md                    # This file
```

## 🚀 Getting Started

### Prerequisites
- MySQL Server 8.0 or higher
- Python 3.11 or higher
- MySQL Workbench (optional, for visual management)

### Installation

#### 1. Clone the Repository
```bash
git clone https://github.com/Waddah0-0/online-store-database.git
cd online-store-database
```

#### 2. Set Up the Database

**Option A: Using Command Line**
```bash
mysql -u root -p < sql/database_setup.sql
mysql -u root -p < sql/Insert.sql
```

**Option B: Using MySQL Workbench**
1. Open MySQL Workbench
2. Connect to your MySQL server
3. Open and execute `sql/database_setup.sql`
4. Open and execute `sql/Insert.sql`

#### 3. Install Python Dependencies
```bash
pip install -r requirements.txt
```

#### 4. Configure Database Connection
Edit `GUI.py` (lines 6-12) with your MySQL credentials:
```python
def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_password_here",  # Change this
        database="onlinestore"
    )
```

#### 5. Run the GUI Application
```bash
streamlit run GUI.py
```
Or if `streamlit` command is not in PATH:
```bash
python -m streamlit run GUI.py
```

The application will open in your browser at `http://localhost:8501`

## 🎯 GUI Features

The Streamlit-based admin dashboard provides three main sections:

### 📂 View Tables
- Browse all database tables interactively
- View complete table contents in a clean data grid
- Switch between tables with a dropdown selector

### 👤 Add Customer
- Register new customers with a user-friendly form
- Input: First Name, Last Name, Email, Street, City
- Real-time validation and error handling

### 📊 Analytics (Business Intelligence)
Run 10 pre-built analytical queries:
1. **Electronics Inventory** - Products in Electronics category
2. **Products per Category** - Product distribution across categories
3. **Order Details** - Detailed view of specific order
4. **Top Spenders** - Customers ranked by total spending
5. **Payment History** - Complete payment transaction records
6. **Pending Shipments** - Orders awaiting delivery
7. **Product Ratings** - Average ratings and review counts
8. **Low Stock Alert** - Products with inventory below 10 units
9. **Top 10 Best Sellers** - Most sold products by revenue
10. **Never Ordered Products** - Products with no orders

## 🔍 Key Features

- **Referential Integrity**: Comprehensive foreign key constraints
- **Data Validation**: CHECK constraints for prices, quantities, and ratings
- **Cascade Operations**: Automatic cleanup of related records
- **Indexing**: Optimized queries with strategic indexes
- **Weak Entities**: Proper implementation for payments, shipments, and reviews
- **Real-time Analytics**: Interactive business intelligence queries
- **Modern UI**: Clean, responsive web interface built with Streamlit

## 📊 Database Diagrams

- **ERRD.png** - Complete Entity-Relationship Diagram
- **Conceptual Schema.png** - Conceptual database design
- **Transaction Path Way.png** - Order processing flow

All diagrams are located in the `diagrams/` folder.

## 💻 Technology Stack

- **Database**: MySQL 8.0
- **Backend**: Python 3.11
- **GUI Framework**: Streamlit
- **Database Connector**: mysql-connector-python
- **Data Processing**: Pandas

## 🔧 Troubleshooting

### Streamlit Command Not Found
If you get `'streamlit' is not recognized`, use:
```bash
python -m streamlit run GUI.py
```

### Database Connection Error
- Ensure MySQL server is running
- Verify credentials in `GUI.py`
- Check if `onlinestore` database exists

### Module Not Found
Install dependencies:
```bash
pip install -r requirements.txt
```

## 📝 Sample Operations

The `sql/Operations.sql` file includes various queries for:
- Customer order history and spending analysis
- Product inventory management
- Sales analytics and revenue tracking
- Order and shipment tracking
- Product performance and reviews

## 👨‍💻 Authors

- [**Waddah**](https://github.com/Waddah0-0) - Database Design and Implementation

## 📄 License

This project is for educational purposes as part of Database Course.

---
