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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    description text NOT NULL,
    distance integer,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    can_support_life boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance integer,
    diameter integer,
    moons numeric(3,1) NOT NULL,
    description text,
    is_spherical boolean,
    can_support_life boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    distance integer,
    diameter integer,
    moons numeric(3,1) NOT NULL,
    description text,
    is_spherical boolean,
    can_support_life boolean,
    planet_id integer
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
    name character varying(30),
    distance integer,
    diameter integer,
    moons numeric(3,1) NOT NULL,
    description text,
    is_spherical boolean,
    can_support_life boolean,
    star_id integer
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
    name character varying(30),
    distance integer,
    diameter integer,
    moons numeric(3,1) NOT NULL,
    description text,
    is_spherical boolean,
    can_support_life boolean,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'This is a comet', 200, 'Comet', true, false);
INSERT INTO public.comet VALUES (2, 'This is a comet', 2003, 'Comet', true, false);
INSERT INTO public.comet VALUES (3, 'This is a comet', 20033, 'Comet', true, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 30, 50, 4.1, 'It is our home', true, true);
INSERT INTO public.galaxy VALUES (3, 'Milkuyy Way', 30, 50, 54.1, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (4, 'Milkuyy y', 30, 50, 5.1, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (5, 'Mily', 30, 50, 56.1, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (6, 'Mily wrapper', 30, 50, 6.1, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (7, 'Mily wrappe connect', 30, 50, 60.1, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (8, 'Mrappe connect', 30, 50, 0.1, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (9, 'Mre connect', 30, 50, 0.5, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (10, 'Mre ect', 30, 50, 70.5, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (12, 'Mre ect vehicle', 30, 50, 70.1, 'It yis our home', true, true);
INSERT INTO public.galaxy VALUES (13, 'Mre ect vehicle', 30, 50, 90.1, 'It yis our home', false, false);
INSERT INTO public.galaxy VALUES (14, 'Mre ect vehicle', 30, 50, 55.1, 'It yis our home', false, false);
INSERT INTO public.galaxy VALUES (15, 'Mre ect vehicle', 30, 50, 55.4, 'It yis our home', false, true);
INSERT INTO public.galaxy VALUES (16, 'Mre ect vehicle', 30, 50, 55.6, 'It yis our home', false, true);
INSERT INTO public.galaxy VALUES (17, 'vehicle', 3000, 5500, 5.6, 'It yis our home', false, true);
INSERT INTO public.galaxy VALUES (18, 'vele', 1000, 1500, 15.6, 'It yis our home', false, true);
INSERT INTO public.galaxy VALUES (19, 'vele', 1000, 1500, 35.6, 'Eys mafo hmm mafo', true, true);
INSERT INTO public.galaxy VALUES (20, 'Guiltle', 1000, 1500, 39.6, 'Eys mafo hmm mafo', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moonknight', 100, 23050, 10.1, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (2, 'moonknight', 100, 23050, 10.3, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (3, 'moonknight', 100, 23050, 20.3, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (4, 'moonknight', 100, 23050, 20.4, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (5, 'moonknight', 100, 23050, 20.5, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (6, 'moonknight', 100, 23050, 20.6, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (7, 'moonknight', 100, 23050, 20.7, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (8, 'moonknight', 100, 23050, 20.8, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (9, 'moonknight', 100, 23050, 20.9, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (10, 'moonknight', 100, 23050, 21.9, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (11, 'moonknight', 100, 23050, 21.0, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (12, 'moonknight', 100, 23050, 21.1, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (13, 'moonknight', 100, 23050, 21.2, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (14, 'moonknight', 100, 23050, 21.3, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (15, 'moonknight', 100, 23050, 21.4, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (16, 'moonknight', 100, 23050, 21.5, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (17, 'moonknight', 100, 23050, 21.6, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (18, 'moonknight', 100, 23050, 21.7, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (20, 'moonknight', 100, 23050, 21.8, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (21, 'moonknight', 100, 23050, 22.9, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (22, 'moonknight', 100, 23050, 22.0, 'This is a moon', true, false, 1);
INSERT INTO public.moon VALUES (23, 'moonknight', 100, 23050, 22.1, 'This is a moon', true, false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planetina', 300, 400, 5.5, 'This is a planet', true, false, 1);
INSERT INTO public.planet VALUES (2, 'planetina', 300, 400, 5.6, 'This is a planet', true, false, 3);
INSERT INTO public.planet VALUES (4, 'planetina', 300, 400, 15.5, 'This is a planet', true, false, 3);
INSERT INTO public.planet VALUES (5, 'planetina', 300, 400, 13.5, 'This is a planet', true, false, 3);
INSERT INTO public.planet VALUES (6, 'planetina', 300, 400, 12.5, 'This is a planet', true, false, 3);
INSERT INTO public.planet VALUES (7, 'planetina', 300, 400, 12.6, 'This is a planet', true, false, 3);
INSERT INTO public.planet VALUES (8, 'planetina', 300, 400, 12.7, 'This is a planet', true, false, 3);
INSERT INTO public.planet VALUES (9, 'planetina', 300, 400, 1.7, 'This is a planet', true, false, 3);
INSERT INTO public.planet VALUES (10, 'planetina', 300, 400, 3.7, 'This is a planet', true, false, 4);
INSERT INTO public.planet VALUES (11, 'planetina', 300, 400, 53.7, 'This is a planet', true, false, 4);
INSERT INTO public.planet VALUES (12, 'planetina', 300, 400, 54.7, 'This is a planet', true, false, 4);
INSERT INTO public.planet VALUES (13, 'planetina', 300, 400, 54.8, 'This is a planet', true, false, 5);
INSERT INTO public.planet VALUES (14, 'planetina', 300, 400, 4.8, 'This is a planet', true, false, 5);
INSERT INTO public.planet VALUES (15, 'planetina', 300, 400, 4.6, 'This is a planet', true, false, 5);
INSERT INTO public.planet VALUES (16, 'planetina', 300, 400, 4.0, 'This is a planet', true, false, 5);
INSERT INTO public.planet VALUES (17, 'planetina', 300, 400, 40.0, 'This is a planet', true, false, 6);
INSERT INTO public.planet VALUES (18, 'planetina', 300, 400, 40.1, 'This is a planet', true, false, 6);
INSERT INTO public.planet VALUES (19, 'planetina', 300, 400, 40.2, 'This is a planet', true, false, 6);
INSERT INTO public.planet VALUES (20, 'planetina', 300, 400, 40.3, 'This is a planet', true, false, 6);
INSERT INTO public.planet VALUES (21, 'planetina', 300, 400, 40.4, 'This is a planet', true, false, 6);
INSERT INTO public.planet VALUES (22, 'planetina', 300, 400, 20.4, 'This is a planet', true, false, 7);
INSERT INTO public.planet VALUES (23, 'planetina', 300, 400, 30.4, 'This is a planet', true, false, 7);
INSERT INTO public.planet VALUES (24, 'planetina', 300, 400, 50.4, 'This is a planet', true, false, 7);
INSERT INTO public.planet VALUES (25, 'planetina', 300, 400, 90.4, 'This is a planet', true, false, 7);
INSERT INTO public.planet VALUES (26, 'planetina', 300, 400, 90.9, 'This is a planet', true, false, 7);
INSERT INTO public.planet VALUES (27, 'planetina', 300, 400, 92.9, 'This is a planet', true, false, 8);
INSERT INTO public.planet VALUES (28, 'planetina', 300, 400, 92.8, 'This is a planet', true, false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'titan', 50, 100, 3.9, 'mafo', true, true, 1);
INSERT INTO public.star VALUES (3, 'titan', 50, 100, 1.9, 'mafo', true, true, 3);
INSERT INTO public.star VALUES (4, 'titan', 50, 100, 1.0, 'mafo', true, true, 4);
INSERT INTO public.star VALUES (5, 'titan', 50, 100, 13.0, 'mafo', true, true, 5);
INSERT INTO public.star VALUES (6, 'titan', 50, 100, 15.0, 'mafo', true, true, 6);
INSERT INTO public.star VALUES (7, 'titan', 50, 100, 15.1, 'mafo', true, true, 7);
INSERT INTO public.star VALUES (8, 'titan', 50, 100, 15.2, 'mafo', true, true, 8);
INSERT INTO public.star VALUES (9, 'titan', 50, 100, 10.2, 'mafo', true, true, 9);
INSERT INTO public.star VALUES (10, 'titan', 50, 100, 9.2, 'mafo', true, true, 10);
INSERT INTO public.star VALUES (12, 'titan', 50, 100, 9.3, 'mafo', true, true, 13);
INSERT INTO public.star VALUES (13, 'titan', 50, 100, 2.3, 'mafo', true, true, 14);
INSERT INTO public.star VALUES (14, 'titan', 50, 100, 21.3, 'mafo', true, true, 15);
INSERT INTO public.star VALUES (15, 'titan', 50, 100, 21.5, 'mafo', true, true, 16);
INSERT INTO public.star VALUES (16, 'titan', 50, 100, 21.8, 'mafo', true, true, 17);
INSERT INTO public.star VALUES (17, 'titan', 50, 100, 11.8, 'mafo', true, true, 18);
INSERT INTO public.star VALUES (18, 'titan', 50, 100, 91.8, 'mafo', true, true, 19);
INSERT INTO public.star VALUES (19, 'titan', 50, 100, 91.0, 'mafo', true, true, 20);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 19, true);


--
-- Name: comet comet_distance_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_distance_key UNIQUE (distance);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_moons_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_moons_key UNIQUE (moons);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moons_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moons_key UNIQUE (moons);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_moons_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moons_key UNIQUE (moons);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_moons_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_moons_key UNIQUE (moons);


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

