{{ config(alias = 'stg_productreview', materialized='table') }}

with source as (
      select * from {{ source('production', 'productreview') }}
),
renamed as (
    select
        rating,
        "Comments" as product_review_comments,
        productid as product_key,
        reviewdate as review_date,
        emailaddress as email_address,
        modifieddate as modified_date,
        reviewername as reviewer_name,
        productreviewid as product_review_key
    from source
)
select * from renamed
  