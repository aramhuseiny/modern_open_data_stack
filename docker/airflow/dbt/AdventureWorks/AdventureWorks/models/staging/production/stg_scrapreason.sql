{{ config(alias = 'stg_scrapreason', materialized='table') }}

with source as (
      select * from {{ source('production', 'scrapreason') }}
),
renamed as (
    select
        "Name" as scrap_reason_name,
        modifieddate as modified_date,
        scrapreasonid as scrap_reason_key
    from source
)
select * from renamed
  