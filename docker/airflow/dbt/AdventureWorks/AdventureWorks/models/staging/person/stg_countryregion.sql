with source as (
      select * from {{ source('person', 'countryregion') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("countryregioncode") }}

    from source
)
select * from renamed
  