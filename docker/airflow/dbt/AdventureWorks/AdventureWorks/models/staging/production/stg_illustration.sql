{{ config(alias = 'stg_illustration', materialized='table') }}

with source as (
      select * from {{ source('production', 'illustration') }}
),
renamed as (
    select

        {{ adapter.quote("diagram") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("illustrationid") }}

    from source
)
select * from renamed
  