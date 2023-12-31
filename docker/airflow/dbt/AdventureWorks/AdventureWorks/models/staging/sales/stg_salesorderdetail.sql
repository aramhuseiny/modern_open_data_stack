{{ config(alias = 'stg_salesorderdetail', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesorderdetail') }}
),
renamed as (
    select
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("orderqty") }},
        {{ adapter.quote("linetotal") }},
        {{ adapter.quote("productid") }},
        {{ adapter.quote("unitprice") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("salesorderid") }},
        {{ adapter.quote("specialofferid") }},
        {{ adapter.quote("unitpricediscount") }},
        {{ adapter.quote("salesorderdetailid") }},
        {{ adapter.quote("carriertrackingnumber") }}

    from source
)
select * from renamed
  