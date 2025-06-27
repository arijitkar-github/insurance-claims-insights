-- sql/health_checks.sql
-- Switch to the insurance_db
\c insurance_db

-- 1. Find any customers with NULL names or countries
SELECT * FROM customers
WHERE name IS NULL OR country IS NULL;

-- 2. Policies referencing non‑existent customers or agents
SELECT p.*
FROM policies p
LEFT JOIN customers c ON p.customer_id = c.customer_id
WHERE c.customer_id IS NULL
UNION ALL
SELECT p.*
FROM policies p
LEFT JOIN agents a ON p.agent_id = a.agent_id
WHERE a.agent_id IS NULL;

-- 3. Claims with amounts outside expected bounds (e.g. > ₹30,000)
SELECT * FROM claims
WHERE claim_amount > 30000;

-- 4. Any claims dated outside their policy period
SELECT cl.*
FROM claims cl
JOIN policies p ON cl.policy_id = p.policy_id
WHERE cl.claim_date < p.start_date
   OR cl.claim_date > p.end_date;

-- 5. Summarize fraud flags by policy and customer
SELECT
  p.policy_id,
  COUNT(*) FILTER (WHERE fraud_flag = 'Y') AS fraud_count,
  COUNT(*) FILTER (WHERE fraud_flag = 'N') AS legit_count
FROM claims cl
JOIN policies p ON cl.policy_id = p.policy_id
GROUP BY p.policy_id
HAVING COUNT(*) FILTER (WHERE fraud_flag = 'Y') > 0
ORDER BY fraud_count DESC;