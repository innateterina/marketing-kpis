DROP TABLE IF EXISTS transactions_enriched;

CREATE TABLE transactions_enriched AS
SELECT
    e.event_time,
    e.event_date,
    e.visitor_id,
    e.transaction_id,
    e.item_id,

    ip.price,
    ip.price AS revenue

FROM clean_events e
LEFT JOIN item_prices ip
    ON ip.item_id = e.item_id

WHERE e.event_type = 'transaction'
  AND e.transaction_id IS NOT NULL;

SELECT COUNT(*) FROM transactions_enriched;
SELECT
    COUNT(*) AS total_rows,
    COUNT(revenue) AS with_revenue,
    COUNT(*) - COUNT(revenue) AS missing_revenue
FROM transactions_enriched;