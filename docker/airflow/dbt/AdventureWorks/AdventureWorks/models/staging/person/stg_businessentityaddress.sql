with source as (
      select * from {{ source('person', 'businessentityaddress') }}
),
renamed as (
    select
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("addressid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("addresstypeid") }},
        {{ adapter.quote("businessentityid") }}

    from source
)
select * from renamed
  