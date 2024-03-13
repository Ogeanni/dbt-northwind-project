with percent_rank as(
    select * from {{ ref('customer_segment_purchase')}}
),
rfm_scores as (
    select  
        *,
        ROUND(CAST(PERCENT_RANK() OVER (ORDER BY total_price)*10 AS NUMERIC),0) AS monetary_score,
        ROUND(CAST(PERCENT_RANK() OVER (ORDER BY total_purchase_count)*10 AS NUMERIC), 0) AS frequency_score,
        ROUND(CAST(PERCENT_RANK() OVER (ORDER BY recency)*10 AS NUMERIC), 0) AS recency_score

from percent_rank
),
rfm_percentile as (
    select
        *,
        (monetary_score + frequency_score + recency_score) AS rfm
    from rfm_scores
)
select *,
        ROUND(CAST(PERCENT_RANK() OVER (ORDER BY rfm)*10 AS NUMERIC), 0) AS rfm_rank
from rfm_percentile