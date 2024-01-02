{{ config(alias = 'stg_salesorderheadersalesreason', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesorderheadersalesreason') }}
),
renamed as (
    select
        modifieddate as modified_date,
        salesorderid as sales_order_key,
        salesreasonid as sales_reason_key

    from source
)
select * from renamed
  