<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=6F4E37&height=220&section=header&text=Coffee%20Shop%20Sales%20Dashboard&fontSize=42&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=SQL%20%7C%20Power%20BI%20%7C%20DAX%20%7C%20Power%20Query%20%7C%20Excel&descAlignY=58&descSize=18" width="100%"/>

<img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&size=22&duration=3000&pause=800&color=6F4E37&center=true&vCenter=true&width=650&lines=Turning+raw+coffee+shop+transactions+into+insight;Built+with+MySQL+%2B+Power+BI+%2B+DAX;3+Pages+%7C+KPI+Cards+%7C+Trend+%26+Growth+Analysis;Designed+for+real+business+decision-making" alt="Typing SVG" />

<br/>

<img src="https://readme-typing-svg.demolab.com/?font=Georgia&size=26&duration=4000&pause=1200&color=6F4E37&center=true&vCenter=true&width=500&height=50&lines=Crafted+by+Gatil+Dhawan;Data+Analyst+%7C+BI+Developer" alt="Author Typing SVG" />

<br/><br/>

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-6F4E37?style=for-the-badge&logo=microsoft&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=databricks&logoColor=white)
![Power Query](https://img.shields.io/badge/Power%20Query-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

</div>

---

## ☕ About This Project

**Coffee Shop Sales Dashboard** is an end-to-end analytics project — from raw transactional data to a polished, interactive Power BI report — built on real data from a multi-location coffee shop business. It goes beyond "pretty charts" — it's designed to answer the questions a business stakeholder actually asks: *Where are we growing? Where are we losing ground? Which products and locations drive revenue? When are we busiest?*

The workflow mirrors a real analyst's process: **MySQL** is used first to clean and standardize the raw data and validate core KPIs with hand-written queries (including CTEs and window functions for month-over-month growth), and **Power BI + DAX** is used to turn that validated data into an interactive, decision-ready dashboard.

This project was built to demonstrate practical **Data Analyst** skills: SQL data cleaning, KPI validation, data modeling, DAX measure design, interactive UX (slicers, tooltips, drill-through), and dashboard storytelling — not just default visuals dropped on a canvas.

---

## 🚀 Project Highlights

<div align="center">

| | | |
|---|---|---|
| ✔ Interactive Power BI Dashboard | ✔ Dynamic KPI Cards | ✔ SQL Data Analysis |
| ✔ Power Query Data Transformation | ✔ Advanced DAX Measures | ✔ Interactive Tooltips |
| ✔ Calendar Heatmap | ✔ Dynamic Filtering | ✔ Business Intelligence Reporting |

</div>

---

## 🖼️ Dashboard Preview

<div align="center">

### Main Sales Report
<img src="https://github.com/user-attachments/assets/44730ed6-8888-4e87-a08d-2095fde5f13c" width="100%" />

<br><br>

<table>
<tr>
  <td align="center"><b>Calendar Tooltip</b></td>
  <td align="center"><b>Hour & Day Tooltip</b></td>
</tr>
<tr>
  <td><img src="https://github.com/user-attachments/assets/f1476606-affa-481f-8f41-6b535e7ce44c" width="430"/></td>
  <td><img src="https://github.com/user-attachments/assets/e98b21bc-eaca-444f-9b14-a899df229a46" width="430"/></td>
</tr>
</table>

</div>

---

## 📚 Table of Contents

- [About This Project](#-about-this-project)
- [Project Highlights](#-project-highlights)
- [Dashboard Preview](#️-dashboard-preview)
- [Business Questions Answered](#-business-questions-answered)
- [SQL Data Prep & KPI Validation](#-sql-data-prep--kpi-validation)
- [Report Structure](#-report-structure)
- [Data Model](#-data-model)
- [Key DAX Measures](#-key-dax-measures)
- [Tools & Tech Stack](#️-tools--tech-stack)
- [Business Value](#-business-value)
- [Key Insights](#-key-insights)
- [How to Use This Report](#-how-to-use-this-report)
- [Repository Structure](#-repository-structure)
- [Future Enhancements](#-future-enhancements)
- [Skills Demonstrated](#-skills-demonstrated)
- [Author](#-author)
- [Connect With Me](#-connect-with-me)

---

## ❓ Business Questions Answered

- 📈 What's our **Total Sales, Total Orders, and Total Quantity Sold**, and how are they trending month over month?
- 📊 What is the **Month-over-Month growth (%) and absolute change** in sales, orders, and quantity?
- 🗓️ How do sales vary by **day of week, weekday vs. weekend, and hour of day**?
- 🏬 Which **store locations** are outperforming or underperforming?
- ☕ Which **product categories and product types** generate the most revenue?
- 📅 What does the **daily average sales** trend look like across the selected month?

---

## 🐬 SQL Data Prep & KPI Validation

Before the data ever reached Power BI, it was cleaned and validated in **MySQL**. This step matters for interviews — it shows the numbers on the dashboard aren't just "whatever Power BI computed," they were independently verified with hand-written SQL.

<details>
<summary><b>1. Data cleaning — fixing data types on import</b></summary>

<br/>

Raw `transaction_date` and `transaction_time` came in as text, so they're converted to proper `DATE` / `TIME` types (a common real-world data-cleaning step), and the malformed `transaction_id` column header (a UTF-8 BOM artifact, `ï»¿transaction_id`) is renamed:

```sql
UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%Y/%m/%d');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;

ALTER TABLE coffee_shop_sales
CHANGE COLUMN `ï»¿transaction_id` transaction_id INT;
```

</details>

<details>
<summary><b>2. Total Sales for a given month</b></summary>

<br/>

```sql
SELECT ROUND(SUM(unit_price * transaction_qty)) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5;   -- May
```

</details>

<details>
<summary><b>3. Total Orders for a given month</b></summary>

<br/>

```sql
SELECT COUNT(*) AS total_orders
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 3;   -- March
```

</details>

<details>
<summary><b>4. Total Quantity Sold for a given month</b></summary>

<br/>

```sql
SELECT SUM(transaction_qty) AS total_qty
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5;   -- May
```

</details>

<details>
<summary><b>5. Month-over-Month % change in Orders</b> (CTE + window function)</summary>

<br/>

Using a CTE + window function (`LAG`) to compare each month to the one before it:

```sql
WITH mon_sales AS (
    SELECT
        MONTH(transaction_date) AS month,
        COUNT(transaction_id) AS total_orders
    FROM coffee_shop_sales
    WHERE MONTH(transaction_date) IN (4, 5)
    GROUP BY MONTH(transaction_date)
)
SELECT
    month,
    ROUND(total_orders) AS total_orders,
    ROUND(
        (total_orders - LAG(total_orders, 1) OVER (ORDER BY month))
        / LAG(total_orders, 1) OVER (ORDER BY month) * 100, 2
    ) AS mom_increase_percentage
FROM mon_sales
ORDER BY month;
```

</details>

<details>
<summary><b>6. Month-over-Month % change in Quantity Sold</b></summary>

<br/>

Same `LAG` pattern applied to quantity:

```sql
WITH mon_qty AS (
    SELECT
        MONTH(transaction_date) AS month,
        SUM(transaction_qty) AS total_qty
    FROM coffee_shop_sales
    WHERE MONTH(transaction_date) IN (4, 5)
    GROUP BY MONTH(transaction_date)
)
SELECT
    month,
    ROUND(total_qty) AS total_qty,
    ROUND(
        (total_qty - LAG(total_qty, 1) OVER (ORDER BY month))
        / LAG(total_qty, 1) OVER (ORDER BY month) * 100, 2
    ) AS mom_increase_percentage
FROM mon_qty
ORDER BY month;
```

</details>

📄 Full script: [`Business_Queries.sql`](Business_Queries.sql)

---

## 🧭 Report Structure

The `.pbix` contains **3 report pages**, each with a specific analytical purpose:

| Page | Purpose |
|---|---|
| **Page 1 – Sales Report** | Primary dashboard: KPI cards (Total Sales, Orders, Quantity, Daily Avg Sales, MoM growth), monthly trend line charts, product category/type breakdowns (donut, clustered bar, column charts), store location performance, and a pivot table for granular exploration. Includes a **Month Year slicer** for interactive filtering. |
| **Tooltip: Calendar Chart** | Custom hover tooltip surfacing daily KPIs (sales, orders, category split) when hovering over the calendar/trend visual — adds context without cluttering the main canvas. |
| **Tooltip: Day & Hour Chart** | Custom hover tooltip breaking down performance by **hour of day**, helping identify peak trading hours. |

---

## 🗂️ Data Model

<div align="center">
<img src="https://github.com/user-attachments/assets/91e3b783-2e31-4cfb-89c5-952ee83d1641" width="85%" alt="Data Model Diagram"/>
  
</div>

<br/>

This report is built on a clean **Star Schema** — the industry-standard approach for BI modeling — rather than a single flat table. This design was chosen deliberately for three reasons:

- **Fact Table (`Transactions`)** — holds the granular, transactional-level data (product, price, quantity, store, timestamp) and all quantitative measures used across the report.
- **Date Dimension (`Date Table`)** — a dedicated, marked date table that powers accurate time intelligence (Month-over-Month growth, weekday/weekend splits, hour-of-day trends) instead of relying on the raw transaction date directly.
- **Optimized Relationships** — single-direction, one-to-many relationships between the Date dimension and the fact table keep the model fast, predictable, and free of ambiguous filter paths.

The result is **better analytical performance**, simpler DAX, and a model that scales cleanly if more dimensions (e.g., staff, promotions, suppliers) are added later.

```
┌─────────────────────┐        ┌──────────────────────┐
│      Date Table       │ 1 ──── * │      Transactions      │
├─────────────────────┤        ├──────────────────────┤
│ Date                   │        │ transaction_date       │
│ Month Year             │        │ product_category       │
│ Day Name               │        │ product_type           │
│ Day Number             │        │ store_location          │
│ Week Number            │        │ Total Sales (measure)   │
│ Weekday / Weekend      │        │ Total Orders (measure)  │
└─────────────────────┘        │ Total Quantity Sold (m) │
                                    │ Mom Growth & Diff (m)   │
                                    │ Daily Avg Sales (m)     │
                                    └──────────────────────┘
```

---

## 🧮 Key DAX Measures

A sample of the core measures powering the report:

```dax
Total Sales = SUMX(Transactions, Transactions[transaction_qty] * Transactions[unit_price])

Total Orders = DISTINCTCOUNT(Transactions[transaction_id])

Total Quantity Sold = SUM(Transactions[transaction_qty])

Daily Avg Sales =
DIVIDE([Total Sales], DISTINCTCOUNT('Date Table'[Date]))

MoM Growth (Sales) =
VAR CurrentMonth = [Total Sales]
VAR PreviousMonth =
    CALCULATE([Total Sales], DATEADD('Date Table'[Date], -1, MONTH))
RETURN
    DIVIDE(CurrentMonth - PreviousMonth, PreviousMonth)
```

---

## 🛠️ Tools & Tech Stack

<div align="center">

![MySQL](https://img.shields.io/badge/-MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/-Power%20BI%20Desktop-F2C811?style=flat-square&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/-DAX-6F4E37?style=flat-square)
![Power Query](https://img.shields.io/badge/-Power%20Query%20(M)-217346?style=flat-square)
![Excel](https://img.shields.io/badge/-Excel-217346?style=flat-square&logo=microsoftexcel&logoColor=white)
![Data Modeling](https://img.shields.io/badge/-Star%20Schema%20Modeling-blue?style=flat-square)

</div>

- **MySQL** — data cleaning (type casting, date/time parsing) and KPI validation via CTEs and window functions
- **Power BI Desktop** — report design, visuals, layout, theming
- **Power Query (M)** — data cleaning and shaping before load
- **DAX** — calculated measures, time intelligence, KPI logic
- **Excel** — supplementary ad-hoc validation and quick-look analysis
- **Data Modeling** — star schema with a dedicated Date dimension

---

## 📈 Business Value

This dashboard isn't just a reporting exercise — it's built to support real operational and strategic decisions:

| Business Need | How This Dashboard Helps |
|---|---|
| 📊 **Monitor KPIs** | Real-time visibility into Total Sales, Orders, Quantity, and Daily Average Sales at a glance |
| 🏬 **Compare Store Performance** | Location-level breakdowns highlight top and bottom performers across the network |
| ☕ **Analyze Product Demand** | Category and product-type breakdowns reveal what customers actually want |
| 👥 **Improve Staffing** | Hour-of-day and weekday/weekend trends help align staff schedules with real demand |
| 📦 **Optimize Inventory** | Product-level sales trends help avoid overstocking slow movers and understocking bestsellers |
| 💰 **Increase Revenue** | Growth tracking (MoM %) makes it easy to spot momentum shifts early and act on them |

---

## 💡 Key Insights

- ☕ **Coffee** generated the highest revenue (**$60.36K**), making it the strongest-performing product category.
- 🥤 **Barista Espresso** was the best-selling product, contributing approximately **$20.42K** in sales.
- 🏪 **Hell's Kitchen** recorded the highest sales (**$52.60K**), closely followed by **Astoria**.
- 📅 **Weekdays accounted for 74.41%** of total sales, while weekends contributed **25.59%**, indicating significantly higher weekday demand.
- ⏰ Sales activity peaked during the **morning and early afternoon (8 AM–10 AM)**, making these the busiest operating hours.
- 📈 Total sales reached **$157K**, with **33,527 orders** and **48,233 units sold** during the selected month.
- 📊 Daily sales remained consistently around the average daily sales of **$5.06K**, indicating stable business performance throughout the month.

---

## 🚀 How to Use This Report

1. **Clone this repository**
   ```bash
   git clone https://github.com/gatil1616/Coffee--Shop-Sales-Analytics.git
   ```
2. *(Optional)* Run **`Business_Queries.sql`** against your own MySQL instance to see the raw data cleaning and KPI-validation steps.
3. **Open `Coffee.pbix`** in [Power BI Desktop](https://www.microsoft.com/en-us/power-platform/products/power-bi/downloads) (free download).
4. Use the **Month Year slicer** on Page 1 to filter the entire report.
5. Hover over the calendar and hour/day visuals to trigger the **custom tooltips**.
6. Explore the **pivot tables** for line-item level detail behind any KPI.

---

## 📁 Repository Structure

```
Coffee-Shop-Sales-Analytics/
│
├── Dashboard/
│   └── Coffee.pbix                # Main Power BI report file
│
├── Dataset/
│   └── coffee_shop_sales.csv      # Raw transactional data
│
├── SQL Scripts/
│   └── Business_Queries.sql       # SQL data cleaning + KPI validation queries
│
├── Documentation/
│   └── Data Model.png             # Data model / star schema diagram
│
├── README.md                       # You are here
└── LICENSE
```

> 📌 *Note: this is the target folder layout as the repo scales. Currently `Coffee.pbix` and `Business_Queries.sql` sit at the project root — see the actual file list on GitHub for the live structure.*

---

## 🚀 Future Enhancements

- 🧩 **Customer Segmentation** — group customers/orders by behavior for targeted insights
- 🔮 **Sales Forecasting** — trend-based forecasting for upcoming months
- 🤖 **Predictive Analytics** — apply predictive models to anticipate demand shifts
- 📦 **Inventory Optimization** — connect sales velocity to stock-level recommendations
- ☁️ **Power BI Service Deployment** — publish to Power BI Service with scheduled refresh and row-level security

---

## 🎯 Skills Demonstrated

`SQL (MySQL)` · `Window Functions (LAG)` · `CTEs` · `Data Cleaning` · `Data Modeling` · `DAX` · `Power Query / ETL` · `Time Intelligence` · `KPI Design` · `Dashboard UX` · `Data Storytelling` · `Business Requirement Translation`

---

## 👤 Author

<div align="center">

<img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&weight=600&size=28&duration=2500&pause=1000&color=6F4E37&center=true&vCenter=true&width=450&lines=Gatil+Dhawan" alt="Name Typing SVG" />

**Data Analyst | BI Developer**

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/gatil1616)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/gatil-dhawan-474097340/)
[![Gmail](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:sandeepsks008@gmail.com)

</div>

---

## 📬 Connect With Me

<div align="center">

*If this project caught your interest, I'd love to talk about how I can bring this kind of analysis to your team.*

<img src="https://capsule-render.vercel.app/api?type=waving&color=6F4E37&height=100&section=footer" width="100%"/>

</div>
