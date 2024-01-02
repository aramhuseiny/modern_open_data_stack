{{ config(alias = 'stg_store', materialized='table') }}

with source as (
      select * from {{ source('sales', 'store') }}
),
renamed as (
    select
        "Name" as store_name,
        rowguid,
        demographics,
        modifieddate as modified_date,
        salespersonid as sales_person_key,
        businessentityid as business_entity_key
    from source
)
select * from renamed
  