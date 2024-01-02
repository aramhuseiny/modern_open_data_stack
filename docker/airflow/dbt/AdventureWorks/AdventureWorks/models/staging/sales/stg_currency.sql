{{ config(alias = 'stg_currency', materialized='table') }}

with source as (
      select * from {{ source('sales', 'currency') }}
),
renamed as (
    select
        "Name" as currency_name,
        currencycode as currency_code,
        modifieddate as modified_date

    from source
)
select * from renamed
  