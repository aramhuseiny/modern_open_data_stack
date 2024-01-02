{{ config(alias = 'stg_currencyrate', materialized='table') }}

with source as (
      select * from {{ source('sales', 'currencyrate') }}
),
currencyrate as (
    select
        averagerate as average_rate,
        endofdayrate as end_of_day_rate,
        modifieddate as modified_date,
        currencyrateid as currency_rate_key,
        tocurrencycode as to_currency_code,
        currencyratedate as currency_rate_date,
        fromcurrencycode as from_currency_code

    from source
)
select * from currencyrate
  