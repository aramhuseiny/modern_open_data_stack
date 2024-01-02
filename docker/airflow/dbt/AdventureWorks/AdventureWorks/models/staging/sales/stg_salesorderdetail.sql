{{ config(alias = 'stg_salesorderdetail', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesorderdetail') }}
),
renamed as (
    select
        rowguid,
        orderqty as order_qty,
        linetotal as line_total,
        productid as product_key,
        unitprice as unit_price,
        modifieddate as modified_date,
        salesorderid as sales_order_key,
        specialofferid as special_offer_key,
        unitpricediscount as unit_price_discount,
        salesorderdetailid as sales_order_detail_key,
        carriertrackingnumber as carrier_tracking_number

    from source
)
select * from renamed
  