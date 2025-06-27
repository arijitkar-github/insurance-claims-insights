# Insurance Claims Insights with PostgreSQL

🚀 **Project Objective**  
To build a cloud‑ready analytics lab on PostgreSQL that models an insurance‑claims workflow, ingests CSV data, and delivers advanced SQL insights and data quality checks.

---

🏗️ **Schema Overview**

- **Customers**: Master data with demographics
- **Agents**: Sales reps and regions
- **Policies**: Links customers to agents, covers term and premium
- **Claims**: Events tied to policies, with status and fraud flags

---

⚙️ **Technologies Used**  
| Tool | Purpose |
|--------------|----------------------------------------|
| PostgreSQL | Relational database |
| Docker | Containerized Postgres for portability |
| SQL | DDL, DML, complex queries |
| Git & GitHub | Version control and collaboration |
| CSV | Source data exports |

---

🔍 **Key Features**

- ✅ Multi‑table design with foreign‑key relationships
- ✅ Bulk data loading via `COPY` from CSVs
- ✅ Analytical queries: joins, CTEs, window functions
- ✅ Data health checks and fraud‑flag analysis
- ✅ Migration script for schema evolution

---

📁 **Repo Structure**

📁 **Repo Structure**

```text
insurance-claims-insights/
├── datasets/                  # Raw CSV exports
├── diagrams/                  # ERD diagram & sample outputs
├── sql/                       # All SQL scripts
│   ├── schema.sql             # CREATE DATABASE & TABLES
│   ├── insert_data.sql        # CSV → table loads
│   ├── complex_queries.sql    # Business‑insight queries
│   ├── health_checks.sql      # Data‑quality & fraud checks
│   └── migration_script.sql   # ALTER TABLE examples
└── README.md                  # Project overview & setup



---


```
