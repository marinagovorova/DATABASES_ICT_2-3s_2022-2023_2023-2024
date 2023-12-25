--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-24 23:29:58

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
-- TOC entry 3415 (class 1262 OID 49483)
-- Name: dbmishakorni; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dbmishakorni WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE dbmishakorni OWNER TO postgres;

\connect dbmishakorni

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 49595)
-- Name: acts; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.acts (
    id integer NOT NULL,
    type character varying(30) NOT NULL,
    date date NOT NULL,
    contract_id integer NOT NULL
);


ALTER TABLE public.acts OWNER TO dbmishakorni;

--
-- TOC entry 215 (class 1259 OID 49540)
-- Name: cars; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.cars (
    id integer NOT NULL,
    body_number character varying(17) NOT NULL,
    register_number character varying(8) NOT NULL,
    engine_number character varying(17) NOT NULL,
    last_to_date date NOT NULL,
    return_remarks character varying(100),
    model_id integer NOT NULL,
    insurance_id integer NOT NULL
);


ALTER TABLE public.cars OWNER TO dbmishakorni;

--
-- TOC entry 211 (class 1259 OID 49500)
-- Name: clients; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    mobile_phone character varying NOT NULL,
    CONSTRAINT discount CHECK (((discount >= 0) AND (discount <= 100)))
);


ALTER TABLE public.clients OWNER TO dbmishakorni;

--
-- TOC entry 217 (class 1259 OID 49561)
-- Name: contracts; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    state_status character varying(50) NOT NULL,
    paid_status character varying(50) NOT NULL,
    car_id integer NOT NULL,
    client_id integer NOT NULL,
    worker_id integer NOT NULL,
    CONSTRAINT start_date CHECK ((end_date > start_date))
);


ALTER TABLE public.contracts OWNER TO dbmishakorni;

--
-- TOC entry 218 (class 1259 OID 49582)
-- Name: crashes; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.crashes (
    id integer NOT NULL,
    location character varying(75) NOT NULL,
    guilty character varying(50) NOT NULL,
    date date NOT NULL,
    price integer NOT NULL,
    description character varying NOT NULL,
    contract_id integer NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);


ALTER TABLE public.crashes OWNER TO dbmishakorni;

--
-- TOC entry 214 (class 1259 OID 49532)
-- Name: insurances; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.insurances (
    id integer NOT NULL,
    price integer NOT NULL,
    type character varying NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);


ALTER TABLE public.insurances OWNER TO dbmishakorni;

--
-- TOC entry 212 (class 1259 OID 49509)
-- Name: models; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.models (
    id integer NOT NULL,
    description character varying(100),
    title character varying(100) NOT NULL,
    year integer NOT NULL,
    price integer NOT NULL,
    brand character varying(100) NOT NULL,
    CONSTRAINT price CHECK ((price > 0)),
    CONSTRAINT year CHECK ((year > 1900))
);


ALTER TABLE public.models OWNER TO dbmishakorni;

--
-- TOC entry 209 (class 1259 OID 49484)
-- Name: positions; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.positions (
    id integer NOT NULL,
    salary integer NOT NULL,
    tasks character varying(100) NOT NULL,
    CONSTRAINT salary CHECK ((salary > 0))
);


ALTER TABLE public.positions OWNER TO dbmishakorni;

--
-- TOC entry 213 (class 1259 OID 49520)
-- Name: prices; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.prices (
    id integer NOT NULL,
    model_id integer NOT NULL,
    rent_price integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT end_date CHECK ((end_date > start_date)),
    CONSTRAINT rent_price CHECK ((rent_price >= 0))
);


ALTER TABLE public.prices OWNER TO dbmishakorni;

--
-- TOC entry 216 (class 1259 OID 49555)
-- Name: traffic_violation; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.traffic_violation (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    price integer NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);


ALTER TABLE public.traffic_violation OWNER TO dbmishakorni;

--
-- TOC entry 220 (class 1259 OID 49605)
-- Name: violations; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.violations (
    id integer NOT NULL,
    traffic_violation_id integer NOT NULL,
    payer character varying(50) NOT NULL,
    date date NOT NULL,
    location character varying(100) NOT NULL,
    crash_id integer NOT NULL,
    contract_id integer NOT NULL
);


ALTER TABLE public.violations OWNER TO dbmishakorni;

--
-- TOC entry 210 (class 1259 OID 49490)
-- Name: workers; Type: TABLE; Schema: public; Owner: dbmishakorni
--

CREATE TABLE public.workers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    passport_data character varying(12) NOT NULL,
    position_id integer NOT NULL
);


ALTER TABLE public.workers OWNER TO dbmishakorni;

--
-- TOC entry 3408 (class 0 OID 49595)
-- Dependencies: 219
-- Data for Name: acts; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.acts VALUES (1, 'ТипА', '2023-10-01', 1);
INSERT INTO public.acts VALUES (2, 'ТипБ', '2023-10-02', 2);
INSERT INTO public.acts VALUES (3, 'ТипВ', '2023-10-03', 3);
INSERT INTO public.acts VALUES (4, 'ТипГ', '2023-10-04', 4);
INSERT INTO public.acts VALUES (5, 'ТипД', '2023-10-05', 5);


--
-- TOC entry 3404 (class 0 OID 49540)
-- Dependencies: 215
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.cars VALUES (1, 'ТЕЛО1234567890123', 'РЕГ1234', 'ДВИГ1234567890123', '2023-10-01', NULL, 1, 1);
INSERT INTO public.cars VALUES (2, 'ТЕЛО2234567890123', 'РЕГ2234', 'ДВИГ2234567890123', '2023-10-02', NULL, 2, 2);
INSERT INTO public.cars VALUES (3, 'ТЕЛО3234567890123', 'РЕГ3234', 'ДВИГ3234567890123', '2023-10-03', NULL, 3, 3);
INSERT INTO public.cars VALUES (4, 'ТЕЛО4234567890123', 'РЕГ4234', 'ДВИГ4234567890123', '2023-10-04', NULL, 4, 4);
INSERT INTO public.cars VALUES (5, 'ТЕЛО5234567890123', 'РЕГ5234', 'ДВИГ5234567890123', '2023-10-05', NULL, 5, 5);


--
-- TOC entry 3400 (class 0 OID 49500)
-- Dependencies: 211
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.clients VALUES (1, 5, 'Иван Иванов', 'ул. Сосновая, 123', '+79001234567');
INSERT INTO public.clients VALUES (2, 10, 'Ольга Петрова', 'пр. Ленина, 456', '+79007654321');
INSERT INTO public.clients VALUES (3, 15, 'Дмитрий Смирнов', 'ул. Черёмушки, 789', '+79001112233');
INSERT INTO public.clients VALUES (4, 20, 'Елена Козлова', 'ул. Зелёная, 101', '+79004445566');
INSERT INTO public.clients VALUES (5, 25, 'Алексей Морозов', 'ул. Кленовая, 202', '+79007778899');


--
-- TOC entry 3406 (class 0 OID 49561)
-- Dependencies: 217
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.contracts VALUES (1, '2023-01-01', '2023-12-31', 'Активный', 'Оплачено', 1, 1, 1);
INSERT INTO public.contracts VALUES (2, '2023-01-02', '2023-12-30', 'Завершён', 'Не оплачено', 2, 2, 2);
INSERT INTO public.contracts VALUES (3, '2023-01-03', '2023-12-29', 'Активный', 'Оплачено', 3, 3, 3);
INSERT INTO public.contracts VALUES (4, '2023-01-04', '2023-12-28', 'Завершён', 'Оплачено', 4, 4, 4);
INSERT INTO public.contracts VALUES (5, '2023-01-05', '2023-12-27', 'Активный', 'Не оплачено', 5, 5, 5);


--
-- TOC entry 3407 (class 0 OID 49582)
-- Dependencies: 218
-- Data for Name: crashes; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.crashes VALUES (1, 'Москва', 'Иван Иванов', '2023-01-01', 500, 'Незначительные повреждения переднего бампера', 1);
INSERT INTO public.crashes VALUES (2, 'Санкт-Петербург', 'Ольга Петрова', '2023-01-02', 1000, 'Серьезные повреждения задней двери', 2);
INSERT INTO public.crashes VALUES (3, 'Новосибирск', 'Дмитрий Смирнов', '2023-01-03', 750, 'Царапины на боковой стороне', 3);
INSERT INTO public.crashes VALUES (4, 'Казань', 'Елена Козлова', '2023-01-04', 250, 'Сломанный задний фонарь', 4);
INSERT INTO public.crashes VALUES (5, 'Нижний Новгород', 'Алексей Морозов', '2023-01-05', 300, 'Проколотое колесо', 5);


--
-- TOC entry 3403 (class 0 OID 49532)
-- Dependencies: 214
-- Data for Name: insurances; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.insurances VALUES (1, 5000, 'ОСАГО');
INSERT INTO public.insurances VALUES (2, 10000, 'КАСКО');
INSERT INTO public.insurances VALUES (3, 7000, 'Зеленая карта');
INSERT INTO public.insurances VALUES (4, 15000, 'Полное КАСКО');
INSERT INTO public.insurances VALUES (5, 2000, 'Страхование от несчастных случаев');


--
-- TOC entry 3401 (class 0 OID 49509)
-- Dependencies: 212
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.models VALUES (1, 'Седан', 'МодельА', 2020, 500000, 'Lada');
INSERT INTO public.models VALUES (2, 'Хэтчбек', 'МодельБ', 2019, 600000, 'Toyota');
INSERT INTO public.models VALUES (3, 'Кроссовер', 'МодельВ', 2021, 1000000, 'BMW');
INSERT INTO public.models VALUES (4, 'Минивэн', 'МодельГ', 2018, 750000, 'Kia');
INSERT INTO public.models VALUES (5, 'Кабриолет', 'МодельД', 2022, 1200000, 'Mercedes');


--
-- TOC entry 3398 (class 0 OID 49484)
-- Dependencies: 209
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.positions VALUES (1, 50000, 'Продавец');
INSERT INTO public.positions VALUES (2, 60000, 'Менеджер по продажам');
INSERT INTO public.positions VALUES (3, 70000, 'Технический специалист');
INSERT INTO public.positions VALUES (4, 80000, 'Менеджер по логистике');
INSERT INTO public.positions VALUES (5, 90000, 'Руководитель отдела');


--
-- TOC entry 3402 (class 0 OID 49520)
-- Dependencies: 213
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.prices VALUES (1, 1, 1000, '2023-01-01', '2023-01-31');
INSERT INTO public.prices VALUES (2, 2, 1500, '2023-02-01', '2023-02-28');
INSERT INTO public.prices VALUES (3, 3, 2000, '2023-03-01', '2023-03-31');
INSERT INTO public.prices VALUES (4, 4, 1700, '2023-04-01', '2023-04-30');
INSERT INTO public.prices VALUES (5, 5, 2500, '2023-05-01', '2023-05-31');


--
-- TOC entry 3405 (class 0 OID 49555)
-- Dependencies: 216
-- Data for Name: traffic_violation; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.traffic_violation VALUES (1, 'Превышение скорости', 500);
INSERT INTO public.traffic_violation VALUES (2, 'Парковка в неположенном месте', 1000);
INSERT INTO public.traffic_violation VALUES (3, 'Проезд на красный', 1500);
INSERT INTO public.traffic_violation VALUES (4, 'Непристегнутый ремень', 300);
INSERT INTO public.traffic_violation VALUES (5, 'Использование телефона', 700);


--
-- TOC entry 3409 (class 0 OID 49605)
-- Dependencies: 220
-- Data for Name: violations; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.violations VALUES (1, 1, 'Иван Иванов', '2023-01-01', 'Москва', 1, 1);
INSERT INTO public.violations VALUES (2, 2, 'Ольга Петрова', '2023-01-02', 'Санкт-Петербург', 2, 2);
INSERT INTO public.violations VALUES (3, 3, 'Дмитрий Смирнов', '2023-01-03', 'Новосибирск', 3, 3);
INSERT INTO public.violations VALUES (4, 4, 'Елена Козлова', '2023-01-04', 'Казань', 4, 4);
INSERT INTO public.violations VALUES (5, 5, 'Алексей Морозов', '2023-01-05', 'Нижний Новгород', 5, 5);


--
-- TOC entry 3399 (class 0 OID 49490)
-- Dependencies: 210
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: dbmishakorni
--

INSERT INTO public.workers VALUES (1, 'Мария Сергеева', '123456789012', 1);
INSERT INTO public.workers VALUES (2, 'Петр Алексеев', '234567890123', 2);
INSERT INTO public.workers VALUES (3, 'Светлана Васильева', '345678901234', 3);
INSERT INTO public.workers VALUES (4, 'Андрей Петров', '456789012345', 4);
INSERT INTO public.workers VALUES (5, 'Екатерина Иванова', '567890123456', 5);


--
-- TOC entry 3224 (class 2606 OID 49489)
-- Name: positions Position_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT "Position_pkey" PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 49599)
-- Name: acts acts_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.acts
    ADD CONSTRAINT acts_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 49544)
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 49508)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 49566)
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 49589)
-- Name: crashes crash_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.crashes
    ADD CONSTRAINT crash_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 49539)
-- Name: insurances insurance_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.insurances
    ADD CONSTRAINT insurance_pkey PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 49515)
-- Name: models model_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 49526)
-- Name: prices price_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 49560)
-- Name: traffic_violation traffic_violation_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.traffic_violation
    ADD CONSTRAINT traffic_violation_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 49609)
-- Name: violations violations_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.violations
    ADD CONSTRAINT violations_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 49494)
-- Name: workers workers_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 49567)
-- Name: contracts car; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT car FOREIGN KEY (car_id) REFERENCES public.cars(id) ON DELETE SET NULL;


--
-- TOC entry 3252 (class 2606 OID 49572)
-- Name: contracts client; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT client FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE SET NULL;


--
-- TOC entry 3254 (class 2606 OID 49590)
-- Name: crashes contract; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.crashes
    ADD CONSTRAINT contract FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE SET NULL;


--
-- TOC entry 3255 (class 2606 OID 49600)
-- Name: acts contract; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.acts
    ADD CONSTRAINT contract FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE CASCADE;


--
-- TOC entry 3256 (class 2606 OID 49620)
-- Name: violations contract; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.violations
    ADD CONSTRAINT contract FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE SET NULL;


--
-- TOC entry 3257 (class 2606 OID 49615)
-- Name: violations crash; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.violations
    ADD CONSTRAINT crash FOREIGN KEY (crash_id) REFERENCES public.crashes(id) ON DELETE CASCADE;


--
-- TOC entry 3249 (class 2606 OID 49550)
-- Name: cars insurance; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT insurance FOREIGN KEY (insurance_id) REFERENCES public.insurances(id) ON DELETE SET NULL;


--
-- TOC entry 3248 (class 2606 OID 49527)
-- Name: prices model; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT model FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;


--
-- TOC entry 3250 (class 2606 OID 49545)
-- Name: cars model; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT model FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;


--
-- TOC entry 3247 (class 2606 OID 49495)
-- Name: workers position; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT "position" FOREIGN KEY (position_id) REFERENCES public.positions(id) ON DELETE CASCADE;


--
-- TOC entry 3258 (class 2606 OID 49610)
-- Name: violations traffic_violation; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.violations
    ADD CONSTRAINT traffic_violation FOREIGN KEY (traffic_violation_id) REFERENCES public.traffic_violation(id) ON DELETE CASCADE;


--
-- TOC entry 3253 (class 2606 OID 49577)
-- Name: contracts worker; Type: FK CONSTRAINT; Schema: public; Owner: dbmishakorni
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT worker FOREIGN KEY (worker_id) REFERENCES public.workers(id) ON DELETE SET NULL;


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-10-24 23:29:58

--
-- PostgreSQL database dump complete
--

