--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-01-25 20:58:47

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
-- TOC entry 4864 (class 1262 OID 16436)
-- Name: opt_base; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE opt_base WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE opt_base OWNER TO postgres;

\connect opt_base

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
-- TOC entry 6 (class 2615 OID 16437)
-- Name: opt; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA opt;


ALTER SCHEMA opt OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16468)
-- Name: База; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."База" (
    "КодБазы" character varying(10) NOT NULL,
    "КодПоставки" character varying(10) NOT NULL,
    "КодЗаказа" character varying(10) NOT NULL,
    "Адрес" character varying(50) NOT NULL,
    "Реквизиты" character varying(50) NOT NULL,
    "ЗапасТовара" character varying(20) NOT NULL
);


ALTER TABLE opt."База" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16483)
-- Name: Заказ; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Заказ" (
    "КодЗаказа" character varying(10) NOT NULL,
    "КодПокупателя" character varying(10) NOT NULL,
    "КодМенеджера" character varying(10) NOT NULL,
    "ДатаЗаказа" date NOT NULL,
    "НомерДоговораЗаказа" character varying(10) NOT NULL,
    "СтатусЗаказа" character varying(20) NOT NULL
);


ALTER TABLE opt."Заказ" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16473)
-- Name: Менеджер; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Менеджер" (
    "КодМенеджера" character varying(10) NOT NULL,
    "ТабельныйНомер" character varying(40) NOT NULL,
    "ПаспортныеДанные" character varying(20) NOT NULL,
    "Должность" character varying(30) NOT NULL
);


ALTER TABLE opt."Менеджер" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16488)
-- Name: Покупатель; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Покупатель" (
    "КодПокупателя" character varying(10) NOT NULL,
    "Название" character varying(50) NOT NULL,
    "Реквизиты" character varying(50) NOT NULL,
    "Адрес" character varying(50) NOT NULL
);


ALTER TABLE opt."Покупатель" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16463)
-- Name: Поставка; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Поставка" (
    "КодПоставки" character varying(10) NOT NULL,
    "КодПоставщика" character varying(10) NOT NULL,
    "КодМенеджера" character varying(10) NOT NULL,
    "СтатусПоставки" character varying(20) NOT NULL,
    "ДатаПоставки" date NOT NULL,
    "КодБазы" character varying(10) NOT NULL,
    "НомерДоговораПоставки" character varying(10) NOT NULL
);


ALTER TABLE opt."Поставка" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16453)
-- Name: Поставщик; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Поставщик" (
    "КодПоставщика" character varying(10) NOT NULL,
    "Название" character varying(50) NOT NULL,
    "НомерСчета" character varying(50) NOT NULL,
    "Адрес" character varying(50) NOT NULL
);


ALTER TABLE opt."Поставщик" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16448)
-- Name: Производитель; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Производитель" (
    "КодПроизводителя" character varying(10) NOT NULL,
    "Название" character varying(50) NOT NULL,
    "НомерСчета" character varying(50) NOT NULL,
    "Адрес" character varying(50) NOT NULL
);


ALTER TABLE opt."Производитель" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16478)
-- Name: Состав заказа; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Состав заказа" (
    "КодСоставаЗаказа" character varying(10) NOT NULL,
    "КодЗаказа" character varying(10) NOT NULL,
    "КодТовара" character varying(10) NOT NULL,
    "КодСоставаПоставки" character varying(10) NOT NULL,
    "ЦенаТовара" integer NOT NULL,
    "КоличествоТовара" integer NOT NULL,
    "Примечание" character varying(50)
);


ALTER TABLE opt."Состав заказа" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16458)
-- Name: Состав поставки; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Состав поставки" (
    "КодСоставаПоставки" character varying(10) NOT NULL,
    "КодПоставки" character varying(10) NOT NULL,
    "КодТовара" character varying(10) NOT NULL,
    "ЦенаТовара" integer NOT NULL,
    "КоличествоТовара" integer NOT NULL,
    "СрокГодности" date NOT NULL,
    "Примечание" character varying(50),
    "ОстатокПоставки" integer NOT NULL
);


ALTER TABLE opt."Состав поставки" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16443)
-- Name: Товар; Type: TABLE; Schema: opt; Owner: postgres
--

CREATE TABLE opt."Товар" (
    "КодТовара" character varying(10) NOT NULL,
    "КодПроизводителя" character varying(10) NOT NULL,
    "Название" character varying(50) NOT NULL,
    "ЕдиницаИзмерения" character varying(10) NOT NULL,
    "НомерПартии" character varying(30) NOT NULL
);


ALTER TABLE opt."Товар" OWNER TO postgres;

--
-- TOC entry 4854 (class 0 OID 16468)
-- Dependencies: 221
-- Data for Name: База; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."База" VALUES ('1', '1', '1', 'Маховая 38', 'ИНН 2223 КПП 1221', '10');
INSERT INTO opt."База" VALUES ('2', '2', '2', 'Маховая 40', 'ИНН 2423 КПП 5221', '5');


--
-- TOC entry 4857 (class 0 OID 16483)
-- Dependencies: 224
-- Data for Name: Заказ; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Заказ" VALUES ('1', '1', '1', '2023-08-12', '1', 'В сборке');
INSERT INTO opt."Заказ" VALUES ('2', '2', '2', '2023-08-13', '2', 'В пути');


--
-- TOC entry 4855 (class 0 OID 16473)
-- Dependencies: 222
-- Data for Name: Менеджер; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Менеджер" VALUES ('1', '101', '320 635', 'Менеджер отдела продаж');
INSERT INTO opt."Менеджер" VALUES ('2', '201', '425 635', 'Руководитель отдела продаж');


--
-- TOC entry 4858 (class 0 OID 16488)
-- Dependencies: 225
-- Data for Name: Покупатель; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Покупатель" VALUES ('1', 'Пятерочка', 'ИНН 111 КПП 1311', 'Луначарского 80к3');
INSERT INTO opt."Покупатель" VALUES ('2', 'Перекресток', 'ИНН 112 КПП 1411', 'Проспект Культуры 1');


--
-- TOC entry 4853 (class 0 OID 16463)
-- Dependencies: 220
-- Data for Name: Поставка; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Поставка" VALUES ('1', '1', '1', 'На складе', '2023-08-10', '1', '1');
INSERT INTO opt."Поставка" VALUES ('2', '2', '2', 'На складе', '2023-08-11', '1', '2');


--
-- TOC entry 4851 (class 0 OID 16453)
-- Dependencies: 218
-- Data for Name: Поставщик; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Поставщик" VALUES ('1', 'ЕвроФудс', '1', 'Рябовское шоссе 68');
INSERT INTO opt."Поставщик" VALUES ('2', 'Восток-Запад', '2', 'Рябовское шоссе 70');


--
-- TOC entry 4850 (class 0 OID 16448)
-- Dependencies: 217
-- Data for Name: Производитель; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Производитель" VALUES ('1', 'Пармалат', '1', 'Шоссе революции 1');
INSERT INTO opt."Производитель" VALUES ('2', 'Экомилк', '2', 'Шоссе Революции 2');


--
-- TOC entry 4856 (class 0 OID 16478)
-- Dependencies: 223
-- Data for Name: Состав заказа; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Состав заказа" VALUES ('1', '1', '1', '1', 10, 1000, NULL);
INSERT INTO opt."Состав заказа" VALUES ('2', '2', '2', '2', 30, 100, NULL);


--
-- TOC entry 4852 (class 0 OID 16458)
-- Dependencies: 219
-- Data for Name: Состав поставки; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Состав поставки" VALUES ('1', '1', '1', 10, 1000, '2024-01-01', NULL, 10);
INSERT INTO opt."Состав поставки" VALUES ('2', '2', '2', 30, 100, '2025-04-02', NULL, 5);


--
-- TOC entry 4849 (class 0 OID 16443)
-- Dependencies: 216
-- Data for Name: Товар; Type: TABLE DATA; Schema: opt; Owner: postgres
--

INSERT INTO opt."Товар" VALUES ('2', '2', 'Молоко 3% 0.5', 'Литр', '2');
INSERT INTO opt."Товар" VALUES ('1', '1', 'Молоко 2% 0.8', 'Литр', '1');


--
-- TOC entry 4685 (class 2606 OID 16472)
-- Name: База База_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."База"
    ADD CONSTRAINT "База_pkey" PRIMARY KEY ("КодБазы");


--
-- TOC entry 4691 (class 2606 OID 16487)
-- Name: Заказ Заказ_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Заказ"
    ADD CONSTRAINT "Заказ_pkey" PRIMARY KEY ("КодЗаказа");


--
-- TOC entry 4670 (class 2606 OID 16494)
-- Name: Состав поставки Количество; Type: CHECK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE opt."Состав поставки"
    ADD CONSTRAINT "Количество" CHECK (("КоличествоТовара" > 0)) NOT VALID;


--
-- TOC entry 4672 (class 2606 OID 16496)
-- Name: Состав заказа Количество товара ; Type: CHECK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE opt."Состав заказа"
    ADD CONSTRAINT "Количество товара " CHECK (("КоличествоТовара" > 0)) NOT VALID;


--
-- TOC entry 4687 (class 2606 OID 16477)
-- Name: Менеджер Менеджер_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Менеджер"
    ADD CONSTRAINT "Менеджер_pkey" PRIMARY KEY ("КодМенеджера");


--
-- TOC entry 4693 (class 2606 OID 16492)
-- Name: Покупатель Покупатель_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Покупатель"
    ADD CONSTRAINT "Покупатель_pkey" PRIMARY KEY ("КодПокупателя");


--
-- TOC entry 4683 (class 2606 OID 16467)
-- Name: Поставка Поставка_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Поставка"
    ADD CONSTRAINT "Поставка_pkey" PRIMARY KEY ("КодПоставки");


--
-- TOC entry 4679 (class 2606 OID 16457)
-- Name: Поставщик Поставщик_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Поставщик"
    ADD CONSTRAINT "Поставщик_pkey" PRIMARY KEY ("КодПоставщика");


--
-- TOC entry 4677 (class 2606 OID 16452)
-- Name: Производитель Производитель_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Производитель"
    ADD CONSTRAINT "Производитель_pkey" PRIMARY KEY ("КодПроизводителя");


--
-- TOC entry 4689 (class 2606 OID 16482)
-- Name: Состав заказа Состав заказа_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Состав заказа"
    ADD CONSTRAINT "Состав заказа_pkey" PRIMARY KEY ("КодСоставаЗаказа");


--
-- TOC entry 4681 (class 2606 OID 16462)
-- Name: Состав поставки Состав поставки_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Состав поставки"
    ADD CONSTRAINT "Состав поставки_pkey" PRIMARY KEY ("КодСоставаПоставки");


--
-- TOC entry 4675 (class 2606 OID 16447)
-- Name: Товар Товар_pkey; Type: CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Товар"
    ADD CONSTRAINT "Товар_pkey" PRIMARY KEY ("КодТовара");


--
-- TOC entry 4671 (class 2606 OID 16493)
-- Name: Состав поставки Цена товара; Type: CHECK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE opt."Состав поставки"
    ADD CONSTRAINT "Цена товара" CHECK (("ЦенаТовара" > 0)) NOT VALID;


--
-- TOC entry 4673 (class 2606 OID 16495)
-- Name: Состав заказа Цена товара; Type: CHECK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE opt."Состав заказа"
    ADD CONSTRAINT "Цена товара" CHECK (("ЦенаТовара" > 0)) NOT VALID;


--
-- TOC entry 4699 (class 2606 OID 16507)
-- Name: База КодЗаказа; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."База"
    ADD CONSTRAINT "КодЗаказа" FOREIGN KEY ("КодЗаказа") REFERENCES opt."Заказ"("КодЗаказа") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4701 (class 2606 OID 16532)
-- Name: Состав заказа КодЗаказа_fk; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Состав заказа"
    ADD CONSTRAINT "КодЗаказа_fk" FOREIGN KEY ("КодЗаказа") REFERENCES opt."Заказ"("КодЗаказа") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4704 (class 2606 OID 16517)
-- Name: Заказ КодМенеджера; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Заказ"
    ADD CONSTRAINT "КодМенеджера" FOREIGN KEY ("КодМенеджера") REFERENCES opt."Менеджер"("КодМенеджера") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4697 (class 2606 OID 16527)
-- Name: Поставка КодМенеджера_fk; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Поставка"
    ADD CONSTRAINT "КодМенеджера_fk" FOREIGN KEY ("КодМенеджера") REFERENCES opt."Менеджер"("КодМенеджера") NOT VALID;


--
-- TOC entry 4705 (class 2606 OID 16512)
-- Name: Заказ КодПокупателя; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Заказ"
    ADD CONSTRAINT "КодПокупателя" FOREIGN KEY ("КодПокупателя") REFERENCES opt."Покупатель"("КодПокупателя") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4700 (class 2606 OID 16502)
-- Name: База КодПоставки; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."База"
    ADD CONSTRAINT "КодПоставки" FOREIGN KEY ("КодПоставки") REFERENCES opt."Поставка"("КодПоставки") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4695 (class 2606 OID 16547)
-- Name: Состав поставки КодПоставки_fk; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Состав поставки"
    ADD CONSTRAINT "КодПоставки_fk" FOREIGN KEY ("КодПоставки") REFERENCES opt."Поставка"("КодПоставки") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4698 (class 2606 OID 16522)
-- Name: Поставка КодПоставщика_fk; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Поставка"
    ADD CONSTRAINT "КодПоставщика_fk" FOREIGN KEY ("КодПоставщика") REFERENCES opt."Поставщик"("КодПоставщика") NOT VALID;


--
-- TOC entry 4694 (class 2606 OID 16557)
-- Name: Товар КодПроизводителя_fk; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Товар"
    ADD CONSTRAINT "КодПроизводителя_fk" FOREIGN KEY ("КодПроизводителя") REFERENCES opt."Производитель"("КодПроизводителя") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4702 (class 2606 OID 16542)
-- Name: Состав заказа КодСоставаПоставки; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Состав заказа"
    ADD CONSTRAINT "КодСоставаПоставки" FOREIGN KEY ("КодСоставаПоставки") REFERENCES opt."Состав поставки"("КодСоставаПоставки") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4703 (class 2606 OID 16537)
-- Name: Состав заказа КодТовара_fk; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Состав заказа"
    ADD CONSTRAINT "КодТовара_fk" FOREIGN KEY ("КодТовара") REFERENCES opt."Товар"("КодТовара") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4696 (class 2606 OID 16552)
-- Name: Состав поставки КодТовара_fk; Type: FK CONSTRAINT; Schema: opt; Owner: postgres
--

ALTER TABLE ONLY opt."Состав поставки"
    ADD CONSTRAINT "КодТовара_fk" FOREIGN KEY ("КодТовара") REFERENCES opt."Товар"("КодТовара") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


-- Completed on 2024-01-25 20:58:47

--
-- PostgreSQL database dump complete
--

