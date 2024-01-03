{{ config(alias = 'stg_transactionhistoryarchive', materialized='table') }}

with source as (
      select * from {{ source('production', 'transactionhistoryarchive') }}
),
renamed as (
    select
        quantity,
        productid as product_key,
        actualcost as actual_cost,
        modifieddate as modified_date,
        transactionid as transaction_key,
        transactiondate as transaction_date,
        transactiontype as transaction_type,
        referenceorderid as reference_order_key,
        referenceorderlineid as reference_order_line_key
    from source
)
select * from renamed
  