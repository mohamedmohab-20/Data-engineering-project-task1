CREATE OR REPLACE VIEW analytics.v_churn_by_geography AS
SELECT geography, COUNT(*) AS customers,
       ROUND(100.0*AVG(exited::int),2) AS churn_rate_pct,
       ROUND(AVG(balance),2) AS avg_balance
FROM analytics.customers GROUP BY geography;

CREATE OR REPLACE VIEW analytics.v_churn_by_age_group AS
SELECT CASE WHEN age<30 THEN '18-29' WHEN age<40 THEN '30-39' WHEN age<50 THEN '40-49'
            WHEN age<60 THEN '50-59' ELSE '60+' END AS age_group,
       COUNT(*) AS customers, ROUND(100.0*AVG(exited::int),2) AS churn_rate_pct
FROM analytics.customers GROUP BY 1 ORDER BY 1;

CREATE OR REPLACE VIEW analytics.v_churn_by_products_activity AS
SELECT num_of_products, is_active_member, COUNT(*) AS customers,
       ROUND(100.0*AVG(exited::int),2) AS churn_rate_pct
FROM analytics.customers GROUP BY 1,2 ORDER BY 1,2;
