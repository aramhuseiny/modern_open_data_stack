{{ config(alias = 'stg_productcategory', materialized='table') }}

with source as (
      select * from {{ source('production', 'productcategory') }}
),
renamed as (
    select

        "Name" as product_category_name,
        rowguid,
        modifieddate as modified_date,
        productcategoryid as product_category_key
    from source
)
select * from renamed
  