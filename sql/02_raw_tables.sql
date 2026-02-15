-- 02_raw_tables.sql
-- Raw layer: source-like tables (keep as landed/raw copy)

CREATE OR REPLACE TABLE raw.users ( user_id INT, user_name STRING, email STRING, signup_date DATE, country STRING );

CREATE OR REPLACE TABLE raw.events ( event_id INT, user_id INT, event_type STRING, event_time TIMESTAMP );

CREATE OR REPLACE TABLE raw.payments ( payment_id INT, user_id INT, amount NUMBER(10,2), payment_date DATE, status STRING );