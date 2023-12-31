with source as (
      select * from {{ source('person', 'person') }}
),
renamed as (
    select
        {{ adapter.quote("title") }},
        {{ adapter.quote("suffix") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("lastname") }},
        {{ adapter.quote("firstname") }},
        {{ adapter.quote("namestyle") }},
        {{ adapter.quote("middlename") }},
        {{ adapter.quote("persontype") }},
        {{ adapter.quote("demographics") }},
        {{ adapter.quote("modifieddate") }},
        {{ adapter.quote("emailpromotion") }},
        {{ adapter.quote("businessentityid") }},
        {{ adapter.quote("additionalcontactinfo") }}

    from source
)
select * from renamed
  