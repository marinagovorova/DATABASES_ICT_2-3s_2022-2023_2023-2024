--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-08 15:44:30

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

DROP DATABASE "Library";
--
-- TOC entry 4888 (class 1262 OID 16397)
-- Name: Library; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Library" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Library" OWNER TO postgres;

\connect "Library"

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
-- TOC entry 225 (class 1259 OID 24617)
-- Name: act_of_debiting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_of_debiting (
    id_act_of_debiting integer NOT NULL,
    date date NOT NULL,
    id_copy_of_book integer NOT NULL,
    id_employee integer NOT NULL,
    reason character varying(100) NOT NULL
);


ALTER TABLE public.act_of_debiting OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24634)
-- Name: act_of_donation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_of_donation (
    id_actofdonation integer NOT NULL,
    date date NOT NULL,
    substitution boolean NOT NULL,
    id_employee integer NOT NULL,
    id_copyofbook integer NOT NULL
);


ALTER TABLE public.act_of_donation OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24600)
-- Name: act_of_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.act_of_registration (
    id_act_of_registration integer NOT NULL,
    id_employee integer NOT NULL,
    id_copy_of_book integer NOT NULL,
    date_of_signing date NOT NULL,
    sourse character varying NOT NULL
);


ALTER TABLE public.act_of_registration OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24588)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id_book integer NOT NULL,
    year_of_writing integer NOT NULL,
    number_of_volume integer NOT NULL,
    name_of_book character varying(1000) NOT NULL,
    authors character varying(1000) NOT NULL,
    language character varying(100) NOT NULL,
    area_of_knowledge character varying(100) NOT NULL,
    genre character varying(100) NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16411)
-- Name: book_circulation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_circulation (
    number_of_operation integer NOT NULL,
    id_reader integer NOT NULL,
    issue_date date NOT NULL,
    return_date date NOT NULL,
    return_date_plan date NOT NULL,
    fine boolean DEFAULT false NOT NULL,
    id_copy_of_book integer NOT NULL
);


ALTER TABLE public.book_circulation OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16468)
-- Name: copy_of_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.copy_of_book (
    id_copy_of_book integer NOT NULL,
    availability boolean NOT NULL,
    id_publication integer NOT NULL,
    condition character varying(50) NOT NULL
);


ALTER TABLE public.copy_of_book OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16422)
-- Name: emploee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emploee (
    id_employee integer NOT NULL,
    surname character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    post character varying(50) NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.emploee OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24659)
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    id_invoice integer NOT NULL,
    date date NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16497)
-- Name: publication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publication (
    library_code integer NOT NULL,
    id_publishing_house integer NOT NULL,
    year_of_release integer NOT NULL,
    id_book integer NOT NULL,
    language character varying NOT NULL
);


ALTER TABLE public.publication OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24576)
-- Name: publishing_house; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publishing_house (
    id_publishing_house integer NOT NULL,
    compilers character varying(500) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.publishing_house OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16403)
-- Name: reader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reader (
    id_reader integer NOT NULL,
    count_of_books integer NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    phone_number character varying(20) NOT NULL,
    address character varying(100) NOT NULL,
    passport character varying(100) NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.reader OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16478)
-- Name: storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage (
    id_storage integer NOT NULL,
    room_number integer NOT NULL,
    shelf_number integer NOT NULL,
    rack_number integer NOT NULL
);


ALTER TABLE public.storage OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16475)
-- Name: stored; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stored (
    start_of_storing date NOT NULL,
    finish_of_storing date NOT NULL,
    id_book integer NOT NULL,
    id_storage integer NOT NULL
);


ALTER TABLE public.stored OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24649)
-- Name: structure_of_invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structure_of_invoice (
    id_invoice integer NOT NULL,
    id_act_of_registration integer NOT NULL
);


ALTER TABLE public.structure_of_invoice OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 24617)
-- Dependencies: 225
-- Data for Name: act_of_debiting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_of_debiting (id_act_of_debiting, date, id_copy_of_book, id_employee, reason) FROM stdin;
1	2023-11-03	808	6	book theft
2	2023-05-25	67	1	lost book
3	2023-11-03	457	7	miscommunication
4	2023-08-25	396	5	misplacement
5	2023-04-10	280	1	borrower's request
6	2023-03-30	117	1	borrower's request
7	2023-03-09	996	8	miscommunication
8	2023-07-20	631	3	unauthorized borrowing
9	2023-04-29	757	6	borrower's request
10	2023-01-12	411	8	lost book
11	2023-09-26	101	8	book theft
12	2023-08-21	542	8	system error
13	2023-03-20	745	4	book theft
14	2023-08-01	130	6	book theft
15	2023-08-17	38	2	misplacement
16	2023-08-06	39	5	book theft
17	2023-11-02	434	1	miscommunication
18	2023-07-01	744	4	damaged book
19	2023-05-05	602	2	unpaid fines
20	2023-06-29	523	3	book theft
21	2023-06-08	793	4	borrower's request
22	2023-09-04	857	4	borrower's request
23	2023-04-16	423	1	lost book
24	2023-01-14	405	2	borrower's request
25	2023-06-25	740	6	damaged book
26	2023-11-30	953	7	unauthorized borrowing
27	2023-02-21	509	8	borrower's request
28	2022-12-31	710	1	borrower's request
29	2022-12-25	516	6	borrower's request
30	2022-12-20	645	5	book theft
31	2023-01-10	698	1	unpaid fines
32	2023-11-03	810	7	borrower's request
33	2023-07-22	17	3	lost book
34	2023-06-29	636	7	miscommunication
35	2023-04-11	990	1	borrower's request
36	2023-03-05	622	1	misplacement
37	2023-06-22	799	5	system error
38	2023-03-19	946	1	system error
39	2023-03-06	905	8	book theft
40	2023-08-30	73	5	damaged book
41	2023-02-15	844	4	damaged book
42	2023-06-25	485	2	misplacement
43	2023-02-03	781	8	lost book
44	2023-01-05	154	5	book theft
45	2023-07-31	314	3	system error
46	2022-12-20	994	5	system error
47	2023-04-13	456	5	misplacement
48	2023-03-05	514	2	lost book
49	2023-10-09	643	6	book theft
50	2023-06-29	832	7	lost book
51	2023-01-20	542	5	misplacement
52	2023-04-19	596	6	misplacement
53	2023-11-26	168	1	miscommunication
54	2023-04-14	427	3	system error
55	2023-01-28	156	1	unauthorized borrowing
56	2023-05-01	464	1	miscommunication
57	2023-06-03	851	1	unauthorized borrowing
58	2023-09-23	880	7	borrower's request
59	2023-06-29	413	4	unauthorized borrowing
60	2023-10-10	170	5	unauthorized borrowing
61	2023-01-15	878	3	system error
62	2023-04-01	472	5	lost book
63	2023-05-10	874	2	misplacement
64	2023-02-12	514	5	system error
65	2023-03-25	420	3	lost book
66	2023-08-27	541	6	damaged book
67	2023-03-05	898	7	unauthorized borrowing
68	2023-11-19	223	7	unpaid fines
69	2023-03-28	894	5	unauthorized borrowing
70	2023-10-13	482	6	miscommunication
71	2023-01-22	782	5	borrower's request
72	2023-01-04	420	2	lost book
73	2023-01-11	515	4	unauthorized borrowing
74	2023-01-12	19	4	damaged book
75	2023-03-21	649	7	system error
76	2023-08-16	50	4	damaged book
77	2023-04-19	915	5	borrower's request
78	2023-06-01	773	4	miscommunication
79	2023-11-27	636	5	misplacement
80	2023-04-12	109	5	lost book
81	2023-06-29	172	5	book theft
82	2023-05-22	402	1	borrower's request
83	2023-01-01	118	4	miscommunication
84	2023-08-04	654	3	lost book
85	2023-01-29	863	8	miscommunication
86	2023-04-07	29	6	lost book
87	2023-09-23	765	6	miscommunication
88	2023-01-22	782	5	unpaid fines
89	2023-09-18	399	4	damaged book
90	2023-08-27	636	7	misplacement
91	2023-08-04	554	7	damaged book
92	2023-04-06	456	2	misplacement
93	12023-01-12	271	6	system error
94	12023-01-28	296	3	unpaid fines
95	2023-01-14	868	5	unauthorized borrowing
96	2023-11-25	134	3	misplacement
97	2023-03-07	947	6	borrower's request
98	2023-03-05	795	7	lost book
99	2023-08-08	662	3	misplacement
100	2022-12-17	369	1	unpaid fines
101	2023-11-21	462	1	misplacement
102	2023-02-12	840	1	damaged book
103	2023-05-19	311	6	borrower's request
104	2023-10-25	511	1	misplacement
105	2023-09-29	281	2	unpaid fines
106	2023-05-19	265	2	book theft
107	2023-01-28	284	6	misplacement
108	2023-11-06	275	2	system error
109	2023-01-29	315	6	unauthorized borrowing
110	2023-03-24	301	2	book theft
111	2023-09-09	283	7	system error
112	2023-03-02	421	1	miscommunication
113	2023-02-07	688	1	book theft
114	2023-09-13	159	2	miscommunication
115	2023-08-23	809	2	unpaid fines
116	2023-04-30	560	7	unauthorized borrowing
117	2022-12-28	814	1	unpaid fines
118	2023-02-12	502	1	lost book
119	2023-05-16	648	7	damaged book
120	2023-07-06	561	7	system error
121	2023-11-17	312	8	system error
122	2023-08-14	60	3	unpaid fines
123	2023-10-14	885	2	book theft
124	2023-11-06	575	2	book theft
125	2023-05-17	888	2	unauthorized borrowing
126	2023-09-28	101	2	system error
127	2022-12-29	763	1	unauthorized borrowing
128	2023-01-03	214	1	book theft
129	2023-05-01	500	6	miscommunication
130	2022-12-07	315	4	borrower's request
131	2023-02-02	27	8	unauthorized borrowing
132	2023-08-06	514	3	borrower's request
133	2023-06-24	638	2	unauthorized borrowing
134	2023-12-06	336	4	unauthorized borrowing
135	2023-05-28	793	5	lost book
136	2023-06-04	473	2	unauthorized borrowing
137	2023-06-01	251	8	unpaid fines
138	12023-01-11	930	8	unauthorized borrowing
139	2022-12-12	703	5	book theft
140	12023-02-03	943	4	unauthorized borrowing
141	2023-07-29	500	2	book theft
142	2023-04-25	230	4	lost book
143	2022-12-12	20	2	unauthorized borrowing
144	2023-10-05	121	6	book theft
145	2023-08-22	746	2	unpaid fines
146	2023-04-18	283	2	miscommunication
147	2023-04-11	855	1	misplacement
148	2023-10-13	336	4	miscommunication
149	12023-01-22	791	7	borrower's request
150	2023-02-09	398	7	system error
151	2023-05-30	734	3	system error
152	2023-08-09	314	7	miscommunication
153	2023-08-13	630	6	unpaid fines
154	2023-06-09	353	7	book theft
155	2023-07-02	730	6	unauthorized borrowing
156	2023-12-01	252	2	misplacement
157	2023-07-06	443	2	misplacement
158	2023-08-05	162	2	unauthorized borrowing
159	2023-10-07	28	2	damaged book
160	2023-04-26	41	3	borrower's request
161	2023-03-31	398	4	book theft
162	2023-01-03	594	5	system error
163	2023-07-10	142	3	lost book
164	2023-07-16	959	5	lost book
165	2023-06-27	349	1	unauthorized borrowing
166	2023-03-06	606	8	system error
167	2023-09-22	205	4	misplacement
168	2023-09-16	576	8	borrower's request
169	2023-08-25	552	2	book theft
170	2023-03-10	948	2	misplacement
171	2023-10-27	919	4	miscommunication
172	12023-01-14	464	8	book theft
173	2023-05-20	374	1	misplacement
174	2023-10-05	782	3	borrower's request
175	2023-09-13	97	7	damaged book
176	2023-03-25	906	5	lost book
177	2022-12-29	658	1	system error
178	2023-05-03	317	7	book theft
179	2023-09-02	437	1	lost book
180	2023-05-28	794	5	lost book
181	2023-06-11	874	6	unauthorized borrowing
182	2023-09-08	526	3	unauthorized borrowing
183	2023-10-09	539	2	book theft
184	12023-02-02	38	4	unauthorized borrowing
185	2023-01-09	883	7	unpaid fines
186	2023-03-09	296	4	damaged book
187	2023-07-20	422	5	unauthorized borrowing
188	2023-10-18	938	8	lost book
189	2023-12-05	640	1	borrower's request
190	2023-01-14	928	2	miscommunication
191	2023-08-11	309	6	unpaid fines
192	2022-12-19	371	2	lost book
193	2023-02-17	418	6	damaged book
194	2023-02-19	492	4	system error
195	2023-10-19	568	7	misplacement
196	12023-02-02	920	5	damaged book
197	2023-05-02	1000	5	damaged book
198	2023-09-11	212	8	damaged book
199	2023-05-27	571	4	book theft
200	2023-01-08	631	1	unauthorized borrowing
201	2023-09-05	786	7	lost book
202	2023-03-09	38	7	lost book
203	2023-07-21	809	1	miscommunication
204	2022-12-25	970	3	system error
205	2023-03-06	20	7	unpaid fines
206	2023-12-06	862	6	unauthorized borrowing
207	2023-07-12	613	4	book theft
208	2023-08-09	367	5	damaged book
209	2023-07-03	5	5	miscommunication
210	2022-12-21	748	8	miscommunication
211	2023-06-21	451	7	damaged book
212	12023-01-15	112	5	misplacement
213	2023-09-29	656	7	miscommunication
214	2023-10-05	195	4	book theft
215	2023-04-10	684	1	lost book
216	2023-05-23	925	5	borrower's request
217	2023-03-16	57	7	misplacement
218	2023-10-06	135	3	borrower's request
219	2023-05-22	190	5	damaged book
220	2023-09-21	874	6	miscommunication
221	2023-06-21	480	1	misplacement
222	2023-04-12	415	6	unauthorized borrowing
223	2023-06-21	798	5	damaged book
224	2023-05-10	787	4	borrower's request
225	2023-07-31	683	3	system error
226	2022-12-11	307	8	system error
227	2023-11-17	934	1	borrower's request
228	2023-04-08	704	4	book theft
229	2023-10-22	590	7	lost book
230	12023-01-14	218	3	unpaid fines
231	2023-03-30	339	6	unauthorized borrowing
232	2023-06-09	102	7	miscommunication
233	2023-10-21	276	1	lost book
234	12023-01-14	612	2	unauthorized borrowing
235	2022-12-16	595	1	damaged book
236	2023-09-30	474	6	misplacement
237	2023-09-27	657	7	damaged book
238	12023-01-01	277	5	unpaid fines
239	2023-02-20	513	4	borrower's request
240	2023-08-09	251	5	miscommunication
241	2023-03-25	96	2	damaged book
242	2023-01-28	932	4	miscommunication
243	2023-10-22	485	6	misplacement
244	2023-09-25	996	3	unpaid fines
245	2023-02-11	916	4	miscommunication
246	2023-11-27	813	2	system error
247	2023-03-15	265	8	damaged book
248	2023-02-27	695	6	borrower's request
249	2023-01-03	927	8	damaged book
250	2022-12-13	760	6	miscommunication
251	2022-12-21	290	5	lost book
252	2022-12-24	932	6	book theft
253	2023-01-03	51	7	book theft
254	2023-01-03	115	5	unpaid fines
255	2023-10-20	220	7	lost book
256	2023-10-07	897	7	misplacement
257	2023-05-31	23	8	borrower's request
258	2023-06-11	945	6	unpaid fines
259	12023-01-20	222	3	system error
260	2023-07-25	446	1	system error
261	2023-06-12	887	5	misplacement
262	2022-12-19	199	5	damaged book
263	2023-08-06	40	4	lost book
264	2023-07-15	999	7	miscommunication
265	12023-01-14	481	5	system error
266	2023-02-24	230	1	damaged book
267	12023-01-12	756	2	misplacement
268	2023-06-01	844	2	misplacement
269	2023-07-30	619	4	miscommunication
270	2023-01-07	350	8	unauthorized borrowing
271	2023-05-20	406	1	lost book
272	2023-10-17	935	8	book theft
273	12023-02-02	279	8	unauthorized borrowing
274	2023-08-27	778	3	damaged book
275	2023-04-13	511	3	misplacement
276	2023-04-17	503	6	unauthorized borrowing
277	2022-12-25	847	3	damaged book
278	2023-07-25	222	1	unauthorized borrowing
279	2023-07-03	513	7	book theft
280	2023-05-19	420	5	lost book
281	2023-01-24	556	3	system error
282	2023-10-21	907	6	damaged book
283	2023-07-08	740	7	unpaid fines
284	2023-05-31	192	4	miscommunication
285	2023-10-01	312	4	unauthorized borrowing
286	2023-07-17	592	6	system error
287	2023-01-28	596	4	miscommunication
288	2023-02-02	805	3	misplacement
289	2023-01-16	906	8	damaged book
290	2023-02-17	576	1	lost book
291	2023-03-24	334	8	lost book
292	2023-01-19	659	7	lost book
293	2023-09-01	595	3	unauthorized borrowing
294	2023-07-23	422	5	system error
295	2023-11-25	675	2	book theft
296	2023-09-10	15	8	unpaid fines
297	2023-08-18	349	3	book theft
298	2022-12-30	865	2	damaged book
299	2023-04-25	897	4	lost book
300	2022-12-23	241	6	miscommunication
301	2023-10-14	38	7	borrower's request
302	2023-06-03	108	1	book theft
303	2023-08-22	990	7	unauthorized borrowing
304	2023-03-09	681	1	unauthorized borrowing
305	2023-10-05	315	3	lost book
306	2023-11-30	641	1	unauthorized borrowing
307	2023-04-18	835	7	damaged book
308	2023-01-22	772	2	lost book
309	2023-01-31	607	4	unpaid fines
310	2023-10-06	679	1	borrower's request
311	2023-08-13	162	1	book theft
312	12023-01-04	513	6	book theft
313	2023-06-13	583	3	borrower's request
314	2023-04-03	943	2	borrower's request
315	2023-03-01	852	6	borrower's request
316	2023-08-09	93	4	damaged book
317	2023-06-27	337	7	borrower's request
318	2023-07-08	421	3	book theft
319	2023-04-29	122	4	borrower's request
320	2023-06-05	167	2	damaged book
321	2023-02-04	474	1	lost book
322	2023-08-29	319	3	system error
323	2023-10-01	305	5	damaged book
324	2023-03-30	807	4	damaged book
325	2023-09-28	78	1	misplacement
326	2023-10-21	538	8	system error
327	2022-12-14	707	7	miscommunication
328	2023-06-14	354	2	damaged book
329	2023-02-19	83	6	book theft
330	2023-04-04	973	6	damaged book
331	2023-01-04	484	3	borrower's request
332	2023-10-21	873	4	damaged book
333	2022-12-15	64	2	unauthorized borrowing
334	2023-08-04	902	1	borrower's request
335	2023-03-01	569	1	book theft
336	12023-01-01	845	4	unauthorized borrowing
337	12023-01-07	72	6	book theft
338	2023-06-19	112	8	misplacement
339	2023-10-25	374	2	misplacement
340	2023-12-06	892	8	unpaid fines
341	2023-05-21	353	8	unpaid fines
342	2023-07-13	867	8	misplacement
343	2023-03-14	989	1	unauthorized borrowing
344	2023-02-03	204	6	miscommunication
345	2023-04-15	673	8	system error
346	2023-01-29	493	4	book theft
347	2023-04-19	922	3	misplacement
348	2023-08-01	577	8	system error
349	2023-07-28	322	8	borrower's request
350	2023-03-21	1000	4	miscommunication
351	2023-06-17	94	8	borrower's request
352	2023-05-31	569	4	unauthorized borrowing
353	2023-08-03	332	6	unauthorized borrowing
354	2023-09-23	91	7	miscommunication
355	2023-01-03	287	4	miscommunication
356	2023-09-26	282	4	unauthorized borrowing
357	2023-03-02	251	2	lost book
358	2023-08-22	105	4	book theft
359	2023-10-19	808	8	lost book
360	2023-11-03	8	5	system error
361	2023-05-28	879	3	system error
362	2022-12-31	66	1	book theft
363	2023-11-18	952	5	damaged book
364	2023-05-21	87	4	unpaid fines
365	2023-01-06	962	4	damaged book
366	2023-03-24	576	5	unpaid fines
367	2023-04-04	138	5	system error
368	2023-06-18	644	1	miscommunication
369	2023-07-29	347	1	unpaid fines
370	2023-02-01	336	2	miscommunication
371	2022-12-08	292	8	system error
372	2023-06-02	444	5	misplacement
373	2023-03-27	772	5	misplacement
374	2023-09-06	884	5	damaged book
375	2023-10-06	392	2	unpaid fines
376	2023-02-27	941	2	damaged book
377	12023-02-04	44	1	lost book
378	2023-04-15	748	8	lost book
379	2023-01-09	450	8	miscommunication
380	2023-02-03	189	4	book theft
381	2023-07-12	926	7	lost book
382	12023-01-08	76	2	miscommunication
383	2023-10-07	472	4	lost book
384	2023-07-19	421	5	unauthorized borrowing
385	2023-02-15	531	3	unauthorized borrowing
386	2023-06-03	296	4	book theft
387	2023-03-06	947	3	unauthorized borrowing
388	2023-10-02	729	1	miscommunication
389	12023-01-04	180	1	system error
390	2023-05-10	911	3	damaged book
391	2023-07-20	742	5	damaged book
392	2023-02-26	624	8	damaged book
393	2022-12-16	163	2	misplacement
394	2023-10-15	462	6	book theft
395	2023-04-08	683	8	lost book
396	2023-08-09	610	2	lost book
397	2023-06-21	125	2	borrower's request
398	2023-03-17	589	1	miscommunication
399	2023-04-18	562	7	book theft
400	12023-01-08	294	4	damaged book
401	2023-02-08	223	1	miscommunication
402	2023-01-17	523	6	system error
403	2023-04-10	171	6	book theft
404	2023-03-06	314	5	lost book
405	2023-08-16	632	3	damaged book
406	2023-10-12	362	3	misplacement
407	2023-01-02	52	4	miscommunication
408	2023-07-29	415	5	damaged book
409	2023-04-10	291	6	misplacement
410	2023-06-25	170	4	lost book
411	2023-08-04	511	5	book theft
412	2023-06-07	387	5	borrower's request
413	2023-09-03	443	6	miscommunication
414	2023-06-19	677	6	miscommunication
415	2023-03-01	916	3	damaged book
416	2023-05-06	503	2	system error
417	2023-08-24	210	3	unauthorized borrowing
418	2023-02-23	144	5	borrower's request
419	2023-07-27	65	7	borrower's request
420	2023-02-09	330	5	unpaid fines
421	2023-01-21	424	1	damaged book
422	2023-07-09	880	1	lost book
423	2023-05-15	126	8	lost book
424	2023-01-26	710	4	unauthorized borrowing
425	2023-10-19	82	5	borrower's request
426	2023-05-23	648	5	borrower's request
427	2023-06-11	135	4	lost book
428	2023-06-21	578	8	unauthorized borrowing
429	2023-01-16	134	4	lost book
430	2023-06-14	117	2	system error
431	12023-01-24	655	6	unauthorized borrowing
432	2023-04-03	608	6	lost book
433	2023-03-03	55	6	system error
434	2023-06-15	156	7	lost book
435	2023-06-24	309	3	unauthorized borrowing
436	2023-06-23	590	3	borrower's request
437	2023-07-08	835	2	system error
438	2023-05-02	50	4	unauthorized borrowing
439	2023-10-26	338	7	miscommunication
440	2023-09-12	333	3	damaged book
441	2023-09-07	149	2	unauthorized borrowing
442	2022-12-07	300	3	lost book
443	2023-04-21	386	7	damaged book
444	2023-02-22	161	4	misplacement
445	2023-08-11	566	1	unauthorized borrowing
446	2023-08-15	816	6	damaged book
447	2022-12-31	466	8	misplacement
448	2023-09-20	401	3	borrower's request
449	2022-12-26	604	1	lost book
450	2023-02-03	867	3	unpaid fines
451	2023-03-05	224	2	unauthorized borrowing
452	2023-01-03	330	6	unpaid fines
453	2023-05-28	376	5	misplacement
454	2023-08-11	190	5	misplacement
455	2023-06-15	328	7	system error
456	2023-09-11	970	8	borrower's request
457	2023-04-09	779	3	borrower's request
458	2023-01-12	598	7	borrower's request
459	2023-10-26	112	4	miscommunication
460	2023-03-10	980	5	damaged book
461	2023-02-03	266	6	miscommunication
462	2023-03-22	237	6	lost book
463	2023-05-03	615	3	miscommunication
464	2023-11-06	815	7	unauthorized borrowing
465	2023-04-17	953	5	borrower's request
466	2023-04-10	742	6	borrower's request
467	2023-07-11	358	8	damaged book
468	2023-08-31	684	5	borrower's request
469	2023-01-02	866	2	book theft
470	2023-03-25	838	1	lost book
471	2023-03-31	858	7	unpaid fines
472	2023-06-07	338	1	borrower's request
473	2023-03-14	462	8	system error
474	2023-01-17	573	3	system error
475	2023-04-03	784	2	miscommunication
476	2023-06-08	836	8	damaged book
477	2023-01-18	520	8	miscommunication
478	2023-05-07	307	5	unpaid fines
479	2023-07-24	665	2	unpaid fines
480	2023-09-28	158	1	borrower's request
481	2023-10-01	643	1	unpaid fines
482	2023-04-14	552	7	unpaid fines
483	2023-03-05	136	7	damaged book
484	2023-07-05	110	2	damaged book
485	2023-10-25	936	2	lost book
486	2023-08-20	472	1	borrower's request
487	2023-05-04	691	1	unauthorized borrowing
488	2023-01-04	520	8	book theft
489	2022-12-30	544	7	miscommunication
490	2023-01-10	869	3	miscommunication
491	2023-04-07	256	4	unpaid fines
492	2023-11-26	800	7	misplacement
493	2023-10-06	186	6	system error
494	2023-04-23	846	7	misplacement
495	2023-04-17	311	4	unpaid fines
496	2023-02-17	406	5	miscommunication
497	2023-05-30	706	4	book theft
498	2023-08-15	721	8	lost book
499	2023-03-24	615	8	miscommunication
500	2023-10-25	628	4	damaged book
501	2023-09-08	581	8	unauthorized borrowing
502	2023-06-18	931	3	miscommunication
503	2023-04-05	10	3	unauthorized borrowing
504	2023-02-18	379	1	unpaid fines
505	2023-11-17	425	6	miscommunication
506	2023-07-12	474	4	miscommunication
507	2023-06-02	179	2	miscommunication
508	2023-02-04	940	2	lost book
509	2022-12-08	367	8	system error
510	2023-02-24	839	2	miscommunication
511	2023-04-23	776	5	system error
512	2023-10-16	171	3	misplacement
513	12023-01-10	287	3	miscommunication
514	2023-10-15	714	7	book theft
515	2023-04-14	807	2	unauthorized borrowing
516	2023-10-16	582	3	damaged book
517	2023-06-30	429	5	lost book
518	2023-04-04	128	7	system error
519	2023-07-24	524	8	borrower's request
520	2023-05-06	480	3	misplacement
521	2023-10-30	155	1	lost book
522	2022-12-09	557	5	book theft
523	2023-04-28	814	7	borrower's request
524	2023-04-13	845	2	miscommunication
525	2023-01-20	523	5	book theft
526	2023-05-04	920	7	borrower's request
527	2023-07-27	10	4	miscommunication
528	2023-01-27	495	3	miscommunication
529	2023-08-24	441	6	damaged book
530	2023-02-04	113	6	system error
531	2023-09-19	616	5	unpaid fines
532	2023-09-25	742	4	lost book
533	2023-07-15	540	1	unauthorized borrowing
534	2022-12-20	522	4	book theft
535	12023-01-08	433	6	book theft
536	12023-01-07	526	8	system error
537	2023-01-14	694	7	unauthorized borrowing
538	2023-05-08	422	7	unpaid fines
539	2023-05-29	326	2	lost book
540	2023-01-17	269	4	damaged book
541	2023-01-24	800	8	damaged book
542	2022-12-19	996	2	book theft
543	12023-01-11	475	6	borrower's request
544	2023-02-20	362	2	borrower's request
545	2023-08-10	525	5	unpaid fines
546	2023-04-16	570	6	borrower's request
547	2023-07-11	510	7	lost book
548	2023-04-02	37	8	borrower's request
549	2023-10-28	928	7	lost book
550	2022-12-27	439	5	book theft
551	2023-10-20	184	8	unpaid fines
552	2023-06-16	608	2	book theft
553	2023-04-12	49	4	misplacement
554	2023-08-05	348	2	misplacement
555	2023-03-12	774	4	misplacement
556	2023-09-14	866	5	unpaid fines
557	2023-07-20	215	2	book theft
558	2023-06-03	927	7	book theft
559	2023-02-10	870	5	miscommunication
560	2023-09-23	173	6	book theft
561	2023-10-23	698	4	system error
562	2023-08-19	377	8	book theft
563	2022-12-07	511	4	damaged book
564	2023-01-08	385	2	unpaid fines
565	2022-12-13	811	4	misplacement
566	2023-08-03	381	4	unpaid fines
567	2023-07-01	125	1	unpaid fines
568	2023-08-16	749	7	lost book
569	2023-03-07	292	6	unauthorized borrowing
570	2023-06-06	812	2	book theft
571	2023-08-03	490	4	unauthorized borrowing
572	2023-04-25	703	8	book theft
573	2023-05-30	30	4	miscommunication
574	2023-07-22	578	5	borrower's request
575	2023-04-06	957	2	borrower's request
576	2023-11-27	473	8	system error
577	2023-10-28	462	1	borrower's request
578	2023-09-12	529	6	book theft
579	2023-07-30	802	2	system error
580	2023-01-01	8	3	damaged book
581	2023-10-21	307	5	unauthorized borrowing
582	2023-09-17	331	6	miscommunication
583	2023-10-15	665	3	unpaid fines
584	2023-08-27	199	7	unauthorized borrowing
585	2023-06-19	733	6	book theft
586	2023-05-25	897	7	damaged book
587	2023-02-06	738	1	unpaid fines
588	2023-12-01	418	7	damaged book
589	2023-10-26	953	8	miscommunication
590	2022-12-15	34	2	borrower's request
591	2023-06-08	164	1	lost book
592	2023-09-10	816	8	book theft
593	2023-01-08	703	4	borrower's request
594	2023-04-06	500	3	book theft
595	12023-01-20	430	6	system error
596	2022-12-08	427	1	system error
597	2023-06-22	924	8	book theft
598	2023-03-28	64	3	unpaid fines
599	2023-09-21	450	1	damaged book
600	2023-04-25	944	5	borrower's request
601	2022-12-12	573	6	miscommunication
602	2023-05-03	619	2	lost book
603	2023-11-21	771	1	damaged book
604	2023-10-05	638	8	misplacement
605	2023-10-27	933	4	book theft
606	2023-09-13	471	5	borrower's request
607	12023-01-07	928	8	lost book
608	12023-01-20	934	1	misplacement
609	2023-11-17	452	2	unpaid fines
610	2023-01-09	609	8	book theft
611	2023-03-31	769	4	miscommunication
612	2023-07-25	118	4	lost book
613	2023-04-28	87	4	unpaid fines
614	2023-09-24	547	6	borrower's request
615	2023-07-01	468	4	lost book
616	2023-04-24	241	5	borrower's request
617	2023-09-01	803	7	lost book
618	2023-04-22	396	8	lost book
619	2023-05-20	874	1	unpaid fines
620	2023-03-19	530	5	book theft
621	2023-01-09	45	5	misplacement
622	12023-01-05	946	4	misplacement
623	2023-06-13	328	6	unpaid fines
624	2023-05-08	577	7	misplacement
625	2023-06-01	184	2	borrower's request
626	2023-07-04	87	4	book theft
627	2023-05-08	788	4	lost book
628	2023-11-23	214	4	misplacement
629	12023-01-01	740	4	unauthorized borrowing
630	2023-05-25	940	8	damaged book
631	2023-07-20	345	6	damaged book
632	2023-10-22	851	1	unpaid fines
633	2022-12-27	27	5	damaged book
634	2023-08-07	50	7	book theft
635	2023-07-02	867	1	book theft
636	2023-05-26	293	7	lost book
637	2023-07-31	425	5	unpaid fines
638	2023-05-05	51	8	miscommunication
639	2023-06-12	827	2	borrower's request
640	2023-11-02	271	1	unpaid fines
641	2023-01-08	20	6	book theft
642	2023-09-13	543	6	misplacement
643	12023-02-03	826	5	unpaid fines
644	2023-09-20	616	3	book theft
645	2023-02-04	199	1	borrower's request
646	2022-12-25	249	7	damaged book
647	2023-02-02	458	6	unpaid fines
648	2023-02-11	476	8	misplacement
649	2023-05-27	982	8	damaged book
650	2023-10-08	181	7	book theft
651	2023-06-06	297	6	unpaid fines
652	2023-01-27	346	1	lost book
653	2023-01-05	767	1	system error
654	2023-05-29	973	8	borrower's request
655	2023-08-14	1000	5	misplacement
656	2023-04-14	320	2	unauthorized borrowing
657	2023-01-18	663	2	unauthorized borrowing
658	2023-04-05	544	3	misplacement
659	2022-12-23	755	5	borrower's request
660	2023-09-25	42	2	borrower's request
661	2023-10-01	292	5	book theft
662	2023-05-19	966	5	miscommunication
663	2023-04-29	78	5	unpaid fines
664	2023-05-18	258	5	lost book
665	2023-10-16	741	4	damaged book
666	2023-09-23	185	2	unauthorized borrowing
667	2022-12-13	21	5	misplacement
668	2022-12-30	851	1	book theft
669	2023-06-14	207	5	unauthorized borrowing
670	2023-08-31	81	3	book theft
671	2023-06-11	880	4	unauthorized borrowing
672	2023-03-20	526	2	misplacement
673	2023-05-05	485	8	unauthorized borrowing
674	2023-06-29	263	1	borrower's request
675	2023-11-30	567	1	borrower's request
676	2023-08-31	752	4	lost book
677	2023-02-24	319	1	unpaid fines
678	2023-10-15	568	8	lost book
679	2023-03-14	181	4	system error
680	2023-09-02	443	3	damaged book
681	2023-10-01	311	3	damaged book
682	2023-06-12	720	7	unauthorized borrowing
683	2022-12-10	623	4	lost book
684	12023-01-28	771	3	book theft
685	2023-01-04	174	4	misplacement
686	2023-06-18	342	5	unauthorized borrowing
687	2022-12-21	314	3	book theft
688	2023-01-13	140	5	unpaid fines
689	2023-04-12	701	2	unauthorized borrowing
690	2023-06-23	766	4	borrower's request
691	2023-10-03	782	2	book theft
692	2023-04-19	354	4	misplacement
693	2023-06-27	893	5	book theft
694	2023-03-15	672	3	system error
695	2023-09-02	887	5	misplacement
696	2023-08-18	370	1	book theft
697	2023-06-02	86	1	unpaid fines
698	2023-08-17	712	5	damaged book
699	2022-12-24	554	8	miscommunication
700	2023-08-29	574	5	book theft
701	2023-10-08	507	8	book theft
702	2023-07-28	959	7	lost book
703	2023-08-24	8	7	unauthorized borrowing
704	2023-02-06	185	4	book theft
705	2023-09-06	922	2	misplacement
706	2023-08-30	236	8	unauthorized borrowing
707	12023-01-11	426	2	book theft
708	2023-08-16	947	7	borrower's request
709	2023-01-06	815	7	borrower's request
710	2023-06-05	214	7	lost book
711	2022-12-23	969	2	miscommunication
712	2023-01-21	602	5	lost book
713	2023-07-30	931	3	borrower's request
714	2023-04-26	9	2	unauthorized borrowing
715	2023-01-05	622	1	book theft
716	2022-12-26	46	1	system error
717	2023-06-17	851	8	misplacement
718	2023-07-21	940	8	book theft
719	2023-10-27	529	5	miscommunication
720	2023-05-23	176	3	damaged book
721	2023-08-06	968	6	borrower's request
722	2023-08-08	855	6	system error
723	2023-07-24	579	6	miscommunication
724	2023-02-05	994	6	book theft
725	2023-04-22	279	1	unpaid fines
726	12023-01-16	214	6	book theft
727	2023-01-10	218	6	misplacement
728	2023-01-08	427	3	borrower's request
729	12023-02-03	425	6	book theft
730	12023-01-07	12	8	miscommunication
731	2023-03-28	155	1	damaged book
732	2023-09-12	927	7	borrower's request
733	2022-12-31	38	8	misplacement
734	2023-04-16	553	8	misplacement
735	2023-03-16	5	3	misplacement
736	2023-02-11	758	3	unpaid fines
737	2023-09-27	196	8	system error
738	2023-04-12	780	1	unauthorized borrowing
739	2023-03-11	408	5	unauthorized borrowing
740	2023-09-10	350	5	unpaid fines
741	2023-04-01	444	6	book theft
742	2022-12-26	952	1	borrower's request
743	2023-05-20	204	4	miscommunication
744	2023-05-05	850	8	system error
745	2023-10-16	859	6	borrower's request
746	2023-07-01	149	6	book theft
747	2023-08-10	450	4	lost book
748	2023-09-18	958	3	misplacement
749	2022-12-14	719	5	misplacement
750	2023-01-21	427	1	misplacement
751	2023-10-14	370	8	damaged book
752	2023-04-16	634	7	miscommunication
753	2023-05-07	621	4	unpaid fines
754	2023-02-27	843	1	damaged book
755	2023-08-10	174	2	borrower's request
756	2023-02-08	421	8	misplacement
757	2023-06-05	867	7	unpaid fines
758	2023-02-17	895	4	lost book
759	2023-10-21	608	4	book theft
760	2023-05-15	79	7	book theft
761	2023-08-08	320	2	book theft
762	2023-03-16	758	7	borrower's request
763	2023-08-19	185	7	unauthorized borrowing
764	2023-03-21	303	7	lost book
765	2023-04-23	151	6	unauthorized borrowing
766	12023-01-29	366	2	lost book
767	2023-05-06	896	2	miscommunication
768	12023-01-14	690	1	misplacement
769	2023-11-26	565	6	system error
770	2023-05-07	711	2	lost book
771	2023-08-06	367	3	misplacement
772	2023-10-19	723	7	miscommunication
773	2023-05-29	863	3	system error
774	12023-01-14	127	8	borrower's request
775	2023-10-13	905	7	unpaid fines
776	2023-08-17	838	2	book theft
777	2023-09-26	94	3	damaged book
778	12023-01-10	71	8	unpaid fines
779	2023-09-21	154	8	book theft
780	2023-03-19	431	3	miscommunication
781	2023-11-03	269	8	misplacement
782	2023-09-05	252	4	miscommunication
783	2023-02-24	218	3	misplacement
784	2023-08-09	44	3	damaged book
785	2023-10-30	393	2	unauthorized borrowing
786	2023-11-26	162	1	miscommunication
787	2023-05-13	96	3	system error
788	2023-05-22	570	6	book theft
789	2023-09-03	141	8	book theft
790	2022-12-19	170	5	system error
791	2023-08-05	760	2	system error
792	2023-09-22	824	3	system error
793	2023-05-11	867	6	system error
794	2023-01-16	192	3	lost book
795	2023-02-23	443	5	borrower's request
796	2023-07-13	269	7	borrower's request
797	2022-12-27	849	4	misplacement
798	2022-12-09	446	8	miscommunication
799	2023-02-08	352	8	unauthorized borrowing
800	2023-09-03	324	2	borrower's request
801	2023-08-30	214	1	damaged book
802	2023-08-30	223	8	unauthorized borrowing
803	2023-04-08	894	8	unpaid fines
804	2023-10-17	777	2	damaged book
805	2023-06-27	631	4	borrower's request
806	2022-12-12	145	5	system error
807	2023-07-16	455	6	book theft
808	2023-04-20	628	8	lost book
809	12023-01-10	577	4	misplacement
810	2023-03-08	129	3	lost book
811	2023-05-22	808	6	unauthorized borrowing
812	2023-02-18	870	8	book theft
813	2023-01-04	127	1	system error
814	2023-08-27	252	2	misplacement
815	2023-05-11	277	5	unauthorized borrowing
816	2023-03-30	684	4	unpaid fines
817	2023-08-23	118	1	unpaid fines
818	2023-02-09	191	3	borrower's request
819	2023-05-14	24	2	misplacement
820	2023-10-06	511	2	system error
821	12023-01-10	406	2	book theft
822	2023-04-23	586	5	miscommunication
823	2022-12-27	74	6	lost book
824	2023-11-27	892	2	system error
825	2023-08-10	997	3	unpaid fines
826	2023-10-15	674	7	unauthorized borrowing
827	2022-12-27	336	7	book theft
828	2023-01-15	186	4	miscommunication
829	2023-10-30	720	7	unauthorized borrowing
830	2023-10-02	15	4	book theft
831	2023-01-31	876	1	book theft
832	2023-01-16	714	4	unpaid fines
833	2023-05-25	371	4	damaged book
834	2022-12-12	987	8	book theft
835	12023-01-07	800	6	book theft
836	2023-01-22	817	1	damaged book
837	2023-09-06	376	3	unpaid fines
838	2023-03-31	456	5	unauthorized borrowing
839	2023-02-26	927	1	borrower's request
840	2023-02-23	394	3	unauthorized borrowing
841	12023-01-28	945	8	unauthorized borrowing
842	2023-07-09	233	8	lost book
843	2023-09-15	362	6	book theft
844	2023-01-21	2	2	misplacement
845	2023-11-23	25	6	unpaid fines
846	2023-04-06	64	1	miscommunication
847	2023-04-26	939	4	system error
848	2023-06-08	851	3	unauthorized borrowing
849	2022-12-26	866	4	unpaid fines
850	2023-10-02	209	3	unauthorized borrowing
851	2023-04-10	844	5	unpaid fines
852	2022-12-23	121	7	lost book
853	2023-09-23	647	2	borrower's request
854	2023-02-06	625	2	miscommunication
855	2023-04-24	730	2	borrower's request
856	2023-02-16	188	4	unpaid fines
857	2023-12-05	800	5	miscommunication
858	2023-04-03	315	7	lost book
859	12023-01-09	207	3	borrower's request
860	2023-06-01	423	1	borrower's request
861	2023-02-20	231	8	unauthorized borrowing
862	2023-07-03	358	8	unauthorized borrowing
863	2023-05-12	694	8	lost book
864	2023-08-02	85	3	misplacement
865	2023-01-21	813	3	miscommunication
866	2023-07-01	73	7	system error
867	2023-09-15	292	7	borrower's request
868	2023-06-20	674	7	misplacement
869	2023-09-09	842	8	borrower's request
870	2023-03-25	562	5	book theft
871	2023-02-17	867	2	damaged book
872	12023-01-11	374	1	system error
873	2023-03-01	752	6	unpaid fines
874	2023-07-09	722	3	system error
875	2023-08-20	710	5	system error
876	2023-10-06	571	2	miscommunication
877	2023-09-21	389	2	miscommunication
878	2022-12-09	870	5	book theft
879	2023-07-20	200	1	unauthorized borrowing
880	2023-08-05	835	4	misplacement
881	2023-01-06	405	3	misplacement
882	2023-09-30	246	5	system error
883	2023-09-20	424	4	lost book
884	2023-01-09	783	6	unpaid fines
885	2022-12-10	562	3	system error
886	2023-08-04	216	2	borrower's request
887	2023-10-13	33	8	unpaid fines
888	2023-05-26	517	4	lost book
889	2023-05-30	143	2	unpaid fines
890	2023-07-11	512	6	system error
891	2023-04-11	878	8	borrower's request
892	2023-05-01	143	7	misplacement
893	2023-06-11	622	7	misplacement
894	12023-01-15	324	2	unpaid fines
895	2023-02-20	707	3	borrower's request
896	2022-12-29	969	8	unauthorized borrowing
897	2023-06-21	323	1	book theft
898	2023-03-03	862	8	book theft
899	2023-03-01	60	2	borrower's request
900	2023-11-30	903	7	borrower's request
901	2023-09-22	559	3	unauthorized borrowing
902	2023-03-19	49	8	borrower's request
903	2023-10-05	998	2	misplacement
904	2023-01-03	278	4	system error
905	2023-06-27	924	1	miscommunication
906	2023-05-26	214	3	misplacement
907	2023-01-24	678	1	miscommunication
908	12023-02-03	642	6	book theft
909	12023-01-20	146	6	damaged book
910	2023-09-09	384	1	borrower's request
911	2023-09-16	268	7	system error
912	2023-01-31	939	1	damaged book
913	2023-09-28	732	4	unpaid fines
914	2023-11-17	106	4	system error
915	2022-12-28	549	1	miscommunication
916	2023-03-06	763	7	system error
917	2023-06-14	550	1	system error
918	2023-09-06	155	3	borrower's request
919	2023-06-24	643	2	miscommunication
920	2023-01-30	620	7	book theft
921	2023-10-29	527	2	miscommunication
922	2022-12-10	213	3	misplacement
923	2023-05-20	932	7	system error
924	2023-11-06	958	5	lost book
925	2023-07-23	979	5	system error
926	2023-06-20	954	4	lost book
927	2023-04-13	150	4	unauthorized borrowing
928	2023-03-31	920	4	miscommunication
929	2023-05-20	846	8	book theft
930	2023-04-30	786	4	borrower's request
931	2023-08-01	197	4	unauthorized borrowing
932	2023-07-15	769	3	lost book
933	2023-09-28	345	5	miscommunication
934	2023-04-23	433	2	unpaid fines
935	2023-04-14	990	5	misplacement
936	2023-03-14	426	7	unpaid fines
937	2023-03-29	835	2	system error
938	2023-10-28	155	1	unauthorized borrowing
939	12023-01-28	871	8	unauthorized borrowing
940	2022-12-26	753	3	misplacement
941	2023-09-19	433	4	miscommunication
942	2023-10-15	914	4	lost book
943	2023-07-08	585	3	borrower's request
944	2022-12-22	823	8	miscommunication
945	2023-07-04	985	3	miscommunication
946	2023-09-18	299	6	unauthorized borrowing
947	2023-03-23	11	4	unpaid fines
948	2023-02-25	177	7	book theft
949	2023-05-29	972	1	misplacement
950	2023-04-01	95	2	lost book
951	12023-01-28	745	5	system error
952	2023-01-25	757	1	book theft
953	12023-01-10	408	2	misplacement
954	2023-09-24	433	5	unauthorized borrowing
955	2023-05-31	226	3	misplacement
956	12023-01-28	444	8	miscommunication
957	2023-10-07	268	5	misplacement
958	2023-01-14	650	3	misplacement
959	2022-12-16	803	8	unpaid fines
960	2023-04-27	120	4	system error
961	2023-06-07	284	7	misplacement
962	2023-06-07	488	1	misplacement
963	2023-03-25	357	6	system error
964	2023-01-01	237	6	unauthorized borrowing
965	2023-10-22	720	2	system error
966	2023-12-06	663	4	misplacement
967	2022-12-20	808	5	borrower's request
968	2022-12-16	921	6	system error
969	2023-07-06	715	4	miscommunication
970	2023-10-05	281	4	book theft
971	2023-02-11	640	6	book theft
972	2023-04-24	242	5	misplacement
973	2023-02-02	104	4	unauthorized borrowing
974	2022-12-28	65	7	lost book
975	2023-04-10	58	8	unauthorized borrowing
976	2023-08-31	866	7	borrower's request
977	2023-07-26	166	3	system error
978	2023-07-26	467	1	unauthorized borrowing
979	2022-12-29	783	8	unauthorized borrowing
980	2023-06-07	849	1	lost book
981	2023-02-25	353	5	system error
982	2023-10-27	286	3	borrower's request
983	2023-10-29	216	5	damaged book
984	2023-09-07	218	2	unpaid fines
985	2022-12-15	166	4	book theft
986	2023-01-16	757	3	damaged book
987	2023-06-10	217	7	lost book
988	2023-05-31	835	8	unauthorized borrowing
989	2023-04-08	776	4	system error
990	2023-02-17	147	3	misplacement
991	2023-04-08	956	1	unauthorized borrowing
992	2022-12-28	924	3	damaged book
993	2023-11-21	972	6	system error
994	2023-09-27	751	6	borrower's request
995	2023-02-20	875	2	unauthorized borrowing
996	2023-08-06	574	6	system error
997	12023-01-08	565	6	unauthorized borrowing
998	12023-01-12	404	3	damaged book
999	2023-02-17	761	6	book theft
1000	2023-01-23	538	8	miscommunication
\.


--
-- TOC entry 4880 (class 0 OID 24634)
-- Dependencies: 226
-- Data for Name: act_of_donation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_of_donation (id_actofdonation, date, substitution, id_employee, id_copyofbook) FROM stdin;
1	2023-10-20	f	1	55
2	2023-03-11	f	3	204
3	2023-11-15	f	7	993
4	2023-09-01	t	3	69
5	2023-08-21	t	4	763
6	2023-01-07	f	1	426
7	2023-06-24	t	2	543
8	2022-12-27	f	8	616
9	2023-06-29	t	2	137
10	2023-08-12	t	3	192
11	2023-03-12	t	6	450
12	2023-11-09	f	7	691
13	2023-03-22	t	8	441
14	2023-11-28	t	7	299
15	2023-04-21	f	3	349
16	2023-05-20	f	8	604
17	2023-09-22	f	8	990
18	2022-12-21	f	3	763
19	2023-06-16	f	3	984
20	2023-01-17	f	3	34
21	2023-02-20	t	7	604
22	2023-04-22	f	1	889
23	2023-07-08	f	7	659
24	2023-06-05	f	1	480
25	2023-06-09	t	6	964
26	2023-06-21	t	5	800
27	2023-04-05	f	4	972
28	2023-08-23	f	3	214
29	2023-10-20	f	3	191
30	2023-09-21	t	8	965
31	2023-09-21	f	8	275
32	2023-08-17	f	3	491
33	2023-06-02	t	4	313
34	2023-08-30	f	5	345
35	2023-09-19	t	1	805
36	2023-06-21	f	4	518
37	2023-01-02	t	7	60
38	2023-04-12	t	2	388
39	2023-01-20	t	8	774
40	2023-01-08	f	1	302
41	2023-04-22	t	6	570
42	2022-12-29	f	4	388
43	2023-10-22	t	4	782
44	2023-04-28	t	6	542
45	2023-10-12	t	6	411
46	2023-08-09	f	2	107
47	2023-09-09	f	7	36
48	2023-06-16	f	6	545
49	2023-01-26	f	5	415
50	2023-10-24	f	2	880
51	12023-01-26	f	1	631
52	2023-11-06	f	5	490
53	2023-04-09	t	7	67
54	2023-07-21	t	1	605
55	2023-10-13	f	5	298
56	2023-07-06	f	7	285
57	2023-03-09	t	6	217
58	2023-04-13	t	7	206
59	2023-03-26	f	5	108
60	2023-01-01	t	1	50
61	2023-07-03	t	5	906
62	2023-02-03	t	6	552
63	2023-02-15	f	1	695
64	2023-06-04	f	8	575
65	2023-07-23	t	3	873
66	2023-01-23	f	3	577
67	2023-07-21	t	1	91
68	2023-03-31	t	2	679
69	2023-03-10	t	3	640
70	2023-08-28	f	2	132
71	2023-01-29	t	4	183
72	12023-01-17	f	3	686
73	2023-02-14	t	6	790
74	2023-03-18	f	8	820
75	2023-04-24	f	1	681
76	2023-08-01	f	6	962
77	2023-05-20	f	1	666
78	2023-03-07	t	8	513
79	2023-05-01	t	2	363
80	2023-09-15	f	5	17
81	12023-01-17	f	7	672
82	12023-01-08	t	6	795
83	2023-07-05	f	3	257
84	2023-10-20	f	8	742
85	2023-03-20	f	5	57
86	2023-03-06	t	6	131
87	2023-05-24	t	6	282
88	2023-02-03	f	2	850
89	12023-01-02	f	3	919
90	2023-06-08	t	1	6
91	2023-02-12	f	4	578
92	2023-04-15	t	8	464
93	2023-05-07	f	2	426
94	2023-04-17	t	7	220
95	2023-09-28	f	3	581
96	2023-07-17	f	7	165
97	2023-03-18	t	7	593
98	2023-04-14	f	4	972
99	2023-09-13	f	1	751
100	2023-10-07	t	5	963
101	2023-01-15	f	5	645
102	2023-01-01	t	6	674
103	2023-03-15	f	4	446
104	2022-12-07	t	1	131
105	2023-09-14	t	8	15
106	2023-07-17	t	2	133
107	2023-05-28	t	4	699
108	2023-01-30	t	6	616
109	2023-07-24	t	2	932
110	2023-08-30	t	5	199
111	2023-08-23	t	7	191
112	2023-02-09	t	7	810
113	2023-05-03	t	3	86
114	2022-12-12	f	2	694
115	2023-02-15	f	8	180
116	2023-10-30	f	1	635
117	2023-10-03	f	8	470
118	2023-08-01	t	4	914
119	2023-01-29	f	4	908
120	2023-09-23	t	5	29
121	2023-06-20	t	5	70
122	2023-02-04	t	1	965
123	2023-05-25	t	1	489
124	2023-08-03	t	4	51
125	2023-03-10	f	5	621
126	2023-06-12	f	1	785
127	2023-03-22	t	1	230
128	2023-11-04	f	6	733
129	2023-01-29	t	5	738
130	12023-02-03	f	7	541
131	2023-08-14	t	2	682
132	2023-04-24	f	8	330
133	2023-02-05	f	2	434
134	2023-11-05	f	8	640
135	2023-10-15	f	8	970
136	2023-05-08	t	7	795
137	2023-06-22	t	7	678
138	2023-10-02	t	8	253
139	2023-03-07	f	3	246
140	2023-07-07	f	6	939
141	2023-02-28	f	4	354
142	2023-04-16	t	5	612
143	2023-06-30	t	8	246
144	2023-09-03	t	3	652
145	2023-03-21	f	8	628
146	2023-11-13	t	8	979
147	2023-02-20	f	6	63
148	2023-01-24	t	5	969
149	2023-03-23	f	6	322
150	2022-12-21	f	1	894
151	12023-01-24	f	4	413
152	2023-03-04	t	5	214
153	2023-05-19	t	6	41
154	2023-02-08	f	4	225
155	2023-01-19	f	1	477
156	2022-12-29	t	8	277
157	2023-04-02	t	1	10
158	2022-12-14	f	7	806
159	2023-01-24	f	4	759
160	2023-02-21	f	3	668
161	2023-05-09	t	4	759
162	2023-08-02	t	6	264
163	2023-10-23	t	2	251
164	2023-10-09	t	6	819
165	2023-04-18	f	5	682
166	2023-05-24	f	6	629
167	2023-04-22	t	7	844
168	2023-08-25	f	4	533
169	2023-02-10	t	6	192
170	2023-01-07	t	3	101
171	2023-02-23	f	2	388
172	2023-11-22	f	4	657
173	12023-01-30	f	4	118
174	2023-10-06	f	6	652
175	2023-03-30	t	5	388
176	2023-12-01	f	6	796
177	2023-04-20	f	2	396
178	2023-08-16	f	3	401
179	2023-10-05	f	2	291
180	2023-01-09	f	7	903
181	2023-04-21	f	4	997
182	2023-09-30	f	7	26
183	2023-08-16	f	1	997
184	2023-10-20	t	5	50
185	2023-08-06	t	6	711
186	12023-01-30	t	5	555
187	2023-07-30	f	1	624
188	2023-05-06	t	2	466
189	2023-02-27	f	4	589
190	2023-06-01	t	5	315
191	2023-04-08	t	5	705
192	2023-09-29	t	1	85
193	2023-03-13	t	3	11
194	2023-04-17	f	2	653
195	2023-08-15	t	1	348
196	2023-05-01	f	6	299
197	2023-06-06	f	2	225
198	2022-12-07	f	6	891
199	2023-03-14	t	3	726
200	2023-08-08	t	1	305
201	2023-07-15	f	7	562
202	2023-04-19	t	1	959
203	2023-09-19	f	1	422
204	2023-09-16	f	8	182
205	2023-01-03	f	2	415
206	2023-09-19	t	1	101
207	2023-10-10	t	1	631
208	12023-01-17	t	8	684
209	2022-12-31	t	2	132
210	12023-01-20	t	7	725
211	2023-04-15	f	5	220
212	12023-01-20	t	3	314
213	2023-04-09	t	6	342
214	2023-10-25	f	4	904
215	2023-05-06	f	6	777
216	2023-10-19	f	4	474
217	2023-09-21	t	4	629
218	12023-01-19	t	7	716
219	2023-11-21	t	5	732
220	2023-01-16	t	2	179
221	2022-12-11	t	7	55
222	2023-07-29	f	2	132
223	2023-03-14	t	7	575
224	2023-02-25	f	5	850
225	2023-05-26	f	8	811
226	2023-11-12	t	1	73
227	2023-07-20	f	8	257
228	2023-12-01	t	5	9
229	2023-10-03	t	5	515
230	2023-07-16	t	1	738
231	2023-02-04	f	2	81
232	2023-02-04	t	1	944
233	2023-07-23	t	1	454
234	2023-06-11	t	3	419
235	2023-07-26	f	7	462
236	2023-11-05	f	8	25
237	2023-08-28	t	3	972
238	2023-09-24	t	5	833
239	2023-01-24	f	2	268
240	2022-12-07	f	2	824
241	2023-02-09	f	2	487
242	2023-03-22	f	2	824
243	2023-09-28	t	8	712
244	2023-08-31	t	1	447
245	12023-01-19	t	5	78
246	2023-09-17	f	5	778
247	2023-08-20	f	2	727
248	2023-07-28	t	3	841
249	2023-05-18	t	1	671
250	2023-09-25	t	5	72
251	2023-02-23	f	7	180
252	2023-07-02	f	1	520
253	2023-09-29	t	8	418
254	2023-10-13	f	3	34
255	2023-08-27	f	4	48
256	2023-09-22	f	4	663
257	2023-03-01	f	3	31
258	2022-12-16	f	7	804
259	2023-09-11	f	5	422
260	2023-02-05	t	7	359
261	2023-10-29	t	3	701
262	2023-02-01	t	3	813
263	2023-03-15	t	2	171
264	2023-10-05	t	5	757
265	2022-12-30	t	5	934
266	2023-01-22	f	4	974
267	2023-11-25	f	3	675
268	2023-06-12	f	8	945
269	2023-09-09	f	6	453
270	2023-01-27	f	6	140
271	2022-12-31	f	7	734
272	2023-09-12	t	7	827
273	2023-08-22	t	8	73
274	2022-12-11	t	8	928
275	2023-06-03	t	6	594
276	2023-07-06	f	4	350
277	2023-02-26	f	4	197
278	2022-12-16	f	4	776
279	2023-08-28	t	4	236
280	2023-03-11	f	4	402
281	2023-08-31	t	5	319
282	2023-08-16	t	7	694
283	2023-07-24	t	3	634
284	2023-07-03	f	1	386
285	2023-11-10	f	7	25
286	2023-12-06	f	2	360
287	2023-09-11	t	6	81
288	2023-04-06	f	8	672
289	2023-04-15	f	5	481
290	2023-03-20	f	6	352
291	2023-06-28	f	4	321
292	2023-07-11	t	6	594
293	2023-11-10	t	8	340
294	2023-10-27	t	7	527
295	2023-04-26	f	7	506
296	2023-10-24	f	1	198
297	2023-02-10	f	7	890
298	2023-10-19	t	3	131
299	2023-08-19	f	6	942
300	2023-11-13	f	1	952
301	2023-06-04	t	1	694
302	2023-06-06	f	5	770
303	2023-06-01	t	7	515
304	2023-03-07	f	3	966
305	2023-03-02	f	3	552
306	2023-09-08	f	8	379
307	2023-02-28	f	1	530
308	2023-07-30	t	5	733
309	2023-09-17	f	5	130
310	2023-05-07	t	8	398
311	2023-04-01	t	3	234
312	2023-06-24	t	7	125
313	2023-07-31	t	1	515
314	2023-10-05	f	2	528
315	2023-11-14	t	5	900
316	2023-04-15	f	4	522
317	2023-10-06	f	4	664
318	2023-02-08	t	6	675
319	2023-04-15	f	2	977
320	2023-01-29	f	4	188
321	2023-07-28	f	3	980
322	2023-11-21	t	2	945
323	2023-10-12	f	7	921
324	2023-09-26	t	6	736
325	2023-06-12	t	7	639
326	2023-04-16	f	1	110
327	2023-05-19	f	5	88
328	2023-05-03	f	8	837
329	2023-10-06	t	5	97
330	12023-01-01	f	4	90
331	2023-01-08	t	3	313
332	2023-06-09	f	7	689
333	2023-04-20	f	5	805
334	2023-02-20	f	8	630
335	2023-08-22	f	8	208
336	2023-03-25	t	2	997
337	2023-07-28	f	1	326
338	2023-01-28	f	3	736
339	2023-05-11	f	1	744
340	2023-04-30	t	2	169
341	2023-08-04	t	7	534
342	2023-06-16	t	7	596
343	2023-11-15	t	5	917
344	2022-12-31	t	8	214
345	2023-07-08	f	5	746
346	2023-09-19	f	8	688
347	2023-07-06	f	6	249
348	2022-12-31	f	2	831
349	2023-06-12	f	2	919
350	2023-11-09	t	1	310
351	2023-09-09	t	1	43
352	2023-12-06	f	3	335
353	2023-11-04	f	3	220
354	2023-10-18	f	3	229
355	2023-02-09	t	1	57
356	2023-06-20	f	6	651
357	2023-03-11	f	4	810
358	2023-10-24	f	2	492
359	2023-07-12	f	6	417
360	2023-09-11	f	4	418
361	2023-04-11	t	3	804
362	2023-01-30	t	3	829
363	2023-05-21	t	3	740
364	2022-12-24	t	1	301
365	2023-08-18	f	7	145
366	2023-06-13	f	8	238
367	2023-08-23	f	7	536
368	2023-03-13	t	5	440
369	2023-05-18	f	5	64
370	2023-04-06	t	3	594
371	2023-07-19	f	2	911
372	2023-02-04	t	2	445
373	2023-07-30	f	8	87
374	2023-03-31	t	2	849
375	2023-06-16	f	7	479
376	12023-01-23	f	1	161
377	2023-10-07	f	5	368
378	2023-10-07	t	2	117
379	2023-10-07	t	2	806
380	2023-10-29	f	4	670
381	2023-08-10	t	1	253
382	2023-08-13	t	1	681
383	2023-05-22	f	5	282
384	2023-10-27	t	3	351
385	2023-10-22	t	8	582
386	2023-01-15	f	8	118
387	2023-04-12	t	8	733
388	2023-05-25	f	2	535
389	2023-04-10	t	6	644
390	2023-04-10	f	7	832
391	2022-12-19	t	7	897
392	2023-07-05	t	8	334
393	2023-04-07	t	1	423
394	2022-12-08	t	1	885
395	2023-10-02	f	2	449
396	2023-10-17	t	6	120
397	2023-01-02	f	5	797
398	2023-09-11	t	3	745
399	2022-12-10	f	6	924
400	2023-05-17	t	1	703
401	2023-08-28	f	2	490
402	2023-02-14	f	5	316
403	2023-03-03	f	4	130
404	2023-07-18	t	2	440
405	2023-07-28	f	3	702
406	2023-08-08	t	4	323
407	2023-11-25	t	5	543
408	2022-12-12	f	7	859
409	2023-09-23	f	1	269
410	2023-09-08	f	5	103
411	2023-01-04	f	7	411
412	2023-06-02	t	2	508
413	2023-06-06	t	4	660
414	12023-01-30	f	7	11
415	2023-09-29	t	7	305
416	2023-04-20	f	2	453
417	2023-02-08	t	5	970
418	2023-08-05	t	5	761
419	2023-04-17	t	2	399
420	2022-12-12	f	8	860
421	2023-08-03	t	1	490
422	2023-02-02	t	4	681
423	2023-06-06	f	2	19
424	2022-12-07	f	2	434
425	2023-07-10	f	7	73
426	2023-06-09	f	7	739
427	2023-07-15	f	3	429
428	2023-01-11	t	2	394
429	2023-02-22	t	6	408
430	12023-01-07	t	8	85
431	2023-08-23	t	5	645
432	2023-01-05	f	7	436
433	2023-01-09	f	7	460
434	2023-07-17	t	4	272
435	2023-05-30	t	6	50
436	2022-12-16	t	7	279
437	2023-07-10	t	6	170
438	2023-06-23	t	4	495
439	2023-03-01	f	5	451
440	2023-07-30	t	5	985
441	12023-01-29	f	7	907
442	2023-08-02	t	2	555
443	2023-02-26	t	6	718
444	2023-04-23	f	3	264
445	2023-03-09	f	6	359
446	2023-07-28	f	1	728
447	2022-12-17	t	7	529
448	2023-01-19	t	5	653
449	2023-04-09	f	8	744
450	2023-06-03	f	6	206
451	2023-06-17	t	3	188
452	2023-09-05	t	1	848
453	2023-03-08	f	3	54
454	2023-02-28	t	8	297
455	2023-08-16	f	4	19
456	2023-02-23	t	7	231
457	2023-10-25	t	2	130
458	2023-04-08	t	7	901
459	2023-01-10	f	8	443
460	2023-04-08	f	2	996
461	12023-01-08	t	3	92
462	2023-01-07	t	4	29
463	2023-11-14	f	2	593
464	2023-11-12	f	6	585
465	2023-07-30	f	4	431
466	2023-07-18	t	5	807
467	2023-12-06	f	6	634
468	2023-06-28	t	1	49
469	2023-06-15	f	6	893
470	2023-06-08	t	6	979
471	2023-04-02	f	6	641
472	2023-04-21	t	8	701
473	2023-07-14	f	3	306
474	2023-10-26	t	8	814
475	2023-02-25	t	5	937
476	2023-02-21	t	2	482
477	2022-12-12	f	7	310
478	2023-04-01	t	1	861
479	2023-04-26	t	7	212
480	2023-01-13	f	7	678
481	2023-12-01	t	8	376
482	2023-01-27	t	7	868
483	2023-10-02	f	8	788
484	2023-08-24	t	5	645
485	2022-12-28	t	3	209
486	2023-04-01	t	7	221
487	2023-06-01	f	8	776
488	2023-05-22	t	8	916
489	2022-12-29	t	1	547
490	2023-05-08	t	6	706
491	2023-01-28	t	5	464
492	2023-09-29	t	7	706
493	2023-08-05	t	6	59
494	2023-03-18	t	7	957
495	2023-05-13	t	5	985
496	2023-05-30	f	6	428
497	2023-04-16	t	8	982
498	2023-05-28	f	5	989
499	12023-01-27	f	5	96
500	2023-08-03	f	3	609
501	2023-05-25	f	6	282
502	12023-01-23	t	8	304
503	2023-02-28	f	4	758
504	2023-04-21	t	4	335
505	2023-04-19	t	8	246
506	12023-01-11	f	1	223
507	2023-08-17	t	4	879
508	2023-02-05	t	3	877
509	2023-06-27	f	3	805
510	2023-05-27	f	7	579
511	2023-10-02	t	8	575
512	2023-09-15	t	7	216
513	2023-02-17	f	4	360
514	2023-09-24	t	2	826
515	2023-04-09	t	1	831
516	2023-01-20	t	3	504
517	2023-03-09	t	4	157
518	2023-11-22	t	7	802
519	2023-10-27	t	1	410
520	2023-03-02	f	5	612
521	12023-01-30	t	5	672
522	2022-12-17	t	8	571
523	2023-06-17	f	6	829
524	2023-09-01	f	8	246
525	2023-06-08	f	8	755
526	2022-12-21	f	4	964
527	2023-05-20	t	6	68
528	2023-09-18	f	4	342
529	2023-07-19	f	7	22
530	2023-05-07	t	6	217
531	2023-07-29	f	7	832
532	2023-03-25	t	5	835
533	2023-01-07	t	3	326
534	2023-06-10	f	7	801
535	2023-09-20	f	2	584
536	2023-10-17	f	8	882
537	2023-05-24	t	8	743
538	2023-01-25	t	6	233
539	2023-06-23	f	7	325
540	2023-10-05	f	5	610
541	2022-12-30	f	8	769
542	2023-07-29	f	3	340
543	2023-08-18	t	3	518
544	2023-10-09	t	2	514
545	2023-07-19	f	8	381
546	2023-09-09	f	8	884
547	2023-05-31	t	4	543
548	12023-02-03	f	5	289
549	2023-07-25	f	2	894
550	2023-11-28	f	8	43
551	2023-08-22	t	1	296
552	2023-03-14	f	5	101
553	2023-06-25	t	2	718
554	2023-03-29	t	2	920
555	2023-01-29	t	4	848
556	2023-03-03	f	2	326
557	2023-06-13	t	2	225
558	2022-12-16	t	7	882
559	2023-11-13	t	1	374
560	2023-05-30	t	2	46
561	2023-10-04	f	7	662
562	2023-11-18	f	2	67
563	2023-03-19	t	4	259
564	2023-03-01	t	6	110
565	2023-03-26	f	3	450
566	2023-06-08	f	5	442
567	2023-03-07	t	2	822
568	2023-02-22	t	7	588
569	2023-07-15	f	1	659
570	2023-03-23	t	7	390
571	2023-01-20	t	3	378
572	2023-09-23	t	8	368
573	2023-07-21	f	8	161
574	2023-09-30	f	3	207
575	2023-06-23	f	1	243
576	2023-06-18	t	4	45
577	2023-11-14	f	8	444
578	2023-07-09	f	3	891
579	2023-04-21	t	4	905
580	2023-01-18	f	4	715
581	2023-10-09	t	5	471
582	2023-09-15	t	7	752
583	2023-03-28	t	4	175
584	2023-03-15	t	8	935
585	2023-09-03	t	4	811
586	2023-06-12	t	8	315
587	2023-04-23	f	3	150
588	2023-04-19	t	7	552
589	2023-02-02	t	5	932
590	2023-04-13	t	6	591
591	2022-12-09	f	4	293
592	2023-06-07	f	4	279
593	2023-08-19	f	8	544
594	2023-02-19	f	6	95
595	2023-04-11	f	1	156
596	2023-01-23	f	4	517
597	2023-05-04	t	3	503
598	2023-09-13	t	1	821
599	2023-10-12	t	5	768
600	2023-03-25	t	3	579
601	2023-04-08	t	4	703
602	2023-07-22	f	2	729
603	2023-10-31	f	1	81
604	2023-09-02	f	5	274
605	2023-08-01	f	8	349
606	2023-10-02	t	3	878
607	2023-09-28	t	8	315
608	2023-08-31	f	2	1
609	2023-08-09	f	8	112
610	2023-07-03	f	2	384
611	2023-01-12	f	3	680
612	2023-03-28	f	8	641
613	2023-02-06	t	8	719
614	2023-09-27	f	4	788
615	2023-03-09	t	5	970
616	2023-10-02	f	4	107
617	2023-06-05	f	5	526
618	2023-06-27	t	4	533
619	12023-01-07	f	2	418
620	2023-08-10	f	6	811
621	2023-05-04	f	8	984
622	2023-04-12	t	2	48
623	2023-01-21	t	7	98
624	2022-12-26	f	1	862
625	2023-08-26	f	5	785
626	2023-10-15	f	8	528
627	2023-08-08	t	1	947
628	2023-04-20	f	3	57
629	2023-09-21	t	4	941
630	2023-03-19	t	3	53
631	2023-04-24	f	5	936
632	2023-08-24	f	4	671
633	2023-03-15	f	3	760
634	2023-03-06	f	1	95
635	2023-01-29	f	2	929
636	2023-07-27	t	1	838
637	2023-08-28	t	6	661
638	12023-01-20	f	1	463
639	2022-12-24	f	1	152
640	12023-01-24	f	5	344
641	2023-10-31	t	4	960
642	2023-06-30	t	2	926
643	2023-09-05	f	6	906
644	2022-12-10	t	1	702
645	2023-06-15	t	4	915
646	2023-09-07	f	6	183
647	2023-04-19	t	7	948
648	2023-09-26	f	1	280
649	2023-03-14	f	1	336
650	2023-08-09	f	4	461
651	2023-08-27	t	2	186
652	12023-01-07	t	5	909
653	2023-07-18	f	6	640
654	2023-08-03	t	4	266
655	2023-09-19	t	8	143
656	2023-05-16	t	5	138
657	2023-07-28	f	4	297
658	2023-10-29	t	1	871
659	2023-05-15	t	2	482
660	2023-06-01	t	1	125
661	2023-03-03	f	6	435
662	12023-01-08	t	1	946
663	2023-08-31	t	2	699
664	2023-06-20	f	8	25
665	2023-04-27	f	5	753
666	2023-05-18	t	6	516
667	2023-11-09	f	3	138
668	2023-08-06	f	5	464
669	2023-03-03	f	8	106
670	2023-09-26	f	1	167
671	2022-12-28	t	8	993
672	2023-06-20	t	3	407
673	2023-01-23	t	8	716
674	2023-07-18	t	5	22
675	2023-08-23	f	6	785
676	2023-08-30	f	4	677
677	2023-07-07	f	5	134
678	12023-01-26	t	8	759
679	2023-08-16	t	6	869
680	2023-08-21	f	3	691
681	2023-01-21	f	5	97
682	2023-03-15	t	8	398
683	2023-07-13	f	2	554
684	12023-01-01	t	1	208
685	2023-09-20	f	8	713
686	2023-05-14	f	5	110
687	2023-11-04	t	4	565
688	2023-10-23	f	1	732
689	2023-01-31	t	7	362
690	2022-12-23	t	1	74
691	12023-02-02	f	2	137
692	2022-12-08	f	3	60
693	2023-11-12	t	7	13
694	2023-08-16	t	3	254
695	2023-02-19	t	8	688
696	12023-02-02	t	5	717
697	2023-08-11	f	4	264
698	2023-08-22	f	7	469
699	2023-01-20	f	4	859
700	2023-10-15	t	4	691
701	2023-07-28	t	6	870
702	2023-07-25	t	4	462
703	2023-07-26	f	5	161
704	2023-07-27	t	7	668
705	2023-11-28	f	1	424
706	2023-06-29	f	1	962
707	2023-03-14	t	6	375
708	2023-04-22	f	3	139
709	2023-04-16	f	7	798
710	2023-01-12	f	4	323
711	2023-08-19	t	8	3
712	2023-11-22	f	6	380
713	2023-04-07	f	4	252
714	2023-02-15	t	7	948
715	2023-01-19	f	2	126
716	2023-12-01	f	6	627
717	2023-10-19	f	4	325
718	2023-10-03	t	4	969
719	2023-03-30	t	4	27
720	12023-01-02	f	3	117
721	2023-07-12	t	7	748
722	2023-07-31	t	7	645
723	2023-03-13	t	5	405
724	2023-08-27	t	7	606
725	2023-04-13	t	2	812
726	2023-01-13	f	6	131
727	2023-08-24	t	6	557
728	2023-06-13	f	6	927
729	2023-01-30	f	5	171
730	2023-06-21	t	3	844
731	2023-08-25	t	8	340
732	2023-10-18	f	1	205
733	2022-12-24	f	3	207
734	2023-01-03	t	5	897
735	2023-05-30	f	6	765
736	2023-03-14	f	2	566
737	2023-10-31	f	3	864
738	2023-08-11	t	5	787
739	2023-03-03	t	2	872
740	2023-01-28	f	7	841
741	2023-10-09	f	7	430
742	2023-02-19	f	5	969
743	2023-11-14	f	4	870
744	2023-06-08	f	2	118
745	2023-02-25	t	2	661
746	12023-01-08	t	8	717
747	2023-05-09	f	1	415
748	12023-02-03	f	1	41
749	2023-08-07	t	4	275
750	2023-05-10	f	3	606
751	2023-09-08	t	7	947
752	2022-12-09	t	5	723
753	2023-09-06	f	4	625
754	2023-01-07	f	5	692
755	2023-01-28	t	5	185
756	2023-06-03	t	5	75
757	2023-11-06	t	6	284
758	2023-03-15	f	6	58
759	2023-09-14	f	5	816
760	2023-11-22	f	2	317
761	2023-03-15	t	3	958
762	2023-02-14	t	8	604
763	2023-09-30	f	8	183
764	2023-02-04	t	1	467
765	2023-10-28	f	8	461
766	2023-01-25	t	2	71
767	2023-07-11	t	7	321
768	2023-05-20	f	7	635
769	2023-03-20	t	4	632
770	2023-04-07	f	7	977
771	12023-02-05	f	3	110
772	2023-02-06	t	6	428
773	2023-08-19	t	3	990
774	2023-03-23	f	3	840
775	2023-09-16	f	4	654
776	2023-05-07	f	4	226
777	2023-08-20	t	5	679
778	2023-01-19	t	8	216
779	2023-08-21	f	1	984
780	2023-09-09	f	7	298
781	2023-09-30	f	6	465
782	2023-09-17	t	8	126
783	2023-06-18	t	5	677
784	2023-04-22	t	1	953
785	2023-09-17	f	2	866
786	2023-06-28	f	8	7
787	2023-09-08	f	3	277
788	2023-06-20	t	7	377
789	2023-07-22	f	1	454
790	2023-06-07	f	5	678
791	2023-05-09	t	7	596
792	2023-07-24	t	1	679
793	2023-06-19	t	6	467
794	2023-04-12	f	4	191
795	2023-11-06	t	6	416
796	2022-12-29	t	1	955
797	2023-09-07	t	5	340
798	2023-08-15	f	4	554
799	2023-06-23	f	8	959
800	2023-09-23	t	7	197
801	2023-10-14	t	1	97
802	2022-12-09	t	3	846
803	2023-03-08	f	6	116
804	2023-07-26	f	4	887
805	2023-01-22	f	5	351
806	2023-01-21	t	1	267
807	2023-01-12	f	1	219
808	2023-02-20	f	2	731
809	2023-04-18	t	3	221
810	12023-01-11	f	1	489
811	2023-01-13	f	4	332
812	2023-06-13	f	1	726
813	2023-02-16	t	3	356
814	2023-10-30	f	7	164
815	2023-09-08	t	7	868
816	2023-09-08	f	3	646
817	2023-07-06	f	6	757
818	2023-04-06	t	5	524
819	2023-08-11	t	8	623
820	2023-06-07	t	5	185
821	2023-07-29	t	5	336
822	2023-07-11	f	4	857
823	2023-09-23	f	8	666
824	2023-02-20	t	1	988
825	2023-07-26	f	2	7
826	2023-06-30	t	5	109
827	2023-05-20	t	6	663
828	2023-11-14	f	8	877
829	2023-11-15	f	4	577
830	12023-01-19	t	3	659
831	2023-02-17	f	3	555
832	2023-02-23	t	8	641
833	2023-10-09	f	6	24
834	2023-03-23	f	7	719
835	2023-01-28	f	7	362
836	2023-09-25	f	4	106
837	2023-07-17	t	5	88
838	2023-02-17	f	1	943
839	2023-04-03	f	8	116
840	2023-08-03	f	7	97
841	2023-02-23	t	5	237
842	2023-09-30	f	6	865
843	2023-09-03	t	4	550
844	2023-07-01	t	1	726
845	2023-02-04	f	2	900
846	2023-09-03	t	6	632
847	2023-05-30	f	2	680
848	2023-09-03	t	6	827
849	2023-05-07	t	3	854
850	2023-09-07	f	8	292
851	2023-04-15	f	3	917
852	2023-02-23	f	2	555
853	2023-01-10	t	3	412
854	2023-05-18	t	3	753
855	2023-06-22	t	8	92
856	2023-04-17	t	6	798
857	2023-04-16	f	7	36
858	2023-01-15	f	4	822
859	2023-06-01	t	5	713
860	2023-05-09	t	3	407
861	2023-02-14	f	8	204
862	2023-04-17	t	3	960
863	2023-11-25	t	5	886
864	2023-04-23	f	6	334
865	2023-05-17	t	2	163
866	2023-05-31	t	8	361
867	2022-12-28	t	6	959
868	2023-08-24	t	7	682
869	2023-03-08	t	7	485
870	2023-07-20	t	2	12
871	2023-03-26	f	6	928
872	2023-09-10	f	4	872
873	2023-06-13	t	4	135
874	2023-07-04	t	1	256
875	2023-09-24	t	7	344
876	2023-06-26	t	1	174
877	2023-01-01	f	8	134
878	2022-12-28	f	1	271
879	2023-07-11	t	7	600
880	2023-06-23	t	2	863
881	2023-01-19	f	1	596
882	2023-07-31	t	4	12
883	2023-06-19	t	5	458
884	2023-06-22	t	5	738
885	2023-07-19	f	5	49
886	2023-07-08	t	2	310
887	2023-04-04	f	3	54
888	2023-01-03	f	8	768
889	2023-12-06	t	2	621
890	12023-01-20	f	3	517
891	2023-01-14	t	4	579
892	12023-01-11	f	5	89
893	2023-03-11	f	3	387
894	2023-10-13	f	8	892
895	2023-05-23	t	7	563
896	2023-04-19	t	5	531
897	2023-03-21	f	1	871
898	2023-03-03	f	4	591
899	2022-12-16	f	8	488
900	2023-08-30	t	2	579
901	2023-07-09	t	2	654
902	2023-04-10	f	5	384
903	2023-07-02	f	5	473
904	2023-09-17	f	3	571
905	2023-04-03	t	1	621
906	2023-04-27	f	4	120
907	2023-05-10	f	5	663
908	2023-03-21	t	8	81
909	2023-10-06	f	4	680
910	2023-08-03	f	7	632
911	2023-09-02	t	3	84
912	2023-09-25	f	4	993
913	2023-04-19	f	6	151
914	2023-05-27	f	7	101
915	2023-03-09	t	5	343
916	2022-12-18	f	7	484
917	2023-09-12	f	4	452
918	2023-07-16	f	1	320
919	2022-12-15	f	6	237
920	2023-01-27	t	5	642
921	2023-04-08	f	5	670
922	2023-07-26	t	2	100
923	12023-01-16	f	8	423
924	2023-10-28	f	1	168
925	2023-06-16	t	8	791
926	2023-06-09	t	7	882
927	2023-07-20	t	3	90
928	2022-12-25	t	2	706
929	2023-10-18	t	7	69
930	2023-10-16	t	5	845
931	2023-07-10	f	5	209
932	2023-01-29	t	1	289
933	2022-12-20	f	6	113
934	2023-09-12	t	4	24
935	2023-07-23	f	6	883
936	2023-07-17	t	1	621
937	2023-10-18	f	4	33
938	2023-06-20	t	5	58
939	2022-12-11	f	3	876
940	2023-02-06	t	4	244
941	2023-08-18	t	2	413
942	2022-12-22	t	8	699
943	2023-04-12	f	3	751
944	2023-02-05	f	4	272
945	2023-02-20	f	4	904
946	12023-02-05	f	2	246
947	2023-02-26	t	7	975
948	2023-10-30	t	8	850
949	2023-02-26	f	1	771
950	2023-11-15	f	3	508
951	2023-03-04	t	3	474
952	2023-08-20	f	4	356
953	2023-06-10	t	7	725
954	2022-12-07	f	8	308
955	2023-04-20	f	5	880
956	2023-09-22	f	8	36
957	2023-10-01	f	3	423
958	2023-06-25	t	4	622
959	2023-06-24	t	2	242
960	2023-09-09	t	5	821
961	2023-03-15	f	3	928
962	2023-09-03	f	3	404
963	2023-05-22	f	6	865
964	2023-09-27	t	8	365
965	2023-07-17	t	6	409
966	2023-07-30	f	8	383
967	2023-01-12	t	7	379
968	2023-08-23	f	4	131
969	2023-04-27	t	6	806
970	2023-05-24	t	3	715
971	2023-10-26	t	4	516
972	2023-10-14	t	4	122
973	2023-05-09	t	5	336
974	2023-04-22	f	3	432
975	2023-11-06	f	2	397
976	2023-03-06	t	1	72
977	2023-06-18	t	1	842
978	2023-08-28	f	5	903
979	2023-09-04	f	2	544
980	2023-04-05	t	6	5
981	2023-11-09	f	3	213
982	2023-04-30	t	5	111
983	2023-03-31	f	6	547
984	12023-02-05	t	7	896
985	2023-08-05	f	5	234
986	2023-05-22	t	7	730
987	2023-10-15	f	3	666
988	2023-04-02	f	4	634
989	2023-04-06	f	6	57
990	2023-01-24	t	2	708
991	2023-05-14	f	7	43
992	12023-02-02	f	8	679
993	2023-10-09	f	4	428
994	2023-04-03	f	5	233
995	2023-01-17	f	4	613
996	2023-02-17	f	3	72
997	2023-04-08	f	2	741
998	2023-01-26	f	6	176
999	2023-08-15	f	6	321
1000	2023-08-24	f	7	181
\.


--
-- TOC entry 4878 (class 0 OID 24600)
-- Dependencies: 224
-- Data for Name: act_of_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.act_of_registration (id_act_of_registration, id_employee, id_copy_of_book, date_of_signing, sourse) FROM stdin;
1	5	124	2023-09-29	source 3
2	8	27	2023-04-09	source 5
3	2	350	2022-12-18	source 7
4	5	337	2023-07-10	source 8
5	7	194	2022-12-22	source 1
6	6	702	2023-06-28	source 2
7	2	231	2023-10-10	source 6
8	1	937	2023-09-13	source 7
9	4	955	2023-02-05	source 1
10	7	981	2023-10-07	source 9
11	1	336	2023-06-17	source 3
12	1	908	2023-10-17	source 10
13	5	44	2023-04-03	source 10
14	2	822	2023-11-10	source 6
15	3	398	2023-01-06	source 6
16	4	520	2023-01-01	source 3
17	8	711	2023-10-17	source 7
18	2	349	2023-05-02	source 9
19	6	923	2023-01-06	source 4
20	8	71	2022-12-26	source 6
21	5	768	2022-12-30	source 9
22	1	481	2022-12-25	source 4
23	5	523	2023-02-22	source 1
24	1	567	2023-09-26	source 5
25	3	498	2023-02-27	source 4
26	1	897	2023-04-15	source 7
27	5	994	2023-09-23	source 6
28	2	432	2023-04-14	source 8
29	5	622	2023-02-22	source 9
30	4	672	2022-12-15	source 2
31	1	456	2023-09-07	source 5
32	8	359	2022-12-28	source 7
33	6	115	2023-10-25	source 2
34	3	550	2022-12-13	source 6
35	5	553	2023-09-02	source 3
36	1	449	2023-04-27	source 4
37	8	142	2023-05-25	source 2
38	3	304	2023-08-15	source 9
39	4	866	2023-03-18	source 4
40	1	637	2023-05-31	source 2
41	5	776	2023-05-28	source 4
42	3	246	2023-04-18	source 4
43	3	484	2023-10-12	source 3
44	5	430	2023-01-09	source 8
45	3	591	2023-02-07	source 8
46	8	344	2022-12-28	source 5
47	8	629	2022-12-29	source 6
48	7	321	2023-11-28	source 7
49	2	664	2023-04-27	source 10
50	7	755	2023-08-09	source 4
51	1	845	2023-05-10	source 2
52	1	287	2023-09-20	source 3
53	7	379	2023-08-10	source 4
54	1	731	2023-11-15	source 9
55	1	189	2023-11-16	source 1
56	3	580	2023-08-15	source 6
57	7	965	2022-12-17	source 7
58	1	212	2023-06-06	source 9
59	7	857	2023-09-25	source 4
60	7	141	2023-03-02	source 5
61	8	932	2023-10-07	source 6
62	6	631	2023-08-11	source 8
63	7	305	2023-05-27	source 5
64	3	407	2023-05-06	source 10
65	3	419	2023-04-26	source 4
66	3	258	2023-09-19	source 7
67	7	210	2023-02-27	source 6
68	8	983	2023-09-11	source 6
69	8	149	2023-01-05	source 1
70	6	839	2023-10-25	source 7
71	7	255	2023-02-17	source 5
72	6	527	2023-04-19	source 3
73	3	615	2023-11-15	source 10
74	3	423	2023-07-30	source 5
75	3	838	2023-04-02	source 5
76	4	633	2023-01-07	source 5
77	2	68	2023-07-15	source 1
78	5	946	2023-07-17	source 3
79	1	527	2023-06-27	source 9
80	2	10	2023-07-30	source 7
81	2	254	2023-10-28	source 9
82	7	429	2023-09-24	source 9
83	1	347	2023-06-04	source 9
84	5	562	2023-05-29	source 7
85	6	518	2023-05-30	source 4
86	4	72	2023-06-27	source 4
87	1	542	2023-08-07	source 9
88	7	806	2023-04-20	source 5
89	3	231	2023-02-13	source 10
90	6	261	2022-12-23	source 5
91	4	109	2023-11-12	source 3
92	7	508	2022-12-24	source 1
93	3	638	2023-06-18	source 6
94	8	718	2023-03-29	source 3
95	3	111	2023-10-18	source 9
96	5	949	2023-04-25	source 1
97	6	107	2023-02-11	source 2
98	7	138	2023-01-21	source 8
99	3	527	2023-08-29	source 10
100	7	807	2023-01-22	source 3
101	7	294	2023-10-02	source 3
102	2	277	2023-09-16	source 1
103	4	775	2023-06-01	source 7
104	6	228	2023-03-13	source 2
105	2	35	2023-11-19	source 2
106	5	216	2022-12-27	source 6
107	8	397	2023-05-17	source 5
108	8	173	2023-03-01	source 3
109	1	158	2023-02-02	source 10
110	3	955	2023-03-06	source 9
111	4	326	2022-12-20	source 2
112	5	355	2023-05-22	source 1
113	5	629	2023-11-14	source 8
114	4	592	2023-08-16	source 4
115	4	731	2023-01-01	source 7
116	5	130	2022-12-08	source 5
117	7	956	2023-02-22	source 2
118	1	580	2023-01-29	source 1
119	1	278	2023-03-12	source 8
120	2	990	2022-12-24	source 7
121	4	706	2023-09-09	source 9
122	2	458	2023-10-12	source 9
123	8	722	2023-07-03	source 2
124	3	129	2023-08-09	source 7
125	1	457	2023-08-26	source 8
126	2	262	2023-07-18	source 1
127	7	604	2023-05-04	source 3
128	4	321	2023-06-04	source 2
129	7	631	2023-04-15	source 10
130	4	450	2023-04-06	source 7
131	1	535	12023-01-21	source 10
132	4	882	2023-05-26	source 4
133	3	550	2023-05-01	source 5
134	3	333	2023-06-13	source 1
135	6	651	2023-06-15	source 1
136	8	718	2023-04-29	source 5
137	8	97	2023-03-31	source 5
138	8	756	2023-06-01	source 8
139	2	951	2023-01-27	source 10
140	8	879	2022-12-24	source 8
141	7	789	2023-06-14	source 3
142	2	514	2023-09-09	source 7
143	1	979	12023-02-05	source 2
144	5	609	2023-10-26	source 9
145	2	1000	2023-08-24	source 10
146	8	410	2023-03-29	source 4
147	8	678	2023-05-29	source 7
148	6	876	2023-11-18	source 6
149	5	845	2023-04-05	source 3
150	8	786	2023-03-06	source 6
151	2	371	2022-12-18	source 8
152	2	385	2023-02-01	source 6
153	8	357	2023-03-05	source 6
154	8	432	2023-09-14	source 4
155	2	492	2023-01-12	source 10
156	1	451	2023-07-01	source 5
157	5	590	2023-05-27	source 5
158	8	585	2023-08-03	source 9
159	7	961	2023-05-30	source 3
160	6	179	2023-09-01	source 5
161	4	93	2023-07-20	source 6
162	8	342	2023-11-14	source 6
163	4	997	2023-07-23	source 4
164	7	606	2023-07-14	source 8
165	2	643	2023-03-25	source 1
166	2	663	2023-06-02	source 2
167	3	625	2023-06-13	source 8
168	7	383	2023-02-04	source 9
169	8	978	2023-06-20	source 6
170	3	983	2023-11-02	source 6
171	4	174	2023-10-12	source 7
172	3	779	2023-01-26	source 1
173	5	874	2023-08-03	source 7
174	4	347	2023-02-05	source 1
175	5	388	2023-06-07	source 10
176	5	985	2023-08-30	source 1
177	7	643	2023-04-15	source 2
178	3	775	2023-11-15	source 10
179	2	211	2022-12-15	source 10
180	6	685	12023-01-07	source 9
181	7	73	2023-06-06	source 1
182	6	197	2023-07-22	source 7
183	8	228	2023-08-17	source 7
184	8	495	2023-05-23	source 7
185	6	413	2023-08-28	source 8
186	4	425	2023-11-04	source 7
187	8	456	2023-09-03	source 3
188	4	844	2023-08-05	source 8
189	4	640	2023-06-01	source 8
190	1	538	2023-11-18	source 9
191	6	462	2023-05-17	source 9
192	6	300	2023-04-29	source 5
193	4	699	2023-06-13	source 3
194	4	241	2023-01-15	source 8
195	4	736	2023-03-29	source 2
196	7	748	2023-02-22	source 6
197	3	505	2023-06-26	source 10
198	5	568	2023-09-13	source 2
199	2	899	2023-09-22	source 4
200	7	429	2022-12-10	source 4
201	2	188	2023-11-19	source 2
202	7	971	2023-10-17	source 6
203	4	662	2022-12-21	source 4
204	5	297	2023-01-26	source 4
205	7	545	2022-12-15	source 8
206	8	506	2023-02-13	source 5
207	8	258	2023-04-16	source 3
208	5	46	2023-08-08	source 4
209	6	657	2023-10-23	source 4
210	7	718	2023-12-06	source 10
211	1	276	2023-11-17	source 9
212	1	295	2022-12-26	source 1
213	1	926	2023-06-18	source 9
214	5	218	2023-09-02	source 4
215	4	797	12023-02-05	source 10
216	6	393	2023-08-21	source 3
217	5	899	2023-09-05	source 9
218	5	147	2023-03-29	source 4
219	4	325	2023-10-21	source 10
220	6	4	2023-02-14	source 7
221	8	565	2023-04-29	source 3
222	3	41	2023-01-09	source 8
223	8	915	2023-01-23	source 6
224	1	840	2023-03-09	source 8
225	5	178	2023-10-20	source 2
226	6	773	2023-05-01	source 2
227	3	732	2023-10-12	source 1
228	8	990	2023-09-23	source 2
229	7	901	2023-07-08	source 6
230	8	641	2023-09-25	source 7
231	4	369	12023-01-09	source 2
232	4	414	2023-01-29	source 5
233	7	221	2023-10-29	source 6
234	2	190	2023-03-16	source 7
235	4	111	2023-07-17	source 4
236	4	426	2023-09-10	source 8
237	6	432	2023-04-25	source 9
238	7	818	2023-10-24	source 3
239	7	619	2023-08-07	source 3
240	8	591	2022-12-07	source 10
241	7	456	2023-11-19	source 5
242	8	344	2023-06-05	source 10
243	6	897	2023-08-16	source 3
244	8	559	2023-05-09	source 6
245	6	636	2023-08-02	source 7
246	8	982	2023-06-17	source 2
247	2	34	2023-05-03	source 7
248	7	265	2023-03-26	source 10
249	1	320	2023-03-13	source 7
250	5	690	2023-07-26	source 4
251	4	125	2023-05-12	source 10
252	1	876	2023-10-14	source 3
253	3	985	2022-12-28	source 9
254	7	940	2023-09-07	source 3
255	4	696	2023-01-25	source 5
256	6	327	12023-01-01	source 7
257	5	402	2023-04-09	source 1
258	3	321	2023-08-22	source 1
259	4	277	2023-08-28	source 8
260	2	282	2023-07-25	source 1
261	3	426	2023-06-28	source 1
262	2	396	2023-01-09	source 2
263	5	317	2023-05-07	source 7
264	8	309	2023-09-12	source 6
265	8	634	2023-08-16	source 10
266	7	411	2023-05-06	source 6
267	4	472	2023-09-21	source 7
268	1	768	2023-03-13	source 1
269	8	80	2023-08-23	source 6
270	8	371	2022-12-12	source 8
271	8	123	2023-02-19	source 10
272	4	804	2023-11-11	source 4
273	1	889	2023-08-24	source 2
274	6	501	2022-12-08	source 8
275	4	208	2023-08-13	source 5
276	1	209	2023-09-29	source 8
277	7	451	2022-12-31	source 8
278	7	47	2023-08-18	source 10
279	5	800	2023-05-01	source 5
280	7	891	2023-10-14	source 5
281	2	498	2023-10-03	source 6
282	5	520	2023-06-02	source 1
283	6	627	12023-01-01	source 6
284	3	396	2023-08-24	source 3
285	6	972	2023-10-14	source 8
286	8	92	12023-01-06	source 7
287	8	937	2023-09-22	source 10
288	1	753	2023-08-16	source 4
289	4	157	2023-09-21	source 7
290	6	570	2023-04-17	source 1
291	7	939	2023-09-18	source 6
292	7	291	2023-04-23	source 2
293	3	99	2023-06-21	source 8
294	1	779	2022-12-19	source 10
295	7	130	2023-07-28	source 5
296	6	380	2023-09-27	source 8
297	8	715	2023-03-17	source 5
298	3	274	2023-03-21	source 8
299	5	108	2023-10-24	source 8
300	2	672	2023-02-18	source 7
301	3	372	2023-10-23	source 3
302	7	814	2023-10-15	source 5
303	6	757	2022-12-11	source 8
304	5	525	2023-08-03	source 5
305	6	250	2023-03-13	source 9
306	2	85	2023-11-04	source 5
307	8	33	2023-08-14	source 1
308	7	976	2023-03-31	source 10
309	7	499	12023-01-26	source 10
310	2	848	2023-08-31	source 5
311	3	205	2023-03-11	source 3
312	4	832	2023-07-19	source 6
313	7	855	2023-03-27	source 5
314	4	919	2023-09-06	source 2
315	7	807	2023-08-19	source 4
316	8	998	2023-04-17	source 4
317	2	330	2023-04-25	source 2
318	3	950	2023-06-28	source 10
319	8	686	2023-03-03	source 10
320	6	83	2023-03-12	source 9
321	5	367	2023-05-02	source 6
322	1	591	2023-10-22	source 7
323	6	269	2023-01-19	source 2
324	8	265	2023-07-05	source 10
325	2	202	2023-06-10	source 5
326	5	348	2023-10-12	source 10
327	5	901	2023-07-10	source 8
328	8	776	2023-05-14	source 6
329	2	431	2023-03-18	source 5
330	5	481	2023-11-16	source 8
331	7	639	2023-01-12	source 7
332	3	555	12023-01-23	source 3
333	3	730	2023-04-29	source 10
334	2	953	2023-10-27	source 2
335	8	766	2023-02-18	source 10
336	3	74	2023-07-12	source 6
337	8	163	12023-01-22	source 4
338	3	317	2023-03-10	source 9
339	8	717	2022-12-21	source 10
340	8	187	2023-04-20	source 4
341	8	212	2023-11-10	source 2
342	3	784	2022-12-16	source 7
343	2	154	2023-07-27	source 9
344	3	704	2023-07-16	source 3
345	7	270	2023-08-30	source 9
346	4	405	2023-08-21	source 8
347	2	822	2023-02-10	source 10
348	7	929	2023-08-22	source 10
349	8	543	2023-02-11	source 9
350	3	776	2023-10-14	source 3
351	8	653	2023-11-04	source 2
352	4	386	2023-09-04	source 2
353	8	338	2023-09-02	source 8
354	3	435	2023-05-09	source 4
355	2	490	2023-08-03	source 6
356	3	986	2023-07-10	source 8
357	4	403	2023-05-05	source 10
358	8	653	2023-09-06	source 1
359	7	842	2023-04-04	source 9
360	2	98	2023-01-13	source 8
361	7	170	2023-06-06	source 2
362	1	83	2023-04-09	source 1
363	1	943	2023-04-16	source 5
364	4	183	2023-02-04	source 5
365	2	455	2023-10-02	source 2
366	1	293	2023-04-03	source 6
367	5	952	2023-09-27	source 3
368	4	147	2023-09-01	source 5
369	7	532	2023-06-15	source 7
370	3	692	2023-05-14	source 8
371	5	959	2023-04-05	source 6
372	8	418	2023-11-11	source 5
373	1	923	2023-10-14	source 3
374	3	698	2023-03-17	source 4
375	6	650	2022-12-27	source 9
376	6	654	2023-01-26	source 5
377	7	333	2023-11-24	source 10
378	5	378	2023-04-30	source 8
379	7	927	2023-05-18	source 8
380	2	726	2023-06-14	source 2
381	3	964	2023-07-01	source 4
382	7	877	2023-01-18	source 3
383	5	166	2023-11-03	source 10
384	3	621	2023-10-24	source 9
385	7	781	2023-05-13	source 4
386	2	351	2023-07-10	source 2
387	7	880	2023-02-25	source 8
388	5	62	2023-11-18	source 8
389	4	634	2023-06-24	source 7
390	6	70	2023-06-18	source 6
391	6	86	2023-01-11	source 10
392	5	780	2023-07-29	source 7
393	7	364	2023-04-14	source 5
394	6	923	2023-04-01	source 9
395	6	73	2023-10-23	source 2
396	1	321	2023-05-28	source 2
397	3	292	2023-11-28	source 5
398	3	85	2023-01-18	source 8
399	1	548	2023-10-14	source 6
400	5	920	2023-08-25	source 3
401	7	755	2023-08-22	source 9
402	6	939	2023-03-03	source 10
403	3	190	2023-11-14	source 4
404	1	728	2023-04-23	source 9
405	1	56	2023-07-26	source 9
406	3	155	2023-01-20	source 8
407	5	214	12023-01-25	source 3
408	1	485	2022-12-20	source 7
409	8	401	12023-01-29	source 4
410	2	274	2023-04-29	source 2
411	1	792	2023-02-06	source 8
412	4	600	2023-06-04	source 4
413	6	334	2023-10-26	source 2
414	7	519	2023-02-27	source 3
415	5	833	2023-11-24	source 5
416	3	867	2023-04-13	source 2
417	5	986	2023-06-30	source 4
418	7	154	2023-02-06	source 5
419	3	793	2023-11-02	source 10
420	5	2	12023-01-09	source 5
421	3	75	2023-11-17	source 7
422	3	471	2023-08-07	source 10
423	5	74	2023-05-10	source 9
424	1	462	2023-05-16	source 3
425	5	315	2022-12-16	source 8
426	1	547	2023-07-31	source 6
427	8	917	2023-04-14	source 9
428	7	459	12023-02-02	source 8
429	5	964	2023-02-16	source 2
430	3	609	2023-04-20	source 4
431	4	432	2023-10-24	source 9
432	4	675	2023-02-22	source 3
433	8	619	2023-02-04	source 10
434	3	255	2023-10-15	source 5
435	4	218	2023-07-28	source 8
436	2	446	2023-02-23	source 3
437	2	530	2023-05-13	source 4
438	2	851	2023-07-17	source 7
439	2	332	2023-03-06	source 5
440	2	481	2023-09-13	source 3
441	6	68	2023-04-02	source 6
442	1	243	2023-10-15	source 4
443	7	102	2022-12-09	source 7
444	4	955	2023-10-04	source 1
445	4	204	2023-06-30	source 2
446	1	79	2023-04-14	source 10
447	5	593	2023-09-08	source 5
448	6	12	2023-05-26	source 2
449	7	308	2023-02-20	source 3
450	2	755	2023-06-11	source 2
451	8	250	2023-09-06	source 7
452	4	723	2023-02-26	source 2
453	3	541	2023-07-17	source 4
454	7	831	2023-03-03	source 5
455	1	985	2023-05-03	source 2
456	7	305	2023-07-11	source 1
457	3	722	2023-03-14	source 7
458	3	387	2022-12-26	source 9
459	7	915	2023-02-07	source 4
460	6	439	2023-02-18	source 7
461	8	960	2023-02-25	source 1
462	1	133	2023-08-15	source 4
463	6	930	2023-04-14	source 3
464	5	605	2023-01-07	source 9
465	2	403	2022-12-16	source 2
466	8	794	2023-02-10	source 10
467	8	875	2023-04-12	source 6
468	7	438	2023-04-19	source 4
469	1	430	2023-01-09	source 5
470	2	396	2023-03-10	source 10
471	6	472	2023-06-23	source 1
472	5	987	2023-01-11	source 4
473	4	65	2023-10-26	source 5
474	4	22	2023-05-29	source 5
475	2	155	2023-02-08	source 4
476	8	856	2023-09-01	source 2
477	5	580	2023-08-19	source 2
478	2	683	2023-05-16	source 8
479	2	742	2023-05-07	source 4
480	6	544	2023-11-19	source 9
481	1	255	2023-11-10	source 6
482	5	779	2023-03-04	source 4
483	3	615	2022-12-29	source 1
484	3	625	2023-02-25	source 4
485	4	917	2023-07-16	source 1
486	6	64	2023-02-12	source 8
487	4	605	2023-10-29	source 10
488	4	628	2023-08-20	source 4
489	8	561	2023-09-18	source 9
490	6	346	2023-05-10	source 7
491	2	101	2023-03-26	source 1
492	2	479	12023-02-05	source 10
493	1	21	2022-12-24	source 9
494	5	943	2022-12-30	source 9
495	3	190	2023-05-17	source 10
496	7	913	2023-08-27	source 9
497	8	590	2023-01-25	source 3
498	5	569	2023-01-01	source 7
499	8	614	2023-02-05	source 8
500	1	840	2023-07-20	source 7
501	6	629	2023-10-09	source 5
502	2	536	2023-05-26	source 1
503	6	693	2023-04-18	source 10
504	7	226	2023-03-30	source 7
505	3	141	2023-05-21	source 9
506	5	242	2023-05-09	source 5
507	2	411	2023-10-17	source 10
508	1	760	2023-02-07	source 6
509	5	215	2023-09-08	source 3
510	5	973	2023-07-21	source 8
511	5	230	2023-10-15	source 6
512	7	89	2023-08-17	source 5
513	2	15	2023-06-07	source 3
514	4	536	2023-10-22	source 10
515	4	452	2023-06-24	source 9
516	3	386	2023-08-10	source 2
517	7	490	2023-10-21	source 8
518	2	968	2023-06-27	source 5
519	7	359	2023-09-29	source 1
520	7	780	2022-12-20	source 7
521	1	123	2022-12-12	source 4
522	8	921	2023-01-04	source 10
523	4	635	2023-03-18	source 8
524	8	735	2023-03-17	source 2
525	5	918	2023-05-20	source 9
526	3	256	2023-02-04	source 8
527	1	976	2023-07-30	source 2
528	8	222	2023-06-22	source 7
529	4	965	2023-03-16	source 9
530	8	778	2023-09-02	source 8
531	2	429	2023-01-23	source 1
532	7	866	2023-03-31	source 7
533	1	626	2023-08-24	source 4
534	8	980	12023-02-02	source 6
535	2	885	12023-01-05	source 8
536	7	499	2022-12-26	source 6
537	8	427	2023-09-24	source 7
538	7	933	2023-08-01	source 10
539	2	229	2023-10-22	source 10
540	1	198	2023-10-27	source 10
541	3	676	2023-02-19	source 4
542	1	614	2023-09-10	source 1
543	8	847	2023-01-29	source 4
544	4	641	2023-04-19	source 2
545	2	396	2023-07-10	source 2
546	8	300	2023-01-23	source 2
547	8	978	2023-07-19	source 10
548	1	369	2023-03-20	source 6
549	5	981	2023-07-27	source 2
550	5	918	2023-03-19	source 10
551	8	660	2023-03-12	source 3
552	4	806	2023-04-09	source 5
553	7	729	2023-05-26	source 9
554	5	879	2023-01-25	source 4
555	5	638	2023-07-31	source 2
556	1	864	2023-08-01	source 2
557	1	895	2023-06-16	source 10
558	5	480	2023-03-22	source 6
559	8	341	2022-12-08	source 10
560	4	292	2022-12-29	source 1
561	2	2	2023-03-30	source 4
562	8	819	2023-04-17	source 3
563	6	930	2023-04-13	source 4
564	4	488	2022-12-14	source 4
565	1	370	2023-04-21	source 10
566	5	293	2023-10-31	source 9
567	8	168	2023-08-25	source 7
568	3	566	2023-10-06	source 2
569	7	180	2023-07-16	source 4
570	6	220	2023-08-20	source 10
571	5	511	2023-08-23	source 10
572	3	169	2023-10-06	source 4
573	1	69	12023-01-21	source 6
574	7	86	2023-01-02	source 2
575	7	833	2023-12-03	source 1
576	8	7	2023-02-12	source 8
577	8	877	2023-03-12	source 2
578	6	154	2023-06-18	source 8
579	8	41	2022-12-31	source 2
580	6	591	2023-07-11	source 4
581	1	312	2023-03-09	source 3
582	8	954	2023-03-07	source 4
583	2	114	2023-11-24	source 4
584	4	141	2023-02-23	source 9
585	2	19	2023-07-11	source 7
586	1	446	2023-03-11	source 9
587	8	50	2023-05-01	source 3
588	5	38	2023-02-28	source 5
589	4	297	2023-02-24	source 1
590	6	785	2023-06-29	source 10
591	4	415	2023-10-27	source 8
592	1	316	2023-02-05	source 2
593	8	313	2023-02-03	source 9
594	7	143	2023-06-05	source 3
595	5	250	2022-12-21	source 8
596	7	75	2023-01-26	source 9
597	6	160	2023-05-17	source 9
598	3	249	2023-08-04	source 5
599	2	760	2023-01-10	source 5
600	6	143	2023-07-30	source 3
601	5	705	2023-05-12	source 1
602	3	128	2023-10-01	source 4
603	4	103	2023-09-23	source 10
604	3	538	2023-03-18	source 6
605	8	848	2023-09-22	source 3
606	7	334	2023-07-01	source 7
607	7	969	2023-08-19	source 8
608	6	365	2023-08-18	source 9
609	6	860	2023-11-08	source 5
610	6	237	2023-08-11	source 9
611	1	616	12023-02-02	source 1
612	6	678	2023-01-23	source 5
613	5	742	2023-04-11	source 8
614	6	799	2023-09-11	source 7
615	3	589	2023-07-29	source 2
616	4	842	2023-11-04	source 4
617	2	906	2023-01-05	source 4
618	5	833	2023-11-17	source 5
619	6	812	2023-08-08	source 1
620	3	632	2023-07-06	source 10
621	5	674	2023-02-12	source 4
622	1	466	2023-09-30	source 9
623	5	707	2022-12-08	source 10
624	1	602	2023-06-20	source 1
625	5	84	2023-03-18	source 2
626	7	641	2023-05-28	source 1
627	5	384	2023-07-21	source 7
628	2	564	2023-09-21	source 5
629	6	383	2023-05-06	source 6
630	2	433	2023-06-15	source 1
631	3	804	12023-01-01	source 10
632	5	657	2023-06-19	source 4
633	4	809	2023-07-18	source 3
634	6	232	2023-10-31	source 4
635	1	168	2023-06-02	source 8
636	7	301	2023-05-21	source 3
637	5	595	2023-10-15	source 10
638	2	167	2023-03-05	source 6
639	4	202	2023-01-13	source 9
640	8	354	2023-01-18	source 6
641	8	304	2023-08-09	source 6
642	7	889	2023-01-29	source 7
643	3	802	2023-11-15	source 10
644	1	140	2022-12-29	source 2
645	4	17	2022-12-17	source 9
646	7	469	2023-01-27	source 3
647	3	345	2023-02-26	source 10
648	1	819	12023-01-27	source 6
649	7	614	2023-05-30	source 1
650	4	997	2023-01-14	source 3
651	1	527	2023-01-21	source 5
652	4	144	2023-10-27	source 10
653	4	648	2023-09-22	source 3
654	6	775	2022-12-08	source 2
655	1	658	2023-08-23	source 1
656	1	638	12023-02-04	source 7
657	8	776	2023-06-06	source 6
658	1	878	2022-12-13	source 3
659	7	15	2023-07-26	source 3
660	7	301	2023-05-11	source 8
661	5	875	12023-02-04	source 4
662	7	477	2023-08-05	source 7
663	3	375	2023-07-14	source 9
664	6	951	2023-10-17	source 3
665	1	203	12023-01-07	source 1
666	1	115	2023-01-10	source 7
667	5	974	2023-02-22	source 4
668	5	178	2023-10-11	source 4
669	8	366	2023-09-15	source 6
670	2	994	2023-10-24	source 5
671	3	341	2023-07-13	source 1
672	6	39	2023-03-20	source 5
673	2	174	2023-05-19	source 2
674	6	329	2023-10-19	source 7
675	2	247	12023-01-29	source 1
676	2	843	2023-03-18	source 8
677	2	770	2023-01-02	source 2
678	3	219	2023-08-06	source 5
679	6	673	2023-04-23	source 4
680	1	657	2023-06-01	source 4
681	8	919	2023-01-09	source 2
682	6	120	2023-03-23	source 4
683	2	331	2023-11-30	source 6
684	2	437	2023-03-14	source 6
685	8	742	2023-03-22	source 5
686	4	569	2022-12-11	source 9
687	1	861	2023-08-19	source 4
688	8	997	2022-12-13	source 3
689	4	757	2023-01-04	source 3
690	2	913	2023-09-29	source 4
691	3	60	2023-04-16	source 9
692	2	144	2023-01-21	source 7
693	8	583	2022-12-26	source 5
694	4	723	2023-03-24	source 10
695	7	69	2023-01-17	source 6
696	5	136	2023-04-14	source 1
697	2	613	2022-12-21	source 5
698	7	958	2023-03-25	source 2
699	6	715	2022-12-16	source 6
700	7	750	2023-08-12	source 9
701	3	108	2023-02-01	source 8
702	8	582	2023-01-16	source 1
703	2	290	2023-03-13	source 6
704	6	220	2023-03-15	source 4
705	8	624	2023-01-21	source 5
706	2	127	2023-01-21	source 4
707	2	504	2023-07-15	source 7
708	5	985	2023-03-11	source 8
709	7	5	2023-03-28	source 5
710	3	288	2023-03-28	source 5
711	6	232	2023-07-12	source 4
712	2	761	2023-11-28	source 1
713	3	349	2022-12-31	source 8
714	1	186	2023-10-27	source 8
715	5	672	2023-02-08	source 1
716	6	446	2023-02-27	source 2
717	4	865	2023-10-18	source 7
718	3	221	12023-02-02	source 6
719	2	854	2023-02-14	source 5
720	2	281	2023-04-01	source 2
721	1	60	2023-03-04	source 2
722	1	272	2023-06-17	source 1
723	4	926	2023-01-29	source 10
724	5	296	2023-01-21	source 4
725	1	106	2023-03-09	source 3
726	8	540	2023-09-04	source 7
727	5	433	2023-07-13	source 1
728	3	253	2023-07-20	source 4
729	3	487	2022-12-17	source 1
730	2	940	2023-01-13	source 1
731	8	649	2023-02-20	source 1
732	1	775	2023-10-14	source 3
733	2	935	2023-09-07	source 6
734	3	894	2023-07-13	source 2
735	4	691	2023-12-06	source 8
736	4	302	2023-03-17	source 3
737	5	207	2023-05-14	source 8
738	5	766	2023-06-24	source 5
739	6	628	2023-05-15	source 9
740	4	79	2023-10-26	source 6
741	3	384	2023-01-05	source 4
742	2	294	2023-10-17	source 9
743	3	245	2023-03-14	source 9
744	6	38	2023-01-29	source 4
745	4	86	2023-04-06	source 4
746	4	876	2023-07-21	source 3
747	2	633	2023-01-18	source 8
748	4	814	2023-02-01	source 1
749	6	196	2023-10-30	source 9
750	2	747	2023-08-31	source 7
751	1	555	2023-07-25	source 1
752	7	90	2023-07-09	source 9
753	3	331	2022-12-16	source 6
754	7	244	2023-10-17	source 4
755	8	78	2022-12-24	source 4
756	5	137	2023-04-19	source 7
757	8	681	2023-05-08	source 8
758	7	491	2023-07-22	source 3
759	6	32	2023-05-20	source 6
760	5	433	2022-12-09	source 10
761	5	74	12023-01-23	source 7
762	3	286	2023-07-10	source 5
763	4	114	2023-07-16	source 3
764	5	739	2023-09-23	source 4
765	6	645	2022-12-18	source 3
766	2	546	2023-08-23	source 4
767	3	18	2023-03-15	source 5
768	8	226	2023-04-30	source 5
769	1	466	2023-07-18	source 9
770	2	721	2023-04-13	source 8
771	5	600	2023-03-22	source 6
772	2	812	2023-03-19	source 9
773	1	586	2023-10-11	source 2
774	8	433	2023-03-27	source 9
775	5	135	2023-06-06	source 9
776	7	116	2023-10-27	source 6
777	3	508	2023-03-31	source 6
778	8	49	2023-10-10	source 8
779	1	978	2023-07-17	source 6
780	5	158	2023-10-04	source 10
781	2	330	2023-06-14	source 8
782	1	987	2023-07-03	source 5
783	1	596	2023-09-04	source 2
784	3	663	2023-09-13	source 7
785	5	230	2023-05-26	source 5
786	1	730	2023-09-13	source 7
787	7	712	2023-04-09	source 8
788	5	629	2023-09-15	source 5
789	4	972	12023-02-04	source 3
790	5	57	2023-03-28	source 4
791	1	271	2023-08-04	source 3
792	6	598	2023-04-01	source 1
793	2	573	2023-09-07	source 9
794	8	920	2023-07-24	source 7
795	8	144	2023-06-30	source 1
796	3	967	2023-10-21	source 5
797	4	626	2023-06-15	source 10
798	5	534	2023-03-31	source 9
799	6	115	2023-06-15	source 3
800	5	28	2023-02-07	source 8
801	3	522	2023-03-09	source 6
802	4	500	2023-02-19	source 3
803	6	92	2023-03-14	source 7
804	7	248	2022-12-21	source 1
805	4	877	2023-08-15	source 8
806	8	921	2023-02-11	source 1
807	3	226	2023-10-31	source 7
808	2	201	2023-02-27	source 7
809	5	526	2023-05-17	source 2
810	7	847	2023-09-28	source 3
811	6	892	2023-04-28	source 3
812	8	415	2023-11-30	source 8
813	7	552	2022-12-29	source 5
814	7	343	2023-04-01	source 4
815	6	573	2023-10-13	source 3
816	7	915	2022-12-18	source 5
817	8	606	2023-06-05	source 9
818	5	646	2023-06-09	source 7
819	3	527	2023-01-04	source 1
820	7	423	2023-11-24	source 9
821	8	666	2023-03-04	source 2
822	7	216	2023-02-21	source 9
823	1	402	2023-01-19	source 9
824	5	670	2023-08-18	source 2
825	6	412	2023-11-08	source 1
826	3	762	2023-02-19	source 4
827	1	315	2023-05-11	source 7
828	4	484	2023-02-13	source 6
829	7	504	2023-06-23	source 3
830	8	907	2023-07-25	source 10
831	8	488	2023-11-10	source 9
832	3	202	2023-03-05	source 5
833	6	573	2023-06-21	source 4
834	1	783	2023-05-04	source 5
835	4	408	12023-01-29	source 1
836	2	807	2023-07-28	source 6
837	8	146	2023-04-28	source 8
838	4	778	2023-12-06	source 9
839	4	327	2022-12-14	source 4
840	3	609	2023-07-02	source 3
841	1	404	2023-02-07	source 6
842	7	206	2023-04-15	source 10
843	3	427	2023-09-24	source 6
844	8	221	2022-12-23	source 2
845	4	865	2023-06-12	source 1
846	8	697	2023-05-11	source 1
847	5	940	2023-10-29	source 4
848	8	581	12023-01-25	source 10
849	6	279	2023-10-08	source 5
850	1	691	2022-12-24	source 5
851	4	987	2023-05-19	source 5
852	6	143	2023-09-29	source 6
853	3	576	2023-08-01	source 3
854	3	598	2023-11-18	source 4
855	5	543	2023-04-04	source 10
856	4	298	2023-03-09	source 10
857	8	474	2023-07-10	source 6
858	5	639	2023-02-17	source 4
859	8	658	2023-09-04	source 10
860	8	410	2023-01-23	source 8
861	3	112	2023-05-13	source 4
862	8	760	2023-03-10	source 5
863	3	567	2023-09-08	source 10
864	4	915	2023-09-23	source 8
865	8	828	2023-11-04	source 9
866	8	412	2023-01-18	source 7
867	6	373	2023-03-09	source 5
868	4	848	2022-12-28	source 8
869	4	268	2023-09-11	source 6
870	4	829	2023-03-12	source 2
871	4	749	2023-03-22	source 8
872	7	289	2023-01-03	source 3
873	5	636	2023-07-26	source 5
874	8	688	2023-04-06	source 10
875	6	383	2023-11-11	source 1
876	7	243	2023-07-11	source 10
877	5	621	2022-12-18	source 5
878	8	756	2023-01-22	source 10
879	1	93	2023-09-21	source 6
880	7	330	2023-04-05	source 7
881	7	456	2023-11-16	source 7
882	2	82	2023-03-08	source 10
883	3	846	2023-06-26	source 7
884	2	371	2023-10-15	source 10
885	5	834	2023-01-09	source 4
886	1	13	2023-05-17	source 9
887	7	910	2023-02-23	source 3
888	2	96	2023-07-10	source 8
889	1	202	2023-09-07	source 2
890	8	549	2023-06-30	source 6
891	8	132	2023-06-22	source 4
892	7	941	2023-02-10	source 10
893	1	979	2023-05-28	source 6
894	7	7	2023-10-21	source 3
895	4	457	2023-02-08	source 3
896	7	410	2023-10-31	source 1
897	7	564	2023-11-18	source 1
898	5	533	2023-11-19	source 5
899	6	722	2023-01-04	source 3
900	6	191	2023-01-02	source 7
901	2	162	2023-09-26	source 10
902	3	590	2023-06-12	source 3
903	3	193	2023-04-16	source 5
904	2	849	2023-01-04	source 8
905	5	306	2023-04-28	source 5
906	4	125	2023-05-23	source 4
907	7	985	2023-05-25	source 9
908	1	790	2023-07-30	source 1
909	2	472	2023-07-22	source 6
910	8	430	12023-02-02	source 2
911	5	823	2023-08-24	source 6
912	2	331	2023-01-21	source 9
913	1	354	2023-11-19	source 1
914	8	90	2023-07-18	source 10
915	2	706	2023-06-28	source 3
916	8	851	12023-01-13	source 6
917	3	359	2023-10-03	source 6
918	5	278	2023-06-14	source 10
919	6	807	2023-01-27	source 10
920	2	35	12023-01-06	source 5
921	3	970	2022-12-15	source 8
922	3	848	2023-10-18	source 5
923	1	236	2023-06-03	source 7
924	7	906	2023-02-20	source 7
925	6	154	2022-12-30	source 3
926	8	679	2023-08-29	source 3
927	3	366	2023-10-05	source 1
928	5	703	2023-04-01	source 6
929	7	272	2023-01-16	source 10
930	4	893	12023-01-05	source 10
931	4	178	2023-08-27	source 1
932	4	846	2023-01-04	source 1
933	3	265	2023-06-05	source 10
934	1	606	2023-03-06	source 8
935	4	706	2023-02-04	source 10
936	5	454	2023-05-28	source 8
937	3	617	2023-03-27	source 3
938	7	850	2023-10-05	source 3
939	6	115	2023-04-06	source 2
940	7	952	12023-01-09	source 2
941	7	954	2023-02-12	source 2
942	7	761	2023-01-04	source 9
943	4	91	2023-02-24	source 4
944	4	440	2023-07-10	source 6
945	6	128	2023-04-19	source 7
946	5	820	2023-03-09	source 7
947	7	160	2023-03-22	source 5
948	5	146	2023-11-30	source 9
949	1	605	2023-06-25	source 10
950	8	227	2023-06-18	source 5
951	4	692	2023-07-16	source 3
952	4	793	2023-10-03	source 9
953	1	838	2023-10-16	source 5
954	4	397	2023-04-14	source 4
955	5	63	2023-02-13	source 4
956	3	70	2023-03-24	source 9
957	7	668	2023-04-26	source 8
958	7	745	2023-06-14	source 6
959	6	650	2023-02-20	source 3
960	2	148	2023-01-21	source 10
961	7	345	2023-05-25	source 6
962	4	483	2023-11-14	source 7
963	6	85	2023-04-01	source 5
964	8	907	2023-06-10	source 6
965	6	335	12023-01-07	source 6
966	2	312	2023-05-07	source 10
967	2	515	2023-07-03	source 2
968	3	881	2023-04-17	source 1
969	4	241	2023-04-15	source 8
970	5	262	2023-03-10	source 7
971	8	834	2023-05-14	source 5
972	2	362	2023-04-20	source 2
973	7	355	2023-03-18	source 2
974	3	53	2023-09-10	source 3
975	6	640	2023-02-09	source 6
976	3	616	2023-02-12	source 7
977	6	543	2023-10-18	source 7
978	3	924	2022-12-27	source 6
979	3	848	2023-10-15	source 8
980	2	340	2023-10-05	source 3
981	2	224	2023-04-21	source 3
982	2	322	2023-08-26	source 2
983	4	572	12023-01-23	source 4
984	8	811	2023-08-29	source 7
985	7	498	2023-04-04	source 2
986	1	275	2023-03-21	source 8
987	8	775	2023-07-27	source 5
988	6	685	2023-06-21	source 6
989	1	347	2023-01-23	source 8
990	3	588	2023-10-24	source 9
991	7	516	2023-10-15	source 3
992	3	981	2023-04-17	source 9
993	1	954	2023-08-10	source 8
994	1	791	12023-02-02	source 3
995	2	502	2023-03-13	source 8
996	7	545	2023-03-16	source 4
997	1	535	2023-01-02	source 4
998	3	277	2023-03-12	source 2
999	2	2	2023-11-11	source 8
1000	3	247	2023-11-11	source 5
\.


--
-- TOC entry 4877 (class 0 OID 24588)
-- Dependencies: 223
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id_book, year_of_writing, number_of_volume, name_of_book, authors, language, area_of_knowledge, genre) FROM stdin;
1	2010	8	Pride and Prejudice	George Orwell	Hiri Motu	Mathematics	historical fiction
2	1998	8	1984	Ernest Hemingway	Swahili	Sociology	horror
3	1988	5	The Chronicles of Narnia	Mark Twain	Guaraní	Computer Science	science fiction
4	1991	6	1984	Mark Twain	Filipino	Sociology	horror
5	2012	9	The Catcher in the Rye	George Orwell	Haitian Creole	Sociology	romance
6	2007	10	The Lord of the Rings	Ernest Hemingway	Romanian	Mathematics	thriller
7	2007	10	1984	Jane Austen	English	Sociology	fantasy
8	1997	7	The Lord of the Rings	Ernest Hemingway	Gujarati	Biology	mystery
9	1987	1	The Chronicles of Narnia	George Orwell	Moldovan	Mathematics	self-help
10	2011	4	1984	Mark Twain	Swahili	Sociology	historical fiction
11	2006	9	To Kill a Mockingbird	Ernest Hemingway	New Zealand Sign Language	Psychology	self-help
12	2003	5	The Chronicles of Narnia	William Shakespeare	Chinese	Computer Science	adventure
13	2000	9	The Lord of the Rings	J.K. Rowling	Greek	Literature	historical fiction
14	2005	8	The Hobbit	Harper Lee	Swahili	Psychology	fantasy
15	2006	7	Pride and Prejudice	George Orwell	Croatian	Literature	historical fiction
16	1998	4	The Chronicles of Narnia	Leo Tolstoy	Bosnian	Sociology	historical fiction
17	2009	9	The Catcher in the Rye	Leo Tolstoy	German	Mathematics	historical fiction
18	1997	7	The Catcher in the Rye	Leo Tolstoy	Portuguese	Mathematics	horror
19	2012	4	The Hobbit	Mark Twain	Dhivehi	Computer Science	adventure
20	2013	5	The Hobbit	Jane Austen	Montenegrin	Sociology	fantasy
21	2008	8	Pride and Prejudice	Mark Twain	Kazakh	Mathematics	romance
22	1991	9	The Great Gatsby	Jane Austen	Azeri	Mathematics	adventure
23	2011	10	The Chronicles of Narnia	Mark Twain	Telugu	History	science fiction
24	2001	9	1984	Harper Lee	Romanian	Computer Science	adventure
25	2000	7	The Catcher in the Rye	Charles Dickens	Kannada	History	biography
26	2000	4	The Lord of the Rings	Charles Dickens	Irish Gaelic	Psychology	romance
27	2010	3	1984	F. Scott Fitzgerald	Hungarian	Biology	historical fiction
28	1996	2	1984	Jane Austen	Haitian Creole	Biology	self-help
29	1997	5	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Norwegian	Biology	thriller
30	2006	2	The Chronicles of Narnia	George Orwell	Hungarian	Physics	mystery
31	2007	9	The Hobbit	F. Scott Fitzgerald	Hiri Motu	Psychology	science fiction
32	1994	5	Harry Potter and the Philosopher's Stone	Charles Dickens	Bengali	Biology	adventure
33	2006	8	1984	Mark Twain	Thai	Biology	science fiction
34	2003	7	The Great Gatsby	Harper Lee	Swedish	Literature	adventure
35	2012	10	The Catcher in the Rye	Jane Austen	Swati	Biology	romance
36	2010	7	The Catcher in the Rye	Harper Lee	Dutch	History	adventure
37	2004	3	Moby-Dick	Harper Lee	Montenegrin	Computer Science	romance
38	2010	2	Moby-Dick	Ernest Hemingway	Tswana	Computer Science	thriller
39	1997	1	The Great Gatsby	George Orwell	Marathi	Literature	thriller
40	1993	1	The Lord of the Rings	Harper Lee	Italian	Biology	historical fiction
41	1998	6	The Great Gatsby	Mark Twain	Romanian	Biology	adventure
42	1993	9	The Catcher in the Rye	Harper Lee	New Zealand Sign Language	Biology	fantasy
43	1997	1	To Kill a Mockingbird	Jane Austen	Irish Gaelic	Biology	horror
44	1988	8	The Hobbit	Ernest Hemingway	Oriya	History	thriller
45	2009	5	Harry Potter and the Philosopher's Stone	George Orwell	Tajik	Computer Science	science fiction
46	2012	7	1984	Mark Twain	Bosnian	Biology	romance
47	1996	4	Pride and Prejudice	Charles Dickens	Portuguese	Biology	horror
48	2005	6	The Chronicles of Narnia	Jane Austen	Oriya	Chemistry	adventure
49	2006	9	The Lord of the Rings	J.K. Rowling	New Zealand Sign Language	History	historical fiction
50	1998	3	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Bengali	History	self-help
51	2005	9	The Hobbit	Harper Lee	Moldovan	Sociology	self-help
52	1990	6	The Lord of the Rings	William Shakespeare	Malagasy	Physics	science fiction
53	1988	7	1984	George Orwell	Lao	Computer Science	horror
54	2011	3	The Great Gatsby	George Orwell	Czech	Mathematics	romance
55	2004	9	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Czech	Sociology	horror
56	2008	5	The Hobbit	F. Scott Fitzgerald	Hebrew	Physics	mystery
57	1984	5	The Chronicles of Narnia	F. Scott Fitzgerald	Aymara	Biology	historical fiction
58	1997	4	The Chronicles of Narnia	Mark Twain	Belarusian	Physics	historical fiction
59	1995	7	The Hobbit	Leo Tolstoy	Swahili	History	science fiction
60	2007	4	Moby-Dick	Mark Twain	Luxembourgish	Biology	historical fiction
61	2004	7	The Great Gatsby	Harper Lee	Hiri Motu	Sociology	adventure
62	1995	9	The Hobbit	Harper Lee	Moldovan	Biology	horror
63	2000	9	To Kill a Mockingbird	George Orwell	Malagasy	Mathematics	biography
64	2002	8	The Catcher in the Rye	J.K. Rowling	Hungarian	Psychology	fantasy
65	2009	1	The Hobbit	Ernest Hemingway	Hebrew	Literature	self-help
66	2004	3	Harry Potter and the Philosopher's Stone	J.K. Rowling	Moldovan	Biology	self-help
67	1992	7	Pride and Prejudice	F. Scott Fitzgerald	Bulgarian	Computer Science	historical fiction
68	1999	5	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Pashto	Physics	horror
69	2003	9	Moby-Dick	Leo Tolstoy	Dzongkha	Literature	historical fiction
70	1993	7	The Great Gatsby	Leo Tolstoy	Montenegrin	Computer Science	adventure
71	1994	1	Pride and Prejudice	Mark Twain	Dutch	Mathematics	historical fiction
72	1985	2	Pride and Prejudice	J.K. Rowling	Swahili	Mathematics	adventure
73	1999	9	The Chronicles of Narnia	F. Scott Fitzgerald	Polish	Chemistry	historical fiction
74	1983	8	1984	Ernest Hemingway	Dzongkha	History	science fiction
75	1992	4	The Lord of the Rings	William Shakespeare	Assamese	Sociology	fantasy
76	1993	6	The Great Gatsby	Ernest Hemingway	Spanish	Physics	thriller
77	1959	4	The Great Gatsby	Mark Twain	Mongolian	History	biography
78	1988	4	1984	Ernest Hemingway	Fijian	Psychology	biography
79	1998	1	The Catcher in the Rye	Harper Lee	Bulgarian	Physics	mystery
80	1998	3	The Catcher in the Rye	Leo Tolstoy	Czech	History	fantasy
81	2000	5	The Catcher in the Rye	Harper Lee	Macedonian	Biology	romance
82	1989	4	Moby-Dick	William Shakespeare	Kashmiri	Mathematics	self-help
83	2000	9	Pride and Prejudice	Harper Lee	Montenegrin	Sociology	fantasy
84	2001	3	Pride and Prejudice	Mark Twain	Hiri Motu	Mathematics	mystery
85	1986	5	To Kill a Mockingbird	Leo Tolstoy	Malayalam	Biology	fantasy
86	1985	4	The Chronicles of Narnia	William Shakespeare	Tamil	Chemistry	science fiction
87	1985	8	The Catcher in the Rye	George Orwell	Haitian Creole	Chemistry	thriller
88	2006	6	Harry Potter and the Philosopher's Stone	William Shakespeare	Portuguese	Physics	fantasy
89	2003	9	The Great Gatsby	J.K. Rowling	Tswana	Biology	fantasy
90	2012	8	The Lord of the Rings	F. Scott Fitzgerald	Tajik	Sociology	mystery
91	1987	5	1984	F. Scott Fitzgerald	Kannada	Sociology	historical fiction
92	2011	6	The Lord of the Rings	Charles Dickens	Czech	Chemistry	historical fiction
93	1995	9	1984	William Shakespeare	English	Psychology	biography
94	1989	6	Pride and Prejudice	Mark Twain	French	Physics	fantasy
95	1986	2	Pride and Prejudice	Mark Twain	Yiddish	Biology	historical fiction
96	2011	7	The Lord of the Rings	Ernest Hemingway	Thai	Physics	fantasy
97	1996	5	The Great Gatsby	Charles Dickens	Kyrgyz	History	romance
98	1978	9	Harry Potter and the Philosopher's Stone	William Shakespeare	Swati	Physics	biography
99	1995	7	To Kill a Mockingbird	Jane Austen	Tamil	History	biography
100	1998	4	Moby-Dick	Mark Twain	Hebrew	Physics	romance
101	2011	2	The Catcher in the Rye	Leo Tolstoy	Malay	Psychology	self-help
102	2001	3	The Great Gatsby	Jane Austen	Gagauz	Chemistry	historical fiction
103	2013	1	Moby-Dick	Mark Twain	Haitian Creole	Literature	thriller
104	1997	9	The Chronicles of Narnia	Jane Austen	Greek	Sociology	science fiction
105	2001	9	The Lord of the Rings	William Shakespeare	Hebrew	Literature	self-help
106	2007	9	1984	George Orwell	Thai	Mathematics	science fiction
107	2000	2	Pride and Prejudice	Ernest Hemingway	Punjabi	History	historical fiction
108	1997	8	Pride and Prejudice	Ernest Hemingway	Lithuanian	History	self-help
109	2002	2	To Kill a Mockingbird	F. Scott Fitzgerald	Zulu	Computer Science	fantasy
110	1994	8	The Lord of the Rings	William Shakespeare	Japanese	Chemistry	horror
111	2008	2	The Chronicles of Narnia	F. Scott Fitzgerald	Spanish	Biology	thriller
112	2001	2	The Catcher in the Rye	F. Scott Fitzgerald	Kyrgyz	Chemistry	science fiction
113	2011	3	Pride and Prejudice	F. Scott Fitzgerald	New Zealand Sign Language	History	thriller
114	1993	3	Pride and Prejudice	Jane Austen	Tamil	Mathematics	biography
115	2002	6	The Chronicles of Narnia	Jane Austen	Haitian Creole	Biology	thriller
116	1992	8	The Lord of the Rings	George Orwell	Hiri Motu	Sociology	thriller
117	2002	7	1984	F. Scott Fitzgerald	Georgian	Chemistry	self-help
118	1996	2	The Lord of the Rings	Mark Twain	Gujarati	Mathematics	adventure
119	2012	9	The Great Gatsby	Mark Twain	Dhivehi	Psychology	thriller
120	1990	4	To Kill a Mockingbird	Jane Austen	Lithuanian	Biology	historical fiction
121	1995	9	1984	Charles Dickens	Bengali	Biology	thriller
122	1990	9	Moby-Dick	Ernest Hemingway	Bengali	Computer Science	science fiction
123	1978	9	To Kill a Mockingbird	Charles Dickens	Tetum	Computer Science	science fiction
124	2010	5	The Lord of the Rings	F. Scott Fitzgerald	Czech	Sociology	horror
125	1996	5	Pride and Prejudice	F. Scott Fitzgerald	Georgian	Chemistry	biography
126	2011	8	1984	Charles Dickens	Hindi	Mathematics	romance
127	2007	2	The Lord of the Rings	Leo Tolstoy	Latvian	Computer Science	mystery
128	2007	7	Pride and Prejudice	Jane Austen	Burmese	Computer Science	science fiction
129	2000	4	Harry Potter and the Philosopher's Stone	Charles Dickens	Hiri Motu	Chemistry	mystery
130	2008	6	The Chronicles of Narnia	Mark Twain	Tok Pisin	Psychology	historical fiction
131	2008	7	The Great Gatsby	J.K. Rowling	Czech	Chemistry	science fiction
132	1992	10	Harry Potter and the Philosopher's Stone	Jane Austen	Norwegian	Psychology	adventure
133	1978	8	The Hobbit	F. Scott Fitzgerald	Gagauz	Psychology	historical fiction
134	2012	7	The Great Gatsby	J.K. Rowling	Sotho	Literature	adventure
135	1994	1	To Kill a Mockingbird	Charles Dickens	Italian	Physics	adventure
136	1996	10	The Lord of the Rings	F. Scott Fitzgerald	Swedish	Computer Science	self-help
137	1988	6	The Chronicles of Narnia	Harper Lee	Tsonga	Chemistry	historical fiction
138	1999	2	The Lord of the Rings	George Orwell	Swahili	Psychology	romance
139	1995	1	The Lord of the Rings	Jane Austen	Thai	Mathematics	fantasy
634	2008	7	1984	J.K. Rowling	Mongolian	Psychology	thriller
140	2008	8	The Chronicles of Narnia	Leo Tolstoy	Finnish	Computer Science	science fiction
141	2007	8	The Hobbit	George Orwell	Finnish	Literature	biography
142	1989	8	Pride and Prejudice	George Orwell	Kannada	Computer Science	horror
143	2002	10	To Kill a Mockingbird	Mark Twain	Tajik	Sociology	fantasy
144	2005	8	The Lord of the Rings	Ernest Hemingway	Tswana	Psychology	historical fiction
145	1998	4	1984	Harper Lee	Catalan	Mathematics	self-help
146	2002	2	The Great Gatsby	F. Scott Fitzgerald	Dhivehi	Literature	thriller
147	2004	7	Pride and Prejudice	William Shakespeare	Catalan	Chemistry	biography
148	2010	9	The Hobbit	Jane Austen	Catalan	Physics	mystery
149	2010	9	Moby-Dick	Jane Austen	Tamil	Literature	horror
150	2000	5	The Catcher in the Rye	Harper Lee	Swedish	History	fantasy
151	1990	9	Pride and Prejudice	J.K. Rowling	Punjabi	Chemistry	romance
152	2009	4	Moby-Dick	Mark Twain	Azeri	Computer Science	science fiction
153	1995	9	The Lord of the Rings	Mark Twain	Armenian	Computer Science	historical fiction
154	1986	10	The Great Gatsby	Charles Dickens	Bulgarian	History	science fiction
155	2009	8	To Kill a Mockingbird	Harper Lee	Macedonian	History	thriller
156	2001	8	The Great Gatsby	George Orwell	Tsonga	Physics	mystery
157	2001	2	The Great Gatsby	Ernest Hemingway	German	Psychology	thriller
158	1992	7	The Chronicles of Narnia	Harper Lee	Japanese	Computer Science	thriller
159	1994	8	The Lord of the Rings	J.K. Rowling	Polish	Computer Science	horror
160	2007	4	To Kill a Mockingbird	Mark Twain	Haitian Creole	Psychology	thriller
161	2007	9	1984	Leo Tolstoy	Somali	Psychology	historical fiction
162	1998	8	The Hobbit	Jane Austen	Swedish	Literature	thriller
163	1994	1	Harry Potter and the Philosopher's Stone	William Shakespeare	Yiddish	Literature	fantasy
164	2001	9	Harry Potter and the Philosopher's Stone	Charles Dickens	Bulgarian	Literature	thriller
165	2002	8	The Hobbit	F. Scott Fitzgerald	Bengali	Sociology	biography
166	2002	3	Moby-Dick	F. Scott Fitzgerald	Dzongkha	Psychology	historical fiction
167	2004	5	The Catcher in the Rye	Ernest Hemingway	Montenegrin	Literature	mystery
168	2005	6	The Lord of the Rings	William Shakespeare	Kannada	Psychology	science fiction
169	1993	6	Moby-Dick	Ernest Hemingway	Kurdish	Literature	biography
170	1992	1	1984	Charles Dickens	Dzongkha	History	self-help
171	1993	2	Moby-Dick	Leo Tolstoy	Kazakh	History	historical fiction
172	2007	9	Harry Potter and the Philosopher's Stone	Harper Lee	Marathi	Chemistry	self-help
173	2007	10	Moby-Dick	Harper Lee	Kazakh	Mathematics	horror
174	1993	3	Harry Potter and the Philosopher's Stone	Harper Lee	Fijian	Chemistry	thriller
175	2000	9	The Chronicles of Narnia	Mark Twain	Japanese	Computer Science	science fiction
176	1996	2	To Kill a Mockingbird	Harper Lee	Montenegrin	Psychology	adventure
177	2004	1	The Chronicles of Narnia	J.K. Rowling	Italian	Sociology	fantasy
178	2008	7	The Chronicles of Narnia	Jane Austen	Hebrew	Chemistry	horror
179	2002	4	The Lord of the Rings	Ernest Hemingway	Macedonian	Physics	horror
180	2004	8	The Hobbit	Ernest Hemingway	Persian	Psychology	science fiction
181	2010	2	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Punjabi	Literature	self-help
182	1998	10	The Great Gatsby	Ernest Hemingway	Kazakh	Literature	thriller
183	2005	1	Pride and Prejudice	Jane Austen	Punjabi	Psychology	biography
184	1993	1	1984	Charles Dickens	Georgian	Physics	romance
185	1988	9	The Catcher in the Rye	William Shakespeare	Georgian	Physics	adventure
186	2004	4	The Lord of the Rings	Jane Austen	Bengali	Computer Science	adventure
187	1995	2	To Kill a Mockingbird	Charles Dickens	Swedish	Literature	science fiction
188	2005	7	The Chronicles of Narnia	William Shakespeare	Oriya	Computer Science	thriller
189	2010	8	Moby-Dick	Ernest Hemingway	Hungarian	Chemistry	romance
190	2007	6	The Chronicles of Narnia	Jane Austen	Bulgarian	Chemistry	romance
191	1995	10	Pride and Prejudice	Ernest Hemingway	Kyrgyz	Computer Science	adventure
192	2005	9	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Bislama	Biology	science fiction
193	1998	5	1984	J.K. Rowling	Swati	Physics	fantasy
194	2004	6	1984	Leo Tolstoy	German	Sociology	romance
195	2010	7	The Lord of the Rings	Charles Dickens	Gagauz	History	historical fiction
196	1995	10	The Catcher in the Rye	Mark Twain	Irish Gaelic	Physics	thriller
197	2004	1	To Kill a Mockingbird	George Orwell	Persian	Psychology	horror
198	2004	4	Moby-Dick	Mark Twain	Oriya	Mathematics	self-help
199	2008	8	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Nepali	Chemistry	thriller
200	1999	7	1984	William Shakespeare	Greek	Physics	biography
201	2002	8	The Chronicles of Narnia	Ernest Hemingway	Croatian	Psychology	historical fiction
202	2004	7	Moby-Dick	J.K. Rowling	Dzongkha	Psychology	biography
203	2005	5	The Hobbit	Jane Austen	Swedish	History	historical fiction
204	1986	6	Harry Potter and the Philosopher's Stone	J.K. Rowling	Hebrew	History	romance
205	1995	10	The Great Gatsby	Jane Austen	Indonesian	Computer Science	science fiction
206	2003	2	The Hobbit	F. Scott Fitzgerald	Dzongkha	Computer Science	biography
207	1994	3	The Hobbit	George Orwell	Tamil	Sociology	adventure
208	2008	6	The Catcher in the Rye	Charles Dickens	Portuguese	Mathematics	mystery
209	2009	4	Pride and Prejudice	F. Scott Fitzgerald	Hebrew	Computer Science	biography
210	2012	6	To Kill a Mockingbird	Charles Dickens	Luxembourgish	Biology	romance
211	2000	2	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Filipino	Chemistry	mystery
212	1993	2	1984	William Shakespeare	Ndebele	Computer Science	fantasy
213	2006	5	The Hobbit	Jane Austen	Hungarian	Mathematics	adventure
214	2010	3	1984	Ernest Hemingway	Somali	Psychology	self-help
215	1997	10	To Kill a Mockingbird	Ernest Hemingway	Indonesian	Biology	adventure
216	1998	6	1984	J.K. Rowling	Malagasy	Computer Science	mystery
217	2011	3	The Catcher in the Rye	Leo Tolstoy	Catalan	Chemistry	fantasy
218	2009	1	To Kill a Mockingbird	J.K. Rowling	Icelandic	Physics	romance
219	2008	1	1984	George Orwell	Chinese	Biology	adventure
220	2003	10	The Lord of the Rings	F. Scott Fitzgerald	Romanian	History	thriller
221	2006	2	To Kill a Mockingbird	William Shakespeare	Khmer	Psychology	adventure
222	2007	9	Moby-Dick	Harper Lee	Danish	Computer Science	adventure
223	1995	3	Moby-Dick	William Shakespeare	German	History	science fiction
224	2000	6	The Great Gatsby	Mark Twain	Fijian	Chemistry	science fiction
225	1992	6	The Lord of the Rings	Harper Lee	English	Psychology	thriller
226	2010	1	1984	Ernest Hemingway	Malay	Psychology	self-help
227	2010	8	The Great Gatsby	William Shakespeare	Zulu	Psychology	biography
228	1997	3	The Chronicles of Narnia	Charles Dickens	Chinese	Physics	mystery
229	2009	9	The Catcher in the Rye	Harper Lee	Romanian	Sociology	horror
230	1999	2	The Chronicles of Narnia	Leo Tolstoy	Hiri Motu	History	science fiction
231	1996	5	The Lord of the Rings	Jane Austen	Khmer	Computer Science	science fiction
232	2010	9	The Great Gatsby	Jane Austen	Polish	Computer Science	thriller
233	2011	8	1984	Leo Tolstoy	English	History	adventure
234	1999	9	The Catcher in the Rye	Jane Austen	Quechua	Chemistry	mystery
235	1994	6	Pride and Prejudice	Leo Tolstoy	Persian	Computer Science	self-help
236	2000	4	1984	Ernest Hemingway	Tsonga	Physics	historical fiction
237	2003	2	1984	J.K. Rowling	Thai	Chemistry	horror
238	2007	8	Pride and Prejudice	Leo Tolstoy	Kannada	History	romance
239	2001	9	The Chronicles of Narnia	George Orwell	Estonian	Chemistry	science fiction
240	1993	10	Pride and Prejudice	George Orwell	Latvian	Psychology	adventure
241	2000	8	1984	F. Scott Fitzgerald	Georgian	Mathematics	fantasy
242	2000	5	Pride and Prejudice	F. Scott Fitzgerald	Latvian	Sociology	mystery
243	1994	6	1984	Jane Austen	Estonian	Physics	science fiction
244	2004	10	Pride and Prejudice	Harper Lee	Dhivehi	Psychology	self-help
245	1995	5	Pride and Prejudice	J.K. Rowling	Georgian	History	romance
246	1992	8	The Hobbit	Ernest Hemingway	Belarusian	Psychology	adventure
247	2012	2	1984	Jane Austen	Albanian	History	adventure
248	2006	10	The Great Gatsby	George Orwell	Assamese	Physics	mystery
249	2008	6	To Kill a Mockingbird	F. Scott Fitzgerald	Dzongkha	Sociology	self-help
250	2009	7	Moby-Dick	J.K. Rowling	Hindi	History	horror
251	1999	9	The Great Gatsby	William Shakespeare	Tswana	Biology	romance
252	1966	5	Harry Potter and the Philosopher's Stone	Charles Dickens	Spanish	Computer Science	mystery
253	1993	2	The Great Gatsby	Leo Tolstoy	Zulu	Physics	romance
254	2005	3	1984	F. Scott Fitzgerald	Papiamento	Sociology	romance
255	1999	10	The Hobbit	F. Scott Fitzgerald	Croatian	Psychology	romance
256	2000	10	The Lord of the Rings	Ernest Hemingway	English	Biology	historical fiction
257	1995	1	The Hobbit	J.K. Rowling	Bulgarian	Chemistry	adventure
258	2006	4	Moby-Dick	William Shakespeare	New Zealand Sign Language	Physics	thriller
259	1998	6	The Great Gatsby	J.K. Rowling	Croatian	Literature	fantasy
260	1995	2	1984	Harper Lee	Italian	Computer Science	adventure
261	2012	1	The Hobbit	Leo Tolstoy	Gagauz	Literature	romance
262	1995	10	Moby-Dick	F. Scott Fitzgerald	Luxembourgish	Chemistry	fantasy
263	1997	5	To Kill a Mockingbird	Mark Twain	Belarusian	Literature	adventure
264	1987	10	1984	Charles Dickens	Romanian	Literature	self-help
265	1995	10	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Marathi	Sociology	romance
266	1996	9	The Hobbit	William Shakespeare	Catalan	Literature	romance
267	1991	9	1984	F. Scott Fitzgerald	Indonesian	Sociology	science fiction
268	1996	4	Pride and Prejudice	William Shakespeare	Lithuanian	Chemistry	historical fiction
269	2011	7	Pride and Prejudice	Mark Twain	Azeri	Sociology	historical fiction
270	2005	1	The Lord of the Rings	Charles Dickens	Spanish	Literature	horror
271	2000	6	The Hobbit	J.K. Rowling	Estonian	Physics	mystery
272	2000	9	Pride and Prejudice	J.K. Rowling	Armenian	Physics	biography
273	1993	10	Pride and Prejudice	J.K. Rowling	Indonesian	Literature	adventure
274	2007	4	Harry Potter and the Philosopher's Stone	J.K. Rowling	Yiddish	Sociology	mystery
275	1993	10	To Kill a Mockingbird	Harper Lee	Haitian Creole	Biology	historical fiction
276	2001	1	The Catcher in the Rye	F. Scott Fitzgerald	Dutch	Psychology	biography
277	1990	1	The Catcher in the Rye	Jane Austen	Swahili	Biology	horror
278	1986	9	To Kill a Mockingbird	William Shakespeare	Kyrgyz	Biology	thriller
279	1997	2	1984	George Orwell	Gujarati	Mathematics	horror
280	2008	6	The Hobbit	F. Scott Fitzgerald	Tajik	Chemistry	self-help
281	2008	10	The Chronicles of Narnia	F. Scott Fitzgerald	Kashmiri	Literature	adventure
282	1989	6	Pride and Prejudice	J.K. Rowling	Arabic	Physics	horror
283	2010	6	1984	Ernest Hemingway	Māori	Sociology	biography
284	2011	2	1984	Ernest Hemingway	Tetum	Sociology	horror
285	2004	9	The Great Gatsby	Mark Twain	Korean	Mathematics	historical fiction
286	1994	1	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Swedish	Sociology	self-help
287	2000	1	The Great Gatsby	Mark Twain	Chinese	Physics	thriller
288	2009	6	1984	J.K. Rowling	Zulu	Biology	horror
289	1996	6	The Chronicles of Narnia	Leo Tolstoy	Macedonian	Mathematics	mystery
290	2011	10	The Great Gatsby	Charles Dickens	Romanian	Biology	adventure
291	2006	1	Harry Potter and the Philosopher's Stone	William Shakespeare	Icelandic	Biology	historical fiction
292	2006	8	The Chronicles of Narnia	Mark Twain	Danish	Physics	horror
293	2012	3	The Lord of the Rings	Jane Austen	Danish	Psychology	thriller
294	2005	10	Moby-Dick	F. Scott Fitzgerald	Portuguese	Literature	thriller
295	1993	5	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Malayalam	Physics	science fiction
296	2008	10	The Great Gatsby	Leo Tolstoy	Amharic	Psychology	adventure
297	2008	5	The Hobbit	J.K. Rowling	Assamese	Mathematics	self-help
298	1994	8	Harry Potter and the Philosopher's Stone	William Shakespeare	Filipino	Sociology	fantasy
299	2001	6	Moby-Dick	William Shakespeare	Telugu	Biology	science fiction
300	2004	3	The Lord of the Rings	Leo Tolstoy	French	Mathematics	mystery
301	1994	2	The Catcher in the Rye	Charles Dickens	Macedonian	Sociology	horror
302	1990	3	1984	Harper Lee	Maltese	History	historical fiction
303	2009	7	Pride and Prejudice	George Orwell	Hebrew	Psychology	science fiction
304	1986	4	1984	Leo Tolstoy	Dhivehi	Literature	thriller
305	1989	4	Pride and Prejudice	Mark Twain	Kazakh	Biology	biography
306	1999	1	1984	George Orwell	Moldovan	Sociology	horror
307	2007	7	The Hobbit	J.K. Rowling	Persian	Mathematics	science fiction
308	2007	10	To Kill a Mockingbird	Charles Dickens	Tok Pisin	Psychology	science fiction
309	2002	7	The Hobbit	Ernest Hemingway	Filipino	Chemistry	mystery
310	2003	7	To Kill a Mockingbird	Charles Dickens	Italian	History	romance
311	2011	9	The Lord of the Rings	F. Scott Fitzgerald	Spanish	Biology	mystery
312	2000	10	1984	William Shakespeare	Fijian	Chemistry	historical fiction
313	1996	9	Harry Potter and the Philosopher's Stone	J.K. Rowling	Tajik	Mathematics	fantasy
314	1977	3	The Hobbit	F. Scott Fitzgerald	Malayalam	Mathematics	adventure
315	1984	4	The Lord of the Rings	William Shakespeare	Luxembourgish	Computer Science	biography
316	1999	6	The Great Gatsby	Charles Dickens	Montenegrin	Psychology	historical fiction
317	2005	5	The Great Gatsby	George Orwell	Burmese	Physics	thriller
318	2008	9	The Great Gatsby	Jane Austen	Hiri Motu	Chemistry	mystery
319	2010	1	Pride and Prejudice	Leo Tolstoy	Tajik	Biology	historical fiction
320	2011	3	Harry Potter and the Philosopher's Stone	William Shakespeare	Guaraní	History	science fiction
321	1989	4	Pride and Prejudice	J.K. Rowling	Kazakh	Physics	romance
322	2012	5	1984	Harper Lee	Assamese	History	historical fiction
323	1984	9	The Catcher in the Rye	Leo Tolstoy	Gujarati	Physics	biography
324	2001	3	Pride and Prejudice	Jane Austen	Italian	Literature	horror
325	2008	1	Pride and Prejudice	William Shakespeare	Fijian	History	horror
326	1999	9	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Hindi	Sociology	mystery
327	2007	7	The Chronicles of Narnia	Mark Twain	Hungarian	Mathematics	thriller
328	1997	5	The Chronicles of Narnia	Ernest Hemingway	Hungarian	Chemistry	fantasy
329	2012	6	To Kill a Mockingbird	Jane Austen	Indonesian	Literature	mystery
330	2001	1	Pride and Prejudice	Harper Lee	Albanian	Sociology	thriller
331	2011	6	The Lord of the Rings	George Orwell	West Frisian	Biology	horror
332	2008	4	The Catcher in the Rye	Charles Dickens	Chinese	History	romance
333	2007	9	The Chronicles of Narnia	Harper Lee	Dhivehi	Mathematics	biography
334	1992	6	The Lord of the Rings	Harper Lee	Dutch	Chemistry	horror
335	2007	1	The Great Gatsby	William Shakespeare	Assamese	Biology	science fiction
336	2001	3	1984	Harper Lee	Tajik	Chemistry	historical fiction
337	2005	7	The Chronicles of Narnia	Jane Austen	Filipino	Chemistry	mystery
338	1998	10	The Great Gatsby	Mark Twain	Luxembourgish	History	biography
339	1999	10	Harry Potter and the Philosopher's Stone	J.K. Rowling	Kyrgyz	Computer Science	science fiction
340	2003	6	The Catcher in the Rye	F. Scott Fitzgerald	Guaraní	Chemistry	self-help
341	2005	9	To Kill a Mockingbird	Leo Tolstoy	Bislama	Biology	fantasy
342	2004	9	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Mongolian	Psychology	science fiction
343	2002	7	The Hobbit	Charles Dickens	Persian	Biology	fantasy
344	2010	1	To Kill a Mockingbird	Mark Twain	Czech	History	historical fiction
345	2004	2	To Kill a Mockingbird	Harper Lee	Sotho	Mathematics	fantasy
346	2000	9	Harry Potter and the Philosopher's Stone	George Orwell	Macedonian	Mathematics	adventure
347	1997	10	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Tajik	Physics	adventure
348	2002	4	The Lord of the Rings	Leo Tolstoy	Māori	Biology	biography
349	2003	2	1984	William Shakespeare	Bengali	Literature	mystery
350	1987	3	The Catcher in the Rye	Leo Tolstoy	Kashmiri	Literature	horror
351	1968	10	The Chronicles of Narnia	Charles Dickens	Arabic	Physics	self-help
352	1993	6	The Lord of the Rings	Ernest Hemingway	Catalan	Psychology	self-help
353	1999	9	The Lord of the Rings	Jane Austen	Sotho	History	adventure
354	2012	5	The Chronicles of Narnia	Mark Twain	Finnish	Literature	historical fiction
355	1989	8	Moby-Dick	Charles Dickens	Tajik	Computer Science	horror
356	2002	8	Moby-Dick	Mark Twain	Greek	History	horror
357	1993	4	Pride and Prejudice	Mark Twain	Kyrgyz	Computer Science	horror
358	1985	4	The Catcher in the Rye	Charles Dickens	Greek	Computer Science	fantasy
359	2002	1	To Kill a Mockingbird	J.K. Rowling	German	Biology	historical fiction
360	1993	8	The Great Gatsby	George Orwell	Kyrgyz	Mathematics	thriller
361	1969	7	1984	Charles Dickens	Irish Gaelic	Computer Science	self-help
362	1993	4	The Great Gatsby	Leo Tolstoy	Nepali	History	thriller
363	1992	3	The Great Gatsby	F. Scott Fitzgerald	Aymara	Literature	horror
364	1988	1	Moby-Dick	Charles Dickens	English	Psychology	fantasy
365	2012	2	The Hobbit	Charles Dickens	New Zealand Sign Language	Computer Science	thriller
366	1990	9	1984	George Orwell	Pashto	Literature	biography
367	2010	6	Moby-Dick	Leo Tolstoy	Belarusian	Biology	biography
368	2000	8	The Chronicles of Narnia	Mark Twain	Māori	Psychology	thriller
369	1991	2	The Lord of the Rings	Mark Twain	Kazakh	History	science fiction
370	1959	6	Moby-Dick	Mark Twain	Amharic	Sociology	fantasy
371	2005	3	The Chronicles of Narnia	Jane Austen	Polish	Chemistry	self-help
372	1993	3	1984	Charles Dickens	Quechua	Sociology	science fiction
373	1998	3	1984	Jane Austen	Czech	Sociology	science fiction
374	2008	2	1984	Mark Twain	Dari	Literature	romance
375	1992	7	1984	Harper Lee	Northern Sotho	History	horror
376	2011	6	1984	Ernest Hemingway	Luxembourgish	Biology	romance
377	2010	6	The Lord of the Rings	William Shakespeare	Azeri	Chemistry	science fiction
378	2009	2	The Great Gatsby	Charles Dickens	Swahili	History	historical fiction
379	1997	5	Moby-Dick	George Orwell	Czech	Literature	mystery
380	2010	7	The Great Gatsby	J.K. Rowling	Lithuanian	Chemistry	science fiction
381	2009	4	The Lord of the Rings	F. Scott Fitzgerald	Dutch	Biology	adventure
382	2000	4	To Kill a Mockingbird	Harper Lee	Macedonian	Psychology	adventure
383	2002	5	The Chronicles of Narnia	J.K. Rowling	Tok Pisin	History	science fiction
384	2001	5	To Kill a Mockingbird	Harper Lee	Estonian	Computer Science	biography
385	1995	4	1984	Ernest Hemingway	Chinese	Physics	historical fiction
386	1989	7	To Kill a Mockingbird	Harper Lee	Azeri	History	thriller
387	1994	4	Harry Potter and the Philosopher's Stone	William Shakespeare	Bosnian	Chemistry	self-help
388	1992	7	The Hobbit	William Shakespeare	Tsonga	Chemistry	fantasy
389	1992	8	The Great Gatsby	J.K. Rowling	Burmese	Psychology	science fiction
390	1998	3	Moby-Dick	Leo Tolstoy	Kyrgyz	Mathematics	science fiction
391	2006	8	Pride and Prejudice	Jane Austen	Māori	Mathematics	adventure
392	1993	1	1984	Charles Dickens	Romanian	Computer Science	horror
393	2012	3	The Chronicles of Narnia	Ernest Hemingway	Chinese	Psychology	adventure
394	2007	1	Moby-Dick	Leo Tolstoy	Zulu	Computer Science	biography
395	2000	9	The Catcher in the Rye	William Shakespeare	Polish	Chemistry	thriller
396	2004	7	To Kill a Mockingbird	William Shakespeare	Burmese	Psychology	science fiction
397	1999	10	To Kill a Mockingbird	Leo Tolstoy	Arabic	Physics	romance
398	1987	3	The Great Gatsby	Jane Austen	Belarusian	Chemistry	science fiction
399	2011	6	The Catcher in the Rye	George Orwell	Persian	Computer Science	self-help
400	1993	8	The Hobbit	Jane Austen	Swati	History	historical fiction
401	2010	8	The Lord of the Rings	J.K. Rowling	Persian	Biology	fantasy
402	1995	3	Pride and Prejudice	F. Scott Fitzgerald	Kannada	Literature	mystery
403	2002	6	Moby-Dick	Mark Twain	Lao	Mathematics	adventure
404	2009	2	The Hobbit	Mark Twain	Dutch	Psychology	horror
405	2010	2	To Kill a Mockingbird	William Shakespeare	Kashmiri	Physics	biography
406	2009	10	The Hobbit	Ernest Hemingway	Icelandic	History	thriller
407	2001	7	1984	Ernest Hemingway	Georgian	Biology	mystery
408	1995	1	The Catcher in the Rye	Mark Twain	Tajik	Psychology	romance
409	2003	4	The Lord of the Rings	William Shakespeare	Arabic	Chemistry	thriller
410	1999	1	Moby-Dick	Leo Tolstoy	Tamil	Computer Science	fantasy
411	2003	4	Harry Potter and the Philosopher's Stone	George Orwell	Estonian	Mathematics	historical fiction
412	2010	8	Pride and Prejudice	William Shakespeare	Oriya	Psychology	thriller
413	1966	3	The Lord of the Rings	Leo Tolstoy	Arabic	Literature	adventure
414	1985	8	Harry Potter and the Philosopher's Stone	J.K. Rowling	Gagauz	History	romance
415	1992	8	Moby-Dick	George Orwell	Tajik	Computer Science	mystery
416	1990	4	Harry Potter and the Philosopher's Stone	Mark Twain	Catalan	History	self-help
417	2006	1	Moby-Dick	J.K. Rowling	Dhivehi	Chemistry	historical fiction
418	2009	2	To Kill a Mockingbird	F. Scott Fitzgerald	Hindi	Biology	mystery
419	2001	4	Harry Potter and the Philosopher's Stone	J.K. Rowling	Malayalam	Computer Science	romance
420	2006	10	Pride and Prejudice	Leo Tolstoy	Polish	Psychology	historical fiction
421	2007	3	The Chronicles of Narnia	Jane Austen	Oriya	History	mystery
422	1997	4	The Chronicles of Narnia	Ernest Hemingway	Tok Pisin	Physics	historical fiction
423	2006	2	The Chronicles of Narnia	Charles Dickens	Swahili	Physics	adventure
424	2009	1	The Chronicles of Narnia	William Shakespeare	Bengali	Computer Science	thriller
425	2003	1	The Hobbit	Mark Twain	Amharic	Chemistry	romance
426	2012	7	The Hobbit	Leo Tolstoy	Romanian	Mathematics	adventure
427	2000	1	1984	J.K. Rowling	Aymara	Physics	romance
428	2009	6	Pride and Prejudice	William Shakespeare	Haitian Creole	Sociology	science fiction
429	2011	4	Moby-Dick	Jane Austen	Assamese	Mathematics	self-help
430	2006	2	1984	William Shakespeare	English	Sociology	historical fiction
431	2007	2	The Great Gatsby	William Shakespeare	French	Physics	horror
432	1994	8	To Kill a Mockingbird	Mark Twain	Romanian	History	mystery
433	2006	7	To Kill a Mockingbird	J.K. Rowling	Khmer	Biology	science fiction
434	2001	7	The Catcher in the Rye	Leo Tolstoy	Latvian	Physics	fantasy
435	2013	4	Pride and Prejudice	Mark Twain	Māori	Computer Science	historical fiction
436	1984	5	The Lord of the Rings	J.K. Rowling	Gujarati	Mathematics	romance
437	1992	8	The Catcher in the Rye	J.K. Rowling	West Frisian	Computer Science	mystery
438	1987	10	The Catcher in the Rye	George Orwell	Finnish	Chemistry	adventure
439	2012	3	The Lord of the Rings	Jane Austen	Norwegian	Computer Science	biography
440	2008	7	The Great Gatsby	Ernest Hemingway	Bulgarian	Sociology	historical fiction
441	2003	10	Moby-Dick	Harper Lee	Bislama	Mathematics	thriller
442	2003	2	1984	Leo Tolstoy	Punjabi	Computer Science	horror
443	1966	1	The Lord of the Rings	F. Scott Fitzgerald	Gagauz	Literature	mystery
444	1994	9	The Catcher in the Rye	William Shakespeare	Italian	Sociology	thriller
445	2007	9	1984	Leo Tolstoy	Croatian	Chemistry	historical fiction
446	1999	9	Harry Potter and the Philosopher's Stone	Mark Twain	Irish Gaelic	Biology	romance
447	2010	9	The Chronicles of Narnia	F. Scott Fitzgerald	Hindi	Physics	fantasy
448	2007	7	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Dari	Computer Science	romance
449	1996	5	The Lord of the Rings	Jane Austen	Kyrgyz	Physics	historical fiction
450	1998	3	Harry Potter and the Philosopher's Stone	William Shakespeare	Greek	Sociology	thriller
451	1993	6	The Chronicles of Narnia	George Orwell	Swati	Mathematics	mystery
452	2006	8	To Kill a Mockingbird	J.K. Rowling	Moldovan	Mathematics	historical fiction
453	2012	3	The Great Gatsby	Charles Dickens	Arabic	Mathematics	adventure
454	2010	7	The Catcher in the Rye	F. Scott Fitzgerald	Czech	Literature	fantasy
455	2006	10	The Lord of the Rings	Harper Lee	Punjabi	Physics	mystery
456	1985	3	To Kill a Mockingbird	Leo Tolstoy	Japanese	Chemistry	historical fiction
457	1999	5	1984	William Shakespeare	Gujarati	Physics	biography
458	2010	8	To Kill a Mockingbird	Leo Tolstoy	Latvian	Chemistry	fantasy
459	2009	5	Moby-Dick	F. Scott Fitzgerald	Dari	Chemistry	thriller
460	1988	5	The Hobbit	F. Scott Fitzgerald	Tswana	Chemistry	self-help
461	2002	7	The Chronicles of Narnia	Charles Dickens	Montenegrin	Literature	biography
462	1993	5	Pride and Prejudice	Mark Twain	Catalan	History	mystery
463	2006	8	The Lord of the Rings	George Orwell	Zulu	History	science fiction
464	2011	1	The Catcher in the Rye	F. Scott Fitzgerald	Kurdish	Psychology	self-help
465	2003	6	1984	Charles Dickens	Lao	Psychology	thriller
466	1999	4	1984	Ernest Hemingway	Korean	Psychology	adventure
467	1979	3	Moby-Dick	Charles Dickens	Khmer	Physics	fantasy
468	2008	5	The Hobbit	Harper Lee	Tok Pisin	Sociology	romance
469	1992	7	Moby-Dick	J.K. Rowling	Estonian	History	adventure
470	1996	4	The Great Gatsby	Mark Twain	Filipino	Literature	historical fiction
471	2003	5	The Hobbit	Jane Austen	Oriya	Computer Science	science fiction
472	2001	6	Pride and Prejudice	Charles Dickens	Hiri Motu	Mathematics	biography
473	2010	1	Moby-Dick	Mark Twain	Ndebele	Mathematics	historical fiction
474	2011	8	The Catcher in the Rye	William Shakespeare	Kurdish	Mathematics	adventure
475	2006	7	The Catcher in the Rye	Ernest Hemingway	Zulu	Physics	biography
476	1994	9	1984	Jane Austen	Tswana	History	mystery
477	1994	4	Harry Potter and the Philosopher's Stone	Charles Dickens	Albanian	Chemistry	adventure
478	2005	3	Moby-Dick	Mark Twain	Spanish	Sociology	biography
479	1994	7	The Hobbit	George Orwell	Dutch	Literature	adventure
480	1988	1	1984	George Orwell	Burmese	Chemistry	self-help
481	2001	6	The Chronicles of Narnia	Charles Dickens	Ndebele	Psychology	self-help
482	2012	3	The Lord of the Rings	J.K. Rowling	Oriya	History	fantasy
483	2012	1	The Catcher in the Rye	Jane Austen	Oriya	Chemistry	horror
484	1993	5	The Great Gatsby	Leo Tolstoy	Dutch	Literature	self-help
485	2006	10	Moby-Dick	William Shakespeare	Maltese	Chemistry	thriller
486	1988	1	To Kill a Mockingbird	Leo Tolstoy	Finnish	Mathematics	mystery
487	1992	5	Moby-Dick	J.K. Rowling	Kazakh	Sociology	self-help
488	1993	3	The Catcher in the Rye	Harper Lee	Bulgarian	Physics	fantasy
489	2003	3	The Hobbit	William Shakespeare	Moldovan	Mathematics	historical fiction
490	2008	8	Moby-Dick	William Shakespeare	Kashmiri	Physics	thriller
491	2001	8	1984	Charles Dickens	Japanese	Biology	adventure
492	2012	1	The Chronicles of Narnia	Charles Dickens	Aymara	Chemistry	romance
493	1997	8	To Kill a Mockingbird	Charles Dickens	Portuguese	Mathematics	historical fiction
494	2011	10	The Lord of the Rings	Charles Dickens	Lao	Physics	adventure
495	1988	7	To Kill a Mockingbird	Ernest Hemingway	Albanian	Physics	thriller
496	2006	4	The Chronicles of Narnia	Mark Twain	Hiri Motu	Chemistry	biography
497	2012	9	Moby-Dick	Jane Austen	Tajik	Literature	self-help
498	2011	4	Pride and Prejudice	Jane Austen	Italian	Psychology	adventure
499	2005	5	To Kill a Mockingbird	J.K. Rowling	Tetum	Mathematics	adventure
500	2005	1	The Lord of the Rings	Leo Tolstoy	Albanian	Psychology	science fiction
501	2009	5	The Chronicles of Narnia	Harper Lee	Arabic	Sociology	science fiction
502	1975	6	The Chronicles of Narnia	F. Scott Fitzgerald	Dhivehi	Psychology	adventure
503	2003	8	Pride and Prejudice	Charles Dickens	Tamil	Sociology	historical fiction
504	1996	7	Pride and Prejudice	Mark Twain	Oriya	Chemistry	adventure
505	1993	4	Harry Potter and the Philosopher's Stone	Harper Lee	Marathi	History	biography
506	2007	8	The Lord of the Rings	William Shakespeare	Amharic	Physics	mystery
507	2010	10	The Lord of the Rings	Leo Tolstoy	Guaraní	Mathematics	historical fiction
508	2008	6	The Great Gatsby	Ernest Hemingway	Bulgarian	History	science fiction
509	2007	8	The Catcher in the Rye	Harper Lee	Montenegrin	Computer Science	romance
510	2012	6	To Kill a Mockingbird	Mark Twain	Georgian	Literature	mystery
511	1990	8	The Chronicles of Narnia	F. Scott Fitzgerald	Papiamento	Chemistry	mystery
512	2001	4	1984	Mark Twain	Azeri	Physics	adventure
513	1992	6	Harry Potter and the Philosopher's Stone	Harper Lee	Bengali	Literature	thriller
514	2002	5	The Catcher in the Rye	Charles Dickens	Assamese	Computer Science	horror
515	1966	6	Pride and Prejudice	Charles Dickens	Belarusian	Computer Science	biography
516	1985	2	Moby-Dick	J.K. Rowling	Hiri Motu	Biology	science fiction
517	1992	6	1984	Mark Twain	Tswana	Biology	biography
518	2009	4	The Chronicles of Narnia	Harper Lee	Polish	Psychology	fantasy
519	2005	9	The Catcher in the Rye	Ernest Hemingway	New Zealand Sign Language	Sociology	thriller
520	2002	7	1984	Leo Tolstoy	Norwegian	Computer Science	romance
521	1998	8	The Catcher in the Rye	George Orwell	Khmer	Chemistry	science fiction
522	2012	5	To Kill a Mockingbird	Charles Dickens	Malagasy	Physics	romance
523	1996	2	Moby-Dick	Leo Tolstoy	Indonesian	Biology	self-help
524	2013	8	The Lord of the Rings	F. Scott Fitzgerald	Maltese	Sociology	thriller
525	1959	2	The Catcher in the Rye	William Shakespeare	Swedish	Biology	adventure
526	2012	7	Pride and Prejudice	William Shakespeare	Korean	Literature	science fiction
527	2011	4	To Kill a Mockingbird	Ernest Hemingway	Somali	History	thriller
528	1989	3	Moby-Dick	William Shakespeare	Montenegrin	Biology	science fiction
529	2006	9	Pride and Prejudice	F. Scott Fitzgerald	Gagauz	Sociology	adventure
530	2009	10	Moby-Dick	Charles Dickens	Quechua	Chemistry	romance
531	2008	10	Harry Potter and the Philosopher's Stone	William Shakespeare	Afrikaans	Physics	historical fiction
532	2005	1	The Catcher in the Rye	William Shakespeare	Khmer	Chemistry	horror
533	2003	9	1984	Charles Dickens	Ndebele	Literature	self-help
534	2012	7	1984	Charles Dickens	Maltese	Physics	self-help
535	2006	2	Moby-Dick	Mark Twain	Maltese	Biology	self-help
536	2006	10	The Great Gatsby	William Shakespeare	Bengali	History	mystery
537	1985	1	Harry Potter and the Philosopher's Stone	William Shakespeare	Afrikaans	History	romance
538	1996	3	Harry Potter and the Philosopher's Stone	William Shakespeare	Kannada	Literature	romance
539	1993	3	1984	William Shakespeare	Luxembourgish	History	science fiction
540	2010	4	1984	Charles Dickens	Amharic	Literature	horror
541	2006	7	The Lord of the Rings	Ernest Hemingway	Albanian	Sociology	science fiction
542	2000	7	The Lord of the Rings	George Orwell	Persian	Sociology	horror
543	2011	8	The Catcher in the Rye	Leo Tolstoy	Macedonian	History	horror
544	1997	7	The Lord of the Rings	Leo Tolstoy	West Frisian	Chemistry	biography
545	1994	7	Moby-Dick	George Orwell	English	Mathematics	romance
546	1997	7	Moby-Dick	George Orwell	Mongolian	History	mystery
547	2002	10	To Kill a Mockingbird	Leo Tolstoy	Belarusian	Biology	self-help
548	1983	5	Harry Potter and the Philosopher's Stone	Charles Dickens	English	Computer Science	thriller
549	1990	10	Pride and Prejudice	Harper Lee	German	Computer Science	self-help
550	1992	7	The Great Gatsby	William Shakespeare	Montenegrin	Physics	fantasy
551	1989	9	The Lord of the Rings	George Orwell	Swedish	Biology	romance
552	1992	5	The Lord of the Rings	Charles Dickens	New Zealand Sign Language	Mathematics	self-help
553	2010	7	The Lord of the Rings	Ernest Hemingway	Japanese	Sociology	self-help
554	1998	1	The Great Gatsby	William Shakespeare	Maltese	Mathematics	science fiction
555	2011	6	Pride and Prejudice	William Shakespeare	Belarusian	Psychology	horror
556	2003	4	The Hobbit	George Orwell	Haitian Creole	Literature	mystery
557	2003	1	The Hobbit	Jane Austen	Dutch	Chemistry	self-help
558	2003	4	The Great Gatsby	Harper Lee	Azeri	Computer Science	self-help
559	2008	10	The Lord of the Rings	J.K. Rowling	Lithuanian	Chemistry	horror
560	2004	2	The Catcher in the Rye	Charles Dickens	Tswana	Literature	horror
561	1998	6	The Catcher in the Rye	William Shakespeare	New Zealand Sign Language	Computer Science	fantasy
562	2012	4	Moby-Dick	Leo Tolstoy	Icelandic	Sociology	mystery
563	1991	8	The Great Gatsby	Charles Dickens	Tok Pisin	Psychology	mystery
564	2009	3	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Tajik	Psychology	mystery
565	2000	10	To Kill a Mockingbird	Leo Tolstoy	Latvian	History	science fiction
566	2005	7	The Lord of the Rings	Jane Austen	Pashto	Sociology	historical fiction
567	2010	3	The Catcher in the Rye	Charles Dickens	Swati	Sociology	thriller
568	2009	4	Harry Potter and the Philosopher's Stone	George Orwell	Korean	Mathematics	adventure
569	2010	7	The Great Gatsby	F. Scott Fitzgerald	Romanian	Chemistry	self-help
570	2002	4	The Catcher in the Rye	Ernest Hemingway	Zulu	Mathematics	horror
571	1996	3	The Chronicles of Narnia	Leo Tolstoy	Armenian	Mathematics	fantasy
572	1997	3	Moby-Dick	Charles Dickens	Mongolian	Literature	self-help
573	1994	7	Pride and Prejudice	Harper Lee	Icelandic	Mathematics	thriller
574	2005	8	1984	Harper Lee	Filipino	Literature	thriller
575	1990	6	Moby-Dick	George Orwell	Danish	Computer Science	adventure
576	2005	7	The Hobbit	Harper Lee	Belarusian	Mathematics	thriller
577	1994	7	The Catcher in the Rye	William Shakespeare	Kannada	Sociology	horror
578	2010	4	The Chronicles of Narnia	Charles Dickens	Tswana	Literature	historical fiction
579	2009	4	The Great Gatsby	William Shakespeare	Dhivehi	Sociology	biography
580	1998	8	The Hobbit	Jane Austen	Luxembourgish	Computer Science	romance
581	2000	4	The Great Gatsby	Jane Austen	Lithuanian	Physics	romance
582	2010	8	1984	Charles Dickens	Latvian	Sociology	horror
583	1996	5	1984	William Shakespeare	Malay	Sociology	mystery
584	1988	2	The Lord of the Rings	Harper Lee	Yiddish	Sociology	science fiction
585	2011	5	The Lord of the Rings	George Orwell	Finnish	History	fantasy
586	1999	8	The Lord of the Rings	Harper Lee	Afrikaans	Literature	mystery
587	1992	5	1984	Leo Tolstoy	Tsonga	History	thriller
588	2006	6	Harry Potter and the Philosopher's Stone	William Shakespeare	Khmer	Sociology	science fiction
589	1993	10	The Great Gatsby	Mark Twain	Ndebele	Chemistry	biography
590	1995	8	1984	William Shakespeare	Arabic	Physics	mystery
591	2007	4	The Chronicles of Narnia	William Shakespeare	Afrikaans	Biology	horror
592	1994	9	The Great Gatsby	Mark Twain	Tamil	Computer Science	self-help
593	2002	7	To Kill a Mockingbird	Harper Lee	Swahili	Chemistry	horror
594	2001	5	The Chronicles of Narnia	Harper Lee	Kyrgyz	Computer Science	romance
595	1986	8	The Great Gatsby	Harper Lee	Georgian	Literature	thriller
596	2002	3	Moby-Dick	F. Scott Fitzgerald	Japanese	Mathematics	science fiction
597	2007	2	The Catcher in the Rye	F. Scott Fitzgerald	Malayalam	Psychology	fantasy
598	2010	4	Harry Potter and the Philosopher's Stone	Mark Twain	Gujarati	Mathematics	fantasy
599	2009	7	The Lord of the Rings	J.K. Rowling	Tsonga	Computer Science	biography
600	2001	9	To Kill a Mockingbird	J.K. Rowling	Danish	Biology	horror
601	2001	4	Moby-Dick	J.K. Rowling	Oriya	Physics	fantasy
602	2000	7	The Great Gatsby	Harper Lee	Malayalam	History	romance
603	2006	5	To Kill a Mockingbird	Ernest Hemingway	Finnish	Psychology	historical fiction
604	1997	4	The Lord of the Rings	J.K. Rowling	Ndebele	History	adventure
605	2010	4	The Catcher in the Rye	J.K. Rowling	Kyrgyz	Computer Science	self-help
606	1992	6	The Hobbit	William Shakespeare	Quechua	Chemistry	horror
607	1997	2	Pride and Prejudice	F. Scott Fitzgerald	Oriya	Computer Science	self-help
608	1998	10	Moby-Dick	Leo Tolstoy	Sotho	Sociology	fantasy
609	2011	2	The Lord of the Rings	William Shakespeare	Tok Pisin	Chemistry	biography
610	2009	5	The Hobbit	Mark Twain	Swahili	Computer Science	romance
611	2011	3	To Kill a Mockingbird	J.K. Rowling	Tamil	Computer Science	thriller
612	1999	6	The Catcher in the Rye	Mark Twain	Danish	Physics	thriller
613	1993	4	The Catcher in the Rye	F. Scott Fitzgerald	Khmer	Mathematics	adventure
614	2002	6	The Chronicles of Narnia	Harper Lee	Swedish	Chemistry	fantasy
615	1993	2	The Catcher in the Rye	Ernest Hemingway	West Frisian	Psychology	self-help
616	1995	5	The Catcher in the Rye	Ernest Hemingway	French	Biology	adventure
617	1991	10	Harry Potter and the Philosopher's Stone	Jane Austen	Assamese	Mathematics	self-help
618	1987	3	Harry Potter and the Philosopher's Stone	Jane Austen	Swati	Literature	historical fiction
619	1998	1	The Great Gatsby	Harper Lee	Malagasy	Biology	fantasy
620	1991	2	To Kill a Mockingbird	Jane Austen	Latvian	Chemistry	biography
621	1999	10	Pride and Prejudice	Harper Lee	Irish Gaelic	History	science fiction
622	2004	1	To Kill a Mockingbird	Leo Tolstoy	French	Chemistry	historical fiction
623	2001	1	To Kill a Mockingbird	Jane Austen	Punjabi	History	adventure
624	2008	7	The Catcher in the Rye	Jane Austen	Papiamento	Literature	science fiction
625	1995	9	Moby-Dick	F. Scott Fitzgerald	Kurdish	Computer Science	self-help
626	2010	6	Pride and Prejudice	Jane Austen	Kurdish	Computer Science	mystery
627	2012	9	Pride and Prejudice	F. Scott Fitzgerald	Kyrgyz	Literature	science fiction
628	1988	5	The Chronicles of Narnia	J.K. Rowling	Marathi	Psychology	mystery
629	2003	7	The Chronicles of Narnia	William Shakespeare	Thai	Chemistry	romance
630	2009	1	Moby-Dick	J.K. Rowling	Persian	Biology	fantasy
631	2000	5	To Kill a Mockingbird	F. Scott Fitzgerald	Tok Pisin	Mathematics	fantasy
632	1996	2	Harry Potter and the Philosopher's Stone	Jane Austen	Albanian	Physics	historical fiction
633	2003	2	To Kill a Mockingbird	Ernest Hemingway	Catalan	Physics	mystery
635	1985	5	Pride and Prejudice	Leo Tolstoy	Burmese	Literature	science fiction
636	2005	7	The Catcher in the Rye	J.K. Rowling	Gagauz	Chemistry	adventure
637	2008	4	The Catcher in the Rye	Harper Lee	Quechua	Sociology	historical fiction
638	1981	9	The Great Gatsby	Charles Dickens	Polish	Mathematics	self-help
639	1986	10	1984	Jane Austen	Haitian Creole	Physics	horror
640	2004	6	Moby-Dick	J.K. Rowling	Filipino	Chemistry	adventure
641	2005	10	The Chronicles of Narnia	William Shakespeare	Estonian	Mathematics	historical fiction
642	1996	8	The Great Gatsby	F. Scott Fitzgerald	Aymara	Psychology	historical fiction
643	2012	3	The Hobbit	F. Scott Fitzgerald	Oriya	Biology	historical fiction
644	2005	8	The Great Gatsby	J.K. Rowling	Spanish	Computer Science	fantasy
645	2011	2	The Lord of the Rings	Harper Lee	Tetum	Biology	thriller
646	1994	9	1984	J.K. Rowling	Finnish	Sociology	mystery
647	2008	4	The Great Gatsby	Jane Austen	Belarusian	Sociology	biography
648	2004	4	Harry Potter and the Philosopher's Stone	George Orwell	Sotho	Mathematics	science fiction
649	1999	10	Pride and Prejudice	Harper Lee	New Zealand Sign Language	Computer Science	horror
650	2012	5	The Lord of the Rings	George Orwell	Tetum	History	adventure
651	2006	10	1984	George Orwell	Belarusian	Physics	biography
652	2008	5	The Chronicles of Narnia	Ernest Hemingway	Lithuanian	Computer Science	historical fiction
653	2001	1	The Great Gatsby	Mark Twain	Papiamento	Mathematics	thriller
654	2002	5	The Catcher in the Rye	Mark Twain	Montenegrin	Chemistry	biography
655	2004	9	Moby-Dick	J.K. Rowling	West Frisian	Psychology	adventure
656	2011	4	To Kill a Mockingbird	Leo Tolstoy	Malagasy	Psychology	fantasy
657	2008	9	To Kill a Mockingbird	Jane Austen	Gagauz	History	adventure
658	1999	9	The Lord of the Rings	William Shakespeare	Finnish	Chemistry	adventure
659	2007	1	The Lord of the Rings	Jane Austen	Yiddish	Psychology	biography
660	1992	6	The Catcher in the Rye	Mark Twain	West Frisian	Chemistry	historical fiction
661	2003	4	The Great Gatsby	George Orwell	Albanian	Physics	fantasy
662	2003	5	The Hobbit	William Shakespeare	Swedish	Sociology	adventure
663	1996	9	Pride and Prejudice	Jane Austen	German	History	romance
664	1994	5	The Catcher in the Rye	George Orwell	Burmese	History	thriller
665	2005	3	The Catcher in the Rye	F. Scott Fitzgerald	Tamil	Sociology	self-help
666	1995	8	To Kill a Mockingbird	William Shakespeare	Gagauz	Chemistry	thriller
667	1992	1	Harry Potter and the Philosopher's Stone	Jane Austen	Finnish	Physics	horror
668	2013	4	The Lord of the Rings	F. Scott Fitzgerald	Swedish	Mathematics	science fiction
669	1994	6	The Lord of the Rings	J.K. Rowling	Malayalam	Literature	fantasy
670	2000	7	The Chronicles of Narnia	William Shakespeare	Pashto	Mathematics	adventure
671	2001	1	Moby-Dick	Harper Lee	Tok Pisin	Biology	historical fiction
672	1997	10	To Kill a Mockingbird	Harper Lee	Korean	Chemistry	science fiction
673	1998	8	The Catcher in the Rye	William Shakespeare	Luxembourgish	Mathematics	self-help
674	2013	10	The Chronicles of Narnia	J.K. Rowling	Tsonga	Sociology	self-help
675	1996	9	The Great Gatsby	Mark Twain	Montenegrin	Literature	horror
676	2010	4	Pride and Prejudice	Harper Lee	Tok Pisin	Physics	science fiction
677	2001	6	The Hobbit	William Shakespeare	Georgian	Literature	self-help
678	1992	2	To Kill a Mockingbird	George Orwell	Somali	History	adventure
679	1988	6	Pride and Prejudice	Ernest Hemingway	Hungarian	Mathematics	mystery
680	2006	8	The Great Gatsby	Harper Lee	Malayalam	Mathematics	historical fiction
681	1998	8	Moby-Dick	J.K. Rowling	Northern Sotho	Psychology	historical fiction
682	2010	6	Moby-Dick	Mark Twain	Amharic	Literature	thriller
683	1999	8	The Great Gatsby	F. Scott Fitzgerald	Bulgarian	History	self-help
684	2011	7	1984	Mark Twain	Kyrgyz	Sociology	adventure
685	2004	8	Moby-Dick	J.K. Rowling	English	Physics	horror
686	1963	7	Pride and Prejudice	William Shakespeare	Norwegian	Computer Science	mystery
687	2005	1	The Lord of the Rings	Ernest Hemingway	Northern Sotho	Biology	adventure
688	2003	4	The Great Gatsby	F. Scott Fitzgerald	Tetum	Sociology	mystery
689	2002	9	To Kill a Mockingbird	Mark Twain	Bosnian	Sociology	biography
690	1966	7	The Great Gatsby	J.K. Rowling	Dutch	Mathematics	self-help
691	1992	5	The Great Gatsby	Leo Tolstoy	Telugu	Biology	self-help
692	1993	3	To Kill a Mockingbird	F. Scott Fitzgerald	Pashto	Psychology	thriller
693	1990	10	To Kill a Mockingbird	Ernest Hemingway	Catalan	Physics	science fiction
694	2000	7	To Kill a Mockingbird	George Orwell	Punjabi	Literature	horror
695	2009	7	Pride and Prejudice	Jane Austen	Polish	Computer Science	adventure
696	2012	2	1984	Harper Lee	Zulu	History	horror
697	1997	3	1984	Mark Twain	Quechua	Sociology	mystery
698	2011	1	The Catcher in the Rye	Charles Dickens	Swahili	Chemistry	romance
699	1998	7	1984	Harper Lee	Polish	Physics	romance
700	1990	7	Pride and Prejudice	William Shakespeare	Quechua	Psychology	historical fiction
701	2002	4	The Great Gatsby	Harper Lee	Kurdish	Mathematics	historical fiction
702	2005	2	To Kill a Mockingbird	Leo Tolstoy	Tswana	Physics	adventure
703	2012	1	Harry Potter and the Philosopher's Stone	William Shakespeare	Bosnian	Physics	fantasy
704	1998	1	The Chronicles of Narnia	J.K. Rowling	Malagasy	Physics	romance
776	1980	9	1984	Charles Dickens	Hindi	Literature	mystery
705	2009	3	The Lord of the Rings	Mark Twain	Hungarian	Psychology	historical fiction
706	2008	8	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Hebrew	Mathematics	horror
707	2009	6	1984	F. Scott Fitzgerald	Kazakh	Literature	mystery
708	2001	10	The Catcher in the Rye	J.K. Rowling	Swedish	Computer Science	adventure
709	2002	6	The Lord of the Rings	Ernest Hemingway	Mongolian	Literature	mystery
710	1993	1	Moby-Dick	Leo Tolstoy	Bislama	Physics	self-help
711	2003	8	1984	Charles Dickens	Mongolian	Physics	mystery
712	1993	3	The Catcher in the Rye	F. Scott Fitzgerald	Tok Pisin	Biology	science fiction
713	2011	4	The Great Gatsby	Harper Lee	Yiddish	Physics	adventure
714	1990	1	The Hobbit	Charles Dickens	German	Biology	mystery
715	1999	3	1984	Ernest Hemingway	Northern Sotho	Biology	biography
716	2006	10	1984	Ernest Hemingway	Nepali	Biology	self-help
717	1985	4	The Lord of the Rings	J.K. Rowling	Macedonian	Mathematics	romance
718	2002	1	The Hobbit	J.K. Rowling	Malayalam	Physics	biography
719	1994	5	Pride and Prejudice	Mark Twain	Marathi	Literature	science fiction
720	1966	1	Harry Potter and the Philosopher's Stone	William Shakespeare	Sotho	History	mystery
721	1998	9	The Chronicles of Narnia	George Orwell	Burmese	Literature	biography
722	1994	10	The Chronicles of Narnia	George Orwell	Dhivehi	Psychology	romance
723	2003	9	1984	Charles Dickens	Burmese	Literature	mystery
724	1997	4	The Great Gatsby	George Orwell	Bislama	Sociology	thriller
725	1986	10	The Chronicles of Narnia	Charles Dickens	Luxembourgish	Literature	mystery
726	1991	9	Pride and Prejudice	F. Scott Fitzgerald	Georgian	Literature	self-help
727	1997	7	Moby-Dick	J.K. Rowling	Latvian	History	science fiction
728	2008	1	Pride and Prejudice	F. Scott Fitzgerald	Swedish	Biology	thriller
729	1992	5	The Lord of the Rings	Harper Lee	Kurdish	Mathematics	mystery
730	2007	8	The Hobbit	George Orwell	Tajik	Literature	biography
731	1995	6	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Swahili	Sociology	fantasy
732	1995	4	The Lord of the Rings	Harper Lee	Quechua	Sociology	self-help
733	2012	7	1984	George Orwell	English	Mathematics	mystery
734	1994	7	Moby-Dick	J.K. Rowling	Tajik	Chemistry	historical fiction
735	1990	9	Moby-Dick	Ernest Hemingway	Punjabi	History	mystery
736	1997	3	The Great Gatsby	George Orwell	Pashto	Biology	biography
737	2009	1	The Lord of the Rings	Jane Austen	Punjabi	Literature	self-help
738	2008	7	Harry Potter and the Philosopher's Stone	Jane Austen	Catalan	Mathematics	fantasy
739	1997	7	The Chronicles of Narnia	Ernest Hemingway	Tetum	Chemistry	romance
740	2012	10	The Chronicles of Narnia	Mark Twain	Punjabi	Biology	romance
741	1994	10	The Chronicles of Narnia	Jane Austen	French	Chemistry	biography
742	1986	9	The Chronicles of Narnia	Mark Twain	Oriya	History	thriller
743	1987	5	1984	William Shakespeare	Montenegrin	Computer Science	horror
744	2008	5	Moby-Dick	J.K. Rowling	Kashmiri	Biology	adventure
745	1986	1	Moby-Dick	George Orwell	Malay	Physics	science fiction
746	1987	5	The Catcher in the Rye	J.K. Rowling	Somali	Psychology	adventure
747	2011	3	The Catcher in the Rye	Mark Twain	Maltese	Chemistry	adventure
748	2006	8	The Catcher in the Rye	Harper Lee	German	Literature	romance
749	2009	2	The Chronicles of Narnia	George Orwell	Belarusian	Psychology	romance
750	1997	7	The Catcher in the Rye	Harper Lee	Kannada	Biology	biography
751	2001	8	Pride and Prejudice	Jane Austen	Irish Gaelic	Physics	mystery
752	2002	6	The Catcher in the Rye	Jane Austen	Filipino	Biology	thriller
753	2008	8	Harry Potter and the Philosopher's Stone	Mark Twain	Tetum	History	biography
754	2008	2	To Kill a Mockingbird	William Shakespeare	Malagasy	Literature	thriller
755	1987	7	The Chronicles of Narnia	Charles Dickens	Kashmiri	History	mystery
756	2001	8	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Bengali	Physics	science fiction
757	1991	7	The Catcher in the Rye	J.K. Rowling	Sotho	Physics	science fiction
758	2003	10	The Chronicles of Narnia	Charles Dickens	Punjabi	Biology	thriller
759	1987	10	The Hobbit	Mark Twain	Hungarian	Physics	biography
760	1992	8	Pride and Prejudice	J.K. Rowling	Punjabi	Chemistry	mystery
761	1996	10	To Kill a Mockingbird	Jane Austen	Dzongkha	Psychology	biography
762	2008	7	The Hobbit	Jane Austen	West Frisian	Psychology	biography
763	1999	2	The Chronicles of Narnia	Charles Dickens	Dzongkha	History	romance
764	2009	7	1984	Jane Austen	Swati	Physics	self-help
765	2010	4	The Hobbit	J.K. Rowling	Finnish	Literature	mystery
766	1999	3	The Hobbit	Jane Austen	Tajik	Biology	historical fiction
767	2011	6	Moby-Dick	J.K. Rowling	Haitian Creole	Psychology	fantasy
768	1995	10	Pride and Prejudice	George Orwell	Dzongkha	Mathematics	biography
769	1988	9	The Catcher in the Rye	William Shakespeare	Lithuanian	Biology	biography
770	2008	1	To Kill a Mockingbird	Leo Tolstoy	Assamese	Literature	mystery
771	2001	7	The Hobbit	J.K. Rowling	West Frisian	Biology	historical fiction
772	2012	6	The Hobbit	Leo Tolstoy	New Zealand Sign Language	Biology	science fiction
773	2006	10	Moby-Dick	William Shakespeare	Marathi	Psychology	thriller
774	1996	5	Harry Potter and the Philosopher's Stone	Harper Lee	Icelandic	Biology	romance
775	2007	4	To Kill a Mockingbird	Mark Twain	Macedonian	Physics	science fiction
777	2010	5	1984	Ernest Hemingway	Gagauz	Biology	self-help
778	2005	8	The Lord of the Rings	F. Scott Fitzgerald	Persian	Psychology	fantasy
779	2010	7	The Great Gatsby	George Orwell	Norwegian	Biology	mystery
780	2010	9	The Catcher in the Rye	Harper Lee	Hindi	Biology	self-help
781	2006	2	The Lord of the Rings	Harper Lee	Belarusian	History	romance
782	1993	4	Pride and Prejudice	Ernest Hemingway	Haitian Creole	Sociology	mystery
783	2000	3	The Great Gatsby	Harper Lee	Irish Gaelic	Mathematics	thriller
784	1994	6	The Catcher in the Rye	Harper Lee	Northern Sotho	Sociology	mystery
785	1978	3	The Great Gatsby	George Orwell	Spanish	Biology	mystery
786	1997	8	Pride and Prejudice	Jane Austen	Polish	History	biography
787	2011	9	The Chronicles of Narnia	Harper Lee	Dzongkha	Mathematics	science fiction
788	2013	8	The Lord of the Rings	George Orwell	Gagauz	Literature	adventure
789	1993	7	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Dari	Literature	thriller
790	2002	2	The Lord of the Rings	George Orwell	Indonesian	Chemistry	thriller
791	2005	9	Moby-Dick	George Orwell	Pashto	Mathematics	romance
792	2001	6	Pride and Prejudice	William Shakespeare	Croatian	Chemistry	historical fiction
793	1997	7	The Lord of the Rings	George Orwell	Irish Gaelic	Mathematics	biography
794	2006	1	The Chronicles of Narnia	J.K. Rowling	Hungarian	Chemistry	fantasy
795	2009	3	To Kill a Mockingbird	Ernest Hemingway	Swati	Computer Science	fantasy
796	2009	8	Pride and Prejudice	Mark Twain	Oriya	Mathematics	biography
797	1997	3	Pride and Prejudice	Charles Dickens	Polish	Sociology	fantasy
798	1997	10	Moby-Dick	J.K. Rowling	Burmese	Physics	science fiction
799	2013	4	1984	F. Scott Fitzgerald	English	History	romance
800	2006	8	Pride and Prejudice	William Shakespeare	Tsonga	Chemistry	mystery
801	2000	2	The Lord of the Rings	George Orwell	Norwegian	Literature	mystery
802	2011	3	The Chronicles of Narnia	Leo Tolstoy	Assamese	Literature	thriller
803	2011	10	The Lord of the Rings	George Orwell	Bislama	Literature	mystery
804	1995	4	The Hobbit	Harper Lee	Romanian	Mathematics	romance
805	1994	1	Moby-Dick	George Orwell	Arabic	Mathematics	fantasy
806	2012	3	Harry Potter and the Philosopher's Stone	Jane Austen	Bengali	Psychology	science fiction
807	2010	3	To Kill a Mockingbird	Ernest Hemingway	Marathi	Literature	fantasy
808	2006	6	1984	J.K. Rowling	New Zealand Sign Language	Computer Science	science fiction
809	2003	4	1984	Mark Twain	Nepali	Chemistry	romance
810	2000	2	Pride and Prejudice	Leo Tolstoy	Yiddish	History	horror
811	2008	9	The Lord of the Rings	Mark Twain	Latvian	History	mystery
812	2009	1	Harry Potter and the Philosopher's Stone	J.K. Rowling	Dutch	Computer Science	adventure
813	1995	7	The Hobbit	Leo Tolstoy	Polish	Literature	horror
814	1994	3	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Luxembourgish	Biology	fantasy
815	1992	1	The Lord of the Rings	Leo Tolstoy	Maltese	Sociology	romance
816	2011	6	To Kill a Mockingbird	William Shakespeare	Bengali	Physics	romance
817	1960	9	Moby-Dick	Ernest Hemingway	Dhivehi	Psychology	historical fiction
818	2009	1	The Catcher in the Rye	William Shakespeare	Assamese	Sociology	biography
819	1997	8	The Hobbit	Mark Twain	Polish	Chemistry	biography
820	1986	5	Pride and Prejudice	George Orwell	English	Chemistry	self-help
821	2002	4	1984	Harper Lee	Sotho	History	thriller
822	2010	10	The Chronicles of Narnia	George Orwell	Irish Gaelic	Literature	historical fiction
823	2008	4	Harry Potter and the Philosopher's Stone	F. Scott Fitzgerald	Fijian	Chemistry	thriller
824	2008	7	Harry Potter and the Philosopher's Stone	William Shakespeare	Tsonga	Mathematics	adventure
825	2003	8	The Chronicles of Narnia	Charles Dickens	New Zealand Sign Language	Sociology	fantasy
826	2006	8	Moby-Dick	Ernest Hemingway	Georgian	Computer Science	biography
827	1966	6	Pride and Prejudice	Harper Lee	Estonian	Mathematics	self-help
828	2003	4	The Catcher in the Rye	Ernest Hemingway	Estonian	Chemistry	fantasy
829	2012	9	1984	J.K. Rowling	Portuguese	Physics	science fiction
830	1993	3	The Lord of the Rings	J.K. Rowling	Zulu	Biology	self-help
831	2010	3	Harry Potter and the Philosopher's Stone	George Orwell	Azeri	Sociology	mystery
832	2001	8	Moby-Dick	J.K. Rowling	Papiamento	Psychology	romance
833	2012	4	The Lord of the Rings	Harper Lee	Norwegian	Physics	biography
834	2012	3	The Catcher in the Rye	J.K. Rowling	Bosnian	Mathematics	adventure
835	2006	10	The Lord of the Rings	F. Scott Fitzgerald	Hungarian	Biology	self-help
836	2011	2	1984	William Shakespeare	Bosnian	Chemistry	historical fiction
837	1992	1	Harry Potter and the Philosopher's Stone	Mark Twain	Kazakh	Sociology	historical fiction
838	1996	3	Pride and Prejudice	Charles Dickens	Czech	History	biography
839	2000	8	1984	Ernest Hemingway	Filipino	History	thriller
840	2006	10	The Chronicles of Narnia	Ernest Hemingway	Pashto	Literature	biography
841	2012	5	The Hobbit	J.K. Rowling	Albanian	Computer Science	self-help
842	2000	7	The Great Gatsby	Charles Dickens	Kyrgyz	Sociology	fantasy
843	1994	8	The Chronicles of Narnia	Ernest Hemingway	Kyrgyz	Literature	fantasy
844	2005	9	The Hobbit	Mark Twain	Oriya	Computer Science	science fiction
845	2011	4	The Chronicles of Narnia	Mark Twain	Kannada	Computer Science	science fiction
846	2005	4	The Hobbit	Leo Tolstoy	Dzongkha	Literature	historical fiction
847	1995	8	The Hobbit	George Orwell	Swati	Chemistry	adventure
848	1986	3	To Kill a Mockingbird	Harper Lee	Danish	Mathematics	fantasy
849	2009	7	The Lord of the Rings	George Orwell	Amharic	Mathematics	biography
850	1992	9	Harry Potter and the Philosopher's Stone	Charles Dickens	Spanish	Literature	horror
851	2007	5	The Catcher in the Rye	Mark Twain	Japanese	Physics	romance
852	1996	1	1984	William Shakespeare	Irish Gaelic	Computer Science	thriller
853	2000	2	The Great Gatsby	Jane Austen	Danish	Physics	science fiction
854	1996	10	The Chronicles of Narnia	George Orwell	Yiddish	Literature	adventure
855	2006	1	To Kill a Mockingbird	F. Scott Fitzgerald	Zulu	Literature	mystery
856	2012	2	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Kashmiri	Sociology	romance
857	1991	2	The Great Gatsby	Jane Austen	French	Biology	fantasy
858	2005	9	The Chronicles of Narnia	George Orwell	Luxembourgish	Sociology	mystery
859	2008	4	To Kill a Mockingbird	Charles Dickens	Spanish	Psychology	science fiction
860	1999	4	1984	Ernest Hemingway	Guaraní	Psychology	romance
861	2003	8	Moby-Dick	William Shakespeare	Icelandic	Computer Science	horror
862	1993	7	The Chronicles of Narnia	Leo Tolstoy	Macedonian	Mathematics	biography
863	2005	10	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Swati	Mathematics	biography
864	2008	7	Pride and Prejudice	J.K. Rowling	Croatian	Biology	thriller
865	2010	6	The Catcher in the Rye	Ernest Hemingway	Swati	Psychology	fantasy
866	1999	5	Pride and Prejudice	Charles Dickens	Lithuanian	Biology	horror
867	2003	6	The Chronicles of Narnia	Charles Dickens	Albanian	Chemistry	horror
868	1986	4	The Lord of the Rings	Harper Lee	Luxembourgish	Sociology	romance
869	2005	2	To Kill a Mockingbird	Leo Tolstoy	Bengali	Mathematics	thriller
870	2011	10	Moby-Dick	Leo Tolstoy	Assamese	Literature	self-help
871	1985	5	The Chronicles of Narnia	Harper Lee	English	Literature	biography
872	1995	4	The Catcher in the Rye	William Shakespeare	Sotho	Computer Science	self-help
873	1986	6	1984	J.K. Rowling	Kazakh	Physics	fantasy
874	2003	10	Pride and Prejudice	Harper Lee	Portuguese	Mathematics	romance
875	2011	10	The Lord of the Rings	Leo Tolstoy	Oriya	Physics	horror
876	2012	10	Moby-Dick	Jane Austen	Khmer	Physics	romance
877	1998	10	Harry Potter and the Philosopher's Stone	Leo Tolstoy	English	Physics	historical fiction
878	2004	2	The Great Gatsby	George Orwell	Hungarian	Sociology	fantasy
879	1995	10	Pride and Prejudice	F. Scott Fitzgerald	Hebrew	Chemistry	adventure
880	1995	4	Pride and Prejudice	Mark Twain	Haitian Creole	Chemistry	science fiction
881	2010	6	Moby-Dick	Jane Austen	Kurdish	Mathematics	romance
882	2001	5	Pride and Prejudice	Charles Dickens	Tamil	Sociology	self-help
883	2005	6	To Kill a Mockingbird	Mark Twain	Croatian	Sociology	biography
884	2007	1	The Great Gatsby	George Orwell	Malayalam	Physics	biography
885	1989	4	Harry Potter and the Philosopher's Stone	Harper Lee	Kyrgyz	Psychology	historical fiction
886	2006	2	The Lord of the Rings	William Shakespeare	Haitian Creole	Mathematics	self-help
887	2006	9	The Great Gatsby	Ernest Hemingway	Macedonian	Computer Science	science fiction
888	2010	2	The Hobbit	Ernest Hemingway	Pashto	History	historical fiction
889	1992	8	To Kill a Mockingbird	George Orwell	Bulgarian	Mathematics	historical fiction
890	1987	3	The Chronicles of Narnia	J.K. Rowling	Tamil	Mathematics	fantasy
891	1992	2	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Armenian	Physics	thriller
892	2009	4	The Lord of the Rings	J.K. Rowling	Afrikaans	History	science fiction
893	1985	8	The Chronicles of Narnia	Jane Austen	Catalan	Computer Science	historical fiction
894	1994	6	Pride and Prejudice	F. Scott Fitzgerald	Zulu	Literature	self-help
895	1995	4	The Lord of the Rings	J.K. Rowling	Arabic	Biology	adventure
896	1992	3	The Hobbit	William Shakespeare	Portuguese	Psychology	adventure
897	1999	9	The Chronicles of Narnia	Leo Tolstoy	West Frisian	Psychology	horror
898	1977	2	The Catcher in the Rye	Ernest Hemingway	Portuguese	Chemistry	biography
899	1992	6	The Hobbit	Harper Lee	Albanian	Psychology	self-help
900	2007	5	Moby-Dick	Charles Dickens	Hiri Motu	Chemistry	adventure
901	1992	1	Harry Potter and the Philosopher's Stone	George Orwell	Sotho	History	romance
902	1992	6	To Kill a Mockingbird	Jane Austen	Kannada	Literature	biography
903	2009	7	The Catcher in the Rye	Jane Austen	Moldovan	Psychology	thriller
904	2002	5	The Great Gatsby	William Shakespeare	Czech	Biology	romance
905	2003	7	The Great Gatsby	Ernest Hemingway	Zulu	History	adventure
906	2010	9	The Great Gatsby	William Shakespeare	Kannada	Psychology	fantasy
907	2007	8	To Kill a Mockingbird	William Shakespeare	Tetum	Psychology	thriller
908	2002	1	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Haitian Creole	Sociology	mystery
909	2000	2	Moby-Dick	Charles Dickens	Armenian	Biology	adventure
910	1994	9	Pride and Prejudice	William Shakespeare	Afrikaans	Literature	horror
911	1999	6	Moby-Dick	Mark Twain	Bosnian	Psychology	horror
912	1988	5	1984	George Orwell	Marathi	Biology	fantasy
913	2010	7	The Lord of the Rings	Mark Twain	Dzongkha	Sociology	historical fiction
914	2006	1	To Kill a Mockingbird	J.K. Rowling	Spanish	Physics	historical fiction
915	2012	1	The Hobbit	Charles Dickens	Kashmiri	History	horror
916	2007	2	Pride and Prejudice	Jane Austen	Ndebele	Computer Science	historical fiction
917	1997	3	The Catcher in the Rye	F. Scott Fitzgerald	Guaraní	Chemistry	fantasy
918	2003	8	Pride and Prejudice	Mark Twain	New Zealand Sign Language	Chemistry	romance
919	1995	10	Harry Potter and the Philosopher's Stone	Leo Tolstoy	Dari	Chemistry	science fiction
920	2012	9	The Catcher in the Rye	Ernest Hemingway	Swahili	History	adventure
921	2006	3	Pride and Prejudice	J.K. Rowling	Sotho	Sociology	horror
922	2003	7	The Great Gatsby	Mark Twain	Afrikaans	Physics	romance
923	1990	5	1984	Harper Lee	Tswana	Psychology	thriller
924	2011	10	The Hobbit	Charles Dickens	Hungarian	Computer Science	fantasy
925	1986	2	Pride and Prejudice	F. Scott Fitzgerald	Assamese	History	thriller
926	2008	5	The Chronicles of Narnia	Mark Twain	Zulu	History	adventure
927	2012	5	The Chronicles of Narnia	Harper Lee	Assamese	Sociology	fantasy
928	1992	8	The Catcher in the Rye	Mark Twain	Ndebele	History	self-help
929	1997	9	Moby-Dick	William Shakespeare	Filipino	Literature	historical fiction
930	1993	9	The Great Gatsby	J.K. Rowling	Marathi	Chemistry	thriller
931	2008	10	The Great Gatsby	Jane Austen	Khmer	Literature	adventure
932	1992	3	1984	Charles Dickens	Kannada	History	biography
933	2011	8	The Great Gatsby	J.K. Rowling	Czech	History	romance
934	2004	4	The Chronicles of Narnia	F. Scott Fitzgerald	English	Chemistry	historical fiction
935	2001	5	Pride and Prejudice	Charles Dickens	Marathi	Literature	biography
936	2011	3	1984	George Orwell	Malayalam	Literature	self-help
937	2013	9	The Lord of the Rings	Harper Lee	Tajik	Physics	historical fiction
938	1995	3	Harry Potter and the Philosopher's Stone	Ernest Hemingway	Hindi	Literature	fantasy
939	1987	8	Moby-Dick	Jane Austen	Guaraní	Psychology	biography
940	2002	7	Harry Potter and the Philosopher's Stone	Mark Twain	Belarusian	Physics	biography
941	1992	3	Harry Potter and the Philosopher's Stone	Mark Twain	Hindi	Chemistry	biography
942	2013	2	The Chronicles of Narnia	Ernest Hemingway	Tetum	Biology	romance
943	2011	5	Harry Potter and the Philosopher's Stone	Jane Austen	Finnish	Chemistry	horror
944	2008	2	To Kill a Mockingbird	Ernest Hemingway	Dhivehi	Biology	fantasy
945	2001	9	The Hobbit	Jane Austen	Swati	History	thriller
946	2011	2	Moby-Dick	Harper Lee	Finnish	Chemistry	science fiction
947	1988	10	To Kill a Mockingbird	Leo Tolstoy	Irish Gaelic	Sociology	mystery
948	1995	7	1984	J.K. Rowling	Nepali	Mathematics	self-help
949	1989	10	The Chronicles of Narnia	F. Scott Fitzgerald	Romanian	Biology	biography
950	2008	6	Pride and Prejudice	J.K. Rowling	Northern Sotho	Computer Science	historical fiction
951	2001	7	The Chronicles of Narnia	George Orwell	Mongolian	Literature	mystery
952	2010	6	The Lord of the Rings	George Orwell	Chinese	Psychology	biography
953	1990	7	To Kill a Mockingbird	Ernest Hemingway	Macedonian	Literature	historical fiction
954	2007	4	The Great Gatsby	George Orwell	Lithuanian	Physics	self-help
955	2013	4	To Kill a Mockingbird	Mark Twain	French	Mathematics	romance
956	1993	2	The Catcher in the Rye	Leo Tolstoy	Gagauz	Computer Science	adventure
957	1989	2	Moby-Dick	Jane Austen	Maltese	Computer Science	romance
958	1988	4	The Hobbit	Mark Twain	Haitian Creole	Physics	horror
959	2011	9	The Chronicles of Narnia	J.K. Rowling	Malagasy	History	mystery
960	1998	1	Harry Potter and the Philosopher's Stone	J.K. Rowling	Swedish	Biology	mystery
961	1994	9	The Lord of the Rings	Jane Austen	Gujarati	Literature	mystery
962	2008	2	The Catcher in the Rye	William Shakespeare	Nepali	Biology	biography
963	2007	8	Moby-Dick	Jane Austen	Haitian Creole	History	historical fiction
964	2012	4	To Kill a Mockingbird	Charles Dickens	Estonian	History	horror
965	2005	9	The Chronicles of Narnia	Leo Tolstoy	Armenian	Physics	self-help
966	1995	3	The Hobbit	Mark Twain	Moldovan	Literature	horror
967	2006	4	1984	Harper Lee	Georgian	Physics	romance
968	2013	2	Moby-Dick	Leo Tolstoy	Thai	Biology	romance
969	2011	3	Harry Potter and the Philosopher's Stone	Jane Austen	Hebrew	Physics	thriller
970	2002	7	Pride and Prejudice	Jane Austen	Fijian	Chemistry	thriller
971	1996	2	Pride and Prejudice	William Shakespeare	Portuguese	History	romance
972	2003	2	The Hobbit	Leo Tolstoy	Czech	Physics	fantasy
973	1996	6	Pride and Prejudice	Charles Dickens	Marathi	Literature	thriller
974	2012	3	The Catcher in the Rye	Ernest Hemingway	Filipino	Mathematics	romance
975	2011	4	Harry Potter and the Philosopher's Stone	Charles Dickens	Arabic	Physics	horror
976	1998	7	The Great Gatsby	Ernest Hemingway	Fijian	Literature	biography
977	2011	10	1984	Harper Lee	Kazakh	Psychology	mystery
978	2000	9	1984	J.K. Rowling	French	Computer Science	science fiction
979	2012	1	The Catcher in the Rye	Charles Dickens	Macedonian	Biology	horror
980	2006	2	The Chronicles of Narnia	F. Scott Fitzgerald	Khmer	Physics	thriller
981	2012	5	Pride and Prejudice	Leo Tolstoy	German	Psychology	historical fiction
982	2013	8	1984	William Shakespeare	Korean	Mathematics	biography
983	2007	10	The Chronicles of Narnia	Charles Dickens	Estonian	Psychology	historical fiction
984	1998	1	The Lord of the Rings	Leo Tolstoy	Thai	Mathematics	self-help
985	1998	6	Moby-Dick	Mark Twain	Afrikaans	Psychology	thriller
986	2012	10	The Catcher in the Rye	George Orwell	Kashmiri	Literature	horror
987	2011	5	Pride and Prejudice	Ernest Hemingway	Polish	Literature	horror
988	2006	10	The Hobbit	J.K. Rowling	Amharic	Sociology	self-help
989	1984	5	Pride and Prejudice	Charles Dickens	Czech	History	self-help
990	1993	9	The Chronicles of Narnia	William Shakespeare	Swahili	Computer Science	historical fiction
991	1999	4	The Lord of the Rings	Leo Tolstoy	Malay	Physics	mystery
992	2001	1	The Lord of the Rings	J.K. Rowling	Finnish	Chemistry	thriller
993	2004	9	The Lord of the Rings	J.K. Rowling	Lao	Psychology	romance
994	2002	8	The Lord of the Rings	William Shakespeare	Persian	History	mystery
995	1988	4	Moby-Dick	Mark Twain	Ndebele	Psychology	historical fiction
996	2002	5	1984	Mark Twain	New Zealand Sign Language	Literature	historical fiction
997	1995	8	The Chronicles of Narnia	J.K. Rowling	Norwegian	Sociology	biography
998	2011	7	The Catcher in the Rye	George Orwell	Portuguese	Literature	mystery
999	1997	2	To Kill a Mockingbird	Harper Lee	Ndebele	Psychology	fantasy
1000	2011	9	Pride and Prejudice	Mark Twain	Guaraní	Physics	thriller
\.


--
-- TOC entry 4870 (class 0 OID 16411)
-- Dependencies: 216
-- Data for Name: book_circulation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_circulation (number_of_operation, id_reader, issue_date, return_date, return_date_plan, fine, id_copy_of_book) FROM stdin;
1	155	2023-12-05	2023-11-11	2023-06-27	f	774
2	733	2023-02-07	2023-02-21	2023-10-15	f	505
3	71	2023-09-11	2023-05-14	2023-03-02	t	215
4	530	2023-10-11	2023-04-06	2023-02-28	t	300
5	875	2023-09-24	2023-04-06	2023-03-24	f	291
6	504	2023-12-05	2023-03-15	2023-02-05	f	681
7	892	2023-05-26	2023-06-11	2023-07-10	t	156
8	300	2023-07-31	2023-05-20	2023-10-31	t	381
9	491	2023-01-20	2023-08-21	2023-06-24	t	474
10	929	2023-06-11	2023-01-23	2023-03-22	f	812
11	121	2023-04-28	2023-08-16	2023-01-24	f	968
12	793	2023-01-22	2023-04-22	2023-08-11	f	518
13	776	2023-03-21	2023-12-03	2023-10-20	f	932
14	888	2023-03-12	2023-08-11	2023-10-24	t	181
15	662	2023-10-25	2023-08-24	2023-01-03	t	974
16	294	2023-11-07	2023-02-08	2022-12-14	t	638
17	478	2023-04-20	2023-08-07	2023-07-13	t	221
18	537	2023-05-29	2023-11-27	2023-02-03	t	721
19	397	2023-09-02	2023-09-09	2023-07-22	f	850
20	579	2023-04-14	2023-12-02	2023-09-20	f	594
21	243	2022-12-16	2023-08-25	2023-04-20	f	629
22	167	2023-01-15	2023-09-26	12023-01-20	t	653
23	49	2023-04-09	2023-09-10	2023-08-12	f	496
24	790	2023-02-23	2023-06-09	2023-04-20	t	162
25	303	2023-04-04	2023-03-02	2023-08-24	f	176
26	499	2023-02-27	2023-09-18	2023-10-17	t	624
27	906	2023-02-02	2023-07-26	2023-01-15	f	754
28	301	2022-12-16	2022-12-19	2023-01-28	f	130
29	997	2023-05-03	2022-12-13	2023-02-14	f	126
30	232	12023-01-20	2023-07-17	2023-05-13	f	671
31	524	2023-11-13	2023-02-19	2023-03-12	f	327
32	225	2023-01-11	2023-09-04	2023-08-11	t	118
33	540	2023-07-19	2023-03-15	2023-05-23	f	693
34	157	2023-07-19	2023-07-04	2023-03-15	f	145
35	875	2023-07-09	2023-10-01	2023-02-22	f	307
36	242	2023-09-15	2023-05-31	2023-05-25	f	780
37	464	2023-03-21	2023-06-28	2023-10-03	f	991
38	266	2023-10-11	2023-11-17	2023-07-02	t	311
39	816	2023-03-22	2023-07-03	2023-02-01	f	991
40	126	2023-02-27	2023-06-07	2023-01-15	f	8
41	432	2023-01-26	2022-12-08	2023-05-29	t	555
42	843	2023-03-29	2023-08-08	2023-09-02	f	612
43	473	2023-10-29	2023-09-25	2023-01-24	f	878
44	890	2023-09-10	2022-12-12	2023-11-05	f	751
45	520	2023-08-23	2023-09-24	2023-05-13	f	315
46	255	2023-03-04	2023-03-10	2022-12-16	f	91
47	869	2023-03-20	2023-07-15	2023-07-14	t	105
48	328	2023-09-17	2023-03-03	2023-09-16	f	548
49	897	2023-10-23	2023-03-17	2023-02-16	f	769
50	327	12023-01-22	2023-01-05	2023-12-02	t	796
51	964	2023-04-24	2023-06-27	2023-10-08	f	85
52	594	2023-09-18	2022-12-23	2023-01-01	f	47
53	661	2023-03-16	2023-11-27	2023-06-19	t	982
54	474	2023-04-19	2023-04-08	2023-08-01	t	419
55	437	2023-01-24	2023-09-22	2023-03-19	t	592
56	505	2023-07-06	2023-05-04	2023-03-02	f	201
57	874	2023-06-08	2023-10-13	2023-07-20	t	84
58	32	2023-11-25	2022-12-09	2023-02-06	f	999
59	578	2023-10-03	2023-06-21	2023-05-27	t	461
60	706	2023-01-16	2023-05-14	2023-09-17	t	863
61	388	2023-09-11	2023-08-01	2023-07-04	t	865
62	636	2023-09-11	2023-05-18	2023-07-19	f	693
63	378	2023-06-28	2023-10-13	2023-08-12	f	345
64	353	2023-02-17	2023-06-30	2023-04-07	t	445
65	531	2023-09-28	2023-07-09	2023-10-12	f	328
66	22	2023-03-08	2023-03-02	2023-07-07	t	660
67	305	2023-07-07	2023-08-21	2023-04-10	f	846
68	969	2023-08-01	2023-07-27	2023-10-26	f	824
69	214	2023-04-04	2023-06-12	2023-09-25	f	609
70	170	2023-09-21	2023-08-27	2023-08-28	f	575
71	329	2023-09-04	2023-04-23	2023-04-24	f	996
72	625	2023-01-04	2023-08-01	2023-01-14	t	650
73	789	2023-10-07	2023-08-11	2023-08-05	f	470
74	746	2023-08-30	2023-05-10	2023-06-20	f	334
75	198	2023-09-06	2023-02-10	2023-05-25	f	5
76	596	2023-10-11	2023-03-22	2023-07-16	t	248
77	345	2023-03-13	2023-06-29	2023-07-07	f	822
78	521	2023-02-09	2023-01-17	2023-12-03	t	684
79	718	2023-04-12	2023-06-17	2023-09-03	t	227
80	475	2023-09-29	2023-01-17	2023-07-16	t	751
81	800	2023-04-05	2023-01-22	2023-04-12	f	666
82	990	2023-02-24	2023-11-25	2023-03-10	t	978
83	170	2023-02-23	2023-06-07	2023-01-03	f	77
84	31	2023-05-19	2023-02-27	2023-02-26	t	796
85	160	2023-02-17	2023-11-11	2023-05-03	t	110
86	603	2023-11-08	2023-11-21	2023-01-11	t	879
87	495	2023-08-22	2023-04-10	2023-04-03	t	653
88	467	2023-10-21	2023-02-09	2023-06-10	f	456
89	419	12023-01-23	2023-09-26	2023-03-11	t	77
90	236	2023-09-17	2023-06-29	2023-04-27	f	275
91	166	2023-11-11	12023-01-16	2023-03-14	t	160
92	938	2023-04-19	2023-07-31	2023-03-08	f	653
93	668	2023-03-19	2023-04-09	2023-02-21	f	898
94	513	2023-01-29	2023-05-23	2023-08-13	t	427
95	54	2022-12-26	2023-08-15	2023-09-20	t	981
96	318	2023-11-08	2023-02-11	2023-09-04	t	599
97	294	2023-09-27	2023-06-13	2023-09-21	f	248
98	720	2023-09-19	2023-05-22	2023-06-11	t	895
99	612	2023-05-19	2023-09-08	2023-01-12	t	907
100	927	2022-12-09	2022-12-21	2023-01-10	f	865
101	390	2023-11-19	2023-01-01	2022-12-16	t	177
102	752	2023-11-25	2023-04-30	2023-01-30	t	425
103	656	2023-04-22	2022-12-29	2023-08-06	f	905
104	269	2023-09-09	2023-12-03	2023-04-11	f	458
105	435	2023-01-02	2023-06-06	2022-12-24	t	179
106	889	2023-05-08	2023-07-21	2023-08-16	t	699
107	845	2023-07-21	2023-02-12	2022-12-08	f	960
108	603	12023-01-29	2023-09-29	2023-10-07	f	644
109	271	2023-08-20	2023-08-20	2023-03-09	t	229
110	335	2023-08-18	2023-02-06	2023-01-19	f	720
111	166	2023-02-16	2022-12-21	2023-08-01	f	339
112	649	2023-08-26	2023-05-27	2023-02-18	f	512
113	706	2023-01-28	2023-10-25	2023-10-30	f	847
114	556	2023-02-23	2023-04-19	2023-02-01	f	436
115	939	2023-05-01	2023-01-20	2023-07-26	t	955
116	625	12023-01-28	2023-08-13	2023-11-08	f	172
117	495	2023-06-25	2023-12-03	2023-10-17	f	731
118	302	2023-03-04	2023-01-21	2023-05-20	t	616
119	964	2023-08-11	2023-10-06	2023-03-12	t	171
120	106	2023-06-14	2023-04-30	2023-10-24	f	97
121	100	2023-02-10	2023-03-09	2023-08-22	t	129
122	344	2023-02-23	2023-08-09	2023-10-27	t	766
123	997	2023-10-16	2023-04-08	2023-01-13	f	79
124	884	2023-09-15	2023-01-10	2023-06-21	f	706
125	303	2023-04-02	2023-07-24	2023-08-29	f	957
126	901	2023-05-08	12023-01-29	2023-10-29	f	16
127	579	2023-12-05	2022-12-13	2023-04-22	t	940
128	849	2023-05-11	2023-11-17	2023-05-08	t	541
129	600	2023-07-16	2023-09-15	2023-02-16	f	353
130	559	2023-02-04	12023-02-04	2023-09-10	f	896
131	839	2023-01-22	2023-11-05	2023-01-04	f	189
132	787	2023-10-12	2023-04-20	2023-01-15	f	230
133	242	2023-05-13	2023-08-25	2023-05-24	f	574
134	666	2023-06-23	2023-03-05	2023-09-21	f	230
135	968	2023-04-20	2023-02-16	2023-09-16	f	345
136	780	2023-10-24	2023-05-21	2023-10-10	t	382
137	490	2023-06-15	2023-04-09	2023-09-17	f	606
138	728	2023-08-31	2023-04-07	12023-01-30	t	614
139	858	2023-06-07	2023-10-02	2023-01-16	t	225
140	121	2023-09-05	12023-01-22	2023-01-23	t	20
141	230	2023-04-05	2023-06-01	2023-02-01	t	133
142	382	2023-03-16	2023-04-23	2023-03-16	f	678
143	567	2023-11-07	2023-08-15	2023-07-08	t	365
144	242	2023-11-21	2023-03-21	2022-12-24	f	959
145	684	2023-01-13	2023-06-28	2023-10-14	f	665
146	755	2023-10-08	2023-03-23	2023-04-17	f	519
147	427	2023-04-11	2023-04-17	2023-02-06	f	209
148	814	2023-08-07	2023-07-07	2022-12-16	t	774
149	117	12023-01-29	2023-01-24	2023-09-09	f	48
150	579	2023-04-05	2023-04-29	2023-03-26	t	884
151	256	2023-04-12	2022-12-31	2023-01-25	t	529
152	770	2023-03-03	2023-08-23	2023-01-06	t	659
153	922	2023-10-27	12023-01-15	2023-09-29	f	307
154	991	2023-02-17	2023-03-29	2023-07-16	f	207
155	373	2023-04-03	2023-08-08	2022-12-20	f	725
156	880	2023-09-01	2023-01-22	2022-12-10	f	896
157	358	2023-10-21	2023-10-11	2023-03-30	f	353
158	6	2023-06-26	12023-02-04	2023-04-24	t	558
159	544	2023-06-30	2023-04-22	2023-06-03	f	367
160	92	2023-08-02	2023-02-05	2023-05-07	t	17
161	747	2023-09-04	2023-08-30	2023-03-08	t	233
162	969	2023-02-24	2022-12-08	2023-11-09	t	369
163	858	2023-04-30	2023-02-09	2023-11-07	t	692
164	179	2023-07-01	2023-06-19	2022-12-29	t	585
165	386	2023-06-10	2023-10-06	2023-05-25	f	883
166	666	2022-12-17	2022-12-12	2023-08-15	f	923
167	161	2023-01-31	2023-03-27	2023-10-11	f	131
168	798	2023-05-28	12023-01-15	2023-06-21	f	918
169	876	2023-11-25	2023-09-07	2023-03-29	t	978
170	241	2023-04-05	2023-08-19	2023-08-14	t	993
171	157	2023-03-15	2023-09-08	2023-04-25	t	45
172	89	2023-03-01	12023-01-26	2023-09-16	f	965
173	864	2023-03-26	2023-01-29	2023-02-23	f	538
174	999	2023-03-17	2023-06-14	2023-04-19	t	370
175	596	2023-02-16	2023-02-14	2023-08-31	t	894
176	180	12023-02-06	2023-10-05	2022-12-10	t	889
177	472	2023-06-18	2023-01-24	2023-02-12	t	192
178	492	2023-05-15	2023-02-25	2023-05-10	f	660
179	68	2023-10-09	2023-08-21	12023-02-04	f	628
180	999	12023-01-14	2023-06-04	2023-05-12	f	972
181	661	2023-04-04	2023-02-25	2023-06-12	t	641
182	202	2023-02-11	2023-03-08	2023-01-12	t	608
183	784	2023-02-09	2023-04-20	2023-02-25	t	910
184	820	2023-10-17	2023-11-19	2023-10-04	t	892
185	941	2023-06-02	2023-02-13	2023-07-03	f	189
186	96	2023-07-23	2022-12-07	2023-04-23	f	493
187	437	2023-03-09	2022-12-27	2023-01-10	f	287
188	421	2023-09-24	2023-04-17	2023-09-02	f	265
189	644	2023-07-13	2023-04-21	2023-07-25	f	29
190	344	2023-07-11	2023-05-03	2023-02-09	t	998
191	905	2023-11-21	2023-02-04	2023-02-11	f	495
192	178	2023-05-11	2023-09-23	2023-10-02	t	993
193	274	2023-05-17	2023-04-14	2023-02-26	t	842
194	992	2023-05-08	2023-02-17	12023-01-12	t	774
195	906	2023-05-01	2023-05-14	2023-09-22	t	475
196	451	2023-07-16	2023-01-10	2023-05-25	t	34
197	825	2023-04-11	2023-05-01	2023-08-18	t	17
198	767	2022-12-29	2023-05-13	2023-02-20	t	349
199	553	2023-08-20	2023-06-16	2023-04-12	t	810
200	733	2023-02-18	12023-01-12	2022-12-18	f	933
201	100	2023-03-31	2023-08-15	2023-07-21	f	460
202	846	2023-10-02	2023-04-10	2023-08-05	f	873
203	26	2023-10-24	2023-03-10	2023-09-16	t	496
204	94	2023-05-27	2023-09-12	2023-11-18	t	882
205	479	2023-10-26	2023-02-14	2023-08-02	t	227
206	915	2023-02-03	2022-12-08	2023-09-23	t	977
207	887	2023-05-12	2023-07-16	2023-05-31	f	124
208	105	2023-02-13	2023-07-28	2023-10-19	t	170
209	565	2023-08-09	2023-05-15	2022-12-21	f	141
210	765	2023-08-16	2023-10-17	2023-01-31	f	804
211	656	2023-03-19	2023-04-22	2023-06-28	f	158
212	35	2023-01-07	2023-06-11	2023-10-26	t	899
213	260	2023-10-10	2023-04-19	2023-01-20	f	881
214	968	2023-03-26	2023-08-12	2023-10-20	t	245
215	901	2022-12-31	2023-10-28	2023-02-17	t	670
216	167	2023-09-06	2022-12-24	2023-03-26	f	753
217	376	2023-02-15	2023-05-21	2023-10-05	t	854
218	522	2023-09-09	2023-10-13	2023-03-01	f	622
219	707	2023-07-17	2023-02-04	2023-03-28	t	417
220	419	2023-02-24	2023-08-02	2023-05-14	t	874
221	80	2023-09-22	2023-01-12	12023-01-22	t	215
222	215	2023-04-13	2023-10-12	2023-06-15	f	409
223	569	2023-01-29	2023-05-10	12023-01-15	t	799
224	30	2023-01-07	2023-06-11	2023-04-25	f	312
225	539	2023-04-26	2022-12-15	2023-11-19	f	717
226	385	2023-01-01	2023-05-30	2023-02-01	f	864
227	193	12023-01-20	2023-09-29	2023-09-05	t	999
228	215	2023-04-23	2023-10-08	2023-09-03	t	381
229	907	2023-03-31	2023-05-18	2023-02-23	f	750
230	545	2023-07-18	2023-10-24	12023-01-01	t	261
231	202	2023-06-01	2023-06-11	2023-07-01	f	368
232	657	2023-10-16	2023-05-29	2023-01-18	f	706
233	37	2023-01-18	2022-12-10	2023-01-22	t	151
234	380	2022-12-27	2023-11-11	2022-12-20	f	71
235	830	2023-07-01	2023-05-29	2023-04-14	f	82
236	692	2023-07-15	2023-05-15	2023-05-22	f	979
237	190	2023-07-22	2023-10-11	2023-03-01	t	542
238	415	2023-05-30	2023-10-02	2023-03-21	f	223
239	790	2023-11-19	2023-04-01	2023-10-24	f	314
240	909	2023-03-27	12023-01-24	2023-09-23	f	680
241	824	2023-04-10	12023-01-06	2023-09-19	t	100
242	918	2023-04-16	2022-12-18	2023-06-25	t	313
243	776	2023-03-08	2023-06-12	2023-02-06	t	729
244	140	2023-09-28	2023-07-27	2023-04-16	t	722
245	76	2023-08-13	2023-10-16	2023-08-02	f	978
246	404	2023-10-31	2023-01-17	2023-05-16	f	424
247	294	2023-03-06	2023-01-27	2023-06-28	f	980
248	179	2023-07-08	2022-12-22	2023-10-27	f	953
249	23	2023-01-09	2023-05-08	2023-05-31	f	249
250	471	2023-02-17	2023-06-18	2023-07-18	t	654
251	740	2023-04-16	2023-01-22	2023-10-15	f	472
252	374	2023-01-08	2023-08-25	2023-02-04	f	328
253	858	2022-12-09	2023-09-24	2023-06-03	f	216
254	478	2023-09-07	2023-11-09	2022-12-25	f	671
255	802	2023-07-25	2023-09-21	2023-03-31	t	316
256	513	2023-10-07	2023-04-29	2023-04-11	f	87
257	385	2023-02-22	2023-11-25	2023-02-27	f	75
258	96	2022-12-27	2023-06-18	2023-05-05	f	374
259	882	2023-04-19	2023-05-16	2023-09-11	t	364
260	830	2023-01-02	12023-01-28	2023-10-14	f	389
261	962	2023-11-05	2022-12-10	2023-10-03	t	566
262	179	2023-06-04	2023-10-10	2023-06-20	f	206
263	677	2023-02-14	2023-05-26	2023-07-21	f	749
264	804	2023-07-03	2022-12-07	2023-03-31	t	435
265	719	2023-06-07	2023-05-01	2023-10-10	f	993
266	123	2023-02-05	2023-03-09	2023-01-10	t	565
267	973	12023-02-01	2023-09-10	2023-03-02	t	560
268	83	2023-09-11	2022-12-24	2023-08-09	t	856
269	891	2023-01-26	2023-06-12	2023-06-12	t	545
270	790	2023-07-25	2023-04-16	2022-12-08	t	21
271	73	2023-06-12	2023-03-08	2023-09-14	t	322
272	290	2022-12-18	2023-07-31	2023-09-17	t	783
273	264	2023-08-05	2023-05-23	2023-08-09	f	235
274	466	12023-01-01	2023-07-26	2023-11-08	t	614
275	119	2023-02-25	12023-01-28	2022-12-26	f	436
276	132	2023-10-07	2022-12-25	2023-05-05	f	566
277	631	2023-08-04	2023-02-10	2023-10-30	t	740
278	835	2023-04-03	2023-03-24	2023-07-19	t	832
279	426	2023-03-17	2022-12-30	2023-04-17	t	981
280	352	2023-06-04	2023-05-19	2023-01-05	f	120
281	190	2023-06-05	2023-05-05	2023-03-04	f	520
282	435	2023-02-16	2023-08-05	12023-01-04	t	698
283	817	2023-04-16	2023-08-28	2023-06-27	t	788
284	152	2023-05-23	2023-04-28	2023-07-03	t	810
285	135	2023-05-11	2023-01-01	2023-10-30	f	247
286	351	2023-10-27	2023-03-26	2022-12-15	f	294
287	566	2023-11-09	2023-08-21	2023-07-18	f	592
288	913	2023-01-18	2023-08-12	2023-08-02	t	947
289	488	2023-11-11	2023-02-18	2023-01-07	f	201
290	275	2023-09-24	2023-03-31	2023-08-02	f	185
291	447	2023-08-30	2023-02-01	2023-03-16	t	144
292	313	2023-10-17	2023-09-15	2023-03-28	t	676
293	717	2023-03-03	12023-01-01	2023-04-27	t	414
294	53	2023-09-29	2023-04-09	2023-11-21	f	395
295	791	2023-01-04	2023-06-24	2023-07-06	f	121
296	492	2023-09-12	2023-07-16	2023-03-28	f	218
297	118	2023-10-25	2023-02-27	2023-10-01	f	821
298	285	2023-06-18	2023-05-29	2023-08-26	t	266
299	680	2023-02-16	2023-09-21	2023-08-18	f	47
300	669	2023-05-01	2023-01-31	2023-02-14	f	163
301	51	2022-12-27	2023-08-23	2023-05-19	f	286
302	43	2023-02-12	2023-01-15	2023-04-30	f	531
303	473	2023-06-17	2022-12-21	2023-10-01	f	886
304	141	12023-01-06	12023-01-28	12023-01-10	f	802
305	718	2023-07-10	2023-09-22	2023-05-22	t	339
306	172	2023-10-15	2023-08-07	2023-10-14	t	699
307	375	2023-07-08	2023-03-23	2023-08-10	f	776
308	714	2023-02-05	2023-06-02	12023-01-14	t	148
309	306	2023-08-10	2023-10-10	2023-02-12	t	331
310	928	2023-10-28	2023-01-09	2023-12-05	t	544
311	747	2023-05-29	2023-08-02	2023-09-26	t	716
312	562	2023-06-29	2023-11-11	2023-11-13	t	292
313	865	2023-06-06	2023-10-07	2023-07-17	f	375
314	121	2023-10-04	2023-07-26	2023-04-29	t	975
315	228	2023-05-06	2022-12-29	2023-10-28	f	340
316	508	2023-10-17	2023-02-21	2023-10-11	t	828
317	361	2023-02-12	2023-01-02	2022-12-29	f	567
318	738	2023-09-14	2023-07-26	2023-10-19	f	208
319	626	2023-08-08	2022-12-29	2023-10-23	f	355
320	888	2023-05-22	2023-01-13	2023-05-26	f	168
321	150	2023-10-04	2023-06-11	2023-05-06	t	710
322	101	2023-07-03	2023-09-15	2023-10-29	t	35
323	878	2023-11-07	2023-09-19	2023-03-05	t	33
324	375	2023-06-28	2023-06-03	2023-07-11	t	145
325	83	2023-10-06	2023-06-27	2023-05-02	f	247
326	656	2022-12-25	2023-10-30	2023-03-21	t	907
327	482	2023-03-23	2023-05-06	2023-10-05	t	737
328	906	2023-05-07	2023-06-08	2023-07-20	t	867
329	394	2023-02-26	2023-06-27	2023-05-21	f	766
330	556	2023-02-13	2023-03-17	2023-05-30	t	546
331	756	2023-06-16	2023-11-19	2023-02-05	t	455
332	633	2023-11-17	2023-02-08	2023-05-10	f	623
333	79	2022-12-09	2023-12-03	2022-12-22	t	842
334	251	2023-01-03	2023-08-07	2023-06-06	t	538
335	156	2023-11-11	2023-06-12	2023-06-26	t	42
336	757	2023-04-27	2023-10-20	2023-05-28	t	700
337	333	2023-04-19	2023-02-19	2023-03-26	f	479
338	223	2023-05-27	2023-06-17	2023-03-30	t	343
339	551	2023-05-09	2023-01-03	2023-09-26	f	778
340	800	2023-07-05	2023-08-05	2023-10-21	t	257
341	154	2023-03-26	2023-08-21	2023-01-09	t	545
342	7	2023-06-24	2023-02-15	2023-09-06	t	454
343	219	2023-10-01	2023-04-22	2023-01-01	t	666
344	95	2023-09-03	2023-05-19	2023-03-16	t	235
345	913	2023-03-17	2023-11-19	2023-03-22	t	593
346	209	2023-03-17	2023-06-17	2023-08-19	f	465
347	705	2023-02-23	2023-02-20	2023-10-21	t	160
348	657	2023-02-10	2022-12-19	2023-08-20	t	760
349	799	2023-10-06	2023-02-01	2023-06-23	f	26
350	565	2023-05-22	2023-05-23	2023-04-05	t	200
351	110	2023-11-27	2023-03-02	2023-02-28	f	219
352	903	2023-08-20	2023-04-29	2023-10-31	f	310
353	717	2023-05-19	2023-08-20	2023-04-21	t	655
354	104	2023-01-14	2023-02-24	2023-09-12	f	456
355	782	2023-08-10	2023-01-08	2023-02-20	f	796
356	327	2023-03-19	12023-01-10	2023-05-18	f	798
357	145	2023-01-27	2023-07-03	2023-10-15	f	634
358	174	2023-04-11	2022-12-13	2023-06-20	t	5
359	184	2022-12-14	2023-07-21	2023-05-30	t	860
360	196	2023-08-23	2023-07-25	2023-07-23	t	983
361	89	2023-04-17	2023-01-25	2023-04-16	f	889
362	168	2023-02-07	2023-02-03	2023-03-02	f	176
363	354	2023-07-12	2023-04-16	2023-03-27	t	148
364	150	2023-11-21	2023-07-26	2023-07-29	f	669
365	368	2023-07-14	2023-01-20	2023-06-30	t	7
366	24	2023-07-12	2023-10-04	2023-06-18	f	552
367	975	2023-07-14	2023-01-13	2023-02-08	t	233
368	295	2023-02-10	2023-09-15	2023-08-30	t	120
369	137	2023-03-10	2023-04-03	2023-01-20	t	925
370	352	2023-09-22	2023-02-20	2023-11-25	f	506
371	219	2023-03-31	2023-01-12	2023-02-08	t	876
372	430	2023-04-29	2023-06-25	2023-05-02	t	563
373	835	2023-04-22	2023-03-01	2023-02-20	f	700
374	391	2023-08-22	2023-06-20	2023-04-25	t	209
375	927	2023-09-22	2023-09-29	2023-02-01	f	302
376	669	2023-08-03	2022-12-29	2023-05-02	f	187
377	190	2023-03-31	2023-08-10	2023-07-12	t	221
378	526	12023-01-23	2023-01-27	2023-10-23	t	444
379	329	2023-05-26	2022-12-09	2023-01-02	f	976
380	652	2022-12-27	2023-01-15	2023-06-26	f	523
381	822	2023-06-04	2023-05-15	2023-02-27	f	519
382	310	2023-04-18	2022-12-13	2023-01-06	t	551
383	444	2023-11-13	12023-01-01	2023-05-29	f	774
384	708	2023-04-13	2023-09-04	2023-01-15	t	989
385	816	2022-12-28	2023-03-09	2023-05-27	t	321
386	35	2023-06-08	2023-01-06	2023-01-26	f	627
387	762	2023-06-13	2023-10-31	2022-12-14	f	639
388	106	2023-05-29	2023-04-29	2023-10-04	f	690
389	313	2023-04-25	2023-08-13	2023-05-30	f	693
390	74	2023-09-11	2023-03-08	2023-01-08	f	833
391	768	2023-10-04	2023-03-22	2023-05-25	f	353
392	379	2023-03-02	2023-04-09	2023-03-01	t	141
393	410	2023-04-03	2023-05-20	2023-06-22	t	378
394	672	2023-05-08	2023-10-10	2023-05-07	f	521
395	18	2023-11-09	2023-04-28	2023-02-15	t	900
396	557	2023-10-06	2023-06-09	2023-01-06	f	912
397	991	2023-02-25	2022-12-24	2023-10-29	t	61
398	210	2023-04-15	2023-07-03	2023-05-17	f	720
399	429	12023-01-03	2023-10-23	2023-10-07	t	701
400	725	2023-04-04	2023-01-06	2023-02-15	t	342
401	613	2023-02-20	2023-02-13	2023-02-06	t	66
402	261	2023-11-21	2023-04-18	2023-03-03	f	854
403	498	2023-02-03	2023-08-16	2023-08-31	f	856
404	34	2023-02-21	2023-11-17	2023-08-31	t	897
405	782	2023-07-10	2023-01-01	2023-03-01	f	891
406	329	2023-03-03	2023-05-27	2023-04-20	t	798
407	792	2023-06-11	2023-08-02	2023-05-11	f	498
408	282	2022-12-31	2023-07-27	2023-01-05	t	532
409	836	2023-05-04	2023-06-02	2023-02-11	f	558
410	341	2023-07-28	2023-07-06	2023-01-03	f	762
411	276	2023-07-31	2023-01-13	2023-04-30	t	733
412	336	2023-11-17	2023-04-26	2023-09-09	f	724
413	109	2023-09-10	2023-01-16	2023-01-29	f	549
414	654	2023-03-02	2023-03-17	2023-08-30	t	996
415	755	2023-07-18	2023-08-20	2023-05-25	t	610
416	547	2023-05-14	2023-09-27	2023-01-24	t	582
417	854	2023-11-27	2023-01-24	2023-05-16	t	975
418	743	2023-05-22	2023-08-04	2023-08-01	t	821
419	300	2023-11-21	2023-03-01	2023-01-06	f	503
420	952	2023-06-24	2023-03-01	2023-01-08	f	172
421	974	2023-02-11	2023-03-15	2023-04-17	t	11
422	413	2023-03-13	2022-12-16	2023-02-13	t	700
423	574	2023-03-11	2023-10-18	2022-12-30	t	310
424	998	2023-08-22	2023-08-05	2023-10-08	t	103
425	887	2023-09-11	2023-02-08	2023-01-09	f	899
426	112	2023-02-16	2022-12-20	2023-08-26	f	709
427	580	2023-08-11	2023-03-07	2023-06-17	t	775
428	639	2023-05-08	2023-06-11	2023-05-19	f	672
429	215	2023-10-20	2023-06-30	2023-05-21	t	836
430	122	2023-04-16	2022-12-31	2023-08-19	t	69
431	236	2022-12-25	2023-01-01	2023-08-08	t	568
432	330	2023-07-18	2023-05-16	2023-03-21	t	199
433	991	2023-08-28	2023-06-03	2022-12-31	t	970
434	652	2023-05-28	2023-03-13	2023-06-11	t	152
435	35	2022-12-15	2023-09-25	2023-06-24	f	129
436	746	2023-07-13	2023-01-06	2023-07-09	t	6
437	790	2023-08-19	2023-02-23	2023-05-12	f	806
438	136	2023-09-08	12023-01-22	2023-03-02	t	677
439	784	2023-09-30	2022-12-16	2023-02-24	t	670
440	186	2023-02-13	2023-10-01	2023-08-04	f	317
441	961	2023-04-12	12023-01-10	2023-05-08	f	865
442	383	2023-11-27	2023-08-14	2023-05-04	f	132
443	871	2023-08-27	2023-08-04	2023-09-14	f	273
444	119	2022-12-24	2023-04-22	2023-09-13	t	173
445	495	2023-02-16	2023-07-22	2023-07-10	f	512
446	684	2023-04-23	2023-04-17	2023-11-11	f	893
447	230	2023-02-21	2023-04-26	2023-03-31	t	830
448	270	2023-09-28	2023-01-03	2023-10-06	f	205
449	47	2023-01-18	2023-04-10	2023-02-24	f	540
450	6	2023-05-12	2023-07-02	2023-07-13	f	170
451	724	2023-04-08	2023-03-22	2022-12-30	t	970
452	778	2023-02-17	2023-06-05	2023-10-31	f	227
453	736	2023-06-20	2023-03-02	2023-09-14	f	15
454	756	2023-04-20	2023-01-16	2023-07-18	f	243
455	695	2023-02-22	2023-07-20	2023-10-30	f	314
456	780	2022-12-14	2023-03-23	2023-01-16	f	921
457	714	2023-01-19	2022-12-22	2023-12-03	t	935
458	77	2023-04-14	2023-10-31	2023-05-18	f	197
459	893	2023-08-29	2023-08-24	2023-10-19	f	637
460	660	2023-01-08	2022-12-13	2023-06-04	t	190
461	949	2023-06-09	2023-01-28	2022-12-27	t	967
462	791	2023-09-08	12023-01-02	2023-10-25	f	991
463	238	2023-04-02	2023-08-20	2023-02-07	t	608
464	32	2023-09-05	2023-09-04	2023-01-20	t	414
465	478	2023-08-12	2023-02-19	2022-12-09	f	610
466	100	2023-07-07	2023-02-12	2023-03-02	f	253
467	226	2023-08-04	2022-12-26	2023-06-26	f	439
468	832	2023-07-22	2023-05-11	2023-02-18	f	115
469	248	2023-06-22	2022-12-15	2023-06-07	t	633
470	701	2023-08-04	2022-12-27	2023-07-12	f	630
471	965	2023-05-06	2023-05-22	2023-06-04	t	727
472	51	2023-04-13	2023-05-06	2023-06-18	t	460
473	386	2023-02-07	2023-07-23	2023-05-11	f	287
474	275	2023-05-16	2023-04-01	2022-12-18	f	400
475	6	2023-06-03	2023-08-31	2023-10-02	f	863
476	749	2023-11-21	2023-03-10	2023-02-24	f	134
477	864	2023-05-15	12023-02-04	2023-02-26	f	70
478	238	12023-01-26	2023-10-11	2023-11-07	f	441
479	914	2023-10-18	2023-03-29	2023-08-25	f	863
480	97	2023-12-05	2023-10-17	2023-09-12	f	165
481	213	2023-10-24	2023-06-18	2023-04-17	f	795
482	674	2023-09-09	2023-06-16	2023-06-14	f	976
483	1000	2023-02-13	2023-06-10	2023-06-11	f	811
484	752	2023-09-26	2023-05-19	2023-09-03	f	929
485	313	2023-06-17	2023-12-02	2023-03-19	f	115
486	512	2023-08-17	2022-12-09	2023-09-04	f	61
487	684	2023-10-30	2023-10-28	2023-01-21	f	117
488	699	2023-05-03	12023-01-04	12023-01-12	f	447
489	293	2023-08-01	2023-06-07	2022-12-22	t	69
490	501	2023-06-08	2023-04-15	2023-04-25	t	492
491	304	2023-08-20	2023-08-25	2023-09-16	f	673
492	536	2023-09-07	2023-06-07	2023-06-03	t	472
493	665	2023-03-13	2023-02-19	2023-01-30	f	373
494	144	2023-01-14	2023-05-09	2023-09-30	t	808
495	681	2023-04-15	2023-03-30	2023-08-29	t	198
496	340	2023-07-17	2023-04-01	2023-07-05	t	482
497	760	2023-01-30	2023-09-25	2023-03-24	f	293
498	917	2023-03-27	2022-12-24	2023-08-27	t	185
499	937	2023-08-05	2023-03-20	2023-05-22	t	331
500	264	2023-01-06	12023-01-30	2023-10-03	f	602
501	415	2023-05-03	2022-12-19	2023-10-02	f	146
502	444	2023-01-13	2023-08-15	2023-07-15	f	711
503	875	12023-01-01	2023-07-10	2023-06-28	f	358
504	830	2023-04-22	2023-06-24	2023-10-11	t	578
505	287	2023-09-30	2023-08-28	2023-02-19	t	314
506	726	2023-08-21	2023-02-27	2023-01-03	f	830
507	313	2023-10-30	2023-04-22	2023-11-18	f	738
508	943	2023-01-20	2023-05-22	2023-01-08	f	942
509	246	2023-02-05	2023-06-16	2023-01-28	f	564
510	733	2023-07-11	2023-11-11	2023-05-15	t	477
511	128	12023-01-20	2023-07-06	2023-09-20	t	938
512	413	2023-12-02	2023-11-19	2023-09-20	f	595
513	860	2023-08-24	2023-04-30	2023-03-27	f	149
514	663	2023-05-04	2023-03-31	2023-03-08	f	401
515	813	2023-02-10	2023-10-03	2022-12-31	t	822
516	504	2023-07-30	2023-03-19	2023-04-11	f	820
517	537	2023-07-01	2022-12-21	2023-10-26	f	972
518	432	2023-04-11	2023-05-07	2023-05-27	t	578
519	616	2023-05-20	2023-06-07	2023-08-13	t	336
520	616	2023-06-12	2023-04-16	2023-10-02	f	449
521	376	2022-12-10	2023-07-23	2023-02-11	t	193
522	13	2023-07-01	2023-08-19	2023-06-09	f	805
523	763	2023-02-25	2023-06-03	2023-06-14	t	405
524	149	2023-10-15	2023-07-27	2023-07-11	t	434
525	566	2023-09-15	2023-06-13	2023-05-05	f	128
526	655	2023-02-04	2023-04-27	2023-03-01	f	135
527	487	2023-10-04	12023-01-04	2023-03-11	f	543
528	953	2023-07-07	2023-06-18	2023-03-01	f	959
529	263	2023-10-31	2023-05-11	2023-10-10	t	796
530	180	2023-08-02	2023-01-23	2023-06-06	t	735
531	580	2023-07-07	2022-12-21	2023-02-25	t	875
532	647	2022-12-20	2023-10-24	2023-09-15	t	721
533	107	2023-03-09	2023-08-03	2023-04-30	f	63
534	43	2023-09-04	2023-02-19	2023-10-24	t	666
535	699	2023-02-19	2023-06-18	2023-07-23	t	9
536	677	2023-01-04	2023-04-12	2023-01-10	t	103
537	915	2023-07-18	2023-05-16	2023-07-25	t	240
538	234	2023-05-30	2023-06-25	2023-10-18	t	313
539	356	2023-07-23	2023-08-17	2022-12-30	t	461
540	195	2023-06-19	2023-09-07	2023-03-30	t	414
541	706	2023-10-04	2023-08-17	2023-03-24	f	581
542	256	2023-05-23	2023-10-03	2023-05-23	t	894
543	430	2023-05-02	2023-03-08	2023-08-31	f	178
544	747	2023-05-13	2023-10-13	2023-02-05	f	153
545	913	2023-06-23	2023-02-11	2023-09-04	t	252
546	442	2023-08-31	2023-02-17	2022-12-17	f	964
547	370	2023-05-02	2023-06-27	2023-09-12	f	991
548	406	2023-04-28	2023-01-17	2023-05-15	t	755
549	484	2023-12-02	2023-03-01	2023-08-20	f	906
550	523	2023-04-06	2023-04-10	2023-05-27	f	793
551	373	2022-12-21	2023-10-02	2023-09-01	t	444
552	885	2023-01-12	2023-09-15	2023-11-25	f	583
553	586	2023-06-15	2023-08-18	2023-01-31	t	286
554	815	2023-06-26	2023-06-14	2023-01-28	f	969
555	179	2023-01-18	2023-08-22	2023-05-09	f	333
556	93	2023-11-13	2023-08-15	2023-12-02	f	751
557	555	2023-03-29	2023-03-15	2022-12-25	t	24
558	766	2023-06-12	2023-01-14	2023-08-01	f	168
559	638	2023-02-01	2023-02-26	2023-04-14	f	650
560	654	2023-01-16	2023-01-07	2023-02-04	t	912
561	67	2023-09-03	2023-04-06	2023-03-18	t	830
562	970	2023-05-13	2023-02-14	2023-02-21	t	479
563	52	2023-10-26	2023-01-16	2023-01-19	f	840
564	815	2023-02-09	2023-03-03	2023-09-12	f	601
565	41	2022-12-26	2023-03-28	2022-12-20	f	740
566	444	12023-01-04	2023-08-25	2023-02-21	f	289
567	444	2023-04-20	2023-03-29	2023-03-02	f	927
568	35	2023-04-08	2023-03-31	2023-04-14	t	670
569	934	2023-04-19	2023-09-10	2023-01-19	t	378
570	485	2023-01-11	2023-02-15	2023-03-08	t	152
571	993	12023-01-28	2023-03-01	2023-03-03	f	172
572	492	2022-12-18	2023-02-22	2023-11-13	f	654
573	462	2023-06-12	2023-04-13	2023-05-07	t	274
574	944	2023-04-09	2023-05-28	2023-03-05	f	428
575	869	2023-05-28	2023-04-24	2023-08-09	f	346
576	374	2023-10-08	2023-05-21	2023-05-12	f	52
577	892	2023-08-11	2023-07-03	2023-02-03	t	622
578	71	2023-06-15	2023-03-11	2023-06-09	t	561
579	373	2023-05-07	2023-02-20	2023-09-15	f	240
580	309	2023-08-21	12023-01-22	2023-06-06	f	558
581	125	2023-01-19	2023-05-30	2023-06-15	t	571
582	482	2023-02-09	2023-06-15	2023-07-07	f	534
583	615	2023-09-02	2023-01-10	2023-10-25	t	90
584	60	2023-04-03	2023-03-13	12023-01-12	f	352
585	637	2023-05-06	2023-06-05	2023-05-02	t	375
586	543	2023-06-23	2023-05-20	2023-10-13	f	495
587	68	2023-10-14	2023-09-19	2023-01-19	t	985
588	687	2023-01-17	2022-12-28	2023-01-30	t	305
589	684	2023-04-15	2023-06-26	2023-07-18	t	701
590	20	2023-05-30	2023-02-16	2023-09-16	f	401
591	135	2023-05-27	2023-03-23	2023-12-03	f	981
592	546	2023-04-19	2023-12-03	2023-10-03	t	138
593	985	2023-02-10	2023-02-22	2023-10-04	f	108
594	32	2023-05-17	2023-02-23	2023-10-14	t	872
595	470	2022-12-08	2023-05-05	2023-07-22	f	948
596	887	2023-05-16	2023-04-28	2023-09-21	f	989
597	616	12023-01-26	2023-09-19	2023-01-16	f	373
598	617	2023-09-10	2022-12-18	2023-10-31	f	21
599	778	2023-06-20	2023-06-24	2023-06-22	t	840
600	247	2023-09-18	2023-07-03	2023-01-02	f	124
601	775	2023-01-10	2023-06-05	2023-05-19	f	532
602	348	2023-10-28	2023-01-26	2023-04-11	f	90
603	404	2022-12-15	2023-05-03	2023-08-13	f	293
604	185	2023-04-29	12023-01-20	2023-11-08	t	225
605	27	2023-04-10	2023-10-15	2023-10-26	f	581
606	402	2023-08-21	12023-01-24	2023-10-17	t	848
607	982	2023-10-19	2023-10-04	2022-12-27	t	682
608	982	2023-04-25	2023-02-26	2023-07-13	f	826
609	628	2023-05-30	2023-07-02	2023-06-24	f	989
610	103	2023-07-13	2023-07-22	2023-04-08	f	857
611	463	2023-04-10	2023-10-20	2023-09-10	f	527
612	836	2023-06-21	2023-06-26	2023-10-04	t	480
613	266	2023-03-31	2023-06-18	2023-05-31	t	543
614	844	12023-01-26	2023-01-04	2023-05-05	f	646
615	259	2023-05-16	12023-01-29	2023-07-14	f	709
616	534	2023-05-03	2023-04-09	2023-05-03	t	895
617	95	2023-06-29	2022-12-20	2023-06-06	t	677
618	792	2022-12-18	2023-02-26	2023-08-13	f	234
619	492	2023-09-03	2023-08-09	2023-10-03	t	949
620	243	2023-07-02	2023-03-04	2023-02-05	t	426
621	508	2023-03-07	2023-07-23	2022-12-23	f	92
622	758	2023-04-23	2023-08-18	2023-10-14	f	619
623	901	2023-04-09	2023-07-19	2023-05-17	t	541
624	43	2023-01-21	2023-01-02	2023-09-10	t	709
625	671	2023-04-27	2023-06-28	2023-06-24	t	741
626	579	2023-05-19	2023-01-04	2023-09-26	f	644
627	616	2023-09-12	2023-04-24	2023-05-25	f	390
628	808	2023-03-03	2023-06-17	2023-01-27	f	337
629	103	2023-05-13	2023-05-10	2023-05-05	t	65
630	241	2023-07-10	2023-09-25	2023-01-05	t	144
631	750	2023-04-27	2023-06-15	2023-07-21	f	289
632	75	2023-06-29	2023-08-31	12023-01-03	f	867
633	366	2023-04-22	2023-04-15	2023-04-29	f	512
634	979	2023-08-04	2022-12-07	2023-07-30	t	849
635	497	2023-05-20	12023-01-10	12023-01-20	t	30
636	302	2023-07-28	2023-05-19	2023-10-12	f	914
637	344	2023-09-19	2023-01-03	2023-07-04	t	181
638	904	2023-10-03	2023-08-02	2023-08-29	f	382
639	904	2023-02-23	2023-03-30	2023-04-07	t	902
640	971	2022-12-24	2023-02-19	2023-05-22	f	262
641	49	2023-08-25	2023-04-06	2023-02-11	t	792
642	85	2023-03-03	2023-02-17	2023-04-03	t	591
643	303	2023-10-26	2023-05-12	2023-07-15	f	982
644	277	2023-03-22	2023-06-04	2023-02-09	t	2
645	138	12023-01-14	2023-09-30	2023-06-18	f	526
646	30	2023-04-23	2023-09-14	2023-05-27	t	105
647	721	2023-09-21	2023-09-15	2023-05-26	t	182
648	345	2023-02-25	2023-08-12	2023-05-10	f	149
649	933	2023-06-28	2023-10-23	2023-02-10	f	749
650	291	2023-10-31	2023-11-21	2023-03-15	t	459
651	525	2023-08-11	2023-03-21	2023-07-18	t	235
652	241	2023-01-24	2023-04-13	2022-12-25	f	477
653	727	2023-10-20	2023-10-24	2023-07-20	t	834
654	10	2023-10-07	2023-07-22	2023-01-03	t	351
655	523	2022-12-27	2023-07-19	2023-09-30	f	600
656	289	2023-11-13	2023-04-01	2023-04-29	f	187
657	663	2023-06-11	2023-10-19	2023-09-07	t	904
658	297	2023-10-06	2023-09-27	2023-10-28	t	435
659	176	2023-01-07	2023-02-06	2023-02-08	t	598
660	580	12023-01-14	2022-12-25	2023-07-21	f	151
661	447	2022-12-15	12023-01-20	2023-03-01	f	653
662	931	2023-09-15	2023-10-04	2023-11-18	f	849
663	479	2023-03-22	2023-10-21	2023-09-10	t	917
664	229	2023-10-16	2022-12-25	2023-06-03	f	311
665	317	2023-08-07	2023-09-19	2023-04-14	t	102
666	718	2023-10-06	2023-04-03	2023-04-28	t	771
667	320	2023-09-10	2023-08-31	2023-07-18	t	863
668	803	2023-02-22	2023-05-05	2023-07-25	f	80
669	444	2023-06-11	2023-11-09	2023-10-04	t	165
670	188	2022-12-13	2023-09-17	2023-03-12	t	344
671	96	2023-09-01	2023-07-02	2023-07-15	f	135
672	705	2023-08-15	2023-06-29	2023-09-29	f	32
673	274	2023-06-10	2023-01-19	2023-05-08	f	155
674	776	2023-10-08	12023-01-03	2023-04-02	f	658
675	846	2023-05-23	2023-05-31	2023-07-08	t	106
676	891	2023-07-31	2023-05-16	2023-07-27	t	589
677	610	2023-01-02	2023-09-08	2023-04-29	f	244
678	84	2023-03-27	2023-08-26	2023-01-08	t	955
679	64	2022-12-21	2023-09-11	12023-01-23	f	690
680	165	2023-11-13	2023-05-23	2023-11-27	f	987
681	504	2023-05-05	2022-12-12	2023-01-20	f	649
682	96	2023-10-12	2023-03-08	2023-12-05	t	285
683	654	2023-02-05	2023-06-07	2023-01-19	f	562
684	356	2023-06-30	2023-03-30	12023-01-28	t	511
685	840	2023-02-15	2023-01-28	2023-06-27	f	423
686	137	2023-03-18	2023-07-25	2023-08-21	f	880
687	313	2023-09-08	2023-04-13	2023-04-14	t	513
688	669	2023-08-30	2023-11-09	2023-05-21	t	746
689	741	2023-07-20	2023-11-18	2023-08-21	t	320
690	754	2023-06-20	2023-09-02	2023-06-12	f	104
691	983	2023-03-24	2023-11-13	2023-06-05	t	453
692	46	2023-04-04	2022-12-16	2023-09-14	t	219
693	679	2023-07-14	2023-05-26	2022-12-09	f	702
694	804	2023-08-02	2022-12-17	2023-05-13	f	200
695	907	2023-10-14	12023-02-04	2023-01-09	t	541
696	964	12023-01-04	2023-01-08	2023-06-04	t	702
697	969	2023-08-15	12023-01-24	2023-02-26	f	605
698	536	2023-04-12	2023-04-16	2023-02-03	f	650
699	704	2023-05-14	2023-04-12	2023-08-16	t	944
700	977	2023-06-01	2023-03-17	2022-12-29	f	478
701	701	2023-08-24	2022-12-17	2023-11-13	f	586
702	457	2022-12-21	2023-02-13	2023-07-11	f	323
703	546	2023-08-15	2023-03-17	2023-08-04	t	881
704	638	2022-12-22	2023-08-18	12023-01-06	f	495
705	699	2023-01-16	2023-03-11	2023-10-30	f	742
706	922	2023-03-11	2023-08-10	2023-08-14	t	396
707	593	2023-10-13	2023-09-27	2023-04-23	f	876
708	144	2023-11-19	2023-03-07	2023-02-17	t	627
709	528	2023-02-06	12023-01-03	2023-03-14	t	577
710	195	2023-08-12	2023-07-05	2023-08-16	f	414
711	95	2023-07-23	2023-04-01	2023-11-09	t	632
712	515	2023-07-23	2023-11-13	2023-09-04	f	59
713	547	2023-01-16	2023-07-29	2023-10-01	f	514
714	34	2023-10-16	2023-01-09	2023-10-30	f	870
715	516	2023-07-11	2023-01-31	2023-04-01	t	458
716	156	12023-01-22	12023-01-16	2023-03-23	t	578
717	175	2023-09-04	2023-02-21	2023-02-07	f	752
718	403	12023-01-30	2023-03-28	2023-04-10	t	853
719	36	2023-04-23	2022-12-10	2023-09-30	t	931
720	335	2023-07-21	2023-09-26	2023-08-28	t	711
721	820	2023-08-06	2023-02-16	2023-10-07	f	689
722	754	2022-12-16	2023-04-22	12023-01-15	t	826
723	663	2023-03-21	2023-04-18	2023-05-11	f	201
724	325	2022-12-11	2023-09-26	2023-06-19	f	230
725	703	2023-07-09	2023-02-27	2022-12-25	f	17
726	237	2023-06-23	2023-09-11	2023-02-01	f	733
727	299	2023-03-01	2023-04-04	2023-05-31	f	439
728	509	2023-04-30	12023-02-01	12023-01-06	t	122
729	157	2023-10-21	2023-01-28	2022-12-28	t	355
730	30	2023-08-07	2023-01-25	2023-02-26	t	613
731	164	2023-10-27	2023-04-22	2023-07-05	f	701
732	795	2023-10-26	2023-10-18	2023-06-13	t	105
733	367	2023-09-26	2023-04-17	2023-02-17	t	297
734	585	2023-09-05	2023-02-16	2023-03-20	f	84
735	916	12023-01-12	2023-06-11	2023-03-16	t	764
736	94	2023-05-03	2023-09-22	2023-07-26	f	230
737	908	2023-04-21	2023-09-30	2023-10-01	f	441
738	263	2023-01-10	2023-02-26	2022-12-19	f	747
739	235	2023-01-19	2023-07-13	2023-04-12	f	122
740	8	2022-12-18	2023-02-05	2023-09-29	f	130
741	222	12023-01-30	2023-01-10	2023-09-17	t	838
742	857	2023-06-07	2023-04-25	2023-06-23	t	502
743	358	2023-11-05	2023-08-23	2023-03-27	f	800
744	669	2023-02-14	2023-04-17	2022-12-20	f	214
745	590	2023-05-19	2023-08-19	2023-03-09	t	995
746	791	2023-05-17	2023-04-11	2023-06-20	f	488
747	862	2023-02-08	2022-12-21	2023-07-14	t	451
748	707	12023-01-15	2023-09-21	2023-04-26	t	352
749	698	2023-10-22	2023-08-30	2023-09-25	t	473
750	738	2023-05-27	2023-06-24	2023-06-29	t	181
751	746	2023-09-18	2023-09-06	2023-08-22	t	195
752	972	2022-12-09	2023-04-02	2023-09-20	f	448
753	265	2023-05-14	2023-10-31	2023-09-08	t	404
754	121	2023-08-30	2023-04-01	2023-02-21	t	383
755	920	2023-08-04	2023-09-17	2023-03-19	t	661
756	395	2023-03-26	2023-04-05	2023-02-15	f	61
757	297	2023-10-29	2023-07-14	2023-07-15	t	14
758	96	2023-04-03	2023-03-10	2023-09-19	f	585
759	328	2023-01-04	2023-01-01	2023-03-28	t	488
760	456	2023-04-17	2023-04-20	2023-10-06	f	957
761	246	2023-12-03	2023-03-07	2023-09-11	t	778
762	452	2023-08-09	2022-12-18	2023-06-10	t	192
763	736	2023-04-03	2023-08-19	2023-04-12	t	471
764	320	2023-05-01	2023-07-13	2023-03-23	f	462
765	363	2023-04-04	2023-12-05	2023-01-24	t	895
766	688	2023-01-25	2023-04-29	2023-09-02	f	588
767	873	2023-09-26	2023-02-25	2023-07-25	t	726
768	803	2023-03-26	2023-03-07	2023-03-12	t	749
769	914	2023-10-04	2023-08-12	2022-12-12	f	743
770	616	2023-03-18	2023-06-03	2023-08-13	f	78
771	224	2023-06-21	2023-03-18	2023-10-27	t	225
772	474	2023-01-31	2022-12-24	2023-01-20	f	490
773	106	2023-02-03	2023-10-23	2023-06-09	f	740
774	403	2023-06-22	2023-08-08	2023-07-26	f	658
775	905	2023-05-12	2023-06-16	2023-04-14	f	80
776	125	2023-07-05	12023-01-12	2023-03-26	t	697
777	572	2023-10-16	2023-03-08	2023-01-02	t	434
778	746	2023-03-08	2022-12-31	2023-10-02	f	464
779	782	2023-04-08	2023-09-22	2023-04-01	f	183
780	248	2023-07-07	2023-01-07	2023-01-19	t	190
781	176	2023-03-14	2023-09-02	2023-01-09	t	654
782	948	2022-12-10	2023-09-05	2023-11-09	t	917
783	41	2023-07-17	2023-12-03	2023-11-25	t	442
784	806	2023-02-06	2023-01-05	2023-01-22	t	704
785	741	2023-10-24	2023-10-05	2023-08-04	t	53
786	142	2023-04-11	2023-09-29	2023-06-26	f	826
787	363	2022-12-22	2023-03-02	2023-08-11	t	341
788	155	2023-11-27	2023-04-14	2023-08-25	f	955
789	529	2023-03-13	2023-10-12	2023-09-15	t	979
790	13	2023-04-29	2023-08-24	2023-10-08	f	91
791	799	2023-03-17	12023-01-14	2023-09-06	t	837
792	523	2023-09-03	2023-05-30	2023-11-18	f	910
793	675	2023-06-25	2023-05-07	2023-01-28	f	427
794	421	2023-07-31	2023-09-24	2023-05-23	t	746
795	663	2023-04-26	2023-06-10	2023-06-24	t	394
796	979	2023-05-24	2023-08-19	2023-02-27	t	969
797	59	2023-05-31	2023-11-09	2023-10-05	t	802
798	17	2023-07-02	2022-12-09	2023-07-27	t	1
799	127	2023-04-07	2023-10-13	2023-06-09	f	297
800	756	2023-06-07	2023-02-14	2023-08-21	f	185
801	915	2023-10-01	2023-01-21	2023-02-27	t	224
802	428	2022-12-07	2023-07-07	2023-02-07	t	451
803	842	2023-10-04	12023-01-16	2023-01-09	f	580
804	333	2022-12-26	2023-03-10	2023-02-01	f	137
805	844	2022-12-29	2023-06-30	2023-01-25	f	524
806	736	2023-03-16	2023-04-11	2023-04-20	t	518
807	111	2022-12-16	2023-03-23	2023-06-27	t	556
808	823	2023-04-10	2023-01-03	2023-07-20	t	174
809	534	2023-10-30	2023-08-02	2023-01-02	t	462
810	349	12023-01-24	2023-06-20	2023-04-17	f	437
811	48	2023-01-08	2023-08-28	2023-02-12	t	128
812	830	2022-12-24	2023-08-01	2023-06-24	t	847
813	89	2023-02-26	2023-08-04	2023-03-26	t	492
814	160	2023-02-04	2023-05-01	2023-06-13	t	65
815	174	2023-08-07	2023-11-11	2023-12-02	f	496
816	671	2023-11-11	2023-10-06	2023-11-05	t	304
817	741	12023-01-29	2023-12-05	2023-08-05	f	441
818	656	2023-05-23	2023-07-01	2023-03-02	t	926
819	671	2023-01-06	2023-02-19	2023-11-11	t	608
820	251	2023-10-11	2023-03-15	2022-12-20	f	804
821	487	2023-03-04	2022-12-08	2023-10-02	t	955
822	257	2023-08-30	2023-04-30	2023-10-31	f	100
823	284	2023-01-19	2023-09-26	2022-12-29	t	427
824	780	2023-03-30	2023-07-10	2022-12-27	t	669
825	531	2023-05-09	2023-05-04	2023-03-13	t	531
826	404	2023-06-27	2023-09-19	2022-12-20	t	306
827	750	2023-04-05	2023-02-26	2023-01-21	t	710
828	961	2023-02-19	2023-02-16	2023-05-16	t	837
829	413	2023-02-18	2023-02-08	2023-05-14	t	928
830	542	2023-10-15	2023-03-26	2023-08-10	t	401
831	898	2023-02-22	2023-11-21	2023-03-06	f	71
832	921	12023-01-14	2023-09-02	2023-12-03	f	599
833	33	2023-08-16	2023-05-19	2023-07-05	f	672
834	33	2023-05-29	2023-09-11	2023-02-20	t	132
835	488	2023-04-24	2023-04-01	2023-05-08	t	256
836	684	2023-05-08	2023-07-05	2023-09-17	f	850
837	224	2023-08-21	2023-02-20	2023-04-19	f	547
838	462	2023-01-19	2022-12-16	2023-09-28	f	221
839	118	2023-06-23	2023-06-11	2023-09-08	t	272
840	677	2023-06-24	2023-01-27	2023-08-10	f	253
841	799	2023-03-21	2023-03-11	2023-05-11	t	513
842	91	2023-05-22	2023-05-12	2023-10-21	f	383
843	697	2023-12-02	2023-06-22	2023-03-02	f	872
844	524	2023-01-20	2023-03-09	12023-02-04	f	304
845	917	2023-09-11	2022-12-19	2023-10-12	t	289
846	608	2023-10-08	2023-06-24	2023-01-20	f	277
847	855	2023-07-01	2023-05-14	2023-01-13	f	695
848	439	2023-10-14	2023-06-20	2023-01-07	t	524
849	512	2023-08-01	2023-03-20	2023-01-27	f	576
850	231	2023-09-18	2023-07-13	2023-07-30	f	304
851	943	2023-11-11	2023-02-16	2022-12-29	t	896
852	518	2023-09-11	2023-07-29	2023-09-30	f	892
853	480	2023-04-27	2023-02-16	2023-05-17	t	625
854	768	2023-12-02	2023-01-24	2023-03-21	f	524
855	275	12023-01-10	2023-03-22	2023-04-26	t	540
856	38	2023-11-11	2022-12-09	2023-03-20	f	292
857	465	2023-02-11	2022-12-21	2023-10-07	f	424
858	462	2023-09-27	2023-07-17	2023-07-04	f	741
859	632	2023-11-11	2023-03-25	2023-08-30	t	62
860	664	2023-09-22	2023-11-05	2023-09-13	t	146
861	934	2023-01-12	2023-08-27	2023-02-27	t	595
862	850	2023-11-17	2023-08-13	2023-03-30	f	129
863	294	2023-09-07	2023-04-13	2023-02-05	f	637
864	589	2023-02-09	2023-06-07	2023-10-03	f	342
865	482	2023-04-25	2023-06-10	2023-05-19	t	766
866	955	12023-01-16	2023-01-08	2023-08-14	t	605
867	650	2023-01-21	2023-04-07	2023-01-24	t	858
868	316	2023-01-15	2023-10-05	2023-11-19	f	498
869	6	2023-11-19	2023-04-13	2023-10-28	f	455
870	531	12023-01-06	2023-06-05	2023-01-17	f	241
871	595	12023-01-30	2023-11-17	2023-04-21	t	871
872	608	2023-01-15	2023-07-22	2023-07-19	t	619
873	104	2023-06-04	2023-04-18	2023-06-26	t	508
874	179	2023-02-09	2023-03-11	2023-01-13	t	866
875	362	2023-01-20	12023-01-06	2023-02-24	t	98
876	334	12023-01-03	2023-09-19	2023-05-15	t	739
877	843	2023-01-05	2023-02-08	2023-06-20	f	30
878	424	2023-10-23	2023-06-16	2023-01-23	f	120
879	852	2023-08-30	2023-07-30	2023-05-28	f	601
880	875	2023-09-26	2022-12-11	2023-02-12	t	534
881	648	2023-08-15	2023-06-11	2023-04-17	t	833
882	453	2023-02-10	2023-09-10	2023-03-13	t	487
883	34	2022-12-18	2023-04-28	2023-08-20	t	889
884	300	2023-03-14	2023-02-22	2023-02-14	f	697
885	8	2022-12-19	2023-03-31	2023-06-24	f	614
886	241	2023-06-30	2023-10-23	2023-06-10	t	622
887	61	2023-10-09	2023-06-21	2023-01-13	f	637
888	598	2023-03-15	2023-10-25	2023-01-12	t	180
889	248	12023-01-15	2023-01-22	2023-03-14	t	854
890	496	2023-10-22	2023-01-17	2023-07-20	t	884
891	945	2023-09-07	2023-08-24	2023-11-09	t	828
892	210	2022-12-26	12023-02-04	2023-09-21	f	829
893	267	2023-09-25	2023-09-06	2023-03-08	t	739
894	548	2023-10-08	2023-07-26	2023-03-10	f	39
895	423	2023-04-01	2023-05-09	2023-03-19	f	778
896	496	2023-03-19	2023-07-11	2023-02-05	f	975
897	744	2023-05-27	2023-03-22	2023-09-29	t	515
898	968	2023-10-09	2023-02-11	2023-08-27	t	531
899	39	2023-02-20	2023-06-13	2023-02-22	t	318
900	656	2023-09-11	2023-04-21	2023-10-28	t	123
901	956	12023-01-02	2023-10-18	2023-05-30	f	221
902	335	2023-06-10	2023-09-18	2023-05-30	f	499
903	873	2023-09-30	2023-09-14	2023-01-26	f	667
904	319	2023-02-26	2023-04-05	12023-01-24	f	602
905	326	2023-06-02	2023-03-11	2023-05-26	t	14
906	442	2023-02-12	2023-10-11	2023-07-01	f	392
907	15	2023-07-27	2023-02-06	2023-10-18	t	150
908	646	2023-10-31	2023-10-18	2023-05-19	f	533
909	373	2023-01-11	2023-05-27	2023-07-01	f	155
910	227	2023-07-27	12023-01-10	2023-10-13	f	418
911	846	2023-02-06	2023-07-18	2023-07-05	t	823
912	135	2023-05-17	2023-01-04	2023-04-20	t	12
913	807	2023-06-12	2023-04-05	2023-06-01	f	770
914	664	2023-08-17	12023-01-12	2023-10-31	f	822
915	20	2023-06-11	12023-01-01	2023-04-13	t	387
916	170	2023-07-24	2023-03-19	2023-06-20	t	791
917	907	2023-08-13	2023-09-08	2023-10-24	t	275
918	234	2023-05-11	2023-09-18	2023-04-27	f	806
919	492	2023-03-17	2023-10-10	2023-07-08	f	51
920	735	2023-08-09	2023-11-07	2023-08-27	t	560
921	320	2023-08-11	2023-07-27	2023-09-22	f	4
922	739	12023-02-01	12023-01-30	2023-07-29	f	345
923	401	2023-04-11	2023-01-17	2023-05-31	t	841
924	665	2023-04-08	2023-04-19	2023-01-16	f	871
925	338	2023-03-12	2023-03-10	2023-07-14	t	385
926	84	2023-02-26	2023-07-26	2023-01-21	f	10
927	337	2023-06-28	2023-02-27	2023-07-18	f	523
928	760	2023-04-13	2023-09-10	2023-04-09	f	864
929	661	2023-09-13	2023-05-31	2023-09-16	f	994
930	913	2023-11-05	2023-09-20	2023-02-07	f	519
931	81	12023-01-06	2023-06-16	2023-04-06	f	457
932	802	2023-09-18	2023-07-06	2023-05-11	t	884
933	659	2022-12-27	2023-08-27	2023-08-20	t	995
934	772	2023-10-17	2023-10-03	2023-12-02	f	782
935	642	12023-01-14	2023-03-16	2022-12-09	f	156
936	480	12023-01-28	2023-04-01	2023-09-28	t	665
937	595	2023-10-26	2023-06-05	2023-05-27	f	509
938	676	2023-06-20	2023-01-12	2023-07-29	f	706
939	344	2023-07-16	2023-02-13	2023-08-15	t	231
940	24	2023-09-05	2023-01-14	2023-08-06	t	934
941	904	2022-12-16	2023-07-05	2023-02-26	t	11
942	323	2023-01-22	2023-05-22	2023-08-01	t	952
943	39	2023-07-03	2023-07-07	2023-07-28	t	255
944	571	2023-11-27	2023-01-16	12023-01-12	f	344
945	938	2023-09-05	2023-07-19	2023-09-09	f	475
946	411	2023-07-01	2023-11-09	2023-01-15	t	773
947	136	2022-12-29	2023-06-25	2023-08-16	f	339
948	761	2023-02-28	2023-02-08	2023-07-27	t	237
949	55	2023-06-21	2023-04-01	2023-12-03	f	983
950	698	2023-01-19	2023-02-11	2023-06-23	f	242
951	445	2023-11-21	2023-06-09	12023-02-06	t	14
952	53	2023-01-01	2023-10-10	2023-05-06	t	437
953	47	2023-04-02	2023-03-21	2023-10-11	t	528
954	458	2023-10-25	2023-02-28	2023-07-24	f	575
955	142	2023-08-03	2023-02-19	2023-07-31	t	154
956	804	2023-03-20	2023-08-22	2023-05-04	t	120
957	318	2023-11-07	2023-06-23	2023-02-19	t	843
958	917	2023-02-18	2023-10-13	2023-06-16	t	149
959	682	2022-12-14	2023-05-15	2023-10-08	f	100
960	585	2023-01-04	2023-05-01	2023-10-09	t	319
961	676	2023-05-02	2023-03-02	2022-12-08	f	546
962	882	12023-01-28	2023-06-13	2023-08-12	t	854
963	555	2023-09-08	2022-12-23	2023-07-03	f	750
964	945	2023-04-21	2023-06-06	2023-08-06	f	890
965	25	12023-01-01	2023-10-26	2023-02-17	t	591
966	514	2023-09-07	2023-03-22	2022-12-31	f	504
967	746	2023-03-11	2023-09-12	2023-08-12	f	348
968	453	2023-04-25	2023-06-19	2023-08-23	f	714
969	698	2023-08-13	2023-09-19	2023-01-05	f	930
970	717	2023-01-29	12023-01-03	2023-02-27	f	934
971	196	2023-08-13	2023-01-15	2023-09-07	t	702
972	536	2023-09-07	2023-09-20	12023-02-04	f	391
973	775	2023-10-05	2023-06-25	2022-12-28	f	124
974	730	2023-05-15	2023-05-26	2023-06-17	t	55
975	916	2023-05-25	2023-02-22	2023-01-09	t	384
976	497	2023-05-23	2023-06-20	2023-03-18	t	719
977	24	2023-08-08	2023-08-16	2023-07-28	t	187
978	422	2023-07-18	12023-01-24	2023-01-03	f	614
979	711	2023-07-30	2023-05-01	2023-03-16	t	833
980	574	2023-01-04	2023-03-04	2023-04-20	f	570
981	50	2023-01-29	2023-05-18	2023-08-11	t	687
982	778	12023-01-12	2023-03-18	2023-06-16	t	894
983	70	2023-02-11	2023-01-22	2023-04-04	t	258
984	137	2023-10-09	2022-12-20	2023-03-06	t	21
985	419	2023-04-16	2023-04-23	12023-01-01	t	333
986	97	2023-07-28	2023-04-22	2023-04-01	t	533
987	533	2023-02-11	2023-06-23	2023-10-29	t	678
988	786	12023-02-01	2023-05-13	2023-02-27	f	74
989	62	12023-01-03	2023-08-07	2023-06-11	f	893
990	627	2023-02-17	2023-02-12	2023-12-02	f	374
991	880	2023-09-15	2023-10-11	2023-09-06	f	368
992	912	2023-09-20	2023-10-13	2023-02-12	t	806
993	662	2023-02-09	2023-03-04	2022-12-29	t	697
994	965	2023-01-14	2023-10-02	2023-05-09	f	570
995	252	2023-10-20	2023-01-20	2023-04-12	f	438
996	439	2023-07-28	2023-10-26	2023-02-25	t	971
997	837	2023-01-15	2023-07-19	2023-04-19	t	865
998	444	2023-04-16	2023-02-18	2023-03-07	t	726
999	333	2023-03-02	12023-01-28	2023-05-09	f	740
1000	541	2023-01-15	2023-09-28	2023-06-16	t	123
\.


--
-- TOC entry 4872 (class 0 OID 16468)
-- Dependencies: 218
-- Data for Name: copy_of_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.copy_of_book (id_copy_of_book, availability, id_publication, condition) FROM stdin;
1	t	397	Very Good
2	f	464	Fair
3	t	384	Good
4	t	525	Fair
5	t	212	Poor
6	f	93	Poor
7	t	453	Very Good
8	t	36	Very Good
9	f	73	Good
10	f	96	Poor
11	f	673	Like New
12	f	584	Very Good
13	t	624	Fair
14	f	397	Very Good
15	f	98	Fair
16	t	233	Fair
17	f	633	Poor
18	t	227	Very Good
19	f	309	Very Good
20	t	398	Like New
21	f	377	Like New
22	t	36	Very Good
23	f	21	Good
24	f	255	Poor
25	f	391	Like New
26	f	689	Fair
27	t	287	Good
28	t	53	Very Good
29	t	670	Very Good
30	t	648	Very Good
31	f	284	Fair
32	t	262	Very Good
33	t	607	Good
34	t	685	Poor
35	f	680	Like New
36	f	604	Good
37	t	140	Good
38	t	135	Like New
39	f	395	Like New
40	t	256	Like New
41	f	165	Fair
42	t	514	Good
43	f	534	Very Good
44	t	441	Poor
45	f	101	Very Good
46	f	97	Like New
47	f	234	Very Good
48	f	669	Like New
49	t	681	Very Good
50	t	21	Fair
51	t	93	Poor
52	f	269	Like New
53	f	187	Poor
54	f	459	Poor
55	t	176	Like New
56	t	224	Good
57	t	554	Poor
58	f	76	Fair
59	f	585	Like New
60	f	613	Very Good
61	f	344	Very Good
62	f	293	Good
63	t	636	Very Good
64	t	235	Poor
65	t	166	Poor
66	f	335	Fair
67	t	511	Poor
68	f	2	Like New
69	t	652	Like New
70	t	561	Like New
71	f	415	Poor
72	f	536	Very Good
73	f	472	Like New
74	t	403	Fair
75	t	519	Fair
76	f	171	Poor
77	t	477	Good
78	t	514	Very Good
79	t	393	Poor
80	f	437	Fair
81	t	689	Very Good
82	f	128	Fair
83	t	77	Very Good
84	t	327	Fair
85	t	659	Very Good
86	t	382	Fair
87	t	178	Poor
88	t	186	Very Good
89	t	193	Poor
90	t	272	Good
91	t	503	Very Good
92	f	432	Very Good
93	f	694	Fair
94	f	87	Good
95	t	384	Like New
96	f	250	Good
97	t	186	Very Good
98	f	511	Fair
99	f	685	Very Good
100	f	371	Good
101	f	600	Good
102	t	637	Poor
103	t	681	Poor
104	f	191	Like New
105	f	48	Good
106	f	460	Fair
107	f	588	Fair
108	t	399	Good
109	t	446	Good
110	f	689	Good
111	t	606	Like New
112	t	429	Fair
113	f	178	Poor
114	f	605	Like New
115	f	606	Like New
116	t	302	Like New
117	f	548	Fair
118	t	81	Poor
119	f	4	Fair
120	f	411	Good
121	t	266	Poor
122	f	409	Good
123	f	332	Poor
124	f	636	Fair
125	f	195	Very Good
126	f	295	Fair
127	t	58	Fair
128	t	148	Good
129	f	236	Like New
130	t	666	Very Good
131	t	502	Fair
132	f	421	Like New
133	f	134	Very Good
134	t	411	Good
135	t	416	Like New
136	f	133	Good
137	f	36	Good
138	f	214	Good
139	t	617	Poor
140	t	85	Good
141	t	549	Poor
142	t	482	Fair
143	f	493	Fair
144	f	676	Fair
145	t	247	Good
146	t	637	Poor
147	f	184	Like New
148	f	178	Good
149	f	302	Good
150	f	156	Very Good
151	t	390	Poor
152	f	650	Fair
153	t	615	Very Good
154	t	333	Very Good
155	t	649	Poor
156	f	645	Like New
157	t	506	Fair
158	f	259	Like New
159	f	107	Poor
160	f	684	Poor
161	f	467	Like New
162	t	536	Poor
163	f	553	Very Good
164	t	644	Poor
165	f	146	Like New
166	t	272	Good
167	f	144	Fair
168	t	187	Very Good
169	t	139	Fair
170	t	588	Good
171	f	99	Fair
172	t	131	Good
173	t	482	Good
174	t	68	Like New
175	f	1	Like New
176	t	82	Good
177	t	158	Good
178	t	700	Good
179	f	378	Poor
180	f	589	Poor
181	t	22	Very Good
182	f	396	Good
183	t	516	Poor
184	t	367	Poor
185	t	601	Like New
186	t	127	Fair
187	t	695	Very Good
188	f	39	Good
189	f	30	Poor
190	t	377	Like New
191	t	662	Good
192	f	423	Poor
193	t	495	Good
194	f	561	Good
195	f	85	Like New
196	t	79	Fair
197	f	368	Very Good
198	f	295	Good
199	f	697	Like New
200	t	434	Poor
201	t	242	Poor
202	t	493	Like New
203	f	80	Good
204	f	591	Good
205	t	174	Fair
206	t	73	Very Good
207	t	244	Good
208	t	372	Poor
209	t	65	Good
210	f	361	Poor
211	f	308	Fair
212	f	292	Like New
213	f	525	Like New
214	t	506	Good
215	f	66	Good
216	t	659	Like New
217	t	559	Good
218	t	377	Good
219	f	510	Like New
220	f	558	Like New
221	f	371	Poor
222	f	120	Like New
223	t	565	Very Good
224	f	79	Fair
225	t	486	Very Good
226	f	198	Good
227	t	464	Good
228	t	300	Fair
229	f	137	Fair
230	t	316	Very Good
231	t	376	Like New
232	t	153	Good
233	f	518	Very Good
234	t	313	Like New
235	f	86	Poor
236	t	121	Good
237	f	668	Very Good
238	f	556	Poor
239	t	154	Fair
240	t	406	Very Good
241	t	539	Good
242	f	651	Very Good
243	t	26	Like New
244	t	477	Poor
245	f	80	Fair
246	t	258	Poor
247	f	290	Good
248	f	414	Good
249	f	66	Fair
250	t	70	Like New
251	t	168	Very Good
252	t	183	Good
253	f	170	Good
254	t	35	Poor
255	f	134	Poor
256	f	652	Good
257	t	221	Like New
258	t	465	Good
259	f	19	Fair
260	f	645	Good
261	t	34	Poor
262	t	260	Like New
263	t	677	Fair
264	f	137	Poor
265	f	210	Poor
266	f	169	Fair
267	f	478	Very Good
268	f	584	Fair
269	f	132	Like New
270	t	312	Poor
271	t	683	Poor
272	t	77	Like New
273	t	224	Good
274	t	603	Good
275	t	268	Like New
276	t	252	Poor
277	t	375	Like New
278	t	325	Good
279	f	610	Very Good
280	f	80	Good
281	f	573	Poor
282	t	466	Like New
283	f	575	Very Good
284	f	696	Like New
285	f	299	Very Good
286	t	427	Very Good
287	f	574	Fair
288	t	242	Poor
289	t	360	Poor
290	f	443	Fair
291	t	654	Very Good
292	f	33	Fair
293	t	605	Like New
294	f	532	Fair
295	f	215	Like New
296	t	215	Very Good
297	f	314	Poor
298	f	270	Good
299	t	674	Like New
300	f	61	Poor
301	t	560	Fair
302	t	593	Fair
303	f	399	Good
304	t	402	Like New
305	t	342	Very Good
306	f	180	Very Good
307	f	141	Very Good
308	f	269	Good
309	t	72	Very Good
310	t	232	Fair
311	t	630	Good
312	f	332	Very Good
313	t	321	Fair
314	f	28	Good
315	f	54	Very Good
316	t	611	Very Good
317	f	188	Like New
318	t	659	Like New
319	t	658	Poor
320	t	307	Like New
321	f	207	Good
322	f	656	Good
323	t	473	Fair
324	f	35	Very Good
325	t	173	Poor
326	t	436	Very Good
327	t	433	Very Good
328	t	488	Fair
329	f	629	Very Good
330	t	533	Very Good
331	f	80	Like New
332	t	684	Like New
333	f	688	Fair
334	f	603	Good
335	t	272	Poor
336	f	320	Good
337	t	630	Poor
338	f	237	Fair
339	f	335	Like New
340	t	489	Fair
341	t	105	Fair
342	f	456	Fair
343	f	205	Good
344	t	103	Poor
345	t	405	Good
346	f	559	Poor
347	t	461	Like New
348	f	21	Fair
349	f	600	Fair
350	t	685	Like New
351	f	415	Very Good
352	f	339	Good
353	f	39	Like New
354	t	222	Poor
355	t	225	Good
356	f	413	Poor
357	t	8	Very Good
358	t	181	Like New
359	f	242	Poor
360	f	130	Very Good
361	t	604	Poor
362	f	688	Poor
363	f	7	Poor
364	t	504	Very Good
365	t	19	Good
366	t	313	Very Good
367	f	591	Fair
368	f	5	Fair
369	f	664	Good
370	f	584	Fair
371	t	688	Fair
372	t	170	Like New
373	t	118	Poor
374	t	237	Fair
375	t	361	Fair
376	t	411	Like New
377	t	352	Poor
378	t	377	Like New
379	t	129	Like New
380	f	4	Poor
381	f	442	Fair
382	t	324	Very Good
383	f	277	Like New
384	f	640	Good
385	t	58	Fair
386	t	474	Good
387	t	35	Like New
388	t	321	Very Good
389	t	594	Fair
390	f	214	Poor
391	t	350	Fair
392	f	129	Fair
393	f	403	Poor
394	t	388	Like New
395	f	451	Like New
396	t	404	Good
397	t	126	Very Good
398	t	230	Like New
399	f	62	Poor
400	t	322	Good
401	t	201	Fair
402	t	181	Good
403	f	280	Good
404	t	342	Like New
405	t	396	Fair
406	t	294	Like New
407	t	517	Good
408	t	249	Very Good
409	t	256	Very Good
410	f	642	Fair
411	f	195	Fair
412	f	302	Good
413	f	589	Fair
414	t	636	Poor
415	t	545	Poor
416	f	215	Poor
417	f	106	Poor
418	f	60	Poor
419	t	86	Very Good
420	f	428	Poor
421	t	521	Very Good
422	t	130	Very Good
423	t	356	Very Good
424	f	127	Like New
425	f	391	Good
426	t	132	Like New
427	f	385	Very Good
428	t	259	Fair
429	t	368	Very Good
430	f	643	Fair
431	f	682	Like New
432	f	669	Very Good
433	t	439	Fair
434	f	55	Very Good
435	f	495	Fair
436	f	623	Fair
437	t	437	Poor
438	f	608	Like New
439	t	264	Good
440	f	689	Poor
441	f	112	Fair
442	t	373	Fair
443	t	480	Like New
444	f	479	Like New
445	t	466	Fair
446	f	89	Good
447	f	99	Very Good
448	t	350	Fair
449	f	441	Fair
450	f	36	Good
451	f	647	Good
452	f	185	Very Good
453	f	607	Very Good
454	f	16	Poor
455	t	489	Good
456	t	162	Fair
457	f	659	Fair
458	t	362	Poor
459	f	623	Poor
460	f	581	Fair
461	f	199	Fair
462	t	172	Good
463	t	96	Like New
464	f	574	Fair
465	t	38	Fair
466	f	478	Good
467	t	606	Like New
468	t	107	Poor
469	t	600	Good
470	t	115	Fair
471	t	159	Fair
472	t	542	Very Good
473	t	106	Like New
474	t	143	Very Good
475	f	149	Poor
476	t	248	Poor
477	f	243	Fair
478	f	520	Good
479	f	630	Good
480	f	515	Good
481	f	222	Good
482	t	265	Fair
483	t	500	Fair
484	t	133	Very Good
485	f	476	Fair
486	t	394	Very Good
487	f	185	Fair
488	t	440	Good
489	f	667	Fair
490	t	200	Good
491	t	658	Good
492	f	513	Good
493	t	305	Very Good
494	f	219	Poor
495	t	496	Fair
496	f	670	Good
497	t	602	Good
498	f	488	Like New
499	t	265	Like New
500	t	361	Like New
501	t	80	Poor
502	f	245	Very Good
503	t	318	Poor
504	t	167	Fair
505	f	92	Fair
506	f	392	Like New
507	f	117	Poor
508	f	276	Poor
509	f	5	Fair
510	f	489	Very Good
511	f	490	Good
512	f	372	Poor
513	f	630	Good
514	f	437	Poor
515	f	442	Very Good
516	f	459	Very Good
517	t	676	Good
518	f	346	Fair
519	t	60	Like New
520	f	649	Poor
521	t	65	Fair
522	t	27	Like New
523	f	261	Fair
524	t	331	Very Good
525	f	225	Poor
526	t	43	Poor
527	t	555	Like New
528	f	107	Like New
529	f	482	Like New
530	t	287	Poor
531	t	643	Good
532	f	119	Fair
533	t	352	Fair
534	f	538	Very Good
535	t	430	Very Good
536	t	671	Poor
537	t	360	Like New
538	f	552	Very Good
539	f	42	Good
540	t	102	Poor
541	t	104	Poor
542	t	310	Like New
543	f	483	Poor
544	t	283	Like New
545	f	257	Like New
546	t	118	Poor
547	t	181	Poor
548	t	46	Good
549	f	655	Good
550	t	454	Good
551	f	48	Poor
552	t	502	Poor
553	f	656	Good
554	t	270	Very Good
555	t	413	Like New
556	f	211	Good
557	f	256	Good
558	t	123	Very Good
559	f	85	Good
560	t	34	Good
561	f	648	Like New
562	t	192	Very Good
563	t	95	Like New
564	f	673	Fair
565	f	73	Poor
566	t	605	Poor
567	f	289	Good
568	f	178	Very Good
569	t	44	Fair
570	f	698	Like New
571	t	13	Like New
572	t	94	Poor
573	t	180	Poor
574	f	311	Fair
575	t	30	Like New
576	f	515	Fair
577	t	320	Fair
578	f	182	Like New
579	f	84	Poor
580	t	644	Good
581	t	699	Good
582	f	551	Like New
583	t	429	Fair
584	t	677	Good
585	t	453	Fair
586	t	315	Fair
587	f	141	Like New
588	t	585	Like New
589	f	545	Very Good
590	t	385	Like New
591	f	244	Very Good
592	t	418	Fair
593	f	145	Very Good
594	f	277	Fair
595	f	568	Very Good
596	t	349	Fair
597	f	605	Poor
598	f	628	Very Good
599	t	602	Very Good
600	t	200	Good
601	t	59	Fair
602	t	159	Like New
603	f	333	Very Good
604	t	184	Very Good
605	f	198	Poor
606	f	116	Fair
607	t	391	Very Good
608	t	183	Good
609	f	439	Fair
610	t	526	Fair
611	f	45	Very Good
612	t	333	Good
613	t	297	Fair
614	f	554	Good
615	f	531	Very Good
616	t	130	Fair
617	t	566	Like New
618	t	539	Fair
619	t	178	Poor
620	t	435	Like New
621	t	450	Fair
622	f	287	Good
623	t	441	Good
624	t	231	Like New
625	t	286	Like New
626	t	219	Very Good
627	f	670	Like New
628	t	670	Very Good
629	t	567	Very Good
630	t	128	Very Good
631	f	661	Fair
632	t	700	Very Good
633	f	143	Like New
634	f	583	Fair
635	f	664	Good
636	t	266	Like New
637	t	363	Very Good
638	t	313	Good
639	f	254	Poor
640	t	146	Fair
641	f	238	Like New
642	t	419	Good
643	f	323	Like New
644	f	311	Very Good
645	f	146	Fair
646	f	617	Very Good
647	f	622	Fair
648	t	596	Like New
649	t	114	Fair
650	f	321	Poor
651	f	231	Very Good
652	f	110	Good
653	f	687	Like New
654	f	149	Very Good
655	f	438	Good
656	f	535	Like New
657	t	86	Poor
658	t	466	Like New
659	t	231	Like New
660	t	678	Poor
661	t	674	Very Good
662	f	89	Fair
663	f	179	Fair
664	f	422	Very Good
665	t	277	Very Good
666	f	181	Very Good
667	f	551	Like New
668	t	345	Fair
669	f	582	Very Good
670	t	534	Very Good
671	t	463	Poor
672	f	234	Like New
673	f	691	Poor
674	t	489	Good
675	t	461	Very Good
676	f	415	Like New
677	f	99	Like New
678	t	314	Good
679	t	158	Like New
680	f	478	Good
681	f	490	Good
682	f	668	Good
683	f	228	Poor
684	f	671	Like New
685	t	673	Like New
686	t	236	Like New
687	f	60	Good
688	t	276	Good
689	f	138	Like New
690	t	60	Poor
691	t	453	Like New
692	f	179	Fair
693	f	322	Fair
694	t	656	Good
695	t	648	Fair
696	t	203	Poor
697	t	115	Good
698	f	209	Good
699	f	74	Like New
700	t	262	Fair
701	t	390	Good
702	f	556	Very Good
703	t	515	Good
704	f	515	Poor
705	t	399	Like New
706	t	501	Like New
707	f	44	Like New
708	t	696	Very Good
709	t	648	Fair
710	t	53	Poor
711	t	322	Like New
712	t	465	Fair
713	f	39	Very Good
714	t	519	Very Good
715	f	124	Fair
716	f	618	Like New
717	t	216	Poor
718	t	669	Very Good
719	f	81	Poor
720	t	555	Very Good
721	f	198	Fair
722	f	335	Good
723	f	661	Like New
724	t	148	Fair
725	f	460	Poor
726	t	40	Poor
727	t	108	Poor
728	f	289	Poor
729	t	566	Very Good
730	t	553	Like New
731	f	167	Very Good
732	t	502	Poor
733	f	28	Poor
734	t	230	Poor
735	f	698	Poor
736	t	501	Poor
737	t	380	Fair
738	f	674	Good
739	f	258	Good
740	f	610	Good
741	f	423	Very Good
742	t	195	Fair
743	t	537	Good
744	f	187	Good
745	t	260	Poor
746	f	404	Like New
747	f	125	Fair
748	f	254	Like New
749	t	400	Fair
750	f	513	Like New
751	f	319	Good
752	f	626	Poor
753	f	615	Fair
754	f	480	Good
755	t	3	Fair
756	f	350	Poor
757	f	339	Good
758	f	693	Good
759	f	648	Fair
760	f	174	Good
761	t	11	Very Good
762	f	53	Good
763	f	239	Good
764	f	560	Poor
765	f	70	Very Good
766	f	159	Like New
767	t	350	Fair
768	f	348	Fair
769	t	671	Fair
770	t	111	Fair
771	f	274	Poor
772	t	337	Good
773	t	311	Good
774	f	159	Like New
775	f	424	Poor
776	t	659	Like New
777	t	191	Good
778	t	562	Poor
779	f	509	Poor
780	f	214	Good
781	f	566	Very Good
782	f	295	Good
783	t	227	Fair
784	t	111	Like New
785	f	206	Fair
786	f	444	Like New
787	f	567	Very Good
788	f	133	Fair
789	f	569	Fair
790	f	289	Like New
791	f	394	Poor
792	f	1	Like New
793	f	26	Like New
794	t	427	Good
795	f	560	Very Good
796	t	204	Like New
797	t	407	Fair
798	t	366	Like New
799	t	172	Very Good
800	f	305	Very Good
801	t	536	Like New
802	f	21	Like New
803	t	594	Like New
804	f	591	Poor
805	f	118	Fair
806	f	244	Like New
807	t	600	Like New
808	f	273	Like New
809	t	383	Very Good
810	f	428	Very Good
811	t	56	Fair
812	f	74	Poor
813	t	101	Good
814	t	54	Poor
815	f	55	Good
816	f	31	Like New
817	f	486	Good
818	t	51	Fair
819	t	108	Poor
820	f	533	Like New
821	f	647	Poor
822	f	214	Poor
823	f	601	Fair
824	t	4	Fair
825	f	405	Fair
826	t	71	Poor
827	t	618	Like New
828	t	262	Very Good
829	f	305	Like New
830	t	272	Good
831	t	490	Fair
832	f	224	Good
833	f	224	Good
834	t	529	Like New
835	f	372	Very Good
836	f	87	Poor
837	f	568	Good
838	f	2	Good
839	f	292	Fair
840	t	7	Very Good
841	t	311	Poor
842	t	7	Like New
843	f	190	Poor
844	f	409	Poor
845	f	349	Like New
846	f	363	Poor
847	t	218	Like New
848	f	195	Like New
849	t	332	Poor
850	f	2	Very Good
851	t	499	Fair
852	t	170	Very Good
853	f	501	Like New
854	t	237	Fair
855	t	105	Good
856	f	232	Like New
857	f	361	Very Good
858	f	297	Fair
859	t	482	Like New
860	t	240	Good
861	t	6	Very Good
862	f	513	Good
863	t	464	Like New
864	f	246	Fair
865	f	305	Fair
866	t	547	Very Good
867	f	379	Poor
868	f	117	Like New
869	f	206	Poor
870	t	4	Poor
871	t	43	Very Good
872	t	391	Very Good
873	t	114	Like New
874	f	365	Very Good
875	t	310	Good
876	t	633	Good
877	t	377	Very Good
878	t	580	Poor
879	t	683	Poor
880	t	127	Good
881	t	288	Very Good
882	t	699	Fair
883	f	312	Poor
884	f	213	Very Good
885	f	466	Good
886	t	672	Good
887	f	380	Like New
888	t	272	Fair
889	f	149	Fair
890	f	261	Poor
891	f	574	Good
892	f	119	Good
893	f	401	Poor
894	f	115	Fair
895	f	320	Good
896	f	185	Good
897	t	256	Fair
898	f	553	Very Good
899	t	466	Very Good
900	t	463	Like New
901	t	650	Poor
902	t	150	Good
903	f	130	Poor
904	t	411	Very Good
905	f	355	Poor
906	t	284	Very Good
907	t	419	Like New
908	t	561	Very Good
909	t	355	Like New
910	f	37	Very Good
911	f	352	Fair
912	t	492	Poor
913	t	692	Poor
914	f	691	Very Good
915	f	538	Very Good
916	t	252	Fair
917	f	130	Fair
918	t	497	Good
919	f	422	Poor
920	f	597	Good
921	f	138	Very Good
922	f	379	Like New
923	f	572	Good
924	f	123	Very Good
925	t	55	Poor
926	t	608	Very Good
927	f	619	Fair
928	t	139	Like New
929	t	69	Like New
930	t	225	Very Good
931	f	337	Poor
932	f	111	Fair
933	t	381	Poor
934	t	334	Fair
935	t	356	Like New
936	f	483	Good
937	f	365	Very Good
938	t	677	Like New
939	t	447	Good
940	t	696	Very Good
941	f	191	Good
942	f	110	Fair
943	f	402	Good
944	f	53	Like New
945	f	515	Poor
946	f	275	Poor
947	f	141	Like New
948	f	199	Good
949	f	588	Like New
950	t	234	Like New
951	t	143	Good
952	t	436	Fair
953	f	43	Fair
954	f	645	Like New
955	f	210	Very Good
956	f	347	Poor
957	f	693	Poor
958	t	577	Very Good
959	f	13	Poor
960	t	516	Fair
961	t	94	Good
962	f	438	Like New
963	t	269	Poor
964	f	337	Poor
965	f	567	Good
966	f	95	Fair
967	t	225	Very Good
968	f	407	Very Good
969	t	300	Like New
970	t	476	Like New
971	f	564	Poor
972	f	554	Like New
973	f	382	Very Good
974	t	333	Good
975	f	173	Like New
976	t	14	Fair
977	f	316	Good
978	t	2	Poor
979	t	525	Fair
980	f	627	Poor
981	t	616	Very Good
982	t	553	Fair
983	t	152	Poor
984	t	298	Like New
985	t	511	Good
986	f	13	Fair
987	f	242	Very Good
988	f	697	Good
989	f	367	Good
990	t	261	Like New
991	f	334	Fair
992	t	563	Poor
993	t	643	Very Good
994	t	649	Fair
995	t	369	Poor
996	f	122	Good
997	f	94	Good
998	f	494	Fair
999	f	240	Poor
1000	t	113	Good
\.


--
-- TOC entry 4871 (class 0 OID 16422)
-- Dependencies: 217
-- Data for Name: emploee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emploee (id_employee, surname, name, patronymic, post, email) FROM stdin;
1	Wahner	Mervin	Vernen	Cataloger	vwahner0@bing.com
2	Werndly	Gerta	Geri	Archivist	gwerndly1@google.ca
3	Boldra	Falkner	Arte	Reference Librarian	aboldra2@addtoany.com
4	Albinson	Rita	Herculie	Librarian	halbinson3@latimes.com
5	Donne	Rosetta	Delphine	Library Assistant	ddonne4@cnet.com
6	Pittham	Ivar	Donnamarie	Archivist	dpittham5@icq.com
7	Belcham	Bradly	Doy	Library Assistant	dbelcham6@ask.com
8	Sirey	Schuyler	Rafaello	Archivist	rsirey7@csmonitor.com
\.


--
-- TOC entry 4882 (class 0 OID 24659)
-- Dependencies: 228
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice (id_invoice, date, price) FROM stdin;
1	2023-02-19	231
2	2023-02-01	594
3	2023-04-25	904
4	2023-10-31	694
5	2023-08-14	290
6	2023-09-16	829
7	2023-02-18	924
8	2023-07-02	645
9	2023-03-16	414
10	2023-06-08	400
11	2023-03-17	623
12	2023-09-23	257
13	2023-03-04	764
14	2023-06-09	211
15	2023-02-25	313
16	2023-07-12	714
17	2023-06-05	231
18	2023-08-01	858
19	2023-01-18	438
20	2023-07-09	287
21	2023-12-05	266
22	2023-02-01	498
23	2022-12-19	404
24	2023-03-08	339
25	2023-10-02	752
26	2023-11-12	457
27	2023-01-30	644
28	2022-12-15	531
29	2023-07-20	862
30	2023-10-10	977
31	2023-10-22	555
32	2023-09-10	247
33	2023-08-15	484
34	2023-04-25	851
35	2023-03-15	941
36	2023-02-06	659
37	2023-12-04	447
38	2023-04-10	387
39	2023-05-17	133
40	2023-12-04	437
41	2023-12-04	235
42	2023-11-08	532
43	2023-10-03	432
44	2023-12-05	344
45	2023-03-10	589
46	2022-12-14	466
47	2023-09-10	665
48	2023-11-25	292
49	2023-09-11	503
50	2023-11-05	477
51	2023-03-26	380
52	2023-07-05	167
53	2023-11-07	240
54	2023-03-26	936
55	2023-07-12	261
56	2023-04-23	953
57	2023-12-05	873
58	2023-07-21	581
59	2023-09-13	640
60	2023-07-29	230
61	2023-03-14	820
62	2023-03-07	755
63	2023-02-16	379
64	2023-02-28	176
65	2023-01-20	585
66	2023-05-19	256
67	2023-07-29	545
68	2022-12-31	150
69	2023-03-01	966
70	2023-08-18	499
71	2023-02-01	162
72	2023-08-27	159
73	2023-10-05	462
74	2023-05-29	499
75	2023-01-05	522
76	2023-10-17	885
77	2023-04-22	954
78	2023-04-25	325
79	2023-01-06	115
80	2023-03-19	354
81	2023-03-14	731
82	2023-05-19	704
83	2023-08-26	745
84	2023-02-04	981
85	2023-09-17	354
86	2023-11-16	646
87	2023-05-21	818
88	2023-08-01	890
89	2023-10-13	619
90	2023-08-27	991
91	2023-06-29	642
92	2023-06-09	967
93	2023-08-15	147
94	2023-11-28	560
95	2023-08-23	337
96	2023-06-09	700
97	2023-03-11	273
98	2023-10-03	454
99	2023-10-13	710
100	2023-04-01	150
101	2023-08-14	851
102	2023-02-25	908
103	2023-06-24	347
104	2023-01-28	105
105	2023-01-29	476
106	2023-11-23	404
107	2023-06-05	954
108	2023-01-05	565
109	2023-07-07	916
110	2023-05-21	954
111	2023-03-21	472
112	2023-09-10	824
113	2023-08-27	229
114	2023-03-30	821
115	2023-05-29	850
116	2023-11-26	645
117	2023-03-07	764
118	2023-05-06	896
119	2023-02-18	170
120	2023-03-04	329
121	2023-09-15	218
122	2023-06-14	349
123	2023-08-24	583
124	2023-09-04	661
125	2023-05-22	111
126	2023-01-28	141
127	2023-05-09	384
128	2023-04-25	833
129	2022-12-19	431
130	2023-08-27	283
131	2023-11-08	313
132	2023-09-11	161
133	2022-12-11	578
134	2023-11-24	860
135	2023-04-11	588
136	2023-07-31	289
137	2023-04-30	115
138	2023-01-02	698
139	2023-05-01	523
140	2023-06-22	284
141	2023-11-24	724
142	2023-11-26	256
143	2023-07-13	595
144	2023-03-01	847
145	2023-03-24	465
146	2023-06-21	990
147	2023-09-22	114
148	2023-01-28	861
149	2023-08-01	125
150	2022-12-14	249
151	2023-07-17	689
152	2023-02-13	749
153	2023-02-08	115
154	2023-06-02	644
155	2023-09-24	164
156	2023-04-11	974
157	2023-10-25	948
158	2023-04-19	524
159	2022-12-29	486
160	2023-08-01	160
161	2023-10-29	474
162	2023-09-12	257
163	2023-08-22	801
164	2023-09-24	289
165	2023-01-08	782
166	2023-04-18	114
167	2023-07-10	515
168	2023-04-27	697
169	2023-09-06	475
170	2023-07-09	633
171	2022-12-08	916
172	2023-09-15	296
173	2023-07-24	615
174	2023-05-06	939
175	2023-08-08	122
176	2022-12-13	933
177	2023-09-28	213
178	2023-04-27	426
179	2023-01-23	603
180	2023-09-26	612
181	2023-01-11	475
182	2023-08-10	813
183	2023-08-13	149
184	2023-08-26	851
185	2023-09-23	398
186	2023-10-27	753
187	2023-05-28	311
188	2022-12-29	977
189	2023-10-14	256
190	2023-03-03	254
191	2023-01-06	577
192	2023-11-08	945
193	2023-08-17	567
194	2022-12-23	276
195	2023-07-05	867
196	2023-05-31	155
197	2023-10-25	529
198	2023-11-23	159
199	2023-02-27	320
200	12023-01-30	720
201	2023-03-17	824
202	2023-10-31	424
203	2023-01-08	889
204	2023-04-29	555
205	12023-01-06	912
206	2023-06-13	192
207	2023-07-19	376
208	2023-02-11	542
209	2023-07-26	744
210	2023-07-05	602
211	2023-06-27	607
212	2023-10-24	944
213	2023-09-21	657
214	2023-10-22	238
215	2023-11-26	628
216	2023-01-27	283
217	2023-04-28	665
218	2023-05-04	858
219	2023-05-18	248
220	2023-06-26	482
221	2023-02-19	765
222	12023-01-06	124
223	2023-04-03	416
224	12023-01-27	418
225	2023-10-14	577
226	2023-08-29	344
227	2023-05-19	197
228	2023-01-16	397
229	2023-09-30	979
230	2023-09-13	234
231	2023-09-21	994
232	2023-10-22	246
233	2023-11-03	670
234	2023-01-30	642
235	2023-10-23	623
236	2023-05-30	852
237	2022-12-15	115
238	2023-05-04	730
239	2023-09-29	165
240	2023-04-27	793
241	2023-03-28	142
242	2023-08-05	871
243	2023-03-07	491
244	2023-12-05	719
245	2023-02-14	549
246	2022-12-31	929
247	2023-04-16	701
248	2023-01-30	698
249	12023-01-29	804
250	2023-09-22	906
251	2023-09-12	320
252	2023-09-04	881
253	2023-11-03	914
254	2023-02-28	923
255	2023-03-09	136
256	2023-04-10	348
257	2023-09-19	910
258	2023-01-31	538
259	2023-10-08	298
260	2023-05-10	975
261	2023-02-09	657
262	2022-12-27	390
263	2023-08-13	216
264	2023-06-06	288
265	2023-11-01	165
266	2022-12-23	732
267	2023-10-06	699
268	2022-12-26	635
269	2023-06-10	696
270	2023-06-15	250
271	2023-05-14	587
272	2023-09-19	955
273	2023-03-22	442
274	2023-05-20	778
275	2023-06-12	873
276	2023-04-02	390
277	2023-04-22	761
278	2023-10-01	641
279	12023-01-30	148
280	2023-06-08	299
281	2023-10-08	782
282	2023-06-03	277
283	2023-05-15	603
284	2023-02-27	674
285	2023-03-01	176
286	2023-06-19	768
287	2023-01-10	818
288	2023-11-04	426
289	2023-11-24	535
290	2023-08-20	485
291	2023-02-18	178
292	2023-01-12	407
293	2023-05-07	349
294	2023-11-09	730
295	2023-04-27	874
296	2023-10-10	779
297	2023-03-22	444
298	2023-01-13	740
299	2023-04-23	696
300	2023-06-02	822
301	2023-09-14	450
302	2023-06-21	258
303	2023-08-18	151
304	2023-01-30	754
305	2023-06-25	500
306	2023-06-22	199
307	2023-11-05	725
308	2023-10-08	910
309	2023-04-07	434
310	2023-03-20	507
311	2022-12-26	433
312	2022-12-14	465
313	2023-04-07	437
314	2023-05-13	577
315	2023-08-03	899
316	2023-10-27	983
317	2023-01-21	435
318	2023-08-29	450
319	12023-01-11	644
320	2023-01-14	833
321	2023-10-02	555
322	2023-08-13	690
323	2023-10-31	616
324	2023-09-22	261
325	2023-03-04	995
326	2023-07-14	321
327	2023-01-06	886
328	2023-10-26	668
329	2022-12-24	986
330	2023-11-19	746
331	2023-01-19	658
332	2023-08-28	840
333	2023-05-25	288
334	2022-12-21	925
335	2023-10-11	566
336	2023-07-14	722
337	2023-05-18	327
338	2023-07-10	476
339	2023-10-16	943
340	2023-05-19	823
341	2022-12-15	242
342	2023-03-04	112
343	2023-08-18	354
344	2022-12-09	555
345	2023-07-02	960
346	2023-07-12	790
347	2023-03-16	844
348	2023-03-25	463
349	2023-08-01	998
350	2023-05-27	598
351	2023-07-08	462
352	2023-11-28	257
353	2023-05-31	411
354	2023-07-25	214
355	2023-06-01	828
356	2023-07-24	167
357	2022-12-07	268
358	2023-11-15	799
359	2023-09-16	908
360	12023-01-30	679
361	2023-08-16	417
362	2023-01-27	635
363	2023-03-11	474
364	2023-08-08	508
365	2023-05-02	449
366	2023-06-03	844
367	2023-01-01	790
368	2023-10-18	777
369	2023-07-15	597
370	2023-04-21	934
371	2023-07-07	204
372	2023-09-04	724
373	2023-07-06	696
374	2023-02-24	200
375	2023-11-05	134
376	2023-10-17	443
377	2023-07-17	872
378	2023-04-13	749
379	2023-10-16	706
380	2023-04-08	137
381	2023-05-15	654
382	2022-12-18	712
383	2023-12-02	851
384	2023-10-15	141
385	2023-08-07	590
386	2023-04-22	261
387	2023-02-26	262
388	2022-12-22	585
389	2023-10-14	331
390	2023-04-27	110
391	2023-09-22	224
392	2023-10-13	990
393	2023-03-03	703
394	12023-01-21	246
395	2023-05-10	452
396	2023-04-02	402
397	2023-02-28	518
398	2023-10-10	454
399	2023-06-27	133
400	2023-09-09	431
401	2023-08-12	208
402	2023-10-31	959
403	2023-02-06	461
404	2023-07-11	686
405	2023-09-25	237
406	2022-12-18	144
407	2023-09-15	146
408	2023-02-27	256
409	2022-12-24	696
410	2023-09-13	980
411	2023-11-05	381
412	2023-07-19	176
413	2023-07-24	496
414	2022-12-11	960
415	2022-12-08	623
416	2023-05-18	950
417	2022-12-22	979
418	2023-07-20	338
419	12023-01-20	235
420	2022-12-26	391
421	2023-04-18	442
422	2023-05-16	456
423	2023-09-15	889
424	2023-07-09	344
425	2023-06-05	156
426	2023-04-15	458
427	2023-01-14	575
428	2023-03-26	497
429	2023-08-11	910
430	2023-08-31	303
431	2023-11-03	652
432	2023-10-24	409
433	2023-05-28	262
434	2023-07-16	595
435	2023-05-17	126
436	2023-09-19	747
437	2023-11-09	757
438	2023-05-28	311
439	2023-02-28	774
440	2023-07-05	738
441	2023-09-18	577
442	2023-08-18	523
443	2023-08-06	898
444	2023-05-17	696
445	2023-08-24	169
446	2022-12-13	774
447	12023-02-06	945
448	2023-02-24	397
449	2023-02-19	694
450	2023-03-31	367
451	2022-12-27	329
452	2023-01-23	633
453	2023-11-05	350
454	2023-05-13	278
455	2023-10-13	449
456	2023-03-19	668
457	2022-12-16	217
458	2023-03-23	412
459	2023-03-18	468
460	2023-11-09	720
461	2023-09-16	159
462	2023-02-11	482
463	2023-07-30	863
464	2023-02-06	888
465	2023-11-24	193
466	2023-10-31	472
467	2023-02-26	923
468	2023-03-03	896
469	2023-01-18	104
470	2023-03-03	307
471	2023-02-23	447
472	2023-04-15	664
473	2023-02-13	388
474	2023-06-28	111
475	2023-11-24	776
476	2023-08-13	829
477	2023-03-13	666
478	2023-01-09	218
479	2023-03-06	596
480	2023-09-17	587
481	2023-05-06	328
482	2023-04-09	499
483	2023-02-23	833
484	2023-01-19	512
485	2023-08-28	964
486	2023-01-23	690
487	2023-11-01	485
488	2023-10-31	128
489	2023-01-28	231
490	2022-12-25	826
491	2022-12-17	915
492	2023-01-08	561
493	2023-05-29	140
494	2023-04-13	689
495	2023-01-20	675
496	2023-09-01	161
497	2022-12-17	415
498	2023-05-11	746
499	12023-02-06	144
500	12023-01-10	241
501	2023-06-16	945
502	2023-07-03	805
503	2023-08-30	253
504	2023-07-09	730
505	2022-12-31	394
506	2023-07-28	127
507	2023-06-05	501
508	2023-07-14	866
509	2023-10-08	694
510	2023-08-03	522
511	2023-03-11	541
512	2023-09-17	777
513	2023-07-08	278
514	2023-07-04	496
515	2023-09-14	520
516	2023-10-07	937
517	2023-08-07	137
518	2023-08-26	848
519	2023-07-18	142
520	2022-12-25	255
521	2023-11-01	224
522	2023-09-01	228
523	2023-03-02	721
524	2023-11-16	134
525	2023-01-12	395
526	2023-09-23	160
527	2023-03-01	858
528	2023-08-09	213
529	2023-10-09	275
530	2023-02-01	420
531	2023-02-01	386
532	2023-03-24	839
533	2023-06-29	775
534	2023-08-11	144
535	2023-10-09	967
536	2023-09-10	727
537	2023-07-13	787
538	2023-07-13	419
539	2023-10-04	253
540	2023-07-03	130
541	2023-11-28	375
542	2023-08-03	179
543	2023-09-22	428
544	2023-02-18	566
545	2023-09-10	506
546	2023-03-02	513
547	12023-01-21	374
548	2023-08-03	891
549	2023-09-17	812
550	2023-06-22	454
551	2023-09-09	559
552	2022-12-08	241
553	2023-01-18	365
554	2022-12-22	167
555	2023-04-16	211
556	2023-07-28	718
557	2023-03-15	518
558	12023-01-13	896
559	2023-01-21	906
560	2023-09-29	190
561	2023-05-13	562
562	2023-10-26	199
563	2023-01-08	434
564	2023-03-23	368
565	2023-01-05	980
566	2023-08-23	396
567	2023-02-17	335
568	2023-03-27	636
569	12023-01-27	576
570	2023-09-15	852
571	2023-11-28	379
572	2023-01-30	483
573	2023-10-21	200
574	2023-09-03	176
575	2023-03-12	336
576	2023-09-23	862
577	2023-07-09	880
578	2023-06-12	625
579	2023-09-15	128
580	2023-02-24	370
581	2023-06-09	380
582	2023-10-28	108
583	2023-04-15	941
584	2023-09-01	307
585	2023-08-22	882
586	2023-10-28	591
587	2023-04-05	646
588	2023-09-18	248
589	2023-10-30	458
590	2023-07-03	237
591	2023-02-02	120
592	2023-03-21	552
593	2023-05-31	479
594	2022-12-28	339
595	2023-04-13	390
596	2023-02-10	805
597	2023-11-08	864
598	2023-04-24	381
599	2023-10-01	952
600	2023-09-10	876
601	2023-05-08	483
602	2023-09-30	467
603	2023-08-10	325
604	2023-01-07	797
605	2023-07-24	759
606	2023-03-14	643
607	2023-11-15	922
608	2023-01-31	765
609	2023-01-26	252
610	2023-01-05	650
611	2023-02-15	343
612	2023-08-20	891
613	2023-10-12	805
614	2023-05-30	393
615	2023-07-21	610
616	2023-01-08	569
617	2023-07-25	535
618	2023-03-07	623
619	2023-11-09	711
620	2023-09-23	816
621	2023-10-11	793
622	12023-01-21	374
623	2023-01-08	415
624	2023-10-07	617
625	2023-01-15	982
626	2023-04-25	681
627	2023-01-17	611
628	2023-09-29	776
629	2023-02-13	948
630	2023-07-15	893
631	2023-08-02	635
632	2023-09-09	513
633	2023-06-14	132
634	2023-03-13	389
635	2023-03-30	542
636	2023-09-16	842
637	2023-10-04	166
638	2023-02-17	999
639	2023-03-24	604
640	2023-08-28	274
641	2023-06-06	643
642	2023-01-04	157
643	2023-01-05	561
644	2023-09-26	570
645	12023-01-20	137
646	2023-07-03	807
647	2023-05-06	904
648	2023-09-05	133
649	2023-03-31	876
650	2023-03-24	856
651	2023-10-12	460
652	2023-04-29	638
653	2023-06-03	611
654	2023-06-28	634
655	2023-04-24	102
656	2023-07-17	224
657	2023-05-29	850
658	2023-03-24	943
659	2023-11-12	158
660	2023-10-10	631
661	2023-03-02	411
662	2023-04-22	641
663	2023-07-05	150
664	2023-04-16	723
665	2023-03-07	579
666	2023-01-11	965
667	2023-09-16	1000
668	2023-06-17	958
669	2023-08-24	192
670	2023-01-01	635
671	2023-01-10	327
672	2023-02-16	527
673	2023-09-11	170
674	2023-01-27	227
675	2023-12-02	643
676	2023-10-29	197
677	2023-01-29	477
678	2022-12-24	739
679	2023-04-29	693
680	2023-10-08	284
681	2023-02-15	565
682	2023-09-27	478
683	2023-05-23	892
684	2023-08-13	783
685	2023-06-26	616
686	2023-07-01	445
687	2023-09-10	179
688	2023-01-18	899
689	12023-01-30	790
690	2023-07-21	960
691	2023-07-20	669
692	2023-07-06	226
693	2023-06-10	957
694	2023-04-11	404
695	2023-01-27	681
696	2023-09-15	780
697	2023-01-13	699
698	2023-04-06	705
699	2023-01-11	701
700	2022-12-31	691
701	2023-09-15	711
702	2023-05-12	960
703	2023-08-20	607
704	2023-10-04	224
705	2023-04-01	747
706	2023-05-09	393
707	2023-03-11	429
708	2023-03-03	860
709	2023-09-03	370
710	2022-12-16	535
711	2023-07-05	686
712	2023-01-10	793
713	2023-02-18	632
714	2023-02-15	192
715	2023-10-16	588
716	2023-08-26	277
717	2023-04-09	652
718	2023-08-31	322
719	2023-02-21	429
720	2022-12-17	676
721	2023-05-30	396
722	2023-09-25	586
723	2023-11-28	969
724	2022-12-23	842
725	2023-10-02	851
726	2023-04-13	408
727	2023-08-19	106
728	2023-11-01	186
729	2023-06-19	814
730	12023-02-01	842
731	2023-03-29	782
732	12023-01-30	463
733	2023-01-06	732
734	2023-08-27	214
735	2023-02-25	346
736	2023-10-31	881
737	2023-01-04	910
738	2022-12-27	870
739	2023-02-18	491
740	2023-08-30	908
741	2023-08-08	483
742	2023-07-09	357
743	2023-01-01	802
744	2023-09-04	979
745	2023-02-05	293
746	2023-11-01	379
747	2023-04-21	766
748	2023-12-04	860
749	2022-12-07	762
750	2023-06-03	314
751	2022-12-21	713
752	2022-12-18	344
753	2023-08-09	284
754	2023-09-23	525
755	2023-07-02	709
756	2023-09-13	869
757	2023-06-28	968
758	2023-08-13	192
759	2023-01-10	773
760	12023-02-01	327
761	2023-09-22	191
762	2023-07-23	334
763	2023-02-09	497
764	2023-08-22	251
765	12023-01-30	455
766	2023-05-20	184
767	2023-06-16	228
768	2023-01-01	612
769	2023-11-15	180
770	2023-04-24	291
771	2023-01-03	197
772	2023-08-04	592
773	2023-06-28	182
774	12023-01-21	542
775	2023-05-20	520
776	2023-03-05	645
777	12023-01-20	845
778	2023-10-04	231
779	2023-10-11	574
780	2023-03-07	567
781	2023-05-21	352
782	2023-01-27	298
783	2023-09-07	405
784	2023-01-30	878
785	2023-07-05	706
786	2023-02-09	132
787	2023-02-25	220
788	2023-03-21	220
789	2023-06-27	537
790	2023-07-27	402
791	2023-10-25	850
792	2023-03-31	494
793	2023-04-12	416
794	2023-01-28	365
795	12023-01-02	742
796	2023-06-02	768
797	12023-01-13	804
798	2023-11-12	149
799	2023-03-17	196
800	2023-08-12	600
801	2023-11-23	247
802	2023-02-13	283
803	2023-08-18	663
804	2023-06-30	808
805	2023-02-16	575
806	2023-04-24	729
807	2023-04-14	823
808	2023-01-06	758
809	2023-09-04	730
810	2023-05-05	177
811	2023-05-05	524
812	2023-07-02	417
813	2023-09-07	706
814	2023-05-16	143
815	2023-07-03	139
816	2023-03-29	669
817	2023-07-27	676
818	2023-03-20	511
819	2023-10-07	580
820	2023-01-24	904
821	2023-09-23	442
822	2023-05-29	905
823	2023-04-30	854
824	2023-04-08	495
825	2023-04-10	743
826	2023-11-07	640
827	2022-12-10	680
828	2023-05-23	287
829	2023-08-20	264
830	2023-11-01	180
831	2023-08-20	556
832	2023-01-31	421
833	2023-05-14	907
834	2023-03-12	478
835	2023-04-10	131
836	2023-06-14	975
837	2023-07-29	445
838	2023-05-26	464
839	2023-07-24	673
840	2022-12-31	747
841	2023-01-07	606
842	2023-05-08	919
843	2023-07-04	538
844	2023-01-30	628
845	2023-06-23	264
846	2023-07-13	275
847	2023-02-13	478
848	2022-12-08	884
849	2023-09-14	628
850	2023-10-11	759
851	12023-01-11	403
852	2023-02-08	399
853	2023-09-02	419
854	2023-05-19	999
855	2023-08-01	770
856	2022-12-31	290
857	12023-01-06	837
858	2023-01-09	766
859	2023-08-14	852
860	2023-03-17	846
861	2023-03-11	422
862	2023-01-25	106
863	2023-08-21	272
864	2023-04-05	755
865	2023-01-11	115
866	2023-11-12	640
867	2022-12-16	315
868	2023-07-19	104
869	2022-12-25	166
870	2023-02-26	339
871	12023-01-14	626
872	2023-03-07	892
873	2023-09-24	965
874	2023-04-03	840
875	2023-05-11	722
876	2022-12-12	893
877	2023-08-02	351
878	2023-06-27	704
879	2023-10-22	836
880	2023-01-10	532
881	2023-09-01	166
882	12023-01-11	645
883	12023-01-30	152
884	2023-03-08	169
885	2023-02-02	746
886	2023-05-08	989
887	2023-05-26	529
888	2023-07-18	791
889	2023-09-26	807
890	12023-01-13	704
891	2023-07-29	251
892	2023-06-07	345
893	12023-01-20	662
894	2023-02-11	154
895	2022-12-29	783
896	2023-08-27	377
897	2023-07-19	194
898	2023-04-27	412
899	2023-02-24	234
900	2023-02-01	381
901	2023-01-16	891
902	2022-12-28	916
903	2023-03-04	442
904	2023-10-13	819
905	2023-02-24	963
906	2023-06-05	459
907	2023-07-08	743
908	2023-03-07	734
909	2023-05-30	799
910	2023-05-15	253
911	2023-10-24	436
912	2023-11-05	372
913	2023-02-16	495
914	2023-06-24	595
915	2023-05-08	161
916	2023-09-15	524
917	2023-07-09	753
918	2023-06-19	538
919	2022-12-12	652
920	2023-11-26	307
921	2023-03-02	955
922	2023-10-06	461
923	2023-03-21	411
924	2023-02-04	635
925	2023-02-22	188
926	2023-02-13	993
927	2023-11-03	181
928	2023-07-12	223
929	2023-07-22	427
930	2022-12-30	224
931	2022-12-12	141
932	2023-09-02	263
933	2023-08-12	958
934	2023-04-06	345
935	2023-06-23	336
936	2023-03-03	533
937	2023-11-19	815
938	2023-09-22	860
939	2023-02-24	254
940	2023-05-11	231
941	2023-05-31	279
942	2023-02-26	748
943	2023-07-07	679
944	2023-07-27	996
945	2023-08-11	583
946	2023-04-20	367
947	2023-01-05	745
948	2023-04-19	513
949	2023-06-02	893
950	12023-01-17	861
951	2023-05-22	179
952	2023-01-07	268
953	2023-05-04	906
954	2023-08-11	327
955	2023-07-16	844
956	2023-08-12	890
957	2023-07-21	904
958	2023-07-31	826
959	2023-01-27	252
960	2023-07-25	827
961	2022-12-07	489
962	2023-11-22	822
963	2023-01-20	500
964	2023-08-07	627
965	2023-05-29	290
966	2023-07-14	688
967	2023-01-29	654
968	2023-08-26	700
969	2023-07-06	506
970	2023-04-07	561
971	2022-12-10	634
972	2023-08-22	115
973	2023-05-20	729
974	2023-11-16	890
975	2023-05-29	651
976	2023-10-30	427
977	12023-01-20	279
978	2023-07-20	778
979	2023-11-22	419
980	2023-01-25	155
981	2023-09-01	831
982	2023-07-25	605
983	2023-09-23	806
984	2023-07-27	854
985	2023-03-02	492
986	2023-10-17	794
987	2023-01-16	707
988	2023-01-04	740
989	2023-06-11	378
990	2023-11-19	744
991	2023-03-10	678
992	2023-06-16	831
993	2023-10-10	296
994	2023-05-06	906
995	2023-05-06	982
996	2023-11-12	817
997	2023-06-08	327
998	2023-05-29	853
999	2023-04-17	329
1000	2023-04-06	563
\.


--
-- TOC entry 4875 (class 0 OID 16497)
-- Dependencies: 221
-- Data for Name: publication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publication (library_code, id_publishing_house, year_of_release, id_book, language) FROM stdin;
1	5	1998	912	Kashmiri
2	11	2008	23	Hungarian
3	12	2006	306	Tsonga
4	20	2007	156	Belarusian
5	22	2001	257	Burmese
6	25	1996	26	West Frisian
7	8	2010	311	German
8	14	2003	249	Telugu
9	6	1996	975	Tok Pisin
10	27	2008	732	Maltese
11	24	1997	775	French
12	29	2004	636	Korean
13	30	2007	715	Swahili
14	11	2006	130	Kashmiri
15	11	1985	115	Chinese
16	16	2005	949	Dhivehi
17	18	2009	809	Georgian
18	4	2012	939	Guaraní
19	24	1967	782	Azeri
20	21	2004	576	Macedonian
21	15	1999	878	Guaraní
22	29	2010	984	Kyrgyz
23	28	2011	750	Moldovan
24	25	2009	586	Quechua
25	12	2010	631	Montenegrin
26	27	2013	199	Japanese
27	13	1994	32	Japanese
28	16	1994	613	Khmer
29	24	1984	665	West Frisian
30	18	2002	976	Punjabi
31	6	2005	498	Kurdish
32	8	2003	963	Punjabi
33	3	2001	500	German
34	27	1995	166	Yiddish
35	10	2007	499	Burmese
36	17	2002	494	Aymara
37	15	2002	969	Indonesian
38	16	2007	814	Belarusian
39	23	2006	778	Armenian
40	12	2001	41	Malayalam
41	5	2001	706	Czech
42	9	1996	921	Malagasy
43	4	2002	576	New Zealand Sign Language
44	2	1988	985	Afrikaans
45	8	1994	822	Bosnian
46	25	1993	597	Tetum
47	22	2003	222	Moldovan
48	12	2003	597	Romanian
49	1	1984	734	Azeri
50	2	1967	839	Punjabi
51	20	2009	345	Latvian
52	1	1999	951	Albanian
53	1	2005	380	Bengali
54	30	2012	910	Thai
55	11	2001	203	Azeri
56	18	2007	185	Italian
57	30	2009	291	Lao
58	30	2012	562	Punjabi
59	25	2008	429	Macedonian
60	3	1995	300	Kannada
61	15	1962	648	Aymara
62	1	2010	709	Kannada
63	15	2011	990	Gagauz
64	28	2008	204	Nepali
65	4	1968	798	Papiamento
66	25	1988	558	Dari
67	26	1997	296	Belarusian
68	17	1992	162	Lithuanian
69	14	1991	233	Moldovan
70	9	1992	557	Dutch
71	14	1989	789	Kashmiri
72	20	2004	283	West Frisian
73	19	2010	986	Northern Sotho
74	9	2010	534	Bulgarian
75	26	1987	924	Hebrew
76	12	2006	796	Hindi
77	26	1995	931	Quechua
78	15	2005	444	Thai
79	15	2010	342	Kurdish
80	12	1994	357	Fijian
81	17	2009	473	Dari
82	22	2002	690	Papiamento
83	20	2006	408	Bengali
84	22	2012	300	English
85	3	2009	120	Croatian
86	5	2007	784	Fijian
87	10	1994	347	Icelandic
88	25	1995	213	Kyrgyz
89	15	1969	882	Tswana
90	14	2005	789	Papiamento
91	9	1960	720	Japanese
92	20	2004	787	Greek
93	28	1993	994	Amharic
94	1	2003	35	Filipino
95	8	2007	989	Dari
96	9	1986	545	French
97	12	2004	499	French
98	18	1988	107	Icelandic
99	21	1999	270	Sotho
100	4	2003	384	French
101	27	2003	18	Japanese
102	29	2012	601	Somali
103	24	1997	17	Malagasy
104	17	1991	227	Swati
105	5	2001	542	Irish Gaelic
106	6	1995	963	Tamil
107	3	1995	384	Arabic
108	15	2006	999	Finnish
109	2	2007	255	Tajik
110	20	1986	320	Greek
111	12	1999	264	Bosnian
112	23	1991	642	Lao
113	19	2000	997	Dutch
114	24	1992	40	Burmese
115	10	2003	972	Papiamento
116	18	1995	596	Mongolian
117	3	1996	548	Montenegrin
118	22	2000	524	Polish
119	4	1997	818	Fijian
120	29	1994	508	Tetum
121	7	2000	480	Malay
122	29	2001	81	Haitian Creole
123	2	2008	774	Tok Pisin
124	27	1997	752	Hiri Motu
125	12	2008	242	Amharic
126	28	1997	185	Quechua
127	3	1998	797	Gujarati
128	1	1994	634	Belarusian
129	19	2002	218	Japanese
130	18	2006	712	Dzongkha
131	27	1989	586	Maltese
132	14	1990	133	Dari
133	11	2008	247	Hungarian
134	24	2008	407	Polish
135	4	1983	457	Swahili
136	19	1988	563	Dzongkha
137	6	2009	435	Japanese
138	2	1995	860	French
139	10	1986	642	Belarusian
140	19	2000	389	Korean
141	16	1996	950	Montenegrin
142	14	2005	718	Georgian
143	20	1994	655	Dari
144	16	1996	140	Thai
145	1	2003	740	Chinese
146	19	2002	872	Kashmiri
147	28	1997	448	Indonesian
148	18	1996	162	Northern Sotho
149	12	2007	793	Italian
150	19	2002	617	Swati
151	19	2012	989	Afrikaans
152	23	2011	224	Northern Sotho
153	25	2009	533	Italian
154	3	2006	240	Persian
155	24	2003	233	Polish
156	1	2004	222	Hungarian
157	27	2010	154	Belarusian
158	14	1993	100	Georgian
159	23	2008	869	Maltese
160	23	1993	197	Latvian
161	17	1976	312	German
162	20	2006	160	Romanian
163	12	2009	746	Moldovan
164	6	1999	655	Spanish
165	11	2009	774	Bulgarian
166	27	2002	26	Oriya
167	20	2006	236	Telugu
168	21	2005	379	Bulgarian
169	10	1997	715	Estonian
170	28	1995	770	Romanian
171	7	2006	318	Greek
172	20	2003	843	Afrikaans
173	17	1999	565	Kurdish
174	2	2006	81	Tok Pisin
175	23	1967	580	Azeri
176	24	2005	758	Albanian
177	30	1996	304	Danish
178	11	2006	764	Macedonian
179	1	1992	648	Swedish
180	8	1994	882	Estonian
181	10	2007	259	English
182	9	1992	322	Kurdish
183	4	1994	640	Tok Pisin
184	17	2010	511	Ndebele
185	20	1997	170	Montenegrin
186	16	2002	425	Nepali
187	30	2003	430	Dhivehi
188	14	1996	970	Dutch
189	7	1992	769	Romanian
190	13	2011	20	Swahili
191	22	1995	522	French
192	20	2004	468	Estonian
193	26	1997	555	Croatian
194	14	1997	274	Malagasy
195	29	2010	525	French
196	13	1986	658	Albanian
197	9	1995	518	Hiri Motu
198	8	1998	123	Tetum
199	5	2011	140	Portuguese
200	5	2007	242	Korean
201	24	1999	763	Lao
202	26	1968	773	German
203	16	1997	818	New Zealand Sign Language
204	29	2005	805	Māori
205	16	1999	85	Swati
206	9	1989	420	Tswana
207	6	2012	693	Ndebele
208	9	1996	403	Tok Pisin
209	30	1987	362	Kashmiri
210	2	1994	899	Papiamento
211	17	2009	444	French
212	10	2011	873	Belarusian
213	19	2002	445	Swati
214	27	1997	328	Armenian
215	13	1988	767	Azeri
216	29	2011	925	Burmese
217	19	2008	258	Hiri Motu
218	30	1987	322	Lao
219	7	1996	346	Romanian
220	30	1992	584	Dutch
221	27	2009	372	Hungarian
222	5	2007	521	Dzongkha
223	8	1987	488	Luxembourgish
224	20	1999	255	Kazakh
225	11	1999	656	Polish
226	2	2010	184	Azeri
227	17	1999	66	Bosnian
228	22	1985	794	Irish Gaelic
229	22	1985	886	Swahili
230	8	2001	548	Czech
231	13	1996	966	Persian
232	18	2011	605	Estonian
233	10	2000	98	Finnish
234	7	2006	8	Chinese
235	11	1989	573	Pashto
236	22	1987	630	Swahili
237	5	2009	158	Albanian
238	14	2008	646	German
239	4	1994	661	Bengali
240	23	1997	648	Northern Sotho
241	13	2008	997	Portuguese
242	20	1988	38	Dari
243	1	2004	352	Bengali
244	20	2013	513	Amharic
245	29	1998	202	Indonesian
246	14	1993	110	Kazakh
247	3	2007	511	Latvian
248	25	2012	837	Malayalam
249	22	1992	152	Tamil
250	24	1964	426	Nepali
251	6	2011	758	French
252	8	2007	359	Malagasy
253	21	1993	593	Pashto
254	19	2007	906	Persian
255	21	2005	857	Tok Pisin
256	5	2010	936	Yiddish
257	22	1993	397	Indonesian
258	26	1999	169	Haitian Creole
259	14	1994	980	Malayalam
260	3	2003	930	Gujarati
261	25	2005	839	Thai
262	3	2011	50	Malayalam
263	10	2004	289	Zulu
264	2	1999	118	Swati
265	12	1999	131	Zulu
266	2	2012	237	Hungarian
267	10	1993	332	Afrikaans
268	13	1997	629	Papiamento
269	5	1992	436	Swedish
270	28	1994	339	Bislama
271	5	1992	767	German
272	3	2010	364	Italian
273	30	1976	670	Yiddish
274	15	1998	416	Spanish
275	26	1989	906	Quechua
276	7	2006	978	Pashto
277	25	2003	848	Marathi
278	10	1996	550	Italian
279	5	1997	24	Amharic
280	14	1996	915	Bulgarian
281	13	1992	243	Quechua
282	15	2010	41	Swedish
283	29	2012	906	Kazakh
284	24	2006	320	Moldovan
285	7	2010	647	Papiamento
286	2	2007	454	Hindi
287	1	2006	800	Tetum
288	23	1993	252	New Zealand Sign Language
289	22	2010	322	Swati
290	16	1995	791	Tsonga
291	22	1994	539	Swati
292	6	2009	812	Hiri Motu
293	10	2004	514	Moldovan
294	11	2002	940	Haitian Creole
295	28	1973	971	Croatian
296	14	2004	127	Hebrew
297	26	2005	888	Azeri
298	24	2011	492	Tok Pisin
299	23	1992	4	Nepali
300	2	2010	130	Khmer
301	9	1998	294	Guaraní
302	30	1999	60	Hiri Motu
303	3	2005	694	Italian
304	12	2011	400	West Frisian
305	30	2006	473	Dutch
306	7	2011	770	Hiri Motu
307	27	2002	628	English
308	13	1990	276	Chinese
309	3	1999	308	Khmer
310	2	2011	768	Zulu
311	21	2009	64	Italian
312	26	1999	480	Georgian
313	17	1964	122	Kurdish
314	20	1993	58	Kurdish
315	5	2010	161	Pashto
316	24	2011	561	Somali
317	2	2003	634	Persian
318	25	1955	571	Afrikaans
319	24	2009	659	Somali
320	13	2012	703	Hungarian
321	15	2007	935	Spanish
322	29	1996	654	Gagauz
323	29	1989	973	Kashmiri
324	11	1993	617	Latvian
325	24	2004	360	Tetum
326	14	2003	298	Afrikaans
327	26	2010	639	Northern Sotho
328	23	1997	256	Hiri Motu
329	14	1999	377	Spanish
330	9	2006	752	French
331	4	2001	419	Dutch
332	18	2009	164	Belarusian
333	14	1988	35	Khmer
334	5	1993	645	Korean
335	10	2005	206	Kannada
336	2	2010	820	Polish
337	29	2004	600	Kazakh
338	19	1987	229	Armenian
339	4	2006	126	Somali
340	13	2011	471	Malay
341	12	2005	715	French
342	28	1999	258	Lao
343	15	1994	319	Dzongkha
344	21	2000	772	Arabic
345	13	2006	749	Gagauz
346	10	2004	718	Zulu
347	20	2009	804	Yiddish
348	1	1999	902	Icelandic
349	28	2008	138	Hindi
350	2	1992	15	Italian
351	15	2002	747	Kazakh
352	14	2003	307	Tetum
353	4	2011	311	New Zealand Sign Language
354	19	2005	285	Dari
355	22	1987	6	Maltese
356	26	1983	696	Catalan
357	15	2005	104	Tetum
358	17	1996	339	Dutch
359	7	2008	28	Tsonga
360	12	1992	772	Tok Pisin
361	17	2001	23	Afrikaans
362	11	1986	201	Kashmiri
363	2	2004	639	Bengali
364	2	1987	892	Latvian
365	12	2000	343	Papiamento
366	4	2005	746	Thai
367	1	1994	66	Marathi
368	29	2003	436	Persian
369	30	1990	45	New Zealand Sign Language
370	8	1978	634	Icelandic
371	15	2002	768	Armenian
372	20	1993	608	Malayalam
373	20	1990	344	Gagauz
374	26	1997	252	French
375	9	1996	324	Maltese
376	25	2007	194	Marathi
377	3	2007	886	Hindi
378	5	2012	272	Luxembourgish
379	16	2001	159	Dari
380	29	2011	293	Croatian
381	24	2002	322	Portuguese
382	12	1999	913	Tetum
383	23	2002	319	Kannada
384	3	1993	14	Bislama
385	26	2006	11	Dzongkha
386	17	2004	783	Malagasy
387	27	2009	250	Sotho
388	4	2006	68	Sotho
389	21	2003	171	Georgian
390	30	1999	429	English
391	2	1988	139	Filipino
392	7	1991	310	Greek
393	18	1988	647	Bosnian
394	30	2002	619	Romanian
395	10	2012	181	Pashto
396	3	2005	343	Norwegian
397	29	1989	997	Moldovan
398	17	2004	947	Greek
399	14	2012	711	English
400	30	1986	384	Yiddish
401	18	1994	140	Filipino
402	21	1993	244	Swedish
403	27	2007	538	Māori
404	6	2012	65	Montenegrin
405	18	2012	495	Azeri
406	15	2009	883	Finnish
407	22	1991	221	Spanish
408	29	1990	863	Somali
409	8	1987	142	Tamil
410	26	2006	983	Amharic
411	26	1997	381	Ndebele
412	5	2006	781	Finnish
413	17	1985	496	Punjabi
414	25	1993	272	Punjabi
415	21	2012	329	Albanian
416	18	2000	790	Spanish
417	15	1991	889	Tsonga
418	1	2011	534	Tajik
419	22	1968	411	Punjabi
420	2	2004	362	Chinese
421	17	1995	395	Kazakh
422	2	2001	369	Georgian
423	1	2005	39	German
424	26	2002	841	Indonesian
425	15	2011	101	Guaraní
426	27	2005	89	Somali
427	12	1996	222	Montenegrin
428	23	2003	321	Kannada
429	17	1997	27	Hebrew
430	3	1993	590	Dzongkha
431	25	2005	610	Swati
432	11	1997	206	Maltese
433	17	2004	895	New Zealand Sign Language
434	1	1999	159	Kannada
435	4	1989	635	Spanish
436	27	2009	589	Bulgarian
437	3	2010	337	Japanese
438	27	1998	514	Mongolian
439	12	1985	255	Northern Sotho
440	23	2004	575	Tsonga
441	28	1988	652	Latvian
442	17	2002	17	Irish Gaelic
443	20	2009	88	Malayalam
444	3	2010	836	Irish Gaelic
445	12	2008	597	Japanese
446	10	2008	538	Bulgarian
447	12	1992	674	Bislama
448	19	2009	926	Montenegrin
449	9	2003	899	Dzongkha
450	5	1990	856	Yiddish
451	10	1992	100	Portuguese
452	19	1977	336	Tetum
453	27	1988	293	Papiamento
454	22	1994	81	Tswana
455	15	2012	61	Tswana
456	3	2009	560	Marathi
457	10	2007	26	French
458	13	2008	857	Portuguese
459	10	2002	232	Malay
460	28	1995	420	Afrikaans
461	20	1992	84	Dutch
462	30	1988	446	French
463	6	2003	439	Hungarian
464	8	1992	860	Malayalam
465	27	2011	738	Kashmiri
466	3	2012	950	Khmer
467	12	2008	321	German
468	1	2008	692	Kazakh
469	13	2000	54	Bosnian
470	16	2008	132	Malagasy
471	22	2011	116	Croatian
472	19	2011	93	Marathi
473	9	1996	988	Luxembourgish
474	13	1993	571	German
475	17	2007	484	Bosnian
476	5	2003	412	Malayalam
477	8	2003	134	Montenegrin
478	3	2006	908	Lao
479	4	2002	815	Thai
480	29	1986	536	Dari
481	29	2012	495	Chinese
482	15	2008	719	Estonian
483	15	1989	29	Zulu
484	8	1997	478	Burmese
485	28	1995	502	Azeri
486	11	2009	479	Guaraní
487	15	2009	634	Korean
488	10	2004	195	Lithuanian
489	6	1994	780	Khmer
490	26	1989	594	Malagasy
491	3	2009	288	Spanish
492	8	2007	968	French
493	22	1993	731	Indonesian
494	8	1995	646	Assamese
495	20	2004	264	Kurdish
496	1	2007	627	Swahili
497	15	2001	406	Aymara
498	4	1995	979	French
499	28	2008	848	Montenegrin
500	5	2012	251	Luxembourgish
501	8	2012	711	Czech
502	27	2012	522	Kannada
503	24	1994	480	Bengali
504	27	1993	945	Amharic
505	18	2007	946	Swati
506	4	2010	949	Persian
507	6	2013	935	Japanese
508	5	1996	41	Arabic
509	7	2008	504	Khmer
510	28	1990	837	Swedish
511	28	2008	684	Belarusian
512	19	1997	483	Gagauz
513	10	1996	368	Swahili
514	5	2005	988	Quechua
515	24	2007	238	Arabic
516	29	2008	361	West Frisian
517	8	2008	196	Moldovan
518	30	2010	426	Northern Sotho
519	18	1997	332	Croatian
520	27	1989	999	Ndebele
521	3	2004	143	Bulgarian
522	29	2003	983	Mongolian
523	25	2000	184	Finnish
524	11	1993	479	Nepali
525	24	1995	300	Hebrew
526	20	2004	169	Spanish
527	15	1987	137	Japanese
528	12	2005	367	Armenian
529	27	2005	373	Armenian
530	23	2007	974	Afrikaans
531	12	1991	728	Norwegian
532	18	2006	206	Ndebele
533	12	1985	29	Tok Pisin
534	5	1996	376	Tsonga
535	28	2005	880	Afrikaans
536	8	2008	937	Hiri Motu
537	13	1993	510	Kurdish
538	8	1985	417	German
539	4	1990	989	Thai
540	24	2007	214	Italian
541	2	2009	432	Malay
542	8	1993	546	Kazakh
543	10	1990	662	Tsonga
544	6	2008	316	Aymara
545	18	1963	887	Polish
546	5	1992	389	Japanese
547	21	2008	517	Tswana
548	27	2005	747	Lithuanian
549	5	2003	641	Khmer
550	16	2008	226	Kyrgyz
551	6	2009	965	Dhivehi
552	1	2003	848	Irish Gaelic
553	13	2003	861	Filipino
554	20	1991	323	Assamese
555	14	2005	566	Japanese
556	20	2012	87	Belarusian
557	25	2012	865	Hiri Motu
558	7	2012	63	Northern Sotho
559	4	1992	804	Tok Pisin
560	10	2000	127	Kashmiri
561	30	2006	216	Papiamento
562	8	2001	784	Dari
563	26	2006	800	Spanish
564	2	2012	206	Papiamento
565	10	1993	411	Mongolian
566	5	2012	2	Belarusian
567	4	2007	136	German
568	22	1993	1	Armenian
569	22	2006	900	Lao
570	29	1998	923	Dzongkha
571	26	2001	712	Italian
572	8	1990	737	Malay
573	1	1991	739	Tamil
574	6	1991	390	Maltese
575	2	1999	70	Bosnian
576	15	2004	649	Tsonga
577	11	2003	526	Sotho
578	18	2010	801	Tetum
579	26	2007	837	Indonesian
580	21	2008	871	Romanian
581	19	2004	100	Dari
582	8	2010	202	Czech
583	20	1998	98	Amharic
584	15	1989	866	Sotho
585	6	1995	992	Ndebele
586	30	2011	16	Luxembourgish
587	14	1991	246	Swati
588	12	2003	928	Papiamento
589	9	1995	758	Punjabi
590	8	2007	813	Montenegrin
591	13	2001	389	Latvian
592	8	1995	779	Quechua
593	15	2005	849	Māori
594	27	1998	959	Afrikaans
595	21	2012	892	Maltese
596	28	1988	981	Finnish
597	17	1998	442	Lao
598	11	1995	727	Japanese
599	11	2008	196	French
600	16	2013	239	Portuguese
601	13	2012	30	Chinese
602	2	2011	980	Somali
603	2	2010	152	Polish
604	21	2009	304	Macedonian
605	4	2008	138	Burmese
606	17	2002	59	Bosnian
607	24	2005	203	Swedish
608	8	1997	563	Lao
609	28	2002	228	Indonesian
610	1	1999	532	Greek
611	25	2008	348	Kazakh
612	14	2011	976	Czech
613	26	1990	802	Tetum
614	28	1994	359	Azeri
615	18	1996	979	Swahili
616	28	1972	311	Afrikaans
617	15	2012	833	Macedonian
618	18	1997	291	Macedonian
619	17	1997	721	Lithuanian
620	3	2002	450	Punjabi
621	21	2010	367	Tsonga
622	16	2002	996	Bislama
623	20	1998	576	Assamese
624	17	1989	294	English
625	9	1987	979	Khmer
626	20	2012	858	Belarusian
627	22	1985	663	Burmese
628	5	1997	852	Bengali
629	19	1997	957	Zulu
630	17	2010	462	Luxembourgish
631	13	1999	428	Greek
632	8	1988	366	Lao
633	17	1997	417	Ndebele
634	5	1991	189	Ndebele
635	23	1992	751	Malagasy
636	10	1988	921	Somali
637	19	2004	882	Ndebele
638	7	1990	675	Dutch
639	22	1988	525	Italian
640	1	1997	263	Tamil
641	11	2008	198	Azeri
642	7	2003	580	Finnish
643	5	2007	999	Burmese
644	3	2000	640	Fijian
645	1	1987	378	Aymara
646	9	2009	930	German
647	10	1992	757	Finnish
648	1	1996	854	New Zealand Sign Language
649	1	2008	21	Amharic
650	24	1996	302	Tsonga
651	13	2009	834	Mongolian
652	27	1996	328	Malay
653	15	2007	568	Finnish
654	9	1985	570	Indonesian
655	12	1984	498	Guaraní
656	10	2004	588	Finnish
657	24	2012	403	Maltese
658	12	2007	153	Assamese
659	15	2011	939	Malayalam
660	28	1992	980	Zulu
661	11	1997	390	Kazakh
662	27	2001	89	Malayalam
663	24	1999	502	Tsonga
664	9	1990	861	Marathi
665	20	1989	164	Montenegrin
666	26	2008	687	Montenegrin
667	4	2007	755	Swati
668	3	2001	373	West Frisian
669	17	1997	453	Tajik
670	24	2006	321	Bengali
671	9	1993	138	Portuguese
672	3	2005	801	Greek
673	9	2009	913	Mongolian
674	23	2010	487	Polish
675	8	2005	194	Swati
676	26	1994	943	Norwegian
677	19	1999	56	Montenegrin
678	6	2011	812	Catalan
679	1	1994	320	Oriya
680	18	1987	77	Bulgarian
681	8	2011	706	Tswana
682	13	2006	658	Spanish
683	11	1996	806	Punjabi
684	17	1996	950	Haitian Creole
685	17	2005	181	Khmer
686	13	1984	255	Bislama
687	17	2006	57	Indonesian
688	21	2003	838	Portuguese
689	24	1999	212	Dari
690	30	2010	97	Lao
691	1	2010	562	Arabic
692	1	2007	248	Bosnian
693	6	1999	369	Khmer
694	3	2003	191	Māori
695	13	1994	489	Bislama
696	17	2006	377	Bengali
697	2	1997	502	Malay
698	7	2005	879	Arabic
699	9	2007	226	Papiamento
700	10	1971	861	Hebrew
701	28	1966	726	Spanish
702	23	1996	645	Filipino
703	7	1998	825	Swati
704	10	1997	827	Albanian
705	28	1993	12	Māori
706	20	2009	390	Finnish
707	28	2008	768	Persian
708	16	2006	418	Gujarati
709	9	2009	49	Romanian
710	5	1993	405	Bosnian
711	3	2007	608	Quechua
712	10	2010	371	Bosnian
713	16	1967	852	Icelandic
714	4	2012	38	Persian
715	23	2005	20	Tswana
716	27	2002	790	Arabic
717	3	2010	399	Azeri
718	5	2001	962	Lao
719	28	2011	304	Irish Gaelic
720	23	2012	309	Nepali
721	22	2003	491	Greek
722	23	1999	922	Lao
723	19	2008	16	Papiamento
724	19	2006	936	Armenian
725	28	1988	469	Guaraní
726	5	2011	644	Albanian
727	25	1989	761	Czech
728	7	1995	883	Kyrgyz
729	4	2001	848	Dutch
730	6	2006	816	Lao
731	23	1997	369	Pashto
732	5	2003	832	French
733	20	2004	275	Sotho
734	9	1987	480	Burmese
735	8	2012	135	Fijian
736	29	2002	546	French
737	23	1958	904	Malagasy
738	25	2006	765	Armenian
739	18	2007	71	Belarusian
740	19	1990	800	Irish Gaelic
741	24	1998	542	Oriya
742	28	2005	855	French
743	1	1991	856	Portuguese
744	7	2001	862	Portuguese
745	21	2005	867	Icelandic
746	25	2002	968	Telugu
747	17	1984	868	Greek
748	3	2003	145	Latvian
749	27	2009	595	English
750	12	2012	108	Kyrgyz
751	14	2009	114	Lithuanian
752	9	2010	634	Punjabi
753	8	1998	353	New Zealand Sign Language
754	7	2007	143	Catalan
755	6	1954	531	Mongolian
756	24	1990	14	Persian
757	8	2003	826	Burmese
758	21	2012	909	Japanese
759	24	1991	338	Pashto
760	27	1997	399	New Zealand Sign Language
761	9	1991	653	Estonian
762	26	1987	815	Indonesian
763	30	2007	2	Hebrew
764	25	1989	345	Dutch
765	22	2013	362	Marathi
766	18	1994	644	Kashmiri
767	16	2011	712	Hungarian
768	8	1994	77	Irish Gaelic
769	12	2008	610	Gujarati
770	15	2012	181	Georgian
771	13	2000	716	Tetum
772	29	2008	492	Northern Sotho
773	4	2006	284	Chinese
774	23	2003	117	Tok Pisin
775	1	1995	31	Dari
776	4	1998	605	Hungarian
777	6	1996	299	Hebrew
778	18	1999	25	Tsonga
779	16	2004	572	Afrikaans
780	22	1999	228	Belarusian
781	4	1995	42	Korean
782	11	1997	864	Indonesian
783	18	2004	651	Indonesian
784	23	2005	75	Gujarati
785	17	1995	236	Swahili
786	10	1992	601	Gujarati
787	24	2009	632	Tamil
788	8	1997	817	Italian
789	10	2010	301	Italian
790	9	1990	612	Estonian
791	17	1995	145	Amharic
792	29	2004	201	Belarusian
793	19	2007	78	Malay
794	1	2010	796	Kannada
795	24	1987	217	Belarusian
796	21	1996	162	Fijian
797	15	2000	414	Lithuanian
798	6	2006	381	Kazakh
799	19	2010	122	Kazakh
800	29	2001	925	Guaraní
801	15	1996	267	Hungarian
802	15	1996	294	Hiri Motu
803	24	1998	404	Kashmiri
804	25	1990	258	Dutch
805	23	1991	18	Yiddish
806	3	2010	799	Tsonga
807	26	1985	836	Croatian
808	1	2003	952	Kyrgyz
809	23	1996	565	Tetum
810	30	2012	805	French
811	19	1987	693	Fijian
812	7	2003	507	Yiddish
813	21	1992	839	Hiri Motu
814	25	1991	428	Malayalam
815	7	2012	882	Japanese
816	10	2004	124	Oriya
817	15	2003	477	Yiddish
818	23	2012	955	Northern Sotho
819	20	1994	263	Kurdish
820	19	1993	834	Korean
821	26	2005	121	Kurdish
822	22	2001	322	Haitian Creole
823	8	1990	901	Czech
824	3	1992	758	Malagasy
825	16	2006	976	Somali
826	9	2003	378	West Frisian
827	15	1995	621	Papiamento
828	11	1991	896	Finnish
829	20	1987	426	Chinese
830	18	2005	759	Tajik
831	1	1993	292	Lao
832	28	1994	653	Telugu
833	19	1992	491	Croatian
834	1	2008	747	Swati
835	12	1996	780	Bosnian
836	23	2006	582	Hebrew
837	20	2011	92	Malay
838	8	1987	369	Hungarian
839	15	2007	672	Maltese
840	21	1995	548	Hebrew
841	5	2013	266	German
842	18	1993	263	Zulu
843	8	2011	980	Khmer
844	15	2006	452	Malayalam
845	16	1998	380	Aymara
846	16	2006	159	Hindi
847	21	1993	326	Filipino
848	24	1988	262	Greek
849	4	2012	477	Macedonian
850	23	1994	718	Bislama
851	8	1998	750	Māori
852	27	2006	506	Macedonian
853	28	2003	216	Polish
854	17	2004	324	French
855	20	2001	86	Fijian
856	5	2005	203	Swedish
857	26	1994	213	Khmer
858	16	2004	525	Dari
859	24	1992	939	Arabic
860	30	2006	536	Filipino
861	23	2008	707	Fijian
862	18	1986	860	Fijian
863	29	2010	483	Zulu
864	13	2002	693	Tswana
865	14	2011	889	Luxembourgish
866	23	1984	912	Malay
867	11	2002	569	Malayalam
868	30	2004	359	Hungarian
869	9	2009	112	Yiddish
870	7	2005	115	French
871	7	2003	345	Tajik
872	25	2006	953	Burmese
873	1	2005	144	Bislama
874	7	2013	75	Latvian
875	1	2007	219	Kyrgyz
876	27	2005	858	Nepali
877	30	1999	171	Bosnian
878	15	1984	309	Pashto
879	18	2005	886	Georgian
880	16	2012	795	Catalan
881	16	2012	340	Malayalam
882	8	1989	289	Mongolian
883	16	2008	153	Yiddish
884	24	1997	750	Dutch
885	21	2008	615	Spanish
886	25	2009	396	Tajik
887	8	2001	740	Hiri Motu
888	10	1989	13	Lao
889	6	2012	394	Dzongkha
890	20	2006	466	Lao
891	2	1997	21	Bulgarian
892	10	1996	161	Ndebele
893	21	2011	228	Telugu
894	26	2003	436	Indonesian
895	23	2006	675	German
896	10	2004	511	Belarusian
897	13	1993	230	Guaraní
898	9	2003	93	Latvian
899	8	1993	306	Arabic
900	21	2007	201	Tok Pisin
901	16	2000	874	Maltese
902	4	1974	347	Finnish
903	29	1999	596	Malagasy
904	1	1999	822	Romanian
905	4	2012	156	Romanian
906	6	2001	9	Fijian
907	6	1993	918	Malagasy
908	6	1994	990	Luxembourgish
909	19	2009	734	Quechua
910	18	1998	539	Bengali
911	18	2001	853	Armenian
912	8	1993	77	Arabic
913	20	1990	274	Somali
914	10	1988	774	Malayalam
915	6	2009	957	Malayalam
916	19	2001	952	New Zealand Sign Language
917	18	2011	558	Dutch
918	20	1997	71	Guaraní
919	23	1992	450	Japanese
920	8	1992	829	Afrikaans
921	1	1999	56	Hungarian
922	8	2005	752	Czech
923	29	2003	944	Aymara
924	19	1994	844	Malayalam
925	17	2010	853	Northern Sotho
926	22	2009	820	Yiddish
927	4	2006	494	Estonian
928	26	2006	138	Malay
929	4	2003	240	Bosnian
930	25	2007	20	Bulgarian
931	29	2006	529	Tetum
932	4	2005	971	Catalan
933	3	2009	857	Quechua
934	17	1994	207	Bislama
935	29	2009	913	Lithuanian
936	18	2001	102	German
937	25	1999	723	Telugu
938	14	2007	459	Luxembourgish
939	14	1995	547	Chinese
940	6	1992	173	Kazakh
941	13	2009	724	Catalan
942	11	1984	928	Bislama
943	24	1995	60	Guaraní
944	2	2010	455	Kyrgyz
945	24	1993	212	Tetum
946	8	2004	705	Persian
947	24	1998	990	Czech
948	11	2005	157	Dutch
949	8	1993	899	Armenian
950	21	2010	369	Bengali
951	13	2009	220	French
952	28	1997	498	Gagauz
953	29	2011	309	Yiddish
954	6	1978	456	West Frisian
955	3	1995	702	Mongolian
956	17	1997	695	Guaraní
957	12	2001	738	Kurdish
958	11	2001	314	Kannada
959	4	2007	826	Malay
960	21	2003	851	Maltese
961	3	2010	778	Norwegian
962	7	1987	693	Korean
963	2	2011	757	Belarusian
964	19	2008	684	Arabic
965	2	2009	631	Swahili
966	23	2005	889	Hungarian
967	4	1996	866	Japanese
968	11	2011	82	Georgian
969	10	2003	87	Swahili
970	27	1988	791	Northern Sotho
971	11	2001	622	Sotho
972	26	1990	869	Arabic
973	6	1992	597	Korean
974	24	2009	34	Malay
975	7	2007	557	Papiamento
976	28	2003	449	Estonian
977	8	1994	683	New Zealand Sign Language
978	18	1984	579	Tajik
979	26	1999	839	Arabic
980	13	2006	296	Hiri Motu
981	18	2006	156	Georgian
982	22	2001	897	Dzongkha
983	28	2003	158	Dzongkha
984	14	1992	115	Tetum
985	26	1999	520	Afrikaans
986	9	2006	138	Hebrew
987	29	1994	856	Swedish
988	21	2005	630	Indonesian
989	13	1992	215	Korean
990	25	1996	208	Armenian
991	16	2005	607	Swati
992	24	2007	591	Māori
993	22	2008	360	Sotho
994	25	2005	147	French
995	28	1993	824	Norwegian
996	4	1992	343	Bengali
997	4	1985	531	Belarusian
998	3	1963	834	Czech
999	29	2007	949	Armenian
1000	2	1990	832	Irish Gaelic
\.


--
-- TOC entry 4876 (class 0 OID 24576)
-- Dependencies: 222
-- Data for Name: publishing_house; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publishing_house (id_publishing_house, compilers, name) FROM stdin;
1	Manuel Buesden	Penguin Books
2	Darya Zellick	Vintage Books
3	Teodor O' Donohoe	Penguin Books
4	Ofella Sweetlove	Hachette Book Group
5	Talyah Vondrach	HarperCollins
6	Wald Lewton	Macmillan
7	Lorettalorna Kerrane	HarperCollins
8	Valentia MacMoyer	Hachette Book Group
9	Doretta Greenwood	Knopf Doubleday Publishing Group
10	Emmalynn Briar	HarperCollins
11	Bearnard Anstey	Penguin Books
12	Em Ondracek	Macmillan
13	Aubry Metham	Bloomsbury Publishing
14	Guenna Cherrington	Straus and Giroux
15	Mylo Gilding	Simon & Schuster
16	Kettie Mainz	Straus and Giroux
17	Avery Dennington	Hachette Book Group
18	Padraic Besset	Knopf Doubleday Publishing Group
19	Vicky Southall	Bloomsbury Publishing
20	Julina Smetoun	Penguin Random House
21	Kania Jonuzi	Knopf Doubleday Publishing Group
22	Luis Blagdon	Knopf Doubleday Publishing Group
23	Lynnett Mayoral	Hachette Book Group
24	Fallon Tape	Farrar
25	Sax D'eathe	Straus and Giroux
26	Kristien Kytley	Penguin Books
27	Jasen Dabrowski	Hachette Book Group
28	Milly Drains	Penguin Random House
29	Louis Mugford	Farrar
30	Concettina Abberley	Penguin Books
\.


--
-- TOC entry 4869 (class 0 OID 16403)
-- Dependencies: 215
-- Data for Name: reader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reader (id_reader, count_of_books, name, surname, patronymic, phone_number, address, passport, email) FROM stdin;
1	10	Renaldo	Dodworth	Sawyer	831-245-6960	66522 Graceland Terrace	221.161.0.62	sdodworth0@google.ru
2	9	Mechelle	Espinoy	Chanda	590-140-3393	7323 Manufacturers Pass	174.132.248.170	cespinoy1@feedburner.com
3	7	Reinald	Asher	Leila	382-670-2841	1 Banding Park	192.164.79.182	lasher2@ow.ly
4	6	Junette	McGlaud	Coral	226-740-6635	4 Prentice Road	87.161.174.88	cmcglaud3@ebay.co.uk
5	9	Colan	Jeffcock	Carolynn	989-241-4051	9 Longview Way	120.4.84.30	cjeffcock4@dedecms.com
6	3	Catherin	MacElholm	Poul	597-913-2419	281 Jenna Hill	170.53.114.110	pmacelholm5@fda.gov
7	8	Lonee	Garvan	Kailey	363-491-2935	557 Jackson Center	97.63.213.176	kgarvan6@hostgator.com
8	1	Carolee	Cammidge	Danyelle	106-325-8131	8612 Pawling Drive	88.91.176.51	dcammidge7@nbcnews.com
9	10	Artemas	Barabisch	Nate	766-641-4176	0 Holmberg Alley	15.71.139.116	nbarabisch8@merriam-webster.com
10	10	Avrit	Dahl	Rozanna	222-368-4523	79 Mcguire Plaza	79.102.90.155	rdahl9@surveymonkey.com
11	7	Tiffie	Dray	Loraine	867-312-0156	241 Huxley Park	244.247.166.61	ldraya@tinypic.com
12	4	Amalee	Laskey	Faustine	287-703-5477	70409 6th Plaza	125.214.131.59	flaskeyb@g.co
13	8	Riobard	Mapledorum	Carlee	523-223-1038	4 Randy Junction	82.199.76.27	cmapledorumc@cbslocal.com
14	10	Jere	Gathwaite	Rog	122-680-3002	48779 Darwin Point	136.204.2.64	rgathwaited@oaic.gov.au
15	2	Inga	Stairmond	Dinnie	857-348-4249	63 Redwing Plaza	45.92.236.12	dstairmonde@google.co.jp
16	7	Annecorinne	Shapter	Sunny	153-492-4607	1 Jackson Center	227.127.24.115	sshapterf@angelfire.com
17	1	Elijah	Trevethan	Hephzibah	148-728-1708	2109 Kim Lane	14.32.87.60	htrevethang@lycos.com
18	2	Linda	Lathleiff	Trina	677-927-7193	048 Park Meadow Plaza	13.77.233.125	tlathleiffh@earthlink.net
19	2	Estelle	Manby	Artie	621-383-6316	6698 Lakewood Lane	70.98.49.144	amanbyi@ucoz.ru
20	1	Gilberta	Whissell	Durand	366-692-3623	77 Elgar Terrace	171.202.85.236	dwhissellj@themeforest.net
21	5	Lyle	Ezzle	Fabian	708-832-4191	4704 Daystar Lane	143.235.135.29	fezzlek@umn.edu
22	3	Garrard	De Courtney	Trever	520-582-3823	7 Bunting Parkway	147.205.90.42	tdecourtneyl@google.com
23	6	Pail	Cowgill	Glendon	292-479-8836	0 Heath Parkway	136.192.27.146	gcowgillm@paginegialle.it
24	7	Marietta	Wilshire	Corny	577-797-8155	29657 Washington Place	173.190.0.239	cwilshiren@howstuffworks.com
25	7	Baldwin	Begg	Farris	339-781-7693	0083 3rd Junction	217.38.83.57	fbeggo@tumblr.com
26	2	Odie	Baptista	Mariel	186-171-7576	9 Moulton Parkway	139.21.54.114	mbaptistap@ox.ac.uk
27	9	Sigismondo	Gaughan	Fremont	940-885-5487	903 Loomis Drive	64.14.199.69	fgaughanq@list-manage.com
28	8	Alfy	Bossons	Ewen	979-118-3318	3 Tony Crossing	181.55.9.81	ebossonsr@gov.uk
29	7	Tatum	Phittiplace	Nesta	929-107-7072	15134 Express Terrace	173.51.141.255	nphittiplaces@netvibes.com
30	3	Kalie	Casazza	Remy	396-853-2728	752 Forest Dale Parkway	46.231.224.180	rcasazzat@simplemachines.org
31	8	Matilda	Tunnick	Tilda	313-387-2758	8 Monument Road	47.164.199.214	ttunnicku@tinyurl.com
32	5	Lawton	Knill	Tobin	837-154-8504	99539 Moose Point	1.118.182.129	tknillv@mapy.cz
33	6	Sherri	Morforth	Lee	668-230-2163	3506 Clarendon Parkway	146.26.30.12	lmorforthw@goo.ne.jp
34	7	Ellene	Mignot	Estel	478-755-2860	4799 Dapin Terrace	248.18.169.208	emignotx@istockphoto.com
35	1	Rena	Pochet	Beverlie	683-845-8198	399 Corscot Point	32.22.162.22	bpochety@bigcartel.com
36	2	Pearle	O'Lunney	Jackqueline	204-918-2097	60923 Moulton Point	86.17.119.34	jolunneyz@walmart.com
37	5	Clyve	Penrice	Aggy	611-148-3035	764 Luster Court	196.228.159.19	apenrice10@comcast.net
38	6	Albina	Schimonek	Cointon	840-854-3644	9 Spohn Avenue	219.109.192.70	cschimonek11@fotki.com
39	9	Ailbert	Duhig	Otes	634-230-8625	9 Annamark Way	140.130.23.131	oduhig12@networkadvertising.org
40	10	Erich	Juliff	Stepha	303-213-9774	01 Farragut Terrace	43.137.25.0	sjuliff13@fastcompany.com
41	10	Whitney	Bewlay	Krishna	495-412-5569	624 Golf View Road	154.73.228.68	kbewlay14@shutterfly.com
42	4	Misha	Manvelle	Elayne	660-671-3919	000 Elka Way	4.116.113.238	emanvelle15@linkedin.com
43	9	Oralia	Crews	Roselin	934-586-0653	8083 Kingsford Lane	150.179.177.137	rcrews16@fc2.com
44	3	Lisbeth	Menloe	Brandea	194-795-6925	9381 Pine View Way	193.143.157.38	bmenloe17@newyorker.com
45	6	Terrie	D'Hooghe	Tori	677-986-1583	39 Schlimgen Pass	49.142.63.30	tdhooghe18@posterous.com
46	4	Rodger	Stephens	Joete	797-290-8671	44 Washington Place	252.69.160.91	jstephens19@prnewswire.com
47	5	Lyda	Morfell	Billie	921-151-1457	4 Kings Junction	5.122.210.116	bmorfell1a@ihg.com
48	5	Adriena	Phillins	Denna	710-753-9632	25 Sunfield Parkway	136.252.179.48	dphillins1b@java.com
49	4	Isaiah	Keary	Stella	353-701-4402	6 Vernon Circle	149.138.6.251	skeary1c@friendfeed.com
50	1	Karalee	Gallahar	Martita	883-535-8619	54 Anhalt Terrace	4.26.250.75	mgallahar1d@si.edu
51	4	Duffy	Godard	Howey	765-783-5677	058 Aberg Junction	255.58.52.194	hgodard1e@digg.com
52	6	Lona	Mart	Dominic	378-796-1324	668 Scoville Point	169.85.21.156	dmart1f@ezinearticles.com
53	1	Derek	Dinnage	Ketti	164-411-2663	5 Thompson Trail	87.95.38.236	kdinnage1g@skyrock.com
54	8	Catina	Laven	Gordie	688-357-5824	58539 Thompson Pass	215.44.115.217	glaven1h@github.io
55	4	Nickie	Kettle	Ketti	816-683-5249	6 Memorial Street	76.109.175.63	kkettle1i@umn.edu
56	4	Margette	Guillart	Germaine	897-859-3510	3 Vidon Pass	80.11.117.67	gguillart1j@home.pl
57	2	Zebadiah	Dranfield	Pauletta	990-126-0517	5 Saint Paul Point	36.129.71.84	pdranfield1k@phpbb.com
58	7	Martin	Baroux	Katlin	239-931-0271	16895 Montana Parkway	29.164.159.63	kbaroux1l@facebook.com
59	9	Ravi	Chant	Etheline	384-555-5741	4132 Dawn Hill	112.255.121.196	echant1m@stumbleupon.com
60	4	Magnum	Oolahan	Herve	543-837-2342	9476 Mayer Crossing	24.132.171.74	hoolahan1n@webnode.com
61	9	Tammie	Bastin	Harper	304-108-4362	8520 American Ash Hill	196.19.103.65	hbastin1o@bbc.co.uk
62	5	Adler	Lyosik	Jammal	610-515-8831	07 Stone Corner Crossing	185.243.112.5	jlyosik1p@exblog.jp
63	7	Steward	Stoffers	Boote	622-271-7223	07095 Luster Hill	23.217.194.102	bstoffers1q@surveymonkey.com
64	4	Nanete	Buckingham	Whitney	615-563-7331	93614 1st Alley	157.148.71.102	wbuckingham1r@discovery.com
65	5	Muire	Thouless	Concordia	835-894-7067	3 Summit Court	49.5.145.36	cthouless1s@youku.com
66	4	Tann	Skitterel	Duffie	427-126-6589	12 Westport Plaza	197.95.80.134	dskitterel1t@yolasite.com
67	4	Hyacinth	Grote	Nadya	628-512-2224	99 Esch Center	64.249.91.47	ngrote1u@goodreads.com
68	7	Deane	Dignam	Rossie	290-899-0115	01 Saint Paul Pass	234.26.255.236	rdignam1v@aol.com
69	2	Anatola	Lightbourne	Hannis	327-961-9554	640 Village Green Lane	216.91.134.159	hlightbourne1w@slate.com
70	1	Eilis	Kincey	Shantee	537-944-0738	7559 Emmet Junction	3.159.84.198	skincey1x@skyrock.com
71	3	Margalo	Delph	Sylas	561-587-9897	2718 Canary Pass	131.218.24.37	sdelph1y@miibeian.gov.cn
72	5	Bronnie	Lensch	Rossy	460-131-3299	60 Lerdahl Lane	194.94.95.51	rlensch1z@soundcloud.com
73	10	Ellary	Antczak	Charin	253-583-8367	49 Evergreen Avenue	69.205.46.73	cantczak20@ihg.com
74	5	Andrew	Whifen	Teodorico	317-150-1508	484 Corry Parkway	110.45.170.182	twhifen21@theatlantic.com
75	3	Cobb	Kester	Boony	353-596-4562	14031 Hallows Parkway	105.190.163.185	bkester22@blogs.com
76	10	Danyelle	Dudleston	Zitella	722-588-3038	27 Towne Junction	7.169.15.230	zdudleston23@ebay.co.uk
77	7	Fields	Polak	Gare	359-644-8147	8811 Sachs Court	103.46.90.192	gpolak24@state.tx.us
78	7	Damaris	Skitch	Robyn	986-648-6906	3 David Drive	46.26.137.186	rskitch25@mayoclinic.com
79	7	Paige	Rheubottom	Durward	753-465-9705	23 Morrow Court	242.210.40.244	drheubottom26@ebay.co.uk
80	4	Filia	Josephov	Julian	146-191-5587	73 Tony Trail	200.136.145.171	jjosephov27@slideshare.net
81	7	Brendis	Bigby	Hedy	549-458-3093	8658 Canary Plaza	212.120.214.113	hbigby28@berkeley.edu
82	2	Stanley	Hunte	Kennan	593-226-6580	7 Boyd Plaza	21.179.159.59	khunte29@github.io
83	2	Katherine	Enrrico	Marnia	208-595-0480	78 Dovetail Alley	35.56.65.207	menrrico2a@netscape.com
84	9	Ashlie	Westberg	Erminia	491-809-2161	35771 Claremont Terrace	139.150.152.15	ewestberg2b@i2i.jp
85	8	Tani	Kilpin	Brear	484-271-2971	9070 Burrows Lane	3.27.124.190	bkilpin2c@nps.gov
86	3	Deonne	Henlon	Wallis	370-386-1165	3346 Merchant Circle	181.18.244.166	whenlon2d@seattletimes.com
87	1	Murvyn	Dykas	Lita	779-795-1589	0 Duke Terrace	222.63.219.207	ldykas2e@blogspot.com
88	7	Annemarie	Jacketts	Livvy	179-226-2767	688 Veith Lane	227.245.134.97	ljacketts2f@booking.com
89	3	Salvidor	Bento	Hulda	578-336-2534	52 Garrison Center	71.245.123.173	hbento2g@freewebs.com
90	3	Perrine	Laurant	Devland	137-799-3425	612 Grover Street	204.17.198.191	dlaurant2h@mediafire.com
91	5	Alanson	Lucy	Lauretta	530-806-4440	3126 Lukken Drive	40.3.195.252	llucy2i@thetimes.co.uk
92	7	Adan	Pearde	Minnnie	688-154-0750	137 Moulton Crossing	15.217.135.72	mpearde2j@wikimedia.org
93	7	Torr	Prynne	Nannette	148-814-2965	84 Stang Place	242.17.118.55	nprynne2k@usgs.gov
94	10	Raffarty	Sandbrook	Nels	143-714-0647	86453 Oak Valley Center	113.78.85.170	nsandbrook2l@mail.ru
95	8	Mathias	Tupper	Angelica	539-732-7687	2 6th Junction	101.129.27.77	atupper2m@bing.com
96	4	Mitch	Guierre	Georgy	845-475-7111	315 Independence Junction	35.138.33.152	gguierre2n@ustream.tv
97	3	Pia	Twelvetrees	Lanny	982-437-0361	274 Lakewood Road	204.33.85.195	ltwelvetrees2o@nhs.uk
98	6	Conn	Caesmans	Robinia	610-986-8907	49 Fremont Junction	189.7.43.131	rcaesmans2p@loc.gov
99	9	Julita	Curry	Tades	799-566-3226	71863 Tennyson Hill	82.165.206.83	tcurry2q@utexas.edu
100	6	Elspeth	Caught	Randie	192-946-5835	390 Arkansas Point	183.128.61.121	rcaught2r@rakuten.co.jp
101	8	Elayne	Pickavance	Verena	728-794-8760	94916 Parkside Point	205.137.24.40	vpickavance2s@geocities.com
102	8	Sula	Swane	Jock	589-282-8368	0864 Johnson Way	112.125.224.184	jswane2t@wired.com
103	8	Myrlene	Sawer	Gisela	663-710-7478	3809 Homewood Trail	140.48.124.175	gsawer2u@istockphoto.com
104	4	Ilyse	Spinnace	Hewie	242-765-7506	534 Ronald Regan Hill	184.123.174.42	hspinnace2v@flickr.com
105	2	Thomas	Dabnor	Krystal	756-677-6325	138 Ronald Regan Circle	237.87.2.211	kdabnor2w@ocn.ne.jp
106	8	Lizzy	Marcham	Sam	459-290-7076	3 Bluejay Junction	15.119.229.29	smarcham2x@cmu.edu
107	4	Ainslee	Matushenko	Montague	311-197-5102	91 Carey Circle	134.79.148.188	mmatushenko2y@fc2.com
108	5	Edward	Channing	Ewen	638-128-6023	1 Rowland Drive	47.99.102.174	echanning2z@arstechnica.com
109	1	Lucille	Hannaford	Artemis	566-621-0665	153 Laurel Parkway	99.239.220.101	ahannaford30@wired.com
110	10	Daveta	Barus	Deeann	672-268-0124	48 Gina Hill	48.88.215.95	dbarus31@rambler.ru
111	5	Dinny	Geare	Lew	182-416-7646	36 Lawn Hill	78.96.36.239	lgeare32@ca.gov
112	9	Abigael	Druitt	Mariana	868-262-0884	3858 Melby Lane	197.55.170.83	mdruitt33@dailymotion.com
113	8	Theodora	Salery	Deane	570-460-1657	88638 Garrison Road	123.145.67.225	dsalery34@rambler.ru
114	3	Lucille	Petrol	Dare	341-690-9160	62 Londonderry Point	80.11.113.7	dpetrol35@oaic.gov.au
115	8	Hiram	Curuclis	Ivette	936-365-5298	75351 Mosinee Drive	183.125.91.213	icuruclis36@naver.com
116	3	Tamas	Jeal	Dulcy	759-597-5857	223 Lake View Crossing	198.215.212.218	djeal37@constantcontact.com
117	3	Rodrigo	Smogur	Vance	788-710-3497	07277 Bowman Parkway	215.91.144.7	vsmogur38@tamu.edu
118	4	Alix	Killiam	Graig	857-448-4385	36 Northwestern Avenue	66.42.149.112	gkilliam39@nydailynews.com
119	7	Abba	Shiel	Kayla	267-520-2705	603 South Street	13.71.86.79	kshiel3a@time.com
120	8	Guthrie	Tupman	Loy	116-666-1004	466 Summerview Street	237.129.122.69	ltupman3b@nps.gov
121	10	Beltran	Stockings	Jefferey	830-476-9690	427 Crowley Center	116.96.140.189	jstockings3c@imageshack.us
122	1	Jordan	Clowley	Abbi	831-579-6911	46 Fallview Trail	138.247.28.7	aclowley3d@msn.com
123	8	Gerhardine	Wymer	Bud	278-496-2572	797 Heath Court	59.74.216.242	bwymer3e@woothemes.com
124	10	Mikaela	Chadbourne	Sallyann	535-497-6820	9 Rusk Crossing	249.156.196.151	schadbourne3f@fotki.com
125	5	Franky	Magauran	Kriste	248-856-2749	88282 Northview Alley	151.84.163.112	kmagauran3g@dion.ne.jp
126	2	Aron	Pidler	Valentin	191-939-8087	26866 Duke Road	142.143.63.216	vpidler3h@state.gov
127	10	Lucine	Warlawe	Juliette	363-584-8933	577 Tennyson Crossing	191.53.168.66	jwarlawe3i@i2i.jp
128	10	Jacquelin	Decourt	Tailor	265-829-1605	666 Kropf Plaza	197.156.33.185	tdecourt3j@spiegel.de
129	3	Dale	McKellen	Anitra	406-230-8404	6 Porter Avenue	132.243.220.197	amckellen3k@rediff.com
130	1	Constantina	Beggio	Vinny	638-385-1133	082 Carberry Parkway	33.30.239.204	vbeggio3l@fema.gov
131	3	Berty	Killingbeck	Rey	463-478-4164	6 Marquette Alley	183.115.239.12	rkillingbeck3m@slideshare.net
132	7	Tillie	Masterton	Eloise	503-536-2074	860 Jenna Parkway	19.253.66.54	emasterton3n@google.com.hk
133	1	Barron	Carine	Minna	299-372-3490	5946 Tony Center	94.195.169.16	mcarine3o@accuweather.com
134	1	Aube	Goodered	Arlee	670-704-8687	0 Prentice Street	254.22.35.159	agoodered3p@economist.com
135	4	Joaquin	Ramalho	Bertrand	684-999-6474	2 Esch Parkway	102.122.22.131	bramalho3q@imageshack.us
136	6	Maximo	Nannetti	Odele	793-452-3761	2 Brentwood Terrace	121.208.167.195	onannetti3r@npr.org
137	9	Shalna	Boyan	Chester	188-642-1450	260 Loomis Street	216.183.219.105	cboyan3s@google.cn
138	7	Madelaine	Mc Trusty	Elianora	644-594-4857	9077 Atwood Court	66.62.26.181	emctrusty3t@ftc.gov
139	9	Foss	Clymo	Mike	263-473-2603	736 Arkansas Crossing	69.194.117.150	mclymo3u@princeton.edu
140	6	Gilburt	Finnemore	Dallis	693-281-6376	72427 Crescent Oaks Junction	56.202.201.91	dfinnemore3v@live.com
141	8	Germaine	Yu	Robinia	721-589-8935	6 Wayridge Avenue	83.226.20.236	ryu3w@spiegel.de
142	4	Davin	Sheber	Roberto	874-653-0129	4096 Green Terrace	242.107.63.48	rsheber3x@unc.edu
143	5	Leeann	Stockney	Lyndell	312-920-1306	605 Anthes Lane	94.118.208.31	lstockney3y@163.com
144	1	Janis	Dimond	Julianna	939-996-0215	40608 Badeau Street	111.242.164.42	jdimond3z@mapy.cz
145	9	Alvy	Brusle	Angil	402-798-7354	51337 Gina Place	183.143.230.54	abrusle40@pbs.org
146	1	Erda	Ruggiero	Marco	787-402-7980	31708 Moulton Hill	39.141.156.130	mruggiero41@ehow.com
147	8	Tasia	Guidone	Carlye	197-988-7537	887 Ridgeway Place	82.13.116.224	cguidone42@eepurl.com
148	7	Denyse	Sutlieff	Munroe	925-665-6850	23098 Mariners Cove Road	191.206.203.176	msutlieff43@answers.com
149	2	Annabel	Impy	Bryan	513-903-4059	9 Blue Bill Park Circle	141.244.84.242	bimpy44@xinhuanet.com
150	3	Dario	Riteley	Lorenzo	971-320-8331	613 Harbort Lane	121.173.236.158	lriteley45@over-blog.com
151	9	Locke	Cheine	Jennifer	655-175-8162	7 Brentwood Circle	185.249.174.29	jcheine46@flickr.com
152	9	Teriann	Holt	Brande	376-422-3390	0 Dahle Street	202.67.210.237	bholt47@eventbrite.com
153	7	Mariel	Peacey	Lonnard	873-853-4915	68 Melody Court	25.252.89.86	lpeacey48@yandex.ru
154	5	Geri	Bailes	Vanya	370-341-4784	180 Fair Oaks Hill	19.34.176.14	vbailes49@goodreads.com
155	3	Culley	Shurmore	Gusty	846-786-7166	5 Almo Lane	28.35.174.67	gshurmore4a@ameblo.jp
156	3	Ella	Birwhistle	Denni	470-689-6399	92 Atwood Park	128.75.103.223	dbirwhistle4b@skyrock.com
157	1	Rabi	Bleasby	Ancell	472-467-6293	1 Loomis Road	62.30.138.153	ableasby4c@trellian.com
158	3	Russ	Stowgill	Boony	716-661-9125	55 Bluejay Center	145.216.40.4	bstowgill4d@yellowbook.com
159	1	Jennine	Chapelle	Rena	164-887-0864	25 Merchant Place	47.247.148.181	rchapelle4e@usda.gov
160	4	Alix	Ellacombe	Bessie	374-316-8698	450 Saint Paul Way	157.155.237.182	bellacombe4f@hao123.com
161	2	Konstanze	Bloxholm	Hilary	876-273-7479	5883 Thierer Court	168.246.152.163	hbloxholm4g@nature.com
162	1	Carolus	Nudd	Mada	301-613-3346	20177 Evergreen Avenue	247.181.17.96	mnudd4h@github.io
163	8	Mario	Trusler	Pammi	535-755-4291	97 Mosinee Plaza	225.185.18.109	ptrusler4i@imageshack.us
164	1	Demetris	Bellchamber	Cornelia	413-146-7760	898 Carpenter Park	29.176.99.21	cbellchamber4j@addthis.com
165	3	Korey	Robbey	Retha	249-251-4727	48 Bowman Terrace	87.211.150.240	rrobbey4k@europa.eu
166	8	Bert	Peckitt	Conney	463-850-5581	631 Sutteridge Parkway	255.84.49.97	cpeckitt4l@engadget.com
167	4	Ernst	Semmens	Wolfy	821-996-4716	3667 Melby Point	44.175.103.60	wsemmens4m@disqus.com
168	6	Kenon	Pringle	Bentlee	369-463-5303	70 Cody Road	210.61.132.17	bpringle4n@spotify.com
169	5	Titos	Commucci	Saunder	214-815-4362	74 Granby Street	214.210.213.50	scommucci4o@wikia.com
170	4	Malvina	Pick	Reinold	846-110-7203	2806 Dennis Lane	254.112.182.7	rpick4p@xrea.com
171	3	Fifi	Dobrovsky	Issiah	212-880-6394	0368 Morningstar Crossing	176.118.54.131	idobrovsky4q@state.gov
172	4	Vere	Yesinov	Fairlie	579-415-7524	82 Moland Hill	197.193.20.204	fyesinov4r@vimeo.com
173	10	Marigold	Fehners	Fidela	519-426-9630	1 Michigan Pass	250.25.145.178	ffehners4s@cbsnews.com
174	2	Kimberley	Riveles	Valina	766-199-5842	86 Carpenter Junction	172.158.247.52	vriveles4t@ameblo.jp
175	5	Alli	Josofovitz	Zola	654-880-4703	44 Green Ridge Avenue	71.252.198.133	zjosofovitz4u@live.com
176	5	Katine	MacKeller	Jilleen	975-578-1550	96 Northwestern Trail	195.16.54.0	jmackeller4v@abc.net.au
177	6	Dunc	Cinavas	Ericka	546-382-0310	98278 Anhalt Street	55.24.152.183	ecinavas4w@t-online.de
178	5	Jeane	Trowsdale	Leilah	971-546-2841	7162 Farwell Point	158.161.142.171	ltrowsdale4x@blinklist.com
179	10	Lizzy	McTear	Adam	973-278-8906	58325 Hintze Hill	7.22.46.71	amctear4y@ustream.tv
180	5	Tybie	Hellicar	Michaelina	413-996-3587	8805 Monument Pass	250.196.8.75	mhellicar4z@nydailynews.com
181	4	Dennie	Rimmer	Kelley	170-611-1172	25749 Golden Leaf Terrace	18.186.218.37	krimmer50@virginia.edu
182	3	Patrick	Shark	Jarred	712-518-7474	5039 Browning Court	81.214.221.113	jshark51@mac.com
183	8	Leonanie	McCreadie	Cozmo	581-410-2883	275 Banding Parkway	106.244.246.195	cmccreadie52@eventbrite.com
184	6	Ailis	Jefferies	Dody	727-187-1923	21 Schurz Avenue	153.184.29.131	djefferies53@accuweather.com
185	10	Frasquito	MacGilrewy	Elga	706-687-9364	8 Brown Hill	113.216.43.75	emacgilrewy54@dagondesign.com
186	2	Brigida	Garbott	Fran	213-337-6189	38 8th Center	38.225.45.112	fgarbott55@webmd.com
187	3	Cathee	Iacovone	Imogene	313-626-0785	901 Dovetail Place	253.93.78.33	iiacovone56@addthis.com
188	3	Allyce	Thowless	Aloysius	941-773-4593	8475 Nobel Pass	154.251.1.174	athowless57@examiner.com
189	8	Constantino	Aldcorn	Virge	286-587-9483	5 Warner Lane	80.25.150.160	valdcorn58@indiegogo.com
190	10	Jedd	Dagon	Patrica	666-447-2441	73 Shelley Street	108.52.205.160	pdagon59@liveinternet.ru
191	5	Annabel	Broadway	Mahmoud	579-438-9884	612 Banding Park	190.30.129.197	mbroadway5a@themeforest.net
192	8	Nikoletta	McGarrie	Beatrisa	590-414-8252	26 Carey Avenue	92.54.135.227	bmcgarrie5b@telegraph.co.uk
193	7	Thekla	Alldis	Brenden	577-872-4382	85 Lakewood Hill	190.202.232.39	balldis5c@examiner.com
194	10	Appolonia	Braithwait	Patric	771-385-2193	807 Mockingbird Place	216.101.101.181	pbraithwait5d@symantec.com
195	9	Marena	Kellogg	Juanita	844-502-9878	1 Springview Terrace	233.186.247.122	jkellogg5e@ameblo.jp
196	4	Olympe	Proby	Clarissa	795-855-2194	9423 Mariners Cove Junction	29.221.193.202	cproby5f@parallels.com
197	10	Yoko	Fishburn	Chrysa	827-360-6792	3 Oak Street	175.210.7.159	cfishburn5g@posterous.com
198	10	Vernen	Patriskson	Barn	542-935-3467	7 Fairfield Center	0.2.210.122	bpatriskson5h@imgur.com
199	6	Holli	Shivlin	Alessandro	334-271-6389	50122 Boyd Center	23.27.84.116	ashivlin5i@meetup.com
200	6	Biddy	Stephens	Sergeant	380-926-2982	63315 Comanche Plaza	56.203.243.251	sstephens5j@theglobeandmail.com
201	8	Fairleigh	Luce	Ketty	399-851-4714	0 Reindahl Street	166.46.169.98	kluce5k@last.fm
202	7	Kale	Gever	Nerte	961-411-2898	36117 Arkansas Junction	191.176.193.7	ngever5l@smh.com.au
203	2	Daveen	Blenkhorn	Dion	609-917-0797	1 Surrey Place	31.63.137.223	dblenkhorn5m@nih.gov
204	5	Gilbertine	Laydel	Clay	412-871-0448	6771 Jackson Plaza	230.40.173.177	claydel5n@themeforest.net
205	10	Farly	Kienle	Arnoldo	951-817-3906	3 Southridge Crossing	68.54.45.4	akienle5o@newyorker.com
206	1	Trudey	Whitlam	Corri	617-232-6663	94 Butterfield Avenue	53.66.87.155	cwhitlam5p@eventbrite.com
207	7	Avram	Takle	Early	686-733-0489	3 Eggendart Junction	132.254.192.208	etakle5q@sbwire.com
208	5	Ashton	Brookshaw	Daveen	651-941-9126	15260 Sauthoff Road	126.99.113.69	dbrookshaw5r@hp.com
209	7	Skipton	Pummell	Roda	237-622-4976	4 Manufacturers Park	14.255.143.82	rpummell5s@abc.net.au
210	5	Ellwood	Sleeford	Orran	972-248-8215	82474 1st Point	242.178.154.245	osleeford5t@hp.com
211	2	Fiorenze	Botley	Ceciley	957-311-6283	0 Birchwood Crossing	220.0.0.61	cbotley5u@about.me
212	1	Andrea	Greatbanks	Neda	944-632-9290	1840 Sundown Court	103.126.134.218	ngreatbanks5v@upenn.edu
213	1	Mahalia	Anstice	Antonietta	312-759-9053	4867 Mallard Alley	99.192.192.55	aanstice5w@mysql.com
214	4	Kelly	Walesa	Tiphany	579-451-1999	319 Welch Junction	122.247.5.190	twalesa5x@wisc.edu
215	2	Kira	Whyke	Chrystal	558-301-6903	5 Lakewood Gardens Park	241.128.15.235	cwhyke5y@weibo.com
216	10	Kissee	Ebbers	Eward	944-564-9895	69682 Vahlen Point	12.237.187.127	eebbers5z@sbwire.com
217	7	Jennilee	Caldera	Maddalena	583-280-5165	7144 Upham Hill	80.60.21.64	mcaldera60@ebay.co.uk
218	2	Lorilyn	Narbett	Alphonso	937-249-2598	3 Lake View Place	164.213.17.255	anarbett61@trellian.com
219	6	Leonanie	Eustis	Meryl	827-476-5227	9 Pankratz Plaza	33.4.20.154	meustis62@examiner.com
220	6	Giordano	Nicholes	Skelly	907-424-7223	78364 Northfield Junction	134.3.81.194	snicholes63@multiply.com
221	5	Lexy	Espinet	Garwood	662-344-6702	8 North Junction	52.166.64.98	gespinet64@feedburner.com
222	7	Catie	Crossfield	Daniele	917-931-2254	6718 Maple Wood Alley	220.22.127.243	dcrossfield65@behance.net
223	7	James	Eaglestone	Jaquelin	871-229-0947	46 Gina Trail	121.230.80.31	jeaglestone66@mysql.com
224	7	Batsheva	Nappin	Connie	335-273-5756	62 Hallows Way	128.134.50.79	cnappin67@cornell.edu
225	9	Enrica	Cake	Edd	494-795-8970	0 Ohio Park	74.104.251.121	ecake68@examiner.com
226	4	Dorolice	Demeter	Clay	577-927-8805	418 Hazelcrest Avenue	62.94.21.155	cdemeter69@berkeley.edu
227	9	Gratia	Moncrieffe	Kaela	215-928-0228	05 Miller Hill	127.182.219.250	kmoncrieffe6a@nbcnews.com
228	1	Edmund	Allison	Valentina	213-806-6404	71986 3rd Place	10.40.86.160	vallison6b@rakuten.co.jp
229	3	Franky	Bendall	Estell	848-770-2359	9 Texas Junction	203.35.1.61	ebendall6c@about.com
230	10	Osbourne	Gratrex	Delilah	931-882-9075	53 Del Sol Center	239.170.176.237	dgratrex6d@digg.com
231	5	Maren	Gillimgham	Lucia	351-150-8544	909 Loeprich Terrace	205.96.216.104	lgillimgham6e@xinhuanet.com
232	9	Kate	Pettett	Fayre	458-398-5005	62 Sullivan Junction	158.140.65.205	fpettett6f@uol.com.br
233	10	Harv	Slark	Templeton	305-680-3767	03 Arizona Plaza	161.189.211.0	tslark6g@comcast.net
234	6	Nerti	Beneteau	Rowena	236-772-3630	4261 Ramsey Lane	221.198.252.9	rbeneteau6h@cloudflare.com
235	1	Charyl	Kubelka	Iorgo	304-554-9472	85 Scofield Hill	27.106.153.189	ikubelka6i@disqus.com
236	8	Vivien	McCutheon	Adair	355-686-5108	7 Lyons Way	69.28.136.141	amccutheon6j@xinhuanet.com
237	8	Freeman	Grewer	Trace	901-278-4452	7343 Parkside Lane	15.239.99.99	tgrewer6k@gmpg.org
238	7	Terese	Barnsdale	Shirleen	157-802-3539	7385 Dunning Hill	158.43.180.196	sbarnsdale6l@earthlink.net
239	7	Corene	Labro	Rogers	121-770-8870	5454 Forest Road	184.65.21.138	rlabro6m@squidoo.com
240	6	Fergus	Funcheon	Cristabel	132-323-2131	31 Debra Avenue	191.64.7.5	cfuncheon6n@netvibes.com
241	2	Angelo	Springate	Elonore	378-817-5546	29574 Twin Pines Place	65.152.18.158	espringate6o@behance.net
242	5	Hortense	Arnald	Lucila	847-140-4491	4000 Daystar Way	245.18.218.213	larnald6p@t.co
243	8	Josias	Klimkin	Julian	872-171-5024	86 Rieder Lane	151.167.238.62	jklimkin6q@rambler.ru
244	5	Ced	Mabey	Ursola	431-488-0253	3256 Valley Edge Crossing	68.66.113.194	umabey6r@linkedin.com
245	3	Wynn	Huck	Timmie	546-496-6173	7814 Packers Crossing	209.33.163.89	thuck6s@ustream.tv
246	5	Dulcie	Garm	Fina	223-157-0192	7 Buena Vista Junction	157.188.166.81	fgarm6t@blinklist.com
247	8	Clayson	Tunesi	Anallise	423-314-2523	40217 Donald Point	80.19.8.24	atunesi6u@tinyurl.com
248	4	Lelah	Lamkin	Jerry	332-857-7139	2386 Rieder Street	217.151.173.169	jlamkin6v@sitemeter.com
249	5	Merrill	Chennells	Andris	512-561-2740	328 Springview Center	98.189.72.194	achennells6w@arstechnica.com
250	4	Stace	Sugar	Eustace	743-546-3077	034 Arapahoe Parkway	209.42.111.59	esugar6x@vinaora.com
251	1	Gabbey	Station	Marcellus	322-145-8867	478 Shelley Circle	163.178.250.241	mstation6y@parallels.com
252	10	Gayla	Bardell	Roley	859-571-0221	0017 Butterfield Hill	74.237.12.118	rbardell6z@army.mil
253	6	Fidel	Spitell	Janette	635-835-7035	586 Fuller Hill	149.155.110.241	jspitell70@dmoz.org
254	6	Bowie	Butterly	Bryn	417-921-2881	0 Sullivan Way	204.207.47.222	bbutterly71@economist.com
255	1	Randi	Boarer	Cesya	371-884-7519	6 Katie Parkway	169.217.89.185	cboarer72@yahoo.co.jp
256	4	Perle	Wenger	Georgi	354-521-0318	0438 Tony Hill	32.165.161.29	gwenger73@rakuten.co.jp
257	7	Ada	Oyley	Ariana	556-655-6812	072 Sunfield Parkway	164.1.27.165	aoyley74@utexas.edu
258	8	Heindrick	Lougheed	Trixy	170-571-3510	3 Menomonie Street	176.17.173.81	tlougheed75@sbwire.com
259	6	Ewan	Peschke	Oliver	656-657-2714	7959 Pond Pass	23.86.154.237	opeschke76@gizmodo.com
260	5	Jerri	Sandilands	Walt	126-843-6314	453 Veith Way	127.97.48.70	wsandilands77@umn.edu
261	9	Bryan	Olenin	Donny	568-884-3125	10 Sachs Park	222.196.148.226	dolenin78@latimes.com
262	4	Syman	Yeiles	Tymon	441-714-6739	094 Helena Plaza	165.104.21.192	tyeiles79@uiuc.edu
263	6	Dannye	Earwaker	Olvan	592-973-6629	806 Daystar Junction	88.190.36.103	oearwaker7a@github.io
264	8	Glenda	Sunman	Mellisent	879-585-6534	6782 Lien Point	152.131.75.140	msunman7b@gizmodo.com
265	10	Dougy	Huckleby	Gorden	360-710-2672	8352 Victoria Junction	119.157.52.97	ghuckleby7c@bloglines.com
266	10	Claire	Robertson	Free	967-446-6844	8 Mayer Park	49.0.105.18	frobertson7d@creativecommons.org
267	5	Farlee	Blenkharn	Bernie	928-200-1442	54 Petterle Terrace	247.144.126.153	bblenkharn7e@addthis.com
268	6	Trudi	Inde	Debor	297-597-4548	93699 Hoepker Park	139.66.137.180	dinde7f@cnbc.com
269	8	Gareth	Kirkbride	Athene	603-584-5008	77 7th Circle	18.200.162.137	akirkbride7g@census.gov
270	1	Pennie	Titcumb	Vernon	582-695-9769	26 Merrick Alley	247.213.168.213	vtitcumb7h@ovh.net
271	3	Dione	Skpsey	Nataniel	195-520-0342	98 Bay Center	167.33.199.90	nskpsey7i@home.pl
272	1	Karlyn	Ciccottio	Hogan	436-200-7325	419 Oriole Avenue	205.146.117.82	hciccottio7j@yelp.com
273	9	Agata	Lytle	Lelah	821-810-3917	2 Maple Wood Place	34.82.33.248	llytle7k@mapquest.com
274	1	Darnell	Dillet	Belita	409-541-8825	86791 Jenifer Street	140.221.39.81	bdillet7l@drupal.org
275	5	Yorker	Naisey	Broderick	428-472-5138	42085 Garrison Alley	200.69.88.51	bnaisey7m@hao123.com
276	7	Morten	Heasman	Lesley	480-943-6383	59 Del Sol Point	92.28.32.17	lheasman7n@shareasale.com
277	9	Maurise	Kingswold	Averill	242-784-0692	8339 Petterle Point	81.108.88.193	akingswold7o@wp.com
278	4	Ginnie	Buzine	Pierson	226-107-1091	1221 Gateway Lane	102.254.145.148	pbuzine7p@ask.com
279	9	Zeke	Roarty	Max	648-781-6362	57 Mccormick Point	15.237.29.143	mroarty7q@ustream.tv
280	7	Cele	Guslon	Lena	167-509-6296	8 Morrow Point	12.186.8.181	lguslon7r@salon.com
281	7	Keriann	Ogborn	Una	168-807-0579	71448 Hoepker Pass	17.153.184.63	uogborn7s@dell.com
282	7	Donny	Brumfitt	Raffarty	871-383-4318	890 Superior Pass	15.37.83.140	rbrumfitt7t@qq.com
283	4	Archibold	Blight	Penny	571-684-4349	7781 School Court	16.168.66.29	pblight7u@twitter.com
284	5	Skip	Dionsetto	Chrissy	857-585-5468	6650 Pine View Terrace	164.119.215.225	cdionsetto7v@huffingtonpost.com
285	1	Larisa	Barkley	Spense	939-169-7847	97845 Forest Run Parkway	84.121.174.142	sbarkley7w@ifeng.com
286	7	Andi	Kershaw	Veda	819-409-8081	78561 Ramsey Parkway	143.125.60.106	vkershaw7x@google.ca
287	1	Meta	Mumbray	Lombard	251-476-6248	77 Luster Pass	21.26.156.213	lmumbray7y@redcross.org
288	1	Clyde	Leabeater	Karina	234-387-0374	994 Fuller Way	17.167.144.16	kleabeater7z@chron.com
289	5	Gallagher	Keal	Price	420-550-3475	1121 Welch Junction	151.172.71.240	pkeal80@indiatimes.com
290	3	Meridel	Reiner	Dulce	701-760-6271	7879 Susan Terrace	52.50.30.237	dreiner81@histats.com
291	5	Ofilia	Berthome	Mozelle	291-969-1284	3 Bowman Park	193.59.103.17	mberthome82@ihg.com
292	5	Aili	Fidgeon	Kippar	865-525-4946	85166 Forest Run Place	15.163.142.0	kfidgeon83@scientificamerican.com
293	3	Ahmad	Birchenhead	Pepe	280-743-9080	96 Alpine Center	163.234.157.135	pbirchenhead84@phoca.cz
294	6	Verine	Noell	Harwell	642-112-7330	36 Schlimgen Parkway	143.145.48.168	hnoell85@mozilla.org
295	5	Gay	Minelli	Cam	212-566-2319	24461 Harbort Trail	46.112.127.220	cminelli86@japanpost.jp
296	7	Sheelagh	Pate	Mindy	400-141-4031	7325 Eastlawn Circle	252.255.189.139	mpate87@howstuffworks.com
297	6	Jami	De La Salle	Flo	256-887-2415	0440 Mcguire Trail	10.30.188.81	fdelasalle88@domainmarket.com
298	2	Lebbie	Adamo	Keriann	519-466-9321	5 Oakridge Crossing	239.181.171.90	kadamo89@gnu.org
299	8	Anya	Babin	Davey	850-114-1841	57 Gulseth Park	156.56.207.218	dbabin8a@stumbleupon.com
300	2	Renaldo	Kasting	Vittorio	640-556-7481	1 Ohio Way	209.63.64.15	vkasting8b@columbia.edu
301	8	Terri	Von Der Empten	Gideon	585-570-5664	659 Grayhawk Street	137.40.128.109	gvonderempten8c@ihg.com
302	4	Olivero	Gary	Pamella	268-572-9712	10 Declaration Plaza	94.90.216.54	pgary8d@over-blog.com
303	3	Emili	Coulman	Moina	969-664-9354	1653 Dorton Place	158.197.147.162	mcoulman8e@npr.org
304	4	Tansy	Celli	Enrichetta	420-685-6142	816 Gerald Drive	51.166.27.53	ecelli8f@nbcnews.com
305	7	Linn	McConnel	Robby	963-622-4053	0 Raven Circle	169.222.95.189	rmcconnel8g@usgs.gov
306	6	Jerrie	Mochan	Camila	454-821-2629	91 Anniversary Pass	26.250.241.116	cmochan8h@webs.com
307	9	Jamison	Broadhead	Orville	329-730-8676	4154 Monica Park	191.139.253.250	obroadhead8i@odnoklassniki.ru
308	2	Val	Crosen	Rubi	999-541-1920	1241 Westridge Parkway	196.143.100.32	rcrosen8j@zdnet.com
309	5	Mathian	Dosedale	Northrop	861-860-0033	5013 Hintze Park	49.6.150.247	ndosedale8k@weather.com
310	4	Adina	Purkiss	Libbie	124-301-7069	85 Bowman Road	74.152.239.154	lpurkiss8l@goodreads.com
311	2	Earvin	Spenceley	Reidar	306-507-7051	883 Kedzie Crossing	8.157.117.69	rspenceley8m@bing.com
312	2	Sibylla	Bellison	Jemmy	761-927-9853	764 Maryland Hill	188.42.57.58	jbellison8n@stumbleupon.com
313	10	Drusi	Tomkin	Darcy	517-586-4399	90 Redwing Street	199.78.136.71	dtomkin8o@moonfruit.com
314	3	Gipsy	Adacot	Stern	866-544-5409	76373 Dryden Parkway	208.165.67.208	sadacot8p@printfriendly.com
315	7	Shurlocke	McRobert	Kimberlyn	455-211-2760	556 Novick Way	217.251.49.207	kmcrobert8q@cmu.edu
316	6	Townsend	Haps	Kirstyn	511-936-6629	206 Gateway Alley	231.181.244.237	khaps8r@123-reg.co.uk
317	2	Nathalia	Fenech	Lucho	774-711-9528	66857 Kim Junction	17.211.139.186	lfenech8s@myspace.com
318	1	Reeba	Obert	Emelita	146-577-3320	8429 Fremont Place	225.135.41.222	eobert8t@alexa.com
319	7	Mame	Fearnill	Jerri	448-808-7537	7877 West Point	7.254.19.1	jfearnill8u@miibeian.gov.cn
320	1	Meridith	Salter	Conn	507-783-6479	7 Reinke Park	255.45.231.157	csalter8v@earthlink.net
321	4	Sylvester	Portugal	Avrit	732-882-4174	66 Rusk Center	76.148.157.39	aportugal8w@berkeley.edu
322	1	Lionello	Chatwood	Timmie	449-815-8296	283 Birchwood Court	54.134.30.99	tchatwood8x@ameblo.jp
323	1	Mauricio	MacCracken	Feodor	674-831-1966	15 Waywood Place	54.222.162.115	fmaccracken8y@eventbrite.com
324	6	Price	Tootal	Jasmina	179-181-5318	71 Autumn Leaf Lane	247.137.204.59	jtootal8z@shutterfly.com
325	8	Redford	Fernez	Lamont	479-103-7257	40 Meadow Ridge Junction	143.228.32.81	lfernez90@washingtonpost.com
326	1	Marty	Benneton	Reggi	346-465-6510	94 Esker Alley	208.122.0.80	rbenneton91@google.ca
327	2	Kim	Barthelmes	Mikol	696-847-4120	42 Rowland Hill	6.153.64.164	mbarthelmes92@comsenz.com
328	7	Jackquelin	Diemer	Sibbie	314-113-2799	99 Killdeer Avenue	55.37.230.74	sdiemer93@cnet.com
329	7	Tobiah	Lodevick	Gerri	844-725-5054	077 Bashford Road	170.242.155.164	glodevick94@scribd.com
330	4	Shaina	Howlin	Bevon	723-960-9093	1692 Aberg Alley	238.251.227.132	bhowlin95@networkadvertising.org
331	2	Renell	Glowinski	Molli	360-284-8099	099 Crescent Oaks Center	150.132.98.86	mglowinski96@barnesandnoble.com
332	6	Tod	Fawckner	Berti	816-786-7227	4 Eagan Plaza	249.205.224.48	bfawckner97@aol.com
333	5	Duffie	Yerlett	Sid	313-169-4271	3667 Meadow Vale Park	143.249.53.119	syerlett98@liveinternet.ru
334	6	Elsworth	Mantione	Phillis	834-297-1673	5953 Tomscot Point	222.94.224.225	pmantione99@meetup.com
335	1	Boonie	Lago	Mariellen	407-216-0149	7322 Mcguire Avenue	161.238.62.181	mlago9a@blogspot.com
336	10	Coralie	Surmeyer	Rockie	772-637-2279	0256 Oxford Avenue	179.9.63.32	rsurmeyer9b@state.gov
337	2	Sissy	Craney	Beltran	317-151-5801	2139 Menomonie Court	22.248.159.151	bcraney9c@marketwatch.com
338	5	Chaim	Troughton	Shelley	304-440-5328	742 Eagan Trail	107.210.180.6	stroughton9d@blogs.com
339	1	Marya	Rizzardo	Jacenta	790-477-1610	27 Maywood Point	124.61.110.221	jrizzardo9e@opensource.org
340	2	Donnie	Ray	Brady	547-650-8348	47456 Mcguire Way	171.14.158.121	bray9f@whitehouse.gov
341	10	Allard	Boorne	Graehme	832-976-2791	57542 Evergreen Trail	87.211.218.239	gboorne9g@ed.gov
342	5	Sharia	Dovydenas	Barri	669-809-9695	0922 Golden Leaf Place	176.82.103.119	bdovydenas9h@macromedia.com
343	5	Tildi	De Hailes	Ronnie	248-660-4344	3650 Lakeland Avenue	113.51.3.220	rdehailes9i@blogs.com
344	10	Robbie	Badgers	Vonnie	248-533-4564	228 Fair Oaks Crossing	202.114.181.199	vbadgers9j@digg.com
345	5	Berna	Wastie	Rudie	492-365-5022	96 Kim Street	53.195.200.1	rwastie9k@paginegialle.it
346	3	Mortie	Keelan	Cora	491-270-1876	8158 Victoria Center	61.237.181.119	ckeelan9l@cdbaby.com
347	4	Teirtza	Perigo	Ron	845-160-1507	0 Mifflin Drive	124.192.139.23	rperigo9m@howstuffworks.com
348	10	Artair	Mac Giolla Pheadair	Alisha	480-343-2642	007 Dunning Circle	91.179.19.167	amacgiollapheadair9n@nasa.gov
349	10	Perceval	Barends	Herrick	989-325-0685	4 Riverside Terrace	186.246.128.204	hbarends9o@furl.net
350	6	Allison	Norkett	Sigmund	994-638-1634	30419 Mccormick Parkway	82.8.236.41	snorkett9p@rediff.com
351	9	Abran	Itschakov	Felipe	762-906-1735	15 Ryan Plaza	5.39.116.71	fitschakov9q@de.vu
352	10	Lilith	Hanbridge	King	140-709-7357	843 Spohn Terrace	28.74.242.24	khanbridge9r@ucla.edu
353	10	Noble	Terrazzo	Tulley	407-224-5832	862 Golf View Circle	203.79.204.63	tterrazzo9s@umich.edu
354	6	Dulcine	Olwen	Vite	339-840-4582	1 Washington Terrace	97.3.162.44	volwen9t@reddit.com
355	7	Eziechiele	Quincey	Debbi	321-568-9696	08 Schmedeman Way	29.114.132.128	dquincey9u@amazon.co.uk
356	10	Sawyere	Guerrero	Nicholas	115-539-6615	4 Mifflin Way	182.159.74.93	nguerrero9v@cpanel.net
357	10	Zelig	Ryhorovich	Niki	702-522-3464	50 Armistice Pass	190.236.196.168	nryhorovich9w@technorati.com
358	8	Leonhard	Blackaller	Francisca	786-881-7237	887 Ridgeway Road	188.97.40.56	fblackaller9x@technorati.com
359	8	Gweneth	Rossey	Abdel	721-368-9577	31 Bultman Lane	102.153.91.121	arossey9y@blogger.com
360	7	Coral	Brockington	Shoshana	979-246-0908	70 Blaine Point	145.187.128.183	sbrockington9z@jiathis.com
361	8	Lebbie	Charlson	Northrop	629-729-9791	7 Farwell Drive	175.50.95.191	ncharlsona0@theglobeandmail.com
362	5	Lothario	Goning	Hedda	213-846-7879	08381 Columbus Lane	251.101.118.72	hgoninga1@shop-pro.jp
363	1	Davida	Tapenden	Renee	216-516-8264	3554 Browning Road	113.80.43.120	rtapendena2@nba.com
364	5	Sheryl	Jados	Myranda	279-470-4974	08 Manufacturers Parkway	117.18.238.152	mjadosa3@naver.com
365	7	Celka	Gwalter	Waverly	223-547-4864	224 Linden Place	7.98.221.41	wgwaltera4@digg.com
366	3	Jard	Ronchka	Benedikta	348-642-0113	0 Ruskin Point	159.72.36.5	bronchkaa5@amazon.co.uk
367	3	Trev	Marishenko	Doralin	808-366-9407	87 Ilene Hill	121.100.198.190	dmarishenkoa6@nps.gov
368	6	Aeriel	Battisson	Kissiah	363-283-9154	19 Sachs Lane	223.186.29.173	kbattissona7@altervista.org
369	2	Shena	Hasley	Kariotta	237-335-2261	63028 Meadow Valley Lane	1.184.48.93	khasleya8@europa.eu
370	4	Meade	Jachimiak	Karisa	532-339-2708	7 7th Trail	121.40.115.203	kjachimiaka9@live.com
371	10	Major	Canaan	Sebastien	934-252-2692	6 Melvin Hill	224.199.136.217	scanaanaa@unblog.fr
372	4	Shelly	Sussams	Jayne	323-515-7341	1 Talmadge Road	119.99.118.116	jsussamsab@merriam-webster.com
373	10	Piper	Bus	Stacy	600-622-9036	442 Springview Court	40.22.232.137	sbusac@mediafire.com
374	5	Kassandra	Kingsmill	Ashlin	579-971-9447	93577 Sauthoff Terrace	51.78.190.75	akingsmillad@deliciousdays.com
375	10	Petunia	Walklett	Conrad	334-265-1373	363 Messerschmidt Terrace	66.30.1.210	cwalklettae@google.com.au
376	4	Anette	Golley	Berte	213-286-1096	735 Pond Circle	99.43.122.197	bgolleyaf@house.gov
377	4	Wendeline	Shovell	Perice	748-250-4666	1822 Arapahoe Crossing	74.3.150.101	pshovellag@pen.io
378	3	Jamey	Tomas	Farlie	159-211-4912	11668 Hollow Ridge Drive	24.223.217.220	ftomasah@people.com.cn
379	7	Dannie	Feeney	Selie	662-534-6826	9 Burning Wood Plaza	194.135.137.100	sfeeneyai@vk.com
380	10	Randy	Osborne	Marcelline	211-910-3382	8 Morning Hill	137.251.30.72	mosborneaj@opensource.org
381	6	Alick	Bunston	Louie	548-173-8193	66761 Jenifer Circle	59.91.97.207	lbunstonak@harvard.edu
382	6	Brandy	Messitt	Brigid	625-303-1541	069 Karstens Parkway	134.72.209.56	bmessittal@mapquest.com
383	3	Bartholomeo	Messent	Katey	224-475-3393	1632 Dryden Crossing	47.57.227.200	kmessentam@addthis.com
384	1	Karin	Calbrathe	Olenka	938-566-3730	0 Dwight Drive	113.241.248.168	ocalbrathean@prweb.com
385	7	Lesley	Roblett	Quinta	489-140-3788	4389 Beilfuss Trail	17.58.82.186	qroblettao@jugem.jp
386	1	Adan	Habbal	Aldous	796-133-8478	892 Schlimgen Pass	58.33.249.208	ahabbalap@squarespace.com
387	1	Andrei	Molesworth	Kennedy	606-559-4533	5 Dovetail Circle	11.176.117.102	kmolesworthaq@etsy.com
388	7	Rachelle	Lovitt	Sarina	661-708-3926	81 Transport Park	27.48.47.83	slovittar@ted.com
389	10	Helenka	Westell	Kinna	334-752-2322	0604 Jackson Junction	229.19.121.183	kwestellas@list-manage.com
390	9	Pepita	Grzelak	Ede	631-369-5849	33 Chive Junction	203.175.215.50	egrzelakat@alexa.com
391	3	Shanna	Kingscote	Norma	185-359-5801	34 Maple Pass	229.194.143.111	nkingscoteau@hao123.com
392	4	Madeline	Braam	Lori	624-193-7948	35337 6th Court	34.217.244.3	lbraamav@netvibes.com
393	7	Noland	Baldack	Fernanda	948-609-6084	66 Schlimgen Avenue	209.65.88.79	fbaldackaw@google.com.hk
394	6	Madelle	Chimenti	Kennett	618-411-5303	01 Washington Lane	99.236.209.74	kchimentiax@twitter.com
395	8	Jodi	Roddam	Georgina	661-346-9639	130 Northwestern Drive	135.89.160.48	groddamay@hubpages.com
396	5	Wallie	Petrazzi	Dolph	851-747-5099	847 Pepper Wood Lane	1.66.204.216	dpetrazziaz@npr.org
397	9	Hugibert	Longmaid	Slade	525-163-3181	5 Cardinal Lane	199.123.205.5	slongmaidb0@vk.com
398	9	Gratia	Nolli	Roselin	416-535-3687	3 Ilene Road	253.38.28.61	rnollib1@feedburner.com
399	6	Melosa	Viger	Dennie	338-884-2144	6746 Ramsey Street	197.193.27.97	dvigerb2@upenn.edu
400	2	Meade	Satchel	Allie	571-987-6232	66 Hudson Avenue	117.25.115.80	asatchelb3@forbes.com
401	7	Lorene	Vince	Adi	294-520-6594	30543 La Follette Terrace	218.63.138.5	avinceb4@google.cn
402	6	Aeriell	Kobke	Monte	900-306-9179	096 Waubesa Street	197.206.104.155	mkobkeb5@fotki.com
403	8	Emmalyn	Ambroz	Douglas	637-995-3341	67932 Dayton Hill	150.215.231.66	dambrozb6@freewebs.com
404	3	Leoline	Voaden	Sebastien	113-493-3982	87640 Milwaukee Place	93.140.232.252	svoadenb7@4shared.com
405	7	Sigfried	Carrier	Robina	407-576-6223	3758 Huxley Hill	248.235.238.198	rcarrierb8@linkedin.com
406	7	Gerhardine	Hawk	Ingelbert	532-936-9128	3 Dottie Junction	71.206.165.111	ihawkb9@phpbb.com
407	2	Jan	Vankin	Sybille	979-996-2317	11 Commercial Pass	213.101.218.138	svankinba@cdc.gov
408	7	Karyl	Bisseker	Traci	190-538-1082	51 Fulton Junction	154.241.164.19	tbissekerbb@seesaa.net
409	3	Gratia	Courtin	Codie	211-189-5986	581 Hauk Lane	130.165.173.91	ccourtinbc@shop-pro.jp
410	5	Elbertina	Cureton	Addie	726-277-1895	1816 Linden Hill	47.80.88.244	acuretonbd@nba.com
411	1	Vanya	Griffith	Ludovika	953-302-1785	4 Shoshone Lane	137.240.230.237	lgriffithbe@ftc.gov
412	2	Fairfax	Balsdon	Queenie	243-865-1020	874 Scofield Junction	235.98.195.34	qbalsdonbf@eventbrite.com
413	10	Teresina	Bullard	Lynda	973-786-6787	6695 Katie Court	69.10.135.50	lbullardbg@wired.com
414	10	Gaynor	Bangle	Ruprecht	967-706-9831	42 Luster Alley	144.3.211.151	rbanglebh@examiner.com
415	3	Nicky	Franckton	Querida	256-837-9430	37 Raven Parkway	169.123.21.33	qfrancktonbi@last.fm
416	8	Dirk	Stenning	Pierre	449-649-4244	33 Forest Dale Parkway	138.16.227.33	pstenningbj@jimdo.com
417	1	Cyndi	Blucher	Lonnie	859-984-5590	096 Oak Valley Trail	167.163.103.120	lblucherbk@1688.com
418	2	Angil	Gadeaux	Nola	984-599-4868	829 Mitchell Circle	182.91.124.105	ngadeauxbl@amazon.com
419	6	Cary	Dockree	Jordan	461-544-0855	4 Toban Trail	175.252.41.194	jdockreebm@odnoklassniki.ru
420	4	Emmanuel	Beetles	Maressa	723-791-6471	449 Bay Street	233.33.172.17	mbeetlesbn@chronoengine.com
421	4	Thom	Lye	Darcie	927-993-8627	097 Debra Trail	78.16.255.141	dlyebo@nydailynews.com
422	2	Cammi	Jurasek	Carol	851-175-6393	219 Boyd Way	196.109.187.221	cjurasekbp@nsw.gov.au
423	5	Gregorius	MacRannell	Jeddy	312-259-4386	868 International Junction	22.112.86.171	jmacrannellbq@histats.com
424	7	Morganica	Elden	Herbie	615-335-2126	2 Sundown Pass	170.56.208.162	heldenbr@paypal.com
425	6	Ryann	Moreinu	Margit	535-839-8753	910 Lakewood Gardens Park	26.58.25.237	mmoreinubs@berkeley.edu
426	2	Beckie	Dransfield	Ailyn	233-223-2969	99083 Pine View Pass	62.194.70.196	adransfieldbt@twitter.com
427	8	Edlin	Semark	Cristie	663-429-3041	77 School Pass	39.188.197.25	csemarkbu@macromedia.com
428	3	Latrena	Smalcombe	Wilhelmina	210-712-5649	95180 Gerald Avenue	76.11.137.125	wsmalcombebv@elegantthemes.com
429	10	Winnie	Allibone	Laurence	297-714-4149	818 Derek Court	124.253.232.200	lallibonebw@hc360.com
430	4	Fritz	Joly	Bessy	167-443-1640	94 Monterey Center	152.54.17.153	bjolybx@unc.edu
431	2	Wildon	Poschel	Munmro	849-734-2520	0 Weeping Birch Avenue	14.149.64.206	mposchelby@symantec.com
432	5	Zebedee	Truluck	Nonna	223-763-8260	1 Tennessee Pass	133.129.148.214	ntruluckbz@bing.com
433	2	Juliane	Edmead	Keary	200-318-0257	5 Hooker Point	215.160.45.212	kedmeadc0@squidoo.com
434	7	Payton	Quiddington	Ingmar	630-562-5645	25334 Morrow Lane	171.155.1.168	iquiddingtonc1@blog.com
435	2	Shanta	Gyves	Afton	371-693-9806	21840 Veith Circle	40.129.221.49	agyvesc2@businessinsider.com
436	4	Brice	Masi	Ogdan	261-864-4647	8445 Swallow Place	7.159.137.115	omasic3@feedburner.com
437	10	Jarvis	Huzzey	Germaine	851-784-8427	18 Red Cloud Street	99.28.225.241	ghuzzeyc4@themeforest.net
438	5	Vevay	Phalip	Ignaz	808-880-4943	9872 Monterey Drive	100.174.88.193	iphalipc5@tripod.com
439	6	Brandy	Colliss	Felipe	999-125-9385	17 Northport Lane	243.158.6.236	fcollissc6@senate.gov
440	8	Jeremie	Pluck	Feodora	609-482-8519	57 Bellgrove Hill	246.176.83.207	fpluckc7@nationalgeographic.com
441	6	Mathilde	Hanscomb	Correy	829-390-1456	12 Artisan Place	7.239.219.91	chanscombc8@barnesandnoble.com
442	10	Georgeanne	Piatto	Mari	509-531-5520	74989 New Castle Hill	244.56.199.110	mpiattoc9@webs.com
443	8	Robenia	Kenaway	Laura	319-332-7659	18 Weeping Birch Point	49.210.153.142	lkenawayca@arizona.edu
444	8	Odessa	Bonnar	Karlens	729-934-6600	4 Daystar Point	158.45.65.97	kbonnarcb@hugedomains.com
445	1	Clevey	Maylam	Maire	412-824-5976	49360 Susan Plaza	27.129.174.58	mmaylamcc@deviantart.com
446	5	Dougie	Conochie	Illa	472-434-6466	35316 Norway Maple Trail	229.128.72.67	iconochiecd@webs.com
447	6	Gwendolyn	Paoloni	Myrtle	628-257-8571	45 Maple Wood Road	234.174.5.121	mpaolonice@bing.com
448	6	Felita	Drugan	Joey	757-258-7028	574 Esker Trail	201.187.40.167	jdrugancf@flavors.me
449	3	Simona	Cornock	Pryce	394-902-1698	1 Harbort Way	104.97.6.5	pcornockcg@alibaba.com
450	7	Kelwin	Boughen	Rorie	851-296-1786	0 David Junction	158.167.192.165	rboughench@wikia.com
451	10	Bengt	Hanbury	Barbara	940-829-3556	5 Saint Paul Way	91.53.23.142	bhanburyci@nationalgeographic.com
452	4	Ryun	Baysting	Wolfie	870-772-1553	9111 Ridgeway Plaza	193.210.144.186	wbaystingcj@slashdot.org
453	3	Brinn	Kenworthy	Marc	246-927-2778	50664 Esker Center	57.3.29.31	mkenworthyck@naver.com
454	1	Paul	Gladden	Reggie	299-618-5830	5 Lunder Avenue	65.107.149.129	rgladdencl@auda.org.au
455	6	Luise	Orme	Abbie	367-834-0876	18 Golf Course Pass	26.3.51.157	aormecm@goodreads.com
456	9	Chelsie	Amaya	Eden	334-290-1042	56544 Kedzie Lane	116.145.18.23	eamayacn@weibo.com
457	2	Tracey	Obispo	Bernhard	167-795-1509	78026 Schurz Circle	200.239.232.175	bobispoco@newyorker.com
458	2	Winthrop	Shakespeare	Ruprecht	964-734-0145	97 Walton Street	66.75.116.45	rshakespearecp@vimeo.com
459	2	Dniren	Chadburn	Bartholomeo	765-791-3038	41499 Shelley Center	103.127.188.203	bchadburncq@ning.com
460	7	Edlin	Callingham	Uta	169-550-5703	5214 Holmberg Place	126.210.30.175	ucallinghamcr@last.fm
461	5	Mitchell	Stede	Valentina	963-768-0724	636 Petterle Center	246.17.136.175	vstedecs@usgs.gov
462	4	Rickey	Geall	Nessy	822-833-6862	2 Corry Pass	155.116.121.95	ngeallct@merriam-webster.com
463	1	Wynnie	Creamer	Clovis	106-247-2486	9038 Lakeland Alley	179.51.181.165	ccreamercu@issuu.com
464	2	Wynn	Haynes	Penni	432-205-4088	3142 Hagan Court	176.79.30.153	phaynescv@geocities.jp
465	5	Vanessa	Ruffles	Land	627-811-2096	6727 Comanche Terrace	7.28.195.139	lrufflescw@taobao.com
466	6	Pierrette	Gibbard	Evonne	656-950-4278	62 Division Junction	82.181.107.18	egibbardcx@youtu.be
467	10	Ellerey	Traill	Brantley	375-690-9044	26 Del Sol Park	161.53.51.141	btraillcy@shutterfly.com
468	1	Flora	Hobgen	Chelsae	831-195-6783	65 Spaight Drive	0.246.61.12	chobgencz@umn.edu
469	4	Leonanie	Brantl	Ward	395-142-0883	696 Nobel Avenue	67.239.60.30	wbrantld0@ted.com
470	2	Barclay	Spencock	Sibeal	445-802-9351	7 Carpenter Park	183.241.194.68	sspencockd1@fotki.com
471	5	Brinna	Woollin	Homerus	102-645-7635	30076 Hagan Park	113.191.52.118	hwoollind2@wordpress.com
472	6	Cornell	Yegorkin	Mahalia	818-447-5504	8397 Mayer Circle	31.2.139.139	myegorkind3@elpais.com
473	4	Krystalle	Coleridge	Nathan	896-469-2427	695 Norway Maple Street	163.99.60.191	ncoleridged4@spotify.com
474	5	Kendrick	Sainsbury-Brown	Constantina	752-943-4718	63950 Mosinee Junction	157.227.16.177	csainsburybrownd5@washington.edu
475	7	Duff	Harley	Orv	553-419-0017	98482 Hermina Junction	13.105.116.120	oharleyd6@discovery.com
476	6	Jacquenette	Dawton	Elenore	397-476-3470	8 Prairie Rose Crossing	80.131.137.40	edawtond7@godaddy.com
477	5	Angelika	Liptrot	Amy	732-691-0536	37954 Farwell Park	102.46.28.24	aliptrotd8@pagesperso-orange.fr
478	5	Jenna	Hathwood	Leroy	847-265-9482	5301 Acker Parkway	112.63.12.247	lhathwoodd9@ning.com
479	3	Amory	Brasier	Maddy	166-649-3505	58017 Sullivan Drive	148.37.135.1	mbrasierda@imdb.com
480	7	Ede	Carcas	Osmond	713-432-9360	14468 1st Hill	67.106.136.145	ocarcasdb@yahoo.com
481	2	Colby	Lorryman	Eleanor	321-159-4225	364 Hoard Road	23.0.70.193	elorrymandc@sciencedaily.com
482	2	Thomas	Benkhe	Cullin	684-862-7427	4 Anderson Center	248.160.97.115	cbenkhedd@skyrock.com
483	3	Reube	Hynard	Randi	472-637-8013	5 Clove Terrace	124.53.207.105	rhynardde@google.com.hk
484	4	Leta	Gledhill	Phillip	386-550-3802	77104 Spohn Way	230.76.229.244	pgledhilldf@seattletimes.com
485	8	Shane	Polak	Wylie	122-424-7635	28831 Butternut Alley	7.240.104.42	wpolakdg@icio.us
486	9	Salome	Zywicki	Shanna	615-591-3023	32850 Moulton Way	96.180.234.103	szywickidh@1und1.de
487	2	Coreen	Sporle	Alyssa	816-362-1729	898 Raven Avenue	203.106.235.127	asporledi@parallels.com
488	8	Harrie	Tunuy	Domini	353-811-0986	53 High Crossing Way	27.252.20.18	dtunuydj@bluehost.com
489	1	Quinn	Long	Dillon	860-143-8893	8 Forest Run Drive	179.88.153.213	dlongdk@over-blog.com
490	6	Worthy	Stubbings	Sigismund	703-521-9947	5600 Pierstorff Road	38.138.46.170	sstubbingsdl@gmpg.org
491	7	Jeremiah	Lapree	Gabriello	626-659-5445	4 Eastlawn Junction	144.126.80.236	glapreedm@bluehost.com
492	8	Bernardine	Longhirst	Patric	173-287-4751	7 Pepper Wood Drive	69.27.90.69	plonghirstdn@spotify.com
493	3	Kirbie	Attride	Rosemarie	325-428-4263	7 Bowman Parkway	162.164.84.72	rattridedo@salon.com
494	2	Zachariah	Tommasuzzi	Lorinda	850-339-5121	9 Sycamore Plaza	164.115.60.62	ltommasuzzidp@google.pl
495	2	Harvey	Klimkowski	Denys	698-987-0705	69 Talmadge Center	104.130.133.235	dklimkowskidq@mediafire.com
496	1	Miltie	Jolliman	Kent	172-493-6255	76037 Goodland Circle	124.136.64.208	kjollimandr@hubpages.com
497	10	Keene	Worters	Mycah	251-586-5405	8763 Dexter Crossing	167.118.117.253	mwortersds@google.pl
498	3	Devy	Nevinson	Jenilee	276-810-3169	755 Norway Maple Alley	136.126.163.235	jnevinsondt@nhs.uk
499	10	Bette	Kilmister	Auria	447-585-7285	752 Anniversary Pass	133.196.216.142	akilmisterdu@nature.com
500	7	Tannie	Blackboro	Reeva	934-553-3992	710 Village Crossing	114.76.39.143	rblackborodv@comsenz.com
501	4	Lorin	Sillick	Cecilia	595-379-5610	1 Hayes Pass	47.21.71.17	csillickdw@icio.us
502	6	Aldous	Sulter	Daveta	307-484-4226	86511 Morning Park	117.87.149.72	dsulterdx@wsj.com
503	4	Adan	MacShirrie	Michele	926-193-9990	6656 Northview Hill	178.91.173.240	mmacshirriedy@netlog.com
504	10	Paulette	Bwy	Lucy	607-866-9087	00173 Ilene Hill	243.126.106.179	lbwydz@clickbank.net
505	4	L;urette	Vlach	Federico	435-617-3381	7 Roth Drive	217.134.99.22	fvlache0@hugedomains.com
506	2	Cherie	Bridden	Trace	325-136-0119	27488 Jay Park	149.9.117.109	tbriddene1@lycos.com
507	4	Shina	Laytham	Lockwood	445-380-4482	78301 Hintze Lane	75.75.106.247	llaythame2@networkadvertising.org
508	2	Gale	Huxstep	Berri	301-828-0642	726 Jay Court	51.239.90.116	bhuxstepe3@smh.com.au
509	7	Gerri	Michin	Dael	987-857-3564	02 American Trail	69.210.237.21	dmichine4@tiny.cc
510	8	Cristiano	Jadczak	Lynnet	492-310-5549	7 Utah Point	114.205.109.103	ljadczake5@smh.com.au
511	1	Doralyn	Wrightem	Jakob	249-884-7677	8 Norway Maple Park	70.130.208.119	jwrighteme6@macromedia.com
512	4	Carolina	Aguirre	Merci	199-135-6782	55032 Melby Park	73.142.104.47	maguirree7@list-manage.com
513	4	Meyer	Cherrison	Tabby	406-863-6752	74293 Ohio Court	112.209.10.241	tcherrisone8@diigo.com
514	8	Mohandis	Joint	Clarine	966-566-2316	6 Orin Circle	158.47.224.176	cjointe9@google.com.br
515	6	Morena	Yanukhin	Sasha	279-933-0739	44393 Mallory Hill	159.155.141.203	syanukhinea@ehow.com
516	4	Jessie	Tomowicz	Alberta	940-817-9633	61915 Dapin Terrace	101.45.85.148	atomowiczeb@bbb.org
517	2	Clayson	Foddy	Marlow	943-293-1274	33939 Sommers Center	185.203.179.78	mfoddyec@prlog.org
518	9	Brewer	Pudney	Wenona	378-937-0787	92284 Susan Circle	193.96.212.227	wpudneyed@abc.net.au
519	3	Dyanna	Esgate	Guendolen	567-329-7167	53875 Hintze Road	158.190.13.64	gesgateee@businessinsider.com
520	6	Nell	Kahane	Tobie	507-537-9255	16932 Union Road	21.238.14.46	tkahaneef@sciencedirect.com
521	3	Ginger	McCleod	Christalle	698-173-3104	72 Northwestern Road	82.67.144.168	cmccleodeg@tiny.cc
522	3	Tabby	Sharrier	Elfreda	166-461-6954	882 Westerfield Trail	44.231.201.39	esharriereh@moonfruit.com
523	7	Thomas	Hayselden	Vick	925-592-1062	75 Corscot Hill	144.229.139.65	vhayseldenei@stanford.edu
524	9	Pauly	Beevor	Maximilian	581-575-7168	2 Mayer Lane	67.179.155.190	mbeevorej@usatoday.com
525	7	Gabe	Tomik	Lalo	326-611-9367	6910 Pine View Terrace	65.186.252.180	ltomikek@yale.edu
526	4	Cora	Danilevich	Joby	598-313-7682	42258 Myrtle Hill	3.148.243.128	jdanilevichel@opera.com
527	4	Sarine	Moorton	Betty	397-965-5296	746 Welch Alley	29.168.177.0	bmoortonem@imgur.com
528	3	Rodger	Backshall	Tersina	573-401-0655	05 Ryan Junction	17.140.89.189	tbackshallen@deliciousdays.com
529	8	Vilma	Tattoo	Ingaborg	359-896-3432	2741 Merchant Center	80.129.115.194	itattooeo@flavors.me
530	9	Silvanus	Ticksall	Godfry	514-933-1535	4 Waywood Parkway	105.113.217.37	gticksallep@dagondesign.com
531	2	Vikki	Marrison	Robyn	944-209-5013	178 Kenwood Parkway	223.107.66.6	rmarrisoneq@dell.com
532	2	Seamus	Pina	Giralda	540-282-0959	7 Johnson Pass	95.159.222.133	gpinaer@people.com.cn
533	6	Saundra	Henrie	Lissa	561-619-9725	78825 Butterfield Drive	121.252.91.180	lhenriees@arizona.edu
534	1	Field	Skain	Lemuel	214-109-9336	33 Troy Point	96.26.180.152	lskainet@marriott.com
535	2	Papageno	Pierrepont	Dietrich	974-149-1827	367 Farmco Street	200.116.201.70	dpierreponteu@list-manage.com
536	4	Morley	Trundle	Harriet	610-807-5955	741 Norway Maple Park	97.80.20.83	htrundleev@oakley.com
537	4	Lucien	Geeve	Allianora	100-244-3167	3283 Waywood Place	124.18.120.69	ageeveew@ow.ly
538	8	Ralf	Guice	Ferguson	573-773-2650	386 Alpine Terrace	177.108.21.137	fguiceex@mapy.cz
539	6	Janenna	Housen	Rena	910-514-6825	34822 Florence Pass	55.135.75.218	rhouseney@wisc.edu
540	6	Leyla	Mordey	Thaddus	267-814-2049	0383 Moulton Place	113.108.254.248	tmordeyez@4shared.com
541	6	Angy	Gowanlock	Brianna	689-273-2895	27 Crowley Lane	1.14.217.185	bgowanlockf0@bbb.org
542	8	Ondrea	Jest	Ginger	815-107-9299	48716 Talisman Plaza	182.0.209.157	gjestf1@ask.com
543	3	Batsheva	Tackes	Jeff	405-591-9347	4782 Red Cloud Plaza	245.143.54.57	jtackesf2@privacy.gov.au
544	3	Torry	Sibly	D'arcy	682-355-6237	4760 Spaight Point	80.241.49.86	dsiblyf3@topsy.com
545	9	Rafaela	Redsall	Bobbie	818-934-2081	2905 Stuart Circle	214.249.34.83	bredsallf4@blogger.com
546	2	Devlin	Hobden	Daren	635-456-0242	6 Scott Lane	224.125.155.193	dhobdenf5@marriott.com
547	5	Ethelred	Pope	York	681-758-4184	25 Emmet Center	53.109.30.251	ypopef6@plala.or.jp
548	1	Vinnie	Dutson	Nathanil	864-502-9494	618 Hermina Place	16.43.19.135	ndutsonf7@boston.com
549	4	Cherish	Parsell	Hieronymus	392-928-5112	3382 Buhler Lane	88.242.51.50	hparsellf8@freewebs.com
550	1	Agnes	Houlton	Thurston	901-868-7592	832 Manitowish Terrace	51.174.46.171	thoultonf9@about.com
551	5	Star	Antat	Helaine	761-968-5551	0 Oriole Court	87.169.232.150	hantatfa@gizmodo.com
552	2	Robinia	Whyman	Dana	102-698-4641	7 Quincy Street	249.15.166.6	dwhymanfb@yahoo.com
553	8	Ario	Clempton	Steffane	561-319-3401	07661 Fieldstone Park	237.15.198.27	sclemptonfc@blinklist.com
554	2	Ariana	Papaccio	Clifford	346-114-0333	526 Del Sol Way	143.61.213.203	cpapacciofd@jugem.jp
555	7	Darcie	Kunath	Mariette	898-980-8762	5 Delaware Street	130.82.239.52	mkunathfe@tripadvisor.com
556	4	Garvin	Winger	Imojean	517-128-4129	99327 Calypso Avenue	126.50.43.246	iwingerff@bigcartel.com
557	3	Cassi	Flanaghan	Saree	639-330-7230	726 Southridge Terrace	131.5.166.241	sflanaghanfg@imgur.com
558	1	Egbert	Caustic	Barbette	915-461-0529	1 Messerschmidt Road	46.3.207.110	bcausticfh@hhs.gov
559	7	Gerrard	Vaggers	Onfroi	868-820-4733	56355 Briar Crest Pass	120.132.164.22	ovaggersfi@live.com
560	5	Alexia	Linley	Sybila	604-291-4615	3704 Sugar Avenue	65.14.97.247	slinleyfj@toplist.cz
561	1	Faye	Ewbanke	Justus	555-806-4300	40 Manley Lane	164.144.245.173	jewbankefk@dot.gov
562	3	Genvieve	Glayzer	Jarrad	563-281-0831	72 Cherokee Terrace	84.73.119.181	jglayzerfl@constantcontact.com
563	10	Ulrica	Maudett	Isidro	318-889-8228	6 Cordelia Way	138.62.214.34	imaudettfm@microsoft.com
564	2	Zebedee	Elis	Hasty	781-285-0319	97 Harper Pass	254.21.42.3	helisfn@sakura.ne.jp
565	6	Aimil	Senner	Christos	363-863-0018	80 Talmadge Place	28.225.108.217	csennerfo@wikispaces.com
566	10	Kaia	Summerrell	Brit	408-575-3890	197 Veith Hill	88.253.52.9	bsummerrellfp@istockphoto.com
567	6	Devlen	Size	Amber	593-102-0091	1 Norway Maple Avenue	5.174.37.13	asizefq@prnewswire.com
568	1	Misti	Ransbury	Denis	521-343-1494	9159 Gerald Hill	93.75.108.146	dransburyfr@1und1.de
569	8	Chicky	Wahncke	Harlin	220-885-0531	3 Bayside Street	61.32.253.90	hwahnckefs@bravesites.com
570	10	Decca	Redmille	Liza	855-737-6542	7 Crescent Oaks Avenue	183.25.46.109	lredmilleft@earthlink.net
571	1	Seymour	Bembrick	Pamelina	359-176-9294	604 Bashford Hill	89.174.246.139	pbembrickfu@storify.com
572	2	Llewellyn	Cheek	Yanaton	108-905-1463	29813 Duke Road	199.202.90.10	ycheekfv@msu.edu
573	10	Jackelyn	Hetterich	Phylis	850-629-1290	7167 Rutledge Lane	134.248.119.216	phetterichfw@blogtalkradio.com
574	2	Quill	Cossar	Roseann	114-648-9409	6830 Katie Road	216.140.160.187	rcossarfx@japanpost.jp
575	4	Paulina	Jannequin	Carmelia	981-937-7764	46 Miller Street	38.90.69.234	cjannequinfy@odnoklassniki.ru
576	2	Cecilla	Larderot	Lois	495-194-6833	27534 Oak Valley Court	97.137.145.100	llarderotfz@forbes.com
577	1	Jarid	Lynde	Enrika	131-391-3096	60 Gateway Pass	4.225.8.131	elyndeg0@qq.com
578	7	Alexander	Leffek	Amalie	381-233-0325	6150 Manufacturers Road	45.1.119.12	aleffekg1@noaa.gov
579	6	Leeann	Bockler	Hedi	394-929-0953	407 Elgar Parkway	163.28.140.40	hbocklerg2@e-recht24.de
580	5	Brina	Du Fray	Marthena	592-647-9364	39755 Loftsgordon Alley	221.244.99.129	mdufrayg3@opensource.org
581	2	Katina	Maddyson	Samson	475-766-3455	15 Brickson Park Drive	130.156.112.63	smaddysong4@opensource.org
582	8	Arlina	Ruberti	Loretta	425-526-6308	26 Mallard Avenue	195.137.17.32	lrubertig5@jigsy.com
583	5	Maggee	Vedenyakin	Charlie	102-793-5311	315 Waywood Crossing	122.186.57.221	cvedenyaking6@mac.com
584	4	Rikki	Ritchard	Misty	927-697-2069	6509 Canary Park	199.111.60.235	mritchardg7@4shared.com
585	9	Rheba	Jaquet	Pincus	693-504-7837	20278 Bellgrove Street	18.152.140.141	pjaquetg8@fotki.com
586	6	Kristo	Carlino	Ingar	718-845-5175	6591 Ridgeview Plaza	253.158.40.88	icarlinog9@mlb.com
587	4	Hermy	Samwell	Bettine	478-940-6592	9 Calypso Hill	159.41.253.18	bsamwellga@bigcartel.com
588	5	Goldie	Tellenbrook	Ange	229-650-0052	33 Towne Pass	255.104.198.238	atellenbrookgb@ocn.ne.jp
589	4	Selina	Wilflinger	Matelda	833-796-7707	4 Eggendart Way	198.139.163.37	mwilflingergc@ftc.gov
590	1	Adolpho	Coping	Shanda	726-496-8494	373 Autumn Leaf Road	62.14.45.208	scopinggd@ucla.edu
591	7	Blinnie	Gartland	Vincents	156-289-4789	3154 5th Circle	26.197.117.188	vgartlandge@ed.gov
592	1	Aldric	Korfmann	Hill	535-831-5139	4 Sunbrook Trail	143.114.43.205	hkorfmanngf@yellowpages.com
593	5	Farlie	Mooney	Gerek	403-194-5728	66460 Independence Pass	174.191.216.48	gmooneygg@army.mil
594	7	Gertie	Snawdon	Lorrin	615-620-5067	2158 Mccormick Drive	13.34.47.238	lsnawdongh@nhs.uk
595	3	Sancho	Aubury	Freida	242-345-7749	312 Sage Road	219.236.200.194	fauburygi@smugmug.com
596	10	Waite	Marcum	Gizela	788-166-8310	8 Spaight Drive	230.98.8.104	gmarcumgj@themeforest.net
597	1	Armstrong	Winchurch	Morgan	256-654-2729	50817 Center Road	222.76.120.71	mwinchurchgk@behance.net
598	2	Jacklin	Ohms	Xylina	934-981-5609	85 Talisman Hill	13.217.223.15	xohmsgl@scribd.com
599	7	Constantine	Ainsley	Hodge	497-216-3488	68874 Melody Terrace	211.233.57.181	hainsleygm@craigslist.org
600	4	Mellicent	Mullenger	Doria	712-286-8658	8 Steensland Terrace	227.251.251.185	dmullengergn@oracle.com
601	4	Aaren	Dannett	Imelda	426-327-1425	5525 Loeprich Terrace	193.249.35.169	idannettgo@go.com
602	10	Cati	Moreinis	Winnie	535-626-2837	7 Dakota Alley	177.138.252.231	wmoreinisgp@mail.ru
603	4	Waylan	Wrintmore	Patrice	669-186-9798	8297 3rd Plaza	27.246.70.19	pwrintmoregq@ning.com
604	7	Jeno	Corinton	Reggi	675-545-0367	37 Toban Junction	211.128.219.43	rcorintongr@macromedia.com
605	9	Fifi	Heindrich	Janette	430-811-8444	407 Lien Park	176.88.89.58	jheindrichgs@yellowpages.com
606	1	Janice	Avrahamof	Marissa	749-248-8097	70 Service Alley	171.11.148.151	mavrahamofgt@oakley.com
607	6	Lily	Brick	Dante	345-945-7826	3233 Southridge Crossing	171.211.227.167	dbrickgu@walmart.com
608	3	Jude	Bradbury	Sheelah	377-609-4763	161 Milwaukee Street	198.217.7.207	sbradburygv@phpbb.com
609	1	Augustus	Stanworth	Gwynne	409-947-7943	02965 Fuller Park	209.78.190.215	gstanworthgw@noaa.gov
610	9	Jilly	Fetherstone	Antoine	759-819-7858	012 Haas Pass	4.66.39.241	afetherstonegx@cdc.gov
611	3	Glory	Lepoidevin	Rahel	459-506-6909	050 Waywood Point	208.250.72.29	rlepoidevingy@businessweek.com
612	7	Allene	Casazza	Ruy	485-713-2243	7703 Blue Bill Park Way	33.29.176.191	rcasazzagz@nytimes.com
613	3	Abbott	Dutnall	Roxanne	898-717-7880	8 Vernon Court	237.106.225.241	rdutnallh0@feedburner.com
614	8	Antonetta	Wilstead	Lacy	855-564-3396	44 Lakeland Center	124.180.54.91	lwilsteadh1@nsw.gov.au
615	4	Cord	Butlin	Stephenie	205-915-0294	11 Green Ridge Lane	171.106.66.45	sbutlinh2@slashdot.org
616	9	Lamond	Wozencraft	Ezekiel	471-710-0880	974 3rd Trail	167.78.59.50	ewozencrafth3@umich.edu
617	9	Domeniga	Barras	Dolores	881-130-4208	83 Elka Road	27.60.50.125	dbarrash4@ucoz.com
618	1	Steffi	Vause	Naoma	120-135-1800	110 Schiller Way	123.91.219.27	nvauseh5@google.com.hk
619	6	Barde	Blabie	Ned	723-532-1639	5947 Marcy Pass	209.241.61.111	nblabieh6@house.gov
620	2	Mason	Dawtry	Uriah	453-905-6273	836 Monument Lane	191.204.120.6	udawtryh7@meetup.com
621	7	Kleon	Phelipeaux	Ellie	239-819-6873	09529 Crowley Circle	58.227.35.144	ephelipeauxh8@ow.ly
622	8	Cordy	Demchen	Agathe	434-364-8032	1166 Grasskamp Alley	109.36.38.39	ademchenh9@dailymotion.com
623	3	Saloma	Yaus	Hewett	810-212-8516	0 Delladonna Alley	154.12.61.36	hyausha@imdb.com
624	9	Jean	Bril	Dionis	319-948-7690	14677 Twin Pines Parkway	155.152.231.82	dbrilhb@baidu.com
625	3	Gerti	McGaughie	Tyson	591-959-8271	7240 Crowley Point	114.131.79.134	tmcgaughiehc@ibm.com
626	6	Fraser	Paolino	Lyn	942-856-0926	24194 Vahlen Park	51.14.145.235	lpaolinohd@paginegialle.it
627	7	Micheline	Mouget	Gilberte	519-452-3098	004 Donald Circle	251.213.234.136	gmougethe@meetup.com
628	2	Brandice	Nelm	Edvard	858-613-0626	91436 Hollow Ridge Junction	172.237.133.13	enelmhf@ning.com
629	1	Sven	Raylton	Ravi	415-744-1093	70 Harbort Street	62.102.61.149	rrayltonhg@friendfeed.com
630	1	Angel	Girauld	Chadd	999-125-9549	09981 Johnson Place	97.169.50.10	cgirauldhh@wordpress.com
631	7	Lothario	Klemps	Miran	865-242-6725	8427 Meadow Ridge Hill	60.5.141.254	mklempshi@oakley.com
632	4	Buckie	Placstone	Marvin	847-828-6891	75 Logan Lane	43.149.211.171	mplacstonehj@narod.ru
633	5	Bancroft	Benion	Nikolai	706-891-3573	727 Dottie Drive	220.175.207.61	nbenionhk@csmonitor.com
634	2	Adella	Humphrys	Cass	519-195-7831	54 Maple Avenue	7.7.180.134	chumphryshl@fotki.com
635	1	Ashlee	Sworn	Raquel	430-568-0687	0041 Pennsylvania Terrace	72.225.71.246	rswornhm@zdnet.com
636	10	Dorette	Pilpovic	Jase	880-977-6384	38980 Mendota Alley	54.79.244.174	jpilpovichn@theatlantic.com
637	1	Kandace	Grzes	Tarrah	118-437-8066	705 Golf Way	19.62.35.8	tgrzesho@webnode.com
638	8	Sande	Evett	Miquela	258-961-3544	1 Scott Pass	20.63.199.120	mevetthp@pbs.org
639	10	Jeane	Larrad	Roanne	959-758-8340	6013 Northridge Park	168.114.10.156	rlarradhq@weather.com
640	6	Sherline	Sharply	Bernardine	328-758-1983	42672 Roth Park	27.224.104.130	bsharplyhr@chicagotribune.com
641	4	Jourdain	Tetlow	Katrina	198-267-6157	3716 Homewood Street	108.111.166.82	ktetlowhs@ocn.ne.jp
642	1	Anna-diana	Reinmar	Trisha	886-360-7455	7071 Butterfield Road	95.134.71.71	treinmarht@walmart.com
643	3	Thacher	McMurtyr	Esme	395-382-6025	58782 Jay Pass	113.149.198.64	emcmurtyrhu@scientificamerican.com
644	5	Vaughn	Scorah	Mersey	505-233-3931	23785 Oneill Place	143.114.126.5	mscorahhv@joomla.org
645	7	Haven	Cowcha	Marna	447-416-4580	4 Farmco Place	176.222.183.160	mcowchahw@cyberchimps.com
646	2	Arabella	Dufer	Dayle	234-355-8327	6447 Wayridge Crossing	186.42.132.245	dduferhx@ustream.tv
647	5	Nickolas	Thews	Alisa	633-563-7346	940 Mallard Park	237.244.162.34	athewshy@dmoz.org
648	10	Tiphany	Herreran	Claybourne	760-661-6680	05 Trailsway Plaza	117.253.248.22	cherreranhz@shutterfly.com
649	1	Claudia	Argont	Lela	918-841-9013	04 Heath Pass	244.242.59.152	largonti0@google.nl
650	3	Terrance	Hakeworth	Willamina	565-942-1014	1 Esch Avenue	77.71.240.194	whakeworthi1@nymag.com
651	1	Willi	Giffen	Klarrisa	309-998-6993	5885 Iowa Junction	105.225.238.125	kgiffeni2@google.pl
652	4	Starla	Flindall	Nappy	843-165-0969	3 Dovetail Crossing	139.34.101.25	nflindalli3@myspace.com
653	2	Goldarina	Mollison	Carry	675-495-2500	3200 Summerview Alley	116.234.1.188	cmollisoni4@geocities.com
654	3	Joli	Rean	Land	274-929-4887	1601 Brown Crossing	215.217.255.180	lreani5@chron.com
655	8	Mellie	Bart	Milicent	691-718-3406	48 Parkside Point	187.97.232.79	mbarti6@xing.com
656	8	Faustine	Pont	Bridie	177-772-8299	45 Starling Terrace	134.194.231.142	bponti7@cisco.com
657	7	Booth	Tryme	Lona	348-273-2749	79145 Pearson Terrace	7.143.169.208	ltrymei8@house.gov
658	10	Toddy	Maffione	Davide	426-463-6144	54 Scofield Crossing	225.45.91.66	dmaffionei9@multiply.com
659	5	Meredithe	Gibbings	Aretha	292-976-2621	91 Rigney Circle	110.86.208.147	agibbingsia@constantcontact.com
660	8	Efren	Cowap	Hirsch	928-497-6629	116 South Lane	127.37.226.250	hcowapib@plala.or.jp
661	7	Nolan	Kivits	Alli	125-257-1290	65400 Arrowood Crossing	252.148.28.68	akivitsic@google.it
662	10	Cora	Henfre	Rollie	870-585-6279	55 Evergreen Park	13.246.19.119	rhenfreid@cyberchimps.com
663	5	Tiffany	Ferre	Noelyn	497-164-1866	05874 Southridge Way	115.223.20.105	nferreie@dot.gov
664	4	Melony	Wodham	Opaline	340-345-0819	4032 Graedel Lane	93.123.219.108	owodhamif@jimdo.com
665	10	Wallis	Gartshore	Beatrice	711-422-1529	9254 Elmside Trail	52.196.227.89	bgartshoreig@redcross.org
666	5	Harlen	Ascough	Ansel	626-666-9293	6 Stephen Parkway	246.116.99.76	aascoughih@mashable.com
667	7	Janetta	Menichelli	Cris	622-978-1822	128 Hansons Drive	158.81.184.160	cmenichelliii@hatena.ne.jp
668	5	Loralyn	Rayer	Giulio	520-273-7205	39 Mockingbird Hill	208.165.242.124	grayerij@yale.edu
669	7	Elnore	Madner	Ermin	313-828-4836	1 Superior Way	61.7.4.29	emadnerik@wp.com
670	7	Amity	Lipyeat	Jerrie	372-818-0199	6 Texas Terrace	173.184.139.12	jlipyeatil@cnbc.com
671	1	Janenna	Sonnenschein	Anderson	250-702-9143	4447 Scott Drive	176.152.62.149	asonnenscheinim@umn.edu
672	1	Dewitt	Haigh	Marielle	499-975-6842	78018 Pankratz Lane	21.156.219.128	mhaighin@vinaora.com
673	10	Ernestus	Tadman	Lin	750-326-8351	60 Delaware Point	240.121.199.200	ltadmanio@samsung.com
674	3	Skye	Chanders	Rod	114-141-4162	61112 Nelson Court	131.149.21.179	rchandersip@apache.org
675	6	Jeffie	Greatreax	Jorrie	100-613-5335	24 Barnett Junction	75.132.61.217	jgreatreaxiq@topsy.com
676	7	Dalila	Charlwood	Shelby	272-337-4928	84 Waubesa Park	23.157.30.177	scharlwoodir@latimes.com
677	9	Arther	Golborne	Conan	410-919-0473	76901 Walton Park	72.138.212.187	cgolborneis@bandcamp.com
678	7	Vincenty	Devine	Theressa	164-575-2637	0 Mifflin Plaza	250.137.24.184	tdevineit@youtube.com
679	10	Emmie	Ellis	Mella	499-955-5699	1 Gale Plaza	200.37.134.211	mellisiu@google.pl
680	10	Dore	Yes	Sherilyn	718-123-5782	31943 Judy Terrace	4.169.192.181	syesiv@cloudflare.com
681	2	Cordelie	Dowgill	Roseanna	789-514-2441	34 Blue Bill Park Lane	225.155.250.100	rdowgilliw@t-online.de
682	4	Crystal	Tomlett	Hersch	569-990-9291	86 Bartelt Plaza	250.96.210.18	htomlettix@edublogs.org
683	8	Edna	Walewicz	Randolf	562-653-7897	3 Scoville Park	122.106.74.11	rwalewicziy@wordpress.org
684	3	Lemmy	Bugdell	Puff	891-107-1203	42775 Northport Alley	107.84.190.77	pbugdelliz@pen.io
685	5	Cloe	Ragat	Malia	126-782-8428	91855 Karstens Circle	175.183.215.249	mragatj0@utexas.edu
686	5	Chiarra	Copping	Forster	635-276-2827	79 Buena Vista Crossing	18.50.215.196	fcoppingj1@sciencedirect.com
687	4	Seymour	Yorke	Yetta	403-284-2781	1 Bashford Junction	147.73.31.58	yyorkej2@studiopress.com
688	1	Odey	Tunn	Dela	254-233-2424	481 Eggendart Lane	210.209.131.243	dtunnj3@wsj.com
689	7	Adrian	Allanson	Arch	889-723-7864	0 Knutson Lane	117.128.26.237	aallansonj4@yellowbook.com
690	1	Mari	Portal	Fraze	845-855-3258	07435 Sage Crossing	81.224.67.55	fportalj5@tumblr.com
691	5	Gussie	Spelling	Wenona	464-975-8814	4 Fisk Drive	24.4.11.226	wspellingj6@hp.com
692	8	Anallese	Battabee	Ellie	871-445-2256	549 Thackeray Lane	159.0.5.130	ebattabeej7@sphinn.com
693	3	Misha	Andrusyak	Roselle	557-994-4428	95898 Little Fleur Drive	184.80.226.174	randrusyakj8@cornell.edu
694	8	Hewitt	Shilliday	Johnath	541-540-1595	17590 Sommers Junction	207.95.143.171	jshillidayj9@economist.com
695	10	Matelda	Berre	Reggie	176-178-5986	626 Nova Way	239.45.120.200	rberreja@sourceforge.net
696	5	Smith	Gyppes	Ingelbert	207-566-0320	03339 Thierer Drive	93.31.65.88	igyppesjb@sakura.ne.jp
697	3	Atalanta	Caslane	Walliw	182-392-4679	644 Jenifer Junction	172.5.71.156	wcaslanejc@businesswire.com
698	5	Alfie	Rosborough	Shepard	814-122-0675	37 Kings Place	237.102.10.22	srosboroughjd@wix.com
699	5	Sheffield	Billows	Gratiana	437-598-0792	1 Chive Terrace	233.0.62.143	gbillowsje@deviantart.com
700	4	Ferrel	Stoute	Jodi	542-155-4948	3 Coolidge Road	78.181.27.162	jstoutejf@ebay.co.uk
701	5	Nalani	Longland	Hillyer	636-500-1590	3278 Riverside Terrace	91.152.220.197	hlonglandjg@myspace.com
702	7	Luci	Landrick	Benita	748-333-2643	09273 Talisman Lane	80.18.251.190	blandrickjh@upenn.edu
703	4	Marji	Hazelgrove	Seka	155-639-4000	3 Vahlen Junction	208.94.83.201	shazelgroveji@joomla.org
704	7	Benoit	Clemetts	Sigismondo	468-958-0108	51926 Texas Way	205.165.19.156	sclemettsjj@irs.gov
705	9	Romain	Nealon	Corissa	655-978-7097	758 Bayside Place	145.192.93.180	cnealonjk@twitter.com
706	10	Edgar	Leving	Rozanna	369-663-2775	566 Sherman Center	68.196.206.25	rlevingjl@bloglines.com
707	4	Raymund	Backman	Angel	927-684-7361	5 Graceland Terrace	14.226.135.0	abackmanjm@adobe.com
708	1	Shauna	De Ruel	Jackie	999-175-0826	82 Caliangt Crossing	241.233.140.155	jderueljn@indiegogo.com
709	1	Duffy	Halward	Antony	816-925-6232	45619 4th Circle	248.101.224.174	ahalwardjo@amazonaws.com
710	5	Rina	Kytter	Debi	997-618-8208	15953 Starling Street	201.79.87.189	dkytterjp@prlog.org
711	3	Constantine	Creamer	Ernst	962-671-8269	06 3rd Plaza	66.153.163.176	ecreamerjq@ask.com
712	2	Ranee	Elfe	Thaxter	334-802-6130	8689 Moland Park	196.251.181.21	telfejr@php.net
713	6	Caro	Meeron	Alan	333-832-1785	17 Stoughton Avenue	155.227.40.246	ameeronjs@wikipedia.org
714	10	Cecilla	Batistelli	Rivalee	749-530-5655	2 Jackson Point	92.247.205.246	rbatistellijt@cornell.edu
715	2	Homer	Skipping	Poppy	295-481-1120	5394 Norway Maple Pass	112.201.165.45	pskippingju@studiopress.com
716	4	Rouvin	Watkin	Zitella	490-689-5355	954 Oakridge Crossing	219.189.103.50	zwatkinjv@printfriendly.com
717	7	Willetta	Vannet	Forest	303-384-8792	8946 Elgar Parkway	99.133.110.251	fvannetjw@addtoany.com
718	2	Shelagh	Keneforde	Arri	664-873-6541	1582 Prairie Rose Center	53.157.92.85	akenefordejx@cnn.com
719	7	Cynthea	Folli	Carma	348-517-9178	3 Marcy Road	33.102.65.124	cfollijy@qq.com
720	3	Matthus	Pengelly	Rica	626-933-6168	0595 South Road	89.242.196.146	rpengellyjz@cloudflare.com
721	7	Darleen	Treweela	Lesley	321-105-3373	32762 Fair Oaks Circle	107.206.86.80	ltreweelak0@hc360.com
722	9	Alta	Koba	Wilbur	547-658-8849	034 Huxley Park	25.168.64.80	wkobak1@unblog.fr
723	2	Oswald	Pile	Alvie	145-520-4078	30177 Bultman Avenue	254.175.160.72	apilek2@paginegialle.it
724	2	Jobie	Lealle	Trevor	647-928-5970	173 Loftsgordon Park	74.187.167.188	tleallek3@posterous.com
725	6	Cthrine	Paulmann	Mareah	426-847-7286	625 Dapin Pass	108.192.75.235	mpaulmannk4@nbcnews.com
726	5	Eryn	Peterson	Ilyse	196-815-8953	3 Vernon Hill	150.45.211.89	ipetersonk5@furl.net
727	3	Jacquelyn	Pleager	Winston	332-776-8829	24 Canary Point	211.85.57.23	wpleagerk6@meetup.com
728	9	Vickie	Beckhurst	Tess	371-922-0728	326 Moland Lane	90.253.103.59	tbeckhurstk7@netscape.com
729	5	Ursulina	Iiannoni	Florella	540-455-1158	84431 Fair Oaks Point	91.198.189.240	fiiannonik8@stumbleupon.com
730	7	Alyce	Philpotts	Fidole	756-442-7362	939 Melby Court	194.75.47.180	fphilpottsk9@pen.io
731	5	Lem	Larciere	Aldric	301-415-0596	1 Novick Way	134.47.154.154	alarciereka@illinois.edu
732	9	Vinni	Metcalf	Donielle	931-370-3466	78 Grover Center	98.25.158.122	dmetcalfkb@noaa.gov
733	6	Drud	Francklyn	Gordon	989-702-1364	09303 Birchwood Pass	167.114.235.15	gfrancklynkc@gizmodo.com
734	9	Geoff	Scown	Leland	867-784-0275	172 Hovde Point	221.174.218.243	lscownkd@free.fr
735	8	Shani	Cushion	Zaria	901-427-5626	54 Fulton Terrace	128.151.165.133	zcushionke@zdnet.com
736	5	Lawry	Santon	Tallia	847-761-1354	97947 Loomis Street	23.182.107.22	tsantonkf@economist.com
737	5	Hailey	Haysar	Alecia	703-567-1260	01 Manitowish Hill	130.124.5.92	ahaysarkg@lycos.com
738	2	Milicent	Aldin	Beryl	493-820-1569	8372 Northwestern Park	76.135.223.223	baldinkh@bbc.co.uk
739	4	Beatriz	Bradock	Agnese	691-779-1509	39265 Meadow Valley Road	211.115.172.22	abradockki@free.fr
740	6	Margi	McRae	Padgett	975-944-6294	41769 Buell Lane	191.16.40.143	pmcraekj@xinhuanet.com
741	6	Jaclyn	Goulbourne	Jacquie	520-256-8007	43 Mendota Point	49.151.199.102	jgoulbournekk@photobucket.com
742	4	Vaughn	Peerless	Zitella	668-342-3953	0396 Kedzie Place	237.192.163.24	zpeerlesskl@cbsnews.com
743	4	Phyllida	Whaley	Dorena	566-464-7851	6 Milwaukee Plaza	72.252.152.253	dwhaleykm@hubpages.com
744	5	Maurise	Duddy	Wait	842-467-1937	28 Amoth Park	145.214.101.148	wduddykn@surveymonkey.com
745	6	Ardisj	Styan	Daniel	994-734-0349	82584 Jackson Circle	225.188.60.148	dstyanko@ucoz.com
746	3	Janna	Stollwerk	Cal	656-897-9093	88510 Sunfield Trail	168.203.65.204	cstollwerkkp@house.gov
747	3	Jamesy	Shew	Heath	739-232-5710	213 Paget Road	123.49.92.127	hshewkq@e-recht24.de
748	9	Bernette	Curnok	Teddie	444-247-1332	8 Linden Junction	80.243.120.44	tcurnokkr@senate.gov
749	10	Cynthie	Du Hamel	Tamra	549-578-7004	6 5th Circle	216.133.89.152	tduhamelks@google.it
750	2	Imelda	Venny	Tallulah	565-280-8504	089 Westport Drive	197.81.232.187	tvennykt@economist.com
751	10	Laure	Florentine	Nike	553-714-4565	63836 Browning Point	208.255.239.230	nflorentineku@barnesandnoble.com
752	3	Ferne	McCleod	Isabeau	848-256-1590	8 Del Sol Street	58.208.219.104	imccleodkv@unicef.org
753	10	Kristoforo	Richardon	Pris	373-948-7244	755 Holy Cross Way	242.136.177.15	prichardonkw@who.int
754	10	Thoma	Hadingham	Thom	226-606-5862	58 Goodland Point	50.111.48.228	thadinghamkx@ox.ac.uk
755	6	Annalee	Purkins	Kara	654-612-1843	49 Starling Hill	205.0.229.80	kpurkinsky@clickbank.net
756	6	Rubi	Woodrup	Roddy	919-796-7982	016 Westend Alley	39.42.13.84	rwoodrupkz@google.cn
757	8	Emmett	Abrahamian	Marlane	507-887-4821	71358 Dennis Junction	31.98.76.59	mabrahamianl0@bloglovin.com
758	3	Mart	Heineken	Arleyne	298-854-1355	0464 Stuart Street	61.165.39.212	aheinekenl1@cnn.com
759	8	Sarette	Tilston	Jaquenetta	734-894-2508	3 Tennessee Plaza	43.68.228.153	jtilstonl2@a8.net
760	10	Bengt	Roobottom	Elisabeth	712-323-5783	877 Warner Lane	229.138.76.1	eroobottoml3@hao123.com
761	2	Archibold	Rocca	Grace	180-167-5472	0 Pawling Avenue	40.143.1.126	groccal4@free.fr
762	6	Essy	Splaven	Haywood	772-428-5266	0 Eastlawn Trail	127.238.110.36	hsplavenl5@nbcnews.com
763	2	Yolande	Beeby	Rogers	861-495-7642	624 Union Point	123.125.18.241	rbeebyl6@woothemes.com
764	7	Dacy	Alabastar	Les	148-876-9441	4 Drewry Alley	109.45.224.39	lalabastarl7@exblog.jp
765	9	Ailee	Hannigane	Kearney	865-505-1665	50060 Pearson Street	217.0.156.98	khanniganel8@epa.gov
766	5	Ches	Frackiewicz	Sofia	516-592-4366	4 Karstens Court	90.39.157.91	sfrackiewiczl9@studiopress.com
767	4	Kahlil	D'Oyley	Christabella	169-676-8768	403 Towne Lane	172.98.148.178	cdoyleyla@google.co.uk
768	3	Cacilie	Hawford	Sibylle	170-540-7926	3 Bonner Hill	170.161.151.214	shawfordlb@imgur.com
769	10	Eddi	Dockwray	Agnella	251-904-4616	23 Utah Street	106.245.36.49	adockwraylc@photobucket.com
770	7	Jens	Featherstonehaugh	Vicky	492-324-7275	9 Toban Road	197.238.100.251	vfeatherstonehaughld@wikia.com
771	3	Theo	Boyet	Roxine	548-314-2564	0640 Schiller Pass	171.214.224.233	rboyetle@bigcartel.com
772	9	Tommie	Cahani	Nickie	729-468-1432	11239 Trailsway Street	124.207.233.69	ncahanilf@about.me
773	8	Marty	Gossling	Cilka	581-396-9433	65429 Lighthouse Bay Avenue	156.239.110.247	cgosslinglg@tamu.edu
774	4	Lusa	Vallentin	Corey	815-235-3118	8 Loomis Pass	79.64.229.28	cvallentinlh@xinhuanet.com
775	6	Maggie	Hazelhurst	Reagen	305-846-4277	57141 Ramsey Street	230.253.166.150	rhazelhurstli@google.nl
776	1	Keith	Tortice	Skyler	159-149-6407	9192 Sachtjen Trail	201.63.41.199	storticelj@merriam-webster.com
777	3	Auguste	Frean	Amber	756-430-4351	49894 Mayfield Hill	21.238.231.231	afreanlk@time.com
778	5	Timothy	Tillard	Melisse	889-722-8193	3 Almo Drive	215.151.170.193	mtillardll@quantcast.com
779	10	Bonnee	Skalls	Milicent	259-960-0679	69771 Grasskamp Junction	74.193.70.216	mskallslm@cdbaby.com
780	9	Haskel	Lipprose	Camellia	478-471-7469	08 Forster Avenue	88.128.1.134	clipproseln@vimeo.com
781	2	Nonna	Stockhill	Grover	840-128-3421	8940 Buell Point	229.182.176.101	gstockhilllo@sourceforge.net
782	4	Reuben	Daunter	Waylan	671-669-1117	90 Ilene Crossing	235.139.148.60	wdaunterlp@oakley.com
783	7	Jermaine	Ballard	Fredia	614-861-9699	67298 Melody Parkway	31.90.204.90	fballardlq@usnews.com
784	9	Gabby	Buckles	Jody	644-818-4273	456 Di Loreto Place	58.240.222.218	jbuckleslr@dot.gov
785	2	Ignazio	Siggs	Cullin	397-672-4225	48686 Del Mar Trail	7.57.178.232	csiggsls@yolasite.com
786	2	Dalton	Farryn	Emmet	333-547-8390	48 Summit Street	184.214.73.230	efarrynlt@addthis.com
787	6	Marleen	McCunn	Olive	969-759-7849	107 Green Ridge Road	83.8.157.42	omccunnlu@deliciousdays.com
788	6	Aprilette	Phythean	Tory	959-953-9764	20547 Mallory Place	105.170.201.155	tphytheanlv@google.com.au
789	6	Dennis	Garvagh	Blinny	515-472-2503	1 Schmedeman Center	22.108.106.110	bgarvaghlw@webeden.co.uk
790	4	Glynis	Madill	Gilbertine	276-750-8449	7529 Paget Circle	43.29.58.233	gmadilllx@amazonaws.com
791	4	Leonore	Raccio	Lauren	844-606-0022	29567 Arrowood Point	250.249.248.233	lraccioly@jugem.jp
792	7	Marquita	Eakin	Daile	150-212-1388	52 Karstens Road	21.229.29.44	deakinlz@jalbum.net
793	2	Patience	Briggs	Peggi	189-608-9786	11 Lunder Park	193.137.62.16	pbriggsm0@opera.com
794	3	Sol	McPhilip	Laurianne	551-914-0621	24735 Messerschmidt Road	64.40.205.210	lmcphilipm1@buzzfeed.com
795	5	Cori	Climar	Vasili	268-478-3760	5 Steensland Parkway	3.252.120.158	vclimarm2@bloglovin.com
796	7	Tabor	Biesterfeld	Nester	743-264-0356	77639 Farwell Pass	33.48.14.215	nbiesterfeldm3@etsy.com
797	3	Sansone	Aucock	Paulie	658-124-6395	855 American Center	94.198.147.211	paucockm4@cargocollective.com
798	4	Brook	Tregidgo	Blondell	740-459-8732	50 John Wall Junction	7.23.213.120	btregidgom5@ted.com
799	4	Massimiliano	Ivanyutin	Hansiain	674-494-6294	2 Caliangt Plaza	237.31.214.23	hivanyutinm6@posterous.com
800	4	Clarke	Farahar	Mikey	840-865-8027	7075 Little Fleur Lane	151.12.119.161	mfaraharm7@npr.org
801	6	Obie	Drage	Raina	100-742-8829	99561 Mcbride Center	62.101.52.217	rdragem8@1688.com
802	4	Lindi	Elms	Billi	429-995-5619	4 Charing Cross Lane	80.29.172.221	belmsm9@about.com
803	10	Tam	Tapson	Sibyl	605-527-7569	22 Dryden Point	142.105.167.26	stapsonma@columbia.edu
804	5	Shane	Baume	Germana	164-362-2413	939 Lillian Center	27.91.153.71	gbaumemb@chicagotribune.com
805	7	Dianna	Lippini	Tristan	300-423-3955	05314 Blaine Court	200.155.42.27	tlippinimc@parallels.com
806	8	Sunshine	Martlew	Lucretia	177-915-0548	230 Cambridge Avenue	176.220.234.176	lmartlewmd@boston.com
807	7	Astrid	Downs	Leora	675-795-5189	8471 Clarendon Junction	163.197.32.55	ldownsme@discuz.net
808	9	Lily	Tatersale	Dorrie	803-133-1477	96333 Mitchell Lane	245.242.42.6	dtatersalemf@barnesandnoble.com
809	3	Burr	Kenworthey	Chelsey	580-832-1818	2 Coleman Pass	62.152.202.191	ckenwortheymg@slate.com
810	7	Barney	Cammish	Luigi	605-415-9738	30825 Barby Park	245.65.208.107	lcammishmh@simplemachines.org
811	6	Ceil	Artist	Joey	260-576-1143	660 Superior Lane	35.71.188.51	jartistmi@ucla.edu
812	2	Svend	Mottinelli	Glenine	926-852-7078	11721 Colorado Trail	235.6.239.177	gmottinellimj@walmart.com
813	7	Tandi	Guillain	Phaedra	717-690-4604	612 Melvin Terrace	29.91.232.68	pguillainmk@huffingtonpost.com
814	9	Hernando	Foot	Avigdor	811-957-6614	55725 Graedel Road	42.246.88.41	afootml@wikipedia.org
815	5	Rodi	Wiggin	Demetria	315-993-3158	73481 Bobwhite Way	247.131.76.13	dwigginmm@un.org
816	5	Kalinda	Blackhurst	Sherwood	916-322-1636	10 Knutson Terrace	229.174.248.32	sblackhurstmn@dropbox.com
817	6	Josselyn	Monger	Laney	916-485-3480	477 Myrtle Crossing	55.185.70.196	lmongermo@house.gov
818	7	Brittney	Shardlow	Wallie	490-122-0237	34 Harbort Drive	52.46.92.126	wshardlowmp@usatoday.com
819	4	Gillie	Harverson	Orville	514-387-3143	56250 Mayer Pass	108.194.135.78	oharversonmq@a8.net
820	7	Jeanette	Cothey	Drona	440-662-2582	52 Darwin Junction	147.245.158.229	dcotheymr@unesco.org
821	3	Sergent	Blackford	Mendel	889-302-8836	4 Dorton Center	172.108.181.135	mblackfordms@com.com
822	2	Parker	Hendin	Gale	436-458-5438	154 Mandrake Parkway	126.53.204.220	ghendinmt@1688.com
823	6	Zitella	McDonell	Eddie	891-436-0908	81 Springview Plaza	111.225.130.129	emcdonellmu@printfriendly.com
824	7	Benny	Petroulis	Netta	567-549-0963	5 Bunker Hill Trail	87.41.104.247	npetroulismv@yahoo.co.jp
825	3	Herbert	Firk	Quent	520-852-9766	8 Forest Street	86.104.125.99	qfirkmw@desdev.cn
826	1	Roy	Wanklyn	Galina	505-630-8455	343 Arizona Street	133.187.124.103	gwanklynmx@shinystat.com
827	4	Dawna	Matkin	Nicki	478-834-3635	25105 Dawn Junction	142.126.196.198	nmatkinmy@tmall.com
828	3	Del	Ing	Corly	628-842-9864	650 Walton Crossing	22.160.65.201	cingmz@sun.com
829	10	Kleon	Philpot	Hart	155-563-0333	953 Loftsgordon Way	75.35.125.188	hphilpotn0@dion.ne.jp
830	9	Holli	Penhalewick	Bernie	607-823-9036	3026 Melody Drive	237.26.180.36	bpenhalewickn1@360.cn
831	4	Ursala	Wittleton	Zara	787-962-9235	6 Darwin Plaza	95.194.237.73	zwittletonn2@wp.com
832	2	Aurea	Kisar	Sammy	369-277-9761	6 Marquette Point	159.253.21.30	skisarn3@aol.com
833	10	Shalne	Klemps	Rockie	852-449-1086	31 Badeau Terrace	99.194.211.204	rklempsn4@skype.com
834	1	Aleksandr	Ord	Klemens	593-968-6884	81 Basil Lane	16.65.163.149	kordn5@vk.com
835	1	Lorelle	Hendrik	Celinda	144-471-5369	91 Comanche Drive	64.216.69.30	chendrikn6@ovh.net
836	5	Tabatha	Audsley	Jermaine	555-422-3034	7 Canary Center	206.162.8.155	jaudsleyn7@skyrock.com
837	6	Leela	Kernes	Godfry	503-161-0170	3 Randy Drive	238.78.66.125	gkernesn8@fastcompany.com
838	7	Nevin	Stanlake	Finley	140-182-8076	25485 Dakota Junction	0.174.9.221	fstanlaken9@ning.com
839	1	Sharline	Belcher	Herman	311-971-6143	641 Katie Circle	117.47.90.85	hbelcherna@vistaprint.com
840	1	Alyse	Trembath	Humfried	220-376-2172	654 Grayhawk Street	55.1.36.173	htrembathnb@tmall.com
841	7	Kerrin	Atton	Shadow	774-452-0800	7856 Messerschmidt Crossing	242.83.56.33	sattonnc@yale.edu
842	9	Yard	Bisseker	Winnifred	752-820-6820	06416 Russell Lane	168.216.34.46	wbissekernd@51.la
843	10	Clair	Richly	Olympie	354-585-3425	84887 Fallview Court	50.26.88.44	orichlyne@who.int
844	6	Atlante	Collier	Korey	889-832-4447	4648 Canary Circle	147.121.218.212	kcolliernf@illinois.edu
845	10	Shina	Millward	Kerr	534-203-5591	8 Monterey Street	51.71.59.17	kmillwardng@google.it
846	1	Cecilia	Fessler	Shea	674-399-3723	107 Blaine Pass	160.139.114.140	sfesslernh@guardian.co.uk
847	9	Kerr	Vallentine	Keene	784-674-3296	2028 Burrows Court	116.225.14.29	kvallentineni@psu.edu
848	9	Sebastiano	Ottawell	Morly	194-572-9791	768 Bowman Center	44.147.42.69	mottawellnj@webmd.com
849	3	Candis	Corneille	Joya	950-376-5720	73 Haas Junction	129.36.30.60	jcorneillenk@wikispaces.com
850	2	Myra	Nibley	Fayette	850-603-6608	80183 Lindbergh Terrace	48.21.158.176	fnibleynl@adobe.com
851	8	Jocelyne	Eblein	Jack	986-826-7325	7857 Utah Plaza	184.215.122.182	jebleinnm@opera.com
852	1	Penelope	Nassey	Lucio	751-991-8769	6 Bartillon Road	69.8.80.195	lnasseynn@army.mil
853	4	Lana	De La Hay	Frank	557-414-1273	6 Haas Plaza	162.145.175.179	fdelahayno@newyorker.com
854	1	Jess	Jose	Crista	795-433-5697	5221 Melody Center	124.254.248.53	cjosenp@fc2.com
855	4	Thane	Biglin	Stephie	145-971-4931	7758 Laurel Park	56.243.110.78	sbiglinnq@bloglines.com
856	6	Tabb	Danneil	Cecilio	944-807-1414	0903 Cottonwood Road	213.143.114.54	cdanneilnr@china.com.cn
857	3	Maynord	Dracksford	Minna	964-230-2061	5044 Corry Point	215.63.12.142	mdracksfordns@tuttocitta.it
858	8	Filberto	Parzizek	Gaby	355-527-1181	061 Dunning Parkway	31.72.66.246	gparzizeknt@people.com.cn
859	10	Fairlie	Cowitz	Livy	538-190-8270	338 Dunning Trail	22.132.210.44	lcowitznu@free.fr
860	10	Noll	Bakey	Tandy	907-169-5756	9 Gerald Lane	83.116.95.207	tbakeynv@acquirethisname.com
861	8	Lonni	Happert	Jeremiah	699-542-0944	6 Vera Park	85.212.216.248	jhappertnw@ycombinator.com
862	5	Rosamund	Klimczak	Bartholomeus	323-296-1330	22 Mosinee Park	162.213.244.232	bklimczaknx@so-net.ne.jp
863	5	Eva	Wilacot	Sandor	309-958-8411	400 Straubel Junction	186.176.248.28	swilacotny@globo.com
864	8	Grissel	Lancett	Ted	142-870-1479	81 Wayridge Street	32.101.23.103	tlancettnz@amazon.de
865	1	Filippa	Asker	Waneta	879-834-7795	41359 Di Loreto Plaza	87.177.10.122	waskero0@netscape.com
866	10	Onfre	Van Eeden	Damien	179-673-8364	435 Schmedeman Lane	189.103.35.176	dvaneedeno1@ezinearticles.com
867	6	Tristam	Lean	Ive	911-547-2477	83 Saint Paul Plaza	165.64.175.214	ileano2@dmoz.org
868	2	Tobe	Delmonti	Nicoli	516-602-8456	81978 Rockefeller Junction	169.122.180.143	ndelmontio3@pcworld.com
869	4	Diandra	Kitson	Jaquelin	221-583-4861	7 Loftsgordon Terrace	6.245.247.90	jkitsono4@ca.gov
870	7	Consalve	McCall	Gerhardine	168-653-1847	04 Larry Circle	25.189.117.124	gmccallo5@clickbank.net
871	8	Ag	Tindall	Ruby	324-234-0115	92791 7th Road	221.205.244.225	rtindallo6@chicagotribune.com
872	7	Danice	Gladman	Buddie	850-730-5051	44844 Jenifer Place	28.253.138.98	bgladmano7@bing.com
873	6	Harmon	Crucitti	Kassie	586-409-8111	3756 Farwell Lane	72.22.156.23	kcrucittio8@paypal.com
874	8	Hogan	Matonin	Marena	233-828-2980	17 Eagan Street	206.185.116.168	mmatonino9@mit.edu
875	8	Kendricks	Walstow	Egon	953-621-6081	50503 Northfield Crossing	91.216.123.213	ewalstowoa@businesswire.com
876	6	Reece	Francois	Adore	759-685-9357	019 Michigan Place	65.64.19.31	afrancoisob@yelp.com
877	10	Ulrick	Pinkney	Angelica	191-421-8829	41165 Stephen Hill	209.144.75.50	apinkneyoc@webs.com
878	9	Thorpe	Mallender	Opaline	649-594-9483	05953 Nova Trail	137.20.175.215	omallenderod@jalbum.net
879	2	Linzy	Pitkaithly	Amil	195-333-3350	9 Wayridge Court	210.230.204.29	apitkaithlyoe@tuttocitta.it
880	1	Adan	Hinkensen	Dosi	979-549-3632	32501 Boyd Crossing	163.96.38.245	dhinkensenof@gov.uk
881	7	Allegra	McCarver	Camile	526-216-3575	93195 Grim Point	1.37.251.178	cmccarverog@barnesandnoble.com
882	1	Aguistin	Giaomozzo	Dunn	871-101-6056	3 2nd Road	122.177.209.217	dgiaomozzooh@wsj.com
883	10	Dewain	O'Brien	Thomasine	305-142-1796	0958 Northland Parkway	35.235.199.171	tobrienoi@google.nl
884	8	Ursulina	Poskitt	Gris	373-762-2490	94 Truax Parkway	67.228.61.167	gposkittoj@who.int
885	2	Averil	Trinder	Delores	296-396-1836	4800 Pearson Circle	31.23.228.150	dtrinderok@aboutads.info
886	3	Gilbertine	Beddard	Elka	103-588-8051	24 Waxwing Terrace	201.149.67.111	ebeddardol@paypal.com
887	2	Libbey	Packman	Germain	506-617-9866	71 Red Cloud Center	188.228.42.210	gpackmanom@topsy.com
888	5	Christophorus	Blest	Berkie	990-943-0104	62 Kedzie Circle	247.75.236.69	bbleston@japanpost.jp
889	5	Mattie	Hubber	Tuckie	695-275-2821	98 Annamark Road	75.15.3.32	thubberoo@sciencedaily.com
890	2	Darsie	Kellaway	Katlin	270-982-8332	32731 Mifflin Way	150.25.230.40	kkellawayop@huffingtonpost.com
891	3	Tymothy	Pardie	Timothy	668-205-0792	77 Moose Circle	105.72.201.211	tpardieoq@technorati.com
892	9	Robert	Seeds	Jule	653-350-0713	75880 Clemons Junction	147.166.99.61	jseedsor@dion.ne.jp
893	10	Kitty	Roscow	Mord	905-492-0459	510 Delladonna Pass	218.13.1.160	mroscowos@washingtonpost.com
894	1	Clementius	Lightoller	Wallis	614-166-4901	783 Stoughton Terrace	19.128.255.154	wlightollerot@google.com.hk
895	4	Shirl	Warland	Loy	806-522-5550	4 School Alley	72.254.237.204	lwarlandou@sina.com.cn
896	9	Alma	Marchington	Dick	245-292-0531	91 Waxwing Circle	164.216.61.27	dmarchingtonov@acquirethisname.com
897	10	Cherin	Kobpal	Ciro	348-731-3173	05 Harper Way	225.79.34.229	ckobpalow@marriott.com
898	10	Jae	Trenbey	Grata	788-925-7418	07 Myrtle Terrace	218.239.242.3	gtrenbeyox@eventbrite.com
899	6	Marcelo	McCutheon	Joshia	574-584-6512	70262 Saint Paul Lane	96.228.183.203	jmccutheonoy@newyorker.com
900	1	Vinita	D'Adda	Cher	526-554-4093	40105 Troy Alley	16.69.255.160	cdaddaoz@cyberchimps.com
901	9	Kathrine	Michallat	Jaymie	436-584-6817	97 Hayes Place	96.141.228.218	jmichallatp0@goodreads.com
902	4	Malinda	Berecloth	Weylin	136-351-5956	8 Monica Center	85.53.233.38	wbereclothp1@usatoday.com
903	9	Farley	Ellsworthe	Cammy	472-155-8358	4899 La Follette Road	113.154.88.45	cellsworthep2@e-recht24.de
904	4	Marin	Coumbe	Windy	988-325-6352	7 Donald Drive	204.19.200.249	wcoumbep3@who.int
905	2	Magnum	Eberts	Ty	749-259-4592	0911 Fulton Lane	63.89.64.112	tebertsp4@rakuten.co.jp
906	6	Herrick	Challender	Nadeen	794-680-6083	73 Sunfield Court	80.8.190.64	nchallenderp5@booking.com
907	5	Abby	Downham	Isidore	504-631-6779	28 Glacier Hill Street	88.171.230.175	idownhamp6@simplemachines.org
908	3	Stanly	Larwood	Aurie	476-798-9435	23141 Birchwood Circle	114.231.121.54	alarwoodp7@tmall.com
909	6	Luelle	Cornejo	Mickie	497-841-8554	6 Dennis Court	210.152.117.155	mcornejop8@alibaba.com
910	10	Jess	Sigge	Deb	627-406-9947	70 Corscot Center	123.29.49.165	dsiggep9@163.com
911	5	Danna	Emmatt	Bay	768-201-4963	4 Ilene Junction	11.41.181.24	bemmattpa@ft.com
912	5	Leanna	Lottrington	Patrizia	745-592-2992	91 Maple Wood Parkway	57.87.130.208	plottringtonpb@istockphoto.com
913	10	Nissie	Taplin	Guinevere	258-396-1658	2 Almo Place	149.76.141.120	gtaplinpc@latimes.com
914	5	Evin	Pacitti	Roderigo	706-244-2475	112 Michigan Junction	30.216.189.254	rpacittipd@sourceforge.net
915	1	Anissa	Margery	Zea	507-858-3687	02 Rigney Crossing	135.153.210.171	zmargerype@smugmug.com
916	1	Fidelia	Marrian	Clerkclaude	952-967-1898	43136 David Parkway	25.239.136.130	cmarrianpf@freewebs.com
917	10	Viv	Rubinchik	Rosa	292-526-3316	997 Manitowish Street	5.142.158.240	rrubinchikpg@smh.com.au
918	9	Bogey	Wanless	Inger	514-720-7737	2 Red Cloud Plaza	7.118.40.156	iwanlessph@sogou.com
919	10	Nertie	Greenhalf	Bernie	667-326-8129	1599 Florence Alley	103.10.157.59	bgreenhalfpi@reference.com
920	3	Tad	Lis	Carolin	141-223-9142	8 Continental Alley	208.107.248.113	clispj@blogtalkradio.com
921	1	Sibyl	Barraclough	Leigh	518-638-8495	8 Acker Trail	195.52.143.175	lbarracloughpk@disqus.com
922	2	Matti	Pasley	Ripley	357-755-4513	1 Schmedeman Place	81.72.241.195	rpasleypl@squidoo.com
923	2	Sibley	Copo	Reider	712-961-0326	5 Park Meadow Parkway	72.26.185.146	rcopopm@twitter.com
924	1	Richart	Scamaden	Neddie	711-479-4932	29259 Ramsey Park	7.132.109.51	nscamadenpn@domainmarket.com
925	2	Debra	Scutter	Onofredo	918-248-4665	3349 Anniversary Crossing	193.24.95.241	oscutterpo@unesco.org
926	1	Robinet	Baguley	Stacy	669-807-1469	100 Pierstorff Avenue	97.88.99.56	sbaguleypp@theglobeandmail.com
927	3	Beau	Kumar	Kingsly	115-370-4197	912 Cardinal Way	143.0.246.71	kkumarpq@dailymail.co.uk
928	2	Arlan	Escalero	Amity	788-244-5306	0097 Springview Place	236.90.8.57	aescaleropr@gmpg.org
929	3	Rolph	Zanetello	Tiff	822-310-8970	62 Monterey Park	85.243.14.36	tzanetellops@msu.edu
930	1	Kennett	Oxberry	Aland	658-460-1979	3 Tomscot Court	46.39.210.112	aoxberrypt@yelp.com
931	6	Babita	Huntington	Herman	149-206-5920	74339 Bluejay Court	117.36.222.174	hhuntingtonpu@stanford.edu
932	6	Heloise	Wooton	Codie	557-320-1736	12619 Dexter Way	56.147.203.250	cwootonpv@comsenz.com
933	2	Carry	More	Enos	337-718-3981	499 Michigan Park	132.156.121.201	emorepw@mtv.com
934	1	Reinold	Hixley	Bryana	495-521-7232	5 Annamark Plaza	17.253.223.139	bhixleypx@whitehouse.gov
935	10	Farly	Jeannel	Missie	995-571-6470	3777 Clyde Gallagher Trail	241.217.97.216	mjeannelpy@creativecommons.org
936	5	Natassia	Helleckas	Izabel	258-537-5293	62 Granby Pass	22.116.7.99	ihelleckaspz@furl.net
937	5	Yelena	Gensavage	Ciro	106-680-1359	3 Amoth Way	127.13.182.24	cgensavageq0@google.nl
938	8	Larissa	La Padula	Alisa	472-231-1498	67048 Cody Point	19.222.203.60	alapadulaq1@bravesites.com
939	6	Giulietta	Honywill	Martainn	369-283-3252	10 Vernon Circle	153.114.110.121	mhonywillq2@google.cn
940	3	Ardra	Fley	Rosalia	273-410-0804	1775 Pleasure Place	35.255.149.93	rfleyq3@patch.com
941	4	Reese	Housecroft	Leonora	960-156-8484	81 Laurel Plaza	142.251.34.172	lhousecroftq4@163.com
942	1	Kiley	Causbey	Magdalena	807-145-7414	681 Corben Alley	84.159.253.183	mcausbeyq5@gmpg.org
943	2	Vinny	Dominique	Marie-jeanne	517-480-4639	68184 Sage Junction	143.14.230.45	mdominiqueq6@netlog.com
944	9	Maddie	Reggiani	Leonhard	663-232-3143	018 Clove Circle	43.113.237.71	lreggianiq7@java.com
945	2	Lissa	Paulazzi	Magdalen	162-758-1675	1 Mendota Plaza	171.130.222.173	mpaulazziq8@dagondesign.com
946	2	Florencia	Ewan	Nell	305-301-9205	8733 Kropf Street	6.217.44.112	newanq9@skype.com
947	7	Clari	Beadham	Deloria	929-355-9285	7241 Schurz Street	179.48.215.117	dbeadhamqa@ftc.gov
948	4	Kristi	Bulgen	Karlens	629-796-1462	694 Gina Circle	19.196.230.174	kbulgenqb@arizona.edu
949	10	Betti	Shine	Ray	520-294-4263	58 Pepper Wood Drive	103.184.54.121	rshineqc@redcross.org
950	2	Tristan	Barwis	Alastair	171-574-4129	38702 Arrowood Crossing	140.165.84.31	abarwisqd@t.co
951	1	Allys	Roscamps	Ganny	554-191-0524	01 David Road	138.104.21.227	groscampsqe@techcrunch.com
952	7	Odelia	Percifull	Florie	981-478-4098	279 Menomonie Lane	59.129.219.39	fpercifullqf@dailymail.co.uk
953	2	Sharline	Guerro	Georgeanne	689-133-6032	7529 Lillian Parkway	39.161.106.77	gguerroqg@netvibes.com
954	2	Bartholemy	Hackelton	Aubert	864-121-8392	9 Southridge Hill	87.163.167.165	ahackeltonqh@reference.com
955	9	Elfreda	Pryor	Janel	960-810-3341	665 Bultman Crossing	57.72.104.153	jpryorqi@dailymotion.com
956	1	Irwinn	Whybrow	Hammad	390-949-4870	47 Elka Center	78.139.127.98	hwhybrowqj@gov.uk
957	9	Bliss	Eberz	Laurens	752-495-0338	995 Hooker Parkway	72.151.204.219	leberzqk@histats.com
958	5	Brook	Blackborne	Sharona	893-707-4609	37981 Miller Street	155.129.194.74	sblackborneql@webnode.com
959	5	Agretha	Band	Fanya	964-626-2811	4 Twin Pines Terrace	203.92.186.180	fbandqm@goo.gl
960	9	Emmery	Strutt	Ainslie	889-551-5710	1791 Packers Trail	48.5.78.163	astruttqn@dropbox.com
961	10	Vic	Kellaway	Lelia	251-208-3682	756 Sutteridge Trail	254.47.125.222	lkellawayqo@ifeng.com
962	2	Clary	Dommersen	Arny	359-728-1576	5 Comanche Place	192.224.20.35	adommersenqp@etsy.com
963	5	Farrell	Scammell	Kaycee	546-286-4930	4 Morningstar Circle	97.110.80.208	kscammellqq@msu.edu
964	6	Lowrance	Oake	Reina	707-360-2935	9238 Scott Street	16.149.154.234	roakeqr@imageshack.us
965	10	Ike	Blampied	Lindy	193-418-2710	4754 Golf Point	138.91.52.115	lblampiedqs@digg.com
966	9	Edna	Welman	Rudolph	810-748-3639	8 Northridge Hill	64.130.41.191	rwelmanqt@php.net
967	8	Jaclyn	Comrie	Edwina	604-541-0888	118 Harbort Junction	249.116.110.130	ecomriequ@seesaa.net
968	6	Shelby	Medcalfe	Ulrikaumeko	822-170-9541	6 Ridge Oak Lane	31.2.251.141	umedcalfeqv@123-reg.co.uk
969	6	Thaxter	Monckton	Vanya	274-914-6252	844 3rd Point	77.135.85.101	vmoncktonqw@hc360.com
970	2	Ezmeralda	Llewelyn	Woodrow	602-199-8106	999 Del Mar Lane	196.21.160.56	wllewelynqx@slideshare.net
971	10	Roma	Domleo	Skippy	713-730-0284	654 7th Park	199.176.159.127	sdomleoqy@discuz.net
972	5	Marieann	Bootman	Colleen	831-901-6407	309 Charing Cross Crossing	142.122.226.94	cbootmanqz@statcounter.com
973	4	Rozanna	Denslow	Jeth	857-959-9522	683 Dixon Circle	177.200.101.180	jdenslowr0@columbia.edu
974	2	Kaspar	Cregan	Dietrich	512-139-0769	46 Carey Pass	164.12.8.86	dcreganr1@yale.edu
975	1	Kamila	Ismay	Farris	703-225-4660	01 Gulseth Pass	97.134.186.146	fismayr2@apache.org
976	10	Simonette	Caukill	Karly	108-763-2157	45019 Larry Court	231.242.238.18	kcaukillr3@multiply.com
977	7	Puff	Hammerton	Teador	438-457-6064	35549 Grasskamp Court	202.80.71.167	thammertonr4@tripadvisor.com
978	1	Fremont	Clapshaw	Adah	109-496-2482	9 Miller Point	17.234.156.181	aclapshawr5@upenn.edu
979	8	Cortney	Glandon	Jodi	646-540-0678	2 Thompson Crossing	142.163.221.55	jglandonr6@livejournal.com
980	10	Gian	MacMakin	Kip	350-869-3669	6169 Mosinee Parkway	60.22.42.214	kmacmakinr7@washington.edu
981	7	Corty	Skidmore	Chicky	562-284-8292	195 Bashford Center	47.66.7.106	cskidmorer8@time.com
982	7	Devin	Somerville	Abbe	314-110-4004	4 Talisman Trail	145.27.55.1	asomerviller9@people.com.cn
983	9	Antonietta	Snel	Sam	328-251-4377	052 Bunting Court	180.25.58.3	ssnelra@edublogs.org
984	4	Alf	Curless	Maryann	508-636-3580	521 American Ash Crossing	38.204.149.225	mcurlessrb@mapquest.com
985	6	Bell	Scown	Samara	370-195-9858	4 Steensland Circle	202.153.112.165	sscownrc@harvard.edu
986	9	Gan	Woolvin	Jo	756-165-9386	63 Burrows Pass	227.50.46.134	jwoolvinrd@bbc.co.uk
987	8	Phoebe	Pring	Dana	998-448-9180	04 Huxley Court	236.121.88.14	dpringre@webeden.co.uk
988	2	Shae	Downer	Jillie	470-649-1826	180 Glacier Hill Pass	95.244.183.118	jdownerrf@domainmarket.com
989	1	Alix	Kenen	Huntley	699-272-2461	767 Briar Crest Plaza	93.68.134.13	hkenenrg@is.gd
990	3	Caron	Walewicz	Allayne	127-683-1985	248 International Center	32.36.95.3	awalewiczrh@kickstarter.com
991	5	Lucie	Curphey	Theodora	392-699-0885	729 David Circle	184.46.138.156	tcurpheyri@symantec.com
992	7	Gian	Maryet	Fran	583-137-7480	7 Del Sol Park	206.80.133.202	fmaryetrj@issuu.com
993	1	Fabian	Porch	Clair	273-776-9988	3235 Roth Trail	112.3.13.56	cporchrk@nhs.uk
994	6	Saundra	Hyslop	Lewie	194-321-8301	01880 Onsgard Plaza	124.203.176.121	lhysloprl@dedecms.com
995	10	Pinchas	Jiggen	Vilma	322-535-8958	6919 Moland Hill	53.240.193.234	vjiggenrm@moonfruit.com
996	7	Davidde	Liell	Alex	965-968-0074	82 Spenser Pass	203.214.197.8	aliellrn@oracle.com
997	5	Kaylil	Rumford	Letti	662-341-9213	154 Paget Pass	59.212.58.194	lrumfordro@usda.gov
998	8	Claudius	Burgin	Anabella	451-258-9757	17 Dovetail Alley	49.29.13.73	aburginrp@bbc.co.uk
999	7	Cosme	Niccolls	Ynes	743-670-0756	7077 Pearson Trail	130.93.18.51	yniccollsrq@technorati.com
1000	6	Corliss	De Mitri	Fayina	968-645-7535	57 Pankratz Place	122.190.51.150	fdemitrirr@buzzfeed.com
\.


--
-- TOC entry 4874 (class 0 OID 16478)
-- Dependencies: 220
-- Data for Name: storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage (id_storage, room_number, shelf_number, rack_number) FROM stdin;
1	2	7	8
2	3	1	6
3	3	6	5
4	2	4	2
5	1	4	7
6	2	3	2
7	2	2	5
8	2	2	3
9	2	8	2
10	2	1	7
11	3	3	1
12	2	1	8
13	1	1	7
14	2	2	7
15	3	1	2
16	1	3	4
17	3	4	4
18	2	2	5
19	3	1	4
20	3	7	8
21	3	10	5
22	1	2	2
23	1	2	3
24	1	9	1
25	2	5	8
26	2	8	7
27	2	4	4
28	3	5	1
29	1	3	8
30	2	4	7
31	1	1	5
32	2	6	2
33	3	6	7
34	1	8	4
35	1	8	2
36	3	5	8
37	3	3	6
38	3	4	6
39	3	5	7
40	3	1	6
41	1	4	7
42	1	6	7
43	3	7	2
44	1	6	6
45	1	6	4
46	2	5	4
47	2	5	5
48	1	6	6
49	3	4	5
50	3	6	1
51	3	7	4
52	3	8	2
53	1	6	2
54	2	9	2
55	1	8	8
56	1	10	3
57	3	6	1
58	3	2	7
59	1	8	6
60	2	3	1
61	3	8	8
62	2	6	3
63	2	8	3
64	2	4	6
65	2	7	7
66	1	4	6
67	1	4	3
68	2	8	6
69	2	10	6
70	2	6	5
71	3	5	1
72	1	8	5
73	3	10	1
74	1	3	6
75	1	9	8
76	1	6	2
77	1	10	4
78	3	9	6
79	3	9	7
80	1	6	7
81	2	5	7
82	3	3	5
83	2	4	2
84	2	7	8
85	3	6	6
86	2	3	1
87	2	8	7
88	3	8	1
89	2	8	6
90	1	6	4
91	1	10	3
92	1	3	7
93	2	6	7
94	3	4	6
95	1	5	5
96	1	1	7
97	1	6	8
98	3	2	1
99	2	8	2
100	1	7	3
101	3	1	4
102	3	6	6
103	3	1	7
104	1	1	3
105	3	1	2
106	3	10	6
107	3	10	1
108	2	9	4
109	1	5	7
110	2	3	3
111	3	3	7
112	1	10	6
113	1	2	1
114	3	2	4
115	1	7	2
116	3	5	8
117	1	8	8
118	3	9	1
119	2	3	6
120	3	5	7
121	3	10	2
122	3	1	7
123	1	10	8
124	1	2	3
125	1	7	7
126	2	4	6
127	3	5	6
128	1	7	8
129	3	7	8
130	2	5	7
131	2	1	5
132	3	7	1
133	1	5	7
134	1	5	2
135	3	5	6
136	2	6	4
137	1	9	5
138	3	1	3
139	3	2	2
140	1	4	6
141	1	3	8
142	3	2	1
143	3	5	8
144	1	4	8
145	1	5	8
146	3	5	1
147	2	5	2
148	2	8	2
149	1	5	3
150	3	10	5
151	3	1	6
152	3	9	3
153	1	7	8
154	3	9	4
155	2	4	5
156	3	9	6
157	3	3	4
158	2	4	2
159	3	1	4
160	3	3	7
161	1	3	3
162	3	6	5
163	1	6	6
164	1	8	1
165	2	6	1
166	1	6	7
167	2	5	2
168	1	6	2
169	1	4	2
170	2	4	3
171	3	9	6
172	3	9	7
173	2	10	7
174	3	6	2
175	1	10	1
176	1	10	1
177	2	10	5
178	3	3	6
179	3	9	7
180	2	9	5
181	2	3	7
182	2	4	2
183	3	4	4
184	3	2	5
185	2	2	1
186	1	5	2
187	3	8	4
188	1	6	3
189	2	8	4
190	3	6	4
191	3	3	2
192	1	10	1
193	2	2	8
194	1	8	8
195	1	1	5
196	3	10	5
197	1	6	8
198	2	6	5
199	3	1	7
200	2	3	4
201	1	6	5
202	2	3	2
203	1	5	7
204	3	3	8
205	1	4	7
206	2	10	4
207	2	8	7
208	1	9	1
209	1	6	8
210	1	1	3
211	1	7	6
212	3	2	2
213	3	6	8
214	3	9	3
215	3	2	1
216	3	10	5
217	1	1	3
218	2	2	1
219	1	2	1
220	3	3	1
221	3	4	5
222	3	2	8
223	3	5	1
224	3	5	8
225	3	10	1
226	3	10	8
227	2	1	5
228	2	6	1
229	3	5	1
230	2	10	2
231	1	2	7
232	3	7	3
233	3	10	8
234	1	6	8
235	3	3	3
236	2	9	7
237	1	5	1
238	3	1	2
239	3	4	5
240	1	2	3
241	3	9	3
242	3	7	5
243	1	6	1
244	1	2	5
245	3	9	8
246	1	7	5
247	3	10	3
248	2	2	5
249	1	5	3
250	3	2	7
251	3	4	7
252	1	3	1
253	2	2	2
254	3	8	6
255	3	5	2
256	3	4	5
257	3	10	8
258	1	1	7
259	1	8	7
260	3	2	5
261	1	7	6
262	3	10	7
263	2	1	7
264	3	8	4
265	3	1	5
266	3	3	7
267	2	7	8
268	3	1	7
269	2	2	3
270	2	10	8
271	2	2	8
272	3	3	2
273	3	6	4
274	1	1	5
275	3	4	3
276	2	3	2
277	3	8	2
278	3	2	4
279	1	2	4
280	1	5	7
281	3	7	6
282	3	7	6
283	1	7	1
284	2	1	4
285	1	5	6
286	2	6	2
287	1	4	4
288	3	10	8
289	1	10	6
290	2	3	2
291	3	10	1
292	1	9	7
293	1	8	2
294	3	2	1
295	3	7	2
296	3	3	5
297	2	10	3
298	1	1	3
299	1	3	8
300	1	4	3
301	2	4	5
302	1	8	1
303	3	2	7
304	1	3	2
305	3	3	1
306	2	10	6
307	3	5	7
308	2	4	8
309	1	6	1
310	1	4	4
311	3	4	2
312	3	5	1
313	3	6	1
314	1	6	6
315	3	9	5
316	2	10	4
317	3	10	4
318	1	6	2
319	3	6	5
320	1	10	2
321	3	6	2
322	3	9	6
323	2	5	6
324	3	5	3
325	1	10	8
326	2	10	8
327	3	6	5
328	1	5	4
329	2	2	2
330	2	8	6
331	2	4	3
332	3	10	6
333	2	2	5
334	3	5	1
335	2	7	2
336	3	6	1
337	1	10	3
338	2	7	2
339	1	10	6
340	3	5	7
341	1	8	4
342	1	1	8
343	3	2	8
344	3	6	7
345	2	8	2
346	3	2	8
347	3	7	7
348	1	1	8
349	1	5	8
350	2	10	6
351	2	3	7
352	2	1	7
353	3	2	8
354	1	6	1
355	2	5	4
356	2	1	4
357	1	3	5
358	2	1	2
359	3	7	2
360	2	8	4
361	2	2	2
362	1	1	3
363	2	8	2
364	1	3	6
365	1	10	4
366	2	1	2
367	3	3	3
368	2	10	4
369	1	6	7
370	2	5	4
371	1	6	3
372	1	6	3
373	3	1	4
374	1	2	7
375	1	3	2
376	3	1	2
377	1	5	4
378	1	10	4
379	1	8	7
380	3	2	5
381	2	7	3
382	1	10	2
383	2	8	5
384	2	3	6
385	1	1	5
386	3	3	5
387	2	8	4
388	3	3	3
389	3	5	6
390	2	10	7
391	2	9	8
392	2	1	6
393	2	4	6
394	1	6	8
395	2	9	2
396	1	5	3
397	1	6	3
398	1	3	7
399	2	9	4
400	3	7	5
401	3	9	2
402	1	8	8
403	2	7	1
404	2	5	7
405	2	7	3
406	1	6	5
407	2	9	1
408	2	9	2
409	1	6	5
410	1	8	3
411	2	1	1
412	2	6	3
413	2	10	1
414	2	7	5
415	2	10	2
416	3	8	7
417	2	2	8
418	2	1	7
419	2	8	5
420	1	9	5
421	3	6	1
422	3	6	5
423	3	10	3
424	2	1	7
425	1	5	4
426	1	1	5
427	3	10	2
428	3	1	1
429	2	9	4
430	2	7	7
431	3	1	1
432	1	1	1
433	1	4	3
434	2	9	2
435	1	1	6
436	3	5	8
437	1	7	8
438	1	3	3
439	1	9	2
440	1	4	7
441	2	3	4
442	3	6	5
443	2	8	4
444	3	8	4
445	2	1	3
446	1	3	2
447	2	1	3
448	2	5	4
449	1	5	2
450	3	6	7
451	3	3	6
452	3	6	6
453	3	5	7
454	3	4	3
455	3	3	6
456	1	3	4
457	2	4	8
458	1	7	7
459	3	4	3
460	2	5	6
461	2	10	7
462	3	3	6
463	1	8	8
464	1	6	3
465	3	1	8
466	2	3	4
467	1	6	4
468	2	1	6
469	3	6	1
470	2	5	4
471	2	7	5
472	1	5	5
473	2	10	6
474	2	9	1
475	3	9	2
476	3	1	6
477	2	5	2
478	1	4	4
479	3	5	2
480	1	1	5
481	3	8	3
482	2	1	6
483	2	1	2
484	3	9	1
485	3	7	6
486	3	3	7
487	3	3	4
488	3	8	5
489	3	2	4
490	3	9	4
491	1	1	1
492	3	1	3
493	3	8	8
494	3	5	7
495	3	8	2
496	1	8	8
497	1	7	2
498	3	10	6
499	1	6	3
500	3	9	5
501	3	1	6
502	3	9	2
503	1	8	3
504	1	5	1
505	1	9	7
506	3	1	1
507	2	9	4
508	2	3	1
509	3	9	3
510	3	2	6
511	3	4	8
512	1	9	1
513	2	9	5
514	3	7	5
515	2	1	1
516	3	9	6
517	1	1	3
518	2	9	8
519	3	10	2
520	1	8	2
521	2	6	6
522	2	6	4
523	2	5	5
524	1	1	3
525	1	8	4
526	3	5	7
527	3	9	6
528	2	4	8
529	2	3	2
530	1	6	6
531	2	10	6
532	1	10	4
533	1	7	6
534	1	2	2
535	3	2	6
536	2	7	5
537	2	5	6
538	1	5	8
539	2	9	7
540	3	10	3
541	2	7	1
542	2	7	4
543	2	8	1
544	2	9	1
545	2	1	1
546	2	5	6
547	3	4	7
548	2	6	2
549	2	10	5
550	3	7	8
551	3	9	4
552	3	7	5
553	1	3	7
554	3	6	2
555	1	1	3
556	3	5	3
557	2	10	4
558	2	4	1
559	2	6	1
560	1	10	7
561	1	4	5
562	1	9	1
563	3	2	5
564	2	1	2
565	3	5	8
566	2	3	3
567	3	8	3
568	3	1	7
569	3	1	1
570	2	10	3
571	2	5	8
572	1	6	5
573	3	5	2
574	2	8	4
575	3	2	7
576	1	6	6
577	1	7	7
578	2	6	8
579	2	1	6
580	3	6	2
581	3	4	6
582	2	1	3
583	1	2	3
584	1	5	8
585	1	10	5
586	3	1	7
587	2	10	5
588	1	8	1
589	1	9	5
590	3	1	2
591	1	3	1
592	2	5	4
593	2	8	6
594	3	6	5
595	2	9	6
596	2	9	4
597	3	5	4
598	1	2	1
599	3	1	5
600	2	2	3
601	2	8	8
602	3	9	7
603	3	8	8
604	2	3	4
605	2	6	8
606	2	8	3
607	3	3	4
608	3	2	7
609	3	3	1
610	1	9	4
611	1	2	5
612	2	10	3
613	3	9	7
614	3	6	5
615	3	1	7
616	1	6	7
617	2	1	3
618	2	7	1
619	3	6	5
620	3	4	1
621	1	7	5
622	1	3	8
623	3	5	3
624	3	4	3
625	2	4	3
626	2	3	7
627	2	5	2
628	1	4	1
629	1	7	7
630	2	8	7
631	2	3	6
632	3	5	6
633	1	7	2
634	1	5	3
635	3	9	8
636	3	1	4
637	1	5	7
638	2	9	5
639	2	10	7
640	1	4	8
641	1	9	5
642	3	5	1
643	3	10	3
644	3	5	4
645	3	8	5
646	2	7	5
647	1	7	7
648	1	2	5
649	3	9	1
650	3	6	2
651	1	5	1
652	1	10	1
653	3	7	2
654	2	2	8
655	3	7	2
656	1	3	2
657	2	6	1
658	1	10	5
659	3	5	6
660	2	8	4
661	1	2	2
662	1	5	3
663	3	3	4
664	3	8	5
665	1	4	6
666	1	3	3
667	1	3	7
668	3	1	7
669	3	4	1
670	1	2	2
671	2	2	5
672	3	10	5
673	3	5	5
674	2	1	3
675	1	5	6
676	1	4	6
677	3	4	3
678	1	10	6
679	2	2	3
680	3	4	1
681	3	2	3
682	3	9	7
683	1	9	7
684	3	7	2
685	1	1	4
686	2	10	7
687	1	8	2
688	3	7	8
689	3	9	1
690	1	5	6
691	3	8	7
692	3	2	7
693	1	9	5
694	2	9	3
695	3	2	2
696	2	3	2
697	1	9	3
698	1	7	1
699	3	1	7
700	1	5	8
701	2	4	5
702	1	3	1
703	3	5	8
704	1	3	4
705	2	1	6
706	1	6	5
707	3	1	3
708	2	2	4
709	3	9	3
710	3	1	7
711	1	2	7
712	2	2	5
713	2	10	3
714	2	2	4
715	1	7	1
716	2	8	5
717	3	5	1
718	2	6	6
719	1	4	7
720	2	3	7
721	2	7	5
722	2	3	3
723	2	2	6
724	2	5	7
725	2	8	7
726	3	4	3
727	1	7	6
728	2	1	7
729	1	9	2
730	3	6	5
731	2	8	8
732	3	4	3
733	2	5	1
734	3	8	5
735	2	3	2
736	1	2	1
737	2	5	4
738	1	3	4
739	3	5	8
740	3	3	4
741	3	4	5
742	2	3	4
743	2	3	6
744	3	4	3
745	1	1	3
746	1	9	3
747	1	2	1
748	3	4	1
749	2	7	1
750	2	4	7
751	1	10	2
752	1	3	6
753	3	10	2
754	1	10	1
755	3	1	2
756	3	9	4
757	3	6	7
758	2	2	8
759	3	8	7
760	1	8	8
761	2	9	1
762	3	7	1
763	2	3	8
764	2	6	8
765	1	2	7
766	1	8	7
767	1	1	1
768	3	7	4
769	3	9	6
770	1	6	2
771	1	5	8
772	1	3	6
773	3	9	7
774	2	10	7
775	1	6	5
776	3	1	4
777	2	10	5
778	2	10	1
779	3	7	4
780	1	7	8
781	3	10	6
782	3	3	8
783	2	8	5
784	3	3	2
785	1	4	8
786	3	5	7
787	1	9	5
788	3	4	6
789	2	5	5
790	1	9	6
791	1	3	4
792	2	8	5
793	1	6	1
794	2	2	2
795	1	8	4
796	2	4	6
797	2	4	8
798	3	10	7
799	1	9	1
800	3	5	7
801	3	3	5
802	3	8	8
803	1	9	3
804	3	8	7
805	2	8	8
806	2	5	2
807	1	9	7
808	1	7	1
809	2	8	7
810	2	1	1
811	1	2	7
812	3	3	5
813	1	4	4
814	1	1	4
815	3	4	5
816	3	10	1
817	2	7	8
818	1	4	8
819	1	8	5
820	1	2	2
821	1	10	7
822	3	9	6
823	2	8	8
824	1	2	1
825	1	4	5
826	2	2	8
827	1	2	8
828	3	9	6
829	2	9	3
830	1	1	5
831	3	2	5
832	2	4	8
833	2	8	8
834	2	4	1
835	2	9	8
836	1	5	5
837	2	3	3
838	2	2	4
839	1	2	1
840	3	8	4
841	1	6	2
842	1	2	8
843	1	9	2
844	3	5	6
845	3	5	6
846	3	5	2
847	3	10	4
848	1	3	8
849	1	7	8
850	3	1	3
851	1	7	1
852	3	9	2
853	1	6	6
854	3	6	3
855	2	10	3
856	3	2	6
857	2	8	2
858	2	7	5
859	1	3	1
860	1	5	1
861	2	5	8
862	2	9	5
863	1	3	6
864	3	8	2
865	3	2	5
866	2	6	8
867	1	2	1
868	1	1	3
869	1	2	3
870	3	10	7
871	3	10	6
872	1	7	3
873	1	6	2
874	2	1	7
875	2	6	7
876	2	9	7
877	1	4	5
878	3	6	7
879	3	6	1
880	2	2	1
881	1	8	8
882	1	8	4
883	1	6	2
884	1	1	7
885	2	9	8
886	2	8	2
887	1	9	7
888	1	4	4
889	2	2	6
890	1	4	6
891	2	2	3
892	2	6	6
893	1	3	7
894	1	10	8
895	2	8	7
896	3	4	5
897	2	2	7
898	3	5	6
899	2	10	4
900	3	9	2
901	2	4	4
902	2	10	8
903	3	3	7
904	2	1	5
905	3	8	6
906	1	8	8
907	2	6	8
908	2	9	3
909	2	3	6
910	1	2	1
911	2	7	4
912	3	9	6
913	2	10	8
914	2	4	2
915	2	5	3
916	2	1	7
917	1	1	8
918	2	2	1
919	1	8	8
920	2	5	8
921	1	4	2
922	2	8	1
923	2	6	1
924	1	4	2
925	2	8	2
926	1	5	8
927	2	8	6
928	3	10	2
929	3	4	7
930	2	4	7
931	2	3	3
932	3	9	4
933	1	3	5
934	1	5	7
935	3	10	4
936	3	9	4
937	3	9	5
938	3	6	5
939	3	1	4
940	2	9	5
941	1	7	2
942	3	5	6
943	3	3	5
944	1	2	3
945	2	3	1
946	1	8	4
947	3	8	8
948	3	3	8
949	3	2	2
950	3	7	1
951	1	4	3
952	3	9	6
953	1	7	1
954	3	6	3
955	3	5	7
956	2	6	5
957	2	4	2
958	2	3	8
959	1	7	4
960	3	7	6
961	3	3	3
962	3	5	3
963	1	1	7
964	1	9	1
965	3	1	2
966	3	1	4
967	1	4	2
968	3	8	1
969	1	2	5
970	2	2	8
971	3	3	2
972	1	4	6
973	1	3	6
974	3	5	5
975	3	10	6
976	1	5	8
977	3	9	6
978	3	2	7
979	3	10	7
980	1	4	5
981	2	6	8
982	1	4	6
983	1	4	8
984	3	7	1
985	1	2	7
986	2	5	4
987	1	8	7
988	3	7	4
989	1	8	1
990	1	1	8
991	1	5	8
992	1	2	8
993	3	5	3
994	1	3	8
995	3	9	8
996	1	4	7
997	1	1	3
998	2	3	8
999	1	8	2
1000	3	4	1
\.


--
-- TOC entry 4873 (class 0 OID 16475)
-- Dependencies: 219
-- Data for Name: stored; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stored (start_of_storing, finish_of_storing, id_book, id_storage) FROM stdin;
2023-07-05	2023-03-03	273	852
2023-03-16	2023-11-19	505	517
2023-08-29	2023-05-10	287	781
2023-09-20	2023-08-06	996	954
2023-08-30	2023-07-16	732	660
2023-06-18	2023-01-10	346	983
2023-04-21	2023-04-29	785	773
2023-03-05	2023-08-22	575	856
2023-01-16	2023-02-01	202	120
2023-06-28	2023-08-18	228	238
2023-04-29	2023-04-01	24	122
2023-12-04	2023-02-03	472	260
2023-11-20	2023-12-05	77	78
2023-03-07	2023-02-10	349	690
2023-07-06	2023-05-01	468	947
2023-10-17	2023-01-23	158	586
2023-06-26	2023-09-02	598	7
2023-06-30	2023-08-05	861	178
2023-05-13	2023-11-02	971	927
2023-04-24	2023-01-06	88	792
2023-03-20	2023-08-26	986	804
2023-10-31	2023-11-27	802	710
2023-06-29	2023-01-02	441	9
2023-01-13	2023-04-06	753	456
12023-01-13	2023-01-08	502	356
2023-06-11	2023-12-02	525	58
12023-01-08	2023-06-05	721	821
2023-08-27	2023-01-08	118	490
2022-12-11	2023-08-17	361	591
2022-12-11	2023-06-07	289	19
2023-06-18	2023-01-15	254	921
2023-01-22	2023-10-24	659	983
2023-01-17	2023-07-30	520	3
2023-06-10	2023-03-10	646	246
2023-10-03	2023-02-08	831	140
12023-01-17	2023-10-11	632	986
2023-01-19	2023-11-25	852	20
2023-10-05	2023-08-20	57	368
2023-06-03	2023-05-03	63	872
2023-05-03	2023-09-26	367	278
2023-01-11	2023-07-02	22	619
2023-11-24	2023-01-20	956	278
2023-01-17	2023-09-25	972	52
2023-02-06	2023-05-28	626	264
2023-05-10	2023-05-20	310	990
2023-11-21	2023-10-15	931	176
2023-08-25	2023-07-31	409	29
2023-07-07	2023-01-31	866	657
2023-02-22	2023-05-17	454	208
2023-02-10	2023-10-24	880	986
2023-11-21	2023-11-30	703	885
2023-11-26	2023-05-20	248	465
2023-01-21	2023-05-26	881	740
2023-02-08	2023-06-25	753	653
2023-05-04	2023-11-05	508	183
2023-03-09	2023-03-15	578	336
2023-03-20	2022-12-22	655	536
2023-03-08	2023-06-17	836	791
2023-05-09	2023-05-28	966	772
2023-10-02	2023-08-31	681	364
2023-06-07	2023-09-30	842	844
2023-04-27	2023-10-05	556	939
2023-07-25	2023-06-18	131	779
2022-12-13	2022-12-16	547	673
2023-10-17	2023-06-04	628	691
2023-05-23	2023-10-07	770	383
2023-02-25	2023-06-24	190	93
2023-03-26	2022-12-12	894	707
2023-04-05	2022-12-08	310	802
2023-03-06	2023-07-23	270	428
2023-04-29	2023-03-25	859	547
2023-09-27	2023-01-29	94	943
2023-05-12	2023-03-22	791	346
2023-09-24	2023-10-06	841	687
2023-02-23	2023-11-26	78	909
2022-12-19	2023-06-10	26	113
2023-03-18	2023-07-05	400	28
2023-09-25	2023-01-25	662	962
2023-07-09	2023-04-02	914	864
2023-05-01	2023-07-14	905	400
2023-06-23	2023-08-12	409	272
2023-05-08	2023-09-25	138	582
2023-07-04	2023-03-23	71	387
2023-02-09	2023-06-19	172	995
2023-06-25	2023-02-01	771	824
2023-07-01	2023-05-25	109	11
2023-05-13	2023-09-02	980	692
2023-08-16	2023-01-26	530	321
2023-05-04	2023-08-03	35	559
2022-12-25	2022-12-14	653	966
2023-05-27	2023-08-17	581	635
2023-03-14	2023-09-16	711	162
2023-09-11	2023-01-16	172	814
2023-08-28	2023-03-29	148	927
2023-05-04	2022-12-26	644	528
2023-05-24	2023-07-09	146	354
12023-02-03	2022-12-14	692	14
2023-02-24	2023-11-25	721	548
2023-10-21	2023-11-20	213	806
2022-12-31	2023-06-26	340	799
2023-04-07	2023-04-03	817	242
2023-04-20	2023-03-24	87	515
2023-08-07	12023-01-13	529	946
2023-01-10	2023-05-04	762	182
2023-07-11	2023-11-20	206	430
2023-05-25	2023-06-02	332	106
2023-07-19	2023-05-07	644	766
12023-01-06	2023-09-16	395	528
2023-07-09	2023-02-16	249	29
2023-03-09	2023-07-29	323	942
2023-07-28	2022-12-30	192	412
2023-01-06	2023-01-03	385	419
2022-12-15	2023-02-13	592	706
2023-02-24	2023-01-10	416	225
2023-02-25	2022-12-07	235	407
2023-05-05	2023-07-01	354	817
2023-07-07	12023-01-23	161	803
2023-03-22	2023-04-15	931	533
2023-02-09	2023-11-01	930	344
2023-06-21	2023-06-01	349	385
2023-04-11	2023-05-12	847	569
12023-01-22	2023-08-23	660	425
2023-05-11	2023-08-30	291	160
2023-10-05	2023-09-19	49	6
2022-12-21	2023-10-03	495	699
2023-03-14	12023-01-22	356	956
2023-02-21	2023-05-01	757	825
2023-05-16	2023-09-22	474	367
2023-08-06	2023-04-05	769	807
2023-10-14	2023-03-20	90	538
12023-02-01	2023-05-20	378	583
12023-01-06	2023-01-13	298	155
2023-06-05	2023-01-31	868	32
2023-03-09	2023-04-02	114	898
2022-12-22	2023-08-10	614	67
2023-02-01	2023-08-17	10	238
2023-03-14	2023-04-22	403	602
2023-10-02	2023-02-02	1	486
2023-01-05	2023-07-17	186	238
2023-04-10	2023-09-01	434	207
2023-01-06	2023-07-01	336	485
2023-05-30	2023-05-15	175	282
2023-03-03	2022-12-31	690	402
2023-07-25	2023-04-23	654	132
2023-04-11	2023-08-25	452	939
2023-10-20	2022-12-16	392	18
2023-08-10	2023-08-17	217	992
2023-09-03	2022-12-30	815	13
2023-01-02	2023-04-18	473	960
2023-05-07	2023-01-01	695	147
2023-05-22	12023-01-13	392	696
2023-01-28	2023-10-18	985	433
2023-05-09	2023-02-18	609	365
2023-11-18	2023-08-01	743	248
2023-09-10	2023-02-15	829	35
2022-12-22	2023-07-16	511	579
2023-10-13	2023-03-21	133	227
2023-08-05	2023-01-31	380	357
2023-08-10	12023-01-22	110	350
2023-09-24	2023-10-31	17	427
2023-01-19	2023-08-09	961	863
2023-09-10	2023-01-09	289	549
2023-08-02	2023-02-23	692	619
2023-09-06	2023-09-13	801	363
2022-12-31	2023-09-19	484	31
2023-02-25	12023-01-10	324	379
2023-08-08	2023-07-19	596	166
2023-11-02	2023-06-30	55	511
2023-08-24	2023-08-27	192	224
2023-10-24	2023-06-11	265	658
2023-02-18	2023-08-24	173	672
2023-10-29	2023-07-07	701	662
2023-03-01	2023-07-19	116	897
2023-10-24	2023-11-05	80	114
2023-03-26	2023-02-26	627	95
2023-08-30	2023-10-10	805	546
2022-12-24	2023-09-20	409	183
2022-12-18	2023-03-25	762	824
2023-07-25	2023-01-25	437	1
2023-02-10	2023-03-09	352	946
2023-08-09	2023-01-21	929	690
2023-09-12	2023-01-19	550	188
2023-03-26	2023-05-13	204	287
2023-02-04	2023-07-06	13	343
2023-04-28	2023-06-14	255	811
2023-03-12	2023-10-11	908	745
2023-07-27	2023-04-25	116	170
2023-09-18	2023-04-20	353	67
2023-03-21	2023-05-20	349	863
2023-02-09	2023-01-28	163	624
2023-09-25	2023-01-28	193	988
2023-01-20	2023-01-20	522	989
2022-12-17	2023-04-13	201	791
2023-02-14	2023-07-02	372	994
2023-09-03	12023-01-17	277	938
2023-11-14	2023-07-15	623	602
2023-02-02	2023-08-15	176	243
2023-11-26	2023-05-09	602	937
2023-11-27	2023-01-29	406	412
2023-02-15	2023-09-29	389	194
2023-05-02	2023-03-06	441	772
2023-09-19	2023-04-16	348	985
2023-06-27	2023-07-18	539	601
2023-03-07	2023-04-29	461	602
2023-03-21	2023-01-06	306	878
2023-08-14	2023-09-04	320	569
2023-01-04	2023-02-26	246	940
2023-06-22	2023-05-10	113	660
2023-03-18	2023-10-30	905	992
2023-08-22	2023-04-30	48	469
2023-02-12	2023-01-24	38	228
2023-05-21	2023-10-03	967	698
2023-02-04	2023-05-29	667	290
2023-03-03	2023-08-03	923	777
2023-04-21	2023-08-20	533	892
2023-11-14	2023-01-28	925	608
2023-09-26	2022-12-26	257	430
2023-04-10	2023-05-19	705	97
12023-01-17	2023-09-29	490	509
2023-03-16	2023-02-20	82	246
2023-03-09	2023-06-10	929	999
2023-11-05	2023-06-10	614	973
2023-09-23	2023-06-16	688	202
2023-04-11	2023-02-08	435	67
2023-04-03	2023-06-02	856	495
2022-12-23	2023-02-22	975	754
2023-06-25	2023-11-21	419	696
2023-01-22	2023-11-12	66	156
2023-03-14	2023-01-03	545	172
2023-08-14	2023-10-08	768	797
12023-01-28	2023-06-20	849	965
2023-07-01	2023-06-26	163	739
2022-12-19	2023-11-18	158	623
2023-02-14	2023-11-18	155	936
2023-12-04	2023-06-06	385	722
2022-12-25	2023-02-24	871	904
2023-06-21	2023-07-21	26	86
2023-11-07	2023-01-15	132	393
2022-12-22	2023-06-12	363	214
2022-12-10	2023-05-05	5	503
2023-03-26	2023-06-11	758	509
2023-08-28	2023-02-03	544	348
2023-05-08	2023-08-22	376	725
2023-08-03	2023-04-19	876	924
2023-10-13	2023-09-11	711	583
2023-03-14	2023-02-21	522	549
2023-07-09	2023-04-10	471	355
2023-11-25	2023-01-21	120	716
2023-05-16	2023-08-22	543	124
2023-06-20	2023-09-21	321	976
2023-01-21	2023-11-27	480	489
2023-05-08	2023-05-04	332	893
2023-05-29	2023-02-28	54	529
2023-10-02	2023-08-07	586	192
2023-01-29	2023-10-02	236	136
2023-04-13	2023-08-16	201	710
2023-02-03	2023-05-16	934	429
2023-06-03	2023-09-20	346	378
2023-07-08	2022-12-24	571	687
2022-12-30	2023-01-13	694	558
2023-07-31	2023-09-02	616	651
2023-03-03	2023-02-23	683	525
2023-06-03	2023-04-18	487	402
2023-09-11	2023-03-06	248	879
2022-12-18	2023-08-23	342	932
2023-02-06	2022-12-19	6	184
2023-09-05	2023-06-28	158	620
2023-09-16	2023-05-13	271	920
2023-11-20	2023-03-12	859	27
2022-12-26	2023-05-15	428	420
2023-07-14	2023-10-21	439	278
2023-04-11	2023-11-14	567	395
2023-09-14	2023-05-15	248	136
2023-10-28	2023-04-24	746	770
2023-05-01	2023-08-05	816	689
2023-07-13	2022-12-12	916	257
2023-03-19	2022-12-22	457	794
2023-03-31	2023-10-31	543	526
2023-08-17	2023-06-08	81	53
2023-08-13	12023-01-28	949	507
2023-03-14	2023-10-23	635	657
2023-06-29	2022-12-16	920	635
2023-02-07	2023-09-05	839	767
2023-06-25	2023-06-21	596	392
2023-10-06	2023-04-01	760	471
2023-01-13	2023-08-17	480	324
2023-07-07	2022-12-21	750	171
2023-03-07	2023-07-13	588	490
2022-12-16	2023-06-08	592	406
2023-03-29	2023-02-08	164	806
2023-01-23	2023-02-11	843	43
2023-10-31	2023-11-30	928	399
2023-01-15	2023-03-03	958	328
2023-07-13	2023-09-16	303	654
2023-06-13	2023-10-26	902	470
2023-09-22	2022-12-22	959	709
2023-11-14	2023-04-28	941	96
2023-09-12	2023-09-24	366	203
2023-01-20	2023-06-12	720	294
2023-09-23	2023-01-01	986	607
2023-07-09	2023-10-28	366	45
2023-08-24	2023-06-15	543	982
12023-01-03	2023-09-10	944	669
2023-03-03	2023-10-03	817	558
2023-06-09	2023-04-30	112	498
2023-08-18	2023-10-30	622	886
2023-01-11	2023-10-01	832	702
2023-05-18	2023-07-03	463	875
2022-12-11	2023-06-12	521	159
2023-09-20	2023-07-31	153	929
2023-01-16	2023-04-26	467	750
2023-02-14	2023-04-18	713	672
2023-06-01	2023-10-04	251	439
2022-12-10	2023-06-01	187	533
2023-07-26	2023-03-17	987	267
2023-10-10	2022-12-25	705	526
2023-04-17	2023-02-17	858	542
2023-10-11	2023-04-08	414	745
2023-02-23	2023-06-30	37	537
2023-07-30	2023-06-18	473	176
2023-05-14	2023-02-28	383	212
2023-02-13	2023-06-26	409	59
2023-03-19	2023-04-11	912	522
2023-08-23	2023-07-03	725	242
2023-02-01	2023-08-16	968	25
12023-02-06	2023-01-16	761	669
2023-10-14	2023-02-19	890	588
2023-07-31	2023-01-02	673	271
2023-02-09	2023-07-27	95	660
12023-01-09	2023-09-12	193	444
2023-07-28	2023-08-20	197	79
2023-02-09	2023-05-02	346	155
2023-09-03	2023-08-05	926	261
2023-02-13	2023-01-21	496	358
2022-12-23	2023-02-22	377	805
2023-07-09	2023-09-02	477	855
2023-11-24	2023-09-15	740	721
2023-02-27	2023-01-25	213	428
2023-10-20	2023-06-27	902	867
2023-03-12	2023-10-15	968	266
2023-04-13	2023-05-12	658	354
2023-04-06	2023-02-20	59	145
2023-07-09	2023-03-18	386	718
2023-05-13	2023-09-02	890	660
2023-08-24	2023-10-29	814	410
12023-02-01	2023-01-17	285	41
2023-03-07	2023-03-14	35	557
2023-05-06	2023-10-21	885	189
2023-06-07	2023-03-18	768	888
2023-07-17	2023-05-08	792	398
2023-02-07	2023-05-15	568	110
2023-07-29	2023-01-09	45	9
2023-01-23	2023-06-18	46	807
2023-05-28	2023-09-08	903	504
2023-10-08	2023-01-10	24	888
2023-10-01	2023-05-07	444	466
12023-01-17	2023-01-13	483	375
2023-02-07	2023-06-27	971	5
2023-01-26	2023-05-10	139	194
2022-12-26	12023-01-22	762	934
2023-10-01	2023-04-27	634	186
2023-07-01	2023-02-23	405	672
2023-01-20	2023-03-28	731	782
2023-04-03	2023-08-17	197	715
2023-01-27	2023-03-08	489	276
2023-05-01	2023-09-02	596	339
2023-07-29	2023-01-11	529	866
2023-04-26	12023-01-08	308	389
2023-05-19	2023-11-18	422	217
12023-01-03	2023-05-08	570	964
2023-10-23	2023-10-03	996	834
2023-04-13	2023-04-19	450	164
2023-10-25	2023-08-15	804	286
2023-11-27	2023-02-12	372	129
2023-01-15	2022-12-29	177	801
2023-04-07	2023-09-14	392	298
2023-05-11	2023-08-27	958	944
2023-12-02	2023-09-03	996	385
2023-01-17	2023-11-21	679	602
2023-04-01	2023-11-02	358	247
2022-12-09	2023-09-20	16	379
2023-07-26	2023-04-25	591	992
2023-04-11	12023-01-23	371	445
2023-03-31	2023-03-20	110	104
2023-08-22	12023-01-28	756	717
2023-02-13	12023-02-03	425	889
2023-07-22	2023-01-22	524	696
2023-04-05	2023-08-27	955	775
12023-01-22	2023-07-07	737	172
12023-01-15	2023-03-17	256	4
2023-08-26	2023-05-27	476	769
2023-03-24	2022-12-21	785	40
2023-08-31	2023-10-10	173	83
2023-10-09	12023-01-17	937	737
2023-07-08	2023-10-02	911	655
2023-03-16	2023-04-05	763	674
2023-10-28	2023-08-08	442	78
12023-02-03	2023-04-06	618	11
2023-06-16	2022-12-30	629	355
2023-07-30	2023-04-02	939	658
2023-02-11	2022-12-10	635	868
2023-03-25	2023-02-13	659	374
2023-06-17	2023-04-19	977	32
2023-09-09	2023-09-24	954	351
2023-01-12	2023-09-24	587	690
2023-09-08	2023-10-30	610	63
2023-02-28	2023-02-18	456	978
2023-04-10	2023-08-19	656	654
2023-11-24	2023-07-11	425	637
2023-01-12	2023-02-24	612	536
2023-01-07	2023-08-02	628	24
2023-10-27	2023-04-29	502	196
2023-08-23	2023-02-25	981	889
2023-04-08	2023-02-09	117	757
2023-01-17	2023-06-13	291	709
2023-07-14	2023-02-21	941	503
2023-09-07	2023-10-16	497	187
2023-09-15	2023-06-29	751	143
2023-08-19	2022-12-30	459	196
2023-09-09	2023-06-13	523	739
2023-05-23	2023-07-24	174	538
2023-06-10	2023-01-04	274	720
2023-11-25	2023-08-25	449	848
2023-07-21	2023-10-20	124	624
2023-03-11	2023-09-23	918	726
2023-04-22	2023-02-23	893	557
2023-03-11	2023-05-14	207	849
2023-06-17	2023-05-19	842	373
2022-12-07	2023-02-16	350	322
2023-10-05	2023-01-02	404	192
2023-01-28	2023-10-07	374	487
2023-02-09	2023-01-10	808	973
2023-07-07	2023-09-24	259	721
2022-12-14	2023-11-07	943	684
2023-03-27	2023-07-15	457	141
2023-07-27	2023-06-23	389	409
2023-02-10	2023-10-15	113	544
2022-12-11	2023-07-17	367	1
2023-05-13	2023-09-20	235	474
2023-06-02	2023-08-07	31	972
2023-11-20	2023-01-06	315	136
2023-07-03	2023-09-20	195	556
2023-03-07	2023-07-15	838	342
2023-02-18	2023-11-27	76	649
2023-03-21	2023-07-30	533	288
2023-10-24	2023-10-11	425	525
2023-10-01	2023-10-05	301	528
2023-07-01	2023-09-17	443	180
2023-05-08	2023-11-27	453	346
2023-07-07	2023-03-21	880	331
2023-05-04	2023-10-21	215	713
2023-05-28	2023-06-08	587	279
2023-03-03	2023-04-17	752	211
2023-08-15	2023-06-13	165	37
2023-08-02	2023-04-18	10	4
2023-09-12	2023-02-03	473	55
2023-02-05	2023-04-22	461	74
2023-07-14	2023-03-22	432	498
2023-08-12	2023-04-01	344	785
2023-09-04	2023-07-03	74	254
2023-01-01	2023-05-12	657	385
2023-01-06	2023-03-03	517	721
2023-07-03	2023-10-01	437	41
2023-06-29	2023-09-17	319	624
2023-06-28	2023-11-12	753	993
2022-12-17	12023-01-17	612	456
2023-03-29	2023-10-23	72	877
2023-04-19	2023-04-26	4	533
2023-09-08	2023-06-05	140	867
2023-02-25	2023-06-15	593	390
2023-02-15	2022-12-14	298	964
2023-03-19	2023-02-22	257	960
2023-09-04	2023-03-12	226	905
2023-08-23	2023-10-05	231	359
2023-11-19	2023-07-09	663	321
2022-12-10	2023-09-23	10	440
2023-06-28	2023-08-03	306	348
12023-02-06	2023-06-14	915	141
2023-09-10	2023-10-02	118	544
2023-03-19	2023-11-01	952	981
2023-10-20	12023-01-29	895	681
2023-06-03	2023-09-22	806	58
2023-09-23	2023-03-25	908	163
2022-12-28	2023-10-19	2	625
2022-12-17	2023-04-03	313	6
2023-01-04	2023-04-02	911	499
2023-04-20	2023-08-06	500	107
2023-02-11	12023-01-22	165	275
2023-08-09	2023-11-20	670	560
2023-08-14	2022-12-20	321	715
2023-07-16	2023-01-17	443	535
2023-01-28	2023-10-25	466	468
2023-03-17	2023-04-08	111	627
2023-02-04	2023-01-27	934	348
2023-04-27	2023-11-21	22	595
2023-02-14	12023-01-06	954	826
12023-01-15	2023-05-12	296	498
2023-10-20	2023-04-02	327	491
2022-12-26	2023-02-08	115	593
2023-11-30	2023-09-19	897	402
2023-11-30	2023-07-27	683	367
2023-03-20	2023-09-19	486	893
2023-05-31	2023-07-27	978	509
2023-11-02	2023-05-20	474	981
2023-09-18	2023-10-12	556	391
2023-03-09	2023-02-04	408	661
2023-01-17	2023-06-20	443	903
2023-06-04	12023-01-03	229	226
2023-08-08	2023-04-07	260	886
2023-01-11	2023-06-22	407	121
2023-01-24	2023-07-10	188	292
2023-09-11	2023-04-05	940	287
2023-05-24	2022-12-07	433	115
2023-10-01	2023-08-29	74	605
2023-01-05	2023-06-08	582	692
2023-09-15	2023-06-25	189	591
2023-08-14	2023-01-24	419	721
2023-03-31	12023-01-13	748	521
2023-05-10	2023-01-22	264	401
2023-10-03	2023-03-28	908	836
2023-03-08	2023-08-04	693	181
2023-03-28	2023-07-27	426	237
2023-04-10	2023-09-28	224	706
2023-11-19	2022-12-25	111	936
2023-09-20	2023-10-29	288	68
2023-03-18	2023-03-18	407	563
2023-02-19	2023-01-16	207	757
2022-12-29	2023-01-10	703	937
2023-06-22	2023-01-19	553	939
2023-09-25	2023-01-26	648	854
2023-07-12	2023-06-13	917	667
2023-03-05	2022-12-22	432	905
2023-06-01	2023-03-06	532	356
2023-02-24	2022-12-28	872	237
2023-04-13	2023-10-30	267	289
2023-10-28	2023-08-13	698	307
2023-04-02	2023-01-29	636	565
2023-01-27	2022-12-13	237	913
2023-05-03	2023-08-14	569	841
2023-11-05	2023-05-04	69	514
2023-09-09	2023-09-16	908	194
2023-06-13	2022-12-21	129	90
2023-03-15	2023-05-16	590	241
2023-06-02	2023-08-19	103	163
2023-02-28	2023-08-08	952	790
2023-04-17	2023-06-19	208	114
2023-02-07	2023-05-09	515	359
2023-01-12	2022-12-13	477	988
2023-03-22	2023-07-17	440	77
2022-12-20	2023-02-03	968	338
2023-03-26	2023-01-09	118	790
2023-05-06	2023-03-06	759	238
2023-05-12	2023-06-02	424	868
2023-05-09	2023-02-10	417	523
2023-09-03	2023-09-17	602	997
2023-10-15	2022-12-25	538	988
2023-03-11	2023-04-07	867	791
2023-11-12	2023-01-08	622	341
2023-01-20	2023-06-17	420	702
2023-02-26	2023-08-04	775	333
2023-05-18	2023-05-17	183	361
2023-07-02	2023-04-07	347	167
2023-08-30	2023-11-18	469	719
2023-04-15	12023-01-13	63	466
2022-12-30	2023-04-04	277	550
2023-02-03	2023-06-01	45	303
2023-03-24	2023-05-24	413	917
2023-11-01	2023-05-08	24	151
2023-02-20	2023-07-16	590	599
12023-02-01	2023-05-01	406	52
2023-09-24	2023-04-06	767	534
2023-05-09	2023-10-24	337	994
2023-04-13	2023-11-14	342	499
2023-06-14	2023-05-20	263	132
2023-10-09	2023-05-31	301	350
2023-09-14	2023-11-30	663	715
2023-08-07	2023-05-01	569	547
2023-01-01	2023-08-10	285	102
2023-03-09	2023-11-05	30	26
2023-09-29	2023-05-21	451	844
2023-09-19	2023-05-01	37	948
2023-05-28	2023-08-16	677	898
2023-08-31	2023-08-23	524	889
2023-03-01	2023-05-26	171	680
2022-12-29	2023-06-13	896	869
2023-03-20	2023-04-10	944	843
2023-03-11	2023-05-08	944	642
2023-07-04	2023-08-06	445	837
2023-06-05	2023-08-15	214	770
2023-11-07	2023-07-02	910	240
2023-08-02	2023-04-17	220	713
2023-02-09	12023-01-13	973	17
2023-03-11	2023-03-28	689	631
2023-02-24	2023-03-09	724	5
2023-03-25	2023-05-07	83	277
2023-09-17	2023-05-23	916	884
2023-03-19	2023-05-18	973	837
2022-12-08	2023-07-08	483	930
2023-07-24	2023-09-18	541	246
2023-03-17	2023-04-20	700	798
2023-03-02	2023-09-23	985	438
2023-04-03	2023-10-08	813	166
2023-03-02	2023-03-01	241	520
2023-04-30	2023-08-10	358	254
2023-11-27	2023-05-16	822	482
2023-01-23	2023-06-20	919	38
2023-09-11	2023-05-12	982	408
2023-04-12	2023-09-12	110	786
2023-10-09	2023-09-22	889	531
2023-02-06	2023-08-19	957	686
2023-03-23	12023-01-06	629	868
2023-10-24	2023-09-14	348	771
2023-08-19	2023-12-04	273	689
2023-06-21	2023-10-31	125	204
2023-02-26	2023-08-30	701	570
2023-10-24	2023-09-27	354	916
12023-01-04	2023-07-04	16	839
2023-10-23	2023-06-21	399	186
2023-03-04	2023-09-03	336	548
2023-07-22	2023-05-24	108	809
2023-10-05	2023-02-24	802	559
2023-03-08	2023-07-10	998	162
2023-05-21	2023-02-08	255	893
2023-07-15	2023-07-19	553	343
2023-07-12	2023-04-15	319	695
2023-11-21	2023-02-01	622	994
2023-07-13	2023-02-08	769	322
2023-01-06	2023-03-07	158	452
2023-08-03	2023-07-14	683	300
2023-03-31	2023-07-11	18	297
2023-04-27	2023-05-05	41	384
2023-02-28	2023-06-07	830	295
12023-02-01	2022-12-17	848	336
2023-03-07	2023-08-15	667	975
2023-09-13	2023-09-16	429	862
2023-05-29	2023-11-30	927	61
2023-08-02	2023-03-08	653	921
2023-10-22	2023-04-03	449	522
2023-01-13	2023-05-21	918	157
2023-03-12	2023-06-13	835	455
2023-03-07	2023-09-19	620	130
12023-02-03	2023-04-13	914	843
2023-09-13	2023-07-12	800	886
2023-01-28	2023-08-01	310	361
2023-07-17	2023-07-30	441	326
2023-07-01	2023-09-11	3	501
2023-02-07	2022-12-11	221	126
2023-01-25	2023-02-09	625	404
2023-06-15	2023-03-09	515	715
2023-11-12	12023-02-03	499	429
2023-07-07	2023-10-23	470	160
2023-07-22	12023-01-11	234	487
2023-03-25	2023-03-09	734	407
2023-07-23	2023-08-13	810	663
2023-04-24	2023-07-22	87	299
2023-06-24	2023-01-07	83	129
2023-10-27	2023-05-09	65	258
2023-06-23	2023-04-09	747	872
2023-03-22	2023-10-09	647	664
2023-04-12	2023-05-07	684	899
2023-06-23	2023-08-13	184	876
2023-02-22	2023-04-08	808	190
2022-12-15	2023-02-03	60	295
2023-04-14	2023-04-13	72	854
2023-09-20	2023-03-26	962	678
2022-12-20	2022-12-07	267	40
2023-01-20	2023-02-03	218	56
2023-04-11	2023-10-17	341	311
2023-08-03	2023-05-20	305	849
2023-04-10	2022-12-16	299	77
2023-07-07	2023-10-25	398	470
2023-02-15	2023-02-13	667	508
2023-02-27	2023-08-06	406	134
2023-08-05	12023-01-04	907	163
2023-03-11	2023-03-03	752	4
2023-08-16	2023-03-10	931	14
2023-02-16	12023-01-10	911	96
2023-03-02	2023-10-11	793	712
2023-01-27	2023-06-03	647	870
2023-04-22	2022-12-08	98	145
2023-02-13	2023-06-03	414	765
2023-09-02	2023-08-06	81	649
2023-03-17	2023-10-01	929	587
2023-01-27	2023-01-15	275	749
2023-03-31	2023-03-27	429	579
12023-01-04	2023-02-22	727	861
2023-07-06	2023-06-01	340	592
2022-12-19	2023-07-25	475	171
12023-01-04	12023-02-06	24	767
2023-05-28	2023-01-10	943	693
2023-10-19	2023-01-14	847	21
12023-02-01	2023-05-02	331	765
2023-04-27	2023-04-26	671	890
2023-03-17	2023-08-03	160	470
2023-10-24	2023-02-04	180	653
2023-11-02	2023-04-11	866	206
2023-09-23	2023-04-21	788	310
2023-10-18	12023-01-23	131	603
2023-11-19	2023-05-09	157	454
12023-02-06	2023-10-27	252	967
2023-05-05	2022-12-20	769	628
2023-05-10	2023-06-25	598	232
2023-09-04	2023-06-04	342	601
2023-02-01	2023-11-02	272	474
2023-08-16	2023-11-19	90	905
2023-02-01	2023-06-02	449	97
2023-06-10	2023-10-17	264	868
2023-01-15	2023-08-01	399	1000
2023-06-07	2023-05-22	61	359
2023-03-31	2023-01-13	621	996
12023-01-11	2023-03-25	839	855
2023-03-13	2023-06-27	781	379
2023-06-03	2023-05-31	59	182
2023-07-14	2023-08-16	469	689
2023-03-02	2023-03-12	239	439
2023-03-25	2023-07-22	836	142
2023-03-17	2023-04-02	402	337
2023-09-14	2023-02-18	409	71
2023-09-15	2023-09-16	828	1
2023-06-19	2023-08-17	958	819
2023-05-09	2023-01-01	661	330
2023-10-20	2023-01-02	217	735
2022-12-28	2023-09-15	678	54
2023-06-17	2023-03-05	2	195
2023-05-18	2023-07-30	639	725
2023-04-13	2023-07-08	352	801
2023-09-17	2023-05-25	785	305
2023-08-08	2023-09-02	926	312
2023-02-19	2023-03-22	960	97
2023-04-30	12023-02-03	306	304
2023-04-08	2023-11-05	557	750
2023-01-23	2023-10-11	241	133
2023-01-01	2023-06-21	16	224
2023-01-04	2023-01-01	4	766
2022-12-16	2023-01-01	622	502
2023-01-26	2023-03-28	396	947
2023-10-06	12023-01-29	749	893
2023-10-18	2023-02-11	480	292
2023-02-26	2023-05-31	84	433
2023-09-25	2023-04-18	947	664
2023-11-21	2023-09-30	752	70
2023-08-15	12023-01-03	616	97
2023-09-17	2022-12-11	874	311
2022-12-09	2023-05-09	905	841
2023-01-08	2023-01-29	928	260
2023-09-15	2023-03-27	897	506
2023-05-07	2023-02-06	880	212
2023-06-15	2023-04-18	244	781
2023-10-02	2023-10-30	629	844
2023-04-12	2023-09-13	393	24
2023-05-20	2023-01-17	137	955
2023-11-02	2023-04-06	467	555
2023-09-14	2023-06-18	559	804
2023-05-06	2023-06-20	477	907
2023-04-15	2023-01-11	233	64
2023-10-22	2022-12-27	571	552
2023-08-05	2023-09-07	335	900
2023-01-09	2023-11-20	990	37
2023-10-01	2023-10-13	440	427
2023-07-30	2023-09-27	46	625
2023-07-17	2023-01-05	972	547
2023-06-11	12023-01-08	436	845
2023-08-26	2023-09-05	503	303
2023-10-02	2023-03-19	888	514
2023-03-29	2023-11-27	262	802
2023-02-21	2023-08-06	75	991
2023-10-24	2023-04-08	175	967
2023-11-05	2023-06-22	541	951
2023-07-29	2023-12-04	932	522
2023-03-13	2023-01-25	84	867
2023-09-21	2023-02-24	743	889
2023-09-17	12023-01-23	464	957
2023-02-02	2023-10-07	455	691
2022-12-25	2023-11-24	708	645
2023-07-19	2023-07-14	970	454
2023-06-21	2023-10-10	282	367
2023-01-12	2023-05-28	718	980
2023-03-12	2023-07-02	680	661
2023-10-31	2023-05-24	18	290
2023-03-07	2023-03-11	21	807
2023-08-17	2023-04-16	806	880
2023-02-14	2023-03-05	80	551
2023-08-18	2023-07-29	14	258
2023-03-26	2023-09-21	759	265
2023-06-09	2023-10-05	466	520
2023-07-09	2023-01-14	240	501
2023-08-14	2023-09-27	279	329
2023-08-22	2023-06-07	987	417
2022-12-10	2023-10-05	551	851
2023-05-28	2023-06-17	135	578
2023-07-09	2023-01-10	76	129
2023-03-08	2023-04-14	441	476
2022-12-11	2023-05-31	110	574
12023-01-09	2023-11-02	99	856
2023-05-28	2023-09-04	781	84
2023-05-20	2023-07-04	272	342
2023-11-30	2023-09-25	923	265
2023-01-08	2023-07-09	971	44
2023-04-23	2023-06-28	677	526
2023-03-02	12023-01-29	664	548
2023-07-05	2023-01-22	696	108
2023-03-06	2023-05-12	740	804
2022-12-07	2023-01-27	136	928
2023-01-18	2023-04-28	752	254
2023-05-18	2023-08-30	201	958
2023-05-06	2023-07-10	531	752
2023-08-27	2022-12-18	25	963
2023-09-18	2023-10-10	951	109
2023-03-23	2023-10-29	929	900
2023-04-15	2023-03-02	449	407
2023-09-30	2023-10-07	667	356
2023-01-17	2023-01-06	508	899
2023-05-18	2023-03-23	631	909
2023-04-23	2023-06-05	389	990
2023-11-18	2023-08-28	974	800
2023-11-27	2022-12-17	916	694
2023-02-10	2022-12-13	190	208
2023-10-25	2023-11-12	47	124
2023-07-23	2023-05-13	287	976
2023-04-26	2023-09-03	629	651
2023-08-20	2023-08-25	365	528
2023-01-09	2023-09-19	965	558
2023-10-29	2023-11-01	60	895
2023-04-21	2023-06-27	907	567
2023-02-19	2022-12-08	990	36
2023-08-01	2023-06-11	402	155
2023-04-09	2023-09-17	787	647
2023-10-26	2023-02-02	143	364
2022-12-31	2023-05-22	996	967
2023-08-22	2022-12-23	631	318
2023-09-23	2023-03-05	132	814
2023-11-26	2023-09-21	875	762
2023-02-17	2023-05-20	194	363
2023-07-04	2023-01-16	555	78
12023-01-11	2023-10-05	769	408
2023-08-19	12023-01-13	483	668
2023-07-30	2023-06-14	910	164
2022-12-26	12023-01-23	999	24
2023-01-22	2023-07-07	305	645
2023-08-09	2023-04-23	117	383
2023-06-19	2023-03-18	682	345
2023-02-11	2023-12-02	28	287
2023-11-20	2023-05-05	858	343
2023-01-02	2023-08-30	640	786
2023-02-08	2023-07-02	792	273
2022-12-18	2023-12-02	755	217
2023-11-01	12023-01-11	38	40
2023-08-26	2023-11-02	866	848
2023-01-05	12023-01-06	707	890
2023-05-12	2023-09-10	84	589
2023-04-21	2023-06-21	553	907
2022-12-12	2023-09-12	207	780
2023-08-07	2023-06-11	642	864
2022-12-30	2023-04-18	633	2
2023-03-09	2023-12-05	757	809
2023-02-27	2023-10-23	953	449
2023-06-25	2023-07-01	341	264
2023-06-23	2023-01-03	207	748
2023-04-12	2023-07-30	385	669
2023-03-09	2023-05-18	343	625
2023-10-27	2023-01-09	692	263
2023-02-01	2023-09-24	340	350
2022-12-25	2023-11-27	334	11
2023-07-27	2023-07-14	841	505
2023-08-01	2023-11-27	958	628
2022-12-22	2023-02-20	863	435
2023-02-23	2023-03-06	658	283
2023-03-16	2023-04-22	483	329
2023-04-20	2022-12-11	367	437
2023-04-06	2023-10-10	1000	933
2023-10-04	2023-08-02	136	589
2023-03-17	2023-05-25	40	427
2023-06-01	2023-04-08	932	53
12023-01-04	2023-03-27	357	105
2023-08-19	2023-05-07	961	981
2023-06-28	2023-02-06	105	229
2023-03-13	2023-04-29	254	129
2023-07-17	2023-07-21	107	505
2023-07-02	2023-05-25	16	627
2023-05-27	2023-09-04	645	485
2023-10-26	2023-06-14	800	288
2023-07-10	2023-04-01	505	496
12023-01-04	2023-05-10	408	254
2023-05-28	2023-07-26	190	610
2023-08-11	2023-01-18	388	362
2023-09-07	2023-11-14	502	316
2023-03-23	2023-08-10	344	604
2023-10-14	2023-09-18	3	394
2023-05-28	12023-01-17	438	478
2023-08-08	2023-02-13	678	945
2023-04-28	2023-07-18	487	888
2023-12-05	2023-04-11	746	750
2023-01-16	2023-08-02	364	371
2023-08-02	2023-07-22	715	711
2023-03-30	2023-04-24	134	691
2023-05-28	2023-03-23	354	877
2023-03-18	2023-07-23	25	216
2023-09-24	2023-02-21	4	935
2023-06-12	2023-10-20	760	248
2023-09-04	12023-01-06	235	358
2023-07-05	2023-10-24	865	125
2022-12-07	2023-07-30	874	524
2023-03-28	2023-01-24	45	396
2022-12-12	2023-05-21	591	526
2023-01-30	2022-12-08	600	611
2023-10-10	2023-06-09	495	289
2023-06-17	2023-06-09	643	347
2023-03-25	2023-07-19	590	635
2023-11-30	2023-02-19	279	329
2023-05-22	2023-07-23	8	846
2023-09-05	2023-04-09	747	261
2023-08-03	2023-06-09	790	929
2023-03-29	2022-12-29	974	419
2023-07-11	2023-10-16	80	580
2023-05-10	2023-06-25	350	198
2023-05-15	12023-02-06	428	732
2023-10-23	2023-07-23	412	897
2023-09-19	2023-01-11	259	532
2023-10-01	2023-09-16	180	235
2023-04-24	2023-03-12	58	468
2023-06-14	2023-10-17	394	773
2023-08-06	2023-04-21	286	681
2023-06-22	2023-10-23	730	727
2023-06-16	2023-11-01	712	998
12023-01-09	2023-04-27	557	476
2023-02-11	2023-11-25	731	391
12023-01-29	2023-05-09	780	521
2023-05-20	2023-06-03	188	806
2022-12-28	2023-04-08	904	253
2023-10-27	2023-08-29	748	6
2022-12-28	2023-01-25	825	934
2023-04-04	2023-04-08	353	773
2023-06-04	2023-07-25	364	912
2023-10-26	2023-10-12	229	306
2023-02-25	2023-03-12	949	20
2023-08-23	2023-01-07	1	270
2023-03-06	2023-01-19	104	571
2023-07-15	2023-02-12	553	851
2023-06-03	2023-01-16	943	604
2023-01-02	2023-08-23	993	771
2023-10-11	2022-12-07	773	213
12023-01-15	12023-02-03	232	406
2023-10-18	2023-06-14	920	476
2023-01-06	2023-01-19	847	679
2023-06-28	2023-11-20	24	352
2023-02-15	2023-10-28	238	838
2023-10-14	2023-08-27	844	508
2023-07-21	2023-03-20	97	308
2023-08-29	2023-02-15	6	302
2023-09-26	2022-12-15	715	717
2023-01-24	2023-02-22	537	768
2023-09-19	2023-09-24	999	512
2023-07-11	2023-02-02	564	946
2022-12-21	2023-03-16	100	382
2023-05-25	2023-06-10	714	372
2023-06-18	2023-05-08	976	253
2023-01-31	2023-10-05	412	18
2023-05-09	2023-09-21	524	812
2023-11-01	2023-03-01	308	751
2023-11-27	2023-04-01	320	717
2023-04-18	2023-08-28	605	578
2023-02-05	2023-05-14	510	938
2023-11-21	2023-08-13	44	120
2022-12-10	2023-07-27	422	902
2023-02-23	2023-08-14	166	837
2023-06-26	2022-12-28	320	713
2023-05-17	2023-10-15	968	203
2023-05-02	2023-09-17	366	941
2023-08-17	2023-06-21	855	331
2023-02-06	2023-10-01	969	965
12023-02-06	2023-11-18	991	348
2023-11-30	2023-11-26	966	959
2023-03-20	2023-01-29	956	412
2023-03-28	2023-03-26	550	514
2023-08-30	2023-09-23	269	59
2023-02-04	12023-01-29	108	725
2023-02-23	2023-04-28	874	338
2023-09-22	2023-03-09	208	235
2023-01-24	2023-02-11	560	52
2023-01-30	2023-05-02	522	239
2023-12-04	2023-07-02	671	437
2023-10-30	2023-03-10	288	740
2023-10-31	12023-01-23	710	468
2023-09-08	2023-08-03	713	990
2023-12-04	2023-08-29	665	117
2023-04-21	2023-07-09	967	966
2023-07-05	2023-10-22	57	183
12023-01-22	2023-10-14	665	496
2023-03-01	2023-01-22	153	907
2023-06-23	2023-08-16	387	34
2023-08-07	2023-09-29	562	233
2023-03-07	2023-02-01	636	723
2023-11-30	2023-09-04	35	469
2023-04-20	2023-04-21	853	552
2023-09-10	2023-10-09	322	567
2023-07-14	2023-05-28	465	410
2023-05-16	2023-10-04	79	651
2023-03-07	2023-03-17	114	164
2023-07-13	2023-10-20	456	899
12023-01-22	12023-01-04	871	9
\.


--
-- TOC entry 4881 (class 0 OID 24649)
-- Dependencies: 227
-- Data for Name: structure_of_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structure_of_invoice (id_invoice, id_act_of_registration) FROM stdin;
1	418
2	431
3	742
4	636
5	577
6	132
7	35
8	514
9	630
10	828
11	850
12	31
13	839
14	843
15	267
16	503
17	874
18	481
19	559
20	791
21	384
22	525
23	747
24	130
25	9
26	744
27	960
28	351
29	159
30	525
31	695
32	774
33	676
34	636
35	268
36	866
37	247
38	455
39	209
40	290
41	735
42	767
43	753
44	529
45	291
46	791
47	513
48	877
49	477
50	379
51	972
52	507
53	296
54	61
55	670
56	962
57	602
58	106
59	680
60	922
61	732
62	409
63	77
64	305
65	145
66	153
67	910
68	387
69	14
70	464
71	988
72	564
73	611
74	873
75	162
76	98
77	338
78	182
79	278
80	311
81	713
82	278
83	642
84	392
85	836
86	145
87	993
88	850
89	354
90	385
91	723
92	366
93	171
94	48
95	501
96	377
97	951
98	217
99	309
100	42
101	682
102	324
103	274
104	327
105	626
106	1000
107	461
108	595
109	832
110	137
111	328
112	623
113	737
114	392
115	20
116	551
117	342
118	481
119	814
120	925
121	525
122	964
123	939
124	305
125	200
126	653
127	863
128	571
129	722
130	315
131	312
132	491
133	355
134	622
135	266
136	905
137	998
138	819
139	909
140	78
141	756
142	503
143	286
144	799
145	861
146	219
147	984
148	562
149	522
150	660
151	925
152	231
153	698
154	517
155	808
156	570
157	186
158	242
159	703
160	770
161	331
162	717
163	384
164	230
165	185
166	196
167	186
168	927
169	786
170	846
171	371
172	365
173	622
174	585
175	749
176	446
177	927
178	792
179	293
180	340
181	105
182	237
183	770
184	633
185	747
186	663
187	754
188	934
189	341
190	638
191	728
192	412
193	176
194	625
195	156
196	288
197	522
198	423
199	417
200	973
201	651
202	815
203	446
204	290
205	951
206	295
207	693
208	304
209	309
210	134
211	338
212	868
213	128
214	736
215	103
216	758
217	729
218	351
219	474
220	541
221	990
222	78
223	314
224	849
225	904
226	37
227	329
228	541
229	415
230	922
231	551
232	257
233	515
234	851
235	978
236	793
237	956
238	974
239	891
240	840
241	700
242	776
243	116
244	321
245	519
246	885
247	887
248	452
249	199
250	356
251	970
252	715
253	627
254	290
255	417
256	416
257	238
258	577
259	626
260	407
261	972
262	539
263	296
264	566
265	17
266	992
267	503
268	861
269	470
270	24
271	812
272	55
273	811
274	896
275	952
276	917
277	469
278	170
279	750
280	349
281	354
282	883
283	632
284	591
285	608
286	429
287	81
288	389
289	788
290	717
291	47
292	812
293	154
294	160
295	115
296	307
297	492
298	964
299	861
300	411
301	183
302	524
303	882
304	284
305	650
306	928
307	599
308	115
309	753
310	72
311	215
312	109
313	589
314	29
315	234
316	349
317	420
318	627
319	9
320	461
321	275
322	742
323	372
324	689
325	571
326	333
327	466
328	687
329	764
330	599
331	107
332	88
333	249
334	719
335	386
336	74
337	35
338	126
339	609
340	697
341	616
342	924
343	832
344	887
345	126
346	931
347	381
348	334
349	704
350	623
351	159
352	894
353	313
354	648
355	174
356	35
357	571
358	494
359	437
360	463
361	645
362	131
363	602
364	293
365	425
366	3
367	36
368	634
369	991
370	779
371	113
372	348
373	372
374	902
375	630
376	416
377	444
378	24
379	983
380	949
381	15
382	605
383	16
384	75
385	497
386	110
387	667
388	517
389	373
390	3
391	697
392	201
393	490
394	540
395	740
396	324
397	459
398	551
399	302
400	464
401	585
402	654
403	951
404	111
405	640
406	630
407	306
408	325
409	107
410	701
411	748
412	784
413	391
414	805
415	474
416	890
417	658
418	613
419	484
420	170
421	718
422	171
423	442
424	281
425	728
426	783
427	535
428	57
429	537
430	552
431	583
432	499
433	448
434	463
435	635
436	156
437	94
438	85
439	130
440	744
441	263
442	943
443	120
444	355
445	719
446	126
447	687
448	914
449	201
450	409
451	668
452	199
453	597
454	49
455	276
456	952
457	930
458	76
459	42
460	470
461	470
462	481
463	483
464	898
465	465
466	23
467	638
468	664
469	326
470	698
471	417
472	74
473	629
474	783
475	18
476	228
477	114
478	817
479	5
480	516
481	546
482	118
483	79
484	812
485	799
486	347
487	601
488	464
489	173
490	662
491	782
492	514
493	65
494	354
495	810
496	402
497	426
498	119
499	758
500	182
501	293
502	112
503	895
504	862
505	973
506	647
507	963
508	109
509	589
510	603
511	945
512	89
513	8
514	629
515	335
516	843
517	251
518	758
519	296
520	140
521	234
522	963
523	327
524	556
525	978
526	84
527	21
528	225
529	213
530	695
531	131
532	15
533	404
534	960
535	263
536	676
537	856
538	429
539	431
540	630
541	1000
542	495
543	476
544	846
545	416
546	832
547	704
548	569
549	145
550	873
551	830
552	630
553	285
554	348
555	932
556	436
557	539
558	33
559	649
560	199
561	658
562	703
563	733
564	241
565	356
566	949
567	316
568	199
569	642
570	325
571	518
572	695
573	358
574	872
575	645
576	4
577	440
578	77
579	710
580	874
581	699
582	699
583	714
584	48
585	382
586	251
587	336
588	612
589	116
590	728
591	854
592	392
593	205
594	539
595	631
596	820
597	146
598	318
599	41
600	864
601	440
602	633
603	650
604	342
605	594
606	648
607	259
608	621
609	168
610	665
611	920
612	162
613	484
614	750
615	576
616	304
617	1
618	200
619	646
620	67
621	583
622	730
623	655
624	564
625	884
626	570
627	647
628	885
629	240
630	634
631	784
632	593
633	996
634	655
635	894
636	50
637	429
638	351
639	956
640	368
641	8
642	936
643	69
644	1
645	952
646	977
647	902
648	689
649	212
650	266
651	12
652	594
653	225
654	621
655	800
656	135
657	840
658	111
659	645
660	628
661	728
662	715
663	285
664	711
665	514
666	205
667	328
668	957
669	668
670	566
671	236
672	3
673	988
674	665
675	654
676	307
677	152
678	450
679	291
680	811
681	343
682	187
683	285
684	285
685	820
686	7
687	900
688	25
689	161
690	989
691	3
692	965
693	630
694	427
695	785
696	175
697	964
698	431
699	613
700	1000
701	188
702	742
703	505
704	648
705	647
706	496
707	126
708	18
709	969
710	116
711	439
712	26
713	641
714	674
715	856
716	755
717	121
718	978
719	611
720	54
721	201
722	780
723	939
724	758
725	675
726	329
727	812
728	322
729	971
730	49
731	979
732	167
733	690
734	221
735	727
736	839
737	773
738	591
739	684
740	991
741	165
742	582
743	452
744	582
745	496
746	290
747	211
748	761
749	172
750	966
751	624
752	589
753	676
754	215
755	947
756	721
757	728
758	177
759	485
760	901
761	67
762	387
763	568
764	65
765	9
766	696
767	948
768	851
769	404
770	324
771	598
772	881
773	638
774	407
775	338
776	46
777	123
778	24
779	466
780	786
781	790
782	3
783	975
784	865
785	799
786	697
787	901
788	403
789	473
790	5
791	765
792	511
793	23
794	180
795	40
796	88
797	237
798	742
799	443
800	526
801	757
802	734
803	653
804	648
805	922
806	932
807	389
808	473
809	907
810	761
811	347
812	483
813	22
814	730
815	671
816	273
817	18
818	504
819	743
820	698
821	362
822	889
823	361
824	69
825	548
826	598
827	45
828	869
829	401
830	784
831	506
832	204
833	468
834	315
835	509
836	13
837	792
838	425
839	727
840	171
841	882
842	141
843	418
844	407
845	901
846	986
847	625
848	612
849	419
850	107
851	622
852	744
853	205
854	839
855	887
856	608
857	131
858	468
859	592
860	137
861	189
862	840
863	789
864	874
865	513
866	809
867	473
868	531
869	435
870	200
871	759
872	212
873	119
874	809
875	572
876	959
877	899
878	500
879	407
880	878
881	814
882	847
883	804
884	809
885	649
886	594
887	392
888	806
889	738
890	126
891	746
892	280
893	168
894	873
895	482
896	40
897	992
898	280
899	513
900	16
901	442
902	787
903	813
904	904
905	172
906	374
907	719
908	832
909	603
910	538
911	987
912	9
913	6
914	921
915	916
916	434
917	510
918	400
919	66
920	846
921	272
922	717
923	621
924	577
925	200
926	299
927	54
928	345
929	913
930	254
931	582
932	690
933	687
934	461
935	95
936	294
937	303
938	857
939	564
940	188
941	220
942	169
943	670
944	119
945	139
946	147
947	706
948	284
949	240
950	876
951	834
952	881
953	961
954	132
955	649
956	895
957	795
958	573
959	575
960	384
961	758
962	501
963	182
964	584
965	547
966	189
967	155
968	906
969	608
970	303
971	417
972	431
973	161
974	898
975	263
976	213
977	268
978	249
979	244
980	269
981	332
982	233
983	818
984	133
985	557
986	2
987	762
988	706
989	463
990	361
991	943
992	659
993	361
994	452
995	159
996	294
997	143
998	718
999	19
1000	99
\.


--
-- TOC entry 4711 (class 2606 OID 24663)
-- Name: invoice Invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT "Invoice_pkey" PRIMARY KEY (id_invoice);


--
-- TOC entry 4697 (class 2606 OID 16503)
-- Name: publication Publication (доделать)_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publication
    ADD CONSTRAINT "Publication (доделать)_pkey" PRIMARY KEY (library_code);


--
-- TOC entry 4699 (class 2606 OID 24582)
-- Name: publishing_house PublishingHouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publishing_house
    ADD CONSTRAINT "PublishingHouse_pkey" PRIMARY KEY (id_publishing_house);


--
-- TOC entry 4705 (class 2606 OID 24623)
-- Name: act_of_debiting act_of_debiting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_debiting
    ADD CONSTRAINT act_of_debiting_pkey PRIMARY KEY (id_act_of_debiting);


--
-- TOC entry 4707 (class 2606 OID 24638)
-- Name: act_of_donation act_of_donation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_donation
    ADD CONSTRAINT act_of_donation_pkey PRIMARY KEY (id_actofdonation);


--
-- TOC entry 4703 (class 2606 OID 24606)
-- Name: act_of_registration act_of_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_registration
    ADD CONSTRAINT act_of_registration_pkey PRIMARY KEY (id_act_of_registration);


--
-- TOC entry 4689 (class 2606 OID 16416)
-- Name: book_circulation book_circulation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_circulation
    ADD CONSTRAINT book_circulation_pkey PRIMARY KEY (number_of_operation);


--
-- TOC entry 4701 (class 2606 OID 24594)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id_book);


--
-- TOC entry 4693 (class 2606 OID 16474)
-- Name: copy_of_book copy_of_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.copy_of_book
    ADD CONSTRAINT copy_of_book_pkey PRIMARY KEY (id_copy_of_book);


--
-- TOC entry 4691 (class 2606 OID 16484)
-- Name: emploee emploee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emploee
    ADD CONSTRAINT emploee_pkey PRIMARY KEY (id_employee);


--
-- TOC entry 4687 (class 2606 OID 16409)
-- Name: reader reader_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader
    ADD CONSTRAINT reader_pkey PRIMARY KEY (id_reader);


--
-- TOC entry 4695 (class 2606 OID 16482)
-- Name: storage storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (id_storage);


--
-- TOC entry 4709 (class 2606 OID 24653)
-- Name: structure_of_invoice structure_of_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structure_of_invoice
    ADD CONSTRAINT structure_of_invoice_pkey PRIMARY KEY (id_invoice);


--
-- TOC entry 4712 (class 2606 OID 16417)
-- Name: book_circulation ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_circulation
    ADD CONSTRAINT "ID" FOREIGN KEY (id_reader) REFERENCES public.reader(id_reader) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4724 (class 2606 OID 24654)
-- Name: structure_of_invoice ID(ActOfRegistration); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structure_of_invoice
    ADD CONSTRAINT "ID(ActOfRegistration)" FOREIGN KEY (id_act_of_registration) REFERENCES public.act_of_registration(id_act_of_registration) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4718 (class 2606 OID 24612)
-- Name: act_of_registration ID(CopyOfBook); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_registration
    ADD CONSTRAINT "ID(CopyOfBook)" FOREIGN KEY (id_copy_of_book) REFERENCES public.copy_of_book(id_copy_of_book) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4722 (class 2606 OID 24639)
-- Name: act_of_donation ID(CopyOfBook); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_donation
    ADD CONSTRAINT "ID(CopyOfBook)" FOREIGN KEY (id_copyofbook) REFERENCES public.copy_of_book(id_copy_of_book) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4719 (class 2606 OID 24607)
-- Name: act_of_registration ID(Employee); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_registration
    ADD CONSTRAINT "ID(Employee)" FOREIGN KEY (id_employee) REFERENCES public.emploee(id_employee) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4723 (class 2606 OID 24644)
-- Name: act_of_donation ID(Employee); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_donation
    ADD CONSTRAINT "ID(Employee)" FOREIGN KEY (id_employee) REFERENCES public.emploee(id_employee) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4725 (class 2606 OID 24664)
-- Name: structure_of_invoice ID(Invoice); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structure_of_invoice
    ADD CONSTRAINT "ID(Invoice)" FOREIGN KEY (id_invoice) REFERENCES public.invoice(id_invoice) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4713 (class 2606 OID 24671)
-- Name: copy_of_book ID(Publication); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.copy_of_book
    ADD CONSTRAINT "ID(Publication)" FOREIGN KEY (id_publication) REFERENCES public.publication(library_code) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4716 (class 2606 OID 24583)
-- Name: publication ID(PublishingHouse); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publication
    ADD CONSTRAINT "ID(PublishingHouse)" FOREIGN KEY (id_publishing_house) REFERENCES public.publishing_house(id_publishing_house) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4714 (class 2606 OID 32797)
-- Name: stored ID(Storage); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stored
    ADD CONSTRAINT "ID(Storage)" FOREIGN KEY (id_storage) REFERENCES public.storage(id_storage) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4715 (class 2606 OID 16487)
-- Name: stored ID(book); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stored
    ADD CONSTRAINT "ID(book)" FOREIGN KEY (id_book) REFERENCES public.copy_of_book(id_copy_of_book) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4717 (class 2606 OID 24595)
-- Name: publication ID(book); Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publication
    ADD CONSTRAINT "ID(book)" FOREIGN KEY (id_book) REFERENCES public.book(id_book) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4720 (class 2606 OID 24624)
-- Name: act_of_debiting ID_CopyOfBook; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_debiting
    ADD CONSTRAINT "ID_CopyOfBook" FOREIGN KEY (id_copy_of_book) REFERENCES public.copy_of_book(id_copy_of_book) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4721 (class 2606 OID 24629)
-- Name: act_of_debiting ID_Employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.act_of_debiting
    ADD CONSTRAINT "ID_Employee" FOREIGN KEY (id_employee) REFERENCES public.emploee(id_employee) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2023-12-08 15:44:30

--
-- PostgreSQL database dump complete
--

