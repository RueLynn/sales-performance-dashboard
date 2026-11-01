# Sample Superstore: SQL Data Exploration Project

## 1. Project Overview

This project uses the Sample Superstore dataset to explore retail sales performance and generate business insights using SQL.

The objective is to analyse sales, profitability, product performance, regional trends and discount patterns to identify opportunities for improved business decision-making.

## 2. Tools and Technologies

- **Database:** SQLite
- **SQL environment:** DB Browser for SQLite
- **Dataset:** Sample Superstore CSV
- **Data analysis:** SQL, with Excel used for preliminary analysis
- **Portfolio platform:** GitHub

## 3. Dataset Overview

The dataset contains retail transaction records covering 2014–2017.

- Total records: 9,994
- Total columns: 22, including an additional import-related row ID column.
- Key business fields: Order Date, Region, Category, Sub-Category, Sales, Quantity, Discount and Profit.

## 4. Data Exploration and Validation

### Task 1: Import the dataset

Imported `Sample-Superstore.csv` into SQLite using DB Browser for SQLite.

The imported table is named `Sample-Superstore`.

### Task 2: Preview the dataset

**Business/technical objective:** Inspect the records to confirm that the data was imported and can be queried.

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

### Task 5: Check for duplicate records

**Objective:**  Identify duplicate Row IDs that could affect the accuracy of the analysis.

- SQL method: Used GROUP BY, COUNT() and HAVING to identify repeated Row IDs.
- Result: 0 duplicate Row IDs found.
- Finding: All Row IDs appear to be unique.

## 5. Business Questions

The analysis will investigate:

1. What are the total sales and total profit?
2. What is the overall profit margin?
3. Which product categories and sub-categories perform best?
4. Which regions generate the highest sales and profit?
5. Which products or sub-categories generate losses?
6. How are discounts associated with profitability?

## 6. Analysis Results

*To be completed as SQL analysis progresses.*

## 7. Business Recommendations

*To be completed after findings have been evaluated.*

## 8. Project Status

- [x] Dataset imported into SQLite
- [x] Dataset previewed
- [x] Record count verified
- [x] Table structure inspected
- [ ] Overall sales and profit analysis
- [ ] Category and sub-category analysis
- [ ] Regional analysis
- [ ] Discount and profitability analysis
- [ ] Business recommendations
- [ ] Final portfolio documentation
