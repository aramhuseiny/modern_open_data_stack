{{ config(alias = 'stg_culture', materialized='table') }}

with source as (
      select * from {{ source('production', 'culture') }}
),
renamed as (
    select



        {{ adapter.quote("cultureid") }},
        {{ adapter.quote("Name") }},
        {{ adapter.quote("modifieddate") }}

    from source
)
select * from renamed
  