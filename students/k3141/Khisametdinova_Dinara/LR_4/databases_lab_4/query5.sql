SELECT 
  cz.city, 
  COUNT(ic.*) AS total_calls
FROM 
  international_call ic
JOIN 
  call_zone cz ON ic.call_zone_id = cz.call_zone_id
WHERE 
  cz.city IN ('Moscow', 'London', 'Paris')
GROUP BY 
  cz.city;
