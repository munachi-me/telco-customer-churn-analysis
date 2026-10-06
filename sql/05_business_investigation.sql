# Level 5 — Business Investigation
-- What percentage of total churn comes from month-to-month customers?
select
	sum(churn = 'Yes')  as total_churned_customers,
    sum(churn = 'Yes' and contract = 'Month-to-month')  as churned_customers_on_m2m,
    round(sum(churn = 'Yes' and contract = 'Month-to-month') * 100 / sum(churn = 'Yes'), 2) as percentage
from telco_churn;

-- What percentage of churned customers are senior citizens?
select
	sum(churn = 'Yes')  as total_churned_customers,
    sum(churn = 'Yes' and senior_citizen = 1)  as churned_customers_that_are_senior_citizen,
    round(sum(churn = 'Yes' and senior_citizen = 1) * 100 / sum(churn = 'Yes'), 2) as percentage
from telco_churn;

-- What percentage of churned customers use each payment method?
select payment_method,
	(select sum(churn = 'Yes') from telco_churn) as overall_churned_customers,
	sum(churn = 'Yes')  as churned_customers,
    round(sum(churn = 'Yes') * 100 / (select sum(churn = 'Yes') from telco_churn), 2) as percentage
from telco_churn
group by payment_method;

-- What percentage of churned customers have internet service?
select
	sum(churn = 'Yes')  as total_churned_customers,
    sum(churn = 'Yes' and internet_service != 'No')  as churned_customers_with_internet_service,
    round(sum(churn = 'Yes' and internet_service != 'No') * 100 / sum(churn = 'Yes'), 2) as percentage
from telco_churn;

select internet_service,
	(select sum(churn = 'Yes') from telco_churn) as overall_churned_customers,
	sum(churn = 'Yes')  as churned_customers,
    round(sum(churn = 'Yes') * 100 / (select sum(churn = 'Yes') from telco_churn), 2) as percentage
from telco_churn
group by internet_service;