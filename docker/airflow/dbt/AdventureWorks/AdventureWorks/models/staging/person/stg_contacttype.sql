with source as (
      select * from {{ source('person', 'contacttype') }}
),
renamed as (
    select
        "Name" as content_type_name,
        modifieddate as modified_date,
        contacttypeid as contact_type_key

    from source
)
select * from renamed
  