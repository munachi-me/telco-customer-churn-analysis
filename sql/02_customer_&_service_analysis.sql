# Level 2 — Customer & Service Analysis
-- What is the average customer tenure?
select concat(round(avg(tenure), 0), ' months') as average_customer_tenure
from telco_churn;

-- What is the average monthly charge?
select concat('$', round(avg(monthly_charges), 2)) as average_monthly_charges
from telco_churn;

-- What is the average total charge?
select concat('$', round(avg(total_charges), 2)) as average_total_charges
from telco_churn
where total_charges is not null;

-- How many customers have phone service?
select count(*) as customers_with_phone_service
from telco_churn
where phone_service = 'Yes';

-- How many customers have internet service?
select count(*) as customers_with_internet_service
from telco_churn
where internet_service != 'No';

-- What are the different internet service types and how many customers use each?
select internet_service, count(*) as customers 
from telco_churn
group by internet_service;

-- What are the different payment methods and their customer counts?
select payment_method, count(*) as customers 
from telco_churn
group by payment_method;

-- What are the different contract types and their customer counts?
select contract, count(*) as customers 
from telco_churn
group by contract;

-- How many customers use paperless billing?
select count(*) as customers_using_paperless_billing
from telco_churn
where paperless_billing = 'Yes';

-- What percentage of customers use each contract type?
select contract, count(*) as customers,
	round(count(*) * 100.0 / (select count(*) from telco_churn), 2) as contract_percentage
from telco_churn
group by contract;