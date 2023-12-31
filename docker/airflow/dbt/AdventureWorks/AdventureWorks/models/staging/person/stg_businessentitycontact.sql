with source as (
      select * from {{ source('person', 'businessentitycontact') }}
),
renamed as (
    select
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("personid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("contacttypeid") }},
        {{ adapter.quote("businessentityid") }}

    from source
)
select * from renamed
  