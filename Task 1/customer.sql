CREATE DATABASE IF NOT EXISTS ecommerce_order_management;
USE ecommerce_order_management;

CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Customer (first_name, last_name, email, phone, address, city, state, postal_code)
VALUES
('Arun', 'Kumar', 'arun@example.com', '9876543210', '12 Beach Road', 'Chennai', 'Tamil Nadu', '600001'),
('Priya', 'Ravi', 'priya@example.com', '9876543211', '25 Lake View', 'Chennai', 'Tamil Nadu', '600002');

SELECT * FROM Customer;
