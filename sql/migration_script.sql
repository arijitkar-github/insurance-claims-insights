-- sql/migration_script.sql
-- Switch to the target database
\c insurance_db

-- 1. Add a new column for customer risk scoring
ALTER TABLE customers
  ADD COLUMN risk_score NUMERIC DEFAULT 0;

-- 2. Backfill risk_score based on total claims
UPDATE customers
SET risk_score = sub.total_claims
FROM (
  SELECT
    c.customer_id,
    SUM(cl.claim_amount) AS total_claims
  FROM customers c
  JOIN policies p ON p.customer_id = c.customer_id
  JOIN claims cl ON cl.policy_id = p.policy_id
  GROUP BY c.customer_id
) sub
WHERE customers.customer_id = sub.customer_id;

-- 3. Create an index to speed up queries on risk_score
CREATE INDEX idx_customers_risk_score ON customers(risk_score);
