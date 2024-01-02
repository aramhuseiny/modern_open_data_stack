with source as (
      select * from {{ source('person', 'countryregion') }}
),
renamed as (
    select
        "Name" as country_region_name,
        modifieddate as modified_date,
        countryregioncode as country_region_code

    from source
)
select * from renamed
  