USE week2_project;

CREATE TABLE raw_sales_data_week_2 (
customer_id INT,
customer_name VARCHAR(50),
customer_email VARCHAR(100),
customer_phone VARCHAR(20),
product_category VARCHAR(50),
order_date DATE,
purchase_amount DECIMAL(10,2),
discount_percent INT
);
SELECT * FROM raw_sales_data_week_2 LIMIT 10;
SELECT * FROM raw_sales_data_week_2 LIMIT 10;
SELECT * FROM raw_sales_data_week_2 LIMIT 10;
SELECT * FROM raw_sales_data_week_2 LIMIT 10;
SELECT * FROM raw_sales_data_week_2 LIMIT 5;
SELECT * FROM raw_sales_data_week_2 LIMIT 5;
SELECT COUNT(*) AS total_rows
FROM raw_sales_data_week_2;
SELECT customer_id, customer_name, customer_email, customer_phone, product_category, order_date, purchase_amount, discount_percent
FROM raw_sales_data_week_2
GROUP BY customer_id, customer_name, customer_email, customer_phone, product_category, order_date, purchase_amount, discount_percent
HAVING COUNT(*) > 1;
SELECT customer_id, customer_name, customer_email, customer_phone, product_category, order_date, purchase_amount, discount_percent
FROM raw_sales_data_week_2
GROUP BY customer_id, customer_name, customer_email, customer_phone, product_category, order_date, purchase_amount, discount_percent
HAVING COUNT(*) > 1;
SHOW COLUMNS FROM raw_sales_data_week_2;
SELECT
customer_id,
customer_name,
customer_email,
costumer_phone,
COUNT(*) AS duplicate_count
FROM raw_sales_data_week_2
GROUP BY
customer_id,
customer_name,
customer_email,
costumer_phone
HAVING COUNT(*) > 1;
ALTER TABLE raw_sales_data_week_2
CHANGE costumer_phone customer_phone TEXT;
SELECT
customer_id,
customer_name,
customer_email,
customer_phone,
COUNT(*) AS duplicate_count
FROM raw_sales_data_week_2
GROUP BY
customer_id,
customer_name,
customer_email,
customer_phone
HAVING COUNT(*) > 1;
SELECT
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS missing_customer_name,
SUM(CASE WHEN customer_email IS NULL THEN 1 ELSE 0 END) AS missing_customer_email,
SUM(CASE WHEN customer_phone IS NULL THEN 1 ELSE 0 END) AS missing_customer_phone,
SUM(CASE WHEN product_category IS NULL THEN 1 ELSE 0 END) AS missing_product_category,
SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
SUM(CASE WHEN purchase_amount IS NULL THEN 1 ELSE 0 END) AS missing_purchase_amount,
SUM(CASE WHEN discount_percent IS NULL THEN 1 ELSE 0 END) AS missing_discount_percent
FROM raw_sales_data_week_2;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM raw_sales_data_week_2
WHERE (customer_id, customer_name, customer_email, customer_phone) IN (
SELECT customer_id, customer_name, customer_email, customer_phone
FROM (
SELECT customer_id, customer_name, customer_email, customer_phone
FROM raw_sales_data_week_2
GROUP BY customer_id, customer_name, customer_email, customer_phone
HAVING COUNT(*) > 1
) AS duplicates
);
SHOW COLUMNS FROM raw_sales_data_week_2;
SELECT *
FROM raw_sales_data_week_2
WHERE customer_id IS NULL
OR customer_name IS NULL
OR customer_email IS NULL
OR customer_phone IS NULL;
SELECT COUNT(*) AS total_rows FROM raw_sales_data_week_2;
SELECT 
    *
FROM
    raw_sales_data_week_2
LIMIT 10;
SELECT COUNT(*) AS total_orders
FROM raw_sales_data_week_2;
SELECT Product_Category, COUNT(*) AS num_orders
FROM raw_sales_data_week_2
GROUP BY Product_Category;
SELECT Product_Category, AVG(purchase_amount) AS avg_revenue
FROM raw_sales_data_week_2
GROUP BY Product_Category;
SELECT product_category, discount_percent, AVG(purchase_amount) AS avg_spend
FROM raw_sales_data_week_2
GROUP BY product_category, discount_percent
ORDER BY product_category, discount_percent;
SELECT *
FROM raw_sales_data_week_2 
WHERE purchase_amount IS NOT NULL;
SELECT *,
STR_TO_DATE(order_date, '%m/%d/%Y') AS formatted_date
FROM raw_sales_data_wee
SELECT DISTINCT *
FROM raw_sales_data_week_2;
SELECT product_category, discount_percent, AVG(purchase_amount) AS avg_spend
FROM raw_sales_data_week_2
GROUP BY product_category, discount_percent;
SELECT *
FROM raw_sales_data_week_2
WHERE product_category = 'Clothing' AND discount_percent IS NULL;