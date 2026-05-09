# Is Dubai High volume or is their any specific problem there?
SELECT 
  "DropOff Step",
  COUNT(*) AS dropoffs
FROM funnel_dropoffs
WHERE "City" ILIKE 'dubai'
GROUP BY "DropOff Step"
ORDER BY dropoffs DESC;

# Sydney droppoffs compared to Dubai
SELECT 
  "DropOff Step",
  COUNT(*) AS dropoffs
FROM funnel_dropoffs
WHERE "City" ILIKE 'sydney'
GROUP BY "DropOff Step"
ORDER BY dropoffs DESC;

# Who spent serious time on this and still left - the most recoverable users
SELECT 
  "UserId",
  "Email",
  "Device",
  "Destination",
  "City",
  "DropOff Step",
  "Time Spent (in mins)"
FROM funnel_dropoffs
WHERE "Time Spent (in mins)" > 30
ORDER BY "Time Spent (in mins)" DESC;

# Where are high intent users dropping?
SELECT 
  "DropOff Step",
  COUNT(*) AS high_intent_dropoffs,
  ROUND(AVG("Time Spent (in mins)"), 2) AS avg_time_spent
FROM funnel_dropoffs
WHERE "Time Spent (in mins)" > 30
GROUP BY "DropOff Step"
ORDER BY high_intent_dropoffs DESC;

