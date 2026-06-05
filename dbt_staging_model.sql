CREATE OR REPLACE TABLE `mamata-data-project.ecom_sales_dta.stg_sales_analytics` AS
SELECT 
    order_id,
    customer_id,
    order_date,
    product_category,
    COALESCE(product_name, 'Unknown Product') AS clean_product_name,
    quantity_ordered,
    COALESCE(unit_price, 25.00) AS clean_unit_price,
    ROUND(quantity_ordered * COALESCE(unit_price, 25.00), 2) AS total_sales_amount,
    payment_method,
    shipping_state
FROM 
    `mamata-data-project.ecom_sales_dta.raw_sales_transactions`;
