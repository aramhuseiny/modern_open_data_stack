{{ config(alias = 'stg_salestaxrate', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salestaxrate') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("taxrate") }},
        {{ adapter.quote("taxtype") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("salestaxrateid") }},
        {{ adapter.quote("stateprovinceid") }}

    from source
)
select * from renamed
  