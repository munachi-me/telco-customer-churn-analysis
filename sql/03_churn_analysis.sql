## Level 3 — Churn Analysis
--  What is the churn rate by gender?
select 
	gender, 
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by gender;

-- What is the churn rate by senior-citizen status?
select 
	senior_citizen, 
    if(senior_citizen = 1, 'Senior', 'Junior') as senior,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by senior_citizen;

-- What is the churn rate by partner status?
select 
	partner,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by partner;

-- What is the churn rate by dependent status?
select 
	dependents,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by dependents;

-- What is the churn rate by phone service?
select 
	phone_service,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by phone_service;

-- What is the churn rate by internet service type?
select 
	internet_service,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by internet_service;

-- What is the churn rate by contract type?
select 
	contract,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by contract;

-- What is the churn rate by payment method?
select 
	payment_method,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by payment_method;

-- What is the churn rate by paperless billing status?
select 
	paperless_billing,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by paperless_billing;

-- What is the churn rate by tenure group?
select 
	case
		when tenure > 12 * 5 then '60+ months'
        when tenure > 12 * 4 then '49-60 months'
        when tenure > 12 * 3 then '37-48 months'
        when tenure > 12 * 2 then '25-36 months'
        when tenure > 12 then '13-24 months'
        else '0-12 months'
	end as tenure_group,
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by tenure_group
order by tenure_group;