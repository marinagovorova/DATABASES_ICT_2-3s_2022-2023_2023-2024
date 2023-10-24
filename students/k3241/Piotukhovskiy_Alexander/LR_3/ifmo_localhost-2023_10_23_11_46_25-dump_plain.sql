--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.2

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
-- Name: itmo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE itmo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE itmo OWNER TO postgres;

\connect itmo

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
-- Name: lab3; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA lab3;


ALTER SCHEMA lab3 OWNER TO pg_database_owner;

--
-- Name: SCHEMA lab3; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA lab3 IS 'standard lab3 schema';


--
-- Name: bus_repair_status; Type: TYPE; Schema: lab3; Owner: postgres
--

CREATE TYPE lab3.bus_repair_status AS ENUM (
    'good',
    'defective',
    'discarded',
    'repairing'
);


ALTER TYPE lab3.bus_repair_status OWNER TO postgres;

--
-- Name: office_status; Type: TYPE; Schema: lab3; Owner: postgres
--

CREATE TYPE lab3.office_status AS ENUM (
    'opened',
    'closed',
    'closed temporarily',
    'closed permanently'
);


ALTER TYPE lab3.office_status OWNER TO postgres;

--
-- Name: user_sex; Type: TYPE; Schema: lab3; Owner: postgres
--

CREATE TYPE lab3.user_sex AS ENUM (
    'M',
    'F',
    'NB'
);


ALTER TYPE lab3.user_sex OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bus; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.bus (
    bus_number character varying(10) NOT NULL,
    repair_status lab3.bus_repair_status NOT NULL,
    type_id character varying(20) NOT NULL,
    CONSTRAINT check_bus_number CHECK (((bus_number)::text ~ '[a-z0-9]+'::text))
);


ALTER TABLE lab3.bus OWNER TO postgres;

--
-- Name: medical_checkup; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.medical_checkup (
    checkup_id bigint NOT NULL,
    medical_checkup_passed boolean NOT NULL,
    medical_checkup_date date NOT NULL,
    driver_id bigint NOT NULL,
    trip_id bigint NOT NULL
);


ALTER TABLE lab3.medical_checkup OWNER TO postgres;

--
-- Name: crew_crew_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.medical_checkup ALTER COLUMN checkup_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.crew_crew_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: drivers; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.drivers (
    driver_id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    middle_name character varying(30),
    phone_number character varying(16) NOT NULL,
    passport_no numeric(10,0) NOT NULL,
    sex lab3.user_sex NOT NULL,
    date_of_birth date NOT NULL,
    place_of_birth character varying(50) NOT NULL,
    date_of_issue date NOT NULL,
    division_code character varying(7) NOT NULL,
    issued_by character varying(50) NOT NULL,
    CONSTRAINT check_date_of_birth CHECK ((date_of_birth < now())),
    CONSTRAINT check_date_of_issue CHECK (((date_of_issue > date_of_birth) AND (date_of_issue < now()))),
    CONSTRAINT check_division_code CHECK (((division_code)::text ~ '^[0-9]{3}\-[0-9]{3}$'::text)),
    CONSTRAINT check_first_name CHECK (((first_name)::text ~ '^[А-Яа-яa-zA-Z]+$'::text)),
    CONSTRAINT check_issued_by CHECK (((issued_by)::text ~ '^[a-zA-Zа-яА-Я ]+$'::text)),
    CONSTRAINT check_last_name CHECK (((last_name)::text ~ '^[А-Яа-яa-zA-Z]+$'::text)),
    CONSTRAINT check_middle_name CHECK (((middle_name)::text ~ '^[А-Яа-яa-zA-Z]*$'::text)),
    CONSTRAINT check_passport CHECK (((passport_no)::text ~ '[0-9]{10}'::text)),
    CONSTRAINT check_phone CHECK (((phone_number)::text ~ '^\+?[0-9]{8,15}$'::text)),
    CONSTRAINT check_place_of_birth CHECK (((place_of_birth)::text ~ '^[a-zа-яA-ZА-Я -]+$'::text))
);


ALTER TABLE lab3.drivers OWNER TO postgres;

--
-- Name: drivers_driver_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.drivers ALTER COLUMN driver_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.drivers_driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: passengers; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.passengers (
    passenger_id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    middle_name character varying(30),
    email character varying(50) NOT NULL,
    phone_number character varying(16) NOT NULL,
    passport_no numeric(10,0) NOT NULL,
    sex lab3.user_sex NOT NULL,
    date_of_birth date NOT NULL,
    place_of_birth character varying(50) NOT NULL,
    date_of_issue date NOT NULL,
    division_code character varying(7) NOT NULL,
    issued_by character varying(50) NOT NULL,
    CONSTRAINT check_date_of_birth CHECK ((date_of_birth < now())),
    CONSTRAINT check_date_of_issue CHECK (((date_of_issue > date_of_birth) AND (date_of_issue < now()))),
    CONSTRAINT check_division_code CHECK (((division_code)::text ~ '^[0-9]{3}\-[0-9]{3}$'::text)),
    CONSTRAINT check_email CHECK (((email)::text ~ '^[a-z0-9._%+-]+@([a-z0-9-]+\.)*[a-z0-9-]+\.[a-z]{2,}$'::text)),
    CONSTRAINT check_first_name CHECK (((first_name)::text ~ '^[А-Яа-яa-zA-Z]+$'::text)),
    CONSTRAINT check_issued_by CHECK (((issued_by)::text ~ '^[a-zA-Zа-яА-Я ]+$'::text)),
    CONSTRAINT check_last_name CHECK (((last_name)::text ~ '^[А-Яа-яa-zA-Z]+$'::text)),
    CONSTRAINT check_middle_name CHECK (((middle_name)::text ~ '^[А-Яа-яa-zA-Z]*$'::text)),
    CONSTRAINT check_passport CHECK (((passport_no)::text ~ '[0-9]{10}'::text)),
    CONSTRAINT check_phone CHECK (((phone_number)::text ~ '^\+?[0-9]{8,15}$'::text)),
    CONSTRAINT check_place_of_birth CHECK (((place_of_birth)::text ~ '^[a-zа-яA-ZА-Я -]+$'::text))
);


ALTER TABLE lab3.passengers OWNER TO postgres;

--
-- Name: passengers_passenger_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.passengers ALTER COLUMN passenger_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.passengers_passenger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: schedule; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.schedule (
    schedule_id bigint NOT NULL,
    departure_time time without time zone NOT NULL,
    arrival_time time without time zone NOT NULL,
    departure_destination bigint NOT NULL,
    arrival_destination bigint NOT NULL,
    CONSTRAINT check_times CHECK ((arrival_time <= departure_time))
);


ALTER TABLE lab3.schedule OWNER TO postgres;

--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.schedule ALTER COLUMN schedule_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.schedule_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.station (
    station_id bigint NOT NULL,
    station_name character varying(30) NOT NULL,
    settlement_type character varying(20) NOT NULL,
    address character varying(50) NOT NULL
);


ALTER TABLE lab3.station OWNER TO postgres;

--
-- Name: station_in_trip; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.station_in_trip (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    "order" integer NOT NULL,
    departure_time time without time zone NOT NULL,
    arrival_time time without time zone NOT NULL,
    schedule_id bigint NOT NULL,
    CONSTRAINT check_times CHECK ((arrival_time <= departure_time))
);


ALTER TABLE lab3.station_in_trip OWNER TO postgres;

--
-- Name: station_in_trip_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.station_in_trip ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.station_in_trip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_station_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.station ALTER COLUMN station_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.station_station_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ticket; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.ticket (
    ticket_id bigint NOT NULL,
    seat integer NOT NULL,
    price integer NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    passenger_id bigint NOT NULL,
    office_id bigint NOT NULL,
    trip_id bigint NOT NULL,
    departure_destination bigint NOT NULL,
    arrival_destination bigint NOT NULL,
    CONSTRAINT check_discount CHECK ((discount >= 0)),
    CONSTRAINT check_price CHECK ((price > 0))
);


ALTER TABLE lab3.ticket OWNER TO postgres;

--
-- Name: ticket_office; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.ticket_office (
    office_id bigint NOT NULL,
    status lab3.office_status NOT NULL,
    address character varying(50) NOT NULL
);


ALTER TABLE lab3.ticket_office OWNER TO postgres;

--
-- Name: ticket_office_office_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.ticket_office ALTER COLUMN office_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.ticket_office_office_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ticket_ticket_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.ticket ALTER COLUMN ticket_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.ticket_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: trip; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.trip (
    trip_id bigint NOT NULL,
    date_of_trip date NOT NULL,
    schedule_id bigint NOT NULL,
    bus_number character varying(10) NOT NULL
);


ALTER TABLE lab3.trip OWNER TO postgres;

--
-- Name: trip_trip_id_seq; Type: SEQUENCE; Schema: lab3; Owner: postgres
--

ALTER TABLE lab3.trip ALTER COLUMN trip_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab3.trip_trip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: type_of_bus; Type: TABLE; Schema: lab3; Owner: postgres
--

CREATE TABLE lab3.type_of_bus (
    type_id character varying(20) NOT NULL,
    country character varying(4) NOT NULL,
    vendor character varying(20) NOT NULL,
    year_of_release numeric(4,0) NOT NULL,
    seats_count integer NOT NULL,
    CONSTRAINT check_country CHECK (((country)::text ~ '[a-z]{2,4}'::text)),
    CONSTRAINT check_seats_count CHECK ((seats_count >= 0)),
    CONSTRAINT check_year_of_release CHECK (((year_of_release > (0)::numeric) AND ((year_of_release)::double precision <= date_part('year'::text, now()))))
);


ALTER TABLE lab3.type_of_bus OWNER TO postgres;

--
-- Data for Name: bus; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.bus (bus_number, repair_status, type_id) FROM stdin;
e947at147	good	Лазурный
o00000777	repairing	Лазурный
t665at12	good	Лазурный
m193em47	defective	Буханка
p141hh78	good	Буханка
t765dt98	discarded	Уазик
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.drivers (driver_id, first_name, last_name, middle_name, phone_number, passport_no, sex, date_of_birth, place_of_birth, date_of_issue, division_code, issued_by) FROM stdin;
1	Алексей	Крутоголов	Михайлович	+77777777777	4878888888	M	1977-05-12	Москва	2019-07-30	780-001	ГУ МВД ПО СПБ И ЛО
3	Михаил	Садко	Романович	+7908654322	7657435262	M	1978-01-02	Санкт-Петербург	2019-07-29	780-001	ГУ МВД ПО СПБ И ЛО
4	Ярослав	Тороп	Дмитриевич	+79213676543	4810876578	M	1985-12-01	Санкт-Петербург	2020-01-19	876-018	ГУ МВД ПО СПБ И ЛО
\.


--
-- Data for Name: medical_checkup; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.medical_checkup (checkup_id, medical_checkup_passed, medical_checkup_date, driver_id, trip_id) FROM stdin;
2	t	2023-10-22	3	1
3	f	2023-10-22	1	1
4	t	2023-10-22	4	1
\.


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.passengers (passenger_id, first_name, last_name, middle_name, email, phone_number, passport_no, sex, date_of_birth, place_of_birth, date_of_issue, division_code, issued_by) FROM stdin;
9	Renaldo	Corley	Никифорович	era_rowell86@yahoo.com	+76475629190	7465192836	F	2004-03-21	Orange	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
23	Justa	Brand	Андреевич	brittny43606@forestry.com	+76456292193	7847562847	F	2004-03-21	Baltimore	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
10	Cristopher	Meacham	Петров	dick.leggett@banks.com	+76475629194	1234556753	F	2004-03-21	Odessa	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
8	Alayna	Spears	Ящеров	sharie_chilton04@arrest.com	+76475629191	9876543266	F	2004-03-21	Killeen	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
21	Emanuel	Barbosa	Еленовна	leia9@scout.com	+7645629193	2047562847	F	2004-03-21	Norwalk	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
19	Cleo	Hager	Денисовна	elainagleason@hotmail.com	+76475229193	2847562047	F	2004-03-21	Abilene	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
11	Lorilee	Holguin	Денисович	stephenmattson@hotmail.com	+76475629195	6354658672	NB	2004-03-21	Mesa	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
22	Connie	Pulliam	\N	mckinleybuchanan@hotmail.com	+6475629193	9847562847	M	2004-03-21	Poughkeepsie	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
24	Teodora	Castleberry	Владимирович	stanford203@yahoo.com	+76475623193	6847562847	F	2004-03-21	Nashua	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
15	Maris	Mount	Петровна	verlene04403@hotmail.com	+76475629199	2347562847	NB	2003-03-21	Peoria	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
17	Weldon	Kirchner	\N	dominiccordero@idle.com	+7647562918	2847562849	M	2004-03-21	Layton	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
7	Jeannie	Sena	Кириллович	francisca.sturgeon@yahoo.com	+76475629192	1234567890	M	2004-03-21	Pomona	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
12	Zena	Royster	Смирнов	domonique-upshaw582@yahoo.com	+76475629196	2847562945	M	2004-03-21	Huntington Beach	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
14	Louis	Kroll	Иванов	allegraroybal@deck.com	+76475629198	2847522847	M	2005-03-21	Fayetteville	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
27	Isreal	Valerio	Олегович	ilene_lawson7@violent.definima.net	+7647562310	9999999999	M	2004-03-21	Leominster	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
6	Bethanie	Macmillan	Казахстанович	krystinaaugustine41@gmail.com	+76475629193	3333333333	M	2004-03-21	Norfolk	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
18	Cassey	Hostetler	Александрович	salinawilber@departure.com	+76475629	2847562840	M	2004-03-21	Westminster	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
13	Gregory	Cupp	Георгевич	marcy57@hotmail.com	+76475629197	2847562847	F	2004-03-21	Amarillo	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
20	Susan	Darby	Михайлович	jeanna.zimmerman@gmail.com	+72475629193	2147562847	NB	2004-03-21	Orange	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
16	Leana	Oliver	Денисович	hanbernier@yahoo.com	+7647562919	2847562848	NB	2004-03-21	Lake Charles	2018-02-02	786-009	ГУ МВД ПО СПБ И ЛО
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.schedule (schedule_id, departure_time, arrival_time, departure_destination, arrival_destination) FROM stdin;
3	14:20:00	14:13:00	2	3
2	16:30:00	10:30:00	1	4
1	12:00:00	10:00:00	1	3
\.


--
-- Data for Name: station; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.station (station_id, station_name, settlement_type, address) FROM stdin;
1	Ветеранов	Город	Ветеранов 13
2	Восстания	Город	Восстания 1
3	Владимирская	Город	Большая Московская 2
4	Девяткино	Деревня	Авиаторов Балтики 7
\.


--
-- Data for Name: station_in_trip; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.station_in_trip (id, station_id, "order", departure_time, arrival_time, schedule_id) FROM stdin;
1	1	0	10:00:00	09:55:00	1
2	2	1	11:50:00	11:45:00	1
3	3	2	12:00:00	12:00:00	1
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.ticket (ticket_id, seat, price, discount, passenger_id, office_id, trip_id, departure_destination, arrival_destination) FROM stdin;
1	1	13	0	7	0	1	1	2
2	-1	8	0	8	0	1	1	3
3	2	13	0	9	0	1	1	2
4	-1	10	0	10	2	1	3	2
\.


--
-- Data for Name: ticket_office; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.ticket_office (office_id, status, address) FROM stdin;
2	opened	Большая Морская 12
3	closed	Ветеранов 11
4	closed permanently	Авиаторов Балтики 7
0	opened	ONLINE
\.


--
-- Data for Name: trip; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.trip (trip_id, date_of_trip, schedule_id, bus_number) FROM stdin;
1	2023-10-22	1	e947at147
2	2023-10-22	2	e947at147
3	2023-10-23	3	t665at12
\.


--
-- Data for Name: type_of_bus; Type: TABLE DATA; Schema: lab3; Owner: postgres
--

COPY lab3.type_of_bus (type_id, country, vendor, year_of_release, seats_count) FROM stdin;
Буханка	ru	АвтоВАЗ	1995	20
Уазик	ru	АвтоВАЗ	1997	2
Лазурный	ch	KIA	2022	50
\.


--
-- Name: crew_crew_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.crew_crew_id_seq', 4, true);


--
-- Name: drivers_driver_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.drivers_driver_id_seq', 4, true);


--
-- Name: passengers_passenger_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.passengers_passenger_id_seq', 27, true);


--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.schedule_schedule_id_seq', 3, true);


--
-- Name: station_in_trip_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.station_in_trip_id_seq', 3, true);


--
-- Name: station_station_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.station_station_id_seq', 4, true);


--
-- Name: ticket_office_office_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.ticket_office_office_id_seq', 4, true);


--
-- Name: ticket_ticket_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.ticket_ticket_id_seq', 4, true);


--
-- Name: trip_trip_id_seq; Type: SEQUENCE SET; Schema: lab3; Owner: postgres
--

SELECT pg_catalog.setval('lab3.trip_trip_id_seq', 3, true);


--
-- Name: bus bus_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.bus
    ADD CONSTRAINT bus_pk PRIMARY KEY (bus_number);


--
-- Name: drivers drivers_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.drivers
    ADD CONSTRAINT drivers_pk PRIMARY KEY (driver_id);


--
-- Name: drivers drivers_pk2; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.drivers
    ADD CONSTRAINT drivers_pk2 UNIQUE (phone_number);


--
-- Name: drivers drivers_pk3; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.drivers
    ADD CONSTRAINT drivers_pk3 UNIQUE (passport_no);


--
-- Name: medical_checkup medical_checkup_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.medical_checkup
    ADD CONSTRAINT medical_checkup_pk PRIMARY KEY (checkup_id);


--
-- Name: passengers passengers_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.passengers
    ADD CONSTRAINT passengers_pk PRIMARY KEY (passenger_id);


--
-- Name: passengers passengers_pk2; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.passengers
    ADD CONSTRAINT passengers_pk2 UNIQUE (email);


--
-- Name: passengers passengers_pk3; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.passengers
    ADD CONSTRAINT passengers_pk3 UNIQUE (phone_number);


--
-- Name: passengers passengers_pk4; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.passengers
    ADD CONSTRAINT passengers_pk4 UNIQUE (passport_no);


--
-- Name: schedule schedule_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.schedule
    ADD CONSTRAINT schedule_pk PRIMARY KEY (schedule_id);


--
-- Name: station_in_trip station_in_trip_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.station_in_trip
    ADD CONSTRAINT station_in_trip_pk PRIMARY KEY (id);


--
-- Name: station station_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.station
    ADD CONSTRAINT station_pk PRIMARY KEY (station_id);


--
-- Name: ticket_office ticket_office_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.ticket_office
    ADD CONSTRAINT ticket_office_pk PRIMARY KEY (office_id);


--
-- Name: ticket ticket_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.ticket
    ADD CONSTRAINT ticket_pk PRIMARY KEY (ticket_id);


--
-- Name: trip trip_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.trip
    ADD CONSTRAINT trip_pk PRIMARY KEY (trip_id);


--
-- Name: type_of_bus type_of_bus_pk; Type: CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.type_of_bus
    ADD CONSTRAINT type_of_bus_pk PRIMARY KEY (type_id);


--
-- Name: bus bus_type_of_bus_type_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.bus
    ADD CONSTRAINT bus_type_of_bus_type_id_fk FOREIGN KEY (type_id) REFERENCES lab3.type_of_bus(type_id);


--
-- Name: medical_checkup crew_drivers_driver_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.medical_checkup
    ADD CONSTRAINT crew_drivers_driver_id_fk FOREIGN KEY (driver_id) REFERENCES lab3.drivers(driver_id);


--
-- Name: medical_checkup medical_checkup_trip_trip_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.medical_checkup
    ADD CONSTRAINT medical_checkup_trip_trip_id_fk FOREIGN KEY (trip_id) REFERENCES lab3.trip(trip_id);


--
-- Name: schedule schedule_station_station_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.schedule
    ADD CONSTRAINT schedule_station_station_id_fk FOREIGN KEY (departure_destination) REFERENCES lab3.station(station_id);


--
-- Name: schedule schedule_station_station_id_fk2; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.schedule
    ADD CONSTRAINT schedule_station_station_id_fk2 FOREIGN KEY (arrival_destination) REFERENCES lab3.station(station_id);


--
-- Name: station_in_trip station_in_trip_schedule_schedule_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.station_in_trip
    ADD CONSTRAINT station_in_trip_schedule_schedule_id_fk FOREIGN KEY (schedule_id) REFERENCES lab3.schedule(schedule_id);


--
-- Name: station_in_trip station_in_trip_station_station_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.station_in_trip
    ADD CONSTRAINT station_in_trip_station_station_id_fk FOREIGN KEY (station_id) REFERENCES lab3.station(station_id);


--
-- Name: ticket ticket_passengers_passenger_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.ticket
    ADD CONSTRAINT ticket_passengers_passenger_id_fk FOREIGN KEY (passenger_id) REFERENCES lab3.passengers(passenger_id);


--
-- Name: ticket ticket_station_in_trip_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.ticket
    ADD CONSTRAINT ticket_station_in_trip_id_fk FOREIGN KEY (departure_destination) REFERENCES lab3.station_in_trip(id);


--
-- Name: ticket ticket_station_in_trip_id_fk2; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.ticket
    ADD CONSTRAINT ticket_station_in_trip_id_fk2 FOREIGN KEY (arrival_destination) REFERENCES lab3.station_in_trip(id);


--
-- Name: ticket ticket_ticket_office_office_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.ticket
    ADD CONSTRAINT ticket_ticket_office_office_id_fk FOREIGN KEY (office_id) REFERENCES lab3.ticket_office(office_id);


--
-- Name: ticket ticket_trip_trip_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.ticket
    ADD CONSTRAINT ticket_trip_trip_id_fk FOREIGN KEY (trip_id) REFERENCES lab3.trip(trip_id);


--
-- Name: trip trip_bus_bus_number_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.trip
    ADD CONSTRAINT trip_bus_bus_number_fk FOREIGN KEY (bus_number) REFERENCES lab3.bus(bus_number);


--
-- Name: trip trip_schedule_schedule_id_fk; Type: FK CONSTRAINT; Schema: lab3; Owner: postgres
--

ALTER TABLE ONLY lab3.trip
    ADD CONSTRAINT trip_schedule_schedule_id_fk FOREIGN KEY (schedule_id) REFERENCES lab3.schedule(schedule_id);


--
-- PostgreSQL database dump complete
--

