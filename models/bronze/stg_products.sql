with source as (
    select *
    from {{ source('raw', 'raw_products') }}
)

select
    sku::varchar as product_sku,
    name::varchar as product_name,
    type::varchar as product_type,
    try_to_number(price, 38, 2) as price,
    description::varchar as product_description
from source
