DROP DATABASE IF EXISTS OnlineStore;
CREATE DATABASE OnlineStore;
USE OnlineStore;

CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Street VARCHAR(100),
    City VARCHAR(50),
    INDEX idx_email (Email)
);

CREATE TABLE Customer_Phone (
    Customer_ID INT NOT NULL,
    Phone_Number VARCHAR(20) NOT NULL,
    PRIMARY KEY (Customer_ID, Phone_Number),  
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) 
        ON DELETE CASCADE 
);

CREATE TABLE Supplier (
    Supplier_ID INT AUTO_INCREMENT PRIMARY KEY,
    Company_Name VARCHAR(100) NOT NULL,
    Contact_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Category (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL,
    Description TEXT
);

CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Unit_Price DECIMAL(10, 2) NOT NULL CHECK (Unit_Price >= 0),
    Stock_Quantity INT NOT NULL DEFAULT 0 CHECK (Stock_Quantity >= 0),
    Category_ID INT NOT NULL,
    Supplier_ID INT NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
        ON DELETE RESTRICT,  
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
        ON DELETE RESTRICT,  
    INDEX idx_category (Category_ID),
    INDEX idx_supplier (Supplier_ID)
);


CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Order_Status VARCHAR(20) DEFAULT 'Pending',
    Customer_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE,  
    INDEX idx_customer (Customer_ID),
    INDEX idx_status (Order_Status),
    INDEX idx_date (Order_Date)
);

CREATE TABLE Order_Details (
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price_At_Purchase DECIMAL(10, 2) NOT NULL CHECK (Price_At_Purchase >= 0),
    PRIMARY KEY (Order_ID, Product_ID),  
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
        ON DELETE CASCADE,  
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
        ON DELETE RESTRICT  
);

CREATE TABLE Payment (
    Order_ID INT NOT NULL,
    Payment_ID INT NOT NULL,  
    Payment_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Payment_Method VARCHAR(50) NOT NULL, 
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    PRIMARY KEY (Order_ID, Payment_ID),  
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
        ON DELETE CASCADE  
);


CREATE TABLE Shipment (
    Order_ID INT NOT NULL,
    Shipment_ID INT NOT NULL,  
    Tracking_Number VARCHAR(100) NOT NULL,
    Carrier_Name VARCHAR(50) NOT NULL,  
    Shipment_Date DATE NOT NULL,
    Estimated_Arrival DATE,
    PRIMARY KEY (Order_ID, Shipment_ID),  
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
        ON DELETE CASCADE,  
    INDEX idx_tracking (Tracking_Number)
);

CREATE TABLE Product_Review (
    Product_ID INT NOT NULL,
    Review_ID INT NOT NULL, 
    Customer_ID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating >= 1 AND Rating <= 5), 
    Comment TEXT,
    Review_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Product_ID, Review_ID), 
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
        ON DELETE CASCADE,  
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE,  
    INDEX idx_product_rating (Product_ID, Rating)
);





