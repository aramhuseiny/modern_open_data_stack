       with source as (
      select * from {{ source('human_resources', 'shift') }}
),
renamed as (
    select 

        "Name" as shift_name,
        endtime as end_time,
        shiftid as shift_key,
        starttime as start_time,
        modifieddate as modified_date
      

    from source
)
select * from renamed

