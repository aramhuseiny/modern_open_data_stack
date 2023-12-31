{{ config(alias = 'stg_salesperson', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesperson') }}
),
renamed as (
    select
        {{ adapter.quote("bonus") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("salesytd") }},
        {{ adapter.quote("salesquota") }},
        {{ adapter.quote("territoryid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("commissionpct") }},
        {{ adapter.quote("saleslastyear") }},
        {{ adapter.quote("businessentityid") }}

    from source
)
select * from renamed
  