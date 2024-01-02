{{ config(alias = 'stg_creditcard', materialized='table') }}

with source as (
      select * from {{ source('sales', 'creditcard') }}
),
renamed as (
    select
        expyear as exp_year,
        cardtype as card_type,
        expmonth as exp_month,
        cardnumber card_number,
        creditcardid credit_card_key,
        modifieddate as modified_date

    from source
)
select * from renamed
  