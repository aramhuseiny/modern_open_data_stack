
{{ config(alias = 'report-sale', materialized='table') }}

with products as (
    select * from {{ ref('dim_products')}}
), sales as (
    select * from {{ ref('fct_internalsales')}}
), customers as (
    select * from {{ ref('dim_customers')}}
),
final as (
    select 
        sales.sales_order_key,
        sales.order_qty,
        sales.line_total,
        sales.product_key,
        sales.unit_price,
        sales.special_offer_key,
        sales.unit_price_discount,
        sales.sales_order_detail_key,
        sales.carrier_tracking_number,
        sales.sub_total,
        sales.order_date,
        sales.freight,
        sales.customer_key,
        sales.territory_key,
        sales.credit_card_key,
        sales.ship_method_key,
        sales.sales_person_key,
        sales.currency_rate_key,
        products.product_name,
        products.product_color,
        products.product_weight,
        products.list_price,
        products.standard_cost,
        products.product_size,
        products.product_class,
        products.product_style,
        products.product_line,
        customers.title, 
        customers.first_name, 
        customers.middle_name, 
        customers.last_name, 
        customers.suffix, 
        customers.customer_alternate_key,
        customers.gender,
        customers.email_address


    from sales join products on sales.product_key= products.product_key
      join customers ON sales.customer_key= customers.customer_key
)
select * from final


