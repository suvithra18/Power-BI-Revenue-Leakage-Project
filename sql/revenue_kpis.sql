-- Revenue KPIs
SELECT
  SUM(invoice_amount) AS total_billed,
  SUM(amount_paid) AS total_collected,
  SUM(invoice_amount - amount_paid) AS outstanding
FROM revenue_leakage_dataset;
-- Revenue Leakage
SELECT
  SUM(invoice_amount - amount_paid + sla_penalty) AS revenue_leakage
FROM revenue_leakage_dataset;
-- High-Risk Customers
SELECT Customer_Name,
       SUM(invoice_amount - amount_paid + sla_penalty) AS risk_amount
FROM revenue_leakage_dataset
WHERE days_delayed > 30
GROUP BY Customer_Name;

