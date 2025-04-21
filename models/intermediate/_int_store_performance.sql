SELECT 
    oi.order_id,
    oi.item_id, 
    round(total_order_item_amount,2) as total_order_item_amount,
    item_quantity,
    oi.product_id,
    s.store_id,
    s.store_name
FROM
{{ ref('stg_order_items') }} AS oi
INNER JOIN
{{ ref('stg_orders') }} o
ON oi.order_id = o.order_id
LEFT JOIN
{{ ref('stg_stores') }} s
ON o.store_id = s.store_id