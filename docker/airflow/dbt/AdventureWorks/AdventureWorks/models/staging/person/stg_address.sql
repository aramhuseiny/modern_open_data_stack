with source as (
      select * from {{ source('person', 'address') }}
),
renamed as (
    select 

        city,
        rowguid,
        addressid as address_key,
        postalcode as postal_code,
        addressline1 as address_line1,
        addressline2 as address_line2,
        modifieddate as modified_date,
        spatiallocation as spatial_location,
        stateprovinceid as state_province_key
    from source
)
select * from renamed
  