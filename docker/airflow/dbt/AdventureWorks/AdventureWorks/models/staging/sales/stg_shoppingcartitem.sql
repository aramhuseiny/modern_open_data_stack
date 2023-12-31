{{ config(alias = 'stg_shoppingcartitem', materialized='table') }}

with source as (
      select * from {{ source('sales', 'shoppingcartitem') }}
),
renamed as (
    select
        {{ adapter.quote("quantity") }},
        {{ adapter.quote("productid") }},
        {{ adapter.quote("datecreated") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("shoppingcartid") }},
        {{ adapter.quote("shoppingcartitemid") }}

    from source
)
select * from renamed
  