{{ config(alias = 'stg_document', materialized='table') }}

with source as (
      select * from {{ source('production', 'Document') }}
),
renamed as (
    select


        {{ adapter.quote("documentnode") }},
        {{ adapter.quote("documentlevel") }},
        {{ adapter.quote("title") }},
        {{ adapter.quote("Owner") }},
        {{ adapter.quote("folderflag") }},
        {{ adapter.quote("filename") }},
        {{ adapter.quote("fileextension") }},
        {{ adapter.quote("revision") }},
        {{ adapter.quote("changenumber") }},
        {{ adapter.quote("status") }},
        {{ adapter.quote("documentsummary") }},
        {{ adapter.quote("Document") }},
        {{ adapter.quote("rowguid") }},
        {{ adapter.quote("modifieddate") }}

    from source
)
select * from renamed
  