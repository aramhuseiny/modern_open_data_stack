{{ config(alias = 'dim_currencies', materialized='table') }}

with currencies as (
    select * from {{ ref('stg_currency')}}
),
final as (
    select 
        currencies.currency_name,
        currencies.currency_code as currency_key,
        currencies.currency_code currency_alternate_key

    from currencies 
)
select * from final