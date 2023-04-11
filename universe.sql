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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    galaxy_types character varying(30),
    distance_from_earth_in_lightyear integer
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
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    star_id integer,
    has_life boolean,
    description text,
    age_in_millions_of_years numeric(11,1)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_image; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_image (
    planet_image_id integer NOT NULL,
    planet_id integer,
    url character varying(80) NOT NULL,
    author character varying(30) NOT NULL,
    unique_field integer,
    name character varying(30)
);


ALTER TABLE public.planet_image OWNER TO freecodecamp;

--
-- Name: planet_image_image_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_image_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_image_image_id_seq OWNER TO freecodecamp;

--
-- Name: planet_image_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_image_image_id_seq OWNED BY public.planet_image.planet_image_id;


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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_from_earth_in_lightyear integer,
    age_in_millions_of_years numeric(10,1)
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_image planet_image_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_image ALTER COLUMN planet_image_id SET DEFAULT nextval('public.planet_image_image_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy_1', true, 'galaxy_type_1', 10);
INSERT INTO public.galaxy VALUES (2, 'galaxy_2', false, 'galaxy_type_2', 12);
INSERT INTO public.galaxy VALUES (3, 'galaxy_3', false, 'galaxy_type_1', 200);
INSERT INTO public.galaxy VALUES (4, 'galaxy_4', true, 'galaxy_type_3', 120);
INSERT INTO public.galaxy VALUES (5, 'galaxy_5', true, 'galaxy_type_4', 83);
INSERT INTO public.galaxy VALUES (6, 'galaxy_6', false, 'galaxy_type_2', 130);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_1', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'moon_2', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'moon_3', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'moon_4', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'moon_5', 2, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'moon_6', 3, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'moon_7', 3, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'moon_8', 10, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'moon_9', 9, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'moon_10', 11, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'moon_11', 1, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'moon_12', 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'moon_13', 3, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'moon_14', 4, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'moon_15', 2, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'moon_16', 3, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'moon_17', 3, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'moon_18', 10, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'moon_19', 9, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'moon_20', 11, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet_1', 1, true, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'planet_2', 2, false, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'planet_3', 3, false, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'planet_4', 4, false, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'planet_5', 5, false, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'planet_6', 6, false, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'planet_7', 1, true, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'planet_8', 2, true, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'planet_9', 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'planet_10', 2, true, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'planet_11', 4, false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'planet_12', 5, false, NULL, NULL);


--
-- Data for Name: planet_image; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_image VALUES (1, 1, 'url_1', 'author_1', NULL, NULL);
INSERT INTO public.planet_image VALUES (2, 2, 'url_2', 'author_1', NULL, NULL);
INSERT INTO public.planet_image VALUES (3, 3, 'url_3', 'author_2', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_1', 1, 20, 20.0);
INSERT INTO public.star VALUES (2, 'star_2', 2, 20, 20.0);
INSERT INTO public.star VALUES (3, 'star_3', 2, 20, 30.0);
INSERT INTO public.star VALUES (4, 'star_4', 4, 40, 301.0);
INSERT INTO public.star VALUES (5, 'star_5', 3, 55, 20.1);
INSERT INTO public.star VALUES (6, 'star_6', 1, 67, 29.1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_image_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_image_image_id_seq', 3, true);


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
-- Name: planet_image planet_image_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_image
    ADD CONSTRAINT planet_image_pkey PRIMARY KEY (planet_image_id);


--
-- Name: planet_image planet_image_unique_field_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_image
    ADD CONSTRAINT planet_image_unique_field_key UNIQUE (unique_field);


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
-- Name: planet_image planet_image_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_image
    ADD CONSTRAINT planet_image_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

