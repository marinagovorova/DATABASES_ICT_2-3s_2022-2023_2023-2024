CREATE OR REPLACE VIEW client_calls_summary AS
SELECT 
  cl.client_id,
  COALESCE(SUM(dc.duration_minutes), 0) AS total_domestic_duration_minutes,
  COALESCE(SUM(ic.duration_minutes), 0) AS total_international_duration_minutes,
  COALESCE(COUNT(dc.domestic_call_id), 0) AS number_of_domestic_calls,
  COALESCE(COUNT(ic.international_call_id), 0) AS number_of_international_calls,
  STRING_AGG(DISTINCT cz.country, ', ') AS countries_called -- список стран международных звонков
FROM 
  client cl
JOIN contract ct ON cl.client_id = ct.client_id
JOIN phone_on_tariff pt ON ct.contract_id = pt.contract_id
LEFT JOIN (
  SELECT domestic_call_id, phone_number, EXTRACT(EPOCH FROM (call_end_time - call_start_time)) / 60 AS duration_minutes
  FROM domestic_call
  WHERE call_start_time >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND
        call_start_time < date_trunc('month', CURRENT_DATE)
) dc ON pt.phone_on_tariff_number = dc.phone_number
LEFT JOIN (
  SELECT international_call_id, phone_number, call_zone_id, EXTRACT(EPOCH FROM (international_call_end_time - international_call_start_time)) / 60 AS duration_minutes
  FROM international_call
  WHERE international_call_start_time >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND
        international_call_start_time < date_trunc('month', CURRENT_DATE)
) ic ON pt.phone_on_tariff_number = ic.phone_number
LEFT JOIN call_zone cz ON ic.call_zone_id = cz.call_zone_id
GROUP BY cl.client_id;
