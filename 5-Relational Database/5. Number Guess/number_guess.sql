--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer,
    secret_number integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: username_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.username_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.username_user_id_seq OWNER TO freecodecamp;

--
-- Name: username_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.username_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.username_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 577, 576);
INSERT INTO public.games VALUES (2, 1, 221, 220);
INSERT INTO public.games VALUES (3, 2, 147, 146);
INSERT INTO public.games VALUES (4, 2, 454, 453);
INSERT INTO public.games VALUES (5, 1, 46, 43);
INSERT INTO public.games VALUES (6, 1, 1000, 998);
INSERT INTO public.games VALUES (7, 1, 949, 948);
INSERT INTO public.games VALUES (8, 3, 731, 730);
INSERT INTO public.games VALUES (9, 3, 252, 251);
INSERT INTO public.games VALUES (10, 4, 424, 423);
INSERT INTO public.games VALUES (11, 4, 170, 169);
INSERT INTO public.games VALUES (12, 3, 378, 375);
INSERT INTO public.games VALUES (13, 3, 889, 887);
INSERT INTO public.games VALUES (14, 3, 3, 2);
INSERT INTO public.games VALUES (15, 5, 464, 463);
INSERT INTO public.games VALUES (16, 5, 457, 456);
INSERT INTO public.games VALUES (17, 6, 973, 972);
INSERT INTO public.games VALUES (18, 6, 590, 589);
INSERT INTO public.games VALUES (19, 5, 759, 756);
INSERT INTO public.games VALUES (20, 5, 151, 149);
INSERT INTO public.games VALUES (21, 5, 818, 817);
INSERT INTO public.games VALUES (22, 7, 22, 426);
INSERT INTO public.games VALUES (23, 8, 999, 998);
INSERT INTO public.games VALUES (24, 8, 819, 818);
INSERT INTO public.games VALUES (25, 9, 204, 203);
INSERT INTO public.games VALUES (26, 9, 866, 865);
INSERT INTO public.games VALUES (27, 8, 949, 946);
INSERT INTO public.games VALUES (28, 8, 836, 834);
INSERT INTO public.games VALUES (29, 8, 300, 299);
INSERT INTO public.games VALUES (30, 10, 206, 205);
INSERT INTO public.games VALUES (31, 10, 324, 323);
INSERT INTO public.games VALUES (32, 11, 267, 266);
INSERT INTO public.games VALUES (33, 11, 191, 190);
INSERT INTO public.games VALUES (34, 10, 386, 383);
INSERT INTO public.games VALUES (35, 10, 453, 451);
INSERT INTO public.games VALUES (36, 10, 355, 354);
INSERT INTO public.games VALUES (37, 12, 466, 465);
INSERT INTO public.games VALUES (38, 12, 638, 637);
INSERT INTO public.games VALUES (39, 13, 847, 846);
INSERT INTO public.games VALUES (40, 13, 490, 489);
INSERT INTO public.games VALUES (41, 12, 935, 932);
INSERT INTO public.games VALUES (42, 12, 271, 269);
INSERT INTO public.games VALUES (43, 12, 1001, 1000);
INSERT INTO public.games VALUES (44, 14, 841, 840);
INSERT INTO public.games VALUES (45, 14, 46, 45);
INSERT INTO public.games VALUES (46, 15, 919, 918);
INSERT INTO public.games VALUES (47, 15, 622, 621);
INSERT INTO public.games VALUES (48, 14, 363, 360);
INSERT INTO public.games VALUES (49, 14, 95, 93);
INSERT INTO public.games VALUES (50, 14, 517, 516);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1718906810473');
INSERT INTO public.players VALUES (2, 'user_1718906810472');
INSERT INTO public.players VALUES (3, 'user_1718906820946');
INSERT INTO public.players VALUES (4, 'user_1718906820945');
INSERT INTO public.players VALUES (5, 'user_1718906837988');
INSERT INTO public.players VALUES (6, 'user_1718906837987');
INSERT INTO public.players VALUES (7, 'Hoan');
INSERT INTO public.players VALUES (8, 'user_1718906978502');
INSERT INTO public.players VALUES (9, 'user_1718906978501');
INSERT INTO public.players VALUES (10, 'user_1718907023644');
INSERT INTO public.players VALUES (11, 'user_1718907023643');
INSERT INTO public.players VALUES (12, 'user_1718907036075');
INSERT INTO public.players VALUES (13, 'user_1718907036074');
INSERT INTO public.players VALUES (14, 'user_1718907062697');
INSERT INTO public.players VALUES (15, 'user_1718907062696');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 50, true);


--
-- Name: username_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_user_id_seq', 15, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT username_pkey PRIMARY KEY (user_id);


--
-- Name: players username_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT username_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

