with source as (
    select *
    from {{ source('raw', 'raw_customers') }}
)

select
    id::varchar as customer_id,
    name::varchar as customer_name
from source
