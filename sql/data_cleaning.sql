
# Counting the Number of rows in each table

SELECT COUNT(*) AS customers_count FROM customers;
SELECT COUNT(*) AS orders_count FROM orders;
SELECT COUNT(*) AS order_items_count FROM order_items;
SELECT COUNT(*) AS payments_count FROM order_payments;
SELECT COUNT(*) AS reviews_count FROM order_reviews;
SELECT COUNT(*) AS products_count FROM products;
SELECT COUNT(*) AS sellers_count FROM sellers;

# Checking missing values
SELECT COUNT(*) total_rows,
SUM(order_approved_at IS NULL) approved_missing,
SUM(order_delivered_carrier_date IS NULL) carrier_missing,
SUM(order_delivered_customer_date IS NULL) delivered_missing FROM orders;


# Check order status distribution
SELECT order_status,COUNT(*) total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

# checking for duplicate orders
SELECT order_id,COUNT(*) cnt
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

# checking the duplicate customers
SELECT customer_id, COUNT(*) cnt
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

# checking for product missing categories
SELECT COUNT(*) missing_categories
FROM products
WHERE product_category_name IS NULL;

# checking payment issues like negative values and invalid payments
SELECT * FROM order_payments
WHERE payment_value <= 0;

# checking the review 1 to 5 to know
SELECT review_score, COUNT(*) total
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

# checking the logic in date columns where purchase date is greater than dedelivered customer date
SELECT * FROM orders
WHERE order_delivered_customer_date < order_purchase_timestamp;

# delivery delay analysis prepare
SELECT order_id,
DATEDIFF(
order_delivered_customer_date,
order_purchase_timestamp
) AS delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

# Delay flag
SELECT order_id,
CASE
WHEN order_delivered_customer_date > order_estimated_delivery_date
THEN 'Delayed'
ELSE 'On Time'
END AS delivery_status
FROM orders;

