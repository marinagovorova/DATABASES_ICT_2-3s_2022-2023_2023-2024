--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-26 19:02:19

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
-- TOC entry 230 (class 1259 OID 16578)
-- Name: attestations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attestations (
    a_discipline_in_curricula_code integer NOT NULL,
    a_date date NOT NULL,
    a_student_record_book integer NOT NULL,
    a_attempt integer NOT NULL,
    a_semester integer NOT NULL,
    a_grade character varying(10) NOT NULL,
    a_teacher_id integer NOT NULL,
    CONSTRAINT attestations_a_attempt_check CHECK ((a_attempt >= 1)),
    CONSTRAINT attestations_a_grade_check CHECK (((a_grade)::text = ANY ((ARRAY['5'::character varying, '4'::character varying, '3'::character varying, '2'::character varying, 'Зачёт'::character varying, 'Незачёт'::character varying])::text[]))),
    CONSTRAINT attestations_a_semester_check CHECK ((a_semester >= 1))
);


ALTER TABLE public.attestations OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE attestations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.attestations IS 'Аттестация';


--
-- TOC entry 222 (class 1259 OID 16463)
-- Name: auditoriums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auditoriums (
    a_id integer NOT NULL,
    a_site_name character varying(50) NOT NULL,
    a_type character varying(50) NOT NULL,
    a_number integer NOT NULL,
    CONSTRAINT auditoriums_a_number_check CHECK ((a_number >= 0))
);


ALTER TABLE public.auditoriums OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE auditoriums; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.auditoriums IS 'Аудитории';


--
-- TOC entry 224 (class 1259 OID 16488)
-- Name: curricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curricula (
    c_code integer NOT NULL,
    c_educational_program_code integer NOT NULL,
    c_admission_year date NOT NULL
);


ALTER TABLE public.curricula OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE curricula; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.curricula IS 'Учебные планы';


--
-- TOC entry 220 (class 1259 OID 16453)
-- Name: directions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directions (
    d_code integer NOT NULL,
    d_name character varying(50) NOT NULL,
    d_qualification character varying(100) NOT NULL
);


ALTER TABLE public.directions OWNER TO postgres;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE directions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.directions IS 'Направления';


--
-- TOC entry 219 (class 1259 OID 16448)
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplines (
    d_code integer NOT NULL,
    d_name character varying(50) NOT NULL,
    d_hours integer NOT NULL,
    d_lecture_hours integer NOT NULL,
    d_practical_hours integer NOT NULL,
    d_laboratory_hours integer NOT NULL,
    CONSTRAINT disciplines_check CHECK ((((d_lecture_hours + d_practical_hours) + d_laboratory_hours) <= d_hours))
);


ALTER TABLE public.disciplines OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE disciplines; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.disciplines IS 'Дисциплины';


--
-- TOC entry 228 (class 1259 OID 16548)
-- Name: disciplines_in_curricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplines_in_curricula (
    dic_code integer NOT NULL,
    dic_discipline_code integer NOT NULL,
    dic_curriculum_code integer NOT NULL,
    dic_semester integer NOT NULL,
    CONSTRAINT disciplines_in_curricula_dic_semester_check CHECK ((dic_semester >= 1))
);


ALTER TABLE public.disciplines_in_curricula OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE disciplines_in_curricula; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.disciplines_in_curricula IS 'Дисциплины в учебных планах';


--
-- TOC entry 221 (class 1259 OID 16458)
-- Name: divisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divisions (
    d_code integer NOT NULL,
    d_name character varying(100) NOT NULL
);


ALTER TABLE public.divisions OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE divisions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.divisions IS 'Подразделения';


--
-- TOC entry 229 (class 1259 OID 16563)
-- Name: divisions_on_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divisions_on_sites (
    dos_site_name character varying(100) NOT NULL,
    dos_division_code integer NOT NULL
);


ALTER TABLE public.divisions_on_sites OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE divisions_on_sites; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.divisions_on_sites IS 'Подразделения на площадках';


--
-- TOC entry 223 (class 1259 OID 16473)
-- Name: educational_programmes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.educational_programmes (
    ep_code integer NOT NULL,
    ep_name character varying(100) NOT NULL,
    ep_division_code integer NOT NULL,
    ep_direction_code integer NOT NULL,
    ep_format character varying(50) NOT NULL,
    CONSTRAINT educational_programmes_ep_format_check CHECK (((ep_format)::text = ANY (ARRAY[('Очно'::character varying)::text, ('Очно-заочно'::character varying)::text, ('Заочно'::character varying)::text])))
);


ALTER TABLE public.educational_programmes OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE educational_programmes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.educational_programmes IS 'Образовательные программы';


--
-- TOC entry 226 (class 1259 OID 16508)
-- Name: scholarship_receipts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scholarship_receipts (
    sr_scholarship_id integer NOT NULL,
    sr_student_record_book integer NOT NULL,
    sr_date date NOT NULL,
    sr_sum integer NOT NULL,
    CONSTRAINT scholarship_receipts_sr_sum_check CHECK ((sr_sum >= 0))
);


ALTER TABLE public.scholarship_receipts OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE scholarship_receipts; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.scholarship_receipts IS 'Получение стипендии';


--
-- TOC entry 215 (class 1259 OID 16422)
-- Name: scholarships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scholarships (
    s_id integer NOT NULL,
    s_type character varying(100) NOT NULL,
    s_name character varying(100) NOT NULL
);


ALTER TABLE public.scholarships OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE scholarships; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.scholarships IS 'Стипендии';


--
-- TOC entry 231 (class 1259 OID 16598)
-- Name: session_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session_schedule (
    ss_study_group_code integer NOT NULL,
    ss_discipline_in_curriculum_code integer NOT NULL,
    ss_date date NOT NULL,
    ss_auditorium_id integer,
    ss_teacher_id integer NOT NULL
);


ALTER TABLE public.session_schedule OWNER TO postgres;

--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE session_schedule; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.session_schedule IS 'Расписание сессии';


--
-- TOC entry 217 (class 1259 OID 16438)
-- Name: sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sites (
    s_name character varying(100) NOT NULL,
    s_address character varying(100) NOT NULL
);


ALTER TABLE public.sites OWNER TO postgres;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE sites; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sites IS 'Площадки института';


--
-- TOC entry 216 (class 1259 OID 16433)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    s_record_book integer NOT NULL,
    s_first_name character varying(50) NOT NULL,
    s_last_name character varying(50) NOT NULL,
    s_patronymic character varying(50),
    s_course integer,
    CONSTRAINT students_s_course_check CHECK ((s_course >= 1))
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE students; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.students IS 'Студенты';


--
-- TOC entry 227 (class 1259 OID 16533)
-- Name: students_in_study_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_in_study_groups (
    sisg_student_record_book integer NOT NULL,
    sisg_study_group_code integer NOT NULL,
    sisg_from date NOT NULL,
    sisg_to date
);


ALTER TABLE public.students_in_study_groups OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE students_in_study_groups; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.students_in_study_groups IS 'Студенты в учебных группах';


--
-- TOC entry 225 (class 1259 OID 16498)
-- Name: study_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.study_groups (
    sg_code integer NOT NULL,
    sg_number character varying(50) NOT NULL,
    sg_curriculum_code integer NOT NULL,
    sg_from date NOT NULL,
    sg_to date
);


ALTER TABLE public.study_groups OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE study_groups; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.study_groups IS 'Учебные группы';


--
-- TOC entry 218 (class 1259 OID 16443)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    t_id integer NOT NULL,
    t_first_name character varying(50) NOT NULL,
    t_last_name character varying(50) NOT NULL,
    t_patronymic character varying(50),
    t_position character varying(100) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE teachers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.teachers IS 'Преподаватели';


--
-- TOC entry 4918 (class 0 OID 16578)
-- Dependencies: 230
-- Data for Name: attestations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attestations (a_discipline_in_curricula_code, a_date, a_student_record_book, a_attempt, a_semester, a_grade, a_teacher_id) FROM stdin;
4698	2022-01-01	516111	2	5	4	4
5243	2022-01-01	400419	1	5	5	1
7856	2022-01-01	381030	1	7	5	5
8925	2022-01-01	305531	1	6	5	3
4526	2022-01-01	124255	2	4	4	2
\.


--
-- TOC entry 4910 (class 0 OID 16463)
-- Dependencies: 222
-- Data for Name: auditoriums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auditoriums (a_id, a_site_name, a_type, a_number) FROM stdin;
5	Биржевая линия	Практическая	9466
4	Улица Чайковского	Лекционная	7508
3	Переулок Гривцова	Лабораторная	4473
2	Улица Ломоносова	Практическая	6601
1	Кронверкский проспект	Лекционная	7294
\.


--
-- TOC entry 4912 (class 0 OID 16488)
-- Dependencies: 224
-- Data for Name: curricula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curricula (c_code, c_educational_program_code, c_admission_year) FROM stdin;
5	120301	2017-01-01
4	100301	2016-01-01
3	90304	2016-01-01
2	90303	2015-01-01
1	90301	2015-01-01
\.


--
-- TOC entry 4908 (class 0 OID 16453)
-- Dependencies: 220
-- Data for Name: directions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directions (d_code, d_name, d_qualification) FROM stdin;
5	Науки о жизни	Бакалавриат
4	Инженерия	Бакалавриат
3	Экономика и инновации	Бакалавриат
2	Информационные технологии	Бакалавриат
1	Физика	Бакалавриат
\.


--
-- TOC entry 4907 (class 0 OID 16448)
-- Dependencies: 219
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplines (d_code, d_name, d_hours, d_lecture_hours, d_practical_hours, d_laboratory_hours) FROM stdin;
30791	 Общая физика	216	64	32	32
21235	Программирование	288	96	16	32
30185	Математическая статистика	108	36	36	0
29867	Иностранный язык	108	0	64	0
33953	История российской науки и техники	144	24	24	0
\.


--
-- TOC entry 4916 (class 0 OID 16548)
-- Dependencies: 228
-- Data for Name: disciplines_in_curricula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplines_in_curricula (dic_code, dic_discipline_code, dic_curriculum_code, dic_semester) FROM stdin;
7856	30791	5	7
4698	21235	4	4
8925	30185	3	1
4526	29867	2	4
5243	33953	1	5
\.


--
-- TOC entry 4909 (class 0 OID 16458)
-- Dependencies: 221
-- Data for Name: divisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divisions (d_code, d_name) FROM stdin;
4	Институт лазерных технологий
3	Факультет безопасности информационных технологий
2	Факультет инфокоммуникационных технологий
1	Факультет программной инженерии и компьютерной техники
\.


--
-- TOC entry 4917 (class 0 OID 16563)
-- Dependencies: 229
-- Data for Name: divisions_on_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divisions_on_sites (dos_site_name, dos_division_code) FROM stdin;
Улица Чайковского	4
Переулок Гривцова	3
Улица Ломоносова	2
Кронверкский проспект	1
\.


--
-- TOC entry 4911 (class 0 OID 16473)
-- Dependencies: 223
-- Data for Name: educational_programmes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.educational_programmes (ep_code, ep_name, ep_division_code, ep_direction_code, ep_format) FROM stdin;
120301	Лазерные технологии	4	4	Очно
100301	Технологии защиты информации	3	2	Очно
90304	Компьютерные технологии в дизайне	1	2	Очно
90303	Мобильные и сетевые технологии	2	2	Очно
90301	Компьютерные системы и технологии	1	2	Очно
\.


--
-- TOC entry 4914 (class 0 OID 16508)
-- Dependencies: 226
-- Data for Name: scholarship_receipts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scholarship_receipts (sr_scholarship_id, sr_student_record_book, sr_date, sr_sum) FROM stdin;
3	305531	2022-10-12	7000
2	124255	2022-10-11	4000
1	400419	2022-10-10	2000
\.


--
-- TOC entry 4903 (class 0 OID 16422)
-- Dependencies: 215
-- Data for Name: scholarships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scholarships (s_id, s_type, s_name) FROM stdin;
1	Государственная стипендия	Государственная академическая стипендия
5	Именная стипендия	Именная стипендия Правительства Санкт-Петербурга
4	Социальная стипендия	Материальная поддержка студентам и аспирантам
3	Социальная стипендия	Государственная социальная стипендия
2	Государственная стипендия	Повышенная государственная академическая стипендия
6	Стипендия компании	Стипендия «Альфа-Шанс»
\.


--
-- TOC entry 4919 (class 0 OID 16598)
-- Dependencies: 231
-- Data for Name: session_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session_schedule (ss_study_group_code, ss_discipline_in_curriculum_code, ss_date, ss_auditorium_id, ss_teacher_id) FROM stdin;
3	8925	2022-01-01	3	3
2	4526	2022-01-01	2	2
1	5243	2022-01-01	1	1
\.


--
-- TOC entry 4905 (class 0 OID 16438)
-- Dependencies: 217
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sites (s_name, s_address) FROM stdin;
Кронверкский проспект	197101, г. Санкт-Петербург, Кронверкский проспект, д. 49
Биржевая линия	199034, г. Санкт-Петербург, Биржевая линия, д. 14-16, лит. А
Улица Чайковского	191187, г. Санкт-Петербург, улица Чайковского, д. 11/2, лит. А
Переулок Гривцова	190031, г. Санкт-Петербург, переулок Гривцова, д. 14-16, лит. А
Улица Ломоносова	191002, г. Санкт-Петербург, улица Ломоносова, д. 9
\.


--
-- TOC entry 4904 (class 0 OID 16433)
-- Dependencies: 216
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (s_record_book, s_first_name, s_last_name, s_patronymic, s_course) FROM stdin;
534421	Пётр	Смирнов	Алексеевич	4
762153	Виктория	Владимирова	Алексеевна	3
252108	Григорий	Косарев	Артурович	4
742645	Лука	Семенов	Дмитриевич	3
152145	Вероника	Петрова	Михайловна	2
381030	Арина	Круглова	Максимовна	1
516111	Моника	Егорова	Денисовна	4
305531	Павел	Сорокин	Иванович	3
124255	Александр	Михайлов	Сергеевич	2
400419	Иван	Чернышев	Алексеевич	1
\.


--
-- TOC entry 4915 (class 0 OID 16533)
-- Dependencies: 227
-- Data for Name: students_in_study_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_in_study_groups (sisg_student_record_book, sisg_study_group_code, sisg_from, sisg_to) FROM stdin;
534421	3	2021-01-01	2022-01-01
762153	3	2021-01-01	2022-01-01
252108	2	2021-01-01	2022-01-01
742645	1	2021-01-01	2022-01-01
152145	3	2021-01-01	2022-01-01
381030	2	2021-01-01	2022-01-01
516111	1	2021-01-01	2022-01-01
305531	3	2021-01-01	2022-01-01
124255	2	2021-01-01	2022-01-01
400419	1	2021-01-01	2022-01-01
\.


--
-- TOC entry 4913 (class 0 OID 16498)
-- Dependencies: 225
-- Data for Name: study_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.study_groups (sg_code, sg_number, sg_curriculum_code, sg_from, sg_to) FROM stdin;
3	C7659	3	2022-01-01	2023-01-01
2	B4423	2	2021-01-01	2022-01-01
1	A3610	1	2020-01-01	2021-01-01
\.


--
-- TOC entry 4906 (class 0 OID 16443)
-- Dependencies: 218
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (t_id, t_first_name, t_last_name, t_patronymic, t_position) FROM stdin;
5	Артём	Николаев	Артурович	Преподаватель физики
4	Олеся	Соболева	Матвеевна	Преподаватель истории
3	Владислав	Ермаков	Артёмович	Преподаватель английского языка
1	Амина	Касаткина	Адамовна	Преподаватель математики
2	Александра	Морозова	Фёдоровна	Преподаватель программирования
\.


--
-- TOC entry 4737 (class 2606 OID 16582)
-- Name: attestations attestations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attestations
    ADD CONSTRAINT attestations_pkey PRIMARY KEY (a_discipline_in_curricula_code, a_date);


--
-- TOC entry 4721 (class 2606 OID 16467)
-- Name: auditoriums auditoriums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoriums
    ADD CONSTRAINT auditoriums_pkey PRIMARY KEY (a_id);


--
-- TOC entry 4725 (class 2606 OID 16492)
-- Name: curricula curricula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curricula
    ADD CONSTRAINT curricula_pkey PRIMARY KEY (c_code);


--
-- TOC entry 4717 (class 2606 OID 16457)
-- Name: directions directions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directions
    ADD CONSTRAINT directions_pkey PRIMARY KEY (d_code);


--
-- TOC entry 4733 (class 2606 OID 16552)
-- Name: disciplines_in_curricula disciplines_in_curricula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines_in_curricula
    ADD CONSTRAINT disciplines_in_curricula_pkey PRIMARY KEY (dic_code);


--
-- TOC entry 4715 (class 2606 OID 16452)
-- Name: disciplines disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (d_code);


--
-- TOC entry 4735 (class 2606 OID 16567)
-- Name: divisions_on_sites divisions_on_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions_on_sites
    ADD CONSTRAINT divisions_on_sites_pkey PRIMARY KEY (dos_site_name, dos_division_code);


--
-- TOC entry 4719 (class 2606 OID 16462)
-- Name: divisions divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (d_code);


--
-- TOC entry 4723 (class 2606 OID 16477)
-- Name: educational_programmes educational_programmes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educational_programmes
    ADD CONSTRAINT educational_programmes_pkey PRIMARY KEY (ep_code);


--
-- TOC entry 4729 (class 2606 OID 16512)
-- Name: scholarship_receipts scholarship_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scholarship_receipts
    ADD CONSTRAINT scholarship_receipts_pkey PRIMARY KEY (sr_scholarship_id, sr_student_record_book, sr_date);


--
-- TOC entry 4707 (class 2606 OID 16426)
-- Name: scholarships scholarships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scholarships
    ADD CONSTRAINT scholarships_pkey PRIMARY KEY (s_id);


--
-- TOC entry 4739 (class 2606 OID 16602)
-- Name: session_schedule session_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_pkey PRIMARY KEY (ss_study_group_code, ss_discipline_in_curriculum_code, ss_date);


--
-- TOC entry 4711 (class 2606 OID 16442)
-- Name: sites sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (s_name);


--
-- TOC entry 4731 (class 2606 OID 16537)
-- Name: students_in_study_groups students_in_study_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_in_study_groups
    ADD CONSTRAINT students_in_study_groups_pkey PRIMARY KEY (sisg_student_record_book, sisg_study_group_code);


--
-- TOC entry 4709 (class 2606 OID 16437)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (s_record_book);


--
-- TOC entry 4727 (class 2606 OID 16502)
-- Name: study_groups study_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_groups
    ADD CONSTRAINT study_groups_pkey PRIMARY KEY (sg_code);


--
-- TOC entry 4713 (class 2606 OID 16447)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (t_id);


--
-- TOC entry 4753 (class 2606 OID 16583)
-- Name: attestations attestations_a_discipline_in_curricula_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attestations
    ADD CONSTRAINT attestations_a_discipline_in_curricula_code_fkey FOREIGN KEY (a_discipline_in_curricula_code) REFERENCES public.disciplines_in_curricula(dic_code);


--
-- TOC entry 4754 (class 2606 OID 16588)
-- Name: attestations attestations_a_student_record_book_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attestations
    ADD CONSTRAINT attestations_a_student_record_book_fkey FOREIGN KEY (a_student_record_book) REFERENCES public.students(s_record_book);


--
-- TOC entry 4755 (class 2606 OID 16593)
-- Name: attestations attestations_a_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attestations
    ADD CONSTRAINT attestations_a_teacher_id_fkey FOREIGN KEY (a_teacher_id) REFERENCES public.teachers(t_id);


--
-- TOC entry 4740 (class 2606 OID 16468)
-- Name: auditoriums auditoriums_a_site_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoriums
    ADD CONSTRAINT auditoriums_a_site_name_fkey FOREIGN KEY (a_site_name) REFERENCES public.sites(s_name);


--
-- TOC entry 4743 (class 2606 OID 16493)
-- Name: curricula curricula_c_educational_program_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curricula
    ADD CONSTRAINT curricula_c_educational_program_code_fkey FOREIGN KEY (c_educational_program_code) REFERENCES public.educational_programmes(ep_code);


--
-- TOC entry 4749 (class 2606 OID 16558)
-- Name: disciplines_in_curricula disciplines_in_curricula_dic_curriculum_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines_in_curricula
    ADD CONSTRAINT disciplines_in_curricula_dic_curriculum_code_fkey FOREIGN KEY (dic_curriculum_code) REFERENCES public.curricula(c_code);


--
-- TOC entry 4750 (class 2606 OID 16553)
-- Name: disciplines_in_curricula disciplines_in_curricula_dic_discipline_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines_in_curricula
    ADD CONSTRAINT disciplines_in_curricula_dic_discipline_code_fkey FOREIGN KEY (dic_discipline_code) REFERENCES public.disciplines(d_code);


--
-- TOC entry 4751 (class 2606 OID 16573)
-- Name: divisions_on_sites divisions_on_sites_dos_division_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions_on_sites
    ADD CONSTRAINT divisions_on_sites_dos_division_code_fkey FOREIGN KEY (dos_division_code) REFERENCES public.divisions(d_code);


--
-- TOC entry 4752 (class 2606 OID 16568)
-- Name: divisions_on_sites divisions_on_sites_dos_site_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions_on_sites
    ADD CONSTRAINT divisions_on_sites_dos_site_name_fkey FOREIGN KEY (dos_site_name) REFERENCES public.sites(s_name);


--
-- TOC entry 4741 (class 2606 OID 16483)
-- Name: educational_programmes educational_programmes_ep_direction_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educational_programmes
    ADD CONSTRAINT educational_programmes_ep_direction_code_fkey FOREIGN KEY (ep_direction_code) REFERENCES public.directions(d_code);


--
-- TOC entry 4742 (class 2606 OID 16478)
-- Name: educational_programmes educational_programmes_ep_division_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educational_programmes
    ADD CONSTRAINT educational_programmes_ep_division_code_fkey FOREIGN KEY (ep_division_code) REFERENCES public.divisions(d_code);


--
-- TOC entry 4745 (class 2606 OID 16513)
-- Name: scholarship_receipts scholarship_receipts_sr_scholarship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scholarship_receipts
    ADD CONSTRAINT scholarship_receipts_sr_scholarship_id_fkey FOREIGN KEY (sr_scholarship_id) REFERENCES public.scholarships(s_id);


--
-- TOC entry 4746 (class 2606 OID 16518)
-- Name: scholarship_receipts scholarship_receipts_sr_student_record_book_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scholarship_receipts
    ADD CONSTRAINT scholarship_receipts_sr_student_record_book_fkey FOREIGN KEY (sr_student_record_book) REFERENCES public.students(s_record_book);


--
-- TOC entry 4756 (class 2606 OID 16613)
-- Name: session_schedule session_schedule_ss_auditorium_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_ss_auditorium_id_fkey FOREIGN KEY (ss_auditorium_id) REFERENCES public.auditoriums(a_id);


--
-- TOC entry 4757 (class 2606 OID 16608)
-- Name: session_schedule session_schedule_ss_discipline_in_curriculum_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_ss_discipline_in_curriculum_code_fkey FOREIGN KEY (ss_discipline_in_curriculum_code) REFERENCES public.disciplines_in_curricula(dic_code);


--
-- TOC entry 4758 (class 2606 OID 16603)
-- Name: session_schedule session_schedule_ss_study_group_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_ss_study_group_code_fkey FOREIGN KEY (ss_study_group_code) REFERENCES public.study_groups(sg_code);


--
-- TOC entry 4759 (class 2606 OID 16618)
-- Name: session_schedule session_schedule_ss_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_ss_teacher_id_fkey FOREIGN KEY (ss_teacher_id) REFERENCES public.teachers(t_id);


--
-- TOC entry 4747 (class 2606 OID 16538)
-- Name: students_in_study_groups students_in_study_groups_sisg_student_record_book_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_in_study_groups
    ADD CONSTRAINT students_in_study_groups_sisg_student_record_book_fkey FOREIGN KEY (sisg_student_record_book) REFERENCES public.students(s_record_book);


--
-- TOC entry 4748 (class 2606 OID 16543)
-- Name: students_in_study_groups students_in_study_groups_sisg_study_group_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_in_study_groups
    ADD CONSTRAINT students_in_study_groups_sisg_study_group_code_fkey FOREIGN KEY (sisg_study_group_code) REFERENCES public.study_groups(sg_code);


--
-- TOC entry 4744 (class 2606 OID 16503)
-- Name: study_groups study_groups_sg_curriculum_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_groups
    ADD CONSTRAINT study_groups_sg_curriculum_code_fkey FOREIGN KEY (sg_curriculum_code) REFERENCES public.curricula(c_code);


-- Completed on 2023-10-26 19:02:20

--
-- PostgreSQL database dump complete
--
