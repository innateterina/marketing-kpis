DROP TABLE IF EXISTS fact_daily;

CREATE TABLE fact_daily AS
SELECT
    event_date,
    COUNT(DISTINCT visitor_id) AS active_users,
    SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS views,
    SUM(CASE WHEN event_type = 'addtocart' THEN 1 ELSE 0 END) AS add_to_cart_events,
    SUM(CASE WHEN event_type = 'transaction' THEN 1 ELSE 0 END) AS transactions,

    COUNT(DISTINCT CASE WHEN event_type = 'transaction' THEN visitor_id END) AS purchasers,

    ROUND(
      (COUNT(DISTINCT CASE WHEN event_type = 'transaction' THEN visitor_id END)::numeric
        / NULLIF(COUNT(DISTINCT visitor_id), 0)) * 100
    , 3) AS purchase_user_cr_pct

FROM clean_events
GROUP BY 1
ORDER BY 1;
