{{ config(alias = 'stg_shipmethod', materialized='table') }}

with source as (
      select * from {{ source('purchasing', 'shipmethod') }}
),
renamed as (
    select
        "Name" as ship_method_name,
        rowguid,
        shipbase as ship_base,
        shiprate as ship_rate,
        modifieddate as modified_date,
        shipmethodid as ship_method_key

    from source
)
select * from renamed