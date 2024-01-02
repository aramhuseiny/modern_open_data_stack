with source as (
      select * from {{ source('person', 'businessentitycontact') }}
),
renamed as (
    select
        rowguid,
        personid as person_key,
        modifieddate as modified_date,
        contacttypeid as contact_type_key,
        businessentityid as business_entity_key

    from source
)
select * from renamed
  