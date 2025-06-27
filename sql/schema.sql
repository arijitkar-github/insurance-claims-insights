-- sql/schema.sql
-- Create the insurance_db database and connect to it
CREATE DATABASE insurance_db;
\c insurance_db

-- Customers master table
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  join_date DATE NOT NULL,
  country TEXT NOT NULL
);

-- Agents table
CREATE TABLE agents (
  agent_id SERIAL PRIMARY KEY,
  agent_name TEXT NOT NULL,
  region TEXT NOT NULL
);

-- Policies table
CREATE TABLE policies (
  policy_id INT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  agent_id INT REFERENCES agents(agent_id),
  policy_type TEXT,
  start_date DATE,
  end_date DATE,
  premium_amount NUMERIC
);

-- Claims table
CREATE TABLE claims (
  claim_id INT PRIMARY KEY,
  policy_id INT REFERENCES policies(policy_id),
  claim_date DATE,
  claim_amount NUMERIC,
  claim_status TEXT,
  fraud_flag CHAR(1)
);
