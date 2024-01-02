{{ config(alias = 'stg_salestaxrate', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salestaxrate') }}
),
renamed as (
    select
        "Name" as sales_tax_rate_name,
        taxrate as tax_rate,
        taxtype as tax_type,
        rowguid,
        modifieddate as modified_date,
        salestaxrateid as sales_tax_rate_key,
        stateprovinceid as state_province_key

    from source
)
select * from renamed
  