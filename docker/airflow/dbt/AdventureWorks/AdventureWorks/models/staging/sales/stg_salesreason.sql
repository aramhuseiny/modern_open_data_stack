{{ config(alias = 'stg_salesreason', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesreason') }}
),
renamed as (
    select
        "Name" as sales_reason_name,
        reasontype as reason_type,
        modifieddate as modified_date,
        salesreasonid as sales_reason_key

    from source
)
select * from renamed
  