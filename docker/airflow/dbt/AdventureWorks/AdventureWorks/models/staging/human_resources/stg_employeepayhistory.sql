       with source as (
      select * from {{ source('human_resources', 'employeepayhistory') }}
),
renamed as (
    select 

        {{ adapter.quote("businessentityid") }},
        {{ adapter.quote("ratechangedate") }},
        {{ adapter.quote("rate") }},
        {{ adapter.quote("payfrequency") }},
        {{ adapter.quote("modifieddate")}}      
      

    from source
)
select * from renamed

