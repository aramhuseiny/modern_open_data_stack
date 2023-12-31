with source as (
      select * from {{ source('person', 'personphone') }}
),
renamed as (
    select
        {{ adapter.quote("phonenumber") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("businessentityid") }},
        {{ adapter.quote("phonenumbertypeid") }}
    from source
)
select * from renamed
  