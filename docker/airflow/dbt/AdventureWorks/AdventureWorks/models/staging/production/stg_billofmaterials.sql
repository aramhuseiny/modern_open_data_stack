{{ config(alias = 'stg_billofmaterials', materialized='table') }}

with source as (
      select * from {{ source('production', 'billofmaterials') }}
),
renamed as (
    select

        {{ adapter.quote("billofmaterialsid") }} as bill_of_materials_key,
        {{ adapter.quote("productassemblyid") }} as product_assembly_key,
        {{ adapter.quote("componentid") }} as component_key,
        {{ adapter.quote("startdate") }} as start_date,
        {{ adapter.quote("enddate") }} as end_date,
        {{ adapter.quote("unitmeasurecode") }} as unit_measure_code,
        {{ adapter.quote("bomlevel") }} as bom_level,
        {{ adapter.quote("perassemblyqty") }} as perassembly_qty,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  