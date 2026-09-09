USE ecommerce_order_management;

CREATE TABLE IF NOT EXISTS Seller (
    seller_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT NOT NULL,
    product_id INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    UNIQUE (seller_id, product_id)
);

INSERT INTO Seller (seller_name, email, phone)
VALUES ('ABC Traders','abc@example.com','9876500000');

INSERT INTO Inventory (seller_id, product_id, stock_quantity)
VALUES (1,1,30);

SELECT s.seller_name, p.product_name, i.stock_quantity,
       CASE WHEN i.stock_quantity > 0 THEN 'Available' ELSE 'Unavailable' END AS status
FROM Inventory i
JOIN Seller s ON i.seller_id = s.seller_id
JOIN Product p ON i.product_id = p.product_id;
