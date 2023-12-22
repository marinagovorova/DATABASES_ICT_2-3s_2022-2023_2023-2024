SELECT client.client_id, SUM(EXTRACT(EPOCH FROM (domestic_call.call_end_time - domestic_call.call_start_time))) AS total_domestic_duration
FROM client
JOIN contract ON client.client_id = contract.client_id
JOIN phone_on_tariff ON contract.contract_id = phone_on_tariff.contract_id
JOIN domestic_call ON domestic_call.phone_number = domestic_call.phone_number
WHERE domestic_call.call_start_time >= '2022-01-01' AND domestic_call.call_end_time <= '2022-01-31'
GROUP BY client.client_id;

SELECT 
  client.client_id, 
  SUM(duration_minutes) AS total_duration_minutes
FROM 
  (
    SELECT 
      client.client_id, 
      EXTRACT(EPOCH FROM (domestic_call.call_end_time - domestic_call.call_start_time)) / 60 AS duration_minutes
    FROM 
      client
    JOIN contract ON client.client_id = contract.client_id
    JOIN phone_on_tariff ON contract.contract_id = phone_on_tariff.contract_id
    JOIN domestic_call ON phone_on_tariff.phone_on_tariff_number = domestic_call.phone_number
    WHERE 
      domestic_call.call_start_time >= '2000-01-01' AND 
      domestic_call.call_end_time <= '2022-01-31'

    UNION ALL

    SELECT 
      client.client_id, 
      EXTRACT(EPOCH FROM (international_call.international_call_end_time - international_call.international_call_start_time)) / 60 AS duration_minutes
    FROM 
      client
    JOIN contract ON client.client_id = contract.client_id
    JOIN phone_on_tariff ON contract.contract_id = phone_on_tariff.contract_id
    JOIN international_call ON phone_on_tariff.phone_on_tariff_number = international_call.phone_number
    WHERE 
      international_call.international_call_start_time >= '2000-01-01' AND 
      international_call.international_call_end_time <= '2022-01-31'
  ) AS combined_calls
GROUP BY 
  client.client_id;


INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (31, '84925489447', '2001-05-03 16:51:26', '2001-05-03 17:40:57', '84034176596', 16);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (32, '87972625997', '2016-09-23 12:16:19', '2016-09-23 13:01:25', '89991677667', 16);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (33, '84371531905', '2000-09-04 00:13:32', '2000-09-04 00:16:09', '86754876851', 18);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (34, '89622760197', '2017-08-09 05:11:22', '2017-08-09 05:13:39', '88803311209', 17);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (35, '89742497510', '2010-06-22 01:23:40', '2010-06-22 04:38:35', '82307566768', 16);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (36, '81539108668', '2004-10-03 02:29:31', '2004-10-03 10:04:15', '86300043270', 17);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (37, '88686637097', '2021-03-27 07:16:38', '2021-03-27 16:31:09', '81517335555', 16);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (38, '83164665019', '2003-01-05 22:58:43', '2003-01-05 23:21:03', '88963847481', 18);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (39, '84157873461', '2022-09-25 12:29:38', '2022-09-25 16:32:10', '80680854021', 16);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (40, '88686637097', '2023-01-11 20:18:06', '2023-01-11 22:09:58', '88427512477', 18);

INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (41, '88686637097', '2023-10-01 20:18:06', '2023-10-01 20:48:06', '88427505477', 2);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (42, '83939283170', '2023-10-23 16:19:05', '2023-10-23 16:39:05', '88007805173', 4);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (43, '84548540986', '2023-10-26 12:17:24', '2023-10-26 13:15:24', '83950008013', 5);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (44, '89175874533', '2023-10-27 18:25:57', '2023-10-27 19:25:57', '86924801576', 6);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (45, '87395751914', '2023-10-03 11:42:40', '2023-10-03 18:42:40', '81028402443', 14);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (46, '84608960717', '2023-10-02 12:38:06', '2023-10-02 14:58:06', '86600198499', 15);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (47, '83495694331', '2023-10-09 16:04:02', '2023-10-09 16:34:02', '85525676401', 29);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (48, '87816542499', '2023-10-08 12:42:37', '2023-10-08 16:42:37', '85666856990', 5);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (49, '81341681439', '2023-10-06 04:05:38', '2023-10-06 05:05:30', '84662915076', 5);

INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (201, '87127921928', '2023-10-03 21:52:31', '2023-10-03 23:52:31', '88125094548');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (202, '81290751976', '2023-10-01 03:51:21', '2023-10-01 04:51:21', '89415803323');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (203, '86948251411', '2023-10-04 11:14:04', '2023-10-04 12:14:04', '89246801095');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (204, '82884816243', '2023-10-08 10:16:29', '2023-10-08 12:15:29', '84557604220');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (205, '86948251411', '2023-10-02 10:21:40', '2023-10-02 12:25:45', '83833805987');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (206, '83253580355', '2023-10-09 05:58:30', '2023-10-09 05:59:30', '88939347162');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (207, '85411706214', '2023-10-06 02:15:38', '2023-10-06 03:10:38', '81453154633');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (208, '82651331557', '2023-10-12 17:14:15', '2023-10-12 19:16:15', '85768773631');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (209, '81351445183', '2023-10-05 04:01:07', '2023-10-05 09:01:07', '82303663629');
INSERT INTO "domestic_call" ("domestic_call_id", "phone_number", "call_start_time", "call_end_time", "domestic_callee_number") VALUES (210, '84445401791', '2023-10-07 00:08:53', '2023-10-07 01:08:53', '81655367593');

INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (50, '88686637097', '2022-10-01 20:18:06', '2022-10-01 20:48:06', '88427505478', 10);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (51, '83939283170', '2022-01-23 16:19:05', '2022-01-23 16:39:05', '88007805178', 4);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (52, '84548540986', '2022-12-26 12:17:24', '2022-12-26 13:15:24', '83950008018', 5);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (53, '89175874533', '2022-08-27 18:25:57', '2022-08-27 19:25:57', '86924801578', 2);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (54, '87395751914', '2022-05-03 11:42:40', '2022-05-03 18:42:40', '81028402448', 10);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (55, '84608960717', '2022-03-02 12:38:06', '2022-03-02 14:58:06', '86600198498', 10);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (56, '83495694331', '2022-07-09 16:04:02', '2022-07-09 16:34:02', '85525676408', 10);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (57, '87816542499', '2022-04-08 12:42:37', '2022-04-08 16:42:37', '85666856998', 5);
INSERT INTO "international_call" ("international_call_id", "phone_number", "international_call_start_time", "international_call_end_time", "international_callee_number", "call_zone_id") VALUES (58, '81341681439', '2022-06-06 04:05:38', '2022-06-06 05:05:30', '84662915078', 5);