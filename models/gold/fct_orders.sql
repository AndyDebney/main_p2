with orders as (
    select *
    from {{ ref('int_orders') }}
)

select
    order_id,
    customer_id,
    store_id,
    ordered_at,
    ordered_date,
    ordered_year,
    ordered_month,
    subtotal,
    tax_paid,
    order_total,
    tax_rate
from orders
