{{ config(alias = 'stg_countryregioncurrency', materialized='table') }}

with source as (
      select * from {{ source('sales', 'countryregioncurrency') }}
),
countryregioncurrency as (
    select
        currencycode as currency_code,
        modifieddate  as modified_date,
        countryregioncode as country_region_code

    from source
)
select * from countryregioncurrency
  