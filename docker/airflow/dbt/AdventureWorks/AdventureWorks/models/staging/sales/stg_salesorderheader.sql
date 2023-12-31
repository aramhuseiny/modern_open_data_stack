{{ config(alias = 'stg_salesorderheader', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesorderheader') }}
),
renamed as (
    select
        {{ adapter.quote("status") }},
        {{ adapter.quote("taxamt") }},
        {{ adapter.quote("Comment") }},
        {{ adapter.quote("duedate") }},
        {{ adapter.quote("freight") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("shipdate") }},
        {{ adapter.quote("subtotal") }},
        {{ adapter.quote("totaldue") }},
        {{ adapter.quote("orderdate") }},
        {{ adapter.quote("customerid") }},
        {{ adapter.quote("territoryid") }},
        {{ adapter.quote("creditcardid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("salesorderid") }},
        {{ adapter.quote("shipmethodid") }},
        {{ adapter.quote("accountnumber") }},
        {{ adapter.quote("salespersonid") }},
        {{ adapter.quote("currencyrateid") }},
        {{ adapter.quote("revisionnumber") }},
        {{ adapter.quote("billtoaddressid") }},
        {{ adapter.quote("onlineorderflag") }},
        {{ adapter.quote("shiptoaddressid") }},
        {{ adapter.quote("salesordernumber") }},
        {{ adapter.quote("purchaseordernumber") }},
        {{ adapter.quote("creditcardapprovalcode") }}

    from source
)
select * from renamed
  