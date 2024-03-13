with source as (
    select * from {{ source('src_postgres', 'products')}}
),
renamed as (
    select 
            productid as product_id,
            productname as product_name,
            quantityperunit as quantity_per_unit,
            unitprice as unit_price,
            discontinued,
            categoryid as category_id
    from source

)
select * from renamed
