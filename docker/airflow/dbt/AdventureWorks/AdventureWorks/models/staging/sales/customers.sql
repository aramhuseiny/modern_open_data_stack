{{ config(alias = 'customers', materialized='table') }}

WITH source
AS (
	SELECT *
	FROM {{ source('sales', 'customer') }}
	)

SELECT *
FROM source