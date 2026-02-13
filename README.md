# 🏦 HSBC Banking Risk Analytics — SQL | Power BI | Tableau

![Database](https://img.shields.io/badge/Database-MySQL-blue?style=flat&logo=mysql)
![Domain](https://img.shields.io/badge/Domain-Banking%20Risk-orange)
![Level](https://img.shields.io/badge/Level-Beginner%20to%20Intermediate-green)
![Tools](https://img.shields.io/badge/Tools-SQL%20|%20Power%20BI%20|%20Tableau-yellow)

---

## 📌 Project Overview

**HSBC Banking Risk Analytics** is an end-to-end SQL analytics project designed to analyze **credit risk, loan exposure, and default behavior** in the banking domain.  
The project replicates real-world banking risk analysis workflows and is suitable for **SQL, Power BI, and Tableau portfolios**.

---

## 🏦 Business Problem

Banks need to proactively identify **high-risk customers**, monitor **loan defaults**, evaluate **creditworthiness**, and ensure **KYC compliance** to minimize financial risk.

---

## 🎯 Business Objectives

- Identify high-risk and low-risk customers
- Analyze loan default patterns
- Study credit score impact on defaults
- Track geographical risk exposure
- Support data-driven risk decisions

---

## 📂 Dataset Information

- **File Name:** `banking_risk_data.csv`
- **Total Records:** 200
- **Industry:** Banking & Finance
- **Source:** Synthetic (Portfolio Project)

---

## 🧾 Dataset Schema

| Column | Description |
|------|------------|
| customer_id | Unique customer ID |
| full_name | Customer name |
| age | Customer age |
| gender | Gender |
| state | State |
| city | City |
| account_type | Savings / Current |
| annual_income_inr | Annual income |
| credit_score | Credit score |
| loan_amount_inr | Loan amount |
| loan_type | Loan category |
| default_flag | 1 = Default, 0 = No Default |
| transaction_count_6m | Transactions in last 6 months |
| avg_monthly_balance_inr | Avg monthly balance |
| kyc_status | Verified / Pending |
| risk_rating | Low / Medium / High |

---

## 🛠️ Database Creation (MySQL)

```sql
CREATE DATABASE hsbc_banking_risk;
USE hsbc_banking_risk;

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
📊 Business Questions & SQL Answers :-

1. How many customers are in the dataset?

SELECT COUNT(*) AS total_customers FROM banking_risk;

2. Which customers are classified as high risk?

SELECT * FROM banking_risk
WHERE risk_rating = 'High';

3. Which customers are most likely to default (low credit score)?

SELECT * FROM banking_risk
WHERE credit_score < 600 AND loan_amount_inr > 0;

4. What is the overall default rate?

SELECT 
ROUND(SUM(default_flag)*100.0/COUNT(*),2) AS default_rate
FROM banking_risk;

5. Which loan types have the highest defaults?

SELECT loan_type,
COUNT(*) AS total_loans,
SUM(default_flag) AS defaults
FROM banking_risk
GROUP BY loan_type;

6. Average credit score by risk category

SELECT risk_rating, AVG(credit_score) AS avg_credit_score
FROM banking_risk
GROUP BY risk_rating;

8. Customer distribution by state.

SELECT state, COUNT(*) AS customers
FROM banking_risk
GROUP BY state;

8. Cities contributing the most to defaults
SELECT city, SUM(default_flag) AS defaults
FROM banking_risk
GROUP BY city
ORDER BY defaults DESC;

9. High-risk customers with pending KYC.

SELECT * FROM banking_risk
WHERE risk_rating = 'High' AND kyc_status = 'Pending';

10. Average balance of defaulters vs non-defaulters.

SELECT default_flag,
AVG(avg_monthly_balance_inr) AS avg_balance
FROM banking_risk
GROUP BY default_flag;

11. High-income customers with low credit scores.

SELECT * FROM banking_risk
WHERE annual_income_inr > 1500000 AND credit_score < 600;

12. Top 10 customers with highest loan exposure.

SELECT customer_id, loan_amount_inr
FROM banking_risk
ORDER BY loan_amount_inr DESC
LIMIT 10;

13. Customers with no active loans.

SELECT * FROM banking_risk
WHERE loan_type = 'None';

14. High transactions but low balance customers.

SELECT * FROM banking_risk
WHERE transaction_count_6m > 300
AND avg_monthly_balance_inr < 20000;

15. Customer distribution by risk category.

SELECT risk_rating, COUNT(*) AS customers
FROM banking_risk
GROUP BY risk_rating;

Geographic risk heatmap :- 

KYC compliance tracking :

💡 Key Insights :-
 
Low credit score customers show higher default probability

Personal and Education loans are risk-heavy

KYC-pending customers increase operational risk

Location-based risk patterns exist

High transaction count does not always mean low risk

👨‍💻 Author :-
Rakesh Kumar Mistri
Aspiring Data Analyst

GitHub: https://github.com/rakeshkumarmistri010413-collab

LinkedIn: https://www.linkedin.com/in/rakesh-kumar-mistri-07ab15334/

Email: rakeshkumarmistri010413@gmail.com

