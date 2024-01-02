{{ config(alias = 'stg_salesorderheader', materialized='table') }}

with source as (
      select * from {{ source('sales', 'salesorderheader') }}
),
renamed as (
    select
        status,
        taxamt as tax_amt,
        "Comment" as sales_order_header_comment,
        duedate as due_date,
        freight,
        rowguid,
        shipdate as ship_date,
        subtotal as sub_total,
        totaldue as total_due,
        orderdate as order_date,
        customerid as customer_key,
        territoryid as territory_key,
        creditcardid as credit_card_key,
        modifieddate as modified_date,
        salesorderid as sales_order_key,
        shipmethodid as ship_method_key,
        accountnumber as account_number,
        salespersonid as sales_person_key,
        currencyrateid as currency_rate_key,
        revisionnumber as revision_number,
        billtoaddressid as bill_to_address_key,
        onlineorderflag as online_order_flag,
        shiptoaddressid as ship_to_address_key,
        salesordernumber as sales_order_number,
        purchaseordernumber purchase_order_number,
        creditcardapprovalcode as credit_card_approval_code

    from source
)
select * from renamed
  