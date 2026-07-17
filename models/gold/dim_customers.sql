with customers as (
    select *
    from {{ ref('int_customers') }}
)

select
    customer_id,
    customer_name,
    customer_first_name,
    customer_last_name
from customers
