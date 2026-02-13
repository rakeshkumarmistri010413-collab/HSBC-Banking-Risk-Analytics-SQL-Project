-- Create Database:- 

CREATE DATABASE hsbc_banking_risk;
USE hsbc_banking_risk;

-- Create Table:- 

CREATE TABLE banking_risk (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    state VARCHAR(30),
    city VARCHAR(30),
    account_type VARCHAR(20),
    annual_income_inr INT,
    credit_score INT,
    loan_amount_inr INT,
    loan_type VARCHAR(30),
    default_flag INT,
    transaction_count_6m INT,
    avg_monthly_balance_inr INT,
    kyc_status VARCHAR(20),
    risk_rating VARCHAR(10)
);

-- Total records
SELECT COUNT(*) FROM banking_risk;

-- Null check
SELECT COUNT(*) FROM banking_risk WHERE credit_score IS NULL;

-- Default flag validation
SELECT DISTINCT default_flag FROM banking_risk;

-- 1️. How many customers are in the banking risk dataset?

SELECT COUNT(*) AS total_customers FROM banking_risk;

-- 2. Which customers are classified as high risk?

SELECT * FROM banking_risk WHERE risk_rating = 'High';

-- 3. Which customers are most likely to default based on low credit score and loan exposure? 

SELECT * FROM banking_risk
WHERE credit_score < 600 AND loan_amount_inr > 0;

-- 4. What is the overall default rate in the customer portfolio?
 
SELECT 
ROUND(SUM(default_flag)*100.0/COUNT(*),2) AS default_rate
FROM banking_risk;

-- 5. Which loan types have the highest number of defaults?

SELECT loan_type,
COUNT(*) AS total_loans,
SUM(default_flag) AS defaults
FROM banking_risk
GROUP BY loan_type;

-- 6. How does the average credit score vary across risk categories?

SELECT risk_rating, AVG(credit_score)
FROM banking_risk
GROUP BY risk_rating;

-- 7. How are customers distributed across Indian states?

SELECT state, COUNT(*) FROM banking_risk GROUP BY state;

-- 8. Which cities contribute the most to loan defaults? 

SELECT city, SUM(default_flag) AS defaults
FROM banking_risk
GROUP BY city
ORDER BY defaults DESC;

-- 9. Which high-risk customers have pending KYC verification?

SELECT * FROM banking_risk
WHERE risk_rating = 'High' AND kyc_status = 'Pending';

-- 10. How does average monthly balance differ between defaulters and non-defaulters?

SELECT default_flag,
AVG(avg_monthly_balance_inr) AS avg_balance
FROM banking_risk
GROUP BY default_flag;

-- 11. Which high-income customers have low credit scores?

SELECT * FROM banking_risk
WHERE annual_income_inr > 1500000 AND credit_score < 600;

-- 12. Which customers have the highest loan exposure?

SELECT customer_id, loan_amount_inr
FROM banking_risk
ORDER BY loan_amount_inr DESC
LIMIT 10;

-- 13. Which customers currently have no active loans?
 
SELECT * FROM banking_risk WHERE loan_type = 'None';

-- 14. Which customers show high transaction activity but low balances?

SELECT * FROM banking_risk
WHERE transaction_count_6m > 300
AND avg_monthly_balance_inr < 20000;

-- 15. What is the overall distribution of customers by risk category?

SELECT * FROM banking_risk
WHERE transaction_count_6m > 300
AND avg_monthly_balance_inr < 20000;

-- The End --
-- Rakesh








