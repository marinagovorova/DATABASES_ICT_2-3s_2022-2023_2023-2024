--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-30 14:04:23 MSK

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
-- TOC entry 5 (class 2615 OID 16399)
-- Name: DB_1; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "DB_1";


ALTER SCHEMA "DB_1" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16550)
-- Name: Договор_Сотрудника; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Договор_Сотрудника" (
    "ID_Договора" integer NOT NULL,
    "Размер_Выплаты" integer NOT NULL,
    "Номер_Договора" integer NOT NULL,
    "ID_Сотрудник" integer NOT NULL,
    "Оплата" integer NOT NULL,
    "Дата_Выплаты" date NOT NULL,
    "Дата_Заключения" date NOT NULL,
    "Дата_Окончания" date NOT NULL,
    "Имя" character varying NOT NULL,
    "Отчество" character varying NOT NULL,
    CONSTRAINT "Check_date_Okonchaniya" CHECK (("Дата_Окончания" > '1999-01-01'::date)),
    CONSTRAINT "Check_date_Vyplat" CHECK (("Дата_Выплаты" > '1999-01-01'::date)),
    CONSTRAINT "Check_date_Zakluchenia" CHECK (("Дата_Заключения" > '1999-01-01'::date))
);


ALTER TABLE "DB_1"."Договор_Сотрудника" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16414)
-- Name: Должность; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Должность" (
    "ID_Должности" integer NOT NULL,
    "Название_Должности" character varying NOT NULL,
    "Оклад_Должности" character varying NOT NULL
);


ALTER TABLE "DB_1"."Должность" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16654)
-- Name: Задания; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Задания" (
    "ID_Задания" integer NOT NULL,
    "ID_Проекта" integer NOT NULL,
    "Статус_Задания" character varying NOT NULL,
    "Поощрение_За_Задание" integer NOT NULL,
    CONSTRAINT "Check_Поощрение_За_Задание" CHECK (("Поощрение_За_Задание" >= 0))
);


ALTER TABLE "DB_1"."Задания" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16430)
-- Name: Заказчик; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Заказчик" (
    "ID_Организации" integer NOT NULL,
    "Контакты_Организации" character varying NOT NULL,
    "Название_Организации" character varying NOT NULL
);


ALTER TABLE "DB_1"."Заказчик" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16421)
-- Name: Контроль; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Контроль" (
    "ID_Проверяющего" integer NOT NULL,
    "Причина_Проверки" character varying NOT NULL,
    "Статус_Выполнения" character varying NOT NULL,
    "Дата_Проверки" date NOT NULL,
    "Срок_Выполнения" date NOT NULL,
    CONSTRAINT "Check_Date_Proverki" CHECK (("Дата_Проверки" > '1999-01-01'::date)),
    CONSTRAINT "Check_Date_Vypolneniya" CHECK (("Срок_Выполнения" > '1999-01-01'::date))
);


ALTER TABLE "DB_1"."Контроль" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16587)
-- Name: Оплата; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Оплата" (
    "ID_Оплаты" integer NOT NULL,
    "Дата_Оплаты" date NOT NULL,
    "Сумма_к_Оплате" integer NOT NULL,
    "ID_Проекта_Договора" integer NOT NULL,
    "Дата_Создания_Договора" date NOT NULL,
    "Статус_Оплаты" character varying NOT NULL,
    "Способ_Оплаты" character varying NOT NULL,
    "Номер_Договора" integer NOT NULL,
    CONSTRAINT "Check_Дата_Оплаты" CHECK (("Дата_Оплаты" > '1999-01-01'::date)),
    CONSTRAINT "Check_Дата_Создания_Договора" CHECK (("Дата_Создания_Договора" > '1999-01-01'::date))
);


ALTER TABLE "DB_1"."Оплата" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16407)
-- Name: Отдел; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Отдел" (
    "ID_Отдела" integer NOT NULL,
    "Название_Отдела" character varying NOT NULL,
    "Контакты_Отдела" integer NOT NULL
);


ALTER TABLE "DB_1"."Отдел" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16470)
-- Name: Проект; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Проект" (
    "ID_Проекта_Договора" integer NOT NULL,
    "Дата_Начала" date NOT NULL,
    "Дата_Завершения" date NOT NULL,
    "Стоимость" integer NOT NULL,
    "Факт_Заключения_Договора" date NOT NULL,
    "Статус_Оплаты" character varying NOT NULL,
    "Статус_Выполнения" character varying NOT NULL,
    "Название_Работы" character varying NOT NULL,
    "Номер_Контактного_Лица" integer NOT NULL,
    "ФИО_Контактного_Лица" character varying NOT NULL,
    "Срок_Выполнения" integer NOT NULL,
    CONSTRAINT "Check_Date_DogovorStart" CHECK (("Факт_Заключения_Договора" > '1999-01-01'::date)),
    CONSTRAINT "Check_Date_End" CHECK (("Дата_Завершения" > '1999-01-01'::date)),
    CONSTRAINT "Check_Date_Start" CHECK (("Дата_Начала" > '1999-01-01'::date)),
    CONSTRAINT "Check_Price_Of_Project" CHECK (("Стоимость" > 0))
);


ALTER TABLE "DB_1"."Проект" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: Сотрудник; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Сотрудник" (
    "ID_Сотрудника" integer NOT NULL,
    "ФИО_Сотрудника" character varying NOT NULL,
    "Контакты_Сотрудника" character varying NOT NULL
);


ALTER TABLE "DB_1"."Сотрудник" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16447)
-- Name: Сотрудник_Отдела; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Сотрудник_Отдела" (
    "ID_Cотрудник" integer NOT NULL,
    "ID_Должности" integer NOT NULL,
    "ID_Отдела" integer NOT NULL,
    "Доля_Ставки" integer NOT NULL,
    "Часы_Работы" integer NOT NULL,
    "Статус" character varying NOT NULL,
    CONSTRAINT "Check_Доля_Ставки" CHECK (("Доля_Ставки" >= 0))
);


ALTER TABLE "DB_1"."Сотрудник_Отдела" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16621)
-- Name: Этап_Выполнения; Type: TABLE; Schema: DB_1; Owner: postgres
--

CREATE TABLE "DB_1"."Этап_Выполнения" (
    "ID_Этапа" integer NOT NULL,
    "Дата_Начала" date NOT NULL,
    "Дата_Конца" date NOT NULL,
    "ID_Выполняющего" integer NOT NULL,
    "Факт_Дата_Выполнения" date NOT NULL,
    "Статус_Выполнения" character varying NOT NULL,
    "Пояснение" character varying NOT NULL,
    "Название_Работы" character varying NOT NULL,
    "ID_Задания" integer NOT NULL,
    CONSTRAINT "Check_Дата_Конца" CHECK (("Дата_Конца" > '1999-01-01'::date)),
    CONSTRAINT "Check_Дата_Начала" CHECK (("Дата_Начала" > '1999-01-01'::date)),
    CONSTRAINT "Check_Факт_Дата_Выполнения" CHECK (("Факт_Дата_Выполнения" > '1999-01-01'::date))
);


ALTER TABLE "DB_1"."Этап_Выполнения" OWNER TO postgres;

--
-- TOC entry 3705 (class 0 OID 16550)
-- Dependencies: 222
-- Data for Name: Договор_Сотрудника; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Договор_Сотрудника" ("ID_Договора", "Размер_Выплаты", "Номер_Договора", "ID_Сотрудник", "Оплата", "Дата_Выплаты", "Дата_Заключения", "Дата_Окончания", "Имя", "Отчество") VALUES (1, 2500, 101, 1, 5000, '2023-10-01', '2023-09-15', '2023-12-31', 'Леон', 'Алхасович');
INSERT INTO "DB_1"."Договор_Сотрудника" ("ID_Договора", "Размер_Выплаты", "Номер_Договора", "ID_Сотрудник", "Оплата", "Дата_Выплаты", "Дата_Заключения", "Дата_Окончания", "Имя", "Отчество") VALUES (2, 3000, 102, 2, 7500, '2023-11-01', '2023-10-20', '2024-01-31', 'Давид', 'Гурамович');
INSERT INTO "DB_1"."Договор_Сотрудника" ("ID_Договора", "Размер_Выплаты", "Номер_Договора", "ID_Сотрудник", "Оплата", "Дата_Выплаты", "Дата_Заключения", "Дата_Окончания", "Имя", "Отчество") VALUES (3, 2000, 103, 3, 3000, '2023-12-15', '2023-12-01', '2024-03-31', 'Данил', 'Асланович
');


--
-- TOC entry 3700 (class 0 OID 16414)
-- Dependencies: 217
-- Data for Name: Должность; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Должность" ("ID_Должности", "Название_Должности", "Оклад_Должности") VALUES (1, 'Менеджер проекта', '50000 рублей');
INSERT INTO "DB_1"."Должность" ("ID_Должности", "Название_Должности", "Оклад_Должности") VALUES (2, 'Инженер', '40000 рублей');
INSERT INTO "DB_1"."Должность" ("ID_Должности", "Название_Должности", "Оклад_Должности") VALUES (3, 'Аналитик', '45000 рублей');


--
-- TOC entry 3708 (class 0 OID 16654)
-- Dependencies: 225
-- Data for Name: Задания; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Задания" ("ID_Задания", "ID_Проекта", "Статус_Задания", "Поощрение_За_Задание") VALUES (1, 1, 'В работе', 1000);
INSERT INTO "DB_1"."Задания" ("ID_Задания", "ID_Проекта", "Статус_Задания", "Поощрение_За_Задание") VALUES (2, 2, 'Завершено', 1500);
INSERT INTO "DB_1"."Задания" ("ID_Задания", "ID_Проекта", "Статус_Задания", "Поощрение_За_Задание") VALUES (3, 1, 'В работе', 1200);


--
-- TOC entry 3702 (class 0 OID 16430)
-- Dependencies: 219
-- Data for Name: Заказчик; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Заказчик" ("ID_Организации", "Контакты_Организации", "Название_Организации") VALUES (1, 'Контакт 1', 'Организация A');
INSERT INTO "DB_1"."Заказчик" ("ID_Организации", "Контакты_Организации", "Название_Организации") VALUES (2, 'Контакт 2', 'Организация B');
INSERT INTO "DB_1"."Заказчик" ("ID_Организации", "Контакты_Организации", "Название_Организации") VALUES (3, 'Контакт 3', 'Организация C');


--
-- TOC entry 3701 (class 0 OID 16421)
-- Dependencies: 218
-- Data for Name: Контроль; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Контроль" ("ID_Проверяющего", "Причина_Проверки", "Статус_Выполнения", "Дата_Проверки", "Срок_Выполнения") VALUES (1, 'Регулярная проверка качества', 'В работе', '2023-10-15', '2023-11-15');
INSERT INTO "DB_1"."Контроль" ("ID_Проверяющего", "Причина_Проверки", "Статус_Выполнения", "Дата_Проверки", "Срок_Выполнения") VALUES (2, 'Проверка безопасности', 'Завершено', '2023-10-20', '2023-11-20');
INSERT INTO "DB_1"."Контроль" ("ID_Проверяющего", "Причина_Проверки", "Статус_Выполнения", "Дата_Проверки", "Срок_Выполнения") VALUES (3, 'Проверка эффективности процессов', 'В работе', '2023-11-05', '2023-12-05');


--
-- TOC entry 3706 (class 0 OID 16587)
-- Dependencies: 223
-- Data for Name: Оплата; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Оплата" ("ID_Оплаты", "Дата_Оплаты", "Сумма_к_Оплате", "ID_Проекта_Договора", "Дата_Создания_Договора", "Статус_Оплаты", "Способ_Оплаты", "Номер_Договора") VALUES (1, '2023-10-10', 5000, 1, '2023-10-01', 'Оплачено', 'Банковский перевод', 101);
INSERT INTO "DB_1"."Оплата" ("ID_Оплаты", "Дата_Оплаты", "Сумма_к_Оплате", "ID_Проекта_Договора", "Дата_Создания_Договора", "Статус_Оплаты", "Способ_Оплаты", "Номер_Договора") VALUES (2, '2023-10-20', 7500, 1, '2023-10-01', 'Оплачено', 'Кредитная карта', 102);
INSERT INTO "DB_1"."Оплата" ("ID_Оплаты", "Дата_Оплаты", "Сумма_к_Оплате", "ID_Проекта_Договора", "Дата_Создания_Договора", "Статус_Оплаты", "Способ_Оплаты", "Номер_Договора") VALUES (3, '2023-11-05', 3000, 2, '2023-11-01', 'Оплачено', 'Наличные', 103);


--
-- TOC entry 3699 (class 0 OID 16407)
-- Dependencies: 216
-- Data for Name: Отдел; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Отдел" ("ID_Отдела", "Название_Отдела", "Контакты_Отдела") VALUES (1, 'Отдел разработки', 123456789);
INSERT INTO "DB_1"."Отдел" ("ID_Отдела", "Название_Отдела", "Контакты_Отдела") VALUES (2, 'Отдел продаж', 987654321);
INSERT INTO "DB_1"."Отдел" ("ID_Отдела", "Название_Отдела", "Контакты_Отдела") VALUES (3, 'Отдел поддержки', 456789123);


--
-- TOC entry 3704 (class 0 OID 16470)
-- Dependencies: 221
-- Data for Name: Проект; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Проект" ("ID_Проекта_Договора", "Дата_Начала", "Дата_Завершения", "Стоимость", "Факт_Заключения_Договора", "Статус_Оплаты", "Статус_Выполнения", "Название_Работы", "Номер_Контактного_Лица", "ФИО_Контактного_Лица", "Срок_Выполнения") VALUES (1, '2023-10-01', '2023-12-31', 10000, '2023-09-15', 'Оплачено', 'Выполняется', 'Разработка приложения', 101, 'Контактное_лицо_1', 90);
INSERT INTO "DB_1"."Проект" ("ID_Проекта_Договора", "Дата_Начала", "Дата_Завершения", "Стоимость", "Факт_Заключения_Договора", "Статус_Оплаты", "Статус_Выполнения", "Название_Работы", "Номер_Контактного_Лица", "ФИО_Контактного_Лица", "Срок_Выполнения") VALUES (2, '2023-11-01', '2023-12-15', 7500, '2023-10-20', 'Оплачено', 'Выполнено', 'Тестирование ПО', 102, 'Контактное_лицо_2', 60);
INSERT INTO "DB_1"."Проект" ("ID_Проекта_Договора", "Дата_Начала", "Дата_Завершения", "Стоимость", "Факт_Заключения_Договора", "Статус_Оплаты", "Статус_Выполнения", "Название_Работы", "Номер_Контактного_Лица", "ФИО_Контактного_Лица", "Срок_Выполнения") VALUES (3, '2023-12-01', '2024-01-15', 5000, '2023-11-15', 'Не оплачено', 'Запланировано', 'Дизайн сайта', 103, 'Контактное_лицо_3', 45);


--
-- TOC entry 3698 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: Сотрудник; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Сотрудник" ("ID_Сотрудника", "ФИО_Сотрудника", "Контакты_Сотрудника") VALUES (1, 'Иван Иванов', 'ivan@example.com, +123456789');
INSERT INTO "DB_1"."Сотрудник" ("ID_Сотрудника", "ФИО_Сотрудника", "Контакты_Сотрудника") VALUES (2, 'Мария Петрова', 'maria@example.com, +987654321');
INSERT INTO "DB_1"."Сотрудник" ("ID_Сотрудника", "ФИО_Сотрудника", "Контакты_Сотрудника") VALUES (3, 'Алексей Смирнов', 'alex@example.com, +456789123');


--
-- TOC entry 3703 (class 0 OID 16447)
-- Dependencies: 220
-- Data for Name: Сотрудник_Отдела; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Сотрудник_Отдела" ("ID_Cотрудник", "ID_Должности", "ID_Отдела", "Доля_Ставки", "Часы_Работы", "Статус") VALUES (1, 1, 1, 100, 40, 'Активен');
INSERT INTO "DB_1"."Сотрудник_Отдела" ("ID_Cотрудник", "ID_Должности", "ID_Отдела", "Доля_Ставки", "Часы_Работы", "Статус") VALUES (2, 2, 1, 50, 30, 'Активен');
INSERT INTO "DB_1"."Сотрудник_Отдела" ("ID_Cотрудник", "ID_Должности", "ID_Отдела", "Доля_Ставки", "Часы_Работы", "Статус") VALUES (3, 3, 2, 75, 35, 'Активен');


--
-- TOC entry 3707 (class 0 OID 16621)
-- Dependencies: 224
-- Data for Name: Этап_Выполнения; Type: TABLE DATA; Schema: DB_1; Owner: postgres
--

INSERT INTO "DB_1"."Этап_Выполнения" ("ID_Этапа", "Дата_Начала", "Дата_Конца", "ID_Выполняющего", "Факт_Дата_Выполнения", "Статус_Выполнения", "Пояснение", "Название_Работы", "ID_Задания") VALUES (1, '2023-10-15', '2023-10-20', 1, '2023-10-20', 'Выполнено', 'Завершение этапа 1', 'Разработка', 1);
INSERT INTO "DB_1"."Этап_Выполнения" ("ID_Этапа", "Дата_Начала", "Дата_Конца", "ID_Выполняющего", "Факт_Дата_Выполнения", "Статус_Выполнения", "Пояснение", "Название_Работы", "ID_Задания") VALUES (2, '2023-10-21', '2023-10-25', 2, '2023-10-25', 'Выполнено', 'Завершение этапа 2', 'Тестирование', 1);
INSERT INTO "DB_1"."Этап_Выполнения" ("ID_Этапа", "Дата_Начала", "Дата_Конца", "ID_Выполняющего", "Факт_Дата_Выполнения", "Статус_Выполнения", "Пояснение", "Название_Работы", "ID_Задания") VALUES (3, '2023-11-05', '2023-11-10', 3, '2023-11-10', 'Выполнено', 'Завершение этапа 3', 'Интеграция', 2);


--
-- TOC entry 3535 (class 2606 OID 16678)
-- Name: Этап_Выполнения ID_Этапа; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Этап_Выполнения"
    ADD CONSTRAINT "ID_Этапа" UNIQUE ("ID_Этапа");


--
-- TOC entry 3527 (class 2606 OID 16559)
-- Name: Договор_Сотрудника PK_ID_Договора; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Договор_Сотрудника"
    ADD CONSTRAINT "PK_ID_Договора" PRIMARY KEY ("ID_Договора");


--
-- TOC entry 3507 (class 2606 OID 16420)
-- Name: Должность PK_ID_Должность; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Должность"
    ADD CONSTRAINT "PK_ID_Должность" PRIMARY KEY ("ID_Должности");


--
-- TOC entry 3539 (class 2606 OID 16661)
-- Name: Задания PK_ID_Задания; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Задания"
    ADD CONSTRAINT "PK_ID_Задания" PRIMARY KEY ("ID_Задания");


--
-- TOC entry 3533 (class 2606 OID 16595)
-- Name: Оплата PK_ID_Оплаты; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Оплата"
    ADD CONSTRAINT "PK_ID_Оплаты" PRIMARY KEY ("ID_Оплаты");


--
-- TOC entry 3515 (class 2606 OID 16436)
-- Name: Заказчик PK_ID_Организации; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Заказчик"
    ADD CONSTRAINT "PK_ID_Организации" PRIMARY KEY ("ID_Организации");


--
-- TOC entry 3503 (class 2606 OID 16413)
-- Name: Отдел PK_ID_Отдел; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Отдел"
    ADD CONSTRAINT "PK_ID_Отдел" PRIMARY KEY ("ID_Отдела");


--
-- TOC entry 3511 (class 2606 OID 16429)
-- Name: Контроль PK_ID_Проверяющег; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Контроль"
    ADD CONSTRAINT "PK_ID_Проверяющег" PRIMARY KEY ("ID_Проверяющего");


--
-- TOC entry 3523 (class 2606 OID 16480)
-- Name: Проект PK_ID_Проекта_Договора; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Проект"
    ADD CONSTRAINT "PK_ID_Проекта_Договора" PRIMARY KEY ("ID_Проекта_Договора");


--
-- TOC entry 3499 (class 2606 OID 16406)
-- Name: Сотрудник PK_ID_Сотрудник; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник"
    ADD CONSTRAINT "PK_ID_Сотрудник" PRIMARY KEY ("ID_Сотрудника");


--
-- TOC entry 3537 (class 2606 OID 16630)
-- Name: Этап_Выполнения PK_ID_Этапа; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Этап_Выполнения"
    ADD CONSTRAINT "PK_ID_Этапа" PRIMARY KEY ("ID_Этапа");


--
-- TOC entry 3519 (class 2606 OID 16454)
-- Name: Сотрудник_Отдела PK_ID_соотрудника; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник_Отдела"
    ADD CONSTRAINT "PK_ID_соотрудника" PRIMARY KEY ("ID_Cотрудник");


--
-- TOC entry 3529 (class 2606 OID 16737)
-- Name: Договор_Сотрудника Unique_ID_Cjnhelybrf; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Договор_Сотрудника"
    ADD CONSTRAINT "Unique_ID_Cjnhelybrf" UNIQUE ("ID_Сотрудник");


--
-- TOC entry 3531 (class 2606 OID 16574)
-- Name: Договор_Сотрудника Unique_ID_Договора; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Договор_Сотрудника"
    ADD CONSTRAINT "Unique_ID_Договора" UNIQUE ("ID_Договора");


--
-- TOC entry 3509 (class 2606 OID 16440)
-- Name: Должность Unique_ID_Должности; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Должность"
    ADD CONSTRAINT "Unique_ID_Должности" UNIQUE ("ID_Должности");


--
-- TOC entry 3517 (class 2606 OID 16438)
-- Name: Заказчик Unique_ID_Организации; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Заказчик"
    ADD CONSTRAINT "Unique_ID_Организации" UNIQUE ("ID_Организации");


--
-- TOC entry 3505 (class 2606 OID 16444)
-- Name: Отдел Unique_ID_Отдела; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Отдел"
    ADD CONSTRAINT "Unique_ID_Отдела" UNIQUE ("ID_Отдела");


--
-- TOC entry 3513 (class 2606 OID 16442)
-- Name: Контроль Unique_ID_Проверяющего; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Контроль"
    ADD CONSTRAINT "Unique_ID_Проверяющего" UNIQUE ("ID_Проверяющего");


--
-- TOC entry 3525 (class 2606 OID 16581)
-- Name: Проект Unique_ID_Проекта; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Проект"
    ADD CONSTRAINT "Unique_ID_Проекта" UNIQUE ("ID_Проекта_Договора");


--
-- TOC entry 3501 (class 2606 OID 16446)
-- Name: Сотрудник Unique_ID_Сотрудник; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник"
    ADD CONSTRAINT "Unique_ID_Сотрудник" UNIQUE ("ID_Сотрудника");


--
-- TOC entry 3521 (class 2606 OID 16725)
-- Name: Сотрудник_Отдела Unique_сотрудник_отдела; Type: CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник_Отдела"
    ADD CONSTRAINT "Unique_сотрудник_отдела" UNIQUE ("ID_Cотрудник");


--
-- TOC entry 3540 (class 2606 OID 16714)
-- Name: Сотрудник FK; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник"
    ADD CONSTRAINT "FK" FOREIGN KEY ("ID_Сотрудника") REFERENCES "DB_1"."Сотрудник_Отдела"("ID_Cотрудник") NOT VALID;


--
-- TOC entry 3553 (class 2606 OID 16667)
-- Name: Задания FK_Control; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Задания"
    ADD CONSTRAINT "FK_Control" FOREIGN KEY ("ID_Задания") REFERENCES "DB_1"."Контроль"("ID_Проверяющего");


--
-- TOC entry 3554 (class 2606 OID 16662)
-- Name: Задания FK_ID_Project; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Задания"
    ADD CONSTRAINT "FK_ID_Project" FOREIGN KEY ("ID_Проекта") REFERENCES "DB_1"."Проект"("ID_Проекта_Договора");


--
-- TOC entry 3551 (class 2606 OID 16684)
-- Name: Этап_Выполнения FK_ID_Zadanie; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Этап_Выполнения"
    ADD CONSTRAINT "FK_ID_Zadanie" FOREIGN KEY ("ID_Задания") REFERENCES "DB_1"."Задания"("ID_Задания") NOT VALID;


--
-- TOC entry 3552 (class 2606 OID 16636)
-- Name: Этап_Выполнения FK_ID_Выполняюшего; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Этап_Выполнения"
    ADD CONSTRAINT "FK_ID_Выполняюшего" FOREIGN KEY ("ID_Выполняющего") REFERENCES "DB_1"."Сотрудник_Отдела"("ID_Cотрудник") NOT VALID;


--
-- TOC entry 3542 (class 2606 OID 16455)
-- Name: Сотрудник_Отдела FK_ID_Должности; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник_Отдела"
    ADD CONSTRAINT "FK_ID_Должности" FOREIGN KEY ("ID_Должности") REFERENCES "DB_1"."Должность"("ID_Должности");


--
-- TOC entry 3541 (class 2606 OID 16582)
-- Name: Заказчик FK_ID_Организации; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Заказчик"
    ADD CONSTRAINT "FK_ID_Организации" FOREIGN KEY ("ID_Организации") REFERENCES "DB_1"."Проект"("ID_Проекта_Договора") NOT VALID;


--
-- TOC entry 3543 (class 2606 OID 16460)
-- Name: Сотрудник_Отдела FK_ID_Отдела; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник_Отдела"
    ADD CONSTRAINT "FK_ID_Отдела" FOREIGN KEY ("ID_Отдела") REFERENCES "DB_1"."Отдел"("ID_Отдела");


--
-- TOC entry 3550 (class 2606 OID 16596)
-- Name: Оплата FK_ID_Проекта_Договора; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Оплата"
    ADD CONSTRAINT "FK_ID_Проекта_Договора" FOREIGN KEY ("ID_Проекта_Договора") REFERENCES "DB_1"."Проект"("ID_Проекта_Договора");


--
-- TOC entry 3548 (class 2606 OID 16748)
-- Name: Договор_Сотрудника FK_ID_Сотрудников; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Договор_Сотрудника"
    ADD CONSTRAINT "FK_ID_Сотрудников" FOREIGN KEY ("ID_Сотрудник") REFERENCES "DB_1"."Сотрудник_Отдела"("ID_Cотрудник") NOT VALID;


--
-- TOC entry 3544 (class 2606 OID 16694)
-- Name: Сотрудник_Отдела FK_Задания; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник_Отдела"
    ADD CONSTRAINT "FK_Задания" FOREIGN KEY ("ID_Cотрудник") REFERENCES "DB_1"."Задания"("ID_Задания") NOT VALID;


--
-- TOC entry 3547 (class 2606 OID 16704)
-- Name: Проект FK_Номер_Договора; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Проект"
    ADD CONSTRAINT "FK_Номер_Договора" FOREIGN KEY ("ID_Проекта_Договора") REFERENCES "DB_1"."Договор_Сотрудника"("ID_Договора") NOT VALID;


--
-- TOC entry 3549 (class 2606 OID 16753)
-- Name: Договор_Сотрудника FK_Номер_Договора; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Договор_Сотрудника"
    ADD CONSTRAINT "FK_Номер_Договора" FOREIGN KEY ("ID_Договора") REFERENCES "DB_1"."Проект"("ID_Проекта_Договора") NOT VALID;


--
-- TOC entry 3545 (class 2606 OID 16689)
-- Name: Сотрудник_Отдела FK_Проекта; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник_Отдела"
    ADD CONSTRAINT "FK_Проекта" FOREIGN KEY ("ID_Cотрудник") REFERENCES "DB_1"."Проект"("ID_Проекта_Договора") NOT VALID;


--
-- TOC entry 3546 (class 2606 OID 16738)
-- Name: Сотрудник_Отдела FK_Сотрудника; Type: FK CONSTRAINT; Schema: DB_1; Owner: postgres
--

ALTER TABLE ONLY "DB_1"."Сотрудник_Отдела"
    ADD CONSTRAINT "FK_Сотрудника" FOREIGN KEY ("ID_Cотрудник") REFERENCES "DB_1"."Договор_Сотрудника"("ID_Сотрудник") NOT VALID;


-- Completed on 2023-10-30 14:04:23 MSK

--
-- PostgreSQL database dump complete
--

