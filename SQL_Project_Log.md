# Sample Superstore: SQL Data Exploration Project

## 1. Project Overview

This project uses the Sample Superstore dataset to explore retail sales performance and generate business insights using SQL.

The objective is to analyse sales, profitability, product performance, regional trends and discount patterns to identify opportunities for improved business decision-making.

## 2. Tools and Technologies

- **Database:** SQLite
- **SQL environment:** DB Browser for SQLite
- **Dataset:** Sample Superstore CSV
- **Data analysis:** SQL and Excel
- **Portfolio platform:** GitHub

## 3. Dataset Overview

The dataset contains retail transaction records covering 2014–2017.

- Total records: 9,994
- Total columns: 22, including an additional import-related row ID column.
- Key business fields: Order Date, Region, Category, Sub-Category, Sales, Quantity, Discount and Profit.

## 4. Data Exploration

### Task 1: Import the dataset

**Objective:** Import the source dataset into SQLite for querying and analysis.

- Imported `Sample-Superstore.csv` using DB Browser for SQLite.
- Imported table name: `Sample-Superstore`.

### Task 2: Preview the dataset

**Objective:** Inspect the records to confirm that the data was imported and can be queried.

```sql
SELECT *
FROM "Sample-Superstore"
LIMIT 10;
```

**Result:** Successfully returned 10 rows.

### Task 3: Count the records

**Objective:** Verify the total number of records available for analysis.

```sql
SELECT COUNT(*) AS total_records
FROM "Sample-Superstore";
```

**Result:** 9,994 records.

**Finding:** The imported record count matches the expected dataset size.

### Task 4: Inspect the table structure

**Objective:** Identify the available columns and their data types before performing analysis.

```sql
PRAGMA table_info("Sample-Superstore");
```

**Result:** Identified 22 columns, including sales, profit, discount, quantity, customer, product and geographical information.

**Observation:** SQLite identified Sales and Profit as REAL fields, Quantity as INTEGER, and Order Date and Ship Date as TEXT. Date formatting will need to be considered when performing time-based analysis.

## 5. Data Validation

### Task 5: Check for duplicate records

**Objective:** Identify duplicate Row IDs that could affect the accuracy of the analysis.

```sql
SELECT
    "Row ID",
    COUNT(*) AS occurrences
FROM "Sample-Superstore"
GROUP BY "Row ID"
HAVING COUNT(*) > 1;
```

**Result:** 0 duplicate Row IDs found.

**Finding:** No repeated Row IDs were identified.

### Task 6: Check for missing values

**Objective:** Identify missing information in important business fields.

```sql
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN "Order ID" IS NULL OR TRIM("Order ID") = '' THEN 1 ELSE 0 END) AS missing_order_ids,
    SUM(CASE WHEN "Order Date" IS NULL OR TRIM("Order Date") = '' THEN 1 ELSE 0 END) AS missing_order_dates,
    SUM(CASE WHEN "Customer ID" IS NULL OR TRIM("Customer ID") = '' THEN 1 ELSE 0 END) AS missing_customer_ids,
    SUM(CASE WHEN "Sales" IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN "Profit" IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM "Sample-Superstore";
```

**Results:**

| Validation field | Missing values |
|---|---:|
| Total records | 9,994 |
| Order ID | 0 |
| Order Date | 0 |
| Customer ID | 0 |
| Sales | 0 |
| Profit | 0 |

**Finding:** No missing values were identified in the five selected fields.

### Data Validation Conclusion

The dataset passed the initial validation checks. No duplicate Row IDs were identified, and the five selected business fields contained no missing values.

These checks provide an initial level of confidence in the dataset before further analysis.

## 6. Business Questions and SQL Analysis

The analysis will investigate:

1. What are the total sales, total profit and overall profit margin?
2. Which product categories and sub-categories perform best?
3. Which regions generate the highest sales and profit?
4. Which products or sub-categories generate losses?
5. How are discounts associated with profitability?

### Business Question 1: What were the retailer's total sales, total profit and overall profit margin?

**Objective:** Calculate the retailer's overall financial performance across the dataset.

**SQL query:**

```sql
SELECT
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(
        SUM("Profit") * 100.0 / SUM("Sales"), 2
    ) AS profit_margin_percentage
FROM "Sample-Superstore";
```

**Results:**

| Metric | Result |
|---|---:|
| Total Sales | $2,297,200.86 |
| Total Profit | $286,397.02 |
| Overall Profit Margin | 12.47% |

**Profit Margin Formula:**

Profit Margin (%) = (Total Profit ÷ Total Sales) × 100

**Business Finding:**

The retailer generated total sales of $2,297,200.86 and total profit of $286,397.02, resulting in an overall profit margin of 12.47%.

This means the business generated approximately $12.47 in profit for every $100 in sales.

**Business Interpretation:**

The overall profit margin provides a baseline for evaluating profitability across product categories, sub-categories and geographical regions. Further analysis is required to identify which areas contribute most to the retailer's profitability.

### Business Question 2: Which product categories and sub-categories perform best?

*Pending analysis.*

### Business Question 3: Which regions generate the highest sales and profit?

*Pending analysis.*

### Business Question 4: Which products or sub-categories generate losses?

*Pending analysis.*

### Business Question 5: How are discounts associated with profitability?

*Pending analysis.*

## 7. Business Recommendations

To be completed after the findings have been evaluated.

## 8. Project Status

- [x] Dataset imported into SQLite
- [x] Dataset previewed
- [x] Record count verified
- [x] Table structure inspected
- [x] Duplicate Row IDs checked
- [x] Missing values checked in five selected fields
- [x] Overall sales and profit analysis completed
- [ ] Category and sub-category analysis
- [ ] Regional analysis
- [ ] Loss-making product analysis
- [ ] Discount and profitability analysis
- [ ] Business recommendations
- [ ] Final portfolio documentation
