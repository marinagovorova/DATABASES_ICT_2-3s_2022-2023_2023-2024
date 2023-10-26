--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-26 16:22:49 MSK

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
-- TOC entry 860 (class 1247 OID 27101)
-- Name: busstatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.busstatus AS ENUM (
    'AVAILABLE',
    'IN_USE',
    'BROKEN',
    'IN_REPAIR'
);


ALTER TYPE public.busstatus OWNER TO postgres;

--
-- TOC entry 866 (class 1247 OID 27120)
-- Name: ticketstatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.ticketstatus AS ENUM (
    'RESERVED',
    'PAID',
    'CANCELED'
);


ALTER TYPE public.ticketstatus OWNER TO postgres;

--
-- TOC entry 863 (class 1247 OID 27110)
-- Name: tripstatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tripstatus AS ENUM (
    'PLANNED',
    'IN_PROGRESS',
    'FINISHED',
    'CANCELED'
);


ALTER TYPE public.tripstatus OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 26294)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 27157)
-- Name: bus_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bus_models (
    id bigint NOT NULL,
    brand character varying NOT NULL,
    model_name character varying NOT NULL,
    production_country character varying(3) NOT NULL,
    number_of_seats integer NOT NULL,
    has_toiler boolean NOT NULL,
    CONSTRAINT check_number_of_seats CHECK ((number_of_seats > 0)),
    CONSTRAINT check_production_country CHECK (regexp_like((production_country)::text, '^[A-Z]{2,3}$'::text))
);


ALTER TABLE public.bus_models OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 27156)
-- Name: bus_models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bus_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bus_models_id_seq OWNER TO postgres;

--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 219
-- Name: bus_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bus_models_id_seq OWNED BY public.bus_models.id;


--
-- TOC entry 224 (class 1259 OID 27179)
-- Name: buses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buses (
    id bigint NOT NULL,
    model_id bigint NOT NULL,
    registration_number character varying NOT NULL,
    production_year integer NOT NULL,
    status public.busstatus NOT NULL,
    CONSTRAINT check_production_year CHECK ((production_year > 1970))
);


ALTER TABLE public.buses OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 27178)
-- Name: buses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buses_id_seq OWNER TO postgres;

--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 223
-- Name: buses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buses_id_seq OWNED BY public.buses.id;


--
-- TOC entry 232 (class 1259 OID 27254)
-- Name: crews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crews (
    id bigint NOT NULL,
    driver_id bigint NOT NULL,
    trip_id bigint NOT NULL
);


ALTER TABLE public.crews OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 27253)
-- Name: crews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.crews_id_seq OWNER TO postgres;

--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 231
-- Name: crews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crews_id_seq OWNED BY public.crews.id;


--
-- TOC entry 218 (class 1259 OID 27142)
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    sur_name character varying,
    email character varying,
    phone character varying,
    passport_number character varying NOT NULL,
    driver_license_number character varying,
    driver_license_expiration_date timestamp without time zone,
    CONSTRAINT check_driver_license_number CHECK (regexp_like((driver_license_number)::text, '^\d{10}$'::text)),
    CONSTRAINT check_email CHECK (regexp_like((email)::text, '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'::text)),
    CONSTRAINT check_passport_number CHECK (regexp_like((passport_number)::text, '^\d{10}$'::text)),
    CONSTRAINT check_phone CHECK (regexp_like((phone)::text, '^\+7\d{10}$'::text))
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 27141)
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drivers_id_seq OWNER TO postgres;

--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 217
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- TOC entry 216 (class 1259 OID 27128)
-- Name: passengers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passengers (
    id bigint NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    sur_name character varying,
    email character varying NOT NULL,
    phone character varying NOT NULL,
    passport_number character varying NOT NULL,
    CONSTRAINT check_email CHECK (regexp_like((email)::text, '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'::text)),
    CONSTRAINT check_passport_number CHECK (regexp_like((passport_number)::text, '^\d{10}$'::text)),
    CONSTRAINT check_phone CHECK (regexp_like((phone)::text, '^\+7\d{10}$'::text))
);


ALTER TABLE public.passengers OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 27127)
-- Name: passengers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passengers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passengers_id_seq OWNER TO postgres;

--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 215
-- Name: passengers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passengers_id_seq OWNED BY public.passengers.id;


--
-- TOC entry 228 (class 1259 OID 27216)
-- Name: route_stops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route_stops (
    id bigint NOT NULL,
    route_id bigint NOT NULL,
    station_id bigint NOT NULL,
    stop_order integer NOT NULL,
    arrival_time time without time zone NOT NULL,
    departure_time time without time zone NOT NULL,
    CONSTRAINT check_arrival_time CHECK ((arrival_time < departure_time)),
    CONSTRAINT check_order CHECK ((stop_order > 0))
);


ALTER TABLE public.route_stops OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 27215)
-- Name: route_stops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.route_stops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.route_stops_id_seq OWNER TO postgres;

--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 227
-- Name: route_stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.route_stops_id_seq OWNED BY public.route_stops.id;


--
-- TOC entry 226 (class 1259 OID 27196)
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    id bigint NOT NULL,
    name character varying NOT NULL,
    start_station_id bigint NOT NULL,
    end_station_id bigint NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    period_in_minutes integer NOT NULL,
    CONSTRAINT check_period_in_minutes CHECK ((period_in_minutes > 0))
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 27195)
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.routes_id_seq OWNER TO postgres;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 225
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
-- TOC entry 222 (class 1259 OID 27168)
-- Name: stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    CONSTRAINT check_latitude CHECK (((latitude >= ('-90'::integer)::double precision) AND (latitude <= (90)::double precision))),
    CONSTRAINT check_longitude CHECK (((longitude >= ('-180'::integer)::double precision) AND (longitude <= (180)::double precision)))
);


ALTER TABLE public.stations OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 27167)
-- Name: stations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stations_id_seq OWNER TO postgres;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 221
-- Name: stations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stations_id_seq OWNED BY public.stations.id;


--
-- TOC entry 234 (class 1259 OID 27271)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    passenger_id bigint NOT NULL,
    trip_id bigint NOT NULL,
    seat_number integer NOT NULL,
    status public.ticketstatus NOT NULL,
    start_station_id bigint NOT NULL,
    end_station_id bigint NOT NULL,
    is_online_sale boolean NOT NULL,
    CONSTRAINT check_seat_number CHECK ((seat_number > 0)),
    CONSTRAINT check_start_end_station CHECK ((start_station_id <> end_station_id))
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 27270)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tickets_id_seq OWNER TO postgres;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 233
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- TOC entry 230 (class 1259 OID 27235)
-- Name: trips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trips (
    id bigint NOT NULL,
    route_id bigint NOT NULL,
    bus_id bigint NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    status public.tripstatus NOT NULL,
    price integer NOT NULL,
    CONSTRAINT check_price CHECK ((price > 0)),
    CONSTRAINT check_start_time CHECK ((start_time < end_time))
);


ALTER TABLE public.trips OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 27234)
-- Name: trips_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trips_id_seq OWNER TO postgres;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 229
-- Name: trips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trips_id_seq OWNED BY public.trips.id;


--
-- TOC entry 3259 (class 2604 OID 27160)
-- Name: bus_models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bus_models ALTER COLUMN id SET DEFAULT nextval('public.bus_models_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 27182)
-- Name: buses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buses ALTER COLUMN id SET DEFAULT nextval('public.buses_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 27257)
-- Name: crews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews ALTER COLUMN id SET DEFAULT nextval('public.crews_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 27145)
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 27131)
-- Name: passengers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers ALTER COLUMN id SET DEFAULT nextval('public.passengers_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 27219)
-- Name: route_stops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_stops ALTER COLUMN id SET DEFAULT nextval('public.route_stops_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 27199)
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- TOC entry 3260 (class 2604 OID 27171)
-- Name: stations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations ALTER COLUMN id SET DEFAULT nextval('public.stations_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 27274)
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 27238)
-- Name: trips id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips ALTER COLUMN id SET DEFAULT nextval('public.trips_id_seq'::regclass);


--
-- TOC entry 3469 (class 0 OID 26294)
-- Dependencies: 214
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
3fc5afeb3145
\.


--
-- TOC entry 3475 (class 0 OID 27157)
-- Dependencies: 220
-- Data for Name: bus_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bus_models (id, brand, model_name, production_country, number_of_seats, has_toiler) FROM stdin;
1	Mercedes-Benz	Tourismo	DE	50	t
2	MAN	Lions Coach	DE	50	t
3	Scania	Irizar	SE	50	t
\.


--
-- TOC entry 3479 (class 0 OID 27179)
-- Dependencies: 224
-- Data for Name: buses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buses (id, model_id, registration_number, production_year, status) FROM stdin;
1	1	А123АА123	2019	AVAILABLE
2	2	А456АА456	2018	BROKEN
3	3	А789АА789	2017	IN_REPAIR
\.


--
-- TOC entry 3487 (class 0 OID 27254)
-- Dependencies: 232
-- Data for Name: crews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crews (id, driver_id, trip_id) FROM stdin;
1	1	1
2	2	2
3	3	1
\.


--
-- TOC entry 3473 (class 0 OID 27142)
-- Dependencies: 218
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (id, first_name, last_name, sur_name, email, phone, passport_number, driver_license_number, driver_license_expiration_date) FROM stdin;
1	Василий	Васильев	\N	d.d@d.ru	+79999999999	1234567890	1234567890	2022-01-01 00:00:00
2	Алексей	Алексеев	\N	e.e@e.ru	+78888888888	0987654321	0987654321	2022-01-01 00:00:00
3	Андрей	Андреев	\N	f.f@f.ru	+77777777777	1231231231	1231231231	2022-01-01 00:00:00
\.


--
-- TOC entry 3471 (class 0 OID 27128)
-- Dependencies: 216
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passengers (id, first_name, last_name, sur_name, email, phone, passport_number) FROM stdin;
1	Иван	Иванов	\N	a.a@a.ru	+79999999999	1234567890
2	Петр	Петров	\N	b.b@b.ru	+78888888888	0987654321
3	Сидор	Сидоров	\N	c.c@c.ru	+77777777777	1231231231
\.


--
-- TOC entry 3483 (class 0 OID 27216)
-- Dependencies: 228
-- Data for Name: route_stops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.route_stops (id, route_id, station_id, stop_order, arrival_time, departure_time) FROM stdin;
1	1	1	1	08:00:00	08:10:00
2	1	3	10	12:00:00	12:10:00
3	1	2	20	20:00:00	20:10:00
4	2	1	1	08:00:00	08:10:00
5	2	4	10	12:00:00	12:10:00
6	2	3	20	20:00:00	20:10:00
\.


--
-- TOC entry 3481 (class 0 OID 27196)
-- Dependencies: 226
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (id, name, start_station_id, end_station_id, start_time, end_time, period_in_minutes) FROM stdin;
1	Москва - Санкт-Петербург	1	2	08:00:00	20:00:00	1440
2	Москва - Новосибирск	1	3	08:00:00	20:00:00	1440
\.


--
-- TOC entry 3477 (class 0 OID 27168)
-- Dependencies: 222
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stations (id, name, address, latitude, longitude) FROM stdin;
1	Москва	Москва, Красная площадь, 1	37.622504	55.753215
2	Санкт-Петербург	Санкт-Петербург, Дворцовая площадь, 1	30.315868	59.939095
3	Новосибирск	Новосибирск, площадь Ленина, 1	82.92043	55.030199
4	Екатеринбург	Екатеринбург, площадь 1905 года, 1	60.597465	56.838011
5	Нижний Новгород	Нижний Новгород, площадь Минина и Пожарского, 1	44.003506	56.328571
\.


--
-- TOC entry 3489 (class 0 OID 27271)
-- Dependencies: 234
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, passenger_id, trip_id, seat_number, status, start_station_id, end_station_id, is_online_sale) FROM stdin;
1	1	1	1	PAID	1	2	t
2	2	2	1	PAID	1	3	t
\.


--
-- TOC entry 3485 (class 0 OID 27235)
-- Dependencies: 230
-- Data for Name: trips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trips (id, route_id, bus_id, start_time, end_time, status, price) FROM stdin;
1	1	1	2021-01-01 08:00:00	2021-01-01 20:00:00	PLANNED	1000
2	2	2	2021-01-01 08:00:00	2021-01-01 20:00:00	PLANNED	1000
3	1	3	2021-01-02 08:00:00	2021-01-02 20:00:00	PLANNED	1000
\.


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 219
-- Name: bus_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bus_models_id_seq', 3, true);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 223
-- Name: buses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buses_id_seq', 3, true);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 231
-- Name: crews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crews_id_seq', 3, true);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 217
-- Name: drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_id_seq', 3, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 215
-- Name: passengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passengers_id_seq', 3, true);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 227
-- Name: route_stops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.route_stops_id_seq', 6, true);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 225
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.routes_id_seq', 2, true);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 221
-- Name: stations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stations_id_seq', 5, true);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 233
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_seq', 2, true);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 229
-- Name: trips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trips_id_seq', 3, true);


--
-- TOC entry 3287 (class 2606 OID 26298)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3297 (class 2606 OID 27166)
-- Name: bus_models bus_models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bus_models
    ADD CONSTRAINT bus_models_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 27187)
-- Name: buses buses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buses
    ADD CONSTRAINT buses_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 27259)
-- Name: crews crews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT crews_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 27153)
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 27138)
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 27223)
-- Name: route_stops route_stops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_stops
    ADD CONSTRAINT route_stops_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 27204)
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 27177)
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 27278)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 27242)
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 27155)
-- Name: drivers unique_driver_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT unique_driver_name UNIQUE (email);


--
-- TOC entry 3291 (class 2606 OID 27140)
-- Name: passengers unique_passenger_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT unique_passenger_name UNIQUE (email);


--
-- TOC entry 3303 (class 2606 OID 27189)
-- Name: buses unique_registration_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buses
    ADD CONSTRAINT unique_registration_number UNIQUE (registration_number);


--
-- TOC entry 3314 (class 2606 OID 27190)
-- Name: buses buses_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buses
    ADD CONSTRAINT buses_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.bus_models(id);


--
-- TOC entry 3321 (class 2606 OID 27260)
-- Name: crews crews_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT crews_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- TOC entry 3322 (class 2606 OID 27265)
-- Name: crews crews_trip_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT crews_trip_id_fkey FOREIGN KEY (trip_id) REFERENCES public.trips(id);


--
-- TOC entry 3317 (class 2606 OID 27224)
-- Name: route_stops route_stops_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_stops
    ADD CONSTRAINT route_stops_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.routes(id);


--
-- TOC entry 3318 (class 2606 OID 27229)
-- Name: route_stops route_stops_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_stops
    ADD CONSTRAINT route_stops_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.stations(id);


--
-- TOC entry 3315 (class 2606 OID 27210)
-- Name: routes routes_end_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_end_station_id_fkey FOREIGN KEY (end_station_id) REFERENCES public.stations(id);


--
-- TOC entry 3316 (class 2606 OID 27205)
-- Name: routes routes_start_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_start_station_id_fkey FOREIGN KEY (start_station_id) REFERENCES public.stations(id);


--
-- TOC entry 3323 (class 2606 OID 27294)
-- Name: tickets tickets_end_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_end_station_id_fkey FOREIGN KEY (end_station_id) REFERENCES public.stations(id);


--
-- TOC entry 3324 (class 2606 OID 27279)
-- Name: tickets tickets_passenger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES public.passengers(id);


--
-- TOC entry 3325 (class 2606 OID 27289)
-- Name: tickets tickets_start_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_start_station_id_fkey FOREIGN KEY (start_station_id) REFERENCES public.stations(id);


--
-- TOC entry 3326 (class 2606 OID 27284)
-- Name: tickets tickets_trip_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_trip_id_fkey FOREIGN KEY (trip_id) REFERENCES public.trips(id);


--
-- TOC entry 3319 (class 2606 OID 27248)
-- Name: trips trips_bus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_bus_id_fkey FOREIGN KEY (bus_id) REFERENCES public.buses(id);


--
-- TOC entry 3320 (class 2606 OID 27243)
-- Name: trips trips_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.routes(id);


-- Completed on 2023-10-26 16:22:49 MSK

--
-- PostgreSQL database dump complete
--

