with source as (
      select * from {{ source('person', 'addresstype') }}
),
renamed as (
    select 
        
        "Name" as address_type_name,
        rowguid,
        modifieddate as modified_date,
        addresstypeid as address_type_key
        
    from source
)
select * from renamed
  