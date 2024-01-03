{{ config(alias = 'dim_customers', materialized='table') }}

with customers as (
    select * from {{ ref('stg_customer')}}
),
persons as (
    select * from {{ ref('stg_person') }}
),
employees as (
    select * from {{ ref('stg_employee') }}
),
email_addresses as (
    select * from {{ ref('stg_emailaddress') }}
),
final as (
    select 
        customers.customer_key,
        persons.title, 
        persons.first_name, 
        persons.middle_name, 
        persons.last_name, 
        persons.suffix, 
        customers.account_number as customer_alternate_key,
        employees.gender as gender,
        email_addresses.email_address
    from customers left join persons  on customers.person_key = persons.business_entity_key
    left join employees on employees.business_entity_key = persons.business_entity_key
    left join email_addresses on email_addresses.business_entity_key = persons.business_entity_key
)
select * from final