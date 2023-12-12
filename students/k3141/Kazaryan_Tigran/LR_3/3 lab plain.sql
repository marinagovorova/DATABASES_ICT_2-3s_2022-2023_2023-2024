--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2023-12-12 19:08:28

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
-- TOC entry 5 (class 2615 OID 16578)
-- Name: restauran; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA restauran;


ALTER SCHEMA restauran OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA restauran; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA restauran IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16579)
-- Name: cost; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.cost (
    id_dish integer NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_by timestamp without time zone NOT NULL,
    cost_id integer NOT NULL,
    CONSTRAINT cost_check CHECK ((date_from <= date_by))
);


ALTER TABLE restauran.cost OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16583)
-- Name: cost_cost_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.cost_cost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.cost_cost_id_seq OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 216
-- Name: cost_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.cost_cost_id_seq OWNED BY restauran.cost.cost_id;


--
-- TOC entry 217 (class 1259 OID 16584)
-- Name: dish; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.dish (
    id_dish integer NOT NULL,
    dish_type character varying(20) NOT NULL,
    name character varying(30) NOT NULL,
    CONSTRAINT dish_dish_type_check CHECK (((dish_type)::text ~ '^[А-Яа-я]+$'::text))
);


ALTER TABLE restauran.dish OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16588)
-- Name: dish_composition; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.dish_composition (
    id_dish integer NOT NULL,
    id_ingredient integer NOT NULL,
    ingredient_volume integer NOT NULL,
    dish_composition_id integer NOT NULL,
    measure_unit character varying(15) NOT NULL,
    CONSTRAINT check_measure CHECK (((measure_unit)::text = ANY (ARRAY[('мл'::character varying)::text, ('гр'::character varying)::text, ('кг'::character varying)::text, ('шт'::character varying)::text]))),
    CONSTRAINT dish_composition_ingredient_volume_check CHECK ((ingredient_volume > 0))
);


ALTER TABLE restauran.dish_composition OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16592)
-- Name: dish_composition_dish_composition_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.dish_composition_dish_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.dish_composition_dish_composition_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 219
-- Name: dish_composition_dish_composition_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.dish_composition_dish_composition_id_seq OWNED BY restauran.dish_composition.dish_composition_id;


--
-- TOC entry 220 (class 1259 OID 16593)
-- Name: dish_id_dish_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.dish_id_dish_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.dish_id_dish_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 220
-- Name: dish_id_dish_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.dish_id_dish_seq OWNED BY restauran.dish.id_dish;


--
-- TOC entry 221 (class 1259 OID 16594)
-- Name: employee; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.employee (
    id_employee integer NOT NULL,
    passport_data character varying(100) NOT NULL,
    fio character varying(50) NOT NULL,
    id_post integer NOT NULL
);


ALTER TABLE restauran.employee OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16597)
-- Name: employee_id_employee_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.employee_id_employee_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.employee_id_employee_seq OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 222
-- Name: employee_id_employee_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.employee_id_employee_seq OWNED BY restauran.employee.id_employee;


--
-- TOC entry 223 (class 1259 OID 16598)
-- Name: ingredient; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.ingredient (
    id_ingredient integer NOT NULL,
    name character varying(40) NOT NULL,
    product_type character varying(20) NOT NULL,
    required_stock double precision NOT NULL,
    quantity_in_stock double precision NOT NULL,
    caloric_content integer NOT NULL,
    CONSTRAINT ingredient_caloric_content_check CHECK ((caloric_content >= 0)),
    CONSTRAINT ingredient_required_stock_check CHECK ((required_stock > (0)::double precision))
);


ALTER TABLE restauran.ingredient OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16603)
-- Name: ingredient_id_ingredient_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.ingredient_id_ingredient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.ingredient_id_ingredient_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 224
-- Name: ingredient_id_ingredient_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.ingredient_id_ingredient_seq OWNED BY restauran.ingredient.id_ingredient;


--
-- TOC entry 225 (class 1259 OID 16604)
-- Name: order_composition; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.order_composition (
    id_dish integer NOT NULL,
    id_order integer NOT NULL,
    number_of_servings integer NOT NULL,
    ready_status character varying(14) NOT NULL,
    order_composition_id integer NOT NULL,
    CONSTRAINT order_composition_number_of_servings_check CHECK ((number_of_servings > 0)),
    CONSTRAINT order_composition_ready_status_check CHECK (((ready_status)::text = ANY (ARRAY[('Готово'::character varying)::text, ('Взято в работу'::character varying)::text, ('В ожидании'::character varying)::text])))
);


ALTER TABLE restauran.order_composition OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16609)
-- Name: order_composition_order_composition_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.order_composition_order_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.order_composition_order_composition_id_seq OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 226
-- Name: order_composition_order_composition_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.order_composition_order_composition_id_seq OWNED BY restauran.order_composition.order_composition_id;


--
-- TOC entry 227 (class 1259 OID 16610)
-- Name: orders; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.orders (
    id_order integer NOT NULL,
    order_date timestamp without time zone NOT NULL,
    book_date timestamp without time zone,
    cost numeric NOT NULL,
    id_waiter integer NOT NULL,
    id_table integer NOT NULL,
    CONSTRAINT orders_cost_check CHECK ((cost > (0)::numeric))
);


ALTER TABLE restauran.orders OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16616)
-- Name: orders_id_order_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.orders_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.orders_id_order_seq OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 228
-- Name: orders_id_order_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.orders_id_order_seq OWNED BY restauran.orders.id_order;


--
-- TOC entry 229 (class 1259 OID 16617)
-- Name: post; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.post (
    id_post integer NOT NULL,
    name character varying(30) NOT NULL,
    salary numeric NOT NULL,
    CONSTRAINT post_salary_check CHECK ((salary > (0)::numeric))
);


ALTER TABLE restauran.post OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16623)
-- Name: post_id_post_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.post_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.post_id_post_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 230
-- Name: post_id_post_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.post_id_post_seq OWNED BY restauran.post.id_post;


--
-- TOC entry 231 (class 1259 OID 16624)
-- Name: purchase; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.purchase (
    id_purchase integer NOT NULL,
    puschase_date date NOT NULL,
    provider character varying(30) NOT NULL,
    purchase_volume integer NOT NULL,
    ingredient_price integer NOT NULL,
    id_ingredient integer,
    expiration_date timestamp without time zone NOT NULL,
    remaining_amount_of_ingredient integer NOT NULL,
    measure_unit_purchase character varying(15) NOT NULL,
    CONSTRAINT check_measure CHECK (((measure_unit_purchase)::text = ANY (ARRAY[('мл'::character varying)::text, ('гр'::character varying)::text, ('кг'::character varying)::text, ('шт'::character varying)::text]))),
    CONSTRAINT purchase_ingredient_price_check CHECK ((ingredient_price > 0)),
    CONSTRAINT purchase_purchase_volume_check CHECK ((purchase_volume > 0))
);


ALTER TABLE restauran.purchase OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16629)
-- Name: purchase_id_purchase_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.purchase_id_purchase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.purchase_id_purchase_seq OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 232
-- Name: purchase_id_purchase_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.purchase_id_purchase_seq OWNED BY restauran.purchase.id_purchase;


--
-- TOC entry 233 (class 1259 OID 16630)
-- Name: shift; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.shift (
    id_shift integer NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_by timestamp without time zone NOT NULL,
    CONSTRAINT shift_check2 CHECK ((date_by >= date_from))
);


ALTER TABLE restauran.shift OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16634)
-- Name: shift_id_shift_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.shift_id_shift_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.shift_id_shift_seq OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 234
-- Name: shift_id_shift_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.shift_id_shift_seq OWNED BY restauran.shift.id_shift;


--
-- TOC entry 235 (class 1259 OID 16635)
-- Name: skill; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.skill (
    id_employee integer NOT NULL,
    id_dish integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE restauran.skill OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16638)
-- Name: skill_skill_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.skill_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.skill_skill_id_seq OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 236
-- Name: skill_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.skill_skill_id_seq OWNED BY restauran.skill.skill_id;


--
-- TOC entry 237 (class 1259 OID 16639)
-- Name: tables; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.tables (
    id_table integer NOT NULL,
    cleaning_status character varying(3) NOT NULL,
    reservation_status character varying(3) NOT NULL,
    CONSTRAINT tables_cleaning_status_check CHECK (((cleaning_status)::text = ANY (ARRAY[('Да'::character varying)::text, ('Нет'::character varying)::text]))),
    CONSTRAINT tables_reservation_status_check CHECK (((reservation_status)::text = ANY (ARRAY[('Да'::character varying)::text, ('Нет'::character varying)::text])))
);


ALTER TABLE restauran.tables OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16644)
-- Name: tables_id_table_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.tables_id_table_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.tables_id_table_seq OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 238
-- Name: tables_id_table_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.tables_id_table_seq OWNED BY restauran.tables.id_table;


--
-- TOC entry 239 (class 1259 OID 16645)
-- Name: timetable; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.timetable (
    id_employee integer NOT NULL,
    id_shift integer NOT NULL,
    status_at_work character varying(10) NOT NULL,
    timetable_id integer NOT NULL,
    CONSTRAINT timetable_status_at_work_check CHECK (((status_at_work)::text = ANY (ARRAY[('По графику'::character varying)::text, ('Доп'::character varying)::text, ('Больн'::character varying)::text, ('Отгул'::character varying)::text])))
);


ALTER TABLE restauran.timetable OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16649)
-- Name: timetable_timetable_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.timetable_timetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.timetable_timetable_id_seq OWNER TO postgres;

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 240
-- Name: timetable_timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.timetable_timetable_id_seq OWNED BY restauran.timetable.timetable_id;


--
-- TOC entry 4748 (class 2604 OID 16651)
-- Name: cost cost_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.cost ALTER COLUMN cost_id SET DEFAULT nextval('restauran.cost_cost_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16654)
-- Name: dish id_dish; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish ALTER COLUMN id_dish SET DEFAULT nextval('restauran.dish_id_dish_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 16657)
-- Name: dish_composition dish_composition_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish_composition ALTER COLUMN dish_composition_id SET DEFAULT nextval('restauran.dish_composition_dish_composition_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 16799)
-- Name: employee id_employee; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.employee ALTER COLUMN id_employee SET DEFAULT nextval('restauran.employee_id_employee_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16660)
-- Name: ingredient id_ingredient; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.ingredient ALTER COLUMN id_ingredient SET DEFAULT nextval('restauran.ingredient_id_ingredient_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16666)
-- Name: order_composition order_composition_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.order_composition ALTER COLUMN order_composition_id SET DEFAULT nextval('restauran.order_composition_order_composition_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 16672)
-- Name: orders id_order; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.orders ALTER COLUMN id_order SET DEFAULT nextval('restauran.orders_id_order_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 16676)
-- Name: post id_post; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.post ALTER COLUMN id_post SET DEFAULT nextval('restauran.post_id_post_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 16681)
-- Name: purchase id_purchase; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.purchase ALTER COLUMN id_purchase SET DEFAULT nextval('restauran.purchase_id_purchase_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 16685)
-- Name: shift id_shift; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.shift ALTER COLUMN id_shift SET DEFAULT nextval('restauran.shift_id_shift_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 16688)
-- Name: skill skill_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.skill ALTER COLUMN skill_id SET DEFAULT nextval('restauran.skill_skill_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 16694)
-- Name: tables id_table; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.tables ALTER COLUMN id_table SET DEFAULT nextval('restauran.tables_id_table_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 16698)
-- Name: timetable timetable_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.timetable ALTER COLUMN timetable_id SET DEFAULT nextval('restauran.timetable_timetable_id_seq'::regclass);


--
-- TOC entry 4968 (class 0 OID 16579)
-- Dependencies: 215
-- Data for Name: cost; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.cost (id_dish, date_from, date_by, cost_id) FROM stdin;
1	2023-03-07 12:00:00	2023-03-07 12:30:00	1
2	2023-03-08 15:28:00	2023-03-08 15:45:00	2
3	2023-03-08 15:40:00	2023-03-08 16:00:00	3
\.


--
-- TOC entry 4970 (class 0 OID 16584)
-- Dependencies: 217
-- Data for Name: dish; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.dish (id_dish, dish_type, name) FROM stdin;
2	горячее	Мясо по-французски
3	дессерт	Торт "Наполеон"
1	салат	Цезарь
\.


--
-- TOC entry 4971 (class 0 OID 16588)
-- Dependencies: 218
-- Data for Name: dish_composition; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.dish_composition (id_dish, id_ingredient, ingredient_volume, dish_composition_id, measure_unit) FROM stdin;
1	3	2	1	шт
2	1	1	2	гр
2	2	1	3	гр
\.


--
-- TOC entry 4974 (class 0 OID 16594)
-- Dependencies: 221
-- Data for Name: employee; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.employee (id_employee, passport_data, fio, id_post) FROM stdin;
1	4018 998445	Иванов Иван Иванович	3
2	5334 584036	Лопаткина Виктория Юрьевна	1
3	3804 638490	Петров Максим Максимович	3
\.


--
-- TOC entry 4976 (class 0 OID 16598)
-- Dependencies: 223
-- Data for Name: ingredient; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.ingredient (id_ingredient, name, product_type, required_stock, quantity_in_stock, caloric_content) FROM stdin;
2	Говядина	Мясо	8	7	187
1	Лук	Овощи	5	3.5	40
3	Яйцо куриное	Яйца	10	9.2	143
\.


--
-- TOC entry 4978 (class 0 OID 16604)
-- Dependencies: 225
-- Data for Name: order_composition; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.order_composition (id_dish, id_order, number_of_servings, ready_status, order_composition_id) FROM stdin;
2	1	2	Взято в работу	1
1	2	1	Готово	2
3	1	1	В ожидании	3
\.


--
-- TOC entry 4980 (class 0 OID 16610)
-- Dependencies: 227
-- Data for Name: orders; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.orders (id_order, order_date, book_date, cost, id_waiter, id_table) FROM stdin;
1	2023-03-07 18:00:00	\N	506.95	1	1
2	2023-03-07 18:36:00	2023-03-07 18:00:00	1263	3	3
\.


--
-- TOC entry 4982 (class 0 OID 16617)
-- Dependencies: 229
-- Data for Name: post; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.post (id_post, name, salary) FROM stdin;
1	Повар	60000
2	Шеф-повар	100000
3	Официант	45000
\.


--
-- TOC entry 4984 (class 0 OID 16624)
-- Dependencies: 231
-- Data for Name: purchase; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.purchase (id_purchase, puschase_date, provider, purchase_volume, ingredient_price, id_ingredient, expiration_date, remaining_amount_of_ingredient, measure_unit_purchase) FROM stdin;
1	2023-06-03	ООО "Огурчик"	100	20	1	2023-03-11 09:00:00	3	кг
2	2023-06-03	"У Молочника"	50	40	3	2023-03-10 09:00:00	40	шт
3	2023-07-03	ООО "Дары природы"	140	50	2	2023-03-08 09:00:00	5	кг
\.


--
-- TOC entry 4986 (class 0 OID 16630)
-- Dependencies: 233
-- Data for Name: shift; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.shift (id_shift, date_from, date_by) FROM stdin;
1	2023-03-07 09:00:00	2023-03-07 20:00:00
2	2023-03-07 08:00:00	2023-03-07 20:00:00
3	2023-03-08 08:00:00	2023-03-08 20:00:00
\.


--
-- TOC entry 4988 (class 0 OID 16635)
-- Dependencies: 235
-- Data for Name: skill; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.skill (id_employee, id_dish, skill_id) FROM stdin;
2	2	1
2	1	2
2	3	3
\.


--
-- TOC entry 4990 (class 0 OID 16639)
-- Dependencies: 237
-- Data for Name: tables; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.tables (id_table, cleaning_status, reservation_status) FROM stdin;
1	Да	Нет
2	Нет	Нет
3	Да	Да
\.


--
-- TOC entry 4992 (class 0 OID 16645)
-- Dependencies: 239
-- Data for Name: timetable; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.timetable (id_employee, id_shift, status_at_work, timetable_id) FROM stdin;
1	3	По графику	1
3	1	Доп	2
3	2	Отгул	3
\.


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 216
-- Name: cost_cost_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.cost_cost_id_seq', 3, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 219
-- Name: dish_composition_dish_composition_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.dish_composition_dish_composition_id_seq', 3, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 220
-- Name: dish_id_dish_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.dish_id_dish_seq', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 222
-- Name: employee_id_employee_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.employee_id_employee_seq', 1, false);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 224
-- Name: ingredient_id_ingredient_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.ingredient_id_ingredient_seq', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 226
-- Name: order_composition_order_composition_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.order_composition_order_composition_id_seq', 3, true);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 228
-- Name: orders_id_order_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.orders_id_order_seq', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 230
-- Name: post_id_post_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.post_id_post_seq', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 232
-- Name: purchase_id_purchase_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.purchase_id_purchase_seq', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 234
-- Name: shift_id_shift_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.shift_id_shift_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 236
-- Name: skill_skill_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.skill_skill_id_seq', 3, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 238
-- Name: tables_id_table_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.tables_id_table_seq', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 240
-- Name: timetable_timetable_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.timetable_timetable_id_seq', 3, true);


--
-- TOC entry 4779 (class 2606 OID 16700)
-- Name: cost cost_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.cost
    ADD CONSTRAINT cost_pkey PRIMARY KEY (cost_id);


--
-- TOC entry 4785 (class 2606 OID 16702)
-- Name: dish_composition dish_composition_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_pkey PRIMARY KEY (dish_composition_id);


--
-- TOC entry 4781 (class 2606 OID 16704)
-- Name: dish dish_name_unique; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish
    ADD CONSTRAINT dish_name_unique UNIQUE (name) INCLUDE (name);


--
-- TOC entry 4783 (class 2606 OID 16707)
-- Name: dish dish_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id_dish);


--
-- TOC entry 4787 (class 2606 OID 16709)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id_employee);


--
-- TOC entry 4791 (class 2606 OID 16711)
-- Name: ingredient ingredient_name_unique; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.ingredient
    ADD CONSTRAINT ingredient_name_unique UNIQUE (name) INCLUDE (name);


--
-- TOC entry 4793 (class 2606 OID 16713)
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id_ingredient);


--
-- TOC entry 4799 (class 2606 OID 16715)
-- Name: post name_unique; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.post
    ADD CONSTRAINT name_unique UNIQUE (name) INCLUDE (name);


--
-- TOC entry 4795 (class 2606 OID 16717)
-- Name: order_composition order_composition_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_pkey PRIMARY KEY (order_composition_id);


--
-- TOC entry 4797 (class 2606 OID 16719)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);


--
-- TOC entry 4789 (class 2606 OID 16721)
-- Name: employee passport_data_unique; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT passport_data_unique UNIQUE (passport_data) INCLUDE (passport_data);


--
-- TOC entry 4801 (class 2606 OID 16723)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id_post);


--
-- TOC entry 4803 (class 2606 OID 16725)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id_purchase);


--
-- TOC entry 4805 (class 2606 OID 16727)
-- Name: shift shift_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (id_shift);


--
-- TOC entry 4807 (class 2606 OID 16729)
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (skill_id);


--
-- TOC entry 4809 (class 2606 OID 16731)
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id_table);


--
-- TOC entry 4811 (class 2606 OID 16733)
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (timetable_id);


--
-- TOC entry 4812 (class 2606 OID 16734)
-- Name: cost cost_id_dish_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.cost
    ADD CONSTRAINT cost_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);


--
-- TOC entry 4813 (class 2606 OID 16739)
-- Name: dish_composition dish_composition_id_dish_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);


--
-- TOC entry 4814 (class 2606 OID 16744)
-- Name: dish_composition dish_composition_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES restauran.ingredient(id_ingredient);


--
-- TOC entry 4815 (class 2606 OID 16749)
-- Name: employee employee_id_post_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT employee_id_post_fkey FOREIGN KEY (id_post) REFERENCES restauran.post(id_post);


--
-- TOC entry 4820 (class 2606 OID 16802)
-- Name: purchase ing; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.purchase
    ADD CONSTRAINT ing FOREIGN KEY (id_ingredient) REFERENCES restauran.ingredient(id_ingredient);


--
-- TOC entry 4816 (class 2606 OID 16759)
-- Name: order_composition order_composition_id_dish_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);


--
-- TOC entry 4817 (class 2606 OID 16764)
-- Name: order_composition order_composition_id_order_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_id_order_fkey FOREIGN KEY (id_order) REFERENCES restauran.orders(id_order);


--
-- TOC entry 4818 (class 2606 OID 16769)
-- Name: orders orders_id_table_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_id_table_fkey FOREIGN KEY (id_table) REFERENCES restauran.tables(id_table);


--
-- TOC entry 4819 (class 2606 OID 16774)
-- Name: orders orders_id_waiter_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_id_waiter_fkey FOREIGN KEY (id_waiter) REFERENCES restauran.employee(id_employee);


--
-- TOC entry 4821 (class 2606 OID 16779)
-- Name: skill skill_id_dish_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);


--
-- TOC entry 4822 (class 2606 OID 16784)
-- Name: skill skill_id_employee_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES restauran.employee(id_employee);


--
-- TOC entry 4823 (class 2606 OID 16789)
-- Name: timetable timetable_id_employee_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES restauran.employee(id_employee);


--
-- TOC entry 4824 (class 2606 OID 16794)
-- Name: timetable timetable_id_shift_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_id_shift_fkey FOREIGN KEY (id_shift) REFERENCES restauran.shift(id_shift);


-- Completed on 2023-12-12 19:08:28

--
-- PostgreSQL database dump complete
--

