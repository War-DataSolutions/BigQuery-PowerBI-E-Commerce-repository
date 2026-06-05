# Global E-Commerce Revenue & Customer Analytics
![E-Commerce Dashboard](dashboard.png)

## Project Overview
Since production-level corporate e-commerce data is highly confidential, I designed and simulated a real-world messy dataset with 4,000 transaction rows inside Google BigQuery. This project demonstrates an end-to-end analytics workflow—handling structural data anomalies, performing multi-region cloud warehousing, and deploying executive business intelligence layer.

## Tech Stack Used
* **Cloud Data Warehouse:** Google BigQuery
* * **Data Transformation:** SQL (DBT-style staging architecture)* **Business Intelligence:** Microsoft Power BI Desktop
---

## Data Pipeline Architecture
### 1. Raw Injection Layer (`01_raw_table_generation.sql`)
Generated simulated transaction arrays with built-in data quality challenges like missing values (`NULL` constraints) in product names and baseline unit prices across 5 distinct shopping states.

### 2. DBT Staging Transformation Layer (`02_dbt_staging_model.sql`)
Engineered a clean schema layer inside BigQuery to enforce data integrity before BI consumption:
* Handled missing product strings using `COALESCE(product_name, 'Unknown Product')`.
* Resolved unpriced records with a baseline median price logic using `COALESCE(unit_price, 25.00)`.
* Calculated exact financial line items via `ROUND(quantity_ordered * price, 2)` to eliminate decimal float errors.
  
### 3. Executive Visualization Layer
Directly extracted the finalized staging table into Power BI using service account authentication. Developed critical core measures:
* **Total Sales:** Core gross revenue calculation.
* * **Average Order Value (AOV):** Dynamic cross-filtered metric tracking individual basket value.
* * **State Performance Matrix:** Implemented visual conditional data bars to immediately highlight the most profitable geographical zones.
----
## How to Review
1. Open `01_raw_table_generation.sql` to check raw array logic.
2. Open `02_dbt_staging_model.sql` to inspect data cleaning and business transformations.
