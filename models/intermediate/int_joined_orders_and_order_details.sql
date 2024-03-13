with order_details as (
    select * from {{ ref('stg_order_details') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),

joined as (
    select  
            orders.order_id,
            orders.customer_id,
            order_details.product_id,
            orders.order_date,
            order_details.unit_price,
            order_details.quantity,
            order_details.discount,
            order_details.total_price

    from order_details 
    left join orders
    on order_details.order_id = orders.order_id
    
)
select * from joined