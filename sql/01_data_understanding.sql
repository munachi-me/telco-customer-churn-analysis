# Level 1 — Data Understanding
-- How many customers are in the dataset?
select count(*) as total_customers
from telco_churn;

-- How many columns does the dataset have?
select count(*) as number_of_columns
from information_schema.columns
where table_schema = database()
and table_name = 'telco_churn';
    
describe telco_churn;

-- Are there duplicate customer IDs?
select customer_id, count(*) as occurrences
from telco_churn
group by customer_id
having occurrences > 1;

-- Are there missing values?
-- The cleaned dataset contains 21 columns, so every field is checked below.
select
    count(*) as total_rows,
    sum(customer_id is null or customer_id = '') as missing_customer_id,
    sum(gender is null or gender = '') as missing_gender,
    sum(senior_citizen is null) as missing_senior_citizen,
    sum(partner is null or partner = '') as missing_partner,
    sum(dependents is null or dependents = '') as missing_dependents,
    sum(tenure is null) as missing_tenure,
    sum(phone_service is null or phone_service = '') as missing_phone_service,
    sum(multiple_lines is null or multiple_lines = '') as missing_multiple_lines,
    sum(internet_service is null or internet_service = '') as missing_internet_service,
    sum(online_security is null or online_security = '') as missing_online_security,
    sum(online_backup is null or online_backup = '') as missing_online_backup,
    sum(device_protection is null or device_protection = '') as missing_device_protection,
    sum(tech_support is null or tech_support = '') as missing_tech_support,
    sum(streaming_tv is null or streaming_tv = '') as missing_streaming_tv,
    sum(streaming_movies is null or streaming_movies = '') as missing_streaming_movies,
    sum(contract is null or contract = '') as missing_contract,
    sum(paperless_billing is null or paperless_billing = '') as missing_paperless_billing,
    sum(payment_method is null or payment_method = '') as missing_payment_method,
    sum(monthly_charges is null) as missing_monthly_charges,
    sum(total_charges is null) as missing_total_charges,
    sum(churn is null or churn = '') as missing_churn
from telco_churn;

-- View new customers with zero tenure / zero total charges.
select * from telco_churn
where tenure = 0 or total_charges = 0;

select count(*) as zero_tenure
from telco_churn
where tenure = 0;

select count(*) as zero_total_charges
from telco_churn
where total_charges = 0;
-- NOTE: We won't replace these. They are legitimate new customers.

-- How many customers have churned?
select count(*) as churned_customers
from telco_churn
where churn = 'Yes';

-- What percentage of customers have churned?
select round(count(*) * 100.0 / (select count(*) from telco_churn), 2) as churn_percentage
from telco_churn
where churn = 'Yes';

-- What is the distribution of customers by gender?
select gender, count(*) as customers,
    round(count(*) * 100.0 / (select count(*) from telco_churn), 2) as gender_percentage
from telco_churn
group by gender;

-- How many customers are senior citizens?
select count(*) as senior_citizens
from telco_churn
where senior_citizen = 1;

-- How many customers have partners?
select count(*) as customers_with_partners
from telco_churn
where partner = 'Yes';

-- How many customers have dependents?
select count(*) as customers_with_dependents
from telco_churn
where dependents = 'Yes';
