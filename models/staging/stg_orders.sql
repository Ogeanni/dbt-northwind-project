with source as (
    select * from {{ source('src_postgres', 'orders') }}
)

select  
            orderid as order_id,
            customerid as customer_id,
            employeeid as employee_id,
            orderdate as order_date,
            requireddate as required_date,
            shippeddate as shipped_date,
            shipperid as shipped_id,
            freight

from source