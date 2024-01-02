with source as (
      select * from {{ source('person', 'personphone') }}
),
renamed as (
    select
        phonenumber as phone_number,
        modifieddate as modified_date,
        businessentityid as business_entity_key,
        phonenumbertypeid as phone_number_type_key
    from source
)
select * from renamed
  