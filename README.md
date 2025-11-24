# Online Store Database System

A comprehensive MySQL database system for managing an online store, including customers, products, orders, payments, and shipments.

## 📋 Project Overview

This database project implements a complete e-commerce system with the following features:
- Customer management with contact information
- Product catalog with categories and suppliers
- Order processing and tracking
- Payment handling
- Shipment tracking
- Product reviews and ratings

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

## 📁 Files Description

- `database_setup.sql` - Creates the database schema and all tables
- `Insert.sql` - Populates the database with sample data
- `Operations.sql` - Common database operations and queries
- `Viewing tables.sql` - Queries to view table contents
- `ERRD.png` - Entity-Relationship Diagram
- `Online Store DataBase System.mwb` - MySQL Workbench model file

## 🚀 Getting Started

### Prerequisites
- MySQL Server 8.0 or higher
- MySQL Workbench (optional, for visual management)

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/Waddah0-0/online-store-database.git
cd online-store-database
```

2. **Run the setup script:**
```bash
mysql -u root -p < database_setup.sql
```

3. **Insert sample data:**
```bash
mysql -u root -p < Insert.sql
```

4. **View the data:**
```bash
mysql -u root -p < "Viewing tables.sql"
```

### Using MySQL Workbench

1. Open MySQL Workbench
2. Connect to your MySQL server
3. Open and execute `database_setup.sql`
4. Open and execute `Insert.sql`
5. Run queries from `Operations.sql` as needed

## 🔍 Key Features

- **Referential Integrity**: Comprehensive foreign key constraints
- **Data Validation**: CHECK constraints for prices, quantities, and ratings
- **Cascade Operations**: Automatic cleanup of related records
- **Indexing**: Optimized queries with strategic indexes
- **Weak Entities**: Proper implementation for payments, shipments, and reviews

## 📊 Database Diagram

See `ERRD.png` for the complete Entity-Relationship Diagram.

## 💡 Sample Operations

The `Operations.sql` file includes various queries such as:
- Customer order history
- Product inventory management
- Sales analytics
- Order tracking
- Revenue calculations

## 👨‍💻 Author

**Waddah** - [@Waddah0-0](https://github.com/Waddah0-0)

## 📝 License

This project is open source and available for educational purposes.

## 🤝 Contributing

Feel free to fork this project and submit pull requests for any improvements!

