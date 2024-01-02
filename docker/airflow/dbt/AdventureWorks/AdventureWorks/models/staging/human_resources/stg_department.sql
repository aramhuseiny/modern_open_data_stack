with source as (
      select * from {{ source('human_resources', 'department') }}
),
renamed as (
    select 

        {{ adapter.quote("Name") }},
        {{ adapter.quote("groupname") }},
        {{ adapter.quote("departmentid") }},
        {{ adapter.quote("modifieddate") }}

    from source
)
select * from renamed
  