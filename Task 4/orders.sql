USE ecommerce_order_management;

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(12,2) NOT NULL DEFAULT 0 CHECK (total_amount >= 0),
    status VARCHAR(30) DEFAULT 'Placed',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE IF NOT EXISTS Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Orders (customer_id, total_amount) VALUES (1, 1399.00);
INSERT INTO Order_Details (order_id, product_id, quantity, unit_price)
VALUES (1, 1, 1, 1399.00);

UPDATE Orders SET status = 'Confirmed' WHERE order_id = 1;

SELECT o.order_id, o.order_date, c.first_name, c.last_name,
       p.product_name, od.quantity, od.unit_price, o.total_amount, o.status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Product p ON od.product_id = p.product_id
ORDER BY o.order_date DESC;
