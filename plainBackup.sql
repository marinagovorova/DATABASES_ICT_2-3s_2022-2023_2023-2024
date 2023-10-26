--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-26 14:19:29

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
-- TOC entry 216 (class 1259 OID 16522)
-- Name: alien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alien (
    id_alien integer NOT NULL,
    humanoid integer
);


ALTER TABLE public.alien OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16521)
-- Name: alien_id_alien_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alien_id_alien_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alien_id_alien_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 215
-- Name: alien_id_alien_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alien_id_alien_seq OWNED BY public.alien.id_alien;


--
-- TOC entry 229 (class 1259 OID 16572)
-- Name: arms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arms (
    id_arms integer NOT NULL,
    quantity integer,
    fingers integer,
    CONSTRAINT quantity CHECK ((quantity >= 0))
);


ALTER TABLE public.arms OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16571)
-- Name: arms_id_arms_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arms_id_arms_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.arms_id_arms_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 228
-- Name: arms_id_arms_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arms_id_arms_seq OWNED BY public.arms.id_arms;


--
-- TOC entry 233 (class 1259 OID 16588)
-- Name: bodies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bodies (
    id_bodies integer NOT NULL,
    type character varying NOT NULL,
    CONSTRAINT type CHECK (((type)::text = ANY ((ARRAY['human'::character varying, 'alien'::character varying, 'unknown'::character varying])::text[])))
);


ALTER TABLE public.bodies OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16587)
-- Name: bodies_id_bodies_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bodies_id_bodies_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bodies_id_bodies_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 232
-- Name: bodies_id_bodies_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bodies_id_bodies_seq OWNED BY public.bodies.id_bodies;


--
-- TOC entry 237 (class 1259 OID 16606)
-- Name: fingers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fingers (
    id_fingers integer NOT NULL,
    quantity integer
);


ALTER TABLE public.fingers OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16605)
-- Name: fingers_id_fingers_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fingers_id_fingers_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fingers_id_fingers_seq OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 236
-- Name: fingers_id_fingers_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fingers_id_fingers_seq OWNED BY public.fingers.id_fingers;


--
-- TOC entry 231 (class 1259 OID 16579)
-- Name: hair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hair (
    id_hair integer NOT NULL,
    color character varying NOT NULL
);


ALTER TABLE public.hair OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16578)
-- Name: hair_id_hair_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hair_id_hair_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hair_id_hair_seq OWNER TO postgres;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 230
-- Name: hair_id_hair_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hair_id_hair_seq OWNED BY public.hair.id_hair;


--
-- TOC entry 218 (class 1259 OID 16529)
-- Name: human; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.human (
    id_human integer NOT NULL,
    having_belief boolean,
    humanoid integer,
    pasport integer
);


ALTER TABLE public.human OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16528)
-- Name: human_id_human_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.human_id_human_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.human_id_human_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 217
-- Name: human_id_human_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.human_id_human_seq OWNED BY public.human.id_human;


--
-- TOC entry 223 (class 1259 OID 16554)
-- Name: human_theory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.human_theory (
    id_theory integer,
    id_human integer
);


ALTER TABLE public.human_theory OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16536)
-- Name: humanoid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.humanoid (
    id_humanoid integer NOT NULL,
    legs integer,
    arms integer,
    hair integer,
    bodies integer,
    skin integer
);


ALTER TABLE public.humanoid OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16535)
-- Name: humanoid_id_humanoid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.humanoid_id_humanoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.humanoid_id_humanoid_seq OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 219
-- Name: humanoid_id_humanoid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.humanoid_id_humanoid_seq OWNED BY public.humanoid.id_humanoid;


--
-- TOC entry 227 (class 1259 OID 16565)
-- Name: legs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.legs (
    id_legs integer NOT NULL,
    quantity integer,
    fingers integer,
    CONSTRAINT quantity CHECK ((quantity >= 0))
);


ALTER TABLE public.legs OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16564)
-- Name: legs_id_legs_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.legs_id_legs_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.legs_id_legs_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 226
-- Name: legs_id_legs_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.legs_id_legs_seq OWNED BY public.legs.id_legs;


--
-- TOC entry 222 (class 1259 OID 16543)
-- Name: pasport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pasport (
    id_pasport integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    age integer NOT NULL,
    CONSTRAINT age CHECK ((age > 13))
);


ALTER TABLE public.pasport OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16542)
-- Name: pasport_id_pasport_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pasport_id_pasport_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pasport_id_pasport_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 221
-- Name: pasport_id_pasport_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pasport_id_pasport_seq OWNED BY public.pasport.id_pasport;


--
-- TOC entry 235 (class 1259 OID 16597)
-- Name: skin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skin (
    id_skin integer NOT NULL,
    color character varying NOT NULL
);


ALTER TABLE public.skin OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16596)
-- Name: skin_id_skin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skin_id_skin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skin_id_skin_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 234
-- Name: skin_id_skin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skin_id_skin_seq OWNED BY public.skin.id_skin;


--
-- TOC entry 225 (class 1259 OID 16558)
-- Name: theory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.theory (
    id_theory integer NOT NULL,
    number integer,
    CONSTRAINT number_greater_than_zero CHECK ((number > 0))
);


ALTER TABLE public.theory OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16557)
-- Name: theory_id_theory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.theory_id_theory_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.theory_id_theory_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 224
-- Name: theory_id_theory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.theory_id_theory_seq OWNED BY public.theory.id_theory;


--
-- TOC entry 4688 (class 2604 OID 16525)
-- Name: alien id_alien; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alien ALTER COLUMN id_alien SET DEFAULT nextval('public.alien_id_alien_seq'::regclass);


--
-- TOC entry 4694 (class 2604 OID 16575)
-- Name: arms id_arms; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arms ALTER COLUMN id_arms SET DEFAULT nextval('public.arms_id_arms_seq'::regclass);


--
-- TOC entry 4696 (class 2604 OID 16591)
-- Name: bodies id_bodies; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodies ALTER COLUMN id_bodies SET DEFAULT nextval('public.bodies_id_bodies_seq'::regclass);


--
-- TOC entry 4698 (class 2604 OID 16609)
-- Name: fingers id_fingers; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fingers ALTER COLUMN id_fingers SET DEFAULT nextval('public.fingers_id_fingers_seq'::regclass);


--
-- TOC entry 4695 (class 2604 OID 16582)
-- Name: hair id_hair; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair ALTER COLUMN id_hair SET DEFAULT nextval('public.hair_id_hair_seq'::regclass);


--
-- TOC entry 4689 (class 2604 OID 16532)
-- Name: human id_human; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.human ALTER COLUMN id_human SET DEFAULT nextval('public.human_id_human_seq'::regclass);


--
-- TOC entry 4690 (class 2604 OID 16539)
-- Name: humanoid id_humanoid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humanoid ALTER COLUMN id_humanoid SET DEFAULT nextval('public.humanoid_id_humanoid_seq'::regclass);


--
-- TOC entry 4693 (class 2604 OID 16568)
-- Name: legs id_legs; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legs ALTER COLUMN id_legs SET DEFAULT nextval('public.legs_id_legs_seq'::regclass);


--
-- TOC entry 4691 (class 2604 OID 16546)
-- Name: pasport id_pasport; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasport ALTER COLUMN id_pasport SET DEFAULT nextval('public.pasport_id_pasport_seq'::regclass);


--
-- TOC entry 4697 (class 2604 OID 16600)
-- Name: skin id_skin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin ALTER COLUMN id_skin SET DEFAULT nextval('public.skin_id_skin_seq'::regclass);


--
-- TOC entry 4692 (class 2604 OID 16561)
-- Name: theory id_theory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theory ALTER COLUMN id_theory SET DEFAULT nextval('public.theory_id_theory_seq'::regclass);


--
-- TOC entry 4897 (class 0 OID 16522)
-- Dependencies: 216
-- Data for Name: alien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alien (id_alien, humanoid) FROM stdin;
1	3
\.


--
-- TOC entry 4910 (class 0 OID 16572)
-- Dependencies: 229
-- Data for Name: arms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arms (id_arms, quantity, fingers) FROM stdin;
1	10	1
2	11	1
3	12	1
\.


--
-- TOC entry 4914 (class 0 OID 16588)
-- Dependencies: 233
-- Data for Name: bodies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bodies (id_bodies, type) FROM stdin;
1	human
2	alien
\.


--
-- TOC entry 4918 (class 0 OID 16606)
-- Dependencies: 237
-- Data for Name: fingers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fingers (id_fingers, quantity) FROM stdin;
1	10
2	30
3	24
\.


--
-- TOC entry 4912 (class 0 OID 16579)
-- Dependencies: 231
-- Data for Name: hair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hair (id_hair, color) FROM stdin;
1	brown
2	blonde
3	black
4	red
\.


--
-- TOC entry 4899 (class 0 OID 16529)
-- Dependencies: 218
-- Data for Name: human; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.human (id_human, having_belief, humanoid, pasport) FROM stdin;
1	t	1	1
2	f	2	2
\.


--
-- TOC entry 4904 (class 0 OID 16554)
-- Dependencies: 223
-- Data for Name: human_theory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.human_theory (id_theory, id_human) FROM stdin;
\.


--
-- TOC entry 4901 (class 0 OID 16536)
-- Dependencies: 220
-- Data for Name: humanoid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.humanoid (id_humanoid, legs, arms, hair, bodies, skin) FROM stdin;
1	1	1	1	1	1
2	2	2	2	2	2
3	3	3	3	1	3
\.


--
-- TOC entry 4908 (class 0 OID 16565)
-- Dependencies: 227
-- Data for Name: legs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legs (id_legs, quantity, fingers) FROM stdin;
1	10	1
2	11	1
3	12	1
\.


--
-- TOC entry 4903 (class 0 OID 16543)
-- Dependencies: 222
-- Data for Name: pasport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pasport (id_pasport, name, surname, age) FROM stdin;
1	John	Doe	30
2	Jane	Doe	25
3	Alien	X	35
\.


--
-- TOC entry 4916 (class 0 OID 16597)
-- Dependencies: 235
-- Data for Name: skin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin (id_skin, color) FROM stdin;
1	white
2	black
3	blue
4	green
\.


--
-- TOC entry 4906 (class 0 OID 16558)
-- Dependencies: 225
-- Data for Name: theory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.theory (id_theory, number) FROM stdin;
1	42
2	666
3	101010
\.


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 215
-- Name: alien_id_alien_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alien_id_alien_seq', 1, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 228
-- Name: arms_id_arms_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arms_id_arms_seq', 3, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 232
-- Name: bodies_id_bodies_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bodies_id_bodies_seq', 3, true);


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 236
-- Name: fingers_id_fingers_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fingers_id_fingers_seq', 3, true);


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 230
-- Name: hair_id_hair_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hair_id_hair_seq', 4, true);


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 217
-- Name: human_id_human_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.human_id_human_seq', 4, true);


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 219
-- Name: humanoid_id_humanoid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.humanoid_id_humanoid_seq', 9, true);


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 226
-- Name: legs_id_legs_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.legs_id_legs_seq', 3, true);


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 221
-- Name: pasport_id_pasport_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pasport_id_pasport_seq', 3, true);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 234
-- Name: skin_id_skin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_id_skin_seq', 5, true);


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 224
-- Name: theory_id_theory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.theory_id_theory_seq', 3, true);


--
-- TOC entry 4705 (class 2606 OID 16527)
-- Name: alien alien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_pkey PRIMARY KEY (id_alien);


--
-- TOC entry 4729 (class 2606 OID 16577)
-- Name: arms arms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arms
    ADD CONSTRAINT arms_pkey PRIMARY KEY (id_arms);


--
-- TOC entry 4734 (class 2606 OID 16595)
-- Name: bodies bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodies
    ADD CONSTRAINT bodies_pkey PRIMARY KEY (id_bodies);


--
-- TOC entry 4736 (class 2606 OID 16688)
-- Name: skin color; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin
    ADD CONSTRAINT color UNIQUE (color) INCLUDE (color);


--
-- TOC entry 4740 (class 2606 OID 16611)
-- Name: fingers fingers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fingers
    ADD CONSTRAINT fingers_pkey PRIMARY KEY (id_fingers);


--
-- TOC entry 4732 (class 2606 OID 16586)
-- Name: hair hair_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair
    ADD CONSTRAINT hair_pkey PRIMARY KEY (id_hair);


--
-- TOC entry 4710 (class 2606 OID 16534)
-- Name: human human_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT human_pkey PRIMARY KEY (id_human);


--
-- TOC entry 4717 (class 2606 OID 16541)
-- Name: humanoid humanoid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT humanoid_pkey PRIMARY KEY (id_humanoid);


--
-- TOC entry 4727 (class 2606 OID 16570)
-- Name: legs legs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legs
    ADD CONSTRAINT legs_pkey PRIMARY KEY (id_legs);


--
-- TOC entry 4723 (class 2606 OID 16690)
-- Name: theory number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theory
    ADD CONSTRAINT number UNIQUE (number) INCLUDE (number);


--
-- TOC entry 4719 (class 2606 OID 16550)
-- Name: pasport pasport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasport
    ADD CONSTRAINT pasport_pkey PRIMARY KEY (id_pasport);


--
-- TOC entry 4738 (class 2606 OID 16604)
-- Name: skin skin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin
    ADD CONSTRAINT skin_pkey PRIMARY KEY (id_skin);


--
-- TOC entry 4725 (class 2606 OID 16563)
-- Name: theory theory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theory
    ADD CONSTRAINT theory_pkey PRIMARY KEY (id_theory);


--
-- TOC entry 4711 (class 1259 OID 16659)
-- Name: fki_arms_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_arms_fkey ON public.humanoid USING btree (arms);


--
-- TOC entry 4712 (class 1259 OID 16671)
-- Name: fki_bodies_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_bodies_fkey ON public.humanoid USING btree (bodies);


--
-- TOC entry 4730 (class 1259 OID 16623)
-- Name: fki_fingers_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fingers_fkey ON public.arms USING btree (fingers);


--
-- TOC entry 4713 (class 1259 OID 16665)
-- Name: fki_hair_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_hair_fkey ON public.humanoid USING btree (hair);


--
-- TOC entry 4706 (class 1259 OID 16617)
-- Name: fki_humanoid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_humanoid ON public.alien USING btree (humanoid);


--
-- TOC entry 4707 (class 1259 OID 16629)
-- Name: fki_humanoid_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_humanoid_fkey ON public.human USING btree (humanoid);


--
-- TOC entry 4720 (class 1259 OID 16647)
-- Name: fki_id_human_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_human_fkey ON public.human_theory USING btree (id_human);


--
-- TOC entry 4721 (class 1259 OID 16641)
-- Name: fki_id_theory_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_theory_fkey ON public.human_theory USING btree (id_theory);


--
-- TOC entry 4708 (class 1259 OID 16635)
-- Name: fki_pasport_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pasport_fkey ON public.human USING btree (pasport);


--
-- TOC entry 4714 (class 1259 OID 16677)
-- Name: fki_skin_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_skin_fkey ON public.humanoid USING btree (skin);


--
-- TOC entry 4715 (class 1259 OID 16653)
-- Name: fki_р; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_р" ON public.humanoid USING btree (legs);


--
-- TOC entry 4744 (class 2606 OID 16654)
-- Name: humanoid arms_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT arms_fkey FOREIGN KEY (arms) REFERENCES public.arms(id_arms);


--
-- TOC entry 4745 (class 2606 OID 16666)
-- Name: humanoid bodies_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT bodies_fkey FOREIGN KEY (bodies) REFERENCES public.bodies(id_bodies);


--
-- TOC entry 4752 (class 2606 OID 16618)
-- Name: arms fingers_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arms
    ADD CONSTRAINT fingers_fkey FOREIGN KEY (fingers) REFERENCES public.fingers(id_fingers);


--
-- TOC entry 4751 (class 2606 OID 16678)
-- Name: legs fingers_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legs
    ADD CONSTRAINT fingers_fkey FOREIGN KEY (fingers) REFERENCES public.fingers(id_fingers);


--
-- TOC entry 4746 (class 2606 OID 16660)
-- Name: humanoid hair_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT hair_fkey FOREIGN KEY (hair) REFERENCES public.hair(id_hair);


--
-- TOC entry 4741 (class 2606 OID 16612)
-- Name: alien humanoid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alien
    ADD CONSTRAINT humanoid_fkey FOREIGN KEY (humanoid) REFERENCES public.humanoid(id_humanoid);


--
-- TOC entry 4742 (class 2606 OID 16624)
-- Name: human humanoid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT humanoid_fkey FOREIGN KEY (humanoid) REFERENCES public.humanoid(id_humanoid);


--
-- TOC entry 4749 (class 2606 OID 16642)
-- Name: human_theory id_human_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.human_theory
    ADD CONSTRAINT id_human_fkey FOREIGN KEY (id_human) REFERENCES public.human(id_human);


--
-- TOC entry 4750 (class 2606 OID 16636)
-- Name: human_theory id_theory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.human_theory
    ADD CONSTRAINT id_theory_fkey FOREIGN KEY (id_theory) REFERENCES public.theory(id_theory);


--
-- TOC entry 4747 (class 2606 OID 16648)
-- Name: humanoid legs_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT legs_fkey FOREIGN KEY (legs) REFERENCES public.legs(id_legs);


--
-- TOC entry 4743 (class 2606 OID 16630)
-- Name: human pasport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT pasport_fkey FOREIGN KEY (pasport) REFERENCES public.pasport(id_pasport);


--
-- TOC entry 4748 (class 2606 OID 16672)
-- Name: humanoid skin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT skin_fkey FOREIGN KEY (skin) REFERENCES public.skin(id_skin);


-- Completed on 2023-10-26 14:19:29

--
-- PostgreSQL database dump complete
--

