{{ config(alias = 'stg_billofmaterials', materialized='table') }}

with source as (
      select * from {{ source('production', 'billofmaterials') }}
),
renamed as (
    select

        billofmaterialsid as bill_of_materials_key,
        productassemblyid as product_assembly_key,
        componentid as component_key,
        startdate as start_date,
        enddate as end_date,
        unitmeasurecode as unit_measure_code,
        bomlevel as bom_level,
        perassemblyqty as perassembly_qty,
        modifieddate as modified_date

    from source
)
select * from renamed
  