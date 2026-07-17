with customers as (
    select *
    from {{ ref('stg_customers') }}
)

select
    customer_id,
    nullif(trim(customer_name), '') as customer_name,
    split_part(nullif(trim(customer_name), ''), ' ', 1) as customer_first_name,
    nullif(split_part(nullif(trim(customer_name), ''), ' ', 2), '') as customer_last_name
from customers
