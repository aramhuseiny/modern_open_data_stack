{{ config(alias = 'stg_purchaseorderdetail', materialized='table') }}

with source as (
      select * from {{ source('purchasing', 'purchaseorderdetail') }}
),
renamed as (
    select

        duedate as due_date,
        orderqty as order_qty,
        linetotal as line_total,
        productid as product_key,
        unitprice as unit_price,
        stockedqty as stocked_qty,
        receivedqty as received_qty,
        rejectedqty as rejected_qty,
        modifieddate as modified_date,
        purchaseorderid as purchase_order_key,
        purchaseorderdetailid as purchase_order_detail_key

    from source
)
select * from renamed
  