       with source as (
      select * from {{ source('human_resources', 'jobcandidate') }}
),
renamed as (
    select 
        jobcandidateid as job_candidate_key,
        businessentityid as business_entity_id,
        resume,
        modifieddate as modified_date
      

    from source
)
select * from renamed

