\c insurance_db

COPY customers(customer_id, name, join_date, country)
  FROM '/datasets/customers.csv' CSV HEADER;
COPY agents(agent_id, agent_name, region)
  FROM '/datasets/agents.csv' CSV HEADER;
COPY policies(policy_id, customer_id, agent_id, policy_type, start_date, end_date, premium_amount)
  FROM '/datasets/policies.csv' CSV HEADER;
COPY claims(claim_id, policy_id, claim_date, claim_amount, claim_status, fraud_flag)
  FROM '/datasets/claims.csv' CSV HEADER;
