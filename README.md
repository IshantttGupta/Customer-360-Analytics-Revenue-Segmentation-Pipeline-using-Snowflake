# Customer360 Data Warehouse (Snowflake)

## Project Overview

This repository demonstrates a layered Data Warehouse pattern (RAW → STAGING → ANALYTICS) implemented for Snowflake, with example SQL, sample data, and a Snowpark Python example for customer segmentation.

## Structure

- sql/: SQL files for DB setup, raw tables, sample data, staging, analytics, and business queries
- snowpark/: Snowpark Python code for feature engineering / segmentation
- architecture/: architecture diagram (add PNG)
- screenshots/: query result screenshots

## Quickstart

1. Load `sql/01_database_setup.sql` then the other SQL files in order.
2. Insert sample data from `sql/03_sample_data.sql` for dev.
3. Run transformations in `sql/04_staging_layer.sql` and `sql/05_analytics_layer.sql`.
4. Use `snowpark/customer_segmentation.py` as a reference for Snowpark jobs.

## Tech Stack
- Snowflake
- SQL
- Snowpark (Python)
