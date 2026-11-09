-- Raw landing table (1:1 with the CSV, loaded by the Python ingestion script)
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS analytics;

CREATE TABLE IF NOT EXISTS raw.bank_customer_churn (
    row_number        INTEGER,
    customer_id       BIGINT,
    surname           VARCHAR(100),
    credit_score      INTEGER,
    geography         VARCHAR(50),
    gender            VARCHAR(20),
    age               INTEGER,
    tenure            INTEGER,
    balance           NUMERIC(14,2),
    num_of_products   INTEGER,
    has_cr_card       SMALLINT,
    is_active_member  SMALLINT,
    estimated_salary  NUMERIC(14,2),
    exited            SMALLINT,
    ingested_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Clean table (typed, constrained, deduplicated)
CREATE TABLE IF NOT EXISTS analytics.customers (
    customer_id       BIGINT PRIMARY KEY,
    surname           VARCHAR(100) NOT NULL,
    credit_score      INTEGER CHECK (credit_score BETWEEN 300 AND 850),
    geography         VARCHAR(50) NOT NULL,
    gender            VARCHAR(20) NOT NULL,
    age               INTEGER CHECK (age BETWEEN 18 AND 100),
    tenure            INTEGER CHECK (tenure BETWEEN 0 AND 10),
    balance           NUMERIC(14,2) CHECK (balance >= 0),
    num_of_products   INTEGER CHECK (num_of_products BETWEEN 1 AND 4),
    has_cr_card       BOOLEAN NOT NULL,
    is_active_member  BOOLEAN NOT NULL,
    estimated_salary  NUMERIC(14,2) CHECK (estimated_salary >= 0),
    exited            BOOLEAN NOT NULL
);
