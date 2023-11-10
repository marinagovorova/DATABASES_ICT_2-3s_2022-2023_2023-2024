DELETE FROM contract
WHERE client_id IN (
    SELECT cl.client_id
    FROM client cl
    JOIN phone_on_tariff pot ON cl.client_id = (
        SELECT ct.client_id
        FROM contract ct
        WHERE ct.client_id = cl.client_id
        LIMIT 1
    )
    LEFT JOIN external_service_inclusion esi ON pot.phone_on_tariff_number = esi.phone_number
    WHERE esi.external_service_id IS NULL -- Нет активных услуг
      AND pot.current_balance < (
          SELECT AVG(p.current_balance)
          FROM phone_on_tariff p
          WHERE p.tariff_id = pot.tariff_id
      )
      AND pot.deletion_date IS NULL -- Активные тарифы
)
AND NOT EXISTS (
    -- Убедимся, что у клиента нет активных звонков
    SELECT 1
    FROM phone_on_tariff pt
    JOIN domestic_call dc ON pt.phone_on_tariff_number = dc.phone_number
    WHERE pt.contract_id = contract.contract_id
      AND dc.call_start_time > CURRENT_DATE - INTERVAL '1 year'
);
