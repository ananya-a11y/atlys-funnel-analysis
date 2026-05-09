# Atlys-Funnel-Analysis
# Atlys Visa Application — Funnel Drop-off Analysis

## Overview
SQL-based analysis of 8,500+ real user records from Atlys's 
visa application funnel. The goal was to identify where, why, 
and who is being lost in the funnel — and surface actionable 
product recommendations.

**Tool:** PostgreSQL (Supabase)  
**Data:** Real funnel data from Atlys internship (Oct 2025 – May 2026)  
**Records analysed:** 8,514 drop-off events across 4,799 unique users

---

## Funnel Stages Analysed
CLP → Apply Now → Travel Dates → Selfie → 
Passport → Application Review → Checkout → Transaction

---

## Key Findings

### 1. One step kills 51% of the funnel
4,386 out of 8,514 drop-offs occur at the 
`decision_on_co_traveler` step — a single UX friction 
point responsible for more abandonment than all other 
steps combined.

### 2. 416 high-intent users lost at the last mile
416 users spent 30+ minutes on their application and 
still abandoned. 151 of them dropped specifically at 
checkout — indicating payment or trust friction at the 
final step.

### 3. Extreme retry behaviour signals broken UX
One user attempted the application 61 times across 6 
different steps. Hundreds of users retried 10+ times. 
This is not user error — it's a product problem.

### 4. April 2026 spike — 60x increase in drop-offs
Drop-offs jumped from ~111 in March 2026 to 6,794 in 
April 2026. Concentrated at [your finding from Query 11 
— fill in the step].

### 5. Dubai is the highest drop-off city
1,224 drop-offs from Dubai — 7x more than the next 
city. Requires investigation into whether this is a 
volume or conversion rate issue.

---

## Product Recommendations

| Finding | Recommendation |
|--------|----------------|
| Co-traveler step — 51% drop | Make co-traveler optional or add "Skip for now" CTA |
| 151 checkout abandonments | Investigate payment gateway friction, add trust signals |
| Retry users (61 attempts) | Add progress save feature so users don't restart |
| April spike | Correlate with product releases or marketing campaigns |
| Dubai drop-offs | Run localised UX research for UAE market |

---

## SQL Concepts Used
- SELECT, WHERE, GROUP BY, ORDER BY, HAVING
- COUNT, AVG, MIN, MAX, ROUND
- DISTINCT, ILIKE, BETWEEN
- Subqueries
- Self JOIN
- UNION ALL
- SUBSTRING for date extraction

---

## Files
- `schema.sql` — Table creation scripts
- `queries/01_basic_exploration.sql` — Foundational queries
- `queries/02_dropoff_analysis.sql` — Drop-off patterns
- `queries/03_advanced_insights.sql` — Retry behaviour, 
   subqueries, self JOIN
- `queries/04_funnel_conversion.sql` — UNION ALL across 
   MoM tables

---

*Data sourced during Product Intern role at Atlys 
(Oct 2025 – May 2026). User PII anonymised.*
