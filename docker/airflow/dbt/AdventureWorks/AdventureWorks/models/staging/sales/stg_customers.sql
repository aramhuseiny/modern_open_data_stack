{{ config(alias = 'stg_customer', materialized='table') }}

with source as (
      select * from {{ source('sales', 'customer') }}
),
customers as (
    select
        {{ adapter.quote("storeid") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("personid") }},
        {{ adapter.quote("customerid") }},
        {{ adapter.quote("territoryid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("accountnumber") }}

    from source
)
select * from customers