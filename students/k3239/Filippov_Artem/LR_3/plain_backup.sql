--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-10-23 02:59:14 MSK

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
-- TOC entry 3457 (class 1262 OID 16388)
-- Name: itmo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE itmo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16489)
-- Name: carriage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carriage (
    id bigint NOT NULL,
    ready_status integer NOT NULL,
    number integer NOT NULL,
    schedule_id bigint NOT NULL,
    carriage_type_id bigint NOT NULL
);


ALTER TABLE public.carriage OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16488)
-- Name: carriage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.carriage ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.carriage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16406)
-- Name: carriage_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carriage_type (
    id bigint NOT NULL,
    name character varying NOT NULL,
    place_count smallint NOT NULL,
    CONSTRAINT "unsigned count" CHECK ((place_count > 0))
);


ALTER TABLE public.carriage_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16405)
-- Name: carrier_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.carriage_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.carrier_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16462)
-- Name: cashbox; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cashbox (
    id bigint NOT NULL,
    address character varying(255) NOT NULL,
    station_id bigint NOT NULL
);


ALTER TABLE public.cashbox OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16461)
-- Name: cashbox_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cashbox ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cashbox_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16397)
-- Name: passenger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passenger (
    id bigint NOT NULL,
    fio character varying(255) NOT NULL,
    birth_place character varying(255),
    passport bigint NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE public.passenger OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16395)
-- Name: passenger_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.passenger ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.passenger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16396)
-- Name: passenger_passport_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passenger_passport_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passenger_passport_seq OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 215
-- Name: passenger_passport_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passenger_passport_seq OWNED BY public.passenger.passport;


--
-- TOC entry 223 (class 1259 OID 16432)
-- Name: route; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route (
    id bigint NOT NULL,
    train_name character varying(255) NOT NULL,
    train_type character varying(255) NOT NULL,
    route_point_departure_id bigint,
    route_point_arrival_id bigint
);


ALTER TABLE public.route OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16422)
-- Name: route_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route_point (
    id bigint NOT NULL,
    order_id integer NOT NULL,
    departure_time time with time zone,
    arrival_time time with time zone,
    is_exitable boolean NOT NULL,
    route_id bigint NOT NULL,
    station_id bigint NOT NULL
);


ALTER TABLE public.route_point OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16421)
-- Name: route_point_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.route_point ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.route_point_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16473)
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    id bigint NOT NULL,
    planned_departure timestamp with time zone NOT NULL,
    factual_departure timestamp with time zone,
    factual_arrival timestamp with time zone,
    route_id bigint NOT NULL,
    station_departure_id bigint NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16472)
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.schedule ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16504)
-- Name: seat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seat (
    code character varying NOT NULL,
    number integer NOT NULL,
    type smallint NOT NULL,
    carriage_id bigint NOT NULL,
    manufacturer character varying NOT NULL,
    CONSTRAINT seat_number_check CHECK ((number > 0)),
    CONSTRAINT seat_type_check CHECK ((type > 0))
);


ALTER TABLE public.seat OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16415)
-- Name: station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    type smallint NOT NULL,
    CONSTRAINT type_constraint CHECK ((type > 0))
);


ALTER TABLE public.station OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16414)
-- Name: station_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.station_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16519)
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    id bigint NOT NULL,
    price integer NOT NULL,
    passenger_id bigint NOT NULL,
    cashbox_id bigint NOT NULL,
    seat_code character varying(255) NOT NULL,
    is_online boolean NOT NULL,
    pay_status smallint NOT NULL,
    route_point_departure_id bigint NOT NULL,
    route_point_arrival_id bigint NOT NULL,
    CONSTRAINT ticket_pay_status_check CHECK ((pay_status > 0)),
    CONSTRAINT ticket_price_check CHECK ((price > 0))
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16518)
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ticket ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3249 (class 2604 OID 16400)
-- Name: passenger passport; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger ALTER COLUMN passport SET DEFAULT nextval('public.passenger_passport_seq'::regclass);


--
-- TOC entry 3448 (class 0 OID 16489)
-- Dependencies: 229
-- Data for Name: carriage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carriage OVERRIDING SYSTEM VALUE VALUES (3, 1, 1, 1, 1);
INSERT INTO public.carriage OVERRIDING SYSTEM VALUE VALUES (4, 0, 2, 1, 2);
INSERT INTO public.carriage OVERRIDING SYSTEM VALUE VALUES (5, 0, 53, 2, 3);


--
-- TOC entry 3437 (class 0 OID 16406)
-- Dependencies: 218
-- Data for Name: carriage_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carriage_type OVERRIDING SYSTEM VALUE VALUES (1, 'Вагон номер 1', 30);
INSERT INTO public.carriage_type OVERRIDING SYSTEM VALUE VALUES (2, 'Вагон номер 2', 28);
INSERT INTO public.carriage_type OVERRIDING SYSTEM VALUE VALUES (3, 'Вагон номер 3', 28);
INSERT INTO public.carriage_type OVERRIDING SYSTEM VALUE VALUES (4, 'Вагон номер 4', 50);
INSERT INTO public.carriage_type OVERRIDING SYSTEM VALUE VALUES (5, 'Вагон номер 5', 16);


--
-- TOC entry 3444 (class 0 OID 16462)
-- Dependencies: 225
-- Data for Name: cashbox; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cashbox OVERRIDING SYSTEM VALUE VALUES (1, 'Загородный Проспект 52', 3);
INSERT INTO public.cashbox OVERRIDING SYSTEM VALUE VALUES (2, 'Привокзальная площадь 3', 16);


--
-- TOC entry 3435 (class 0 OID 16397)
-- Dependencies: 216
-- Data for Name: passenger; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.passenger OVERRIDING SYSTEM VALUE VALUES (1, 'Филиппов Артем Эдуардович', 'Якутск', 34325678, '2004-05-30');
INSERT INTO public.passenger OVERRIDING SYSTEM VALUE VALUES (2, 'Войтенко Игорь Александрович', 'Шахтерск', 87659327, '1993-02-26');


--
-- TOC entry 3442 (class 0 OID 16432)
-- Dependencies: 223
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.route VALUES (1, 'Аллегро', 'Скоростной', NULL, NULL);


--
-- TOC entry 3441 (class 0 OID 16422)
-- Dependencies: 222
-- Data for Name: route_point; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (1, 1, '20:13:00+03', NULL, false, 1, 3);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (2, 2, '22:58:00+03', '22:54:00+03', true, 1, 4);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (3, 3, '23:14:00+03', '23:12:00+03', true, 1, 5);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (4, 4, '00:09:00+03', '23:47:00+03', true, 1, 6);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (5, 4, '00:40:00+03', '00:38:00+03', true, 1, 7);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (6, 6, '03:45:00+03', '03:16:00+03', true, 1, 8);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (7, 7, '04:30:00+03', '04:28:00+03', true, 1, 9);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (8, 8, '06:05:00+03', '05:49:00+03', true, 1, 10);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (9, 9, '07:45:00+03', '07:21:00+03', true, 1, 11);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (10, 10, '08:15:00+03', '08:13:00+03', true, 1, 12);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (11, 11, '08:48:00+03', '08:46:00+03', true, 1, 13);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (12, 11, '09:21:00+03', '09:19:00+03', true, 1, 14);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (13, 12, '09:37:00+03', '09:35:00+03', true, 1, 15);
INSERT INTO public.route_point OVERRIDING SYSTEM VALUE VALUES (14, 14, NULL, '10:20:00+03', true, 1, 16);


--
-- TOC entry 3446 (class 0 OID 16473)
-- Dependencies: 227
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (1, '2023-10-24 20:13:00+03', NULL, NULL, 1, 3);
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (2, '2023-10-25 20:13:00+03', NULL, NULL, 1, 3);
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (3, '2023-10-26 20:13:00+03', NULL, NULL, 1, 3);


--
-- TOC entry 3449 (class 0 OID 16504)
-- Dependencies: 230
-- Data for Name: seat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.seat VALUES ('05A-1', 5, 2, 3, 'Alstom');
INSERT INTO public.seat VALUES ('03B-1', 4, 2, 3, 'Alstom');
INSERT INTO public.seat VALUES ('03A-1', 3, 1, 3, 'Alstom');
INSERT INTO public.seat VALUES ('058-2', 10, 1, 4, 'VR Group');


--
-- TOC entry 3439 (class 0 OID 16415)
-- Dependencies: 220
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (3, 'Санкт-Петербург-Витеб.', 1);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (4, 'Уторгош', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (5, 'Сольцы', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (6, 'Дно', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (7, 'Дедовичи', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (8, 'Новосокольники', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (9, 'Невель-2', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (10, 'Витебск', 1);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (11, 'Орша-Центральная', 1);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (12, 'Толочин', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (13, 'Крупки', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (14, 'Борисов', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (15, 'Жодино', 2);
INSERT INTO public.station OVERRIDING SYSTEM VALUE VALUES (16, 'Минск-Пасс.', 1);


--
-- TOC entry 3451 (class 0 OID 16519)
-- Dependencies: 232
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ticket OVERRIDING SYSTEM VALUE VALUES (2, 5670, 1, 1, '05A-1', true, 1, 1, 14);
INSERT INTO public.ticket OVERRIDING SYSTEM VALUE VALUES (3, 5800, 2, 1, '03B-1', false, 1, 1, 14);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 228
-- Name: carriage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carriage_id_seq', 5, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 217
-- Name: carrier_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrier_type_id_seq', 5, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 224
-- Name: cashbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cashbox_id_seq', 2, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 214
-- Name: passenger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passenger_id_seq', 2, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 215
-- Name: passenger_passport_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passenger_passport_seq', 1, false);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 221
-- Name: route_point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.route_point_id_seq', 14, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 226
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedule_id_seq', 3, true);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 219
-- Name: station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_id_seq', 16, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 231
-- Name: ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_id_seq', 3, true);


--
-- TOC entry 3271 (class 2606 OID 16493)
-- Name: carriage carriage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriage
    ADD CONSTRAINT carriage_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 16413)
-- Name: carriage_type carrier_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriage_type
    ADD CONSTRAINT carrier_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 16466)
-- Name: cashbox cashbox_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cashbox
    ADD CONSTRAINT cashbox_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 16404)
-- Name: passenger passenger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 16450)
-- Name: route route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 16426)
-- Name: route_point route_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_point
    ADD CONSTRAINT route_point_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 16477)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 16512)
-- Name: seat seat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_pkey PRIMARY KEY (code);


--
-- TOC entry 3261 (class 2606 OID 16420)
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 16525)
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 16499)
-- Name: carriage carriage_carriage_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriage
    ADD CONSTRAINT carriage_carriage_type_id_fkey FOREIGN KEY (carriage_type_id) REFERENCES public.carriage_type(id) ON UPDATE RESTRICT ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3284 (class 2606 OID 16494)
-- Name: carriage carriage_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriage
    ADD CONSTRAINT carriage_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedule(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3280 (class 2606 OID 16467)
-- Name: cashbox cashbox_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cashbox
    ADD CONSTRAINT cashbox_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.station(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3276 (class 2606 OID 16456)
-- Name: route_point route_point_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_point
    ADD CONSTRAINT route_point_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.route(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3277 (class 2606 OID 16427)
-- Name: route_point route_point_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_point
    ADD CONSTRAINT route_point_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.station(id) ON UPDATE RESTRICT ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3278 (class 2606 OID 16451)
-- Name: route route_route_point_arrival_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_route_point_arrival_id_fkey FOREIGN KEY (route_point_arrival_id) REFERENCES public.route_point(id) ON UPDATE SET NULL ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3279 (class 2606 OID 16439)
-- Name: route route_route_point_departure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_route_point_departure_id_fkey FOREIGN KEY (route_point_departure_id) REFERENCES public.route_point(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3281 (class 2606 OID 16478)
-- Name: schedule schedule_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.route(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3282 (class 2606 OID 16483)
-- Name: schedule schedule_station_departure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_station_departure_id_fkey FOREIGN KEY (station_departure_id) REFERENCES public.station(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3285 (class 2606 OID 16513)
-- Name: seat seat_carriage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_carriage_id_fkey FOREIGN KEY (carriage_id) REFERENCES public.carriage(id) ON UPDATE RESTRICT ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3286 (class 2606 OID 16531)
-- Name: ticket ticket_cashbox_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_cashbox_id_fkey FOREIGN KEY (cashbox_id) REFERENCES public.cashbox(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3287 (class 2606 OID 16526)
-- Name: ticket ticket_passenger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES public.passenger(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3288 (class 2606 OID 16546)
-- Name: ticket ticket_route_point_arrival_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_route_point_arrival_id_fkey FOREIGN KEY (route_point_arrival_id) REFERENCES public.route_point(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3289 (class 2606 OID 16541)
-- Name: ticket ticket_route_point_departure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_route_point_departure_id_fkey FOREIGN KEY (route_point_departure_id) REFERENCES public.route_point(id) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3290 (class 2606 OID 16536)
-- Name: ticket ticket_seat_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_seat_code_fkey FOREIGN KEY (seat_code) REFERENCES public.seat(code) ON UPDATE SET NULL ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2023-10-23 02:59:14 MSK

--
-- PostgreSQL database dump complete
--

