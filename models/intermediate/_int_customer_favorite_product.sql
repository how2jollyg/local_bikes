with customer_product_quantities as (
    select
        customer_id,
        oi.product_id,
        product_name,
        sum(item_quantity) as total_quantity
    from {{ ref('_int_order_items') }} oi
    left join {{ ref('stg_products')}} p
    on oi.product_id = p.product_id
    group by 
        customer_id,
        oi.product_id,
        product_name
),

ranked_products as (
    select
        customer_id,
        product_id,
        product_name,
        total_quantity,
        ROW_NUMBER() OVER(
            PARTITION BY customer_id
            ORDER BY total_quantity DESC
        ) as rank
    from customer_product_quantities
)
select
    customer_id,
    product_id as favorite_product_id,
    product_name as favorite_product

from ranked_products
where rank = 1