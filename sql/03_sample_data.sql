-- 03_sample_data.sql
-- Small sample inserts for development/testing

INSERT INTO raw.users (user_id, email, created_at, country) VALUES
('u1','ishant1535@gmail.com', '2024-01-02T10:00:00Z', 'US'),
('u2','yuno12@gmail.com', '2024-02-05T12:30:00Z', 'CA');

INSERT INTO raw.events (event_id, user_id, event_type, event_ts, properties) VALUES
('e1','u1','login','2024-02-01T09:00:00Z', PARSE_JSON('{"device":"mobile"}')),
('e2','u1','purchase','2024-02-01T09:05:00Z', PARSE_JSON('{"sku":"sku-123","value":49.99}'));

INSERT INTO raw.payments (payment_id, user_id, amount, currency, paid_at) VALUES
('p1','u1',49.99,'USD','2024-02-01T09:05:30Z');