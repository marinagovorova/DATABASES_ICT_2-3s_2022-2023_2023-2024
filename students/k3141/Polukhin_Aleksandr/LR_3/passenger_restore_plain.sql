--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-03 16:04:29

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
-- TOC entry 6 (class 2615 OID 16873)
-- Name: passenger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA passenger;


ALTER SCHEMA passenger OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16874)
-- Name: carriages; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.carriages (
    carriage_id bigint NOT NULL,
    carriage_directory_id bigint NOT NULL,
    carriage_serial_number bigint NOT NULL,
    CONSTRAINT carriage_serial_number_0_check CHECK ((carriage_serial_number > 0))
);


ALTER TABLE passenger.carriages OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16878)
-- Name: carriages_directory; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.carriages_directory (
    carriage_directory_id bigint NOT NULL,
    services character varying(40) NOT NULL,
    vendor character varying(40),
    number_of_seats bigint NOT NULL,
    name_carriage_type character varying(40),
    CONSTRAINT number_of_seats_0_check CHECK ((number_of_seats > 0))
);


ALTER TABLE passenger.carriages_directory OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16882)
-- Name: offices; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.offices (
    offices_id bigint NOT NULL,
    offices_address character varying(100) NOT NULL
);


ALTER TABLE passenger.offices OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16885)
-- Name: passengers; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.passengers (
    passenger_id bigint NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    middle_name character varying(40) NOT NULL,
    document_serial bigint NOT NULL,
    document_number bigint NOT NULL,
    document_date date,
    document_organisation character varying(40),
    CONSTRAINT document_number_check CHECK ((document_number > 0)),
    CONSTRAINT document_serial_check CHECK ((document_serial > 0))
);


ALTER TABLE passenger.passengers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16890)
-- Name: seats; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.seats (
    seat_id bigint NOT NULL,
    seat_number bigint NOT NULL,
    price money NOT NULL,
    seat_type character varying(40) NOT NULL,
    tier integer NOT NULL,
    floor integer NOT NULL,
    trip_id bigint,
    CONSTRAINT seat_number_0_check CHECK ((seat_number > 0))
);


ALTER TABLE passenger.seats OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16894)
-- Name: stations; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.stations (
    station_id bigint NOT NULL,
    station_number bigint NOT NULL,
    stop_duration bigint NOT NULL,
    train_id bigint NOT NULL,
    stations_directory_id bigint NOT NULL
);


ALTER TABLE passenger.stations OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16897)
-- Name: stations_directory; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.stations_directory (
    station_address character varying(100) NOT NULL,
    station_name character varying(40) NOT NULL,
    station_directory_id_fk bigint NOT NULL
);


ALTER TABLE passenger.stations_directory OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16900)
-- Name: tickets; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.tickets (
    carriage_number bigint NOT NULL,
    seat_number bigint NOT NULL,
    ticket_id bigint NOT NULL,
    passenger_id bigint NOT NULL,
    departure_city character varying(40) NOT NULL,
    offices_id bigint NOT NULL,
    departure_time time with time zone NOT NULL,
    arrival_time time with time zone NOT NULL,
    buying_format character varying(10) NOT NULL,
    arrival_city character varying(40) NOT NULL
);


ALTER TABLE passenger.tickets OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16903)
-- Name: timetable; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.timetable (
    timetable_id bigint NOT NULL,
    train_id bigint NOT NULL,
    status character varying(40) NOT NULL,
    departure_time time with time zone NOT NULL,
    arrival_time time with time zone NOT NULL,
    trip_id bigint,
    CONSTRAINT status_check CHECK (((status)::text = ANY (ARRAY[('scheduled'::character varying)::text, ('canceled'::character varying)::text, ('departured'::character varying)::text])))
);


ALTER TABLE passenger.timetable OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16907)
-- Name: trains; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.trains (
    train_type character varying(40) NOT NULL,
    train_name character varying(40) NOT NULL,
    departure_time time with time zone NOT NULL,
    arrival_time time with time zone NOT NULL,
    train_id bigint NOT NULL,
    train_number bigint NOT NULL,
    since_date date,
    until_date date,
    CONSTRAINT departure_time_and_arrival_time_check CHECK ((departure_time < arrival_time)),
    CONSTRAINT train_number_0_check CHECK ((train_number > 0)),
    CONSTRAINT train_type_check CHECK (((train_type)::text = ANY (ARRAY[('suburban'::character varying)::text, ('high_speed'::character varying)::text, ('long_distance'::character varying)::text])))
);


ALTER TABLE passenger.trains OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16913)
-- Name: trips; Type: TABLE; Schema: passenger; Owner: postgres
--

CREATE TABLE passenger.trips (
    trip_id bigint NOT NULL,
    carriage_id bigint NOT NULL
);


ALTER TABLE passenger.trips OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 16874)
-- Dependencies: 216
-- Data for Name: carriages; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.carriages (carriage_id, carriage_directory_id, carriage_serial_number) FROM stdin;
0	0	1
1	1	2
2	2	3
3	3	4
4	4	5
\.


--
-- TOC entry 4923 (class 0 OID 16878)
-- Dependencies: 217
-- Data for Name: carriages_directory; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.carriages_directory (carriage_directory_id, services, vendor, number_of_seats, name_carriage_type) FROM stdin;
2	eat	tavria	3	buisness_class
0	eat, drink	rzd	1	econom_class
1	drink	tavria	2	econom_class
3	drink	rzd	4	buisness_class
4	-	tavria	5	seat
5	drink	tavria	6	seat
6	-	rzd	7	econom_class
\.


--
-- TOC entry 4924 (class 0 OID 16882)
-- Dependencies: 218
-- Data for Name: offices; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.offices (offices_id, offices_address) FROM stdin;
0	Moscow
1	Saint-P.
2	Voronezh
3	Sochi
4	Smolensk
\.


--
-- TOC entry 4925 (class 0 OID 16885)
-- Dependencies: 219
-- Data for Name: passengers; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.passengers (passenger_id, name, surname, middle_name, document_serial, document_number, document_date, document_organisation) FROM stdin;
0	Aleksandr	Polukhin	Vladimirovich	2018	123456	2018-04-12	MVD
1	Aleksandr	Aleksandrov	Aleksandrovich	2009	543612	2009-12-23	MVD
2	Ivan	Ivanov	Ivanovich	2018	123456	2018-04-12	MVD
3	Elena	Petrova	Vladimirovna	2020	789012	2020-08-25	PassportOffice
\.


--
-- TOC entry 4926 (class 0 OID 16890)
-- Dependencies: 220
-- Data for Name: seats; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.seats (seat_id, seat_number, price, seat_type, tier, floor, trip_id) FROM stdin;
0	23	2 134,00 ?	seat	1	1	3
1	21	5 124,00 ?	plazkart	1	2	0
2	19	4 123,00 ?	compartment	2	1	1
3	45	4 312,00 ?	compartment	2	2	2
\.


--
-- TOC entry 4927 (class 0 OID 16894)
-- Dependencies: 221
-- Data for Name: stations; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.stations (station_id, station_number, stop_duration, train_id, stations_directory_id) FROM stdin;
0	1	23	0	1
1	32	12	1	0
2	456	2	2	2
4	1328	21	3	3
\.


--
-- TOC entry 4928 (class 0 OID 16897)
-- Dependencies: 222
-- Data for Name: stations_directory; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.stations_directory (station_address, station_name, station_directory_id_fk) FROM stdin;
Moscow, Saint-P. street, 24	Leningradskiy vokzal	0
Saint-P., Ligovskiy prospect, 32	Moscowskiy vokzal	1
Voronezh, Chernyahovskogo street, 1	Voronezh-1	2
Volgograd, Volgogradskay street, 25	Volgograd-1	3
\.


--
-- TOC entry 4929 (class 0 OID 16900)
-- Dependencies: 223
-- Data for Name: tickets; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.tickets (carriage_number, seat_number, ticket_id, passenger_id, departure_city, offices_id, departure_time, arrival_time, buying_format, arrival_city) FROM stdin;
0	1	0	0	Saint-P.	0	11:43:00+03	18:43:00+03	online	Moscow
1	3	1	1	Volgograd	3	05:32:00+03	22:54:00+03	ofline	Moscow
2	2	2	2	Voronezh	2	10:32:00+03	23:15:00+03	ofline	Saint-P.
3	2	3	3	Moscow	3	23:43:00+03	10:32:00+03	online	Saint-P.
\.


--
-- TOC entry 4930 (class 0 OID 16903)
-- Dependencies: 224
-- Data for Name: timetable; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.timetable (timetable_id, train_id, status, departure_time, arrival_time, trip_id) FROM stdin;
0	0	canceled	11:43:00+03	19:23:00+03	0
1	1	scheduled	05:43:00+03	11:56:00+03	1
2	3	departured	11:24:00+03	22:31:00+03	2
\.


--
-- TOC entry 4931 (class 0 OID 16907)
-- Dependencies: 225
-- Data for Name: trains; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.trains (train_type, train_name, departure_time, arrival_time, train_id, train_number, since_date, until_date) FROM stdin;
high_speed	sapsan	12:30:00+03	17:30:00+03	0	7	2023-01-01	2023-03-01
long_distance	standart	11:43:00+03	23:31:00+03	1	214	2023-01-01	2023-09-01
suburban	standart	09:35:00+03	19:42:00+03	2	104	2023-06-01	2023-09-01
high_speed	lastochka	05:45:00+03	11:43:00+03	3	8	2023-06-01	2023-12-01
suburban	standart	08:23:00+03	17:54:00+03	4	554	2023-01-01	2023-12-01
\.


--
-- TOC entry 4932 (class 0 OID 16913)
-- Dependencies: 226
-- Data for Name: trips; Type: TABLE DATA; Schema: passenger; Owner: postgres
--

COPY passenger.trips (trip_id, carriage_id) FROM stdin;
1	2
0	1
2	0
3	3
\.


--
-- TOC entry 4733 (class 2606 OID 16916)
-- Name: tickets buying_format_ckeck; Type: CHECK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE passenger.tickets
    ADD CONSTRAINT buying_format_ckeck CHECK (((buying_format)::text = ANY (ARRAY[('online'::character varying)::text, ('ofline'::character varying)::text]))) NOT VALID;


--
-- TOC entry 4739 (class 2606 OID 16918)
-- Name: carriages carriages_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.carriages
    ADD CONSTRAINT carriages_pkey PRIMARY KEY (carriage_id);


--
-- TOC entry 4742 (class 2606 OID 16920)
-- Name: carriages_directory carriages_types_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.carriages_directory
    ADD CONSTRAINT carriages_types_pkey PRIMARY KEY (carriage_directory_id);


--
-- TOC entry 4744 (class 2606 OID 16922)
-- Name: offices cash_registers_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.offices
    ADD CONSTRAINT cash_registers_pkey PRIMARY KEY (offices_id);


--
-- TOC entry 4746 (class 2606 OID 16924)
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passenger_id);


--
-- TOC entry 4748 (class 2606 OID 16926)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);


--
-- TOC entry 4754 (class 2606 OID 16928)
-- Name: stations_directory station_directory_id_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.stations_directory
    ADD CONSTRAINT station_directory_id_pkey PRIMARY KEY (station_directory_id_fk);


--
-- TOC entry 4752 (class 2606 OID 16930)
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);


--
-- TOC entry 4759 (class 2606 OID 16932)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 4761 (class 2606 OID 16934)
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (timetable_id);


--
-- TOC entry 4763 (class 2606 OID 16936)
-- Name: trains train_number; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.trains
    ADD CONSTRAINT train_number UNIQUE (train_number);


--
-- TOC entry 4765 (class 2606 OID 16938)
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (train_id);


--
-- TOC entry 4767 (class 2606 OID 16940)
-- Name: trips trip_id_pkey; Type: CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.trips
    ADD CONSTRAINT trip_id_pkey PRIMARY KEY (trip_id);


--
-- TOC entry 4740 (class 1259 OID 16941)
-- Name: fki_carriage_directory_id_fk; Type: INDEX; Schema: passenger; Owner: postgres
--

CREATE INDEX fki_carriage_directory_id_fk ON passenger.carriages USING btree (carriage_directory_id) WITH (deduplicate_items='false');


--
-- TOC entry 4755 (class 1259 OID 16942)
-- Name: fki_office_id_fk; Type: INDEX; Schema: passenger; Owner: postgres
--

CREATE INDEX fki_office_id_fk ON passenger.tickets USING btree (offices_id) WITH (deduplicate_items='false');


--
-- TOC entry 4756 (class 1259 OID 16943)
-- Name: fki_pessenger_id_fk; Type: INDEX; Schema: passenger; Owner: postgres
--

CREATE INDEX fki_pessenger_id_fk ON passenger.tickets USING btree (passenger_id) WITH (deduplicate_items='false');


--
-- TOC entry 4757 (class 1259 OID 16944)
-- Name: fki_seat_id_fk; Type: INDEX; Schema: passenger; Owner: postgres
--

CREATE INDEX fki_seat_id_fk ON passenger.tickets USING btree (seat_number) WITH (deduplicate_items='false');


--
-- TOC entry 4749 (class 1259 OID 16945)
-- Name: fki_station_id_fk; Type: INDEX; Schema: passenger; Owner: postgres
--

CREATE INDEX fki_station_id_fk ON passenger.stations USING btree (station_id) WITH (deduplicate_items='false');


--
-- TOC entry 4750 (class 1259 OID 16946)
-- Name: fki_train_id_fk; Type: INDEX; Schema: passenger; Owner: postgres
--

CREATE INDEX fki_train_id_fk ON passenger.stations USING btree (train_id) WITH (deduplicate_items='false');


--
-- TOC entry 4768 (class 2606 OID 16947)
-- Name: carriages carriage_directory_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.carriages
    ADD CONSTRAINT carriage_directory_id_fk FOREIGN KEY (carriage_directory_id) REFERENCES passenger.carriages_directory(carriage_directory_id);


--
-- TOC entry 4777 (class 2606 OID 16952)
-- Name: trips carriage_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.trips
    ADD CONSTRAINT carriage_id_fk FOREIGN KEY (carriage_id) REFERENCES passenger.carriages(carriage_id);


--
-- TOC entry 4772 (class 2606 OID 16957)
-- Name: tickets offices_register_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.tickets
    ADD CONSTRAINT offices_register_id_fk FOREIGN KEY (offices_id) REFERENCES passenger.offices(offices_id) NOT VALID;


--
-- TOC entry 4773 (class 2606 OID 16962)
-- Name: tickets passenger_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.tickets
    ADD CONSTRAINT passenger_id_fk FOREIGN KEY (passenger_id) REFERENCES passenger.passengers(passenger_id);


--
-- TOC entry 4774 (class 2606 OID 16967)
-- Name: tickets seat_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.tickets
    ADD CONSTRAINT seat_id_fk FOREIGN KEY (seat_number) REFERENCES passenger.seats(seat_id);


--
-- TOC entry 4770 (class 2606 OID 16972)
-- Name: stations station_directory_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.stations
    ADD CONSTRAINT station_directory_id_fk FOREIGN KEY (stations_directory_id) REFERENCES passenger.stations_directory(station_directory_id_fk);


--
-- TOC entry 4775 (class 2606 OID 16977)
-- Name: timetable train_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.timetable
    ADD CONSTRAINT train_id_fk FOREIGN KEY (train_id) REFERENCES passenger.trains(train_id);


--
-- TOC entry 4771 (class 2606 OID 16982)
-- Name: stations train_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.stations
    ADD CONSTRAINT train_id_fk FOREIGN KEY (train_id) REFERENCES passenger.trains(train_id);


--
-- TOC entry 4769 (class 2606 OID 16987)
-- Name: seats trip_id_fk; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.seats
    ADD CONSTRAINT trip_id_fk FOREIGN KEY (trip_id) REFERENCES passenger.trips(trip_id);


--
-- TOC entry 4776 (class 2606 OID 16992)
-- Name: timetable trip_id_fkey; Type: FK CONSTRAINT; Schema: passenger; Owner: postgres
--

ALTER TABLE ONLY passenger.timetable
    ADD CONSTRAINT trip_id_fkey FOREIGN KEY (trip_id) REFERENCES passenger.trips(trip_id) NOT VALID;


--
-- TOC entry 4921 (class 0 OID 16890)
-- Dependencies: 220
-- Name: seats; Type: ROW SECURITY; Schema: passenger; Owner: postgres
--

ALTER TABLE passenger.seats ENABLE ROW LEVEL SECURITY;

-- Completed on 2023-12-03 16:04:29

--
-- PostgreSQL database dump complete
--

