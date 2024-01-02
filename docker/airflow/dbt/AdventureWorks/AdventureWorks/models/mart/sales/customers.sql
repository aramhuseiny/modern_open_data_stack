with customers as (
    select * from {{ ref('stg_customer')}}
),
persons as (
    select * from {{ ref('stg_person') }}
),
final as (
    select 
        persons.title, persons.first_name, persons.middle_name, persons.last_name, persons.suffix, customers.account_number
    from persons join customers on customers.person_key = persons.business_entity_key
)
select * from final