with source as (
      select * from {{ source('person', 'addresstype') }}
),
renamed as (
    select 
        
        {{ adapter.quote("Name") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("addresstypeid") }}
        
    from source
)
select * from renamed
  