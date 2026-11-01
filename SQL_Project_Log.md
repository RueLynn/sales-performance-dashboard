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

**Objective:** 
Import the source dataset into SQLite for querying and analysis.

- Imported `Sample-Superstore.csv` using DB Browser for SQLite.
- Imported table name: `Sample-Superstore`.

### Task 2: Preview the dataset

**Objective:** 
Inspect the records to confirm that the data was imported and can be queried.

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

**Objective:** 
Identify the available columns and their data types before performing analysis.

```sql
PRAGMA table_info("Sample-Superstore");
```

**Result:** 
Identified 22 columns, including sales, profit, discount, quantity, customer, product and geographical information.

**Observation:** SQLite identified Sales and Profit as REAL fields, Quantity as INTEGER, and Order Date and Ship Date as TEXT. Date formatting will need to be considered when performing time-based analysis.

## 5. Data Validation

### Task 5: Check for duplicate records

**Objective:** 
Identify duplicate Row IDs that could affect the accuracy of the analysis.

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

**Objective:** 
Identify missing information in important business fields.

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

**Objective:** 
Calculate the retailer's overall financial performance across the dataset.

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

This is an important business question because high sales do not always mean high profitability.

**Objective**
To compare the three product categories (Technology, Furniture and Office Supplies) based on total sales, total profit and profit margin. The analysis aims to identify which categories contribute most to business revenue and profitability.

**SQL Query**

```sql
SELECT
    "Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(
        SUM("Profit") * 100.0 / SUM("Sales"), 2
    ) AS profit_margin_percentage
FROM "Sample-Superstore"
GROUP BY "Category"
ORDER BY total_sales DESC;
```

**Results**

| Category | Total Sales ($) | Total Profit ($) | Profit Margin (%) |
|---|---:|---:|---:|
| Technology | 836,154.03 | 145,454.95 | 17.40 |
| Furniture | 741,999.80 | 18,451.27 | 2.49 |
| Office Supplies | 719,047.03 | 122,490.80 | 17.04 |

**Key Findings**

1. **Technology** generated the highest sales ($836,154.03) and the highest profit ($145,454.95), with a profit margin of 17.40%.
2. **Office Supplies** generated $719,047.03 in sales and $122,490.80 in profit, achieving a profit margin of 17.04%.
3. **Furniture** generated $741,999.80 in sales but only $18,451.27 in profit. Its profit margin of 2.49% was considerably lower than the other two categories.

**Business Interpretation**

Technology was the strongest-performing category in terms of both sales and total profit. Office Supplies also demonstrated strong profitability despite generating the lowest sales of the three categories. Furniture generated more sales than Office Supplies but significantly less profit, indicating a potential profitability challenge that requires further investigation.

**Conclusion**

The analysis suggests that the business should maintain its focus on Technology and Office Supplies while investigating the factors affecting Furniture profitability. Further analysis of Furniture sub-categories and discount levels may help identify the sources of lower profitability.


### Business Question 3: Which regions generate the highest sales and profit?

**Objective**  
To evaluate the sales performance and profitability of individual product sub-categories. The analysis aims to identify which sub-categories contribute the most to total sales and profit, as well as those with low or negative profitability.


```sql
SELECT
    "Category",
    "Sub-Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(
        SUM("Profit") * 100.0 / SUM("Sales"), 2
    ) AS profit_margin_percentage
FROM "Sample-Superstore"
GROUP BY
    "Category",
    "Sub-Category"
ORDER BY total_profit DESC;
```
**Results**

| Category | Sub-Category | Total Sales ($) | Total Profit ($) | Profit Margin (%) |
|---|---|---:|---:|---:|
| Technology | Copiers | 149,528.03 | 55,617.82 | 37.20 |
| Technology | Phones | 330,007.05 | 44,515.73 | 13.49 |
| Technology | Accessories | 167,380.32 | 41,936.64 | 25.05 |
| Office Supplies | Paper | 78,479.21 | 34,053.57 | 43.39 |
| Office Supplies | Binders | 203,412.73 | 30,221.76 | 14.86 |
| Furniture | Chairs | 328,449.10 | 26,590.17 | 8.10 |
| Office Supplies | Storage | 223,843.61 | 21,278.83 | 9.51 |
| Office Supplies | Appliances | 107,532.16 | 18,138.01 | 16.87 |
| Furniture | Furnishings | 91,705.16 | 13,059.14 | 14.24 |
| Office Supplies | Envelopes | 16,476.40 | 6,964.18 | 42.27 |
| Office Supplies | Art | 27,118.79 | 6,527.79 | 24.07 |
| Office Supplies | Labels | 12,486.31 | 5,546.25 | 44.42 |
| Technology | Machines | 189,238.63 | 3,384.76 | 1.79 |
| Office Supplies | Fasteners | 3,024.28 | 949.52 | 31.40 |
| Office Supplies | Supplies | 46,673.54 | -1,189.10 | -2.55 |
| Furniture | Bookcases | 114,880.00 | -3,472.56 | -3.02 |
| Furniture | Tables | 206,965.53 | -17,725.48 | -8.56 |

**Key Findings**

1. **Copiers generated the highest profit**, contributing $55,617.82 at a profit margin of 37.20%, despite generating less sales than Phones and Accessories.
2. **Phones generated the highest sales** among all sub-categories, at $330,007.05, and contributed $44,515.73 in profit.
3. **Paper achieved a strong profit margin of 43.39%**, generating $34,053.57 in profit from $78,479.21 in sales.
4. **Machines had a relatively low profit margin of 1.79%**, despite generating $189,238.63 in sales.
5. **Tables recorded the largest loss**, with a negative profit of $17,725.48 and a profit margin of -8.56%.
6. **Bookcases and Supplies also generated losses**, with negative profits of $3,472.56 and $1,189.10 respectively.

**Business Interpretation**

The results indicate that sales volume alone is not a reliable measure of product performance. For example, Phones generated the highest sales, while Copiers generated the highest profit. Similarly, Paper achieved a higher profit margin than several sub-categories with substantially greater sales.

Furniture requires further investigation, particularly Tables and Bookcases, which generated negative profits despite contributing to sales revenue. Machines also warrant attention because their high sales contribution resulted in a relatively low profit margin.

These findings suggest that management should assess product-level profitability alongside sales performance when making pricing, discounting and product portfolio decisions.

**Conclusion**

The analysis identified significant differences in profitability across the 17 product sub-categories. Copiers and Paper demonstrated strong profit margins, while Tables and Bookcases were loss-making. The findings highlight the importance of monitoring both sales and profit when evaluating product performance.

Further analysis of discount levels may help investigate factors associated with the losses observed in Tables, Bookcases, and Supplies.

**My Analysis**
Tables had the highest sales of all Furniture sub-categories, but also the largest loss. This makes it an important product group to investigate further.


### Business Question 4: Which products or sub-categories generate losses?

**Objective**

To analyse sales, total profit and profit margin across the four geographical regions (West, East, Central and South). The analysis aims to identify the strongest-performing regions and areas that may require further attention.

**SQL Query**

```sql
SELECT
    "Region",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(
        SUM("Profit") * 100.0 / SUM("Sales"), 2
    ) AS profit_margin_percentage
FROM "Sample-Superstore"
GROUP BY "Region"
ORDER BY total_sales DESC;
```

**Results**

| Region | Total Sales ($) | Total Profit ($) | Profit Margin (%) |
|---|---:|---:|---:|
| West | 725,457.82 | 108,418.45 | 14.94 |
| East | 678,781.24 | 91,522.78 | 13.48 |
| Central | 501,239.89 | 39,706.36 | 7.92 |
| South | 391,721.91 | 46,749.43 | 11.93 |

**Key Findings**

1. **West** was the strongest-performing region, generating the highest sales of $725,457.82 and the highest profit of $108,418.45. It also achieved the highest profit margin of 14.94%.
2. **East** ranked second in sales and profit, generating $678,781.24 in sales and $91,522.78 in profit, with a margin of 13.48%.
3. **Central** generated $501,239.89 in sales but achieved the lowest profit margin of 7.92%. Its profit was $39,706.36.
4. **South** recorded the lowest sales of $391,721.91 but generated $46,749.43 in profit, exceeding Central's total profit despite having lower sales.

**Business Interpretation**

The results indicate differences in both sales contribution and profitability across the four regions. West and East demonstrated stronger overall performance, contributing the highest sales and profit.

Central requires further investigation because it generated more sales than South but achieved a lower total profit and profit margin. This suggests that higher sales do not necessarily translate into stronger profitability.

South also presents an interesting result: despite having the lowest sales, it generated more profit than Central. This highlights the importance of evaluating profit margins alongside revenue when comparing regional performance.

**Conclusion**

The West region was the strongest performer in terms of sales, total profit and profit margin, while Central recorded the weakest profit margin. Management should investigate the factors affecting Central's profitability and identify practices from the stronger-performing regions that could potentially be applied elsewhere.

Further analysis of product mix and discount levels by region may provide additional insight into these differences.


### Business Question 5: How are discounts associated with profitability?

**Objective**

To identify individual products with negative total profit and assess their sales contribution and financial impact. This analysis aims to highlight products that may require further investigation regarding pricing, discounting and profitability.

**SQL Query**

```sql
SELECT
    "Product ID",
    "Product Name",
    "Category",
    "Sub-Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM "Sample-Superstore"
GROUP BY
    "Product ID",
    "Product Name",
    "Category",
    "Sub-Category"
HAVING SUM("Profit") < 0
ORDER BY total_profit ASC;
```

**Results**

The query returned a list of individual products with negative total profit.

The five largest losses identified were:

| Product | Category | Sub-category | Total Profit ($) |
|---|---|---|---:|
| Cubify CubeX 3D Printer Double Head Print | Technology | Machines | -8,879.97 |
| Lexmark MX611dhe Monochrome Laser Printer | Technology | Machines | -4,589.97 |
| Cubify CubeX 3D Printer Triple Head Print | Technology | Machines | -3,839.99 |
| Chromcraft Bull-Nose Wood Oval Conference Tables & Bases | Furniture | Tables | -2,876.12 |
| Bush Advantage Collection Racetrack Conference Table | Furniture | Tables | -1,934.40 |

**Key Findings**

1. The Cubify CubeX 3D Printer Double Head Print recorded the largest individual product loss of $8,879.97.
2. Technology Machines featured prominently among the products with the largest losses.
3. Furniture Tables also contributed significantly to the identified losses, with several table products appearing near the top of the results.
4. Loss-making products were identified across Technology, Furniture and Office Supplies, indicating that profitability challenges are not limited to one category.
5. Some products generated substantial sales revenue but still recorded negative total profit.

**Business Interpretation**

The findings demonstrate that individual products can negatively affect overall business profitability, even when they contribute to sales revenue.

Technology Machines and Furniture Tables warrant further investigation because several products in these sub-categories recorded substantial losses. Management should review their pricing, discounting and associated costs to understand the factors contributing to their negative profitability.

The results also suggest that product performance should be monitored at an individual product level rather than relying exclusively on category-level performance.

**Conclusion**

The analysis identified individual products generating negative total profit, with the largest losses concentrated among selected Technology Machines and Furniture Tables. These products represent potential areas for further investigation and profitability improvement.

A follow-up analysis of discount levels will help investigate whether higher discounts are associated with the losses observed across the product portfolio.

## Business Question 6: How are discounts associated with profitability?

## Business Question 6: How do discount levels relate to profitability?

### Objective
To investigate the relationship between discount levels and profitability by comparing the number of records, total sales, total profit and profit margin across different discount levels.

### SQL Query
```sql
SELECT
    "Discount",
    COUNT(*) AS number_of_orders,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(
        SUM("Profit") * 100.0 / SUM("Sales"), 2
    ) AS profit_margin_percentage
FROM "Sample-Superstore"
GROUP BY "Discount"
ORDER BY "Discount";
```

### Key Findings
- The 0% discount group recorded the highest total profit of **$320,987.60**, with a profit margin of **29.51%**.
- Discount groups of 10%, 15% and 20% remained profitable, although their margins were lower than the 0% discount group.
- Discount levels from 30% to 80% recorded negative total profits.
- The 70% discount group recorded the largest total loss of **$40,075.36**.
- The 80% discount group recorded the lowest profit margin at **-180.03%**.

### Business Interpretation
The results suggest an association between higher discount levels and lower profitability. Although discounts may support sales activity, aggressive discounting can reduce profitability and may result in losses.

The business should review its discounting practices, particularly at discount levels of 30% and above. However, this analysis does not establish that discounts alone caused the losses. Other factors, such as product costs and product mix, may also influence profitability.

### Conclusion
Discount levels are an important factor to consider when evaluating sales performance. The analysis indicates that transactions with discounts of 30% and above were unprofitable overall in this dataset. Businesses should therefore assess whether the additional sales generated through higher discounts justify the reduction in profit.



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
