# Video Walkthrough Script (3-5 min, one student records)

**0:00-0:30** Introduce the team (names/roles).
**0:30-2:00** Open Phase1_Project_Proposal.pdf: dataset (Bank Customer Churn, 10,000 rows, 14 columns), the 3 questions, the architecture diagram, planned tables.
**2:00-3:00** Terminal: `cp .env.example .env`, then `docker compose up -d`, then `docker compose ps` (both containers running, postgres healthy).
**3:00-4:30** Browser at ://localhttphost:8080: log into pgAdmin, register server (host `postgres`, port 5432), expand Databases > bank_churn > Schemas, showing `raw` and `analytics` tables.
**4:30-5:00** Mention the persistent volume and that every teammate ran it on their own laptop.
