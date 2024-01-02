       with source as (
      select * from {{ source('human_resources', 'employeedepartmenthistory') }}
),
renamed as (
    select 
        businessentityid as business_entity_id,
        departmentid as department_key,
        shiftid as shift_id,
        startdate as start_date,
        enddate as end_date,
        modifieddate as modified_date
      

    from source
)
select * from renamed

