{{ config(alias = 'stg_productlistpricehistory', materialized='table') }}

with source as (
      select * from {{ source('production', 'productlistpricehistory') }}
),
renamed as (
    select
        enddate as end_date,
        listprice as list_price,
        productid as product_key,
        startdate as start_date,
        modifieddate as modified_date
    from source
)
select * from renamed
  