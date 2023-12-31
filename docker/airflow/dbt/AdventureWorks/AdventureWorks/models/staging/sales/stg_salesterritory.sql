{{ config(alias = 'stg_salesterritory', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesterritory') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("Group") }},
        {{ adapter.quote("costytd") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("salesytd") }},
        {{ adapter.quote("territoryid") }},
        {{ adapter.quote("costlastyear") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("saleslastyear") }},
        {{ adapter.quote("countryregioncode") }}

    from source
)
select * from renamed
  