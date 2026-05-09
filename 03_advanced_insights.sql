# Which steps took users longest before they gave up?
SELECT 
  "DropOff Step",
  COUNT(*) AS total_users,
  ROUND(AVG("Time Spent (in mins)"), 2) AS avg_mins,
  ROUND(MIN("Time Spent (in mins)"), 2) AS min_mins,
  ROUND(MAX("Time Spent (in mins)"), 2) AS max_mins
FROM funnel_dropoffs
GROUP BY "DropOff Step"
ORDER BY avg_mins DESC; 

# Users with more than 1 distinct application
SELECT 
  "UserId",
  COUNT(DISTINCT "ApplicationId") AS total_attempts,
  COUNT(DISTINCT "DropOff Step") AS unique_steps_failed
FROM funnel_dropoffs
GROUP BY "UserId"
HAVING COUNT(DISTINCT "ApplicationId") > 1
ORDER BY total_attempts DESC;

# Users are attemptinh and failing where?
SELECT 
  "UserId",
  "DropOff Step",
  COUNT(*) AS times_failed_here
FROM funnel_dropoffs
WHERE "UserId" IN (
  SELECT "UserId" 
  FROM funnel_dropoffs 
  GROUP BY "UserId" 
  HAVING COUNT(DISTINCT "ApplicationId") > 1
)
GROUP BY "UserId", "DropOff Step"
ORDER BY times_failed_here DESC;

# Which month had most drop-off?
SELECT 
  SUBSTRING("ApplicationId", 1, 7) AS date,
  "DropOff Step",
  COUNT(*) AS dropoffs
FROM funnel_dropoffs
GROUP BY date, "DropOff Step"
ORDER BY dropoffs DESC;

# For selected destinations, at which funnel step are users dropping off most?
SELECT 
  "Destination",
  "DropOff Step",
  COUNT(*) AS dropoffs
FROM funnel_dropoffs
WHERE "Destination" IN ('US', 'MA', 'ID')
GROUP BY "Destination", "DropOff Step"
ORDER BY "Destination", dropoffs DESC;

# Which destinations and devices have the highest checkout abandonment?
(Identifies where payment/trust friction is worst by market and platform)
SELECT 
  "Destination",
  "Device",
  COUNT(*) AS checkout_dropoffs,
  ROUND(AVG("Time Spent (in mins)"), 2) AS avg_time_before_leaving
FROM funnel_dropoffs
WHERE "DropOff Step" ILIKE '%checkout%'
GROUP BY "Destination", "Device"
ORDER BY checkout_dropoffs DESC;


