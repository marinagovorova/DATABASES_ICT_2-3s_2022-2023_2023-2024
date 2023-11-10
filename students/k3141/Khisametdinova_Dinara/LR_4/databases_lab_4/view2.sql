CREATE OR REPLACE VIEW most_popular_call_zone_yearly AS
SELECT 
  cz.call_zone_id, 
  cz.city, 
  cz.country,
  COUNT(*) AS call_count
FROM 
  international_call ic
JOIN call_zone cz ON ic.call_zone_id = cz.call_zone_id
WHERE 
  ic.international_call_start_time >= date_trunc('year', CURRENT_DATE - INTERVAL '1 year') AND
  ic.international_call_start_time < date_trunc('year', CURRENT_DATE)
GROUP BY 
  cz.call_zone_id, cz.city, cz.country
ORDER BY 
  call_count DESC
LIMIT 1;
