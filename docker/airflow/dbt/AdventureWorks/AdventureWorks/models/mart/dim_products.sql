{{ config(alias = 'dim_products', materialized='table') }}

with products as (
    select * from {{ ref('stg_product')}}
),product_models as (
    select * from {{ ref('stg_productmodel')}}
),
final as (
    select 
        products.product_key,
        products.product_name,
        products.product_number,
        products.color as product_color,
        products.weight as product_weight,
        products.list_price,
        products.standard_cost,
        products.size as product_size,
        products.product_class,
        products.style as product_style,
        products.product_line

    from products join product_models on product_models.product_model_key = products.product_model_key
)
select * from final