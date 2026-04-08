#  ELT Data Pipeline using dbt, Snowflake & Airflow

##  Overview

This project demonstrates an end-to-end **ELT (Extract, Load, Transform)** data pipeline using modern data engineering tools.

* **Snowflake** → Data Warehouse
* **dbt (Data Build Tool)** → Transformations & Testing
* **Airflow (Astronomer)** → Orchestration

The pipeline processes TPCH sample data and builds a clean **fact table (`fct_orders`)** for analytics.

---

##  Architecture

```
Source raw data
      ↓
Snowflake (Load)
      ↓
dbt (Transform: stg → int → fct)
      ↓
Airflow (Orchestration)
```

---

##  Tech Stack

* dbt Core (Data Transformation & Testing)
* Snowflake (Cloud Data Warehouse)
* Apache Airflow (Workflow Orchestration via Astronomer)
* Python (DAG Definition & Scheduling)
* Docker (Containerized Execution via Astro CLI)

---

##  Data Pipeline Flow

1. **Staging Layer**

   * `stg_tpch_orders`
   * `stg_tpch_lineitem`

2. **Intermediate Layer**

   * `int_order_items`
   * `int_order_items_summary`

3. **Mart Layer**

   * `fct_orders`

---

##  Data Quality Tests

Implemented using dbt:

* `not_null`
* `unique`
* `relationships`
* `accepted_values`
* Custom singular tests:

  * Discount validation
  * Date validation

---

##  Orchestration (Airflow)

* DAG: `dbt_dag`
* Schedule: `@daily`
* Automatically runs dbt models in dependency order

---

##  How to Run

### 1. Start Airflow (Astro)

```bash
astro dev start
```

### 2. Access UI

```
http://localhost:8080
```

### 3. Trigger DAG

* Go to `dbt_dag`
* Click **Trigger**

---

## Key Features

* Modular data modeling (staging → marts)
* Data quality checks using dbt tests
* Automated orchestration with Airflow DAGs
* Scalable architecture using modern data stack

---

## Learnings

* Built a production-style ELT pipeline
* Implemented data modeling using dbt
* Integrated Airflow with dbt
* Applied data quality checks

---

## Screenshots

### Airflow DAG
<img width="1512" height="982" alt="Screenshot 2026-04-04 at 1 28 41 PM" src="https://github.com/user-attachments/assets/94cbd589-00ba-4184-9799-27f256310488" />


### dbt Lineage
<img width="1512" height="982" alt="Screenshot 2026-04-04 at 2 08 58 PM" src="https://github.com/user-attachments/assets/aeddb507-add5-4d94-9008-c86ea946c682" />


### dbt Tests
<img width="1512" height="982" alt="Screenshot 2026-04-04 at 2 13 02 PM" src="https://github.com/user-attachments/assets/bbfebd5d-7294-48db-9768-56a1fffa1363" />


### Snowflake Output
<img width="1512" height="982" alt="Screenshot 2026-04-04 at 2 21 48 PM" src="https://github.com/user-attachments/assets/51ef3a0c-1565-4617-918c-4f541c6270c6" />

<img width="1512" height="982" alt="Screenshot 2026-04-04 at 2 22 10 PM" src="https://github.com/user-attachments/assets/b72480d1-2bcd-436f-a055-c6d9cea2b855" />

<img width="1512" height="982" alt="Screenshot 2026-04-04 at 2 29 02 PM" src="https://github.com/user-attachments/assets/442501b7-feaf-4cf0-92ef-270c16908fe8" />


---

##  Future Improvements

* Incremental models
* CI/CD integration (GitHub Actions)
* Alerting (Slack/Email)
* Data documentation using `dbt docs`

---

##  Author

Aryan Tambewagh
