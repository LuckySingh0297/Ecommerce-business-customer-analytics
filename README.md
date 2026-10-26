# E-Commerce Business & Customer Analytics

## Project Overview

This project analyzes Brazilian e-commerce data from the Olist dataset to understand order performance, delivery reliability, customer purchasing behavior, and regional sales patterns.

The project uses **Excel, MySQL, and Power BI** to perform data quality checks, analyze business performance, write SQL queries, and build an interactive dashboard.

The goal is to turn raw e-commerce data into useful business insights that can support better operational and customer-related decisions.

## Project Objectives

- Analyze overall order volume and order status.
- Understand order trends across months and years.
- Evaluate delivery performance and identify late deliveries.
- Analyze customer purchasing behavior, including repeat customers.
- Compare order volume and delivery performance across Brazilian states.
- Identify data quality issues and missing values.
- Present key performance indicators (KPIs) through a Power BI dashboard.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data quality checks, analysis, PivotTables, formulas, and dashboard preparation |
| MySQL | SQL queries, data validation, filtering, aggregation, and customer analysis |
| Power BI | Interactive dashboard and KPI visualization |
| DAX | Calculating business performance measures |
| Power Query | Importing and preparing data for Power BI |

## Dataset

The project uses the Brazilian e-commerce dataset from Olist.

The analysis primarily uses:

- `olist_orders_dataset.csv` — order IDs, customer IDs, order status, and order and delivery dates.
- `olist_customers_dataset.csv` — customer IDs and customer location details.

**Dataset source:** [Olist Brazilian E-Commerce Public Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The dataset contains approximately 99,441 unique orders in the orders table.

*Note: The dataset covers a historical period and ends partway through October 2018. The final months should therefore be interpreted as incomplete periods.*

## Project Workflow

### 1. Excel Analysis

Excel was used to explore the dataset and perform initial data quality checks.

Tasks completed:

- Checked order IDs for duplicates.
- Identified missing dates and investigated their relationship with order statuses.
- Analyzed order status distribution.
- Examined yearly and monthly order trends.
- Analyzed on-time and late deliveries.
- Compared order volumes and delivery performance across states.
- Examined one-time and repeat customers.
- Summarized item-price and freight values.
- Created an Excel dashboard with KPIs and charts.

### 2. SQL Analysis — MySQL

MySQL Workbench was used to query the orders and customers tables.

Tasks completed:

- Validated total records and distinct order IDs.
- Investigated missing dates and order statuses.
- Analyzed yearly and monthly order trends.
- Calculated delivered and canceled order metrics.
- Identified late deliveries and compared delivery performance across states.
- Joined orders with customer information.
- Analyzed customer counts and repeat purchasing behavior.
- Validated key results against the Excel analysis.

### 3. Power BI Dashboard

Power BI was used to present the analysis through KPI cards, charts, and tables.

The dashboard includes:

- Total Orders
- Delivered Orders
- Canceled Orders
- Delivery Rate
- Cancellation Rate
- On-Time Orders
- On-Time Delivery Rate
- Late Orders
- Late Delivery Rate
- Orders by Status
- Monthly Order Trend
- Order Status Distribution
- Orders by Customer State
- On-Time vs. Late Orders
- Late Delivery Rate by State
- Customer and state details

DAX measures were used to calculate the key performance indicators.

## Key Business Findings

| Metric | Result |
|---|---:|
| Total Orders | 99,441 |
| Unique Order IDs | 99,441 |
| Delivered Orders | 96,478 |
| Delivery Rate | 97.02% |
| Canceled Orders | 625 |
| Cancellation Rate | 0.63% |
| On-Time Orders | 88,649 |
| On-Time Rate | 89.15% |
| Late Orders | 7,827 |
| Late Rate | 7.87% |
| Unique Customers | 96,096 |
| Repeat Customers | 2,997 |
| Repeat Customer Rate | 3.12% |

*Delivery and cancellation rates use total orders as the denominator. On-time and late rates shown above also use total orders, so these percentages should not be interpreted as percentages of delivered orders only.*

### Additional Insights

- **Order trends:** 2018 had the highest order volume among the years analyzed, with 54,011 orders.
- **Busiest month:** November 2017 recorded 7,544 orders.
- **Regional concentration:** São Paulo (SP) had the highest order volume, with 41,746 orders.
- **Late delivery volume:** São Paulo also recorded the highest number of late orders, at 2,387.
- **Regional delivery performance:** Alagoas (AL) had an estimated late-delivery rate of approximately 23.93% among eligible delivered orders, highlighting an area for further investigation.
- **Customer behavior:** The majority of customers placed only one order, while 2,997 customers placed repeat orders.

## Data Quality Findings

The project identified the following data quality issues:

| Data Quality Check | Finding |
|---|---:|
| Duplicate order IDs | 0 |
| Missing approval dates | 160 |
| Missing carrier handoff dates | 1,783 |
| Missing customer delivery dates | 2,965 |

Missing delivery-related dates were investigated alongside order statuses because canceled, unavailable, and in-progress orders may not have completed every delivery milestone.

These findings demonstrate why data quality checks are important before calculating business KPIs.

## Important Interpretation Notes

- Item price and freight are transaction-related values, **not profit**.
- The overall late-delivery rate and the state-level late-delivery rate use different denominators.
- The state-level late-delivery rate uses delivered orders with recorded customer delivery dates.
- Missing dates do not automatically indicate an error; their meaning depends on the order status and business process.
- Partial months at the end of the dataset should not be compared directly with complete months.

## Repository Structure

```text
ecommerce-business-customer-analytics/
│
├── README.md
│
├── excel/
│   └── Project_1_Working.xlsx
│
├── sql/
│   └── your-existing-sql-script.sql
│
├── power-bi/
│   └── Project_1_Ecommerce_Analytics.pbix
│
├── docs/
│   └── Project_1_Ecommerce_Business_Customer_Analytics_Summary.docx
│
└── images/
    └── dashboard-screenshot.png
```

*The folder structure above is the recommended layout. Upload the files you have, use your existing SQL script's actual filename, and include the dashboard screenshot if available.*

## Skills Demonstrated

- Data cleaning and data quality validation
- Excel formulas, PivotTables, and dashboard preparation
- SQL querying, filtering, aggregation, and joins
- Business KPI calculation and interpretation
- Customer and regional analysis
- Delivery performance analysis
- Power BI dashboard development
- DAX measures
- Data-driven business insight generation

## Conclusion

This project demonstrates an end-to-end business analytics workflow, from initial data quality checks and exploratory analysis to SQL-based investigation and interactive Power BI reporting.

The analysis highlights order performance, delivery reliability, customer purchasing patterns, and regional differences. It also demonstrates how multiple analytical tools can be used together to validate results and communicate business findings.

