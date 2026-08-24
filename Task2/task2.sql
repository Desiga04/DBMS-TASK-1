CREATE DATABASE IF NOT EXISTS ProductCategoryDB;
USE ProductCategoryDB;


CREATE TABLE IF NOT EXISTS Category (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);


INSERT INTO Category (CategoryName) VALUES 
('Electronics'), 
('Clothing'), 
('Books');


INSERT INTO Product (ProductName, CategoryID, Price, Stock)
VALUES 
('Smartphone', 1, 25000.00, 50),
('T-Shirt', 2, 500.00, 200),
('Novel', 3, 300.00, 100);


UPDATE Product
SET Price = 27000.00, Stock = 45
WHERE ProductID = 1;

DELETE FROM Product
WHERE ProductID = 2;


SELECT c.CategoryName, p.ProductName, p.Price, p.Stock
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName;
SELECT * FROM Category;
SELECT * FROM Product;




       
