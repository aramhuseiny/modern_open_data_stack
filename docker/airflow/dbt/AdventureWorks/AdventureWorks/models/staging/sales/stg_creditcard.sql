{{ config(alias = 'stg_creditcard', materialized='table') }}

with source as (
      select * from {{ source('sales', 'creditcard') }}
),
renamed as (
    select
        {{ adapter.quote("expyear") }},
        {{ adapter.quote("cardtype") }},
        {{ adapter.quote("expmonth") }},
        {{ adapter.quote("cardnumber") }},
        {{ adapter.quote("creditcardid") }},
        {{ adapter.quote("modifieddate") }}

    from source
)
select * from renamed
  