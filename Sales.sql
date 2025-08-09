CREATE DATABASE salesdb;
USE salesdb;

CREATE TABLE Sales(
	SaleID INT PRIMARY KEY,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);
-- Inserting records in sales table
INSERT INTO Sales (SaleID, Product, Category, Quantity, Price, SaleDate) VALUES
(1, 'T-shirt', 'Clothing', 3, 500.00, '2025-08-01'),
(2, 'Jeans', 'Clothing', 2, 1200.00, '2025-08-01'),
(3, 'Sneakers', 'Footwear', 1, 2500.00, '2025-08-02'),
(4, 'Sandals', 'Footwear', 4, 800.00, '2025-08-02'),
(5, 'Jacket', 'Clothing', 1, 3000.00, '2025-08-03'),
(6, 'Cap', 'Accessories', 5, 200.00, '2025-08-03'),
(7, 'Dress', 'Clothing', 2, 1500.00, '2025-08-04'),
(8, 'Boots', 'Footwear', 1, 4000.00, '2025-08-04'),
(9, 'Shirt', 'Clothing', 3, 800.00, '2025-08-05'),
(10, 'Slippers', 'Footwear', 2, 300.00, '2025-08-05');

SELECT * FROM Sales;
-- total sales amount for all products.
SELECT SUM(Quantity*Price) AS Total_Sales FROM Sales;
-- total sales amount for each category.
SELECT Category, SUM(Quantity*Price) AS Total_Sales FROM Sales
GROUP BY Category;
-- Average price of all products sold
SELECT AVG(Price) AS Average_Price FROM Sales;
-- Total number of transactions
SELECT COUNT(*) AS Total_Transactions FROM Sales;
-- Number of transactions for each category
SELECT Category, COUNT(*) AS Total_Transactions 
FROM Sales
GROUP BY Category;
-- Average quantity sold per category
SELECT Category, AVG(Quantity) AS Average_Quantity
FROM Sales
GROUP BY Category;
-- Highest revenue day and amount earned
SELECT SaleDate, SUM(Quantity*Price) AS Total_Sales
FROM Sales
GROUP BY SaleDate
ORDER BY Total_Sales DESC LIMIT 1;
-- Number of unique products sold in each category
SELECT Category, COUNT(DISTINCT Product) AS Unique_Products
FROM Sales
GROUP BY Category;
-- Total sales amount for each product, sorted in descending order
SELECT Product, SUM(Quantity*Price) AS Total_Sales
FROM Sales
GROUP BY Product
ORDER BY Total_Sales DESC;

