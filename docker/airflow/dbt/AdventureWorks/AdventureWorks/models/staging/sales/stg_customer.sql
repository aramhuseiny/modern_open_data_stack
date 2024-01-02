{{ config(alias = 'stg_customer', materialized='table') }}

with source as (
      select * from {{ source('sales', 'customer') }}
),
customers as (
    select
        storeid as store_key,
        rowguid,
        personid as person_key,
        customerid as customer_key,
        territoryid as territory_key,
        modifieddate as modified_date,
        accountnumber as account_number

    from source
)
select * from customers