with item_stocks AS (
    select
        o.order_id,
        s.store_id,
        o.product_id,
        s.quantity
    from {{ ref('stg_order_items') }} o
    inner join {{ ref('stg_products') }} p
    on o.product_id = p.product_id
    left join {{ ref('stg_stocks') }} s
    on p.product_id = s.product_id
)

select 
    *,
    case when quantity IS NULL THEN 'no'
    else 'yes'
    end as in_stock
from item_stocks
