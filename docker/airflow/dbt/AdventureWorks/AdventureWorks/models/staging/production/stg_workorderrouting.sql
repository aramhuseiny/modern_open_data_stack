{{ config(alias = 'stg_workorderrouting', materialized='table') }}

with source as (
      select * from {{ source('production', 'workorderrouting') }}
),
renamed as (
    select
        productid as product_key,
        actualcost as actual_cost,
        locationid as location_key,
        plannedcost as planned_cost,
        workorderid as work_order_key,
        modifieddate as modified_date,
        actualenddate as actual_end_date,
        actualstartdate as actual_start_date,
        scheduledenddate as scheduled_end_date,
        actualresourcehrs as actual_resource_hrs,
        operationsequence as operation_sequence,
        scheduledstartdate as scheduled_start_date
    from source
)
select * from renamed
  