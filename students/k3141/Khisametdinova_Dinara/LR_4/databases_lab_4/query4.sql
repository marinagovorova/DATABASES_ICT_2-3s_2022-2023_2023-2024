SELECT client.client_id
FROM client
WHERE NOT EXISTS (
  SELECT 1
  FROM contract
  JOIN phone_on_tariff ON contract.contract_id = phone_on_tariff.contract_id
  JOIN payment ON phone_on_tariff.phone_on_tariff_number = payment.phone_number
  WHERE client.client_id = contract.client_id
    AND payment.payment_date >= date_trunc('month', current_date - interval '1 month')
    AND payment.payment_date < date_trunc('month', current_date)
)
GROUP BY client.client_id;
