--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-22 17:42:22 MSK

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
-- Name: Session; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Session";


ALTER SCHEMA "Session" OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 16566)
-- Name: hours_trigger(); Type: FUNCTION; Schema: Session; Owner: postgres
--

CREATE FUNCTION "Session".hours_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
  NEW.total_hours := NEW.lecture_hours + NEW.practice_hours + NEW.lab_hours;
  RETURN NEW;
END;
$$;


ALTER FUNCTION "Session".hours_trigger() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16409)
-- Name: active student; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session"."active student" (
    student_id integer NOT NULL,
    education_year integer DEFAULT 1 NOT NULL,
    "from" date NOT NULL,
    "to" date NOT NULL,
    group_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    education_program_id integer NOT NULL,
    record_book_id integer NOT NULL
);


ALTER TABLE "Session"."active student" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16620)
-- Name: attestation pass; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session"."attestation pass" (
    personal_id integer NOT NULL,
    student_id integer NOT NULL,
    discipline_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    date date NOT NULL,
    mark integer NOT NULL,
    attempt integer
);


ALTER TABLE "Session"."attestation pass" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16712)
-- Name: classroom; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".classroom (
    classroom_id integer NOT NULL,
    department_id integer NOT NULL,
    classroom_type integer NOT NULL,
    capacity integer NOT NULL,
    CONSTRAINT capacity_chk CHECK ((capacity > 0)),
    CONSTRAINT classroom_type_chk CHECK ((classroom_type > 0))
);


ALTER TABLE "Session".classroom OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16650)
-- Name: department; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".department (
    department_id integer NOT NULL,
    department_name character varying(20) NOT NULL,
    platform_id integer NOT NULL
);


ALTER TABLE "Session".department OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16487)
-- Name: direction; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".direction (
    direction_id integer NOT NULL,
    direction_name character varying(20) NOT NULL,
    study_level integer NOT NULL,
    CONSTRAINT study_level_chk CHECK ((study_level > 0))
);


ALTER TABLE "Session".direction OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16558)
-- Name: discipline; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".discipline (
    discipline_id integer NOT NULL,
    discipline_name character varying(20) NOT NULL,
    total_hours integer NOT NULL,
    lecture_hours integer NOT NULL,
    practice_hours integer NOT NULL,
    lab_hours integer NOT NULL
);


ALTER TABLE "Session".discipline OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16493)
-- Name: educational program; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session"."educational program" (
    educational_program_id integer NOT NULL,
    educational_program_name character varying(20) NOT NULL,
    education_form integer NOT NULL,
    department_id integer NOT NULL,
    direction_id integer NOT NULL
);


ALTER TABLE "Session"."educational program" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16568)
-- Name: educational program discipline; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session"."educational program discipline" (
    discipline_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    educational_program_id integer NOT NULL
);


ALTER TABLE "Session"."educational program discipline" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16535)
-- Name: group; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session"."group" (
    group_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    educational_program_id integer NOT NULL
);


ALTER TABLE "Session"."group" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16655)
-- Name: platform; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".platform (
    platform_id integer NOT NULL,
    address character varying(70) NOT NULL
);


ALTER TABLE "Session".platform OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16668)
-- Name: schedule; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".schedule (
    platform_id integer NOT NULL,
    department_id integer NOT NULL,
    personal_id integer NOT NULL,
    group_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    date date NOT NULL,
    educational_program_discipline_id integer NOT NULL,
    classroom_id integer NOT NULL
);


ALTER TABLE "Session".schedule OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16429)
-- Name: scholarship; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".scholarship (
    scholarship_id integer NOT NULL,
    scholarship_size integer NOT NULL,
    scholarship_type character varying(20) NOT NULL
);


ALTER TABLE "Session".scholarship OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16474)
-- Name: scholarship appointment; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session"."scholarship appointment" (
    student_id integer NOT NULL,
    scholarship_id integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE "Session"."scholarship appointment" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: student; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".student (
    record_book_id integer NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    education_form integer DEFAULT 1 NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20)
);


ALTER TABLE "Session".student OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16512)
-- Name: syllabus; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".syllabus (
    syllabus_id integer NOT NULL,
    direction_id integer NOT NULL,
    status integer NOT NULL,
    kcp integer NOT NULL,
    admission_year integer NOT NULL,
    CONSTRAINT admission_year_chk1 CHECK ((admission_year >= 1980)),
    CONSTRAINT admission_year_chk2 CHECK ((admission_year <= 2100)),
    CONSTRAINT kcp_check CHECK ((kcp > 0)),
    CONSTRAINT status_chk CHECK ((status > 0))
);


ALTER TABLE "Session".syllabus OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16588)
-- Name: teacher; Type: TABLE; Schema: Session; Owner: postgres
--

CREATE TABLE "Session".teacher (
    personal_id integer NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL
);


ALTER TABLE "Session".teacher OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16731)
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    personal_id integer,
    surname character varying(255),
    name character varying(255),
    patronymic character varying(255)
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- TOC entry 3748 (class 0 OID 16409)
-- Dependencies: 217
-- Data for Name: active student; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session"."active student" (student_id, education_year, "from", "to", group_id, syllabus_id, education_program_id, record_book_id) FROM stdin;
5085	4	2023-10-22	2023-10-22	860	958	9681	39784
1101	5	2023-10-22	2023-10-22	807	571	293	2722
8425	3	2023-10-22	2023-10-22	768	214	5535	55816
2973	4	2023-10-22	2023-10-22	285	788	293	17671
5701	3	2023-10-22	2023-10-22	732	958	5946	25641
8202	1	2023-10-22	2023-10-22	807	424	7	25641
7936	1	2023-10-22	2023-10-22	649	791	7	46678
9078	1	2023-10-22	2023-10-22	176	958	6906	39784
2059	4	2023-10-22	2023-10-22	982	788	5946	25641
7330	4	2023-10-22	2023-10-22	860	135	8282	39784
1795	1	2023-10-22	2023-10-22	228	701	9681	835
3283	2	2023-10-22	2023-10-22	136	958	773	47171
7606	3	2023-10-22	2023-10-22	228	214	3185	42590
3514	4	2023-10-22	2023-10-22	441	302	5040	26163
7470	5	2023-10-22	2023-10-22	982	791	746	42590
6890	1	2023-10-22	2023-10-22	228	622	293	63110
4027	2	2023-10-22	2023-10-22	747	571	3241	46678
1895	1	2023-10-22	2023-10-22	335	892	8282	37086
9105	5	2023-10-22	2023-10-22	443	892	3185	2722
8819	4	2023-10-22	2023-10-22	583	285	746	26163
\.


--
-- TOC entry 3758 (class 0 OID 16620)
-- Dependencies: 227
-- Data for Name: attestation pass; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session"."attestation pass" (personal_id, student_id, discipline_id, educational_program_id, syllabus_id, date, mark, attempt) FROM stdin;
36577	7330	68	3145	135	2023-10-22	32	3
3758	8819	88	3241	107	2023-10-22	4	1
69730	8819	92	5040	135	2023-10-22	38	3
8201	9105	15	9662	168	2023-10-22	33	1
36577	7936	92	7	892	2023-10-22	32	3
1928	1101	22	5040	845	2023-10-22	12	2
72547	9105	40	5535	302	2023-10-22	30	1
75616	9105	68	773	201	2023-10-22	11	2
81097	8202	40	8282	54	2023-10-22	6	2
55944	9105	22	8282	214	2023-10-22	21	2
72090	7470	92	9662	285	2023-10-22	5	2
86439	1895	15	3145	107	2023-10-22	6	3
86439	1101	10	9761	958	2023-10-22	37	1
4146	8202	87	5535	201	2023-10-22	20	3
75616	9105	22	6906	791	2023-10-22	13	1
24436	4027	40	5631	214	2023-10-22	18	2
72090	6890	15	5535	62	2023-10-22	8	1
86439	9105	10	5535	502	2023-10-22	25	1
72090	1101	40	3145	201	2023-10-22	33	1
72090	5701	88	6044	201	2023-10-22	1	1
8201	1101	4	9761	958	2023-10-22	21	3
8201	1895	15	5040	788	2023-10-22	27	3
81097	3514	15	5946	928	2023-10-22	27	1
36577	2059	92	3185	302	2023-10-22	39	3
24436	9105	10	9662	302	2023-10-22	7	2
24436	5085	40	7	622	2023-10-22	18	2
2413	8819	87	5040	791	2023-10-22	3	2
7782	1895	92	6044	62	2023-10-22	5	3
36577	7606	10	6044	214	2023-10-22	13	1
36577	5701	88	746	788	2023-10-22	22	3
72090	5701	40	7	845	2023-10-22	13	1
8201	5701	40	8282	107	2023-10-22	24	3
85500	2973	22	3185	791	2023-10-22	36	1
45079	4027	40	5040	302	2023-10-22	17	3
72090	7470	87	6906	788	2023-10-22	25	2
86439	7936	22	293	845	2023-10-22	19	2
86439	7470	40	9662	958	2023-10-22	17	1
36577	2059	4	6044	214	2023-10-22	16	1
75616	8819	15	773	201	2023-10-22	16	2
36577	7606	88	293	302	2023-10-22	20	3
24436	7330	22	6044	622	2023-10-22	35	2
45079	7470	30	9681	168	2023-10-22	11	1
4146	3514	15	6044	571	2023-10-22	27	3
24436	5701	87	293	424	2023-10-22	14	3
24436	8819	40	746	928	2023-10-22	2	1
1928	9105	10	9662	622	2023-10-22	23	2
27431	7936	40	5631	201	2023-10-22	1	3
2413	3514	87	8282	168	2023-10-22	35	2
24436	8425	10	5320	928	2023-10-22	6	2
72547	6890	30	3185	791	2023-10-22	13	1
69730	7330	22	5946	701	2023-10-22	11	1
27431	9078	92	5535	214	2023-10-22	30	3
4146	1795	30	3185	958	2023-10-22	9	2
4146	1795	88	5631	285	2023-10-22	27	1
7782	7936	87	1786	571	2023-10-22	14	2
86439	7330	4	773	701	2023-10-22	9	3
8201	9105	22	7	622	2023-10-22	37	3
24436	4027	92	3241	107	2023-10-22	39	3
73966	2973	4	293	788	2023-10-22	32	3
72547	9105	88	3241	892	2023-10-22	23	2
75616	7330	68	5535	285	2023-10-22	13	1
85500	8425	22	5946	201	2023-10-22	20	3
27431	2059	15	5040	424	2023-10-22	35	3
2413	8202	68	9681	54	2023-10-22	6	3
27431	2059	88	5535	424	2023-10-22	20	1
45079	7936	92	9761	892	2023-10-22	6	1
24436	3514	10	3145	958	2023-10-22	22	1
69730	4027	40	5320	571	2023-10-22	35	1
39413	5701	92	6044	791	2023-10-22	27	3
8201	5085	15	3145	168	2023-10-22	37	3
7782	9105	30	9761	502	2023-10-22	34	2
8201	3514	30	6906	214	2023-10-22	29	1
\.


--
-- TOC entry 3762 (class 0 OID 16712)
-- Dependencies: 231
-- Data for Name: classroom; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".classroom (classroom_id, department_id, classroom_type, capacity) FROM stdin;
8980	397	1	416
1311	969	9	145
1198	9510	6	457
3645	9599	1	377
9743	6287	1	167
3915	397	7	153
9800	4295	1	13
8298	969	9	323
7238	5437	3	445
6077	4295	6	368
7047	4295	10	394
1443	9510	6	349
8748	2759	2	281
6652	6287	1	174
3235	5229	4	38
2948	9599	6	426
9294	6287	10	390
1305	2759	7	108
2772	9599	9	129
1656	6287	6	21
\.


--
-- TOC entry 3759 (class 0 OID 16650)
-- Dependencies: 228
-- Data for Name: department; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".department (department_id, department_name, platform_id) FROM stdin;
2759	Barr Ltd	7904
5359	Williams-Whitney	7603
6287	Lee, Lopez and Turne	8522
7302	Williams Ltd	7603
397	Hernandez-Tucker	7603
9510	Murray-Gonzales	588
9103	Robles-Wood	7603
9844	Newton and Sons	8990
5229	Morris, Robles and J	8967
9599	Ballard-Smith	4448
5437	Graham LLC	8522
7414	Turner, Hunter and B	8177
1417	Giles, Garcia and We	9561
6520	Larson, Bautista and	3461
5138	Tyler-Hayes	7603
969	Hunter Group	8578
8562	Conner, Ortega and A	588
4295	Sheppard LLC	2291
9205	Montgomery PLC	8309
3354	Sweeney-Ramirez	7904
\.


--
-- TOC entry 3751 (class 0 OID 16487)
-- Dependencies: 220
-- Data for Name: direction; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".direction (direction_id, direction_name, study_level) FROM stdin;
6616	Tasha	4
9363	Christopher	4
6422	Timothy	3
3978	Erica	4
663	Gabrielle	2
1833	John	4
4176	James	4
3715	Erin	2
2213	Justin	3
4821	Danielle	2
28	Theresa	4
2093	Hector	2
1212	Vanessa	4
1541	Bernard	2
8586	Gavin	4
8883	Stephanie	4
2115	Brian	3
6593	Michelle	2
4791	Christopher	2
5936	Breanna	1
\.


--
-- TOC entry 3755 (class 0 OID 16558)
-- Dependencies: 224
-- Data for Name: discipline; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".discipline (discipline_id, discipline_name, total_hours, lecture_hours, practice_hours, lab_hours) FROM stdin;
15	Diaz Group	128	2	65	61
68	Compton-Brown	151	83	56	12
40	Thomas-Gonzalez	186	25	66	95
4	Hart-Orozco	118	66	36	16
22	Barr-Barnes	162	74	56	32
92	Knox Inc	194	51	99	44
30	Clark, Randall and C	146	61	49	36
10	Garner, Williams and	106	26	9	71
88	Nolan and Sons	49	40	6	3
87	Baker, Mcgrath and W	174	30	67	77
\.


--
-- TOC entry 3752 (class 0 OID 16493)
-- Dependencies: 221
-- Data for Name: educational program; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session"."educational program" (educational_program_id, educational_program_name, education_form, department_id, direction_id) FROM stdin;
5320	Ferguson, Crosby and	2	5229	3715
746	Williams-Sanders	8	1417	6422
8282	Kline-Brooks	3	5437	6422
1786	Robinson-Jones	8	8562	6422
7	Bolton, Anderson and	1	1417	663
6750	Perez, Mckinney and 	8	2759	2115
9761	Wong LLC	6	3354	4791
293	Smith-Williamson	7	397	8883
3145	Rodriguez-Rivera	1	7414	2115
5040	Sanchez-Orozco	6	7302	3978
5631	Braun-Sanchez	9	9510	3978
5535	Hayes, Clayton and V	3	9205	8586
5946	Ray-Miranda	1	5359	3978
773	Young, Thomas and Th	3	5229	4821
6906	Young-Bowman	3	7302	8586
9681	Petersen-Peterson	8	5437	3978
6044	White-Garcia	9	2759	5936
9662	Parker and Sons	3	1417	1541
3241	Gibson and Sons	2	5229	4176
3185	Dunn LLC	10	9205	9363
\.


--
-- TOC entry 3756 (class 0 OID 16568)
-- Dependencies: 225
-- Data for Name: educational program discipline; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session"."educational program discipline" (discipline_id, syllabus_id, educational_program_id) FROM stdin;
68	928	3241
87	622	5946
30	622	7
15	302	5946
4	892	9662
88	958	7
10	788	3241
22	928	6906
40	845	9681
92	928	9761
\.


--
-- TOC entry 3754 (class 0 OID 16535)
-- Dependencies: 223
-- Data for Name: group; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session"."group" (group_id, syllabus_id, educational_program_id) FROM stdin;
176	168	3145
768	168	773
126	62	5946
136	502	5320
259	135	8282
807	135	3241
860	788	746
732	107	746
747	285	3145
443	571	9662
285	958	7
583	892	293
649	135	746
382	54	5946
982	201	293
441	791	1786
265	892	746
228	928	8282
855	502	9662
335	845	7
\.


--
-- TOC entry 3760 (class 0 OID 16655)
-- Dependencies: 229
-- Data for Name: platform; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".platform (platform_id, address) FROM stdin;
4448	11901 Davidson Lake Apt. 722\nWest Bobby, KY 79799
8442	4293 Julie Cove\nGibsonmouth, DC 72194
8309	907 Nicholas Squares Apt. 768\nSouth Raymond, DE 17842
588	9319 Dixon Island\nJenniferbury, FM 20979
2294	63732 Jenna Dale\nEast Kristophershire, RI 37820
6389	817 Martinez Pine Apt. 543\nJosephville, FL 28854
7603	USNV Fitzgerald\nFPO AA 04601
8990	3520 Beasley Roads Apt. 279\nPamelabury, SD 25167
3461	96865 King Parkway\nNicoleside, OH 09694
6906	3867 Ashley Rue Suite 994\nRalphmouth, WV 66843
8578	08481 Dixon Station Suite 371\nRonaldside, MN 86887
7904	Unit 9590 Box 8955\nDPO AE 79432
8967	89611 Jennifer Lakes Suite 700\nCarpenterland, IL 97331
9561	8139 Gillespie Mountain\nCharlesberg, VT 65015
2291	510 Nathaniel Roads\nNew Steven, ID 29071
8921	8651 Alicia Junctions Apt. 225\nPort Kristina, AK 78635
8177	9850 Victoria Path Suite 977\nMasonmouth, DE 17150
1772	0087 David Rapids\nNew Johnview, MO 69547
1910	69023 Taylor Square\nGregorymouth, MD 93807
8522	50292 Williams Harbor Suite 618\nLake Elizabeth, CT 27615
\.


--
-- TOC entry 3761 (class 0 OID 16668)
-- Dependencies: 230
-- Data for Name: schedule; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".schedule (platform_id, department_id, personal_id, group_id, educational_program_id, syllabus_id, date, educational_program_discipline_id, classroom_id) FROM stdin;
6906	9510	55944	443	5040	302	2023-10-22	22	1305
6389	6287	1928	807	5946	701	2023-10-22	10	7238
6389	397	55944	136	5040	107	2023-10-22	92	6652
8177	9599	72090	768	746	285	2023-10-22	15	6652
9561	9510	55944	228	9681	168	2023-10-22	88	3235
8522	9510	1928	228	746	62	2023-10-22	15	8298
9561	397	69730	768	7	502	2023-10-22	40	1656
8522	397	1928	136	3145	54	2023-10-22	10	1311
8578	969	85500	176	1786	701	2023-10-22	15	2772
2294	9103	7782	768	3145	214	2023-10-22	4	8298
8578	6287	27431	265	3241	302	2023-10-22	92	1443
8442	1417	75616	768	7	958	2023-10-22	87	9294
8990	969	73966	443	5946	285	2023-10-22	15	2772
8990	8562	86439	649	3145	285	2023-10-22	68	1656
6389	969	8201	335	3145	791	2023-10-22	30	8298
8522	6520	86439	335	3241	62	2023-10-22	22	1656
8967	3354	7782	265	3185	958	2023-10-22	88	7047
2291	969	39413	228	6906	701	2023-10-22	4	1198
588	2759	24436	807	6906	791	2023-10-22	92	3235
8967	9205	1928	285	773	892	2023-10-22	4	6077
\.


--
-- TOC entry 3749 (class 0 OID 16429)
-- Dependencies: 218
-- Data for Name: scholarship; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".scholarship (scholarship_id, scholarship_size, scholarship_type) FROM stdin;
1	83058	Sergio
12	37343	Marissa
75	43509	John
62	5438	Vincent
67	53334	Melissa
45	55336	Adriana
83	89004	Kari
70	68003	Kathryn
11	67702	Kimberly
56	87390	Anthony
27	28444	Ivan
69	8513	Travis
46	22941	Brenda
23	10666	Jeremy
93	25282	Michael
7	26466	Jennifer
13	91025	Andrea
65	85342	Alyssa
34	25027	Gary
43	80010	Nathan
\.


--
-- TOC entry 3750 (class 0 OID 16474)
-- Dependencies: 219
-- Data for Name: scholarship appointment; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session"."scholarship appointment" (student_id, scholarship_id, date) FROM stdin;
4027	45	2023-10-22
3283	62	2023-10-22
2059	27	2023-10-22
5085	75	2023-10-22
3514	69	2023-10-22
7330	56	2023-10-22
2973	23	2023-10-22
6890	65	2023-10-22
9105	43	2023-10-22
8819	1	2023-10-22
7936	12	2023-10-22
2973	69	2023-10-22
8819	67	2023-10-22
3283	11	2023-10-22
7936	75	2023-10-22
7606	13	2023-10-22
8202	69	2023-10-22
2973	93	2023-10-22
9078	56	2023-10-22
1101	46	2023-10-22
\.


--
-- TOC entry 3747 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: student; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".student (record_book_id, status, education_form, surname, name, patronymic) FROM stdin;
37086	8	9	Brett	Lindsey	George
41622	5	1	Daniel	Adrian	Joel
17671	5	8	Angelica	Chelsey	Carolyn
95096	9	2	Kyle	Alejandro	Daniel
30565	5	5	Maria	Jennifer	Thomas
46678	10	10	Jon	Joseph	Sherri
39784	7	3	John	Roger	Megan
55982	2	5	Kari	Shawn	Felicia
10247	5	2	Susan	Joshua	Travis
63110	12	11	Victor	Maria	James
47171	2	7	Katherine	James	Jerry
42590	10	11	Nathaniel	Ann	Derek
18778	10	2	Joshua	Heather	Richard
2722	7	7	Sara	Andrew	Kara
74925	11	2	Michael	Alicia	Renee
55816	7	12	Gerald	Lisa	Lori
26902	11	10	Kevin	Jessica	Melissa
26163	4	2	Ricky	Sandra	Maria
25641	3	12	Kristin	Amy	Monica
835	2	2	Kristen	Michael	John
\.


--
-- TOC entry 3753 (class 0 OID 16512)
-- Dependencies: 222
-- Data for Name: syllabus; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".syllabus (syllabus_id, direction_id, status, kcp, admission_year) FROM stdin;
201	1541	5	863	2059
54	6422	2	718	2048
502	8883	4	560	1980
214	663	5	745	2040
135	6616	1	609	2094
285	8586	1	723	2069
302	5936	5	787	2030
107	8586	5	105	2087
701	5936	5	781	2051
168	2115	1	540	2026
892	4821	4	571	2097
958	1541	4	538	2036
845	2213	4	815	2019
928	8586	5	674	2049
424	28	4	212	2052
622	2115	2	238	2024
791	5936	5	668	2017
62	1833	5	261	2081
571	1541	5	528	2008
788	1212	3	806	1985
\.


--
-- TOC entry 3757 (class 0 OID 16588)
-- Dependencies: 226
-- Data for Name: teacher; Type: TABLE DATA; Schema: Session; Owner: postgres
--

COPY "Session".teacher (personal_id, surname, name, patronymic) FROM stdin;
7782	Kevin	Robert	Michele
24436	Martin	Stephen	Natalie
4146	Erika	Charles	Steve
86439	Tara	Jennifer	Angela
69730	Elizabeth	Richard	Lydia
72090	Chase	Matthew	Robert
27431	Dylan	Jon	Oscar
8201	Kathleen	Scott	Rachel
36577	Jason	Christina	Pamela
75616	Kristin	Kimberly	David
3758	Natalie	Christopher	Sierra
55944	Jessica	Jamie	Raymond
45079	Robert	Levi	Katie
81097	Edward	Nicole	Dustin
85500	Timothy	Charles	Diane
72547	Destiny	Nathan	Christopher
1928	Phillip	Jessica	Terrance
73966	Jennifer	Jose	Nicholas
39413	Virginia	Alexander	Andre
2413	Adam	Janice	Ashley
\.


--
-- TOC entry 3763 (class 0 OID 16731)
-- Dependencies: 232
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher (personal_id, surname, name, patronymic) FROM stdin;
42304	Evan	Richard	Christopher
15433	Jake	Andrea	John
62510	Melissa	Jessica	Wesley
44963	Brandi	Kimberly	Walter
86448	Connor	Brent	Aaron
29769	Ruth	Mercedes	Steven
40230	Jeremy	Wendy	Sally
92936	Rebecca	Eric	Dawn
35947	Alexander	Andres	Nancy
99065	Hayley	Thomas	Scott
51430	Darlene	Diana	David
4985	Cody	Robert	Kelly
73941	Jeremy	John	Keith
98804	Christopher	Sherry	Nicolas
53145	Jacob	Gary	Isaac
9969	Tiffany	Jenny	Scott
88175	David	Lori	Karen
24622	Cynthia	Antonio	Donna
54647	Stephanie	Robert	Melissa
66224	Jeffrey	Jason	Benjamin
27667	Mason	Ashley	Jacob
61882	Frank	Chloe	Dylan
68878	Bradley	Jennifer	Luke
16267	Kevin	Heather	Brittney
61539	Thomas	Susan	Todd
38102	Jeremy	Jonathan	David
90898	Stephen	Jennifer	Kyle
58402	Samantha	Joseph	Valerie
12950	Jeremiah	Tiffany	Katelyn
7130	Shannon	Keith	Karen
82206	Brenda	Joshua	Christopher
29952	Maria	Kyle	Brittany
19283	Mark	Carrie	Elizabeth
89962	Sarah	Alexis	Julia
82924	Ryan	Tracy	Rachel
66047	David	Stephanie	Penny
12970	Chris	Brenda	Robert
93784	Ricky	Katelyn	Christy
26995	Robert	Paige	Tony
23542	Michelle	Donald	Nicole
94798	David	Sarah	Hannah
13880	Edward	Adrienne	Michael
58442	Hector	Gina	Anne
5915	Jason	Miranda	Allison
93738	Lauren	Robert	Jackson
75123	Victoria	Katie	Jared
69987	Leslie	Andrea	Brian
4	Sarah	Angelica	Gerald
31635	Ashley	Amanda	Laurie
8675	Keith	Stephanie	Alison
55928	James	Terry	Jennifer
85940	Brent	Lisa	Andrew
12345	James	Carlos	Donna
60841	David	Jenna	Heidi
94423	Martha	Gail	Alexandra
77067	Diana	Taylor	Lynn
4807	Christina	Brandon	Sarah
90782	James	Jennifer	Steven
52405	Michelle	Margaret	Sydney
53366	Kevin	Monica	Eric
571	Jonathan	Riley	Neil
19179	Brittany	Rebecca	Heather
79164	Brittany	Paul	Cynthia
31943	David	Angel	Margaret
76908	Karen	Alicia	Christina
28493	Joann	Jackson	Michelle
74205	Sharon	Patricia	Michelle
34338	Amanda	Tara	Lori
22722	Tammy	Jennifer	Craig
55763	Melissa	Patrick	Tiffany
48051	Wendy	Sarah	Gerald
91017	John	Tara	Rachel
33894	James	Christina	Michele
13825	Robert	Michelle	Kimberly
67498	Alexandra	Jamie	Abigail
79977	Jeffrey	Mary	Kevin
18471	Steven	Tyler	Jesus
48012	Christopher	Amanda	Christopher
42134	Carolyn	Gene	Olivia
87029	Gina	Kara	Kristy
25947	Paula	Wayne	Nicole
\.


--
-- TOC entry 3533 (class 2606 OID 16413)
-- Name: active student active student_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT "active student_pkey" PRIMARY KEY (student_id);


--
-- TOC entry 3523 (class 2606 OID 16748)
-- Name: attestation pass attempt_chk; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT attempt_chk CHECK ((attempt >= 0)) NOT VALID;


--
-- TOC entry 3524 (class 2606 OID 16749)
-- Name: attestation pass attempt_chk1; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT attempt_chk1 CHECK ((attempt <= 3)) NOT VALID;


--
-- TOC entry 3565 (class 2606 OID 16624)
-- Name: attestation pass attestation pass_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT "attestation pass_pkey" PRIMARY KEY (personal_id, student_id, discipline_id, educational_program_id, syllabus_id);


--
-- TOC entry 3573 (class 2606 OID 16718)
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (classroom_id, department_id);


--
-- TOC entry 3575 (class 2606 OID 16720)
-- Name: classroom classroom_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT classroom_uid UNIQUE (classroom_id);


--
-- TOC entry 3567 (class 2606 OID 16654)
-- Name: department department_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".department
    ADD CONSTRAINT department_uid PRIMARY KEY (department_id);


--
-- TOC entry 3543 (class 2606 OID 16492)
-- Name: direction direction_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".direction
    ADD CONSTRAINT direction_uid PRIMARY KEY (direction_id);


--
-- TOC entry 3557 (class 2606 OID 16562)
-- Name: discipline discipline_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (discipline_id);


--
-- TOC entry 3559 (class 2606 OID 16619)
-- Name: educational program discipline discipline_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT discipline_uid UNIQUE (discipline_id);


--
-- TOC entry 3518 (class 2606 OID 16505)
-- Name: educational program education_form.chk; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session"."educational program"
    ADD CONSTRAINT "education_form.chk" CHECK ((education_form > 0)) NOT VALID;


--
-- TOC entry 3511 (class 2606 OID 16473)
-- Name: student education_form_chk; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session".student
    ADD CONSTRAINT education_form_chk CHECK ((education_form > 0)) NOT VALID;


--
-- TOC entry 3513 (class 2606 OID 16427)
-- Name: active student education_year_chk1; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session"."active student"
    ADD CONSTRAINT education_year_chk1 CHECK ((education_year <= 5)) NOT VALID;


--
-- TOC entry 3514 (class 2606 OID 16428)
-- Name: active student education_year_chk2; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session"."active student"
    ADD CONSTRAINT education_year_chk2 CHECK ((education_year >= 1)) NOT VALID;


--
-- TOC entry 3561 (class 2606 OID 16572)
-- Name: educational program discipline educational program discipline_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT "educational program discipline_pkey" PRIMARY KEY (discipline_id, syllabus_id, educational_program_id);


--
-- TOC entry 3545 (class 2606 OID 16497)
-- Name: educational program educational_program_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT educational_program_pkey PRIMARY KEY (educational_program_id);


--
-- TOC entry 3547 (class 2606 OID 16499)
-- Name: educational program educational_program_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT educational_program_uid UNIQUE (educational_program_id) INCLUDE (educational_program_id);


--
-- TOC entry 3553 (class 2606 OID 16539)
-- Name: group group_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (group_id, syllabus_id, educational_program_id);


--
-- TOC entry 3555 (class 2606 OID 16541)
-- Name: group group_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT group_uid UNIQUE (group_id);


--
-- TOC entry 3525 (class 2606 OID 16750)
-- Name: attestation pass mark_chk; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT mark_chk CHECK ((mark >= 0)) NOT VALID;


--
-- TOC entry 3563 (class 2606 OID 16592)
-- Name: teacher personal_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".teacher
    ADD CONSTRAINT personal_uid PRIMARY KEY (personal_id);


--
-- TOC entry 3569 (class 2606 OID 16659)
-- Name: platform platform_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".platform
    ADD CONSTRAINT platform_uid PRIMARY KEY (platform_id);


--
-- TOC entry 3529 (class 2606 OID 16426)
-- Name: student record_book_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".student
    ADD CONSTRAINT record_book_uid UNIQUE (record_book_id);


--
-- TOC entry 3571 (class 2606 OID 16691)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (platform_id, department_id, personal_id, group_id, educational_program_id, syllabus_id, educational_program_discipline_id);


--
-- TOC entry 3541 (class 2606 OID 16527)
-- Name: scholarship appointment scholarship appointment_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT "scholarship appointment_pkey" PRIMARY KEY (student_id, scholarship_id);


--
-- TOC entry 3537 (class 2606 OID 16435)
-- Name: scholarship scholarship_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT scholarship_pkey PRIMARY KEY (scholarship_id);


--
-- TOC entry 3515 (class 2606 OID 16452)
-- Name: scholarship scholarship_size_chk; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session".scholarship
    ADD CONSTRAINT scholarship_size_chk CHECK ((scholarship_size > 0)) NOT VALID;


--
-- TOC entry 3539 (class 2606 OID 16451)
-- Name: scholarship scholarship_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT scholarship_uid UNIQUE (scholarship_id);


--
-- TOC entry 3512 (class 2606 OID 16472)
-- Name: student status_chk; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session".student
    ADD CONSTRAINT status_chk CHECK ((status > 0)) NOT VALID;


--
-- TOC entry 3531 (class 2606 OID 16408)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".student
    ADD CONSTRAINT student_pkey PRIMARY KEY (record_book_id);


--
-- TOC entry 3535 (class 2606 OID 16424)
-- Name: active student student_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT student_uid UNIQUE NULLS NOT DISTINCT (student_id);


--
-- TOC entry 3517 (class 2606 OID 16736)
-- Name: direction study_level_chk1; Type: CHECK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE "Session".direction
    ADD CONSTRAINT study_level_chk1 CHECK ((study_level < 5)) NOT VALID;


--
-- TOC entry 3549 (class 2606 OID 16520)
-- Name: syllabus syllabus_pkey; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT syllabus_pkey PRIMARY KEY (syllabus_id, direction_id);


--
-- TOC entry 3551 (class 2606 OID 16534)
-- Name: syllabus syllabus_uid; Type: CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT syllabus_uid UNIQUE (syllabus_id);


--
-- TOC entry 3603 (class 2620 OID 16567)
-- Name: discipline discipline_trigger; Type: TRIGGER; Schema: Session; Owner: postgres
--

CREATE TRIGGER discipline_trigger BEFORE INSERT OR UPDATE OF total_hours, lecture_hours, practice_hours, lab_hours ON "Session".discipline FOR EACH ROW EXECUTE FUNCTION "Session".hours_trigger();


--
-- TOC entry 3594 (class 2606 OID 16726)
-- Name: schedule classroom_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT classroom_id FOREIGN KEY (classroom_id) REFERENCES "Session".classroom(classroom_id) NOT VALID;


--
-- TOC entry 3595 (class 2606 OID 16678)
-- Name: schedule department_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES "Session".department(department_id);


--
-- TOC entry 3602 (class 2606 OID 16721)
-- Name: classroom department_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES "Session".department(department_id);


--
-- TOC entry 3581 (class 2606 OID 16500)
-- Name: educational program direction_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT direction_id FOREIGN KEY (direction_id) REFERENCES "Session".direction(direction_id) NOT VALID;


--
-- TOC entry 3582 (class 2606 OID 16521)
-- Name: syllabus direction_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT direction_id FOREIGN KEY (direction_id) REFERENCES "Session".direction(direction_id);


--
-- TOC entry 3585 (class 2606 OID 16573)
-- Name: educational program discipline discipline_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id) REFERENCES "Session".discipline(discipline_id);


--
-- TOC entry 3588 (class 2606 OID 16645)
-- Name: attestation pass discipline_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id) REFERENCES "Session"."educational program discipline"(discipline_id);


--
-- TOC entry 3576 (class 2606 OID 16742)
-- Name: active student education_program_pkey; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT education_program_pkey FOREIGN KEY (education_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;


--
-- TOC entry 3596 (class 2606 OID 16707)
-- Name: schedule educational_program_discipline_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT educational_program_discipline_id FOREIGN KEY (educational_program_discipline_id) REFERENCES "Session"."educational program discipline"(discipline_id) NOT VALID;


--
-- TOC entry 3583 (class 2606 OID 16547)
-- Name: group educational_program_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id);


--
-- TOC entry 3586 (class 2606 OID 16583)
-- Name: educational program discipline educational_program_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id);


--
-- TOC entry 3589 (class 2606 OID 16640)
-- Name: attestation pass educational_program_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id);


--
-- TOC entry 3597 (class 2606 OID 16702)
-- Name: schedule educational_program_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;


--
-- TOC entry 3598 (class 2606 OID 16692)
-- Name: schedule group_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT group_id FOREIGN KEY (group_id) REFERENCES "Session"."group"(group_id) NOT VALID;


--
-- TOC entry 3590 (class 2606 OID 16625)
-- Name: attestation pass personal_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT personal_id FOREIGN KEY (personal_id) REFERENCES "Session".teacher(personal_id);


--
-- TOC entry 3599 (class 2606 OID 16683)
-- Name: schedule personal_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT personal_id FOREIGN KEY (personal_id) REFERENCES "Session".teacher(personal_id);


--
-- TOC entry 3593 (class 2606 OID 16663)
-- Name: department platform_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".department
    ADD CONSTRAINT platform_id FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id) NOT VALID;


--
-- TOC entry 3600 (class 2606 OID 16673)
-- Name: schedule platform_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT platform_id FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id);


--
-- TOC entry 3577 (class 2606 OID 16418)
-- Name: active student record_book_pkey; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT record_book_pkey FOREIGN KEY (record_book_id) REFERENCES "Session".student(record_book_id) NOT VALID;


--
-- TOC entry 3579 (class 2606 OID 16482)
-- Name: scholarship appointment scholarship_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT scholarship_id FOREIGN KEY (scholarship_id) REFERENCES "Session".scholarship(scholarship_id);


--
-- TOC entry 3580 (class 2606 OID 16477)
-- Name: scholarship appointment student_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES "Session"."active student"(student_id);


--
-- TOC entry 3591 (class 2606 OID 16630)
-- Name: attestation pass student_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES "Session"."active student"(student_id);


--
-- TOC entry 3584 (class 2606 OID 16542)
-- Name: group syllabus_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id);


--
-- TOC entry 3587 (class 2606 OID 16578)
-- Name: educational program discipline syllabus_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id);


--
-- TOC entry 3592 (class 2606 OID 16635)
-- Name: attestation pass syllabus_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id);


--
-- TOC entry 3601 (class 2606 OID 16697)
-- Name: schedule syllabus_id; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;


--
-- TOC entry 3578 (class 2606 OID 16737)
-- Name: active student syllabus_pkey; Type: FK CONSTRAINT; Schema: Session; Owner: postgres
--

ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT syllabus_pkey FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;


-- Completed on 2023-10-22 17:42:22 MSK

--
-- PostgreSQL database dump complete
--

