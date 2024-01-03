{{ config(alias = 'stg_productdocument', materialized='table') }}

with source as (
      select * from {{ source('production', 'productdocument') }}
),
renamed as (
    select
        productid as product_key,
        documentnode as document_node,
        modifieddate as modified_date

    from source
)
select * from renamed
  