USE ecommerce_order_management;

CREATE TABLE IF NOT EXISTS Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    review_text VARCHAR(1000),
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE IF NOT EXISTS Rating (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    review_id INT NOT NULL UNIQUE,
    rating DECIMAL(2,1) NOT NULL CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (review_id) REFERENCES Review(review_id) ON DELETE CASCADE
);

INSERT INTO Review (customer_id, product_id, review_text)
VALUES (1, 1, 'Good sound quality and comfortable to use.');

INSERT INTO Rating (review_id, rating) VALUES (1, 4.5);

SELECT p.product_name, c.first_name, c.last_name,
       r.review_text, rt.rating, r.review_date
FROM Review r
JOIN Rating rt ON r.review_id = rt.review_id
JOIN Product p ON r.product_id = p.product_id
JOIN Customer c ON r.customer_id = c.customer_id
ORDER BY r.review_date DESC;

SELECT p.product_id, p.product_name,
       ROUND(AVG(rt.rating), 2) AS average_rating,
       COUNT(rt.rating) AS rating_count
FROM Product p
JOIN Review r ON p.product_id = r.product_id
JOIN Rating rt ON r.review_id = rt.review_id
GROUP BY p.product_id, p.product_name
HAVING AVG(rt.rating) >= 4
ORDER BY average_rating DESC;
