with source as (
      select * from {{ source('person', 'businessentity') }}
),
renamed as (
    select
        rowguid,
        modifieddate as modified_date,
        businessentityid as business_entity_key

    from source
)
select * from renamed
  