{{ config(alias = 'fct_internalsales', materialized='table') }}

with sales  as (
    select * from {{ ref('stg_salesorderheader')}}
),sale_detail as (
    select * from {{ ref('stg_salesorderdetail')}}
),
final as (
    select 
        sale_detail.sales_order_key,
        sale_detail.order_qty,
        sale_detail.line_total,
        sale_detail.product_key,
        sale_detail.unit_price,
        sale_detail.special_offer_key,
        sale_detail.unit_price_discount,
        sale_detail.sales_order_detail_key,
        sale_detail.carrier_tracking_number,
        sales.sub_total,
        sales.order_date,
        sales.freight,
        sales.customer_key,
        sales.territory_key,
        sales.credit_card_key,
        sales.ship_method_key,
        sales.sales_person_key,
        sales.currency_rate_key


    from sales join sale_detail on sale_detail.sales_order_key =sales.sales_order_key
)
select * from final


