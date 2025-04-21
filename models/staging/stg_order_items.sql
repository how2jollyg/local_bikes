select
--create a primary key for each of the order_id as a uuid
    GENERATE_UUID() as unique_order_id,
    order_id,
    item_id,
    product_id,
    quantity AS item_quantity,
    list_price,
    (list_price * quantity)*(1-discount) AS total_order_item_amount,
    discount
from {{ source('local_bikes', 'order_items') }}