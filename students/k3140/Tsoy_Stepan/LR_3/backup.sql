--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-20 17:38:17

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
-- Name: bank; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bank;


ALTER SCHEMA bank OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 41010)
-- Name: Client; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank."Client" (
    "Client_ID" integer NOT NULL,
    "Address" character varying(100) NOT NULL,
    "Phone" character varying(14) NOT NULL,
    "Full_name" character varying(50) NOT NULL,
    "E_mail" character varying(30) NOT NULL,
    CONSTRAINT "Adress_check" CHECK ((("Address")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)),
    CONSTRAINT "Phone_check" CHECK ((("Phone")::text ~~ '+%'::text))
);


ALTER TABLE bank."Client" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32983)
-- Name: Credit_contract; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank."Credit_contract" (
    "Contract_number" integer NOT NULL,
    "Description" character varying(200) NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Loan_date" date NOT NULL,
    "Payment_day" date NOT NULL,
    "Actual_closure_date" date NOT NULL,
    "Planned_closure_date" date NOT NULL,
    "Interest_rate" integer NOT NULL,
    "Initial_loan_amount" integer NOT NULL,
    "Current_debt" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Client_ID" integer NOT NULL,
    "Currency_code" integer NOT NULL,
    CONSTRAINT closure_date_valid_check CHECK (("Actual_closure_date" >= "Loan_date")),
    CONSTRAINT current_debt_not_negative_check CHECK (("Current_debt" >= 0)),
    CONSTRAINT initial_loan_amount_positive_check CHECK (("Initial_loan_amount" > 0)),
    CONSTRAINT interest_rate_range_check CHECK (((("Interest_rate")::numeric >= 0.1) AND (("Interest_rate")::numeric <= 100.0))),
    CONSTRAINT payment_day_check CHECK (((EXTRACT(day FROM "Payment_day") >= (1)::numeric) AND (EXTRACT(day FROM "Payment_day") <= (28)::numeric)))
);


ALTER TABLE bank."Credit_contract" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41051)
-- Name: Credit_payment_schedule; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank."Credit_payment_schedule" (
    "Contract_number" integer NOT NULL,
    "Planned_payment_date" date NOT NULL,
    "Credit_payment" integer NOT NULL,
    "Interest_payment" integer NOT NULL,
    "Actual_payment_date" date NOT NULL,
    "ID" integer NOT NULL
);


ALTER TABLE bank."Credit_payment_schedule" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32888)
-- Name: Currency; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank."Currency" (
    "Currency_code" integer NOT NULL,
    "Name" character varying(25) NOT NULL,
    "Country" character varying(30) NOT NULL
);


ALTER TABLE bank."Currency" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33073)
-- Name: Deposit_contract; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank."Deposit_contract" (
    "Agreement_number" integer NOT NULL,
    "Description" character varying(200) NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Start_date_of_deposit" date NOT NULL,
    "Accrual_date_of_deposit" date NOT NULL,
    "Actual_closure_date" date NOT NULL,
    "Planned_closure_date" date NOT NULL,
    "Interest_rate" double precision NOT NULL,
    "Initial_deposit_amount" integer NOT NULL,
    "Total_payout" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Client_ID" integer NOT NULL,
    "Currency_code" integer NOT NULL,
    CONSTRAINT accrual_day_check CHECK (((EXTRACT(day FROM "Accrual_date_of_deposit") >= (1)::numeric) AND (EXTRACT(day FROM "Accrual_date_of_deposit") <= (28)::numeric))),
    CONSTRAINT actual_closure_date_check CHECK (("Actual_closure_date" >= "Start_date_of_deposit")),
    CONSTRAINT initial_deposit_positive_check CHECK (("Initial_deposit_amount" > 0)),
    CONSTRAINT interest_rate_range_check CHECK ((("Interest_rate" >= (0.1)::double precision) AND ("Interest_rate" <= (100.0)::double precision))),
    CONSTRAINT total_payout_non_negative_check CHECK (("Total_payout" >= 0))
);


ALTER TABLE bank."Deposit_contract" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 41061)
-- Name: Deposit_payment_schedule; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank."Deposit_payment_schedule" (
    "Contract_number" integer NOT NULL,
    "Planned_payment_date" date NOT NULL,
    "Amount" integer NOT NULL,
    "Actual_payment_date" date NOT NULL,
    "ID" integer NOT NULL
);


ALTER TABLE bank."Deposit_payment_schedule" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32843)
-- Name: Employee; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank."Employee" (
    "Employee_ID" integer NOT NULL,
    "Full_name" character varying(50) NOT NULL,
    "Passport_number" character varying(10) NOT NULL,
    "Phone" character varying(20) NOT NULL,
    "Address" character varying(100) NOT NULL,
    "Date_of_birthday" date NOT NULL,
    "Category_code" integer NOT NULL,
    CONSTRAINT age_check CHECK (((date_part('year'::text, CURRENT_DATE) - date_part('year'::text, "Date_of_birthday")) >= (18)::double precision)),
    CONSTRAINT passport_number_length_check CHECK ((length(("Passport_number")::text) = 10))
);


ALTER TABLE bank."Employee" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32838)
-- Name: Employee_Category; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank."Employee_Category" (
    "Category_code" integer NOT NULL,
    "Description" character varying(200) NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Salary" integer NOT NULL,
    CONSTRAINT salary_non_negative_check CHECK (("Salary" >= 0))
);


ALTER TABLE bank."Employee_Category" OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 41010)
-- Dependencies: 220
-- Data for Name: Client; Type: TABLE DATA; Schema: bank; Owner: postgres
--

COPY bank."Client" ("Client_ID", "Address", "Phone", "Full_name", "E_mail") FROM stdin;
1	Россия, Москва, ул. Ленина, д.1, кв.1	+71234567890	Иванов Иван Иванович	ivanov@mail.ru
10	Россия, Саратов, ул. Достоевского, д.10, кв.10	+70123456789	Андреев Андрей Андреевич	andreev@mail.ru
11	Россия, Калининград, ул. Чайковского, д.11, кв.11	+71123456780	Борисов Борис Борисович	borisov@mail.ru
12	Россия, Иркутск, ул. Римского-Корсакова, д.12, кв.12	+72234567891	Григорьев Григорий Григорьевич	grigoriev@mail.ru
13	Россия, Ярославль, ул. Прокофьева, д.13, кв.13	+73345678902	Дмитриев Дмитрий Дмитриевич	dmitriev@mail.ru
14	Россия, Владивосток, ул. Шостаковича, д.14, кв.14	+74456789013	Евгеньев Евгений Евгеньевич	evgeniev@mail.ru
15	Россия, Мурманск, ул. Стравинского, д.15, кв.15	+75567890124	Жуков Сергей Сергеевич	zhukov@mail.ru
16	Россия, Красноярск, ул. Мусоргского, д.16, кв.16	+76678901235	Зайцев Виталий Иванович	zaitsev@mail.ru
17	Россия, Пермь, ул. Чайковского, д.17, кв.17	+77789012346	Ильин Илья Ильинич	ilin@mail.ru
18	Россия, Вологда, ул. Рахманинова, д.18, кв.18	+78890123457	Козлов Петр Алексеевич	kozlov@mail.ru
19	Россия, Чебоксары, ул. Скрябина, д.19, кв.19	+79901234568	Лебедев Артемий Иванович	lebedev@mail.ru
2	Россия, Санкт-Петербург, ул. Сталина, д.2, кв.2	+72345678901	Петров Петр Петрович	petrov@mail.ru
20	Россия, Тверь, ул. Щедрина, д.20, кв.20	+70012345679	Медведев Дмитрий Анатольевич 	medvedev@mail.ru
3	Россия, Новосибирск, ул. Кирова, д.3, кв.3	+73456789012	Сидоров Сидор Сидорович	sidorov@mail.ru
4	Россия, Екатеринбург, ул. Дзержинского, д.4, кв.4	+74567890123	Алексеев Алексей Алексеевич	alekseev@mail.ru
5	Россия, Казань, ул. Гагарина, д.5, кв.5	+75678901234	Васильев Василий Васильевич	vasiliev@mail.ru
6	Россия, Ростов-на-Дону, ул. Чехова, д.6, кв.6	+76789012345	Михайлов Михаил Михайлович	mikhailov@mail.ru
7	Россия, Уфа, ул. Пушкина, д.7, кв.7	+77890123456	Николаев Николай Николаевич	nikolaev@mail.ru
8	Россия, Волгоград, ул. Гоголя, д.8, кв.8	+78901234567	Александров Александр Александрович	alexandrov@mail.ru
9	Россия, Краснодар, ул. Толстого, д.9, кв.9	+79012345678	Сергеев Сергей Сергеевич	sergeev@mail.ru
\.


--
-- TOC entry 4918 (class 0 OID 32983)
-- Dependencies: 218
-- Data for Name: Credit_contract; Type: TABLE DATA; Schema: bank; Owner: postgres
--

COPY bank."Credit_contract" ("Contract_number", "Description", "Name", "Loan_date", "Payment_day", "Actual_closure_date", "Planned_closure_date", "Interest_rate", "Initial_loan_amount", "Current_debt", "Employee_ID", "Client_ID", "Currency_code") FROM stdin;
1	Кредит на покупку автомобиля	Автокредит	2023-01-01	2023-02-01	2023-12-31	2023-12-31	10	500000	0	4	1	643
2	Ипотечный кредит	Ипотека	2023-02-01	2023-03-01	2033-02-01	2033-02-01	9	3000000	2700000	9	2	643
4	Кредит на образование	Образовательный	2023-04-01	2023-05-01	2028-04-01	2028-04-01	7	500000	400000	14	4	643
5	Кредит на покупку автомобиля	Автокредит	2023-05-01	2023-06-01	2024-05-01	2024-05-01	10	600000	0	9	5	643
7	Потребительский кредит	Потребительский	2023-07-01	2023-08-01	2024-07-01	2024-07-01	15	250000	0	4	7	643
9	Кредит на покупку автомобиля	Автокредит	2023-09-01	2023-10-01	2024-09-01	2024-09-01	10	700000	0	9	9	643
3	Потребительский кредит	Потребительский	2023-03-01	2023-04-01	2024-03-01	2024-03-01	15	200000	0	14	3	156
6	Ипотечный кредит	Ипотека	2023-06-01	2023-07-01	2033-06-01	2033-06-01	9	3500000	3150000	9	6	840
8	Кредит на образование	Образовательный	2023-08-01	2023-09-01	2028-08-01	2028-08-01	7	550000	440000	4	8	840
10	Ипотечный кредит	Ипотека	2023-10-01	2023-11-01	2033-10-01	2033-10-01	9	4000000	3600000	14	10	826
\.


--
-- TOC entry 4921 (class 0 OID 41051)
-- Dependencies: 221
-- Data for Name: Credit_payment_schedule; Type: TABLE DATA; Schema: bank; Owner: postgres
--

COPY bank."Credit_payment_schedule" ("Contract_number", "Planned_payment_date", "Credit_payment", "Interest_payment", "Actual_payment_date", "ID") FROM stdin;
1	2023-02-01	41000	1000	2023-02-01	1
2	2023-03-01	25000	5000	2023-03-01	2
3	2023-04-01	17000	3000	2023-04-01	3
4	2023-05-01	46000	4000	2023-05-01	4
5	2023-06-01	51000	1000	2023-06-01	5
6	2023-07-01	52000	2000	2023-07-01	6
7	2023-08-01	26000	4000	2023-08-01	7
8	2023-09-01	18000	2000	2023-09-01	8
9	2023-10-01	47000	3000	2023-10-01	9
10	2023-11-01	53000	2000	2023-11-01	10
\.


--
-- TOC entry 4917 (class 0 OID 32888)
-- Dependencies: 217
-- Data for Name: Currency; Type: TABLE DATA; Schema: bank; Owner: postgres
--

COPY bank."Currency" ("Currency_code", "Name", "Country") FROM stdin;
643	Рубль	Россия
978	Евро	Еврозона
840	Доллар США	Соединенные Штаты Америки
156	Юань	Китай
826	Фунт стерлингов	Великобритания
\.


--
-- TOC entry 4919 (class 0 OID 33073)
-- Dependencies: 219
-- Data for Name: Deposit_contract; Type: TABLE DATA; Schema: bank; Owner: postgres
--

COPY bank."Deposit_contract" ("Agreement_number", "Description", "Name", "Start_date_of_deposit", "Accrual_date_of_deposit", "Actual_closure_date", "Planned_closure_date", "Interest_rate", "Initial_deposit_amount", "Total_payout", "Employee_ID", "Client_ID", "Currency_code") FROM stdin;
1	Вклад на год с ежемесячной капитализацией	Годовой	2023-01-01	2023-02-01	2024-01-01	2024-01-01	5.5	100000	105500	4	11	643
2	Вклад на полгода без капитализации	Полугодовой	2023-02-01	2023-03-01	2023-08-01	2023-08-01	4	200000	204000	4	11	826
3	Вклад на год с ежеквартальной капитализацией	Годовой+	2023-03-01	2023-04-01	2024-03-01	2024-03-01	5	300000	315750	9	11	156
4	Вклад на два года с ежегодной капитализацией	Двухгодовой	2023-04-01	2023-05-01	2025-04-01	2025-04-01	6	400000	424800	4	11	840
5	Вклад на три месяца без капитализации	Квартальный	2023-05-01	2023-06-01	2023-08-01	2023-08-01	3.5	500000	504375	4	15	826
6	Вклад на год с ежемесячной капитализацией	Годовой	2023-06-01	2023-07-01	2024-06-01	2024-06-01	5.5	600000	633300	9	11	978
7	Вклад на полгода без капитализации	Полугодовой	2023-07-01	2023-08-01	2024-01-01	2024-01-01	4	700000	714000	9	17	826
8	Вклад на год с ежеквартальной капитализацией	Годовой+	2023-08-01	2023-09-01	2024-08-01	2024-08-01	5	800000	842000	4	18	643
9	Вклад на два года с ежегодной капитализацией	Двухгодовой	2023-09-01	2023-10-01	2025-09-01	2025-09-01	6	900000	954600	14	19	643
10	Вклад на три месяца без капитализации	Квартальный	2023-10-01	2023-11-01	2024-01-01	2024-01-01	3.5	1000000	1008750	14	20	643
\.


--
-- TOC entry 4922 (class 0 OID 41061)
-- Dependencies: 222
-- Data for Name: Deposit_payment_schedule; Type: TABLE DATA; Schema: bank; Owner: postgres
--

COPY bank."Deposit_payment_schedule" ("Contract_number", "Planned_payment_date", "Amount", "Actual_payment_date", "ID") FROM stdin;
1	2023-02-01	10500	2023-02-01	1
2	2023-03-01	20400	2023-03-01	2
3	2023-04-01	31575	2023-04-01	3
4	2023-05-01	42480	2023-05-01	4
5	2023-06-01	50437	2023-06-01	5
6	2023-07-01	63330	2023-07-01	6
7	2023-08-01	71400	2023-08-01	7
8	2023-09-01	84200	2023-09-01	8
9	2023-10-01	95460	2023-10-01	9
10	2023-11-01	100875	2023-11-01	10
\.


--
-- TOC entry 4916 (class 0 OID 32843)
-- Dependencies: 216
-- Data for Name: Employee; Type: TABLE DATA; Schema: bank; Owner: postgres
--

COPY bank."Employee" ("Employee_ID", "Full_name", "Passport_number", "Phone", "Address", "Date_of_birthday", "Category_code") FROM stdin;
1	Иванов Иван Иванович	1234567890	+71234567890	Россия, Москва, ул. Ленина, д.1, кв.1	1980-01-01	1
2	Петров Петр Петрович	2345678901	+72345678901	Россия, Санкт-Петербург, ул. Сталина, д.2, кв.2	1981-02-02	2
3	Сидоров Сидор Сидорович	3456789012	+73456789012	Россия, Новосибирск, ул. Кирова, д.3, кв.3	1982-03-03	3
4	Алексеев Алексей Алексеевич	4567890123	+74567890123	Россия, Екатеринбург, ул. Дзержинского, д.4, кв.4	1983-04-04	4
5	Васильев Василий Васильевич	5678901234	+75678901234	Россия, Казань, ул. Гагарина, д.5, кв.5	1984-05-05	5
6	Михайлов Михаил Михайлович	6789012345	+76789012345	Россия, Ростов-на-Дону, ул. Чехова, д.6, кв.6	1985-06-06	1
7	Николаев Николай Николаевич	7890123456	+77890123456	Россия, Уфа, ул. Пушкина, д.7, кв.7	1986-07-07	2
8	Александров Александр Александрович	8901234567	+78901234567	Россия, Волгоград, ул. Гоголя, д.8, кв.8	1987-08-08	3
9	Сергеев Сергей Сергеевич	9012345678	+79012345678	Россия, Краснодар, ул. Толстого, д.9, кв.9	1988-09-09	4
10	Викторов Виктор Викторович	0123456789	+70123456789	Россия, Саратов, ул. Достоевского, д.10, кв.10	1989-10-10	5
11	Андреев Андрей Андреевич	1234567890	+71234567890	Россия, Калининград, ул. Чайковского, д.11, кв.11	1990-11-11	1
12	Антонов Антон Антонович	2345678901	+72345678901	Россия, Иркутск, ул. Римского-Корсакова, д.12, кв.12	1991-12-12	2
13	Владимиров Владимир Владимирович	3456789012	+73456789012	Россия, Ярославль, ул. Прокофьева, д.13, кв.13	1992-01-13	3
14	Борисов Борис Борисович	4567890123	+74567890123	Россия, Владивосток, ул. Шостаковича, д.14, кв.14	1993-02-14	4
15	Григорьев Григорий Григорьевич	5678901234	+75678901234	Россия, Мурманск, ул. Стравинского, д.15, кв.15	1994-03-15	5
\.


--
-- TOC entry 4915 (class 0 OID 32838)
-- Dependencies: 215
-- Data for Name: Employee_Category; Type: TABLE DATA; Schema: bank; Owner: postgres
--

COPY bank."Employee_Category" ("Category_code", "Description", "Name", "Salary") FROM stdin;
1	Сотрудники, работающие на входе, обеспечивающие безопасность банка	Охранник	40000
2	Сотрудники, обслуживающие клиентов на кассе	Кассир	50000
3	Сотрудники, предоставляющие консультационные услуги клиентам	Консультант	60000
4	Сотрудники, управляющие финансовыми операциями банка	Финансовый менеджер	70000
5	Руководители отделов или филиалов банка	Директор отдела	80000
\.


--
-- TOC entry 4721 (class 2606 OID 41024)
-- Name: Employee Address_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Employee"
    ADD CONSTRAINT "Address_check" CHECK ((("Address")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4758 (class 2606 OID 41016)
-- Name: Client Client_pkey; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY ("Client_ID");


--
-- TOC entry 4726 (class 2606 OID 41028)
-- Name: Currency Country_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Currency"
    ADD CONSTRAINT "Country_check" CHECK ((("Country")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4754 (class 2606 OID 32987)
-- Name: Credit_contract Credit_contract_pkey; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Credit_contract"
    ADD CONSTRAINT "Credit_contract_pkey" PRIMARY KEY ("Contract_number");


--
-- TOC entry 4760 (class 2606 OID 41055)
-- Name: Credit_payment_schedule Credit_payment_schedule1_pkey; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Credit_payment_schedule"
    ADD CONSTRAINT "Credit_payment_schedule1_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4752 (class 2606 OID 32892)
-- Name: Currency Currency_pkey; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Currency"
    ADD CONSTRAINT "Currency_pkey" PRIMARY KEY ("Currency_code");


--
-- TOC entry 4756 (class 2606 OID 33077)
-- Name: Deposit_contract Deposit_agreement_pkey; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Deposit_contract"
    ADD CONSTRAINT "Deposit_agreement_pkey" PRIMARY KEY ("Agreement_number");


--
-- TOC entry 4762 (class 2606 OID 41065)
-- Name: Deposit_payment_schedule Deposit_payment_schedule1_pkey; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Deposit_payment_schedule"
    ADD CONSTRAINT "Deposit_payment_schedule1_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4718 (class 2606 OID 41025)
-- Name: Employee_Category Description_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Employee_Category"
    ADD CONSTRAINT "Description_check" CHECK ((("Description")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4735 (class 2606 OID 41029)
-- Name: Deposit_contract Description_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Deposit_contract"
    ADD CONSTRAINT "Description_check" CHECK ((("Description")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4728 (class 2606 OID 41031)
-- Name: Credit_contract Description_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Credit_contract"
    ADD CONSTRAINT "Description_check" CHECK ((("Description")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4743 (class 2606 OID 41017)
-- Name: Client Email_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Client"
    ADD CONSTRAINT "Email_check" CHECK ((("Address")::text ~* '^[a-zA-Z0-9\s/,.-_@]*$'::text)) NOT VALID;


--
-- TOC entry 4747 (class 2606 OID 32842)
-- Name: Employee_Category Employee_Category_pkey; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Employee_Category"
    ADD CONSTRAINT "Employee_Category_pkey" PRIMARY KEY ("Category_code");


--
-- TOC entry 4749 (class 2606 OID 32847)
-- Name: Employee Employee_pkey; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("Employee_ID");


--
-- TOC entry 4744 (class 2606 OID 41018)
-- Name: Client Name_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Client"
    ADD CONSTRAINT "Name_check" CHECK ((("Address")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4722 (class 2606 OID 41019)
-- Name: Employee Name_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Employee"
    ADD CONSTRAINT "Name_check" CHECK ((("Full_name")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4719 (class 2606 OID 41026)
-- Name: Employee_Category Name_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Employee_Category"
    ADD CONSTRAINT "Name_check" CHECK ((("Name")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4727 (class 2606 OID 41027)
-- Name: Currency Name_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Currency"
    ADD CONSTRAINT "Name_check" CHECK ((("Name")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4736 (class 2606 OID 41030)
-- Name: Deposit_contract Name_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Deposit_contract"
    ADD CONSTRAINT "Name_check" CHECK ((("Name")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4729 (class 2606 OID 41032)
-- Name: Credit_contract Name_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Credit_contract"
    ADD CONSTRAINT "Name_check" CHECK ((("Name")::text ~* '^[а-яА-ЯёЁ0-9\s/,.-]*$'::text)) NOT VALID;


--
-- TOC entry 4723 (class 2606 OID 41023)
-- Name: Employee Phone_check; Type: CHECK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE bank."Employee"
    ADD CONSTRAINT "Phone_check" CHECK ((("Phone")::text ~~ '+%[0-9]'::text)) NOT VALID;


--
-- TOC entry 4750 (class 1259 OID 33286)
-- Name: fki_Empoyee_category; Type: INDEX; Schema: bank; Owner: postgres
--

CREATE INDEX "fki_Empoyee_category" ON bank."Employee" USING btree ("Category_code");


--
-- TOC entry 4764 (class 2606 OID 41037)
-- Name: Credit_contract Client_ID_fk; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Credit_contract"
    ADD CONSTRAINT "Client_ID_fk" FOREIGN KEY ("Client_ID") REFERENCES bank."Client"("Client_ID") NOT VALID;


--
-- TOC entry 4767 (class 2606 OID 41046)
-- Name: Deposit_contract Client_ID_fk; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Deposit_contract"
    ADD CONSTRAINT "Client_ID_fk" FOREIGN KEY ("Client_ID") REFERENCES bank."Client"("Client_ID") NOT VALID;


--
-- TOC entry 4771 (class 2606 OID 41066)
-- Name: Deposit_payment_schedule Contract_number_fk; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Deposit_payment_schedule"
    ADD CONSTRAINT "Contract_number_fk" FOREIGN KEY ("Contract_number") REFERENCES bank."Deposit_contract"("Agreement_number") NOT VALID;


--
-- TOC entry 4770 (class 2606 OID 41056)
-- Name: Credit_payment_schedule Credit_contract_fk; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Credit_payment_schedule"
    ADD CONSTRAINT "Credit_contract_fk" FOREIGN KEY ("Contract_number") REFERENCES bank."Credit_contract"("Contract_number") NOT VALID;


--
-- TOC entry 4765 (class 2606 OID 32988)
-- Name: Credit_contract Currency_code_fk; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Credit_contract"
    ADD CONSTRAINT "Currency_code_fk" FOREIGN KEY ("Currency_code") REFERENCES bank."Currency"("Currency_code");


--
-- TOC entry 4768 (class 2606 OID 33078)
-- Name: Deposit_contract Currency_code_fk; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Deposit_contract"
    ADD CONSTRAINT "Currency_code_fk" FOREIGN KEY ("Currency_code") REFERENCES bank."Currency"("Currency_code");


--
-- TOC entry 4766 (class 2606 OID 32998)
-- Name: Credit_contract Employee_ID_fk; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Credit_contract"
    ADD CONSTRAINT "Employee_ID_fk" FOREIGN KEY ("Employee_ID") REFERENCES bank."Employee"("Employee_ID");


--
-- TOC entry 4769 (class 2606 OID 33088)
-- Name: Deposit_contract Employee_ID_fk; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Deposit_contract"
    ADD CONSTRAINT "Employee_ID_fk" FOREIGN KEY ("Employee_ID") REFERENCES bank."Employee"("Employee_ID");


--
-- TOC entry 4763 (class 2606 OID 33281)
-- Name: Employee Empoyee_category; Type: FK CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank."Employee"
    ADD CONSTRAINT "Empoyee_category" FOREIGN KEY ("Category_code") REFERENCES bank."Employee_Category"("Category_code");


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "Client"; Type: ACL; Schema: bank; Owner: postgres
--

REVOKE ALL ON TABLE bank."Client" FROM postgres;
GRANT ALL ON TABLE bank."Client" TO postgres WITH GRANT OPTION;
GRANT SELECT ON TABLE bank."Client" TO my_backup_role;


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "Credit_contract"; Type: ACL; Schema: bank; Owner: postgres
--

GRANT SELECT ON TABLE bank."Credit_contract" TO my_backup_role;


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE "Credit_payment_schedule"; Type: ACL; Schema: bank; Owner: postgres
--

REVOKE ALL ON TABLE bank."Credit_payment_schedule" FROM postgres;
GRANT ALL ON TABLE bank."Credit_payment_schedule" TO postgres WITH GRANT OPTION;
GRANT SELECT ON TABLE bank."Credit_payment_schedule" TO my_backup_role;


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE "Currency"; Type: ACL; Schema: bank; Owner: postgres
--

GRANT SELECT ON TABLE bank."Currency" TO my_backup_role;


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "Deposit_contract"; Type: ACL; Schema: bank; Owner: postgres
--

GRANT SELECT ON TABLE bank."Deposit_contract" TO my_backup_role;


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "Deposit_payment_schedule"; Type: ACL; Schema: bank; Owner: postgres
--

REVOKE ALL ON TABLE bank."Deposit_payment_schedule" FROM postgres;
GRANT ALL ON TABLE bank."Deposit_payment_schedule" TO postgres WITH GRANT OPTION;
GRANT SELECT ON TABLE bank."Deposit_payment_schedule" TO my_backup_role;


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE "Employee"; Type: ACL; Schema: bank; Owner: postgres
--

GRANT SELECT ON TABLE bank."Employee" TO my_backup_role;


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE "Employee_Category"; Type: ACL; Schema: bank; Owner: postgres
--

GRANT SELECT ON TABLE bank."Employee_Category" TO my_backup_role;


--
-- TOC entry 2067 (class 826 OID 33301)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: bank; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bank GRANT SELECT ON SEQUENCES TO my_backup_role;


--
-- TOC entry 2066 (class 826 OID 33300)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: bank; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bank GRANT SELECT ON TABLES TO my_backup_role;


--
-- TOC entry 2065 (class 826 OID 33298)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


-- Completed on 2024-02-20 17:38:17

--
-- PostgreSQL database dump complete
--

