{{ config(alias = 'stg_store', materialized='table') }}

with source as (
      select * from {{ source('sales', 'store') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("demographics") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("salespersonid") }},
        {{ adapter.quote("businessentityid") }}
    from source
)
select * from renamed
  