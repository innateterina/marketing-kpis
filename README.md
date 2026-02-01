# **Marketing Performance KPIs (SQL)**

## **Overview**

This project analyses marketing and sales performance using **event-level e-commerce data**.

The main goal is to transform raw user events into **clean, reliable daily KPIs** that can be used for reporting, dashboards, or further analysis.

**The project follows a ** **real-world SQL analytics workflow** **:**

**raw events → cleaned events → enriched transactions → daily fact table**

All transformations and calculations are done in **PostgreSQL**.

## **Data Source**

**RetailRocket E-commerce Dataset (Kaggle)**

https://www.kaggle.com/datasets/retailrocket/ecommerce-dataset

The dataset contains user-level events from an online store, including:

* page views
* add-to-cart actions
* transactions
* timestamps
* user and item identifiers

****Note**

The raw dataset (**raw_events.csv**, ~2.7M rows) is not included in this repository due to size limitations.

Data was loaded locally into PostgreSQL and processed using SQL scripts.

## **Project Structure**

marketing-kpis/
├── data/
│   ├── raw_events.csv
│   ├── item_properties_part1.csv
│   └── item_properties_part2.csv
├── sql/
│   ├── 01_create_raw_table.sql
│   ├── 02_load_raw_events.sql
│   ├── 03_clean_events.sql
│   ├── 04_fact_daily.sql
│   ├── 05_data_quality_checks.sql
│   ├── 06_create_item_properties.sql
│   ├── 07_extract_item_prices.sql
│   └── 08_enrich_transactions.sql
├── screenshots/
│   ├── 01_project_structure_sql_pipeline.png
│   ├── 02_event_type_distribution.png
│   ├── 03_item_price_distribution_stats.png
│   ├── 04_transactions_enriched_sample.png
│   └── 05_fact_daily_metrics_sample.png

├── .gitignore
└── README.md


## **Data Processing Pipeline**

### **1. Raw events**

* Loaded raw user events into PostgreSQL
* Preserved original structure for traceability

### **2. Data cleaning**

* Normalised timestamps
* Filtered invalid records
* Flagged purchase events
* Ensured consistent data types

### **3. Item price extraction**

* Combined item properties from two source files
* Extracted numeric price values
* Converted prices to standard currency units

### **4. Transaction enrichment**

* Joined transactions with item prices
* Created a clean transaction-level dataset with revenue

### **5. Daily fact table**

* Aggregated data by day
* Calculated key metrics for reporting and analysis

## **Fact Table:**

## **fact_daily**

The final table contains daily marketing and sales metrics:

* event_date
* active_users
* views
* add_to_cart_events
* transactions
* purchasers
* revenue
* **aov** (Average Order Value)
* **purchase_user_cr_pct** (Purchase conversion rate)

This structure supports fast KPI analysis and BI reporting.

## **Key Checks & Validation**

Basic data quality checks were performed:

* event type distribution validation
* missing revenue detection after enrichment
* price value sanity checks (min / median / max)
* daily aggregation consistency

## **Results & Insights**

* The dataset contains **2.7M+ user events**, mostly page views.
* Only a small fraction of users complete purchases, which is typical for e-commerce funnels.
* Revenue and transactions show clear daily fluctuations.
* Average order value remains relatively stable across days.

## **Tools & Technologies**

* **SQL (PostgreSQL)** - data processing and analytics
* **Git** - version control
* **VS Code** - development environment

## **Screenshots**

Key screenshots are available in the **/screenshots** folder:

* SQL project structure
* Event type distribution
* Item price statistics
* Enriched transaction sample
* Final daily KPI metrics

## **Summary**

This project demonstrates the ability to:

* work with large event-level datasets
* clean and validate raw data
* enrich transactions with semi-structured attributes
* build analytical fact tables using SQL
* prepare data for BI and reporting use cases
