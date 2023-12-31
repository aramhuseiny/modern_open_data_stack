{{ config(alias = 'stg_specialoffer', materialized='table') }}

with source as (
      select * from {{ source('sales', 'specialoffer') }}
),
renamed as (
    select
        {{ adapter.quote("Type") }},
        {{ adapter.quote("maxqty") }},
        {{ adapter.quote("minqty") }},
        {{ adapter.quote("enddate") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("category") }},
        {{ adapter.quote("startdate") }},
        {{ adapter.quote("description") }},
        {{ adapter.quote("discountpct") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("specialofferid") }}

    from source
)
select * from renamed
  