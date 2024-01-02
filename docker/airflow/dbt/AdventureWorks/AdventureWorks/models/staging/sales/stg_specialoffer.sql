{{ config(alias = 'stg_specialoffer', materialized='table') }}

with source as (
      select * from {{ source('sales', 'specialoffer') }}
),
renamed as (
    select
        "Type" as special_offer_type,
        maxqty as max_qty,
        minqty as min_qty,
        enddate as end_date,
        rowguid,
        category,
        startdate as start_date,
        "description" as special_offer_description,
        discountpct as discount_pct,
        modifieddate as modified_date,
        specialofferid as special_offer_key

    from source
)
select * from renamed
  