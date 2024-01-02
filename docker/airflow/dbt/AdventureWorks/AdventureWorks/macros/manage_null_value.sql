{%- macro manage_null_value(column_name, data_type = "string") -%}
    {%- if data_type == "string" -%}
        case {{column_name}} is null then 'NA' else {{column_name}} end
    {%- elif data_type == "numeric" -%}
        case {{column_name}} is null then 0 else {{column_name}} end
    {%- else -%}
        {{column_name}} 
    {%- endif -%}
{%- endmacro -%}