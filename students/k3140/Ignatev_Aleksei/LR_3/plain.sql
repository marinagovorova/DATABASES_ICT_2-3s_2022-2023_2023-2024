--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-10-26 17:24:31

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
-- Name: root; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA root;


ALTER SCHEMA root OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 235 (class 1259 OID 16522)
-- Name: Author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Author" (
    author_code integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    father_name character varying(50),
    email character varying(100) NOT NULL
);


ALTER TABLE public."Author" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16521)
-- Name: Author_author_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Author_author_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Author_author_code_seq" OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 234
-- Name: Author_author_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Author_author_code_seq" OWNED BY public."Author".author_code;


--
-- TOC entry 231 (class 1259 OID 16496)
-- Name: Book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Book" (
    book_number integer NOT NULL,
    name character varying(50) NOT NULL,
    write_year integer NOT NULL,
    publish_year integer NOT NULL,
    CONSTRAINT publish_year_check CHECK ((publish_year > 0)),
    CONSTRAINT write_year_check CHECK ((write_year > 0))
);


ALTER TABLE public."Book" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16529)
-- Name: Book_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Book_author" (
    book_author_id integer NOT NULL,
    book_number integer NOT NULL,
    author_code integer NOT NULL,
    author_position integer NOT NULL
);


ALTER TABLE public."Book_author" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16528)
-- Name: Book_author_book_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Book_author_book_author_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Book_author_book_author_id_seq" OWNER TO postgres;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 236
-- Name: Book_author_book_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Book_author_book_author_id_seq" OWNED BY public."Book_author".book_author_id;


--
-- TOC entry 230 (class 1259 OID 16495)
-- Name: Book_book_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Book_book_number_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Book_book_number_seq" OWNER TO postgres;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 230
-- Name: Book_book_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Book_book_number_seq" OWNED BY public."Book".book_number;


--
-- TOC entry 241 (class 1259 OID 16553)
-- Name: Book_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Book_category" (
    book_category_id integer NOT NULL,
    book_number integer NOT NULL,
    category_code integer NOT NULL,
    priority integer NOT NULL
);


ALTER TABLE public."Book_category" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16552)
-- Name: Book_category_book_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Book_category_book_category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Book_category_book_category_id_seq" OWNER TO postgres;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 240
-- Name: Book_category_book_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Book_category_book_category_id_seq" OWNED BY public."Book_category".book_category_id;


--
-- TOC entry 239 (class 1259 OID 16546)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    category_code integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16545)
-- Name: Category_category_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Category_category_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Category_category_code_seq" OWNER TO postgres;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 238
-- Name: Category_category_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Category_category_code_seq" OWNED BY public."Category".category_code;


--
-- TOC entry 223 (class 1259 OID 16440)
-- Name: Circulation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Circulation" (
    circulation_code integer NOT NULL,
    date date NOT NULL,
    made_count integer NOT NULL,
    left_count integer NOT NULL,
    isbn_code character varying(13) NOT NULL,
    CONSTRAINT left_count_check CHECK ((left_count > 0)),
    CONSTRAINT made_count_check CHECK ((made_count > 0))
);


ALTER TABLE public."Circulation" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16439)
-- Name: Circulation_circulation_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Circulation_circulation_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Circulation_circulation_code_seq" OWNER TO postgres;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 222
-- Name: Circulation_circulation_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Circulation_circulation_code_seq" OWNED BY public."Circulation".circulation_code;


--
-- TOC entry 220 (class 1259 OID 16421)
-- Name: Client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client" (
    client_code integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    father_name character varying(50),
    address character varying(100) NOT NULL,
    phone character varying(20) NOT NULL
);


ALTER TABLE public."Client" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16420)
-- Name: Client_client_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Client_client_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Client_client_code_seq" OWNER TO postgres;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 219
-- Name: Client_client_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Client_client_code_seq" OWNED BY public."Client".client_code;


--
-- TOC entry 221 (class 1259 OID 16432)
-- Name: Edition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Edition" (
    isbn_code character varying(13) NOT NULL,
    sheets_count integer NOT NULL,
    has_images integer NOT NULL,
    edition_number integer NOT NULL,
    type character varying(20) NOT NULL,
    it_sphere character varying(50) NOT NULL,
    CONSTRAINT has_images_check CHECK ((has_images = ANY (ARRAY[0, 1]))),
    CONSTRAINT sheets_count_check CHECK ((sheets_count > 0))
);


ALTER TABLE public."Edition" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16505)
-- Name: Edition_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Edition_book" (
    edition_book_id integer NOT NULL,
    isbn_code character varying(13) NOT NULL,
    book_number integer NOT NULL
);


ALTER TABLE public."Edition_book" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16504)
-- Name: Edition_book_edition_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Edition_book_edition_book_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Edition_book_edition_book_id_seq" OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 232
-- Name: Edition_book_edition_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Edition_book_edition_book_id_seq" OWNED BY public."Edition_book".edition_book_id;


--
-- TOC entry 229 (class 1259 OID 16479)
-- Name: Edition_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Edition_process" (
    edition_process_id integer NOT NULL,
    isbn_code character varying(13) NOT NULL,
    editor_code integer NOT NULL,
    editor_role character varying(50) NOT NULL
);


ALTER TABLE public."Edition_process" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16478)
-- Name: Edition_process_edition_process_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Edition_process_edition_process_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Edition_process_edition_process_id_seq" OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 228
-- Name: Edition_process_edition_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Edition_process_edition_process_id_seq" OWNED BY public."Edition_process".edition_process_id;


--
-- TOC entry 227 (class 1259 OID 16472)
-- Name: Editor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Editor" (
    editor_code integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    father_name character varying(50)
);


ALTER TABLE public."Editor" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16471)
-- Name: Editor_editor_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Editor_editor_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Editor_editor_code_seq" OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 226
-- Name: Editor_editor_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Editor_editor_code_seq" OWNED BY public."Editor".editor_code;


--
-- TOC entry 216 (class 1259 OID 16401)
-- Name: Manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manager" (
    manager_code integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    father_name character varying(50)
);


ALTER TABLE public."Manager" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: Manager_manager_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Manager_manager_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Manager_manager_code_seq" OWNER TO postgres;

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 215
-- Name: Manager_manager_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Manager_manager_code_seq" OWNED BY public."Manager".manager_code;


--
-- TOC entry 218 (class 1259 OID 16408)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    order_code integer NOT NULL,
    payment_prepay character varying(50) NOT NULL,
    payment_balance character varying(50) NOT NULL,
    date date NOT NULL,
    duration integer NOT NULL,
    status character varying(20) NOT NULL,
    act character varying(50) NOT NULL,
    manager_code integer NOT NULL,
    client_code integer NOT NULL,
    CONSTRAINT check_duration CHECK ((duration > 0))
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16454)
-- Name: Order_creation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order_creation" (
    order_creation_id integer NOT NULL,
    order_code integer NOT NULL,
    "сirculation_code" integer NOT NULL,
    count integer NOT NULL,
    CONSTRAINT count_check CHECK ((count > 0))
);


ALTER TABLE public."Order_creation" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16453)
-- Name: Order_creation_order_creation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Order_creation_order_creation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_creation_order_creation_id_seq" OWNER TO postgres;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 224
-- Name: Order_creation_order_creation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Order_creation_order_creation_id_seq" OWNED BY public."Order_creation".order_creation_id;


--
-- TOC entry 217 (class 1259 OID 16407)
-- Name: Order_order_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Order_order_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_order_code_seq" OWNER TO postgres;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 217
-- Name: Order_order_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Order_order_code_seq" OWNED BY public."Order".order_code;


--
-- TOC entry 3247 (class 2604 OID 16525)
-- Name: Author author_code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Author" ALTER COLUMN author_code SET DEFAULT nextval('public."Author_author_code_seq"'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16499)
-- Name: Book book_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book" ALTER COLUMN book_number SET DEFAULT nextval('public."Book_book_number_seq"'::regclass);


--
-- TOC entry 3248 (class 2604 OID 16532)
-- Name: Book_author book_author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book_author" ALTER COLUMN book_author_id SET DEFAULT nextval('public."Book_author_book_author_id_seq"'::regclass);


--
-- TOC entry 3250 (class 2604 OID 16556)
-- Name: Book_category book_category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book_category" ALTER COLUMN book_category_id SET DEFAULT nextval('public."Book_category_book_category_id_seq"'::regclass);


--
-- TOC entry 3249 (class 2604 OID 16549)
-- Name: Category category_code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category" ALTER COLUMN category_code SET DEFAULT nextval('public."Category_category_code_seq"'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16443)
-- Name: Circulation circulation_code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Circulation" ALTER COLUMN circulation_code SET DEFAULT nextval('public."Circulation_circulation_code_seq"'::regclass);


--
-- TOC entry 3240 (class 2604 OID 16424)
-- Name: Client client_code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client" ALTER COLUMN client_code SET DEFAULT nextval('public."Client_client_code_seq"'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16508)
-- Name: Edition_book edition_book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition_book" ALTER COLUMN edition_book_id SET DEFAULT nextval('public."Edition_book_edition_book_id_seq"'::regclass);


--
-- TOC entry 3244 (class 2604 OID 16482)
-- Name: Edition_process edition_process_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition_process" ALTER COLUMN edition_process_id SET DEFAULT nextval('public."Edition_process_edition_process_id_seq"'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16475)
-- Name: Editor editor_code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Editor" ALTER COLUMN editor_code SET DEFAULT nextval('public."Editor_editor_code_seq"'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16404)
-- Name: Manager manager_code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager" ALTER COLUMN manager_code SET DEFAULT nextval('public."Manager_manager_code_seq"'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16411)
-- Name: Order order_code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order" ALTER COLUMN order_code SET DEFAULT nextval('public."Order_order_code_seq"'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16457)
-- Name: Order_creation order_creation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_creation" ALTER COLUMN order_creation_id SET DEFAULT nextval('public."Order_creation_order_creation_id_seq"'::regclass);


--
-- TOC entry 3462 (class 0 OID 16522)
-- Dependencies: 235
-- Data for Name: Author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Author" (author_code, first_name, last_name, father_name, email) FROM stdin;
1	Иван	Иванов	\N	gmail@gmail.com
2	Петр	Петров	Петрович	yandex@yandex.ru
\.


--
-- TOC entry 3458 (class 0 OID 16496)
-- Dependencies: 231
-- Data for Name: Book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Book" (book_number, name, write_year, publish_year) FROM stdin;
1	Книга о волке	1000	1001
2	Книга о сове	1002	2002
\.


--
-- TOC entry 3464 (class 0 OID 16529)
-- Dependencies: 237
-- Data for Name: Book_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Book_author" (book_author_id, book_number, author_code, author_position) FROM stdin;
1	1	1	1
2	1	2	2
3	2	1	2
4	2	2	1
\.


--
-- TOC entry 3468 (class 0 OID 16553)
-- Dependencies: 241
-- Data for Name: Book_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Book_category" (book_category_id, book_number, category_code, priority) FROM stdin;
1	1	1	1
2	1	2	2
3	2	1	2
4	2	2	1
\.


--
-- TOC entry 3466 (class 0 OID 16546)
-- Dependencies: 239
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" (category_code, name) FROM stdin;
1	Истории
2	Приключения
\.


--
-- TOC entry 3450 (class 0 OID 16440)
-- Dependencies: 223
-- Data for Name: Circulation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Circulation" (circulation_code, date, made_count, left_count, isbn_code) FROM stdin;
1	2000-10-10	100	80	1234567891230
2	1000-10-10	920	920	0123456789123
\.


--
-- TOC entry 3447 (class 0 OID 16421)
-- Dependencies: 220
-- Data for Name: Client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client" (client_code, first_name, last_name, father_name, address, phone) FROM stdin;
1	Иван	Иванов	Иванович	Питер Улица Ленина 1	+79009009090
2	Петров	Петр	\N	Москва	+78005553535
\.


--
-- TOC entry 3448 (class 0 OID 16432)
-- Dependencies: 221
-- Data for Name: Edition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Edition" (isbn_code, sheets_count, has_images, edition_number, type, it_sphere) FROM stdin;
1234567891230	10	1	1	Новый	Безопасность
0123456789123	9	0	2	Типовой	Андроид
\.


--
-- TOC entry 3460 (class 0 OID 16505)
-- Dependencies: 233
-- Data for Name: Edition_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Edition_book" (edition_book_id, isbn_code, book_number) FROM stdin;
1	0123456789123	1
2	1234567891230	2
\.


--
-- TOC entry 3456 (class 0 OID 16479)
-- Dependencies: 229
-- Data for Name: Edition_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Edition_process" (edition_process_id, isbn_code, editor_code, editor_role) FROM stdin;
1	0123456789123	1	Главный
2	0123456789123	2	Второстепенный
\.


--
-- TOC entry 3454 (class 0 OID 16472)
-- Dependencies: 227
-- Data for Name: Editor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Editor" (editor_code, first_name, last_name, father_name) FROM stdin;
1	Иванов	Иван	\N
2	Петров	Петр	\N
\.


--
-- TOC entry 3443 (class 0 OID 16401)
-- Dependencies: 216
-- Data for Name: Manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manager" (manager_code, first_name, last_name, father_name) FROM stdin;
1	Иванов	Иван	\N
2	Петров	Петр	\N
\.


--
-- TOC entry 3445 (class 0 OID 16408)
-- Dependencies: 218
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (order_code, payment_prepay, payment_balance, date, duration, status, act, manager_code, client_code) FROM stdin;
1	2000	2000	0100-10-10	50	активный	01123456	1	1
2	1000	1000	1000-10-10	40	новый	01123457	2	2
\.


--
-- TOC entry 3452 (class 0 OID 16454)
-- Dependencies: 225
-- Data for Name: Order_creation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order_creation" (order_creation_id, order_code, "сirculation_code", count) FROM stdin;
1	1	1	100
2	1	2	200
3	2	1	200
4	2	2	500
\.


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 234
-- Name: Author_author_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Author_author_code_seq"', 2, true);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 236
-- Name: Book_author_book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Book_author_book_author_id_seq"', 5, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 230
-- Name: Book_book_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Book_book_number_seq"', 2, true);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 240
-- Name: Book_category_book_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Book_category_book_category_id_seq"', 4, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 238
-- Name: Category_category_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Category_category_code_seq"', 2, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 222
-- Name: Circulation_circulation_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Circulation_circulation_code_seq"', 2, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 219
-- Name: Client_client_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_client_code_seq"', 2, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 232
-- Name: Edition_book_edition_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Edition_book_edition_book_id_seq"', 2, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 228
-- Name: Edition_process_edition_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Edition_process_edition_process_id_seq"', 2, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 226
-- Name: Editor_editor_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Editor_editor_code_seq"', 2, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 215
-- Name: Manager_manager_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Manager_manager_code_seq"', 2, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 224
-- Name: Order_creation_order_creation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_creation_order_creation_id_seq"', 4, true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 217
-- Name: Order_order_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_order_code_seq"', 2, true);


--
-- TOC entry 3280 (class 2606 OID 16527)
-- Name: Author Author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Author"
    ADD CONSTRAINT "Author_pkey" PRIMARY KEY (author_code);


--
-- TOC entry 3282 (class 2606 OID 16534)
-- Name: Book_author Book_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book_author"
    ADD CONSTRAINT "Book_author_pkey" PRIMARY KEY (book_author_id);


--
-- TOC entry 3286 (class 2606 OID 16558)
-- Name: Book_category Book_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book_category"
    ADD CONSTRAINT "Book_category_pkey" PRIMARY KEY (book_category_id);


--
-- TOC entry 3276 (class 2606 OID 16503)
-- Name: Book Book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (book_number);


--
-- TOC entry 3284 (class 2606 OID 16551)
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (category_code);


--
-- TOC entry 3268 (class 2606 OID 16447)
-- Name: Circulation Circulation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Circulation"
    ADD CONSTRAINT "Circulation_pkey" PRIMARY KEY (circulation_code);


--
-- TOC entry 3264 (class 2606 OID 16426)
-- Name: Client Client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (client_code);


--
-- TOC entry 3278 (class 2606 OID 16510)
-- Name: Edition_book Edition_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition_book"
    ADD CONSTRAINT "Edition_book_pkey" PRIMARY KEY (edition_book_id);


--
-- TOC entry 3266 (class 2606 OID 16438)
-- Name: Edition Edition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition"
    ADD CONSTRAINT "Edition_pkey" PRIMARY KEY (isbn_code);


--
-- TOC entry 3274 (class 2606 OID 16484)
-- Name: Edition_process Edition_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition_process"
    ADD CONSTRAINT "Edition_process_pkey" PRIMARY KEY (edition_process_id);


--
-- TOC entry 3272 (class 2606 OID 16477)
-- Name: Editor Editor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Editor"
    ADD CONSTRAINT "Editor_pkey" PRIMARY KEY (editor_code);


--
-- TOC entry 3260 (class 2606 OID 16406)
-- Name: Manager Manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manager"
    ADD CONSTRAINT "Manager_pkey" PRIMARY KEY (manager_code);


--
-- TOC entry 3270 (class 2606 OID 16460)
-- Name: Order_creation Order_creation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_creation"
    ADD CONSTRAINT "Order_creation_pkey" PRIMARY KEY (order_creation_id);


--
-- TOC entry 3262 (class 2606 OID 16414)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (order_code);


--
-- TOC entry 3296 (class 2606 OID 16540)
-- Name: Book_author author_code_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book_author"
    ADD CONSTRAINT author_code_key FOREIGN KEY (author_code) REFERENCES public."Author"(author_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3294 (class 2606 OID 16516)
-- Name: Edition_book book_number_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition_book"
    ADD CONSTRAINT book_number_key FOREIGN KEY (book_number) REFERENCES public."Book"(book_number) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3297 (class 2606 OID 16535)
-- Name: Book_author book_number_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book_author"
    ADD CONSTRAINT book_number_key FOREIGN KEY (book_number) REFERENCES public."Book"(book_number) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3298 (class 2606 OID 16559)
-- Name: Book_category book_number_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book_category"
    ADD CONSTRAINT book_number_key FOREIGN KEY (book_number) REFERENCES public."Book"(book_number) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3299 (class 2606 OID 16564)
-- Name: Book_category category_code_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book_category"
    ADD CONSTRAINT category_code_key FOREIGN KEY (category_code) REFERENCES public."Category"(category_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3290 (class 2606 OID 16466)
-- Name: Order_creation circulation_code_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_creation"
    ADD CONSTRAINT circulation_code_key FOREIGN KEY ("сirculation_code") REFERENCES public."Circulation"(circulation_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3287 (class 2606 OID 16427)
-- Name: Order client_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT client_foreign_key FOREIGN KEY (client_code) REFERENCES public."Client"(client_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3292 (class 2606 OID 16490)
-- Name: Edition_process editor_code_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition_process"
    ADD CONSTRAINT editor_code_key FOREIGN KEY (editor_code) REFERENCES public."Editor"(editor_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3289 (class 2606 OID 16448)
-- Name: Circulation isbn_code_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Circulation"
    ADD CONSTRAINT isbn_code_key FOREIGN KEY (isbn_code) REFERENCES public."Edition"(isbn_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3293 (class 2606 OID 16485)
-- Name: Edition_process isbn_code_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition_process"
    ADD CONSTRAINT isbn_code_key FOREIGN KEY (isbn_code) REFERENCES public."Edition"(isbn_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3295 (class 2606 OID 16511)
-- Name: Edition_book isbn_code_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edition_book"
    ADD CONSTRAINT isbn_code_key FOREIGN KEY (isbn_code) REFERENCES public."Edition"(isbn_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3288 (class 2606 OID 16415)
-- Name: Order manager_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT manager_foreign_key FOREIGN KEY (manager_code) REFERENCES public."Manager"(manager_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3291 (class 2606 OID 16461)
-- Name: Order_creation order_code_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_creation"
    ADD CONSTRAINT order_code_key FOREIGN KEY (order_code) REFERENCES public."Order"(order_code) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2023-10-26 17:24:32

--
-- PostgreSQL database dump complete
--

