-- 06_business_queries.sql
-- Example business queries

-- Top customers by lifetime value
SELECT user_id, email, lifetime_value
FROM analytics.customer_360
ORDER BY lifetime_value DESC
LIMIT 50;

-- Revenue by country
SELECT country, SUM(lifetime_value) AS revenue
FROM analytics.customer_360
GROUP BY country
ORDER BY revenue DESC;