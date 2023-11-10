SELECT 
  client_id, 
  SUM(duration_minutes) AS total_night_duration_minutes
FROM 
  (
    SELECT 
      cl.client_id, 
      EXTRACT(EPOCH FROM (dc.call_end_time - dc.call_start_time)) / 60 AS duration_minutes,
      dc.call_start_time AT TIME ZONE 'UTC' as start_time_utc,
      dc.call_end_time AT TIME ZONE 'UTC' as end_time_utc
    FROM 
      client cl
    JOIN contract ct ON cl.client_id = ct.client_id
    JOIN phone_on_tariff pt ON ct.contract_id = pt.contract_id
    JOIN domestic_call dc ON pt.phone_on_tariff_number = dc.phone_number
    WHERE 
      (dc.call_start_time::time >= '22:00' OR dc.call_start_time::time < '06:00') AND
      (dc.call_end_time::time >= '22:00' OR dc.call_end_time::time < '06:00')

    UNION ALL

    SELECT 
      cl.client_id, 
      EXTRACT(EPOCH FROM (ic.international_call_end_time - ic.international_call_start_time)) / 60 AS duration_minutes,
      ic.international_call_start_time AT TIME ZONE 'UTC' as start_time_utc,
      ic.international_call_end_time AT TIME ZONE 'UTC' as end_time_utc
    FROM 
      client cl
    JOIN contract ct ON cl.client_id = ct.client_id
    JOIN phone_on_tariff pt ON ct.contract_id = pt.contract_id
    JOIN international_call ic ON pt.phone_on_tariff_number = ic.phone_number
    WHERE 
      (ic.international_call_start_time::time >= '22:00' OR ic.international_call_start_time::time < '06:00') AND
      (ic.international_call_end_time::time >= '22:00' OR ic.international_call_end_time::time < '06:00')
  ) combined_calls
GROUP BY 
  client_id;
