--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4

-- Started on 2023-11-05 23:35:05 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3510 (class 0 OID 16597)
-- Dependencies: 214
-- Data for Name: _yoyo_log; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('707cff1e-f704-11ed-b413-02420a00033c', 'f76703d6e8bd1fe35324264cbecc15a40a7dfa8a6cc6ae55f01d647c5e7054b2', '0001.initial', 'apply', 'root', '84a601907c78', NULL, '2023-05-20 11:49:55.754575');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('7087a59a-f704-11ed-b413-02420a00033c', 'd2c15f42829a7da4a3ccab4ca0ce7af56f43c047fb4551b698c9bebc13235971', '0002.entity_rating', 'apply', 'root', '84a601907c78', NULL, '2023-05-20 11:49:55.82258');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('708e54a8-f704-11ed-b413-02420a00033c', '9e345ffc5eab2a0cb9597865cd479ebd9a6ccff4abd79358a20ef8421a206901', '0003.telegram_id_type', 'apply', 'root', '84a601907c78', NULL, '2023-05-20 11:49:55.866441');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('2e79c9de-f8d6-11ed-937f-02420a000343', 'ba93e9b865b32cdcf91eadca53963bb75a2e27468b0d45f94fe479768c8011de', '0004.user_report', 'apply', 'root', '5c76a5fe74a1', NULL, '2023-05-22 19:23:50.480483');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('cc082fca-fe2f-11ed-a0c8-02420a000346', '49079c71c66462a52c343d36b7b703f00fbfdd09d6ab0fda57f95083c5492bb8', '0005.curator', 'apply', 'root', 'a77a76de762c', NULL, '2023-05-29 14:47:55.838251');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('cc15c3ec-fe2f-11ed-a0c8-02420a000346', '627e07951648b6e522249be5011804612d2ff5491ae6685998ca84936c20de6e', '0006.homework_rating', 'apply', 'root', 'a77a76de762c', NULL, '2023-05-29 14:47:55.925466');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('c0be1176-0167-11ee-bd99-02420a000345', 'acdc0292e86659e0bebef52d0f82c2121b421b2baabfa247925e8475fa41911b', '0007.salebot_curator_id', 'apply', 'root', 'b541ee477858', NULL, '2023-06-02 17:06:02.204352');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('e8bf69aa-048b-11ee-93f6-02420a00034d', '2ef96bb3e5679cf145d1cec6411712bb8e720f354e10ab6f1e8a238bd4f5f79d', '0008.change_curator_from', 'apply', 'root', 'c36b7b4043cb', NULL, '2023-06-06 17:02:24.695883');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('526813da-0779-11ee-a675-02420a00035c', 'f58c6e97967cb4faef4dd2cf1b7909b8ec708ff27e177ec8f58a7c233d2d12fe', '0009.change_homework_rating', 'apply', 'root', 'db9d4061734f', NULL, '2023-06-10 10:26:55.007908');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('624aa4a2-5995-11ee-8a7e-02420a00037b', 'ded8378ec72cf87c4f3abd4c6d9f1c6b316d17af6bd0f2c9a5b78c25f1acf6e0', '0010.expand_telegram_user', 'apply', 'root', 'ff83926be288', NULL, '2023-09-22 22:14:22.914593');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('627812c0-5995-11ee-8a7e-02420a00037b', '517146504a844f7e8b7fb104c413f5b239bfd287e88a95e9726bbfee7626fda7', '0011.expand_curator', 'apply', 'root', 'ff83926be288', NULL, '2023-09-22 22:14:23.210641');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('62a62b38-5995-11ee-8a7e-02420a00037b', 'a4ae36f502eadbde8238c6ba6336468cfde5efda48ff417e08af0229c179716c', '0012.telegram_messages', 'apply', 'root', 'ff83926be288', NULL, '2023-09-22 22:14:23.512438');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('62d39802-5995-11ee-8a7e-02420a00037b', 'd3af3107e42009173199bfc7a0c77ee7f7e16c00ba129209bb11389d326405f1', '0013.administrator', 'apply', 'root', 'ff83926be288', NULL, '2023-09-22 22:14:23.810317');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('63019a4a-5995-11ee-8a7e-02420a00037b', '581fd325b8a98949a51b65974fbbfe2b9b06383d5fc707ac8bfcc517a8dae389', '0014.change_homework', 'apply', 'root', 'ff83926be288', NULL, '2023-09-22 22:14:24.111781');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('633180de-5995-11ee-8a7e-02420a00037b', '8c39a19915ada4ef75cb2f32aa692cf6197e85cd81850f29013e223d830feea4', '0015.user_lesson_feedback', 'apply', 'root', 'ff83926be288', NULL, '2023-09-22 22:14:24.425833');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('5fd40fb8-5cc1-11ee-8bb4-02420a0003b7', '531ca7c5c27b3f69ac7806198aa4ceae645ce5e83ed039d86cb446208fc86848', '0016.change_curator_form', 'apply', 'root', 'f53f21aef30b', NULL, '2023-09-26 23:06:50.125673');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('d8895532-6205-11ee-ab07-02420a0003ca', '4637a83f31f3eaacff11efbb8e19565f7c7e80f39abbf7bf1852220ab61f3fc5', '0017.change_curator_form', 'apply', 'root', '7d0e121aa9c9', NULL, '2023-10-03 15:59:34.307598');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('55e31a0e-65df-11ee-89df-02420a0003f0', 'b61e2d7a61ff9decb9ccda1786dd9303b8bad5861abda9ad73b20a9c988f56ef', '0018.change_homework', 'apply', 'root', '465ed54cd9c5', NULL, '2023-10-08 13:33:58.814814');
INSERT INTO public._yoyo_log (id, migration_hash, migration_id, operation, username, hostname, comment, created_at_utc) VALUES ('1db9d156-696b-11ee-b3b8-02420a0003fc', '06e7dc41cb902391bf14bb1e14310dacf6d70ede94c90c4a0d3205f51cb44bad', '0019.not_null_user_first_name', 'apply', 'root', '0717c021f55c', NULL, '2023-10-13 01:52:07.704788');


--
-- TOC entry 3511 (class 0 OID 16602)
-- Dependencies: 215
-- Data for Name: _yoyo_migration; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('f76703d6e8bd1fe35324264cbecc15a40a7dfa8a6cc6ae55f01d647c5e7054b2', '0001.initial', '2023-05-20 11:49:55.762423');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('d2c15f42829a7da4a3ccab4ca0ce7af56f43c047fb4551b698c9bebc13235971', '0002.entity_rating', '2023-05-20 11:49:55.826351');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('9e345ffc5eab2a0cb9597865cd479ebd9a6ccff4abd79358a20ef8421a206901', '0003.telegram_id_type', '2023-05-20 11:49:55.87033');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('ba93e9b865b32cdcf91eadca53963bb75a2e27468b0d45f94fe479768c8011de', '0004.user_report', '2023-05-22 19:23:50.490081');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('49079c71c66462a52c343d36b7b703f00fbfdd09d6ab0fda57f95083c5492bb8', '0005.curator', '2023-05-29 14:47:55.850737');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('627e07951648b6e522249be5011804612d2ff5491ae6685998ca84936c20de6e', '0006.homework_rating', '2023-05-29 14:47:55.932964');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('acdc0292e86659e0bebef52d0f82c2121b421b2baabfa247925e8475fa41911b', '0007.salebot_curator_id', '2023-06-02 17:06:02.212153');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('2ef96bb3e5679cf145d1cec6411712bb8e720f354e10ab6f1e8a238bd4f5f79d', '0008.change_curator_from', '2023-06-06 17:02:24.702261');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('f58c6e97967cb4faef4dd2cf1b7909b8ec708ff27e177ec8f58a7c233d2d12fe', '0009.change_homework_rating', '2023-06-10 10:26:55.083657');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('ded8378ec72cf87c4f3abd4c6d9f1c6b316d17af6bd0f2c9a5b78c25f1acf6e0', '0010.expand_telegram_user', '2023-09-22 22:14:22.92339');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('517146504a844f7e8b7fb104c413f5b239bfd287e88a95e9726bbfee7626fda7', '0011.expand_curator', '2023-09-22 22:14:23.218182');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('a4ae36f502eadbde8238c6ba6336468cfde5efda48ff417e08af0229c179716c', '0012.telegram_messages', '2023-09-22 22:14:23.522741');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('d3af3107e42009173199bfc7a0c77ee7f7e16c00ba129209bb11389d326405f1', '0013.administrator', '2023-09-22 22:14:23.8192');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('581fd325b8a98949a51b65974fbbfe2b9b06383d5fc707ac8bfcc517a8dae389', '0014.change_homework', '2023-09-22 22:14:24.119079');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('8c39a19915ada4ef75cb2f32aa692cf6197e85cd81850f29013e223d830feea4', '0015.user_lesson_feedback', '2023-09-22 22:14:24.434511');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('531ca7c5c27b3f69ac7806198aa4ceae645ce5e83ed039d86cb446208fc86848', '0016.change_curator_form', '2023-09-26 23:06:50.209583');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('4637a83f31f3eaacff11efbb8e19565f7c7e80f39abbf7bf1852220ab61f3fc5', '0017.change_curator_form', '2023-10-03 15:59:34.317823');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('b61e2d7a61ff9decb9ccda1786dd9303b8bad5861abda9ad73b20a9c988f56ef', '0018.change_homework', '2023-10-08 13:33:58.82208');
INSERT INTO public._yoyo_migration (migration_hash, migration_id, applied_at_utc) VALUES ('06e7dc41cb902391bf14bb1e14310dacf6d70ede94c90c4a0d3205f51cb44bad', '0019.not_null_user_first_name', '2023-10-13 01:52:07.713167');


--
-- TOC entry 3512 (class 0 OID 16605)
-- Dependencies: 216
-- Data for Name: _yoyo_version; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public._yoyo_version (version, installed_at_utc) VALUES (2, '2023-05-20 11:49:55.676576');


--
-- TOC entry 3513 (class 0 OID 16608)
-- Dependencies: 217
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.admin (telegram_user_id) VALUES ('9999');
INSERT INTO public.admin (telegram_user_id) VALUES ('307977682');
INSERT INTO public.admin (telegram_user_id) VALUES ('359114539');
INSERT INTO public.admin (telegram_user_id) VALUES ('416509742');
INSERT INTO public.admin (telegram_user_id) VALUES ('284278756');
INSERT INTO public.admin (telegram_user_id) VALUES ('775375252');
INSERT INTO public.admin (telegram_user_id) VALUES ('33371333');
INSERT INTO public.admin (telegram_user_id) VALUES ('1357020210');
INSERT INTO public.admin (telegram_user_id) VALUES ('232191624');


--
-- TOC entry 3514 (class 0 OID 16611)
-- Dependencies: 218
-- Data for Name: curator; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (13, 'Куратор №3', '0003', 'Я куратор beginner-producer', '101000-300000', 'https://files.salebot.pro/uploads/avatars/1-204922954-859070725.jpg', '2023-05-31 14:58:16.16735', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (14, 'Куратор №4', '0004', 'Я куратор experienced-producer', '300000-1000000', 'https://files.salebot.pro/uploads/avatars/1-204922954-859070725.jpg', '2023-05-31 14:58:16.16735', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (15, 'Куратор №5', '0005', 'Я куратор experienced-exper', '1000000+', 'https://files.salebot.pro/uploads/avatars/1-204922954-859070725.jpg', '2023-05-31 14:58:16.16735', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (17, 'Джейсон Стейтем', 'asdad', 'Ешь пей жуй', '51000-100000', 'https://assets.gq.ru/photos/608040348e902486396bdcb3/master/w_1600%2Cc_limit/WOM7547-(1).jpg', '2023-05-31 17:09:30.042123', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (21, 'Елена Старовойтова', '751907277', 'Desciption', '0-50000', 'no photo', '2023-09-10 19:00:49.40854', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (22, 'Владимир Комиссаров', '400468772', 'Desciption', '0-50000', 'no photo', '2023-09-10 19:00:49.40854', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (23, 'Алина Кудинова', '858274007', 'Desciption', '0-50000', 'no photo', '2023-09-10 19:00:49.40854', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (24, 'Иван Литке', '136476379', 'Desciption', '0-50000', 'no photo', '2023-09-10 19:00:49.40854', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (25, 'Елизавета Хромченко', '5735481492', 'Desciption', '0-50000', 'no photo', '2023-09-10 19:00:49.40854', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (20, 'Артём Климашевский', '243816260', 'Desciption', '0-50000', 'no photo', '2023-09-10 19:00:49.40854', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');
INSERT INTO public.curator (id, name, telegram_user_id, description, salary_group, photo_url, created_timestamp, group_chat_id, group_chat_url) VALUES (11, 'Куратор №1', '243816260', 'Я куратор novice', '0-50000', 'https://files.salebot.pro/uploads/avatars/1-204922954-859070725.jpg', '2023-05-31 14:58:16.16735', -4082376153, 'https://t.me/+vPeP1qn9ubczYTEy');


--
-- TOC entry 3515 (class 0 OID 16617)
-- Dependencies: 219
-- Data for Name: curator_form; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.curator_form (id, telegram_user_id, name, age, country, launch_experience, max_launch_cost, personal_project, know_competitors, why_our_course, course_result_request, customer_source, study_reson, salary_group) VALUES (13, '859070725', 'Валерьян', 22, 'в', 'beginner-producer', '500', 'ывыв', 'yes', 'Все проблемыа', 'Ваа', 'instagram', 'у', '51000-100000');
INSERT INTO public.curator_form (id, telegram_user_id, name, age, country, launch_experience, max_launch_cost, personal_project, know_competitors, why_our_course, course_result_request, customer_source, study_reson, salary_group) VALUES (14, '85554598', 'Алексей Наваркин', 25, 'Москва', 'novice', '0', 'Продажа уточек резиновых.', 'no', 'А че выбирать, сразу понятно все.', 'Хочу стать миллиардером.', 'lichnaya', 'Хз', '1000000+');
INSERT INTO public.curator_form (id, telegram_user_id, name, age, country, launch_experience, max_launch_cost, personal_project, know_competitors, why_our_course, course_result_request, customer_source, study_reson, salary_group) VALUES (27, '5817158784', '1', 1, '1', 'novice', '1', '1', 'yes', '1', '1
', 'telegram', '1', '0-50000');
INSERT INTO public.curator_form (id, telegram_user_id, name, age, country, launch_experience, max_launch_cost, personal_project, know_competitors, why_our_course, course_result_request, customer_source, study_reson, salary_group) VALUES (28, '6608306560', 'Даниил Вартомо', 21, 'Санкт-Петербруг', 'novice', '1000000', 'ИТ продукт', 'no', 'Рекомендация ', 'Поиск людей для проектов', 'telegram', 'Что-то', '0-50000');
INSERT INTO public.curator_form (id, telegram_user_id, name, age, country, launch_experience, max_launch_cost, personal_project, know_competitors, why_our_course, course_result_request, customer_source, study_reson, salary_group) VALUES (40, '1357020210', 'Акмаль Хасанов', 21, 'Санкт-Петербург', 'novice', '0', 'Любой', 'no', 'Стать лучше', 'Запуск на миллион', 'lichnaya', 'Хочу', '0-50000');
INSERT INTO public.curator_form (id, telegram_user_id, name, age, country, launch_experience, max_launch_cost, personal_project, know_competitors, why_our_course, course_result_request, customer_source, study_reson, salary_group) VALUES (47, '297201906', 'Вадим Породьк', 23, 'Клагенфурт', 'experienced-expert', '3000000', 'Конструктор чат-ботов', 'no', 'заработать дене', 'Заработок 20млн рублей', 'telegram', 'Саша Турлаков', '0-50000');
INSERT INTO public.curator_form (id, telegram_user_id, name, age, country, launch_experience, max_launch_cost, personal_project, know_competitors, why_our_course, course_result_request, customer_source, study_reson, salary_group) VALUES (48, '243816260', 'Влад', 20, 'Москва', 'novice', '10AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Пятерочка', 'yes', 'Заработать много денег', 'Много денег', 'telegram', 'Хороший курC', '0-50000');


--
-- TOC entry 3518 (class 0 OID 16624)
-- Dependencies: 222
-- Data for Name: email_verification; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('6056111077', 'porodkovadim@yandex.ru', 'ba61b0251f', '2023-09-27 21:52:42.93256');
INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('33371333', 'julia.nitochkina@yandex.ru', '426292336f', '2023-09-27 22:01:31.979581');
INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('5997857427', 'porodkovad@gmail.com', '3c1a8cec7e', '2023-09-27 22:10:36.181987');
INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('5449799013', 'onulonus@gmail.com', '2a16f2e921', '2023-09-27 18:05:50.751891');
INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('1357020210', 'akhassanov.work@gmail.com', '009209', '2023-09-28 23:24:19.287574');
INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('243816260', 'onulonus@gmail.com', '414385', '2023-09-25 17:50:32.906416');
INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('297201906', 'porodkovadim@yandex.ru', '174400', '2023-09-26 17:31:05.42031');
INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('6320061915', 'sd2001t@mail.ru', '886716', '2023-10-02 18:52:29.407801');
INSERT INTO public.email_verification (user_telegram_id, email, verification_code, created_timestamp) VALUES ('696125981', 'vartomo1991@mail.ru', '502350', '2023-10-02 18:53:16.504734');


--
-- TOC entry 3519 (class 0 OID 16630)
-- Dependencies: 223
-- Data for Name: entity_rating_by_user; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (27, 'module1 lesson1', '5817158784', 0);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (28, 'module1 lesson2', '5817158784', 0);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (29, 'module1 lesson3', '5817158784', 1);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (1, 'module0 lesson1', '5817158784', 1);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (15, 'module0 lesson2', '5817158784', 2);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (24, 'module0 lesson3', '5817158784', 3);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (25, 'module0 lesson4', '5817158784', 3);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (26, 'module0 lesson5', '5817158784', 4);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (30, 'module0 lesson1', '297201906', 10);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (37, '1', '5817158784', 10);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (38, '2', '5817158784', 10);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (39, '3', '5817158784', 10);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (40, '4', '5817158784', 10);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (41, '5', '5817158784', 10);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (42, '1', '297201906', 10);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (44, '2', '307977682', 8);
INSERT INTO public.entity_rating_by_user (id, entity_id, telegram_user_id, rating) VALUES (45, '1', '307977682', 9);


--
-- TOC entry 3521 (class 0 OID 16634)
-- Dependencies: 225
-- Data for Name: file; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUOEc4H6rQeJZcCqnQVFCiG1ZNyAAK-pzEbRFeIDsAkxOUS87_9AQADAgADYwADMAQ', 'image/jpeg', '249aa105518543d5bbae349d8a2e4811.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUOGMGPMJ2jxHDxav15tghQu1tEAAI7qzEbpnUZBVEarbHb-Y08AQADAgADZAADMAQ', 'image/jpeg', 'ff051737c2654ad58d21673747ec1c3c.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUOHSwip6bN6LPJjxTJdqyrR9VZAAILyTEbTjFoSoqhValbAAGDjAEAAwIAA2MAAzAE', 'image/jpeg', '7048ce0dda2c4519b50c56aa5c7da40b.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUSxCqlqETTuTQmLzjlh8NQUx1hAAKupzEb0l1bEmAi5c9IqnieAQADAgADYwADMAQ', 'image/jpeg', 'b23aa9a3991a440eb700f8840cc9e855.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUTE1oRzhEmZkptbmWdZ8z5aX3GAAK1pzEb8vC2ESMZ3l9d2fPjAQADAgADYwADMAQ', 'image/jpeg', 'f3a077ff76dc4dcc8c5199794361d2ac.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUTFPEVelJLq1FDJfMFLeygXxafAAK1pzEb8vC2ESMZ3l9d2fPjAQADAgADYwADMAQ', 'image/jpeg', '76f91c6b27f8476c8f165f97632e31c5.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUTZBdsp6JXk1-TxxZIkYshAYINAAK-pzEbRFeIDsAkxOUS87_9AQADAgADYwADMAQ', 'image/jpeg', 'f7e8cce132064073a227718487222e6c.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUUOD35WfrYHMuILMWo6rD7b2KVAAK1pzEb8vC2ESMZ3l9d2fPjAQADAgADYwADMAQ', 'image/jpeg', 'fa49e654971842709f33597b60efbfb7.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgQAAxUAAWUUo8V3HA39auT9xRj7YImMO2EhAALEujEbJGFYUz46D7eHnp5DAQADAgADYwADMAQ', 'image/jpeg', 'd8a04ee9a2c940019f0cb9414e8379e4.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUUpZlaX1mNv1dRKlsG34Z1KgyhAALxqTEbxTT9AYt2QsDxpex7AQADAgADYwADMAQ', 'image/jpeg', '2722322dc0ef4c3893bb9c8fa60ffcfc.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgQAAxUAAWUUqEt7MDEI4omOTgIQjtWS5GPhAAKSvzEbBBkJUxNqQf3atXWCAQADAgADYwADMAQ', 'image/jpeg', '64fb083fa2684c92bcdcfbf6fa1a5c31.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUUwrx4ZEN-aQUBV0Z5aeDL4zFBAAK1pzEb8vC2EWazSs448R7lAQADAgADYwADMAQ', 'image/jpeg', '46b8ec90040648b593382deade6ec1ac.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUWB6cUeu74lZtKO5sHpsdck8HZAAK1pzEb8vC2EWazSs448R7lAQADAgADYwADMAQ', 'image/jpeg', 'e048385b56d042f39c8843f478e4ffca.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUWCh1xzwzssd4O3Poqv46TaAOhAALnyDEbyB_4SjlyPEFVBVHJAQADAgADYwADMAQ', 'image/jpeg', 'a984256be2e8461ea4542628d994fe0b.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxkBAAONZRYNEkIXY9cZ1xZyFLn2pJ4x1lsAApPPMRtJmrBI3wTd2-vhpRYBAAMCAAN5AAMwBA', 'image/jpeg', '334a9cb96728490586a4014500d51e1b.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AwACAgIAAxkBAAOXZRYNsQ4STf9wUbI5aRoS1lEB20MAAgI_AAKP_bBID-RLENpiNfswBA', 'audio/ogg', 'd14757b9a02946f48367a4cae2c1ea13.oga');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUXPW8sPYs-u5qgBUwBxM13QKj-AAKwpzEblEk3LmVJL7cqbp7MAQADAgADYwADMAQ', 'image/jpeg', '5a08ca1f989942258c3f478d03021791.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUXQzhEXAWCe8RTaxOW_e_YNB4TAAKxpzEbJKveF1X2DpHJeVcKAQADAgADYwADMAQ', 'image/jpeg', '864f66aa5f3941679ea5a6f3fec748e8.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUXTH2nHYUFR1Pd-xWsu4bIqcfWAAK0pzEbsDMGGva9I8F6haX5AQADAgADYwADMAQ', 'image/jpeg', 'daa4d6ccaea44213b0b06469d2cd39c7.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUZ1TNPkuHx7m7nNEVSiv8m-eI2AAK1pzEb8vC2EWazSs448R7lAQADAgADYwADMAQ', 'image/jpeg', '5cadca9ce7c64f99b303ed3a52b5005e.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUZ_A2oZ84zLBzqmZt1GZE-Y6SEAAK1pzEb8vC2EWazSs448R7lAQADAgADYwADMAQ', 'image/jpeg', '2329e6f5c1394de99506ac6199476d77.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUayLN8F5v360s3rEAeBsHI1Xy8AAK1pzEb8vC2EWazSs448R7lAQADAgADYwADMAQ', 'image/jpeg', 'ec6e87b3a8d64ef89d98d1adb2cfcde3.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUbEOgkeAaSaeTNVqZ825nd7NDhAAKW0DEbO48JS8rgpGVbPO5UAQADAgADYwADMAQ', 'image/jpeg', '44526bfcf1df484da20a396d4081c14c.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUbEYd2S5hUMsiSOihXFkfzT2o-AAKrpzEbHQp-KTRsqQUu-2sWAQADAgADYwADMAQ', 'image/jpeg', '80219ddf71c849ef8632ddd22dd447fc.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUbHwZJKl9eF7Okp8L-Fqi8xTvwAAI7qzEbpnUZBamxw4t-D_9SAQADAgADZAADMAQ', 'image/jpeg', 'ee082bda7a0447d387b2907660538752.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUa0i_hZCMBD5GmmBIY-d8SY-_vAAK-pzEbRFeIDqOZxz-44B45AQADAgADYwADMAQ', 'image/jpeg', 'e6585c4da0814c988f42f184d476cc28.jpg');
INSERT INTO public.file (id, mime_type, file_name) VALUES ('AgACAgIAAxUAAWUk4OX9wzXfKhDAP8nMehH8HTu3AAKspzEb1xJnLSLrzhU0T8kcAQADAgADYwADMAQ', 'image/jpeg', '4cbc999898e143e2a914a9ae8939cd99.jpg');


--
-- TOC entry 3522 (class 0 OID 16639)
-- Dependencies: 226
-- Data for Name: homework; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.homework (id, number, slug, name, lesson_id, created_timestamp, is_homework, is_rated) VALUES (2, 1, 'mdl_1_lsn_2_hw_1', 'Домашнее задание - тест1', 2, '2023-05-29 15:31:16.063259', true, false);
INSERT INTO public.homework (id, number, slug, name, lesson_id, created_timestamp, is_homework, is_rated) VALUES (3, 1, 'mdl_2_lsn_2_hw_1', 'Домашнее задание - тест123123123', 4, '2023-05-29 15:31:16.063259', true, true);
INSERT INTO public.homework (id, number, slug, name, lesson_id, created_timestamp, is_homework, is_rated) VALUES (1, 1, 'mdl_1_lsn_1_hw_1', 'Домашнее задание - тест1', 1, '2023-05-29 15:31:16.063259', true, true);


--
-- TOC entry 3524 (class 0 OID 16645)
-- Dependencies: 228
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.lesson (id, number, slug, name, module_id, created_timestamp) VALUES (1, 1, 'mdl_1_lsn_1', 'Урок 1. Начало начала', 1, '2023-05-29 15:31:16.063259');
INSERT INTO public.lesson (id, number, slug, name, module_id, created_timestamp) VALUES (2, 2, 'mdl_1_lsn_2', 'Урок 2. Начало конца', 1, '2023-05-29 15:31:16.063259');
INSERT INTO public.lesson (id, number, slug, name, module_id, created_timestamp) VALUES (3, 1, 'mdl_2_lsn_2_hw_1', 'Домашнее задание - тест23123', 2, '2023-05-29 15:31:16.063259');
INSERT INTO public.lesson (id, number, slug, name, module_id, created_timestamp) VALUES (4, 2, 'mdl_2_lsn_2', 'Урок 2. Конец конца+-', 2, '2023-05-29 15:31:16.063259');


--
-- TOC entry 3526 (class 0 OID 16650)
-- Dependencies: 230
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.module (id, number, slug, name, created_timestamp) VALUES (1, 1, 'mdl_1', 'Модуль 1. Начало', '2023-05-29 15:31:16.063259');
INSERT INTO public.module (id, number, slug, name, created_timestamp) VALUES (2, 2, 'mdl_2', 'Модуль 2. Завершение', '2023-05-29 15:31:16.063259');
INSERT INTO public.module (id, number, slug, name, created_timestamp) VALUES (3, 3, 'mdl_3', 'МодXXXль №3. Проверка', '2023-06-02 07:46:16.710932');


--
-- TOC entry 3528 (class 0 OID 16655)
-- Dependencies: 232
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.session (id, telegram_user_id, ip, user_agent, is_active, created_timestamp) VALUES ('c8c100d34edc4032ab552d73b330e531', '5817158784', '10.0.0.3', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', true, '2023-05-20 12:16:56.638271');
INSERT INTO public.session (id, telegram_user_id, ip, user_agent, is_active, created_timestamp) VALUES ('e69f68b9f79e4c9285eb3d2556b7d0d6', '5817158784', '10.0.0.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', true, '2023-05-21 16:02:01.669793');

--
-- TOC entry 3529 (class 0 OID 16661)
-- Dependencies: 233
-- Data for Name: telegram_message; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.telegram_message (id, chat_id, sent_by_user_telegram_id, seen_by_curator, text, file_id, sent_at, created_at) VALUES ('163', '1357020210', '1357020210', true, 'Как дела?', NULL, '2023-09-28 23:38:02', '2023-09-28 23:38:02.408227');
INSERT INTO public.telegram_message (id, chat_id, sent_by_user_telegram_id, seen_by_curator, text, file_id, sent_at, created_at) VALUES ('165', '1357020210', '1357020210', true, 'Ты видишь все мои сообщения?', NULL, '2023-09-28 23:38:15', '2023-09-28 23:38:15.605123');
INSERT INTO public.telegram_message (id, chat_id, sent_by_user_telegram_id, seen_by_curator, text, file_id, sent_at, created_at) VALUES ('181', '1357020210', '6507328210', true, 'да, вижу', NULL, '2023-09-29 00:24:54', '2023-09-29 00:24:55.612136');
INSERT INTO public.telegram_message (id, chat_id, sent_by_user_telegram_id, seen_by_curator, text, file_id, sent_at, created_at) VALUES ('492', '1357020210', '243816260', true, 'Вам начислены 50 баллов! Модуль 2. Задание: Домашнее задание - тест123123123.', NULL, '2023-10-08 23:21:27', '2023-10-08 23:21:28.41277');
INSERT INTO public.telegram_message (id, chat_id, sent_by_user_telegram_id, seen_by_curator, text, file_id, sent_at, created_at) VALUES ('508', '1357020210', '243816260', true, 'Вам начислены 8 баллов! 
Домашнее задание - тест1. 
Комментарий:
Обратная связь', NULL, '2023-10-16 15:49:06', '2023-10-16 15:49:06.668995');

--
-- TOC entry 3530 (class 0 OID 16668)
-- Dependencies: 234
-- Data for Name: telegram_user; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('775375252', NULL, '2023-09-29 21:11:08.20947', 'Matusova Elena', NULL, 'Elena_Matusova', 'AgACAgIAAxUAAWUXPW8sPYs-u5qgBUwBxM13QKj-AAKwpzEblEk3LmVJL7cqbp7MAQADAgADYwADMAQ', false, 'admin');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('307977682', 'fffgggfffggg@mail.ru', '2023-06-09 09:56:01.192494', 'Даня', 'Терентьев', 'tsyda', 'AgACAgIAAxUAAWUSxCqlqETTuTQmLzjlh8NQUx1hAAKupzEb0l1bEmAi5c9IqnieAQADAgADYwADMAQ', false, 'admin');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('761729751', NULL, '2023-10-10 05:28:04.615577', 'Александр', 'Анурьев', 'A87Alexandr', 'AgACAgIAAxUAAWUk4OX9wzXfKhDAP8nMehH8HTu3AAKspzEb1xJnLSLrzhU0T8kcAQADAgADYwADMAQ', false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('0001', NULL, '2023-09-25 22:27:06.437628', 'Куратор №1', NULL, NULL, NULL, false, 'curator');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('9999', NULL, '2023-09-25 22:36:03.370258', 'Админ №1', NULL, NULL, NULL, false, 'admin');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('6320061915', NULL, '2023-10-02 18:50:15.917035', 'Рома', NULL, 'romnotal', 'AgACAgIAAxUAAWUbEOgkeAaSaeTNVqZ825nd7NDhAAKW0DEbO48JS8rgpGVbPO5UAQADAgADYwADMAQ', false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('400468772', NULL, '2023-09-29 21:35:51.913167', 'Владимир', 'Комиссаров', 'KomissarovProd', 'AgACAgIAAxUAAWUXQzhEXAWCe8RTaxOW_e_YNB4TAAKxpzEbJKveF1X2DpHJeVcKAQADAgADYwADMAQ', false, 'curator');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('5449799013', NULL, '2023-09-28 17:09:57.413445', 'тест', NULL, 'testttt1881', NULL, false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('696125981', NULL, '2023-10-02 18:52:55.008335', 'Кисляков', 'Андрей', NULL, 'AgACAgIAAxUAAWUbEYd2S5hUMsiSOihXFkfzT2o-AAKrpzEbHQp-KTRsqQUu-2sWAQADAgADYwADMAQ', false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('33371333', NULL, '2023-09-27 21:58:48.818007', 'Julia', 'Turlakova', 'letto_julietta', 'AgACAgIAAxUAAWUUpZlaX1mNv1dRKlsG34Z1KgyhAALxqTEbxTT9AYt2QsDxpex7AQADAgADYwADMAQ', false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('436614064', NULL, '2023-09-29 20:48:52.610099', 'Артём', 'Климашевский', 'Klim_ku', 'AgACAgIAAxUAAWUXTH2nHYUFR1Pd-xWsu4bIqcfWAAK0pzEbsDMGGva9I8F6haX5AQADAgADYwADMAQ', false, 'curator');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('85554598', 'test_mail_4@test.test', '2023-10-02 19:50:30.08613', 'Alexey', 'Navarkin', 'alexeynavarkin', 'AgACAgIAAxUAAWUbHwZJKl9eF7Okp8L-Fqi8xTvwAAI7qzEbpnUZBamxw4t-D_9SAQADAgADZAADMAQ', false, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('6608306560', '1233123123123@mail.ru', '2023-08-05 15:30:21.651133', 'Даня', 'Вартомо', 'wartomoj', 'AgACAgIAAxUAAWUOHSwip6bN6LPJjxTJdqyrR9VZAAILyTEbTjFoSoqhValbAAGDjAEAAwIAA2MAAzAE', true, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('1752391250', 'test12332fff1@mail.ru', '2023-06-08 15:04:59.621697', '1', NULL, NULL, NULL, false, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('365747851', '1123123124234535345@mail.ru', '2023-07-01 20:20:46.721058', '1', NULL, NULL, NULL, false, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('409693570', 'test_mail_3@test.test', '2023-05-22 11:37:01.801084', '1', NULL, NULL, NULL, false, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('5817158784', 'test_mail_1@test.test', '2023-05-31 17:57:40.196159', '1', NULL, NULL, NULL, false, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('604418335', 'test-tsy-1@mail.ru', '2023-06-02 19:57:31.520219', '1', NULL, NULL, NULL, false, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('359114539', NULL, '2023-09-30 07:17:53.909069', 'Natalia', 'Gabisova', 'natalia_gabisova', NULL, false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('644346994', 'test_mail_100@test.test', '2023-05-31 13:42:28.197408', '1', NULL, NULL, NULL, false, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('6571601281', NULL, '2023-10-03 17:05:05.8187', 'Тех.поддержка Selfmade', NULL, 'tehpod_selfmade', NULL, false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('243816260', 'onulonus@gmail.com', '2023-10-03 16:04:24.605999', 'владислав', NULL, 'billyel', 'AgACAgIAAxUAAWUa0i_hZCMBD5GmmBIY-d8SY-_vAAK-pzEbRFeIDqOZxz-44B45AQADAgADYwADMAQ', false, 'curator');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('859070725', 'life.krylov@mail.ru', '2023-06-01 14:08:47.185612', '1', NULL, NULL, NULL, false, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('5015165716', NULL, '2023-10-15 21:28:06.52955', 'Andy', '6', NULL, NULL, false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('284278756', NULL, '2023-09-27 17:33:08.906614', 'Зарина', 'Цаликова', 'Tsalikowl', NULL, false, NULL);
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('297201906', 'porodkovadim@yandex.ru', '2023-10-02 15:20:45.019026', 'Vadim', 'Porodko', 'porodko_v', 'AgACAgIAAxUAAWUayLN8F5v360s3rEAeBsHI1Xy8AAK1pzEb8vC2EWazSs448R7lAQADAgADYwADMAQ', true, 'student');
INSERT INTO public.telegram_user (id, email, created_at, first_name, last_name, username, profile_picture_file_id, bot_introduction_finished, role) VALUES ('1357020210', 'akhassanov.work@gmail.com', '2023-09-28 23:19:57.50955', 'Акмаль', 'Хасанов', 'akhassanov', 'AgACAgIAAxUAAWUWCh1xzwzssd4O3Poqv46TaAOhAALnyDEbyB_4SjlyPEFVBVHJAQADAgADYwADMAQ', true, 'student');


--
-- TOC entry 3531 (class 0 OID 16676)
-- Dependencies: 235
-- Data for Name: user_curator; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (7, '859070725', 17, '2023-06-01 16:25:18.999022');
INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (8, '85554598', 15, '2023-06-01 21:11:18.482638');
INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (15, '5817158784', 11, '2023-06-07 12:41:04.032839');
INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (22, '5449799013', 11, '2023-09-27 18:06:48.408358');
INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (23, '6056111077', 11, '2023-09-27 21:53:43.513477');
INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (27, '1357020210', 11, '2023-09-28 23:27:06.249483');
INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (16, '6608306560', 20, '2023-09-26 11:46:25.616833');
INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (18, '297201906', 21, '2023-09-26 17:33:55.8102');
INSERT INTO public.user_curator (id, telegram_user_id, curator_id, created_timestamp) VALUES (17, '243816260', 22, '2023-09-26 16:54:16.814394');


--
-- TOC entry 3533 (class 0 OID 16681)
-- Dependencies: 237
-- Data for Name: user_homework_rating; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.user_homework_rating (id, telegram_user_id, homework_id, curator_id, comment, rating, created_timestamp) VALUES (7, '5817158784', 3, 11, 'Плохо', 4, '2023-06-01 13:36:30.256779');
INSERT INTO public.user_homework_rating (id, telegram_user_id, homework_id, curator_id, comment, rating, created_timestamp) VALUES (8, '859070725', 1, 17, 'фффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффф', 2, '2023-06-08 15:30:51.438085');
INSERT INTO public.user_homework_rating (id, telegram_user_id, homework_id, curator_id, comment, rating, created_timestamp) VALUES (12, '6608306560', 2, 20, 'Ваше домашнее задание было проверено! 
Модуль 1. Задание: "Домашнее задание - тест1" 
Комментарий:', NULL, '2023-10-08 23:15:10.794093');
INSERT INTO public.user_homework_rating (id, telegram_user_id, homework_id, curator_id, comment, rating, created_timestamp) VALUES (11, '6608306560', 3, 20, 'Вам начислены 100 баллов! Модуль 2. Задание: Домашнее задание - тест123123123. ', 100, '2023-10-08 22:59:39.712684');
INSERT INTO public.user_homework_rating (id, telegram_user_id, homework_id, curator_id, comment, rating, created_timestamp) VALUES (15, '1357020210', 3, 11, 'Вам начислены 50 баллов! Модуль 2. Задание: Домашнее задание - тест123123123. ', 50, '2023-10-08 23:21:27.516869');
INSERT INTO public.user_homework_rating (id, telegram_user_id, homework_id, curator_id, comment, rating, created_timestamp) VALUES (16, '6608306560', 1, 11, 'Вам начислены 60 баллов! Модуль 1. Задание: Домашнее задание - тест1. ', 60, '2023-10-09 07:39:58.712353');
INSERT INTO public.user_homework_rating (id, telegram_user_id, homework_id, curator_id, comment, rating, created_timestamp) VALUES (17, '1357020210', 1, 11, 'Вам начислены 8 баллов! 
Домашнее задание - тест1. 
Комментарий:
Обратная связь', 8, '2023-10-16 15:49:06.312351');


--
-- TOC entry 3535 (class 0 OID 16688)
-- Dependencies: 239
-- Data for Name: user_lesson_feedback; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.user_lesson_feedback (telegram_user_id, lesson_id, rating) VALUES ('1357020210', 1, 8);
INSERT INTO public.user_lesson_feedback (telegram_user_id, lesson_id, rating) VALUES ('6608306560', 1, 10);
INSERT INTO public.user_lesson_feedback (telegram_user_id, lesson_id, rating) VALUES ('6608306560', 2, 10);
INSERT INTO public.user_lesson_feedback (telegram_user_id, lesson_id, rating) VALUES ('6608306560', 3, 3);
INSERT INTO public.user_lesson_feedback (telegram_user_id, lesson_id, rating) VALUES ('1357020210', 2, 9);
INSERT INTO public.user_lesson_feedback (telegram_user_id, lesson_id, rating) VALUES ('297201906', 1, 10);
INSERT INTO public.user_lesson_feedback (telegram_user_id, lesson_id, rating) VALUES ('6608306560', 4, 10);


--
-- TOC entry 3536 (class 0 OID 16691)
-- Dependencies: 240
-- Data for Name: user_report; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (1, '85554598', 0, 0, '2023-06-02 14:37:41.633844');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (2, '85554598', 0, 0, '2023-06-02 14:37:44.860033');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (3, '5817158784', 0, 0, '2023-06-02 14:44:18.452217');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (4, '5817158784', 0, 0, '2023-06-02 14:44:54.117127');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (5, '5817158784', 0, 0, '2023-06-02 14:44:58.411179');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (6, '5817158784', 0, 0, '2023-06-02 14:45:03.133871');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (7, '5817158784', 0, 0, '2023-06-02 14:45:03.636352');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (8, '5817158784', 0, 0, '2023-06-02 14:45:04.269518');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (9, '5817158784', 0, 0, '2023-06-02 14:45:04.63158');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (10, '5817158784', 0, 0, '2023-06-02 14:56:22.445855');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (11, '5817158784', 0, 0, '2023-06-02 15:01:02.580092');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (12, '5817158784', 0, 0, '2023-06-08 13:02:22.363889');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (13, '5817158784', 0, 0, '2023-06-08 13:12:24.587026');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (14, '1752391250', 0, 0, '2023-06-08 15:22:10.167331');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (15, '859070725', 0, 0, '2023-06-08 15:50:49.78231');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (16, '5817158784', 0, 0, '2023-07-01 20:33:52.292562');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (17, '307977682', 1, 1, '2023-07-01 21:50:41.604428');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (18, '297201906', 10000, 0, '2023-07-01 22:53:39.732323');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (19, '5817158784', 1, 111, '2023-07-02 09:50:27.285688');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (20, '85554598', 2000, 3000, '2023-08-04 20:42:17.749208');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (21, '6608306560', 1, 1, '2023-08-05 15:31:00.407767');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (22, '1357020210', 10000, 100000, '2023-09-29 11:51:58.096046');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (23, '1357020210', 10000, 100000, '2023-09-29 11:53:02.818114');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (24, '1357020210', 10000, 100000, '2023-09-29 11:54:42.127989');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (25, '6608306560', 1, 1, '2023-09-29 12:00:49.597029');
INSERT INTO public.user_report (id, telegram_user_id, investment, revenue, created_timestamp) VALUES (26, '6608306560', 1, 1, '2023-09-29 12:01:21.748705');


--
-- TOC entry 3538 (class 0 OID 16696)
-- Dependencies: 242
-- Data for Name: user_status_by_email; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--

INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('test_mail_1@test.test', 'active', '2023-05-20 11:49:57.633337');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('test_mail_2@test.test', 'active', '2023-05-21 11:33:37.358113');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('test_mail_3@test.test', 'active', '2023-05-22 11:37:01.516811');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('test_mail_4@test.test', 'active', '2023-05-28 17:43:17.518792');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('1233123123123@mail.ru', 'active', '2023-08-05 15:30:26.798545');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('test_mail_100@test.test', 'active', '2023-05-31 13:41:17.43913');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('life.krylov@mail.ru', 'active', '2023-06-01 16:55:31.116527');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('test-tsy-1@mail.ru', 'active', '2023-06-02 19:57:18.635648');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('test12332fff1@mail.ru', 'active', '2023-06-08 15:05:04.981876');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('fffgggfffggg@mail.ru', 'active', '2023-06-09 09:55:52.016049');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('1123123124234535345@mail.ru', 'active', '2023-07-01 20:20:51.715138');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('onulonus@gmail.com', 'active', '2023-09-25 17:50:13.436188');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('porodkovadim@yandex.ru', 'active', '2023-09-26 17:08:24.142491');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('vaporodko@edu.aau.at', 'active', '2023-09-27 21:05:21.691952');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('julia.nitochkina@yandex.ru', 'active', '2023-09-27 21:06:32.098098');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('porodkovad@gmail.com', 'active', '2023-09-26 17:08:42.667638');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('akhassanov.work@gmail.com', 'active', '2023-09-28 23:23:14.545646');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('sd2001t@mail.ru', 'active', '2023-10-02 18:51:30.896754');
INSERT INTO public.user_status_by_email (email, status, created_timestamp) VALUES ('vartomo1991@mail.ru', 'active', '2023-10-02 18:51:56.05602');


--
-- TOC entry 3539 (class 0 OID 16700)
-- Dependencies: 243
-- Data for Name: yoyo_lock; Type: TABLE DATA; Schema: public; Owner: selfmade_backend_test
--



--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 220
-- Name: curator_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.curator_form_id_seq', 48, true);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 221
-- Name: curator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.curator_id_seq', 25, true);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 224
-- Name: entity_rating_by_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.entity_rating_by_user_id_seq', 46, true);


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 227
-- Name: homework_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.homework_id_seq', 5, true);


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 229
-- Name: lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.lesson_id_seq', 7, true);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 231
-- Name: module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.module_id_seq', 3, true);


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 236
-- Name: user_curator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.user_curator_id_seq', 36, true);


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 238
-- Name: user_homework_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.user_homework_rating_id_seq', 17, true);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 241
-- Name: user_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: selfmade_backend_test
--

SELECT pg_catalog.setval('public.user_report_id_seq', 26, true);


-- Completed on 2023-11-05 23:35:07 UTC

--
-- PostgreSQL database dump complete
--

