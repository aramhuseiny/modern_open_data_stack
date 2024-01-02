with source as (
      select * from {{ source('person', 'emailaddress') }}
),
renamed as (
    select
        rowguid,
        emailaddress as email_address,
        modifieddate as modified_date,
        emailaddressid as email_address_key,
        businessentityid as business_entity_key

    from source
)
select * from renamed
  