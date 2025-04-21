SELECT 
    oi.order_id,
    item_id, 
    total_order_item_amount,
    item_quantity,
    product_id,
    o.customer_id,
    o.order_status,
    o.ordered_at,
    o.required_at,
    o.shipped_at
FROM
{{ ref('stg_order_items') }} AS oi
INNER JOIN
{{ ref('stg_orders') }} o
ON oi.order_id = o.order_id