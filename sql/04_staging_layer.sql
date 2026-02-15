-- 04_staging_layer.sql
-- Transform raw data into cleaned staging tables
CREATE OR REPLACE TABLE staging.users_clean AS
SELECT
    user_id,
    LOWER(email) AS email,
    TRY_TO_TIMESTAMP(created_at) AS created_at,
    country
FROM raw.users;


CREATE OR REPLACE TABLE staging.events_clean AS
SELECT
    event_id,
    user_id,
    event_type,
    TRY_TO_TIMESTAMP(event_ts) AS event_ts,
    properties
FROM raw.events
WHERE event_type IS NOT NULL;


CREATE OR REPLACE TABLE staging.payments_clean AS
SELECT
    payment_id,
    user_id,
    amount,
    currency,
    TRY_TO_TIMESTAMP(paid_at) AS paid_at
FROM raw.payments;
