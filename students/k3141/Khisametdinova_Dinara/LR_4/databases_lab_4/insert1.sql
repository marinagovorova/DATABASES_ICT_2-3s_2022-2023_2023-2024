INSERT INTO payment (phone_number, payment_date, payment_amount, payment_status)
SELECT
    pot.phone_on_tariff_number,
    CURRENT_DATE,
    100.00, 
    true 
FROM 
    phone_on_tariff pot
JOIN contract c ON pot.contract_id = c.contract_id
JOIN client cl ON c.client_id = cl.client_id
WHERE 
    pot.tariff_id IN (SELECT tariff_id FROM basic_tariff WHERE gb_amount > 10)
AND NOT EXISTS (
    SELECT 1 FROM payment p
    WHERE p.phone_number = pot.phone_on_tariff_number
      AND p.payment_date = CURRENT_DATE
);

