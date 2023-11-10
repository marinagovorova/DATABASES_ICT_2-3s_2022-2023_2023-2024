EXPLAIN ANALYZE WITH CallDurations AS (
    SELECT 
        cl.client_id,
        ic.call_zone_id,
        EXTRACT(EPOCH FROM (ic.international_call_end_time - ic.international_call_start_time)) / 60 AS call_duration_minutes
    FROM 
        client cl
    JOIN contract ct ON cl.client_id = ct.client_id
    JOIN phone_on_tariff pt ON ct.contract_id = pt.contract_id
    JOIN international_call ic ON pt.phone_number = ic.phone_number
),
AverageDurations AS (
    SELECT 
        call_zone_id,
        AVG(call_duration_minutes) AS avg_call_duration_minutes
    FROM 
        CallDurations
    GROUP BY 
        call_zone_id
)
SELECT DISTINCT
    cd.client_id
FROM 
    CallDurations cd
JOIN 
    AverageDurations ad ON cd.call_zone_id = ad.call_zone_id
WHERE 
    cd.call_duration_minutes > ad.avg_call_duration_minutes;
