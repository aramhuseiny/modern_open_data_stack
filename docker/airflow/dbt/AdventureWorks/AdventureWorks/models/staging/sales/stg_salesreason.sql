{{ config(alias = 'stg_salesreason', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesreason') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("reasontype") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("salesreasonid") }}

    from source
)
select * from renamed
  