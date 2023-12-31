with source as (
      select * from {{ source('person', 'emailaddress') }}
),
renamed as (
    select
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("emailaddress") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("emailaddressid") }},
        {{ adapter.quote("businessentityid") }}

    from source
)
select * from renamed
  