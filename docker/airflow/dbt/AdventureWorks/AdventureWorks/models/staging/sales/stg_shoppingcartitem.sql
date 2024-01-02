{{ config(alias = 'stg_shoppingcartitem', materialized='table') }}

with source as (
      select * from {{ source('sales', 'shoppingcartitem') }}
),
renamed as (
    select
        quantity,
        productid as product_key,
        datecreated as date_created,
        modifieddate as modified_date,
        shoppingcartid as shopping_cart_key,
        shoppingcartitemid as shopping_cart_item_key

    from source
)
select * from renamed
  