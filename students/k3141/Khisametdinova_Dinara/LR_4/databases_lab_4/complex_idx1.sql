-- Составной индекс на contract_id и client_id в таблице contract
CREATE INDEX idx_contract_client ON contract(client_id, contract_id);

-- Составной индекс на phone_number и contract_id в таблице phone_on_tariff
CREATE INDEX idx_phone_on_tariff_contract ON phone_on_tariff(contract_id, phone_on_tariff_number);

-- Составной индекс на phone_number и call_zone_id в таблице international_call для ускорения JOIN
CREATE INDEX idx_international_call_phone_zone ON international_call(phone_number, call_zone_id);

-- Составной индекс для таблицы international_call, который может помочь в фильтрации по датам и агрегации
CREATE INDEX idx_international_call_date_zone ON international_call(call_zone_id, international_call_start_time, international_call_end_time);
