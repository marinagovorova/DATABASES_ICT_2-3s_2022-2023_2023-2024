-- Составной индекс для фильтрации платежей во временном промежутке
CREATE INDEX idx_payment_date_phone_number ON payment(payment_date, phone_number);
