{{ config(alias = 'stg_document', materialized='table') }}

with source as (
      select * from {{ source('production', 'Document') }}
),
renamed as (
    select


        documentnode as document_node,
        documentlevel as document_level,
        title,
        "Owner" as document_owner,
        folderflag as folder_flag,
        filename as file_name,
        fileextension as file_extension,
        revision,
        changenumber as change_number,
        status,
        documentsummary as document_summary,
        "Document" as document,
        rowguid,
        modifieddate as modfied_date

    from source
)
select * from renamed
  