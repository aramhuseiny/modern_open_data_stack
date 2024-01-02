{{ config(alias = 'stg_product', materialized='table') }}

with source as (
      select * from {{ source('production', 'product') }}
),
renamed as (
    select

        "Name" as product_name,
        "Size" as size,
        "Class" as product_class,
        {{ manage_null_value(column_name = 'color', data_type = 'string') }} as color,
        "Style" as style,
        weight as weight,
        rowguid,
        makeflag as make_flag,
        listprice as list_price,
        productid as product_key,
        productline as product_line,
        sellenddate as sell_end_date,
        modifieddate as modified_date,
        reorderpoint as reorder_point,
        standardcost as standard_cost,
        productnumber as product_number,
        sellstartdate as sell_start_date,
        productmodelid as productmodelkey,
        discontinueddate as discontinued_date,
        safetystocklevel as safety_stock_level,
        daystomanufacture as days_to_manufacture,
        finishedgoodsflag as finished_goods_flag,
        sizeunitmeasurecode as size_unit_measure_code,
        productsubcategoryid as productsubcategorykey,
        weightunitmeasurecode as weight_unit_measure_code
    from source
)
select * from renamed
  