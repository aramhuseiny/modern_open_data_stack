{{ config(alias = 'stg_illustration', materialized='table') }}

with source as (
      select * from {{ source('production', 'illustration') }}
),
renamed as (
    select

        diagram,
        modifieddate as modified_date,
        illustrationid as illustration_key

    from source
)
select * from renamed
  