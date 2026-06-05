CREATE OR REPLACE TABLE `mamata-data-project.ecom_sales_dta.raw_sales_transactions` AS
SELECT 
    CONCAT('ORD-', CAST(5000 + num AS STRING)) AS order_id,
    CONCAT('CUST-', CAST(100 + MOD(num, 450) AS STRING)) AS customer_id,
    DATE_SUB(DATE '2026-06-01', INTERVAL CAST(FLOOR(num / 5) AS INT64) DAY) AS order_date,
    CASE 
        WHEN MOD(num, 5) = 0 THEN 'Electronics'
        WHEN MOD(num, 5) = 1 THEN 'Clothing'
        WHEN MOD(num, 5) = 2 THEN 'Home & Kitchen'
        WHEN MOD(num, 5) = 3 THEN 'Beauty'
        ELSE 'Sports'
    END AS product_category,
    CASE 
        WHEN MOD(num, 4) = 0 THEN 'Laptop'
        WHEN MOD(num, 4) = 1 THEN 'T-Shirt'
        WHEN MOD(num, 4) = 2 THEN 'Blender'
        ELSE NULL 
    END AS product_name,
    CAST(1 + MOD(num, 5) AS INT64) AS quantity_ordered,
    CASE 
        WHEN MOD(num, 8) = 0 THEN NULL 
        ELSE ROUND(10.0 + (MOD(num, 200) * 4.5), 2)
    END AS unit_price,
    CASE 
        WHEN MOD(num, 3) = 0 THEN 'Credit Card'
        WHEN MOD(num, 3) = 1 THEN 'PayPal'
        ELSE 'UPI'
    END AS payment_method,
    CASE 
        WHEN MOD(num, 6) = 0 THEN 'California'
        WHEN MOD(num, 6) = 1 THEN 'New York'
        WHEN MOD(num, 6) = 2 THEN 'Texas'
        WHEN MOD(num, 6) = 3 THEN 'Florida'
        ELSE 'Washington'
    END AS shipping_state
FROM 
    UNNEST(GENERATE_ARRAY(1, 4000)) AS num;
