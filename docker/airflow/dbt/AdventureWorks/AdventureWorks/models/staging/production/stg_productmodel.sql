{{ config(alias = 'stg_productmodel', materialized='table') }}

with source as (
      select * from {{ source('production', 'productmodel') }}
),
renamed as (
    select
        "Name" as product_model_name,
        rowguid,
        instructions,
        modifieddate as modified_date,
        productmodelid as product_model_key,
        catalogdescription as catalog_description
    from source
)
select * from renamed
  