{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
)}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['customer_id', 'customer_first_name']) }} as customer_key,
    c.customer_id,
    m.subscriberid as subscriber_id,
    c.customer_first_name,
    c.customer_last_name,
    c.customer_phone,
    c.customer_address,
    c.customer_city,
    c.customer_state,
    c.customer_zip,
    c.customer_country,
    c.customer_email
FROM {{ source('ecoessentials_landing', 'customer') }} c
 LEFT JOIN {{ source('marketing_landing', 'marketingemails')}} m
 ON try_to_number(c.customer_id) = try_to_number(m.customerid)