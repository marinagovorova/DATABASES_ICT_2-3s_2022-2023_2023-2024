INSERT INTO academic_discipline (discipline_id, name, practical, lectures_labs, total_duration, attestation_type)
VALUES
    ('a0b33a1c-fa29-49d2-ba4d-d7cd8030e315', 'Математичекий анализ', 20, 10, 60, 'экзамен'),
    ('da1ab801-fbe0-42b1-a1b4-6a9c51d11a8f', 'Физика', 15, 15, 45, 'дифференциальный'),
    ('34c49c8b-62d2-4c1d-b08e-9dceb895e93e', 'Химия', 18, 12, 50, 'зачёт'),
    ('93a3e393-8c7b-427e-9a35-f15c4c96877a', 'Биология', 25, 5, 50, 'экзамен'),
    ('0c2547df-cfdb-4b24-ab12-ce06d409867e', 'Информатика', 30, 20, 100, 'дифференциальный');

INSERT INTO subdivision (subdivision_id, name)
VALUES
    ('f9b8e7ad-dea0-4423-a55c-8867686a3893', 'ФИКТ'),
    ('00085bcd-2521-4d68-8729-f6d1adca4b4a', 'ФИТИП');

INSERT INTO specialty (code, qualification, level, name, subdivision_id)
VALUES
    ('SPEC001', 'бакалавр', 'бакалавр', 'Прикладная информатика', 'f9b8e7ad-dea0-4423-a55c-8867686a3893'),
    ('SPEC002', 'магистр', 'магистр', 'Суперприкладная информатика', 'f9b8e7ad-dea0-4423-a55c-8867686a3893'),
    ('SPEC003', 'бакалавр', 'бакалавр', 'Неприкладная химическая информатика', '00085bcd-2521-4d68-8729-f6d1adca4b4a');

INSERT INTO education_programm (programm_code, programm_type, duration, specialty_code)
VALUES
    ('PROG001', 'основная', 4, 'SPEC001'),
    ('PROG002', 'основная', 2, 'SPEC002'),
    ('PROG003', 'основная', 4, 'SPEC003'),
    ('PROG004', 'основная', 3, 'SPEC003'),
    ('PROG005', 'ДПО', 5, 'SPEC003');

INSERT INTO enrollment (enrollment_id, programm_code, start_date, end_date)
VALUES
    ('b9e1343d-7a81-4a10-b3ea-aa32f0f833de', 'PROG001', '2023-09-01', '2027-07-01'),
    ('014cccbe-6104-4bd8-9187-96fb5a13cb2f', 'PROG002', '2023-09-01', '2025-07-01');

INSERT INTO programm_element (programm_element_id, enrollment_id, discipline_id)
VALUES
    ('85fcc7ad-4a06-4cd9-bf3d-736e98c8a3c5', 'b9e1343d-7a81-4a10-b3ea-aa32f0f833de', 'a0b33a1c-fa29-49d2-ba4d-d7cd8030e315'),
    ('002f0e3b-5821-4bdf-82b1-443d63a49245', 'b9e1343d-7a81-4a10-b3ea-aa32f0f833de', '0c2547df-cfdb-4b24-ab12-ce06d409867e'),
    ('57ac339f-d267-40d7-8397-e36c1e42a9ee', '014cccbe-6104-4bd8-9187-96fb5a13cb2f', 'a0b33a1c-fa29-49d2-ba4d-d7cd8030e315'),
    ('91bb9326-337d-433f-8f99-e548e4f5439a', '014cccbe-6104-4bd8-9187-96fb5a13cb2f', '34c49c8b-62d2-4c1d-b08e-9dceb895e93e');

INSERT INTO teacher (teacher_id, name, surname, patronymic, job_title)
VALUES
    ('72a13add-efca-49f0-bc53-fbb7e7be2d8c', 'Иван', 'Иванов', 'Иванович', 'доцент'),
    ('b6b06ff0-eba6-46f5-8263-8a6e1b6b6bb0', 'Николай', 'Иванов', 'Иванович', 'лаборант'),
    ('17a5c7a6-fb30-4ff9-b4d5-63fd6c20183e', 'Евгений', 'Иванов', 'Иванович', 'ассистент'),
    ('e89c4be9-4cbe-46f1-8333-870d697b400b', 'Василий', 'Иванов', 'Иванович', 'старший преподаватель'),
    ('6c0bbc51-93f8-479e-a828-2c71e08de423', 'Пётр', 'Иванов', 'Иванович', 'старший преподаватель'),
    ('064f78ca-718e-4c20-9bf8-3abee87114ca', 'Иван', 'Павлов', 'Иванович', 'лаборант'),
    ('000331af-1293-42eb-9dab-f7e000711a9d', 'Николай', 'Павлов', 'Иванович', 'доцент'),
    ('04645e63-c4a3-4da4-9ce6-b8ed4be50b79', 'Евгений', 'Павлов', 'Иванович', 'доцент'),
    ('42cea071-d15a-4a49-a0dd-c84d9c19e588', 'Василий', 'Павлов', 'Иванович', 'ассистент'),
    ('bc611abc-039c-4eea-b95f-3f6545d67c3f', 'Пётр', 'Павлов', 'Иванович', 'лаборант'),
    ('11914ea8-82fb-46c8-bef5-2e376ac2df97', 'Генадий', 'Павлов', 'Иванович', 'доцент');

INSERT INTO teaching_permit (teaching_permit_id, teacher_id, discipline_id, is_lecture_allowed)
VALUES 
    ('e8154868-46a7-49b2-85fb-73b55dbae406', '72a13add-efca-49f0-bc53-fbb7e7be2d8c', 'a0b33a1c-fa29-49d2-ba4d-d7cd8030e315', TRUE),
    ('55ef3562-ebc0-4145-aa51-4c5e1c455ca6', 'b6b06ff0-eba6-46f5-8263-8a6e1b6b6bb0', 'da1ab801-fbe0-42b1-a1b4-6a9c51d11a8f', TRUE),
    ('b3fd1bfe-73c6-4f4b-a731-2100ade8350d', '17a5c7a6-fb30-4ff9-b4d5-63fd6c20183e', '34c49c8b-62d2-4c1d-b08e-9dceb895e93e', TRUE),
    ('854aecc5-1ee6-4e51-a62a-19d1561fa8c9', '6c0bbc51-93f8-479e-a828-2c71e08de423', '93a3e393-8c7b-427e-9a35-f15c4c96877a', TRUE),
    ('c08a4832-ce5b-47a4-bf9b-a1bea746f1c3', '064f78ca-718e-4c20-9bf8-3abee87114ca', '0c2547df-cfdb-4b24-ab12-ce06d409867e', TRUE),
    ('d0c8d66b-a5fb-43ac-b68f-8a854c5a8e7d', '000331af-1293-42eb-9dab-f7e000711a9d', 'a0b33a1c-fa29-49d2-ba4d-d7cd8030e315', TRUE),
    ('bc608ced-1c2e-400a-ad78-51c24ae5268d', '72a13add-efca-49f0-bc53-fbb7e7be2d8c', 'da1ab801-fbe0-42b1-a1b4-6a9c51d11a8f', FALSE);

INSERT INTO building (building_id, address)
VALUES
    ('e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 'Кудыкина гора'),
    ('db687dd1-d0b8-4a87-b0c1-31427d197ef3', 'Кудыкина гора 2');

INSERT INTO classroom (classroom_id, number, type, building_id, capacity)
VALUES
    ('4bd4ffe8-f48f-4375-b99c-191ee70e0bcd', 101, 'лекционная', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 15),
    ('5c086288-5405-44a2-8d9e-d77a3eccd07a', 102, 'лекционная', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 5),
    ('b0edd76d-6c22-48ef-a67f-9264cfc35136', 103, 'малая', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 3),
    ('f61b1630-3d74-4ca6-a268-7cd1acdff2c2', 104, 'малая', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 3),
    ('58a8a07c-6f8c-4bea-9607-5c550d96a760', 105, 'малая', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 3),
    ('9df8d337-ec5a-4e49-872e-0e3cc0a0c01b', 101, 'лекционная', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 5),
    ('978e4cd8-5e50-4ea2-b2ca-fc5a7d7052d8', 102, 'лекционная', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 5),
    ('85122957-5ca5-4250-9469-76a6adcf0b14', 103, 'малая', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 30),
    ('5293bd6e-bf24-48f2-be0c-cabce465df46', 104, 'малая', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 3),
    ('96b7a61e-87be-4b76-b87c-519cf4b669ed', 105, 'малая', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 3);

INSERT INTO client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date)
VALUES
    ('132259da-3ddb-4bae-8d01-39414d808ad7', 'Василий', 'Василевский', 'Васильевич', 'vasyapupkin@mail.ru +7894595495409', '683426', 'GF34', '2022-05-01', '2028-05-01'),
    ('24fd3f29-ec14-4f51-bf76-2f9bf9181b67', 'Анна', 'Андреевна', 'Анатольевна', 'annushka@example.com +71234567890', '458796', 'AB12', '2019-06-15', '2029-06-15'),
    ('3b25f691-ac4e-4d86-9ba3-f0b9fc2d6160', 'Игорь', 'Игнатов', 'Игоревич', 'igorek123@inbox.ru +79876543210', '987654', 'KH56', '2020-12-01', '2030-11-30'),
    ('4acca545-ecb6-4aaf-8c34-bf3b1a3d38bc', 'Елена', 'Еленова', 'Евгеньевна', 'elenka@somemail.com +73451234567', '526874', 'XR22', '2021-07-23', '2031-07-22'),
    ('5c6ee5d3-ee1a-4e9b-9e69-1a5e4c9b9e7d', 'Мария', 'Марьева', 'Михайловна', 'mariam@example.com +79011234567', '111222', 'XX01', '2021-01-15', '2031-01-14'),
    ('6d7f68b0-5d3a-49f6-8eba-1a9e4c1c9f2e', 'Дмитрий', 'Дмитриев', 'Дмитриевич', 'dmitryd@example.com +79022345678', '222333', 'XX02', '2021-02-16', '2031-02-15'),
    ('7e8f59c1-6f4b-48b9-9cba-2a0e5c2d9f3f', 'Ирина', 'Иванова', 'Игоревна', 'irinai@example.com +79033456789', '333444', 'XX03', '2021-03-17', '2031-03-16'),
    ('18ab5bd9-9b31-4d3b-9d24-11e25cc9fefb', 'Сергей', 'Сергеев', 'Сергеевич', 'sergeys@example.com +79044567890', '444555', 'XX04', '2021-04-18', '2031-04-17'),
    ('19bc6de0-ac42-4fb5-a5b5-21f26dc0fefc', 'Ольга', 'Ольгина', 'Олеговна', 'olgao@example.com +79055678901', '555666', 'XX05', '2021-05-19', '2031-05-18'),
    ('20cd7ef1-bd53-4fc6-b6b6-31f37ec1f0fd', 'Александр', 'Александров', 'Александрович', 'alexandera@example.com +79066789012', '666777', 'XX06', '2021-06-20', '2031-06-19'),
    ('8bb9d041-2d55-40d4-afee-1e8e5d2d9e8f', 'Надежда', 'Николаева', 'Николаевна', 'nadyan@example.com +79077890123', '777888', 'XX07', '2021-07-21', '2031-07-20'),
    ('9cca6112-3d66-4e8d-bf7f-2e9f6e3c9f90', 'Константин', 'Константинов', 'Константинович', 'konstantink@example.com +79088901234', '888999', 'XX08', '2021-08-22', '2031-08-21'),
    ('30df8323-7d64-4e9e-afe0-2f9e7e4d9f21', 'Лариса', 'Ларин', 'Ларисовна', 'larisal@example.com +79099012345', '999000', 'XX09', '2021-09-23', '2031-09-22');

INSERT INTO "group" (group_id, enrollment_id, number, start_date, end_date)
VALUES
    ('4f0ee28b-98a4-4dbd-a679-d9a9470c719e', 'b9e1343d-7a81-4a10-b3ea-aa32f0f833de', 'K3241', '2023-09-01', '2024-07-01'),
    ('8a472103-92e7-4155-bde7-a071201e8568', '014cccbe-6104-4bd8-9187-96fb5a13cb2f', 'K3242', '2023-09-01', '2024-07-01');

INSERT INTO student (student_id, client_id, group_id, start_date, finish_date, status_in_group)
VALUES
    ('3b8aaf62-d4aa-48f2-9cfd-f1a9c90c0ad1', '132259da-3ddb-4bae-8d01-39414d808ad7', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится'),
    ('9101da2f-9b03-4f3c-a569-f5708fa8c6c5', '24fd3f29-ec14-4f51-bf76-2f9bf9181b67', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится'),
    ('00495bd0-99de-436b-8456-6fbbb70248da', '3b25f691-ac4e-4d86-9ba3-f0b9fc2d6160', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится'),
    ('a4b34641-1125-4ba5-8c8f-c6bebe87b40b', '4acca545-ecb6-4aaf-8c34-bf3b1a3d38bc', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится'),
    ('0456f9f0-b753-4ad1-9cae-de8d7fbc9490', '5c6ee5d3-ee1a-4e9b-9e69-1a5e4c9b9e7d', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится'),
    ('d5d7cd03-d086-4a4e-9c2b-b1c14e215430', '6d7f68b0-5d3a-49f6-8eba-1a9e4c1c9f2e', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится'),
    ('405e00b3-37e4-49e0-a191-929de9d72ab8', '7e8f59c1-6f4b-48b9-9cba-2a0e5c2d9f3f', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится'),
    ('0ae4485d-faf1-4475-bb04-ad480075a231', '18ab5bd9-9b31-4d3b-9d24-11e25cc9fefb', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'отчислен'),
    ('6a15d442-c3fe-41cc-95ec-76f7c6583f87', '19bc6de0-ac42-4fb5-a5b5-21f26dc0fefc', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'отчислен'),
    ('c1c6b124-4291-44b9-9246-4e3781a8b483', '20cd7ef1-bd53-4fc6-b6b6-31f37ec1f0fd', '8a472103-92e7-4155-bde7-a071201e8568', '2023-09-01', '2024-07-01', 'учится'),
    ('befeb349-8417-4759-912f-aeb839717420', '8bb9d041-2d55-40d4-afee-1e8e5d2d9e8f', '8a472103-92e7-4155-bde7-a071201e8568', '2023-09-01', '2024-07-01', 'учится'),
    ('dc25462f-a669-4c72-88eb-c38ff1d3c6e4', '9cca6112-3d66-4e8d-bf7f-2e9f6e3c9f90', '8a472103-92e7-4155-bde7-a071201e8568', '2023-09-01', '2024-07-01', 'учится');
    
INSERT INTO course (course_id, programm_element_id)
VALUES
    ('6d50d653-b4a7-4912-a8dd-542e453571a7', '85fcc7ad-4a06-4cd9-bf3d-736e98c8a3c5'),
    ('1920d807-a833-4b73-9d5a-f0f9eaf1af1d', '002f0e3b-5821-4bdf-82b1-443d63a49245'),
    ('0f442e4e-288a-4ca6-bfca-a09cc73803cd', '91bb9326-337d-433f-8f99-e548e4f5439a');

INSERT INTO course_participant (course_participant_id, group_id, course_id)
VALUES
    ('a3d14a4b-978f-4f97-9854-58bc37e22832', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '6d50d653-b4a7-4912-a8dd-542e453571a7'),
    ('fff8f566-3918-47fa-a4ac-ef8d85c17ba1', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '1920d807-a833-4b73-9d5a-f0f9eaf1af1d'),
    ('f5086dcc-4038-48b0-9602-bdf1543a47f2', '8a472103-92e7-4155-bde7-a071201e8568', '1920d807-a833-4b73-9d5a-f0f9eaf1af1d'),
    ('95d447db-1297-45fd-b5bb-5a19d3af1ceb', '8a472103-92e7-4155-bde7-a071201e8568', '0f442e4e-288a-4ca6-bfca-a09cc73803cd');

INSERT INTO class (class_id, course_id, date, classes_order_number, classroom_id, type, teacher_id)
VALUES
    ('27a6318c-5abd-4b5a-8743-31df33c0838c', '1920d807-a833-4b73-9d5a-f0f9eaf1af1d', '2023-12-31', 0, '4bd4ffe8-f48f-4375-b99c-191ee70e0bcd', 'лекция', '064f78ca-718e-4c20-9bf8-3abee87114ca'),
    ('920aab7c-2319-4033-80dd-8b23bed5afc1', '0f442e4e-288a-4ca6-bfca-a09cc73803cd', '2023-12-31', 1, '5293bd6e-bf24-48f2-be0c-cabce465df46', 'лабораторная', '17a5c7a6-fb30-4ff9-b4d5-63fd6c20183e');

INSERT INTO result (result_id, student_id, teacher_id, programm_element_id, date, mark, attempt)
VALUES
    ('faa8f566-3918-47fa-a4ac-ef8d85c17ba1', '3b8aaf62-d4aa-48f2-9cfd-f1a9c90c0ad1', '064f78ca-718e-4c20-9bf8-3abee87114ca', '002f0e3b-5821-4bdf-82b1-443d63a49245', NULL, NULL, 0),
    ('faa8f566-3918-47fa-a4ac-ef8d85c17da2', '9101da2f-9b03-4f3c-a569-f5708fa8c6c5', '064f78ca-718e-4c20-9bf8-3abee87114ca', '002f0e3b-5821-4bdf-82b1-443d63a49245', '2024-01-01', '2', 0),
    ('faa8f566-3918-47fa-a4ac-ef8d85c17da3', '9101da2f-9b03-4f3c-a569-f5708fa8c6c5', '064f78ca-718e-4c20-9bf8-3abee87114ca', '002f0e3b-5821-4bdf-82b1-443d63a49245', '2024-01-01', '4', 1);