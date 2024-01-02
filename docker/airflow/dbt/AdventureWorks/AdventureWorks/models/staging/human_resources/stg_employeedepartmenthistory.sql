       with source as (
      select * from {{ source('human_resources', 'employeedepartmenthistory') }}
),
renamed as (
    select 
        {{ adapter.quote("businessentityid") }},
        {{ adapter.quote("departmentid") }},
        {{ adapter.quote("shiftid") }},
        {{ adapter.quote("startdate")}},
        {{ adapter.quote("enddate") }},
        {{ adapter.quote("modifieddate") }}
      

    from source
)
select * from renamed

