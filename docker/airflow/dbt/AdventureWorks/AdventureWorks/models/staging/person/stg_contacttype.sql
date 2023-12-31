with source as (
      select * from {{ source('person', 'contacttype') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("contacttypeid") }}

    from source
)
select * from renamed
  