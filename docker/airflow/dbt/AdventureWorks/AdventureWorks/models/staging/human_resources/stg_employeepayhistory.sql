       with source as (
      select * from {{ source('human_resources', 'employeepayhistory') }}
),
renamed as (
    select 

        businessentityid as business_entity_key,
        ratechangedate as rate_change_date,
        rate,
        payfrequency as pay_frequency,
        modifieddate as modified_date
      

    from source
)
select * from renamed

