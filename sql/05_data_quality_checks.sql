-- total rows
SELECT COUNT(*) FROM fact_daily;

-- date range
SELECT MIN(event_date), MAX(event_date) FROM fact_daily;

-- total transactions should match raw
SELECT SUM(transactions) AS total_transactions FROM fact_daily;

-- check for nulls
SELECT COUNT(*) 
FROM fact_daily
WHERE event_date IS NULL
   OR active_users IS NULL;

-- conversion sanity
SELECT *
FROM fact_daily
WHERE purchase_user_cr_pct > 100;
