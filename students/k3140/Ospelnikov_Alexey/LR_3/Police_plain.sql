--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-25 23:18:38

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
-- TOC entry 4999 (class 1262 OID 16403)
-- Name: Police_department; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "Police_department" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


\connect "Police_department"

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
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 4999
-- Name: DATABASE "Police_department"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE "Police_department" IS 'Database, which contains information about traffic accidents, cars, their owners, etc.';


--
-- TOC entry 6 (class 2615 OID 16404)
-- Name: Police-schema; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "Police-schema";


--
-- TOC entry 232 (class 1259 OID 16641)
-- Name: Car; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Car" (
    car_brand character(20) NOT NULL,
    year_maden integer NOT NULL,
    colour character(20) NOT NULL,
    car_code bigint NOT NULL,
    vehicle_code bigint NOT NULL,
    CONSTRAINT "Car_car_code_check" CHECK ((car_code > 0)),
    CONSTRAINT "Car_vehicle_code_check" CHECK ((vehicle_code > 0)),
    CONSTRAINT "Car_year_maden_check" CHECK ((year_maden > 1950))
);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE "Car"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Car" IS 'Info about driver''s vehicle';


--
-- TOC entry 216 (class 1259 OID 16412)
-- Name: Car owner; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Car owner" (
    driving_licence_number bigint NOT NULL,
    full_name character(50) NOT NULL,
    passport_number bigint NOT NULL,
    phone_number bigint NOT NULL,
    adress text NOT NULL,
    CONSTRAINT "Car owner_driving_licence_number_check" CHECK ((driving_licence_number > 0)),
    CONSTRAINT "Car owner_passport_number_check" CHECK ((passport_number > 0)),
    CONSTRAINT "Car owner_phone_number_check" CHECK ((phone_number > 0))
);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE "Car owner"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Car owner" IS 'Information about car''s owner, his passport, phone numbers, etc.';


--
-- TOC entry 233 (class 1259 OID 16653)
-- Name: Car properties; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Car properties" (
    bodywork_type character(20) NOT NULL,
    engine_type character(20) NOT NULL,
    engine_volume double precision NOT NULL,
    transmission_type character(10) NOT NULL,
    vehicle_code bigint NOT NULL,
    vin_number character(18) NOT NULL,
    CONSTRAINT "Car properties_engine_volume_check" CHECK ((engine_volume > (0)::double precision)),
    CONSTRAINT "Car properties_vehicle_code_check" CHECK ((vehicle_code > 0))
);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE "Car properties"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Car properties" IS 'Manual with data about vehicle properties';


--
-- TOC entry 234 (class 1259 OID 16795)
-- Name: Car_car_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Car_car_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 234
-- Name: Car_car_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Car_car_code_seq" OWNED BY "Police-schema"."Car".car_code;


--
-- TOC entry 235 (class 1259 OID 16817)
-- Name: Car_vehicle_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Car_vehicle_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 235
-- Name: Car_vehicle_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Car_vehicle_code_seq" OWNED BY "Police-schema"."Car".vehicle_code;


--
-- TOC entry 222 (class 1259 OID 16452)
-- Name: Traffic inspector; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Traffic inspector" (
    traffic_inspector_personal_code bigint NOT NULL,
    full_name character(50),
    phone_number bigint,
    rank character(30),
    police_department_code bigint NOT NULL,
    CONSTRAINT "Traffic inspector_phone_number_check" CHECK ((phone_number > 0)),
    CONSTRAINT "Traffic inspector_police_department_code_check" CHECK ((police_department_code > 0)),
    CONSTRAINT "Traffic inspector_traffic_inspector_personal_code_check" CHECK ((traffic_inspector_personal_code > 0))
);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "Traffic inspector"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Traffic inspector" IS 'Information about traffic inspector, his personal data';


--
-- TOC entry 220 (class 1259 OID 16450)
-- Name: Traffic inspector_traffic_inspector_personal_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 220
-- Name: Traffic inspector_traffic_inspector_personal_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq" OWNED BY "Police-schema"."Traffic inspector".traffic_inspector_personal_code;


--
-- TOC entry 219 (class 1259 OID 16430)
-- Name: Police department; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Police department" (
    department_code bigint DEFAULT nextval('"Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq"'::regclass) NOT NULL,
    department_name character(50) NOT NULL,
    adress text NOT NULL,
    department_phone_number bigint NOT NULL,
    CONSTRAINT "Police department_department_code_check" CHECK ((department_code > 0)),
    CONSTRAINT "Police department_department_phone_number_check" CHECK ((department_phone_number > 0))
);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "Police department"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Police department" IS 'Information about police department';


--
-- TOC entry 228 (class 1259 OID 16506)
-- Name: Registred car; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Registred car" (
    car_code bigint NOT NULL,
    operation_code bigint NOT NULL,
    driving_licence_number bigint NOT NULL,
    registration_number character(9) NOT NULL,
    registration_date date NOT NULL,
    department_code bigint NOT NULL,
    CONSTRAINT "Registred car_car_code_check" CHECK ((car_code > 0)),
    CONSTRAINT "Registred car_driving_licence_number_check" CHECK ((driving_licence_number > 0)),
    CONSTRAINT "Registred car_operation_code_check" CHECK ((operation_code > 0)),
    CONSTRAINT "Registred car_registration_date_check" CHECK ((registration_date > '1950-01-01'::date)),
    CONSTRAINT "Registred car_registration_number_check" CHECK ((registration_number ~* '[ABEKMHOPCTYXАБЕКМНОРСТУХ]{1}[0-9]{3}[ABEKMHOPCTYXАБЕКМНОРСТУХ]{2}[0-9]{2,3}'::text))
);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE "Registred car"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Registred car" IS 'This table contains info about registred vehicle: country number, date and department of registration';


--
-- TOC entry 226 (class 1259 OID 16503)
-- Name: Registred car_car_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Registred car_car_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 226
-- Name: Registred car_car_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Registred car_car_code_seq" OWNED BY "Police-schema"."Registred car".car_code;


--
-- TOC entry 227 (class 1259 OID 16504)
-- Name: Registred car_operation_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Registred car_operation_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 227
-- Name: Registred car_operation_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Registred car_operation_code_seq" OWNED BY "Police-schema"."Registred car".operation_code;


--
-- TOC entry 225 (class 1259 OID 16489)
-- Name: Traffic accident; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Traffic accident" (
    accident_code bigint NOT NULL,
    description text NOT NULL,
    driver_guiltiness text NOT NULL,
    accident_place text NOT NULL,
    accident_date date NOT NULL,
    traffic_inspector_personal_code bigint NOT NULL,
    car_code bigint NOT NULL,
    CONSTRAINT "Traffic accident_accident_code_check" CHECK ((accident_code > 0)),
    CONSTRAINT "Traffic accident_accident_date_check" CHECK ((accident_date > '1950-01-01'::date)),
    CONSTRAINT "Traffic accident_car_code_check" CHECK ((car_code > 0)),
    CONSTRAINT "Traffic accident_traffic_inspector_personal_code_check" CHECK ((traffic_inspector_personal_code > 0))
);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE "Traffic accident"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Traffic accident" IS 'Info about traffic accidents';


--
-- TOC entry 223 (class 1259 OID 16487)
-- Name: Traffic accident_accident_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Traffic accident_accident_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 223
-- Name: Traffic accident_accident_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Traffic accident_accident_code_seq" OWNED BY "Police-schema"."Traffic accident".accident_code;


--
-- TOC entry 224 (class 1259 OID 16488)
-- Name: Traffic accident_traffic_inspector_personal_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Traffic accident_traffic_inspector_personal_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 224
-- Name: Traffic accident_traffic_inspector_personal_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Traffic accident_traffic_inspector_personal_code_seq" OWNED BY "Police-schema"."Traffic accident".traffic_inspector_personal_code;


--
-- TOC entry 221 (class 1259 OID 16451)
-- Name: Traffic inspector_police_department_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Traffic inspector_police_department_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 221
-- Name: Traffic inspector_police_department_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Traffic inspector_police_department_code_seq" OWNED BY "Police-schema"."Traffic inspector".police_department_code;


--
-- TOC entry 231 (class 1259 OID 16608)
-- Name: Traffic laws violation; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Traffic laws violation" (
    violation_code bigint NOT NULL,
    violation_place text NOT NULL,
    violation_date date NOT NULL,
    violation_type character(50) NOT NULL,
    accident_code bigint NOT NULL,
    car_code bigint NOT NULL,
    registred_violation_code bigint NOT NULL,
    CONSTRAINT "Traffic laws violation_accident_code_check" CHECK ((accident_code > 0)),
    CONSTRAINT "Traffic laws violation_car_code_check" CHECK ((car_code > 0)),
    CONSTRAINT "Traffic laws violation_registred_violation_code_check" CHECK ((registred_violation_code > 0)),
    CONSTRAINT "Traffic laws violation_violation_code_check" CHECK ((violation_code > 0))
);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE "Traffic laws violation"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Traffic laws violation" IS 'Info about Traffic violation and punishment for them';


--
-- TOC entry 229 (class 1259 OID 16606)
-- Name: Traffic laws violation_accident_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Traffic laws violation_accident_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 229
-- Name: Traffic laws violation_accident_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Traffic laws violation_accident_code_seq" OWNED BY "Police-schema"."Traffic laws violation".accident_code;


--
-- TOC entry 230 (class 1259 OID 16607)
-- Name: Traffic laws violation_car_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Traffic laws violation_car_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 230
-- Name: Traffic laws violation_car_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Traffic laws violation_car_code_seq" OWNED BY "Police-schema"."Traffic laws violation".car_code;


--
-- TOC entry 236 (class 1259 OID 16866)
-- Name: Traffic laws violation_registed_violation_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Traffic laws violation_registed_violation_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 236
-- Name: Traffic laws violation_registed_violation_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Traffic laws violation_registed_violation_code_seq" OWNED BY "Police-schema"."Traffic laws violation".registred_violation_code;


--
-- TOC entry 218 (class 1259 OID 16422)
-- Name: Violation manual; Type: TABLE; Schema: Police-schema; Owner: -
--

CREATE TABLE "Police-schema"."Violation manual" (
    violation_code bigint NOT NULL,
    violation_name text NOT NULL,
    punishment character(50) NOT NULL,
    violation_class character(50) NOT NULL,
    CONSTRAINT "Violation manual_violation_code_check" CHECK ((violation_code > 0))
);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "Violation manual"; Type: COMMENT; Schema: Police-schema; Owner: -
--

COMMENT ON TABLE "Police-schema"."Violation manual" IS 'Manual contains information about defferent types of violation, their discription and punishment';


--
-- TOC entry 217 (class 1259 OID 16421)
-- Name: Violation manual_violation_code_seq; Type: SEQUENCE; Schema: Police-schema; Owner: -
--

CREATE SEQUENCE "Police-schema"."Violation manual_violation_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 217
-- Name: Violation manual_violation_code_seq; Type: SEQUENCE OWNED BY; Schema: Police-schema; Owner: -
--

ALTER SEQUENCE "Police-schema"."Violation manual_violation_code_seq" OWNED BY "Police-schema"."Violation manual".violation_code;


--
-- TOC entry 4738 (class 2604 OID 16983)
-- Name: Car vehicle_code; Type: DEFAULT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car" ALTER COLUMN vehicle_code SET DEFAULT nextval('"Police-schema"."Car_vehicle_code_seq"'::regclass);


--
-- TOC entry 4736 (class 2604 OID 16984)
-- Name: Registred car car_code; Type: DEFAULT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Registred car" ALTER COLUMN car_code SET DEFAULT nextval('"Police-schema"."Registred car_car_code_seq"'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16985)
-- Name: Traffic accident accident_code; Type: DEFAULT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic accident" ALTER COLUMN accident_code SET DEFAULT nextval('"Police-schema"."Traffic accident_accident_code_seq"'::regclass);


--
-- TOC entry 4734 (class 2604 OID 16986)
-- Name: Traffic inspector traffic_inspector_personal_code; Type: DEFAULT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic inspector" ALTER COLUMN traffic_inspector_personal_code SET DEFAULT nextval('"Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq"'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16987)
-- Name: Traffic laws violation registred_violation_code; Type: DEFAULT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic laws violation" ALTER COLUMN registred_violation_code SET DEFAULT nextval('"Police-schema"."Traffic laws violation_registed_violation_code_seq"'::regclass);


--
-- TOC entry 4732 (class 2604 OID 16988)
-- Name: Violation manual violation_code; Type: DEFAULT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Violation manual" ALTER COLUMN violation_code SET DEFAULT nextval('"Police-schema"."Violation manual_violation_code_seq"'::regclass);


--
-- TOC entry 4989 (class 0 OID 16641)
-- Dependencies: 232
-- Data for Name: Car; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Car" (car_brand, year_maden, colour, car_code, vehicle_code) FROM stdin;
Ziguli              	1970	Yellow              	3	1
Opel                	2007	Black               	2	2
Mazda               	1999	Black\n              	1	3
\.


--
-- TOC entry 4973 (class 0 OID 16412)
-- Dependencies: 216
-- Data for Name: Car owner; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Car owner" (driving_licence_number, full_name, passport_number, phone_number, adress) FROM stdin;
111	byh                                               	123	333	1
222	urcuibr                                           	234	444	2
333	frnkerf                                           	345	555	3
\.


--
-- TOC entry 4990 (class 0 OID 16653)
-- Dependencies: 233
-- Data for Name: Car properties; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Car properties" (bodywork_type, engine_type, engine_volume, transmission_type, vehicle_code, vin_number) FROM stdin;
3                   	3                   	2	Mech      	3	f23f212ff23       
2                   	2                   	1.5	Auto      	2	3131313131        
1                   	1                   	1.8	Mech      	1	ioihiouhuiehuo    
\.


--
-- TOC entry 4976 (class 0 OID 16430)
-- Dependencies: 219
-- Data for Name: Police department; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Police department" (department_code, department_name, adress, department_phone_number) FROM stdin;
1	erggregrerge                                      	gerge	313
2	eggergregr                                        	greger	131
3	egrgregreg                                        	ggergre	1313
\.


--
-- TOC entry 4985 (class 0 OID 16506)
-- Dependencies: 228
-- Data for Name: Registred car; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Registred car" (car_code, operation_code, driving_licence_number, registration_number, registration_date, department_code) FROM stdin;
3	3	333	C111CC12 	2020-10-10	2
2	2	222	B122BB12 	2020-12-12	1
1	1	111	A111AA12 	2020-02-02	1
\.


--
-- TOC entry 4982 (class 0 OID 16489)
-- Dependencies: 225
-- Data for Name: Traffic accident; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Traffic accident" (accident_code, description, driver_guiltiness, accident_place, accident_date, traffic_inspector_personal_code, car_code) FROM stdin;
3	2f3f23f32	2f2f	f232f3	2020-09-09	2	3
2	f2f23f32	None	f23f23	2020-10-10	1	2
1	f232f	f23f	f2f32	2020-10-10	1	1
\.


--
-- TOC entry 4979 (class 0 OID 16452)
-- Dependencies: 222
-- Data for Name: Traffic inspector; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Traffic inspector" (traffic_inspector_personal_code, full_name, phone_number, rank, police_department_code) FROM stdin;
3	wefewffe                                          	3131311	Serg                          	2
2	fwefew                                            	313131	Major                         	1
1	fewwf                                             	3131	Leit                          	1
\.


--
-- TOC entry 4988 (class 0 OID 16608)
-- Dependencies: 231
-- Data for Name: Traffic laws violation; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Traffic laws violation" (violation_code, violation_place, violation_date, violation_type, accident_code, car_code, registred_violation_code) FROM stdin;
3	fwfwefew	2020-08-08	3                                                 	2	3	1
2	fwefwefe	2020-09-09	2                                                 	1	2	2
1	fefe	2020-10-10	1                                                 	1	1	3
\.


--
-- TOC entry 4975 (class 0 OID 16422)
-- Dependencies: 218
-- Data for Name: Violation manual; Type: TABLE DATA; Schema: Police-schema; Owner: -
--

COPY "Police-schema"."Violation manual" (violation_code, violation_name, punishment, violation_class) FROM stdin;
1	3	wfefew                                            	fwwfeefw                                          
2	2	wfefw                                             	fwefwe                                            
3	1	ff2                                               	fwefew                                            
\.


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 234
-- Name: Car_car_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Car_car_code_seq"', 6, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 235
-- Name: Car_vehicle_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Car_vehicle_code_seq"', 3, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 226
-- Name: Registred car_car_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Registred car_car_code_seq"', 2, true);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 227
-- Name: Registred car_operation_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Registred car_operation_code_seq"', 2, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 223
-- Name: Traffic accident_accident_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Traffic accident_accident_code_seq"', 5, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 224
-- Name: Traffic accident_traffic_inspector_personal_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Traffic accident_traffic_inspector_personal_code_seq"', 2, true);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 221
-- Name: Traffic inspector_police_department_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Traffic inspector_police_department_code_seq"', 2, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 220
-- Name: Traffic inspector_traffic_inspector_personal_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq"', 9, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 229
-- Name: Traffic laws violation_accident_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Traffic laws violation_accident_code_seq"', 1, false);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 230
-- Name: Traffic laws violation_car_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Traffic laws violation_car_code_seq"', 1, false);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 236
-- Name: Traffic laws violation_registed_violation_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Traffic laws violation_registed_violation_code_seq"', 3, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 217
-- Name: Violation manual_violation_code_seq; Type: SEQUENCE SET; Schema: Police-schema; Owner: -
--

SELECT pg_catalog.setval('"Police-schema"."Violation manual_violation_code_seq"', 3, true);


--
-- TOC entry 4767 (class 2606 OID 16911)
-- Name: Car owner Car owner_driving_licence_number_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car owner"
    ADD CONSTRAINT "Car owner_driving_licence_number_key" UNIQUE (driving_licence_number);


--
-- TOC entry 4769 (class 2606 OID 16913)
-- Name: Car owner Car owner_passport_number_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car owner"
    ADD CONSTRAINT "Car owner_passport_number_key" UNIQUE (passport_number);


--
-- TOC entry 4771 (class 2606 OID 16915)
-- Name: Car owner Car owner_phone_number_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car owner"
    ADD CONSTRAINT "Car owner_phone_number_key" UNIQUE (phone_number);


--
-- TOC entry 4773 (class 2606 OID 16676)
-- Name: Car owner Car owner_pkey; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car owner"
    ADD CONSTRAINT "Car owner_pkey" PRIMARY KEY (driving_licence_number);


--
-- TOC entry 4815 (class 2606 OID 16816)
-- Name: Car properties Car properties_pkey1; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car properties"
    ADD CONSTRAINT "Car properties_pkey1" PRIMARY KEY (vehicle_code);


--
-- TOC entry 4817 (class 2606 OID 16909)
-- Name: Car properties Car properties_vehicle_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car properties"
    ADD CONSTRAINT "Car properties_vehicle_code_key" UNIQUE (vehicle_code);


--
-- TOC entry 4819 (class 2606 OID 16907)
-- Name: Car properties Car properties_vin_number_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car properties"
    ADD CONSTRAINT "Car properties_vin_number_key" UNIQUE (vin_number);


--
-- TOC entry 4809 (class 2606 OID 16919)
-- Name: Car Car_car_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car"
    ADD CONSTRAINT "Car_car_code_key" UNIQUE (car_code);


--
-- TOC entry 4811 (class 2606 OID 16824)
-- Name: Car Car_pkey; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car"
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY (vehicle_code);


--
-- TOC entry 4813 (class 2606 OID 16917)
-- Name: Car Car_vehicle_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car"
    ADD CONSTRAINT "Car_vehicle_code_key" UNIQUE (vehicle_code);


--
-- TOC entry 4779 (class 2606 OID 16976)
-- Name: Police department Police department_department_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Police department"
    ADD CONSTRAINT "Police department_department_code_key" UNIQUE (department_code);


--
-- TOC entry 4781 (class 2606 OID 16901)
-- Name: Police department Police department_department_phone_number_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Police department"
    ADD CONSTRAINT "Police department_department_phone_number_key" UNIQUE (department_phone_number);


--
-- TOC entry 4783 (class 2606 OID 16458)
-- Name: Police department Police department_pkey; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Police department"
    ADD CONSTRAINT "Police department_pkey" PRIMARY KEY (department_code);


--
-- TOC entry 4795 (class 2606 OID 16921)
-- Name: Registred car Registred car_car_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_car_code_key" UNIQUE (car_code);


--
-- TOC entry 4797 (class 2606 OID 16925)
-- Name: Registred car Registred car_driving_licence_number_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_driving_licence_number_key" UNIQUE (driving_licence_number);


--
-- TOC entry 4799 (class 2606 OID 16923)
-- Name: Registred car Registred car_operation_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_operation_code_key" UNIQUE (operation_code);


--
-- TOC entry 4801 (class 2606 OID 16513)
-- Name: Registred car Registred car_pkey; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_pkey" PRIMARY KEY (car_code);


--
-- TOC entry 4803 (class 2606 OID 16927)
-- Name: Registred car Registred car_registration_number_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_registration_number_key" UNIQUE (registration_number);


--
-- TOC entry 4791 (class 2606 OID 16945)
-- Name: Traffic accident Traffic accident_accident_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic accident"
    ADD CONSTRAINT "Traffic accident_accident_code_key" UNIQUE (accident_code);


--
-- TOC entry 4793 (class 2606 OID 16497)
-- Name: Traffic accident Traffic accident_pkey; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic accident"
    ADD CONSTRAINT "Traffic accident_pkey" PRIMARY KEY (accident_code);


--
-- TOC entry 4785 (class 2606 OID 16953)
-- Name: Traffic inspector Traffic inspector_phone_number_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic inspector"
    ADD CONSTRAINT "Traffic inspector_phone_number_key" UNIQUE (phone_number);


--
-- TOC entry 4787 (class 2606 OID 16466)
-- Name: Traffic inspector Traffic inspector_pkey; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic inspector"
    ADD CONSTRAINT "Traffic inspector_pkey" PRIMARY KEY (traffic_inspector_personal_code);


--
-- TOC entry 4789 (class 2606 OID 16951)
-- Name: Traffic inspector Traffic inspector_traffic_inspector_personal_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic inspector"
    ADD CONSTRAINT "Traffic inspector_traffic_inspector_personal_code_key" UNIQUE (traffic_inspector_personal_code);


--
-- TOC entry 4805 (class 2606 OID 16875)
-- Name: Traffic laws violation Traffic laws violation_pkey; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_pkey" PRIMARY KEY (registred_violation_code);


--
-- TOC entry 4807 (class 2606 OID 16963)
-- Name: Traffic laws violation Traffic laws violation_registed_violation_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_registed_violation_code_key" UNIQUE (registred_violation_code);


--
-- TOC entry 4775 (class 2606 OID 16429)
-- Name: Violation manual Violation manual_pkey; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Violation manual"
    ADD CONSTRAINT "Violation manual_pkey" PRIMARY KEY (violation_code);


--
-- TOC entry 4777 (class 2606 OID 16668)
-- Name: Violation manual Violation manual_violation_code_key; Type: CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Violation manual"
    ADD CONSTRAINT "Violation manual_violation_code_key" UNIQUE (violation_code);


--
-- TOC entry 4829 (class 2606 OID 16829)
-- Name: Car properties Car properties_vehicle_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car properties"
    ADD CONSTRAINT "Car properties_vehicle_code_fkey" FOREIGN KEY (vehicle_code) REFERENCES "Police-schema"."Car"(vehicle_code);


--
-- TOC entry 4828 (class 2606 OID 16803)
-- Name: Car Car_car_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Car"
    ADD CONSTRAINT "Car_car_code_fkey" FOREIGN KEY (car_code) REFERENCES "Police-schema"."Registred car"(car_code);


--
-- TOC entry 4823 (class 2606 OID 16810)
-- Name: Registred car Registred car_department_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_department_code_fkey" FOREIGN KEY (department_code) REFERENCES "Police-schema"."Police department"(department_code);


--
-- TOC entry 4824 (class 2606 OID 16765)
-- Name: Registred car Registred car_driving_licence_number_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_driving_licence_number_fkey" FOREIGN KEY (driving_licence_number) REFERENCES "Police-schema"."Car owner"(driving_licence_number);


--
-- TOC entry 4821 (class 2606 OID 16838)
-- Name: Traffic accident Traffic accident_car_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic accident"
    ADD CONSTRAINT "Traffic accident_car_code_fkey" FOREIGN KEY (car_code) REFERENCES "Police-schema"."Registred car"(car_code);


--
-- TOC entry 4822 (class 2606 OID 16498)
-- Name: Traffic accident Traffic accident_traffic_inspector_personal_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic accident"
    ADD CONSTRAINT "Traffic accident_traffic_inspector_personal_code_fkey" FOREIGN KEY (traffic_inspector_personal_code) REFERENCES "Police-schema"."Traffic inspector"(traffic_inspector_personal_code);


--
-- TOC entry 4820 (class 2606 OID 16468)
-- Name: Traffic inspector Traffic inspector_police_department_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic inspector"
    ADD CONSTRAINT "Traffic inspector_police_department_code_fkey" FOREIGN KEY (police_department_code) REFERENCES "Police-schema"."Police department"(department_code);


--
-- TOC entry 4825 (class 2606 OID 16617)
-- Name: Traffic laws violation Traffic laws violation_accident_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_accident_code_fkey" FOREIGN KEY (accident_code) REFERENCES "Police-schema"."Traffic accident"(accident_code);


--
-- TOC entry 4826 (class 2606 OID 16623)
-- Name: Traffic laws violation Traffic laws violation_car_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_car_code_fkey" FOREIGN KEY (car_code) REFERENCES "Police-schema"."Registred car"(car_code);


--
-- TOC entry 4827 (class 2606 OID 16783)
-- Name: Traffic laws violation Traffic laws violation_violation_code_fkey; Type: FK CONSTRAINT; Schema: Police-schema; Owner: -
--

ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_violation_code_fkey" FOREIGN KEY (violation_code) REFERENCES "Police-schema"."Violation manual"(violation_code);


-- Completed on 2023-10-25 23:18:38

--
-- PostgreSQL database dump complete
--

