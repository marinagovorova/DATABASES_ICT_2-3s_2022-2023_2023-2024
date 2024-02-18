--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.4

-- Started on 2023-11-06 18:22:15 UTC

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
-- TOC entry 859 (class 1247 OID 16386)
-- Name: attestation_type; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.attestation_type AS ENUM (
    'дифференциальный',
    'зачёт',
    'экзамен'
);


ALTER TYPE public.attestation_type OWNER TO root;

--
-- TOC entry 874 (class 1247 OID 16434)
-- Name: auditory_type; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.auditory_type AS ENUM (
    'малая',
    'лекционная'
);


ALTER TYPE public.auditory_type OWNER TO root;

--
-- TOC entry 871 (class 1247 OID 16426)
-- Name: class_type; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.class_type AS ENUM (
    'лабораторная',
    'практика',
    'лекция'
);


ALTER TYPE public.class_type OWNER TO root;

--
-- TOC entry 910 (class 1247 OID 16484)
-- Name: contacts256; Type: DOMAIN; Schema: public; Owner: root
--

CREATE DOMAIN public.contacts256 AS character varying(256)
	CONSTRAINT contacts256_check CHECK (((VALUE)::text ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s+-@.,]+$'::text));


ALTER DOMAIN public.contacts256 OWNER TO root;

--
-- TOC entry 865 (class 1247 OID 16404)
-- Name: education_level; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.education_level AS ENUM (
    'бакалавр',
    'магистр',
    'аспирант',
    'СПО'
);


ALTER TYPE public.education_level OWNER TO root;

--
-- TOC entry 886 (class 1247 OID 16466)
-- Name: group_number; Type: DOMAIN; Schema: public; Owner: root
--

CREATE DOMAIN public.group_number AS character varying(8)
	CONSTRAINT group_number_check CHECK (((VALUE)::text ~ '^[a-zA-Z0-9]+$'::text));


ALTER DOMAIN public.group_number OWNER TO root;

--
-- TOC entry 868 (class 1247 OID 16414)
-- Name: job_title; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.job_title AS ENUM (
    'преподаватель',
    'старший преподаватель',
    'доцент',
    'лаборант',
    'ассистент'
);


ALTER TYPE public.job_title OWNER TO root;

--
-- TOC entry 894 (class 1247 OID 16472)
-- Name: lat_cyr_num_varchar16; Type: DOMAIN; Schema: public; Owner: root
--

CREATE DOMAIN public.lat_cyr_num_varchar16 AS character varying(16)
	CONSTRAINT lat_cyr_num_varchar16_check CHECK (((VALUE)::text ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$'::text));


ALTER DOMAIN public.lat_cyr_num_varchar16 OWNER TO root;

--
-- TOC entry 906 (class 1247 OID 16481)
-- Name: lat_cyr_num_varchar256; Type: DOMAIN; Schema: public; Owner: root
--

CREATE DOMAIN public.lat_cyr_num_varchar256 AS character varying(256)
	CONSTRAINT lat_cyr_num_varchar256_check CHECK (((VALUE)::text ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$'::text));


ALTER DOMAIN public.lat_cyr_num_varchar256 OWNER TO root;

--
-- TOC entry 898 (class 1247 OID 16475)
-- Name: lat_cyr_num_varchar32; Type: DOMAIN; Schema: public; Owner: root
--

CREATE DOMAIN public.lat_cyr_num_varchar32 AS character varying(32)
	CONSTRAINT lat_cyr_num_varchar32_check CHECK (((VALUE)::text ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$'::text));


ALTER DOMAIN public.lat_cyr_num_varchar32 OWNER TO root;

--
-- TOC entry 902 (class 1247 OID 16478)
-- Name: lat_cyr_num_varchar64; Type: DOMAIN; Schema: public; Owner: root
--

CREATE DOMAIN public.lat_cyr_num_varchar64 AS character varying(64)
	CONSTRAINT lat_cyr_num_varchar64_check CHECK (((VALUE)::text ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$'::text));


ALTER DOMAIN public.lat_cyr_num_varchar64 OWNER TO root;

--
-- TOC entry 890 (class 1247 OID 16469)
-- Name: lat_cyr_num_varchar8; Type: DOMAIN; Schema: public; Owner: root
--

CREATE DOMAIN public.lat_cyr_num_varchar8 AS character varying(8)
	CONSTRAINT lat_cyr_num_varchar8_check CHECK (((VALUE)::text ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$'::text));


ALTER DOMAIN public.lat_cyr_num_varchar8 OWNER TO root;

--
-- TOC entry 883 (class 1247 OID 16452)
-- Name: mark; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.mark AS ENUM (
    '2',
    '3',
    '4',
    '5',
    'yes',
    'no'
);


ALTER TYPE public.mark OWNER TO root;

--
-- TOC entry 880 (class 1247 OID 16446)
-- Name: program_type; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.program_type AS ENUM (
    'ДПО',
    'основная'
);


ALTER TYPE public.program_type OWNER TO root;

--
-- TOC entry 862 (class 1247 OID 16394)
-- Name: qualification; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.qualification AS ENUM (
    'бакалавр',
    'магистр',
    'техник',
    'преподаватель - исследователь'
);


ALTER TYPE public.qualification OWNER TO root;

--
-- TOC entry 877 (class 1247 OID 16440)
-- Name: student_status; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.student_status AS ENUM (
    'учится',
    'отчислен'
);


ALTER TYPE public.student_status OWNER TO root;

--
-- TOC entry 247 (class 1255 OID 16491)
-- Name: check_class(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.check_class() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    auditory_type AUDITORY_TYPE;
    discipline_discipline_id UUID;
    group_start_date DATE;
    groups_with_late_start INT;
    classroom_capacity INT;
    total_students INT;
BEGIN

SELECT type INTO auditory_type
FROM classroom
WHERE classroom_id = NEW.classroom_id;

IF auditory_type <> 'лекционная' and NEW.type = 'лекция' THEN
   RAISE EXCEPTION 'Classroom type is wrong for this type of class.';
END IF;

SELECT discipline_id INTO discipline_discipline_id
FROM programm_element
WHERE programm_element_id = (
    SELECT programm_element_id
    FROM course
    WHERE course_id = NEW.course_id
);
    
IF NOT EXISTS (SELECT 1 FROM teaching_permit WHERE discipline_id = discipline_discipline_id AND (NEW.type <> 'лекция' OR is_lecture_allowed = TRUE) LIMIT 1) THEN
    RAISE EXCEPTION 'Selected teacher cant be assigned to this class.';
END IF;

SELECT COUNT(*) INTO groups_with_late_start
FROM "group"
WHERE group_id IN (
    SELECT group_id
    FROM course_participant
    WHERE course_id = NEW.course_id
) AND start_date > NEW.date;

IF groups_with_late_start <> 0 THEN
   RAISE EXCEPTION 'Some of groups has start date after class date.';
END IF;

SELECT capacity INTO classroom_capacity
FROM classroom
WHERE classroom_id = NEW.classroom_id;

SELECT COUNT(*) INTO total_students
FROM student
WHERE group_id IN (
    SELECT group_id
    FROM course_participant
    WHERE course_id = NEW.course_id AND status_in_group = 'учится'
);

IF classroom_capacity < total_students THEN
    RAISE EXCEPTION 'Classroom is too small to fit all students.';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_class() OWNER TO root;

--
-- TOC entry 231 (class 1255 OID 16486)
-- Name: check_group_dates(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.check_group_dates() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    enrollment_start_date DATE;
    enrollment_end_date DATE;
BEGIN
SELECT start_date, end_date INTO enrollment_start_date, enrollment_end_date
FROM enrollment
WHERE enrollment_id = NEW.enrollment_id;

IF NEW.start_date < enrollment_start_date THEN
        RAISE EXCEPTION 'Group start date must be on or after the enrollment start date.';
END IF;
IF NEW.end_date > enrollment_end_date THEN
        RAISE EXCEPTION 'Group end date must be on or before the enrollment end date.';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_group_dates() OWNER TO root;

--
-- TOC entry 244 (class 1255 OID 16488)
-- Name: check_mark(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.check_mark() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    programm_discipline_id UUID;
    discipline_attestation_type ATTESTATION_TYPE;
BEGIN
SELECT discipline_id INTO programm_discipline_id
FROM programm_element
WHERE programm_element_id = NEW.programm_element_id;

SELECT attestation_type INTO discipline_attestation_type
FROM academic_discipline
WHERE discipline_id = programm_discipline_id;

IF NEW.mark IS NULL THEN
   RETURN NEW;
END IF;
IF discipline_attestation_type = 'зачёт' AND NEW.mark NOT IN ('yes', 'no') THEN
   RAISE EXCEPTION 'If attestation type is зачёт then allowed marks are only yes and no';
END IF;
IF discipline_attestation_type IN ('дифференциальный','экзамен') AND NEW.mark NOT IN ('2', '3', '4', '5') THEN
   RAISE EXCEPTION 'If attestation type is дифференциальный or экзамен then allowed marks are only 2, 3, 4, 5';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_mark() OWNER TO root;

--
-- TOC entry 246 (class 1255 OID 16490)
-- Name: check_result_attempts(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.check_result_attempts() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
IF NEW.attempt = 0 THEN
    RETURN NEW;
END IF;

IF EXISTS (SELECT 1 FROM result WHERE programm_element_id = NEW.programm_element_id AND student_id = NEW.student_id AND attempt = NEW.attempt - 1) THEN
    RETURN NEW;
END IF;

RAISE EXCEPTION 'Previous attempt is not exists.';
END;
$$;


ALTER FUNCTION public.check_result_attempts() OWNER TO root;

--
-- TOC entry 245 (class 1255 OID 16489)
-- Name: check_result_date(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.check_result_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    student_start_date DATE;
BEGIN
SELECT start_date INTO student_start_date
FROM student
WHERE student_id = NEW.student_id;

IF NEW.date < student_start_date THEN
        RAISE EXCEPTION 'Result date must be on or after the student start date.';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_result_date() OWNER TO root;

--
-- TOC entry 232 (class 1255 OID 16487)
-- Name: check_student_dates(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.check_student_dates() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    group_start_date DATE;
    group_end_date DATE;
BEGIN
SELECT start_date, end_date INTO group_start_date, group_end_date
FROM enrollment
WHERE enrollment_id = NEW.enrollment_id;

IF NEW.start_date < group_start_date THEN
        RAISE EXCEPTION 'Student start date must be on or after the group start date.';
END IF;
IF NEW.end_date > group_end_date THEN
        RAISE EXCEPTION 'Student end date must be on or before the group end date.';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_student_dates() OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16492)
-- Name: academic_discipline; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.academic_discipline (
    discipline_id uuid NOT NULL,
    name public.lat_cyr_num_varchar32 NOT NULL,
    practical integer NOT NULL,
    lectures_labs integer,
    total_duration integer NOT NULL,
    attestation_type public.attestation_type NOT NULL,
    CONSTRAINT academic_discipline_check CHECK ((total_duration > (practical + lectures_labs))),
    CONSTRAINT academic_discipline_lectures_labs_check CHECK ((lectures_labs > 0)),
    CONSTRAINT academic_discipline_practical_check CHECK ((practical > 0))
);


ALTER TABLE public.academic_discipline OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 16658)
-- Name: building; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.building (
    building_id uuid NOT NULL,
    address public.lat_cyr_num_varchar64 NOT NULL
);


ALTER TABLE public.building OWNER TO root;

--
-- TOC entry 230 (class 1259 OID 16704)
-- Name: class; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.class (
    class_id uuid NOT NULL,
    course_id uuid NOT NULL,
    classroom_id uuid NOT NULL,
    teacher_id uuid NOT NULL,
    date date NOT NULL,
    classes_order_number integer NOT NULL,
    type public.class_type NOT NULL,
    CONSTRAINT class_classes_order_number_check CHECK (((classes_order_number >= 0) AND (classes_order_number < 10)))
);


ALTER TABLE public.class OWNER TO root;

--
-- TOC entry 227 (class 1259 OID 16665)
-- Name: classroom; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.classroom (
    classroom_id uuid NOT NULL,
    building_id uuid NOT NULL,
    number integer NOT NULL,
    type public.auditory_type NOT NULL,
    capacity integer NOT NULL,
    CONSTRAINT classroom_capacity_check CHECK ((capacity > 0)),
    CONSTRAINT classroom_number_check CHECK ((number >= 0))
);


ALTER TABLE public.classroom OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 16594)
-- Name: client; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client (
    client_id uuid NOT NULL,
    name public.lat_cyr_num_varchar64 NOT NULL,
    surname public.lat_cyr_num_varchar64 NOT NULL,
    patronymic public.lat_cyr_num_varchar64 NOT NULL,
    contacts public.contacts256 NOT NULL,
    passport_number public.lat_cyr_num_varchar32 NOT NULL,
    passport_serial public.lat_cyr_num_varchar32 NOT NULL,
    passport_issue_date date NOT NULL,
    passport_expiration_date date NOT NULL,
    CONSTRAINT client_check CHECK ((passport_expiration_date > passport_issue_date))
);


ALTER TABLE public.client OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 16679)
-- Name: course; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.course (
    course_id uuid NOT NULL,
    programm_element_id uuid NOT NULL
);


ALTER TABLE public.course OWNER TO root;

--
-- TOC entry 229 (class 1259 OID 16689)
-- Name: course_participant; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.course_participant (
    course_participant_id uuid NOT NULL,
    group_id uuid NOT NULL,
    course_id uuid NOT NULL
);


ALTER TABLE public.course_participant OWNER TO root;

--
-- TOC entry 217 (class 1259 OID 16527)
-- Name: education_programm; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.education_programm (
    programm_code public.lat_cyr_num_varchar16 NOT NULL,
    programm_type public.program_type NOT NULL,
    duration integer NOT NULL,
    specialty_code public.lat_cyr_num_varchar16 NOT NULL,
    CONSTRAINT education_programm_duration_check CHECK ((duration > 0))
);


ALTER TABLE public.education_programm OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 16540)
-- Name: enrollment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.enrollment (
    enrollment_id uuid NOT NULL,
    programm_code public.lat_cyr_num_varchar16 NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT enrollment_check CHECK ((end_date > start_date))
);


ALTER TABLE public.enrollment OWNER TO root;

--
-- TOC entry 223 (class 1259 OID 16604)
-- Name: group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."group" (
    group_id uuid NOT NULL,
    enrollment_id uuid NOT NULL,
    number public.group_number NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT group_check CHECK ((end_date > start_date))
);


ALTER TABLE public."group" OWNER TO root;

--
-- TOC entry 219 (class 1259 OID 16553)
-- Name: programm_element; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.programm_element (
    programm_element_id uuid NOT NULL,
    enrollment_id uuid NOT NULL,
    discipline_id uuid NOT NULL
);


ALTER TABLE public.programm_element OWNER TO root;

--
-- TOC entry 225 (class 1259 OID 16637)
-- Name: result; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.result (
    result_id uuid NOT NULL,
    student_id uuid NOT NULL,
    teacher_id uuid NOT NULL,
    programm_element_id uuid NOT NULL,
    date date,
    mark public.mark,
    attempt integer NOT NULL,
    CONSTRAINT result_attempt_check CHECK (((attempt >= 0) AND (attempt <= 3)))
);


ALTER TABLE public.result OWNER TO root;

--
-- TOC entry 216 (class 1259 OID 16513)
-- Name: specialty; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.specialty (
    code public.lat_cyr_num_varchar16 NOT NULL,
    qualification public.qualification NOT NULL,
    level public.education_level NOT NULL,
    name public.lat_cyr_num_varchar64 NOT NULL,
    subdivision_id uuid NOT NULL
);


ALTER TABLE public.specialty OWNER TO root;

--
-- TOC entry 224 (class 1259 OID 16618)
-- Name: student; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.student (
    student_id uuid NOT NULL,
    client_id uuid NOT NULL,
    group_id uuid NOT NULL,
    start_date date NOT NULL,
    finish_date date NOT NULL,
    status_in_group public.student_status NOT NULL,
    CONSTRAINT student_check CHECK ((finish_date > start_date))
);


ALTER TABLE public.student OWNER TO root;

--
-- TOC entry 215 (class 1259 OID 16504)
-- Name: subdivision; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.subdivision (
    subdivision_id uuid NOT NULL,
    name public.lat_cyr_num_varchar32 NOT NULL
);


ALTER TABLE public.subdivision OWNER TO root;

--
-- TOC entry 220 (class 1259 OID 16570)
-- Name: teacher; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.teacher (
    teacher_id uuid NOT NULL,
    name public.lat_cyr_num_varchar64 NOT NULL,
    surname public.lat_cyr_num_varchar64 NOT NULL,
    patronymic public.lat_cyr_num_varchar64 NOT NULL,
    job_title public.job_title NOT NULL
);


ALTER TABLE public.teacher OWNER TO root;

--
-- TOC entry 221 (class 1259 OID 16577)
-- Name: teaching_permit; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.teaching_permit (
    teaching_permit_id uuid NOT NULL,
    teacher_id uuid NOT NULL,
    discipline_id uuid NOT NULL,
    is_lecture_allowed boolean NOT NULL
);


ALTER TABLE public.teaching_permit OWNER TO root;

--
-- TOC entry 3558 (class 0 OID 16492)
-- Dependencies: 214
-- Data for Name: academic_discipline; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.academic_discipline (discipline_id, name, practical, lectures_labs, total_duration, attestation_type) VALUES ('a0b33a1c-fa29-49d2-ba4d-d7cd8030e315', 'Математичекий анализ', 20, 10, 60, 'экзамен');
INSERT INTO public.academic_discipline (discipline_id, name, practical, lectures_labs, total_duration, attestation_type) VALUES ('da1ab801-fbe0-42b1-a1b4-6a9c51d11a8f', 'Физика', 15, 15, 45, 'дифференциальный');
INSERT INTO public.academic_discipline (discipline_id, name, practical, lectures_labs, total_duration, attestation_type) VALUES ('34c49c8b-62d2-4c1d-b08e-9dceb895e93e', 'Химия', 18, 12, 50, 'зачёт');
INSERT INTO public.academic_discipline (discipline_id, name, practical, lectures_labs, total_duration, attestation_type) VALUES ('93a3e393-8c7b-427e-9a35-f15c4c96877a', 'Биология', 25, 5, 50, 'экзамен');
INSERT INTO public.academic_discipline (discipline_id, name, practical, lectures_labs, total_duration, attestation_type) VALUES ('0c2547df-cfdb-4b24-ab12-ce06d409867e', 'Информатика', 30, 20, 100, 'дифференциальный');


--
-- TOC entry 3570 (class 0 OID 16658)
-- Dependencies: 226
-- Data for Name: building; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.building (building_id, address) VALUES ('e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 'Кудыкина гора');
INSERT INTO public.building (building_id, address) VALUES ('db687dd1-d0b8-4a87-b0c1-31427d197ef3', 'Кудыкина гора 2');


--
-- TOC entry 3574 (class 0 OID 16704)
-- Dependencies: 230
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.class (class_id, course_id, classroom_id, teacher_id, date, classes_order_number, type) VALUES ('27a6318c-5abd-4b5a-8743-31df33c0838c', '1920d807-a833-4b73-9d5a-f0f9eaf1af1d', '4bd4ffe8-f48f-4375-b99c-191ee70e0bcd', '064f78ca-718e-4c20-9bf8-3abee87114ca', '2023-12-31', 0, 'лекция');
INSERT INTO public.class (class_id, course_id, classroom_id, teacher_id, date, classes_order_number, type) VALUES ('920aab7c-2319-4033-80dd-8b23bed5afc1', '0f442e4e-288a-4ca6-bfca-a09cc73803cd', '5293bd6e-bf24-48f2-be0c-cabce465df46', '17a5c7a6-fb30-4ff9-b4d5-63fd6c20183e', '2023-12-31', 1, 'лабораторная');


--
-- TOC entry 3571 (class 0 OID 16665)
-- Dependencies: 227
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('4bd4ffe8-f48f-4375-b99c-191ee70e0bcd', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 101, 'лекционная', 15);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('5c086288-5405-44a2-8d9e-d77a3eccd07a', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 102, 'лекционная', 5);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('b0edd76d-6c22-48ef-a67f-9264cfc35136', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 103, 'малая', 3);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('f61b1630-3d74-4ca6-a268-7cd1acdff2c2', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 104, 'малая', 3);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('58a8a07c-6f8c-4bea-9607-5c550d96a760', 'e4a6bdb7-bf93-43e3-b738-f3c2f46e6e52', 105, 'малая', 3);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('9df8d337-ec5a-4e49-872e-0e3cc0a0c01b', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 101, 'лекционная', 5);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('978e4cd8-5e50-4ea2-b2ca-fc5a7d7052d8', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 102, 'лекционная', 5);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('85122957-5ca5-4250-9469-76a6adcf0b14', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 103, 'малая', 30);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('5293bd6e-bf24-48f2-be0c-cabce465df46', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 104, 'малая', 3);
INSERT INTO public.classroom (classroom_id, building_id, number, type, capacity) VALUES ('96b7a61e-87be-4b76-b87c-519cf4b669ed', 'db687dd1-d0b8-4a87-b0c1-31427d197ef3', 105, 'малая', 3);


--
-- TOC entry 3566 (class 0 OID 16594)
-- Dependencies: 222
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('132259da-3ddb-4bae-8d01-39414d808ad7', 'Василий', 'Василевский', 'Васильевич', 'vasyapupkin@mail.ru +7894595495409', '683426', 'GF34', '2022-05-01', '2028-05-01');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('24fd3f29-ec14-4f51-bf76-2f9bf9181b67', 'Анна', 'Андреевна', 'Анатольевна', 'annushka@example.com +71234567890', '458796', 'AB12', '2019-06-15', '2029-06-15');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('3b25f691-ac4e-4d86-9ba3-f0b9fc2d6160', 'Игорь', 'Игнатов', 'Игоревич', 'igorek123@inbox.ru +79876543210', '987654', 'KH56', '2020-12-01', '2030-11-30');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('4acca545-ecb6-4aaf-8c34-bf3b1a3d38bc', 'Елена', 'Еленова', 'Евгеньевна', 'elenka@somemail.com +73451234567', '526874', 'XR22', '2021-07-23', '2031-07-22');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('5c6ee5d3-ee1a-4e9b-9e69-1a5e4c9b9e7d', 'Мария', 'Марьева', 'Михайловна', 'mariam@example.com +79011234567', '111222', 'XX01', '2021-01-15', '2031-01-14');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('6d7f68b0-5d3a-49f6-8eba-1a9e4c1c9f2e', 'Дмитрий', 'Дмитриев', 'Дмитриевич', 'dmitryd@example.com +79022345678', '222333', 'XX02', '2021-02-16', '2031-02-15');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('7e8f59c1-6f4b-48b9-9cba-2a0e5c2d9f3f', 'Ирина', 'Иванова', 'Игоревна', 'irinai@example.com +79033456789', '333444', 'XX03', '2021-03-17', '2031-03-16');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('18ab5bd9-9b31-4d3b-9d24-11e25cc9fefb', 'Сергей', 'Сергеев', 'Сергеевич', 'sergeys@example.com +79044567890', '444555', 'XX04', '2021-04-18', '2031-04-17');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('19bc6de0-ac42-4fb5-a5b5-21f26dc0fefc', 'Ольга', 'Ольгина', 'Олеговна', 'olgao@example.com +79055678901', '555666', 'XX05', '2021-05-19', '2031-05-18');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('20cd7ef1-bd53-4fc6-b6b6-31f37ec1f0fd', 'Александр', 'Александров', 'Александрович', 'alexandera@example.com +79066789012', '666777', 'XX06', '2021-06-20', '2031-06-19');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('8bb9d041-2d55-40d4-afee-1e8e5d2d9e8f', 'Надежда', 'Николаева', 'Николаевна', 'nadyan@example.com +79077890123', '777888', 'XX07', '2021-07-21', '2031-07-20');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('9cca6112-3d66-4e8d-bf7f-2e9f6e3c9f90', 'Константин', 'Константинов', 'Константинович', 'konstantink@example.com +79088901234', '888999', 'XX08', '2021-08-22', '2031-08-21');
INSERT INTO public.client (client_id, name, surname, patronymic, contacts, passport_number, passport_serial, passport_issue_date, passport_expiration_date) VALUES ('30df8323-7d64-4e9e-afe0-2f9e7e4d9f21', 'Лариса', 'Ларин', 'Ларисовна', 'larisal@example.com +79099012345', '999000', 'XX09', '2021-09-23', '2031-09-22');


--
-- TOC entry 3572 (class 0 OID 16679)
-- Dependencies: 228
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.course (course_id, programm_element_id) VALUES ('6d50d653-b4a7-4912-a8dd-542e453571a7', '85fcc7ad-4a06-4cd9-bf3d-736e98c8a3c5');
INSERT INTO public.course (course_id, programm_element_id) VALUES ('1920d807-a833-4b73-9d5a-f0f9eaf1af1d', '002f0e3b-5821-4bdf-82b1-443d63a49245');
INSERT INTO public.course (course_id, programm_element_id) VALUES ('0f442e4e-288a-4ca6-bfca-a09cc73803cd', '91bb9326-337d-433f-8f99-e548e4f5439a');


--
-- TOC entry 3573 (class 0 OID 16689)
-- Dependencies: 229
-- Data for Name: course_participant; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.course_participant (course_participant_id, group_id, course_id) VALUES ('a3d14a4b-978f-4f97-9854-58bc37e22832', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '6d50d653-b4a7-4912-a8dd-542e453571a7');
INSERT INTO public.course_participant (course_participant_id, group_id, course_id) VALUES ('fff8f566-3918-47fa-a4ac-ef8d85c17ba1', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '1920d807-a833-4b73-9d5a-f0f9eaf1af1d');
INSERT INTO public.course_participant (course_participant_id, group_id, course_id) VALUES ('f5086dcc-4038-48b0-9602-bdf1543a47f2', '8a472103-92e7-4155-bde7-a071201e8568', '1920d807-a833-4b73-9d5a-f0f9eaf1af1d');
INSERT INTO public.course_participant (course_participant_id, group_id, course_id) VALUES ('95d447db-1297-45fd-b5bb-5a19d3af1ceb', '8a472103-92e7-4155-bde7-a071201e8568', '0f442e4e-288a-4ca6-bfca-a09cc73803cd');


--
-- TOC entry 3561 (class 0 OID 16527)
-- Dependencies: 217
-- Data for Name: education_programm; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.education_programm (programm_code, programm_type, duration, specialty_code) VALUES ('PROG001', 'основная', 4, 'SPEC001');
INSERT INTO public.education_programm (programm_code, programm_type, duration, specialty_code) VALUES ('PROG002', 'основная', 2, 'SPEC002');
INSERT INTO public.education_programm (programm_code, programm_type, duration, specialty_code) VALUES ('PROG003', 'основная', 4, 'SPEC003');
INSERT INTO public.education_programm (programm_code, programm_type, duration, specialty_code) VALUES ('PROG004', 'основная', 3, 'SPEC003');
INSERT INTO public.education_programm (programm_code, programm_type, duration, specialty_code) VALUES ('PROG005', 'ДПО', 5, 'SPEC003');


--
-- TOC entry 3562 (class 0 OID 16540)
-- Dependencies: 218
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.enrollment (enrollment_id, programm_code, start_date, end_date) VALUES ('b9e1343d-7a81-4a10-b3ea-aa32f0f833de', 'PROG001', '2023-09-01', '2027-07-01');
INSERT INTO public.enrollment (enrollment_id, programm_code, start_date, end_date) VALUES ('014cccbe-6104-4bd8-9187-96fb5a13cb2f', 'PROG002', '2023-09-01', '2025-07-01');


--
-- TOC entry 3567 (class 0 OID 16604)
-- Dependencies: 223
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public."group" (group_id, enrollment_id, number, start_date, end_date) VALUES ('4f0ee28b-98a4-4dbd-a679-d9a9470c719e', 'b9e1343d-7a81-4a10-b3ea-aa32f0f833de', 'K3241', '2023-09-01', '2024-07-01');
INSERT INTO public."group" (group_id, enrollment_id, number, start_date, end_date) VALUES ('8a472103-92e7-4155-bde7-a071201e8568', '014cccbe-6104-4bd8-9187-96fb5a13cb2f', 'K3242', '2023-09-01', '2024-07-01');


--
-- TOC entry 3563 (class 0 OID 16553)
-- Dependencies: 219
-- Data for Name: programm_element; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.programm_element (programm_element_id, enrollment_id, discipline_id) VALUES ('85fcc7ad-4a06-4cd9-bf3d-736e98c8a3c5', 'b9e1343d-7a81-4a10-b3ea-aa32f0f833de', 'a0b33a1c-fa29-49d2-ba4d-d7cd8030e315');
INSERT INTO public.programm_element (programm_element_id, enrollment_id, discipline_id) VALUES ('002f0e3b-5821-4bdf-82b1-443d63a49245', 'b9e1343d-7a81-4a10-b3ea-aa32f0f833de', '0c2547df-cfdb-4b24-ab12-ce06d409867e');
INSERT INTO public.programm_element (programm_element_id, enrollment_id, discipline_id) VALUES ('57ac339f-d267-40d7-8397-e36c1e42a9ee', '014cccbe-6104-4bd8-9187-96fb5a13cb2f', 'a0b33a1c-fa29-49d2-ba4d-d7cd8030e315');
INSERT INTO public.programm_element (programm_element_id, enrollment_id, discipline_id) VALUES ('91bb9326-337d-433f-8f99-e548e4f5439a', '014cccbe-6104-4bd8-9187-96fb5a13cb2f', '34c49c8b-62d2-4c1d-b08e-9dceb895e93e');


--
-- TOC entry 3569 (class 0 OID 16637)
-- Dependencies: 225
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.result (result_id, student_id, teacher_id, programm_element_id, date, mark, attempt) VALUES ('faa8f566-3918-47fa-a4ac-ef8d85c17ba1', '3b8aaf62-d4aa-48f2-9cfd-f1a9c90c0ad1', '064f78ca-718e-4c20-9bf8-3abee87114ca', '002f0e3b-5821-4bdf-82b1-443d63a49245', NULL, NULL, 0);
INSERT INTO public.result (result_id, student_id, teacher_id, programm_element_id, date, mark, attempt) VALUES ('faa8f566-3918-47fa-a4ac-ef8d85c17da2', '9101da2f-9b03-4f3c-a569-f5708fa8c6c5', '064f78ca-718e-4c20-9bf8-3abee87114ca', '002f0e3b-5821-4bdf-82b1-443d63a49245', '2024-01-01', '2', 0);
INSERT INTO public.result (result_id, student_id, teacher_id, programm_element_id, date, mark, attempt) VALUES ('faa8f566-3918-47fa-a4ac-ef8d85c17da3', '9101da2f-9b03-4f3c-a569-f5708fa8c6c5', '064f78ca-718e-4c20-9bf8-3abee87114ca', '002f0e3b-5821-4bdf-82b1-443d63a49245', '2024-01-01', '4', 1);


--
-- TOC entry 3560 (class 0 OID 16513)
-- Dependencies: 216
-- Data for Name: specialty; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.specialty (code, qualification, level, name, subdivision_id) VALUES ('SPEC001', 'бакалавр', 'бакалавр', 'Прикладная информатика', 'f9b8e7ad-dea0-4423-a55c-8867686a3893');
INSERT INTO public.specialty (code, qualification, level, name, subdivision_id) VALUES ('SPEC002', 'магистр', 'магистр', 'Суперприкладная информатика', 'f9b8e7ad-dea0-4423-a55c-8867686a3893');
INSERT INTO public.specialty (code, qualification, level, name, subdivision_id) VALUES ('SPEC003', 'бакалавр', 'бакалавр', 'Неприкладная химическая информатика', '00085bcd-2521-4d68-8729-f6d1adca4b4a');


--
-- TOC entry 3568 (class 0 OID 16618)
-- Dependencies: 224
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('3b8aaf62-d4aa-48f2-9cfd-f1a9c90c0ad1', '132259da-3ddb-4bae-8d01-39414d808ad7', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('9101da2f-9b03-4f3c-a569-f5708fa8c6c5', '24fd3f29-ec14-4f51-bf76-2f9bf9181b67', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('00495bd0-99de-436b-8456-6fbbb70248da', '3b25f691-ac4e-4d86-9ba3-f0b9fc2d6160', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('a4b34641-1125-4ba5-8c8f-c6bebe87b40b', '4acca545-ecb6-4aaf-8c34-bf3b1a3d38bc', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('0456f9f0-b753-4ad1-9cae-de8d7fbc9490', '5c6ee5d3-ee1a-4e9b-9e69-1a5e4c9b9e7d', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('d5d7cd03-d086-4a4e-9c2b-b1c14e215430', '6d7f68b0-5d3a-49f6-8eba-1a9e4c1c9f2e', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('405e00b3-37e4-49e0-a191-929de9d72ab8', '7e8f59c1-6f4b-48b9-9cba-2a0e5c2d9f3f', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('0ae4485d-faf1-4475-bb04-ad480075a231', '18ab5bd9-9b31-4d3b-9d24-11e25cc9fefb', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'отчислен');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('6a15d442-c3fe-41cc-95ec-76f7c6583f87', '19bc6de0-ac42-4fb5-a5b5-21f26dc0fefc', '4f0ee28b-98a4-4dbd-a679-d9a9470c719e', '2023-09-01', '2024-07-01', 'отчислен');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('c1c6b124-4291-44b9-9246-4e3781a8b483', '20cd7ef1-bd53-4fc6-b6b6-31f37ec1f0fd', '8a472103-92e7-4155-bde7-a071201e8568', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('befeb349-8417-4759-912f-aeb839717420', '8bb9d041-2d55-40d4-afee-1e8e5d2d9e8f', '8a472103-92e7-4155-bde7-a071201e8568', '2023-09-01', '2024-07-01', 'учится');
INSERT INTO public.student (student_id, client_id, group_id, start_date, finish_date, status_in_group) VALUES ('dc25462f-a669-4c72-88eb-c38ff1d3c6e4', '9cca6112-3d66-4e8d-bf7f-2e9f6e3c9f90', '8a472103-92e7-4155-bde7-a071201e8568', '2023-09-01', '2024-07-01', 'учится');


--
-- TOC entry 3559 (class 0 OID 16504)
-- Dependencies: 215
-- Data for Name: subdivision; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.subdivision (subdivision_id, name) VALUES ('f9b8e7ad-dea0-4423-a55c-8867686a3893', 'ФИКТ');
INSERT INTO public.subdivision (subdivision_id, name) VALUES ('00085bcd-2521-4d68-8729-f6d1adca4b4a', 'ФИТИП');


--
-- TOC entry 3564 (class 0 OID 16570)
-- Dependencies: 220
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('72a13add-efca-49f0-bc53-fbb7e7be2d8c', 'Иван', 'Иванов', 'Иванович', 'доцент');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('b6b06ff0-eba6-46f5-8263-8a6e1b6b6bb0', 'Николай', 'Иванов', 'Иванович', 'лаборант');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('17a5c7a6-fb30-4ff9-b4d5-63fd6c20183e', 'Евгений', 'Иванов', 'Иванович', 'ассистент');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('e89c4be9-4cbe-46f1-8333-870d697b400b', 'Василий', 'Иванов', 'Иванович', 'старший преподаватель');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('6c0bbc51-93f8-479e-a828-2c71e08de423', 'Пётр', 'Иванов', 'Иванович', 'старший преподаватель');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('064f78ca-718e-4c20-9bf8-3abee87114ca', 'Иван', 'Павлов', 'Иванович', 'лаборант');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('000331af-1293-42eb-9dab-f7e000711a9d', 'Николай', 'Павлов', 'Иванович', 'доцент');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('04645e63-c4a3-4da4-9ce6-b8ed4be50b79', 'Евгений', 'Павлов', 'Иванович', 'доцент');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('42cea071-d15a-4a49-a0dd-c84d9c19e588', 'Василий', 'Павлов', 'Иванович', 'ассистент');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('bc611abc-039c-4eea-b95f-3f6545d67c3f', 'Пётр', 'Павлов', 'Иванович', 'лаборант');
INSERT INTO public.teacher (teacher_id, name, surname, patronymic, job_title) VALUES ('11914ea8-82fb-46c8-bef5-2e376ac2df97', 'Генадий', 'Павлов', 'Иванович', 'доцент');


--
-- TOC entry 3565 (class 0 OID 16577)
-- Dependencies: 221
-- Data for Name: teaching_permit; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.teaching_permit (teaching_permit_id, teacher_id, discipline_id, is_lecture_allowed) VALUES ('e8154868-46a7-49b2-85fb-73b55dbae406', '72a13add-efca-49f0-bc53-fbb7e7be2d8c', 'a0b33a1c-fa29-49d2-ba4d-d7cd8030e315', true);
INSERT INTO public.teaching_permit (teaching_permit_id, teacher_id, discipline_id, is_lecture_allowed) VALUES ('55ef3562-ebc0-4145-aa51-4c5e1c455ca6', 'b6b06ff0-eba6-46f5-8263-8a6e1b6b6bb0', 'da1ab801-fbe0-42b1-a1b4-6a9c51d11a8f', true);
INSERT INTO public.teaching_permit (teaching_permit_id, teacher_id, discipline_id, is_lecture_allowed) VALUES ('b3fd1bfe-73c6-4f4b-a731-2100ade8350d', '17a5c7a6-fb30-4ff9-b4d5-63fd6c20183e', '34c49c8b-62d2-4c1d-b08e-9dceb895e93e', true);
INSERT INTO public.teaching_permit (teaching_permit_id, teacher_id, discipline_id, is_lecture_allowed) VALUES ('854aecc5-1ee6-4e51-a62a-19d1561fa8c9', '6c0bbc51-93f8-479e-a828-2c71e08de423', '93a3e393-8c7b-427e-9a35-f15c4c96877a', true);
INSERT INTO public.teaching_permit (teaching_permit_id, teacher_id, discipline_id, is_lecture_allowed) VALUES ('c08a4832-ce5b-47a4-bf9b-a1bea746f1c3', '064f78ca-718e-4c20-9bf8-3abee87114ca', '0c2547df-cfdb-4b24-ab12-ce06d409867e', true);
INSERT INTO public.teaching_permit (teaching_permit_id, teacher_id, discipline_id, is_lecture_allowed) VALUES ('d0c8d66b-a5fb-43ac-b68f-8a854c5a8e7d', '000331af-1293-42eb-9dab-f7e000711a9d', 'a0b33a1c-fa29-49d2-ba4d-d7cd8030e315', true);
INSERT INTO public.teaching_permit (teaching_permit_id, teacher_id, discipline_id, is_lecture_allowed) VALUES ('bc608ced-1c2e-400a-ad78-51c24ae5268d', '72a13add-efca-49f0-bc53-fbb7e7be2d8c', 'da1ab801-fbe0-42b1-a1b4-6a9c51d11a8f', false);


--
-- TOC entry 3336 (class 2606 OID 16503)
-- Name: academic_discipline academic_discipline_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.academic_discipline
    ADD CONSTRAINT academic_discipline_name_key UNIQUE (name);


--
-- TOC entry 3338 (class 2606 OID 16501)
-- Name: academic_discipline academic_discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.academic_discipline
    ADD CONSTRAINT academic_discipline_pkey PRIMARY KEY (discipline_id);


--
-- TOC entry 3376 (class 2606 OID 16664)
-- Name: building building_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_pkey PRIMARY KEY (building_id);


--
-- TOC entry 3386 (class 2606 OID 16711)
-- Name: class class_classroom_id_classes_order_number_date_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_classroom_id_classes_order_number_date_key UNIQUE (classroom_id, classes_order_number, date);


--
-- TOC entry 3388 (class 2606 OID 16709)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (class_id);


--
-- TOC entry 3390 (class 2606 OID 16713)
-- Name: class class_teacher_id_classes_order_number_date_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_teacher_id_classes_order_number_date_key UNIQUE (teacher_id, classes_order_number, date);


--
-- TOC entry 3378 (class 2606 OID 16673)
-- Name: classroom classroom_building_id_number_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_building_id_number_key UNIQUE (building_id, number);


--
-- TOC entry 3380 (class 2606 OID 16671)
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (classroom_id);


--
-- TOC entry 3362 (class 2606 OID 16603)
-- Name: client client_passport_number_passport_serial_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_passport_number_passport_serial_key UNIQUE (passport_number, passport_serial);


--
-- TOC entry 3364 (class 2606 OID 16601)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- TOC entry 3384 (class 2606 OID 16693)
-- Name: course_participant course_participant_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course_participant
    ADD CONSTRAINT course_participant_pkey PRIMARY KEY (course_participant_id);


--
-- TOC entry 3382 (class 2606 OID 16683)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 3348 (class 2606 OID 16534)
-- Name: education_programm education_programm_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.education_programm
    ADD CONSTRAINT education_programm_pkey PRIMARY KEY (programm_code);


--
-- TOC entry 3350 (class 2606 OID 16547)
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (enrollment_id);


--
-- TOC entry 3366 (class 2606 OID 16611)
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (group_id);


--
-- TOC entry 3352 (class 2606 OID 16559)
-- Name: programm_element programm_element_enrollment_id_discipline_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.programm_element
    ADD CONSTRAINT programm_element_enrollment_id_discipline_id_key UNIQUE (enrollment_id, discipline_id);


--
-- TOC entry 3354 (class 2606 OID 16557)
-- Name: programm_element programm_element_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.programm_element
    ADD CONSTRAINT programm_element_pkey PRIMARY KEY (programm_element_id);


--
-- TOC entry 3372 (class 2606 OID 16642)
-- Name: result result_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_pkey PRIMARY KEY (result_id);


--
-- TOC entry 3374 (class 2606 OID 16644)
-- Name: result result_student_id_programm_element_id_attempt_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_student_id_programm_element_id_attempt_key UNIQUE (student_id, programm_element_id, attempt);


--
-- TOC entry 3344 (class 2606 OID 16521)
-- Name: specialty specialty_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_name_key UNIQUE (name);


--
-- TOC entry 3346 (class 2606 OID 16519)
-- Name: specialty specialty_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_pkey PRIMARY KEY (code);


--
-- TOC entry 3368 (class 2606 OID 16625)
-- Name: student student_client_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_client_id_group_id_key UNIQUE (client_id, group_id);


--
-- TOC entry 3370 (class 2606 OID 16623)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- TOC entry 3340 (class 2606 OID 16512)
-- Name: subdivision subdivision_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.subdivision
    ADD CONSTRAINT subdivision_name_key UNIQUE (name);


--
-- TOC entry 3342 (class 2606 OID 16510)
-- Name: subdivision subdivision_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.subdivision
    ADD CONSTRAINT subdivision_pkey PRIMARY KEY (subdivision_id);


--
-- TOC entry 3356 (class 2606 OID 16576)
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacher_id);


--
-- TOC entry 3358 (class 2606 OID 16581)
-- Name: teaching_permit teaching_permit_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teaching_permit
    ADD CONSTRAINT teaching_permit_pkey PRIMARY KEY (teaching_permit_id);


--
-- TOC entry 3360 (class 2606 OID 16583)
-- Name: teaching_permit teaching_permit_teacher_id_discipline_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teaching_permit
    ADD CONSTRAINT teaching_permit_teacher_id_discipline_id_key UNIQUE (teacher_id, discipline_id);


--
-- TOC entry 3415 (class 2620 OID 16729)
-- Name: class check_class_trigger; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER check_class_trigger BEFORE INSERT OR UPDATE ON public.class FOR EACH ROW EXECUTE FUNCTION public.check_class();


--
-- TOC entry 3410 (class 2620 OID 16617)
-- Name: group check_group_dates_trigger; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER check_group_dates_trigger BEFORE INSERT OR UPDATE ON public."group" FOR EACH ROW EXECUTE FUNCTION public.check_group_dates();


--
-- TOC entry 3412 (class 2620 OID 16657)
-- Name: result check_result_attempts_trigger; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER check_result_attempts_trigger BEFORE INSERT OR UPDATE ON public.result FOR EACH ROW EXECUTE FUNCTION public.check_result_attempts();


--
-- TOC entry 3413 (class 2620 OID 16656)
-- Name: result check_result_date_trigger; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER check_result_date_trigger BEFORE INSERT OR UPDATE ON public.result FOR EACH ROW EXECUTE FUNCTION public.check_result_date();


--
-- TOC entry 3414 (class 2620 OID 16655)
-- Name: result check_result_mark_trigger; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER check_result_mark_trigger BEFORE INSERT OR UPDATE ON public.result FOR EACH ROW EXECUTE FUNCTION public.check_mark();


--
-- TOC entry 3411 (class 2620 OID 16636)
-- Name: group check_student_dates_trigger; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER check_student_dates_trigger BEFORE INSERT OR UPDATE ON public."group" FOR EACH ROW EXECUTE FUNCTION public.check_student_dates();


--
-- TOC entry 3394 (class 2606 OID 16565)
-- Name: programm_element academic_discipline_discipline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.programm_element
    ADD CONSTRAINT academic_discipline_discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES public.academic_discipline(discipline_id);


--
-- TOC entry 3396 (class 2606 OID 16589)
-- Name: teaching_permit academic_discipline_discipline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teaching_permit
    ADD CONSTRAINT academic_discipline_discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES public.academic_discipline(discipline_id);


--
-- TOC entry 3403 (class 2606 OID 16674)
-- Name: classroom building_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT building_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(building_id);


--
-- TOC entry 3407 (class 2606 OID 16719)
-- Name: class classroom_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT classroom_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classroom(classroom_id);


--
-- TOC entry 3399 (class 2606 OID 16626)
-- Name: student client_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT client_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- TOC entry 3405 (class 2606 OID 16699)
-- Name: course_participant course_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course_participant
    ADD CONSTRAINT course_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 3408 (class 2606 OID 16714)
-- Name: class course_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT course_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 3393 (class 2606 OID 16548)
-- Name: enrollment education_programm_programm_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT education_programm_programm_code_fkey FOREIGN KEY (programm_code) REFERENCES public.education_programm(programm_code);


--
-- TOC entry 3395 (class 2606 OID 16560)
-- Name: programm_element enrollment_enrollment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.programm_element
    ADD CONSTRAINT enrollment_enrollment_id_fkey FOREIGN KEY (enrollment_id) REFERENCES public.enrollment(enrollment_id);


--
-- TOC entry 3398 (class 2606 OID 16612)
-- Name: group enrollment_enrollment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT enrollment_enrollment_id_fkey FOREIGN KEY (enrollment_id) REFERENCES public.enrollment(enrollment_id);


--
-- TOC entry 3400 (class 2606 OID 16631)
-- Name: student group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public."group"(group_id);


--
-- TOC entry 3406 (class 2606 OID 16694)
-- Name: course_participant group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course_participant
    ADD CONSTRAINT group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public."group"(group_id);


--
-- TOC entry 3404 (class 2606 OID 16684)
-- Name: course programm_element_programm_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT programm_element_programm_element_id_fkey FOREIGN KEY (programm_element_id) REFERENCES public.programm_element(programm_element_id);


--
-- TOC entry 3392 (class 2606 OID 16535)
-- Name: education_programm specialty_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.education_programm
    ADD CONSTRAINT specialty_code_fkey FOREIGN KEY (specialty_code) REFERENCES public.specialty(code);


--
-- TOC entry 3401 (class 2606 OID 16645)
-- Name: result student_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT student_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- TOC entry 3391 (class 2606 OID 16522)
-- Name: specialty subdivision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT subdivision_id_fkey FOREIGN KEY (subdivision_id) REFERENCES public.subdivision(subdivision_id);


--
-- TOC entry 3397 (class 2606 OID 16584)
-- Name: teaching_permit teacher_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teaching_permit
    ADD CONSTRAINT teacher_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teacher(teacher_id);


--
-- TOC entry 3402 (class 2606 OID 16650)
-- Name: result teacher_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT teacher_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teacher(teacher_id);


--
-- TOC entry 3409 (class 2606 OID 16724)
-- Name: class teacher_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT teacher_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teacher(teacher_id);


-- Completed on 2023-11-06 18:22:15 UTC

--
-- PostgreSQL database dump complete
--

