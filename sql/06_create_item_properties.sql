DROP TABLE IF EXISTS raw_item_properties;

CREATE TABLE raw_item_properties (
    event_time_ms BIGINT,
    item_id       BIGINT,
    property      TEXT,
    value         TEXT
);

\copy raw_item_properties(event_time_ms, item_id, property, value)
FROM 'data/item_properties_part1.csv'
WITH (FORMAT csv, HEADER true);

\copy raw_item_properties(event_time_ms, item_id, property, value)
FROM 'data/item_properties_part2.csv'
WITH (FORMAT csv, HEADER true);
