       with source as (
      select * from {{ source('human_resources', 'jobcandidate') }}
),
renamed as (
    select 
        {{ adapter.quote("jobcandidateid") }},
        {{ adapter.quote("businessentityid") }},
        {{ adapter.quote("resume") }},
        {{ adapter.quote("modifieddate")}}       
      

    from source
)
select * from renamed

