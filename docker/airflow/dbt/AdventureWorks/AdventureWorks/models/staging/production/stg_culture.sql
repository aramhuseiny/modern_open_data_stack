{{ config(alias = 'stg_culture', materialized='table') }}

with source as (
      select * from {{ source('production', 'culture') }}
),
renamed as (
    select

        cultureid as culture_key,
        "Name" as culture_name,
        modifieddate as modified_date

    from source
)
select * from renamed
  