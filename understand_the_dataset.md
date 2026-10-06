# Understand the Dataset

The Telco Customer Churn dataset contains information about telecom customers and whether they left the company.

The cleaned dataset contains **7,043 customers and 21 columns**.

The columns fall into several categories.

---

### 1. Customer Information

| Column | Meaning |
|------|------|
| customer_id | Unique identifier for each customer |
| gender | Customer's gender |
| senior_citizen | Whether the customer is a senior citizen |
| partner | Whether the customer has a partner |
| dependents | Whether the customer has dependents |

---

### 2. Customer Relationship

| Column | Meaning |
|------|------|
| tenure | Number of months the customer has stayed with the company |

---

### 3. Services

| Column | Meaning |
|------|------|
| phone_service | Whether the customer has phone service |
| multiple_lines | Whether they have multiple phone lines |
| internet_service | Type of internet service |
| online_security | Online security subscription |
| online_backup | Online backup subscription |
| device_protection | Device protection subscription |
| tech_support | Technical support subscription |
| streaming_tv | Streaming TV subscription |
| streaming_movies | Streaming movie subscription |

---

### 4. Account / Billing

| Column | Meaning |
|------|------|
| contract | Contract type |
| paperless_billing | Whether billing is paperless |
| payment_method | Payment method |
| monthly_charges | Monthly amount charged |
| total_charges | Total amount charged over the customer's tenure |

---

### 5. Target Variable

| Column | Meaning |
|------|------|
| churn | Whether the customer left the company |

---

**Churn = Yes** → customer left the company  
**Churn = No** → customer stayed

## Cleaning Notes

- The dataset was checked for duplicate customer IDs.
- All 21 columns were checked for missing values.
- `total_charges` was converted to numeric format.
- Customers with zero tenure were retained because they represent legitimate new customers.
- `No internet service` was retained as a separate category from `No` so that customers without internet service are not mixed with customers who have internet but did not subscribe to a particular add-on.
