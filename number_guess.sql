--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guessing;
--
-- Name: number_guessing; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing OWNER TO freecodecamp;

\connect number_guessing

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (24, 'user_1655673591093', 2, 643);
INSERT INTO public.players VALUES (23, 'user_1655673591094', 5, 40);
INSERT INTO public.players VALUES (26, 'user_1655673663468', 2, 972);
INSERT INTO public.players VALUES (25, 'user_1655673663469', 5, 74);
INSERT INTO public.players VALUES (27, 'asd', 1, 4);
INSERT INTO public.players VALUES (29, 'user_1655673940180', 2, 351);
INSERT INTO public.players VALUES (28, 'user_1655673940181', 5, 57);
INSERT INTO public.players VALUES (32, 'user_1655674251028', 3, 609);
INSERT INTO public.players VALUES (31, 'user_1655674251029', 6, 5);
INSERT INTO public.players VALUES (33, 'b', 2, 3);
INSERT INTO public.players VALUES (35, 'user_1655674331569', 2, 430);
INSERT INTO public.players VALUES (22, 'user_1655673572164', 2, 185);
INSERT INTO public.players VALUES (21, 'user_1655673572165', 5, 33);
INSERT INTO public.players VALUES (34, 'user_1655674331570', 5, 203);
INSERT INTO public.players VALUES (37, 'user_1655674398272', 2, 701);
INSERT INTO public.players VALUES (36, 'user_1655674398273', 5, 84);
INSERT INTO public.players VALUES (30, 'a', 4, 1);
INSERT INTO public.players VALUES (40, 'user_1655674470911', 2, 542);
INSERT INTO public.players VALUES (39, 'user_1655674470912', 5, 343);
INSERT INTO public.players VALUES (38, 'g', 1, 1);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 40, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: players uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT uq UNIQUE (username);


--
-- PostgreSQL database dump complete
--

