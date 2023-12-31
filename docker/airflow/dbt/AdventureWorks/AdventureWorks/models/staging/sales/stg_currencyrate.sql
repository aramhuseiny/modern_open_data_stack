{{ config(alias = 'stg_currencyrate', materialized='table') }}

with source as (
      select * from {{ source('sales', 'currencyrate') }}
),
currencyrate as (
    select
        {{ adapter.quote("averagerate") }},
        {{ adapter.quote("endofdayrate") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("currencyrateid") }},
        {{ adapter.quote("tocurrencycode") }},
        {{ adapter.quote("currencyratedate") }},
        {{ adapter.quote("fromcurrencycode") }}

    from source
)
select * from currencyrate
  