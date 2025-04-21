select
    o.ordered_at,
    c.state as state,
    coalesce(round(avg(total_items),2),0) as average_items_per_order,
    coalesce(round(avg(total_order_amount),2),0) as average_amount_per_order,
    coalesce(count(distinct order_id),0) as total_orders,
    coalesce(round(avg(customer_lifespan_days),2),0) as average_customer_lifespan
from {{ ref('_int_orders')}} o
left join {{ ref('stg_customers')}} c
on o.customer_id = c.customer_id
left join {{ ref('_int_customer_lifespan')}} cl 
on c.customer_id = cl.customer_id
group by o.ordered_at, c.state
order by o.ordered_at
