CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Ecommerce_Sales (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_Name VARCHAR(100),
    Region VARCHAR(50),
    City VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(100),
    Product_Name VARCHAR(150),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Sales DECIMAL(12,2),
    Profit DECIMAL(12,2),
    Payment_Mode VARCHAR(50)
);
DROP TABLE Ecommerce_Sales;


USE ecommercedb;

SHOW TABLES;

USE ecommercedb;

RENAME TABLE ecommerce_sales_data_2024_2025
TO Ecommerce_Sales;

SHOW TABLES;

SELECT * FROM Ecommerce_Sales;

SELECT COUNT(*) AS Total_Records
FROM Ecommerce_Sales;

SELECT `Customer Name`, `Product Name`, Sales
FROM Ecommerce_Sales;

SELECT *
FROM Ecommerce_Sales
WHERE City = 'Delhi';

SELECT `Product Name`, Sales
FROM Ecommerce_Sales
ORDER BY Sales DESC;

SELECT Category,
COUNT(*) AS Total_Orders
FROM Ecommerce_Sales
GROUP BY Category;

SELECT SUM(Sales) AS Total_Sales
FROM Ecommerce_Sales;

SELECT AVG(Profit) AS Average_Profit
FROM Ecommerce_Sales;

SELECT MAX(Sales) AS Highest_Sales
FROM Ecommerce_Sales;

SELECT MIN(Sales) AS Lowest_Sales
FROM Ecommerce_Sales;

SELECT Category,
SUM(Sales) AS Total_Sales
FROM Ecommerce_Sales
GROUP BY Category;

SELECT Region,
SUM(Profit) AS Total_Profit
FROM Ecommerce_Sales
GROUP BY Region;

SELECT `Payment Mode`,
SUM(Sales) AS Total_Sales
FROM Ecommerce_Sales
GROUP BY `Payment Mode`;

SELECT Category,
SUM(Sales) AS Total_Sales
FROM Ecommerce_Sales
GROUP BY Category
HAVING SUM(Sales) > 100000;

SELECT `Product Name`, Sales
FROM Ecommerce_Sales
WHERE Sales >
(
SELECT AVG(Sales)
FROM Ecommerce_Sales
);

SELECT
COUNT(*) AS Total_Orders,
SUM(Sales) AS Total_Sales,
AVG(Sales) AS Average_Sales,
MAX(Sales) AS Highest_Sales,
MIN(Sales) AS Lowest_Sales
FROM Ecommerce_Sales;

CREATE VIEW Sales_Report AS
SELECT
Category,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Ecommerce_Sales
GROUP BY Category;

SELECT * FROM Sales_Report;

CREATE INDEX idx_city
ON Ecommerce_Sales(City);

SELECT SUM(Quantity) AS Total_Quantity
FROM Ecommerce_Sales;

SELECT AVG(Discount) AS Average_Discount
FROM Ecommerce_Sales;

SELECT *
FROM Ecommerce_Sales
WHERE `Order Date`
BETWEEN '2024-01-01' AND '2024-12-31';