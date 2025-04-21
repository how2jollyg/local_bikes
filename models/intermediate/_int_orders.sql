with order_item_grouped_by_order as (

select 
    order_id,
    customer_id,
    order_status,
    ordered_at,
    required_at,
    shipped_at,
    sum(total_order_item_amount) as total_order_amount,
    sum(item_quantity) as total_items,
    count(distinct product_id) as total_distinct_items
from {{ ref('_int_order_items') }}
group by order_id,
    customer_id,
    order_status,
    ordered_at,
    required_at,
    shipped_at
)

select 
    order_id,
    customer_id,
    order_status,
    ordered_at,
    required_at,
    shipped_at,
    coalesce(total_order_amount,0) as total_order_amount,
    coalesce(total_items,0) as total_items,
    coalesce(total_distinct_items,0) as total_distinct_items
from order_item_grouped_by_order 




