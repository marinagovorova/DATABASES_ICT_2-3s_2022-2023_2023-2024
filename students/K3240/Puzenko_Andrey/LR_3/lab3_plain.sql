--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-03-01 09:50:23

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
-- TOC entry 4872 (class 1262 OID 16399)
-- Name: Lab3; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Lab3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Lab3" OWNER TO postgres;

\connect "Lab3"

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16449)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id_card bigint NOT NULL,
    id_client bigint NOT NULL,
    balance double precision NOT NULL,
    CONSTRAINT check_balance CHECK ((balance >= (0)::double precision))
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16448)
-- Name: Cards_ID_card_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cards ALTER COLUMN id_card ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Cards_ID_card_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16443)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id_client bigint NOT NULL,
    full_name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    address character varying(200) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16442)
-- Name: Clients_ID_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.clients ALTER COLUMN id_client ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Clients_ID_client_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16472)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id_employee bigint NOT NULL,
    full_name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    passport_details character varying(200) NOT NULL,
    id_position bigint NOT NULL,
    id_station bigint NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16471)
-- Name: Employees_ID_employee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employees ALTER COLUMN id_employee ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Employees_ID_employee_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16488)
-- Name: fuels_sold; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fuels_sold (
    id_fuel_sold bigint NOT NULL,
    id_station bigint NOT NULL,
    id_fuel bigint NOT NULL,
    price double precision NOT NULL,
    price_start_date date NOT NULL,
    price_end_date date NOT NULL,
    CONSTRAINT check_date CHECK ((price_start_date < price_end_date)),
    CONSTRAINT check_price CHECK ((price > (0)::double precision))
);


ALTER TABLE public.fuels_sold OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16487)
-- Name: Fuels sold_ID_fuel_sold_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.fuels_sold ALTER COLUMN id_fuel_sold ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Fuels sold_ID_fuel_sold_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16431)
-- Name: fuels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fuels (
    id_fuel bigint NOT NULL,
    mark character varying(40) NOT NULL,
    type character varying(40) NOT NULL,
    unit_measurement character varying(40) NOT NULL
);


ALTER TABLE public.fuels OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16430)
-- Name: Fuels_ID_fuel_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.fuels ALTER COLUMN id_fuel ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Fuels_ID_fuel_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16461)
-- Name: gas_stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gas_stations (
    id_station bigint NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    address character varying(200) NOT NULL,
    id_firm bigint NOT NULL
);


ALTER TABLE public.gas_stations OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16460)
-- Name: Gas stations_ID_station_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.gas_stations ALTER COLUMN id_station ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Gas stations_ID_station_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16424)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    id_position bigint NOT NULL,
    title character varying(100) NOT NULL,
    salary integer NOT NULL,
    CONSTRAINT check_salary CHECK ((salary > 0))
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16423)
-- Name: Positions_ID_position_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.positions ALTER COLUMN id_position ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Positions_ID_position_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16437)
-- Name: supplier_firms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_firms (
    id_firm bigint NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    address character varying(200) NOT NULL
);


ALTER TABLE public.supplier_firms OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16436)
-- Name: Supplier firms_ID_firm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.supplier_firms ALTER COLUMN id_firm ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Supplier firms_ID_firm_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16512)
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
    id_purchase bigint NOT NULL,
    id_card bigint NOT NULL,
    id_employee bigint NOT NULL,
    id_fuel_sold bigint NOT NULL,
    amount_fuel double precision NOT NULL,
    purchase_date date NOT NULL,
    CONSTRAINT check_amount_fuel CHECK ((amount_fuel > (0)::double precision))
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16547)
-- Name: purchases_id_purchase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.purchases ALTER COLUMN id_purchase ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchases_id_purchase_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4858 (class 0 OID 16449)
-- Dependencies: 224
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (9, 4, 998);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (10, 5, 1200);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (11, 6, 10);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (12, 7, 120.09);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (13, 8, 560.07);


--
-- TOC entry 4856 (class 0 OID 16443)
-- Dependencies: 222
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (4, 'Andrey Puzenko', '89507777777', 'Saint Petersburg');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (5, 'Ivan Ivanov', '89525710000', 'Rostov-on-Don');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (6, 'Kristina Petrova', '89995007060', 'Moscow');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (7, 'Alexander Sobolev', '89123456789', 'Saint Petersburg');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (8, 'Alexandra Soboleva', '89987654321', 'Moscow');


--
-- TOC entry 4862 (class 0 OID 16472)
-- Dependencies: 228
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (1, 'Ivanov Ivan Ivanovich', '89931232323', '6006030201', 2, 5);
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (2, 'Voronina Elena Ivanovna', '89921234545', '6006030402', 3, 5);
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (3, 'Rybnik Petr Sergeevich', '89321238989', '6010100000', 4, 5);
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (4, 'Smirnova Ksenia Anatolyevna', '89021002020', '6012010101', 2, 6);
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (5, 'Shcherbakov Gleb Antonovich', '89051202121', '6020000000', 4, 6);
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (6, 'Popov Sergey Sergeevich', '89616161616', '6008080808', 1, 7);
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (7, 'Kuznetsova Anastasia Vasilievna', '89585858585', '6085858585', 2, 7);
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (8, 'Zubko Alexander Vasilievich', '89621002030', '6012020202', 4, 7);


--
-- TOC entry 4852 (class 0 OID 16431)
-- Dependencies: 218
-- Data for Name: fuels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (2, 'АИ-98', 'бензин', 'литры');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (3, 'АИ-95', 'бензин', 'литры');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (4, 'АИ-92', 'бензин', 'литры');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (5, 'ДТЛ', 'дизельное топливо', 'литры');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (6, 'ДТЗ', 'дизельное топливо', 'литры');


--
-- TOC entry 4864 (class 0 OID 16488)
-- Dependencies: 230
-- Data for Name: fuels_sold; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (6, 5, 2, 70, '2024-01-01', '2024-01-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (7, 5, 2, 74, '2024-01-13', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (8, 5, 2, 72, '2024-02-01', '2024-02-14');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (9, 5, 2, 71, '2024-02-15', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (10, 5, 3, 58, '2024-01-01', '2024-01-10');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (11, 5, 3, 65, '2024-01-11', '2024-01-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (12, 5, 3, 64, '2024-01-30', '2024-02-10');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (13, 5, 3, 60, '2024-02-11', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (14, 5, 4, 51, '2024-01-01', '2024-01-20');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (15, 5, 4, 54, '2024-01-21', '2024-02-04');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (16, 5, 4, 52, '2024-02-05', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (17, 6, 3, 57, '2024-01-01', '2024-01-11');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (18, 6, 3, 62.2, '2024-01-12', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (19, 6, 3, 59.8, '2024-02-01', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (20, 6, 4, 50.8, '2024-01-01', '2024-01-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (21, 6, 4, 52.9, '2024-01-13', '2024-02-02');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (22, 6, 4, 51.1, '2024-02-03', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (23, 6, 5, 64.4, '2024-01-01', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (24, 6, 5, 66.8, '2024-02-01', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (25, 6, 6, 63.4, '2024-01-01', '2024-01-15');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (26, 6, 6, 62.8, '2024-01-16', '2024-01-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (27, 6, 6, 64.9, '2024-01-30', '2024-02-16');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (28, 6, 6, 65.1, '2024-02-17', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (29, 7, 2, 72.2, '2024-01-01', '2024-01-15');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (30, 7, 2, 75.1, '2024-01-16', '2024-01-28');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (31, 7, 2, 74.4, '2024-01-29', '2024-02-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (32, 7, 2, 73.1, '2024-02-13', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (33, 7, 3, 57.3, '2024-01-01', '2024-01-14');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (34, 7, 3, 60.2, '2024-01-15', '2024-01-30');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (35, 7, 3, 60.5, '2024-01-31', '2024-02-07');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (36, 7, 3, 59.1, '2024-02-08', '2024-02-17');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (37, 7, 3, 59.5, '2024-02-18', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (38, 7, 4, 50.8, '2024-01-01', '2024-01-20');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (39, 7, 4, 52.7, '2024-01-21', '2024-02-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (40, 7, 4, 51.6, '2024-02-13', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (41, 7, 5, 65.9, '2024-01-01', '2024-01-27');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (42, 7, 5, 64.3, '2024-01-28', '2024-02-19');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (43, 7, 5, 62.87, '2024-02-20', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (44, 7, 6, 65.3, '2024-01-01', '2024-01-27');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (45, 7, 6, 64.57, '2024-01-28', '2024-02-19');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (46, 7, 6, 63.33, '2024-02-20', '2024-02-29');


--
-- TOC entry 4860 (class 0 OID 16461)
-- Dependencies: 226
-- Data for Name: gas_stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gas_stations OVERRIDING SYSTEM VALUE VALUES (5, 'Заправка 1', '88007009955', 'St. Petersburg, Oktyabrskaya embankment, 68, k2', 2);
INSERT INTO public.gas_stations OVERRIDING SYSTEM VALUE VALUES (6, 'Заправка 2', '88001000911', 'St. Petersburg, Dalnevostochny pr., 40', 3);
INSERT INTO public.gas_stations OVERRIDING SYSTEM VALUE VALUES (7, 'Заправка 3', '88007005151', 'St. Petersburg, prosp. Obukhov Defense, 303', 4);


--
-- TOC entry 4850 (class 0 OID 16424)
-- Dependencies: 216
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.positions OVERRIDING SYSTEM VALUE VALUES (1, 'Salesperson', 40000);
INSERT INTO public.positions OVERRIDING SYSTEM VALUE VALUES (2, 'Cashier', 40000);
INSERT INTO public.positions OVERRIDING SYSTEM VALUE VALUES (3, 'Accountant', 100000);
INSERT INTO public.positions OVERRIDING SYSTEM VALUE VALUES (4, 'Gas station attendant', 45000);


--
-- TOC entry 4865 (class 0 OID 16512)
-- Dependencies: 231
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (1, 9, 1, 6, 4, '2024-01-06');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (2, 9, 4, 20, 8, '2024-01-08');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (3, 9, 1, 8, 10, '2024-02-10');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (4, 10, 6, 45, 12, '2024-02-12');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (5, 11, 4, 24, 9, '2024-02-25');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (6, 12, 1, 15, 6, '2024-02-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (7, 13, 7, 39, 10, '2024-02-10');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (8, 13, 7, 40, 9, '2024-02-16');


--
-- TOC entry 4854 (class 0 OID 16437)
-- Dependencies: 220
-- Data for Name: supplier_firms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.supplier_firms OVERRIDING SYSTEM VALUE VALUES (2, 'РОСНЕФТЬ', '88123360025', 'St. Petersburg, Piskarevsky Prospekt, 125');
INSERT INTO public.supplier_firms OVERRIDING SYSTEM VALUE VALUES (3, 'ЛУКОЙЛ', '88126676445', 'St. Petersburg, Domostroitelnaya str., 16A');
INSERT INTO public.supplier_firms OVERRIDING SYSTEM VALUE VALUES (4, 'Газпром нефть', '88007003152', 'St. Petersburg, Pochtamtskaya st., 3');


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 223
-- Name: Cards_ID_card_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cards_ID_card_seq"', 13, true);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 221
-- Name: Clients_ID_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clients_ID_client_seq"', 8, true);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 227
-- Name: Employees_ID_employee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Employees_ID_employee_seq"', 8, true);


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 229
-- Name: Fuels sold_ID_fuel_sold_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fuels sold_ID_fuel_sold_seq"', 46, true);


--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 217
-- Name: Fuels_ID_fuel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fuels_ID_fuel_seq"', 6, true);


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 225
-- Name: Gas stations_ID_station_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Gas stations_ID_station_seq"', 7, true);


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 215
-- Name: Positions_ID_position_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Positions_ID_position_seq"', 4, true);


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 219
-- Name: Supplier firms_ID_firm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Supplier firms_ID_firm_seq"', 4, true);


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 232
-- Name: purchases_id_purchase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_id_purchase_seq', 8, true);


--
-- TOC entry 4688 (class 2606 OID 16454)
-- Name: cards Cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id_card);


--
-- TOC entry 4686 (class 2606 OID 16447)
-- Name: clients Clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (id_client);


--
-- TOC entry 4692 (class 2606 OID 16476)
-- Name: employees Employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "Employees_pkey" PRIMARY KEY (id_employee);


--
-- TOC entry 4694 (class 2606 OID 16494)
-- Name: fuels_sold Fuels sold_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuels_sold
    ADD CONSTRAINT "Fuels sold_pkey" PRIMARY KEY (id_fuel_sold);


--
-- TOC entry 4682 (class 2606 OID 16435)
-- Name: fuels Fuels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuels
    ADD CONSTRAINT "Fuels_pkey" PRIMARY KEY (id_fuel);


--
-- TOC entry 4690 (class 2606 OID 16465)
-- Name: gas_stations Gas stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gas_stations
    ADD CONSTRAINT "Gas stations_pkey" PRIMARY KEY (id_station);


--
-- TOC entry 4680 (class 2606 OID 16429)
-- Name: positions Positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT "Positions_pkey" PRIMARY KEY (id_position);


--
-- TOC entry 4696 (class 2606 OID 16517)
-- Name: purchases Purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT "Purchases_pkey" PRIMARY KEY (id_purchase);


--
-- TOC entry 4684 (class 2606 OID 16441)
-- Name: supplier_firms Supplier firms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_firms
    ADD CONSTRAINT "Supplier firms_pkey" PRIMARY KEY (id_firm);


--
-- TOC entry 4703 (class 2606 OID 16518)
-- Name: purchases fk_card_purchase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_card_purchase FOREIGN KEY (id_card) REFERENCES public.cards(id_card);


--
-- TOC entry 4697 (class 2606 OID 16455)
-- Name: cards fk_clien_card; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT fk_clien_card FOREIGN KEY (id_client) REFERENCES public.clients(id_client);


--
-- TOC entry 4704 (class 2606 OID 16523)
-- Name: purchases fk_employee_purchase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_employee_purchase FOREIGN KEY (id_employee) REFERENCES public.employees(id_employee);


--
-- TOC entry 4698 (class 2606 OID 16466)
-- Name: gas_stations fk_firm_station; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gas_stations
    ADD CONSTRAINT fk_firm_station FOREIGN KEY (id_firm) REFERENCES public.supplier_firms(id_firm);


--
-- TOC entry 4701 (class 2606 OID 16500)
-- Name: fuels_sold fk_fuel_fuel_sold; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuels_sold
    ADD CONSTRAINT fk_fuel_fuel_sold FOREIGN KEY (id_fuel) REFERENCES public.fuels(id_fuel);


--
-- TOC entry 4705 (class 2606 OID 16528)
-- Name: purchases fk_fuel_sold_purchase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_fuel_sold_purchase FOREIGN KEY (id_fuel_sold) REFERENCES public.fuels_sold(id_fuel_sold);


--
-- TOC entry 4699 (class 2606 OID 16477)
-- Name: employees fk_position_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_position_employee FOREIGN KEY (id_position) REFERENCES public.positions(id_position);


--
-- TOC entry 4700 (class 2606 OID 16482)
-- Name: employees fk_station_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_station_employee FOREIGN KEY (id_station) REFERENCES public.gas_stations(id_station);


--
-- TOC entry 4702 (class 2606 OID 16495)
-- Name: fuels_sold fk_station_fuel_sold; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuels_sold
    ADD CONSTRAINT fk_station_fuel_sold FOREIGN KEY (id_station) REFERENCES public.gas_stations(id_station);


-- Completed on 2024-03-01 09:50:24

--
-- PostgreSQL database dump complete
--

