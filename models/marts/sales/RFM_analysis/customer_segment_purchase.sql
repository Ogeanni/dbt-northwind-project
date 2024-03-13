with customer_segment_by_purchase as (
    select 
            customer_id,
            sum(total_price) AS total_price,
            count(order_id) as total_purchase_count,
            max(order_date) as recent_purchase_date,
            (DATE_TRUNC('MONTH', MAX(order_date)) + INTERVAL '1 MONTH - 1 DAY'):: DATE AS last_purchase_date

    from {{ref ('int_joined_orders_and_order_details')}}
    group by customer_id
)
select 
            *,
            (last_purchase_date - recent_purchase_date) AS recency

 from customer_segment_by_purchase