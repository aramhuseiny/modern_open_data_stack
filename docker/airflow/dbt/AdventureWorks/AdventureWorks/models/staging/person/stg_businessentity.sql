with source as (
      select * from {{ source('person', 'businessentity') }}
),
renamed as (
    select
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("businessentityid") }}

    from source
)
select * from renamed
  