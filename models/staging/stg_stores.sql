select
    store_id,
    store_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
from {{ source('local_bikes', 'stores') }}