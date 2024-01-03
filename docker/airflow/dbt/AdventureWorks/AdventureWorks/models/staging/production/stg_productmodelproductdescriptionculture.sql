{{ config(alias = 'stg_productmodelproductdescriptionculture', materialized='table') }}

with source as (
      select * from {{ source('production', 'productmodelproductdescriptionculture') }}
),
renamed as (
    select
        cultureid as culture_key,
        modifieddate as modified_date,
        productmodelid as product_model_key,
        productdescriptionid as product_description_key
    from source
)
select * from renamed
  