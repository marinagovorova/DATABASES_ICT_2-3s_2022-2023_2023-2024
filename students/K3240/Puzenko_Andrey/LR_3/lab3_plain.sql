--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-03-04 08:09:12

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
-- TOC entry 4895 (class 1262 OID 16399)
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

--
-- TOC entry 246 (class 1255 OID 32967)
-- Name: count_fuels_per_supplier(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.count_fuels_per_supplier() RETURNS TABLE(supplier_name character varying, number_of_fuels bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        sf.name AS supplier_name,
        COUNT(DISTINCT f.mark) AS number_of_fuels
    FROM 
        supplier_firms sf
    JOIN 
        gas_stations gs ON sf.id_firm = gs.id_firm
    JOIN 
        fuels_sold fs ON gs.id_station = fs.id_station
    JOIN 
        fuels f ON fs.id_fuel = f.id_fuel
    GROUP BY 
        sf.name;
END;
$$;


ALTER FUNCTION public.count_fuels_per_supplier() OWNER TO postgres;

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
    id_station bigint NOT NULL,
    passport_number character varying(20) NOT NULL
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
-- TOC entry 233 (class 1259 OID 32968)
-- Name: gas_station_fuels; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.gas_station_fuels AS
 SELECT DISTINCT gs.name AS gas_station_name,
    f.mark,
    f.type
   FROM ((public.gas_stations gs
     JOIN public.fuels_sold fs ON ((gs.id_station = fs.id_station)))
     JOIN public.fuels f ON ((fs.id_fuel = f.id_fuel)));


ALTER VIEW public.gas_station_fuels OWNER TO postgres;

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
-- TOC entry 234 (class 1259 OID 32987)
-- Name: most_profitable_gas_stations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.most_profitable_gas_stations AS
 SELECT DISTINCT ON (sf.name) sf.name AS supplier_name,
    gs.name AS gas_station_name,
    sum((p.amount_fuel * fs.price)) AS total_profit
   FROM ((((public.supplier_firms sf
     JOIN public.gas_stations gs ON ((sf.id_firm = gs.id_firm)))
     JOIN public.fuels_sold fs ON ((gs.id_station = fs.id_station)))
     JOIN public.fuels f ON ((fs.id_fuel = f.id_fuel)))
     JOIN public.purchases p ON ((fs.id_fuel_sold = p.id_fuel_sold)))
  WHERE (date_trunc('month'::text, (p.purchase_date)::timestamp with time zone) = (date_trunc('month'::text, (CURRENT_DATE)::timestamp with time zone) - '1 mon'::interval))
  GROUP BY sf.name, gs.name
  ORDER BY sf.name, (sum((p.amount_fuel * fs.price))) DESC;


ALTER VIEW public.most_profitable_gas_stations OWNER TO postgres;

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
-- TOC entry 4881 (class 0 OID 16449)
-- Dependencies: 224
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (10, 5, 1200);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (12, 7, 120.09);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (13, 8, 560.07);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (14, 91, 509.61);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (15, 92, 3924.6);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (16, 93, 4518.97);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (17, 94, 882.02);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (18, 95, 398.3);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (19, 96, 60.57);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (20, 97, 955.16);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (21, 98, 581.64);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (22, 99, 1848.01);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (23, 100, 259.34);
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (9, 4, 1098);


--
-- TOC entry 4879 (class 0 OID 16443)
-- Dependencies: 222
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (4, 'Andrey Puzenko', '89507777777', 'Saint Petersburg');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (5, 'Ivan Ivanov', '89525710000', 'Rostov-on-Don');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (6, 'Kristina Petrova', '89995007060', 'Moscow');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (7, 'Alexander Sobolev', '89123456789', 'Saint Petersburg');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (8, 'Alexandra Soboleva', '89987654321', 'Moscow');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (91, 'Petr Popov', '+79509509595', 'Belgorod');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (92, 'Elena Morozova', '+7(952)623-23-23', 'Vladivostok');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (93, 'Gleb Krylov', '89121239999', 'Murmansk');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (94, 'Ira Zhukova', '89001002020', 'Moscow');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (95, 'Andrey Bobrov', '+79128001212', 'Omsk');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (96, 'Sergey Chernov', '89288633436', 'Moscow');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (97, 'Varvara Frolova', '89328818717', 'Omsk');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (98, 'Dmitry Savin', '89607636988', 'Penza');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (99, 'Maxim Yefimov', '89995076096', 'Saint Petersburg');
INSERT INTO public.clients OVERRIDING SYSTEM VALUE VALUES (100, 'Polina Korneva', '89696903463', 'Rostov-on-Don');


--
-- TOC entry 4885 (class 0 OID 16472)
-- Dependencies: 228
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (16, 'Vladimir Romanov', '89145183420', 'МВД России Москва', 1, 5, '6000010101');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (17, 'Daria Voronova', '89378826744', 'МВД России Москва', 2, 5, '6009012101');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (18, 'Kirill Karpov', '89600217214', 'МВД России Омск', 4, 5, '6014222111');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (19, 'Maria Mironova', '89380494341', 'МВД России Ростов-на-Дону', 1, 6, '6000020202');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (20, 'Alisa Savelieva', '89190509167', 'МВД России Воронеж', 2, 6, '6008212121');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (21, 'Igor Goryachev', '89235914992', 'МВД России Воронеж', 4, 6, '6004898989');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (22, 'Maxim Ilyin', '89339815856', 'МВД России Санкт-Петербург', 1, 7, '6010030303');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (23, 'Kirill Fomichev', '89051056653', 'МВД России Москва', 2, 7, '6012212151');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (24, 'Alina Kondratieva', '89928318277', 'МВД России Пенза', 3, 7, '6010277151');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (25, 'Artem Petrov', '89397153988', 'МВД России Краснодар', 4, 7, '6012777888');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (26, 'Fyodor Grigoriev', '89361569781', 'МВД России Екатеринбург', 1, 8, '6020202020');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (27, 'Alisa Sizova', '89875140636', 'МВД России Казань', 2, 8, '6004040404');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (28, 'Semyon Ushakov', '89256671596', 'МВД России Санкт-Петербург', 4, 8, '6000123456');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (29, 'Victoria Alexeeva', '89014971343', 'МВД России Великий Новгород', 1, 9, '6000654321');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (30, 'Roman Kiselev', '89926832560', 'МВД России Москва', 2, 9, '6007999666');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (31, 'Maria Bogdanova', '89325550922', 'МВД России Москва', 3, 9, '6006181181');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (32, 'Yegor Petrovsky', '89545333816', 'МВД России Пенза', 4, 9, '6002565858');
INSERT INTO public.employees OVERRIDING SYSTEM VALUE VALUES (33, 'Ivan Terekhov', '89027350597', 'МВД России Москва', 2, 6, '6020001100');


--
-- TOC entry 4875 (class 0 OID 16431)
-- Dependencies: 218
-- Data for Name: fuels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (12, 'М-100', 'мазут', 'килограмм');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (13, 'АИ-98', 'бензин', 'литр');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (14, 'АИ-95', 'бензин', 'литр');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (15, 'АИ-92', 'бензин', 'литр');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (16, 'Пропат-бутан', 'газ', 'литр');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (17, 'Метан', 'газ', 'литр');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (18, 'ДТЛ', 'дизель', 'литр');
INSERT INTO public.fuels OVERRIDING SYSTEM VALUE VALUES (19, 'ДТЗ', 'дизель', 'литр');


--
-- TOC entry 4887 (class 0 OID 16488)
-- Dependencies: 230
-- Data for Name: fuels_sold; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (69, 5, 13, 68.4, '2024-01-01', '2024-01-14');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (70, 5, 13, 69.7, '2024-01-15', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (71, 5, 13, 70.2, '2024-02-01', '2024-02-18');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (72, 5, 13, 69.3, '2024-02-19', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (73, 5, 14, 55.4, '2024-01-01', '2024-01-16');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (74, 5, 14, 56.6, '2024-01-17', '2024-01-30');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (75, 5, 14, 57.8, '2024-01-31', '2024-02-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (76, 5, 14, 56.3, '2024-02-13', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (77, 5, 15, 51.2, '2024-01-01', '2024-01-13');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (78, 5, 15, 52.5, '2024-01-14', '2024-01-28');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (79, 5, 15, 53.8, '2024-01-29', '2024-02-08');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (80, 5, 15, 52.9, '2024-02-09', '2024-02-17');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (81, 5, 15, 52.2, '2024-02-18', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (82, 5, 18, 63.3, '2024-01-01', '2024-01-15');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (83, 5, 18, 62.8, '2024-01-16', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (84, 5, 18, 62.4, '2024-02-01', '2024-02-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (85, 5, 18, 63.1, '2024-02-13', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (86, 5, 19, 62.5, '2024-01-01', '2024-01-15');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (87, 5, 19, 62.1, '2024-01-16', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (88, 5, 19, 63.2, '2024-02-01', '2024-02-15');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (89, 5, 19, 63.6, '2024-02-16', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (90, 6, 12, 23.9, '2024-01-01', '2024-01-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (91, 6, 12, 24.3, '2024-01-13', '2024-01-25');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (92, 6, 12, 24.8, '2024-01-26', '2024-02-05');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (93, 6, 12, 24.1, '2024-02-06', '2024-02-15');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (94, 6, 12, 23.8, '2024-02-16', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (95, 6, 16, 28.3, '2024-01-01', '2024-01-18');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (96, 6, 16, 29.1, '2024-01-19', '2024-02-02');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (97, 6, 16, 29.8, '2024-02-03', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (98, 6, 17, 25.1, '2024-01-01', '2024-01-17');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (99, 6, 17, 25.8, '2024-01-18', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (100, 6, 17, 26.3, '2024-02-01', '2024-02-16');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (101, 6, 17, 26.3, '2024-02-17', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (102, 7, 13, 67.8, '2024-01-01', '2024-01-13');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (103, 7, 13, 67.5, '2024-01-14', '2024-02-01');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (104, 7, 13, 67.2, '2024-02-02', '2024-02-13');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (105, 7, 13, 67.6, '2024-02-14', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (106, 7, 14, 55.8, '2024-01-01', '2024-01-14');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (107, 7, 14, 56.2, '2024-01-15', '2024-01-28');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (108, 7, 14, 56.7, '2024-01-29', '2024-02-06');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (109, 7, 14, 56.2, '2024-02-07', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (110, 7, 15, 52, '2024-01-01', '2024-01-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (111, 7, 15, 52.5, '2024-01-13', '2024-01-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (112, 7, 15, 52.2, '2024-01-30', '2024-02-08');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (113, 7, 15, 51.8, '2024-02-09', '2024-02-18');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (114, 7, 15, 52, '2024-02-19', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (115, 7, 16, 27.6, '2024-01-01', '2024-01-18');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (116, 7, 16, 28.2, '2024-01-19', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (117, 7, 16, 28.9, '2024-02-01', '2024-02-16');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (118, 7, 16, 28.1, '2024-02-17', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (119, 8, 13, 68.2, '2024-01-01', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (120, 8, 13, 68.8, '2024-02-01', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (121, 8, 14, 55.4, '2024-01-01', '2024-01-20');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (122, 8, 14, 55.9, '2024-01-21', '2024-02-02');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (123, 8, 14, 56.1, '2024-02-03', '2024-02-18');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (124, 8, 14, 55.8, '2024-02-19', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (125, 8, 15, 51.2, '2024-01-01', '2024-01-16');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (126, 8, 15, 51.6, '2024-01-17', '2024-01-28');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (127, 8, 15, 51.7, '2024-01-29', '2024-02-03');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (128, 8, 15, 51.4, '2024-02-04', '2024-02-13');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (129, 8, 15, 51.2, '2024-02-14', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (130, 9, 16, 28.2, '2024-01-01', '2024-01-13');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (131, 9, 16, 28.9, '2024-01-14', '2024-01-31');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (132, 9, 16, 29.3, '2024-02-01', '2024-02-10');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (133, 9, 16, 28.8, '2024-02-11', '2024-02-29');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (134, 9, 17, 25.1, '2024-01-01', '2024-01-12');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (135, 9, 17, 25.4, '2024-01-13', '2024-01-25');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (136, 9, 17, 25.2, '2024-01-26', '2024-02-04');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (137, 9, 17, 24.9, '2024-02-05', '2024-02-13');
INSERT INTO public.fuels_sold OVERRIDING SYSTEM VALUE VALUES (138, 9, 17, 24.7, '2024-02-14', '2024-02-29');


--
-- TOC entry 4883 (class 0 OID 16461)
-- Dependencies: 226
-- Data for Name: gas_stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gas_stations OVERRIDING SYSTEM VALUE VALUES (5, 'Заправка 1', '88007009955', 'St. Petersburg, Oktyabrskaya embankment, 68, k2', 2);
INSERT INTO public.gas_stations OVERRIDING SYSTEM VALUE VALUES (6, 'Заправка 2', '88001000911', 'St. Petersburg, Dalnevostochny pr., 40', 3);
INSERT INTO public.gas_stations OVERRIDING SYSTEM VALUE VALUES (7, 'Заправка 3', '88007005151', 'St. Petersburg, prosp. Obukhov Defense, 303', 4);
INSERT INTO public.gas_stations OVERRIDING SYSTEM VALUE VALUES (8, 'Заправка 4', '89632779529', 'St. Petersburg, st. Sedova, 43k2', 2);
INSERT INTO public.gas_stations OVERRIDING SYSTEM VALUE VALUES (9, 'Заправка 5', '89341781059', 'St. Petersburg, Vitebsky pr., 47B', 3);


--
-- TOC entry 4873 (class 0 OID 16424)
-- Dependencies: 216
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.positions OVERRIDING SYSTEM VALUE VALUES (1, 'Salesperson', 40000);
INSERT INTO public.positions OVERRIDING SYSTEM VALUE VALUES (2, 'Cashier', 40000);
INSERT INTO public.positions OVERRIDING SYSTEM VALUE VALUES (3, 'Accountant', 100000);
INSERT INTO public.positions OVERRIDING SYSTEM VALUE VALUES (4, 'Gas station attendant', 45000);


--
-- TOC entry 4888 (class 0 OID 16512)
-- Dependencies: 231
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (11, 9, 17, 69, 8, '2024-01-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (12, 9, 17, 70, 6, '2024-01-20');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (13, 9, 16, 71, 9, '2024-02-16');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (14, 10, 20, 95, 10, '2024-01-06');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (15, 10, 20, 95, 12, '2024-01-08');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (16, 10, 19, 95, 14, '2024-01-14');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (17, 10, 20, 95, 12, '2024-01-16');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (18, 10, 19, 95, 12, '2024-01-18');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (19, 10, 20, 96, 16, '2024-01-21');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (20, 10, 20, 96, 15, '2024-01-25');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (21, 10, 20, 96, 14, '2024-01-30');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (22, 9, 17, 69, 11, '2024-01-08');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (24, 10, 19, 97, 11, '2024-02-04');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (25, 10, 20, 97, 6, '2024-02-05');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (26, 10, 20, 97, 10, '2024-02-08');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (27, 10, 20, 97, 9, '2024-02-10');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (28, 10, 20, 97, 8, '2024-02-13');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (29, 10, 20, 97, 7, '2024-02-15');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (30, 12, 22, 102, 18, '2024-01-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (31, 12, 23, 102, 16, '2024-01-03');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (32, 12, 23, 102, 10, '2024-01-05');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (33, 12, 23, 102, 30, '2024-01-06');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (34, 12, 22, 102, 15, '2024-01-10');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (35, 12, 23, 103, 15, '2024-01-15');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (36, 12, 23, 103, 12, '2024-01-17');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (37, 12, 23, 103, 10, '2024-01-18');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (38, 12, 22, 103, 17, '2024-01-20');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (39, 12, 23, 103, 11, '2024-01-25');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (40, 12, 23, 103, 9, '2024-01-31');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (41, 12, 23, 104, 11, '2024-02-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (42, 12, 23, 104, 8, '2024-02-03');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (43, 12, 22, 104, 19, '2024-02-04');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (44, 12, 22, 104, 30, '2024-02-05');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (45, 12, 23, 105, 35, '2024-02-14');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (46, 12, 23, 105, 40, '2024-02-16');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (47, 12, 23, 105, 20, '2024-02-28');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (48, 13, 26, 119, 30, '2024-01-01');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (49, 13, 27, 119, 35, '2024-01-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (50, 13, 27, 119, 25, '2024-01-04');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (51, 13, 27, 119, 28, '2024-01-05');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (52, 13, 27, 119, 31, '2024-01-08');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (53, 13, 26, 119, 37, '2024-01-09');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (54, 13, 27, 119, 35, '2024-01-10');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (55, 13, 27, 119, 32, '2024-01-19');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (56, 13, 26, 119, 19, '2024-01-29');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (57, 14, 29, 130, 30, '2024-01-01');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (58, 14, 30, 130, 32, '2024-01-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (59, 14, 30, 130, 22, '2024-01-04');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (60, 14, 29, 131, 28, '2024-01-15');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (61, 14, 30, 131, 16, '2024-01-16');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (62, 14, 30, 131, 21, '2024-01-17');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (63, 14, 30, 132, 31, '2024-02-08');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (64, 14, 29, 132, 40, '2024-02-09');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (65, 14, 29, 133, 34, '2024-02-12');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (66, 14, 30, 133, 23, '2024-02-26');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (67, 15, 30, 134, 22, '2024-01-01');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (68, 15, 30, 134, 31, '2024-01-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (69, 15, 30, 134, 41, '2024-01-04');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (70, 15, 29, 135, 16, '2024-01-17');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (71, 15, 29, 135, 26, '2024-01-19');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (72, 15, 30, 136, 37, '2024-02-03');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (73, 15, 30, 137, 23, '2024-02-12');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (74, 15, 30, 138, 23, '2024-02-25');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (75, 16, 26, 121, 23, '2024-01-01');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (76, 16, 27, 121, 27, '2024-01-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (77, 16, 27, 121, 33, '2024-01-13');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (78, 16, 27, 122, 42, '2024-01-22');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (79, 16, 26, 123, 22, '2024-02-16');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (80, 16, 26, 124, 15, '2024-02-28');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (81, 17, 22, 110, 13, '2024-01-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (82, 17, 23, 110, 34, '2024-01-04');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (83, 17, 23, 111, 27, '2024-01-24');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (84, 17, 23, 112, 37, '2024-02-04');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (85, 17, 23, 113, 40, '2024-02-14');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (86, 17, 22, 114, 33, '2024-02-27');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (87, 18, 19, 98, 30, '2024-01-16');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (88, 18, 20, 100, 22, '2024-02-14');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (89, 18, 20, 101, 28, '2024-02-19');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (90, 19, 17, 74, 15, '2024-01-19');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (91, 19, 17, 74, 14, '2024-01-19');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (92, 19, 16, 75, 32, '2024-02-10');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (93, 19, 17, 76, 21, '2024-02-23');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (94, 20, 27, 126, 40, '2024-01-20');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (95, 20, 27, 128, 30, '2024-02-12');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (96, 20, 26, 129, 20, '2024-02-15');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (97, 21, 22, 106, 32, '2024-01-12');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (98, 21, 23, 107, 21, '2024-01-17');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (99, 21, 23, 109, 28, '2024-02-08');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (100, 22, 17, 86, 33, '2024-01-02');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (101, 22, 16, 88, 30, '2024-02-14');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (102, 22, 17, 89, 31, '2024-02-16');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (103, 23, 17, 82, 15, '2024-01-01');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (104, 23, 17, 83, 40, '2024-01-16');
INSERT INTO public.purchases OVERRIDING SYSTEM VALUE VALUES (105, 23, 16, 84, 35, '2024-02-01');


--
-- TOC entry 4877 (class 0 OID 16437)
-- Dependencies: 220
-- Data for Name: supplier_firms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.supplier_firms OVERRIDING SYSTEM VALUE VALUES (2, 'РОСНЕФТЬ', '88123360025', 'St. Petersburg, Piskarevsky Prospekt, 125');
INSERT INTO public.supplier_firms OVERRIDING SYSTEM VALUE VALUES (3, 'ЛУКОЙЛ', '88126676445', 'St. Petersburg, Domostroitelnaya str., 16A');
INSERT INTO public.supplier_firms OVERRIDING SYSTEM VALUE VALUES (4, 'Газпром нефть', '88007003152', 'St. Petersburg, Pochtamtskaya st., 3');


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 223
-- Name: Cards_ID_card_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cards_ID_card_seq"', 23, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 221
-- Name: Clients_ID_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clients_ID_client_seq"', 100, true);


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 227
-- Name: Employees_ID_employee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Employees_ID_employee_seq"', 33, true);


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 229
-- Name: Fuels sold_ID_fuel_sold_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fuels sold_ID_fuel_sold_seq"', 138, true);


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 217
-- Name: Fuels_ID_fuel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fuels_ID_fuel_seq"', 19, true);


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 225
-- Name: Gas stations_ID_station_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Gas stations_ID_station_seq"', 9, true);


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 215
-- Name: Positions_ID_position_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Positions_ID_position_seq"', 4, true);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 219
-- Name: Supplier firms_ID_firm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Supplier firms_ID_firm_seq"', 4, true);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 232
-- Name: purchases_id_purchase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_id_purchase_seq', 105, true);


--
-- TOC entry 4707 (class 2606 OID 16454)
-- Name: cards Cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id_card);


--
-- TOC entry 4705 (class 2606 OID 16447)
-- Name: clients Clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (id_client);


--
-- TOC entry 4711 (class 2606 OID 16476)
-- Name: employees Employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "Employees_pkey" PRIMARY KEY (id_employee);


--
-- TOC entry 4715 (class 2606 OID 16494)
-- Name: fuels_sold Fuels sold_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuels_sold
    ADD CONSTRAINT "Fuels sold_pkey" PRIMARY KEY (id_fuel_sold);


--
-- TOC entry 4701 (class 2606 OID 16435)
-- Name: fuels Fuels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuels
    ADD CONSTRAINT "Fuels_pkey" PRIMARY KEY (id_fuel);


--
-- TOC entry 4709 (class 2606 OID 16465)
-- Name: gas_stations Gas stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gas_stations
    ADD CONSTRAINT "Gas stations_pkey" PRIMARY KEY (id_station);


--
-- TOC entry 4699 (class 2606 OID 16429)
-- Name: positions Positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT "Positions_pkey" PRIMARY KEY (id_position);


--
-- TOC entry 4717 (class 2606 OID 16517)
-- Name: purchases Purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT "Purchases_pkey" PRIMARY KEY (id_purchase);


--
-- TOC entry 4703 (class 2606 OID 16441)
-- Name: supplier_firms Supplier firms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_firms
    ADD CONSTRAINT "Supplier firms_pkey" PRIMARY KEY (id_firm);


--
-- TOC entry 4697 (class 2606 OID 24726)
-- Name: purchases check_date; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.purchases
    ADD CONSTRAINT check_date CHECK ((purchase_date <= CURRENT_DATE)) NOT VALID;


--
-- TOC entry 4684 (class 2606 OID 32938)
-- Name: fuels check_measurement; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.fuels
    ADD CONSTRAINT check_measurement CHECK (((unit_measurement)::text = ANY ((ARRAY['литр'::character varying, 'килограмм'::character varying, 'фунт'::character varying, 'галлон'::character varying])::text[]))) NOT VALID;


--
-- TOC entry 4687 (class 2606 OID 32927)
-- Name: clients check_name; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.clients
    ADD CONSTRAINT check_name CHECK (((full_name)::text ~* '^[a-zа-яё -]+$'::text)) NOT VALID;


--
-- TOC entry 4691 (class 2606 OID 32941)
-- Name: employees check_name; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.employees
    ADD CONSTRAINT check_name CHECK (((full_name)::text ~* '^[a-zа-яё -]+$'::text)) NOT VALID;


--
-- TOC entry 4692 (class 2606 OID 32944)
-- Name: employees check_passport_number; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.employees
    ADD CONSTRAINT check_passport_number CHECK (((passport_number)::text ~ '^[0-9 ]+$'::text)) NOT VALID;


--
-- TOC entry 4688 (class 2606 OID 32934)
-- Name: clients check_phone; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.clients
    ADD CONSTRAINT check_phone CHECK (((phone)::text ~ '^\+?[0-9\-\(\) ]+$'::text)) NOT VALID;


--
-- TOC entry 4693 (class 2606 OID 32935)
-- Name: employees check_phone; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.employees
    ADD CONSTRAINT check_phone CHECK (((phone)::text ~ '^\+?[0-9\-\(\) ]+$'::text)) NOT VALID;


--
-- TOC entry 4690 (class 2606 OID 32936)
-- Name: gas_stations check_phone; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.gas_stations
    ADD CONSTRAINT check_phone CHECK (((phone)::text ~ '^\+?[0-9\-\(\) ]+$'::text)) NOT VALID;


--
-- TOC entry 4686 (class 2606 OID 32937)
-- Name: supplier_firms check_phone; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.supplier_firms
    ADD CONSTRAINT check_phone CHECK (((phone)::text ~ '^\+?[0-9\-\(\) ]+$'::text)) NOT VALID;


--
-- TOC entry 4685 (class 2606 OID 24725)
-- Name: fuels check_type; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.fuels
    ADD CONSTRAINT check_type CHECK (((type)::text = ANY ((ARRAY['газ'::character varying, 'дизель'::character varying, 'бензин'::character varying, 'мазут'::character varying])::text[]))) NOT VALID;


--
-- TOC entry 4713 (class 2606 OID 32943)
-- Name: employees unique_passport; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT unique_passport UNIQUE (passport_number);


--
-- TOC entry 4724 (class 2606 OID 16518)
-- Name: purchases fk_card_purchase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_card_purchase FOREIGN KEY (id_card) REFERENCES public.cards(id_card);


--
-- TOC entry 4718 (class 2606 OID 16455)
-- Name: cards fk_clien_card; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT fk_clien_card FOREIGN KEY (id_client) REFERENCES public.clients(id_client);


--
-- TOC entry 4725 (class 2606 OID 16523)
-- Name: purchases fk_employee_purchase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_employee_purchase FOREIGN KEY (id_employee) REFERENCES public.employees(id_employee);


--
-- TOC entry 4719 (class 2606 OID 16466)
-- Name: gas_stations fk_firm_station; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gas_stations
    ADD CONSTRAINT fk_firm_station FOREIGN KEY (id_firm) REFERENCES public.supplier_firms(id_firm);


--
-- TOC entry 4722 (class 2606 OID 16500)
-- Name: fuels_sold fk_fuel_fuel_sold; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuels_sold
    ADD CONSTRAINT fk_fuel_fuel_sold FOREIGN KEY (id_fuel) REFERENCES public.fuels(id_fuel);


--
-- TOC entry 4726 (class 2606 OID 16528)
-- Name: purchases fk_fuel_sold_purchase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_fuel_sold_purchase FOREIGN KEY (id_fuel_sold) REFERENCES public.fuels_sold(id_fuel_sold);


--
-- TOC entry 4720 (class 2606 OID 16477)
-- Name: employees fk_position_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_position_employee FOREIGN KEY (id_position) REFERENCES public.positions(id_position);


--
-- TOC entry 4721 (class 2606 OID 16482)
-- Name: employees fk_station_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_station_employee FOREIGN KEY (id_station) REFERENCES public.gas_stations(id_station);


--
-- TOC entry 4723 (class 2606 OID 16495)
-- Name: fuels_sold fk_station_fuel_sold; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuels_sold
    ADD CONSTRAINT fk_station_fuel_sold FOREIGN KEY (id_station) REFERENCES public.gas_stations(id_station);


-- Completed on 2024-03-04 08:09:13

--
-- PostgreSQL database dump complete
--

