
-- =====================================================
-- SAMPLE SUPERSTORE: SALES ANALYSIS
-- Purpose: Analyse sales, profit and product performance
-- Database table: Sample-Superstore
-- =====================================================


-- BUSINESS QUESTION 1:
-- What are the overall sales, profit and profit margin?

SELECT
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(
        SUM("Profit") * 100.0 / SUM("Sales"), 2
    ) AS profit_margin_percentage
FROM "Sample-Superstore";


-- BUSINESS QUESTION 2:
-- Which product categories generate the most sales and profit?

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


-- BUSINESS QUESTION 3:
-- Which product sub-categories generate the most sales and profit?

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


-- BUSINESS QUESTION 4:
-- Which regions generate the most sales and profit?

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


-- BUSINESS QUESTION 5:
-- Which products are generating losses?

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


-- BUSINESS QUESTION 6:
-- How are discounts associated with profitability?

SELECT
    "Discount",
    COUNT(*) AS number_of_records,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    ROUND(
        SUM("Profit") * 100.0 / SUM("Sales"), 2
    ) AS profit_margin_percentage
FROM "Sample-Superstore"
GROUP BY "Discount"
ORDER BY "Discount" ASC;


-- END OF SALES ANALYSIS
