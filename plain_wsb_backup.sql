--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Homebrew)
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-23 01:56:23 MSK

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
-- TOC entry 6 (class 2615 OID 16393)
-- Name: wholesale_base; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA wholesale_base;


ALTER SCHEMA wholesale_base OWNER TO pg_database_owner;

--
-- TOC entry 240 (class 1255 OID 16580)
-- Name: check_if_leftovers_enough(); Type: FUNCTION; Schema: wholesale_base; Owner: postgres
--

CREATE FUNCTION wholesale_base.check_if_leftovers_enough() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (SELECT leftovers FROM wholesale_base.purchase_list WHERE purchase_list_id = NEW.purchase_list_id) < NEW.count
	THEN
		RAISE EXCEPTION 'The count cannot be greater than leftovers';
	END IF;

	RETURN NEW;
END;
$$;


ALTER FUNCTION wholesale_base.check_if_leftovers_enough() OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 16582)
-- Name: subtract_from_leftovers(); Type: FUNCTION; Schema: wholesale_base; Owner: postgres
--

CREATE FUNCTION wholesale_base.subtract_from_leftovers() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE wholesale_base.purchase_list
    SET leftovers = leftovers - NEW.count
    WHERE purchase_list_id = NEW.purchase_list_id;
  
    RETURN NEW;
END;
$$;


ALTER FUNCTION wholesale_base.subtract_from_leftovers() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: cash_account; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.cash_account (
    cash_account_id integer NOT NULL,
    date date NOT NULL,
    number integer NOT NULL,
    sum integer NOT NULL,
    status character varying(20) NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE wholesale_base.cash_account OWNER TO pg_database_owner;

--
-- TOC entry 230 (class 1259 OID 16559)
-- Name: cash_account_cash_account_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.cash_account ALTER COLUMN cash_account_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.cash_account_cash_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16544)
-- Name: cash_account_purchase; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.cash_account_purchase (
    cash_account_purchase_id integer NOT NULL,
    date date NOT NULL,
    number integer NOT NULL,
    sum integer NOT NULL,
    status character varying(20) NOT NULL,
    purchase_id integer NOT NULL
);


ALTER TABLE wholesale_base.cash_account_purchase OWNER TO pg_database_owner;

--
-- TOC entry 231 (class 1259 OID 16560)
-- Name: cash_account_purchase_cash_account_purchase_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.cash_account_purchase ALTER COLUMN cash_account_purchase_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.cash_account_purchase_cash_account_purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16439)
-- Name: customer; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.customer (
    customer_id integer NOT NULL,
    customer_adress character varying(100) NOT NULL,
    customer_company_name character varying(50) NOT NULL
);


ALTER TABLE wholesale_base.customer OWNER TO pg_database_owner;

--
-- TOC entry 232 (class 1259 OID 16561)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.customer ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16424)
-- Name: employee; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.employee (
    employee_id integer NOT NULL,
    fio character varying(100) NOT NULL,
    email character varying(50),
    phone character varying(20),
    personal_number integer NOT NULL,
    job_id integer NOT NULL
);


ALTER TABLE wholesale_base.employee OWNER TO pg_database_owner;

--
-- TOC entry 229 (class 1259 OID 16558)
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.employee ALTER COLUMN employee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16429)
-- Name: job; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.job (
    job_id integer NOT NULL,
    name_of_job character varying(50) NOT NULL,
    salary integer NOT NULL,
    working_conditions_description character varying(250)
);


ALTER TABLE wholesale_base.job OWNER TO pg_database_owner;

--
-- TOC entry 228 (class 1259 OID 16557)
-- Name: job_job_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.job ALTER COLUMN job_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.job_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16399)
-- Name: manufacturer; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.manufacturer (
    manufacturer_id integer NOT NULL,
    adress character varying(50) NOT NULL,
    company_name character varying(50) NOT NULL
);


ALTER TABLE wholesale_base.manufacturer OWNER TO pg_database_owner;

--
-- TOC entry 233 (class 1259 OID 16562)
-- Name: manufacturer_manufacturer_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.manufacturer ALTER COLUMN manufacturer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.manufacturer_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16434)
-- Name: order; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base."order" (
    order_id integer NOT NULL,
    date_of_sale date NOT NULL,
    contact_person character varying(50) NOT NULL,
    employee_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE wholesale_base."order" OWNER TO pg_database_owner;

--
-- TOC entry 226 (class 1259 OID 16444)
-- Name: order_list; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.order_list (
    order_list_id integer NOT NULL,
    price integer NOT NULL,
    count integer NOT NULL,
    order_id integer NOT NULL,
    purchase_list_id integer NOT NULL
);


ALTER TABLE wholesale_base.order_list OWNER TO pg_database_owner;

--
-- TOC entry 235 (class 1259 OID 16564)
-- Name: order_list_order_list_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.order_list ALTER COLUMN order_list_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.order_list_order_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16563)
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base."order" ALTER COLUMN order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16394)
-- Name: product; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.product (
    product_id integer NOT NULL,
    name character varying(50) NOT NULL,
    expiration_date date NOT NULL,
    packing_type character varying(50) NOT NULL,
    product_type character varying(50) NOT NULL,
    manufacturer_id integer NOT NULL
);


ALTER TABLE wholesale_base.product OWNER TO pg_database_owner;

--
-- TOC entry 236 (class 1259 OID 16565)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.product ALTER COLUMN product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16409)
-- Name: purchase; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.purchase (
    purchase_id integer NOT NULL,
    contact_person character varying(50) NOT NULL,
    date date NOT NULL,
    supplier_id integer NOT NULL,
    employee_id integer NOT NULL
);


ALTER TABLE wholesale_base.purchase OWNER TO pg_database_owner;

--
-- TOC entry 218 (class 1259 OID 16404)
-- Name: purchase_list; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.purchase_list (
    purchase_list_id integer NOT NULL,
    price integer NOT NULL,
    count integer NOT NULL,
    manufacture_date date NOT NULL,
    leftovers integer NOT NULL,
    purchase_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE wholesale_base.purchase_list OWNER TO pg_database_owner;

--
-- TOC entry 238 (class 1259 OID 16567)
-- Name: purchase_list_purchase_list_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.purchase_list ALTER COLUMN purchase_list_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.purchase_list_purchase_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 16566)
-- Name: purchase_purchase_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.purchase ALTER COLUMN purchase_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.purchase_purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16414)
-- Name: supplier; Type: TABLE; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TABLE wholesale_base.supplier (
    supplier_id integer NOT NULL,
    adress character varying(50) NOT NULL,
    company_name character varying(50) NOT NULL
);


ALTER TABLE wholesale_base.supplier OWNER TO pg_database_owner;

--
-- TOC entry 239 (class 1259 OID 16568)
-- Name: supplier_supplier_id_seq; Type: SEQUENCE; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.supplier ALTER COLUMN supplier_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wholesale_base.supplier_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3740 (class 0 OID 16419)
-- Dependencies: 221
-- Data for Name: cash_account; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (1, '2023-04-25', 123, 500, 'paid', 1);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (2, '2023-05-01', 124, 600, 'paid', 2);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (3, '2023-05-14', 125, 700, 'paid', 3);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (4, '2023-06-20', 126, 800, 'paid', 4);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (5, '2023-07-30', 127, 900, 'paid', 5);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (6, '2023-08-05', 128, 1000, 'paid', 6);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (7, '2023-08-25', 129, 1100, 'paid', 7);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (8, '2023-09-15', 130, 1200, 'paid', 8);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (9, '2023-09-28', 131, 1300, 'paid', 9);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (10, '2024-10-05', 132, 1400, 'paid', 10);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (11, '2023-10-24', 133, 1500, 'paid', 11);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (12, '2023-11-08', 134, 1600, 'paid', 12);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (13, '2023-12-20', 135, 1700, 'paid', 13);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (14, '2024-01-15', 136, 1800, 'paid', 14);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (15, '2024-02-20', 137, 1900, 'paid', 15);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (16, '2024-03-25', 138, 2000, 'paid', 16);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (17, '2024-04-30', 139, 2100, 'paid', 17);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (18, '2024-05-05', 140, 2200, 'paid', 18);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (19, '2024-06-10', 141, 2300, 'paid', 19);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (20, '2024-07-15', 142, 2400, 'paid', 20);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (21, '2024-08-20', 143, 2500, 'paid', 21);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (22, '2024-09-25', 144, 2600, 'paid', 22);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (23, '2024-10-30', 145, 2700, 'paid', 23);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (24, '2024-11-05', 146, 2800, 'paid', 24);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (25, '2024-12-10', 147, 2900, 'paid', 25);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (26, '2025-01-15', 148, 3000, 'paid', 26);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (27, '2025-02-20', 149, 3100, 'paid', 27);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (28, '2025-03-25', 150, 3200, 'paid', 28);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (29, '2025-04-30', 151, 3300, 'paid', 29);
INSERT INTO wholesale_base.cash_account (cash_account_id, date, number, sum, status, order_id) OVERRIDING SYSTEM VALUE VALUES (30, '2025-05-05', 152, 3400, 'paid', 30);


--
-- TOC entry 3746 (class 0 OID 16544)
-- Dependencies: 227
-- Data for Name: cash_account_purchase; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (1, '2019-05-15', 1, 1, 'paid', 1);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (2, '2019-06-20', 2, 2, 'paid', 2);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (3, '2019-07-25', 3, 3, 'paid', 3);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (4, '2019-08-30', 4, 4, 'paid', 4);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (5, '2019-09-05', 5, 5, 'paid', 5);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (6, '2019-10-10', 6, 6, 'paid', 6);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (7, '2020-11-15', 7, 7, 'paid', 7);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (8, '2020-12-20', 8, 8, 'paid', 8);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (9, '2020-01-25', 9, 9, 'paid', 9);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (10, '2020-02-28', 10, 10, 'paid', 10);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (11, '2020-03-05', 11, 11, 'paid', 11);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (12, '2020-04-10', 12, 12, 'paid', 12);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (13, '2020-05-15', 13, 13, 'paid', 13);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (14, '2020-06-20', 14, 14, 'paid', 14);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (15, '2020-07-25', 15, 15, 'paid', 15);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (16, '2020-08-30', 16, 16, 'paid', 16);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (17, '2020-09-05', 17, 17, 'paid', 17);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (18, '2020-10-10', 18, 18, 'paid', 18);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (19, '2020-11-15', 19, 19, 'paid', 19);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (20, '2020-12-20', 20, 20, 'paid', 20);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (21, '2021-01-25', 21, 21, 'paid', 21);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (22, '2021-02-28', 22, 22, 'paid', 22);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (23, '2021-03-05', 23, 23, 'paid', 23);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (24, '2021-04-10', 24, 24, 'paid', 24);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (25, '2021-05-15', 25, 25, 'paid', 25);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (26, '2021-06-20', 26, 26, 'paid', 26);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (27, '2021-07-25', 27, 27, 'paid', 27);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (28, '2021-08-30', 28, 28, 'paid', 28);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (29, '2021-09-05', 29, 29, 'paid', 29);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (30, '2021-10-10', 30, 30, 'paid', 30);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (31, '2021-11-15', 31, 31, 'paid', 31);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (32, '2021-12-20', 32, 32, 'paid', 32);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (33, '2022-01-25', 33, 33, 'paid', 33);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (34, '2022-02-28', 34, 34, 'paid', 34);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (35, '2022-03-05', 35, 35, 'paid', 35);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (36, '2022-04-10', 36, 36, 'paid', 36);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (37, '2022-05-15', 37, 37, 'paid', 37);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (38, '2022-06-20', 38, 38, 'paid', 38);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (39, '2022-07-25', 39, 39, 'paid', 39);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (40, '2022-08-30', 40, 40, 'paid', 40);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (41, '2022-09-05', 41, 41, 'paid', 41);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (42, '2022-10-10', 42, 42, 'paid', 42);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (43, '2022-11-15', 43, 43, 'paid', 43);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (44, '2022-12-20', 44, 44, 'paid', 44);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (45, '2023-01-25', 45, 45, 'paid', 45);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (46, '2023-02-28', 46, 46, 'paid', 46);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (47, '2023-03-05', 47, 47, 'paid', 47);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (48, '2023-03-10', 48, 48, 'paid', 48);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (49, '2023-03-15', 49, 49, 'paid', 49);
INSERT INTO wholesale_base.cash_account_purchase (cash_account_purchase_id, date, number, sum, status, purchase_id) OVERRIDING SYSTEM VALUE VALUES (50, '2023-03-20', 50, 50, 'paid', 50);


--
-- TOC entry 3744 (class 0 OID 16439)
-- Dependencies: 225
-- Data for Name: customer; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (1, '777 Lucky St', 'WIN Company');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (2, '999 Prosperity Blvd', 'SUCCESS Corporation');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (3, '555 Victory Ln', 'TRIUMPH Ltd.');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (4, '444 Fortune Ave', 'ACME Enterprises');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (5, '888 Wealth Rd', 'PROSPERITY Industries');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (6, '333 Prosper Ave', 'VICTORY Corporation');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (7, '222 Success St', 'FORTUNE Ltd.');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (8, '111 Triumph Blvd', 'WEALTH Enterprises');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (9, '123 Harmony Rd', 'HARMONY Corporation');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (10, '456 Serenity St', 'SERENITY Ltd.');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (11, '789 Joy Ave', 'JOY Enterprises');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (12, '654 Peace Blvd', 'PEACE Corporation');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (13, '888 Unity Ln', 'UNITY Ltd.');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (14, '777 Hope Rd', 'HOPE Enterprises');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (15, '111 Dream St', 'DREAM Corporation');
INSERT INTO wholesale_base.customer (customer_id, customer_adress, customer_company_name) OVERRIDING SYSTEM VALUE VALUES (16, '999 Bliss Ave', 'BLISS Ltd.');


--
-- TOC entry 3741 (class 0 OID 16424)
-- Dependencies: 222
-- Data for Name: employee; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.employee (employee_id, fio, email, phone, personal_number, job_id) OVERRIDING SYSTEM VALUE VALUES (19, 'John Smith', 'john@example.com', '1234567890', 12345, 1);
INSERT INTO wholesale_base.employee (employee_id, fio, email, phone, personal_number, job_id) OVERRIDING SYSTEM VALUE VALUES (20, 'Emily Johnson', 'emily@example.com', '9876543210', 54321, 2);
INSERT INTO wholesale_base.employee (employee_id, fio, email, phone, personal_number, job_id) OVERRIDING SYSTEM VALUE VALUES (21, 'Michael Davis', 'michael@example.com', '1112223333', 11111, 1);
INSERT INTO wholesale_base.employee (employee_id, fio, email, phone, personal_number, job_id) OVERRIDING SYSTEM VALUE VALUES (22, 'Sarah Brown', 'sarah@example.com', '4445556666', 22222, 2);
INSERT INTO wholesale_base.employee (employee_id, fio, email, phone, personal_number, job_id) OVERRIDING SYSTEM VALUE VALUES (23, 'David Wilson', 'david@example.com', '7778889999', 33333, 1);
INSERT INTO wholesale_base.employee (employee_id, fio, email, phone, personal_number, job_id) OVERRIDING SYSTEM VALUE VALUES (24, 'Jessica Martinez', 'jessica@example.com', '0009998888', 44444, 2);


--
-- TOC entry 3742 (class 0 OID 16429)
-- Dependencies: 223
-- Data for Name: job; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.job (job_id, name_of_job, salary, working_conditions_description) OVERRIDING SYSTEM VALUE VALUES (1, 'Sales Representative', 50000, 'Developing and maintaining relationships with clients');
INSERT INTO wholesale_base.job (job_id, name_of_job, salary, working_conditions_description) OVERRIDING SYSTEM VALUE VALUES (2, 'Purchasing Manager', 70000, 'Managing procurement and supply chain activities');


--
-- TOC entry 3736 (class 0 OID 16399)
-- Dependencies: 217
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (1, '1010 Rainbow Ave', 'RAINBOW Corporation');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (2, '1313 Sunshine St', 'SUNSHINE Ltd.');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (3, '1414 Ocean Blvd', 'OCEAN Enterprises');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (4, '1515 Sky Rd', 'SKY Corporation');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (5, '1616 Star Ave', 'STAR Ltd.');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (6, '1717 Moon St', 'MOON Enterprises');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (7, '1818 Galaxy Blvd', 'GALAXY Corporation');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (8, '1919 Universe Rd', 'UNIVERSE Ltd.');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (9, '2020 Mars Ave', 'MARS Enterprises');
INSERT INTO wholesale_base.manufacturer (manufacturer_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (10, '2121 Jupiter Ln', 'JUPITER Corporation');


--
-- TOC entry 3743 (class 0 OID 16434)
-- Dependencies: 224
-- Data for Name: order; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (1, '2023-04-25', 'Samantha Brown', 19, 15);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (2, '2023-05-01', 'Chris Evans', 20, 16);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (3, '2023-05-14', 'Jennifer Lee', 21, 1);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (4, '2023-06-20', 'Kevin Johnson', 22, 2);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (5, '2023-07-30', 'Melissa Smith', 23, 3);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (6, '2023-08-05', 'Christopher Davis', 24, 4);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (7, '2023-08-25', 'Jessica White', 19, 5);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (8, '2023-09-15', 'Andrew Martin', 20, 6);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (9, '2023-09-28', 'Stephanie Thompson', 21, 7);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (10, '2024-10-05', 'Patrick Harris', 22, 8);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (11, '2023-10-24', 'Nicole Clark', 23, 9);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (12, '2023-11-08', 'Matthew Rodriguez', 24, 10);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (13, '2023-12-20', 'Amanda Garcia', 19, 11);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (14, '2024-01-15', 'Ryan Wilson', 20, 12);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (15, '2024-02-20', 'Hannah Anderson', 21, 13);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (16, '2024-03-25', 'Justin Moore', 22, 14);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (17, '2024-04-30', 'Samantha Lee', 23, 15);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (18, '2024-05-05', 'Phillip Brown', 24, 16);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (19, '2024-06-10', 'Sophie Johnson', 19, 1);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (20, '2024-07-15', 'David Smith', 20, 2);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (21, '2024-08-20', 'Rachel Davis', 21, 3);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (22, '2024-09-25', 'Chris White', 22, 4);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (23, '2024-10-30', 'Olivia Martin', 23, 5);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (24, '2024-11-05', 'Nathan Thompson', 24, 6);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (25, '2024-12-10', 'Grace Harris', 19, 7);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (26, '2025-01-15', 'Lucas Clark', 20, 8);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (27, '2025-02-20', 'Anna Rodriguez', 21, 9);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (28, '2025-03-25', 'Dylan Garcia', 22, 10);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (29, '2025-04-30', 'Lauren Wilson', 23, 11);
INSERT INTO wholesale_base."order" (order_id, date_of_sale, contact_person, employee_id, customer_id) OVERRIDING SYSTEM VALUE VALUES (30, '2025-05-05', 'Evan Anderson', 24, 12);


--
-- TOC entry 3745 (class 0 OID 16444)
-- Dependencies: 226
-- Data for Name: order_list; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (3, 150, 56, 1, 1);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (4, 620, 50, 1, 2);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (85, 450, 88, 2, 3);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (89, 432, 22, 2, 4);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (90, 210, 24, 2, 5);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (91, 438, 52, 3, 4);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (92, 51, 72, 4, 7);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (93, 56, 14, 5, 7);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (94, 99, 34, 6, 8);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (95, 208, 63, 7, 10);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (96, 714, 16, 7, 11);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (97, 154, 23, 8, 12);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (98, 766, 22, 8, 11);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (99, 620, 66, 9, 14);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (100, 245, 45, 10, 15);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (101, 700, 26, 11, 17);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (102, 811, 33, 12, 18);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (103, 55, 28, 13, 29);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (104, 432, 32, 14, 34);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (105, 122, 40, 14, 38);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (106, 331, 20, 14, 35);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (107, 722, 34, 15, 39);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (108, 295, 33, 16, 16);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (109, 123, 26, 16, 19);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (110, 145, 39, 17, 20);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (111, 425, 28, 18, 21);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (112, 225, 90, 18, 22);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (113, 144, 12, 19, 23);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (114, 482, 31, 19, 24);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (115, 402, 13, 19, 25);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (116, 616, 53, 19, 26);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (117, 522, 27, 19, 27);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (118, 576, 65, 20, 28);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (119, 191, 21, 21, 30);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (120, 390, 33, 21, 31);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (121, 669, 55, 22, 41);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (122, 366, 75, 23, 42);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (123, 652, 61, 24, 43);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (124, 691, 44, 23, 44);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (125, 182, 27, 23, 45);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (126, 623, 69, 24, 46);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (127, 100, 42, 25, 47);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (128, 401, 20, 25, 48);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (129, 164, 45, 25, 49);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (130, 690, 24, 26, 50);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (131, 1002, 77, 26, 51);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (132, 799, 57, 27, 52);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (133, 402, 55, 27, 64);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (134, 551, 22, 27, 65);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (135, 425, 31, 28, 66);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (136, 899, 39, 28, 67);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (137, 121, 53, 28, 68);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (138, 534, 62, 28, 69);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (139, 689, 62, 29, 70);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (140, 432, 40, 29, 71);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (141, 311, 60, 29, 72);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (142, 211, 34, 29, 73);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (143, 377, 34, 30, 82);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (144, 499, 32, 30, 83);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (145, 187, 22, 30, 84);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (146, 201, 71, 30, 85);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (147, 233, 91, 30, 86);
INSERT INTO wholesale_base.order_list (order_list_id, price, count, order_id, purchase_list_id) OVERRIDING SYSTEM VALUE VALUES (148, 333, 21, 30, 87);


--
-- TOC entry 3735 (class 0 OID 16394)
-- Dependencies: 216
-- Data for Name: product; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Product A', '2023-05-15', 'Box packaging', 'Food and Beverages', 1);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Product B', '2023-06-20', 'Pallet packaging', 'Industrial materials and equipment', 2);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Product C', '2023-07-25', 'Block packaging', 'Technical and electronic goods', 3);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Product D', '2023-08-30', 'Container packaging', 'Clothing and textiles', 4);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (5, 'Product E', '2023-09-05', 'Bag packaging', 'Medical goods and equipment', 5);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Product F', '2023-10-10', 'Box packaging', 'Construction materials', 6);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (7, 'Product G', '2023-11-15', 'Pallet packaging', 'Automotive parts and accessories', 7);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Product H', '2023-12-20', 'Block packaging', 'Stationery supplies', 8);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (9, 'Product I', '2024-01-25', 'Box packaging', 'Food and Beverages', 9);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (10, 'Product J', '2024-02-28', 'Pallet packaging', 'Industrial materials and equipment', 10);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (11, 'Product K', '2024-03-05', 'Block packaging', 'Technical and electronic goods', 1);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (12, 'Product L', '2024-04-10', 'Container packaging', 'Clothing and textiles', 2);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (13, 'Product M', '2024-05-15', 'Bag packaging', 'Medical goods and equipment', 3);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (14, 'Product N', '2024-06-20', 'Box packaging', 'Construction materials', 4);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (15, 'Product O', '2024-07-25', 'Pallet packaging', 'Automotive parts and accessories', 5);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (16, 'Product P', '2024-08-30', 'Block packaging', 'Stationery supplies', 6);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (17, 'Product Q', '2024-09-05', 'Box packaging', 'Food and Beverages', 7);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (18, 'Product R', '2024-10-10', 'Pallet packaging', 'Industrial materials and equipment', 8);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (19, 'Product S', '2024-11-15', 'Block packaging', 'Technical and electronic goods', 9);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (20, 'Product T', '2024-12-20', 'Container packaging', 'Clothing and textiles', 10);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (21, 'Product U', '2025-01-25', 'Bag packaging', 'Medical goods and equipment', 1);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (22, 'Product V', '2025-02-28', 'Box packaging', 'Construction materials', 2);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (23, 'Product W', '2025-03-05', 'Pallet packaging', 'Automotive parts and accessories', 3);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (24, 'Product X', '2025-04-10', 'Block packaging', 'Stationery supplies', 4);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (25, 'Product Y', '2025-05-15', 'Box packaging', 'Food and Beverages', 5);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (26, 'Product Z', '2025-06-20', 'Pallet packaging', 'Industrial materials and equipment', 6);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (27, 'Product AA', '2025-07-25', 'Block packaging', 'Technical and electronic goods', 7);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (28, 'Product BB', '2025-08-30', 'Container packaging', 'Clothing and textiles', 8);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (29, 'Product CC', '2025-09-05', 'Bag packaging', 'Medical goods and equipment', 9);
INSERT INTO wholesale_base.product (product_id, name, expiration_date, packing_type, product_type, manufacturer_id) OVERRIDING SYSTEM VALUE VALUES (30, 'Product DD', '2025-10-10', 'Box packaging', 'Construction materials', 10);


--
-- TOC entry 3738 (class 0 OID 16409)
-- Dependencies: 219
-- Data for Name: purchase; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (1, 'John Smith', '2019-05-15', 4, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Jane Doe', '2019-06-20', 5, 20);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Michael Johnson', '2019-07-25', 6, 21);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Emily Davis', '2019-08-30', 7, 22);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (5, 'David Brown', '2019-09-05', 8, 23);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Sarah Wilson', '2019-10-10', 9, 24);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (7, 'James Martin', '2020-11-15', 10, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Olivia Garcia', '2020-12-20', 11, 20);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (9, 'Daniel Rodriguez', '2020-01-25', 4, 21);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (10, 'Sophia Martinez', '2020-02-28', 5, 22);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (11, 'Logan Gonzalez', '2020-03-05', 6, 23);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (12, 'Bella Lee', '2020-04-10', 7, 24);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (13, 'Alexander Perez', '2020-05-15', 8, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (14, 'Mia Moore', '2020-06-20', 9, 20);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (15, 'Ethan Taylor', '2020-07-25', 10, 21);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (16, 'Ava Anderson', '2020-08-30', 11, 22);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (17, 'William Thomas', '2020-09-05', 4, 23);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (18, 'Chloe Jackson', '2020-10-10', 5, 24);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (19, 'Benjamin White', '2020-11-15', 6, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (20, 'Avery Harris', '2020-12-20', 7, 20);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (21, 'Zoey Martin', '2021-01-25', 8, 21);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (22, 'Liam Clark', '2021-02-28', 9, 22);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (23, 'Amelia Lewis', '2021-03-05', 10, 23);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (24, 'Harper Hall', '2021-04-10', 11, 24);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (25, 'Mason Young', '2021-05-15', 4, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (26, 'Evelyn King', '2021-06-20', 5, 20);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (27, 'Emily Adams', '2021-07-25', 6, 21);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (28, 'Abigail Baker', '2021-08-30', 7, 22);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (29, 'Joseph Hill', '2021-09-05', 8, 23);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (30, 'Natalie Rivera', '2021-10-10', 9, 24);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (31, 'Hannah Campbell', '2021-11-15', 10, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (32, 'Aiden Mitchell', '2021-12-20', 11, 20);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (33, 'Oliver Carter', '2022-01-25', 4, 21);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (34, 'Madelyn Gray', '2022-02-28', 5, 22);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (35, 'Elijah Ward', '2022-03-05', 6, 23);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (36, 'Aubrey Morgan', '2022-04-10', 7, 24);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (37, 'Ella Palmer', '2022-05-15', 8, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (38, 'Grace Hill', '2022-06-20', 9, 20);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (39, 'Jayden Harrison', '2022-07-25', 10, 21);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (40, 'Layla Rose', '2022-08-30', 11, 22);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (41, 'John Fisher', '2022-09-05', 4, 23);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (42, 'Julia Powell', '2022-10-10', 5, 24);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (43, 'Ryan Long', '2022-11-15', 6, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (44, 'Samuel Coleman', '2022-12-20', 7, 20);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (45, 'Ellie Perry', '2023-01-25', 8, 21);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (46, 'Isaac Cooper', '2023-02-28', 9, 22);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (47, 'Nora Ross', '2023-03-05', 10, 23);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (48, 'Maya Bennett', '2023-03-10', 11, 24);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (49, 'Gabriel Barnes', '2023-03-15', 4, 19);
INSERT INTO wholesale_base.purchase (purchase_id, contact_person, date, supplier_id, employee_id) OVERRIDING SYSTEM VALUE VALUES (50, 'Alexis Murphy', '2023-03-20', 5, 20);


--
-- TOC entry 3737 (class 0 OID 16404)
-- Dependencies: 218
-- Data for Name: purchase_list; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (6, 251, 83, '2018-02-25', 83, 1, 8);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (9, 57, 38, '2018-11-17', 38, 36, 25);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (13, 76, 45, '2018-08-08', 45, 30, 12);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (32, 238, 79, '2018-01-27', 79, 39, 8);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (33, 581, 78, '2017-03-25', 78, 33, 21);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (36, 152, 49, '2017-06-14', 49, 1, 12);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (37, 341, 62, '2018-01-28', 62, 19, 11);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (40, 668, 71, '2018-03-09', 71, 23, 24);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (53, 638, 41, '2018-02-17', 41, 44, 27);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (54, 334, 78, '2018-08-16', 78, 21, 22);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (55, 247, 72, '2018-04-03', 72, 35, 2);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (56, 364, 89, '2018-05-19', 89, 9, 5);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (57, 195, 20, '2018-02-15', 20, 34, 22);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (58, 619, 87, '2018-08-12', 87, 10, 14);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (59, 399, 51, '2017-08-08', 51, 40, 14);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (60, 487, 43, '2017-09-23', 43, 13, 15);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (61, 554, 27, '2017-10-15', 27, 26, 24);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (62, 264, 73, '2018-06-11', 73, 24, 2);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (63, 83, 69, '2017-06-08', 69, 36, 24);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (74, 297, 68, '2017-09-30', 68, 35, 6);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (75, 495, 83, '2017-04-16', 83, 2, 28);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (76, 618, 32, '2017-07-15', 32, 7, 9);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (77, 566, 20, '2017-07-07', 20, 32, 2);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (78, 460, 28, '2018-04-22', 28, 31, 25);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (79, 115, 90, '2018-07-27', 90, 45, 6);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (80, 117, 64, '2018-08-27', 64, 4, 1);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (81, 487, 40, '2018-06-10', 40, 40, 13);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (88, 301, 22, '2018-09-08', 22, 23, 1);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (89, 114, 34, '2017-08-24', 34, 18, 22);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (90, 358, 94, '2018-07-04', 94, 20, 24);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (91, 692, 85, '2018-08-22', 85, 22, 15);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (92, 208, 50, '2017-11-19', 50, 46, 3);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (93, 398, 70, '2017-05-30', 70, 36, 27);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (94, 90, 39, '2018-05-07', 39, 34, 10);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (95, 513, 89, '2017-03-28', 89, 7, 24);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (96, 364, 39, '2017-12-29', 39, 29, 18);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (97, 638, 28, '2018-04-29', 28, 40, 15);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (98, 591, 32, '2018-06-29', 32, 40, 19);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (99, 653, 25, '2018-06-26', 25, 42, 22);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (100, 515, 50, '2017-10-04', 50, 16, 17);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (22, 225, 90, '2018-09-28', 0, 41, 18);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (1, 119, 76, '2018-04-04', 20, 22, 17);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (2, 577, 51, '2017-07-28', 1, 4, 25);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (12, 132, 92, '2017-05-03', 69, 43, 12);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (11, 660, 43, '2018-03-05', 5, 32, 3);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (14, 576, 97, '2018-09-01', 31, 43, 12);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (15, 290, 45, '2018-02-21', 0, 12, 21);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (17, 555, 74, '2017-01-09', 48, 6, 14);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (18, 626, 42, '2018-05-30', 9, 50, 25);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (29, 112, 28, '2018-01-11', 0, 35, 25);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (34, 497, 42, '2017-01-17', 10, 11, 20);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (38, 108, 49, '2018-01-21', 9, 20, 29);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (35, 315, 21, '2018-08-22', 1, 3, 6);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (39, 674, 46, '2018-11-03', 12, 39, 5);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (16, 275, 55, '2018-07-12', 22, 6, 1);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (3, 402, 89, '2018-09-12', 1, 19, 15);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (23, 114, 22, '2017-10-16', 10, 34, 3);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (5, 229, 75, '2018-12-13', 51, 14, 11);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (4, 441, 84, '2018-02-18', 10, 22, 2);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (24, 422, 33, '2018-06-23', 2, 16, 15);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (7, 62, 93, '2017-06-04', 7, 7, 13);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (8, 99, 69, '2017-07-28', 35, 36, 17);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (10, 222, 68, '2017-08-09', 5, 29, 7);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (19, 123, 26, '2018-09-07', 0, 29, 1);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (20, 145, 39, '2018-05-11', 0, 36, 8);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (21, 425, 28, '2018-09-17', 0, 9, 16);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (25, 385, 33, '2018-08-31', 20, 16, 7);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (26, 616, 53, '2018-09-10', 0, 9, 24);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (27, 579, 27, '2018-05-16', 0, 3, 17);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (28, 576, 65, '2017-03-25', 0, 48, 13);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (30, 171, 24, '2018-12-30', 3, 5, 14);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (31, 380, 45, '2018-11-11', 12, 27, 3);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (41, 669, 55, '2017-01-31', 0, 29, 13);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (42, 366, 75, '2018-07-14', 0, 4, 2);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (43, 638, 61, '2018-09-01', 0, 17, 5);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (44, 591, 84, '2018-06-08', 40, 18, 22);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (45, 150, 27, '2017-09-28', 0, 47, 26);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (46, 517, 69, '2018-05-09', 0, 36, 15);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (47, 61, 47, '2018-02-04', 5, 23, 10);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (48, 374, 20, '2017-12-02', 0, 19, 12);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (49, 154, 45, '2017-08-06', 0, 22, 10);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (50, 391, 88, '2018-04-07', 64, 10, 18);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (51, 573, 100, '2018-03-28', 23, 16, 15);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (52, 511, 57, '2018-02-17', 0, 25, 22);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (64, 346, 78, '2018-06-08', 23, 35, 11);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (65, 412, 49, '2017-07-07', 27, 32, 8);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (66, 364, 44, '2018-05-21', 13, 46, 29);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (67, 408, 41, '2017-11-01', 2, 40, 16);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (68, 79, 73, '2018-08-10', 20, 30, 18);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (69, 481, 69, '2018-03-14', 7, 6, 21);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (70, 645, 65, '2018-06-19', 3, 39, 16);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (71, 372, 40, '2017-04-15', 0, 48, 21);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (72, 259, 60, '2017-05-12', 0, 39, 4);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (73, 154, 34, '2018-11-01', 0, 24, 14);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (82, 477, 44, '2017-10-19', 10, 37, 1);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (83, 392, 37, '2018-01-25', 5, 3, 3);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (84, 115, 26, '2018-01-30', 4, 32, 12);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (85, 179, 88, '2018-02-25', 17, 11, 23);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (86, 101, 98, '2018-03-02', 7, 15, 2);
INSERT INTO wholesale_base.purchase_list (purchase_list_id, price, count, manufacture_date, leftovers, purchase_id, product_id) OVERRIDING SYSTEM VALUE VALUES (87, 168, 23, '2018-01-02', 2, 13, 3);


--
-- TOC entry 3739 (class 0 OID 16414)
-- Dependencies: 220
-- Data for Name: supplier; Type: TABLE DATA; Schema: wholesale_base; Owner: pg_database_owner
--

INSERT INTO wholesale_base.supplier (supplier_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (4, '123 Main St', 'ABC Company');
INSERT INTO wholesale_base.supplier (supplier_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (5, '456 Elm St', 'XYZ Corporation');
INSERT INTO wholesale_base.supplier (supplier_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (6, '789 Oak St', 'EFG Ltd.');
INSERT INTO wholesale_base.supplier (supplier_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (7, '111 Pine St', 'LMN Enterprises');
INSERT INTO wholesale_base.supplier (supplier_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (8, '222 Maple St', 'QRS Industries');
INSERT INTO wholesale_base.supplier (supplier_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (9, '333 Cedar St', 'TUV Corporation');
INSERT INTO wholesale_base.supplier (supplier_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (10, '444 Walnut St', 'OPQ Ltd.');
INSERT INTO wholesale_base.supplier (supplier_id, adress, company_name) OVERRIDING SYSTEM VALUE VALUES (11, '555 Cherry St', 'WXY Enterprises');


--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 230
-- Name: cash_account_cash_account_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.cash_account_cash_account_id_seq', 30, true);


--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 231
-- Name: cash_account_purchase_cash_account_purchase_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.cash_account_purchase_cash_account_purchase_id_seq', 50, true);


--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 232
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.customer_customer_id_seq', 16, true);


--
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 229
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.employee_employee_id_seq', 24, true);


--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 228
-- Name: job_job_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.job_job_id_seq', 1, false);


--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 233
-- Name: manufacturer_manufacturer_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.manufacturer_manufacturer_id_seq', 10, true);


--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 235
-- Name: order_list_order_list_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.order_list_order_list_id_seq', 148, true);


--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 234
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.order_order_id_seq', 30, true);


--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 236
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.product_product_id_seq', 30, true);


--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 238
-- Name: purchase_list_purchase_list_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.purchase_list_purchase_list_id_seq', 100, true);


--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 237
-- Name: purchase_purchase_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.purchase_purchase_id_seq', 50, true);


--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 239
-- Name: supplier_supplier_id_seq; Type: SEQUENCE SET; Schema: wholesale_base; Owner: pg_database_owner
--

SELECT pg_catalog.setval('wholesale_base.supplier_supplier_id_seq', 11, true);


--
-- TOC entry 3533 (class 2606 OID 16542)
-- Name: supplier adress_contains_english_letters_or_numbers_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.supplier
    ADD CONSTRAINT adress_contains_english_letters_or_numbers_check CHECK (((adress)::text ~* '^[A-Za-z0-9\s]+$'::text)) NOT VALID;


--
-- TOC entry 3526 (class 2606 OID 16572)
-- Name: manufacturer adress_latin_letters_numbers_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.manufacturer
    ADD CONSTRAINT adress_latin_letters_numbers_spaces_check CHECK (((adress)::text ~* '^[A-Za-z0-9._\s]+$'::text)) NOT VALID;


--
-- TOC entry 3563 (class 2606 OID 16423)
-- Name: cash_account cash_account_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.cash_account
    ADD CONSTRAINT cash_account_pkey PRIMARY KEY (cash_account_id);


--
-- TOC entry 3577 (class 2606 OID 16548)
-- Name: cash_account_purchase cash_account_purchase_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.cash_account_purchase
    ADD CONSTRAINT cash_account_purchase_pkey PRIMARY KEY (cash_account_purchase_id);


--
-- TOC entry 3527 (class 2606 OID 16571)
-- Name: manufacturer company_name_latin_letters_numbers_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.manufacturer
    ADD CONSTRAINT company_name_latin_letters_numbers_spaces_check CHECK (((company_name)::text ~* '^[A-Za-z0-9_.\s]+$'::text)) NOT VALID;


--
-- TOC entry 3534 (class 2606 OID 16569)
-- Name: supplier company_name_letters_are_english_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.supplier
    ADD CONSTRAINT company_name_letters_are_english_check CHECK (((company_name)::text ~* '^[A-Za-z0-9_.\s]+$'::text)) NOT VALID;


--
-- TOC entry 3544 (class 2606 OID 16539)
-- Name: order contact_person_latin_letters_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base."order"
    ADD CONSTRAINT contact_person_latin_letters_spaces_check CHECK (((contact_person)::text ~* '^[A-Za-z\s]+$'::text)) NOT VALID;


--
-- TOC entry 3532 (class 2606 OID 16541)
-- Name: purchase contact_person_latin_letters_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.purchase
    ADD CONSTRAINT contact_person_latin_letters_spaces_check CHECK (((contact_person)::text ~* '^[A-Za-z\s]+$'::text)) NOT VALID;


--
-- TOC entry 3545 (class 2606 OID 16531)
-- Name: customer customer_adress_latin_letters_numbers_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.customer
    ADD CONSTRAINT customer_adress_latin_letters_numbers_spaces_check CHECK (((customer_adress)::text ~* '^[A-Za-z0-9\s]+$'::text)) NOT VALID;


--
-- TOC entry 3546 (class 2606 OID 16570)
-- Name: customer customer_company_name_latin_letters_numbers_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.customer
    ADD CONSTRAINT customer_company_name_latin_letters_numbers_spaces_check CHECK (((customer_company_name)::text ~* '^[A-Za-z0-9_.\s]+$'::text)) NOT VALID;


--
-- TOC entry 3573 (class 2606 OID 16443)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 3538 (class 2606 OID 16527)
-- Name: employee email_validation; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.employee
    ADD CONSTRAINT email_validation CHECK (((email)::text ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'::text)) NOT VALID;


--
-- TOC entry 3565 (class 2606 OID 16428)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 3539 (class 2606 OID 16537)
-- Name: employee fio_latin_letters_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.employee
    ADD CONSTRAINT fio_latin_letters_spaces_check CHECK (((fio)::text ~* '^[A-Za-z\s]+$'::text)) NOT VALID;


--
-- TOC entry 3569 (class 2606 OID 16433)
-- Name: job job_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (job_id);


--
-- TOC entry 3528 (class 2606 OID 16573)
-- Name: purchase_list leftovers_lower_or_equal_count; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.purchase_list
    ADD CONSTRAINT leftovers_lower_or_equal_count CHECK ((leftovers <= count)) NOT VALID;


--
-- TOC entry 3555 (class 2606 OID 16403)
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (manufacturer_id);


--
-- TOC entry 3523 (class 2606 OID 16540)
-- Name: product name_latin_letters_numbers_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.product
    ADD CONSTRAINT name_latin_letters_numbers_spaces_check CHECK (((name)::text ~* '^[A-Za-z0-9_\s]+$'::text)) NOT VALID;


--
-- TOC entry 3542 (class 2606 OID 16536)
-- Name: job name_of_job_latin_letters_spaces_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.job
    ADD CONSTRAINT name_of_job_latin_letters_spaces_check CHECK (((name_of_job)::text ~* '^[A-Za-z\s]+$'::text)) NOT VALID;


--
-- TOC entry 3575 (class 2606 OID 16448)
-- Name: order_list order_list_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.order_list
    ADD CONSTRAINT order_list_pkey PRIMARY KEY (order_list_id);


--
-- TOC entry 3571 (class 2606 OID 16438)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3524 (class 2606 OID 16522)
-- Name: product packing_type_choice_restriction; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.product
    ADD CONSTRAINT packing_type_choice_restriction CHECK (((packing_type)::text = ANY ((ARRAY['Block packaging'::character varying, 'Box packaging'::character varying, 'Pallet packaging'::character varying, 'Container packaging'::character varying, 'Bag packaging'::character varying])::text[]))) NOT VALID;


--
-- TOC entry 3540 (class 2606 OID 16526)
-- Name: employee phone_validation; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.employee
    ADD CONSTRAINT phone_validation CHECK (((phone)::text ~ '^[0-9]{10}$'::text)) NOT VALID;


--
-- TOC entry 3529 (class 2606 OID 16585)
-- Name: purchase_list positive_count_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.purchase_list
    ADD CONSTRAINT positive_count_check CHECK ((count >= 0)) NOT VALID;


--
-- TOC entry 3547 (class 2606 OID 16587)
-- Name: order_list positive_count_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.order_list
    ADD CONSTRAINT positive_count_check CHECK ((count >= 0)) NOT VALID;


--
-- TOC entry 3530 (class 2606 OID 16584)
-- Name: purchase_list positive_leftovers_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.purchase_list
    ADD CONSTRAINT positive_leftovers_check CHECK ((leftovers >= 0)) NOT VALID;


--
-- TOC entry 3535 (class 2606 OID 16493)
-- Name: cash_account positive_number_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.cash_account
    ADD CONSTRAINT positive_number_check CHECK ((number > 0)) NOT VALID;


--
-- TOC entry 3549 (class 2606 OID 16556)
-- Name: cash_account_purchase positive_number_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.cash_account_purchase
    ADD CONSTRAINT positive_number_check CHECK ((number > 0)) NOT VALID;


--
-- TOC entry 3541 (class 2606 OID 16485)
-- Name: employee positive_presonal_number_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.employee
    ADD CONSTRAINT positive_presonal_number_check CHECK ((personal_number > 0)) NOT VALID;


--
-- TOC entry 3531 (class 2606 OID 16586)
-- Name: purchase_list positive_price_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.purchase_list
    ADD CONSTRAINT positive_price_check CHECK ((price >= 0)) NOT VALID;


--
-- TOC entry 3548 (class 2606 OID 16588)
-- Name: order_list positive_price_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.order_list
    ADD CONSTRAINT positive_price_check CHECK ((price >= 0)) NOT VALID;


--
-- TOC entry 3543 (class 2606 OID 16477)
-- Name: job positive_salary_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.job
    ADD CONSTRAINT positive_salary_check CHECK ((salary > 0)) NOT VALID;


--
-- TOC entry 3536 (class 2606 OID 16492)
-- Name: cash_account positive_sum_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.cash_account
    ADD CONSTRAINT positive_sum_check CHECK ((sum > 0)) NOT VALID;


--
-- TOC entry 3550 (class 2606 OID 16555)
-- Name: cash_account_purchase positive_sum_check; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.cash_account_purchase
    ADD CONSTRAINT positive_sum_check CHECK ((sum > 0)) NOT VALID;


--
-- TOC entry 3553 (class 2606 OID 16398)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3525 (class 2606 OID 16523)
-- Name: product product_type_choice_restriction; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.product
    ADD CONSTRAINT product_type_choice_restriction CHECK (((product_type)::text = ANY ((ARRAY['Food and Beverages'::character varying, 'Industrial materials and equipment'::character varying, 'Technical and electronic goods'::character varying, 'Clothing and textiles'::character varying, 'Medical goods and equipment'::character varying, 'Construction materials'::character varying, 'Automotive parts and accessories'::character varying, 'Stationery supplies'::character varying])::text[]))) NOT VALID;


--
-- TOC entry 3557 (class 2606 OID 16408)
-- Name: purchase_list purchase_list_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.purchase_list
    ADD CONSTRAINT purchase_list_pkey PRIMARY KEY (purchase_list_id);


--
-- TOC entry 3559 (class 2606 OID 16413)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (purchase_id);


--
-- TOC entry 3537 (class 2606 OID 16491)
-- Name: cash_account status_choice_restriction; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.cash_account
    ADD CONSTRAINT status_choice_restriction CHECK ((((status)::text = 'awaiting payment'::text) OR ((status)::text = 'paid'::text) OR ((status)::text = 'rejected'::text))) NOT VALID;


--
-- TOC entry 3551 (class 2606 OID 16554)
-- Name: cash_account_purchase status_choice_restriction; Type: CHECK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE wholesale_base.cash_account_purchase
    ADD CONSTRAINT status_choice_restriction CHECK ((((status)::text = 'awaiting payment'::text) OR ((status)::text = 'paid'::text) OR ((status)::text = 'rejected'::text))) NOT VALID;


--
-- TOC entry 3561 (class 2606 OID 16418)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 3567 (class 2606 OID 16479)
-- Name: employee unique_personal_number; Type: CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.employee
    ADD CONSTRAINT unique_personal_number UNIQUE (personal_number) INCLUDE (personal_number);


--
-- TOC entry 3590 (class 2620 OID 16581)
-- Name: order_list check_if_leftovers_enough_before_insert; Type: TRIGGER; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TRIGGER check_if_leftovers_enough_before_insert BEFORE INSERT ON wholesale_base.order_list FOR EACH ROW EXECUTE FUNCTION wholesale_base.check_if_leftovers_enough();


--
-- TOC entry 3591 (class 2620 OID 16583)
-- Name: order_list subtract_count_from_leftovers; Type: TRIGGER; Schema: wholesale_base; Owner: pg_database_owner
--

CREATE TRIGGER subtract_count_from_leftovers AFTER INSERT ON wholesale_base.order_list FOR EACH ROW EXECUTE FUNCTION wholesale_base.subtract_from_leftovers();


--
-- TOC entry 3585 (class 2606 OID 16472)
-- Name: order fk_customer; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base."order"
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES wholesale_base.customer(customer_id) NOT VALID;


--
-- TOC entry 3586 (class 2606 OID 16467)
-- Name: order fk_employee; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base."order"
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES wholesale_base.employee(employee_id) NOT VALID;


--
-- TOC entry 3581 (class 2606 OID 16499)
-- Name: purchase fk_employee; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.purchase
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES wholesale_base.employee(employee_id) NOT VALID;


--
-- TOC entry 3584 (class 2606 OID 16480)
-- Name: employee fk_job; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.employee
    ADD CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES wholesale_base.job(job_id) NOT VALID;


--
-- TOC entry 3578 (class 2606 OID 16517)
-- Name: product fk_manufacturer; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.product
    ADD CONSTRAINT fk_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES wholesale_base.manufacturer(manufacturer_id) NOT VALID;


--
-- TOC entry 3583 (class 2606 OID 16486)
-- Name: cash_account fk_order; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.cash_account
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES wholesale_base."order"(order_id) NOT VALID;


--
-- TOC entry 3579 (class 2606 OID 16509)
-- Name: purchase_list fk_product; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.purchase_list
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES wholesale_base.product(product_id) NOT VALID;


--
-- TOC entry 3580 (class 2606 OID 16504)
-- Name: purchase_list fk_purchase; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.purchase_list
    ADD CONSTRAINT fk_purchase FOREIGN KEY (purchase_id) REFERENCES wholesale_base.purchase(purchase_id) NOT VALID;


--
-- TOC entry 3589 (class 2606 OID 16549)
-- Name: cash_account_purchase fk_purchase; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.cash_account_purchase
    ADD CONSTRAINT fk_purchase FOREIGN KEY (purchase_id) REFERENCES wholesale_base.purchase(purchase_id) NOT VALID;


--
-- TOC entry 3582 (class 2606 OID 16494)
-- Name: purchase fk_supplier; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.purchase
    ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES wholesale_base.supplier(supplier_id) NOT VALID;


--
-- TOC entry 3587 (class 2606 OID 16454)
-- Name: order_list order_fkey; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.order_list
    ADD CONSTRAINT order_fkey FOREIGN KEY (order_id) REFERENCES wholesale_base."order"(order_id) NOT VALID;


--
-- TOC entry 3588 (class 2606 OID 16459)
-- Name: order_list purchase_list_fkey; Type: FK CONSTRAINT; Schema: wholesale_base; Owner: pg_database_owner
--

ALTER TABLE ONLY wholesale_base.order_list
    ADD CONSTRAINT purchase_list_fkey FOREIGN KEY (purchase_list_id) REFERENCES wholesale_base.purchase_list(purchase_list_id) NOT VALID;


-- Completed on 2023-11-23 01:56:23 MSK

--
-- PostgreSQL database dump complete
--

