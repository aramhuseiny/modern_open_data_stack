{{ config(alias = 'stg_productdescription', materialized='table') }}

with source as (
      select * from {{ source('production', 'productdescription') }}
),
renamed as (
    select
        productdescriptionid as product_description_key,
        description as description,
        rowguid,
        modifieddate as modified_date

    from source
)
select * from renamed
  