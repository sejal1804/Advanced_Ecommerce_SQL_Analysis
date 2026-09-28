# Payment Analysis

# 1. Find the total payment amount.
SELECT SUM(payment_amount) as total_payment_amount 
FROM payments;

# 2. Find the average payment amount.
SELECT AVG(payment_amount) as avg_payment_amount 
FROM payments;

# 3. Find the highest payment amount.
SELECT MAX(payment_amount) as avg_payment_amount 
FROM payments;

# 4. Find the lowest payment amount.
SELECT MIN(payment_amount) as avg_payment_amount 
FROM payments;

# 5. Find the number of payments for each payment status.
SELECT payment_status , COUNT(payment_id) as num_of_payments
FROM payments 
GROUP BY payment_status;

# 6. Find the total payment amount for each payment status.
SELECT payment_status , SUM(payment_amount) as total_payment_amount
FROM payments 
GROUP BY payment_status;

# 7. Find the average payment amount for each payment status.
SELECT payment_status , AVG(payment_amount) as avg_amount
FROM payments 
GROUP BY payment_status;

# 8. Find the payment status with the highest number of transactions.
SELECT payment_status , COUNT(*) as total_no_of_transactions
FROM payments
GROUP BY payment_status
ORDER BY total_no_of_transactions DESC
LIMIT 1;
