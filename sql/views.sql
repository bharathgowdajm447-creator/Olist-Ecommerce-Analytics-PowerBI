# clean order views
CREATE OR REPLACE VIEW clean_orders AS
SELECT order_id,customer_id,order_status,
DATE(order_purchase_timestamp) AS purchase_date,
DATE(order_delivered_customer_date) AS delivered_date,
DATE(order_estimated_delivery_date) AS estimated_delivery_date,
DATEDIFF(
order_delivered_customer_date,
order_purchase_timestamp
) AS delivery_days,
CASE
WHEN order_delivered_customer_date > order_estimated_delivery_date
THEN 1
ELSE 0
END AS is_delayed
FROM orders;

# verify view
SELECT * FROM clean_orders LIMIT 10;

# Revenue Analysis
CREATE OR REPLACE VIEW revenue_analysis AS
SELECT o.order_id, o.customer_id,
DATE(o.order_purchase_timestamp) purchase_date, oi.product_id, oi.seller_id, oi.price, oi.freight_value, p.product_category_name, op.payment_type, op.payment_value, 
c.customer_city, c.customer_state
FROM orders o
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
LEFT JOIN products p
ON oi.product_id = p.product_id
LEFT JOIN order_payments op
ON o.order_id = op.order_id
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered';


