with source as (
    select *
    from {{ source('raw', 'raw_orders') }}
)

select
    id::varchar as order_id,
    customer::varchar as customer_id,
    try_to_timestamp_ntz(ordered_at) as ordered_at,
    store_id::varchar as store_id,
    try_to_number(subtotal, 38, 2) as subtotal,
    try_to_number(tax_paid, 38, 2) as tax_paid,
    try_to_number(order_total, 38, 2) as order_total
from source
