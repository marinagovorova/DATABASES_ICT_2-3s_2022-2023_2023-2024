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
  ic.international_call_start_time BETWEEN date_trunc('year', CURRENT_DATE - INTERVAL '1 year') AND (date_trunc('year', CURRENT_DATE) - INTERVAL '1 second')
GROUP BY 
  cz.call_zone_id, cz.city, cz.country
HAVING 
  COUNT(*) = (
    SELECT MAX(call_count) FROM (
      SELECT 
        COUNT(*) AS call_count
      FROM 
        international_call ic2
      JOIN call_zone cz2 ON ic2.call_zone_id = cz2.call_zone_id
      WHERE 
        ic2.international_call_start_time >= date_trunc('year', CURRENT_DATE - INTERVAL '1 year') AND
        ic2.international_call_start_time < date_trunc('year', CURRENT_DATE)
      GROUP BY 
        cz2.call_zone_id
    ) AS max_subquery
);
