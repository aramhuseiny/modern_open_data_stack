{{ config(alias = 'stg_productcategory', materialized='table') }}

with source as (
      select * from {{ source('production', 'productcategory') }}
),
renamed as (
    select

        {{ adapter.quote("Name") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("productcategoryid") }} as productcategorykey
    from source
)
select * from renamed
  