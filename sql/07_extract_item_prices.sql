-- Extract item prices from item_properties
-- Price is stored in property_id = 364
-- Value is stored in thousands

DROP TABLE IF EXISTS item_prices;

CREATE TABLE item_prices AS
SELECT
    item_id,
    value::numeric / 1000 AS price
FROM raw_item_properties
WHERE property = '364'
  AND value ~ '^[0-9]+$';

-- QA checks for extracted prices
SELECT
    COUNT(*) AS rows_cnt,
    MIN(price) AS min_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) AS median_price,
    MAX(price) AS max_price
FROM item_prices;
