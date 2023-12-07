--
-- PostgreSQL database dump
--

-- Dumped from database version 11.21
-- Dumped by pg_dump version 11.21

-- Started on 2023-11-10 01:35:44

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
-- TOC entry 2929 (class 1262 OID 16600)
-- Name: LR_3(TaskManager); Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "LR_3(TaskManager)" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United Kingdom.1252' LC_CTYPE = 'English_United Kingdom.1252';


ALTER DATABASE "LR_3(TaskManager)" OWNER TO postgres;

\connect -reuse-previous=on "dbname='LR_3(TaskManager)'"

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
-- TOC entry 2918 (class 0 OID 16675)
-- Dependencies: 202
-- Data for Name: Bills; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2913 (class 0 OID 16607)
-- Dependencies: 197
-- Data for Name: CompanyContract; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CompanyContract" ("ContractID", "StartDate", "EndDate", "PaymentStatus", "ProcessingStatus", "ManagerID", "CustomerCompanyID") VALUES (1, '2023-03-20', '2023-03-21', 'не оплачен', 'в работе', 13, 32321);


--
-- TOC entry 2912 (class 0 OID 16601)
-- Dependencies: 196
-- Data for Name: CustomerCompany; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CustomerCompany" ("CustomerCompanyID", "CompanyName", "Address", "ContactName", phone) VALUES (32321, 'Google', 'Los Angeles', 'Pigeon P.M.', '+79023456731');
INSERT INTO public."CustomerCompany" ("CustomerCompanyID", "CompanyName", "Address", "ContactName", phone) VALUES (123121, 'Amazon', 'New York', 'Dmitriy P.M.', '+79032244567');
INSERT INTO public."CustomerCompany" ("CustomerCompanyID", "CompanyName", "Address", "ContactName", phone) VALUES (123123, 'Yandex', 'Moscow', 'Dmitriy P.M.', '+79346575456');


--
-- TOC entry 2916 (class 0 OID 16645)
-- Dependencies: 200
-- Data for Name: Department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Department" ("DepartmentID", "DepartmentName", "PhoneNumber", "DepartmentNumber") VALUES (123121, 'Amazon', '89011122324', 1);
INSERT INTO public."Department" ("DepartmentID", "DepartmentName", "PhoneNumber", "DepartmentNumber") VALUES (123123, 'Yandex', '89061112226', 2);


--
-- TOC entry 2915 (class 0 OID 16636)
-- Dependencies: 199
-- Data for Name: Position; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Position" ("PositionID", "PositionName", "Category", "Salary") VALUES (12331, 'Python Backend', 'IT', 30000);
INSERT INTO public."Position" ("PositionID", "PositionName", "Category", "Salary") VALUES (12333, 'DevOPS', 'IT', 300000);


--
-- TOC entry 2919 (class 0 OID 16685)
-- Dependencies: 203
-- Data for Name: Project; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Project" ("ProjectID", "ProjectName", "CompletionStatus", "StartDate", "EndDate", "PaymentStatus", "TeamleaderID", "ContractID") VALUES (1231, 'Yandex Map', 'в работе', '2003-12-31', '2040-12-31', 'оплачен', 13, NULL);
INSERT INTO public."Project" ("ProjectID", "ProjectName", "CompletionStatus", "StartDate", "EndDate", "PaymentStatus", "TeamleaderID", "ContractID") VALUES (1232, 'Amazon Web', 'не начат', '2003-12-31', '2060-12-31', 'частично оплачен', 14, NULL);


--
-- TOC entry 2921 (class 0 OID 16718)
-- Dependencies: 205
-- Data for Name: Task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Task" ("TaskID", "TaskName", "TaskDescription", "Cost", "Status", "ProjectID") VALUES (1, 'Develope Frontend', 'Develope React Frontend', 30000, 'не начат', 1231);
INSERT INTO public."Task" ("TaskID", "TaskName", "TaskDescription", "Cost", "Status", "ProjectID") VALUES (2, 'Develope Backend', 'Use django', 3000, 'в работе', 1232);


--
-- TOC entry 2923 (class 0 OID 16816)
-- Dependencies: 207
-- Data for Name: TaskAssignment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2922 (class 0 OID 16736)
-- Dependencies: 206
-- Data for Name: TaskCompletionControl; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TaskCompletionControl" ("DeadlineID", "DeadlineDate", "DeadlineCompletion", "CheckDate", "CompletionCommentary", "ContractID", "TaskID") VALUES (1, '2030-12-31', 95, '2029-12-31', 'Good', 13, 1);
INSERT INTO public."TaskCompletionControl" ("DeadlineID", "DeadlineDate", "DeadlineCompletion", "CheckDate", "CompletionCommentary", "ContractID", "TaskID") VALUES (2, '2025-12-31', 50, '2024-12-31', 'May be better', 14, 2);


--
-- TOC entry 2914 (class 0 OID 16622)
-- Dependencies: 198
-- Data for Name: Worker; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Worker" ("WorkerID", "PhoneNumber", "FIO") VALUES (14, '89063224567', 'Popov Ivan Holmovich');
INSERT INTO public."Worker" ("WorkerID", "PhoneNumber", "FIO") VALUES (13, '89063233563', 'Vasiliy Ivanov Ivanovich');


--
-- TOC entry 2920 (class 0 OID 16708)
-- Dependencies: 204
-- Data for Name: WorkerAssignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."WorkerAssignment" ("ContractID", "ProjectID", "CashAward", "CashAwardType", "AssignmentId") VALUES (13, 1231, 10000, 'понедельно', 1);
INSERT INTO public."WorkerAssignment" ("ContractID", "ProjectID", "CashAward", "CashAwardType", "AssignmentId") VALUES (14, 1232, 5000, 'понедельно', 2);


--
-- TOC entry 2917 (class 0 OID 16654)
-- Dependencies: 201
-- Data for Name: WorkerOnContract; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."WorkerOnContract" ("ContractID", "SalaryPercentrage", "WorkerID", "PositionID", "DepartmentID") VALUES (13, 100, 13, 12331, 123123);
INSERT INTO public."WorkerOnContract" ("ContractID", "SalaryPercentrage", "WorkerID", "PositionID", "DepartmentID") VALUES (14, 100, 14, 12333, 123121);


-- Completed on 2023-11-10 01:35:44

--
-- PostgreSQL database dump complete
--

