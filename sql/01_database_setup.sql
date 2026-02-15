-- 01_database_setup.sql
CREATE DATABASE customer360_dw;
USE DATABASE customer360_dw;

CREATE SCHEMA raw;
CREATE SCHEMA staging;
CREATE SCHEMA analytics;


-- Grant basic rights (example, adapt to your org's roles)
-- GRANT USAGE ON DATABASE customer360_dw TO ROLE ANALYST;