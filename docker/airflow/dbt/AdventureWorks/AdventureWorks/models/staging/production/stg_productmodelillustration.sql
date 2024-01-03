{{ config(alias = 'stg_productmodelillustration', materialized='table') }}

with source as (
      select * from {{ source('production', 'productmodelillustration') }}
),
renamed as (
    select
        modifieddate as modified_date,
        illustrationid as illustration_key,
        productmodelid as product_model_key
    from source
)
select * from renamed
  