{{ config(alias = 'stg_unitmeasure', materialized='table') }}

with source as (
      select * from {{ source('production', 'unitmeasure') }}
),
renamed as (
    select
        "Name" as unit_measure_name,
        modifieddate as modified_date,
        unitmeasurecode as unit_measure_code
    from source
)
select * from renamed
  