with source as (
      select * from {{ source('person', 'phonenumbertype') }}
),
renamed as (
    select
        {{ adapter.quote("Name") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("phonenumbertypeid") }}

    from source
)
select * from renamed
  