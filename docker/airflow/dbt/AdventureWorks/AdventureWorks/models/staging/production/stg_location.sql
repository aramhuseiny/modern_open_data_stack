{{ config(alias = 'stg_location', materialized='table') }}

with source as (
      select * from {{ source('production', 'Location') }}
),
renamed as (
    select

        {{ adapter.quote("Name") }},
        {{ adapter.quote("costrate") }},
        {{ adapter.quote("locationid") }} as locationkey,
        {{ adapter.quote("availability") }},
        {{ adapter.quote("modifieddate") }}

    from source
)
select * from renamed
  