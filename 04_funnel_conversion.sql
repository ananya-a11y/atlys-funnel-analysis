# Average conversion rate at each funnel stage using UNION ALL (Combines all MoM tables to show where conversion drops across the full funnel)
SELECT 'CLP → Apply Now' AS funnel_stage,
       ROUND(AVG(conv_pct), 1) AS avg_conversion_pct
FROM mom_clp_apply
UNION ALL
SELECT 'CLP → Transaction',
       ROUND(AVG("Conv_pct"), 1)
FROM mom_clp_txn
UNION ALL
SELECT 'Travel Dates → Selfie',
       ROUND(AVG(conv_pct), 1)
FROM mom_travel_dates
UNION ALL
SELECT 'Selfie → Passport',
       ROUND(AVG(conv_pct), 1)
FROM mom_selfie_passport
UNION ALL
SELECT 'Passport → Review',
       ROUND(AVG(conv_pct), 1)
FROM mom_passport_review
UNION ALL
SELECT 'Review → Checkout',
       ROUND(AVG(conv_pct), 1)
FROM mom_review_checkout
UNION ALL
SELECT 'Checkout → Transaction',
       ROUND(AVG(conv_pct), 1)
FROM mom_checkout_txn;
