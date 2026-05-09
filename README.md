# Atlys Visa Application — Funnel Drop-off Analysis

## Overview
This project analyses 8,514 real drop-off events from Atlys's 
visa application funnel to identify where users abandon, why, 
and what the product team can do about it.

Built independently during my Product Intern role at Atlys 
(Oct 2025 – April 2026).

**Tool:** PostgreSQL (Supabase)  
**Data:** Exported from internal Grafana dashboards  
**Scope:** 8,514 drop-off events across 4,799 unique users  
**Period:** Oct 2023 – April 2026  
**Notion Link** https://www.notion.so/Atlys-Visa-Funnel-Drop-off-Analysis-35b245328d638058bc9ae63a76c530fd?source=copy_link


---

## The Funnel
CLP → Apply Now → Travel Dates → Selfie → 
Passport → Application Review → Checkout → Transaction

---

## Key Findings

### 1. One step is responsible for 51% of all drop-offs
4,386 out of 8,514 abandonment events happen at the 
`decision_on_co_traveler` step. No other step comes close. 
This is not a funnel problem — it is one specific UX problem 
that needs fixing.

### 2. April 2026 saw a sudden 60x spike in drop-offs
Drop-offs went from 111 in March 2026 to 6,794 in April 2026. 
The spike was driven entirely by `decision_on_co_traveler` 
(3,472 drops) and `checkout` (1,336 drops) — pointing to 
either a product change or a sharp increase in new user 
traffic that exposed existing friction.

### 3. 416 high-intent users spent 30+ minutes and still left
These are not casual visitors. They invested significant time 
and abandoned anyway. 151 of them dropped at checkout — 
meaning they completed the entire application and did not pay. 
Payment friction or trust issues at the final step is the 
likely cause.

### 4. Retry behaviour reveals a product problem, not a user problem
794 users attempted the application more than once. One user 
tried 61 times across 6 different steps. Another failed at 
`decision_on_co_traveler` 47 times. When users retry this 
many times, the issue is not user error — it is a broken 
experience they cannot get past.

### 5. Dubai accounts for the highest drop-offs by city
1,224 drop-offs originate from Dubai — nearly 7x more than 
Sydney (164). Whether this reflects higher volume or a 
specific UX failure for UAE-based users requires further 
investigation with session-level data.

---

## Product Recommendations

| Finding | Recommendation |
|--------|----------------|
| 51% drop at co-traveler step | Make co-traveler optional, add "Skip for now" — revisit later in flow |
| April 2026 spike | Audit any product changes or campaigns launched in March–April 2026 |
| 151 checkout abandonments | Review payment gateway drop rates, add trust signals before payment |
| Users retrying 60+ times | Introduce application progress save so users resume instead of restart |
| Dubai concentration | Run targeted UX research for UAE market, check localisation gaps |

---

## SQL Concepts Used
- SELECT, WHERE, GROUP BY, ORDER BY, HAVING
- COUNT, AVG, MIN, MAX, ROUND
- DISTINCT, ILIKE
- Subqueries
- Self JOIN
- UNION ALL
- SUBSTRING for date extraction from application IDs

---

## Files
- `schema.sql` — Table creation scripts for all 8 tables
- `01_basic_exploration.sql` — Drop-off by step, device, 
   destination, city
- `02_dropoff_analysis.sql` — High intent users, time spent 
   analysis, Dubai deep dive
- `03_advanced_insights.sql` — Retry behaviour, subquery, 
   self JOIN, monthly spike, checkout segment
- `04_funnel_conversion.sql` — UNION ALL across MoM 
   conversion tables

---

*Data exported during Product Intern role at Atlys 
(Oct 2025 – May 2026). User PII present in raw data 
and not shared publicly.*
