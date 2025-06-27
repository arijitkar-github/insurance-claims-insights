-- sql/complex_queries.sql

-- 1. Total claim amount per customer
SELECT
  c.customer_id,
  c.name,
  SUM(cl.claim_amount) AS total_claims
FROM customers c
JOIN policies p ON p.customer_id = c.customer_id
JOIN claims cl ON cl.policy_id = p.policy_id
GROUP BY c.customer_id, c.name
ORDER BY total_claims DESC
LIMIT 10;

-- 2. Top 5 agents by policies sold
SELECT
  a.agent_name,
  COUNT(*) AS policies_sold
FROM agents a
JOIN policies p ON p.agent_id = a.agent_id
GROUP BY a.agent_name
ORDER BY policies_sold DESC
LIMIT 5;

-- 3. Monthly claims trend (last 12 months)
SELECT
  DATE_TRUNC('month', claim_date) AS month,
  COUNT(*) AS claims_count,
  AVG(claim_amount) AS avg_amount
FROM claims
WHERE claim_date >= (CURRENT_DATE - INTERVAL '1 year')
GROUP BY 1
ORDER BY 1;

-- 4. Rank customers by total payouts
SELECT
  customer_id,
  name,
  total_paid,
  RANK() OVER (ORDER BY total_paid DESC) AS payout_rank
FROM (
  SELECT
    c.customer_id,
    c.name,
    SUM(cl.claim_amount) AS total_paid
  FROM customers c
  JOIN policies p ON p.customer_id = c.customer_id
  JOIN claims cl ON cl.policy_id = p.policy_id
  GROUP BY c.customer_id, c.name
) sub
ORDER BY payout_rank
LIMIT 10;
