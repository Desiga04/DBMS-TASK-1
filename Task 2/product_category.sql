USE ecommerce_order_management;

CREATE TABLE IF NOT EXISTS Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO Category (category_name, description)
VALUES ('Electronics','Electronic products'), ('Fashion','Clothing and accessories');

INSERT INTO Product (product_name, category_id, price, stock)
VALUES ('Wireless Headphones',1,1499.00,25), ('T-Shirt',2,599.00,40);

UPDATE Product SET price = 1399.00, stock = 30 WHERE product_name = 'Wireless Headphones';

DELETE FROM Product WHERE product_name = 'T-Shirt';

SELECT c.category_name, p.product_id, p.product_name, p.price, p.stock
FROM Category c JOIN Product p ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name;
