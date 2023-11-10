UPDATE phone_on_tariff
SET current_balance = current_balance + 500
WHERE tariff_id IN (
    SELECT tariff_id FROM basic_tariff WHERE gb_amount < 100
)
AND phone_on_tariff_number IN (
    SELECT pot.phone_on_tariff_number
    FROM phone_on_tariff pot
    JOIN internal_service_inclusion isi ON pot.phone_on_tariff_number = isi.phone_number
    JOIN internal_service isv ON isi.internal_service_id = isv.internal_service_id 
    WHERE isv.internal_service_periodicity = 'yearly' 
)
AND phone_on_tariff_number NOT IN (
    -- Исключаю номера с количеством звонков выше среднего
    SELECT dc.phone_number
    FROM domestic_call dc
    GROUP BY dc.phone_number
    HAVING AVG(EXTRACT(EPOCH FROM (dc.call_end_time - dc.call_start_time))) > (
        SELECT AVG(EXTRACT(EPOCH FROM (d.call_end_time - d.call_start_time)))
        FROM domestic_call d
    )
); 