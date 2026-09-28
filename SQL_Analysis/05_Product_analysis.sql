# Product Analysis

# 1. Find the total number of products.
SELECT COUNT(*) as total_products
FROM products;

# 2. Find the number of products in each category.
SELECT category , COUNT(product_id) as count_of_products
FROM products
GROUP BY category;

# 3. Find the number of products in each sub-category.
SELECT sub_category , COUNT(product_id) as count_of_products
FROM products
GROUP BY sub_category;

# 4. Find the average selling price of all products.
SELECT product_id ,  AVG(selling_price) as avg_selling_price
FROM products
GROUP BY product_id;

# 5. Find the highest selling price.
SELECT MAX(selling_price) 
FROM products;

# 6. Find the lowest selling price.
SELECT MIN(selling_price)
FROM products;

# 7. Find the average rating of all products.
SELECT AVG(rating) as avg_rating
FROM products;

# 8. Find the average selling price for each category.
SELECT category , AVG(selling_price) as avg_price
FROM products 
GROUP BY category;

# 9. Find the highest selling price in each category.
SELECT category , MAX(selling_price) as max_price
FROM products 
GROUP BY category;

# 10. Find categories having more than 20 products.
SELECT category , COUNT(product_id) as count_of_products
FROM products 
GROUP BY category
HAVING count_of_products > 20;

