with segment as (
    select * from {{ ref('customer_rfm_percentile')}}

)
select 
        *,
        CASE WHEN rfm_rank IN (10, 9, 8) THEN 'Top Customers'
             WHEN rfm_rank IN (7, 6, 5) THEN 'Loyal Customers'
             WHEN rfm_rank IN (4, 3, 2) THEN 'At Risk/Need Attention'
             WHEN rfm_rank IN (1, 0) THEN 'Immediate Attention'
               ELSE ''
                END AS customer_segment
FROM segment