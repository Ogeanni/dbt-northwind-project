with source as (
    select * from {{source ('src_postgres', 'order_details')}}
),
renamed as (
    select
        orderid as order_id,
        productid as product_id,
        unitprice as unit_price,
        (unitprice * quantity) as total_price,
        quantity,
        discount
    from source
)
select *
from renamed