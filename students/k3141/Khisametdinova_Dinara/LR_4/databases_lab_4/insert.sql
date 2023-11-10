INSERT INTO external_service_inclusion (external_service_id, phone_number, external_service_date_of_connection)
SELECT 
    es.external_service_id,
    pot.phone_on_tariff_number,
    CURRENT_DATE
FROM 
    phone_on_tariff pot
JOIN (
    SELECT tariff_id, AVG(current_balance) as avg_balance
    FROM phone_on_tariff
    GROUP BY tariff_id
) as tariff_avg ON pot.tariff_id = tariff_avg.tariff_id
JOIN external_service es ON es.external_service_description = 'Описание услуги' 
WHERE 
    pot.current_balance > tariff_avg.avg_balance 
    AND pot.deletion_date IS NOT NULL 
    AND es.external_service_periodicity = 'monthly' 
    AND EXISTS (
        SELECT 1
        FROM external_service_inclusion esi 
        WHERE esi.phone_number = pot.phone_on_tariff_number
          AND esi.external_service_date_of_disconnection IS NOT NULL
    );
