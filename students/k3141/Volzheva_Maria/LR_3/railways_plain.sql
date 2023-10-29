--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 14.9

-- Started on 2023-10-29 12:27:49

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
-- TOC entry 10 (class 2615 OID 16558)
-- Name: railways; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA railways;


ALTER SCHEMA railways OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 16574)
-- Name: carriages; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.carriages (
    carriage_id bigint NOT NULL,
    carriage_type_id bigint NOT NULL,
    carriage_serial_number bigint NOT NULL,
    CONSTRAINT carriage_number_0_check CHECK ((carriage_serial_number > 0))
);


ALTER TABLE railways.carriages OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16579)
-- Name: carriages_types; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.carriages_types (
    carriage_type_id bigint NOT NULL,
    name_carriage_type character varying(40) NOT NULL,
    number_of_seats bigint NOT NULL,
    discription text,
    manufacturer character varying(40),
    CONSTRAINT name_carriage_type_check CHECK (((name_carriage_type)::text = ANY ((ARRAY['seat'::character varying, 'econom_class'::character varying, 'first_class'::character varying, 'business_class'::character varying])::text[]))),
    CONSTRAINT number_of_seats_0_check CHECK ((number_of_seats > 0))
);


ALTER TABLE railways.carriages_types OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16607)
-- Name: cash_registers; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.cash_registers (
    cash_register_id bigint NOT NULL,
    adress character varying(100) NOT NULL
);


ALTER TABLE railways.cash_registers OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16597)
-- Name: passengers; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.passengers (
    passenger_id bigint NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    middle_name character varying(40) NOT NULL,
    document_serial bigint NOT NULL,
    document_number bigint NOT NULL,
    issue_date date,
    issuer character varying(40),
    CONSTRAINT document_number_check CHECK ((document_number > 0)),
    CONSTRAINT document_serial_check CHECK ((document_serial > 0))
);


ALTER TABLE railways.passengers OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16758)
-- Name: scheduled_train_carriages; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.scheduled_train_carriages (
    scheduled_train_carriage_id bigint NOT NULL,
    carriage_id bigint NOT NULL,
    scheduled_train_id bigint NOT NULL,
    carriage_order_number bigint NOT NULL
);


ALTER TABLE railways.scheduled_train_carriages OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16559)
-- Name: scheduled_trains; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.scheduled_trains (
    scheduled_train_id bigint NOT NULL
);


ALTER TABLE railways.scheduled_trains OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16569)
-- Name: seats; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.seats (
    seat_id bigint NOT NULL,
    seat_number bigint NOT NULL,
    is_empty boolean DEFAULT true NOT NULL,
    price money NOT NULL,
    scheduled_train_carriage_id bigint,
    CONSTRAINT seat_number_0_check CHECK ((seat_number > 0))
);


ALTER TABLE railways.seats OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16564)
-- Name: stations; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.stations (
    station_id bigint NOT NULL,
    station_name character varying(40) NOT NULL,
    station_type character varying(40) NOT NULL
);


ALTER TABLE railways.stations OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16602)
-- Name: tickets; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.tickets (
    ticket_id bigint NOT NULL,
    passenger_id bigint NOT NULL,
    cash_register_id bigint NOT NULL,
    departure_station_id bigint NOT NULL,
    arrival_station_id bigint NOT NULL,
    status character varying(40) NOT NULL,
    buying_time timestamp without time zone NOT NULL,
    seat bigint NOT NULL,
    way_of_paying character varying(10) NOT NULL,
    CONSTRAINT ticket_status_check CHECK (((status)::text = ANY ((ARRAY['reserved'::character varying, 'returned'::character varying, 'sold'::character varying])::text[])))
);


ALTER TABLE railways.tickets OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16612)
-- Name: timetable; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.timetable (
    timetable_id bigint NOT NULL,
    train_id bigint NOT NULL,
    status character varying(40) NOT NULL,
    departure_time timestamp without time zone NOT NULL,
    arrival_time timestamp without time zone NOT NULL,
    scheduled_train_id bigint
);


ALTER TABLE railways.timetable OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16587)
-- Name: train_stations; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.train_stations (
    train_station_id bigint NOT NULL,
    train_id bigint NOT NULL,
    station_id bigint NOT NULL,
    departure_offset interval NOT NULL,
    arrival_offset interval NOT NULL,
    CONSTRAINT departure_offset_arrival_offset_check CHECK ((departure_offset >= arrival_offset))
);


ALTER TABLE railways.train_stations OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16592)
-- Name: trains; Type: TABLE; Schema: railways; Owner: postgres
--

CREATE TABLE railways.trains (
    train_id bigint NOT NULL,
    train_number bigint NOT NULL,
    train_name character varying(40) NOT NULL,
    train_type character varying(40) NOT NULL,
    monday_departure boolean,
    tuesday_departure boolean,
    wendesday_departure boolean,
    thursday_departure boolean,
    friday_departure boolean,
    saturday_departure boolean,
    sunday_departure boolean,
    since_date date NOT NULL,
    until_date date NOT NULL,
    CONSTRAINT since_date_and_until_date_check CHECK ((since_date < until_date)),
    CONSTRAINT train_number_0_check CHECK ((train_number > 0)),
    CONSTRAINT train_type_check CHECK (((train_type)::text = ANY ((ARRAY['suburban'::character varying, 'high_speed'::character varying, 'long_distance'::character varying])::text[])))
);


ALTER TABLE railways.trains OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 16574)
-- Dependencies: 233
-- Data for Name: carriages; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.carriages (carriage_id, carriage_type_id, carriage_serial_number) FROM stdin;
0	5	1
1	5	2
2	5	3
3	4	4
4	4	5
5	3	1001
6	3	1002
7	3	1003
8	0	1004
9	0	1005
10	1	1006
11	1	1007
12	2	1008
13	4	6
14	4	7
\.


--
-- TOC entry 3451 (class 0 OID 16579)
-- Dependencies: 234
-- Data for Name: carriages_types; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.carriages_types (carriage_type_id, name_carriage_type, number_of_seats, discription, manufacturer) FROM stdin;
0	econom_class	20	\N	a
1	first_class	18	\N	a
2	business_class	16	\N	a
3	seat	40	\N	b
4	seat	40	\N	b
5	seat	40	\N	b
\.


--
-- TOC entry 3456 (class 0 OID 16607)
-- Dependencies: 239
-- Data for Name: cash_registers; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.cash_registers (cash_register_id, adress) FROM stdin;
0	Adler\n
1	Spb
4	Sochi
3	Kazan
2	Moscow
5	online
\.


--
-- TOC entry 3454 (class 0 OID 16597)
-- Dependencies: 237
-- Data for Name: passengers; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.passengers (passenger_id, name, surname, middle_name, document_serial, document_number, issue_date, issuer) FROM stdin;
0	Mariia	Volzheva	Ilinichna	4018	1	2020-05-05	MVD
1	Tamara	Ushnichkova	Andreevna	4022	1	2023-01-26	MVD
2	Aleksandra	Kulikova	Vladimirovna	4019	2	2021-09-09	MVD
3	Viktoria	Dranko	Nikolaevna	4019	3	2020-08-09	MVD\n
4	Mariia	Koturanova	Sergeevna	4019	4	2020-08-09	MVD
5	Karina	Krasuk	Aleksandrovna	4018	5	2020-02-02	MVD
6	Rudolf	Pupkin	Tagirivich	1111	111111	1111-11-11	DVD
\.


--
-- TOC entry 3458 (class 0 OID 16758)
-- Dependencies: 241
-- Data for Name: scheduled_train_carriages; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.scheduled_train_carriages (scheduled_train_carriage_id, carriage_id, scheduled_train_id, carriage_order_number) FROM stdin;
0	14	0	1
1	13	1	1
2	4	2	1
3	3	3	1
4	2	4	1
5	1	5	1
6	0	6	1
7	5	7	1
8	6	8	1
9	7	9	1
10	8	10	1
11	9	11	1
12	10	12	1
13	11	13	1
\.


--
-- TOC entry 3447 (class 0 OID 16559)
-- Dependencies: 230
-- Data for Name: scheduled_trains; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.scheduled_trains (scheduled_train_id) FROM stdin;
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
\.


--
-- TOC entry 3449 (class 0 OID 16569)
-- Dependencies: 232
-- Data for Name: seats; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.seats (seat_id, seat_number, is_empty, price, scheduled_train_carriage_id) FROM stdin;
0	1	f	5 000,00 ?	1
1	2	t	5 000,00 ?	1
2	3	f	5 000,00 ?	1
3	4	t	5 000,00 ?	1
4	5	t	5 000,00 ?	1
5	6	t	5 000,00 ?	1
\.


--
-- TOC entry 3448 (class 0 OID 16564)
-- Dependencies: 231
-- Data for Name: stations; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.stations (station_id, station_name, station_type) FROM stdin;
4	Москва	город
3	Бологое	город
2	Вышний Волочёк	город
1	Тверь	город
0	Санкт-Петербург	город
8	Зеленогорск	посёлок городского типа\n
7	Выборг	город
6	Великий Новгород	город
5	Псков	город
9	Рощино	посёлок городского типа
10	Горьковское	посёлок
\.


--
-- TOC entry 3455 (class 0 OID 16602)
-- Dependencies: 238
-- Data for Name: tickets; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.tickets (ticket_id, passenger_id, cash_register_id, departure_station_id, arrival_station_id, status, buying_time, seat, way_of_paying) FROM stdin;
0	1	5	0	7	sold	2023-10-27 22:27:48.879036	1	online
1	6	5	0	7	sold	2023-10-27 22:27:48.879036	3	online
\.


--
-- TOC entry 3457 (class 0 OID 16612)
-- Dependencies: 240
-- Data for Name: timetable; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.timetable (timetable_id, train_id, status, departure_time, arrival_time, scheduled_train_id) FROM stdin;
1	2	departured	2003-01-08 09:05:06	2003-01-08 13:05:06	\N
0	1	departured	2003-01-08 04:05:06	2003-01-08 08:05:00	\N
2	1	departured	2023-10-30 04:05:06	2003-10-28 08:05:00	\N
3	1	scheduled	2023-10-31 04:05:06	2003-01-29 08:05:00	\N
4	2	scheduled	2023-10-30 09:05:06	2003-10-28 13:05:00	\N
5	2	scheduled	2023-10-31 09:05:06	2023-10-29 13:05:00	\N
6	3	scheduled	2023-10-30 09:05:06	2023-10-30 10:35:06	\N
7	4	scheduled	2023-10-30 11:05:06	2023-10-30 12:35:06	\N
8	5	scheduled	2023-10-30 09:05:06	2023-10-30 12:05:06	\N
9	6	scheduled\n	2023-10-30 12:15:06	2023-10-30 15:15:06	\N
10	7	scheduled	2023-10-31 09:05:06	2023-10-31 12:05:06	\N
11	8	scheduled	2023-10-31 13:05:06	2023-10-31 16:05:06	\N
12	9	scheduled	2023-10-30 04:05:06	2023-10-31 10:05:06	\N
13	10	scheduled	2023-10-31 17:05:06	2023-10-30 23:05:06	\N
\.


--
-- TOC entry 3452 (class 0 OID 16587)
-- Dependencies: 235
-- Data for Name: train_stations; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.train_stations (train_station_id, train_id, station_id, departure_offset, arrival_offset) FROM stdin;
3	1	0	00:00:00	00:00:00
5	2	4	00:00:00	00:00:00
10	3	0	00:00:00	00:00:00
14	4	7	00:00:00	00:00:00
2	1	1	03:02:00	03:00:00
4	1	4	04:01:00	04:00:00
1	1	2	02:02:00	02:00:00
0	1	3	01:02:00	01:00:00
6	2	1	01:02:00	01:00:00
7	2	2	02:02:00	02:00:00
8	2	3	03:02:00	03:00:00
9	2	0	04:02:00	04:00:00
11	3	8	00:25:00	00:24:00
12	3	9	00:35:00	00:34:00
13	3	7	01:30:00	01:30:00
15	4	9	00:25:00	00:24:00
16	4	8	00:35:00	00:34:00
17	4	0	01:30:00	01:30:00
18	5	0	00:00:00	00:00:00
19	5	8	42:00:00	41:00:00
20	5	9	52:00:00	51:00:00
21	5	10	62:00:00	61:00:00
22	5	7	182:00:00	181:00:00
23	6	7	00:00:00	00:00:00
24	6	10	42:00:00	41:00:00
25	6	9	52:00:00	51:00:00
26	6	8	62:00:00	60:00:00
27	6	0	182:00:00	181:00:00
28	7	0	00:00:00	00:00:00
29	7	6	180:00:00	180:00:00
30	8	6	00:00:00	00:00:00
31	8	0	180:00:00	180:00:00
32	9	0	00:00:00	00:00:00
33	9	5	06:00:00	06:00:00
34	10	5	00:00:00	00:00:00
35	10	0	06:00:00	06:00:00
\.


--
-- TOC entry 3453 (class 0 OID 16592)
-- Dependencies: 236
-- Data for Name: trains; Type: TABLE DATA; Schema: railways; Owner: postgres
--

COPY railways.trains (train_id, train_number, train_name, train_type, monday_departure, tuesday_departure, wendesday_departure, thursday_departure, friday_departure, saturday_departure, sunday_departure, since_date, until_date) FROM stdin;
1	1001	Sapsan (Spb - Moscow)	high_speed	t	t	t	t	t	t	t	2000-01-01	2100-01-01
2	1002	Sapsan (Moscow-Spb)	high_speed	t	t	t	t	t	t	t	2000-01-01	2100-01-01
3	1003	Lastochka (Spb-Vyborg)	high_speed	t	\N	t	\N	t	t	t	2000-01-01	2100-01-01
4	1004	Lastochka (Vyborg-Spb)	high_speed	\N	t	\N	t	\N	t	t	2000-01-01	2100-01-01
5	1005	Sbp-Vyborg	suburban	t	t	t	t	t	t	t	2000-01-01	2100-01-01
6	1006	Vyborg-Spb	suburban	t	t	t	t	t	t	t	2000-01-01	2100-01-01
7	1007	Spb-VelikyNovgorod	long_distance	\N	t	t	\N	t	t	t	2000-01-01	2100-01-01
8	1008	VelikyNovgorod-Spb	long_distance	\N	t	t	\N	t	t	t	2000-01-01	2100-01-01
9	1009	Spb-Pskov	long_distance	t	\N	\N	t	\N	t	t	2000-01-01	2100-01-01
10	1010	Pskov-Spb	long_distance	t	\N	\N	t	\N	t	t	2000-01-01	2100-01-01
\.


--
-- TOC entry 3271 (class 2606 OID 16578)
-- Name: carriages carriages_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.carriages
    ADD CONSTRAINT carriages_pkey PRIMARY KEY (carriage_id);


--
-- TOC entry 3274 (class 2606 OID 16585)
-- Name: carriages_types carriages_types_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.carriages_types
    ADD CONSTRAINT carriages_types_pkey PRIMARY KEY (carriage_type_id);


--
-- TOC entry 3291 (class 2606 OID 16611)
-- Name: cash_registers cash_registers_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.cash_registers
    ADD CONSTRAINT cash_registers_pkey PRIMARY KEY (cash_register_id);


--
-- TOC entry 3284 (class 2606 OID 16601)
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passenger_id);


--
-- TOC entry 3295 (class 2606 OID 16762)
-- Name: scheduled_train_carriages scheduled_train_carriages_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.scheduled_train_carriages
    ADD CONSTRAINT scheduled_train_carriages_pkey PRIMARY KEY (scheduled_train_carriage_id);


--
-- TOC entry 3265 (class 2606 OID 16563)
-- Name: scheduled_trains scheduled_train_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.scheduled_trains
    ADD CONSTRAINT scheduled_train_pkey PRIMARY KEY (scheduled_train_id);


--
-- TOC entry 3269 (class 2606 OID 16573)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);


--
-- TOC entry 3267 (class 2606 OID 16568)
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);


--
-- TOC entry 3263 (class 2606 OID 16742)
-- Name: timetable status_check; Type: CHECK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE railways.timetable
    ADD CONSTRAINT status_check CHECK (((status)::text = ANY (ARRAY[('scheduled'::character varying)::text, ('canceled'::character varying)::text, ('departured'::character varying)::text]))) NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 16606)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 3293 (class 2606 OID 16616)
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (timetable_id);


--
-- TOC entry 3280 (class 2606 OID 16699)
-- Name: trains train_number; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.trains
    ADD CONSTRAINT train_number UNIQUE (train_number);


--
-- TOC entry 3278 (class 2606 OID 16591)
-- Name: train_stations train_stations_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.train_stations
    ADD CONSTRAINT train_stations_pkey PRIMARY KEY (train_station_id);


--
-- TOC entry 3282 (class 2606 OID 16596)
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (train_id);


--
-- TOC entry 3262 (class 2606 OID 16741)
-- Name: tickets way_of_paying_ckeck; Type: CHECK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE railways.tickets
    ADD CONSTRAINT way_of_paying_ckeck CHECK (((way_of_paying)::text = ANY ((ARRAY['online'::character varying, 'ofline'::character varying])::text[]))) NOT VALID;


--
-- TOC entry 3272 (class 1259 OID 16622)
-- Name: fki_carriage_type_id_fk; Type: INDEX; Schema: railways; Owner: postgres
--

CREATE INDEX fki_carriage_type_id_fk ON railways.carriages USING btree (carriage_type_id);


--
-- TOC entry 3285 (class 1259 OID 16685)
-- Name: fki_cash_register_id_fk; Type: INDEX; Schema: railways; Owner: postgres
--

CREATE INDEX fki_cash_register_id_fk ON railways.tickets USING btree (cash_register_id);


--
-- TOC entry 3286 (class 1259 OID 16673)
-- Name: fki_passenger_id_fk; Type: INDEX; Schema: railways; Owner: postgres
--

CREATE INDEX fki_passenger_id_fk ON railways.tickets USING btree (passenger_id);


--
-- TOC entry 3287 (class 1259 OID 16679)
-- Name: fki_seat_id_fk; Type: INDEX; Schema: railways; Owner: postgres
--

CREATE INDEX fki_seat_id_fk ON railways.tickets USING btree (seat);


--
-- TOC entry 3275 (class 1259 OID 16651)
-- Name: fki_station_id_fk; Type: INDEX; Schema: railways; Owner: postgres
--

CREATE INDEX fki_station_id_fk ON railways.train_stations USING btree (station_id);


--
-- TOC entry 3276 (class 1259 OID 16645)
-- Name: fki_train_id_fk; Type: INDEX; Schema: railways; Owner: postgres
--

CREATE INDEX fki_train_id_fk ON railways.train_stations USING btree (train_id);


--
-- TOC entry 3305 (class 2606 OID 16763)
-- Name: scheduled_train_carriages carriage_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.scheduled_train_carriages
    ADD CONSTRAINT carriage_id_fk FOREIGN KEY (carriage_id) REFERENCES railways.carriages(carriage_id) NOT VALID;


--
-- TOC entry 3297 (class 2606 OID 16629)
-- Name: carriages carriage_type_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.carriages
    ADD CONSTRAINT carriage_type_id_fk FOREIGN KEY (carriage_type_id) REFERENCES railways.carriages_types(carriage_type_id);


--
-- TOC entry 3302 (class 2606 OID 16680)
-- Name: tickets cash_register_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.tickets
    ADD CONSTRAINT cash_register_id_fk FOREIGN KEY (cash_register_id) REFERENCES railways.cash_registers(cash_register_id);


--
-- TOC entry 3300 (class 2606 OID 16668)
-- Name: tickets passenger_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.tickets
    ADD CONSTRAINT passenger_id_fk FOREIGN KEY (passenger_id) REFERENCES railways.passengers(passenger_id);


--
-- TOC entry 3296 (class 2606 OID 16778)
-- Name: seats scheduled_train_carriage_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.seats
    ADD CONSTRAINT scheduled_train_carriage_id_fk FOREIGN KEY (scheduled_train_carriage_id) REFERENCES railways.scheduled_train_carriages(scheduled_train_carriage_id) NOT VALID;


--
-- TOC entry 3306 (class 2606 OID 16768)
-- Name: scheduled_train_carriages scheduled_train_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.scheduled_train_carriages
    ADD CONSTRAINT scheduled_train_id_fk FOREIGN KEY (scheduled_train_id) REFERENCES railways.scheduled_trains(scheduled_train_id) NOT VALID;


--
-- TOC entry 3304 (class 2606 OID 16773)
-- Name: timetable scheduled_train_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.timetable
    ADD CONSTRAINT scheduled_train_id_fk FOREIGN KEY (scheduled_train_id) REFERENCES railways.scheduled_trains(scheduled_train_id) NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 16674)
-- Name: tickets seat_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.tickets
    ADD CONSTRAINT seat_id_fk FOREIGN KEY (seat) REFERENCES railways.seats(seat_id);


--
-- TOC entry 3299 (class 2606 OID 16646)
-- Name: train_stations station_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.train_stations
    ADD CONSTRAINT station_id_fk FOREIGN KEY (station_id) REFERENCES railways.stations(station_id);


--
-- TOC entry 3298 (class 2606 OID 16640)
-- Name: train_stations train_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.train_stations
    ADD CONSTRAINT train_id_fk FOREIGN KEY (train_id) REFERENCES railways.trains(train_id);


--
-- TOC entry 3303 (class 2606 OID 16657)
-- Name: timetable train_id_fk; Type: FK CONSTRAINT; Schema: railways; Owner: postgres
--

ALTER TABLE ONLY railways.timetable
    ADD CONSTRAINT train_id_fk FOREIGN KEY (train_id) REFERENCES railways.trains(train_id);


--
-- TOC entry 3446 (class 0 OID 16569)
-- Dependencies: 232
-- Name: seats; Type: ROW SECURITY; Schema: railways; Owner: postgres
--

ALTER TABLE railways.seats ENABLE ROW LEVEL SECURITY;

-- Completed on 2023-10-29 12:27:50

--
-- PostgreSQL database dump complete
--

