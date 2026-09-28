# To create the database

CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    segment VARCHAR(30),
    email VARCHAR(100)
);


CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    cost_price DECIMAL(12,2),
    selling_price DECIMAL(12,2),
    rating DECIMAL(2,1)
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    order_date DATE,
    region VARCHAR(30),
    payment_method VARCHAR(30),
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id VARCHAR(12) PRIMARY KEY,
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    selling_price DECIMAL(12,2),
    discount DECIMAL(5,2),
    sales DECIMAL(14,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id VARCHAR(12) PRIMARY KEY,
    order_id VARCHAR(10),
    payment_amount DECIMAL(14,2),
    payment_status VARCHAR(20),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM order_items;

SELECT * FROM payments;
