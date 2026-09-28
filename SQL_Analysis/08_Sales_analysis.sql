# Sales Analysis

# 1.Find total sales.
SELECT SUM(sales) as total_sales
FROM order_items;

# 2. Find total quantity sold.
SELECT SUM(quantity) as total_quantity
FROM order_items;

# 3. Find average sales per order item.
SELECT order_item_id , AVG(sales) as avg_sales
FROM order_items
GROUP BY order_item_id;

# 4. Find the highest individual sales amount.
SELECT MAX(sales) as sales_amount 
FROM order_items;

# 5. Find the lowest individual sales amount.
SELECT MIN(sales) as sales_amount
FROM order_items;

# 6. Find total sales for each product.
SELECT product_id , SUM(sales) as total_sales
FROM order_items
GROUP BY product_id;

#  7. Find total quantity sold for each product.
SELECT product_id , SUM(quantity) as total_quantity
FROM order_items
GROUP BY product_id;

# 8. Find average sales for each product.
SELECT product_id , AVG(sales) as Avg_sales
FROM order_items
GROUP BY product_id;

# 9. Find the product generating the highest total sales.
SELECT product_id , SUM(sales) as total_sales
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 1;

# 10. Find products having total sales greater than 10,000.
SELECT product_id , SUM(sales) as total_sales
FROM order_items
GROUP BY product_id
HAVING total_sales > 10000;

