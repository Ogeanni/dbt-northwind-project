with renamed as (
    select DISTINCT customerid AS customer_id,
           companyname as company_name,
           contactname as contact_name,
           contacttitle as contact_title,
           city,
           country
    from {{ source('src_postgres', 'customers' )}}
)
select * from renamed