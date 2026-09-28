#  Advanced analysis 

# 1. Total Orders per customer
SELECT c.customer_id  , COUNT(o.order_id) as total_orders 
FROM customers c 
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id ;

# 2. Total sales per customer
SELECT c.customer_id  , SUM(oi.sales) as total_sales
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id ;

# 3. Average order value per customer
SELECT c.customer_id , SUM(oi.sales) / COUNT(DISTINCT o.order_id) as AVG_order_value
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id ;

# 4. Customers with no orders
SELECT c.customer_id , o.order_id as no_of_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id  IS NULL;

# 5. Top customers by sales
SELECT c.customer_id  , SUM(oi.sales) as total_sales
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id 
ORDER BY total_sales DESC 
LIMIT 10;