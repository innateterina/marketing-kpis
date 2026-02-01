# **Marketing Performance KPIs (SQL)**

## **Overview**

This project analyses marketing performance using **event-level e-commerce data**.

The goal is to demonstrate a **SQL-first analytics workflow**:

from raw events to cleaned data, enriched transactions, and daily KPI fact tables ready for BI or reporting.

**The project focuses on ** **data modelling, data quality, and KPI logic** **, not dashboards.**

---

## **Dataset**

**Source:**

RetailRocket E-commerce Dataset (Kaggle)

https://www.kaggle.com/datasets/retailrocket/ecommerce-dataset

The dataset contains user-level events from an online store, including:

* page views
* add-to-cart actions
* purchases (transactions)
* timestamps
* user and item identifiers

**⚠️ ****Note:**

The raw events file (~2.7M rows) exceeds Excel limits and is processed in **PostgreSQL**.

Only sample CSVs are stored in the repository.

---

## **Project Structure**

## marketing-kpis/

├── data/
│   ├── raw_events.csv
│   ├── item_properties_part1.csv
│   └── item_properties_part2.csv
│
├── sql/
│   ├── 01_create_raw_table.sql
│   ├── 02_load_raw_events.sql
│   ├── 03_clean_events.sql
│   ├── 04_fact_daily.sql
│   ├── 05_data_quality_checks.sql
│   ├── 06_create_item_properties.sql
│   ├── 07_extract_item_prices.sql
│   └── 08_enrich_transactions.sql
│
├── screenshots/
│   ├── 01_project_structure_sql_pipeline.png
│   ├── 02_event_type_distribution.png
│   ├── 03_item_price_distribution_stats.png
│   ├── 04_transactions_enriched_sample.png
│   └── 05_fact_daily_metrics_sample.png
│
├── .gitignore
└── README.md

## **Data Pipeline**

### **1. Raw Layer**

* Raw events loaded into PostgreSQL (**raw_events**)
* Item metadata loaded from two CSV files (**item_properties_part1**, **item_properties_part2**)

### **2. Cleaning Layer**

* Normalised timestamps
* Standardised event types
* Identified valid purchase events
* Removed incomplete and invalid records

### **3. Enrichment Layer**

* Extracted item prices from semi-structured properties
* Converted price units
* Joined item prices to transaction events
* Created an enriched transaction table with revenue

### **4. Aggregation Layer**

* Built a daily fact table (**fact_daily**)
* Aggregated user activity and revenue metrics per day

---

## **Fact Table:** *

## **fact_daily**

The daily fact table contains:

* event_date
* active_users
* views
* add_to_cart_events
* transactions
* purchasers
* revenue
* **aov** (average order value)
* **purchase_user_cr_pct** (purchase conversion rate)

*This table is designed for **fast KPI analysis and BI integration** **.**

---

## **Key Metrics Calculated**

* Daily active users
* Funnel events (views → add to cart → purchase)
* Number of purchasers
* Revenue
* Average order value (AOV)
* Purchase conversion rate

---

## **Data Quality Checks**

Basic QA checks were performed, including:

* event type distribution
* missing revenue detection
* price value validation
* consistency between transactions and revenue

---

## **Screenshots**

The **/screenshots** folder contains:

1. **Project structure & SQL pipeline**
2. **Event type distribution**
3. **Item price distribution statistics**
4. **Sample of enriched transactions**
5. **Sample of daily KPI fact table**

These screenshots document each stage of the data pipeline.

---

## **Tools & Technologies**

* **PostgreSQL** — data processing and analytics
* **SQL** — joins, aggregations, window functions
* **VS Code** — development environment
* **GitHub** — version control and documentation

---

## **Summary**

This project demonstrates the ability to:

* work with large event-level datasets
* clean and validate raw data
* enrich transactions with external attributes
* build analytical fact tables
* prepare data for BI and reporting use cases
