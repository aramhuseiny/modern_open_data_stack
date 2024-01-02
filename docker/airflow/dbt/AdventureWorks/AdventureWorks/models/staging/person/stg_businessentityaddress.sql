with source as (
      select * from {{ source('person', 'businessentityaddress') }}
),
renamed as (
    select
        rowguid,
        addressid as address_key,
        modifieddate as modified_date,
        addresstypeid as address_type_key,
        businessentityid as business_entity_key

    from source
)
select * from renamed
  