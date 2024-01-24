--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-20 23:07:46

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16492)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    passportid character varying(10) NOT NULL,
    phonenumber character varying(11) NOT NULL,
    email character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    CONSTRAINT client_email_check CHECK (((email)::text ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'::text)),
    CONSTRAINT client_passportid_check CHECK (((passportid)::text ~ '^[0-9]{10}$'::text)),
    CONSTRAINT client_phonenumber_check CHECK (((phonenumber)::text ~ '^[0-9]{11}$'::text))
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16491)
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 216
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- TOC entry 225 (class 1259 OID 24652)
-- Name: credit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit (
    id integer NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(30) NOT NULL,
    maximumamount numeric NOT NULL,
    interestrate real NOT NULL,
    CONSTRAINT credit_interestrate_check CHECK ((interestrate < (40)::double precision)),
    CONSTRAINT credit_maximumamount_check CHECK ((maximumamount > (0)::numeric))
);


ALTER TABLE public.credit OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24675)
-- Name: credit_agreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_agreement (
    id integer NOT NULL,
    currencyid integer NOT NULL,
    creditid integer NOT NULL,
    employeeid integer NOT NULL,
    clientid integer NOT NULL,
    dayofaccrual integer NOT NULL,
    plannedclosingdate date NOT NULL,
    interestamount numeric DEFAULT 0,
    interestrate real NOT NULL,
    currentdebt numeric DEFAULT 0,
    initialamount numeric NOT NULL,
    dateofopening date NOT NULL,
    dateofclosing date,
    CONSTRAINT credit_agreement_check CHECK ((plannedclosingdate > dateofopening)),
    CONSTRAINT credit_agreement_dayofaccrual_check CHECK (((dayofaccrual > 0) AND (dayofaccrual < 29))),
    CONSTRAINT credit_agreement_initialamount_check CHECK ((initialamount > (0)::numeric)),
    CONSTRAINT credit_agreement_interestrate_check CHECK ((interestrate < (40)::double precision))
);


ALTER TABLE public.credit_agreement OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24674)
-- Name: credit_agreement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credit_agreement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.credit_agreement_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 228
-- Name: credit_agreement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credit_agreement_id_seq OWNED BY public.credit_agreement.id;


--
-- TOC entry 224 (class 1259 OID 24651)
-- Name: credit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.credit_id_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 224
-- Name: credit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credit_id_seq OWNED BY public.credit.id;


--
-- TOC entry 235 (class 1259 OID 24760)
-- Name: credit_payment_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_payment_schedule (
    id integer NOT NULL,
    creditagreementid integer NOT NULL,
    plannedpaymentdate date NOT NULL,
    actualpaymentdate date,
    interestpayment numeric NOT NULL,
    creditpayment numeric NOT NULL
);


ALTER TABLE public.credit_payment_schedule OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24759)
-- Name: credit_payment_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credit_payment_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.credit_payment_schedule_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 234
-- Name: credit_payment_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credit_payment_schedule_id_seq OWNED BY public.credit_payment_schedule.id;


--
-- TOC entry 223 (class 1259 OID 16527)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    country character varying(20) NOT NULL
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16526)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.currency_id_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 222
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- TOC entry 227 (class 1259 OID 24664)
-- Name: deposit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposit (
    id integer NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(30) NOT NULL,
    minimumamount numeric NOT NULL,
    interestrate real NOT NULL,
    CONSTRAINT deposit_interestrate_check CHECK ((interestrate < (20)::double precision)),
    CONSTRAINT deposit_minimumamount_check CHECK ((minimumamount > (0)::numeric))
);


ALTER TABLE public.deposit OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24710)
-- Name: deposit_agreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposit_agreement (
    id integer NOT NULL,
    currencyid integer NOT NULL,
    depositid integer NOT NULL,
    employeeid integer NOT NULL,
    clientid integer NOT NULL,
    dayofaccrual integer NOT NULL,
    plannedclosingdate date NOT NULL,
    amountofpayments numeric DEFAULT 0,
    initialamount numeric NOT NULL,
    dateofopening date NOT NULL,
    dateofclosing date,
    CONSTRAINT deposit_agreement_check CHECK ((plannedclosingdate > dateofopening)),
    CONSTRAINT deposit_agreement_dayofaccrual_check CHECK (((dayofaccrual > 0) AND (dayofaccrual < 29))),
    CONSTRAINT deposit_agreement_initialamount_check CHECK ((initialamount > (0)::numeric))
);


ALTER TABLE public.deposit_agreement OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24709)
-- Name: deposit_agreement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposit_agreement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deposit_agreement_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 230
-- Name: deposit_agreement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposit_agreement_id_seq OWNED BY public.deposit_agreement.id;


--
-- TOC entry 226 (class 1259 OID 24663)
-- Name: deposit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deposit_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 226
-- Name: deposit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposit_id_seq OWNED BY public.deposit.id;


--
-- TOC entry 233 (class 1259 OID 24746)
-- Name: deposit_payment_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposit_payment_schedule (
    id integer NOT NULL,
    depositagreementid integer NOT NULL,
    plannedpaymentdate date NOT NULL,
    actualpaymentdate date,
    paymentamount numeric NOT NULL
);


ALTER TABLE public.deposit_payment_schedule OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24745)
-- Name: deposit_payment_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposit_payment_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deposit_payment_schedule_id_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 232
-- Name: deposit_payment_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposit_payment_schedule_id_seq OWNED BY public.deposit_payment_schedule.id;


--
-- TOC entry 221 (class 1259 OID 16510)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    passportid character varying(10) NOT NULL,
    phonenumber character varying(11) NOT NULL,
    email character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    dateofbirth character varying(10) NOT NULL,
    salary integer NOT NULL,
    categoryid integer NOT NULL,
    CONSTRAINT employee_email_check CHECK (((email)::text ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'::text)),
    CONSTRAINT employee_passportid_check CHECK (((passportid)::text ~ '^[0-9]{10}$'::text)),
    CONSTRAINT employee_phonenumber_check CHECK (((phonenumber)::text ~ '^[0-9]{11}$'::text)),
    CONSTRAINT employee_salary_check CHECK ((salary > 0))
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16502)
-- Name: employee_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_category (
    id integer NOT NULL,
    description character varying(200) NOT NULL,
    salary integer NOT NULL,
    name character varying(30) NOT NULL,
    CONSTRAINT employee_category_salary_check CHECK ((salary > 0))
);


ALTER TABLE public.employee_category OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16501)
-- Name: employee_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_category_id_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_category_id_seq OWNED BY public.employee_category.id;


--
-- TOC entry 220 (class 1259 OID 16509)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_id_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 220
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- TOC entry 4734 (class 2604 OID 16495)
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 24655)
-- Name: credit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit ALTER COLUMN id SET DEFAULT nextval('public.credit_id_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 24678)
-- Name: credit_agreement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_agreement ALTER COLUMN id SET DEFAULT nextval('public.credit_agreement_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 24763)
-- Name: credit_payment_schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_payment_schedule ALTER COLUMN id SET DEFAULT nextval('public.credit_payment_schedule_id_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16530)
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 24667)
-- Name: deposit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit ALTER COLUMN id SET DEFAULT nextval('public.deposit_id_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 24713)
-- Name: deposit_agreement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_agreement ALTER COLUMN id SET DEFAULT nextval('public.deposit_agreement_id_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 24749)
-- Name: deposit_payment_schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_payment_schedule ALTER COLUMN id SET DEFAULT nextval('public.deposit_payment_schedule_id_seq'::regclass);


--
-- TOC entry 4736 (class 2604 OID 16513)
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16505)
-- Name: employee_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_category ALTER COLUMN id SET DEFAULT nextval('public.employee_category_id_seq'::regclass);


--
-- TOC entry 4943 (class 0 OID 16492)
-- Dependencies: 217
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name, passportid, phonenumber, email, address) FROM stdin;
3	Михаил Дмитриевич Прохоров	1914323849	72298165946	prohorovm79@mail.ru	Сочи, Параллельная ул., 9/2
4	Леонид Арнольдович Федун	2809346819	78843693164	fedunleonid@mail.ru	Выборг, Ленинградское ш., 45Б
\.


--
-- TOC entry 4951 (class 0 OID 24652)
-- Dependencies: 225
-- Data for Name: credit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit (id, description, name, maximumamount, interestrate) FROM stdin;
2	От 21 года на дату получения кредита Автокредит наличными	Стандартный	5000000	7.7
1	От 21 года на дату получения кредита, общий стаж работы не менее 3 лет	Под залог\nнедвижимости	5000000	6.8
\.


--
-- TOC entry 4955 (class 0 OID 24675)
-- Dependencies: 229
-- Data for Name: credit_agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_agreement (id, currencyid, creditid, employeeid, clientid, dayofaccrual, plannedclosingdate, interestamount, interestrate, currentdebt, initialamount, dateofopening, dateofclosing) FROM stdin;
1	2	1	7	3	25	2024-10-24	0	8.7	56000	600000	2023-10-24	\N
2	2	2	7	3	12	2023-12-12	5000	8.6	20000	550000	2023-03-12	\N
3	2	2	7	4	13	2024-11-13	0	9.3	0	500000	2023-11-13	\N
\.


--
-- TOC entry 4961 (class 0 OID 24760)
-- Dependencies: 235
-- Data for Name: credit_payment_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_payment_schedule (id, creditagreementid, plannedpaymentdate, actualpaymentdate, interestpayment, creditpayment) FROM stdin;
1	2	2023-04-12	2023-04-12	2000	16000
2	2	2023-05-12	2023-05-12	2000	16000
3	2	2023-06-12	2023-06-12	2000	16000
4	2	2023-07-12	2023-07-12	2000	16000
5	2	2023-08-12	2023-08-12	2000	16000
6	2	2023-09-12	2023-09-12	2000	16000
7	2	2023-10-12	\N	2000	16000
8	2	2023-11-12	\N	2000	16000
\.


--
-- TOC entry 4949 (class 0 OID 16527)
-- Dependencies: 223
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (id, name, country) FROM stdin;
2	rub	Russia
\.


--
-- TOC entry 4953 (class 0 OID 24664)
-- Dependencies: 227
-- Data for Name: deposit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deposit (id, description, name, minimumamount, interestrate) FROM stdin;
1	Вклад на данных условиях доступен для клиентов, у которых в течение последних 30 дней на дату обращения отсутствуют счета в Банке, открытые на их имя	Надежный вклад	100000	6
2	Вклад на данных условиях доступен для клиентов, у которых в течение последних 30 дней на дату обращения отсутствуют счета в Банке, открытые на их имя	Прибыльный вклад	250000	9.6
\.


--
-- TOC entry 4957 (class 0 OID 24710)
-- Dependencies: 231
-- Data for Name: deposit_agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deposit_agreement (id, currencyid, depositid, employeeid, clientid, dayofaccrual, plannedclosingdate, amountofpayments, initialamount, dateofopening, dateofclosing) FROM stdin;
2	2	2	7	4	13	2023-12-13	15000	300000	2023-04-12	\N
1	2	1	7	4	12	2024-12-12	0	500000	2023-11-12	\N
\.


--
-- TOC entry 4959 (class 0 OID 24746)
-- Dependencies: 233
-- Data for Name: deposit_payment_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deposit_payment_schedule (id, depositagreementid, plannedpaymentdate, actualpaymentdate, paymentamount) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 16510)
-- Dependencies: 221
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, name, passportid, phonenumber, email, address, dateofbirth, salary, categoryid) FROM stdin;
7	Игорь Викторович Макаров	1919385795	78843693165	markovbankir@bank.ru	Воронеж, ул. Карла Маркса, 67/2	12.05.1989	66500	2
\.


--
-- TOC entry 4945 (class 0 OID 16502)
-- Dependencies: 219
-- Data for Name: employee_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_category (id, description, salary, name) FROM stdin;
2	Менеджер, руководящий банком и проводящий им финансовые операции	60000	Банкир
\.


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 216
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 4, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 228
-- Name: credit_agreement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credit_agreement_id_seq', 1, false);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 224
-- Name: credit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credit_id_seq', 1, false);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 234
-- Name: credit_payment_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credit_payment_schedule_id_seq', 8, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 222
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_id_seq', 2, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 230
-- Name: deposit_agreement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deposit_agreement_id_seq', 1, false);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 226
-- Name: deposit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deposit_id_seq', 1, false);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 232
-- Name: deposit_payment_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deposit_payment_schedule_id_seq', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_category_id_seq', 2, true);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 220
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 7, true);


--
-- TOC entry 4759 (class 2606 OID 24773)
-- Name: credit_agreement ch1; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.credit_agreement
    ADD CONSTRAINT ch1 CHECK ((dateofopening > dateofclosing)) NOT VALID;


--
-- TOC entry 4764 (class 2606 OID 24775)
-- Name: deposit_agreement ch1; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.deposit_agreement
    ADD CONSTRAINT ch1 CHECK ((dateofopening < dateofclosing)) NOT VALID;


--
-- TOC entry 4769 (class 2606 OID 16500)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 4781 (class 2606 OID 24688)
-- Name: credit_agreement credit_agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_pkey PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 24767)
-- Name: credit_payment_schedule credit_payment_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_payment_schedule
    ADD CONSTRAINT credit_payment_schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 24661)
-- Name: credit credit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit
    ADD CONSTRAINT credit_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 16532)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 24721)
-- Name: deposit_agreement deposit_agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_pkey PRIMARY KEY (id);


--
-- TOC entry 4785 (class 2606 OID 24753)
-- Name: deposit_payment_schedule deposit_payment_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_payment_schedule
    ADD CONSTRAINT deposit_payment_schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 24673)
-- Name: deposit deposit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 16508)
-- Name: employee_category employee_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_category
    ADD CONSTRAINT employee_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4773 (class 2606 OID 16520)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 4789 (class 2606 OID 24704)
-- Name: credit_agreement credit_agreement_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(id);


--
-- TOC entry 4790 (class 2606 OID 24694)
-- Name: credit_agreement credit_agreement_creditid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_creditid_fkey FOREIGN KEY (creditid) REFERENCES public.credit(id);


--
-- TOC entry 4791 (class 2606 OID 24689)
-- Name: credit_agreement credit_agreement_currencyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_currencyid_fkey FOREIGN KEY (currencyid) REFERENCES public.currency(id);


--
-- TOC entry 4792 (class 2606 OID 24699)
-- Name: credit_agreement credit_agreement_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(id);


--
-- TOC entry 4798 (class 2606 OID 24768)
-- Name: credit_payment_schedule credit_payment_schedule_creditagreementid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_payment_schedule
    ADD CONSTRAINT credit_payment_schedule_creditagreementid_fkey FOREIGN KEY (creditagreementid) REFERENCES public.credit_agreement(id);


--
-- TOC entry 4793 (class 2606 OID 24737)
-- Name: deposit_agreement deposit_agreement_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(id);


--
-- TOC entry 4794 (class 2606 OID 24722)
-- Name: deposit_agreement deposit_agreement_currencyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_currencyid_fkey FOREIGN KEY (currencyid) REFERENCES public.currency(id);


--
-- TOC entry 4795 (class 2606 OID 24727)
-- Name: deposit_agreement deposit_agreement_depositid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_depositid_fkey FOREIGN KEY (depositid) REFERENCES public.deposit(id);


--
-- TOC entry 4796 (class 2606 OID 24732)
-- Name: deposit_agreement deposit_agreement_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(id);


--
-- TOC entry 4797 (class 2606 OID 24754)
-- Name: deposit_payment_schedule deposit_payment_schedule_depositagreementid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_payment_schedule
    ADD CONSTRAINT deposit_payment_schedule_depositagreementid_fkey FOREIGN KEY (depositagreementid) REFERENCES public.deposit_agreement(id);


--
-- TOC entry 4788 (class 2606 OID 16521)
-- Name: employee employee_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.employee_category(id);


-- Completed on 2023-11-20 23:07:46

--
-- PostgreSQL database dump complete
--

