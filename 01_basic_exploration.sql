# Which step loses the most users?
SELECT 
  "DropOff Step",
  COUNT(*) AS total_dropoffs
FROM funnel_dropoffs
GROUP BY "DropOff Step"
ORDER BY total_dropoffs DESC;

# Which device does most drop-offs happen on?
SELECT 
  "Device",
  COUNT(*) AS total_dropoffs
FROM funnel_dropoffs
GROUP BY "Device"
ORDER BY total_dropoffs DESC;

# Which step is worse on each device?
SELECT 
  "Device",
  "DropOff Step",
  COUNT(*) AS dropoffs
FROM funnel_dropoffs
GROUP BY "Device", "DropOff Step"
ORDER BY "Device", dropoffs DESC;

# Which destination countries have most drop - off?
SELECT "Destination",
 COUNT (*) AS droppoffs
FROM funnel_dropoffs
WHERE "Destination" IS NOT NULL
Group by "Destination"
order by "droppoffs" DESC;
