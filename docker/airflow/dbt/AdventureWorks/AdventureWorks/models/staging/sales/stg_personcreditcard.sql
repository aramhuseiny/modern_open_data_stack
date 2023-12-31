{{ config(alias = 'stg_personcreditcard', materialized='table') }}

with source as (
      select * from {{ source('sales', 'personcreditcard') }}
),
renamed as (
    select
        {{ adapter.quote("creditcardid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("businessentityid") }}

    from source
)
select * from renamed
  