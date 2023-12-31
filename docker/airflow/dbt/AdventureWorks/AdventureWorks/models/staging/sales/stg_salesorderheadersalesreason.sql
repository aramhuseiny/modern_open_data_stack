{{ config(alias = 'stg_salesorderheadersalesreason', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesorderheadersalesreason') }}
),
renamed as (
    select
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("salesorderid") }},
        {{ adapter.quote("salesreasonid") }}

    from source
)
select * from renamed
  