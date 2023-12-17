--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-26 13:48:42

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
-- TOC entry 6 (class 2615 OID 16399)
-- Name: Bus_station; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Bus_station";


ALTER SCHEMA "Bus_station" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16517)
-- Name: adding_crew; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".adding_crew (
    med_data text,
    adding_id bigint NOT NULL,
    driver_id bigint NOT NULL,
    trip_id bigint NOT NULL
);


ALTER TABLE "Bus_station".adding_crew OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16559)
-- Name: adding_crew_adding_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".adding_crew_adding_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".adding_crew_adding_id_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 227
-- Name: adding_crew_adding_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".adding_crew_adding_id_seq OWNED BY "Bus_station".adding_crew.adding_id;


--
-- TOC entry 218 (class 1259 OID 16428)
-- Name: bus_model; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".bus_model (
    release_date date DEFAULT '1970-01-01'::date,
    seat_count integer NOT NULL,
    producer character varying(128) NOT NULL,
    model_name character varying(128) NOT NULL,
    country character varying(128) NOT NULL,
    model_id bigint NOT NULL,
    CONSTRAINT bus_model_seat_count_check CHECK ((seat_count > 2))
);


ALTER TABLE "Bus_station".bus_model OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16569)
-- Name: bus_model_model_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".bus_model_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".bus_model_model_id_seq OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 228
-- Name: bus_model_model_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".bus_model_model_id_seq OWNED BY "Bus_station".bus_model.model_id;


--
-- TOC entry 220 (class 1259 OID 16447)
-- Name: bus_stops; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".bus_stops (
    address text,
    stop_id bigint NOT NULL
);


ALTER TABLE "Bus_station".bus_stops OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16596)
-- Name: bus_stops_stop_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".bus_stops_stop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".bus_stops_stop_id_seq OWNER TO postgres;

--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 230
-- Name: bus_stops_stop_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".bus_stops_stop_id_seq OWNED BY "Bus_station".bus_stops.stop_id;


--
-- TOC entry 221 (class 1259 OID 16455)
-- Name: buses; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".buses (
    status text NOT NULL,
    bus_number character(6) NOT NULL,
    model_id bigint NOT NULL,
    bus_id bigint NOT NULL
);


ALTER TABLE "Bus_station".buses OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16582)
-- Name: buses_bus_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".buses_bus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".buses_bus_id_seq OWNER TO postgres;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 229
-- Name: buses_bus_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".buses_bus_id_seq OWNED BY "Bus_station".buses.bus_id;


--
-- TOC entry 217 (class 1259 OID 16413)
-- Name: drivers; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".drivers (
    email text,
    license_id bigint NOT NULL,
    passport_number character(10) NOT NULL,
    full_name character varying(128) NOT NULL,
    driver_id bigint NOT NULL
);


ALTER TABLE "Bus_station".drivers OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16668)
-- Name: drivers_driver_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".drivers_driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".drivers_driver_id_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 235
-- Name: drivers_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".drivers_driver_id_seq OWNED BY "Bus_station".drivers.driver_id;


--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: passengers; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".passengers (
    email text,
    passport_number character(10) NOT NULL,
    full_name character varying(128) NOT NULL,
    passenger_id bigint NOT NULL,
    phone_number character(12)
);


ALTER TABLE "Bus_station".passengers OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16648)
-- Name: passengers_passenger_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".passengers_passenger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".passengers_passenger_id_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 234
-- Name: passengers_passenger_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".passengers_passenger_id_seq OWNED BY "Bus_station".passengers.passenger_id;


--
-- TOC entry 226 (class 1259 OID 16534)
-- Name: route_stops; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".route_stops (
    arrival_time time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    stop_id bigint NOT NULL,
    route_id bigint NOT NULL,
    route_stop_id bigint NOT NULL,
    stop_time interval NOT NULL,
    stop_index bigint
);


ALTER TABLE "Bus_station".route_stops OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16704)
-- Name: route_stops_route_stop_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".route_stops_route_stop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".route_stops_route_stop_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 237
-- Name: route_stops_route_stop_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".route_stops_route_stop_id_seq OWNED BY "Bus_station".route_stops.route_stop_id;


--
-- TOC entry 219 (class 1259 OID 16439)
-- Name: schedule; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".schedule (
    path_length bigint DEFAULT 0 NOT NULL,
    route_type character varying(128),
    route_id bigint NOT NULL,
    departure_point bigint NOT NULL,
    destination_point bigint NOT NULL,
    departure_time time without time zone NOT NULL,
    destination_time time without time zone NOT NULL
);


ALTER TABLE "Bus_station".schedule OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16610)
-- Name: schedule_route_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".schedule_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".schedule_route_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 231
-- Name: schedule_route_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".schedule_route_id_seq OWNED BY "Bus_station".schedule.route_id;


--
-- TOC entry 224 (class 1259 OID 16501)
-- Name: tickets; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".tickets (
    price bigint DEFAULT 0 NOT NULL,
    ticket_id bigint NOT NULL,
    passenger_id bigint NOT NULL,
    trip_id bigint NOT NULL,
    buying_date date NOT NULL
);


ALTER TABLE "Bus_station".tickets OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16634)
-- Name: tickets_ticket_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".tickets_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".tickets_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 232
-- Name: tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".tickets_ticket_id_seq OWNED BY "Bus_station".tickets.ticket_id;


--
-- TOC entry 223 (class 1259 OID 16482)
-- Name: trips; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".trips (
    actual_departure_time timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone,
    actual_destination_time timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone,
    status character varying(128) NOT NULL,
    bus_id bigint NOT NULL,
    route_id bigint NOT NULL,
    trip_id bigint NOT NULL
);


ALTER TABLE "Bus_station".trips OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16687)
-- Name: trips_trip_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".trips_trip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".trips_trip_id_seq OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 236
-- Name: trips_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".trips_trip_id_seq OWNED BY "Bus_station".trips.trip_id;


--
-- TOC entry 222 (class 1259 OID 16470)
-- Name: work_timesheet; Type: TABLE; Schema: Bus_station; Owner: postgres
--

CREATE TABLE "Bus_station".work_timesheet (
    work_date date NOT NULL,
    work_hours interval DEFAULT '00:00:00'::interval NOT NULL,
    record_id bigint NOT NULL,
    driver_id bigint NOT NULL,
    status text,
    CONSTRAINT work_timesheet_work_hours_check CHECK ((work_hours < '12:00:00'::interval))
);


ALTER TABLE "Bus_station".work_timesheet OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16641)
-- Name: work_timesheet_record_id_seq; Type: SEQUENCE; Schema: Bus_station; Owner: postgres
--

CREATE SEQUENCE "Bus_station".work_timesheet_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Bus_station".work_timesheet_record_id_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 233
-- Name: work_timesheet_record_id_seq; Type: SEQUENCE OWNED BY; Schema: Bus_station; Owner: postgres
--

ALTER SEQUENCE "Bus_station".work_timesheet_record_id_seq OWNED BY "Bus_station".work_timesheet.record_id;


--
-- TOC entry 4700 (class 2604 OID 16560)
-- Name: adding_crew adding_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".adding_crew ALTER COLUMN adding_id SET DEFAULT nextval('"Bus_station".adding_crew_adding_id_seq'::regclass);


--
-- TOC entry 4688 (class 2604 OID 16570)
-- Name: bus_model model_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".bus_model ALTER COLUMN model_id SET DEFAULT nextval('"Bus_station".bus_model_model_id_seq'::regclass);


--
-- TOC entry 4691 (class 2604 OID 16597)
-- Name: bus_stops stop_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".bus_stops ALTER COLUMN stop_id SET DEFAULT nextval('"Bus_station".bus_stops_stop_id_seq'::regclass);


--
-- TOC entry 4692 (class 2604 OID 16583)
-- Name: buses bus_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".buses ALTER COLUMN bus_id SET DEFAULT nextval('"Bus_station".buses_bus_id_seq'::regclass);


--
-- TOC entry 4686 (class 2604 OID 16669)
-- Name: drivers driver_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".drivers ALTER COLUMN driver_id SET DEFAULT nextval('"Bus_station".drivers_driver_id_seq'::regclass);


--
-- TOC entry 4685 (class 2604 OID 16649)
-- Name: passengers passenger_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".passengers ALTER COLUMN passenger_id SET DEFAULT nextval('"Bus_station".passengers_passenger_id_seq'::regclass);


--
-- TOC entry 4702 (class 2604 OID 16705)
-- Name: route_stops route_stop_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".route_stops ALTER COLUMN route_stop_id SET DEFAULT nextval('"Bus_station".route_stops_route_stop_id_seq'::regclass);


--
-- TOC entry 4690 (class 2604 OID 16611)
-- Name: schedule route_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".schedule ALTER COLUMN route_id SET DEFAULT nextval('"Bus_station".schedule_route_id_seq'::regclass);


--
-- TOC entry 4699 (class 2604 OID 16635)
-- Name: tickets ticket_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".tickets ALTER COLUMN ticket_id SET DEFAULT nextval('"Bus_station".tickets_ticket_id_seq'::regclass);


--
-- TOC entry 4697 (class 2604 OID 16688)
-- Name: trips trip_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".trips ALTER COLUMN trip_id SET DEFAULT nextval('"Bus_station".trips_trip_id_seq'::regclass);


--
-- TOC entry 4694 (class 2604 OID 16642)
-- Name: work_timesheet record_id; Type: DEFAULT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".work_timesheet ALTER COLUMN record_id SET DEFAULT nextval('"Bus_station".work_timesheet_record_id_seq'::regclass);


--
-- TOC entry 4916 (class 0 OID 16517)
-- Dependencies: 225
-- Data for Name: adding_crew; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".adding_crew (med_data, adding_id, driver_id, trip_id) FROM stdin;
\.


--
-- TOC entry 4909 (class 0 OID 16428)
-- Dependencies: 218
-- Data for Name: bus_model; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".bus_model (release_date, seat_count, producer, model_name, country, model_id) FROM stdin;
2011-09-16	11	SCANIA	SCANIA58lk	Sweden	1
2017-01-10	24	MERCEDES	MERCEDES48kj	Germany	2
2017-04-03	29	LOTOS	LOTOS99jn	Russia	3
2014-03-12	29	VOLGABUS	VOLGABUS28nm	Russia	4
2012-05-23	27	GAZ	GAZ93md	Russia	5
2017-09-03	24	ZIL	ZIL51dr	Russia	6
2010-07-19	31	JAC	JAC79rt	Germany	7
2022-08-23	33	DAEWOO	DAEWOO21ts	South Korea	8
2011-06-25	25	KIA	KIA54sw	South Korea	9
2012-03-21	25	IRISBUS	IRISBUS96wq	France	10
\.


--
-- TOC entry 4911 (class 0 OID 16447)
-- Dependencies: 220
-- Data for Name: bus_stops; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".bus_stops (address, stop_id) FROM stdin;
Town0	1
Town1	2
Town2	3
Town3	4
Town4	5
Town5	6
Town6	7
Town7	8
Town8	9
Town9	10
\.


--
-- TOC entry 4912 (class 0 OID 16455)
-- Dependencies: 221
-- Data for Name: buses; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".buses (status, bus_number, model_id, bus_id) FROM stdin;
working	100001	2	1
working	100002	8	2
working	100003	3	3
working	100004	9	4
working	100005	5	5
working	100006	9	6
working	100007	7	7
working	100008	3	8
working	100009	5	9
working	100010	1	10
working	100011	10	11
working	100012	8	12
working	100013	5	13
working	100014	8	14
working	100015	3	15
working	100016	6	16
working	100017	7	17
working	100018	2	18
working	100019	5	19
working	100020	8	20
\.


--
-- TOC entry 4908 (class 0 OID 16413)
-- Dependencies: 217
-- Data for Name: drivers; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".drivers (email, license_id, passport_number, full_name, driver_id) FROM stdin;
driverSteven16@mail.ru	1000001	2000000001	Steven	1
driverJonathan15@mail.ru	1000002	2000000002	Jonathan	2
driverMatthew35@mail.ru	1000003	2000000003	Matthew	3
driverWilliam99@mail.ru	1000004	2000000004	William	4
driverScott93@mail.ru	1000005	2000000005	Scott	5
driverNick49@mail.ru	1000006	2000000006	Nick	6
driverJason99@mail.ru	1000007	2000000007	Jason	7
driverJim43@mail.ru	1000008	2000000008	Jim	8
driverChristian40@mail.ru	1000009	2000000009	Christian	9
driverBob77@mail.ru	1000010	2000000010	Bob	10
driverAlejandro51@mail.ru	1000011	2000000011	Alejandro	11
driverHector59@mail.ru	1000012	2000000012	Hector	12
driverJoel1@mail.ru	1000013	2000000013	Joel	13
driverMike26@mail.ru	1000014	2000000014	Mike	14
driverJeff23@mail.ru	1000015	2000000015	Jeff	15
driverMatthew2@mail.ru	1000016	2000000016	Matthew	16
driverJoel60@mail.ru	1000017	2000000017	Joel	17
driverGabriel58@mail.ru	1000018	2000000018	Gabriel	18
driverThomas40@mail.ru	1000019	2000000019	Thomas	19
driverJeff3@mail.ru	1000020	2000000020	Jeff	20
\.


--
-- TOC entry 4907 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: passengers; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".passengers (email, passport_number, full_name, passenger_id, phone_number) FROM stdin;
testpass123@yandex.ru	4040200200	test_passenger	1	\N
test-pass123@yandex.ru	4040200201	test_passenger_2	8	\N
Gary92@yandex.ru	1000000001	Gary	13	\N
Raul86@yandex.ru	1000000005	Raul	109	\N
Joe68@yandex.ru	1000000006	Joe	110	\N
Gabriel33@yandex.ru	1000000007	Gabriel	111	\N
Mark38@yandex.ru	1000000008	Mark	112	\N
Joseph39@yandex.ru	1000000009	Joseph	113	\N
Patrick27@yandex.ru	1000000010	Patrick	114	\N
Luis58@yandex.ru	1000000011	Luis	115	\N
Steven55@yandex.ru	1000000012	Steven	116	\N
Rafael73@yandex.ru	1000000013	Rafael	117	\N
Alex47@yandex.ru	1000000014	Alex	118	\N
Joshua39@yandex.ru	1000000015	Joshua	119	\N
Dan98@yandex.ru	1000000016	Dan	120	\N
Sergio26@yandex.ru	1000000017	Sergio	121	\N
David49@yandex.ru	1000000018	David	122	\N
Peter52@yandex.ru	1000000019	Peter	123	\N
Mike47@yandex.ru	1000000020	Mike	124	\N
Mark49@yandex.ru	1000000021	Mark	125	\N
Brian0@yandex.ru	1000000022	Brian	126	\N
Chris96@yandex.ru	1000000023	Chris	127	\N
Carlos18@yandex.ru	1000000024	Carlos	128	\N
Adam64@yandex.ru	1000000025	Adam	129	\N
Julio56@yandex.ru	1000000026	Julio	130	\N
Danny17@yandex.ru	1000000027	Danny	131	\N
Javier38@yandex.ru	1000000028	Javier	132	\N
Chris50@yandex.ru	1000000029	Chris	133	\N
Jay70@yandex.ru	1000000030	Jay	134	\N
Gabriel19@yandex.ru	1000000031	Gabriel	135	\N
Jorge54@yandex.ru	1000000032	Jorge	136	\N
Joshua41@yandex.ru	1000000033	Joshua	137	\N
Juan51@yandex.ru	1000000034	Juan	138	\N
Jason22@yandex.ru	1000000035	Jason	139	\N
Sean21@yandex.ru	1000000036	Sean	140	\N
Julio50@yandex.ru	1000000037	Julio	141	\N
Tyler4@yandex.ru	1000000038	Tyler	142	\N
Jack34@yandex.ru	1000000039	Jack	143	\N
Ryan96@yandex.ru	1000000040	Ryan	144	\N
Brian62@yandex.ru	1000000041	Brian	145	\N
Kyle89@yandex.ru	1000000042	Kyle	146	\N
Patrick42@yandex.ru	1000000043	Patrick	147	\N
Michael83@yandex.ru	1000000044	Michael	148	\N
Jaime90@yandex.ru	1000000045	Jaime	149	\N
Alex66@yandex.ru	1000000046	Alex	150	\N
Adam34@yandex.ru	1000000047	Adam	151	\N
Joe61@yandex.ru	1000000048	Joe	152	\N
Joel20@yandex.ru	1000000049	Joel	153	\N
Jim53@yandex.ru	1000000050	Jim	154	\N
Joel64@yandex.ru	1000000051	Joel	155	\N
Andrew78@yandex.ru	1000000052	Andrew	156	\N
Jay47@yandex.ru	1000000053	Jay	157	\N
Greg41@yandex.ru	1000000054	Greg	158	\N
Steven1@yandex.ru	1000000055	Steven	159	\N
Jacob45@yandex.ru	1000000056	Jacob	160	\N
Kyle72@yandex.ru	1000000057	Kyle	161	\N
Jay75@yandex.ru	1000000058	Jay	162	\N
Chris36@yandex.ru	1000000059	Chris	163	\N
Cesar66@yandex.ru	1000000060	Cesar	164	\N
Alex52@yandex.ru	1000000061	Alex	165	\N
Bryan65@yandex.ru	1000000062	Bryan	166	\N
Charles24@yandex.ru	1000000063	Charles	167	\N
Andrea53@yandex.ru	1000000064	Andrea	168	\N
Bryan24@yandex.ru	1000000065	Bryan	169	\N
Jaime29@yandex.ru	1000000066	Jaime	170	\N
Alex71@yandex.ru	1000000067	Alex	171	\N
Chris28@yandex.ru	1000000068	Chris	172	\N
Mario9@yandex.ru	1000000069	Mario	173	\N
Gabriel73@yandex.ru	1000000070	Gabriel	174	\N
Christian87@yandex.ru	1000000071	Christian	175	\N
Jay38@yandex.ru	1000000072	Jay	176	\N
Tyler42@yandex.ru	1000000073	Tyler	177	\N
Jim96@yandex.ru	1000000074	Jim	178	\N
Ben61@yandex.ru	1000000075	Ben	179	\N
Victor13@yandex.ru	1000000076	Victor	180	\N
Paul26@yandex.ru	1000000077	Paul	181	\N
Raul20@yandex.ru	1000000078	Raul	182	\N
Mark94@yandex.ru	1000000079	Mark	183	\N
Matt39@yandex.ru	1000000080	Matt	184	\N
Alex97@yandex.ru	1000000081	Alex	185	\N
Jaime57@yandex.ru	1000000082	Jaime	186	\N
Tom48@yandex.ru	1000000083	Tom	187	\N
Adrian88@yandex.ru	1000000084	Adrian	188	\N
Sergio92@yandex.ru	1000000085	Sergio	189	\N
Jonathan10@yandex.ru	1000000086	Jonathan	190	\N
Gary26@yandex.ru	1000000087	Gary	191	\N
Kyle79@yandex.ru	1000000088	Kyle	192	\N
George3@yandex.ru	1000000089	George	193	\N
John39@yandex.ru	1000000090	John	194	\N
William18@yandex.ru	1000000091	William	195	\N
Jacob93@yandex.ru	1000000092	Jacob	196	\N
Mario88@yandex.ru	1000000093	Mario	197	\N
Scott36@yandex.ru	1000000094	Scott	198	\N
Bob100@yandex.ru	1000000095	Bob	199	\N
Manuel21@yandex.ru	1000000002	Manuel	9	\N
Robert76@yandex.ru	1000000096	Robert	200	\N
James57@yandex.ru	1000000097	James	201	\N
Jack21@yandex.ru	1000000098	Jack	202	\N
Matthew1@yandex.ru	1000000099	Matthew	203	\N
Jonathan19@yandex.ru	1000000100	Jonathan	204	\N
Danny56@yandex.ru	1000000101	Danny	205	\N
David6@yandex.ru	1000000102	David	206	\N
Robert30@yandex.ru	1000000003	Robert	10	\N
Jose22@yandex.ru	1000000004	Jose	11	\N
George33@yandex.ru	1000000103	George	207	\N
David63@yandex.ru	1000000104	David	208	\N
\.


--
-- TOC entry 4917 (class 0 OID 16534)
-- Dependencies: 226
-- Data for Name: route_stops; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".route_stops (arrival_time, stop_id, route_id, route_stop_id, stop_time, stop_index) FROM stdin;
\.


--
-- TOC entry 4910 (class 0 OID 16439)
-- Dependencies: 219
-- Data for Name: schedule; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".schedule (path_length, route_type, route_id, departure_point, destination_point, departure_time, destination_time) FROM stdin;
\.


--
-- TOC entry 4915 (class 0 OID 16501)
-- Dependencies: 224
-- Data for Name: tickets; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".tickets (price, ticket_id, passenger_id, trip_id, buying_date) FROM stdin;
\.


--
-- TOC entry 4914 (class 0 OID 16482)
-- Dependencies: 223
-- Data for Name: trips; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".trips (actual_departure_time, actual_destination_time, status, bus_id, route_id, trip_id) FROM stdin;
\.


--
-- TOC entry 4913 (class 0 OID 16470)
-- Dependencies: 222
-- Data for Name: work_timesheet; Type: TABLE DATA; Schema: Bus_station; Owner: postgres
--

COPY "Bus_station".work_timesheet (work_date, work_hours, record_id, driver_id, status) FROM stdin;
2023-10-22	08:00:00	1	1	\N
2023-10-20	10:00:00	5	4	\N
2023-10-21	08:00:00	6	2	\N
2023-10-22	08:00:00	7	3	\N
\.


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 227
-- Name: adding_crew_adding_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".adding_crew_adding_id_seq', 3, true);


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 228
-- Name: bus_model_model_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".bus_model_model_id_seq', 10, true);


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 230
-- Name: bus_stops_stop_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".bus_stops_stop_id_seq', 10, true);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 229
-- Name: buses_bus_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".buses_bus_id_seq', 20, true);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 235
-- Name: drivers_driver_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".drivers_driver_id_seq', 20, true);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 234
-- Name: passengers_passenger_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".passengers_passenger_id_seq', 208, true);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 237
-- Name: route_stops_route_stop_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".route_stops_route_stop_id_seq', 1, false);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 231
-- Name: schedule_route_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".schedule_route_id_seq', 30, true);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 232
-- Name: tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".tickets_ticket_id_seq', 11, true);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 236
-- Name: trips_trip_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".trips_trip_id_seq', 3, true);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 233
-- Name: work_timesheet_record_id_seq; Type: SEQUENCE SET; Schema: Bus_station; Owner: postgres
--

SELECT pg_catalog.setval('"Bus_station".work_timesheet_record_id_seq', 7, true);


--
-- TOC entry 4749 (class 2606 OID 16567)
-- Name: adding_crew adding_crew_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".adding_crew
    ADD CONSTRAINT adding_crew_pkey PRIMARY KEY (adding_id);


--
-- TOC entry 4706 (class 2606 OID 16732)
-- Name: bus_model bus_model_country_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".bus_model
    ADD CONSTRAINT bus_model_country_check CHECK (((country)::text ~~ '[a-zA-Z]'::text)) NOT VALID;


--
-- TOC entry 4733 (class 2606 OID 16500)
-- Name: bus_model bus_model_model_name_key; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".bus_model
    ADD CONSTRAINT bus_model_model_name_key UNIQUE (model_name);


--
-- TOC entry 4735 (class 2606 OID 16576)
-- Name: bus_model bus_model_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".bus_model
    ADD CONSTRAINT bus_model_pkey PRIMARY KEY (model_id);


--
-- TOC entry 4739 (class 2606 OID 16604)
-- Name: bus_stops bus_stops_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".bus_stops
    ADD CONSTRAINT bus_stops_pkey PRIMARY KEY (stop_id);


--
-- TOC entry 4709 (class 2606 OID 16730)
-- Name: buses buses_bus_number_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".buses
    ADD CONSTRAINT buses_bus_number_check CHECK ((bus_number ~~ '^[A-Z]{1}[0-9]{3}[A-Z]{2}$'::text)) NOT VALID;


--
-- TOC entry 4741 (class 2606 OID 16590)
-- Name: buses buses_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".buses
    ADD CONSTRAINT buses_pkey PRIMARY KEY (bus_id);


--
-- TOC entry 4710 (class 2606 OID 16752)
-- Name: buses buses_status_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".buses
    ADD CONSTRAINT buses_status_check CHECK ((status = ANY (ARRAY['working'::text, 'under repair'::text, 'not working'::text]))) NOT VALID;


--
-- TOC entry 4705 (class 2606 OID 16734)
-- Name: drivers drivers_email_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".drivers
    ADD CONSTRAINT drivers_email_check CHECK ((email ~~ '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}'::text)) NOT VALID;


--
-- TOC entry 4725 (class 2606 OID 16719)
-- Name: drivers drivers_email_key; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".drivers
    ADD CONSTRAINT drivers_email_key UNIQUE (email);


--
-- TOC entry 4727 (class 2606 OID 16717)
-- Name: drivers drivers_license_id_key; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".drivers
    ADD CONSTRAINT drivers_license_id_key UNIQUE (license_id);


--
-- TOC entry 4729 (class 2606 OID 16721)
-- Name: drivers drivers_passport_number_key; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".drivers
    ADD CONSTRAINT drivers_passport_number_key UNIQUE (passport_number);


--
-- TOC entry 4731 (class 2606 OID 16676)
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (driver_id);


--
-- TOC entry 4703 (class 2606 OID 16733)
-- Name: passengers passengers_email_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".passengers
    ADD CONSTRAINT passengers_email_check CHECK ((email ~~ '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}'::text)) NOT VALID;


--
-- TOC entry 4719 (class 2606 OID 16715)
-- Name: passengers passengers_email_key; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".passengers
    ADD CONSTRAINT passengers_email_key UNIQUE (email);


--
-- TOC entry 4721 (class 2606 OID 16713)
-- Name: passengers passengers_passport_number_key; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".passengers
    ADD CONSTRAINT passengers_passport_number_key UNIQUE (passport_number);


--
-- TOC entry 4704 (class 2606 OID 16750)
-- Name: passengers passengers_phone_number_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".passengers
    ADD CONSTRAINT passengers_phone_number_check CHECK ((phone_number ~~ '^\+[1-9][0-9]{7, 14}$'::text)) NOT VALID;


--
-- TOC entry 4723 (class 2606 OID 16656)
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passenger_id);


--
-- TOC entry 4751 (class 2606 OID 16710)
-- Name: route_stops route_stops_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".route_stops
    ADD CONSTRAINT route_stops_pkey PRIMARY KEY (route_stop_id);


--
-- TOC entry 4716 (class 2606 OID 16751)
-- Name: route_stops route_stops_stop_index_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".route_stops
    ADD CONSTRAINT route_stops_stop_index_check CHECK ((stop_index > 0)) NOT VALID;


--
-- TOC entry 4717 (class 2606 OID 16749)
-- Name: route_stops route_stops_stop_time_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".route_stops
    ADD CONSTRAINT route_stops_stop_time_check CHECK ((stop_time < '01:00:00'::interval)) NOT VALID;


--
-- TOC entry 4708 (class 2606 OID 16735)
-- Name: schedule schedule_path_length_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".schedule
    ADD CONSTRAINT schedule_path_length_check CHECK ((path_length > 0)) NOT VALID;


--
-- TOC entry 4737 (class 2606 OID 16618)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (route_id);


--
-- TOC entry 4747 (class 2606 OID 16640)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 4715 (class 2606 OID 16731)
-- Name: tickets tickets_price_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".tickets
    ADD CONSTRAINT tickets_price_check CHECK ((price > 0)) NOT VALID;


--
-- TOC entry 4713 (class 2606 OID 16736)
-- Name: trips trips_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".trips
    ADD CONSTRAINT trips_check CHECK ((actual_departure_time < actual_destination_time)) NOT VALID;


--
-- TOC entry 4745 (class 2606 OID 16693)
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (trip_id);


--
-- TOC entry 4714 (class 2606 OID 16754)
-- Name: trips trips_status_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".trips
    ADD CONSTRAINT trips_status_check CHECK (((status)::text = ANY ((ARRAY['estimated'::character varying, 'delayed'::character varying, 'arrived'::character varying])::text[]))) NOT VALID;


--
-- TOC entry 4743 (class 2606 OID 16647)
-- Name: work_timesheet work_timesheet_pkey; Type: CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".work_timesheet
    ADD CONSTRAINT work_timesheet_pkey PRIMARY KEY (record_id);


--
-- TOC entry 4711 (class 2606 OID 16753)
-- Name: work_timesheet work_timesheet_status_check; Type: CHECK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE "Bus_station".work_timesheet
    ADD CONSTRAINT work_timesheet_status_check CHECK ((status = ANY (ARRAY['ok'::text, 'sick leave'::text, 'vacation'::text]))) NOT VALID;


--
-- TOC entry 4760 (class 2606 OID 16677)
-- Name: adding_crew adding_crew_driver_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".adding_crew
    ADD CONSTRAINT adding_crew_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES "Bus_station".drivers(driver_id) NOT VALID;


--
-- TOC entry 4761 (class 2606 OID 16699)
-- Name: adding_crew adding_crew_trip_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".adding_crew
    ADD CONSTRAINT adding_crew_trip_id_fkey FOREIGN KEY (trip_id) REFERENCES "Bus_station".trips(trip_id) NOT VALID;


--
-- TOC entry 4754 (class 2606 OID 16577)
-- Name: buses buses_model_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".buses
    ADD CONSTRAINT buses_model_id_fkey FOREIGN KEY (model_id) REFERENCES "Bus_station".bus_model(model_id) NOT VALID;


--
-- TOC entry 4762 (class 2606 OID 16624)
-- Name: route_stops route_stops_route_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".route_stops
    ADD CONSTRAINT route_stops_route_id_fkey FOREIGN KEY (route_id) REFERENCES "Bus_station".schedule(route_id) NOT VALID;


--
-- TOC entry 4763 (class 2606 OID 16619)
-- Name: route_stops route_stops_stop_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".route_stops
    ADD CONSTRAINT route_stops_stop_id_fkey FOREIGN KEY (stop_id) REFERENCES "Bus_station".bus_stops(stop_id) NOT VALID;


--
-- TOC entry 4752 (class 2606 OID 16737)
-- Name: schedule schedule_departure_point_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".schedule
    ADD CONSTRAINT schedule_departure_point_fkey FOREIGN KEY (departure_point) REFERENCES "Bus_station".bus_stops(stop_id) NOT VALID;


--
-- TOC entry 4753 (class 2606 OID 16742)
-- Name: schedule schedule_destination_point_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".schedule
    ADD CONSTRAINT schedule_destination_point_fkey FOREIGN KEY (destination_point) REFERENCES "Bus_station".bus_stops(stop_id) NOT VALID;


--
-- TOC entry 4758 (class 2606 OID 16658)
-- Name: tickets tickets_passenger_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".tickets
    ADD CONSTRAINT tickets_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES "Bus_station".passengers(passenger_id) NOT VALID;


--
-- TOC entry 4759 (class 2606 OID 16694)
-- Name: tickets tickets_trip_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".tickets
    ADD CONSTRAINT tickets_trip_id_fkey FOREIGN KEY (trip_id) REFERENCES "Bus_station".trips(trip_id) NOT VALID;


--
-- TOC entry 4756 (class 2606 OID 16591)
-- Name: trips trips_bus_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".trips
    ADD CONSTRAINT trips_bus_id_fkey FOREIGN KEY (bus_id) REFERENCES "Bus_station".buses(bus_id) NOT VALID;


--
-- TOC entry 4757 (class 2606 OID 16629)
-- Name: trips trips_route_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".trips
    ADD CONSTRAINT trips_route_id_fkey FOREIGN KEY (route_id) REFERENCES "Bus_station".schedule(route_id) NOT VALID;


--
-- TOC entry 4755 (class 2606 OID 16682)
-- Name: work_timesheet work_timesheet_driver_id_fkey; Type: FK CONSTRAINT; Schema: Bus_station; Owner: postgres
--

ALTER TABLE ONLY "Bus_station".work_timesheet
    ADD CONSTRAINT work_timesheet_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES "Bus_station".drivers(driver_id) NOT VALID;


-- Completed on 2023-10-26 13:48:42

--
-- PostgreSQL database dump complete
--

