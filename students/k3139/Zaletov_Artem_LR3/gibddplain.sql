--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-13 16:23:48

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

DROP DATABASE IF EXISTS "GIBDD";
--
-- TOC entry 4891 (class 1262 OID 16398)
-- Name: GIBDD; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "GIBDD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "GIBDD" OWNER TO postgres;

\connect "GIBDD"

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
    "WIN_number" character varying(18) NOT NULL,
    "Engine_number" character varying(18) NOT NULL,
    "Model_ID" integer NOT NULL
);


ALTER TABLE public."Car" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16411)
-- Name: Car_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Car_model" (
    "Model_ID" integer NOT NULL,
    "Label" character varying(40) NOT NULL,
    "Body_type" character varying(20) NOT NULL,
    "Year_of_release" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."Car_model" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16524)
-- Name: Crash; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Crash" (
    "Crash_ID" integer NOT NULL,
    "Service_number" character varying(18) NOT NULL,
    "Crash_date" date NOT NULL,
    "Crah_district" character varying(50) NOT NULL,
    "Crash_street" character varying(50) NOT NULL
);


ALTER TABLE public."Crash" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16609)
-- Name: Participants_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Participants_status" (
    "Crash_ID" integer NOT NULL,
    "PTS_number" character varying(20) NOT NULL,
    "Participants_status" character varying(50) NOT NULL,
    "Participants_ID" integer NOT NULL
);


ALTER TABLE public."Participants_status" OWNER TO postgres;

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
    "Personal_number" character varying(18) NOT NULL,
    "Policeman_name_surname" character varying(255) NOT NULL,
    "Rank" character varying(50) NOT NULL,
    "Department_ID" integer NOT NULL,
    "Passport" character varying(15)
);


ALTER TABLE public."Policemen" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16443)
-- Name: Rights deprivation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rights deprivation" (
    "Procedure_ID" integer NOT NULL,
    "DL number" integer NOT NULL,
    "Loss_date" date NOT NULL,
    "Return_date" date NOT NULL
);


ALTER TABLE public."Rights deprivation" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: Violation_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Violation_types" (
    "Violation_ID" integer NOT NULL,
    "Violation_type" character varying(100) NOT NULL,
    "Violation_name" character varying(500) NOT NULL,
    "Penalty" integer,
    "DL_loss_time" integer
);


ALTER TABLE public."Violation_types" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16404)
-- Name: car_owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_owner (
    "DL_number" integer NOT NULL,
    "Driver_name_surname" character varying(255) NOT NULL,
    "Adress" character varying(255) NOT NULL,
    "Telephone_number" character varying(15) NOT NULL,
    "Date_of_birth" date NOT NULL,
    "Passport" character varying(15)
);


ALTER TABLE public.car_owner OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16565)
-- Name: registered_car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registered_car (
    "PTS_number" character varying(20) NOT NULL,
    "WIN_number" character varying(20) NOT NULL,
    "DL_number" integer NOT NULL,
    "Car_number" character varying(20) NOT NULL,
    "Registration_date" date NOT NULL,
    "Department_ID" integer NOT NULL
);


ALTER TABLE public.registered_car OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16683)
-- Name: accident_participants_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.accident_participants_view AS
 SELECT co."DL_number" AS "Driver_License_Number",
    co."Driver_name_surname" AS "Driver_Name_Surname",
    co."Adress" AS "Driver_Address",
    co."Telephone_number" AS "Driver_Telephone",
    co."Date_of_birth" AS "Driver_Date_of_Birth",
    co."Passport" AS "Driver_Passport",
    rc."Car_number" AS "Car_Number",
    rc."Registration_date" AS "Car_Registration_Date",
    ps."Participants_status" AS "Participant_Status",
    a."Crash_date" AS "Accident_Date",
    a."Crah_district" AS "Accident_District",
    a."Crash_street" AS "Accident_Street"
   FROM (((public.car_owner co
     JOIN public.registered_car rc ON ((co."DL_number" = rc."DL_number")))
     JOIN public."Participants_status" ps ON (((rc."PTS_number")::text = (ps."PTS_number")::text)))
     JOIN public."Crash" a ON ((ps."Crash_ID" = a."Crash_ID")))
  WHERE ((ps."Participants_status" IS NOT NULL) AND ((a."Crash_date" >= '2023-11-01'::date) AND (a."Crash_date" <= '2023-12-01'::date)));


ALTER VIEW public.accident_participants_view OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16539)
-- Name: violation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.violation (
    "Violation_ID" integer NOT NULL,
    "PTS_number" character varying(18) NOT NULL,
    "Personal_number" character varying(18) NOT NULL,
    "Violation_place" character varying(255) NOT NULL,
    "Violation_date" date NOT NULL,
    "Violation_id" integer NOT NULL,
    "Violation_time" time without time zone NOT NULL,
    "Payment_status" integer
);


ALTER TABLE public.violation OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16663)
-- Name: violation_summary_remake2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.violation_summary_remake2 AS
 SELECT co."DL_number" AS "DL_Number",
    sum(vt."Penalty") AS "Total_Penalty"
   FROM (((public.violation v
     JOIN public."Violation_types" vt ON ((v."Violation_id" = vt."Violation_ID")))
     JOIN public.registered_car rc ON (((v."PTS_number")::text = (rc."PTS_number")::text)))
     JOIN public.car_owner co ON ((rc."DL_number" = co."DL_number")))
  WHERE ((v."Violation_date" >= '2023-02-15'::date) AND (v."Violation_date" <= '2024-02-15'::date))
  GROUP BY co."DL_number";


ALTER VIEW public.violation_summary_remake2 OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16668)
-- Name: violation_summary_remake3; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.violation_summary_remake3 AS
 SELECT co."DL_number" AS "DL_Number",
    vt."Violation_type" AS "Violation_Type",
    v."Violation_date" AS "Violation_Date",
    sum(vt."Penalty") AS "Total_Penalty"
   FROM (((public.violation v
     JOIN public."Violation_types" vt ON ((v."Violation_id" = vt."Violation_ID")))
     JOIN public.registered_car rc ON (((v."PTS_number")::text = (rc."PTS_number")::text)))
     JOIN public.car_owner co ON ((rc."DL_number" = co."DL_number")))
  WHERE ((v."Violation_date" >= '2023-02-15'::date) AND (v."Violation_date" <= '2024-02-15'::date))
  GROUP BY co."DL_number", vt."Violation_type", v."Violation_date";


ALTER VIEW public.violation_summary_remake3 OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 16433)
-- Dependencies: 220
-- Data for Name: Car; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Car" VALUES ('123QWE456', '321567Q', 1) ON CONFLICT DO NOTHING;
INSERT INTO public."Car" VALUES ('JH4KA4650L', 'SC36E-1000324', 2) ON CONFLICT DO NOTHING;
INSERT INTO public."Car" VALUES ('1FUJA6CV', '284476A', 2) ON CONFLICT DO NOTHING;
INSERT INTO public."Car" VALUES ('456QWE123', '028103373N', 3) ON CONFLICT DO NOTHING;
INSERT INTO public."Car" VALUES ('WIN123456789', '12345678', 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 4877 (class 0 OID 16411)
-- Dependencies: 217
-- Data for Name: Car_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Car_model" VALUES (1, 'BMW', 'Седан', 2003, 'BMW 5 e39') ON CONFLICT DO NOTHING;
INSERT INTO public."Car_model" VALUES (2, 'BMW
', 'Седан
', 2005, 'BMW 3 e46') ON CONFLICT DO NOTHING;
INSERT INTO public."Car_model" VALUES (3, 'Audi
', 'Хетчбек
', 2013, 'Audi A3 (8P)') ON CONFLICT DO NOTHING;
INSERT INTO public."Car_model" VALUES (4, 'Nissan
', 'Хетчбек', 2014, 'Nissan quasqai') ON CONFLICT DO NOTHING;
INSERT INTO public."Car_model" VALUES (5, 'Nissan
', 'Хетчбек', 2016, 'Nissan tiida
') ON CONFLICT DO NOTHING;


--
-- TOC entry 4882 (class 0 OID 16524)
-- Dependencies: 222
-- Data for Name: Crash; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Crash" VALUES (1, '2', '2023-11-15', 'Центральный', 'Марата 17') ON CONFLICT DO NOTHING;


--
-- TOC entry 4885 (class 0 OID 16609)
-- Dependencies: 225
-- Data for Name: Participants_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Participants_status" VALUES (1, '02КР362311', '1', 1) ON CONFLICT DO NOTHING;
INSERT INTO public."Participants_status" VALUES (1, '03ЕТ23145', '0', 2) ON CONFLICT DO NOTHING;


--
-- TOC entry 4879 (class 0 OID 16421)
-- Dependencies: 219
-- Data for Name: Police department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Police department" VALUES (1, 'Кронверкский проспект 49') ON CONFLICT DO NOTHING;
INSERT INTO public."Police department" VALUES (2, 'Улица Ломоносова 9М') ON CONFLICT DO NOTHING;


--
-- TOC entry 4878 (class 0 OID 16416)
-- Dependencies: 218
-- Data for Name: Policemen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Policemen" VALUES ('1', 'Деревсков Денис Климентьевич', 'Сержант', 1, '4063 170339') ON CONFLICT DO NOTHING;
INSERT INTO public."Policemen" VALUES ('2', 'Левтев Ефим Степанович', 'Рядовой
', 1, '4978 568220') ON CONFLICT DO NOTHING;
INSERT INTO public."Policemen" VALUES ('3', 'Веточкин Яков Никифорович', 'Майор
', 2, '4777 684175') ON CONFLICT DO NOTHING;


--
-- TOC entry 4881 (class 0 OID 16443)
-- Dependencies: 221
-- Data for Name: Rights deprivation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Rights deprivation" VALUES (1, 1234567, '2023-11-03', '2024-11-03') ON CONFLICT DO NOTHING;
INSERT INTO public."Rights deprivation" VALUES (2, 1234566, '2023-11-06', '2024-11-06') ON CONFLICT DO NOTHING;


--
-- TOC entry 4875 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: Violation_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Violation_types" VALUES (4, 'Неисправности автомобиля', 'Наезд на сплошную', 5000, 12) ON CONFLICT DO NOTHING;
INSERT INTO public."Violation_types" VALUES (1, 'Отсутствие документов и регистрации автомобиля', 'Управление транспортным средством, не зарегистрированным в установленном порядке', 800, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public."Violation_types" VALUES (3, 'Отсутствие документов и регистрации автомобиля', 'Управление транспортным средством, на котором установлены стекла (в том числе покрытые прозрачными цветными пленками), светопропускание которых не соответствует требованиям технического регламента о безопасности колесных транспортных средств', 500, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public."Violation_types" VALUES (2, 'Отсутствие документов и регистрации автомобиля', 'Передача управления транспортным средством лицу, не имеющему при себе документов на право управления им', 0, 3) ON CONFLICT DO NOTHING;


--
-- TOC entry 4876 (class 0 OID 16404)
-- Dependencies: 216
-- Data for Name: car_owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.car_owner VALUES (1234567, 'Иванов Иван Иванович', 'Серебряный бульвар 12', '+79650897834', '2001-12-03', '4018 134534') ON CONFLICT DO NOTHING;
INSERT INTO public.car_owner VALUES (1234565, 'Михайлов Иван Иванович
', 'Проспект ветеранов к153', '+79656578501', '2001-03-21', '4618 147216') ON CONFLICT DO NOTHING;
INSERT INTO public.car_owner VALUES (1234566, 'Сергеев Иван Иванович', 'Биржевая Улица 14
', '+79657005804', '1996-05-03', '4745 501529') ON CONFLICT DO NOTHING;
INSERT INTO public.car_owner VALUES (1234569, 'Залетов Артём Дмитриевич', 'Улица Ленина 15', '+79652329401', '1998-02-02', '4680 471692') ON CONFLICT DO NOTHING;
INSERT INTO public.car_owner VALUES (1234568, 'Сергеев Сергей Сергеевич', 'Улица Марата 13
', '+79652692357
', '2000-11-04', '4224 941017') ON CONFLICT DO NOTHING;


--
-- TOC entry 4884 (class 0 OID 16565)
-- Dependencies: 224
-- Data for Name: registered_car; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.registered_car VALUES ('02КР362311', '123QWE456', 1234567, 'Е100ВК37', '2023-03-11', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.registered_car VALUES ('03ЕТ23145', '1FUJA6CV', 1234565, 'У187ЕК37', '2023-03-12', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.registered_car VALUES ('04УЕ32664', '456QWE123', 1234566, 'О716СА178', '2023-03-15', 2) ON CONFLICT DO NOTHING;


--
-- TOC entry 4883 (class 0 OID 16539)
-- Dependencies: 223
-- Data for Name: violation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.violation VALUES (3, '03ЕТ23145', '2', 'Серебристый бульвар 35
', '2023-11-03', 3, '21:00:00', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.violation VALUES (1, '02КР362311', '1', 'Загородный проспект 15', '2023-11-02', 1, '05:03:00', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.violation VALUES (2, '02КР362311', '1', 'Гражданский проспект 24', '2023-11-07', 2, '04:21:00', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.violation VALUES (4, '04УЕ32664', '1', 'Звенигородская улица 22', '2023-11-06', 2, '07:03:21', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 4694 (class 2606 OID 16415)
-- Name: Car_model Car_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Car_model"
    ADD CONSTRAINT "Car_model_pkey" PRIMARY KEY ("Model_ID");


--
-- TOC entry 4689 (class 2606 OID 16586)
-- Name: car_owner Car_owner_DL number__key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_owner
    ADD CONSTRAINT "Car_owner_DL number__key" UNIQUE ("DL_number") INCLUDE ("DL_number");


--
-- TOC entry 4691 (class 2606 OID 16410)
-- Name: car_owner Car_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_owner
    ADD CONSTRAINT "Car_owner_pkey" PRIMARY KEY ("DL_number");


--
-- TOC entry 4703 (class 2606 OID 16437)
-- Name: Car Car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY ("WIN_number");


--
-- TOC entry 4709 (class 2606 OID 16601)
-- Name: Crash Crash_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crash"
    ADD CONSTRAINT "Crash_pkey" PRIMARY KEY ("Crash_ID") INCLUDE ("Crash_ID");


--
-- TOC entry 4707 (class 2606 OID 16447)
-- Name: Rights deprivation DL_loss_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rights deprivation"
    ADD CONSTRAINT "DL_loss_pkey" PRIMARY KEY ("Procedure_ID", "DL number");


--
-- TOC entry 4701 (class 2606 OID 16427)
-- Name: Police department Department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Police department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY ("Department_ID");


--
-- TOC entry 4711 (class 2606 OID 16608)
-- Name: violation PTS number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violation
    ADD CONSTRAINT "PTS number" PRIMARY KEY ("Violation_ID") INCLUDE ("Violation_ID");


--
-- TOC entry 4716 (class 2606 OID 16632)
-- Name: Participants_status Participant ID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Participants_status"
    ADD CONSTRAINT "Participant ID" PRIMARY KEY ("Participants_ID") INCLUDE ("Participants_ID");


--
-- TOC entry 4696 (class 2606 OID 16592)
-- Name: Policemen Personal number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Policemen"
    ADD CONSTRAINT "Personal number" UNIQUE ("Personal_number") INCLUDE ("Personal_number");


--
-- TOC entry 4698 (class 2606 OID 16507)
-- Name: Policemen Policemans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Policemen"
    ADD CONSTRAINT "Policemans_pkey" PRIMARY KEY ("Personal_number");


--
-- TOC entry 4713 (class 2606 OID 16569)
-- Name: registered_car Registered_car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registered_car
    ADD CONSTRAINT "Registered_car_pkey" PRIMARY KEY ("PTS_number");


--
-- TOC entry 4686 (class 2606 OID 16403)
-- Name: Violation_types Violation_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Violation_types"
    ADD CONSTRAINT "Violation_types_pkey" PRIMARY KEY ("Violation_ID");


--
-- TOC entry 4705 (class 2606 OID 16594)
-- Name: Car WIN; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT "WIN" UNIQUE ("WIN_number") INCLUDE ("WIN_number");


--
-- TOC entry 4692 (class 1259 OID 16688)
-- Name: idx_dl_number_co; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dl_number_co ON public.car_owner USING btree ("DL_number");


--
-- TOC entry 4714 (class 1259 OID 16689)
-- Name: idx_dl_number_rc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dl_number_rc ON public.registered_car USING btree ("DL_number");


--
-- TOC entry 4699 (class 1259 OID 16691)
-- Name: idx_policeman_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_policeman_name ON public."Policemen" USING btree ("Policeman_name_surname");


--
-- TOC entry 4687 (class 1259 OID 16690)
-- Name: idx_violation_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_violation_name ON public."Violation_types" USING btree ("Violation_name");


--
-- TOC entry 4727 (class 2606 OID 16619)
-- Name: Participants_status Crash ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Participants_status"
    ADD CONSTRAINT "Crash ID" FOREIGN KEY ("Crash_ID") REFERENCES public."Crash"("Crash_ID");


--
-- TOC entry 4719 (class 2606 OID 16448)
-- Name: Rights deprivation DL number; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rights deprivation"
    ADD CONSTRAINT "DL number" FOREIGN KEY ("DL number") REFERENCES public.car_owner("DL_number");


--
-- TOC entry 4724 (class 2606 OID 16575)
-- Name: registered_car DL number; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registered_car
    ADD CONSTRAINT "DL number" FOREIGN KEY ("DL_number") REFERENCES public.car_owner("DL_number");


--
-- TOC entry 4717 (class 2606 OID 16428)
-- Name: Policemen Department ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Policemen"
    ADD CONSTRAINT "Department ID" FOREIGN KEY ("Department_ID") REFERENCES public."Police department"("Department_ID") NOT VALID;


--
-- TOC entry 4725 (class 2606 OID 16580)
-- Name: registered_car Department ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registered_car
    ADD CONSTRAINT "Department ID" FOREIGN KEY ("Department_ID") REFERENCES public."Police department"("Department_ID");


--
-- TOC entry 4718 (class 2606 OID 16438)
-- Name: Car Model_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT "Model_id" FOREIGN KEY ("Model_ID") REFERENCES public."Car_model"("Model_ID");


--
-- TOC entry 4728 (class 2606 OID 16614)
-- Name: Participants_status PTS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Participants_status"
    ADD CONSTRAINT "PTS" FOREIGN KEY ("PTS_number") REFERENCES public.registered_car("PTS_number");


--
-- TOC entry 4721 (class 2606 OID 16549)
-- Name: violation Personal number; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violation
    ADD CONSTRAINT "Personal number" FOREIGN KEY ("Personal_number") REFERENCES public."Policemen"("Personal_number");


--
-- TOC entry 4722 (class 2606 OID 16554)
-- Name: violation Violation ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violation
    ADD CONSTRAINT "Violation ID" FOREIGN KEY ("Violation_id") REFERENCES public."Violation_types"("Violation_ID");


--
-- TOC entry 4723 (class 2606 OID 16602)
-- Name: violation Violation PTS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violation
    ADD CONSTRAINT "Violation PTS" FOREIGN KEY ("PTS_number") REFERENCES public.registered_car("PTS_number") NOT VALID;


--
-- TOC entry 4726 (class 2606 OID 16570)
-- Name: registered_car WIN number; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registered_car
    ADD CONSTRAINT "WIN number" FOREIGN KEY ("WIN_number") REFERENCES public."Car"("WIN_number");


--
-- TOC entry 4720 (class 2606 OID 16534)
-- Name: Crash Табельный номер; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crash"
    ADD CONSTRAINT "Табельный номер" FOREIGN KEY ("Service_number") REFERENCES public."Policemen"("Personal_number");


-- Completed on 2023-11-13 16:23:49

--
-- PostgreSQL database dump complete
--

