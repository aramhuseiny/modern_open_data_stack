{{ config(alias = 'stg_productvendor', materialized='table') }}

with source as (
      select * from {{ source('purchasing', 'productvendor') }}
),
renamed as (
    select

        productid as product_key,
        onorderqty as onorder_qty,
        maxorderqty as max_order_qty,
        minorderqty as min_order_qty,
        modifieddate as modified_date,
        standardprice as standard_price,
        averageleadtime as average_lead_time,
        lastreceiptcost as last_receipt_cost,
        lastreceiptdate as last_receipt_date,
        unitmeasurecode as unit_measure_code,
        businessentityid as business_entity_key
        

    from source
)
select * from renamed
  