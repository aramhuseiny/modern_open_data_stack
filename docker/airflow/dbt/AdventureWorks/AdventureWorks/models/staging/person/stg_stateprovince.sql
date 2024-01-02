with source as (
      select * from {{ source('person', 'stateprovince') }}
),
renamed as (
    select
        "Name" as state_province_name,
        rowguid,
        territoryid as territory_key,
        modifieddate as modified_date,
        stateprovinceid as state_province_key,
        countryregioncode as country_region_code,
        stateprovincecode as state_province_code,
        isonlystateprovinceflag as is_only_state_province_flag

    from source
)
select * from renamed
  