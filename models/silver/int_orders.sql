with orders as (
    select *
    from {{ ref('stg_orders') }}
)

select
    order_id,
    customer_id,
    store_id,
    ordered_at,
    cast(ordered_at as date) as ordered_date,
    extract(year from ordered_at) as ordered_year,
    extract(month from ordered_at) as ordered_month,
    subtotal,
    tax_paid,
    order_total,
    tax_paid / nullif(subtotal, 0) as tax_rate,
    order_total - subtotal - tax_paid as order_total_diff_check
from orders
