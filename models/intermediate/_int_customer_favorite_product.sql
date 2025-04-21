with customer_product_quantities as (
    select
        customer_id,
        product_id,
        sum(item_quantity) as total_quantity
    from {{ ref('_int_order_items') }}
    group by 
        customer_id,
        product_id
),

ranked_products as (
    select
        customer_id,
        product_id,
        total_quantity,
        ROW_NUMBER() OVER(
            PARTITION BY customer_id
            ORDER BY total_quantity DESC
        ) as rank
    from customer_product_quantities
)
select
    customer_id,
    product_id as favorite_product_id
from ranked_products
where rank = 1