--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 10.13

-- Started on 2020-06-22 12:08:55

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
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 2894
-- Name: DATABASE chartcovid; Type: COMMENT; Schema: -; Owner: chartcovid
--

COMMENT ON DATABASE chartcovid IS 'Base de datos para el proyecto en grupo de Platzi Master entregable del equipo backend';


--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 203 (class 1259 OID 16560)
-- Name: cities; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name_city character varying,
    population_city integer,
    id_state integer,
    keyword character varying
);


ALTER TABLE public.cities OWNER TO chartcovid;

--
-- TOC entry 202 (class 1259 OID 16558)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: chartcovid
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO chartcovid;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 202
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chartcovid
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 199 (class 1259 OID 16429)
-- Name: countries; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    iso2c character varying(2),
    name_country character varying(50) NOT NULL,
    local_name character varying(50),
    population integer,
    flag_country character varying,
    id_zone integer,
    latitude double precision,
    length double precision
);


ALTER TABLE public.countries OWNER TO chartcovid;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE countries; Type: COMMENT; Schema: public; Owner: chartcovid
--

COMMENT ON TABLE public.countries IS 'This table is to store all the data of the countries';


--
-- TOC entry 198 (class 1259 OID 16427)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: chartcovid
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO chartcovid;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 198
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chartcovid
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 201 (class 1259 OID 16543)
-- Name: states; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name_state character varying,
    id_country integer,
    keyword character varying
);


ALTER TABLE public.states OWNER TO chartcovid;

--
-- TOC entry 200 (class 1259 OID 16541)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: chartcovid
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO chartcovid;

--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 200
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chartcovid
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 205 (class 1259 OID 16576)
-- Name: updates; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates (
    id integer NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
)
PARTITION BY RANGE (last_update);


ALTER TABLE public.updates OWNER TO chartcovid;

--
-- TOC entry 204 (class 1259 OID 16574)
-- Name: updates_id_seq; Type: SEQUENCE; Schema: public; Owner: chartcovid
--

CREATE SEQUENCE public.updates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.updates_id_seq OWNER TO chartcovid;

--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 204
-- Name: updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chartcovid
--

ALTER SEQUENCE public.updates_id_seq OWNED BY public.updates.id;


--
-- TOC entry 206 (class 1259 OID 16634)
-- Name: updates202002; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202002 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202002 FOR VALUES FROM ('2020-02-01') TO ('2020-03-01');


ALTER TABLE public.updates202002 OWNER TO chartcovid;

--
-- TOC entry 207 (class 1259 OID 16638)
-- Name: updates202003; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202003 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202003 FOR VALUES FROM ('2020-03-01') TO ('2020-04-01');


ALTER TABLE public.updates202003 OWNER TO chartcovid;

--
-- TOC entry 208 (class 1259 OID 16642)
-- Name: updates202004; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202004 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202004 FOR VALUES FROM ('2020-04-01') TO ('2020-05-01');


ALTER TABLE public.updates202004 OWNER TO chartcovid;

--
-- TOC entry 209 (class 1259 OID 16646)
-- Name: updates202005; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202005 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202005 FOR VALUES FROM ('2020-05-01') TO ('2020-06-01');


ALTER TABLE public.updates202005 OWNER TO chartcovid;

--
-- TOC entry 210 (class 1259 OID 16650)
-- Name: updates202006; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202006 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202006 FOR VALUES FROM ('2020-06-01') TO ('2020-07-01');


ALTER TABLE public.updates202006 OWNER TO chartcovid;

--
-- TOC entry 211 (class 1259 OID 16654)
-- Name: updates202007; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202007 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202007 FOR VALUES FROM ('2020-07-01') TO ('2020-08-01');


ALTER TABLE public.updates202007 OWNER TO chartcovid;

--
-- TOC entry 212 (class 1259 OID 16658)
-- Name: updates202008; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202008 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202008 FOR VALUES FROM ('2020-08-01') TO ('2020-09-01');


ALTER TABLE public.updates202008 OWNER TO chartcovid;

--
-- TOC entry 213 (class 1259 OID 16662)
-- Name: updates202009; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202009 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202009 FOR VALUES FROM ('2020-09-01') TO ('2020-10-01');


ALTER TABLE public.updates202009 OWNER TO chartcovid;

--
-- TOC entry 214 (class 1259 OID 16666)
-- Name: updates202010; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202010 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202010 FOR VALUES FROM ('2020-10-01') TO ('2020-11-01');


ALTER TABLE public.updates202010 OWNER TO chartcovid;

--
-- TOC entry 215 (class 1259 OID 16670)
-- Name: updates202011; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202011 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202011 FOR VALUES FROM ('2020-11-01') TO ('2020-12-01');


ALTER TABLE public.updates202011 OWNER TO chartcovid;

--
-- TOC entry 216 (class 1259 OID 16674)
-- Name: updates202012; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.updates202012 (
    id integer DEFAULT nextval('public.updates_id_seq'::regclass) NOT NULL,
    last_update date,
    confirmed integer,
    deaths integer,
    recovered integer,
    id_city integer,
    id_state integer,
    id_country integer
);
ALTER TABLE ONLY public.updates ATTACH PARTITION public.updates202012 FOR VALUES FROM ('2020-12-01') TO ('2021-01-01');


ALTER TABLE public.updates202012 OWNER TO chartcovid;

--
-- TOC entry 197 (class 1259 OID 16421)
-- Name: zones; Type: TABLE; Schema: public; Owner: chartcovid
--

CREATE TABLE public.zones (
    id integer NOT NULL,
    name_zone character varying(30)
);


ALTER TABLE public.zones OWNER TO chartcovid;

--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE zones; Type: COMMENT; Schema: public; Owner: chartcovid
--

COMMENT ON TABLE public.zones IS '
This table is to store all the data of the territorial areas';


--
-- TOC entry 196 (class 1259 OID 16419)
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: chartcovid
--

CREATE SEQUENCE public.zones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zones_id_seq OWNER TO chartcovid;

--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 196
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chartcovid
--

ALTER SEQUENCE public.zones_id_seq OWNED BY public.zones.id;


--
-- TOC entry 2744 (class 2604 OID 16563)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 16432)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 16546)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 16579)
-- Name: updates id; Type: DEFAULT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.updates ALTER COLUMN id SET DEFAULT nextval('public.updates_id_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 16424)
-- Name: zones id; Type: DEFAULT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.zones ALTER COLUMN id SET DEFAULT nextval('public.zones_id_seq'::regclass);


--
-- TOC entry 2764 (class 2606 OID 16568)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 16437)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 16551)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 16426)
-- Name: zones zones_pkey; Type: CONSTRAINT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 16569)
-- Name: cities cities_states_fkey; Type: FK CONSTRAINT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_states_fkey FOREIGN KEY (id_state) REFERENCES public.states(id);


--
-- TOC entry 2765 (class 2606 OID 16438)
-- Name: countries countries_zones_fkey; Type: FK CONSTRAINT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_zones_fkey FOREIGN KEY (id_zone) REFERENCES public.zones(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2766 (class 2606 OID 16552)
-- Name: states states_countries_fkey; Type: FK CONSTRAINT; Schema: public; Owner: chartcovid
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_countries_fkey FOREIGN KEY (id_country) REFERENCES public.countries(id);


-- Completed on 2020-06-22 12:08:56

--
-- PostgreSQL database dump complete
--

