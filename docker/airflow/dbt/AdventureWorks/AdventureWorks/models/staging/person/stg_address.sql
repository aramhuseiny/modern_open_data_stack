with source as (
      select * from {{ source('person', 'address') }}
),
renamed as (
    select 

        {{ adapter.quote("city") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("addressid") }},
        {{ adapter.quote("postalcode") }},
        {{ adapter.quote("addressline1") }},
        {{ adapter.quote("addressline2") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("spatiallocation") }},
        {{ adapter.quote("stateprovinceid") }}
    from source
)
select * from renamed
  