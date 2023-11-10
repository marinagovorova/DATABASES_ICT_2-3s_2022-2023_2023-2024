-- Для Москвы
SELECT COUNT(*) AS total_calls_to_moscow
FROM international_call
WHERE call_zone_id = (SELECT call_zone_id FROM call_zone WHERE city = 'Moscow');

-- Для Лондона
SELECT COUNT(*) AS total_calls_to_london
FROM international_call
WHERE call_zone_id = (SELECT call_zone_id FROM call_zone WHERE city = 'London');

-- Для Парижа
SELECT COUNT(*) AS total_calls_to_paris
FROM international_call
WHERE call_zone_id = (SELECT call_zone_id FROM call_zone WHERE city = 'Paris');
