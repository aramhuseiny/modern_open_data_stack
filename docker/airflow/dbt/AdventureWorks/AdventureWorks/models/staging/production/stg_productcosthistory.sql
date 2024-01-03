{{ config(alias = 'stg_productcosthistory', materialized='table') }}

with source as (
      select * from {{ source('production', 'productcosthistory') }}
),
renamed as (
    select

        productid as product_key,
        startdate as start_date,
        enddate as end_date,
        standardcost as standard_cost,
        modifieddate as modified_date
    from source
)
select * from renamed
  