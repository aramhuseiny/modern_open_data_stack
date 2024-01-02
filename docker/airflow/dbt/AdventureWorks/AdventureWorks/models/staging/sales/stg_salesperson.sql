{{ config(alias = 'stg_salesperson', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesperson') }}
),
renamed as (
    select
        bonus,
        rowguid,
        salesytd as sales_ytd,
        salesquota as sales_quota,
        territoryid as territory_key,
        modifieddate as modified_date,
        commissionpct as commission_pct,
        saleslastyear as sales_last_year,
        businessentityid as business_entity_key

    from source
)
select * from renamed
  