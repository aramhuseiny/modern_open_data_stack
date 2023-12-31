{{ config(alias = 'stg_countryregioncurrency', materialized='table') }}

with source as (
      select * from {{ source('sales', 'countryregioncurrency') }}
),
countryregioncurrency as (
    select
        {{ adapter.quote("currencycode") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("countryregioncode") }}

    from source
)
select * from countryregioncurrency
  