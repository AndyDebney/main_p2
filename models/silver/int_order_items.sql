with order_items as (
    select *
    from {{ ref('stg_order_items') }}
)

select
    order_item_id,
    order_id,
    product_sku,
    1 as item_quantity
from order_items
