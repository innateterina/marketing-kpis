-- Load raw events data from CSV --
-- CSV file is not committed to GitHub (listed in .gitignore) --

\copy raw_events(event_time_ms, visitor_id, event_type, item_id, transaction_id)
FROM 'data/raw_events.csv'
WITH (FORMAT csv, HEADER true);
