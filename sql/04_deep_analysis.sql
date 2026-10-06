# Level 4 — Deeper Analysis
-- Which contract type has the highest observed churn rate?
with churn_rate_by_contract as (
	select contract,
		count(*) as total_customers,
		sum(churn = 'Yes') as churned_customers,
		round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
	from telco_churn
	group by contract
)
select * from churn_rate_by_contract
where churn_rate = (select max(churn_rate) from churn_rate_by_contract);

-- Which payment method has the highest observed churn rate?
with churn_rate_by_payment_method as (
	select payment_method,
		count(*) as total_customers,
		sum(churn = 'Yes') as churned_customers,
		round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
	from telco_churn
	group by payment_method
)
select * from churn_rate_by_payment_method
where churn_rate = (select max(churn_rate) from churn_rate_by_payment_method);

-- Which internet service type has the highest observed churn rate?
with churn_rate_by_internet_service as (
	select internet_service,
		count(*) as total_customers,
		sum(churn = 'Yes') as churned_customers,
		round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
	from telco_churn
    group by internet_service
)
select * from churn_rate_by_internet_service
where churn_rate = (select max(churn_rate) from churn_rate_by_internet_service);

-- Does having tech support appear to be associated with different churn rates?
select tech_support, 
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by tech_support;

-- Does having online security appear to be associated with different churn rates?
select online_security, 
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by online_security;

-- Does having online backup appear to be associated with different churn rates?
select online_backup, 
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by online_backup;

-- Does device protection status differ in observed churn rate?
select device_protection, 
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by device_protection;

-- Do customers with streaming services have different churn rates?
select streaming_movies, streaming_tv, 
	count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
	round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by streaming_movies, streaming_tv;

-- How does churn vary across monthly-charge ranges?
select 
	case
		when monthly_charges > 100 then '$100+'
        when monthly_charges > 75 then '$76-$100'
        when monthly_charges > 50 then '$51-$75'
        when monthly_charges > 25 then '$26-$50'
        else '$0-$25 charges'
	end as monthly_charges_group,
    count(*) as total_customers,
    sum(churn = 'Yes') as churned_customers,
    round(sum(churn = 'Yes') * 100.0 / count(*), 2) as churn_rate
from telco_churn
group by monthly_charges_group
order by monthly_charges_group;

-- How does churn vary across tenure groups?
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
