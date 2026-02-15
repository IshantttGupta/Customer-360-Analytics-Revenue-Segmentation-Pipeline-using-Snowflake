-- 05_analytics_layer.sql
-- Build analytics-ready tables and aggregates

CREATE OR REPLACE TABLE analytics.customer_360 AS
SELECT
    u.user_id,
    u.user_name,
    u.country,
    u.signup_date,
    COUNT(DISTINCT e.event_id) AS total_events,
    SUM(p.amount) AS total_revenue,
    MAX(p.payment_date) AS last_payment_date
FROM raw.users u
LEFT JOIN staging.events_clean e
    ON u.user_id = e.user_id
LEFT JOIN staging.payments_clean p
    ON u.user_id = p.user_id
GROUP BY
    u.user_id,
    u.user_name,
    u.country,
    u.signup_date;
