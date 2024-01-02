{{ config(alias = 'stg_product', materialized='table') }}

with source as (
      select * from {{ source('production', 'product') }}
),
renamed as (
    select

        {{ adapter.quote("Name") }} as product_name,
        {{ adapter.quote("Size") }} as size,
        {{ adapter.quote("Class") }} as class,
        {{ manage_null_value(column_name = 'color', data_type = 'string') }} as color,
        {{ adapter.quote("Style") }} as style,
        {{ adapter.quote("weight") }} as weight,
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("makeflag") }} as make_flag,
        {{ adapter.quote("listprice") }} as list_price,
        {{ adapter.quote("productid") }} as product_key,
        {{ adapter.quote("productline") }} as product_line,
        {{ adapter.quote("sellenddate") }} as sell_end_date,
        {{ adapter.quote("modifieddate") }} as modified_date,
        {{ adapter.quote("reorderpoint") }} as reorder_point,
        {{ adapter.quote("standardcost") }} as standard_cost,
        {{ adapter.quote("productnumber") }} as product_number,
        {{ adapter.quote("sellstartdate") }} as sell_start_date,
        {{ adapter.quote("productmodelid") }} as productmodelkey,
        {{ adapter.quote("discontinueddate") }} as discontinued_date,
        {{ adapter.quote("safetystocklevel") }} as safety_stock_level,
        {{ adapter.quote("daystomanufacture") }} as days_to_manufacture,
        {{ adapter.quote("finishedgoodsflag") }} as finished_goods_flag,
        {{ adapter.quote("sizeunitmeasurecode") }} as size_unit_measure_code,
        {{ adapter.quote("productsubcategoryid") }} as productsubcategorykey,
        {{ adapter.quote("weightunitmeasurecode") }} as weight_unit_measure_code
    from source
)
select * from renamed
  