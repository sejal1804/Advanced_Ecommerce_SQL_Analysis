# Advanced analysis

# 1. Revenue by region
SELECT o.region , SUM(oi.sales) as total_revenue 
FROM orders o
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.region;

# 2. Revenue by payment method
SELECT o.payment_method , SUM(oi.sales) as total_revenue 
FROM orders o
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.payment_method;

# 3. Customers whose sales are above average
WITH sales_cte as (
SELECT c.customer_id , SUM(oi.sales) as total_sales
FROM customers c 
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id 
)
SELECT customer_id , total_sales 
FROM sales_cte 
WHERE total_sales > ( SELECT AVG(total_sales) FROM sales_cte);

# 4. Product whose sales are above average
WITH product_cte as (
SELECT p.product_name , SUM(oi.sales) as total_sales
FROM products p 
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
)
SELECT product_name , total_sales 
FROM product_cte 
WHERE total_sales > ( SELECT AVG(total_sales) FROM product_cte);

# 5. Categories generating above-average revenue
WITH category_cte as (
SELECT p.category , SUM(oi.sales) as revenue
FROM products p 
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY category
)
SELECT category , revenue 
FROM category_cte 
WHERE revenue > ( SELECT AVG(revenue) FROM category_cte);

# 6. Rank customers by sales
SELECT c.customer_id , SUM(oi.sales) as total_sales ,
RANK() OVER( ORDER BY SUM(oi.sales) DESC ) as rank_of_customers
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id;

# 7. Top 3 customers  
WITH sales_cte as (
SELECT c.customer_id , SUM(oi.sales) as total_sales 
FROM customers c 
JOIN orders o
ON c.customer_id = o.customer_id 
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id
),
ranked_customers as (
SELECT * ,
RANK() OVER(ORDER BY total_sales DESC) as rnk_of_customers
FROM sales_cte
)
SELECT * FROM ranked_customers
WHERE rnk_of_customers <=3;

# 8. Month-over-month sales change  
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(oi.sales) AS monthly_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    month,
    monthly_sales,
    LAG(monthly_sales) OVER (
        ORDER BY month
    ) AS previous_month_sales,
    monthly_sales - LAG(monthly_sales) OVER (
        ORDER BY month
    ) AS sales_change
FROM monthly_sales
ORDER BY month;




