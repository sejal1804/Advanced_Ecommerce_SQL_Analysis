# Order Analysis

#v 1. Find the total number of orders.
SELECT COUNT(*) 
FROM orders;

# 2. Find the number of orders for each region.
SELECT region , COUNT(order_id) as count_of_orders
FROM orders
GROUP BY region;

# 3. Find the number of orders for each payment method.
SELECT payment_method , COUNT(order_id) as count_of_orders
FROM orders
GROUP BY payment_method;

# 4. Find the number of orders for each order status.
SELECT order_status , COUNT(order_id) as count_of_orders
FROM orders
GROUP BY order_status ;

# 5. Find the number of completed orders.
SELECT COUNT(*) FROM orders
WHERE order_status = "Completed";

# 6. Find the number of cancelled orders.
SELECT COUNT(*) FROM orders
WHERE order_status = "Cancelled";

# 7. Find the earliest order date.
SELECT MIN(order_date) as earliest_order_date
FROM orders;

# 8. Find the latest order date.
SELECT MAX(order_date) as latest_order_date
FROM orders;


# 9. Find the number of orders placed in each month.
SELECT MONTH(order_date) as Month , COUNT(order_id) as count_of_orders
FROM orders
GROUP BY MONTH(order_date) ;

# 10. Find the region with the highest number of orders.
SELECT region , COUNT(order_id) as count_of_orders
FROM orders
GROUP BY region
ORDER BY count_of_orders DESC	
LIMIT 1;



