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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    distance_from_earth numeric(10,2),
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: kuwado; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.kuwado (
    kuwado_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean,
    planet_type character varying(50)
);


ALTER TABLE public.kuwado OWNER TO freecodecamp;

--
-- Name: kuwado_kuwado_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.kuwado_kuwado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kuwado_kuwado_id_seq OWNER TO freecodecamp;

--
-- Name: kuwado_kuwado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.kuwado_kuwado_id_seq OWNED BY public.kuwado.kuwado_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    age_in_millions_of_years integer,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    age_in_millions_of_years integer,
    has_life boolean,
    planet_type character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: kuwado kuwado_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.kuwado ALTER COLUMN kuwado_id SET DEFAULT nextval('public.kuwado_kuwado_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest galaxy to Milky Way', 2537000.00, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'A galaxy that looks like a hat', 29000000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A classic spiral galaxy', 23000000.00, false);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'A galaxy with a dark band of dust', 17000000.00, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'A bright galaxy', 12000000.00, false);


--
-- Data for Name: kuwado; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.kuwado VALUES (1, 'LUU', 5, NULL, NULL);
INSERT INTO public.kuwado VALUES (2, 'VIET', 6, NULL, NULL);
INSERT INTO public.kuwado VALUES (3, 'HOAN', 7, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 4500, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 4500, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 4500, false);
INSERT INTO public.moon VALUES (4, 'Proxima b I', 3, 4500, false);
INSERT INTO public.moon VALUES (5, 'Proxima b II', 3, 4500, false);
INSERT INTO public.moon VALUES (6, 'Vulcan I', 4, 4000, false);
INSERT INTO public.moon VALUES (7, 'Sirius b I', 5, 242, false);
INSERT INTO public.moon VALUES (8, 'Betelgeuse b I', 6, 10000, false);
INSERT INTO public.moon VALUES (9, 'Betelgeuse b II', 6, 10000, false);
INSERT INTO public.moon VALUES (10, 'Betelgeuse c I', 7, 10000, false);
INSERT INTO public.moon VALUES (11, 'Betelgeuse d I', 8, 10000, false);
INSERT INTO public.moon VALUES (12, 'Rigel b I', 9, 860, false);
INSERT INTO public.moon VALUES (13, 'Rigel b II', 9, 860, false);
INSERT INTO public.moon VALUES (14, 'Rigel c I', 10, 860, false);
INSERT INTO public.moon VALUES (15, 'Rigel d I', 11, 860, false);
INSERT INTO public.moon VALUES (16, 'Rigel e I', 12, 860, false);
INSERT INTO public.moon VALUES (17, 'Rigel e II', 12, 860, false);
INSERT INTO public.moon VALUES (18, 'Rigel e III', 12, 860, false);
INSERT INTO public.moon VALUES (19, 'Rigel e IV', 12, 860, false);
INSERT INTO public.moon VALUES (20, 'Rigel e V', 12, 860, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 4500, true, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 4500, false, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Proxima b', 2, 4500, false, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Vulcan', 3, 4000, false, 'Terrestrial');
INSERT INTO public.planet VALUES (5, 'Sirius b', 4, 242, false, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Betelgeuse b', 5, 10000, false, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Betelgeuse c', 5, 10000, false, 'Terrestrial');
INSERT INTO public.planet VALUES (8, 'Betelgeuse d', 5, 10000, false, 'Terrestrial');
INSERT INTO public.planet VALUES (9, 'Rigel b', 6, 860, false, 'Gas Giant');
INSERT INTO public.planet VALUES (10, 'Rigel c', 6, 860, false, 'Gas Giant');
INSERT INTO public.planet VALUES (11, 'Rigel d', 6, 860, false, 'Terrestrial');
INSERT INTO public.planet VALUES (12, 'Rigel e', 6, 860, false, 'Terrestrial');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 4500, true);
INSERT INTO public.star VALUES (3, 'Vega', 3, 455, true);
INSERT INTO public.star VALUES (4, 'Sirius', 4, 242, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 5, 10000, true);
INSERT INTO public.star VALUES (6, 'Rigel', 6, 860, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: kuwado_kuwado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.kuwado_kuwado_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: kuwado kuwado_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.kuwado
    ADD CONSTRAINT kuwado_name_key UNIQUE (name);


--
-- Name: kuwado kuwado_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.kuwado
    ADD CONSTRAINT kuwado_pkey PRIMARY KEY (kuwado_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

