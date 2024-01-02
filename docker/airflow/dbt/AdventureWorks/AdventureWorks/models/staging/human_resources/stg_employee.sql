       with source as (
      select * from {{ source('human_resources', 'employee') }}
),
renamed as (
    select 

        businessentityid as business_entity_id,
        nationalidnumber as national_id_number,
        organizationnode as organization_node,
        organizationlevel as organization_level,
        jobtitle as job_title,
        birthdate,
        maritalstatus as marital_status,
        gender,
        salariedflag as salaried_flag,
        vacationhours vacation_hours,
        sickleavehours as sick_leave_hours,
        currentflag as current_flag,
        rowguid,
        modifieddate as modified_date


    from source
)
select * from renamed

