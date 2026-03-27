{{ config(
    materialized = 'table',
    schema = 'dw_ecoessentials'
)}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['campaign_id', 'campaign_name']) }} as campaign_key,
    c.campaign_id,
    c.campaign_name,
    c.campaign_discount
FROM {{ source('ecoessentials_landing', 'promotional_campaign') }} c