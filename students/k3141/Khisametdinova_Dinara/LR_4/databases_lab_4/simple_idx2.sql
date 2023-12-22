-- Индекс на client_id в таблице contract для улучшения связывания
CREATE INDEX idx_contract_client_id ON contract(client_id);

-- Индекс на contract_id в таблице phone_on_tariff для улучшения связывания
CREATE INDEX idx_phone_on_tariff_contract_id ON phone_on_tariff(contract_id);

-- Индекс на phone_number в таблице payment для улучшения связывания
CREATE INDEX idx_payment_phone_number ON payment(phone_number);

-- Индекс на payment_date в таблице payment для улучшения фильтрации по дате
CREATE INDEX idx_payment_payment_date ON payment(payment_date);
