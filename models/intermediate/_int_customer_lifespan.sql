
SELECT
    customer_id,
    MIN(ordered_at) AS first_order_date,
    MAX(ordered_at) AS last_order_date,
    DATE_DIFF(MAX(ordered_at), MIN(ordered_at), DAY) AS customer_lifespan_days
FROM {{ ref('stg_order_items') }} oi
JOIN {{ ref('stg_orders') }} o ON oi.order_id = o.order_id
GROUP BY customer_id
