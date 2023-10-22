--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-22 19:45:28

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
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: session; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA session;


ALTER SCHEMA session OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16434)
-- Name: assessments; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.assessments (
    assessment_id integer NOT NULL,
    type character(8) NOT NULL,
    date timestamp without time zone NOT NULL,
    attempt integer NOT NULL,
    discipline_id integer NOT NULL,
    teacher_id integer NOT NULL,
    group_id integer NOT NULL,
    place_id integer NOT NULL,
    classroom character(8) NOT NULL
);


ALTER TABLE session.assessments OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16539)
-- Name: assessments_assessment_id_seq; Type: SEQUENCE; Schema: session; Owner: postgres
--

ALTER TABLE session.assessments ALTER COLUMN assessment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.assessments_assessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16444)
-- Name: departments; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.departments (
    department_id integer NOT NULL,
    name character(128) NOT NULL
);


ALTER TABLE session.departments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16449)
-- Name: directions; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.directions (
    direction_id integer NOT NULL,
    name character(128) NOT NULL,
    department_ids character(128)[] NOT NULL
);


ALTER TABLE session.directions OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16417)
-- Name: disciplines; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.disciplines (
    discipline_id integer NOT NULL,
    name character(128) NOT NULL,
    program_ids character(1)[] NOT NULL
);


ALTER TABLE session.disciplines OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16540)
-- Name: disciplines_discipline_id_seq; Type: SEQUENCE; Schema: session; Owner: postgres
--

ALTER TABLE session.disciplines ALTER COLUMN discipline_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.disciplines_discipline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16439)
-- Name: grades; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.grades (
    grade_id integer NOT NULL,
    number character(8) NOT NULL,
    assessment_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE session.grades OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16541)
-- Name: grades_grade_id_seq; Type: SEQUENCE; Schema: session; Owner: postgres
--

ALTER TABLE session.grades ALTER COLUMN grade_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.grades_grade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16412)
-- Name: groups; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.groups (
    group_id integer NOT NULL,
    course integer NOT NULL,
    semester integer NOT NULL,
    program_id integer NOT NULL
);


ALTER TABLE session.groups OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16429)
-- Name: lessons; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.lessons (
    lesson_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    type character(16) NOT NULL,
    discipline_id integer NOT NULL,
    teacher_id integer NOT NULL,
    group_id integer NOT NULL,
    place_id integer NOT NULL,
    classroom character(8) NOT NULL
);


ALTER TABLE session.lessons OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16542)
-- Name: lessons_lesson_id_seq; Type: SEQUENCE; Schema: session; Owner: postgres
--

ALTER TABLE session.lessons ALTER COLUMN lesson_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.lessons_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16424)
-- Name: places; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.places (
    place_id integer NOT NULL,
    name character(128) NOT NULL,
    city character(32) NOT NULL,
    address character(256) NOT NULL
);


ALTER TABLE session.places OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16543)
-- Name: places_place_id_seq; Type: SEQUENCE; Schema: session; Owner: postgres
--

ALTER TABLE session.places ALTER COLUMN place_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.places_place_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16456)
-- Name: programs; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.programs (
    program_id integer NOT NULL,
    name character(128) NOT NULL,
    year integer NOT NULL,
    direction_id integer NOT NULL
);


ALTER TABLE session.programs OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16544)
-- Name: programs_program_id_seq; Type: SEQUENCE; Schema: session; Owner: postgres
--

ALTER TABLE session.programs ALTER COLUMN program_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.programs_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16399)
-- Name: students; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.students (
    student_id integer NOT NULL,
    name character(128) NOT NULL,
    scholarship integer DEFAULT 0 NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE session.students OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16405)
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: session; Owner: postgres
--

ALTER TABLE session.students ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16407)
-- Name: teachers; Type: TABLE; Schema: session; Owner: postgres
--

CREATE TABLE session.teachers (
    teacher_id integer NOT NULL,
    name character(128) NOT NULL,
    "position" character(32) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE session.teachers OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16406)
-- Name: teachers_teacher_id_seq; Type: SEQUENCE; Schema: session; Owner: postgres
--

ALTER TABLE session.teachers ALTER COLUMN teacher_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.teachers_teacher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4877 (class 0 OID 16434)
-- Dependencies: 224
-- Data for Name: assessments; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.assessments (assessment_id, type, date, attempt, discipline_id, teacher_id, group_id, place_id, classroom) FROM stdin;
4	test    	2023-12-25 19:00:00	1	1	2	1234	1	Зал     
6	difftest	2023-12-25 18:30:00	1	3	1	1234	2	213     
5	exam    	2023-02-28 19:00:00	2	2	1	3239	1	4248    
\.


--
-- TOC entry 4879 (class 0 OID 16444)
-- Dependencies: 226
-- Data for Name: departments; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.departments (department_id, name) FROM stdin;
102030	Факультет инфокоммуникационных технологий                                                                                       
111111	Факультет систем управления и робототехники                                                                                     
123456	Факультет цифровых трансформаций                                                                                                
\.


--
-- TOC entry 4880 (class 0 OID 16449)
-- Dependencies: 227
-- Data for Name: directions; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.directions (direction_id, name, department_ids) FROM stdin;
903030	Мобильные и сетевые технологии                                                                                                  	{"102030                                                                                                                          ","123456                                                                                                                          "}
103020	Прикладная математика и информатика                                                                                             	{"111111                                                                                                                          ","123456                                                                                                                          "}
\.


--
-- TOC entry 4874 (class 0 OID 16417)
-- Dependencies: 221
-- Data for Name: disciplines; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.disciplines (discipline_id, name, program_ids) FROM stdin;
1	Физическая культура                                                                                                             	{2,3}
2	Математика                                                                                                                      	{3}
3	Базы данных                                                                                                                     	{2}
\.


--
-- TOC entry 4878 (class 0 OID 16439)
-- Dependencies: 225
-- Data for Name: grades; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.grades (grade_id, number, assessment_id, student_id) FROM stdin;
2	A       	5	4
3	C       	5	5
\.


--
-- TOC entry 4873 (class 0 OID 16412)
-- Dependencies: 220
-- Data for Name: groups; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.groups (group_id, course, semester, program_id) FROM stdin;
3239	2	1	2
1234	4	2	3
\.


--
-- TOC entry 4876 (class 0 OID 16429)
-- Dependencies: 223
-- Data for Name: lessons; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.lessons (lesson_id, start_time, end_time, type, discipline_id, teacher_id, group_id, place_id, classroom) FROM stdin;
2	2023-10-23 15:20:00	2023-10-23 16:50:00	laboratory      	3	1	3239	3	424     
3	2023-10-23 17:00:00	2023-10-23 18:30:00	laboratory      	3	1	3239	3	424     
4	2023-10-23 11:40:00	2023-10-23 13:10:00	practice        	1	2	1234	1	Зал     
\.


--
-- TOC entry 4875 (class 0 OID 16424)
-- Dependencies: 222
-- Data for Name: places; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.places (place_id, name, city, address) FROM stdin;
1	Корпус на Ломоносова                                                                                                            	Санкт-Петербург                 	ул. Ломоносова, д. 9                                                                                                                                                                                                                                            
2	Корпус на Кронверкском                                                                                                          	Санкт-Петербург                 	пр. Кронверкский, д. 49                                                                                                                                                                                                                                         
3	Корпус на Биржевой                                                                                                              	Санкт-Петербург                 	ул. Биржевая, д. 14                                                                                                                                                                                                                                             
\.


--
-- TOC entry 4881 (class 0 OID 16456)
-- Dependencies: 228
-- Data for Name: programs; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.programs (program_id, name, year, direction_id) FROM stdin;
2	Учплан 2023 для МиСТ                                                                                                            	2023	903030
3	Учплан 2023 для ПМиИ                                                                                                            	2023	103020
\.


--
-- TOC entry 4869 (class 0 OID 16399)
-- Dependencies: 216
-- Data for Name: students; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.students (student_id, name, scholarship, group_id) FROM stdin;
5	Петров Петр Петрович                                                                                                            	0	1234
4	Ребров Сергей Андреевич                                                                                                         	99999	3239
6	Иванов Иван Иванович                                                                                                            	12345	1234
\.


--
-- TOC entry 4872 (class 0 OID 16407)
-- Dependencies: 219
-- Data for Name: teachers; Type: TABLE DATA; Schema: session; Owner: postgres
--

COPY session.teachers (teacher_id, name, "position", department_id) FROM stdin;
1	Карпов Анатолий Андреевич                                                                                                       	ректор                          	102030
2	Стоянов Алексей Петрович                                                                                                        	преподаватель                   	111111
\.


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 229
-- Name: assessments_assessment_id_seq; Type: SEQUENCE SET; Schema: session; Owner: postgres
--

SELECT pg_catalog.setval('session.assessments_assessment_id_seq', 6, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 230
-- Name: disciplines_discipline_id_seq; Type: SEQUENCE SET; Schema: session; Owner: postgres
--

SELECT pg_catalog.setval('session.disciplines_discipline_id_seq', 3, true);


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 231
-- Name: grades_grade_id_seq; Type: SEQUENCE SET; Schema: session; Owner: postgres
--

SELECT pg_catalog.setval('session.grades_grade_id_seq', 3, true);


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 232
-- Name: lessons_lesson_id_seq; Type: SEQUENCE SET; Schema: session; Owner: postgres
--

SELECT pg_catalog.setval('session.lessons_lesson_id_seq', 4, true);


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 233
-- Name: places_place_id_seq; Type: SEQUENCE SET; Schema: session; Owner: postgres
--

SELECT pg_catalog.setval('session.places_place_id_seq', 3, true);


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 234
-- Name: programs_program_id_seq; Type: SEQUENCE SET; Schema: session; Owner: postgres
--

SELECT pg_catalog.setval('session.programs_program_id_seq', 3, true);


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 217
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: session; Owner: postgres
--

SELECT pg_catalog.setval('session.students_student_id_seq', 6, true);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 218
-- Name: teachers_teacher_id_seq; Type: SEQUENCE SET; Schema: session; Owner: postgres
--

SELECT pg_catalog.setval('session.teachers_teacher_id_seq', 2, true);


--
-- TOC entry 4703 (class 2606 OID 16438)
-- Name: assessments assessments_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT assessments_pkey PRIMARY KEY (assessment_id);


--
-- TOC entry 4687 (class 2606 OID 16462)
-- Name: assessments ch_attempt; Type: CHECK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE session.assessments
    ADD CONSTRAINT ch_attempt CHECK (((attempt >= 1) AND (attempt <= 3))) NOT VALID;


--
-- TOC entry 4683 (class 2606 OID 16496)
-- Name: groups ch_course; Type: CHECK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE session.groups
    ADD CONSTRAINT ch_course CHECK (((course >= 1) AND (course <= 6))) NOT VALID;


--
-- TOC entry 4685 (class 2606 OID 16502)
-- Name: lessons ch_end_time; Type: CHECK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE session.lessons
    ADD CONSTRAINT ch_end_time CHECK ((end_time > start_time)) NOT VALID;


--
-- TOC entry 4689 (class 2606 OID 16483)
-- Name: grades ch_number; Type: CHECK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE session.grades
    ADD CONSTRAINT ch_number CHECK ((number = ANY (ARRAY['A'::bpchar, 'B'::bpchar, 'C'::bpchar, 'D'::bpchar, 'E'::bpchar, 'F'::bpchar]))) NOT VALID;


--
-- TOC entry 4684 (class 2606 OID 16495)
-- Name: groups ch_semester; Type: CHECK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE session.groups
    ADD CONSTRAINT ch_semester CHECK (((semester >= 1) AND (semester <= 12))) NOT VALID;


--
-- TOC entry 4688 (class 2606 OID 16461)
-- Name: assessments ch_type; Type: CHECK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE session.assessments
    ADD CONSTRAINT ch_type CHECK ((type = ANY (ARRAY['exam'::bpchar, 'test'::bpchar, 'difftest'::bpchar]))) NOT VALID;


--
-- TOC entry 4686 (class 2606 OID 16503)
-- Name: lessons ch_type; Type: CHECK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE session.lessons
    ADD CONSTRAINT ch_type CHECK ((type = ANY (ARRAY['practice'::bpchar, 'laboratory'::bpchar, 'lecture'::bpchar]))) NOT VALID;


--
-- TOC entry 4707 (class 2606 OID 16448)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 4709 (class 2606 OID 16455)
-- Name: directions directions_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.directions
    ADD CONSTRAINT directions_pkey PRIMARY KEY (direction_id);


--
-- TOC entry 4697 (class 2606 OID 16423)
-- Name: disciplines disciplines_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (discipline_id);


--
-- TOC entry 4705 (class 2606 OID 16443)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (grade_id);


--
-- TOC entry 4695 (class 2606 OID 16416)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);


--
-- TOC entry 4701 (class 2606 OID 16433)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (lesson_id);


--
-- TOC entry 4699 (class 2606 OID 16428)
-- Name: places places_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (place_id);


--
-- TOC entry 4711 (class 2606 OID 16460)
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (program_id);


--
-- TOC entry 4691 (class 2606 OID 16404)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4693 (class 2606 OID 16411)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id);


--
-- TOC entry 4723 (class 2606 OID 16484)
-- Name: grades fk_assessment; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.grades
    ADD CONSTRAINT fk_assessment FOREIGN KEY (assessment_id) REFERENCES session.assessments(assessment_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4713 (class 2606 OID 16534)
-- Name: teachers fk_department; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.teachers
    ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES session.departments(department_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4725 (class 2606 OID 16524)
-- Name: programs fk_direction; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.programs
    ADD CONSTRAINT fk_direction FOREIGN KEY (direction_id) REFERENCES session.directions(direction_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4719 (class 2606 OID 16463)
-- Name: assessments fk_discipline; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT fk_discipline FOREIGN KEY (discipline_id) REFERENCES session.disciplines(discipline_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4715 (class 2606 OID 16504)
-- Name: lessons fk_discipline; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT fk_discipline FOREIGN KEY (discipline_id) REFERENCES session.disciplines(discipline_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4720 (class 2606 OID 16473)
-- Name: assessments fk_group; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES session.groups(group_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4716 (class 2606 OID 16514)
-- Name: lessons fk_group; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES session.groups(group_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4712 (class 2606 OID 16529)
-- Name: students fk_group; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.students
    ADD CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES session.groups(group_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4721 (class 2606 OID 16478)
-- Name: assessments fk_place; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT fk_place FOREIGN KEY (place_id) REFERENCES session.places(place_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4717 (class 2606 OID 16519)
-- Name: lessons fk_place; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT fk_place FOREIGN KEY (place_id) REFERENCES session.places(place_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4714 (class 2606 OID 16497)
-- Name: groups fk_program; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.groups
    ADD CONSTRAINT fk_program FOREIGN KEY (program_id) REFERENCES session.programs(program_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4724 (class 2606 OID 16489)
-- Name: grades fk_student; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.grades
    ADD CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES session.students(student_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4722 (class 2606 OID 16468)
-- Name: assessments fk_teacher; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES session.teachers(teacher_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4718 (class 2606 OID 16509)
-- Name: lessons fk_teacher; Type: FK CONSTRAINT; Schema: session; Owner: postgres
--

ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES session.teachers(teacher_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA session; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA session FROM pg_database_owner;
REVOKE USAGE ON SCHEMA session FROM PUBLIC;
GRANT ALL ON SCHEMA session TO postgres;


-- Completed on 2023-10-22 19:45:28

--
-- PostgreSQL database dump complete
--

