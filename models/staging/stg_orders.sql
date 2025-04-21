select
    order_id,
    customer_id,
    order_status,
    SAFE_CAST(order_date AS DATETIME) AS ordered_at,
    SAFE_CAST(required_date AS DATETIME) AS required_at,
    SAFE_CAST(shipped_date AS DATETIME) AS shipped_at,
    store_id,
    staff_id
from {{ source('local_bikes', 'orders') }}