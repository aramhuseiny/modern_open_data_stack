{{ config(alias = 'stg_personcreditcard', materialized='table') }}

with source as (
      select * from {{ source('sales', 'personcreditcard') }}
),
renamed as (
    select
        creditcardid as credit_card_key,
        modifieddate as modified_date,
        businessentityid as business_entity_key

    from source
)
select * from renamed
  