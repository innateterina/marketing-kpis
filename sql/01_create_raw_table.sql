DROP TABLE IF EXISTS raw_events;

CREATE TABLE raw_events (
    event_time_ms   BIGINT,
    visitor_id      BIGINT,
    event_type      TEXT,
    item_id         BIGINT,
    transaction_id  BIGINT
);
