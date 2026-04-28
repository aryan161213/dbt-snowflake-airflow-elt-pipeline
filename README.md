#  ELT Data Pipeline using dbt, Snowflake & Airflow

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Tech Stack](#tech-stack)
- [Data Pipeline Flow](#data-pipeline-flow)
- [Data Quality Tests](#data-quality-tests)
- [Orchestration (Airflow)](#orchestration-airflow)
- [How to Run](#how-to-run)
- [Key Features](#key-features)
- [Learnings](#learnings)
- [Screenshots](#screenshots)
  - [Airflow DAG](#airflow-dag)
  - [dbt Lineage](#dbt-lineage)
  - [dbt Tests](#dbt-tests)
  - [Snowflake Output](#snowflake-output)
- [Future Improvements](#future-improvements)
- [Author](#author)

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

``` bash
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


<img width="1512" height="982" alt="AD2559A0-838E-41A5-8884-2702EBC5E8AB" src="https://github.com/user-attachments/assets/c2cc6695-0c6f-4437-af8f-f65f6fd74472" />

---

<img width="1512" height="982" alt="AD2559A0-838E-41A5-8884-2702EBC5E8AB" src="https://github.com/user-attachments/assets/c2cc6695-0c6f-4437-af8f-f65f6fd74472" />



---

##  Future Improvements

* Incremental models
* CI/CD integration (GitHub Actions)
* Alerting (Slack/Email)
* Data documentation using `dbt docs`

---

##  Author

Aryan Tambewagh
