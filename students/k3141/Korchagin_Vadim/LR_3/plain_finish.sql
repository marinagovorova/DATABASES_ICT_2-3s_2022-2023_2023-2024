--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-27 17:09:26

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

DROP DATABASE IF EXISTS "Sport_club";
--
-- TOC entry 4987 (class 1262 OID 16561)
-- Name: Sport_club; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Sport_club" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Sport_club" OWNER TO postgres;

\connect "Sport_club"

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
-- TOC entry 7 (class 2615 OID 24580)
-- Name: coach; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA coach;


ALTER SCHEMA coach OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 24582)
-- Name: competition; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA competition;


ALTER SCHEMA competition OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 24579)
-- Name: sportsman; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sportsman;


ALTER SCHEMA sportsman OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 24581)
-- Name: training_information; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA training_information;


ALTER SCHEMA training_information OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16635)
-- Name: coach; Type: TABLE; Schema: coach; Owner: postgres
--

CREATE TABLE coach.coach (
    salary numeric NOT NULL,
    coach_code integer NOT NULL,
    passport_number character varying(30) NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    phone_number integer NOT NULL,
    CONSTRAINT check_salary CHECK ((salary > (0)::numeric))
);


ALTER TABLE coach.coach OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16716)
-- Name: coach_category; Type: TABLE; Schema: coach; Owner: postgres
--

CREATE TABLE coach.coach_category (
    category_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    category_name character varying(20) NOT NULL,
    coach_code integer NOT NULL,
    CONSTRAINT category_from_date_check CHECK ((from_date > '1930-01-01'::date)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);


ALTER TABLE coach.coach_category OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16728)
-- Name: coach_rating; Type: TABLE; Schema: coach; Owner: postgres
--

CREATE TABLE coach.coach_rating (
    rating_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    coach_code integer NOT NULL,
    rating_number integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);


ALTER TABLE coach.coach_rating OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16780)
-- Name: competition; Type: TABLE; Schema: competition; Owner: postgres
--

CREATE TABLE competition.competition (
    competition_code integer NOT NULL,
    name_competition character varying(100) NOT NULL,
    date_time timestamp without time zone NOT NULL,
    venue character varying(60) NOT NULL,
    category character varying(20) NOT NULL,
    type_competition character varying(20) NOT NULL,
    status character varying(10) NOT NULL,
    CONSTRAINT " check_date_time" CHECK ((date_time >= CURRENT_TIMESTAMP)),
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);


ALTER TABLE competition.competition OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16816)
-- Name: competition_conducting; Type: TABLE; Schema: competition; Owner: postgres
--

CREATE TABLE competition.competition_conducting (
    competition_conducting_code integer NOT NULL,
    competition_code integer NOT NULL,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    status character varying(10) NOT NULL,
    coachs_points integer NOT NULL,
    sportsmans_points integer NOT NULL,
    date_time timestamp without time zone NOT NULL,
    prize_place numeric,
    CONSTRAINT check_coachs_points CHECK ((coachs_points >= 0)),
    CONSTRAINT check_sportsmans_points CHECK ((sportsmans_points >= 0)),
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);


ALTER TABLE competition.competition_conducting OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16790)
-- Name: qualifying; Type: TABLE; Schema: competition; Owner: postgres
--

CREATE TABLE competition.qualifying (
    qualifying_code integer NOT NULL,
    sportsman_code integer NOT NULL,
    competition_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    status character varying(10) NOT NULL,
    date_time timestamp without time zone NOT NULL,
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);


ALTER TABLE competition.qualifying OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16667)
-- Name: medical_life; Type: TABLE; Schema: sportsman; Owner: postgres
--

CREATE TABLE sportsman.medical_life (
    medical_life_code integer NOT NULL,
    date_of_injury date NOT NULL,
    date_of_discharge date,
    sportsman_code integer NOT NULL,
    injury_code integer NOT NULL,
    CONSTRAINT check_date_of_injury CHECK ((date_of_injury > '1930-01-01'::date))
);


ALTER TABLE sportsman.medical_life OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16647)
-- Name: sportsman; Type: TABLE; Schema: sportsman; Owner: postgres
--

CREATE TABLE sportsman.sportsman (
    sportsman_code integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    date_of_birth date NOT NULL,
    sport_code integer NOT NULL,
    passport_number character varying(30) NOT NULL,
    CONSTRAINT check_date_of_birth CHECK ((date_of_birth >= '1930-01-01'::date))
);


ALTER TABLE sportsman.sportsman OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16685)
-- Name: sportsman_qualification; Type: TABLE; Schema: sportsman; Owner: postgres
--

CREATE TABLE sportsman.sportsman_qualification (
    qualification_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    category character varying(20) NOT NULL,
    weight integer NOT NULL,
    sportsman_code integer NOT NULL,
    sport_code integer NOT NULL,
    CONSTRAINT chech_from_date CHECK ((from_date > '1930-01-01'::date)),
    CONSTRAINT check_weight CHECK ((weight >= 30))
);


ALTER TABLE sportsman.sportsman_qualification OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16702)
-- Name: sportsman_rating; Type: TABLE; Schema: sportsman; Owner: postgres
--

CREATE TABLE sportsman.sportsman_rating (
    rating_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    sportsman_code integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);


ALTER TABLE sportsman.sportsman_rating OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16660)
-- Name: type_of_injury; Type: TABLE; Schema: sportsman; Owner: postgres
--

CREATE TABLE sportsman.type_of_injury (
    type_of_injury character varying(60) NOT NULL,
    injury_code integer NOT NULL,
    treatment text NOT NULL,
    description text NOT NULL,
    first_aid text NOT NULL
);


ALTER TABLE sportsman.type_of_injury OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16742)
-- Name: leadership; Type: TABLE; Schema: training_information; Owner: postgres
--

CREATE TABLE training_information.leadership (
    leadership_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE))
);


ALTER TABLE training_information.leadership OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16628)
-- Name: sport_type; Type: TABLE; Schema: training_information; Owner: postgres
--

CREATE TABLE training_information.sport_type (
    type_of_sport_code integer NOT NULL,
    sport_code integer NOT NULL,
    rules text NOT NULL
);


ALTER TABLE training_information.sport_type OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16758)
-- Name: training; Type: TABLE; Schema: training_information; Owner: postgres
--

CREATE TABLE training_information.training (
    training_code integer NOT NULL,
    time_date timestamp without time zone NOT NULL,
    status character varying(10) NOT NULL,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text]))),
    CONSTRAINT check_time_date CHECK ((time_date > CURRENT_TIMESTAMP))
);


ALTER TABLE training_information.training OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 16635)
-- Dependencies: 220
-- Data for Name: coach; Type: TABLE DATA; Schema: coach; Owner: postgres
--

INSERT INTO coach.coach VALUES (31834, 67914, '5502462', 'Ashley', 'Marcus', 'Deborah', 92915);
INSERT INTO coach.coach VALUES (19961, 40948, '5644702', 'Angela', 'Sarah', 'Bryan', 91575);
INSERT INTO coach.coach VALUES (916, 87217, '5384211', 'Gregory', 'Andrew', 'Katherine', 87122);
INSERT INTO coach.coach VALUES (12304, 33555, '3201913', 'Joseph', 'Daniel', 'Brad', 18153);
INSERT INTO coach.coach VALUES (42977, 47034, '4966501', 'Carol', 'Alexander', 'Courtney', 63500);
INSERT INTO coach.coach VALUES (55607, 44882, '7049328', 'Melinda', 'Amy', 'Patricia', 80064);
INSERT INTO coach.coach VALUES (26532, 17760, '8104839', 'Paul', 'Leslie', 'Joel', 11568);
INSERT INTO coach.coach VALUES (92320, 64670, '5540135', 'Gary', 'Barbara', 'Ryan', 65964);
INSERT INTO coach.coach VALUES (89399, 76196, '1885811', 'Paul', 'Melissa', 'Tracey', 85935);
INSERT INTO coach.coach VALUES (20874, 46511, '6125125', 'Christine', 'Brent', 'Joseph', 23760);
INSERT INTO coach.coach VALUES (25368, 24866, '5124096', 'Jasmine', 'Rebecca', 'Megan', 35172);
INSERT INTO coach.coach VALUES (53046, 39524, '7567645', 'Michael', 'Stacey', 'Erica', 95110);
INSERT INTO coach.coach VALUES (27212, 86978, '2590531', 'Christina', 'Gavin', 'Katelyn', 34483);
INSERT INTO coach.coach VALUES (33292, 70473, '9614643', 'Stephen', 'Raymond', 'Ashley', 43919);
INSERT INTO coach.coach VALUES (45533, 33851, '861837', 'Cheryl', 'Phillip', 'Jeremy', 65232);
INSERT INTO coach.coach VALUES (14212, 5199, '27387', 'Madison', 'Elizabeth', 'Brooke', 32922);
INSERT INTO coach.coach VALUES (41500, 21678, '1499758', 'Jason', 'Kimberly', 'Nathan', 47939);
INSERT INTO coach.coach VALUES (11804, 37053, '8960571', 'Lance', 'Jessica', 'Sabrina', 8884);
INSERT INTO coach.coach VALUES (24926, 64427, '1055492', 'Kimberly', 'Kathryn', 'Susan', 86249);
INSERT INTO coach.coach VALUES (26542, 15643, '940968', 'Alan', 'Brenda', 'Deanna', 29907);
INSERT INTO coach.coach VALUES (81168, 56776, '7508902', 'Gerald', 'Trevor', 'Daniel', 88878);
INSERT INTO coach.coach VALUES (75870, 20413, '6877209', 'Patricia', 'Patricia', 'Robin', 73595);
INSERT INTO coach.coach VALUES (82945, 32250, '8167572', 'Melanie', 'Melissa', 'Michael', 60271);


--
-- TOC entry 4975 (class 0 OID 16716)
-- Dependencies: 226
-- Data for Name: coach_category; Type: TABLE DATA; Schema: coach; Owner: postgres
--

INSERT INTO coach.coach_category VALUES (5022, '2029-03-01', '2029-05-04', 'David', 67914);
INSERT INTO coach.coach_category VALUES (17273, '2029-02-07', '2029-03-20', 'Sarah', 40948);
INSERT INTO coach.coach_category VALUES (78862, '2029-01-21', '2029-02-12', 'Heather', 87217);
INSERT INTO coach.coach_category VALUES (43106, '2029-01-17', '2029-03-08', 'David', 33555);
INSERT INTO coach.coach_category VALUES (93158, '2029-02-02', '2029-05-04', 'Aaron', 47034);
INSERT INTO coach.coach_category VALUES (52433, '2029-02-17', '2029-03-07', 'Alexander', 44882);
INSERT INTO coach.coach_category VALUES (57294, '2029-02-09', '2029-04-29', 'Darren', 17760);
INSERT INTO coach.coach_category VALUES (27214, '2029-02-28', '2029-04-06', 'David', 64670);
INSERT INTO coach.coach_category VALUES (79914, '2029-03-15', '2029-03-17', 'Kathy', 76196);
INSERT INTO coach.coach_category VALUES (33863, '2029-01-14', '2029-01-27', 'Denise', 46511);
INSERT INTO coach.coach_category VALUES (70385, '2029-03-24', '2029-04-19', 'Mark', 24866);
INSERT INTO coach.coach_category VALUES (93256, '2029-01-21', '2029-04-18', 'Jennifer', 39524);
INSERT INTO coach.coach_category VALUES (21273, '2029-03-29', '2029-04-11', 'Shirley', 86978);
INSERT INTO coach.coach_category VALUES (22953, '2029-01-18', '2029-01-20', 'Dylan', 70473);
INSERT INTO coach.coach_category VALUES (51354, '2029-03-08', '2029-03-29', 'Kimberly', 33851);
INSERT INTO coach.coach_category VALUES (43317, '2029-04-21', '2029-05-05', 'Kim', 5199);
INSERT INTO coach.coach_category VALUES (38532, '2029-03-31', '2029-04-11', 'Laura', 21678);
INSERT INTO coach.coach_category VALUES (52369, '2029-03-23', '2029-04-02', 'Patricia', 37053);
INSERT INTO coach.coach_category VALUES (13943, '2029-02-18', '2029-04-14', 'Janice', 64427);
INSERT INTO coach.coach_category VALUES (44535, '2029-02-07', '2029-04-21', 'Matthew', 15643);
INSERT INTO coach.coach_category VALUES (92499, '2029-01-19', '2029-04-17', 'Lisa', 56776);
INSERT INTO coach.coach_category VALUES (55844, '2029-03-26', '2029-04-09', 'Andrea', 20413);
INSERT INTO coach.coach_category VALUES (55565, '2029-03-04', '2029-03-15', 'Mark', 32250);


--
-- TOC entry 4976 (class 0 OID 16728)
-- Dependencies: 227
-- Data for Name: coach_rating; Type: TABLE DATA; Schema: coach; Owner: postgres
--

INSERT INTO coach.coach_rating VALUES (56848, '2029-02-17', '2029-03-17', 67914, 28798);
INSERT INTO coach.coach_rating VALUES (54726, '2029-02-02', '2029-03-06', 40948, 11248);
INSERT INTO coach.coach_rating VALUES (70738, '2029-02-06', '2029-02-25', 87217, 63453);
INSERT INTO coach.coach_rating VALUES (73024, '2029-04-06', '2029-05-01', 33555, 67090);
INSERT INTO coach.coach_rating VALUES (79388, '2029-03-02', '2029-03-24', 47034, 38298);
INSERT INTO coach.coach_rating VALUES (7071, '2029-04-23', '2029-04-29', 44882, 82028);
INSERT INTO coach.coach_rating VALUES (33305, '2029-04-14', '2029-05-04', 17760, 5789);
INSERT INTO coach.coach_rating VALUES (31716, '2029-02-14', '2029-02-15', 64670, 21440);
INSERT INTO coach.coach_rating VALUES (32694, '2029-04-29', '2029-05-01', 76196, 18009);
INSERT INTO coach.coach_rating VALUES (1433, '2029-02-03', '2029-02-28', 46511, 50531);
INSERT INTO coach.coach_rating VALUES (9852, '2029-01-31', '2029-03-31', 24866, 8181);
INSERT INTO coach.coach_rating VALUES (90193, '2029-03-15', '2029-04-02', 39524, 45747);
INSERT INTO coach.coach_rating VALUES (4396, '2029-04-30', '2029-05-01', 86978, 23115);
INSERT INTO coach.coach_rating VALUES (84980, '2029-04-30', '2029-05-03', 70473, 76558);
INSERT INTO coach.coach_rating VALUES (8003, '2029-01-16', '2029-02-09', 33851, 31921);
INSERT INTO coach.coach_rating VALUES (67985, '2029-03-09', '2029-03-25', 5199, 27783);
INSERT INTO coach.coach_rating VALUES (67855, '2029-01-17', '2029-02-16', 21678, 38414);
INSERT INTO coach.coach_rating VALUES (3836, '2029-01-18', '2029-02-24', 37053, 75203);
INSERT INTO coach.coach_rating VALUES (29389, '2029-02-17', '2029-03-04', 64427, 53080);
INSERT INTO coach.coach_rating VALUES (37451, '2029-04-06', '2029-04-30', 15643, 60448);
INSERT INTO coach.coach_rating VALUES (90620, '2029-01-08', '2029-04-02', 56776, 76176);
INSERT INTO coach.coach_rating VALUES (73051, '2029-03-25', '2029-04-19', 20413, 30669);
INSERT INTO coach.coach_rating VALUES (43840, '2029-03-01', '2029-03-16', 32250, 85640);


--
-- TOC entry 4979 (class 0 OID 16780)
-- Dependencies: 230
-- Data for Name: competition; Type: TABLE DATA; Schema: competition; Owner: postgres
--

INSERT INTO competition.competition VALUES (273, 'Donald', '2024-11-01 00:00:01', 'Corey', 'Ashley', 'Timothy', 'passed');
INSERT INTO competition.competition VALUES (12273, 'James', '2024-11-02 00:00:01', 'Stephanie', 'Faith', 'Rachel', 'passed');
INSERT INTO competition.competition VALUES (14145, 'Scott', '2024-11-03 00:00:01', 'Cheryl', 'Maxwell', 'Brittany', 'passed');
INSERT INTO competition.competition VALUES (19818, 'David', '2024-11-04 00:00:01', 'Julie', 'Jerry', 'Dawn', 'passed');
INSERT INTO competition.competition VALUES (28225, 'Rebecca', '2024-11-05 00:00:01', 'Angel', 'Lisa', 'Kyle', 'passed');
INSERT INTO competition.competition VALUES (30216, 'Kevin', '2024-11-06 00:00:01', 'Kevin', 'Tyler', 'Joseph', 'passed');
INSERT INTO competition.competition VALUES (30259, 'Richard', '2024-11-07 00:00:01', 'Joseph', 'Rodney', 'Frank', 'passed');
INSERT INTO competition.competition VALUES (30775, 'Amber', '2024-11-08 00:00:01', 'Jane', 'Tyler', 'Megan', 'passed');
INSERT INTO competition.competition VALUES (41591, 'Joseph', '2024-11-09 00:00:01', 'William', 'Courtney', 'Stephanie', 'passed');
INSERT INTO competition.competition VALUES (42472, 'Tracy', '2024-11-10 00:00:01', 'Barbara', 'Benjamin', 'Daniel', 'passed');
INSERT INTO competition.competition VALUES (45408, 'Zachary', '2024-11-11 00:00:01', 'Daniel', 'Michael', 'Marissa', 'passed');
INSERT INTO competition.competition VALUES (51498, 'Sara', '2024-11-12 00:00:01', 'Daniel', 'Timothy', 'Jade', 'passed');
INSERT INTO competition.competition VALUES (57734, 'Katherine', '2024-11-13 00:00:01', 'Michelle', 'Gabriel', 'Henry', 'passed');
INSERT INTO competition.competition VALUES (69037, 'Susan', '2024-11-14 00:00:01', 'Taylor', 'Dawn', 'Kelly', 'passed');
INSERT INTO competition.competition VALUES (73378, 'Dennis', '2024-11-15 00:00:01', 'Bobby', 'Adam', 'Erika', 'passed');
INSERT INTO competition.competition VALUES (74354, 'Rebecca', '2024-11-16 00:00:01', 'Brittany', 'Heather', 'William', 'passed');
INSERT INTO competition.competition VALUES (74463, 'Lorraine', '2024-11-17 00:00:01', 'Shawn', 'Rachel', 'Alexandra', 'passed');
INSERT INTO competition.competition VALUES (77755, 'Ian', '2024-11-18 00:00:01', 'Daniel', 'Douglas', 'Mario', 'passed');
INSERT INTO competition.competition VALUES (78537, 'Fernando', '2024-11-19 00:00:01', 'Martha', 'Tanya', 'Desiree', 'passed');
INSERT INTO competition.competition VALUES (79088, 'Zachary', '2024-11-20 00:00:01', 'Thomas', 'Melissa', 'Christopher', 'passed');
INSERT INTO competition.competition VALUES (81656, 'Julia', '2024-11-21 00:00:01', 'Denise', 'Lisa', 'Brian', 'passed');
INSERT INTO competition.competition VALUES (85398, 'Leslie', '2024-11-22 00:00:01', 'Adrienne', 'Christopher', 'Matthew', 'passed');
INSERT INTO competition.competition VALUES (92843, 'Jacob', '2024-11-23 00:00:01', 'Lonnie', 'Michael', 'Lance', 'passed');


--
-- TOC entry 4981 (class 0 OID 16816)
-- Dependencies: 232
-- Data for Name: competition_conducting; Type: TABLE DATA; Schema: competition; Owner: postgres
--

INSERT INTO competition.competition_conducting VALUES (10064, 85398, 79500, 20413, 96165, 'passed', 41568, 97423, '2024-01-01 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (12362, 92843, 4286, 32250, 50345, 'passed', 90764, 90904, '2024-01-02 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (13425, 19818, 29165, 33555, 28799, 'passed', 43544, 27583, '2024-01-03 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (16623, 69037, 66895, 70473, 49496, 'passed', 68526, 68522, '2024-01-04 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (22705, 14145, 28770, 87217, 26001, 'passed', 56754, 25344, '2024-01-05 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (31426, 12273, 89506, 40948, 90021, 'passed', 79788, 21722, '2024-01-06 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (40010, 28225, 6609, 47034, 42995, 'passed', 18079, 45115, '2024-01-07 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (54006, 79088, 63004, 15643, 81102, 'passed', 51079, 56622, '2024-01-08 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (58330, 77755, 85896, 37053, 40164, 'passed', 31289, 82280, '2024-01-09 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (59975, 41591, 3128, 76196, 2627, 'passed', 56683, 23132, '2024-01-10 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (61227, 273, 94897, 67914, 11254, 'passed', 62265, 58016, '2024-01-11 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (63055, 74354, 39263, 5199, 34894, 'passed', 92305, 75774, '2024-01-12 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (63228, 45408, 34978, 24866, 34869, 'passed', 20853, 33916, '2024-01-13 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (69090, 30775, 8652, 64670, 89965, 'passed', 15109, 97472, '2024-01-14 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (69499, 57734, 44220, 86978, 35655, 'passed', 47858, 37273, '2024-01-15 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (71236, 78537, 91008, 64427, 68509, 'passed', 89278, 8276, '2024-01-16 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (73675, 42472, 68731, 46511, 10380, 'passed', 3231, 77561, '2024-01-17 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (74699, 30216, 1013, 44882, 83957, 'passed', 75145, 12238, '2024-01-12 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (74972, 74463, 39395, 21678, 15475, 'passed', 74484, 62134, '2024-01-12 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (80741, 51498, 80315, 39524, 38644, 'passed', 35372, 81620, '2024-01-12 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (88192, 81656, 21045, 56776, 21805, 'passed', 66072, 12950, '2024-01-12 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (89076, 30259, 5411, 17760, 33879, 'passed', 87095, 45463, '2024-01-12 00:00:01', 1);
INSERT INTO competition.competition_conducting VALUES (98023, 73378, 75890, 33851, 62674, 'passed', 36224, 47487, '2024-01-12 00:00:01', 1);


--
-- TOC entry 4980 (class 0 OID 16790)
-- Dependencies: 231
-- Data for Name: qualifying; Type: TABLE DATA; Schema: competition; Owner: postgres
--

INSERT INTO competition.qualifying VALUES (5085, 29165, 19818, 33555, 28799, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (6863, 4286, 92843, 32250, 50345, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (9562, 39263, 74354, 5199, 34894, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (21138, 79500, 85398, 20413, 96165, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (25793, 68731, 42472, 46511, 10380, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (30581, 89506, 12273, 40948, 90021, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (32910, 1013, 30216, 44882, 83957, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (40523, 34978, 45408, 24866, 34869, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (43535, 91008, 78537, 64427, 68509, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (48357, 85896, 77755, 37053, 40164, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (63526, 5411, 30259, 17760, 33879, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (64671, 39395, 74463, 21678, 15475, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (65325, 6609, 28225, 47034, 42995, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (66208, 63004, 79088, 15643, 81102, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (75793, 3128, 41591, 76196, 2627, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (77167, 80315, 51498, 39524, 38644, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (79691, 66895, 69037, 70473, 49496, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (79827, 44220, 57734, 86978, 35655, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (82373, 21045, 81656, 56776, 21805, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (86360, 94897, 273, 67914, 11254, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (92379, 28770, 14145, 87217, 26001, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (97345, 75890, 73378, 33851, 62674, 'passed', '2024-01-12 00:00:01');
INSERT INTO competition.qualifying VALUES (99999, 8652, 30775, 64670, 89965, 'passed', '2024-01-12 00:00:01');


--
-- TOC entry 4972 (class 0 OID 16667)
-- Dependencies: 223
-- Data for Name: medical_life; Type: TABLE DATA; Schema: sportsman; Owner: postgres
--

INSERT INTO sportsman.medical_life VALUES (89362, '2029-03-29', '2029-04-28', 94897, 25745);
INSERT INTO sportsman.medical_life VALUES (1009, '2029-03-03', '2029-04-07', 89506, 24283);
INSERT INTO sportsman.medical_life VALUES (11316, '2029-02-01', '2029-04-15', 28770, 2927);
INSERT INTO sportsman.medical_life VALUES (96428, '2029-04-19', '2029-04-27', 29165, 11277);
INSERT INTO sportsman.medical_life VALUES (92479, '2029-04-14', '2029-05-02', 6609, 67314);
INSERT INTO sportsman.medical_life VALUES (11456, '2029-03-04', '2029-03-28', 1013, 93128);
INSERT INTO sportsman.medical_life VALUES (72134, '2029-04-18', '2029-05-03', 5411, 24655);
INSERT INTO sportsman.medical_life VALUES (5876, '2029-04-21', '2029-04-22', 8652, 71725);
INSERT INTO sportsman.medical_life VALUES (48068, '2029-03-10', '2029-03-27', 3128, 88311);
INSERT INTO sportsman.medical_life VALUES (70538, '2029-04-18', '2029-05-03', 68731, 54030);
INSERT INTO sportsman.medical_life VALUES (21406, '2029-01-11', '2029-04-15', 34978, 15414);
INSERT INTO sportsman.medical_life VALUES (85574, '2029-02-03', '2029-03-28', 80315, 5412);
INSERT INTO sportsman.medical_life VALUES (53840, '2029-04-09', '2029-04-23', 44220, 68718);
INSERT INTO sportsman.medical_life VALUES (45438, '2029-02-04', '2029-04-14', 66895, 87875);
INSERT INTO sportsman.medical_life VALUES (74350, '2029-03-11', '2029-03-23', 75890, 13009);
INSERT INTO sportsman.medical_life VALUES (49689, '2029-03-29', '2029-04-28', 39263, 86671);
INSERT INTO sportsman.medical_life VALUES (10477, '2029-01-24', '2029-04-25', 39395, 15564);
INSERT INTO sportsman.medical_life VALUES (36181, '2029-02-26', '2029-05-04', 85896, 58095);
INSERT INTO sportsman.medical_life VALUES (99925, '2029-03-02', '2029-03-22', 91008, 15237);
INSERT INTO sportsman.medical_life VALUES (61904, '2029-02-02', '2029-04-29', 63004, 6261);
INSERT INTO sportsman.medical_life VALUES (92366, '2029-02-05', '2029-03-28', 21045, 9409);
INSERT INTO sportsman.medical_life VALUES (54617, '2029-01-10', '2029-02-24', 79500, 77076);
INSERT INTO sportsman.medical_life VALUES (50294, '2029-04-08', '2029-04-09', 4286, 10183);


--
-- TOC entry 4970 (class 0 OID 16647)
-- Dependencies: 221
-- Data for Name: sportsman; Type: TABLE DATA; Schema: sportsman; Owner: postgres
--

INSERT INTO sportsman.sportsman VALUES (94897, 'Jake', 'Christopher', 'Shawn', '2029-01-31', 11254, '7980714');
INSERT INTO sportsman.sportsman VALUES (89506, 'Angelica', 'William', 'Megan', '2029-02-28', 90021, '4111426');
INSERT INTO sportsman.sportsman VALUES (28770, 'Kyle', 'Mark', 'Kelly', '2029-01-17', 26001, '1998220');
INSERT INTO sportsman.sportsman VALUES (29165, 'Sarah', 'Robert', 'Dylan', '2029-03-16', 28799, '7878300');
INSERT INTO sportsman.sportsman VALUES (6609, 'Joan', 'Aaron', 'Daniel', '2029-04-05', 42995, '1801158');
INSERT INTO sportsman.sportsman VALUES (1013, 'Evan', 'Michael', 'Kevin', '2029-01-22', 83957, '8093293');
INSERT INTO sportsman.sportsman VALUES (5411, 'Renee', 'Amy', 'Vickie', '2029-01-18', 33879, '4393165');
INSERT INTO sportsman.sportsman VALUES (8652, 'Sarah', 'Michael', 'Andrew', '2029-03-28', 89965, '7633597');
INSERT INTO sportsman.sportsman VALUES (3128, 'Taylor', 'Gregory', 'Nancy', '2029-03-23', 2627, '6974725');
INSERT INTO sportsman.sportsman VALUES (68731, 'Thomas', 'Christopher', 'Jennifer', '2029-02-02', 10380, '2301156');
INSERT INTO sportsman.sportsman VALUES (34978, 'Kimberly', 'Kimberly', 'Matthew', '2029-01-08', 34869, '8413588');
INSERT INTO sportsman.sportsman VALUES (80315, 'James', 'Emma', 'Rebecca', '2029-03-02', 38644, '7788385');
INSERT INTO sportsman.sportsman VALUES (44220, 'Shannon', 'Jacqueline', 'Daniel', '2029-03-10', 35655, '5209008');
INSERT INTO sportsman.sportsman VALUES (66895, 'David', 'Kimberly', 'Cameron', '2029-01-27', 49496, '4564747');
INSERT INTO sportsman.sportsman VALUES (75890, 'Gloria', 'Renee', 'Kyle', '2029-01-25', 62674, '8019612');
INSERT INTO sportsman.sportsman VALUES (39263, 'Joel', 'Evelyn', 'Colin', '2029-02-25', 34894, '7281093');
INSERT INTO sportsman.sportsman VALUES (39395, 'Dakota', 'Angel', 'Joseph', '2029-01-22', 15475, '998348');
INSERT INTO sportsman.sportsman VALUES (85896, 'Marcus', 'John', 'Hannah', '2029-02-14', 40164, '7511015');
INSERT INTO sportsman.sportsman VALUES (91008, 'Jared', 'Richard', 'Christine', '2029-02-20', 68509, '9738023');
INSERT INTO sportsman.sportsman VALUES (63004, 'Andrew', 'Amanda', 'Bradley', '2029-01-30', 81102, '5763397');
INSERT INTO sportsman.sportsman VALUES (21045, 'Kendra', 'Cassandra', 'Lisa', '2029-02-07', 21805, '1678226');
INSERT INTO sportsman.sportsman VALUES (79500, 'Denise', 'Michele', 'Caleb', '2029-02-23', 96165, '1370133');
INSERT INTO sportsman.sportsman VALUES (4286, 'Steve', 'James', 'Samantha', '2029-02-08', 50345, '91788');


--
-- TOC entry 4973 (class 0 OID 16685)
-- Dependencies: 224
-- Data for Name: sportsman_qualification; Type: TABLE DATA; Schema: sportsman; Owner: postgres
--

INSERT INTO sportsman.sportsman_qualification VALUES (74158, '2029-01-08', '2029-02-21', 'Kristine', 30985, 94897, 11254);
INSERT INTO sportsman.sportsman_qualification VALUES (73814, '2029-03-27', '2029-04-16', 'David', 87196, 89506, 90021);
INSERT INTO sportsman.sportsman_qualification VALUES (10839, '2029-03-25', '2029-04-28', 'Emily', 192, 28770, 26001);
INSERT INTO sportsman.sportsman_qualification VALUES (28395, '2029-03-29', '2029-04-25', 'Victor', 77757, 29165, 28799);
INSERT INTO sportsman.sportsman_qualification VALUES (35865, '2029-04-17', '2029-05-06', 'Michael', 24738, 6609, 42995);
INSERT INTO sportsman.sportsman_qualification VALUES (25948, '2029-05-02', '2029-05-06', 'Jesse', 48975, 1013, 83957);
INSERT INTO sportsman.sportsman_qualification VALUES (39250, '2029-01-14', '2029-04-02', 'Elizabeth', 53093, 5411, 33879);
INSERT INTO sportsman.sportsman_qualification VALUES (5881, '2029-01-07', '2029-01-28', 'Guy', 79540, 8652, 89965);
INSERT INTO sportsman.sportsman_qualification VALUES (79760, '2029-03-02', '2029-03-08', 'Joseph', 70241, 3128, 2627);
INSERT INTO sportsman.sportsman_qualification VALUES (16832, '2029-01-29', '2029-05-02', 'Clayton', 771, 68731, 10380);
INSERT INTO sportsman.sportsman_qualification VALUES (89455, '2029-04-15', '2029-04-30', 'Robert', 78811, 34978, 34869);
INSERT INTO sportsman.sportsman_qualification VALUES (91982, '2029-04-30', '2029-05-03', 'Christine', 36000, 80315, 38644);
INSERT INTO sportsman.sportsman_qualification VALUES (36235, '2029-03-23', '2029-05-06', 'Michael', 15279, 44220, 35655);
INSERT INTO sportsman.sportsman_qualification VALUES (895, '2029-04-03', '2029-04-27', 'David', 16252, 66895, 49496);
INSERT INTO sportsman.sportsman_qualification VALUES (57439, '2029-01-25', '2029-02-27', 'Grant', 37594, 75890, 62674);
INSERT INTO sportsman.sportsman_qualification VALUES (92037, '2029-04-02', '2029-05-02', 'Curtis', 81240, 39263, 34894);
INSERT INTO sportsman.sportsman_qualification VALUES (42047, '2029-04-05', '2029-04-20', 'Darren', 92621, 39395, 15475);
INSERT INTO sportsman.sportsman_qualification VALUES (15950, '2029-03-05', '2029-04-03', 'Daniel', 25257, 85896, 40164);
INSERT INTO sportsman.sportsman_qualification VALUES (28031, '2029-03-15', '2029-05-06', 'James', 1518, 91008, 68509);
INSERT INTO sportsman.sportsman_qualification VALUES (28388, '2029-03-30', '2029-04-11', 'Amanda', 57188, 63004, 81102);
INSERT INTO sportsman.sportsman_qualification VALUES (11498, '2029-03-31', '2029-04-19', 'Rebecca', 29104, 21045, 21805);
INSERT INTO sportsman.sportsman_qualification VALUES (95753, '2029-02-28', '2029-04-23', 'Adam', 78240, 79500, 96165);
INSERT INTO sportsman.sportsman_qualification VALUES (30526, '2029-04-23', '2029-04-28', 'Nicholas', 41731, 4286, 50345);


--
-- TOC entry 4974 (class 0 OID 16702)
-- Dependencies: 225
-- Data for Name: sportsman_rating; Type: TABLE DATA; Schema: sportsman; Owner: postgres
--

INSERT INTO sportsman.sportsman_rating VALUES (95181, '2029-02-18', '2029-02-24', 94897);
INSERT INTO sportsman.sportsman_rating VALUES (12923, '2029-04-27', '2029-05-03', 89506);
INSERT INTO sportsman.sportsman_rating VALUES (26206, '2029-04-09', '2029-04-24', 28770);
INSERT INTO sportsman.sportsman_rating VALUES (91392, '2029-04-18', '2029-05-01', 29165);
INSERT INTO sportsman.sportsman_rating VALUES (28188, '2029-03-27', '2029-03-29', 6609);
INSERT INTO sportsman.sportsman_rating VALUES (34806, '2029-02-27', '2029-04-30', 1013);
INSERT INTO sportsman.sportsman_rating VALUES (66801, '2029-02-17', '2029-03-09', 5411);
INSERT INTO sportsman.sportsman_rating VALUES (16269, '2029-02-20', '2029-02-25', 8652);
INSERT INTO sportsman.sportsman_rating VALUES (7627, '2029-05-02', '2029-05-05', 3128);
INSERT INTO sportsman.sportsman_rating VALUES (84447, '2029-03-01', '2029-05-06', 68731);
INSERT INTO sportsman.sportsman_rating VALUES (92808, '2029-03-19', '2029-05-04', 34978);
INSERT INTO sportsman.sportsman_rating VALUES (53927, '2029-02-08', '2029-05-03', 80315);
INSERT INTO sportsman.sportsman_rating VALUES (56526, '2029-04-02', '2029-04-30', 44220);
INSERT INTO sportsman.sportsman_rating VALUES (33343, '2029-03-18', '2029-04-23', 66895);
INSERT INTO sportsman.sportsman_rating VALUES (31417, '2029-03-09', '2029-04-04', 75890);
INSERT INTO sportsman.sportsman_rating VALUES (49954, '2029-02-20', '2029-04-13', 39263);
INSERT INTO sportsman.sportsman_rating VALUES (9947, '2029-01-16', '2029-01-22', 39395);
INSERT INTO sportsman.sportsman_rating VALUES (49422, '2029-02-12', '2029-05-03', 85896);
INSERT INTO sportsman.sportsman_rating VALUES (52895, '2029-03-07', '2029-03-22', 91008);
INSERT INTO sportsman.sportsman_rating VALUES (43225, '2029-04-03', '2029-05-05', 63004);
INSERT INTO sportsman.sportsman_rating VALUES (6141, '2029-02-22', '2029-03-16', 21045);
INSERT INTO sportsman.sportsman_rating VALUES (38788, '2029-03-01', '2029-05-04', 79500);
INSERT INTO sportsman.sportsman_rating VALUES (14498, '2029-04-12', '2029-05-06', 4286);


--
-- TOC entry 4971 (class 0 OID 16660)
-- Dependencies: 222
-- Data for Name: type_of_injury; Type: TABLE DATA; Schema: sportsman; Owner: postgres
--

INSERT INTO sportsman.type_of_injury VALUES ('Sylvia', 25745, 'Standard organization above. But and anything organization. Us least officer.
Method Mr poor behavior who less specific. Mr oil team learn. Meet wish suffer stand common.', 'Student probably painting peace any. Experience woman nation plan. Billion decide father I food moment along. Image skin whose leader concern study.', 'Later cover contain computer painting. Job beat ok gun dog. Market past option where include people. Summer quality art improve.');
INSERT INTO sportsman.type_of_injury VALUES ('Robert', 24283, 'Look recognize evening recently home put compare. South mind range by join. So energy perform point shake generation successful.', 'Friend major western argue most. Office artist when rise media network. Force other century avoid amount marriage two. Daughter people fly top development season season.', 'Mr sing century exactly wear dog. Lot treat bad even research life body. Tend coach money use war open health set.');
INSERT INTO sportsman.type_of_injury VALUES ('Jacqueline', 2927, 'Second stock career their. Skin interview almost recognize back drop.
Reach answer develop keep. Rock dark rate certainly degree.', 'Whom area unit third. Pay itself list bring understand learn.
Dream other American response leg later rock result. Animal save test nearly nearly. Beyond wide join shake.', 'Drive customer ten play since his attention. Billion main resource.
Or risk evidence. Teacher Democrat bit bank contain crime.');
INSERT INTO sportsman.type_of_injury VALUES ('Brittany', 11277, 'Century responsibility information time. Free series increase however gas. Consider radio explain work conference school alone.', 'Can exactly half seek. City personal recent me modern particular for.
Charge lay doctor eat standard catch rather. Nice remain yourself skin. Body sound seem tend easy phone listen.', 'Understand allow hundred need enough serious. Collection plan trial company. Letter entire real apply. Fire mention information daughter section address.');
INSERT INTO sportsman.type_of_injury VALUES ('Mark', 67314, 'Learn other try. Mrs choice scientist teacher statement moment both. Try sense almost produce rich edge one.
Product study sing sea. Drop budget if. Thousand run coach bad direction nothing.', 'Two note as attack relate fine. Plan responsibility top which. May soon your ask explain test sometimes.
Animal current between eight. Indeed glass task read have trip.', 'Hope others space already face. Reality author church government kitchen newspaper can. Option play brother yeah.');
INSERT INTO sportsman.type_of_injury VALUES ('Erica', 93128, 'Hair political way size play majority event. Play option magazine number. Once us traditional business risk leave process.', 'Stop television according late hear member. Key face unit travel.
Work true offer. Soldier us record better maintain also. Real respond staff friend decide police list.', 'Get agency current network serious too. Field give just continue mean.
Federal take structure. Here seek oil summer option game only.');
INSERT INTO sportsman.type_of_injury VALUES ('Michael', 24655, 'Feeling heart person southern father capital. Popular plan find media whole fill early to. North perhaps win training get nor.', 'Finally new worry participant glass. Hundred without camera shoulder national nature share ago.
Guy work too. Family court subject surface reveal church value. Window dream city rock after season.', 'Reduce some dark sell prevent upon operation office. Reduce think national watch. Middle point him key hard product trial experience.');
INSERT INTO sportsman.type_of_injury VALUES ('Tara', 71725, 'Better professional many artist south under. Even leader she including feeling area partner. Great ground toward recently central.', 'None total open picture science. Certainly understand project work pretty reality wall.
Nothing drop participant Democrat manager involve. Live best ok personal.', 'Character until increase view data story west. Themselves lawyer none dog only. Word better college for music.');
INSERT INTO sportsman.type_of_injury VALUES ('Janet', 88311, 'Wonder Democrat west mother course out. Next so reveal low chance for.
Smile sure analysis year term his. Result manager knowledge war mention. Drive official notice relate term receive garden it.', 'Benefit success summer animal all fast. Page source option community recently.
Century window white simply. Town age attention affect most thing. Appear industry pull exist structure.', 'Company it forward seat wall. Under type movie guy strong realize direction investment.
Everybody learn pretty upon some. Lot he vote former. Suffer this tend discuss finish three stop throughout.');
INSERT INTO sportsman.type_of_injury VALUES ('Amber', 54030, 'Deal our perhaps detail movement. Reduce fall dinner beautiful enjoy lay sign magazine. Pass quickly administration chair near between.', 'Suddenly age run pattern. Happy clear west. Lose success man bar around.
With marriage economic economic. Visit themselves set best within television improve.', 'Party great purpose bag most political. Include tree business include sometimes ahead federal. Important why pull I.
Too college job lose six within.
Treatment market politics figure.');
INSERT INTO sportsman.type_of_injury VALUES ('Charles', 15414, 'Believe medical ball all that. Identify artist against present sometimes.', 'Much free toward oil. Town begin five style worker itself.
Prepare news interview take nearly government peace. Beautiful animal truth wife. Down dog quality wife contain.', 'Television within early forget skin college. Society too century computer page. On think talk most.
Just follow speech since. Something first picture leg agree Congress training.');
INSERT INTO sportsman.type_of_injury VALUES ('Jennifer', 5412, 'Probably way PM. Stay hair center yes determine.
Really according rise special.
Kid coach later close idea. Throw star everyone happen thank stock across. Speak laugh list describe test family color.', 'Claim anyone see water doctor green summer. Very team while firm fear. Truth edge stand decade our.', 'Capital treat article. Physical seat magazine add activity hard. Cost leave church left.
War place religious. His skill safe. Through weight leave company everyone. Human clear line yeah test.');
INSERT INTO sportsman.type_of_injury VALUES ('John', 68718, 'Gas evidence money hold stand cell voice. Growth after project.
Cup half investment result wear field degree hard. Administration resource worker trade. His power mention American interview its.', 'Above their lot maybe push few role pretty. Arrive sign bring performance college. Several machine camera material thousand.
Professional political view. Call blood than condition them.', 'So its already speech effect. Finally yard we. Too seven we.
Money month century. Record try above especially. Child hotel agency analysis understand dark.');
INSERT INTO sportsman.type_of_injury VALUES ('Shannon', 87875, 'Heart ground left experience. More pattern spend leader feeling issue hotel. Onto president reach exactly.
Young growth part win site. Rise economic work.', 'Kind tend girl somebody too show. Game former under fight probably party. Cultural I current.
So worry open subject suddenly pattern. Whole smile alone perhaps kind name. Appear soon man child.', 'Music happy training outside behavior. Outside pass manager also field. Which air to particularly station spend.
Where newspaper take year job suggest skin even. Focus down color force try.');
INSERT INTO sportsman.type_of_injury VALUES ('Erin', 13009, 'Son commercial maybe exactly increase. Perhaps current brother deep dark where.
Method fill military individual myself visit. Watch beautiful though.
Trip job discussion Democrat table speak peace.', 'Authority do research national against build. Chair likely pick network crime.
Or crime grow member edge cup. Citizen book democratic such also challenge. Our benefit up.
Director light man we game.', 'They sport ability author within nothing financial. Impact need behind. At green represent single build expert. My clearly drug trial report.');
INSERT INTO sportsman.type_of_injury VALUES ('Juan', 86671, 'Ahead tax newspaper. Take maybe or again language. Experience hold young business.', 'Spend wrong officer market. Say do high break. Operation of newspaper whatever evening indicate.', 'Happen out bad. Evidence particularly floor include move. Performance marriage husband seem fish most.');
INSERT INTO sportsman.type_of_injury VALUES ('Diamond', 15564, 'Record almost collection same. Test tell story in show.
People recent check control act. Activity news together now economic operation.', 'Soon thank hospital director. Discussion focus mission street hotel customer. More someone never five why new religious relationship.', 'Far nor ground game accept compare. Necessary reach garden town significant upon. Participant dark magazine raise show.');
INSERT INTO sportsman.type_of_injury VALUES ('Allison', 58095, 'Hand dog bag current. Shake by discuss reach international cost.
World near store shake relationship late. Discussion television music. Energy scene candidate question race.', 'Reduce computer he direction understand fight. Fly occur born us left interesting station theory. Yourself participant paper ahead section political.', 'Item maintain situation hot everyone hour war. Yes kind difficult hair better air eye. Down loss tonight soldier say goal.');
INSERT INTO sportsman.type_of_injury VALUES ('Antonio', 15237, 'Yourself reach offer hour then example music. Perhaps body understand key why school military.
Plant remember enough suddenly price. Congress ground country maybe buy.', 'Analysis trip carry old center service. Media group each structure story left. Stop world say job record.', 'Perform teach money television. Cut budget almost be bag real blood. Director discuss why imagine concern very man face.');
INSERT INTO sportsman.type_of_injury VALUES ('Daniel', 6261, 'Tax long research manager health visit available. See former them indeed. Everyone continue line account not appear couple.', 'Top lead part record yard hotel. May economic site government concern. Traditional build near term speech sign tax. Never financial affect happen number nature thus history.', 'Teacher section charge southern force next. Place media or sort once. Run behind control listen wind anyone.');
INSERT INTO sportsman.type_of_injury VALUES ('Christopher', 9409, 'Style key science after mother themselves. Class day mission represent.
Stage attack color us attack serious school. Development impact contain. I during break do fine property economy.', 'Sometimes dream blood somebody interest. Stuff identify exist risk together science. Sport score main by. Federal wear fast list bag these.', 'Avoid media military others price behind. Speak less life however animal street floor.');
INSERT INTO sportsman.type_of_injury VALUES ('Benjamin', 77076, 'Edge half discuss management six. Contain third raise. Including discussion red drive.
Standard throw big.', 'Plant rest somebody story low. Time meeting end purpose network will.
They brother personal late wind family. Part drug bad organization television.', 'Discuss throughout provide back sit move card. Probably people family heart blood follow until.
List speech by play major accept.');
INSERT INTO sportsman.type_of_injury VALUES ('Jill', 10183, 'Window government kid indicate.
Population foot recognize. Tend serve generation though role involve remain message. Year structure prepare capital.', 'Drug wrong room value. Identify day establish lot help build rule take. Million water evidence eat yard prepare.', 'See heavy camera everybody from wind. Travel early appear under form employee.
Face unit sure order finish. Claim theory identify in happen every.
Top I any send provide.');


--
-- TOC entry 4977 (class 0 OID 16742)
-- Dependencies: 228
-- Data for Name: leadership; Type: TABLE DATA; Schema: training_information; Owner: postgres
--

INSERT INTO training_information.leadership VALUES (18239, '2029-03-27', '2029-04-05', 94897, 67914);
INSERT INTO training_information.leadership VALUES (1908, '2029-02-01', '2029-02-03', 89506, 40948);
INSERT INTO training_information.leadership VALUES (70368, '2029-02-21', '2029-04-21', 28770, 87217);
INSERT INTO training_information.leadership VALUES (84930, '2029-03-28', '2029-04-03', 29165, 33555);
INSERT INTO training_information.leadership VALUES (42972, '2029-02-23', '2029-03-10', 6609, 47034);
INSERT INTO training_information.leadership VALUES (1765, '2029-05-04', '2029-05-06', 1013, 44882);
INSERT INTO training_information.leadership VALUES (1276, '2029-01-30', '2029-05-04', 5411, 17760);
INSERT INTO training_information.leadership VALUES (65235, '2029-05-02', '2029-05-06', 8652, 64670);
INSERT INTO training_information.leadership VALUES (1557, '2029-01-08', '2029-02-28', 3128, 76196);
INSERT INTO training_information.leadership VALUES (65266, '2029-03-04', '2029-05-05', 68731, 46511);
INSERT INTO training_information.leadership VALUES (61599, '2029-01-15', '2029-03-27', 34978, 24866);
INSERT INTO training_information.leadership VALUES (75846, '2029-01-24', '2029-02-07', 80315, 39524);
INSERT INTO training_information.leadership VALUES (29769, '2029-02-07', '2029-04-21', 44220, 86978);
INSERT INTO training_information.leadership VALUES (79368, '2029-03-27', '2029-05-04', 66895, 70473);
INSERT INTO training_information.leadership VALUES (56363, '2029-04-30', '2029-05-04', 75890, 33851);
INSERT INTO training_information.leadership VALUES (69571, '2029-01-14', '2029-02-04', 39263, 5199);
INSERT INTO training_information.leadership VALUES (18704, '2029-02-09', '2029-05-01', 39395, 21678);
INSERT INTO training_information.leadership VALUES (53385, '2029-02-23', '2029-04-29', 85896, 37053);
INSERT INTO training_information.leadership VALUES (98016, '2029-04-23', '2029-05-04', 91008, 64427);
INSERT INTO training_information.leadership VALUES (51959, '2029-04-24', '2029-04-30', 63004, 15643);
INSERT INTO training_information.leadership VALUES (5721, '2029-01-19', '2029-03-20', 21045, 56776);
INSERT INTO training_information.leadership VALUES (96502, '2029-01-08', '2029-03-08', 79500, 20413);
INSERT INTO training_information.leadership VALUES (55168, '2029-02-02', '2029-03-04', 4286, 32250);


--
-- TOC entry 4968 (class 0 OID 16628)
-- Dependencies: 219
-- Data for Name: sport_type; Type: TABLE DATA; Schema: training_information; Owner: postgres
--

INSERT INTO training_information.sport_type VALUES (37245, 11254, 'Degree human audience call defense region. Deep easy beautiful stay serious improve. Practice author pressure term fast Mr.');
INSERT INTO training_information.sport_type VALUES (67115, 90021, 'Someone computer effort work. Second that project stage partner how actually. Pressure as conference table.
When option man body professional Republican play. Year fact specific indeed history.');
INSERT INTO training_information.sport_type VALUES (66634, 26001, 'Physical forward thousand oil cost improve. Gas strategy letter draw know. Range yeah wonder meet.
Family but property. Born loss become enjoy gas fund.');
INSERT INTO training_information.sport_type VALUES (4692, 28799, 'Son late every end see bit movie owner. Fly heavy building some suffer west. Parent show allow.
Policy probably tax involve boy. Somebody thus this address job amount.');
INSERT INTO training_information.sport_type VALUES (40190, 42995, 'Leave sport manage discussion agreement game. Play reason treatment drug party.
Look bed field go whether really sound brother.');
INSERT INTO training_information.sport_type VALUES (41052, 83957, 'Report live seek. Begin matter my sea. Structure movie true nation always really.
Remember shoulder then. Situation century table. Nothing include raise oil article different.');
INSERT INTO training_information.sport_type VALUES (95819, 33879, 'High teacher along agency daughter coach recently. Red month beat difficult find fire certainly.');
INSERT INTO training_information.sport_type VALUES (21340, 89965, 'I southern well sense personal. Above little watch effort.
Beyond pretty born society none. Realize center performance order. Language guy hundred young.');
INSERT INTO training_information.sport_type VALUES (93849, 2627, 'Station call guy money us physical black.
Structure research poor notice myself among city. Need at little often. Free answer record peace throw.');
INSERT INTO training_information.sport_type VALUES (4449, 10380, 'All across show reflect effort trade wait fact. Instead year call tough occur me. Kid do book much.
Military give understand. Very reach election. Effect character field ask line store base.');
INSERT INTO training_information.sport_type VALUES (59839, 34869, 'Over owner make standard theory. When great ability true early record happen. Scene feeling material against month security.');
INSERT INTO training_information.sport_type VALUES (53351, 38644, 'Where consider think yourself attorney character. Customer method night front practice interest white law. Walk home miss arrive official that than west.');
INSERT INTO training_information.sport_type VALUES (23321, 35655, 'Miss understand although result hit morning need two. Table or environmental age early decision firm.');
INSERT INTO training_information.sport_type VALUES (82954, 49496, 'Campaign head dinner would big message yourself. Boy between us discover seat.
Accept operation behind. Good picture treat natural health later.');
INSERT INTO training_information.sport_type VALUES (99856, 62674, 'Collection hot yard society read pay edge. Like model nation well company real across. Cut it enjoy capital.
Friend high miss himself business full at. Better politics strategy hold miss.');
INSERT INTO training_information.sport_type VALUES (90819, 34894, 'House hair far. Quality cost today serious. Material writer describe into able. Another race with heart scene black race.');
INSERT INTO training_information.sport_type VALUES (64914, 15475, 'Simply street find. Well institution but art north agent.
Real choice cup chair per beyond. Memory herself buy quite value significant hear.
Summer right year forget.');
INSERT INTO training_information.sport_type VALUES (45249, 40164, 'Fear hundred Republican meeting social guy fire from. Such past first indeed.
World military cell door military reason director per. Apply according financial prevent example first spend wonder.');
INSERT INTO training_information.sport_type VALUES (62656, 68509, 'Eat green weight ball situation history war sit. Tend serious crime he yes rule. Price dinner security site.
Hair win smile under glass girl remember. Third myself increase about physical figure.');
INSERT INTO training_information.sport_type VALUES (95341, 81102, 'Actually ago receive article old. Response question think what. Go message hold religious occur.
Quality good speak magazine administration mouth when note. Clear fear clearly center realize explain.');
INSERT INTO training_information.sport_type VALUES (38253, 21805, 'Subject identify beyond strong week. More employee possible month single pressure trade.
Speech ability often artist commercial. Travel others order finish social someone theory. Large end from.');
INSERT INTO training_information.sport_type VALUES (26976, 96165, 'Administration exist build current special up woman. Treatment write owner method whether indeed. Send board possible later. Pretty there join notice prevent.');
INSERT INTO training_information.sport_type VALUES (54259, 50345, 'Perhaps quality story politics pretty fly as. Human assume less and thousand. System sense past present.');


--
-- TOC entry 4978 (class 0 OID 16758)
-- Dependencies: 229
-- Data for Name: training; Type: TABLE DATA; Schema: training_information; Owner: postgres
--

INSERT INTO training_information.training VALUES (2065, '2024-11-01 00:00:01', 'passed', 21045, 56776, 21805);
INSERT INTO training_information.training VALUES (4682, '2024-11-02 00:00:01', 'passed', 3128, 76196, 2627);
INSERT INTO training_information.training VALUES (15021, '2024-11-03 00:00:01', 'passed', 6609, 47034, 42995);
INSERT INTO training_information.training VALUES (22043, '2024-11-04 00:00:01', 'passed', 29165, 33555, 28799);
INSERT INTO training_information.training VALUES (28655, '2024-11-05 00:00:01', 'passed', 44220, 86978, 35655);
INSERT INTO training_information.training VALUES (33806, '2024-11-06 00:00:01', 'passed', 75890, 33851, 62674);
INSERT INTO training_information.training VALUES (36685, '2024-11-07 00:00:01', 'passed', 85896, 37053, 40164);
INSERT INTO training_information.training VALUES (40562, '2024-11-08 00:00:01', 'passed', 4286, 32250, 50345);
INSERT INTO training_information.training VALUES (41050, '2024-11-09 00:00:01', 'passed', 39395, 21678, 15475);
INSERT INTO training_information.training VALUES (46575, '2024-11-10 00:00:01', 'passed', 5411, 17760, 33879);
INSERT INTO training_information.training VALUES (49048, '2024-11-11 00:00:01', 'passed', 94897, 67914, 11254);
INSERT INTO training_information.training VALUES (52433, '2024-11-12 00:00:01', 'passed', 39263, 5199, 34894);
INSERT INTO training_information.training VALUES (59358, '2024-11-13 00:00:01', 'passed', 66895, 70473, 49496);
INSERT INTO training_information.training VALUES (62842, '2024-11-14 00:00:01', 'passed', 79500, 20413, 96165);
INSERT INTO training_information.training VALUES (66969, '2024-11-15 00:00:01', 'passed', 80315, 39524, 38644);
INSERT INTO training_information.training VALUES (68690, '2024-11-16 00:00:01', 'passed', 1013, 44882, 83957);
INSERT INTO training_information.training VALUES (76711, '2024-11-17 00:00:01', 'passed', 63004, 15643, 81102);
INSERT INTO training_information.training VALUES (79170, '2024-11-18 00:00:01', 'passed', 68731, 46511, 10380);
INSERT INTO training_information.training VALUES (88159, '2024-11-19 00:00:01', 'passed', 34978, 24866, 34869);
INSERT INTO training_information.training VALUES (89935, '2024-11-20 00:00:01', 'passed', 28770, 87217, 26001);
INSERT INTO training_information.training VALUES (95792, '2024-11-21 00:00:01', 'passed', 8652, 64670, 89965);
INSERT INTO training_information.training VALUES (97011, '2024-11-22 00:00:01', 'passed', 91008, 64427, 68509);
INSERT INTO training_information.training VALUES (98495, '2024-11-23 00:00:01', 'passed', 89506, 40948, 90021);


--
-- TOC entry 4789 (class 2606 OID 16722)
-- Name: coach_category category_pkey; Type: CONSTRAINT; Schema: coach; Owner: postgres
--

ALTER TABLE ONLY coach.coach_category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_code);


--
-- TOC entry 4791 (class 2606 OID 16734)
-- Name: coach_rating coach_rating_pkey; Type: CONSTRAINT; Schema: coach; Owner: postgres
--

ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT coach_rating_pkey PRIMARY KEY (rating_code);


--
-- TOC entry 4767 (class 2606 OID 16642)
-- Name: coach pk_coach_code; Type: CONSTRAINT; Schema: coach; Owner: postgres
--

ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT pk_coach_code PRIMARY KEY (coach_code);


--
-- TOC entry 4793 (class 2606 OID 16736)
-- Name: coach_rating unique_coach_code; Type: CONSTRAINT; Schema: coach; Owner: postgres
--

ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT unique_coach_code UNIQUE (coach_code);


--
-- TOC entry 4769 (class 2606 OID 16644)
-- Name: coach unique_coaches_passport_number; Type: CONSTRAINT; Schema: coach; Owner: postgres
--

ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT unique_coaches_passport_number UNIQUE (passport_number);


--
-- TOC entry 4771 (class 2606 OID 16646)
-- Name: coach unique_coaches_phone_number; Type: CONSTRAINT; Schema: coach; Owner: postgres
--

ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT unique_coaches_phone_number UNIQUE (phone_number);


--
-- TOC entry 4761 (class 2606 OID 24585)
-- Name: competition_conducting check_prize_place; Type: CHECK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE competition.competition_conducting
    ADD CONSTRAINT check_prize_place CHECK (((prize_place >= (1)::numeric) AND (prize_place <= (3)::numeric))) NOT VALID;


--
-- TOC entry 4803 (class 2606 OID 16823)
-- Name: competition_conducting competition_conducting_pkey; Type: CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT competition_conducting_pkey PRIMARY KEY (competition_conducting_code);


--
-- TOC entry 4799 (class 2606 OID 16789)
-- Name: competition competition_pkey; Type: CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.competition
    ADD CONSTRAINT competition_pkey PRIMARY KEY (competition_code);


--
-- TOC entry 4801 (class 2606 OID 16795)
-- Name: qualifying qualifying_pkey; Type: CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT qualifying_pkey PRIMARY KEY (qualifying_code);


--
-- TOC entry 4779 (class 2606 OID 16672)
-- Name: medical_life medical_life_pkey; Type: CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT medical_life_pkey PRIMARY KEY (medical_life_code);


--
-- TOC entry 4777 (class 2606 OID 16666)
-- Name: type_of_injury pk_injury_code; Type: CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.type_of_injury
    ADD CONSTRAINT pk_injury_code PRIMARY KEY (injury_code);


--
-- TOC entry 4773 (class 2606 OID 16652)
-- Name: sportsman sportsman_pkey; Type: CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT sportsman_pkey PRIMARY KEY (sportsman_code);


--
-- TOC entry 4783 (class 2606 OID 16691)
-- Name: sportsman_qualification sportsman_qualification_pkey; Type: CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT sportsman_qualification_pkey PRIMARY KEY (qualification_code);


--
-- TOC entry 4785 (class 2606 OID 16708)
-- Name: sportsman_rating sportsman_rating_pkey; Type: CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT sportsman_rating_pkey PRIMARY KEY (rating_code);


--
-- TOC entry 4787 (class 2606 OID 16710)
-- Name: sportsman_rating unique_sportsman_code; Type: CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT unique_sportsman_code UNIQUE (sportsman_code);


--
-- TOC entry 4781 (class 2606 OID 16674)
-- Name: medical_life unique_sportsman_code_medical; Type: CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT unique_sportsman_code_medical UNIQUE (sportsman_code);


--
-- TOC entry 4775 (class 2606 OID 16654)
-- Name: sportsman unique_sportsmans_passport_number; Type: CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT unique_sportsmans_passport_number UNIQUE (passport_number);


--
-- TOC entry 4795 (class 2606 OID 16747)
-- Name: leadership leadership_pkey; Type: CONSTRAINT; Schema: training_information; Owner: postgres
--

ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT leadership_pkey PRIMARY KEY (leadership_code);


--
-- TOC entry 4765 (class 2606 OID 16634)
-- Name: sport_type pk_sport_code; Type: CONSTRAINT; Schema: training_information; Owner: postgres
--

ALTER TABLE ONLY training_information.sport_type
    ADD CONSTRAINT pk_sport_code PRIMARY KEY (sport_code);


--
-- TOC entry 4797 (class 2606 OID 16764)
-- Name: training training_pkey; Type: CONSTRAINT; Schema: training_information; Owner: postgres
--

ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT training_pkey PRIMARY KEY (training_code);


--
-- TOC entry 4810 (class 2606 OID 16723)
-- Name: coach_category fk_coach_code; Type: FK CONSTRAINT; Schema: coach; Owner: postgres
--

ALTER TABLE ONLY coach.coach_category
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);


--
-- TOC entry 4811 (class 2606 OID 16737)
-- Name: coach_rating fk_coach_code; Type: FK CONSTRAINT; Schema: coach; Owner: postgres
--

ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);


--
-- TOC entry 4817 (class 2606 OID 16796)
-- Name: qualifying fk_coach_code; Type: FK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);


--
-- TOC entry 4821 (class 2606 OID 16824)
-- Name: competition_conducting fk_coach_code; Type: FK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);


--
-- TOC entry 4818 (class 2606 OID 16801)
-- Name: qualifying fk_competition_code; Type: FK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_competition_code FOREIGN KEY (competition_code) REFERENCES competition.competition(competition_code);


--
-- TOC entry 4822 (class 2606 OID 16829)
-- Name: competition_conducting fk_competition_code; Type: FK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_competition_code FOREIGN KEY (competition_code) REFERENCES competition.competition(competition_code);


--
-- TOC entry 4819 (class 2606 OID 16806)
-- Name: qualifying fk_sport_code; Type: FK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);


--
-- TOC entry 4823 (class 2606 OID 16834)
-- Name: competition_conducting fk_sport_code; Type: FK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);


--
-- TOC entry 4820 (class 2606 OID 16811)
-- Name: qualifying fk_sportsman_code; Type: FK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);


--
-- TOC entry 4824 (class 2606 OID 16839)
-- Name: competition_conducting fk_sportsman_code; Type: FK CONSTRAINT; Schema: competition; Owner: postgres
--

ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);


--
-- TOC entry 4805 (class 2606 OID 16675)
-- Name: medical_life fk_injury_code; Type: FK CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT fk_injury_code FOREIGN KEY (injury_code) REFERENCES sportsman.type_of_injury(injury_code);


--
-- TOC entry 4804 (class 2606 OID 16655)
-- Name: sportsman fk_sport_code; Type: FK CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);


--
-- TOC entry 4807 (class 2606 OID 16692)
-- Name: sportsman_qualification fk_sport_code; Type: FK CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);


--
-- TOC entry 4806 (class 2606 OID 16680)
-- Name: medical_life fk_sportsman_code; Type: FK CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);


--
-- TOC entry 4808 (class 2606 OID 16697)
-- Name: sportsman_qualification fk_sportsman_code; Type: FK CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);


--
-- TOC entry 4809 (class 2606 OID 16711)
-- Name: sportsman_rating fk_sportsman_code; Type: FK CONSTRAINT; Schema: sportsman; Owner: postgres
--

ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);


--
-- TOC entry 4812 (class 2606 OID 16748)
-- Name: leadership fk_coach_code; Type: FK CONSTRAINT; Schema: training_information; Owner: postgres
--

ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);


--
-- TOC entry 4814 (class 2606 OID 16765)
-- Name: training fk_coach_code; Type: FK CONSTRAINT; Schema: training_information; Owner: postgres
--

ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);


--
-- TOC entry 4815 (class 2606 OID 16770)
-- Name: training fk_sport_code; Type: FK CONSTRAINT; Schema: training_information; Owner: postgres
--

ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);


--
-- TOC entry 4813 (class 2606 OID 16753)
-- Name: leadership fk_sportsman_code; Type: FK CONSTRAINT; Schema: training_information; Owner: postgres
--

ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);


--
-- TOC entry 4816 (class 2606 OID 16775)
-- Name: training fk_sportsman_code; Type: FK CONSTRAINT; Schema: training_information; Owner: postgres
--

ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);


-- Completed on 2023-10-27 17:09:26

--
-- PostgreSQL database dump complete
--

