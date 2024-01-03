{{ config(alias = 'stg_vendor', materialized='table') }}

with source as (
      select * from {{ source('purchasing', 'vendor') }}
),
renamed as (
    select
        "Name" as vendor_name,
        activeflag as active_flag,
        creditrating as credit_rating,
        modifieddate as modified_date,
        accountnumber as account_number,
        businessentityid as business_entity_key,
        preferredvendorstatus as preferred_vendor_status,
        purchasingwebserviceurl as purchasing_webser_viceurl
    from source
)
select * from renamed