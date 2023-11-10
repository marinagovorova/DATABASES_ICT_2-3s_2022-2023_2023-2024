-- Индекс на client_id в таблице client
CREATE INDEX idx_client_id ON client(client_id);

-- Индекс на contract_id в таблице contract
CREATE INDEX idx_contract_id ON contract(contract_id);

-- Индекс на phone_number в таблице phone_on_tariff
CREATE INDEX idx_phone_on_tariff_number ON phone_on_tariff(phone_number);

-- Индекс на call_zone_id в таблице international_call
CREATE INDEX idx_international_call_zone_id ON international_call(call_zone_id);

-- Индекс на international_call_start_time и international_call_end_time для фильтрации
CREATE INDEX idx_international_call_times ON international_call(international_call_start_time, international_call_end_time);
