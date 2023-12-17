--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-23 17:42:20

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
-- TOC entry 6 (class 2615 OID 16918)
-- Name: Schema carsharing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Schema carsharing";


ALTER SCHEMA "Schema carsharing" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16919)
-- Name: Accident; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Accident" (
    accident_id integer NOT NULL,
    contract_id integer NOT NULL,
    cost_of_damage double precision NOT NULL,
    description_of_damage text NOT NULL,
    date_and_time_of_the_accident text NOT NULL,
    the_culprit character varying(20) NOT NULL
);


ALTER TABLE "Schema carsharing"."Accident" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16925)
-- Name: Accident_accident_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Accident" ALTER COLUMN accident_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Accident_accident_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16926)
-- Name: Act; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Act" (
    act_id integer NOT NULL,
    contract_id integer NOT NULL,
    date_of_conclusion timestamp with time zone NOT NULL,
    type_of_act character varying(20) NOT NULL
);


ALTER TABLE "Schema carsharing"."Act" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16932)
-- Name: Act_act_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Act" ALTER COLUMN act_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Act_act_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16933)
-- Name: Cars; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Cars" (
    car_id integer NOT NULL,
    model_id integer NOT NULL,
    body_number integer NOT NULL,
    engine_number integer NOT NULL,
    release_year integer NOT NULL,
    mileage integer NOT NULL,
    ts_date timestamp with time zone NOT NULL,
    special_marks text,
    return_mark text NOT NULL,
    reg_number text NOT NULL
);


ALTER TABLE "Schema carsharing"."Cars" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16938)
-- Name: Cars_car_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Cars" ALTER COLUMN car_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Cars_car_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16939)
-- Name: Clients; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Clients" (
    client_id integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronym character varying(20) NOT NULL,
    passport character varying(20) NOT NULL,
    contracts_sum double precision NOT NULL,
    discount integer,
    phone_and_email character varying(50)
);


ALTER TABLE "Schema carsharing"."Clients" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16949)
-- Name: Clients_client_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Clients" ALTER COLUMN client_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Clients_client_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16950)
-- Name: Contract; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Contract" (
    contract_id integer NOT NULL,
    car_id integer NOT NULL,
    client_id integer NOT NULL,
    staff_id integer NOT NULL,
    delay double precision NOT NULL,
    start_date_and_time timestamp with time zone NOT NULL,
    end_date_and_time timestamp with time zone NOT NULL,
    act_id integer NOT NULL,
    insuranse_id integer,
    status integer
);


ALTER TABLE "Schema carsharing"."Contract" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16956)
-- Name: Contract extension; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Contract extension" (
    extension_id integer NOT NULL,
    contract_id integer NOT NULL,
    start_date_and_time timestamp with time zone NOT NULL,
    end_date_and_time timestamp with time zone NOT NULL
);


ALTER TABLE "Schema carsharing"."Contract extension" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16959)
-- Name: Contract extension_extension_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Contract extension" ALTER COLUMN extension_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Contract extension_extension_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16960)
-- Name: Contract_contract_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Contract" ALTER COLUMN contract_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Contract_contract_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16961)
-- Name: Insurance; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Insurance" (
    insurance_id integer NOT NULL,
    model_id integer NOT NULL,
    contract_id integer NOT NULL,
    type_of_insurance text NOT NULL,
    cost double precision NOT NULL
);


ALTER TABLE "Schema carsharing"."Insurance" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16966)
-- Name: Insurance_insurance_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Insurance" ALTER COLUMN insurance_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Insurance_insurance_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16967)
-- Name: Model; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Model" (
    model_id integer NOT NULL,
    id_rental_rate integer NOT NULL,
    brand character varying(20) NOT NULL,
    model_name character varying(20) NOT NULL,
    deposit double precision NOT NULL,
    description character varying(20) NOT NULL,
    characteristics character varying(200) NOT NULL,
    price_of_the_car double precision NOT NULL
);


ALTER TABLE "Schema carsharing"."Model" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16976)
-- Name: Model_model_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Model" ALTER COLUMN model_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Model_model_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16977)
-- Name: Position; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Position" (
    position_code integer NOT NULL,
    position_title character varying(30) NOT NULL,
    salary double precision NOT NULL,
    responsibilities character varying(100) NOT NULL
);


ALTER TABLE "Schema carsharing"."Position" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16984)
-- Name: Position_position_code_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Position" ALTER COLUMN position_code ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Position_position_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16985)
-- Name: Rental rate; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Rental rate" (
    id_rental_rate integer NOT NULL,
    rental_period_hours integer NOT NULL,
    car_rental_price double precision NOT NULL
);


ALTER TABLE "Schema carsharing"."Rental rate" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16988)
-- Name: Rental rate_id_rental_rate_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Rental rate" ALTER COLUMN id_rental_rate ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Rental rate_id_rental_rate_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16989)
-- Name: Staff; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Staff" (
    staff_id integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronym character varying(20) NOT NULL,
    contacts character varying(50) NOT NULL,
    position_code integer NOT NULL,
    password integer
);


ALTER TABLE "Schema carsharing"."Staff" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16998)
-- Name: Staff_staff_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Staff" ALTER COLUMN staff_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Staff_staff_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 16999)
-- Name: Type of violation; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Type of violation" (
    violation_code integer NOT NULL,
    title character varying(80) NOT NULL,
    disenfranchisement_indicator integer NOT NULL,
    the_amount_of_the_fine double precision NOT NULL
);


ALTER TABLE "Schema carsharing"."Type of violation" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17005)
-- Name: Type of violation_violation_code_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Type of violation" ALTER COLUMN violation_code ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Type of violation_violation_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 17006)
-- Name: Violations; Type: TABLE; Schema: Schema carsharing; Owner: postgres
--

CREATE TABLE "Schema carsharing"."Violations" (
    violation_id integer NOT NULL,
    accident_id integer NOT NULL,
    payer character varying(20) NOT NULL,
    date_and_time_of_violation date NOT NULL,
    contract_id integer NOT NULL,
    violation_code integer NOT NULL
);


ALTER TABLE "Schema carsharing"."Violations" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17012)
-- Name: Violations_violation_id_seq; Type: SEQUENCE; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Violations" ALTER COLUMN violation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Schema carsharing"."Violations_violation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4934 (class 0 OID 16919)
-- Dependencies: 216
-- Data for Name: Accident; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Accident" (accident_id, contract_id, cost_of_damage, description_of_damage, date_and_time_of_the_accident, the_culprit) FROM stdin;
1	1	5000	Minor scratch on the rear bumper	2023-10-05 09:15:00	Unknown
2	2	8000	Dent on the front left fender	2023-11-12 15:30:00	John Doe
3	3	15000	Significant damage to the driver-side door	2024-01-20 14:45:00	Alice Smith
4	4	3500	Scratch on the rear left side panel	2024-04-18 10:20:00	Unknown
5	5	2000	Minor dent on the trunk	2024-07-24 13:10:00	Bob Johnson
6	6	12000	Front-end collision, extensive damage	2023-12-07 16:55:00	Emily Brown
7	7	6500	Dent on the rear right side panel	2024-03-15 08:45:00	Unknown
8	8	3000	Scratch on the rear bumper	2023-10-28 11:40:00	David Wilson
9	9	7500	Major damage to the front right side	2024-02-25 17:25:00	Sophia Davis
10	10	9500	Damage to the windshield and roof	2024-05-30 12:30:00	Linda Martinez
11	1	4500	Scratch on the driver-side door	2023-10-15 14:55:00	Unknown
12	2	11000	Major damage to the rear bumper	2023-11-20 10:10:00	Chris Johnson
13	3	4000	Minor dent on the rear right fender	2024-01-22 09:30:00	Unknown
14	4	9500	Rear-end collision, significant damage	2024-04-28 15:15:00	James White
15	5	1800	Scratch on the front left fender	2024-07-28 14:20:00	Unknown
16	6	22000	Extensive damage to the front and rear	2023-12-10 08:10:00	Emma Turner
17	7	3000	Scratch on the rear bumper	2024-03-18 16:40:00	Unknown
18	8	5500	Dent on the rear left side panel	2023-10-31 11:25:00	Oliver Parker
19	9	6500	Dent on the front right fender	2024-03-05 12:15:00	Unknown
20	10	16000	Front-end collision, extensive damage	2024-06-05 13:35:00	Ella Wilson
\.


--
-- TOC entry 4936 (class 0 OID 16926)
-- Dependencies: 218
-- Data for Name: Act; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Act" (act_id, contract_id, date_of_conclusion, type_of_act) FROM stdin;
1	1	2023-10-01 00:00:00+03	lease start
2	2	2023-11-05 00:00:00+03	lease start
3	3	2024-01-02 00:00:00+03	lease start
4	4	2024-04-03 00:00:00+03	lease start
5	5	2024-07-06 00:00:00+03	lease start
6	6	2023-12-15 00:00:00+03	lease start
7	7	2024-03-10 00:00:00+03	lease start
8	8	2023-10-21 00:00:00+03	lease start
9	9	2024-02-20 00:00:00+03	lease start
10	10	2024-05-18 00:00:00+03	lease start
11	1	2023-10-10 00:00:00+03	lease end
12	2	2023-11-15 00:00:00+03	lease end
13	3	2024-01-12 00:00:00+03	lease end
14	4	2024-04-13 00:00:00+03	lease end
15	5	2024-07-16 00:00:00+03	lease end
16	6	2023-12-25 00:00:00+03	lease end
17	7	2024-03-20 00:00:00+03	lease end
18	8	2023-10-31 00:00:00+03	lease end
19	9	2024-02-29 00:00:00+03	lease end
20	10	2024-05-28 00:00:00+03	lease end
\.


--
-- TOC entry 4938 (class 0 OID 16933)
-- Dependencies: 220
-- Data for Name: Cars; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Cars" (car_id, model_id, body_number, engine_number, release_year, mileage, ts_date, special_marks, return_mark, reg_number) FROM stdin;
1	1	12345	67890	2020	15000	2023-01-15 00:00:00+03	None	Good	ABC123
2	2	54321	9876	2019	20000	2023-02-10 00:00:00+03	Scratch on the door	Good	XYZ789
3	3	67890	54321	2022	8000	2023-03-05 00:00:00+03	None	Excellent	LMN456
4	4	45678	12345	2021	30000	2023-04-20 00:00:00+03	Dent on the hood	Good	DEF789
5	5	90123	34567	2018	35000	2023-05-25 00:00:00+03	None	Fair	PQR123
6	6	23456	78901	2023	1000	2023-06-30 00:00:00+03	None	Excellent	GHI234
7	7	56789	23456	2017	42000	2023-07-12 00:00:00+03	Scratch on the bumper	Good	JKL567
8	8	78901	45678	2020	18000	2023-08-18 00:00:00+03	None	Good	UVW901
9	9	1234	90123	2022	9000	2023-09-22 00:00:00+03	None	Excellent	MNO890
10	10	34567	56789	2019	25000	2023-10-09 00:00:00+03	Dent on the side	Good	RST345
11	11	89012	67890	2021	28000	2023-11-14 00:00:00+03	None	Good	CDE456
12	12	45678	78901	2023	500	2023-12-02 00:00:00+03	None	Excellent	EFG678
13	13	12345	23456	2018	32000	2024-01-03 00:00:00+03	Scratch on the roof	Good	OPQ901
14	14	67890	90123	2020	14000	2024-02-28 00:00:00+03	None	Fair	HIJ234
15	15	54321	34567	2017	38000	2024-03-15 00:00:00+03	Dent on the trunk	Good	KLM789
16	16	1234	78901	2022	7500	2024-04-09 00:00:00+03	None	Excellent	TUV567
17	17	23456	56789	2019	22000	2024-05-22 00:00:00+03	Scratch on the fender	Good	XYZ123
18	18	90123	45678	2021	27000	2024-06-10 00:00:00+03	None	Good	ABC901
19	19	78901	67890	2023	800	2024-07-07 00:00:00+03	None	Excellent	MNO345
20	20	34567	12345	2020	16000	2024-08-20 00:00:00+03	None	Good	PQR678
\.


--
-- TOC entry 4940 (class 0 OID 16939)
-- Dependencies: 222
-- Data for Name: Clients; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Clients" (client_id, name, surname, patronym, passport, contracts_sum, discount, phone_and_email) FROM stdin;
1	Daria	Ivanova	Vladimirovna	4218 167234	400	0	8 981 567 15 76, DariaIvanova@gmail.com
2	Irina	Vasilieva	Antonovna	4218 538012	20000	40	8 981 193 93 62, Irina1999@gmail.com
3	Oleg	Matveev	Sergeevich	4218 539201	100	0	8 981 638 22 09, Matveev2003@gmail.com
4	Roman	Sergeev	Alexandrovich	4218 243540	9000	30	8 981 193 93 62, RomanSergeev@gmail.com
5	Irina	Akimova	Romanovna	4218 538012	7000	30	8 981 193 93 62, Irina1999@gmail.com
6	Polina	Mihailovna	Valerievna	4218 538012	10000	35	8 981 193 93 62, Pln1425@gmail.com
7	Alisa	Kustova	Maximovna	4218 569032	4000	20	8 981 193 93 62, Kustova1999@gmail.com
8	Nikita	Lebedev	Borisovich	4117 538012	5500	25	8 981 122 56 55, NikitaLebedev@gmail.com
9	Alina	Evseeva	Artemovna	4218 241594	500	10	8 981 193 93 62, Irina1999@gmail.com
10	Maxim	Stepanov	Igorevich	4218 647392	5000	30	8 981 463 09 17, MaximStepanov@gmail.com
\.


--
-- TOC entry 4942 (class 0 OID 16950)
-- Dependencies: 224
-- Data for Name: Contract; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Contract" (contract_id, car_id, client_id, staff_id, delay, start_date_and_time, end_date_and_time, act_id, insuranse_id, status) FROM stdin;
1	1	1	1	0	2023-10-01 08:00:00+03	2023-10-10 16:00:00+03	1	\N	\N
2	2	2	2	0	2023-11-05 10:00:00+03	2023-11-15 18:00:00+03	2	\N	\N
3	3	3	3	0	2024-01-02 14:00:00+03	2024-01-12 22:00:00+03	3	\N	\N
4	4	4	4	0	2024-04-03 12:00:00+03	2024-04-13 20:00:00+03	4	\N	\N
5	5	5	5	0	2024-07-06 08:00:00+03	2024-07-16 16:00:00+03	5	\N	\N
6	6	6	6	0	2023-12-15 10:00:00+03	2023-12-25 18:00:00+03	6	\N	\N
7	7	7	7	0	2024-03-10 14:00:00+03	2024-03-20 22:00:00+03	7	\N	\N
8	8	8	8	0	2023-10-21 12:00:00+03	2023-10-31 20:00:00+03	8	\N	\N
9	9	9	9	0	2024-02-20 08:00:00+03	2024-02-29 16:00:00+03	9	\N	\N
10	10	10	10	0	2024-05-18 10:00:00+03	2024-05-28 18:00:00+03	10	\N	\N
11	1	2	3	0	2023-11-01 14:00:00+03	2023-11-10 22:00:00+03	11	\N	\N
12	2	3	4	0	2023-12-02 12:00:00+03	2023-12-12 20:00:00+03	12	\N	\N
13	3	4	5	0	2024-02-05 08:00:00+03	2024-02-15 16:00:00+03	13	\N	\N
14	4	5	6	0	2024-03-10 10:00:00+03	2024-03-20 18:00:00+03	14	\N	\N
15	5	6	7	0	2023-12-25 14:00:00+03	2024-01-04 22:00:00+03	15	\N	\N
16	6	7	8	0	2024-01-15 12:00:00+03	2024-01-25 20:00:00+03	16	\N	\N
17	7	8	9	0	2024-04-14 08:00:00+03	2024-04-24 16:00:00+03	17	\N	\N
18	8	9	10	0	2024-05-20 10:00:00+03	2024-05-30 18:00:00+03	18	\N	\N
19	9	10	1	0	2024-03-25 14:00:00+03	2024-04-04 22:00:00+03	19	\N	\N
20	10	1	2	0	2024-02-15 12:00:00+03	2024-02-25 20:00:00+03	20	\N	\N
\.


--
-- TOC entry 4943 (class 0 OID 16956)
-- Dependencies: 225
-- Data for Name: Contract extension; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Contract extension" (extension_id, contract_id, start_date_and_time, end_date_and_time) FROM stdin;
1	1	2023-11-01 12:00:00+03	2023-11-08 12:00:00+03
2	2	2023-12-05 10:00:00+03	2023-12-12 10:00:00+03
3	3	2024-02-01 14:00:00+03	2024-02-08 14:00:00+03
4	4	2024-05-15 08:00:00+03	2024-05-22 08:00:00+03
5	5	2024-08-10 09:00:00+03	2024-08-17 09:00:00+03
6	6	2023-12-25 15:00:00+03	2024-01-01 15:00:00+03
7	7	2024-04-05 13:00:00+03	2024-04-12 13:00:00+03
8	8	2023-11-21 11:00:00+03	2023-11-28 11:00:00+03
9	9	2024-03-01 09:00:00+03	2024-03-08 09:00:00+03
10	10	2024-06-05 14:00:00+03	2024-06-12 14:00:00+03
11	1	2023-11-08 12:00:00+03	2023-11-15 12:00:00+03
12	2	2023-12-12 10:00:00+03	2023-12-19 10:00:00+03
13	3	2024-02-08 14:00:00+03	2024-02-15 14:00:00+03
14	4	2024-05-22 08:00:00+03	2024-05-29 08:00:00+03
15	5	2024-08-17 09:00:00+03	2024-08-24 09:00:00+03
16	6	2024-01-01 15:00:00+03	2024-01-08 15:00:00+03
17	7	2024-04-12 13:00:00+03	2024-04-19 13:00:00+03
18	8	2023-11-28 11:00:00+03	2023-12-05 11:00:00+03
19	9	2024-03-08 09:00:00+03	2024-03-15 09:00:00+03
20	10	2024-06-12 14:00:00+03	2024-06-19 14:00:00+03
\.


--
-- TOC entry 4946 (class 0 OID 16961)
-- Dependencies: 228
-- Data for Name: Insurance; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Insurance" (insurance_id, model_id, contract_id, type_of_insurance, cost) FROM stdin;
1	1	1	Comprehensive	5000
2	2	2	Liability	8000
3	3	3	Comprehensive	15000
4	4	4	Liability	3500
5	5	5	Comprehensive	2000
6	6	6	Liability	12000
7	7	7	Comprehensive	6500
8	8	8	Liability	3000
9	9	9	Comprehensive	7500
10	10	10	Liability	9500
11	1	11	Comprehensive	4500
12	2	12	Liability	11000
13	3	13	Comprehensive	4000
14	4	14	Liability	9500
15	5	15	Comprehensive	1800
16	6	16	Liability	22000
17	7	17	Comprehensive	3000
18	8	18	Liability	5500
19	9	19	Comprehensive	6500
20	10	20	Liability	16000
\.


--
-- TOC entry 4948 (class 0 OID 16967)
-- Dependencies: 230
-- Data for Name: Model; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Model" (model_id, id_rental_rate, brand, model_name, deposit, description, characteristics, price_of_the_car) FROM stdin;
1	1	Toyota	Camry	500	Midsize sedan	4-door, 2.5L engine, automatic transmission	25000
2	2	Honda	Civic	400	Compact car	4-door, 1.8L engine, manual transmission	22000
3	7	Ford	Escape	600	Compact SUV	4-door, 2.0L engine, automatic transmission	28000
4	12	Nissan	Altima	550	Midsize sedan	4-door, 2.5L engine, automatic transmission	26000
5	11	Chevrolet	Cruze	450	Compact car	4-door, 1.4L engine, automatic transmission	21000
6	4	Jeep	Wrangler	700	Off-road SUV	2-door, 3.6L engine, manual transmission	32000
7	17	Hyundai	Elantra	400	Compact car	4-door, 2.0L engine, automatic transmission	20000
8	3	Subaru	Outback	650	Midsize SUV	4-door, 2.5L engine, automatic transmission	30000
9	18	Volkswagen	Jetta	450	Compact car	4-door, 1.4L engine, automatic transmission	22000
10	15	BMW	3 Series	800	Luxury sedan	4-door, 2.0L engine, automatic transmission	40000
11	10	Audi	Q5	750	Luxury SUV	4-door, 2.0L engine, automatic transmission	45000
12	5	Mercedes-Benz	C-Class	800	Luxury sedan	4-door, 2.0L engine, automatic transmission	42000
13	6	Kia	Sportage	550	Compact SUV	4-door, 2.4L engine, automatic transmission	26000
14	13	Ford	F-150	1000	Full-size pickup	2-door, 5.0L engine, automatic transmission	35000
15	19	Mazda	Mazda3	400	Compact car	4-door, 2.0L engine, manual transmission	22000
16	20	Lexus	RX	750	Luxury SUV	4-door, 3.5L engine, automatic transmission	50000
17	8	Acura	MDX	700	Luxury SUV	4-door, 3.5L engine, automatic transmission	48000
18	14	Chevrolet	Silverado	1000	Full-size pickup	2-door, 5.3L engine, automatic transmission	37000
19	16	Volvo	XC60	650	Midsize SUV	4-door, 2.0L engine, automatic transmission	32000
20	9	Mitsubishi	Outlander	550	Compact SUV	4-door, 2.4L engine, automatic transmission	25000
\.


--
-- TOC entry 4950 (class 0 OID 16977)
-- Dependencies: 232
-- Data for Name: Position; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Position" (position_code, position_title, salary, responsibilities) FROM stdin;
1	Head of Transport	200000	Cars Allocation
2	Head of Development	400000	The running of an IT
3	CEO	400000	Commercial director
4	PR manager	300000	Marketing and advertisment
5	Tech Supervisor	200000	Mechanical support and park renewing
6	HR Superviser	300000	Human resources managing and hiring
7	Call Center Manager	50000	User guidance and feedback receiving by phone
8	Support manager	70000	User guidance and feedback receiving by app or website
9	Mechanic	50000	Cars repairing
10	B2B Director	250000	Bussiness sales running
11	Lawyer	150000	Consulting and documents creating
\.


--
-- TOC entry 4952 (class 0 OID 16985)
-- Dependencies: 234
-- Data for Name: Rental rate; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Rental rate" (id_rental_rate, rental_period_hours, car_rental_price) FROM stdin;
1	1	1500
2	2	1200
3	5	1000
4	12	1300
5	24	1800
6	1	1300
7	2	1100
8	5	1400
9	12	1700
10	24	1900
11	1	1400
12	2	1500
13	5	1600
14	12	1900
15	24	2000
16	1	1200
17	2	1600
18	5	1100
19	12	1500
20	24	1700
\.


--
-- TOC entry 4954 (class 0 OID 16989)
-- Dependencies: 236
-- Data for Name: Staff; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Staff" (staff_id, name, surname, patronym, contacts, position_code, password) FROM stdin;
1	John	Doe	Smith	john.doe@example.com	1	\N
2	Alice	Johnson	Williams	alice.johnson@example.com	2	\N
3	Bob	Brown	Davis	bob.brown@example.com	3	\N
4	Catherine	Miller	Jones	catherine.miller@example.com	4	\N
5	David	Taylor	Wilson	david.taylor@example.com	5	\N
6	Ella	Martinez	Clark	ella.martinez@example.com	6	\N
7	Frank	Harris	Allen	frank.harris@example.com	7	\N
8	Grace	Lee	Parker	grace.lee@example.com	8	\N
9	Harry	White	Moore	harry.white@example.com	9	\N
10	Isabel	Anderson	Young	isabel.anderson@example.com	10	\N
11	James	Thompson	Hall	james.thompson@example.com	11	\N
\.


--
-- TOC entry 4956 (class 0 OID 16999)
-- Dependencies: 238
-- Data for Name: Type of violation; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Type of violation" (violation_code, title, disenfranchisement_indicator, the_amount_of_the_fine) FROM stdin;
1	Speeding (Exceeding the speed limit)	1	10000
2	Running a red light	1	10000
3	Driving without a valid driver's license	1	10000
4	Not wearing a seatbelt	1	1000
5	Using a mobile phone while driving (without hands-free)	1	3000
6	Overtaking in a no-passing zone	1	5000
7	Driving under the influence of alcohol or drugs	1	20000
8	Failing to yield the right of way	1	7000
9	Illegal parking	0	1000
10	Ignoring a stop sign	1	5000
11	Not using turn signals when changing lanes	0	1000
12	Driving without insurance	1	10000
13	Not stopping for pedestrians at a crosswalk	1	5000
14	Reckless driving	1	10000
15	Failing to use headlights at night	1	2000
16	Blocking a fire hydrant	1	5000
17	Driving on the wrong side of the road	1	5000
18	Making an illegal U-turn	1	3000
19	Disobeying traffic signs and signals	1	7000
20	Driving without proper registration	1	5000
\.


--
-- TOC entry 4958 (class 0 OID 17006)
-- Dependencies: 240
-- Data for Name: Violations; Type: TABLE DATA; Schema: Schema carsharing; Owner: postgres
--

COPY "Schema carsharing"."Violations" (violation_id, accident_id, payer, date_and_time_of_violation, contract_id, violation_code) FROM stdin;
1	1	Daria Ivanova	2023-10-05	1	1
2	2	Irina Vasilieva	2023-11-12	2	2
3	3	Oleg Matveev	2024-01-20	3	3
4	4	Roman Sergeev	2024-04-18	4	4
5	5	Irina Akimova	2024-07-24	5	1
6	6	Polina Mihailovna	2023-12-07	6	2
7	7	Alisa Kustova	2024-03-15	7	3
8	8	Nikita Lebedev	2023-10-28	8	4
9	9	Alina Evseeva	2024-02-25	9	1
10	10	Maxim Stepanov	2024-05-30	10	2
11	1	Daria Ivanova	2023-10-15	1	3
12	2	Irina Vasilieva	2023-11-20	2	4
13	3	Oleg Matveev	2024-01-22	3	1
14	4	Roman Sergeev	2024-04-28	4	2
15	5	Irina Akimova	2024-07-28	5	3
16	6	Polina Mihailovna	2023-12-10	6	4
17	7	Alisa Kustova	2024-03-18	7	1
18	8	Nikita Lebedev	2023-10-31	8	2
19	9	Alina Evseeva	2024-03-05	9	3
20	10	Maxim Stepanov	2024-06-05	10	4
\.


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 217
-- Name: Accident_accident_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Accident_accident_id_seq"', 20, true);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 219
-- Name: Act_act_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Act_act_id_seq"', 20, true);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 221
-- Name: Cars_car_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Cars_car_id_seq"', 20, true);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 223
-- Name: Clients_client_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Clients_client_id_seq"', 10, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 226
-- Name: Contract extension_extension_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Contract extension_extension_id_seq"', 20, true);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 227
-- Name: Contract_contract_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Contract_contract_id_seq"', 20, true);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 229
-- Name: Insurance_insurance_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Insurance_insurance_id_seq"', 20, true);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 231
-- Name: Model_model_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Model_model_id_seq"', 20, true);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 233
-- Name: Position_position_code_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Position_position_code_seq"', 11, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 235
-- Name: Rental rate_id_rental_rate_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Rental rate_id_rental_rate_seq"', 20, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 237
-- Name: Staff_staff_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Staff_staff_id_seq"', 11, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 239
-- Name: Type of violation_violation_code_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Type of violation_violation_code_seq"', 20, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 241
-- Name: Violations_violation_id_seq; Type: SEQUENCE SET; Schema: Schema carsharing; Owner: postgres
--

SELECT pg_catalog.setval('"Schema carsharing"."Violations_violation_id_seq"', 20, true);


--
-- TOC entry 4752 (class 2606 OID 17014)
-- Name: Accident Accident_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Accident"
    ADD CONSTRAINT "Accident_pkey" PRIMARY KEY (accident_id);


--
-- TOC entry 4754 (class 2606 OID 17016)
-- Name: Act Act_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Act"
    ADD CONSTRAINT "Act_pkey" PRIMARY KEY (act_id);


--
-- TOC entry 4756 (class 2606 OID 17018)
-- Name: Cars Cars_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Cars"
    ADD CONSTRAINT "Cars_pkey" PRIMARY KEY (car_id);


--
-- TOC entry 4758 (class 2606 OID 17020)
-- Name: Clients Clients_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Clients"
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (client_id);


--
-- TOC entry 4762 (class 2606 OID 17022)
-- Name: Contract extension Contract extension_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Contract extension"
    ADD CONSTRAINT "Contract extension_pkey" PRIMARY KEY (extension_id);


--
-- TOC entry 4764 (class 2606 OID 17024)
-- Name: Insurance Insurance_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Insurance"
    ADD CONSTRAINT "Insurance_pkey" PRIMARY KEY (insurance_id);


--
-- TOC entry 4766 (class 2606 OID 17026)
-- Name: Model Model_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Model"
    ADD CONSTRAINT "Model_pkey" PRIMARY KEY (model_id);


--
-- TOC entry 4770 (class 2606 OID 17028)
-- Name: Rental rate Rental rate_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Rental rate"
    ADD CONSTRAINT "Rental rate_pkey" PRIMARY KEY (id_rental_rate);


--
-- TOC entry 4772 (class 2606 OID 17030)
-- Name: Staff Staff_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Staff"
    ADD CONSTRAINT "Staff_pkey" PRIMARY KEY (staff_id);


--
-- TOC entry 4774 (class 2606 OID 17032)
-- Name: Type of violation Type of violation_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Type of violation"
    ADD CONSTRAINT "Type of violation_pkey" PRIMARY KEY (violation_code);


--
-- TOC entry 4776 (class 2606 OID 17034)
-- Name: Violations Violations_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Violations"
    ADD CONSTRAINT "Violations_pkey" PRIMARY KEY (violation_id);


--
-- TOC entry 4749 (class 2606 OID 17289)
-- Name: Contract check_date; Type: CHECK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Contract"
    ADD CONSTRAINT check_date CHECK ((start_date_and_time < end_date_and_time)) NOT VALID;


--
-- TOC entry 4750 (class 2606 OID 17288)
-- Name: Contract check_status; Type: CHECK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE "Schema carsharing"."Contract"
    ADD CONSTRAINT check_status CHECK (((status >= 0) AND (status <= 1))) NOT VALID;


--
-- TOC entry 4760 (class 2606 OID 17036)
-- Name: Contract contract_id_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Contract"
    ADD CONSTRAINT contract_id_pkey PRIMARY KEY (contract_id);


--
-- TOC entry 4768 (class 2606 OID 17038)
-- Name: Position position_pkey; Type: CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (position_code);


--
-- TOC entry 4777 (class 2606 OID 17039)
-- Name: Accident Accident_contract_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Accident"
    ADD CONSTRAINT "Accident_contract_id_fkey" FOREIGN KEY (contract_id) REFERENCES "Schema carsharing"."Contract"(contract_id);


--
-- TOC entry 4778 (class 2606 OID 17044)
-- Name: Act Act_contract_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Act"
    ADD CONSTRAINT "Act_contract_id_fkey" FOREIGN KEY (contract_id) REFERENCES "Schema carsharing"."Contract"(contract_id);


--
-- TOC entry 4779 (class 2606 OID 17049)
-- Name: Cars Cars_model_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Cars"
    ADD CONSTRAINT "Cars_model_id_fkey" FOREIGN KEY (model_id) REFERENCES "Schema carsharing"."Model"(model_id);


--
-- TOC entry 4784 (class 2606 OID 17054)
-- Name: Contract extension Contract extension_contract_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Contract extension"
    ADD CONSTRAINT "Contract extension_contract_id_fkey" FOREIGN KEY (contract_id) REFERENCES "Schema carsharing"."Contract"(contract_id);


--
-- TOC entry 4780 (class 2606 OID 17059)
-- Name: Contract Contract_car_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Contract"
    ADD CONSTRAINT "Contract_car_id_fkey" FOREIGN KEY (car_id) REFERENCES "Schema carsharing"."Cars"(car_id);


--
-- TOC entry 4781 (class 2606 OID 17064)
-- Name: Contract Contract_client_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Contract"
    ADD CONSTRAINT "Contract_client_id_fkey" FOREIGN KEY (client_id) REFERENCES "Schema carsharing"."Clients"(client_id);


--
-- TOC entry 4782 (class 2606 OID 17235)
-- Name: Contract Contract_insuranse_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Contract"
    ADD CONSTRAINT "Contract_insuranse_id_fkey" FOREIGN KEY (insuranse_id) REFERENCES "Schema carsharing"."Insurance"(insurance_id) NOT VALID;


--
-- TOC entry 4783 (class 2606 OID 17069)
-- Name: Contract Contract_staff_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Contract"
    ADD CONSTRAINT "Contract_staff_id_fkey" FOREIGN KEY (staff_id) REFERENCES "Schema carsharing"."Staff"(staff_id);


--
-- TOC entry 4785 (class 2606 OID 17079)
-- Name: Insurance Insurance_model_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Insurance"
    ADD CONSTRAINT "Insurance_model_id_fkey" FOREIGN KEY (model_id) REFERENCES "Schema carsharing"."Model"(model_id);


--
-- TOC entry 4786 (class 2606 OID 17084)
-- Name: Model Model_id_rental_rate_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Model"
    ADD CONSTRAINT "Model_id_rental_rate_fkey" FOREIGN KEY (id_rental_rate) REFERENCES "Schema carsharing"."Rental rate"(id_rental_rate);


--
-- TOC entry 4787 (class 2606 OID 17089)
-- Name: Staff Staff_position_code_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Staff"
    ADD CONSTRAINT "Staff_position_code_fkey" FOREIGN KEY (position_code) REFERENCES "Schema carsharing"."Position"(position_code);


--
-- TOC entry 4788 (class 2606 OID 17094)
-- Name: Violations Violations_accident_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Violations"
    ADD CONSTRAINT "Violations_accident_id_fkey" FOREIGN KEY (accident_id) REFERENCES "Schema carsharing"."Accident"(accident_id);


--
-- TOC entry 4789 (class 2606 OID 17099)
-- Name: Violations Violations_contract_id_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Violations"
    ADD CONSTRAINT "Violations_contract_id_fkey" FOREIGN KEY (contract_id) REFERENCES "Schema carsharing"."Contract"(contract_id);


--
-- TOC entry 4790 (class 2606 OID 17104)
-- Name: Violations Violations_violation_code_fkey; Type: FK CONSTRAINT; Schema: Schema carsharing; Owner: postgres
--

ALTER TABLE ONLY "Schema carsharing"."Violations"
    ADD CONSTRAINT "Violations_violation_code_fkey" FOREIGN KEY (violation_code) REFERENCES "Schema carsharing"."Type of violation"(violation_code);


-- Completed on 2023-10-23 17:42:21

--
-- PostgreSQL database dump complete
--

