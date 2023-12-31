{{ config(alias = 'stg_currency', materialized='table') }}

with source as (
      select * from {{ source('sales', 'currency') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("currencycode") }},
        {{ adapter.quote("modifieddate") }}

    from source
)
select * from renamed
  