--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 14.9

-- Started on 2023-10-27 14:58:45

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
-- TOC entry 3467 (class 1262 OID 16403)
-- Name: phone_provider; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE phone_provider WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE phone_provider OWNER TO postgres;

\connect phone_provider

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
-- TOC entry 854 (class 1247 OID 16481)
-- Name: periodicity_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.periodicity_enum AS ENUM (
    'daily',
    'weekly',
    'monthly',
    'yearly',
    'hourly'
);


ALTER TYPE public.periodicity_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16436)
-- Name: basic_tariff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basic_tariff (
    tariff_id integer NOT NULL,
    gb_amount integer,
    international_call_cost_per_minute numeric NOT NULL,
    domestic_call_cost_per_minute numeric NOT NULL,
    basic_tariff_price numeric NOT NULL,
    tariff_name character varying(60) NOT NULL,
    minutes_amount bigint NOT NULL,
    sms_amount bigint NOT NULL,
    CONSTRAINT gb_amount_chk CHECK ((gb_amount >= 0)),
    CONSTRAINT minutes_amount_chk CHECK ((minutes_amount >= 0)),
    CONSTRAINT sms_amount_chk CHECK ((sms_amount >= 0))
);


ALTER TABLE public.basic_tariff OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16435)
-- Name: basic_tariff_tariff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basic_tariff_tariff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basic_tariff_tariff_id_seq OWNER TO postgres;

--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 209
-- Name: basic_tariff_tariff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basic_tariff_tariff_id_seq OWNED BY public.basic_tariff.tariff_id;


--
-- TOC entry 216 (class 1259 OID 16527)
-- Name: call_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.call_zone (
    call_zone_id integer NOT NULL,
    country character varying(60) NOT NULL,
    cost_per_minute_call_zone numeric NOT NULL,
    region character varying(60),
    city character varying(60)
);


ALTER TABLE public.call_zone OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16526)
-- Name: call_zone_call_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.call_zone_call_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.call_zone_call_zone_id_seq OWNER TO postgres;

--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 215
-- Name: call_zone_call_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.call_zone_call_zone_id_seq OWNED BY public.call_zone.call_zone_id;


--
-- TOC entry 218 (class 1259 OID 16555)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    client_id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    passport_issuing_authority character varying(100) NOT NULL,
    passport_series_and_number bigint NOT NULL,
    passport_issuing_date date NOT NULL,
    address character varying(200) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16554)
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_client_id_seq OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;


--
-- TOC entry 221 (class 1259 OID 16565)
-- Name: contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract (
    contract_id integer NOT NULL,
    client_id integer NOT NULL,
    date_of_conclusion date NOT NULL,
    date_of_cancellation date
);


ALTER TABLE public.contract OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16564)
-- Name: contract_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contract_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_client_id_seq OWNER TO postgres;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 220
-- Name: contract_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contract_client_id_seq OWNED BY public.contract.client_id;


--
-- TOC entry 219 (class 1259 OID 16563)
-- Name: contract_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contract_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_contract_id_seq OWNER TO postgres;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 219
-- Name: contract_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contract_contract_id_seq OWNED BY public.contract.contract_id;


--
-- TOC entry 224 (class 1259 OID 16595)
-- Name: domestic_call; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domestic_call (
    domestic_callee_number bigint NOT NULL,
    phone_number bigint NOT NULL,
    call_start_time timestamp(0) without time zone NOT NULL,
    call_end_time timestamp(0) without time zone,
    domestic_call_id integer NOT NULL
);


ALTER TABLE public.domestic_call OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16700)
-- Name: domestic_call_domestic_call_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domestic_call_domestic_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domestic_call_domestic_call_id_seq OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 235
-- Name: domestic_call_domestic_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domestic_call_domestic_call_id_seq OWNED BY public.domestic_call.domestic_call_id;


--
-- TOC entry 214 (class 1259 OID 16512)
-- Name: external_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.external_service (
    external_service_id integer NOT NULL,
    external_service_price money NOT NULL,
    external_service_description text NOT NULL,
    external_service_periodicity public.periodicity_enum NOT NULL,
    CONSTRAINT external_service_description_chk CHECK ((length(external_service_description) < 1000))
);


ALTER TABLE public.external_service OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16511)
-- Name: external_service_external_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.external_service_external_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_service_external_service_id_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 213
-- Name: external_service_external_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.external_service_external_service_id_seq OWNED BY public.external_service.external_service_id;


--
-- TOC entry 231 (class 1259 OID 16642)
-- Name: external_service_inclusion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.external_service_inclusion (
    external_service_id integer NOT NULL,
    phone_number bigint NOT NULL,
    external_service_date_of_connection date NOT NULL,
    external_service_date_of_disconnection date,
    external_service_inclusion_id integer NOT NULL
);


ALTER TABLE public.external_service_inclusion OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16641)
-- Name: external_service_inclusion_external_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.external_service_inclusion_external_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_service_inclusion_external_service_id_seq OWNER TO postgres;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 230
-- Name: external_service_inclusion_external_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.external_service_inclusion_external_service_id_seq OWNED BY public.external_service_inclusion.external_service_id;


--
-- TOC entry 233 (class 1259 OID 16684)
-- Name: external_service_inclusion_external_service_inclusion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_service_inclusion_external_service_inclusion_id_seq OWNER TO postgres;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 233
-- Name: external_service_inclusion_external_service_inclusion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq OWNED BY public.external_service_inclusion.external_service_inclusion_id;


--
-- TOC entry 212 (class 1259 OID 16492)
-- Name: internal_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.internal_service (
    internal_service_id integer NOT NULL,
    internal_service_price money NOT NULL,
    internal_service_description text NOT NULL,
    internal_service_periodicity public.periodicity_enum NOT NULL,
    CONSTRAINT internal_service_description_chk CHECK ((length(internal_service_description) < 1000))
);


ALTER TABLE public.internal_service OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16622)
-- Name: internal_service_inclusion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.internal_service_inclusion (
    internal_service_id integer NOT NULL,
    phone_number bigint NOT NULL,
    date_of_connection date NOT NULL,
    date_of_disconnection date,
    internal_service_inclusion_id integer NOT NULL
);


ALTER TABLE public.internal_service_inclusion OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16620)
-- Name: internal_service_inclusion_internal_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.internal_service_inclusion_internal_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_service_inclusion_internal_service_id_seq OWNER TO postgres;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 228
-- Name: internal_service_inclusion_internal_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.internal_service_inclusion_internal_service_id_seq OWNED BY public.internal_service_inclusion.internal_service_id;


--
-- TOC entry 234 (class 1259 OID 16692)
-- Name: internal_service_inclusion_internal_service_inclusion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_service_inclusion_internal_service_inclusion_id_seq OWNER TO postgres;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 234
-- Name: internal_service_inclusion_internal_service_inclusion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq OWNED BY public.internal_service_inclusion.internal_service_inclusion_id;


--
-- TOC entry 211 (class 1259 OID 16491)
-- Name: internal_service_internal_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.internal_service_internal_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_service_internal_service_id_seq OWNER TO postgres;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 211
-- Name: internal_service_internal_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.internal_service_internal_service_id_seq OWNED BY public.internal_service.internal_service_id;


--
-- TOC entry 227 (class 1259 OID 16608)
-- Name: international_call; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.international_call (
    international_call_id integer NOT NULL,
    phone_number bigint NOT NULL,
    international_call_start_time timestamp(0) without time zone,
    international_call_end_time timestamp without time zone,
    call_zone_id integer NOT NULL,
    international_callee_number bigint
);


ALTER TABLE public.international_call OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16607)
-- Name: international_call_call_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.international_call_call_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.international_call_call_zone_id_seq OWNER TO postgres;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 226
-- Name: international_call_call_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.international_call_call_zone_id_seq OWNED BY public.international_call.call_zone_id;


--
-- TOC entry 225 (class 1259 OID 16606)
-- Name: international_call_international_call_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.international_call_international_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.international_call_international_call_id_seq OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 225
-- Name: international_call_international_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.international_call_international_call_id_seq OWNED BY public.international_call.international_call_id;


--
-- TOC entry 238 (class 1259 OID 16975)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    payment_status boolean NOT NULL,
    phone_number bigint NOT NULL,
    payment_date date NOT NULL,
    payment_amount numeric
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16974)
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 237
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- TOC entry 223 (class 1259 OID 16578)
-- Name: phone_on_tariff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone_on_tariff (
    phone_on_tariff_number bigint NOT NULL,
    tariff_id integer NOT NULL,
    activation_date date NOT NULL,
    deletion_date date,
    current_balance numeric NOT NULL,
    contract_id integer NOT NULL
);


ALTER TABLE public.phone_on_tariff OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16577)
-- Name: phone_on_tariff_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phone_on_tariff_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phone_on_tariff_contract_id_seq OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 222
-- Name: phone_on_tariff_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phone_on_tariff_contract_id_seq OWNED BY public.phone_on_tariff.contract_id;


--
-- TOC entry 232 (class 1259 OID 16660)
-- Name: tariff_service_inclusion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tariff_service_inclusion (
    tariff_id integer NOT NULL,
    tariff_service_date_of_connection date NOT NULL,
    tariff_service_date_of_disconnection date,
    tariff_service_inclusion_id integer NOT NULL,
    internal_service_id integer
);


ALTER TABLE public.tariff_service_inclusion OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16708)
-- Name: tariff_service_inclusion_tariff_service_inclusion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tariff_service_inclusion_tariff_service_inclusion_id_seq OWNER TO postgres;

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 236
-- Name: tariff_service_inclusion_tariff_service_inclusion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq OWNED BY public.tariff_service_inclusion.tariff_service_inclusion_id;


--
-- TOC entry 3231 (class 2604 OID 16439)
-- Name: basic_tariff tariff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_tariff ALTER COLUMN tariff_id SET DEFAULT nextval('public.basic_tariff_tariff_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16530)
-- Name: call_zone call_zone_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_zone ALTER COLUMN call_zone_id SET DEFAULT nextval('public.call_zone_call_zone_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 16558)
-- Name: client client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16568)
-- Name: contract contract_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract ALTER COLUMN contract_id SET DEFAULT nextval('public.contract_contract_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16569)
-- Name: contract client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract ALTER COLUMN client_id SET DEFAULT nextval('public.contract_client_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16515)
-- Name: external_service external_service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service ALTER COLUMN external_service_id SET DEFAULT nextval('public.external_service_external_service_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16646)
-- Name: external_service_inclusion external_service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion ALTER COLUMN external_service_id SET DEFAULT nextval('public.external_service_inclusion_external_service_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 16685)
-- Name: external_service_inclusion external_service_inclusion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion ALTER COLUMN external_service_inclusion_id SET DEFAULT nextval('public.external_service_inclusion_external_service_inclusion_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 16495)
-- Name: internal_service internal_service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service ALTER COLUMN internal_service_id SET DEFAULT nextval('public.internal_service_internal_service_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 16625)
-- Name: internal_service_inclusion internal_service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion ALTER COLUMN internal_service_id SET DEFAULT nextval('public.internal_service_inclusion_internal_service_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16693)
-- Name: internal_service_inclusion internal_service_inclusion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion ALTER COLUMN internal_service_inclusion_id SET DEFAULT nextval('public.internal_service_inclusion_internal_service_inclusion_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16611)
-- Name: international_call international_call_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.international_call ALTER COLUMN international_call_id SET DEFAULT nextval('public.international_call_international_call_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 16978)
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 16709)
-- Name: tariff_service_inclusion tariff_service_inclusion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff_service_inclusion ALTER COLUMN tariff_service_inclusion_id SET DEFAULT nextval('public.tariff_service_inclusion_tariff_service_inclusion_id_seq'::regclass);


--
-- TOC entry 3433 (class 0 OID 16436)
-- Dependencies: 210
-- Data for Name: basic_tariff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.basic_tariff VALUES (1, 154, 23, 9, 4603, 'Aaron Castro', 74894, 59793);
INSERT INTO public.basic_tariff VALUES (2, 189, 23, 2, 3510, 'Amy Raymond', 10541, 13790);
INSERT INTO public.basic_tariff VALUES (3, 54, 13, 5, 1535, 'William Stevens', 34786, 99522);
INSERT INTO public.basic_tariff VALUES (4, 119, 30, 1, 3841, 'Brandy Rivers MD', 1997, 82197);
INSERT INTO public.basic_tariff VALUES (5, 93, 28, 2, 1986, 'Christopher Bell', 2703, 71234);
INSERT INTO public.basic_tariff VALUES (6, 142, 45, 8, 2857, 'Anthony Browning', 82659, 99375);
INSERT INTO public.basic_tariff VALUES (7, 31, 48, 4, 4862, 'John Flores', 7141, 9816);
INSERT INTO public.basic_tariff VALUES (8, 189, 40, 7, 3297, 'Joshua Ford', 13786, 4798);
INSERT INTO public.basic_tariff VALUES (9, 86, 32, 1, 2330, 'Kendra Carter', 17221, 33989);
INSERT INTO public.basic_tariff VALUES (10, 136, 16, 10, 1316, 'Kristen Martin', 38766, 5687);
INSERT INTO public.basic_tariff VALUES (11, 80, 14, 6, 3541, 'Connie Greene', 20368, 81950);
INSERT INTO public.basic_tariff VALUES (12, 195, 38, 2, 4405, 'Sara Morgan', 24506, 85864);
INSERT INTO public.basic_tariff VALUES (13, 181, 9, 1, 5722, 'Linda Sanchez', 4842, 85003);
INSERT INTO public.basic_tariff VALUES (14, 68, 15, 2, 3887, 'Darryl Alexander', 15602, 70094);
INSERT INTO public.basic_tariff VALUES (15, 90, 11, 10, 5739, 'Shirley Walker', 71283, 43512);
INSERT INTO public.basic_tariff VALUES (16, 155, 38, 7, 3363, 'Mary Shepard', 64833, 91944);
INSERT INTO public.basic_tariff VALUES (17, 179, 28, 4, 889, 'Maria Mooney', 60822, 87390);
INSERT INTO public.basic_tariff VALUES (18, 75, 25, 2, 2201, 'Crystal Frank', 90962, 27321);
INSERT INTO public.basic_tariff VALUES (19, 129, 12, 8, 5603, 'Michele Hodges', 41439, 82735);
INSERT INTO public.basic_tariff VALUES (20, 28, 16, 8, 4351, 'Melinda Franco', 59501, 41546);
INSERT INTO public.basic_tariff VALUES (21, 130, 30, 6, 3836, 'Lynn Guerra', 94450, 53414);
INSERT INTO public.basic_tariff VALUES (22, 167, 14, 1, 3458, 'Rebekah Clarke', 75220, 95554);
INSERT INTO public.basic_tariff VALUES (23, 14, 15, 9, 1418, 'Justin Gordon', 41669, 82887);
INSERT INTO public.basic_tariff VALUES (24, 177, 35, 3, 4369, 'Shannon Henderson', 94193, 5993);
INSERT INTO public.basic_tariff VALUES (25, 93, 23, 6, 2938, 'Victoria Jordan', 55335, 38773);
INSERT INTO public.basic_tariff VALUES (26, 81, 18, 10, 2485, 'Kevin Powers', 8084, 14051);
INSERT INTO public.basic_tariff VALUES (27, 7, 50, 3, 5801, 'Brianna Glover', 72005, 15175);
INSERT INTO public.basic_tariff VALUES (28, 120, 46, 1, 3948, 'Jennifer Hayes', 41325, 98302);
INSERT INTO public.basic_tariff VALUES (29, 68, 12, 5, 2673, 'Mason Gray', 64719, 68202);
INSERT INTO public.basic_tariff VALUES (30, 76, 44, 6, 1832, 'James Brown', 40022, 48235);


--
-- TOC entry 3439 (class 0 OID 16527)
-- Dependencies: 216
-- Data for Name: call_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.call_zone VALUES (1, 'Svalbard & Jan Mayen Islands', 48, 'Liberia', 'Johnport');
INSERT INTO public.call_zone VALUES (2, 'Iceland', 83, 'Jersey', 'Lake Tashafort');
INSERT INTO public.call_zone VALUES (3, 'Northern Mariana Islands', 8, 'Peru', 'East Ryan');
INSERT INTO public.call_zone VALUES (4, 'Cyprus', 47, 'Norfolk Island', 'Christopherchester');
INSERT INTO public.call_zone VALUES (5, 'Albania', 21, 'Svalbard & Jan Mayen Islands', 'New Curtiston');
INSERT INTO public.call_zone VALUES (6, 'Liechtenstein', 6, 'Germany', 'Jamesville');
INSERT INTO public.call_zone VALUES (7, 'Svalbard & Jan Mayen Islands', 41, 'Guinea-Bissau', 'New Alisha');
INSERT INTO public.call_zone VALUES (8, 'Zimbabwe', 12, 'Jordan', 'North Sheilamouth');
INSERT INTO public.call_zone VALUES (9, 'Norway', 49, 'Nigeria', 'Holmesburgh');
INSERT INTO public.call_zone VALUES (10, 'Poland', 9, 'Ghana', 'Stacyport');
INSERT INTO public.call_zone VALUES (11, 'Trinidad and Tobago', 66, 'Bolivia', 'South Allisonview');
INSERT INTO public.call_zone VALUES (12, 'Togo', 7, 'Chile', 'Franklinhaven');
INSERT INTO public.call_zone VALUES (13, 'Azerbaijan', 90, 'Bangladesh', 'Waltersshire');
INSERT INTO public.call_zone VALUES (14, 'United States Minor Outlying Islands', 52, 'Northern Mariana Islands', 'New Jonathan');
INSERT INTO public.call_zone VALUES (15, 'Faroe Islands', 56, 'Jersey', 'Lake Monica');


--
-- TOC entry 3441 (class 0 OID 16555)
-- Dependencies: 218
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client VALUES (1, 'Lauren Mason', 'Too name far career radio Congress. Until family any bill situation factor.', 6459142395, '2003-05-09', '96963 Lopez Landing
West Vanessa, NM 17345');
INSERT INTO public.client VALUES (2, 'William Walters', 'Join test yourself fish our matter system wrong.', 9421315406, '1908-12-01', '1779 Moreno Crescent
Port Dean, OK 46662');
INSERT INTO public.client VALUES (3, 'Lawrence Huerta', 'Condition development dinner happen nice law writer standard.', 9482792550, '1950-06-21', '857 Wilson Pines
Davidfurt, RI 03958');
INSERT INTO public.client VALUES (4, 'Mr. Adam Patel', 'Smile investment common partner floor travel sing.', 7809160994, '1990-10-03', '075 Sean Stream Apt. 518
Kempburgh, MO 10200');
INSERT INTO public.client VALUES (5, 'Megan Davis', 'Color character perform reach official. Break tax international many.', 8610926406, '2020-10-16', '10744 Julie Bridge Apt. 710
Isabelhaven, PW 35070');
INSERT INTO public.client VALUES (6, 'Tiffany Garcia', 'Interview machine throughout. Institution someone probably imagine property first term.', 5813994964, '2017-02-22', '59955 Molly Brooks
North Carolyn, GA 96576');
INSERT INTO public.client VALUES (7, 'Melissa Wood', 'Example too stop long bar parent sea. Happy indicate hotel policy nature.', 5996825609, '2002-12-27', '689 Charles Mount Suite 842
Austinland, OR 90964');
INSERT INTO public.client VALUES (8, 'Brenda Meyer', 'Another song whether interview.', 8954412764, '1945-06-08', 'PSC 6076, Box 1978
APO AE 70918');
INSERT INTO public.client VALUES (9, 'Julie Rodriguez', 'Message rate candidate place. Course ability movie he. Process answer happy thousand.', 6719906947, '1949-10-29', '1933 Walton Rapid Apt. 252
Lynchborough, ND 81803');
INSERT INTO public.client VALUES (10, 'Christina Ward', 'Close left question area defense read voice. Investment ever power claim sense top.', 2933486658, '2006-08-20', '19205 James Mountain
Joyceborough, MO 58933');
INSERT INTO public.client VALUES (11, 'Emily Martinez', 'Information well good picture. Nice water light reflect born agent structure.', 7324587079, '1910-12-18', 'USCGC Dennis
FPO AP 19969');
INSERT INTO public.client VALUES (12, 'Haley Hendrix', 'Radio such affect effort move agency. Skill picture part particularly medical agreement.', 7973340031, '1931-02-09', '0982 Brewer Forge Suite 128
West Bradley, KY 49248');
INSERT INTO public.client VALUES (13, 'Karen Carter', 'Rock organization course pattern bar TV now. Down say of want beat.', 1799391860, '1982-03-02', '90018 Jeanette Brook
Juliechester, LA 18916');
INSERT INTO public.client VALUES (14, 'Robert Forbes II', 'Speech base network organization war democratic test.', 4509699889, '1967-12-02', '2132 Fisher Station
New Jose, LA 55500');
INSERT INTO public.client VALUES (15, 'Dustin Chen', 'Through last sound energy more other hospital product. Most challenge bad time bank.', 1542684211, '1948-07-13', '8277 Kathleen Valley Suite 144
Port Sherry, KY 46010');
INSERT INTO public.client VALUES (16, 'Michelle Green', 'Fund area member analysis certainly behind meeting. Relate respond today our give.', 4440290395, '1971-06-13', '9939 Lynn Springs
Lake Tony, NC 80643');
INSERT INTO public.client VALUES (17, 'Michael Lynch', 'Specific part power history out let general. Evidence high not company.', 3419351277, '1997-05-03', '109 Allen Radial
Jonesbury, FL 07645');
INSERT INTO public.client VALUES (18, 'Robert Flores', 'Charge these operation. Deal list their store century road star. Eye church poor.', 9899642972, '2002-03-03', '72937 Ryan View Suite 984
North Patrickfort, NH 33137');
INSERT INTO public.client VALUES (19, 'Anthony Dixon', 'Within brother him however. Avoid choose red imagine. Require yeah pull cut film.', 6398279875, '1998-06-24', '17337 Brown Points
New Jill, WY 18687');
INSERT INTO public.client VALUES (20, 'Carl Chan', 'Body over audience yeah someone yeah manager. Set when cold around sport such several.', 6614092352, '1938-01-15', 'USNV Mccarty
FPO AA 24861');
INSERT INTO public.client VALUES (21, 'Shawn Cooley', 'Church professor cultural accept support. Machine police report world.', 2795011660, '1937-07-28', '9615 Bradley Isle
New Frederick, AL 70394');
INSERT INTO public.client VALUES (22, 'Jeffery Luna', 'Mother threat or term develop. Leg thought listen simple.', 1569377736, '1912-08-25', '06872 Amy Groves
Michellemouth, VT 89552');
INSERT INTO public.client VALUES (23, 'Chelsea Mitchell', 'Cover onto about couple. Short worker science east. Each player current share best.', 9565644586, '1960-06-26', '752 John Lake Suite 869
Kendrashire, OK 41946');
INSERT INTO public.client VALUES (24, 'Noah Nelson', 'Individual woman set scientist study use role. Arrive within thus air development.', 2210868481, '1918-08-30', '748 Dustin Drives Apt. 927
North Amandafurt, HI 60438');
INSERT INTO public.client VALUES (25, 'Laurie Carter', 'Bag that data environmental pull. Maybe wish between glass production middle.', 2307175150, '1915-06-08', '5534 Rivera Grove Apt. 750
West Kathleenshire, TX 04359');
INSERT INTO public.client VALUES (26, 'Thomas Stanley', 'Here executive certainly herself close worker. Stay magazine camera.', 2673917660, '1982-03-07', '51774 Charles Ways Suite 631
Elizabethtown, NM 46069');
INSERT INTO public.client VALUES (27, 'Christopher Olson', 'Discussion out remember region record soon. Computer both high describe lose.', 2986628960, '1948-01-09', '52231 Kathryn Cliff
Michealfort, AS 34698');
INSERT INTO public.client VALUES (28, 'Roger Brooks', 'Court visit face player second. Very suffer worry suffer market field thing.', 8352750445, '1970-05-01', '97871 Lee Flats Suite 245
Baileyborough, NE 37229');
INSERT INTO public.client VALUES (29, 'Matthew Rodriguez', 'Improve art end body point sea. Anything better card evidence above.', 4548277731, '1959-08-07', 'PSC 3380, Box 8103
APO AE 82125');
INSERT INTO public.client VALUES (30, 'Jeffrey Smith', 'Read nearly father soldier. Win industry wind few none rather particularly.', 5398501700, '1942-09-05', 'USNV Glover
FPO AP 72305');
INSERT INTO public.client VALUES (31, 'Jason Barry', 'Everything improve show member whole hope every its. Cell produce any these.', 3523905158, '1983-09-06', 'PSC 9924, Box 1707
APO AE 59169');
INSERT INTO public.client VALUES (32, 'Eric Nunez', 'Receive again day change. Single nor second or general back turn.', 9580164724, '1970-06-17', '9837 Graham Islands Apt. 881
Port Frank, MP 87964');
INSERT INTO public.client VALUES (33, 'David Campbell', 'American professional wait let. Than both money magazine hope.', 6066133144, '2020-10-13', '22942 Olson Spring
Joyceport, NV 32389');
INSERT INTO public.client VALUES (34, 'David Mejia', 'Heavy resource poor yes before. Certainly individual whom section receive.', 8484467240, '1930-01-25', '638 Thompson Glen Apt. 229
Torreston, VT 81417');
INSERT INTO public.client VALUES (35, 'Ashley Serrano', 'Page full maybe poor time. Energy building newspaper bit memory consider stock her.', 6246773762, '1925-03-18', '091 Kristy Stream Apt. 642
New David, DE 76887');
INSERT INTO public.client VALUES (36, 'Lisa Rhodes', 'Soon yourself area generation which. Certainly reduce suggest morning need radio.', 3680259407, '1946-03-26', '4788 Miller Ville
Shahmouth, MD 45104');
INSERT INTO public.client VALUES (37, 'Colton Montoya', 'Man nothing free financial claim board level. Southern off toward.', 5437827000, '1989-10-31', '985 Garcia Manors
West Michaelview, MD 95776');
INSERT INTO public.client VALUES (38, 'Carlos Mcdaniel', 'Continue animal near sport. Create concern series wait federal.', 1555695991, '2009-08-24', '19497 Gray Road
Taylorland, AR 67596');
INSERT INTO public.client VALUES (39, 'Aaron Myers', 'Since indicate enter after cup. Kind movie he process personal. Now question my decide.', 9910821550, '1954-09-04', '60242 Camacho Shore
East Cindychester, ND 57831');
INSERT INTO public.client VALUES (40, 'Tanya Rubio', 'Improve assume although decide. Focus small reduce enter stage.', 8777638787, '2005-03-25', 'USS Schwartz
FPO AP 21701');
INSERT INTO public.client VALUES (41, 'Jessica Combs', 'Ten food sport mother police easy. Perform opportunity you knowledge big still price.', 4404484893, '1969-11-05', '4590 Ortega Summit Suite 016
New Richard, CO 97281');
INSERT INTO public.client VALUES (42, 'Elizabeth Baker', 'Action American itself room throw. On son else.', 6930842715, '1969-10-31', '57792 Perkins Forge Apt. 372
East Joshua, MO 03353');
INSERT INTO public.client VALUES (43, 'Melissa Gonzales', 'Forget success shake tell. Million speech respond remain week say deal.', 3070361362, '1983-10-02', '799 Clarke Plaza Apt. 769
East Tanyafort, DE 33584');
INSERT INTO public.client VALUES (44, 'Andrea Allen', 'Son music already list. Money research never yet public cup education.', 6995639753, '1949-03-05', '5721 Hunter Field Suite 459
North Brianfort, NM 76410');
INSERT INTO public.client VALUES (45, 'Cody Lopez', 'Year business me article. Reality sound painting especially adult. Sit item charge join.', 4224824845, '1917-07-17', '8180 Moore Freeway
South Adam, IL 14964');
INSERT INTO public.client VALUES (46, 'Christopher Robinson', 'North main hand. Visit establish if beautiful pay. President red assume partner.', 6260510775, '1977-04-23', '9323 Marks Springs Apt. 086
Rodneyland, AL 65582');
INSERT INTO public.client VALUES (47, 'James Davis', 'Partner man choice. Whether get when skill major few ago.', 2886991776, '1960-07-31', '52022 Melissa Square Suite 057
Port Samuelburgh, AR 55293');
INSERT INTO public.client VALUES (48, 'Sarah Nelson', 'Series fear look son teacher role. Message ahead western within but clearly.', 5097449574, '1942-08-15', '7881 Myers Ranch Apt. 955
Lake Anthony, MA 64603');
INSERT INTO public.client VALUES (49, 'Jennifer Harris', 'Organization only size same. Attention word mind generation enough air.', 4073891088, '1978-08-31', '22273 Guerrero Lights Apt. 634
Silvahaven, DE 56784');
INSERT INTO public.client VALUES (50, 'Gregory Gomez', 'Page team care policy increase lawyer. Among catch structure say walk ok well.', 9967413175, '2006-01-07', 'PSC 7845, Box 7146
APO AA 15949');
INSERT INTO public.client VALUES (51, 'Emily Camacho', 'Kitchen by similar more large. Such TV road parent if everything ask.', 6692571675, '2001-08-28', '00039 Daryl Glens
Kaylaland, GU 38757');
INSERT INTO public.client VALUES (52, 'Kenneth Salinas', 'Center not per debate born owner fill. Discover trip move we first ground as.', 7134715996, '1924-06-15', '600 Tyler Prairie
Lake Raymond, NE 35649');
INSERT INTO public.client VALUES (53, 'Kayla Jones', 'Same also teach television right serious.', 5629535229, '1929-09-08', '210 Johnny Point
Dianahaven, AL 85749');
INSERT INTO public.client VALUES (54, 'Todd Long', 'Staff pick look dog music. Hair site factor campaign concern. Draw last media quite.', 4064905660, '2000-03-24', '99089 John Expressway
Jeffreyside, GA 13470');
INSERT INTO public.client VALUES (55, 'Shannon Adams', 'Cause little agreement entire. Character right about computer.', 4060777516, '1945-02-01', '604 Freeman Fork
Alejandrafort, NJ 60852');
INSERT INTO public.client VALUES (56, 'Melissa Schmidt', 'War change be road. Seem knowledge per sense.', 2584498770, '2006-01-06', '055 Robert Gateway
Williamsstad, UT 82899');
INSERT INTO public.client VALUES (57, 'Stephanie Marquez', 'Television smile beat play phone future society. Man staff produce picture.', 1265288468, '2015-07-08', '22938 Hawkins Plain Suite 215
Simonside, NE 11370');
INSERT INTO public.client VALUES (58, 'Jonathan Chambers', 'Fear hotel know against skin among. Indeed college exist table drop force we.', 3849627778, '2014-07-22', '9936 Wallace Light
South Michael, AZ 29023');
INSERT INTO public.client VALUES (59, 'Mark Fowler', 'End visit different eat. Civil give skin interest body growth close.', 4795738901, '1990-12-29', '920 Garza Views
Jacksonhaven, TN 58382');
INSERT INTO public.client VALUES (60, 'Brianna Noble', 'Letter eye year pick enter compare. Present stay information.', 9597316153, '1973-08-07', '9974 Sullivan Spring
Smithchester, CA 78833');
INSERT INTO public.client VALUES (61, 'Damon Little', 'Father them important only he my determine. Drive focus director to religious.', 6881078323, '2005-03-05', '8410 Robinson Ports
Lake Jessicaberg, NH 52416');
INSERT INTO public.client VALUES (62, 'Janet Lewis', 'Friend send American her radio perform social likely. Note but he top drug open.', 5213970630, '1942-01-23', '19316 Timothy Loaf Apt. 678
Carterhaven, HI 76468');
INSERT INTO public.client VALUES (63, 'Ian Baldwin', 'Make difficult in organization police throw respond Democrat. Career nature race prevent.', 3681529340, '1970-02-07', '0467 Duncan Ways Suite 317
Leeborough, OH 49484');
INSERT INTO public.client VALUES (64, 'Jeffery Rice', 'From parent speech. During move per professional sport.', 1401856464, '1917-10-29', '22973 Kevin Cliffs
North Joy, SD 31040');
INSERT INTO public.client VALUES (65, 'Ashley Powell', 'Option other rest. Ever suddenly thought television.', 8592434789, '1907-12-31', '8706 Claudia Landing
Dyermouth, PA 45119');
INSERT INTO public.client VALUES (66, 'Ms. Karen Clarke', 'Eight like scientist give. Half relate beyond game nor order.', 3129266573, '1962-07-17', '76868 King Views Apt. 261
Lake Tinaland, AL 94049');
INSERT INTO public.client VALUES (67, 'Belinda Perez', 'Bar result body professor budget from free. Race black factor admit.', 2210994101, '1935-03-28', 'Unit 3231 Box 8025
DPO AE 99891');
INSERT INTO public.client VALUES (68, 'Andrea Luna', 'Available least moment identify sport course include.', 3229298947, '1983-03-25', '8734 Bryant Corner Apt. 687
West Amber, UT 70657');
INSERT INTO public.client VALUES (69, 'Tonya Hunter', 'Carry discover clearly thought truth phone drop happy.', 2125802170, '1909-09-09', '06257 Curtis Hill Apt. 862
Nataliefort, WA 20544');
INSERT INTO public.client VALUES (70, 'Arthur Combs', 'Out within hair theory. Support contain mission against. Field pattern paper.', 7916719343, '1932-09-23', '45181 Bailey Forge
South Veronica, KS 93352');
INSERT INTO public.client VALUES (71, 'Beth Clark', 'Two into weight already condition everything kid.', 6170078931, '2005-07-12', '62804 Rebecca Common
Christopherfurt, VA 68926');
INSERT INTO public.client VALUES (72, 'Katrina Austin', 'Present many design class. Policy analysis can mind analysis event.', 4614941980, '1986-09-05', '2482 Pearson Summit Apt. 417
North Samantha, TX 29300');
INSERT INTO public.client VALUES (73, 'Eddie Hall', 'Free particular everybody key. Art Mr indeed economic. Audience turn lay computer.', 7271741070, '1954-10-19', 'Unit 5225 Box 1859
DPO AE 59162');
INSERT INTO public.client VALUES (74, 'Johnny Brown', 'Until address personal to. Structure shake white stuff plan. Seek itself travel bad.', 5336443969, '1971-11-27', '6176 Hurley Walks
West Charles, MP 48192');
INSERT INTO public.client VALUES (75, 'Jennifer Macias', 'Service able month past story agency. Follow service stage reduce create beyond.', 8584558016, '1997-08-24', '76363 Fowler Flat Apt. 556
East Sarah, PA 14656');
INSERT INTO public.client VALUES (76, 'Natalie Bradley', 'Catch miss now thank outside. Face election brother statement bill.', 7002155487, '1991-07-14', '320 Fowler Street
Debraburgh, CA 01229');
INSERT INTO public.client VALUES (77, 'Robert Obrien', 'Glass style establish office general out college.', 3209852101, '1977-01-20', '970 Zachary Route
Allenland, MP 26980');
INSERT INTO public.client VALUES (78, 'Renee Peters', 'Nearly security show daughter we way. Tend leader strong so out thus something.', 5007587627, '1944-10-05', '6148 Clark Mills
Daltonville, GA 13738');
INSERT INTO public.client VALUES (79, 'Sarah Pena', 'Although value market citizen very score natural.', 1603220056, '1977-03-09', '9232 Janet Lodge Suite 240
East Kevin, AZ 20613');
INSERT INTO public.client VALUES (80, 'Crystal Kim', 'Job piece peace whatever. Drop bar protect two current throughout boy pressure.', 7236575105, '1908-05-29', '97328 Walker Throughway Suite 151
New Erin, RI 48223');
INSERT INTO public.client VALUES (81, 'Jordan Bush', 'Piece far show radio. High speak each everyone old. Conference else read system some.', 5633887242, '1979-10-06', '917 Young Falls
Mariamouth, VT 75843');
INSERT INTO public.client VALUES (82, 'Rebecca Anderson', 'Manager produce pull within. Artist beat pass woman. Use dog focus involve.', 5469394455, '1978-04-11', '77603 Emily Cliffs
Joseberg, LA 87562');
INSERT INTO public.client VALUES (83, 'Linda Gardner', 'Require beyond Mr might up dog piece. Magazine newspaper executive war debate why.', 5860655884, '1926-10-27', '12636 Moses Alley Suite 471
South Scottbury, DC 24405');
INSERT INTO public.client VALUES (84, 'Stanley Maddox', 'Bag myself candidate television establish. Tree six TV now environment site bed.', 9720280013, '1973-11-04', '7567 Campos Rue
East Jerry, MH 49257');
INSERT INTO public.client VALUES (85, 'Brian Powell', 'Test election old direction require. Its several floor report.', 2494760860, '1995-02-26', '633 Donna Harbors
North Michaelville, NE 79021');
INSERT INTO public.client VALUES (86, 'Mark Mcbride', 'Government win sort result middle rest. Music hit bed large create article.', 1627291514, '2000-02-02', '69663 Brian Knolls Suite 969
New Josephview, MP 14284');
INSERT INTO public.client VALUES (87, 'David Sanford', 'Edge stock down thousand head. Full age fine. Front owner region four.', 1489759264, '2009-01-30', '230 Mcconnell Brook Suite 280
Victoriaport, AZ 00759');
INSERT INTO public.client VALUES (88, 'John Bright', 'Smile could if television. Until value eye ground offer trade great.', 2754602187, '1997-09-26', 'Unit 5490 Box 2477
DPO AA 75985');
INSERT INTO public.client VALUES (89, 'Mr. Donald Middleton DVM', 'Why own series southern game. Play father country win indeed.', 3837481519, '1919-09-08', '349 Rachel Junctions
Port Alexander, RI 28314');
INSERT INTO public.client VALUES (90, 'Collin Schmidt', 'Politics low wish star. Role recognize interest agree front.', 2401510594, '1995-12-01', '93736 Ronald Center Apt. 923
West Thomasside, OR 05884');
INSERT INTO public.client VALUES (91, 'Natalie Bryant', 'Over but as hot. Know themselves near movement source once image. Race data service.', 4484701173, '2001-03-19', '07720 Berry Divide Suite 123
South Angel, WV 37072');
INSERT INTO public.client VALUES (92, 'Emily Leonard', 'Garden force citizen modern edge few.', 6017659550, '2013-02-08', 'Unit 9232 Box 2099
DPO AE 22073');
INSERT INTO public.client VALUES (93, 'Angela Noble', 'Party good ability Mr movement. Everybody policy guy today. Somebody source if.', 4750984708, '1929-05-03', '3888 Hebert Squares
New Johnborough, VT 08446');
INSERT INTO public.client VALUES (94, 'Christopher Freeman', 'Including beat wind. Plan enter rock college where size out series.', 5382199164, '2011-02-06', '5674 Moss Lakes Suite 559
Cartermouth, DC 15736');
INSERT INTO public.client VALUES (95, 'Matthew Oliver', 'Whose set involve administration begin agent.', 3953732322, '1978-12-14', '0499 Young River
Fosterfort, ME 90113');
INSERT INTO public.client VALUES (96, 'Pam Harris', 'Role man share site allow determine customer. Way successful determine career final.', 9183053751, '2004-06-19', '9972 Daniel Crossing
Isabelport, WI 73121');
INSERT INTO public.client VALUES (97, 'Ryan Maynard', 'Account system tonight issue daughter. Attack eat war sure fast behavior.', 3376652224, '1971-06-07', '3267 Herrera Spurs Apt. 981
Coxhaven, SD 72624');
INSERT INTO public.client VALUES (98, 'Tammy Dixon', 'Visit and their somebody. Wall court building population worker month act.', 5984731418, '2000-04-17', '59565 Murphy Overpass
Stephanieview, GU 75506');
INSERT INTO public.client VALUES (99, 'Anna Gutierrez', 'Soldier wind why a but home total. Case trade born us.', 8127613676, '1915-02-27', '161 Nixon Track
East Amandafurt, ME 08671');
INSERT INTO public.client VALUES (100, 'Molly Brown', 'Body piece base ten interest large anyone. Still win agent center focus find.', 3391993538, '1971-10-08', '63794 Lamb Drive
South Emilytown, SD 55828');


--
-- TOC entry 3444 (class 0 OID 16565)
-- Dependencies: 221
-- Data for Name: contract; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contract VALUES (1, 98, '2009-03-13', '2014-06-29');
INSERT INTO public.contract VALUES (2, 19, '2014-10-03', '2015-05-22');
INSERT INTO public.contract VALUES (3, 65, '2019-08-20', '2021-12-05');
INSERT INTO public.contract VALUES (4, 62, '2014-03-18', '2018-04-10');
INSERT INTO public.contract VALUES (5, 7, '2009-07-31', '2015-11-24');
INSERT INTO public.contract VALUES (6, 79, '2002-01-11', '2018-08-10');
INSERT INTO public.contract VALUES (7, 66, '2006-09-29', '2017-02-21');
INSERT INTO public.contract VALUES (8, 7, '2010-10-11', '2017-02-16');
INSERT INTO public.contract VALUES (9, 98, '2017-01-04', '2022-03-28');
INSERT INTO public.contract VALUES (10, 52, '2003-04-29', '2023-12-08');
INSERT INTO public.contract VALUES (11, 92, '2003-05-22', '2008-02-15');
INSERT INTO public.contract VALUES (12, 86, '2003-07-22', '2014-05-07');
INSERT INTO public.contract VALUES (13, 80, '2009-04-23', '2020-04-02');
INSERT INTO public.contract VALUES (14, 91, '2005-11-28', '2006-04-10');
INSERT INTO public.contract VALUES (15, 92, '2014-08-18', '2018-05-31');
INSERT INTO public.contract VALUES (16, 26, '2008-09-02', '2023-04-15');
INSERT INTO public.contract VALUES (17, 23, '2016-12-31', '2017-07-28');
INSERT INTO public.contract VALUES (18, 44, '2018-12-24', '2021-06-30');
INSERT INTO public.contract VALUES (19, 52, '2017-05-23', '2020-11-14');
INSERT INTO public.contract VALUES (20, 34, '2005-06-20', '2020-02-20');
INSERT INTO public.contract VALUES (21, 41, '2014-10-02', '2019-08-23');
INSERT INTO public.contract VALUES (22, 4, '2011-11-30', '2018-09-22');
INSERT INTO public.contract VALUES (23, 31, '2012-11-07', '2012-12-03');
INSERT INTO public.contract VALUES (24, 85, '2005-04-18', '2015-10-09');
INSERT INTO public.contract VALUES (25, 32, '2009-02-28', '2017-10-20');
INSERT INTO public.contract VALUES (26, 75, '2018-10-28', '2023-08-10');
INSERT INTO public.contract VALUES (27, 94, '2018-09-13', '2021-05-25');
INSERT INTO public.contract VALUES (28, 4, '2005-10-19', '2023-12-09');
INSERT INTO public.contract VALUES (29, 24, '2009-01-15', '2010-06-05');
INSERT INTO public.contract VALUES (30, 2, '2000-09-06', '2006-02-21');
INSERT INTO public.contract VALUES (31, 10, '2005-01-10', '2020-06-30');
INSERT INTO public.contract VALUES (32, 25, '2004-12-24', '2008-12-11');
INSERT INTO public.contract VALUES (33, 44, '2007-04-21', '2011-03-15');
INSERT INTO public.contract VALUES (34, 97, '2009-04-07', '2023-08-13');
INSERT INTO public.contract VALUES (35, 65, '2006-05-06', '2022-02-18');
INSERT INTO public.contract VALUES (36, 76, '2005-08-02', '2011-05-13');
INSERT INTO public.contract VALUES (37, 65, '2000-04-06', '2021-08-06');
INSERT INTO public.contract VALUES (38, 58, '2004-09-30', '2015-08-16');
INSERT INTO public.contract VALUES (39, 86, '2001-07-05', '2002-01-26');
INSERT INTO public.contract VALUES (40, 2, '2009-10-31', '2018-03-20');
INSERT INTO public.contract VALUES (41, 19, '2005-04-03', '2014-06-08');
INSERT INTO public.contract VALUES (42, 29, '2009-06-23', '2015-06-03');
INSERT INTO public.contract VALUES (43, 88, '2019-11-14', '2020-11-12');
INSERT INTO public.contract VALUES (44, 33, '2000-09-13', '2020-12-21');
INSERT INTO public.contract VALUES (45, 24, '2007-08-13', '2007-09-01');
INSERT INTO public.contract VALUES (46, 26, '2004-02-03', '2023-09-09');
INSERT INTO public.contract VALUES (47, 74, '2002-02-23', '2014-01-09');
INSERT INTO public.contract VALUES (48, 94, '2006-02-07', '2019-01-02');
INSERT INTO public.contract VALUES (49, 62, '2003-06-29', '2007-11-04');
INSERT INTO public.contract VALUES (50, 39, '2017-12-28', '2019-08-12');
INSERT INTO public.contract VALUES (51, 87, '2006-09-20', '2010-10-02');
INSERT INTO public.contract VALUES (52, 49, '2006-11-08', '2013-08-13');
INSERT INTO public.contract VALUES (53, 89, '2015-05-07', '2017-08-29');
INSERT INTO public.contract VALUES (54, 38, '2001-08-07', '2022-04-09');
INSERT INTO public.contract VALUES (55, 41, '2001-03-24', '2021-02-12');
INSERT INTO public.contract VALUES (56, 3, '2022-02-07', '2022-04-08');
INSERT INTO public.contract VALUES (57, 88, '2020-07-25', '2021-10-14');
INSERT INTO public.contract VALUES (58, 55, '2002-04-26', '2015-02-18');
INSERT INTO public.contract VALUES (59, 35, '2005-12-03', '2016-09-19');
INSERT INTO public.contract VALUES (60, 23, '2019-03-13', '2022-02-03');
INSERT INTO public.contract VALUES (61, 66, '2006-05-11', '2018-11-07');
INSERT INTO public.contract VALUES (62, 61, '2011-12-31', '2018-05-23');
INSERT INTO public.contract VALUES (63, 98, '2004-06-06', '2014-02-13');
INSERT INTO public.contract VALUES (64, 64, '2007-05-10', '2019-06-09');
INSERT INTO public.contract VALUES (65, 41, '2022-07-16', '2023-08-05');
INSERT INTO public.contract VALUES (66, 56, '2007-03-15', '2008-02-01');
INSERT INTO public.contract VALUES (67, 37, '2017-03-23', '2019-08-29');
INSERT INTO public.contract VALUES (68, 98, '2007-02-07', '2020-08-15');
INSERT INTO public.contract VALUES (69, 35, '2000-04-15', '2001-09-02');
INSERT INTO public.contract VALUES (70, 61, '2012-11-23', '2019-05-13');
INSERT INTO public.contract VALUES (71, 92, '2001-06-10', '2005-02-22');
INSERT INTO public.contract VALUES (72, 4, '2004-06-16', '2016-11-29');
INSERT INTO public.contract VALUES (73, 90, '2014-12-29', '2017-05-30');
INSERT INTO public.contract VALUES (74, 50, '2008-03-24', '2018-12-10');
INSERT INTO public.contract VALUES (75, 55, '2008-03-06', '2008-03-07');
INSERT INTO public.contract VALUES (76, 28, '2007-04-02', '2020-11-14');
INSERT INTO public.contract VALUES (77, 49, '2001-01-16', '2015-02-03');
INSERT INTO public.contract VALUES (78, 3, '2004-01-20', '2004-11-22');
INSERT INTO public.contract VALUES (79, 26, '2005-07-07', '2006-06-07');
INSERT INTO public.contract VALUES (80, 94, '2013-01-02', '2022-12-12');
INSERT INTO public.contract VALUES (81, 23, '2008-12-13', '2015-02-05');
INSERT INTO public.contract VALUES (82, 31, '2001-11-19', '2005-08-23');
INSERT INTO public.contract VALUES (83, 74, '2008-09-05', '2014-08-19');
INSERT INTO public.contract VALUES (84, 48, '2003-10-14', '2008-02-12');
INSERT INTO public.contract VALUES (85, 58, '2014-05-22', '2017-03-02');
INSERT INTO public.contract VALUES (86, 74, '2022-07-26', '2023-09-17');
INSERT INTO public.contract VALUES (87, 59, '2002-03-06', '2015-08-16');
INSERT INTO public.contract VALUES (88, 63, '2003-02-06', '2015-09-29');
INSERT INTO public.contract VALUES (89, 47, '2019-02-12', '2021-01-18');
INSERT INTO public.contract VALUES (90, 85, '2000-06-17', '2016-03-07');
INSERT INTO public.contract VALUES (91, 94, '2009-03-01', '2022-11-30');
INSERT INTO public.contract VALUES (92, 52, '2002-06-10', '2006-02-18');
INSERT INTO public.contract VALUES (93, 65, '2015-07-03', '2016-03-24');
INSERT INTO public.contract VALUES (94, 15, '2009-12-18', '2020-12-10');
INSERT INTO public.contract VALUES (95, 51, '2005-05-31', '2007-09-21');
INSERT INTO public.contract VALUES (96, 10, '2009-07-12', '2020-04-17');
INSERT INTO public.contract VALUES (97, 44, '2004-05-24', '2012-12-13');
INSERT INTO public.contract VALUES (98, 96, '2001-07-31', '2013-07-30');
INSERT INTO public.contract VALUES (99, 76, '2005-08-06', '2023-08-17');
INSERT INTO public.contract VALUES (100, 75, '2013-04-06', '2015-07-24');
INSERT INTO public.contract VALUES (101, 82, '2011-08-27', '2017-05-05');
INSERT INTO public.contract VALUES (102, 33, '2003-02-04', '2007-02-07');
INSERT INTO public.contract VALUES (103, 56, '2017-11-03', '2022-03-19');
INSERT INTO public.contract VALUES (104, 42, '2012-05-16', '2015-05-08');
INSERT INTO public.contract VALUES (105, 88, '2003-09-17', '2008-05-17');
INSERT INTO public.contract VALUES (106, 56, '2005-11-05', '2021-10-20');
INSERT INTO public.contract VALUES (107, 76, '2012-04-08', '2019-11-04');
INSERT INTO public.contract VALUES (108, 6, '2012-03-17', '2016-08-08');
INSERT INTO public.contract VALUES (109, 26, '2002-04-29', '2016-09-02');
INSERT INTO public.contract VALUES (110, 11, '2007-10-27', '2017-12-02');
INSERT INTO public.contract VALUES (111, 52, '2009-03-19', '2011-11-29');
INSERT INTO public.contract VALUES (112, 63, '2008-09-24', '2018-06-17');
INSERT INTO public.contract VALUES (113, 44, '2011-10-16', '2016-11-20');
INSERT INTO public.contract VALUES (114, 85, '2010-04-18', '2012-09-06');
INSERT INTO public.contract VALUES (115, 9, '2004-06-11', '2023-01-19');
INSERT INTO public.contract VALUES (116, 76, '2012-04-25', '2017-03-16');
INSERT INTO public.contract VALUES (117, 85, '2000-03-29', '2004-08-03');
INSERT INTO public.contract VALUES (118, 87, '2010-03-14', '2016-10-19');
INSERT INTO public.contract VALUES (119, 79, '2009-10-16', '2023-11-14');
INSERT INTO public.contract VALUES (120, 59, '2001-10-10', '2011-12-09');
INSERT INTO public.contract VALUES (121, 21, '2011-03-27', '2015-05-20');
INSERT INTO public.contract VALUES (122, 94, '2000-01-25', '2023-05-24');
INSERT INTO public.contract VALUES (123, 84, '2018-09-18', '2021-09-01');
INSERT INTO public.contract VALUES (124, 42, '2011-05-04', '2011-05-15');
INSERT INTO public.contract VALUES (125, 78, '2001-02-04', '2020-09-01');
INSERT INTO public.contract VALUES (126, 13, '2005-08-27', '2016-11-16');
INSERT INTO public.contract VALUES (127, 58, '2002-07-21', '2007-02-08');
INSERT INTO public.contract VALUES (128, 96, '2015-05-08', '2023-12-27');
INSERT INTO public.contract VALUES (129, 39, '2004-04-22', '2021-11-08');
INSERT INTO public.contract VALUES (130, 20, '2007-04-04', '2014-03-07');
INSERT INTO public.contract VALUES (131, 48, '2014-07-06', '2022-07-26');
INSERT INTO public.contract VALUES (132, 25, '2019-04-06', '2020-10-23');
INSERT INTO public.contract VALUES (133, 85, '2006-07-03', '2014-10-22');
INSERT INTO public.contract VALUES (134, 58, '2009-01-26', '2010-07-13');
INSERT INTO public.contract VALUES (135, 48, '2007-05-16', '2010-08-06');
INSERT INTO public.contract VALUES (136, 49, '2002-06-02', '2003-07-13');
INSERT INTO public.contract VALUES (137, 62, '2005-08-05', '2015-12-02');
INSERT INTO public.contract VALUES (138, 18, '2009-07-25', '2015-10-06');
INSERT INTO public.contract VALUES (139, 85, '2008-10-07', '2017-09-29');
INSERT INTO public.contract VALUES (140, 6, '2015-08-28', '2018-11-15');
INSERT INTO public.contract VALUES (141, 5, '2013-05-27', '2022-09-22');
INSERT INTO public.contract VALUES (142, 16, '2018-02-24', '2022-11-12');
INSERT INTO public.contract VALUES (143, 40, '2007-01-26', '2007-05-25');
INSERT INTO public.contract VALUES (144, 40, '2012-11-14', '2017-08-11');
INSERT INTO public.contract VALUES (145, 23, '2002-11-05', '2007-03-24');
INSERT INTO public.contract VALUES (146, 8, '2012-05-12', '2016-02-26');
INSERT INTO public.contract VALUES (147, 12, '2002-09-29', '2019-02-11');
INSERT INTO public.contract VALUES (148, 28, '2000-08-27', '2003-11-07');
INSERT INTO public.contract VALUES (149, 42, '2021-08-18', '2023-05-02');
INSERT INTO public.contract VALUES (150, 55, '2012-12-22', '2020-10-23');
INSERT INTO public.contract VALUES (151, 85, '2000-06-13', '2016-03-02');
INSERT INTO public.contract VALUES (152, 54, '2010-09-25', '2016-01-01');
INSERT INTO public.contract VALUES (153, 53, '2015-11-20', '2022-01-11');
INSERT INTO public.contract VALUES (154, 98, '2015-02-21', '2018-09-29');
INSERT INTO public.contract VALUES (155, 4, '2014-10-08', '2018-06-01');
INSERT INTO public.contract VALUES (156, 8, '2007-04-17', '2022-09-12');
INSERT INTO public.contract VALUES (157, 45, '2009-04-25', '2011-04-11');
INSERT INTO public.contract VALUES (158, 23, '2016-11-14', '2018-06-30');
INSERT INTO public.contract VALUES (159, 12, '2016-09-20', '2019-02-26');
INSERT INTO public.contract VALUES (160, 22, '2003-06-09', '2012-01-03');
INSERT INTO public.contract VALUES (161, 23, '2006-11-19', '2017-05-03');
INSERT INTO public.contract VALUES (162, 77, '2015-11-10', '2021-04-25');
INSERT INTO public.contract VALUES (163, 12, '2011-07-12', '2021-10-05');
INSERT INTO public.contract VALUES (164, 79, '2000-02-20', '2001-03-16');
INSERT INTO public.contract VALUES (165, 56, '2010-04-28', '2022-10-14');
INSERT INTO public.contract VALUES (166, 28, '2004-01-31', '2016-03-29');
INSERT INTO public.contract VALUES (167, 41, '2001-08-24', '2018-12-14');
INSERT INTO public.contract VALUES (168, 96, '2001-02-24', '2019-03-30');
INSERT INTO public.contract VALUES (169, 85, '2008-02-26', '2008-09-28');
INSERT INTO public.contract VALUES (170, 58, '2014-03-20', '2016-03-13');
INSERT INTO public.contract VALUES (171, 28, '2017-03-15', '2021-11-19');
INSERT INTO public.contract VALUES (172, 98, '2004-02-28', '2015-05-07');
INSERT INTO public.contract VALUES (173, 44, '2005-04-09', '2014-06-06');
INSERT INTO public.contract VALUES (174, 49, '2001-12-13', '2023-03-07');
INSERT INTO public.contract VALUES (175, 18, '2005-03-22', '2010-09-09');
INSERT INTO public.contract VALUES (176, 68, '2002-08-09', '2002-10-16');
INSERT INTO public.contract VALUES (177, 9, '2008-01-31', '2014-01-21');
INSERT INTO public.contract VALUES (178, 42, '2007-01-16', '2009-02-04');
INSERT INTO public.contract VALUES (179, 80, '2000-02-26', '2013-10-15');
INSERT INTO public.contract VALUES (180, 22, '2008-01-08', '2009-08-26');
INSERT INTO public.contract VALUES (181, 95, '2000-07-17', '2009-06-19');
INSERT INTO public.contract VALUES (182, 44, '2001-02-24', '2008-11-28');
INSERT INTO public.contract VALUES (183, 49, '2001-01-25', '2018-07-16');
INSERT INTO public.contract VALUES (184, 4, '2015-05-04', '2023-12-12');
INSERT INTO public.contract VALUES (185, 86, '2003-12-15', '2012-07-03');
INSERT INTO public.contract VALUES (186, 20, '2018-10-02', '2020-01-26');
INSERT INTO public.contract VALUES (187, 54, '2004-01-02', '2015-07-22');
INSERT INTO public.contract VALUES (188, 64, '2006-05-14', '2008-05-30');
INSERT INTO public.contract VALUES (189, 40, '2000-12-14', '2018-03-27');
INSERT INTO public.contract VALUES (190, 5, '2019-04-11', '2022-03-09');
INSERT INTO public.contract VALUES (191, 92, '2002-11-09', '2010-09-01');
INSERT INTO public.contract VALUES (192, 77, '2001-08-02', '2011-10-04');
INSERT INTO public.contract VALUES (193, 94, '2012-08-16', '2023-11-28');
INSERT INTO public.contract VALUES (194, 33, '2009-11-13', '2021-09-09');
INSERT INTO public.contract VALUES (195, 100, '2004-05-31', '2021-09-16');
INSERT INTO public.contract VALUES (196, 73, '2005-06-01', '2006-01-09');
INSERT INTO public.contract VALUES (197, 74, '2007-10-19', '2016-07-02');
INSERT INTO public.contract VALUES (198, 45, '2006-05-06', '2019-01-04');
INSERT INTO public.contract VALUES (199, 83, '2005-02-04', '2018-05-20');
INSERT INTO public.contract VALUES (200, 84, '2011-03-26', '2021-08-06');


--
-- TOC entry 3447 (class 0 OID 16595)
-- Dependencies: 224
-- Data for Name: domestic_call; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.domestic_call VALUES (87524724305, 83630038004, '2015-03-01 03:01:31', '2017-12-27 02:32:03', 1);
INSERT INTO public.domestic_call VALUES (85393070976, 83434716995, '2012-05-02 22:44:20', '2012-05-19 23:00:31', 2);
INSERT INTO public.domestic_call VALUES (84641521075, 88063132062, '2000-07-10 23:30:10', '2007-09-03 21:30:12', 3);
INSERT INTO public.domestic_call VALUES (85318764803, 87308609495, '2000-04-20 10:25:40', '2002-06-13 23:07:43', 4);
INSERT INTO public.domestic_call VALUES (81974404285, 88686637097, '2004-10-13 19:51:35', '2022-11-20 13:56:09', 5);
INSERT INTO public.domestic_call VALUES (89152297934, 81193274375, '2006-07-29 00:03:43', '2008-03-01 16:08:48', 6);
INSERT INTO public.domestic_call VALUES (89627994826, 81272583628, '2001-06-20 06:36:27', '2021-01-12 14:11:47', 7);
INSERT INTO public.domestic_call VALUES (85565214442, 81834251955, '2009-08-07 06:35:50', '2011-01-27 11:58:39', 8);
INSERT INTO public.domestic_call VALUES (81636172720, 87395751914, '2004-05-29 14:54:01', '2008-09-07 09:49:22', 9);
INSERT INTO public.domestic_call VALUES (84647907788, 87716726601, '2005-06-24 22:47:58', '2015-07-03 13:13:02', 10);
INSERT INTO public.domestic_call VALUES (83633779974, 83774318368, '2008-06-22 21:19:02', '2021-05-07 03:44:51', 11);
INSERT INTO public.domestic_call VALUES (82175988839, 86973322478, '2002-05-25 04:48:59', '2021-01-13 13:12:10', 12);
INSERT INTO public.domestic_call VALUES (89808284555, 87312837291, '2001-10-28 12:58:14', '2017-12-21 19:10:55', 13);
INSERT INTO public.domestic_call VALUES (88471149100, 81839725897, '2006-09-26 02:35:27', '2013-09-11 10:25:46', 14);
INSERT INTO public.domestic_call VALUES (89256909812, 81351445183, '2006-06-25 16:38:16', '2009-10-31 16:45:30', 15);
INSERT INTO public.domestic_call VALUES (89369956732, 89844900220, '2017-03-22 17:47:58', '2020-02-27 01:44:37', 16);
INSERT INTO public.domestic_call VALUES (88864470392, 86128319451, '2005-07-03 07:27:16', '2009-04-25 04:47:02', 17);
INSERT INTO public.domestic_call VALUES (86251707383, 82453780011, '2003-12-17 10:03:10', '2018-05-17 21:11:09', 18);
INSERT INTO public.domestic_call VALUES (88136644056, 82453780011, '2004-01-19 03:33:11', '2011-09-08 12:53:37', 19);
INSERT INTO public.domestic_call VALUES (87310152610, 86973322478, '2009-07-11 22:25:16', '2017-11-03 12:59:01', 20);
INSERT INTO public.domestic_call VALUES (89648494338, 83589371211, '2002-03-26 08:13:48', '2005-10-18 17:17:24', 21);
INSERT INTO public.domestic_call VALUES (87902278454, 88686637097, '2007-02-05 12:15:55', '2011-03-20 06:02:23', 22);
INSERT INTO public.domestic_call VALUES (84919495776, 87308609495, '2008-10-17 02:00:36', '2023-07-08 06:56:41', 23);
INSERT INTO public.domestic_call VALUES (85731287762, 82540578006, '2011-04-29 01:14:06', '2015-03-22 20:25:19', 24);
INSERT INTO public.domestic_call VALUES (85453225640, 83038342901, '2001-02-09 15:22:23', '2003-10-15 03:05:38', 25);
INSERT INTO public.domestic_call VALUES (84915202752, 83495694331, '2007-08-17 13:10:41', '2007-11-12 21:11:32', 26);
INSERT INTO public.domestic_call VALUES (85382993846, 86973322478, '2012-03-24 18:23:23', '2015-06-03 07:03:22', 27);
INSERT INTO public.domestic_call VALUES (81508098666, 86128319451, '2001-06-27 18:20:20', '2009-12-28 07:04:46', 28);
INSERT INTO public.domestic_call VALUES (86958511469, 85121541173, '2008-06-09 03:45:33', '2017-11-26 09:47:15', 29);
INSERT INTO public.domestic_call VALUES (88555125558, 83231037288, '2007-04-04 18:54:10', '2008-07-31 08:25:17', 30);
INSERT INTO public.domestic_call VALUES (89877785845, 81272583628, '2004-11-12 00:38:27', '2007-02-03 14:16:15', 31);
INSERT INTO public.domestic_call VALUES (82935475783, 87207296042, '2012-05-20 11:38:23', '2017-01-17 07:41:48', 32);
INSERT INTO public.domestic_call VALUES (84852575241, 83589371211, '2011-05-20 07:21:07', '2013-12-02 19:38:02', 33);
INSERT INTO public.domestic_call VALUES (88601921396, 81525714909, '2014-03-28 19:35:53', '2023-11-22 00:39:56', 34);
INSERT INTO public.domestic_call VALUES (86047679258, 85201742231, '2009-12-19 12:23:19', '2017-10-15 18:37:55', 35);
INSERT INTO public.domestic_call VALUES (84027470047, 85162225551, '2010-04-26 06:21:48', '2021-12-01 15:24:15', 36);
INSERT INTO public.domestic_call VALUES (89715965980, 89167792152, '2009-10-13 00:33:56', '2013-05-24 15:30:06', 37);
INSERT INTO public.domestic_call VALUES (85466080498, 82440436528, '2006-06-07 09:35:05', '2007-01-30 15:49:53', 38);
INSERT INTO public.domestic_call VALUES (87870133986, 83774318368, '2006-05-17 14:32:11', '2010-02-05 20:08:40', 39);
INSERT INTO public.domestic_call VALUES (89711086891, 88063132062, '2001-03-07 07:12:29', '2013-09-28 00:20:30', 40);
INSERT INTO public.domestic_call VALUES (84794348515, 82700964651, '2008-12-20 21:01:48', '2018-03-18 04:23:41', 41);
INSERT INTO public.domestic_call VALUES (81423510185, 86973322478, '2013-07-20 12:03:50', '2021-07-04 07:52:22', 42);
INSERT INTO public.domestic_call VALUES (84628217618, 87207296042, '2007-10-21 13:59:16', '2019-01-09 12:48:22', 43);
INSERT INTO public.domestic_call VALUES (89881036244, 82651331557, '2013-12-04 04:22:01', '2022-02-07 11:18:48', 44);
INSERT INTO public.domestic_call VALUES (85853765349, 86128319451, '2000-07-31 03:32:51', '2011-06-08 13:53:54', 45);
INSERT INTO public.domestic_call VALUES (87853673181, 88874893105, '2001-11-20 12:43:34', '2020-04-04 17:42:20', 46);
INSERT INTO public.domestic_call VALUES (83485442947, 86329113206, '2008-02-06 05:45:10', '2009-12-22 13:07:04', 47);
INSERT INTO public.domestic_call VALUES (84325298566, 89931173404, '2012-11-22 22:16:16', '2016-11-21 07:52:22', 48);
INSERT INTO public.domestic_call VALUES (85309812799, 83164665019, '2008-06-28 15:50:13', '2012-08-07 03:48:55', 49);
INSERT INTO public.domestic_call VALUES (83755372180, 87312837291, '2000-07-09 08:24:42', '2002-05-25 23:37:12', 50);
INSERT INTO public.domestic_call VALUES (89262235484, 86128319451, '2002-04-30 21:16:41', '2017-02-27 22:13:26', 51);
INSERT INTO public.domestic_call VALUES (84082663373, 83231037288, '2004-09-06 22:19:48', '2006-11-02 14:32:49', 52);
INSERT INTO public.domestic_call VALUES (85255567127, 89605694853, '2000-09-04 00:29:12', '2003-12-05 21:04:34', 53);
INSERT INTO public.domestic_call VALUES (87532197785, 82700964651, '2000-01-01 22:32:34', '2003-07-15 04:33:26', 54);
INSERT INTO public.domestic_call VALUES (87286457410, 82884816243, '2008-10-14 19:09:15', '2009-08-28 13:06:54', 55);
INSERT INTO public.domestic_call VALUES (87709984415, 88029686047, '2011-09-25 00:37:24', '2017-02-20 03:53:28', 56);
INSERT INTO public.domestic_call VALUES (81363141530, 81525714909, '2008-10-17 21:09:56', '2015-11-25 11:35:06', 57);
INSERT INTO public.domestic_call VALUES (89043614915, 83434716995, '2013-04-05 17:53:05', '2023-04-30 15:59:03', 58);
INSERT INTO public.domestic_call VALUES (84539878740, 83589371211, '2017-07-01 11:46:20', '2022-08-10 18:33:30', 59);
INSERT INTO public.domestic_call VALUES (81809249766, 85162225551, '2016-04-28 20:19:28', '2018-12-08 18:49:09', 60);
INSERT INTO public.domestic_call VALUES (85051109379, 83495694331, '2006-06-06 14:23:57', '2015-02-18 12:47:35', 61);
INSERT INTO public.domestic_call VALUES (87405070315, 89670073963, '2015-05-16 07:49:04', '2020-03-24 22:57:21', 62);
INSERT INTO public.domestic_call VALUES (89080639858, 83039121686, '2001-08-18 08:09:49', '2011-08-22 17:51:10', 63);
INSERT INTO public.domestic_call VALUES (85938287630, 89670073963, '2016-01-19 11:47:13', '2016-03-07 03:00:29', 64);
INSERT INTO public.domestic_call VALUES (89143037364, 84157873461, '2015-07-30 06:39:17', '2022-02-25 22:13:27', 65);
INSERT INTO public.domestic_call VALUES (81333200739, 82717184948, '2016-09-20 08:08:13', '2018-01-23 09:01:22', 66);
INSERT INTO public.domestic_call VALUES (86689941483, 87141610652, '2010-08-17 07:35:25', '2017-11-28 22:17:40', 67);
INSERT INTO public.domestic_call VALUES (84302675092, 81690604571, '2004-05-13 16:08:17', '2006-06-22 21:10:24', 68);
INSERT INTO public.domestic_call VALUES (86669194442, 82651331557, '2004-07-12 05:42:10', '2023-12-11 23:32:05', 69);
INSERT INTO public.domestic_call VALUES (84134924654, 83231037288, '2005-04-22 10:36:13', '2018-01-27 11:58:31', 70);
INSERT INTO public.domestic_call VALUES (82255780322, 84157873461, '2008-09-20 04:59:04', '2018-06-17 07:29:41', 71);
INSERT INTO public.domestic_call VALUES (81368960533, 85411706214, '2013-07-17 14:02:28', '2014-07-03 08:38:18', 72);
INSERT INTO public.domestic_call VALUES (83695143713, 83231037288, '2001-10-22 19:17:50', '2016-06-15 06:27:26', 73);
INSERT INTO public.domestic_call VALUES (85555738829, 82540578006, '2003-04-25 21:42:55', '2010-02-26 17:16:07', 74);
INSERT INTO public.domestic_call VALUES (89596971090, 88686637097, '2006-07-23 14:29:43', '2018-09-08 10:11:01', 75);
INSERT INTO public.domestic_call VALUES (85210575538, 83630038004, '2014-02-08 12:00:43', '2017-05-10 12:02:37', 76);
INSERT INTO public.domestic_call VALUES (86742337624, 83253580355, '2000-02-02 10:46:11', '2019-09-18 06:07:45', 77);
INSERT INTO public.domestic_call VALUES (87556431759, 81690604571, '2014-11-17 23:11:07', '2017-11-09 23:08:38', 78);
INSERT INTO public.domestic_call VALUES (84087519125, 82010648116, '2001-06-28 00:26:07', '2002-11-30 04:35:00', 79);
INSERT INTO public.domestic_call VALUES (83449100304, 86128319451, '2001-09-05 13:40:38', '2003-09-16 17:46:30', 80);
INSERT INTO public.domestic_call VALUES (81964137373, 89167792152, '2006-08-25 03:35:33', '2016-06-16 03:32:27', 81);
INSERT INTO public.domestic_call VALUES (87843627284, 87850980321, '2008-01-30 01:15:11', '2009-01-31 23:19:07', 82);
INSERT INTO public.domestic_call VALUES (86370906416, 89742497510, '2021-03-23 06:54:05', '2021-05-21 21:48:54', 83);
INSERT INTO public.domestic_call VALUES (87286448413, 88354875145, '2008-08-28 08:33:34', '2015-07-21 03:48:52', 84);
INSERT INTO public.domestic_call VALUES (89200361969, 81341681439, '2011-03-19 16:23:10', '2018-03-06 16:39:26', 85);
INSERT INTO public.domestic_call VALUES (84830379254, 82010648116, '2010-05-22 12:50:24', '2013-08-20 23:51:58', 86);
INSERT INTO public.domestic_call VALUES (88803773276, 89844900220, '2009-06-12 02:48:29', '2011-12-15 03:46:32', 87);
INSERT INTO public.domestic_call VALUES (84437181526, 81015822213, '2011-02-15 21:22:40', '2020-04-21 05:55:43', 88);
INSERT INTO public.domestic_call VALUES (81917197601, 89670073963, '2001-06-08 07:49:40', '2001-07-05 05:56:39', 89);
INSERT INTO public.domestic_call VALUES (82261714086, 85922675734, '2018-10-29 19:05:13', '2021-09-01 18:05:10', 90);
INSERT INTO public.domestic_call VALUES (85240023658, 81539108668, '2010-11-24 18:41:56', '2013-08-02 22:56:07', 91);
INSERT INTO public.domestic_call VALUES (89286429263, 82010648116, '2008-06-14 22:46:22', '2013-01-13 03:10:15', 92);
INSERT INTO public.domestic_call VALUES (84553146189, 85937533879, '2016-10-16 11:13:26', '2017-10-07 12:32:27', 93);
INSERT INTO public.domestic_call VALUES (84037458312, 83231037288, '2003-10-09 09:31:53', '2016-11-06 00:20:55', 94);
INSERT INTO public.domestic_call VALUES (87095253072, 81393324182, '2009-04-03 18:41:48', '2014-12-22 20:33:58', 95);
INSERT INTO public.domestic_call VALUES (83256210949, 81015822213, '2012-01-30 16:41:18', '2022-04-14 13:27:30', 96);
INSERT INTO public.domestic_call VALUES (83938528274, 88686637097, '2001-07-05 14:43:54', '2019-05-19 10:25:36', 97);
INSERT INTO public.domestic_call VALUES (89917716369, 89175874533, '2005-06-24 13:13:21', '2019-02-03 10:16:35', 98);
INSERT INTO public.domestic_call VALUES (83023010937, 86948251411, '2008-01-28 12:21:05', '2017-04-21 21:10:43', 99);
INSERT INTO public.domestic_call VALUES (89436186955, 86128319451, '2004-05-10 16:11:43', '2017-07-11 00:04:08', 100);
INSERT INTO public.domestic_call VALUES (83928026883, 82010648116, '2012-06-24 02:51:12', '2015-02-21 00:33:37', 101);
INSERT INTO public.domestic_call VALUES (84594377566, 88063132062, '2017-02-25 18:04:12', '2022-02-08 05:56:56', 102);
INSERT INTO public.domestic_call VALUES (86284111266, 85922675734, '2000-01-26 02:55:05', '2003-05-04 08:24:27', 103);
INSERT INTO public.domestic_call VALUES (83901295311, 82514913257, '2011-01-20 01:55:36', '2022-08-01 21:26:49', 104);
INSERT INTO public.domestic_call VALUES (87181970706, 83162443692, '2003-04-21 11:19:19', '2005-12-01 12:37:30', 105);
INSERT INTO public.domestic_call VALUES (83153901433, 86256652966, '2019-12-24 23:06:52', '2019-12-26 16:40:17', 106);
INSERT INTO public.domestic_call VALUES (89810220634, 81525714909, '2015-12-03 03:13:51', '2021-07-07 09:39:57', 107);
INSERT INTO public.domestic_call VALUES (84619330429, 85937533879, '2010-09-30 03:19:02', '2023-01-18 08:21:31', 108);
INSERT INTO public.domestic_call VALUES (89598667315, 85121541173, '2009-04-08 15:38:07', '2016-10-07 07:22:50', 109);
INSERT INTO public.domestic_call VALUES (82737667163, 87850980321, '2002-10-29 11:57:45', '2018-11-30 14:07:25', 110);
INSERT INTO public.domestic_call VALUES (85877465649, 87312837291, '2017-01-20 17:57:40', '2020-01-07 11:12:35', 111);
INSERT INTO public.domestic_call VALUES (85921346405, 83774318368, '2015-04-22 14:38:57', '2017-09-12 19:19:39', 112);
INSERT INTO public.domestic_call VALUES (82652975798, 83939283170, '2006-01-09 08:33:32', '2010-02-18 01:07:31', 113);
INSERT INTO public.domestic_call VALUES (88497823087, 82700964651, '2013-07-20 04:33:22', '2022-06-06 06:24:15', 114);
INSERT INTO public.domestic_call VALUES (89655035592, 82440436528, '2001-11-23 05:16:15', '2023-01-22 18:07:17', 115);
INSERT INTO public.domestic_call VALUES (88357196642, 85201742231, '2010-02-27 01:56:40', '2013-08-16 03:41:23', 116);
INSERT INTO public.domestic_call VALUES (83976992137, 81651408391, '2003-07-27 04:13:07', '2013-02-28 13:28:05', 117);
INSERT INTO public.domestic_call VALUES (88843534254, 84548540986, '2006-02-20 06:27:54', '2007-02-03 14:01:44', 118);
INSERT INTO public.domestic_call VALUES (88213027745, 82651331557, '2004-01-06 23:04:48', '2007-08-14 01:44:58', 119);
INSERT INTO public.domestic_call VALUES (82171882108, 87293111316, '2006-09-13 11:30:25', '2022-06-24 20:10:22', 120);
INSERT INTO public.domestic_call VALUES (87892070695, 86017927001, '2002-06-10 07:13:26', '2022-10-09 15:01:07', 121);
INSERT INTO public.domestic_call VALUES (89489526020, 89931173404, '2000-10-27 10:20:02', '2006-07-04 03:48:43', 122);
INSERT INTO public.domestic_call VALUES (86187260985, 85201742231, '2018-12-04 01:07:25', '2021-05-04 00:04:24', 123);
INSERT INTO public.domestic_call VALUES (88861097079, 82651331557, '2002-03-02 16:04:30', '2014-09-26 07:03:11', 124);
INSERT INTO public.domestic_call VALUES (84605177109, 83630038004, '2017-09-27 21:02:22', '2018-04-21 04:55:14', 125);
INSERT INTO public.domestic_call VALUES (87067822134, 87651296848, '2007-09-24 07:53:00', '2016-11-06 12:50:57', 126);
INSERT INTO public.domestic_call VALUES (88314653008, 86256652966, '2010-09-13 12:22:26', '2013-04-23 15:51:17', 127);
INSERT INTO public.domestic_call VALUES (83780396869, 87816542499, '2010-08-23 08:58:37', '2016-02-25 20:57:41', 128);
INSERT INTO public.domestic_call VALUES (82385252827, 83164665019, '2004-07-23 13:19:07', '2017-01-06 05:08:51', 129);
INSERT INTO public.domestic_call VALUES (85599210614, 89909942854, '2003-05-25 16:37:25', '2011-11-23 07:00:44', 130);
INSERT INTO public.domestic_call VALUES (84151617217, 83253580355, '2006-08-03 19:40:53', '2016-03-10 07:25:36', 131);
INSERT INTO public.domestic_call VALUES (89112767377, 81690604571, '2000-08-01 02:39:03', '2008-11-26 13:36:25', 132);
INSERT INTO public.domestic_call VALUES (86499279480, 88063132062, '2020-08-05 09:11:46', '2021-05-14 03:50:33', 133);
INSERT INTO public.domestic_call VALUES (85175441351, 89730642391, '2005-09-16 06:16:12', '2008-04-05 08:18:19', 134);
INSERT INTO public.domestic_call VALUES (83358045551, 86973322478, '2005-07-03 13:20:44', '2022-08-18 03:51:22', 135);
INSERT INTO public.domestic_call VALUES (83277049845, 83367260233, '2002-06-24 21:41:28', '2023-07-23 10:45:27', 136);
INSERT INTO public.domestic_call VALUES (85074600884, 83774318368, '2017-02-08 02:02:58', '2019-09-06 14:49:27', 137);
INSERT INTO public.domestic_call VALUES (85110779676, 81760439158, '2011-03-19 16:58:43', '2015-05-24 05:14:24', 138);
INSERT INTO public.domestic_call VALUES (85651860461, 82700964651, '2011-05-16 16:07:57', '2016-06-04 18:23:09', 139);
INSERT INTO public.domestic_call VALUES (87519548963, 87395751914, '2010-09-17 23:13:49', '2021-01-09 16:27:57', 140);
INSERT INTO public.domestic_call VALUES (86454372876, 88874893105, '2005-09-02 01:10:38', '2010-10-20 04:37:47', 141);
INSERT INTO public.domestic_call VALUES (85776345759, 88874893105, '2008-08-10 00:18:18', '2014-03-23 21:33:54', 142);
INSERT INTO public.domestic_call VALUES (81302953924, 81525714909, '2012-06-27 15:33:33', '2019-04-29 16:41:38', 143);
INSERT INTO public.domestic_call VALUES (88100424189, 89605694853, '2004-09-13 05:21:27', '2017-11-14 15:27:58', 144);
INSERT INTO public.domestic_call VALUES (82775162263, 83164665019, '2016-09-14 09:13:57', '2020-06-03 15:41:00', 145);
INSERT INTO public.domestic_call VALUES (85740343388, 82717184948, '2011-06-19 19:00:14', '2019-08-28 15:33:13', 146);
INSERT INTO public.domestic_call VALUES (84225678530, 83774318368, '2016-08-14 02:48:38', '2022-04-28 06:01:44', 147);
INSERT INTO public.domestic_call VALUES (83466180292, 89730642391, '2007-06-01 21:20:01', '2007-09-02 16:32:49', 148);
INSERT INTO public.domestic_call VALUES (83059972930, 87127921928, '2012-11-24 18:22:32', '2015-01-16 20:08:11', 149);
INSERT INTO public.domestic_call VALUES (83696611934, 84548540986, '2000-02-24 06:47:14', '2004-10-10 01:00:34', 150);
INSERT INTO public.domestic_call VALUES (83122692480, 82540578006, '2002-08-28 01:58:25', '2022-04-18 17:04:04', 151);
INSERT INTO public.domestic_call VALUES (86516126911, 84182198979, '2018-11-19 17:15:34', '2021-06-10 10:14:57', 152);
INSERT INTO public.domestic_call VALUES (85954191509, 88874893105, '2000-03-29 05:18:55', '2007-06-16 12:02:40', 153);
INSERT INTO public.domestic_call VALUES (88488272568, 81341681439, '2010-04-23 18:56:26', '2014-06-07 19:27:20', 154);
INSERT INTO public.domestic_call VALUES (87787452739, 81690604571, '2001-11-30 12:04:34', '2014-11-19 03:01:45', 155);
INSERT INTO public.domestic_call VALUES (85781378133, 86128319451, '2008-05-30 14:20:16', '2018-10-10 00:35:59', 156);
INSERT INTO public.domestic_call VALUES (88760767898, 89844900220, '2010-02-23 13:56:36', '2018-12-17 15:22:30', 157);
INSERT INTO public.domestic_call VALUES (89415994601, 83939283170, '2005-05-28 05:40:37', '2014-12-27 02:33:13', 158);
INSERT INTO public.domestic_call VALUES (85629863837, 81918740958, '2007-03-14 01:24:48', '2011-08-31 08:37:08', 159);
INSERT INTO public.domestic_call VALUES (83283317638, 89567417811, '2006-10-13 00:06:59', '2009-10-20 01:53:34', 160);
INSERT INTO public.domestic_call VALUES (81952868284, 81351445183, '2016-11-08 10:39:16', '2018-01-18 22:45:38', 161);
INSERT INTO public.domestic_call VALUES (82248373078, 88063132062, '2006-06-19 23:39:15', '2023-06-24 15:29:39', 162);
INSERT INTO public.domestic_call VALUES (85820411012, 85162225551, '2012-04-20 08:39:22', '2016-09-14 07:31:51', 163);
INSERT INTO public.domestic_call VALUES (83323281695, 83231037288, '2001-01-17 03:30:57', '2009-12-06 22:31:05', 164);
INSERT INTO public.domestic_call VALUES (87499510751, 82010648116, '2004-02-14 09:11:51', '2017-10-01 18:36:48', 165);
INSERT INTO public.domestic_call VALUES (87475424808, 85390205129, '2008-01-11 21:06:40', '2013-11-10 15:43:26', 166);
INSERT INTO public.domestic_call VALUES (84299854086, 86813650741, '2000-05-20 13:44:24', '2012-03-29 00:06:27', 167);
INSERT INTO public.domestic_call VALUES (89049671254, 82514913257, '2012-05-11 19:20:15', '2014-05-06 12:17:38', 168);
INSERT INTO public.domestic_call VALUES (81551578401, 85896878969, '2004-07-28 06:01:49', '2023-02-25 14:31:33', 169);
INSERT INTO public.domestic_call VALUES (89043848596, 85794497850, '2006-07-06 07:49:55', '2021-09-30 20:50:21', 170);
INSERT INTO public.domestic_call VALUES (84957962227, 88354875145, '2008-03-23 01:30:53', '2023-04-23 00:18:23', 171);
INSERT INTO public.domestic_call VALUES (82103411090, 83162443692, '2004-11-23 15:42:08', '2022-03-10 15:46:49', 172);
INSERT INTO public.domestic_call VALUES (82387391239, 83495694331, '2019-04-09 05:44:11', '2019-08-12 23:25:04', 173);
INSERT INTO public.domestic_call VALUES (88850883235, 86329113206, '2004-03-01 17:12:08', '2010-06-16 10:32:20', 174);
INSERT INTO public.domestic_call VALUES (89478475851, 83939283170, '2019-02-04 10:20:59', '2019-03-04 12:31:02', 175);
INSERT INTO public.domestic_call VALUES (83574699724, 83367260233, '2001-09-21 12:47:27', '2008-11-13 17:42:15', 176);
INSERT INTO public.domestic_call VALUES (83795791449, 87850980321, '2013-08-14 10:10:11', '2018-12-01 17:37:29', 177);
INSERT INTO public.domestic_call VALUES (88740063945, 81272583628, '2008-12-12 18:58:00', '2023-08-26 13:18:53', 178);
INSERT INTO public.domestic_call VALUES (84684208959, 87207296042, '2018-10-04 12:35:03', '2020-03-31 15:08:15', 179);
INSERT INTO public.domestic_call VALUES (88260355133, 88686637097, '2010-03-23 07:48:21', '2012-05-05 09:54:01', 180);
INSERT INTO public.domestic_call VALUES (83804451257, 85181997756, '2001-08-21 05:39:32', '2019-11-24 09:30:40', 181);
INSERT INTO public.domestic_call VALUES (83104407686, 85922675734, '2010-08-10 21:30:00', '2020-06-11 21:42:38', 182);
INSERT INTO public.domestic_call VALUES (83478228294, 82514913257, '2016-02-01 01:59:07', '2017-11-21 06:48:47', 183);
INSERT INTO public.domestic_call VALUES (87452712644, 87850980321, '2012-06-24 19:09:40', '2016-07-12 06:20:20', 184);
INSERT INTO public.domestic_call VALUES (89883169542, 86451732519, '2010-02-05 11:00:31', '2017-08-14 17:05:03', 185);
INSERT INTO public.domestic_call VALUES (88662951373, 82651331557, '2006-10-12 17:06:37', '2012-01-06 21:54:38', 186);
INSERT INTO public.domestic_call VALUES (85977002595, 82717184948, '2010-08-13 03:32:32', '2011-03-11 18:30:42', 187);
INSERT INTO public.domestic_call VALUES (82623529297, 87972625997, '2005-12-27 17:08:39', '2006-10-06 22:57:59', 188);
INSERT INTO public.domestic_call VALUES (86143248723, 81341681439, '2004-08-16 20:35:41', '2011-05-15 21:17:41', 189);
INSERT INTO public.domestic_call VALUES (88125794548, 87127921928, '2005-02-13 23:52:31', '2017-06-10 23:46:53', 190);
INSERT INTO public.domestic_call VALUES (89415423323, 81290751976, '2003-10-29 03:51:21', '2012-08-02 07:37:39', 191);
INSERT INTO public.domestic_call VALUES (89246871095, 86948251411, '2014-05-24 11:14:04', '2016-05-13 03:32:46', 192);
INSERT INTO public.domestic_call VALUES (84557664220, 82884816243, '2007-08-31 10:16:29', '2017-05-01 02:32:27', 193);
INSERT INTO public.domestic_call VALUES (83833845987, 86948251411, '2015-02-12 10:21:40', '2018-01-19 00:01:31', 194);
INSERT INTO public.domestic_call VALUES (87939907162, 83253580355, '2001-11-19 05:58:30', '2012-03-19 21:28:33', 195);
INSERT INTO public.domestic_call VALUES (82453154633, 85411706214, '2005-01-12 02:15:38', '2006-09-04 05:52:27', 196);
INSERT INTO public.domestic_call VALUES (89768773631, 82651331557, '2005-06-12 17:14:15', '2011-01-08 23:35:24', 197);
INSERT INTO public.domestic_call VALUES (82393663629, 81351445183, '2001-03-15 09:01:07', '2007-01-23 02:23:58', 198);
INSERT INTO public.domestic_call VALUES (81755367593, 84445401791, '2001-05-12 00:08:53', '2020-09-03 11:48:18', 199);
INSERT INTO public.domestic_call VALUES (88491436033, 81834251955, '2020-01-03 05:19:21', '2021-08-16 08:12:31', 200);


--
-- TOC entry 3437 (class 0 OID 16512)
-- Dependencies: 214
-- Data for Name: external_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.external_service VALUES (1, '59,00 ?', 'Onto animal less open cut audience list. Walk raise why where summer agreement during record. Ability time tend win realize.', 'yearly');
INSERT INTO public.external_service VALUES (2, '71,00 ?', 'Research finally small green yeah sing. Approach stay daughter together suggest support speech. Toward develop generation.', 'weekly');
INSERT INTO public.external_service VALUES (3, '76,00 ?', 'Top determine artist blue tonight to state. Manage series successful long. Ability science research road kitchen class result.', 'weekly');
INSERT INTO public.external_service VALUES (4, '50,00 ?', 'Story history protect money my. Rise strong professor school civil choose. Follow agent sport.', 'weekly');
INSERT INTO public.external_service VALUES (5, '73,00 ?', 'To force go car.
Include civil develop lose recognize control news. Wide both way about different different.', 'yearly');
INSERT INTO public.external_service VALUES (6, '33,00 ?', 'Out design away notice authority through.
Good gun break here teacher apply. Process raise federal cut.', 'hourly');
INSERT INTO public.external_service VALUES (7, '33,00 ?', 'Brother offer same hot. Suggest growth series.
Join soldier career leader watch look all least. Event very begin account think. Court company indeed plant public.', 'yearly');
INSERT INTO public.external_service VALUES (8, '96,00 ?', 'Make stop of area clearly. Which spend try.
Happy lot left letter standard. Movement value after out bring.
Stand federal this. Past knowledge third spring.', 'monthly');
INSERT INTO public.external_service VALUES (9, '5,00 ?', 'Seven interview rather cold great. Reflect simple cut particularly special memory senior note.
Church democratic throughout. Court through benefit Mrs lot think main.', 'hourly');
INSERT INTO public.external_service VALUES (10, '100,00 ?', 'Stuff hour near center environment house. Fear whether anything. Environment hospital degree gas.
Church until against early. Those total seek crime. High ability head town level matter yeah bill.', 'hourly');
INSERT INTO public.external_service VALUES (11, '106,00 ?', 'Rest improve must capital politics number own use. Stop group leg sea per perhaps star. History machine body shake hot.
Choose poor thought song.', 'yearly');
INSERT INTO public.external_service VALUES (12, '18,00 ?', 'Husband accept light become station unit. Outside stand behind even bit blood system. Measure each experience set suddenly worker pressure institution.', 'hourly');
INSERT INTO public.external_service VALUES (13, '24,00 ?', 'Drop cause old huge gun. Service every law.
Part above human hold. Smile health measure majority reality score available decision.', 'yearly');
INSERT INTO public.external_service VALUES (14, '99,00 ?', 'Fast suddenly ball or form box. Act poor history charge I. Far wind even work age reveal ok.
Idea of third newspaper policy leave pass. Really popular pull various particular notice follow.', 'daily');
INSERT INTO public.external_service VALUES (15, '71,00 ?', 'Particular kind church attack back. Pass relationship decision bank clearly page stay move.', 'daily');
INSERT INTO public.external_service VALUES (16, '106,00 ?', 'Shake mean inside pattern. Answer think space staff try cost present.
Upon character degree child wind scientist than arrive.', 'yearly');
INSERT INTO public.external_service VALUES (17, '78,00 ?', 'Cut public become. Small type speech member cut play.
Name detail evidence. Bit care can.
Someone friend travel itself fall wish institution. Election fine though conference show. Law media work.', 'yearly');
INSERT INTO public.external_service VALUES (18, '49,00 ?', 'Hold yeah second strong medical world. Score series here information pay fly computer baby.', 'hourly');
INSERT INTO public.external_service VALUES (19, '88,00 ?', 'Plan network ball research. Prevent prepare technology time boy plant. Born on and star. Final exactly option right.
Source usually head game new special. Miss smile approach agency bad authority.', 'yearly');
INSERT INTO public.external_service VALUES (20, '31,00 ?', 'Yourself cause author stock. Team child attack attorney enjoy more throughout. There us change police involve section recent shoulder.', 'weekly');
INSERT INTO public.external_service VALUES (21, '6,00 ?', 'Star term billion forget way year. Become across front best yard it back.
Coach everyone ten.
High address will artist forward nice. Full successful service water team bill even eight.', 'daily');
INSERT INTO public.external_service VALUES (22, '47,00 ?', 'Bring entire similar list build.
Charge she democratic art product.
Arm want be. Development gas citizen public owner us protect. Start top Mrs. Bit exactly themselves officer.', 'yearly');
INSERT INTO public.external_service VALUES (23, '33,00 ?', 'Myself hospital board. Work without quickly pressure language visit.
Add admit meeting million actually. Claim open drive involve deal.', 'weekly');
INSERT INTO public.external_service VALUES (24, '29,00 ?', 'That must open ability understand behind. Contain cost edge stay. Center gun story message tax.
Begin even during our feeling few down. Behind with forget best.', 'hourly');
INSERT INTO public.external_service VALUES (25, '109,00 ?', 'Respond sing reveal dark mother involve. Whether tree really respond similar. Seem reach who rich admit realize.
Drug local child beat participant. Pattern model eat service door. Cover too these.', 'hourly');
INSERT INTO public.external_service VALUES (26, '52,00 ?', 'Argue reality identify reality civil. Than follow bar particularly trial last.
Gun majority thought. Imagine represent paper go wife some ready.', 'hourly');
INSERT INTO public.external_service VALUES (27, '84,00 ?', 'Those game billion set. Score treat food lot. Unit bed mission down not expect. Range management become rather current animal final away.', 'monthly');
INSERT INTO public.external_service VALUES (28, '19,00 ?', 'Since kid the style yourself brother. Impact whether challenge. Shoulder writer speak sport including town doctor resource. Mean hit watch win fear environment.
Fact answer go budget.', 'monthly');
INSERT INTO public.external_service VALUES (29, '105,00 ?', 'Serious tend event blood require serious. Voice pass color reflect defense pretty.
Call recent throughout ground.
Hit style identify population the. Environment stuff return foot suffer serve.', 'daily');
INSERT INTO public.external_service VALUES (30, '84,00 ?', 'Discuss performance include whose form. Beyond common see election get pressure eye.
Left someone such federal fast. Court democratic nearly rich business. Throw science specific their project.', 'yearly');
INSERT INTO public.external_service VALUES (31, '99,00 ?', 'Ability enough officer space rate. Great education concern.
Full forget red of enter PM fund. Three candidate chance reduce executive see.', 'weekly');
INSERT INTO public.external_service VALUES (32, '88,00 ?', 'Bag including well grow million drive name. Discuss training week very rest structure media measure.
List player hair good finally next south. Tax mean many college prove step rich.', 'yearly');
INSERT INTO public.external_service VALUES (33, '47,00 ?', 'Scientist into test with. Answer service enough make also conference. Line without important apply.
Environment professor thank program couple safe term.', 'hourly');
INSERT INTO public.external_service VALUES (34, '9,00 ?', 'Door none education agreement source relate mission. Task heavy local senior property.
Place discussion point respond. Must if keep relate.', 'monthly');
INSERT INTO public.external_service VALUES (35, '85,00 ?', 'Interesting nature whatever born against where. Citizen final discuss try. First side cut debate than. Listen recognize reveal eight.', 'monthly');
INSERT INTO public.external_service VALUES (36, '28,00 ?', 'Age team box model. Factor face grow to argue decide.
Site pull discuss explain. Allow approach baby bit work cost.', 'weekly');
INSERT INTO public.external_service VALUES (37, '104,00 ?', 'Happen above friend recognize left subject. Support least opportunity rise we how.
Girl coach attention what six.', 'monthly');
INSERT INTO public.external_service VALUES (38, '59,00 ?', 'Whatever class son through get. Amount day city before behavior live role simply.
Center contain particular beautiful. Number red may sing explain you finally. Physical moment draw lot occur.', 'daily');
INSERT INTO public.external_service VALUES (39, '22,00 ?', 'Who bar together management house. Result if she customer yeah. Suggest whose bank such happen hotel charge college. Quickly else agent democratic structure.', 'daily');
INSERT INTO public.external_service VALUES (40, '38,00 ?', 'Bring commercial wall paper carry very. Join dream rich population report. Could president seek improve. Interview range well my.', 'yearly');
INSERT INTO public.external_service VALUES (41, '25,00 ?', 'Growth partner significant relate. Exactly loss until whole many window. Character listen throughout sing recognize.
Laugh across fear will however. Painting call whose.', 'daily');
INSERT INTO public.external_service VALUES (42, '57,00 ?', 'Item care write. Nothing growth purpose century. Provide story involve study.
Traditional spring particular chance approach. Half the lead.', 'weekly');
INSERT INTO public.external_service VALUES (43, '88,00 ?', 'Often dinner small near sister stuff main. Recently then exactly turn least it range agent. Blood point practice seat develop.', 'hourly');
INSERT INTO public.external_service VALUES (44, '103,00 ?', 'Discuss if majority education television foreign analysis game.
Drive feel ten black impact next like. Agent today reality whom old. Leg glass bring must affect consumer its.', 'weekly');
INSERT INTO public.external_service VALUES (45, '76,00 ?', 'Community small song local. Black throughout indicate moment spend end. Big mind card close.
Animal hard American local clearly. Much wonder thus alone partner. Push life experience others window.', 'yearly');
INSERT INTO public.external_service VALUES (46, '82,00 ?', 'Democrat while phone wrong.
Smile will see friend government.
Call civil age authority cold wrong leader. Whose happen enter for. Every crime nearly voice.', 'yearly');
INSERT INTO public.external_service VALUES (47, '85,00 ?', 'Prevent machine interesting on production put. Former purpose pull probably.
All paper leave machine town fly style commercial. Check positive maintain concern small listen south.', 'yearly');
INSERT INTO public.external_service VALUES (48, '27,00 ?', 'Agency course group perform nearly TV team. Recognize kind provide hospital work film just plan.', 'daily');
INSERT INTO public.external_service VALUES (49, '74,00 ?', 'Property amount question raise something. State where tree sea board east. Glass pattern your one.
Argue development television skill family certain cultural. Hotel region past Mrs.', 'weekly');
INSERT INTO public.external_service VALUES (50, '95,00 ?', 'Group before both clear. Figure treat outside church cover least consider. Both room watch fast down explain.
Water policy resource operation kid determine. Drive we fly should actually government.', 'weekly');
INSERT INTO public.external_service VALUES (51, '47,00 ?', 'Together talk real sound west of safe avoid. Its include other color six perform difference be.', 'daily');
INSERT INTO public.external_service VALUES (52, '65,00 ?', 'Could think fine. Thousand challenge program first key fight.
Tree operation poor red. Exist wrong according buy.', 'hourly');
INSERT INTO public.external_service VALUES (53, '82,00 ?', 'Thousand weight new audience prove class subject. Claim society product husband hand which.
Season beyond natural certain teacher happen card. Keep form personal but.', 'hourly');
INSERT INTO public.external_service VALUES (54, '95,00 ?', 'Rise their money live. Senior almost cost week order difficult picture. Common much drop continue large whom.', 'daily');
INSERT INTO public.external_service VALUES (55, '52,00 ?', 'Indicate represent factor shake. Report article understand board.
Perhaps specific until what address dog mind. Administration operation fear entire radio old carry.', 'daily');
INSERT INTO public.external_service VALUES (56, '39,00 ?', 'Single interest want fast affect name. Produce age simple early eye interest base bank.', 'monthly');
INSERT INTO public.external_service VALUES (57, '9,00 ?', 'Perform political improve. Pass quality true space feel.
Finish main while in. Suggest such billion. Popular indeed of.
Everyone ready theory little. Despite sell central tree property wonder tax.', 'monthly');
INSERT INTO public.external_service VALUES (58, '11,00 ?', 'Black parent get year home economy. Authority pressure argue about. Official read write paper series.
Read that card receive them. Stage economy charge buy push structure half happy.', 'hourly');
INSERT INTO public.external_service VALUES (59, '63,00 ?', 'Fly couple what spend expect structure try group. Life sign edge condition.
Inside body machine walk be. Difference key reality deal worker.', 'monthly');
INSERT INTO public.external_service VALUES (60, '18,00 ?', 'Daughter relationship north because gas call. Help move world rate seven because point let. Positive look poor audience age watch.
Process country address well its leader process.', 'monthly');
INSERT INTO public.external_service VALUES (61, '40,00 ?', 'Year wife scientist lawyer reach. Big Republican few money perform range. Scene dark should friend face chance.', 'hourly');
INSERT INTO public.external_service VALUES (62, '76,00 ?', 'Feeling white respond spring. Tv probably blood else or heart. Benefit because company task station.
Still quality speak. Such painting make scene to model.', 'daily');
INSERT INTO public.external_service VALUES (63, '26,00 ?', 'Traditional travel trial end already. Light join low. Cover choice pay phone national them structure week.', 'monthly');
INSERT INTO public.external_service VALUES (64, '24,00 ?', 'School hear certain store imagine before physical. Their significant have best create visit science prepare.', 'daily');
INSERT INTO public.external_service VALUES (65, '91,00 ?', 'Cost deal worry her senior. Firm hour have executive behind travel.
Financial ahead listen after improve effect offer present. Low fly drop risk success us wish entire.', 'weekly');
INSERT INTO public.external_service VALUES (66, '4,00 ?', 'Simple others serious begin same possible. Reality paper consumer.
Population however environment program need per morning.', 'daily');
INSERT INTO public.external_service VALUES (67, '33,00 ?', 'Many relationship others late not low none. Training woman need work process sign necessary.
Inside reflect eight science may family indeed. A this our among. Though art per manage sea single senior.', 'yearly');
INSERT INTO public.external_service VALUES (68, '28,00 ?', 'Design between miss history. Law food prove. North bad dark myself.
Coach story back specific exactly point ask themselves. Nature husband decide anything. Land everyone travel player.', 'yearly');
INSERT INTO public.external_service VALUES (69, '70,00 ?', 'Color apply eat nature happen. Paper mouth claim leg expert carry. Owner oil offer toward compare never sometimes.', 'daily');
INSERT INTO public.external_service VALUES (70, '82,00 ?', 'Dinner myself article TV time about manage.
Still stand though company focus identify people movement. Admit onto former middle. Yeah ahead my painting exist.', 'monthly');
INSERT INTO public.external_service VALUES (71, '89,00 ?', 'Another loss nothing significant interesting spend partner. Court many face road nearly. Baby green need window memory.', 'yearly');
INSERT INTO public.external_service VALUES (72, '37,00 ?', 'Girl to east of off. Own threat work ten. Cover return key card how number.
Mission use people so customer race no. Plan officer avoid ground might support day.', 'hourly');
INSERT INTO public.external_service VALUES (73, '110,00 ?', 'Set whatever education matter about. War admit board garden return song energy. My stay modern price of movie garden.', 'yearly');
INSERT INTO public.external_service VALUES (74, '80,00 ?', 'Economic leave adult arm main no expect go. Already rule learn think south too. Probably current consider final hand perhaps business enter. Class suggest action happen enter trade.', 'weekly');
INSERT INTO public.external_service VALUES (75, '56,00 ?', 'Help like field only TV. Item pressure well into. Though enjoy west coach financial.
Ten last blue provide. Popular name up black itself else. Seat or born.', 'hourly');
INSERT INTO public.external_service VALUES (76, '23,00 ?', 'Three style view individual rest suggest step suggest. Think girl someone reach whole. Catch crime common finish name able happen.
Right large produce officer. Even parent really our ask continue.', 'daily');
INSERT INTO public.external_service VALUES (77, '12,00 ?', 'Lot ok threat. Happy represent nothing heart social. Purpose necessary foot from probably us themselves.
American everyone world exist allow. Key land various box change bring.', 'yearly');
INSERT INTO public.external_service VALUES (78, '62,00 ?', 'Thousand forward hand pressure heavy. New foot certain body peace happy. Option crime environment ready serve some. Meet movie fill build political fine.', 'yearly');
INSERT INTO public.external_service VALUES (79, '55,00 ?', 'Behavior positive story region. Seek degree citizen result foreign leader.
Expert writer likely window three list woman available. Contain cultural doctor.', 'monthly');
INSERT INTO public.external_service VALUES (80, '78,00 ?', 'Catch feel nothing direction among she real.
Military town kitchen democratic standard soon add. Fish record yeah may clearly. Scene maintain more price magazine.', 'weekly');
INSERT INTO public.external_service VALUES (81, '60,00 ?', 'Eat read reach support true together.
Family again later music. Carry memory career become those radio. Test bed nature much.
Loss keep whole partner tell. Since information watch into less task.', 'hourly');
INSERT INTO public.external_service VALUES (82, '6,00 ?', 'Budget likely three player. Bad security note Congress forward radio report not. Stand international program chair expert career enough.', 'daily');
INSERT INTO public.external_service VALUES (83, '49,00 ?', 'Region in single official. Drive thousand know anyone lay drug bring. Model thank like town.', 'hourly');
INSERT INTO public.external_service VALUES (84, '16,00 ?', 'Million manage interview staff particular open ever. Commercial mission blue. Person space star image laugh soldier grow.
Outside almost travel station field there discover.', 'daily');
INSERT INTO public.external_service VALUES (85, '6,00 ?', 'Life many movie attack everybody each.
Kitchen deal stand time fine also degree. Similar past issue accept. Grow well political each improve big.', 'daily');
INSERT INTO public.external_service VALUES (86, '27,00 ?', 'Describe officer major inside plan conference. Single common impact continue.
Job painting talk late stop yourself rule citizen. Central anything network show.', 'hourly');
INSERT INTO public.external_service VALUES (87, '50,00 ?', 'History many beautiful several page weight amount. Else ability staff quite. Beyond individual amount contain.', 'monthly');
INSERT INTO public.external_service VALUES (88, '22,00 ?', 'Line because down strong charge send. Both prepare bag think. During people turn statement people vote continue.', 'monthly');
INSERT INTO public.external_service VALUES (89, '93,00 ?', 'First modern management fish relate capital sound teach. Pick miss second job week black.', 'daily');
INSERT INTO public.external_service VALUES (90, '104,00 ?', 'Shake see large difficult. Color threat whole above local. Yeah why reality country data year blue.', 'monthly');
INSERT INTO public.external_service VALUES (91, '100,00 ?', 'Not line actually his consider staff school. Attention defense hour force. Yard south adult science. Occur mention expect take the.', 'hourly');
INSERT INTO public.external_service VALUES (92, '57,00 ?', 'Through same hour floor. Source store our crime matter. Cost history reality former.
Somebody young writer bit fish able. Challenge lead great.', 'hourly');
INSERT INTO public.external_service VALUES (93, '80,00 ?', 'Behavior himself indeed recent. Read follow international hour act. Movement course development third.
Tend wish nearly management. Bag official majority side central also.', 'monthly');
INSERT INTO public.external_service VALUES (94, '84,00 ?', 'Official discuss move far option task. Religious direction animal contain now.
Ready above actually sure. Hear traditional either member new. Record no price now experience.', 'daily');
INSERT INTO public.external_service VALUES (95, '87,00 ?', 'Form exactly meet cold enjoy.
Score floor theory. Use watch expert kid. Service list vote establish.', 'daily');
INSERT INTO public.external_service VALUES (96, '99,00 ?', 'Trade rise I reveal I. All speech senior far.
Project west effort.
Condition its bit put deal here. Firm nation ok receive nothing know.', 'hourly');
INSERT INTO public.external_service VALUES (97, '24,00 ?', 'Blue art article material newspaper. Eye blue peace front during us entire. It ahead control hold.
Other inside loss. Send wrong production. Mrs address matter behavior.', 'weekly');
INSERT INTO public.external_service VALUES (98, '29,00 ?', 'Step last organization decide. Hour public night defense whose recent fight.
Modern language personal seem. Account team pretty strategy collection media.', 'hourly');
INSERT INTO public.external_service VALUES (99, '93,00 ?', 'Against single trouble human agree. Agreement specific benefit peace market him discuss interview.
Speech finish blue once move moment.', 'hourly');
INSERT INTO public.external_service VALUES (100, '85,00 ?', 'Imagine turn understand lay born top with. College consumer fast response direction. Light light water look order gun stop maintain.', 'yearly');
INSERT INTO public.external_service VALUES (101, '95,00 ?', 'Fund performance region ten once north just. Speak garden fact field information within.
Customer up sport. Upon above every debate. Song television style offer per learn and.', 'hourly');
INSERT INTO public.external_service VALUES (102, '106,00 ?', 'Part own country color. Design one information fall. No data represent six describe property serve.
Owner opportunity eye laugh blue. May scene personal end over audience. Hair speech value.', 'yearly');
INSERT INTO public.external_service VALUES (103, '46,00 ?', 'Employee indicate allow have. Allow interesting many career bed second thought both. Image pretty image ball very. Hard message hour speech stop believe.', 'daily');
INSERT INTO public.external_service VALUES (104, '110,00 ?', 'Ask knowledge statement we attention.
Thought as cultural soon. National card institution generation very. Budget wish bad really use.', 'weekly');
INSERT INTO public.external_service VALUES (105, '6,00 ?', 'Head tell north instead Republican. Support child floor. Concern central miss oil deal woman.
Receive what population everyone case. Address man unit his health.', 'weekly');
INSERT INTO public.external_service VALUES (106, '23,00 ?', 'Will price near others which. Mind determine authority relate happen. Call knowledge gun skin hundred. Concern memory write structure interview memory.', 'daily');
INSERT INTO public.external_service VALUES (107, '97,00 ?', 'Find more stuff. Girl difference wife large theory certain. Property cold difference voice source. By leg pass it.
Draw upon through with among agent woman everything.', 'weekly');
INSERT INTO public.external_service VALUES (108, '28,00 ?', 'Into want institution important election determine much. Human must several event shake source lot.', 'weekly');
INSERT INTO public.external_service VALUES (109, '70,00 ?', 'Network this can wind week.
Senior manager reduce still way. Whole building try weight movement bed seek during. Should base collection line young leave market.', 'yearly');
INSERT INTO public.external_service VALUES (110, '56,00 ?', 'Room surface partner upon. Consumer have allow do write thing. Personal choose hundred seat section catch administration.', 'hourly');
INSERT INTO public.external_service VALUES (111, '75,00 ?', 'Data be prove property. Girl seven treatment local chair. Along turn voice continue major fine. Travel seat rock possible.
Student ok to which. A environment drive guy.', 'daily');
INSERT INTO public.external_service VALUES (112, '69,00 ?', 'Yourself president air involve. Easy history on hospital southern.
Reality be doctor tonight game form it method. Provide pull those worry strong section. Right its girl million strategy.', 'yearly');
INSERT INTO public.external_service VALUES (113, '35,00 ?', 'For dinner chance friend debate apply. Wish both your adult quite player.
Leg five enter back along change generation authority.', 'yearly');
INSERT INTO public.external_service VALUES (114, '55,00 ?', 'Later including responsibility language public material. Ability meeting you how weight wide look.', 'weekly');
INSERT INTO public.external_service VALUES (115, '27,00 ?', 'Behavior couple agree size social energy. Eat per those century view laugh produce above. Director be still Mr house page ever.', 'hourly');
INSERT INTO public.external_service VALUES (116, '97,00 ?', 'Buy spend dinner than structure upon yard. However whole can cause movement learn art line. Someone meet administration recently evidence view central.', 'daily');
INSERT INTO public.external_service VALUES (117, '86,00 ?', 'Someone their thought once modern. Four wait than professor this knowledge simple. Letter when argue after sometimes.
Floor fact support always explain.', 'monthly');
INSERT INTO public.external_service VALUES (118, '76,00 ?', 'Deep soon past end turn kind.
Quite chance become take there. Magazine fact table myself somebody dog.', 'yearly');
INSERT INTO public.external_service VALUES (119, '78,00 ?', 'Issue serious challenge tell win pass property. Benefit keep one. Four little great avoid visit him.
Around contain sea Mrs. Third second say item these course. Bed human sing yeah as be.', 'yearly');
INSERT INTO public.external_service VALUES (120, '72,00 ?', 'Discover ten fight voice plan nearly ten. Than set beat admit. Player which most suddenly. Edge section assume yeah can.
Job when every wife explain per. Western seek shoulder these south free.', 'weekly');


--
-- TOC entry 3454 (class 0 OID 16642)
-- Dependencies: 231
-- Data for Name: external_service_inclusion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.external_service_inclusion VALUES (8, 88063132062, '2017-12-26', '2019-07-03', 1);
INSERT INTO public.external_service_inclusion VALUES (10, 85126663834, '2010-09-07', '2012-07-24', 2);
INSERT INTO public.external_service_inclusion VALUES (56, 88686637097, '2015-11-08', '2017-10-04', 3);
INSERT INTO public.external_service_inclusion VALUES (47, 87972625997, '2008-07-22', '2023-10-10', 4);
INSERT INTO public.external_service_inclusion VALUES (16, 83367260233, '2005-07-13', '2022-08-30', 5);
INSERT INTO public.external_service_inclusion VALUES (24, 87207296042, '2013-05-16', '2015-10-30', 6);
INSERT INTO public.external_service_inclusion VALUES (2, 81651408391, '2012-07-18', '2022-06-19', 7);
INSERT INTO public.external_service_inclusion VALUES (11, 86982112923, '2012-12-29', '2017-04-07', 8);
INSERT INTO public.external_service_inclusion VALUES (46, 87312837291, '2015-02-20', '2016-11-30', 9);
INSERT INTO public.external_service_inclusion VALUES (7, 82884816243, '2012-02-21', '2019-11-03', 10);
INSERT INTO public.external_service_inclusion VALUES (31, 81290751976, '2004-09-30', '2008-05-28', 11);
INSERT INTO public.external_service_inclusion VALUES (5, 85162225551, '2000-01-29', '2007-09-25', 12);
INSERT INTO public.external_service_inclusion VALUES (58, 83939283170, '2009-01-01', '2022-11-13', 13);
INSERT INTO public.external_service_inclusion VALUES (40, 86982112923, '2017-07-02', '2018-03-10', 14);
INSERT INTO public.external_service_inclusion VALUES (23, 85896878969, '2002-07-01', '2020-05-02', 15);
INSERT INTO public.external_service_inclusion VALUES (33, 89909942854, '2011-02-02', '2022-06-03', 16);
INSERT INTO public.external_service_inclusion VALUES (1, 89478225634, '2014-07-18', '2018-01-31', 17);
INSERT INTO public.external_service_inclusion VALUES (21, 82540578006, '2000-07-26', '2016-04-21', 18);
INSERT INTO public.external_service_inclusion VALUES (28, 89567417811, '2000-12-16', '2009-06-29', 19);
INSERT INTO public.external_service_inclusion VALUES (50, 83039121686, '2002-10-14', '2020-12-24', 20);
INSERT INTO public.external_service_inclusion VALUES (47, 84608960717, '2000-02-16', '2013-04-05', 21);
INSERT INTO public.external_service_inclusion VALUES (46, 87816542499, '2010-04-17', '2010-07-15', 22);
INSERT INTO public.external_service_inclusion VALUES (17, 86948251411, '2005-07-15', '2023-08-24', 23);
INSERT INTO public.external_service_inclusion VALUES (43, 86128319451, '2009-07-18', '2015-04-16', 24);
INSERT INTO public.external_service_inclusion VALUES (51, 87141610652, '2007-02-06', '2009-05-06', 25);
INSERT INTO public.external_service_inclusion VALUES (24, 83630038004, '2000-07-01', '2021-11-13', 26);
INSERT INTO public.external_service_inclusion VALUES (51, 89844900220, '2007-06-05', '2022-09-19', 27);
INSERT INTO public.external_service_inclusion VALUES (44, 85937533879, '2005-02-26', '2006-01-11', 28);
INSERT INTO public.external_service_inclusion VALUES (54, 83495694331, '2011-11-26', '2020-11-27', 29);
INSERT INTO public.external_service_inclusion VALUES (54, 88874893105, '2001-03-05', '2016-04-14', 30);
INSERT INTO public.external_service_inclusion VALUES (11, 86128319451, '2012-10-01', '2022-03-06', 31);
INSERT INTO public.external_service_inclusion VALUES (30, 87395751914, '2004-09-13', '2019-02-11', 32);
INSERT INTO public.external_service_inclusion VALUES (53, 81193274375, '2002-09-01', '2014-06-09', 33);
INSERT INTO public.external_service_inclusion VALUES (24, 87816542499, '2003-11-16', '2004-06-03', 34);
INSERT INTO public.external_service_inclusion VALUES (36, 87127921928, '2006-02-27', '2023-11-02', 35);
INSERT INTO public.external_service_inclusion VALUES (24, 85922675734, '2003-04-18', '2020-01-13', 36);
INSERT INTO public.external_service_inclusion VALUES (54, 87207296042, '2016-10-04', '2019-01-24', 37);
INSERT INTO public.external_service_inclusion VALUES (42, 81690604571, '2007-12-07', '2011-05-10', 38);
INSERT INTO public.external_service_inclusion VALUES (21, 87141610652, '2016-07-06', '2023-08-05', 39);
INSERT INTO public.external_service_inclusion VALUES (27, 86256652966, '2008-11-16', '2013-04-27', 40);
INSERT INTO public.external_service_inclusion VALUES (50, 88686637097, '2012-07-12', '2020-01-19', 41);
INSERT INTO public.external_service_inclusion VALUES (27, 85162225551, '2004-11-08', '2009-12-24', 42);
INSERT INTO public.external_service_inclusion VALUES (53, 82651331557, '2013-09-28', '2018-07-21', 43);
INSERT INTO public.external_service_inclusion VALUES (60, 88354875145, '2000-06-19', '2011-09-25', 44);
INSERT INTO public.external_service_inclusion VALUES (29, 85014001547, '2014-09-13', '2023-11-13', 45);
INSERT INTO public.external_service_inclusion VALUES (28, 82453780011, '2004-07-18', '2010-06-09', 46);
INSERT INTO public.external_service_inclusion VALUES (47, 81918740958, '2005-02-02', '2023-08-17', 47);
INSERT INTO public.external_service_inclusion VALUES (55, 83744171916, '2002-07-29', '2010-07-04', 48);
INSERT INTO public.external_service_inclusion VALUES (60, 87716726601, '2005-07-01', '2016-12-07', 49);
INSERT INTO public.external_service_inclusion VALUES (59, 86128319451, '2013-05-28', '2019-11-10', 50);
INSERT INTO public.external_service_inclusion VALUES (57, 84157873461, '2007-02-06', '2022-12-12', 51);
INSERT INTO public.external_service_inclusion VALUES (9, 86451732519, '2010-10-13', '2023-04-13', 52);
INSERT INTO public.external_service_inclusion VALUES (31, 88874893105, '2005-12-27', '2011-06-24', 53);
INSERT INTO public.external_service_inclusion VALUES (23, 84445401791, '2009-11-21', '2023-07-02', 54);
INSERT INTO public.external_service_inclusion VALUES (29, 82514913257, '2005-02-07', '2012-01-25', 55);
INSERT INTO public.external_service_inclusion VALUES (46, 89167792152, '2001-01-06', '2009-04-23', 56);
INSERT INTO public.external_service_inclusion VALUES (58, 88063132062, '2002-03-07', '2014-10-04', 57);
INSERT INTO public.external_service_inclusion VALUES (55, 89931173404, '2004-05-03', '2015-12-04', 58);
INSERT INTO public.external_service_inclusion VALUES (47, 82884816243, '2003-07-20', '2022-12-13', 59);
INSERT INTO public.external_service_inclusion VALUES (30, 84548540986, '2004-01-21', '2008-05-09', 60);
INSERT INTO public.external_service_inclusion VALUES (43, 86813650741, '2009-04-21', '2023-04-21', 61);
INSERT INTO public.external_service_inclusion VALUES (31, 86813650741, '2018-12-16', '2021-09-20', 62);
INSERT INTO public.external_service_inclusion VALUES (10, 83630038004, '2018-11-10', '2020-08-07', 63);
INSERT INTO public.external_service_inclusion VALUES (29, 87972625997, '2003-06-29', '2018-12-13', 64);
INSERT INTO public.external_service_inclusion VALUES (36, 83774318368, '2012-10-09', '2012-10-24', 65);
INSERT INTO public.external_service_inclusion VALUES (8, 87816542499, '2014-10-09', '2020-03-18', 66);
INSERT INTO public.external_service_inclusion VALUES (49, 83367260233, '2006-05-13', '2016-02-22', 67);
INSERT INTO public.external_service_inclusion VALUES (55, 82884816243, '2002-02-19', '2005-06-01', 68);
INSERT INTO public.external_service_inclusion VALUES (11, 88686637097, '2009-12-26', '2014-12-24', 69);
INSERT INTO public.external_service_inclusion VALUES (27, 89730642391, '2007-11-06', '2007-12-27', 70);
INSERT INTO public.external_service_inclusion VALUES (35, 85014001547, '2013-12-29', '2021-11-09', 71);
INSERT INTO public.external_service_inclusion VALUES (53, 81351445183, '2003-08-11', '2018-12-20', 72);
INSERT INTO public.external_service_inclusion VALUES (56, 83164665019, '2003-11-22', '2007-03-07', 73);
INSERT INTO public.external_service_inclusion VALUES (55, 85126663834, '2003-09-28', '2014-09-23', 74);
INSERT INTO public.external_service_inclusion VALUES (38, 87716726601, '2005-08-24', '2012-05-06', 75);
INSERT INTO public.external_service_inclusion VALUES (21, 86017927001, '2001-06-11', '2015-09-15', 76);
INSERT INTO public.external_service_inclusion VALUES (9, 84182198979, '2011-01-11', '2019-11-05', 77);
INSERT INTO public.external_service_inclusion VALUES (37, 85181997756, '2004-02-17', '2008-09-02', 78);
INSERT INTO public.external_service_inclusion VALUES (42, 81918740958, '2015-10-28', '2015-12-20', 79);
INSERT INTO public.external_service_inclusion VALUES (41, 83630038004, '2000-08-12', '2010-09-06', 80);
INSERT INTO public.external_service_inclusion VALUES (38, 83495694331, '2010-03-01', '2014-08-16', 81);
INSERT INTO public.external_service_inclusion VALUES (46, 89931173404, '2003-09-10', '2016-02-05', 82);
INSERT INTO public.external_service_inclusion VALUES (31, 83744171916, '2008-05-30', '2014-03-30', 83);
INSERT INTO public.external_service_inclusion VALUES (29, 88063132062, '2009-04-23', '2009-05-15', 84);
INSERT INTO public.external_service_inclusion VALUES (18, 86970918258, '2011-08-16', '2017-03-10', 85);
INSERT INTO public.external_service_inclusion VALUES (56, 89605694853, '2004-03-26', '2004-06-16', 86);
INSERT INTO public.external_service_inclusion VALUES (28, 81393324182, '2001-04-04', '2022-03-19', 87);
INSERT INTO public.external_service_inclusion VALUES (45, 82884816243, '2020-06-17', '2023-03-12', 88);
INSERT INTO public.external_service_inclusion VALUES (48, 87141610652, '2007-05-11', '2023-01-06', 89);
INSERT INTO public.external_service_inclusion VALUES (51, 87207296042, '2012-04-15', '2021-08-23', 90);
INSERT INTO public.external_service_inclusion VALUES (42, 82010648116, '2013-01-21', '2017-08-12', 91);
INSERT INTO public.external_service_inclusion VALUES (58, 81281718689, '2015-07-10', '2018-06-26', 92);
INSERT INTO public.external_service_inclusion VALUES (20, 84608960717, '2013-08-02', '2017-03-17', 93);
INSERT INTO public.external_service_inclusion VALUES (23, 87308609495, '2005-01-12', '2011-08-30', 94);
INSERT INTO public.external_service_inclusion VALUES (28, 87395751914, '2005-04-28', '2012-06-27', 95);
INSERT INTO public.external_service_inclusion VALUES (23, 87816542499, '2002-08-25', '2022-08-02', 96);
INSERT INTO public.external_service_inclusion VALUES (13, 87293111316, '2007-07-15', '2019-12-01', 97);
INSERT INTO public.external_service_inclusion VALUES (15, 86813650741, '2003-09-04', '2004-06-29', 98);
INSERT INTO public.external_service_inclusion VALUES (21, 83367260233, '2001-04-26', '2004-06-06', 99);
INSERT INTO public.external_service_inclusion VALUES (34, 86813650741, '2023-06-26', '2023-12-04', 100);


--
-- TOC entry 3435 (class 0 OID 16492)
-- Dependencies: 212
-- Data for Name: internal_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.internal_service VALUES (1, '38,00 ?', 'Upon rest authority carry any up all. Down moment artist staff.
Agree program reduce skin. Media campaign detail federal nice. Argue act million treat decision short surface.', 'hourly');
INSERT INTO public.internal_service VALUES (2, '49,00 ?', 'Outside account go property article. Happen final born affect. Learn like fire quickly.
Time key thus defense according. Away weight present bed establish race stock.', 'hourly');
INSERT INTO public.internal_service VALUES (3, '99,00 ?', 'Itself recent make in whether spend. Travel hard owner model cause will. Mean shoulder rise international as trip operation. Key if experience.', 'hourly');
INSERT INTO public.internal_service VALUES (4, '84,00 ?', 'Carry help line just stay one. Especially rise well idea.
Wonder its policy but. Threat role practice over. Catch let forward chance parent attack.', 'hourly');
INSERT INTO public.internal_service VALUES (5, '22,00 ?', 'With democratic ok detail suffer new item break. Store must record. Fight catch run century environment.
Then month beat. Receive movie after bed participant network range.', 'daily');
INSERT INTO public.internal_service VALUES (6, '108,00 ?', 'Physical cause fill notice huge tonight dinner the. Detail capital war organization. Shake gun leader court authority.
Something thank dog difficult machine side. Character drug senior most.', 'weekly');
INSERT INTO public.internal_service VALUES (7, '94,00 ?', 'Police meeting include back pay out.
Strong relationship reach response we place. Usually upon who ago.
Enough foreign truth computer son. Personal maybe fill many.', 'monthly');
INSERT INTO public.internal_service VALUES (8, '42,00 ?', 'South positive mean oil adult generation significant.
News either air easy. Before our trouble raise. Analysis group environment although scene.', 'weekly');
INSERT INTO public.internal_service VALUES (9, '77,00 ?', 'So want choose forget. When TV for simple benefit camera. Employee follow tough half upon. Agree foot partner brother reason sing pull.', 'daily');
INSERT INTO public.internal_service VALUES (10, '94,00 ?', 'Edge because serious forward born happen everything. Box event per budget argue station.', 'daily');
INSERT INTO public.internal_service VALUES (11, '107,00 ?', 'Street design order memory. Dream collection person western author college.
Cultural information town. Personal dream history article. Seem price every than minute.', 'daily');
INSERT INTO public.internal_service VALUES (12, '4,00 ?', 'Training term serious each. Crime six skin second campaign serious. Activity the generation though especially.
Red focus change animal. Card possible read when. Dog walk truth worker tough new grow.', 'weekly');
INSERT INTO public.internal_service VALUES (13, '42,00 ?', 'West national direction street wonder. Including plan above industry them clear suddenly.', 'monthly');
INSERT INTO public.internal_service VALUES (14, '27,00 ?', 'Role clear cover. Hand democratic house arm citizen notice.
Official nearly eye part least mention. Success plant author tend most health. Person option method.', 'yearly');
INSERT INTO public.internal_service VALUES (15, '85,00 ?', 'Apply yourself discussion last development activity idea. Strong husband much determine. Point relationship bank role shoulder.', 'hourly');
INSERT INTO public.internal_service VALUES (16, '8,00 ?', 'Perform argue produce these. Attack world commercial point long. Staff worry indeed Democrat join mention successful.
Attention real will war. Nor place term today sister.', 'monthly');
INSERT INTO public.internal_service VALUES (17, '66,00 ?', 'Key ten beyond degree every. Prepare night between statement. Education oil often loss suggest top discover. Value professional smile onto few data.', 'weekly');
INSERT INTO public.internal_service VALUES (18, '6,00 ?', 'See none adult deep poor. Health represent floor resource with member.
Training subject market mean reveal. Pull follow require red than story feeling including.', 'hourly');
INSERT INTO public.internal_service VALUES (19, '12,00 ?', 'Hair personal smile develop recognize score. Politics most least product firm. Ability after deal. Bag task sure dog west enough.', 'monthly');
INSERT INTO public.internal_service VALUES (20, '54,00 ?', 'Pretty fill former college region PM mother between. Risk short technology thought.', 'yearly');
INSERT INTO public.internal_service VALUES (21, '75,00 ?', 'Reflect relate mission.
Account coach example hear share yourself soon. Exactly life reflect six year window.
East woman main smile. Business let investment.', 'weekly');
INSERT INTO public.internal_service VALUES (22, '108,00 ?', 'Offer skill story yeah such speech. Law Congress consumer cost wrong drop world.', 'monthly');
INSERT INTO public.internal_service VALUES (23, '28,00 ?', 'Story people factor deep. Treat view consider new laugh.', 'hourly');
INSERT INTO public.internal_service VALUES (24, '45,00 ?', 'As prevent impact more picture form happy rate. Decade around piece former. Drive building teacher anyone task series condition.', 'daily');
INSERT INTO public.internal_service VALUES (25, '20,00 ?', 'What technology more artist entire finish. Catch yourself change reach guess.
Would trial girl inside hospital. Trial certainly my front mind technology future.', 'monthly');
INSERT INTO public.internal_service VALUES (26, '50,00 ?', 'Car should away sense. Receive perhaps whether stay leader respond.
Admit so rich perform offer economic top project. Operation personal parent hear name box. Claim such power expect ability.', 'monthly');
INSERT INTO public.internal_service VALUES (27, '57,00 ?', 'Player far bag take join.
Argue where rock would mother soldier full give. Back car wall seven upon share safe then. Quickly shake book will well hundred word.', 'daily');
INSERT INTO public.internal_service VALUES (28, '96,00 ?', 'Together somebody everybody ability meet trade. Indicate institution list station senior anyone hot.', 'weekly');
INSERT INTO public.internal_service VALUES (29, '90,00 ?', 'Yet safe different outside race institution. Effect determine more pattern state.
Strong result form keep make prepare. Debate bed job billion.', 'yearly');
INSERT INTO public.internal_service VALUES (30, '24,00 ?', 'Central radio already show. Various need perform drive loss actually turn mean. Here successful audience attention member remember.', 'hourly');
INSERT INTO public.internal_service VALUES (31, '42,00 ?', 'Go kid manage section. Bad say later. School different race leader president general.
Account focus agency. Difference writer question point region improve life. Defense east a maybe.', 'monthly');
INSERT INTO public.internal_service VALUES (32, '10,00 ?', 'Either during fish up put. Under hot make both institution tax either. Leave military his near coach.
Power unit someone lay. Who environment free newspaper worry.', 'hourly');
INSERT INTO public.internal_service VALUES (33, '27,00 ?', 'Big each not give rule. Voice write on size real tell. What authority clearly support across onto.', 'daily');
INSERT INTO public.internal_service VALUES (34, '108,00 ?', 'Fast film mother player article husband. Discuss improve think interest rock cell sure.', 'yearly');
INSERT INTO public.internal_service VALUES (35, '73,00 ?', 'Seek Mr there safe draw drop father. Sometimes never still new without.
Week across article such. Training big myself interesting onto least resource. Range organization on measure old glass.', 'hourly');
INSERT INTO public.internal_service VALUES (36, '56,00 ?', 'No movie almost example. Save most field professional individual its fight act. Continue expect student test listen.
Most as read fear speak. Pretty case interesting.', 'hourly');
INSERT INTO public.internal_service VALUES (37, '109,00 ?', 'Off administration rich. Concern action boy statement. Decade large serve during standard read.
Officer heavy man Mr. Attorney control indeed give. Other instead several example one find.', 'yearly');
INSERT INTO public.internal_service VALUES (38, '35,00 ?', 'More level claim produce teach.
Should boy service loss. Security education world page accept. Across or cost.', 'weekly');
INSERT INTO public.internal_service VALUES (39, '21,00 ?', 'Bill similar decision future east talk then rather. Identify read security point.
Raise early from according pass century institution stock. Glass audience where figure move decade. Me peace travel.', 'daily');
INSERT INTO public.internal_service VALUES (40, '5,00 ?', 'Short party former skin. Best ball charge director mouth avoid meeting. Through section way sport.
Police note management. Military call food car. Sea keep idea describe east light body.', 'daily');
INSERT INTO public.internal_service VALUES (41, '56,00 ?', 'Clear full last who.
Single stand would any sound professional. Lead bank player hear account less. One long sort full court.
A society business score town. Who oil research quite nature force.', 'yearly');
INSERT INTO public.internal_service VALUES (42, '108,00 ?', 'Growth produce authority rock top. Local account energy start.
Area state and article board. Political husband order. Yes improve surface father. Day development eat base billion.', 'weekly');
INSERT INTO public.internal_service VALUES (43, '10,00 ?', 'Network player country career. Course run choice true.
Number work well treatment. Class risk beat property analysis like blue.
Because TV deal impact. Professional woman yeah practice deep line lay.', 'monthly');
INSERT INTO public.internal_service VALUES (44, '107,00 ?', 'Hour similar list interview.
Growth wife explain right do. Too impact sure game market according. But church station price pressure service.
Area participant mouth many else movie police.', 'weekly');
INSERT INTO public.internal_service VALUES (45, '15,00 ?', 'Watch start team commercial name range prepare. Follow ask so.
Foot writer data shake treat professional world. Produce drug deal expert end century.', 'monthly');
INSERT INTO public.internal_service VALUES (46, '38,00 ?', 'Dog century onto choice have pick others. Stop laugh suggest.
Southern billion computer suggest meet capital. Day reach new owner. Event beautiful party because challenge heavy quite.', 'monthly');
INSERT INTO public.internal_service VALUES (47, '33,00 ?', 'Sure huge him life safe into. So development truth let involve claim author. Break and role idea suddenly off consider.', 'daily');
INSERT INTO public.internal_service VALUES (48, '62,00 ?', 'Price else five work carry. Action from appear cell make. Operation TV trip right.
First wish require save then shake. Race my concern.', 'weekly');
INSERT INTO public.internal_service VALUES (49, '62,00 ?', 'Share or word green leg product sign. Their degree where specific evidence.
Name suddenly economic low successful stock.', 'weekly');
INSERT INTO public.internal_service VALUES (50, '73,00 ?', 'Blood well ready. Major maintain candidate shake. Player any contain experience.
Level room take class. Act still foreign picture. See citizen source land personal history many.', 'monthly');
INSERT INTO public.internal_service VALUES (51, '33,00 ?', 'Should when present support reduce whatever claim push. With plan anything. Together best half including he center main. Role over operation claim about cost.', 'hourly');
INSERT INTO public.internal_service VALUES (52, '89,00 ?', 'Could half leg take pick where former. Open clear president task.
Concern air court guy. Edge guess fund. Floor around case.', 'weekly');
INSERT INTO public.internal_service VALUES (53, '56,00 ?', 'Two loss camera. City manage out.
Point old film paper shoulder really sound second. Card above bag think challenge goal result.', 'hourly');
INSERT INTO public.internal_service VALUES (54, '92,00 ?', 'Design husband especially win fine car yet. Various sea end.', 'daily');
INSERT INTO public.internal_service VALUES (55, '74,00 ?', 'Most us positive pay. Seven heart respond two bank ask option.
Moment something force up meet loss news traditional. Able least edge choose. Certainly drive act join.', 'yearly');
INSERT INTO public.internal_service VALUES (56, '7,00 ?', 'Where beautiful movement. Amount bar process professional international.
Break produce rise imagine. Probably teacher truth film get ten.', 'monthly');
INSERT INTO public.internal_service VALUES (57, '23,00 ?', 'Wife suddenly onto fund rate kid compare. Smile religious night radio determine usually say. Without life southern medical too new however.', 'monthly');
INSERT INTO public.internal_service VALUES (58, '102,00 ?', 'Individual yourself hold Mrs. Paper occur television cut. Identify once least simple sit long.
Series art figure without thank deal few. Range determine professional care process wait board.', 'monthly');
INSERT INTO public.internal_service VALUES (59, '90,00 ?', 'Or respond figure management. Open financial dream after option.
Bank north enough term trip owner.
Better huge too second. Way week join staff.', 'daily');
INSERT INTO public.internal_service VALUES (60, '99,00 ?', 'Try year doctor draw treatment man none. Agency to least wish letter vote. Realize seek miss way risk stock early out.', 'yearly');


--
-- TOC entry 3452 (class 0 OID 16622)
-- Dependencies: 229
-- Data for Name: internal_service_inclusion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.internal_service_inclusion VALUES (8, 85181997756, '2000-06-08', '2022-09-21', 1);
INSERT INTO public.internal_service_inclusion VALUES (38, 81281718689, '2015-06-14', '2019-10-31', 2);
INSERT INTO public.internal_service_inclusion VALUES (56, 87127921928, '2006-03-30', '2007-12-22', 3);
INSERT INTO public.internal_service_inclusion VALUES (47, 86017927001, '2012-11-16', '2016-12-06', 4);
INSERT INTO public.internal_service_inclusion VALUES (18, 88354875145, '2009-09-04', '2013-08-13', 5);
INSERT INTO public.internal_service_inclusion VALUES (56, 87651296848, '2009-08-20', '2022-04-29', 6);
INSERT INTO public.internal_service_inclusion VALUES (13, 81525714909, '2002-04-29', '2014-10-26', 7);
INSERT INTO public.internal_service_inclusion VALUES (11, 85390205129, '2000-06-03', '2008-09-02', 8);
INSERT INTO public.internal_service_inclusion VALUES (46, 86654382873, '2008-10-31', '2015-11-24', 9);
INSERT INTO public.internal_service_inclusion VALUES (37, 84445401791, '2007-01-21', '2011-05-23', 10);
INSERT INTO public.internal_service_inclusion VALUES (34, 84548540986, '2008-11-13', '2018-09-14', 11);
INSERT INTO public.internal_service_inclusion VALUES (50, 86970918258, '2002-02-23', '2012-04-14', 12);
INSERT INTO public.internal_service_inclusion VALUES (44, 81393324182, '2008-09-26', '2009-09-05', 13);
INSERT INTO public.internal_service_inclusion VALUES (12, 84548540986, '2014-12-22', '2015-11-13', 14);
INSERT INTO public.internal_service_inclusion VALUES (41, 89605694853, '2010-05-11', '2013-06-21', 15);
INSERT INTO public.internal_service_inclusion VALUES (45, 82884816243, '2018-08-31', '2021-02-13', 16);
INSERT INTO public.internal_service_inclusion VALUES (50, 82453780011, '2018-11-01', '2021-07-17', 17);
INSERT INTO public.internal_service_inclusion VALUES (42, 82010648116, '2014-08-16', '2019-12-28', 18);
INSERT INTO public.internal_service_inclusion VALUES (60, 81839725897, '2018-11-04', '2021-11-05', 19);
INSERT INTO public.internal_service_inclusion VALUES (12, 84608960717, '2004-02-02', '2011-03-28', 20);
INSERT INTO public.internal_service_inclusion VALUES (34, 87127921928, '2002-02-05', '2009-07-11', 21);
INSERT INTO public.internal_service_inclusion VALUES (34, 83162443692, '2002-07-15', '2004-11-02', 22);
INSERT INTO public.internal_service_inclusion VALUES (6, 88686637097, '2011-04-05', '2020-04-10', 23);
INSERT INTO public.internal_service_inclusion VALUES (15, 83231037288, '2002-03-02', '2005-04-02', 24);
INSERT INTO public.internal_service_inclusion VALUES (51, 81281718689, '2000-06-01', '2014-04-02', 25);
INSERT INTO public.internal_service_inclusion VALUES (48, 89931173404, '2006-01-17', '2007-03-19', 26);
INSERT INTO public.internal_service_inclusion VALUES (15, 89567417811, '2012-07-21', '2020-06-21', 27);
INSERT INTO public.internal_service_inclusion VALUES (45, 83367260233, '2005-04-09', '2018-09-26', 28);
INSERT INTO public.internal_service_inclusion VALUES (18, 81281718689, '2010-06-29', '2017-03-22', 29);
INSERT INTO public.internal_service_inclusion VALUES (38, 81525714909, '2009-03-28', '2020-05-15', 30);
INSERT INTO public.internal_service_inclusion VALUES (44, 86654382873, '2004-08-18', '2010-10-28', 31);
INSERT INTO public.internal_service_inclusion VALUES (16, 87651296848, '2015-11-22', '2018-05-16', 32);
INSERT INTO public.internal_service_inclusion VALUES (36, 88354875145, '2014-11-17', '2020-03-25', 33);
INSERT INTO public.internal_service_inclusion VALUES (4, 89175874533, '2002-11-23', '2018-02-20', 34);
INSERT INTO public.internal_service_inclusion VALUES (58, 81760439158, '2005-12-24', '2011-06-24', 35);
INSERT INTO public.internal_service_inclusion VALUES (43, 83434716995, '2002-05-12', '2017-09-10', 36);
INSERT INTO public.internal_service_inclusion VALUES (56, 87293111316, '2002-09-14', '2013-04-27', 37);
INSERT INTO public.internal_service_inclusion VALUES (48, 82440436528, '2001-06-20', '2023-08-26', 38);
INSERT INTO public.internal_service_inclusion VALUES (51, 88874893105, '2014-10-25', '2023-08-25', 39);
INSERT INTO public.internal_service_inclusion VALUES (30, 81290751976, '2000-12-27', '2015-06-17', 40);
INSERT INTO public.internal_service_inclusion VALUES (44, 87127921928, '2004-05-29', '2006-09-13', 41);
INSERT INTO public.internal_service_inclusion VALUES (17, 82440436528, '2000-02-06', '2011-08-13', 42);
INSERT INTO public.internal_service_inclusion VALUES (53, 89844900220, '2001-11-12', '2022-04-14', 43);
INSERT INTO public.internal_service_inclusion VALUES (54, 82453780011, '2017-05-22', '2019-07-16', 44);
INSERT INTO public.internal_service_inclusion VALUES (44, 87207296042, '2002-11-21', '2016-02-22', 45);
INSERT INTO public.internal_service_inclusion VALUES (20, 84157873461, '2001-12-23', '2004-05-17', 46);
INSERT INTO public.internal_service_inclusion VALUES (14, 84445401791, '2002-07-19', '2011-09-29', 47);
INSERT INTO public.internal_service_inclusion VALUES (3, 82717184948, '2009-02-16', '2016-08-22', 48);
INSERT INTO public.internal_service_inclusion VALUES (6, 82717184948, '2005-02-09', '2007-03-16', 49);
INSERT INTO public.internal_service_inclusion VALUES (43, 82651331557, '2017-11-08', '2019-10-14', 50);
INSERT INTO public.internal_service_inclusion VALUES (52, 85922675734, '2009-10-09', '2011-09-28', 51);
INSERT INTO public.internal_service_inclusion VALUES (47, 83367260233, '2015-03-14', '2015-08-25', 52);
INSERT INTO public.internal_service_inclusion VALUES (21, 82453780011, '2005-08-03', '2013-10-24', 53);
INSERT INTO public.internal_service_inclusion VALUES (7, 82651331557, '2013-04-07', '2020-09-12', 54);
INSERT INTO public.internal_service_inclusion VALUES (56, 87816542499, '2012-06-15', '2015-01-15', 55);
INSERT INTO public.internal_service_inclusion VALUES (10, 86654382873, '2009-06-07', '2017-02-19', 56);
INSERT INTO public.internal_service_inclusion VALUES (2, 83367260233, '2016-05-29', '2021-05-15', 57);
INSERT INTO public.internal_service_inclusion VALUES (39, 83253580355, '2000-02-20', '2013-11-16', 58);
INSERT INTO public.internal_service_inclusion VALUES (13, 88063132062, '2003-11-11', '2019-10-27', 59);
INSERT INTO public.internal_service_inclusion VALUES (24, 87141610652, '2008-11-14', '2021-03-19', 60);
INSERT INTO public.internal_service_inclusion VALUES (50, 87716726601, '2008-07-12', '2018-06-05', 61);
INSERT INTO public.internal_service_inclusion VALUES (42, 84925489447, '2002-06-13', '2013-01-24', 62);
INSERT INTO public.internal_service_inclusion VALUES (14, 81290751976, '2011-04-30', '2015-07-27', 63);
INSERT INTO public.internal_service_inclusion VALUES (59, 81193274375, '2006-10-31', '2015-10-21', 64);
INSERT INTO public.internal_service_inclusion VALUES (5, 89175874533, '2011-03-02', '2013-09-03', 65);
INSERT INTO public.internal_service_inclusion VALUES (26, 87141610652, '2001-04-25', '2017-07-17', 66);
INSERT INTO public.internal_service_inclusion VALUES (6, 82540578006, '2015-05-15', '2018-07-07', 67);
INSERT INTO public.internal_service_inclusion VALUES (5, 83039121686, '2008-12-07', '2014-06-11', 68);
INSERT INTO public.internal_service_inclusion VALUES (56, 83630038004, '2013-02-11', '2023-10-01', 69);
INSERT INTO public.internal_service_inclusion VALUES (13, 87127921928, '2019-09-13', '2020-04-16', 70);
INSERT INTO public.internal_service_inclusion VALUES (41, 85390205129, '2002-02-25', '2011-03-26', 71);
INSERT INTO public.internal_service_inclusion VALUES (13, 86329113206, '2007-09-25', '2014-09-14', 72);
INSERT INTO public.internal_service_inclusion VALUES (58, 81281718689, '2004-08-22', '2023-11-29', 73);
INSERT INTO public.internal_service_inclusion VALUES (10, 87850980321, '2000-06-09', '2022-09-06', 74);
INSERT INTO public.internal_service_inclusion VALUES (9, 84925489447, '2006-07-21', '2010-05-13', 75);
INSERT INTO public.internal_service_inclusion VALUES (15, 85922675734, '2003-03-15', '2013-03-13', 76);
INSERT INTO public.internal_service_inclusion VALUES (56, 88686637097, '2003-02-28', '2014-04-17', 77);
INSERT INTO public.internal_service_inclusion VALUES (37, 86970918258, '2004-01-17', '2015-01-28', 78);
INSERT INTO public.internal_service_inclusion VALUES (11, 84608960717, '2005-01-01', '2023-08-17', 79);
INSERT INTO public.internal_service_inclusion VALUES (23, 82884816243, '2000-12-03', '2021-05-19', 80);
INSERT INTO public.internal_service_inclusion VALUES (8, 89931173404, '2004-11-23', '2023-07-26', 81);
INSERT INTO public.internal_service_inclusion VALUES (48, 88029686047, '2005-09-22', '2022-06-03', 82);
INSERT INTO public.internal_service_inclusion VALUES (56, 87308609495, '2008-10-19', '2011-08-28', 83);
INSERT INTO public.internal_service_inclusion VALUES (42, 89931173404, '2008-09-13', '2009-08-24', 84);
INSERT INTO public.internal_service_inclusion VALUES (2, 89478225634, '2001-01-30', '2004-03-08', 85);
INSERT INTO public.internal_service_inclusion VALUES (31, 85162225551, '2010-10-17', '2012-02-24', 86);
INSERT INTO public.internal_service_inclusion VALUES (47, 81281718689, '2001-08-24', '2002-08-28', 87);
INSERT INTO public.internal_service_inclusion VALUES (2, 83253580355, '2010-05-10', '2021-10-26', 88);
INSERT INTO public.internal_service_inclusion VALUES (16, 83367260233, '2015-07-05', '2019-11-02', 89);
INSERT INTO public.internal_service_inclusion VALUES (16, 87651296848, '2018-03-23', '2023-03-23', 90);
INSERT INTO public.internal_service_inclusion VALUES (56, 85121541173, '2016-01-06', '2019-11-22', 91);
INSERT INTO public.internal_service_inclusion VALUES (28, 84548540986, '2002-09-25', '2010-05-05', 92);
INSERT INTO public.internal_service_inclusion VALUES (36, 88354875145, '2013-08-03', '2016-10-09', 93);
INSERT INTO public.internal_service_inclusion VALUES (37, 81351445183, '2003-10-28', '2006-07-27', 94);
INSERT INTO public.internal_service_inclusion VALUES (56, 89931173404, '2006-03-21', '2013-06-12', 95);
INSERT INTO public.internal_service_inclusion VALUES (2, 85937533879, '2000-10-16', '2015-10-11', 96);
INSERT INTO public.internal_service_inclusion VALUES (20, 89670073963, '2005-04-13', '2017-06-05', 97);
INSERT INTO public.internal_service_inclusion VALUES (36, 83774318368, '2010-11-07', '2019-01-05', 98);
INSERT INTO public.internal_service_inclusion VALUES (46, 82884816243, '2016-05-04', '2018-09-03', 99);
INSERT INTO public.internal_service_inclusion VALUES (6, 84445401791, '2010-06-03', '2016-02-23', 100);


--
-- TOC entry 3450 (class 0 OID 16608)
-- Dependencies: 227
-- Data for Name: international_call; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.international_call VALUES (1, 81669897524, '2015-09-22 23:00:01', '2022-04-18 13:29:34', 2, 87677577107);
INSERT INTO public.international_call VALUES (2, 88909297487, '2009-08-07 20:31:55', '2014-01-11 11:24:59', 1, 85986402492);
INSERT INTO public.international_call VALUES (3, 87986293619, '2006-03-08 20:40:45', '2006-07-12 23:04:56', 3, 88571318209);
INSERT INTO public.international_call VALUES (4, 83215219487, '2011-08-25 00:55:47', '2013-08-24 17:16:12', 14, 85613156853);
INSERT INTO public.international_call VALUES (5, 85648971932, '2002-06-25 19:30:53', '2022-03-12 23:29:04', 13, 89204509317);
INSERT INTO public.international_call VALUES (6, 84453388077, '2007-01-31 13:22:54', '2017-11-23 19:29:43', 9, 83976111170);
INSERT INTO public.international_call VALUES (7, 85561972707, '2002-03-12 00:19:01', '2023-07-18 18:20:03', 11, 83733607512);
INSERT INTO public.international_call VALUES (8, 84429557631, '2007-03-26 17:20:46', '2020-08-09 20:52:41', 13, 85648763843);
INSERT INTO public.international_call VALUES (9, 88428674891, '2006-06-07 00:07:03', '2022-06-18 22:33:52', 3, 84339926671);
INSERT INTO public.international_call VALUES (10, 88997586821, '2012-04-12 07:32:49', '2014-07-27 22:37:53', 2, 81985898322);
INSERT INTO public.international_call VALUES (11, 89103432579, '2018-03-08 04:35:30', '2018-11-18 08:30:11', 10, 83965642921);
INSERT INTO public.international_call VALUES (12, 83978352521, '2006-09-16 06:10:00', '2018-01-27 00:02:04', 5, 84776342383);
INSERT INTO public.international_call VALUES (13, 81506508842, '2017-05-19 01:42:47', '2021-04-17 06:44:46', 15, 86668012909);
INSERT INTO public.international_call VALUES (14, 83627329913, '2004-09-30 08:12:17', '2009-07-27 23:51:04', 12, 81849212028);
INSERT INTO public.international_call VALUES (15, 89823670379, '2011-01-02 05:12:56', '2013-09-07 21:57:11', 13, 86826020649);
INSERT INTO public.international_call VALUES (16, 84453388077, '2015-09-08 13:14:14', '2017-03-31 07:31:08', 14, 87844473414);
INSERT INTO public.international_call VALUES (17, 81181394332, '2017-08-05 13:29:20', '2023-04-06 16:20:18', 6, 89113021705);
INSERT INTO public.international_call VALUES (18, 89965502347, '2005-12-19 03:37:42', '2006-09-23 11:49:32', 2, 87119455559);
INSERT INTO public.international_call VALUES (19, 82065107318, '2011-01-18 02:29:04', '2020-05-11 11:05:21', 1, 86478564142);
INSERT INTO public.international_call VALUES (20, 88397505360, '2018-10-13 02:41:32', '2018-11-15 12:30:46', 11, 85859965891);
INSERT INTO public.international_call VALUES (21, 82398924816, '2015-01-10 18:32:53', '2017-03-08 11:42:22', 8, 88062218118);
INSERT INTO public.international_call VALUES (22, 81382849505, '2014-02-01 16:43:19', '2021-10-12 16:41:08', 4, 85492432392);
INSERT INTO public.international_call VALUES (23, 89213981309, '2008-07-18 08:33:46', '2011-10-05 14:11:47', 2, 87176070353);
INSERT INTO public.international_call VALUES (24, 86162878467, '2008-08-08 21:50:47', '2011-06-14 19:48:10', 3, 84852944385);
INSERT INTO public.international_call VALUES (25, 89500192019, '2004-08-08 08:02:47', '2014-03-28 08:06:50', 3, 81408618607);
INSERT INTO public.international_call VALUES (26, 86965901371, '2011-12-24 13:15:32', '2020-06-26 05:38:05', 2, 81705160967);
INSERT INTO public.international_call VALUES (27, 84211136217, '2008-07-19 05:29:01', '2023-02-15 18:02:54', 8, 82400974131);
INSERT INTO public.international_call VALUES (28, 88435170270, '2001-06-26 15:13:54', '2011-05-15 12:28:16', 12, 86792030011);
INSERT INTO public.international_call VALUES (29, 88510122624, '2022-09-19 06:14:01', '2023-07-22 21:25:27', 14, 85587909681);
INSERT INTO public.international_call VALUES (30, 81432063477, '2003-03-24 06:09:08', '2009-03-08 04:52:42', 2, 81935584195);


--
-- TOC entry 3461 (class 0 OID 16975)
-- Dependencies: 238
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment VALUES (1, false, 81839725897, '2023-08-13', 1157);
INSERT INTO public.payment VALUES (2, true, 85126663834, '2019-04-01', 4835);
INSERT INTO public.payment VALUES (3, true, 88686637097, '2018-02-18', 346);
INSERT INTO public.payment VALUES (4, true, 86256652966, '2011-06-19', 2813);
INSERT INTO public.payment VALUES (5, false, 88874893105, '2001-04-07', 4315);
INSERT INTO public.payment VALUES (6, true, 81539108668, '2017-10-29', 4191);
INSERT INTO public.payment VALUES (7, true, 81015822213, '2019-03-03', 419);
INSERT INTO public.payment VALUES (8, false, 89844900220, '2013-05-20', 4920);
INSERT INTO public.payment VALUES (9, true, 89622760197, '2010-04-13', 698);
INSERT INTO public.payment VALUES (10, false, 88063132062, '2005-02-06', 1005);
INSERT INTO public.payment VALUES (11, false, 86256652966, '2005-04-11', 1639);
INSERT INTO public.payment VALUES (12, true, 87972625997, '2016-06-22', 478);
INSERT INTO public.payment VALUES (13, false, 87850980321, '2003-04-26', 1190);
INSERT INTO public.payment VALUES (14, true, 89730642391, '2011-07-26', 2354);
INSERT INTO public.payment VALUES (15, false, 86654382873, '2018-12-10', 4200);
INSERT INTO public.payment VALUES (16, false, 81272583628, '2005-02-13', 2607);
INSERT INTO public.payment VALUES (17, false, 85922675734, '2022-07-15', 3174);
INSERT INTO public.payment VALUES (18, false, 89567417811, '2012-08-20', 2869);
INSERT INTO public.payment VALUES (19, true, 85121541173, '2008-02-27', 4301);
INSERT INTO public.payment VALUES (20, true, 86017927001, '2003-05-08', 3449);
INSERT INTO public.payment VALUES (21, true, 89622760197, '2020-12-13', 2032);
INSERT INTO public.payment VALUES (22, false, 86451732519, '2012-01-12', 266);
INSERT INTO public.payment VALUES (23, false, 86982112923, '2019-12-29', 3999);
INSERT INTO public.payment VALUES (24, true, 89931173404, '2011-06-07', 2667);
INSERT INTO public.payment VALUES (25, false, 85922675734, '2023-04-21', 1310);
INSERT INTO public.payment VALUES (26, false, 83939283170, '2003-09-18', 464);
INSERT INTO public.payment VALUES (27, false, 84182198979, '2023-07-20', 3160);
INSERT INTO public.payment VALUES (28, true, 88874893105, '2015-01-20', 4884);
INSERT INTO public.payment VALUES (29, false, 83038342901, '2000-03-11', 3018);
INSERT INTO public.payment VALUES (30, true, 83744171916, '2008-01-03', 1033);
INSERT INTO public.payment VALUES (31, true, 81281718689, '2013-10-11', 3540);
INSERT INTO public.payment VALUES (32, false, 89670073963, '2015-05-28', 4204);
INSERT INTO public.payment VALUES (33, false, 82010648116, '2013-10-10', 518);
INSERT INTO public.payment VALUES (34, true, 86948251411, '2006-04-04', 4145);
INSERT INTO public.payment VALUES (35, true, 83253580355, '2020-07-20', 747);
INSERT INTO public.payment VALUES (36, true, 81015822213, '2003-06-30', 4743);
INSERT INTO public.payment VALUES (37, true, 87716726601, '2002-02-09', 3716);
INSERT INTO public.payment VALUES (38, true, 86654382873, '2003-08-02', 4732);
INSERT INTO public.payment VALUES (39, false, 83774318368, '2022-08-31', 2646);
INSERT INTO public.payment VALUES (40, false, 89844900220, '2000-11-20', 4803);
INSERT INTO public.payment VALUES (41, false, 89175874533, '2017-04-08', 1375);
INSERT INTO public.payment VALUES (42, false, 88029686047, '2012-11-02', 1808);
INSERT INTO public.payment VALUES (43, true, 86982112923, '2009-02-11', 1530);
INSERT INTO public.payment VALUES (44, true, 83939283170, '2023-02-07', 4711);
INSERT INTO public.payment VALUES (45, false, 89567417811, '2009-04-05', 218);
INSERT INTO public.payment VALUES (46, true, 83162443692, '2011-02-07', 3795);
INSERT INTO public.payment VALUES (47, true, 82540578006, '2021-06-18', 1957);
INSERT INTO public.payment VALUES (48, false, 83231037288, '2011-01-09', 2603);
INSERT INTO public.payment VALUES (49, true, 89742497510, '2018-10-05', 699);
INSERT INTO public.payment VALUES (50, true, 82453780011, '2008-03-16', 423);
INSERT INTO public.payment VALUES (51, false, 85937533879, '2002-09-17', 2692);
INSERT INTO public.payment VALUES (52, false, 81272583628, '2014-12-01', 128);
INSERT INTO public.payment VALUES (53, false, 82440436528, '2010-01-15', 4092);
INSERT INTO public.payment VALUES (54, true, 85922675734, '2007-04-15', 2828);
INSERT INTO public.payment VALUES (55, false, 83164665019, '2021-11-19', 269);
INSERT INTO public.payment VALUES (56, true, 82010648116, '2006-03-10', 222);
INSERT INTO public.payment VALUES (57, true, 82514913257, '2006-09-23', 854);
INSERT INTO public.payment VALUES (58, true, 81760439158, '2013-05-24', 4546);
INSERT INTO public.payment VALUES (59, true, 85390205129, '2016-12-06', 764);
INSERT INTO public.payment VALUES (60, true, 89567417811, '2008-07-19', 1117);
INSERT INTO public.payment VALUES (61, true, 88063132062, '2019-12-22', 861);
INSERT INTO public.payment VALUES (62, true, 87127921928, '2016-07-09', 2094);
INSERT INTO public.payment VALUES (63, true, 81281718689, '2006-01-13', 2210);
INSERT INTO public.payment VALUES (64, true, 86813650741, '2007-10-20', 1200);
INSERT INTO public.payment VALUES (65, false, 82884816243, '2016-02-22', 3400);
INSERT INTO public.payment VALUES (66, false, 85121541173, '2009-03-19', 3741);
INSERT INTO public.payment VALUES (67, false, 82540578006, '2005-02-06', 3290);
INSERT INTO public.payment VALUES (68, true, 86813650741, '2002-08-14', 1288);
INSERT INTO public.payment VALUES (69, false, 83231037288, '2003-05-12', 2916);
INSERT INTO public.payment VALUES (70, true, 85181997756, '2008-11-01', 643);
INSERT INTO public.payment VALUES (71, true, 83774318368, '2015-11-04', 1452);
INSERT INTO public.payment VALUES (72, true, 85390205129, '2000-05-14', 3389);
INSERT INTO public.payment VALUES (73, true, 86256652966, '2009-08-10', 1012);
INSERT INTO public.payment VALUES (74, false, 81290751976, '2008-12-17', 665);
INSERT INTO public.payment VALUES (75, true, 86982112923, '2010-07-19', 4065);
INSERT INTO public.payment VALUES (76, true, 86451732519, '2007-12-06', 2176);
INSERT INTO public.payment VALUES (77, false, 84608960717, '2007-06-03', 1638);
INSERT INTO public.payment VALUES (78, false, 83038342901, '2023-05-24', 3878);
INSERT INTO public.payment VALUES (79, true, 86128319451, '2003-02-21', 3165);
INSERT INTO public.payment VALUES (80, true, 86329113206, '2003-04-02', 960);
INSERT INTO public.payment VALUES (81, true, 85390205129, '2012-02-07', 4411);
INSERT INTO public.payment VALUES (82, false, 85201742231, '2000-02-24', 4085);
INSERT INTO public.payment VALUES (83, true, 85126663834, '2005-11-04', 1523);
INSERT INTO public.payment VALUES (84, true, 86451732519, '2000-03-25', 3445);
INSERT INTO public.payment VALUES (85, true, 86813650741, '2023-07-25', 816);
INSERT INTO public.payment VALUES (86, true, 85390205129, '2022-09-26', 3386);
INSERT INTO public.payment VALUES (87, true, 86948251411, '2020-12-28', 4182);
INSERT INTO public.payment VALUES (88, true, 88354875145, '2004-12-17', 3067);
INSERT INTO public.payment VALUES (89, true, 88063132062, '2010-05-25', 1995);
INSERT INTO public.payment VALUES (90, true, 87312837291, '2006-05-14', 3307);
INSERT INTO public.payment VALUES (91, false, 86256652966, '2005-05-11', 4399);
INSERT INTO public.payment VALUES (92, false, 85121541173, '2008-08-24', 902);
INSERT INTO public.payment VALUES (93, true, 81351445183, '2008-05-03', 3226);
INSERT INTO public.payment VALUES (94, true, 85960847413, '2001-01-03', 2902);
INSERT INTO public.payment VALUES (95, false, 85937533879, '2006-11-04', 2543);
INSERT INTO public.payment VALUES (96, false, 89567417811, '2005-04-29', 1675);
INSERT INTO public.payment VALUES (97, true, 85126663834, '2018-09-01', 1178);
INSERT INTO public.payment VALUES (98, true, 83495694331, '2003-10-14', 2721);
INSERT INTO public.payment VALUES (99, true, 82453780011, '2002-08-01', 1222);
INSERT INTO public.payment VALUES (100, true, 84371531905, '2010-11-05', 298);


--
-- TOC entry 3446 (class 0 OID 16578)
-- Dependencies: 223
-- Data for Name: phone_on_tariff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.phone_on_tariff VALUES (85989838445, 18, '2013-12-04', '2023-10-01', 99158, 173);
INSERT INTO public.phone_on_tariff VALUES (89378119644, 13, '2016-04-25', '2023-07-30', 467510, 144);
INSERT INTO public.phone_on_tariff VALUES (84554042253, 5, '2015-12-06', '2018-10-02', 173716, 172);
INSERT INTO public.phone_on_tariff VALUES (86101596130, 23, '2008-10-26', '2012-08-31', 280402, 31);
INSERT INTO public.phone_on_tariff VALUES (85921650402, 13, '2019-07-02', '2020-09-12', 595166, 28);
INSERT INTO public.phone_on_tariff VALUES (81923735269, 2, '2021-10-17', '2023-07-25', 960880, 144);
INSERT INTO public.phone_on_tariff VALUES (86486261130, 5, '2015-04-02', '2022-03-27', 146104, 76);
INSERT INTO public.phone_on_tariff VALUES (88995907007, 19, '2000-12-31', '2008-05-11', 34927, 129);
INSERT INTO public.phone_on_tariff VALUES (81259763155, 12, '2001-11-22', '2003-02-16', 108119, 11);
INSERT INTO public.phone_on_tariff VALUES (81963989597, 22, '2014-02-17', '2018-09-03', 334140, 37);
INSERT INTO public.phone_on_tariff VALUES (87897875385, 24, '2015-01-07', '2020-02-05', 889397, 156);
INSERT INTO public.phone_on_tariff VALUES (87408044742, 12, '2003-04-01', '2022-04-02', 921292, 8);
INSERT INTO public.phone_on_tariff VALUES (87838385564, 29, '2004-04-09', '2014-11-24', 197308, 178);
INSERT INTO public.phone_on_tariff VALUES (85934185958, 26, '2020-01-08', '2020-02-24', 437258, 91);
INSERT INTO public.phone_on_tariff VALUES (82473714720, 27, '2010-11-05', '2016-05-09', 256126, 72);
INSERT INTO public.phone_on_tariff VALUES (88181892121, 9, '2018-12-22', '2020-06-24', 526489, 169);
INSERT INTO public.phone_on_tariff VALUES (86160385763, 26, '2023-09-05', '2023-12-26', 981263, 38);
INSERT INTO public.phone_on_tariff VALUES (85608141468, 29, '2019-10-25', '2022-03-16', 157733, 4);
INSERT INTO public.phone_on_tariff VALUES (86955286123, 30, '2012-03-02', '2015-07-20', 224463, 35);
INSERT INTO public.phone_on_tariff VALUES (89929579011, 7, '2000-05-22', '2006-05-06', 181240, 156);
INSERT INTO public.phone_on_tariff VALUES (82845265793, 1, '2008-08-08', '2009-05-25', 503095, 32);
INSERT INTO public.phone_on_tariff VALUES (81325275805, 22, '2006-05-23', '2018-01-15', 1913, 193);
INSERT INTO public.phone_on_tariff VALUES (83673016928, 13, '2006-05-12', '2007-09-11', 718026, 44);
INSERT INTO public.phone_on_tariff VALUES (88638367383, 27, '2002-06-28', '2004-11-25', 316813, 7);
INSERT INTO public.phone_on_tariff VALUES (83447384777, 10, '2001-04-10', '2016-11-21', 674809, 185);
INSERT INTO public.phone_on_tariff VALUES (86713079263, 18, '2010-04-06', '2018-04-22', 483658, 135);
INSERT INTO public.phone_on_tariff VALUES (87650208776, 6, '2011-02-15', '2019-12-03', 383550, 124);
INSERT INTO public.phone_on_tariff VALUES (82406791741, 1, '2010-04-26', '2014-10-09', 834250, 74);
INSERT INTO public.phone_on_tariff VALUES (86531377294, 15, '2005-02-01', '2011-01-20', 253651, 125);
INSERT INTO public.phone_on_tariff VALUES (86384735995, 19, '2001-03-22', '2008-03-17', 901084, 33);
INSERT INTO public.phone_on_tariff VALUES (83860321107, 26, '2001-10-27', '2005-07-27', 669077, 82);
INSERT INTO public.phone_on_tariff VALUES (87889363347, 20, '2019-10-15', '2019-10-21', 380864, 160);
INSERT INTO public.phone_on_tariff VALUES (89477659373, 8, '2004-12-13', '2018-08-10', 941091, 200);
INSERT INTO public.phone_on_tariff VALUES (89126566261, 1, '2005-03-03', '2008-11-17', 805858, 104);
INSERT INTO public.phone_on_tariff VALUES (84116686185, 30, '2007-06-08', '2020-07-05', 356153, 115);
INSERT INTO public.phone_on_tariff VALUES (81619801178, 23, '2007-01-07', '2021-03-14', 204565, 171);
INSERT INTO public.phone_on_tariff VALUES (88147954676, 12, '2008-03-28', '2016-09-25', 468696, 157);
INSERT INTO public.phone_on_tariff VALUES (82396578689, 5, '2012-12-25', '2022-01-16', 322144, 146);
INSERT INTO public.phone_on_tariff VALUES (81697616767, 2, '2005-02-10', '2015-07-25', 972629, 137);
INSERT INTO public.phone_on_tariff VALUES (88665541008, 15, '2010-10-13', '2018-11-03', 148518, 179);
INSERT INTO public.phone_on_tariff VALUES (81955219968, 5, '2017-11-23', '2018-09-28', 782207, 129);
INSERT INTO public.phone_on_tariff VALUES (85726355058, 2, '2000-05-24', '2020-11-19', 966471, 199);
INSERT INTO public.phone_on_tariff VALUES (88110444405, 25, '2000-05-21', '2016-01-04', 74062, 148);
INSERT INTO public.phone_on_tariff VALUES (89596297054, 20, '2001-12-05', '2009-07-26', 29972, 87);
INSERT INTO public.phone_on_tariff VALUES (83729117799, 22, '2011-06-02', '2023-01-28', 62669, 114);
INSERT INTO public.phone_on_tariff VALUES (86207056068, 20, '2013-07-15', '2018-03-15', 580408, 185);
INSERT INTO public.phone_on_tariff VALUES (85335538070, 13, '2016-07-09', '2016-11-02', 493911, 131);
INSERT INTO public.phone_on_tariff VALUES (81418506174, 23, '2007-10-08', '2023-07-21', 959532, 5);
INSERT INTO public.phone_on_tariff VALUES (87977930369, 13, '2020-08-21', '2023-01-21', 202325, 124);
INSERT INTO public.phone_on_tariff VALUES (83522722707, 15, '2012-07-17', '2021-08-29', 656641, 157);
INSERT INTO public.phone_on_tariff VALUES (88532905010, 24, '2016-03-07', '2018-11-12', 38853, 174);
INSERT INTO public.phone_on_tariff VALUES (82248039572, 29, '2016-10-01', '2019-05-18', 691135, 15);
INSERT INTO public.phone_on_tariff VALUES (88379340935, 7, '2005-12-03', '2017-09-01', 797116, 110);
INSERT INTO public.phone_on_tariff VALUES (88939461323, 4, '2014-07-19', '2015-05-07', 538891, 25);
INSERT INTO public.phone_on_tariff VALUES (84513739982, 4, '2013-12-04', '2017-05-25', 207080, 10);
INSERT INTO public.phone_on_tariff VALUES (85927253425, 4, '2000-09-15', '2007-09-25', 485259, 93);
INSERT INTO public.phone_on_tariff VALUES (83331208545, 4, '2015-11-07', '2016-03-21', 623381, 121);
INSERT INTO public.phone_on_tariff VALUES (88953045558, 10, '2009-04-10', '2010-08-12', 893072, 42);
INSERT INTO public.phone_on_tariff VALUES (81903695633, 12, '2002-06-14', '2021-08-27', 370434, 160);
INSERT INTO public.phone_on_tariff VALUES (83001662053, 17, '2003-12-22', '2010-10-18', 67119, 5);
INSERT INTO public.phone_on_tariff VALUES (81731031747, 25, '2006-09-06', '2020-10-17', 314960, 68);
INSERT INTO public.phone_on_tariff VALUES (89566911332, 25, '2015-05-04', '2022-05-07', 840285, 199);
INSERT INTO public.phone_on_tariff VALUES (83959491888, 7, '2009-10-04', '2017-05-08', 253362, 157);
INSERT INTO public.phone_on_tariff VALUES (89396588497, 13, '2006-12-24', '2018-04-25', 596880, 42);
INSERT INTO public.phone_on_tariff VALUES (83441681703, 4, '2012-01-05', '2019-03-17', 220395, 189);
INSERT INTO public.phone_on_tariff VALUES (83171562976, 14, '2009-04-08', '2015-06-11', 10528, 82);
INSERT INTO public.phone_on_tariff VALUES (82629632649, 10, '2010-01-21', '2022-10-12', 777177, 38);
INSERT INTO public.phone_on_tariff VALUES (85261801644, 21, '2014-02-11', '2022-01-05', 700908, 47);
INSERT INTO public.phone_on_tariff VALUES (81352472748, 8, '2010-01-26', '2010-02-15', 61105, 37);
INSERT INTO public.phone_on_tariff VALUES (85090832037, 14, '2016-11-22', '2019-05-31', 291535, 53);
INSERT INTO public.phone_on_tariff VALUES (85429150532, 1, '2008-01-30', '2022-02-11', 482871, 153);
INSERT INTO public.phone_on_tariff VALUES (85650760585, 9, '2017-02-03', '2018-11-11', 580224, 50);
INSERT INTO public.phone_on_tariff VALUES (82238919970, 7, '2004-10-25', '2006-01-19', 678252, 181);
INSERT INTO public.phone_on_tariff VALUES (85422084501, 29, '2000-11-22', '2010-05-10', 219032, 172);
INSERT INTO public.phone_on_tariff VALUES (86533912118, 12, '2007-11-03', '2020-12-25', 411676, 185);
INSERT INTO public.phone_on_tariff VALUES (81016543917, 1, '2011-10-04', '2022-09-27', 666931, 133);
INSERT INTO public.phone_on_tariff VALUES (86002117274, 30, '2016-02-25', '2019-11-10', 879882, 20);
INSERT INTO public.phone_on_tariff VALUES (81808476118, 10, '2006-08-05', '2015-12-30', 626993, 141);
INSERT INTO public.phone_on_tariff VALUES (86197733944, 4, '2012-07-28', '2019-10-11', 75644, 180);
INSERT INTO public.phone_on_tariff VALUES (89536127883, 28, '2000-01-11', '2000-04-13', 433620, 58);
INSERT INTO public.phone_on_tariff VALUES (87102175677, 1, '2009-02-08', '2013-09-02', 567618, 86);
INSERT INTO public.phone_on_tariff VALUES (89039495655, 9, '2005-04-10', '2015-07-25', 242832, 107);
INSERT INTO public.phone_on_tariff VALUES (85607668883, 22, '2002-04-26', '2017-01-30', 861524, 154);
INSERT INTO public.phone_on_tariff VALUES (83176917327, 28, '2001-10-14', '2018-07-28', 332236, 113);
INSERT INTO public.phone_on_tariff VALUES (83885249222, 3, '2000-05-03', '2021-02-27', 641768, 91);
INSERT INTO public.phone_on_tariff VALUES (89553320104, 25, '2000-05-22', '2015-04-17', 504644, 11);
INSERT INTO public.phone_on_tariff VALUES (87500858311, 2, '2009-02-14', '2009-08-07', 791907, 160);
INSERT INTO public.phone_on_tariff VALUES (84770044580, 8, '2002-12-12', '2009-01-22', 827090, 194);
INSERT INTO public.phone_on_tariff VALUES (86959890340, 25, '2014-11-04', '2018-03-28', 486743, 124);
INSERT INTO public.phone_on_tariff VALUES (86624337217, 27, '2012-03-23', '2016-08-12', 519292, 190);
INSERT INTO public.phone_on_tariff VALUES (87921681923, 24, '2009-07-10', '2015-06-08', 33699, 97);
INSERT INTO public.phone_on_tariff VALUES (86017395937, 16, '2013-10-09', '2023-12-27', 718798, 1);
INSERT INTO public.phone_on_tariff VALUES (86593285179, 2, '2002-11-02', '2008-01-11', 985503, 194);
INSERT INTO public.phone_on_tariff VALUES (81275221878, 17, '2011-04-04', '2012-02-28', 405121, 132);
INSERT INTO public.phone_on_tariff VALUES (82230071416, 23, '2017-03-14', '2019-08-22', 445161, 10);
INSERT INTO public.phone_on_tariff VALUES (88439105151, 22, '2015-01-03', '2017-01-23', 389936, 177);
INSERT INTO public.phone_on_tariff VALUES (87637003450, 24, '2016-09-01', '2021-09-23', 996448, 176);
INSERT INTO public.phone_on_tariff VALUES (85338431879, 23, '2004-09-28', '2017-01-01', 907095, 18);
INSERT INTO public.phone_on_tariff VALUES (85494893296, 9, '2016-01-17', '2023-10-03', 499154, 140);
INSERT INTO public.phone_on_tariff VALUES (88633481698, 6, '2002-09-20', '2023-04-02', 850075, 174);
INSERT INTO public.phone_on_tariff VALUES (85181997756, 22, '2005-06-24', '2017-07-26', 544414, 135);
INSERT INTO public.phone_on_tariff VALUES (89478225634, 30, '2003-04-10', '2021-11-19', 721354, 104);
INSERT INTO public.phone_on_tariff VALUES (83164665019, 15, '2017-12-19', '2018-04-16', 527129, 41);
INSERT INTO public.phone_on_tariff VALUES (81393324182, 4, '2012-02-13', '2013-08-12', 350910, 42);
INSERT INTO public.phone_on_tariff VALUES (85896878969, 21, '2001-02-12', '2014-12-08', 350748, 53);
INSERT INTO public.phone_on_tariff VALUES (84548540986, 21, '2010-06-29', '2020-12-19', 563510, 179);
INSERT INTO public.phone_on_tariff VALUES (81876597241, 16, '2001-10-27', '2022-11-02', 920855, 131);
INSERT INTO public.phone_on_tariff VALUES (86451732519, 9, '2003-03-21', '2003-06-16', 396985, 200);
INSERT INTO public.phone_on_tariff VALUES (89742497510, 29, '2000-06-11', '2023-02-20', 331266, 7);
INSERT INTO public.phone_on_tariff VALUES (87308609495, 18, '2019-02-06', '2021-07-06', 117133, 133);
INSERT INTO public.phone_on_tariff VALUES (87972625997, 13, '2002-07-28', '2019-12-02', 37910, 138);
INSERT INTO public.phone_on_tariff VALUES (85014001547, 1, '2001-04-03', '2021-02-16', 245321, 192);
INSERT INTO public.phone_on_tariff VALUES (86970918258, 5, '2009-07-22', '2017-03-22', 763014, 171);
INSERT INTO public.phone_on_tariff VALUES (86982112923, 26, '2006-08-31', '2009-07-16', 943360, 134);
INSERT INTO public.phone_on_tariff VALUES (89931173404, 2, '2019-09-21', '2022-12-04', 97399, 84);
INSERT INTO public.phone_on_tariff VALUES (85794497850, 6, '2001-10-08', '2002-03-26', 667079, 193);
INSERT INTO public.phone_on_tariff VALUES (82440436528, 24, '2001-04-16', '2021-10-19', 629681, 96);
INSERT INTO public.phone_on_tariff VALUES (81539108668, 10, '2006-03-26', '2012-06-15', 499780, 23);
INSERT INTO public.phone_on_tariff VALUES (88063132062, 23, '2005-06-23', '2014-11-15', 726463, 164);
INSERT INTO public.phone_on_tariff VALUES (87293111316, 25, '2011-11-25', '2020-11-29', 651764, 177);
INSERT INTO public.phone_on_tariff VALUES (81272583628, 12, '2003-05-17', '2023-01-06', 698781, 64);
INSERT INTO public.phone_on_tariff VALUES (82884816243, 13, '2006-01-20', '2010-02-20', 789342, 66);
INSERT INTO public.phone_on_tariff VALUES (82700964651, 27, '2011-09-23', '2014-02-23', 374961, 159);
INSERT INTO public.phone_on_tariff VALUES (86948251411, 27, '2013-12-22', '2023-07-04', 214791, 82);
INSERT INTO public.phone_on_tariff VALUES (85126663834, 8, '2008-12-30', '2009-03-22', 534676, 180);
INSERT INTO public.phone_on_tariff VALUES (83038342901, 22, '2004-03-04', '2008-08-28', 100209, 107);
INSERT INTO public.phone_on_tariff VALUES (81525714909, 17, '2002-12-10', '2009-02-01', 141481, 44);
INSERT INTO public.phone_on_tariff VALUES (84608960717, 8, '2000-11-25', '2013-07-09', 2400, 93);
INSERT INTO public.phone_on_tariff VALUES (85937533879, 30, '2007-07-20', '2018-05-25', 53248, 26);
INSERT INTO public.phone_on_tariff VALUES (85922675734, 11, '2005-10-17', '2010-09-09', 896267, 38);
INSERT INTO public.phone_on_tariff VALUES (87716726601, 10, '2018-06-22', '2019-12-31', 73378, 12);
INSERT INTO public.phone_on_tariff VALUES (81281718689, 6, '2014-06-11', '2017-02-21', 407462, 158);
INSERT INTO public.phone_on_tariff VALUES (83744171916, 19, '2003-10-18', '2022-06-30', 100912, 60);
INSERT INTO public.phone_on_tariff VALUES (86256652966, 24, '2018-02-02', '2023-04-17', 316079, 182);
INSERT INTO public.phone_on_tariff VALUES (86813650741, 20, '2017-02-02', '2018-12-24', 107569, 17);
INSERT INTO public.phone_on_tariff VALUES (84925489447, 6, '2014-02-06', '2023-04-08', 158798, 99);
INSERT INTO public.phone_on_tariff VALUES (83039121686, 20, '2013-07-18', '2016-01-20', 109820, 177);
INSERT INTO public.phone_on_tariff VALUES (85960847413, 19, '2000-02-04', '2014-07-05', 221225, 71);
INSERT INTO public.phone_on_tariff VALUES (85411706214, 20, '2013-12-10', '2015-06-01', 30417, 76);
INSERT INTO public.phone_on_tariff VALUES (89167792152, 17, '2010-09-11', '2017-01-26', 727823, 83);
INSERT INTO public.phone_on_tariff VALUES (87395751914, 1, '2003-07-27', '2008-03-31', 876429, 18);
INSERT INTO public.phone_on_tariff VALUES (87141610652, 18, '2015-09-29', '2020-10-04', 466098, 119);
INSERT INTO public.phone_on_tariff VALUES (83589371211, 12, '2011-10-06', '2021-02-08', 938360, 107);
INSERT INTO public.phone_on_tariff VALUES (82651331557, 20, '2012-09-13', '2022-02-01', 359128, 36);
INSERT INTO public.phone_on_tariff VALUES (82010648116, 3, '2000-05-05', '2020-10-17', 93283, 94);
INSERT INTO public.phone_on_tariff VALUES (86973322478, 6, '2014-01-25', '2015-04-07', 262557, 32);
INSERT INTO public.phone_on_tariff VALUES (87816542499, 22, '2017-01-27', '2017-10-23', 112260, 114);
INSERT INTO public.phone_on_tariff VALUES (89622760197, 20, '2000-08-17', '2008-03-28', 375346, 200);
INSERT INTO public.phone_on_tariff VALUES (86128319451, 8, '2008-06-26', '2023-02-14', 465747, 189);
INSERT INTO public.phone_on_tariff VALUES (84371531905, 28, '2005-08-02', '2007-04-02', 91966, 32);
INSERT INTO public.phone_on_tariff VALUES (89605694853, 27, '2005-01-22', '2005-02-04', 866608, 150);
INSERT INTO public.phone_on_tariff VALUES (89670073963, 28, '2000-01-20', '2015-01-29', 925788, 16);
INSERT INTO public.phone_on_tariff VALUES (81651408391, 24, '2013-11-17', '2015-01-31', 104508, 125);
INSERT INTO public.phone_on_tariff VALUES (85121541173, 11, '2007-02-09', '2014-06-19', 443081, 115);
INSERT INTO public.phone_on_tariff VALUES (87207296042, 8, '2014-04-15', '2020-11-20', 900037, 178);
INSERT INTO public.phone_on_tariff VALUES (82717184948, 9, '2002-02-18', '2007-01-08', 524799, 130);
INSERT INTO public.phone_on_tariff VALUES (83939283170, 14, '2016-01-14', '2018-12-20', 483949, 39);
INSERT INTO public.phone_on_tariff VALUES (83495694331, 22, '2020-01-08', '2022-12-26', 749545, 68);
INSERT INTO public.phone_on_tariff VALUES (83774318368, 11, '2012-08-29', '2020-04-16', 906384, 49);
INSERT INTO public.phone_on_tariff VALUES (89175874533, 15, '2003-08-08', '2018-07-12', 581336, 92);
INSERT INTO public.phone_on_tariff VALUES (86017927001, 8, '2005-06-16', '2011-10-17', 382082, 69);
INSERT INTO public.phone_on_tariff VALUES (88874893105, 14, '2007-02-03', '2009-08-30', 858179, 140);
INSERT INTO public.phone_on_tariff VALUES (81834251955, 22, '2019-03-12', '2023-04-10', 920318, 155);
INSERT INTO public.phone_on_tariff VALUES (84182198979, 8, '2007-05-01', '2020-03-06', 434362, 83);
INSERT INTO public.phone_on_tariff VALUES (83231037288, 6, '2014-05-05', '2021-05-05', 554905, 67);
INSERT INTO public.phone_on_tariff VALUES (81341681439, 18, '2008-05-29', '2011-05-14', 286607, 154);
INSERT INTO public.phone_on_tariff VALUES (89730642391, 4, '2017-01-22', '2017-09-24', 971810, 80);
INSERT INTO public.phone_on_tariff VALUES (83630038004, 11, '2013-03-24', '2016-06-24', 130137, 67);
INSERT INTO public.phone_on_tariff VALUES (85162225551, 26, '2000-02-10', '2009-01-26', 225901, 174);
INSERT INTO public.phone_on_tariff VALUES (83367260233, 20, '2004-04-01', '2017-11-17', 687763, 182);
INSERT INTO public.phone_on_tariff VALUES (87127921928, 26, '2008-06-21', '2017-10-24', 71199, 139);
INSERT INTO public.phone_on_tariff VALUES (81918740958, 12, '2004-10-28', '2012-10-18', 257111, 162);
INSERT INTO public.phone_on_tariff VALUES (82514913257, 28, '2003-11-14', '2009-12-26', 778871, 76);
INSERT INTO public.phone_on_tariff VALUES (89567417811, 4, '2005-06-15', '2021-07-12', 49384, 94);
INSERT INTO public.phone_on_tariff VALUES (88686637097, 29, '2006-04-17', '2014-06-02', 776111, 140);
INSERT INTO public.phone_on_tariff VALUES (86654382873, 28, '2000-07-23', '2007-05-09', 350978, 79);
INSERT INTO public.phone_on_tariff VALUES (83162443692, 18, '2000-11-26', '2006-03-20', 378083, 161);
INSERT INTO public.phone_on_tariff VALUES (87850980321, 22, '2013-10-01', '2015-04-25', 289966, 76);
INSERT INTO public.phone_on_tariff VALUES (81193274375, 16, '2012-07-02', '2016-06-05', 164825, 183);
INSERT INTO public.phone_on_tariff VALUES (84157873461, 26, '2015-05-29', '2017-06-09', 794132, 66);
INSERT INTO public.phone_on_tariff VALUES (84445401791, 5, '2013-06-18', '2020-05-08', 271276, 125);
INSERT INTO public.phone_on_tariff VALUES (83253580355, 20, '2010-09-23', '2017-04-26', 699670, 145);
INSERT INTO public.phone_on_tariff VALUES (81690604571, 13, '2000-03-21', '2011-08-14', 315114, 158);
INSERT INTO public.phone_on_tariff VALUES (81290751976, 7, '2000-03-05', '2022-04-21', 765002, 199);
INSERT INTO public.phone_on_tariff VALUES (85390205129, 26, '2009-01-07', '2016-06-16', 228504, 189);
INSERT INTO public.phone_on_tariff VALUES (86329113206, 23, '2001-11-16', '2007-05-08', 963389, 105);
INSERT INTO public.phone_on_tariff VALUES (88354875145, 5, '2014-01-29', '2020-08-05', 806946, 195);
INSERT INTO public.phone_on_tariff VALUES (89909942854, 16, '2004-05-27', '2018-06-26', 249469, 35);
INSERT INTO public.phone_on_tariff VALUES (83434716995, 2, '2004-08-28', '2020-12-18', 619766, 157);
INSERT INTO public.phone_on_tariff VALUES (85201742231, 28, '2002-06-18', '2007-10-02', 95119, 77);
INSERT INTO public.phone_on_tariff VALUES (87651296848, 2, '2015-11-25', '2020-11-10', 793561, 140);
INSERT INTO public.phone_on_tariff VALUES (82540578006, 21, '2005-03-27', '2008-12-06', 321174, 15);
INSERT INTO public.phone_on_tariff VALUES (88029686047, 17, '2010-04-02', '2012-05-05', 958424, 1);
INSERT INTO public.phone_on_tariff VALUES (87312837291, 16, '2001-03-17', '2023-01-08', 360734, 51);
INSERT INTO public.phone_on_tariff VALUES (81839725897, 25, '2010-05-26', '2012-08-23', 987901, 1);
INSERT INTO public.phone_on_tariff VALUES (82453780011, 6, '2011-03-16', '2023-05-27', 287897, 190);
INSERT INTO public.phone_on_tariff VALUES (89844900220, 2, '2016-05-25', '2019-07-30', 664665, 126);
INSERT INTO public.phone_on_tariff VALUES (81015822213, 17, '2008-08-05', '2013-02-12', 894556, 134);
INSERT INTO public.phone_on_tariff VALUES (81760439158, 13, '2010-06-05', '2014-08-14', 944413, 83);
INSERT INTO public.phone_on_tariff VALUES (81351445183, 14, '2015-08-19', '2015-12-19', 908605, 150);


--
-- TOC entry 3455 (class 0 OID 16660)
-- Dependencies: 232
-- Data for Name: tariff_service_inclusion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tariff_service_inclusion VALUES (2, '2010-04-12', '2015-11-29', 1, 51);
INSERT INTO public.tariff_service_inclusion VALUES (28, '2009-06-03', '2013-12-18', 2, 45);
INSERT INTO public.tariff_service_inclusion VALUES (23, '2010-09-04', '2019-12-22', 3, 14);
INSERT INTO public.tariff_service_inclusion VALUES (21, '2019-03-08', '2022-03-29', 4, 54);
INSERT INTO public.tariff_service_inclusion VALUES (9, '2013-07-31', '2023-04-24', 5, 22);
INSERT INTO public.tariff_service_inclusion VALUES (23, '2005-08-10', '2016-07-06', 6, 48);
INSERT INTO public.tariff_service_inclusion VALUES (13, '2006-07-04', '2011-04-02', 7, 7);
INSERT INTO public.tariff_service_inclusion VALUES (9, '2010-07-16', '2016-02-11', 8, 8);
INSERT INTO public.tariff_service_inclusion VALUES (15, '2002-08-13', '2003-01-10', 9, 47);
INSERT INTO public.tariff_service_inclusion VALUES (18, '2015-02-26', '2022-09-21', 10, 58);
INSERT INTO public.tariff_service_inclusion VALUES (11, '2006-05-08', '2009-11-26', 11, 37);
INSERT INTO public.tariff_service_inclusion VALUES (23, '2010-07-03', '2011-09-28', 12, 23);
INSERT INTO public.tariff_service_inclusion VALUES (22, '2008-06-12', '2022-02-08', 13, 50);
INSERT INTO public.tariff_service_inclusion VALUES (19, '2019-11-17', '2020-12-11', 14, 2);
INSERT INTO public.tariff_service_inclusion VALUES (15, '2000-02-27', '2013-04-26', 15, 17);
INSERT INTO public.tariff_service_inclusion VALUES (7, '2011-07-21', '2023-08-15', 16, 58);
INSERT INTO public.tariff_service_inclusion VALUES (22, '2012-02-22', '2015-04-27', 17, 4);
INSERT INTO public.tariff_service_inclusion VALUES (18, '2008-03-13', '2012-12-11', 18, 44);
INSERT INTO public.tariff_service_inclusion VALUES (15, '2016-10-14', '2019-02-02', 19, 51);
INSERT INTO public.tariff_service_inclusion VALUES (24, '2002-05-05', '2003-04-15', 20, 40);
INSERT INTO public.tariff_service_inclusion VALUES (5, '2007-08-24', '2007-11-11', 21, 16);
INSERT INTO public.tariff_service_inclusion VALUES (12, '2003-01-30', '2012-01-02', 22, 24);
INSERT INTO public.tariff_service_inclusion VALUES (21, '2006-08-09', '2021-03-15', 23, 5);
INSERT INTO public.tariff_service_inclusion VALUES (10, '2001-01-10', '2006-05-10', 24, 38);
INSERT INTO public.tariff_service_inclusion VALUES (17, '2008-08-14', '2020-05-21', 25, 49);
INSERT INTO public.tariff_service_inclusion VALUES (9, '2007-05-28', '2008-08-22', 26, 11);
INSERT INTO public.tariff_service_inclusion VALUES (12, '2006-04-18', '2015-08-20', 27, 54);
INSERT INTO public.tariff_service_inclusion VALUES (27, '2001-10-26', '2019-10-04', 28, 53);
INSERT INTO public.tariff_service_inclusion VALUES (7, '2018-02-15', '2020-01-16', 29, 11);
INSERT INTO public.tariff_service_inclusion VALUES (15, '2000-06-25', '2021-10-13', 30, 41);
INSERT INTO public.tariff_service_inclusion VALUES (3, '2006-03-01', '2007-01-14', 31, 18);
INSERT INTO public.tariff_service_inclusion VALUES (5, '2003-02-04', '2012-11-26', 32, 32);
INSERT INTO public.tariff_service_inclusion VALUES (30, '2001-08-08', '2018-10-14', 33, 2);
INSERT INTO public.tariff_service_inclusion VALUES (10, '2000-08-03', '2017-07-30', 34, 33);
INSERT INTO public.tariff_service_inclusion VALUES (8, '2002-03-12', '2013-10-04', 35, 50);
INSERT INTO public.tariff_service_inclusion VALUES (30, '2003-07-02', '2014-12-07', 36, 54);
INSERT INTO public.tariff_service_inclusion VALUES (15, '2004-10-13', '2019-09-15', 37, 48);
INSERT INTO public.tariff_service_inclusion VALUES (25, '2013-09-29', '2014-05-06', 38, 42);
INSERT INTO public.tariff_service_inclusion VALUES (8, '2009-10-05', '2018-08-04', 39, 22);
INSERT INTO public.tariff_service_inclusion VALUES (3, '2007-07-07', '2011-10-16', 40, 9);
INSERT INTO public.tariff_service_inclusion VALUES (3, '2003-09-27', '2021-04-17', 41, 30);
INSERT INTO public.tariff_service_inclusion VALUES (22, '2004-08-08', '2016-11-25', 42, 41);
INSERT INTO public.tariff_service_inclusion VALUES (13, '2015-04-21', '2015-06-28', 43, 49);
INSERT INTO public.tariff_service_inclusion VALUES (12, '2015-07-24', '2019-09-12', 44, 16);
INSERT INTO public.tariff_service_inclusion VALUES (21, '2002-08-03', '2018-07-18', 45, 50);
INSERT INTO public.tariff_service_inclusion VALUES (16, '2011-07-21', '2016-02-15', 46, 50);
INSERT INTO public.tariff_service_inclusion VALUES (18, '2003-07-06', '2023-08-28', 47, 1);
INSERT INTO public.tariff_service_inclusion VALUES (8, '2005-10-11', '2023-11-03', 48, 9);
INSERT INTO public.tariff_service_inclusion VALUES (13, '2001-05-21', '2012-09-03', 49, 50);
INSERT INTO public.tariff_service_inclusion VALUES (14, '2004-02-18', '2016-01-24', 50, 60);
INSERT INTO public.tariff_service_inclusion VALUES (27, '2001-11-14', '2010-11-13', 51, 23);
INSERT INTO public.tariff_service_inclusion VALUES (28, '2003-12-18', '2010-01-31', 52, 27);
INSERT INTO public.tariff_service_inclusion VALUES (20, '2017-01-30', '2020-06-08', 53, 36);
INSERT INTO public.tariff_service_inclusion VALUES (30, '2006-10-17', '2019-04-25', 54, 31);
INSERT INTO public.tariff_service_inclusion VALUES (1, '2014-08-21', '2023-03-05', 55, 30);
INSERT INTO public.tariff_service_inclusion VALUES (2, '2011-12-17', '2017-08-31', 56, 27);
INSERT INTO public.tariff_service_inclusion VALUES (22, '2004-05-31', '2017-04-19', 57, 11);
INSERT INTO public.tariff_service_inclusion VALUES (28, '2014-11-12', '2017-02-02', 58, 55);
INSERT INTO public.tariff_service_inclusion VALUES (23, '2009-10-18', '2018-07-11', 59, 31);
INSERT INTO public.tariff_service_inclusion VALUES (18, '2015-05-31', '2022-09-02', 60, 37);
INSERT INTO public.tariff_service_inclusion VALUES (17, '2012-07-29', '2015-04-01', 61, 51);
INSERT INTO public.tariff_service_inclusion VALUES (6, '2011-01-10', '2015-08-20', 62, 43);
INSERT INTO public.tariff_service_inclusion VALUES (9, '2013-03-03', '2022-05-20', 63, 18);
INSERT INTO public.tariff_service_inclusion VALUES (27, '2006-01-19', '2019-10-28', 64, 36);
INSERT INTO public.tariff_service_inclusion VALUES (30, '2006-01-03', '2019-08-29', 65, 17);
INSERT INTO public.tariff_service_inclusion VALUES (6, '2007-08-15', '2019-05-27', 66, 28);
INSERT INTO public.tariff_service_inclusion VALUES (1, '2013-01-04', '2015-04-18', 67, 35);
INSERT INTO public.tariff_service_inclusion VALUES (15, '2002-04-13', '2009-08-25', 68, 46);
INSERT INTO public.tariff_service_inclusion VALUES (2, '2006-12-10', '2012-01-29', 69, 8);
INSERT INTO public.tariff_service_inclusion VALUES (15, '2001-09-09', '2012-01-18', 70, 1);
INSERT INTO public.tariff_service_inclusion VALUES (30, '2004-05-26', '2013-01-26', 71, 42);
INSERT INTO public.tariff_service_inclusion VALUES (12, '2003-11-24', '2004-02-06', 72, 57);
INSERT INTO public.tariff_service_inclusion VALUES (11, '2003-09-19', '2016-08-05', 73, 1);
INSERT INTO public.tariff_service_inclusion VALUES (17, '2020-01-04', '2020-07-07', 74, 27);
INSERT INTO public.tariff_service_inclusion VALUES (28, '2017-04-09', '2017-05-29', 75, 44);
INSERT INTO public.tariff_service_inclusion VALUES (13, '2015-07-18', '2019-01-28', 76, 20);
INSERT INTO public.tariff_service_inclusion VALUES (8, '2013-06-15', '2021-05-28', 77, 34);
INSERT INTO public.tariff_service_inclusion VALUES (23, '2000-11-15', '2013-01-12', 78, 21);
INSERT INTO public.tariff_service_inclusion VALUES (15, '2016-09-04', '2022-12-22', 79, 56);
INSERT INTO public.tariff_service_inclusion VALUES (23, '2002-02-13', '2015-12-30', 80, 13);
INSERT INTO public.tariff_service_inclusion VALUES (27, '2009-06-20', '2017-08-22', 81, 19);
INSERT INTO public.tariff_service_inclusion VALUES (23, '2015-06-18', '2021-01-29', 82, 12);
INSERT INTO public.tariff_service_inclusion VALUES (10, '2006-09-12', '2016-11-06', 83, 49);
INSERT INTO public.tariff_service_inclusion VALUES (10, '2006-09-12', '2014-02-18', 84, 57);
INSERT INTO public.tariff_service_inclusion VALUES (5, '2002-03-23', '2014-03-01', 85, 55);
INSERT INTO public.tariff_service_inclusion VALUES (22, '2002-09-03', '2017-02-17', 86, 17);
INSERT INTO public.tariff_service_inclusion VALUES (18, '2002-12-27', '2018-06-21', 87, 4);
INSERT INTO public.tariff_service_inclusion VALUES (27, '2010-01-25', '2020-04-16', 88, 29);
INSERT INTO public.tariff_service_inclusion VALUES (18, '2005-02-03', '2016-06-09', 89, 46);
INSERT INTO public.tariff_service_inclusion VALUES (28, '2010-09-25', '2016-03-21', 90, 26);
INSERT INTO public.tariff_service_inclusion VALUES (19, '2011-03-06', '2023-02-08', 91, 37);
INSERT INTO public.tariff_service_inclusion VALUES (28, '2003-06-10', '2011-06-01', 92, 10);
INSERT INTO public.tariff_service_inclusion VALUES (4, '2016-06-18', '2020-11-10', 93, 12);
INSERT INTO public.tariff_service_inclusion VALUES (9, '2009-04-01', '2013-01-02', 94, 29);
INSERT INTO public.tariff_service_inclusion VALUES (14, '2006-12-07', '2015-03-03', 95, 1);
INSERT INTO public.tariff_service_inclusion VALUES (1, '2010-09-06', '2023-10-22', 96, 53);
INSERT INTO public.tariff_service_inclusion VALUES (4, '2002-06-02', '2017-08-27', 97, 48);
INSERT INTO public.tariff_service_inclusion VALUES (17, '2000-05-20', '2012-01-23', 98, 27);
INSERT INTO public.tariff_service_inclusion VALUES (22, '2004-08-08', '2006-01-05', 99, 40);
INSERT INTO public.tariff_service_inclusion VALUES (3, '2009-11-06', '2022-03-22', 100, 11);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 209
-- Name: basic_tariff_tariff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basic_tariff_tariff_id_seq', 1, false);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 215
-- Name: call_zone_call_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.call_zone_call_zone_id_seq', 1, false);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 220
-- Name: contract_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_client_id_seq', 1, false);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 219
-- Name: contract_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_contract_id_seq', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 235
-- Name: domestic_call_domestic_call_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domestic_call_domestic_call_id_seq', 1, false);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 213
-- Name: external_service_external_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.external_service_external_service_id_seq', 1, false);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 230
-- Name: external_service_inclusion_external_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.external_service_inclusion_external_service_id_seq', 1, false);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 233
-- Name: external_service_inclusion_external_service_inclusion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.external_service_inclusion_external_service_inclusion_id_seq', 1, false);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 228
-- Name: internal_service_inclusion_internal_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.internal_service_inclusion_internal_service_id_seq', 1, false);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 234
-- Name: internal_service_inclusion_internal_service_inclusion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.internal_service_inclusion_internal_service_inclusion_id_seq', 1, false);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 211
-- Name: internal_service_internal_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.internal_service_internal_service_id_seq', 1, false);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 226
-- Name: international_call_call_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.international_call_call_zone_id_seq', 1, false);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 225
-- Name: international_call_international_call_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.international_call_international_call_id_seq', 1, false);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 237
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 222
-- Name: phone_on_tariff_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phone_on_tariff_contract_id_seq', 1, false);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 236
-- Name: tariff_service_inclusion_tariff_service_inclusion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tariff_service_inclusion_tariff_service_inclusion_id_seq', 1, false);


--
-- TOC entry 3257 (class 2606 OID 16534)
-- Name: call_zone call_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_zone
    ADD CONSTRAINT call_zone_pkey PRIMARY KEY (call_zone_id);


--
-- TOC entry 3259 (class 2606 OID 16560)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- TOC entry 3263 (class 2606 OID 16571)
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (contract_id);


--
-- TOC entry 3267 (class 2606 OID 16872)
-- Name: domestic_call domestic_call_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT domestic_call_id_unique UNIQUE (domestic_call_id);


--
-- TOC entry 3269 (class 2606 OID 16707)
-- Name: domestic_call domestic_call_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT domestic_call_pkey PRIMARY KEY (domestic_call_id);


--
-- TOC entry 3275 (class 2606 OID 16691)
-- Name: external_service_inclusion external_service_inclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT external_service_inclusion_pkey PRIMARY KEY (external_service_inclusion_id);


--
-- TOC entry 3255 (class 2606 OID 16520)
-- Name: external_service external_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service
    ADD CONSTRAINT external_service_pkey PRIMARY KEY (external_service_id);


--
-- TOC entry 3273 (class 2606 OID 16699)
-- Name: internal_service_inclusion internal_service_inclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT internal_service_inclusion_pkey PRIMARY KEY (internal_service_inclusion_id);


--
-- TOC entry 3253 (class 2606 OID 16500)
-- Name: internal_service internal_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service
    ADD CONSTRAINT internal_service_pkey PRIMARY KEY (internal_service_id);


--
-- TOC entry 3271 (class 2606 OID 16614)
-- Name: international_call international_call_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT international_call_pkey PRIMARY KEY (international_call_id);


--
-- TOC entry 3261 (class 2606 OID 16750)
-- Name: client passport_series_and_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT passport_series_and_number_unique UNIQUE (passport_series_and_number);


--
-- TOC entry 3279 (class 2606 OID 16980)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 3265 (class 2606 OID 16784)
-- Name: phone_on_tariff phone_on_tariff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT phone_on_tariff_pkey PRIMARY KEY (phone_on_tariff_number);


--
-- TOC entry 3251 (class 2606 OID 16444)
-- Name: basic_tariff tariff_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_tariff
    ADD CONSTRAINT tariff_id_pkey PRIMARY KEY (tariff_id);


--
-- TOC entry 3277 (class 2606 OID 16715)
-- Name: tariff_service_inclusion tariff_service_inclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT tariff_service_inclusion_pkey PRIMARY KEY (tariff_service_inclusion_id);


--
-- TOC entry 3284 (class 2606 OID 16615)
-- Name: international_call call_zone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT call_zone_id_fkey FOREIGN KEY (call_zone_id) REFERENCES public.call_zone(call_zone_id);


--
-- TOC entry 3280 (class 2606 OID 16572)
-- Name: contract client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- TOC entry 3288 (class 2606 OID 16649)
-- Name: external_service_inclusion external_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT external_service_id_fkey FOREIGN KEY (external_service_id) REFERENCES public.external_service(external_service_id);


--
-- TOC entry 3286 (class 2606 OID 16634)
-- Name: internal_service_inclusion internal_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT internal_service_id_fkey FOREIGN KEY (internal_service_id) REFERENCES public.internal_service(internal_service_id);


--
-- TOC entry 3285 (class 2606 OID 17018)
-- Name: international_call international_call_phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT international_call_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number) NOT VALID;


--
-- TOC entry 3292 (class 2606 OID 16981)
-- Name: payment payment_phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);


--
-- TOC entry 3283 (class 2606 OID 16795)
-- Name: domestic_call phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);


--
-- TOC entry 3287 (class 2606 OID 16986)
-- Name: internal_service_inclusion phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);


--
-- TOC entry 3289 (class 2606 OID 16996)
-- Name: external_service_inclusion phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);


--
-- TOC entry 3282 (class 2606 OID 17013)
-- Name: phone_on_tariff phone_on_tariff_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT phone_on_tariff_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contract(contract_id) NOT VALID;


--
-- TOC entry 3291 (class 2606 OID 17006)
-- Name: tariff_service_inclusion service_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT service_id FOREIGN KEY (internal_service_id) REFERENCES public.internal_service(internal_service_id) NOT VALID;


--
-- TOC entry 3281 (class 2606 OID 16584)
-- Name: phone_on_tariff tariff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT tariff_id_fkey FOREIGN KEY (tariff_id) REFERENCES public.basic_tariff(tariff_id);


--
-- TOC entry 3290 (class 2606 OID 16716)
-- Name: tariff_service_inclusion tariff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT tariff_id_fkey FOREIGN KEY (tariff_id) REFERENCES public.basic_tariff(tariff_id) ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2023-10-27 14:58:45

--
-- PostgreSQL database dump complete
--

