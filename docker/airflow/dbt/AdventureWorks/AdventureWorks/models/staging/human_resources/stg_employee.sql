       with source as (
      select * from {{ source('human_resources', 'employee') }}
),
renamed as (
    select 

        {{ adapter.quote("businessentityid") }},
        {{ adapter.quote("nationalidnumber") }},
        {{ adapter.quote("organizationnode") }},
        {{ adapter.quote("organizationlevel") }},
        {{ adapter.quote("jobtitle")}},
        {{ adapter.quote("birthdate") }},
        {{ adapter.quote("maritalstatus") }},
        {{ adapter.quote("gender") }},
        {{ adapter.quote("salariedflag") }},
        {{ adapter.quote("vacationhours") }},
        {{ adapter.quote("sickleavehours") }},
        {{ adapter.quote("currentflag") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("modifieddate") }}


    from source
)
select * from renamed

