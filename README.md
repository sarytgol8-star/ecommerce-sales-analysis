
# E-Commerce Sales Analytics

## Project Overview

This project analyzes the Brazilian E-Commerce Public Dataset by Olist using PostgreSQL, SQL, and Power BI.

The goal is to explore sales performance, order trends, product categories, and order fulfillment.

## Tools Used

- **PostgreSQL** — data storage and analysis
- **SQL** — data querying, joins, and aggregations
- **Power BI** — dashboard creation and visualization

## Key Metrics

| Metric | Value |
|---|---:|
| Total Sales Value | R$ 13,221,498.11 |
| Delivered Orders | 96,478 |
| Average Order Value | R$ 137.04 |
| Total Orders | 99,441 |

*Sales value represents product prices from delivered orders, excluding freight.*

## Key Findings

- November 2017 recorded the highest monthly sales value of R$ 987,765.37.
- Health & Beauty, Watches & Gifts, and Bed, Bath & Table were the leading product categories by sales value.
- Most orders were successfully delivered, while 625 orders were canceled.
- The category analysis covered 98.67% of total sales value. The remaining 1.33% could not be assigned to an English product category.

## Recommendations

- Investigate the November 2017 sales peak.
- Compare monthly sales values with order volumes.
- Analyze the reasons for canceled orders.
- Improve product category data completeness.

## Dataset

[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## Project Files

- `sql/` — SQL queries used for the analysis
- `dashboard/` — Power BI report and dashboard screenshot

## Dashboard

The interactive report was developed in Power BI and includes sales KPIs, monthly trends, category rankings, and order status analysis.
