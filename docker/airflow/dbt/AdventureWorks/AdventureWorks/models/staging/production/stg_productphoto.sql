{{ config(alias = 'stg_productphoto', materialized='table') }}

with source as (
      select * from {{ source('production', 'productphoto') }}
),
renamed as (
    select
        largephoto as large_photo,
        modifieddate as modified_date,
        productphotoid as product_photo_key,
        thumbnailphoto as thumbnail_photo,
        largephotofilename as large_photo_file_name,
        thumbnailphotofilename as thumbnail_photo_file_name
    from source
)
select * from renamed
  