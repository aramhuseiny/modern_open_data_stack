{{ config(alias = 'stg_location', materialized='table') }}

with source as (
      select * from {{ source('production', 'Location') }}
),
renamed as (
    select

        "Name" as location_name,
        costrate,
        locationid as location_key,
        availability,
        modifieddate as modified_date

    from source
)
select * from renamed
  