{{ config(alias = 'stg_productsubcategory', materialized='table') }}

with source as (
      select * from {{ source('production', 'productsubcategory') }}
),
renamed as (
    select
        "Name" as product_subcategory_name,
        rowguid,
        modifieddate as modified_date,
        productcategoryid as product_category_key,
        productsubcategoryid as product_subcategory_key
    from source
)
select * from renamed
  