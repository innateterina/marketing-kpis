DROP TABLE IF EXISTS fact_daily;

CREATE TABLE fact_daily AS
WITH daily_events AS (
    SELECT
        event_date,
        COUNT(DISTINCT visitor_id)                         AS active_users,
        COUNT(*) FILTER (WHERE event_type = 'view')        AS views,
        COUNT(*) FILTER (WHERE event_type = 'addtocart')   AS add_to_cart_events,
        COUNT(*) FILTER (WHERE event_type = 'transaction') AS transactions,
        COUNT(DISTINCT visitor_id) FILTER (WHERE event_type = 'transaction') AS purchasers
    FROM clean_events
    GROUP BY event_date
),
daily_revenue AS (
    SELECT
        event_date,
        SUM(revenue) AS revenue
    FROM transactions_enriched
    GROUP BY event_date
)
SELECT
    e.event_date,
    e.active_users,
    e.views,
    e.add_to_cart_events,
    e.transactions,
    e.purchasers,

    COALESCE(r.revenue, 0) AS revenue,

    CASE WHEN e.transactions > 0
        THEN COALESCE(r.revenue, 0) / e.transactions
        ELSE 0
    END AS aov,

    ROUND((e.purchasers::numeric / NULLIF(e.active_users, 0)) * 100, 3) AS purchase_user_cr_pct
FROM daily_events e
LEFT JOIN daily_revenue r
    ON r.event_date = e.event_date
ORDER BY e.event_date;
