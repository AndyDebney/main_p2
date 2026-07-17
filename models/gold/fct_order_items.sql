with order_items as (
    select *
    from {{ ref('int_order_items') }}
),

orders as (
    select *
    from {{ ref('fct_orders') }}
)

select
    order_items.order_item_id,
    order_items.order_id,
    orders.customer_id,
    orders.store_id,
    orders.ordered_at,
    orders.ordered_date,
    order_items.product_sku,
    order_items.item_quantity
from order_items
left join orders
    on order_items.order_id = orders.order_id
