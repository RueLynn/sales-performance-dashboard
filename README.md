# Sales Performance Analysis Dashboard

An end-to-end retail sales analytics portfolio project using Microsoft Excel and SQL, with an interactive Power BI dashboard planned. The project investigates sales performance, profitability, product performance, regional trends and discounting.

**Project status:** In progress

## 1. Project Overview

This project analyses the Sample Superstore dataset to understand what drives sales and profitability across product categories, sub-categories, regions and discount levels.

The goal is to turn transaction data into meaningful business insights and practical recommendations that can support better decision-making.

The project demonstrates my developing skills in data validation, exploratory analysis, SQL querying, business interpretation and data visualisation.

## 2. Business Problem

Sales revenue alone does not show whether a business is profitable. Businesses also need to understand which products and regions perform well, where losses occur, and how discounting relates to profitability.

This project investigates six business questions:

1. What are the overall sales, profit and profit margin?
2. Which product categories generate the highest sales and profit?
3. Which product sub-categories are the most and least profitable?
4. Which regions generate the highest sales and profit?
5. Which individual products are generating losses?
6. How do discount levels relate to profitability?

## 3. Dataset

- **Dataset:** Sample Superstore
- **Source:** [Sample Superstore dataset](https://csvbase.com/mdfarragher/Superstore/details)
- **Period:** 2014–2017
- **Records:** 9,994
- **Currency:** US dollars

The dataset includes order dates, customer information, product categories, regions, sales, quantities, discounts and recorded profit.

The dataset does not provide a separate unit-cost or sales-target field. Therefore, the analysis focuses on recorded profit and profit margin rather than gross margin or sales-target achievement.

## 4. Tools and Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data inspection, validation, PivotTables and summary reporting |
| SQL (SQLite) | Data exploration, aggregation and business analysis |
| Power BI | Planned interactive dashboard |
| Power Query and DAX | Planned data transformation and dashboard calculations |

## 5. Project Methodology

1. Obtained and inspected the dataset.
2. Checked data quality, record counts and selected fields for missing values and duplicate Row IDs.
3. Analysed sales, profit and profit margin in Excel.
4. Developed SQL queries to answer six business questions.
5. Interpreted the results and documented business recommendations.
6. Plan to develop an interactive dashboard and compare its results against the existing analysis.

## 6. Key Performance Indicators

The analysis uses the following core measures:

- Total sales
- Total profit
- Profit margin
- Sales and profit by category and sub-category
- Sales and profit by region
- Product-level losses
- Profitability across discount levels

## 7. Key Findings

The completed Excel and SQL analyses produced the following results:

| Metric | Result |
|---|---:|
| Total sales | $2,297,200.86 |
| Total profit | $286,397.02 |
| Overall profit margin | 12.47% |
| Technology category profit | $145,454.95 |
| Furniture category profit margin | 2.49% |
| West region profit margin | 14.94% |
| Central region profit margin | 7.92% |
| Tables sub-category profit | -$17,725.48 |

### Main Insights

- **Technology led category performance**, generating the highest sales and profit.
- **Furniture had a comparatively weak profit margin** of 2.49%, despite generating substantial sales.
- **Tables was the largest loss-making sub-category**, followed by Bookcases.
- **West was the strongest-performing region** by sales, profit and profit margin.
- **Central had the lowest regional profit margin**, indicating an area for further investigation.
- **Higher discount groups showed weaker profitability.** Discount groups from 30% to 80% recorded negative total profits in this dataset.

These are descriptive findings from historical data. They identify patterns and areas for investigation but do not establish that discounts or any single factor caused losses.

## 8. Business Recommendations

Based on the findings, the following actions are recommended:

1. Review Furniture pricing, costs and discount practices, particularly for Tables and Bookcases.
2. Monitor product-level profitability to identify and investigate significant losses.
3. Review high discount levels and assess whether promotional activities generate sufficient profit.
4. Investigate Central's lower profit margin by examining its product mix, pricing and discount patterns.
5. Continue monitoring strong-performing categories, including Technology, and the West region.
6. Develop a regular sales performance dashboard to monitor sales, profit, margins and areas of underperformance.

These recommendations would require further investigation before major business decisions are made.

## 9. Repository Contents

The repository contains project materials for the Excel and SQL analysis. The interactive dashboard and supporting presentation materials are planned deliverables.

Browse the repository files to explore the available queries, analysis and documentation.

## 10. Dashboard Preview

The interactive dashboard is still under development. Screenshots and a dashboard file will be added once the dashboard has been completed and validated.

## 11. Project Disclaimer

Sample Superstore is a fictional retail dataset used for educational and portfolio purposes. The findings do not represent the performance of an actual business.

This project is part of my professional development in data analytics and business intelligence, with a focus on translating data into practical business insights.
