# Data Cleaning 

# 1. To check NuLL values
SELECT * FROM customers
WHERE customer_id IS NULL 
      OR customer_name IS NULL 
      OR city IS NULL 
      OR state IS NULL
      OR segment IS NULL 
      OR email IS NULL;
      
SELECT * FROM products
WHERE product_id is NULL
     OR product_name IS NULL 
     OR category IS NULL 
     OR sub_category IS NULL 
     OR cost_price IS NULL 
     OR selling_price IS NuLL
     OR rating IS NULL;
     
     
     
     
SELECT * FROM orders 
WHERE order_id IS NULL
    OR customer_id IS NULL
    OR order_date IS NULL
    OR region IS NULL
    OR payment_method IS NULL
    OR order_status IS NULL;
    
SELECT * FROM order_items 
WHERE order_item_id IS NULL
     OR order_id IS NULL
     OR product_id IS NULL
     OR quantity IS NULL
     OR selling_price IS NULL
     OR discount IS NULL
     OR sales IS NULL;
     
SELECT * FROM payments
WHERE payment_id IS NULL 
    OR order_id IS NULL
    OR payment_amount IS NULL
    OR payment_status IS NULL;
    
