{{ config(alias = 'customers', materialized='view') }}

WITH source
AS (
	SELECT *
	FROM {{ source('sales', 'customer') }}
	)

SELECT *
FROM source