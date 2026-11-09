# Bank Customer Churn - Data Engineering Project

Pipeline: CSV -> Python ingestion -> PostgreSQL -> Kestra -> Dashboard

## Structure
```
docs/     proposal, architecture diagram, data dictionary
scripts/  extraction and cleaning code
sql/      DDL, quality checks, views
flows/    Kestra YAML flows
data/     source CSV (Bank_Customer_Churn.csv)
docker-compose.yml
.env.example
```

## Run locally
1. Install Docker Desktop.
2. `cp .env.example .env` and edit the passwords.
3. `docker compose up -d`
4. Open pgAdmin at http://localhost:8080 (login with PGADMIN_EMAIL / PGADMIN_PASSWORD).
5. Register server: Host `postgres`, Port `5432`, user/password/db from `.env`.
   (Use host `postgres`, the service name, because pgAdmin reaches the database over the internal Docker network `de_net`.)
6. Stop: `docker compose down` (data persists in the `pgdata` volume). `docker compose down -v` deletes data.

The files in `sql/` run automatically on the first start and create the `raw` and `analytics` schemas.
