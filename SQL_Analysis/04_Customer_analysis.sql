# Customer Analysis

# 1.Find the total number of customers.
SELECT count(*) as total_customers
FROM customers;

# 2. Find the number of customers in each city.
SELECT city , COUNT(customer_id) as count_of_customers
FROM customers
GROUP BY city;

# 3. Find the number of customers in each segment.
SELECT segment , COUNT(customer_id) as count_of_customers
FROM customers
GROUP BY segment;

# 4. Find the city with the highest number of customers.
SELECT city , COUNT(customer_id) as count_of_customers
FROM customers
GROUP BY city
ORDER BY count_of_customers DESC
LIMIT 1;

# 5. Find the number of customers in the Consumer segment.
SELECT segment , COUNT(customer_id) as count_of_customers
FROM customers
GROUP BY segment
HAVING segment = "Consumer";

# 6. Find all customers from Maharashtra.
SELECT *
FROM customers
where state = "Maharashtra";

# 7. Find the number of customers in each city, sorted from highest to lowest.
SELECT city , COUNT(customer_id) as count_of_customers
FROM customers
GROUP BY city
ORDER BY count_of_customers DESC;

# 8.Find the number of customers in each state.
SELECT state , COUNT(customer_id) as count_of_customers
FROM customers 
GROUP BY state;

# 9. Find the number of customers in each segment, sorted from highest to lowest.
SELECT segment , COUNT(customer_id) as count_of_customers
FROM customers
GROUP BY segment
ORDER BY count_of_customers DESC;

# 10. Find cities having more than 20 customers.
SELECT city , COUNT(customer_id) as count_of_customers
FROM customers
GROUP BY city
HAVING count_of_customers > 20;

