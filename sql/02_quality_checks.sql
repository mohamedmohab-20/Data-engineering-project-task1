-- Run after ingestion; every query should return 0
SELECT COUNT(*) AS duplicate_customers FROM (
  SELECT customer_id FROM raw.bank_customer_churn GROUP BY customer_id HAVING COUNT(*) > 1) d;
SELECT COUNT(*) AS null_critical FROM raw.bank_customer_churn
  WHERE customer_id IS NULL OR exited IS NULL OR geography IS NULL;
SELECT COUNT(*) AS bad_flags FROM raw.bank_customer_churn
  WHERE has_cr_card NOT IN (0,1) OR is_active_member NOT IN (0,1) OR exited NOT IN (0,1);
SELECT COUNT(*) AS out_of_range FROM raw.bank_customer_churn
  WHERE credit_score NOT BETWEEN 300 AND 850 OR age < 18 OR balance < 0;
