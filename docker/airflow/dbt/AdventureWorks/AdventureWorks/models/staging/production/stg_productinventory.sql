{{ config(alias = 'stg_productinventory', materialized='table') }}

with source as (
      select * from {{ source('production', 'productinventory') }}
),
renamed as (
    select
        bin,
        shelf,
        rowguid,
        quantity,
        productid as product_key,
        locationid as location_key,
        modifieddate as modified_date
    from source
)
select * from renamed
  