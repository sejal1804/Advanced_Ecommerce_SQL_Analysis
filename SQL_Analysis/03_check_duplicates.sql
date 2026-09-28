# To check duplicates 

SELECT customer_name, city, state, segment, email, COUNT(*) AS count
FROM customers
GROUP BY customer_name, city, state, segment, email
HAVING COUNT(*) > 1;

SELECT product_name, category, sub_category, cost_price, selling_price, rating, COUNT(*) AS count 
FROM products 
GROUP BY product_name, category, sub_category, cost_price, selling_price, rating 
HAVING COUNT(*) > 1;

SELECT customer_id, order_date, region, payment_method, order_status, COUNT(*) AS count 
FROM orders 
GROUP BY customer_id, order_date, region, payment_method, order_status 
HAVING COUNT(*) > 1;

SELECT order_id, product_id, quantity, selling_price, discount, sales, COUNT(*) AS count 
FROM order_items 
GROUP BY order_id, product_id, quantity, selling_price, discount, sales 
HAVING COUNT(*) > 1;

SELECT order_id, payment_amount, payment_status, COUNT(*) AS count 
FROM payments 
GROUP BY order_id, payment_amount, payment_status 
HAVING COUNT(*) > 1;