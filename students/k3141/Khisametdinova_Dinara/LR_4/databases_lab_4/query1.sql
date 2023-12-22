SELECT 
  client_id, 
  SUM(duration_minutes) AS total_duration_minutes
FROM 
  (
    SELECT 
      cl.client_id, 
      EXTRACT(EPOCH FROM (dc.call_end_time - dc.call_start_time)) / 60 AS duration_minutes
    FROM 
      client cl
    JOIN contract ct ON cl.client_id = ct.client_id
    JOIN phone_on_tariff pt ON ct.contract_id = pt.contract_id
    JOIN domestic_call dc ON pt.phone_on_tariff_number = dc.phone_number
    WHERE 
      dc.call_start_time >= '2000-01-01' AND 
      dc.call_end_time <= '2022-01-31'

    UNION ALL

    SELECT 
      cl.client_id, 
      EXTRACT(EPOCH FROM (ic.international_call_end_time - ic.international_call_start_time)) / 60 AS duration_minutes
    FROM 
      client cl
    JOIN contract ct ON cl.client_id = ct.client_id
    JOIN phone_on_tariff pt ON ct.contract_id = pt.contract_id
    JOIN international_call ic ON pt.phone_on_tariff_number = ic.phone_number
    WHERE 
      ic.international_call_start_time >= '2000-01-01' AND 
      ic.international_call_end_time <= '2022-01-31'
  ) combined_calls
GROUP BY 
  client_id;
