with source as (
      select * from {{ source('person', 'phonenumbertype') }}
),
renamed as (
    select
        "Name" as phone_number_type_name,
        modifieddate as modified_date,
        phonenumbertypeid as phone_number_type_key

    from source
)
select * from renamed
  