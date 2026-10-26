-- Project 1: E-Commerce Business & Customer Analytics
-- Section 1: Validate the orders dataset

USE olist_project;

SELECT COUNT(*) AS total_orders
FROM olist_orders_dataset;


-- Section 2: Check for duplicate order IDs

SELECT order_id, COUNT(*) AS id_count
FROM olist_orders_dataset
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Section 3: Check missing customer delivery dates

SELECT COUNT(*) AS missing_delivery_dates
FROM olist_orders_dataset
WHERE order_delivered_customer_date = '';


-- Section 4: Check missing carrier handoff dates

SELECT COUNT(*) AS missing_carrier_dates
FROM olist_orders_dataset
WHERE order_delivered_carrier_date = '';


-- Section 5: Check missing approval dates

SELECT COUNT(*) AS missing_approval_dates
FROM olist_orders_dataset
WHERE order_approved_at = '';

-- Section 6: Count orders by status

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY total_orders DESC;


-- Section 7: Count orders by year

SELECT
    YEAR(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_year,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_year
ORDER BY order_year;

-- Section 8: Count orders by month

SELECT
    YEAR(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_year,
    MONTH(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_month,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


-- Section 9: Find the top 5 months by order volume

SELECT
    YEAR(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_year,
    MONTH(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_month,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_year, order_month
ORDER BY total_orders DESC
LIMIT 5;

-- Section 10: Count late deliveries

SELECT COUNT(*) AS late_orders
FROM olist_orders_dataset
WHERE order_delivered_customer_date != ''
  AND STR_TO_DATE(order_delivered_customer_date, '%d-%m-%Y %H:%i')
      > STR_TO_DATE(order_estimated_delivery_date, '%d-%m-%Y %H:%i');

-- Section 11: Count late orders by customer state

SELECT
    c.customer_state,
    COUNT(*) AS late_orders
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date != ''
  AND STR_TO_DATE(o.order_delivered_customer_date, '%d-%m-%Y %H:%i')
      > STR_TO_DATE(o.order_estimated_delivery_date, '%d-%m-%Y %H:%i')
GROUP BY c.customer_state
ORDER BY late_orders DESC;

-- Section 12: Count total orders by customer state

SELECT
    c.customer_state,
    COUNT(*) AS total_orders
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- Section 13: Verify total orders across states

SELECT COUNT(*) AS total_orders
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id;

-- Section 14: Inspect customer identifiers

SELECT
    o.order_id,
    o.customer_id,
    c.customer_unique_id
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
LIMIT 5;


-- Section 15: Count orders per unique customer

SELECT
    c.customer_unique_id,
    COUNT(*) AS order_count
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
ORDER BY order_count DESC
LIMIT 10;

-- Section 16: Count repeat customers

SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT c.customer_unique_id
    FROM olist_orders_dataset AS o
    JOIN olist_customers_dataset AS c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(*) > 1
) AS customer_orders;


-- Section 17: Count unique customers

SELECT COUNT(DISTINCT c.customer_unique_id) AS total_unique_customers
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id;

-- Section 18: Count delivered orders

SELECT COUNT(*) AS delivered_orders
FROM olist_orders_dataset
WHERE order_status = 'delivered';

-- Section 19: Calculate delivery-status rate

SELECT
    (SELECT COUNT(*)
     FROM olist_orders_dataset
     WHERE order_status = 'delivered')
    * 100.0
    / (SELECT COUNT(*)
       FROM olist_orders_dataset) AS delivery_rate_percent;
    
    -- Section 20: Calculate cancellation rate

SELECT
    (SELECT COUNT(*)
     FROM olist_orders_dataset
     WHERE order_status = 'canceled')
    * 100.0
    / (SELECT COUNT(*)
       FROM olist_orders_dataset) AS cancellation_rate_percent;

-- Section 21: Verify canceled orders

SELECT COUNT(*) AS canceled_orders
FROM olist_orders_dataset
WHERE order_status = 'canceled';


-- Section 22: Count on-time orders

SELECT COUNT(*) AS on_time_orders
FROM olist_orders_dataset
WHERE order_delivered_customer_date != ''
  AND STR_TO_DATE(order_delivered_customer_date, '%d-%m-%Y %H:%i')
      <= STR_TO_DATE(order_estimated_delivery_date, '%d-%m-%Y %H:%i');

--  Calculate on-time delivery rate

SELECT
    88649.0 / 99441 * 100 AS on_time_delivery_rate_percent;



-- Check for duplicate order IDs

SELECT
    order_id,
    COUNT(*) AS id_count
FROM olist_orders_dataset
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Check missing customer delivery dates

SELECT COUNT(*) AS missing_delivery_dates
FROM olist_orders_dataset
WHERE order_delivered_customer_date = '';


-- Check missing carrier handoff dates

SELECT COUNT(*) AS missing_carrier_dates
FROM olist_orders_dataset
WHERE order_delivered_carrier_date = '';

-- Check missing approval dates

SELECT COUNT(*) AS missing_approval_dates
FROM olist_orders_dataset
WHERE order_approved_at = '';

-- Count orders by status

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY total_orders DESC;

-- Count orders by year

SELECT
    YEAR(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_year,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_year
ORDER BY order_year;

-- Count orders by month

SELECT
    YEAR(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_year,
    MONTH(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_month,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Find the top 5 months by order volume

SELECT
    YEAR(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_year,
    MONTH(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i')) AS order_month,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_year, order_month
ORDER BY total_orders DESC
LIMIT 5;

-- Count late deliveries

SELECT COUNT(*) AS late_orders
FROM olist_orders_dataset
WHERE order_delivered_customer_date != ''
  AND STR_TO_DATE(order_delivered_customer_date, '%d-%m-%Y %H:%i')
      > STR_TO_DATE(order_estimated_delivery_date, '%d-%m-%Y %H:%i');


-- Count late orders by customer state

SELECT
    c.customer_state,
    COUNT(*) AS late_orders
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date != ''
  AND STR_TO_DATE(o.order_delivered_customer_date, '%d-%m-%Y %H:%i')
      > STR_TO_DATE(o.order_estimated_delivery_date, '%d-%m-%Y %H:%i')
GROUP BY c.customer_state
ORDER BY late_orders DESC;

-- Count total orders by customer state

SELECT
    c.customer_state,
    COUNT(*) AS total_orders
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- Calculate late-delivery rate by state

SELECT
    c.customer_state,
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN STR_TO_DATE(
                o.order_delivered_customer_date,
                '%d-%m-%Y %H:%i'
            ) > STR_TO_DATE(
                o.order_estimated_delivery_date,
                '%d-%m-%Y %H:%i'
            )
            THEN 1
            ELSE 0
        END
    ) AS late_orders,
    ROUND(
        SUM(
            CASE
                WHEN STR_TO_DATE(
                    o.order_delivered_customer_date,
                    '%d-%m-%Y %H:%i'
                ) > STR_TO_DATE(
                    o.order_estimated_delivery_date,
                    '%d-%m-%Y %H:%i'
                )
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_rate_percent
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date != ''
GROUP BY c.customer_state
ORDER BY late_delivery_rate_percent DESC;



-- Verify total orders after joining customer data

SELECT COUNT(*) AS total_orders
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id;

-- Inspect customer identifiers

SELECT
    o.order_id,
    o.customer_id,
    c.customer_unique_id
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
LIMIT 5;


-- Count orders per unique customer

SELECT
    c.customer_unique_id,
    COUNT(*) AS order_count
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
ORDER BY order_count DESC
LIMIT 10;

-- Count repeat customers

SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT c.customer_unique_id
    FROM olist_orders_dataset AS o
    JOIN olist_customers_dataset AS c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(*) > 1
) AS customer_orders;

-- Count total unique customers

SELECT
    COUNT(DISTINCT c.customer_unique_id) AS total_unique_customers
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c
    ON o.customer_id = c.customer_id;


-- Count delivered orders

SELECT COUNT(*) AS delivered_orders
FROM olist_orders_dataset
WHERE order_status = 'delivered';

-- Verify canceled orders

SELECT COUNT(*) AS canceled_orders
FROM olist_orders_dataset
WHERE order_status = 'canceled';




USE olist_project;

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT order_id) AS unique_order_ids
FROM olist_orders_dataset;









