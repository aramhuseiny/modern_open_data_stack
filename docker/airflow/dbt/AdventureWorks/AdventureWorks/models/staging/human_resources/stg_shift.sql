       with source as (
      select * from {{ source('human_resources', 'shift') }}
),
renamed as (
    select 

        {{ adapter.quote("Name") }},
        {{ adapter.quote("endtime") }},
        {{ adapter.quote("shiftid") }},
        {{ adapter.quote("starttime")}},
        {{ adapter.quote("modifieddate")}}       
      

    from source
)
select * from renamed

