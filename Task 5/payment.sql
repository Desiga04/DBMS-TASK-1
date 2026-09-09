USE ecommerce_order_management;

CREATE TABLE IF NOT EXISTS Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_mode VARCHAR(30) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(12,2) NOT NULL CHECK (amount >= 0),
    payment_status ENUM('Successful','Failed','Pending') NOT NULL DEFAULT 'Pending',
    transaction_reference VARCHAR(100) UNIQUE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payment (order_id, payment_mode, amount, payment_status, transaction_reference)
VALUES (1, 'UPI', 1399.00, 'Successful', 'TXN10001');

SELECT payment_mode, COUNT(*) AS transaction_count,
       SUM(amount) AS total_amount
FROM Payment
GROUP BY payment_mode;

SELECT * FROM Payment ORDER BY payment_date DESC;
