# Eco Essentials Marketing Data Mart

## Project Overview
This project was built as part of a data warehousing consulting simulation for **Eco Essentials**, an eco-friendly cookware company. The goal was to take raw data from multiple sources and turn it into something useful for making business decisions.

We focused on understanding sales performance and how effective marketing emails are at driving purchases. The project walks through the full pipeline—from raw data to a final dashboard.

---

## Objectives
- Design a clean and scalable data warehouse
- Build ELT pipelines using modern tools
- Create a dimensional model (star schema)
- Add data quality checks and scheduling
- Deliver a dashboard with useful business insights

---

## Tech Stack
- **Data Sources**
  - PostgreSQL (Amazon RDS) – sales data
  - AWS S3 – marketing email data

- **Tools**
  - Fivetran – data ingestion
  - Snowflake – data warehouse
  - dbt – transformations and modeling
  - Tableau – dashboard (live connection)

---

## Data Warehouse Design

### Business Processes
- Sales transactions
- Marketing email engagement + conversions

### Fact Tables
- `eco_fact_sales`
- `eco_fact_marketing_events`

### Dimension Tables
- `eco_dim_customer`
- `eco_dim_product`
- `eco_dim_date`
- `eco_dim_campaign`
- 'eco_dim_time'
- 'eco_dim_event'
- 'eco_dim_email'

### Design Notes
- Defined a clear grain for each fact table
- Used surrogate keys to keep joins consistent
- Built conformed dimensions so both processes connect cleanly

---

## ELT Pipeline

### Extract & Load
- Pulled data from PostgreSQL and S3 using Fivetran
- Landed raw data into Snowflake

### Transform (dbt)
- Built out dimension and fact tables
- Used dbt utilities to generate surrogate keys

---

## Data Quality & Scheduling

### dbt Tests Used
- unique
- not_null
- accepted_values
- relationships

### Scheduling
- Fivetran sync runs every 24 hours
- dbt jobs run daily to keep everything updated

---

## Dashboard & Insights

I built a live Tableau dashboard connected to Snowflake that helps answer questions like:

- How are sales trending over time? (6 month period)
- Which marketing campaigns are actually working? (top campaigns by revenue)
- Where are customers located? (Top customer cities)
---

##  Key Takeaways
- Built a full end-to-end data pipeline (not just one piece of it)
- Got hands-on with tools used in real data teams
- Learned how to deal with messy/real-world data
- Turned raw data into something that actually tells a story

---

## Repo Structure
- `models/` – dbt models (dims, facts)
- `README.md` – this file

---

## Author
**Hayden Meek**  
Data Analytics @ Utah State University
**Jacob McBride**
Data Analytics @ Utah State University
---
