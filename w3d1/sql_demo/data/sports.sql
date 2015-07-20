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
-- Name: leagues; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE leagues (
    id integer NOT NULL,
    name character varying,
    sport character varying
);


ALTER TABLE leagues OWNER TO david;

--
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE leagues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE leagues_id_seq OWNER TO david;

--
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE leagues_id_seq OWNED BY leagues.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    name character varying,
    team_id integer
);


ALTER TABLE players OWNER TO david;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_id_seq OWNER TO david;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO david;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE teams (
    id integer NOT NULL,
    name character varying,
    league_id integer,
    rival_team_id integer
);


ALTER TABLE teams OWNER TO david;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO david;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY leagues ALTER COLUMN id SET DEFAULT nextval('leagues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: david
--

COPY leagues (id, name, sport) FROM stdin;
1	NFL	Football
2	NBA	Basketball
3	NHL	Hockey
\.


--
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('leagues_id_seq', 3, true);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: david
--

COPY players (id, name, team_id) FROM stdin;
1	Pete Morar II	1
2	Alene Doyle DDS	1
3	Guy King	1
4	Agustina Kulas III	2
5	Corene Jerde	2
6	Finn Keebler	2
7	Gertrude Rice	3
8	Eloisa Littel	3
9	Nya Blick	3
10	Deon O'Kon	4
11	Monserrate McKenzie	4
12	Otho Raynor	4
13	Kurt Kuphal Jr.	5
14	Danika McKenzie	5
15	Santa Dickens MD	6
16	Monroe Macejkovic V	6
17	Ivory Veum	7
18	Lamont Wiegand	7
19	Tanner Willms	8
20	Ms. Sadie Champlin	8
21	Ora Zulauf	8
22	Nasir Padberg	9
23	Rodolfo Cummings Sr.	9
24	Kaylin Rutherford	10
25	Lydia Klein	10
26	Mr. Orin Pfeffer	11
27	Aryanna Gutmann	11
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('players_id_seq', 27, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: david
--

COPY schema_migrations (version) FROM stdin;
20150301010725
20150301010805
20150301010821
20150301030753
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: david
--

COPY teams (id, name, league_id, rival_team_id) FROM stdin;
1	Chicago Bears	1	4
2	SF 49ers	1	1
3	Seattle Seahawks	1	2
4	TN Titans	1	1
5	Utah Jazz	2	7
6	Cleveland Cavs	2	8
7	Miami Heat	2	6
8	Boston Celtics	2	6
9	Toronto Mapleleafs	3	10
11	Hockey Team 3	3	10
10	Detroit Redwings	3	9
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('teams_id_seq', 11, true);


--
-- Name: leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: david; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

