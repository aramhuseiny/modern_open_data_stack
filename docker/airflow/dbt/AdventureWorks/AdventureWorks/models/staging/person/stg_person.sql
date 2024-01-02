with source as (
      select * from {{ source('person', 'person') }}
),
renamed as (
    select
        title,
        suffix,
        rowguid,
        lastname as last_name,
        firstname as first_name,
        namestyle as name_style,
        middlename as middle_name,
        persontype as person_type,
        demographics as demographics,
        modifieddate as modified_date,
        emailpromotion as email_promotion,
        businessentityid as business_entity_key,
        additionalcontactinfo as additional_contact_info

    from source
)
select * from renamed
  