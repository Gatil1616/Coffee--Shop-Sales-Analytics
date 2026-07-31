<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=6F4E37&height=220&section=header&text=Coffee%20Shop%20Sales%20Dashboard&fontSize=42&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=Power%20BI%20%7C%20DAX%20%7C%20Data%20Storytelling&descAlignY=58&descSize=18" width="100%"/>

<img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&size=22&duration=3000&pause=800&color=6F4E37&center=true&vCenter=true&width=650&lines=Turning+raw+coffee+shop+transactions+into+insight;Built+in+Microsoft+Power+BI+%2B+DAX;3+Pages+%7C+KPI+Cards+%7C+Trend+%26+Growth+Analysis;Designed+for+real+business+decision-making" alt="Typing SVG" />

<br/>

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-6F4E37?style=for-the-badge&logo=microsoft&logoColor=white)
![Excel](https://img.shields.io/badge/Data%20Prep-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

</div>

---

## ☕ About This Project

**Coffee Shop Sales Dashboard** is an end-to-end Power BI analytics project built on real transactional data from a multi-location coffee shop business. It goes beyond "pretty charts" — it's designed to answer the questions a business stakeholder actually asks: *Where are we growing? Where are we losing ground? Which products and locations drive revenue? When are we busiest?*

This project was built to demonstrate practical, job-ready **Data Analyst** skills: data modeling, DAX measure design, interactive UX (slicers, tooltips, drill-through), and dashboard storytelling — not just default visuals dropped on a canvas.


---

## 🖼️ Dashboard Preview

<div align="center">


| Main Sales Report | Calendar Tooltip | Hour & Day Tooltip |
|:---:|:---:|:---:|
| ![Main Page](<img width="1207" height="731" alt="Screenshot 2026-08-01 013217" src="https://github.com/user-attachments/assets/bce31797-c286-40fe-9033-81aa7def8017" />
) | ![Calendar Tooltip](assets/calendar_tooltip.png) | ![Hour Tooltip](assets/hour_tooltip.png) |

*(📁 Add your exported screenshots/GIF to an `assets/` folder in this repo and update the paths above — a live visual is what makes this README convert.)*

</div>

---

## 📚 Table of Contents

- [About This Project](#-about-this-project)
- [Dashboard Preview](#️-dashboard-preview)
- [Business Questions Answered](#-business-questions-answered)
- [Report Structure](#-report-structure)
- [Data Model](#-data-model)
- [Key DAX Measures](#-key-dax-measures)
- [Tools & Tech Stack](#️-tools--tech-stack)
- [Key Insights](#-key-insights)
- [How to Use This Report](#-how-to-use-this-report)
- [Repository Structure](#-repository-structure)
- [Skills Demonstrated](#-skills-demonstrated)
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

</div>

A dedicated **Date Table** (star-schema best practice) drives all time intelligence — enabling accurate month-over-month and weekday/weekend comparisons instead of relying on the raw transaction date directly.

---

## 🧮 Key DAX Measures

A sample of the core measures powering the report (naming reflects the actual `.pbix`):

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

*(Adjust to match your exact DAX syntax before publishing — this reflects the measure names and logic found in the report.)*

---

## 🛠️ Tools & Tech Stack

<div align="center">

![Power BI](https://img.shields.io/badge/-Power%20BI%20Desktop-F2C811?style=flat-square&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/-DAX-6F4E37?style=flat-square)
![Power Query](https://img.shields.io/badge/-Power%20Query%20(M)-217346?style=flat-square)
![Data Modeling](https://img.shields.io/badge/-Star%20Schema%20Modeling-blue?style=flat-square)

</div>

- **Power BI Desktop** — report design, visuals, layout, theming
- **Power Query (M)** — data cleaning and shaping before load
- **DAX** — calculated measures, time intelligence, KPI logic
- **Data Modeling** — star schema with a dedicated Date dimension

---

## 💡 Key Insights

> Replace the bullets below with your own findings once you've explored the filtered views — specific, numbers-backed insights are what make a portfolio piece stand out to a hiring manager.

- 🔥 *[e.g., "Store X location contributes the highest share of total revenue at __%"]*
- 📉 *[e.g., "Sales dip on [day] compared to weekday average by __%"]*
- ☕ *[e.g., "[Product category] is the top-selling category, driving __% of total quantity sold"]*
- ⏰ *[e.g., "Peak trading hour is [X AM/PM], suggesting staffing should be adjusted accordingly"]*

---

## 🚀 How to Use This Report

1. **Clone this repository**
   ```bash
   git clone https://github.com/[gatil1616]/coffee-shop-sales-dashboard.git
   ```
2. **Open `Coffee.pbix`** in [Power BI Desktop](https://www.microsoft.com/en-us/power-platform/products/power-bi/downloads) (free download).
3. Use the **Month Year slicer** on Page 1 to filter the entire report.
4. Hover over the calendar and hour/day visuals to trigger the **custom tooltips**.
5. Explore the **pivot tables** for line-item level detail behind any KPI.

---

## 📁 Repository Structure

```
coffee-shop-sales-dashboard/
│
├── Coffee.pbix              # Main Power BI report file
├── README.md                 # You are here
└── assets/                   # Screenshots / GIFs for this README
    ├── page1_preview.png
    ├── calendar_tooltip.png
    └── hour_tooltip.png
```

---

## 🎯 Skills Demonstrated

`Data Modeling` · `DAX` · `Power Query / ETL` · `Time Intelligence` · `KPI Design` · `Dashboard UX` · `Data Storytelling` · `Business Requirement Translation`

---

## 📬 Connect With Me

<div align="center">

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/[your-linkedin])
[![Gmail](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:[your-email@example.com])
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/[your-github-username])

*If this project caught your interest, I'd love to talk about how I can bring this kind of analysis to your team.*

<img src="https://capsule-render.vercel.app/api?type=waving&color=6F4E37&height=100&section=footer" width="100%"/>

</div>
