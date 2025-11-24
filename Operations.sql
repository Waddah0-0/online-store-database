SELECT 
    P.Product_Name, 
    P.Unit_Price, 
    P.Stock_Quantity, 
    S.Company_Name AS Supplier
FROM Product P
JOIN Category C ON P.Category_ID = C.Category_ID
JOIN Supplier S ON P.Supplier_ID = S.Supplier_ID
WHERE C.Category_Name = 'Electronics' AND P.Stock_Quantity > 0;

SELECT 
    C.Category_Name, 
    COUNT(P.Product_ID) AS Total_Products
FROM Category C
LEFT JOIN Product P ON C.Category_ID = P.Category_ID
GROUP BY C.Category_Name
ORDER BY Total_Products DESC;

SELECT 
    O.Order_ID,
    O.Order_Date,
    P.Product_Name, 
    OD.Quantity, 
    OD.Price_At_Purchase, 
    (OD.Quantity * OD.Price_At_Purchase) AS Line_Total
FROM Orders O
JOIN Order_Details OD ON O.Order_ID = OD.Order_ID
JOIN Product P ON OD.Product_ID = P.Product_ID
WHERE O.Order_ID = 1;

SELECT 
    CONCAT(C.First_Name, ' ', C.Last_Name) AS Customer_Name, 
    COUNT(O.Order_ID) AS Total_Orders,
    SUM(OD.Quantity * OD.Price_At_Purchase) AS Total_Spent
FROM Customer C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
JOIN Order_Details OD ON O.Order_ID = OD.Order_ID
GROUP BY C.Customer_ID, Customer_Name;

SELECT 
    O.Order_ID, 
    CONCAT(C.First_Name, ' ', C.Last_Name) AS Customer,
    Pay.Payment_Method, 
    Pay.Amount, 
    Pay.Payment_Date
FROM Orders O
JOIN Customer C ON O.Customer_ID = C.Customer_ID
JOIN Payment Pay ON O.Order_ID = Pay.Order_ID;

SELECT 
    O.Order_ID, 
    O.Order_Status, 
    S.Tracking_Number, 
    S.Carrier_Name, 
    S.Estimated_Arrival
FROM Orders O
JOIN Shipment S ON O.Order_ID = S.Order_ID
WHERE O.Order_Status = 'Pending';

SELECT 
    P.Product_Name, 
    AVG(R.Rating) AS Average_Rating, 
    COUNT(R.Review_ID) AS Number_Of_Reviews
FROM Product P
LEFT JOIN Product_Review R ON P.Product_ID = R.Product_ID
GROUP BY P.Product_ID, P.Product_Name
HAVING Number_Of_Reviews > 0;

