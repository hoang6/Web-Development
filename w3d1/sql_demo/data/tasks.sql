--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: assignments; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE assignments (
    id integer NOT NULL,
    user_id integer,
    task_id integer
);


ALTER TABLE assignments OWNER TO david;

--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE assignments_id_seq OWNER TO david;

--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE assignments_id_seq OWNED BY assignments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO david;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    title character varying,
    difficulty integer
);


ALTER TABLE tasks OWNER TO david;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO david;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE users OWNER TO david;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO david;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY assignments ALTER COLUMN id SET DEFAULT nextval('assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: david
--

COPY assignments (id, user_id, task_id) FROM stdin;
1	4	8
2	8	10
3	9	8
4	7	1
5	2	1
6	10	7
7	3	6
8	3	8
9	8	5
10	5	8
11	4	2
12	7	8
13	6	10
14	2	10
15	6	6
16	5	6
17	8	8
\.


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('assignments_id_seq', 17, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: david
--

COPY schema_migrations (version) FROM stdin;
20150228220909
20150228221019
20150228221025
20150228234251
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: david
--

COPY tasks (id, title, difficulty) FROM stdin;
1	target value-added bandwidth	10
2	synthesize one-to-one markets	1
3	morph sticky methodologies	5
4	enable web-enabled mindshare	5
5	scale magnetic functionalities	1
6	optimize sexy networks	10
7	leverage integrated infrastructures	2
8	extend customized channels	4
9	synergize visionary web services	5
10	utilize cross-platform e-markets	4
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('tasks_id_seq', 10, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: david
--

COPY users (id, name) FROM stdin;
1	Johann Ferry
2	Camilla Schulist
3	Tatum Bechtelar
4	Agnes Ryan
5	Cary Block
6	Nathen Lesch
7	Adella Welch
8	Art Rohan
9	Wanda Ankunding
10	Andreanne Hintz
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('users_id_seq', 10, true);


--
-- Name: assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_assignments_on_task_id; Type: INDEX; Schema: public; Owner: david; Tablespace: 
--

CREATE INDEX index_assignments_on_task_id ON assignments USING btree (task_id);


--
-- Name: index_assignments_on_user_id; Type: INDEX; Schema: public; Owner: david; Tablespace: 
--

CREATE INDEX index_assignments_on_user_id ON assignments USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: david; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

