DROP TABLE IF EXISTS clean_events;

CREATE TABLE clean_events AS
SELECT
    to_timestamp(event_time_ms / 1000) AS event_time,
    DATE(to_timestamp(event_time_ms / 1000)) AS event_date,
    visitor_id,
    event_type,
    item_id,
    CASE
        WHEN event_type = 'transaction' THEN 1
        ELSE 0
    END AS is_purchase,
    transaction_id
FROM raw_events
WHERE event_type IN ('view', 'addtocart', 'transaction')
  AND visitor_id IS NOT NULL;
  