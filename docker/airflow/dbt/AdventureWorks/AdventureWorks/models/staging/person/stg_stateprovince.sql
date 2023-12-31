with source as (
      select * from {{ source('person', 'stateprovince') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("territoryid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("stateprovinceid") }},
        {{ adapter.quote("countryregioncode") }},
        {{ adapter.quote("stateprovincecode") }},
        {{ adapter.quote("isonlystateprovinceflag") }}

    from source
)
select * from renamed
  