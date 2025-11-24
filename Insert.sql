INSERT INTO Supplier (Company_Name, Contact_Name, Email, Phone) VALUES
('TechGear Wholesale Inc', 'Ali Elsayed', 'ali.sayed@techgear.com', '+20-155245879'),
('ElectroHub Distributors', 'Sarah Mahmoud', 'sarah.mahmoud@electrohub.com', '+20-1085694236'),
('HomeComfort Supplies', 'Ahmed Mostafa', 'ahmed.mostafa@homecomfort.com', '+20-1224589347');

INSERT INTO Category (Category_Name, Description) VALUES
('Electronics', 'Consumer electronics including computers, phones, and accessories'),
('Home & Kitchen', 'Appliances and products for home and kitchen use'),
('Pet', 'Pet supplies and needs'),
('Clothing', 'Apparel and fashion accessories for men, women, and children');

INSERT INTO Customer (First_Name, Last_Name, Email, Street, City) VALUES
('Waddah', 'Ali', 'waddahali2002@email.com', '211  Street', 'Alexandria'),
('Eman', 'Hashim', 'emaneltayeb21@email.com', 'Al-Mauna Street', 'Bahri'),
('Manahil', 'Alhadi', 'mnahil778@email.com', 'Al-Arbaeen Street', 'Omdurman'),
('Mohammed', 'Adil', 'adola854@email.com', 'Al-Niel Street', 'Khartoum');


INSERT INTO Customer_Phone (Customer_ID, Phone_Number) VALUES
(1, '+20-1550177587'),
(1, '+20-1096548416'),  
(2, '+249 11 205 7987'),
(3, '+249 96 192 3340'),
(3, '+20-1242568784'), 
(4, '+249 12 711 3773');

INSERT INTO Product (Product_Name, Description, Unit_Price, Stock_Quantity, Category_ID, Supplier_ID) VALUES
('Wireless Bluetooth Headphones', 'Premium noise-cancelling over-ear headphones with 30-hour battery life', 149.99, 50, 1, 1),
('4K Ultra HD Smart TV 55"', '55-inch Smart TV with HDR and built-in streaming apps', 599.99, 25, 1, 2),
('Stainless Steel Coffee Maker', '12-cup programmable coffee maker with thermal carafe', 79.99, 100, 2, 3),
('Whiskas Cat Food (1kg)', 'Dry food for adult cats, chicken flavor', 99.99, 200, 3, 1),
('Mens Cotton T-Shirt - Blue', 'Comfortable 100% cotton crew neck t-shirt in navy blue', 19.99, 150, 4, 3),
('Laptop Backpack', 'Water-resistant backpack with padded laptop compartment up to 17 inches', 49.99, 75, 1, 1);

INSERT INTO Orders (Order_Date, Order_Status, Customer_ID) VALUES
('2024-11-10 10:30:00', 'Shipped', 1),
('2024-11-12 14:45:00', 'Delivered', 2),
('2024-11-15 09:20:00', 'Pending', 3),
('2024-11-16 16:55:00', 'Processing', 1),
('2024-11-18 11:00:00', 'Pending', 4);

INSERT INTO Order_Details (Order_ID, Product_ID, Quantity, Price_At_Purchase) VALUES
(1, 1, 2, 149.99),
(1, 6, 1, 49.99),
(2, 2, 1, 599.99),
(2, 3, 1, 79.99),
(3, 4, 3, 99.99),
(3, 5, 2, 19.99),
(4, 3, 1, 79.99),
(5, 1, 1, 149.99),
(5, 2, 1, 599.99);

INSERT INTO Payment (Order_ID, Payment_ID, Payment_Date, Payment_Method, Amount) VALUES
(1, 1, '2025-11-10 10:35:00', 'Credit Card', 349.97),
(2, 1, '2025-11-12 14:50:00', 'Credit Card', 600.00),
(2, 2, '2025-11-12 14:51:00', 'Gift Card', 79.98),
(3, 1, '2025-11-15 09:25:00', 'Instapay', 339.95),
(4, 1, '2025-11-16 17:00:00', 'Debit Card', 79.99),
(5, 1, '2025-11-18 11:05:00', 'Credit Card', 749.98);

INSERT INTO Shipment (Order_ID, Shipment_ID, Tracking_Number, Carrier_Name, Shipment_Date, Estimated_Arrival) VALUES
(1, 1, 'TRK1234567890', 'FedEx', '2024-11-11', '2024-11-14'),
(2, 1, 'TRK2345678901', 'Aramex', '2024-11-13', '2024-11-16'),
(2, 2, 'TRK2345678902', 'DHL', '2024-11-14', '2024-11-17'),
(3, 1, 'TRK3456789012', 'Aramex', '2024-11-16', '2024-11-20'),
(4, 1, 'TRK4567890123', 'DHL', '2024-11-17', '2024-11-21');

INSERT INTO Product_Review (Product_ID, Review_ID, Customer_ID, Rating, Comment, Review_Date) VALUES
(1, 1, 1, 5, 'Excellent sound quality! The noise cancellation is amazing for the price.', '2024-11-14 15:30:00'),
(1, 2, 4, 4, 'Great headphones, very comfortable. Battery life is as advertised.', '2024-11-19 10:20:00'),
(2, 1, 2, 5, 'Picture quality is stunning! Setup was easy and the smart features work perfectly.', '2024-11-17 20:15:00'),
(3, 1, 2, 4, 'Makes great coffee. The thermal carafe keeps it hot for hours.', '2024-11-18 08:00:00'),
(3, 2, 1, 5, 'Best coffee maker I have owned. Programmable timer is very convenient.', '2024-11-20 07:45:00'),
(4, 1, 3, 5, 'Good food. Gunna take alot next time.', '2024-11-19 21:30:00');
