{{ config(alias = 'stg_workorder', materialized='table') }}

with source as (
      select * from {{ source('production', 'workorder') }}
),
renamed as (
    select
        duedate as due_date,
        enddate as end_date,
        orderqty as order_qty,
        productid as product_key,
        startdate as start_date,
        stockedqty as stocked_qty,
        scrappedqty as scrapped_qty,
        workorderid as work_order_key,
        modifieddate as modified_date,
        scrapreasonid as scrap_reason_key
    from source
)
select * from renamed
  