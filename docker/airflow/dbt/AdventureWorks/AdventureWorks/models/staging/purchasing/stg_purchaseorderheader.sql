{{ config(alias = 'stg_purchaseorderheader', materialized='table') }}

with source as (
      select * from {{ source('purchasing', 'purchaseorderheader') }}
),
renamed as (
    select
        status,
        taxamt as tax_amt,
        freight as freight,
        shipdate as ship_date,
        subtotal as subtotal,
        totaldue as total_due,
        vendorid as vendor_key,
        orderdate as order_date,
        employeeid as employee_key,
        modifieddate as modified_date,
        shipmethodid as ship_method_key,
        revisionnumber as revision_number,
        purchaseorderid as purchase_order_key

    from source
)
select * from renamed