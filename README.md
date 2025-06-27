### Running via Docker

If you don’t have PostgreSQL installed locally, spin up a container:

```bash
# Pull and run Postgres 14
docker pull postgres:14
docker run --name pg-insights \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  -d postgres:14

# Load schema and data
cat sql/schema.sql | docker exec -i pg-insights psql -U postgres
docker cp datasets/. pg-insights:/datasets
docker exec -i pg-insights psql -U postgres -d insurance_db < sql/insert_data.sql

# Run sample queries
docker exec -i pg-insights psql -U postgres -d insurance_db -f sql/complex_queries.sql
docker exec -i pg-insights psql -U postgres -d insurance_db -f sql/health_checks.sql

