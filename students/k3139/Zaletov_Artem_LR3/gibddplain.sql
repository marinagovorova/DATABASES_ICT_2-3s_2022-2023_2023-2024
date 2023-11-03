--
-- PostgreSQL database dump
--
-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0
-- Started on 2023-11-03 18:10:38
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
-- TOC entry 220 (class 1259 OID 16433)
-- Name: Car; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Car" (
 "WIN number" character varying(18) NOT NULL,
5
 "Engine number" character varying(18) NOT NULL,
 "ID model" integer NOT NULL
);
ALTER TABLE public."Car" OWNER TO postgres;
--
-- TOC entry 217 (class 1259 OID 16411)
-- Name: Car_model; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Car_model" (
 "Model ID" integer NOT NULL,
 "Label" character varying(40) NOT NULL,
 "Body type" character varying(20) NOT NULL,
 "Year of release" integer NOT NULL,
 "Name" character varying(50) NOT NULL
);
ALTER TABLE public."Car_model" OWNER TO postgres;
--
-- TOC entry 216 (class 1259 OID 16404)
-- Name: Car_owner; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Car_owner" (
 "DL number" integer NOT NULL,
 "Driver_name_surname" character varying(255) NOT NULL,
 "Adress" character varying(255) NOT NULL,
 "Telephone number" character varying(15) NOT NULL,
 "Date of birth" date NOT NULL,
 "Passport" character varying(15)
);
ALTER TABLE public."Car_owner" OWNER TO postgres;
--
-- TOC entry 222 (class 1259 OID 16524)
-- Name: Crash; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Crash" (
 "Crash ID" integer NOT NULL,
 "Service_number" character varying(18) NOT NULL,
 "Crash_date" date NOT NULL,
 "Crah_district" character varying(50) NOT NULL,
 "Crash_street" character varying(50) NOT NULL
);
ALTER TABLE public."Crash" OWNER TO postgres;
--
-- TOC entry 225 (class 1259 OID 16609)
-- Name: Participants status; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Participants status" (
 "Crash_ID" integer NOT NULL,
6
 "PTS number" character varying(20) NOT NULL,
 "Participants status" character varying(50) NOT NULL,
 "Participants_ID" integer NOT NULL
);
ALTER TABLE public."Participants status" OWNER TO postgres;
--
-- TOC entry 219 (class 1259 OID 16421)
-- Name: Police department; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Police department" (
 "Department_ID" integer NOT NULL,
 "Department_adress" character varying NOT NULL
);
ALTER TABLE public."Police department" OWNER TO postgres;
--
-- TOC entry 218 (class 1259 OID 16416)
-- Name: Policemen; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Policemen" (
 "Personal number" character varying(18) NOT NULL,
 "Policeman_name_surname" character varying(255) NOT NULL,
 "Rank" character varying(50) NOT NULL,
 "Department_ID" integer NOT NULL,
 "Passport" character varying(15)
);
ALTER TABLE public."Policemen" OWNER TO postgres;
--
-- TOC entry 224 (class 1259 OID 16565)
-- Name: Registered_car; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Registered_car" (
 "PTS number" character varying(20) NOT NULL,
 "WIN number" character varying(20) NOT NULL,
 "DL number" integer NOT NULL,
 "Car number" character varying(20) NOT NULL,
 "Registration_date" date NOT NULL,
 "Department_ID" integer NOT NULL
);
ALTER TABLE public."Registered_car" OWNER TO postgres;
--
-- TOC entry 221 (class 1259 OID 16443)
-- Name: Rights deprivation; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Rights deprivation" (
 "Procedure_ID" integer NOT NULL,
 "DL number" integer NOT NULL,
 "Loss_date" date NOT NULL,
7
 "Return_date" date NOT NULL
);
ALTER TABLE public."Rights deprivation" OWNER TO postgres;
--
-- TOC entry 223 (class 1259 OID 16539)
-- Name: Violation; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Violation" (
 "Violation_ID" integer NOT NULL,
 "PTS number" character varying(18) NOT NULL,
 "Personal number" character varying(18) NOT NULL,
 "Payment status" character varying(3) NOT NULL,
 "Violation_place" character varying(255) NOT NULL,
 "Violation_date" date NOT NULL,
 "Violation_id" integer NOT NULL
);
ALTER TABLE public."Violation" OWNER TO postgres;
--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: Violation_types; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public."Violation_types" (
 "Violation_ID" integer NOT NULL,
 "Violation_type" character varying(100) NOT NULL,
 "Violation_name" character varying(500) NOT NULL,
 "Penalty" integer,
 "DL_loss_time" integer NOT NULL
);
ALTER TABLE public."Violation_types" OWNER TO postgres;
--
-- TOC entry 4861 (class 0 OID 16433)
-- Dependencies: 220
-- Data for Name: Car; Type: TABLE DATA; Schema: public; Owner: postgres
--
COPY public."Car" ("WIN number", "Engine number", "ID model") FROM stdin;
1FUJA6CV74DM34063 284476A 3
JH4KA4650LC000937 SC36E-1000324 2
JH4KA2640HC004148 028103373N 1
123QWE456 321567Q 1
\.
--
-- TOC entry 4858 (class 0 OID 16411)
-- Dependencies: 217
-- Data for Name: Car_model; Type: TABLE DATA; Schema: public; Owner: postgres
--
COPY public."Car_model" ("Model ID", "Label", "Body type", "Year of release", 
"Name") FROM stdin;
1 BMW Седан 2003 BMW 5 e39
8
2 BMW\n Седан\n 2005 BMW 3 e46
3 Audi\n Хетчбек\n 2013 Audi A3 (8P)
\.
--
-- TOC entry 4857 (class 0 OID 16404)
-- Dependencies: 216
-- Data for Name: Car_owner; Type: TABLE DATA; Schema: public; Owner: postgres
--
COPY public."Car_owner" ("DL number", "Driver_name_surname", "Adress", 
"Telephone number", "Date of birth", "Passport") FROM stdin;
1234567 Иванов Иван Иванович Серебряный бульвар 12 +79650897834 2001-12-
03 4018 134534
1234565 Михайлов Иван Иванович\n Проспект ветеранов к153 +79656578501 
2001-03-21 4618 147216
1234566 Сергеев Иван Иванович Биржевая Улица 14\n +79657005804 1996-05-
03 4745 501529
1234569 Залетов Артём Дмитриевич Улица Ленина 15 +79652329401 1998-02-
02 4680 471692
1234568 Сергеев Сергей Сергеевич Улица Марата 13\n +79652692357\n 2000-11-
04 4224 941017
\.
--
-- TOC entry 4863 (class 0 OID 16524)
-- Dependencies: 222
-- Data for Name: Crash; Type: TABLE DATA; Schema: public; Owner: postgres
--
COPY public."Crash" ("Crash ID", "Service_number", "Crash_date", 
"Crah_district", "Crash_street") FROM stdin;
1 2 2023-11-03 Центральный Марата 17
\.
--
-- TOC entry 4866 (class 0 OID 16609)
-- Dependencies: 225
-- Data for Name: Participants status; Type: TABLE DATA; Schema: public; Owner: 
postgres
--
COPY public."Participants status" ("Crash_ID", "PTS number", "Participants 
status", "Participants_ID") FROM stdin;
1 02КР362311 1 1
\.
--
-- TOC entry 4860 (class 0 OID 16421)
-- Dependencies: 219
-- Data for Name: Police department; Type: TABLE DATA; Schema: public; Owner: 
postgres
--
COPY public."Police department" ("Department_ID", "Department_adress") FROM 
stdin;
1 Кронверкский проспект 49
2 Улица Ломоносова 9М
\.
9
--
-- TOC entry 4859 (class 0 OID 16416)
-- Dependencies: 218
-- Data for Name: Policemen; Type: TABLE DATA; Schema: public; Owner: postgres
--
COPY public."Policemen" ("Personal number", "Policeman_name_surname", "Rank", 
"Department_ID", "Passport") FROM stdin;
1 Деревсков Денис Климентьевич Сержант 1 4063 170339
2 Левтев Ефим Степанович Рядовой\n 1 4978 568220
3 Веточкин Яков Никифорович Майор\n 2 4777 684175
\.
--
-- TOC entry 4865 (class 0 OID 16565)
-- Dependencies: 224
-- Data for Name: Registered_car; Type: TABLE DATA; Schema: public; Owner: 
postgres
--
COPY public."Registered_car" ("PTS number", "WIN number", "DL number", "Car 
number", "Registration_date", "Department_ID") FROM stdin;
02КР362311 123QWE456 1234567 Е100ВК37 2023-03-11 1
\.
--
-- TOC entry 4862 (class 0 OID 16443)
-- Dependencies: 221
-- Data for Name: Rights deprivation; Type: TABLE DATA; Schema: public; Owner: 
postgres
--
COPY public."Rights deprivation" ("Procedure_ID", "DL number", "Loss_date", 
"Return_date") FROM stdin;
1 1234567 2023-10-23 2023-10-24
\.
--
-- TOC entry 4864 (class 0 OID 16539)
-- Dependencies: 223
-- Data for Name: Violation; Type: TABLE DATA; Schema: public; Owner: postgres
--
COPY public."Violation" ("Violation_ID", "PTS number", "Personal number", 
"Payment status", "Violation_place", "Violation_date", "Violation_id") FROM 
stdin;
1 02КР362311 1 0 Загородный проспект 15 2023-11-02 1
\.
--
-- TOC entry 4856 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: Violation_types; Type: TABLE DATA; Schema: public; Owner: 
postgres
--
COPY public."Violation_types" ("Violation_ID", "Violation_type", 
10
"Violation_name", "Penalty", "DL_loss_time") FROM stdin;
4 Неисправности автомобиля Наезд на сплошную 5000 12
3 Отсутствие документов и регистрации автомобиля Управление транспортным 
средством, на котором установлены стекла (в том числе покрытые прозрачными 
цветными пленками), светопропускание которых не соответствует требованиям 
технического регламента о безопасности колесных транспортных средств 500 0
2 Отсутствие документов и регистрации автомобиля Передача управления 
транспортным средством лицу, не имеющему при себе документов на право управления 
им 3000 0
1 Отсутствие документов и регистрации автомобиля Управление транспортным 
средством, не зарегистрированным в установленном порядке 800 0
\.
--
-- TOC entry 4680 (class 2606 OID 16415)
-- Name: Car_model Car_model_pkey; Type: CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Car_model"
 ADD CONSTRAINT "Car_model_pkey" PRIMARY KEY ("Model ID");
--
-- TOC entry 4676 (class 2606 OID 16586)
-- Name: Car_owner Car_owner_DL number__key; Type: CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Car_owner"
 ADD CONSTRAINT "Car_owner_DL number__key" UNIQUE ("DL number") INCLUDE ("DL 
number");
--
-- TOC entry 4678 (class 2606 OID 16410)
-- Name: Car_owner Car_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Car_owner"
 ADD CONSTRAINT "Car_owner_pkey" PRIMARY KEY ("DL number");
--
-- TOC entry 4688 (class 2606 OID 16437)
-- Name: Car Car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE ONLY public."Car"
 ADD CONSTRAINT "Car_pkey" PRIMARY KEY ("WIN number");
--
-- TOC entry 4694 (class 2606 OID 16601)
-- Name: Crash Crash_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE ONLY public."Crash"
 ADD CONSTRAINT "Crash_pkey" PRIMARY KEY ("Crash ID") INCLUDE ("Crash ID");
11
--
-- TOC entry 4692 (class 2606 OID 16447)
-- Name: Rights deprivation DL_loss_pkey; Type: CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Rights deprivation"
 ADD CONSTRAINT "DL_loss_pkey" PRIMARY KEY ("Procedure_ID", "DL number");
--
-- TOC entry 4686 (class 2606 OID 16427)
-- Name: Police department Department_pkey; Type: CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Police department"
 ADD CONSTRAINT "Department_pkey" PRIMARY KEY ("Department_ID");
--
-- TOC entry 4696 (class 2606 OID 16608)
-- Name: Violation PTS number; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE ONLY public."Violation"
 ADD CONSTRAINT "PTS number" PRIMARY KEY ("Violation_ID") INCLUDE 
("Violation_ID");
--
-- TOC entry 4700 (class 2606 OID 16632)
-- Name: Participants status Participant ID; Type: CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Participants status"
 ADD CONSTRAINT "Participant ID" PRIMARY KEY ("Participants_ID") INCLUDE 
("Participants_ID");
--
-- TOC entry 4682 (class 2606 OID 16592)
-- Name: Policemen Personal number; Type: CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Policemen"
 ADD CONSTRAINT "Personal number" UNIQUE ("Personal number") INCLUDE 
("Personal number");
--
-- TOC entry 4684 (class 2606 OID 16507)
-- Name: Policemen Policemans_pkey; Type: CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Policemen"
 ADD CONSTRAINT "Policemans_pkey" PRIMARY KEY ("Personal number");
--
12
-- TOC entry 4698 (class 2606 OID 16569)
-- Name: Registered_car Registered_car_pkey; Type: CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Registered_car"
 ADD CONSTRAINT "Registered_car_pkey" PRIMARY KEY ("PTS number");
--
-- TOC entry 4674 (class 2606 OID 16403)
-- Name: Violation_types Violation_types_pkey; Type: CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Violation_types"
 ADD CONSTRAINT "Violation_types_pkey" PRIMARY KEY ("Violation_ID");
--
-- TOC entry 4690 (class 2606 OID 16594)
-- Name: Car WIN; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE ONLY public."Car"
 ADD CONSTRAINT "WIN" UNIQUE ("WIN number") INCLUDE ("WIN number");
--
-- TOC entry 4711 (class 2606 OID 16619)
-- Name: Participants status Crash ID; Type: FK CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Participants status"
 ADD CONSTRAINT "Crash ID" FOREIGN KEY ("Crash_ID") REFERENCES 
public."Crash"("Crash ID");
--
-- TOC entry 4703 (class 2606 OID 16448)
-- Name: Rights deprivation DL number; Type: FK CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Rights deprivation"
 ADD CONSTRAINT "DL number" FOREIGN KEY ("DL number") REFERENCES 
public."Car_owner"("DL number");
--
-- TOC entry 4708 (class 2606 OID 16575)
-- Name: Registered_car DL number; Type: FK CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Registered_car"
 ADD CONSTRAINT "DL number" FOREIGN KEY ("DL number") REFERENCES 
public."Car_owner"("DL number");
--
-- TOC entry 4701 (class 2606 OID 16428)
13
-- Name: Policemen Department ID; Type: FK CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Policemen"
 ADD CONSTRAINT "Department ID" FOREIGN KEY ("Department_ID") REFERENCES 
public."Police department"("Department_ID") NOT VALID;
--
-- TOC entry 4709 (class 2606 OID 16580)
-- Name: Registered_car Department ID; Type: FK CONSTRAINT; Schema: public; 
Owner: postgres
--
ALTER TABLE ONLY public."Registered_car"
 ADD CONSTRAINT "Department ID" FOREIGN KEY ("Department_ID") REFERENCES 
public."Police department"("Department_ID");
--
-- TOC entry 4702 (class 2606 OID 16438)
-- Name: Car Model_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE ONLY public."Car"
 ADD CONSTRAINT "Model_id" FOREIGN KEY ("ID model") REFERENCES 
public."Car_model"("Model ID");
--
-- TOC entry 4712 (class 2606 OID 16614)
-- Name: Participants status PTS; Type: FK CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Participants status"
 ADD CONSTRAINT "PTS" FOREIGN KEY ("PTS number") REFERENCES 
public."Registered_car"("PTS number");
--
-- TOC entry 4705 (class 2606 OID 16549)
-- Name: Violation Personal number; Type: FK CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Violation"
 ADD CONSTRAINT "Personal number" FOREIGN KEY ("Personal number") REFERENCES 
public."Policemen"("Personal number");
--
-- TOC entry 4706 (class 2606 OID 16554)
-- Name: Violation Violation ID; Type: FK CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Violation"
 ADD CONSTRAINT "Violation ID" FOREIGN KEY ("Violation_id") REFERENCES 
public."Violation_types"("Violation_ID");
14
--
-- TOC entry 4707 (class 2606 OID 16602)
-- Name: Violation Violation PTS; Type: FK CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Violation"
 ADD CONSTRAINT "Violation PTS" FOREIGN KEY ("PTS number") REFERENCES 
public."Registered_car"("PTS number") NOT VALID;
--
-- TOC entry 4710 (class 2606 OID 16570)
-- Name: Registered_car WIN number; Type: FK CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Registered_car"
 ADD CONSTRAINT "WIN number" FOREIGN KEY ("WIN number") REFERENCES 
public."Car"("WIN number");
--
-- TOC entry 4704 (class 2606 OID 16534)
-- Name: Crash Табельный номер; Type: FK CONSTRAINT; Schema: public; Owner: 
postgres
--
ALTER TABLE ONLY public."Crash"
 ADD CONSTRAINT "Табельный номер" FOREIGN KEY ("Service_number") REFERENCES 
public."Policemen"("Personal number");
-- Completed on 2023-11-03 18:10:38
--
-- PostgreSQL database dump complete
--
