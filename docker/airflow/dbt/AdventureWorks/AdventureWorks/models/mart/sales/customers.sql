with customers as (
    select * from {{ ref('stg_customer')}}
),
persons as (
    select * from {{ ref('stg_person') }}
),
final as (
    select 
        persons.title, persons.firstname, persons.middlename, persons.lastname, persons.suffix, customers.accountnumber
    from persons join customers on customers.personid = persons.businessentityid
)
select * from final