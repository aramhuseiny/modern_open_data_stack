with source as (
      select * from {{ source('human_resources', 'department') }}
),
renamed as (
    select 

        "Name" as department_name,
        groupname as group_name,
        departmentid as department_key,
        modifieddate  as modified_date

    from source
)
select * from renamed
  