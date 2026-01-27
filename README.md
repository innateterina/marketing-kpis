### **Marketing Performance KPIs**

> Raw event-level dataset contained over 2.7M rows, which exceeds Excel limits.

> Data was processed and aggregated in PostgreSQL before KPI calculation.

### Data source

This project uses the RetailRocket e-commerce dataset from Kaggle.

The raw file (`raw_events.csv`, ~2.7M rows) is not included in this repository due to size.
Data was loaded into PostgreSQL and processed using SQL scripts.

# **Marketing Performance KPIs**

**CPA, ROAS, LTV & Retention Analysis**

## **Overview**

This project focuses on analysing marketing performance using event-level e-commerce data.

The goal is to calculate key marketing KPIs and understand how effective marketing activities are over time.

The project is built around **SQL-first analytics** and simulates a real-world analytics workflow:

raw events → cleaned data → aggregated fact tables → business insights.

---

## **Business Questions**

This analysis answers the following questions:

* How much does it cost to acquire a customer (CPA)?
* How much revenue do marketing activities generate (ROAS)?
* What is the lifetime value (LTV) of customers?
* How well do users retain after the first interaction (D1 / D7 retention)?
* How marketing performance changes over time

---

## **Dataset**

**Source:**

RetailRocket E-commerce Dataset (Kaggle)

**Data description:**

The dataset contains user-level event data from an e-commerce platform, including:

* page views
* product interactions
* purchases
* timestamps
* user and item identifiers

**⚠️ ****Note:**

The raw dataset (**raw_events.csv**, ~2.7M rows) is **not included in this repository** due to size limitations.

The file was loaded locally into PostgreSQL for analysis.

Dataset link:

https://www.kaggle.com/datasets/retailrocket/ecommerce-dataset

---

## **Project Structure**

## marketing-performance-kpis/

├── data/
│   └── README.md              # data description and source
├── sql/
│   ├── 01_create_raw_tables.sql
│   ├── 02_clean_events.sql
│   ├── 03_fact_daily.sql
│   ├── 04_kpi_queries.sql
│   └── 05_retention_analysis.sql
├── screenshots/
│   ├── dashboard_overview.png
│   ├── revenue_over_time.png
│   ├── top_countries.png
│   └── top_products.png
├── README.md
└── .gitignore

## **Data Model**

### **Raw layer**

* raw_events
  * user_id
  * event_type
  * item_id
  * timestamp
  * price

### **Aggregated layer**

* fact_daily
  * event_date
  * total_revenue
  * total_orders
  * unique_users
  * sessions

This structure allows fast KPI calculations and easy integration with BI tools.

---

## **Key KPIs**

The following metrics are calculated:

* **Revenue**
* **Orders**
* **CPA (Cost per Acquisition)** *(simulated ad spend)*
* **ROAS (Return on Ad Spend)**
* **Customer LTV**
* **Retention D1 / D7**

All KPIs are calculated using SQL queries on aggregated fact tables.

---

## **Tools & Technologies**

* **SQL (PostgreSQL)** — main analytics tool
* **Excel** — KPI reporting and visualisation
* **GitHub** — version control and documentation

---

## **Results & Insights**

Some key insights from the analysis:

* Revenue shows strong seasonality with clear peaks in Q4.
* A small number of countries generate the majority of revenue.
* Customer retention drops significantly after the first day, highlighting the importance of remarketing.
* High-revenue periods are driven by a small set of top products.

---

## **Screenshots**

Screenshots of the final KPI dashboard and charts are available in the **/screenshots** folder:

* KPI cards overview
* Revenue over time
* Top countries by revenue
* Top products by revenue



> *“Built an event-level marketing dataset, enriched transactions with item prices from semi-structured properties, and aggregated daily KPIs including revenue, AOV and ARPU using PostgreSQL.”*
>
