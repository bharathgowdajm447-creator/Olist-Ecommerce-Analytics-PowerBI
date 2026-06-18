create database olist_ecommerce;
USE olist_ecommerce;

SELECT *
FROM customers
LIMIT 10;

SELECT COUNT(*)
FROM customers;

SHOW TABLES;

SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM products;

DESCRIBE customers;

SELECT *
FROM customers
LIMIT 5;

-- ====================================
-- TABLE: customers
-- Grain:
-- One row per customer
--
-- Important Columns:
-- customer_id
-- customer_unique_id
-- customer_city
-- customer_state
-- ====================================

DESCRIBE orders;
SELECT * FROM orders LIMIT 5;

DESCRIBE order_payments;
SELECT * FROM order_payments LIMIT 5;

# Identifying the foreign keys in each table 

/* 
=>> Orders table contains customer_id which means it is related to customers
=>> order_items contains order_id, product_id, seller_id which is related to orders, products and sellers tables.
=>> Order_payments table contains order_id which is related to orders table.
=>> Order_reviews table contains order_id which is related to orders table.
=>> Below chart is for relationship understanding
customers
    ↓
orders
    ↓
order_items
    ↓
products
    ↓
sellers

1. Which states generate highest revenue?
2. Which categories perform best?
3. Which sellers cause delays?
4. Does delay reduce review score?
5. Which payment methods dominate?
6. What drives repeat customers?
*/

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sellers;

select * from orders;

/* ERD see through
customers → orders
orders → order_items
orders → order_payments
orders → order_reviews
products → order_items
sellers → order_items
*/

describe customers;

SELECT * FROM customers LIMIT 5;


