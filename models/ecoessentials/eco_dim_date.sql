{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("1990-01-01", "2050-12-31") }}
)

SELECT
date_day as date_key,
date_day,
day_of_month,
month_name as month,
year_number
from cte_date