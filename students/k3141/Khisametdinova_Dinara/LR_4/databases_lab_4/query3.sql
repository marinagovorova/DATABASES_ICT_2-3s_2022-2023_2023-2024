SELECT client.client_id, COUNT(*) AS total_international_calls
FROM client
JOIN contract ON client.client_id = contract.client_id
JOIN phone_on_tariff ON contract.contract_id = phone_on_tariff.contract_id
JOIN international_call ON phone_on_tariff.phone_on_tariff_number = international_call.phone_number
GROUP BY client.client_id;