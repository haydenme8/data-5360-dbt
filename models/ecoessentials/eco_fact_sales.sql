{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
) }}

SELECT
    d.date_key,
    p.product_key,
    c.customer_key,
    ca.campaign_key,
    o.order_id,
    o.quantity,
    o.discount,
    o.price_after_discount,
    pt.price

FROM {{ source('ecoessentials_landing', 'order_line') }} o
LEFT JOIN {{ source('ecoessentials_landing', 'product') }} pt on o.product_id = pt.product_id
LEFT JOIN {{ source('ecoessentials_landing', 'ORDER') }} ord on o.order_id = ord.order_id
INNER JOIN {{ ref('eco_dim_product') }} p ON pt.product_id = p.product_id 
INNER JOIN {{ ref('eco_dim_customer') }} c ON ord.customer_id = c.customer_id 
INNER JOIN {{ ref('eco_dim_campaign') }} ca ON o.campaign_id = ca.campaign_id 
INNER JOIN {{ ref('eco_dim_date') }} d ON CAST(ord.order_timestamp AS DATE) = d.date_day

