{{ config(alias = 'stg_salesterritory', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesterritory') }}
),
renamed as (
    select
        "Name" as sales_territory_name,
        "Group" as sales_territory_group,
        costytd as cost_ytd,
        rowguid,
        salesytd as sales_ytd,
        territoryid as territory_key,
        costlastyear as cost_last_year,
        modifieddate as modified_date,
        saleslastyear as sales_last_year,
        countryregioncode as country_region_code

    from source
)
select * from renamed
  