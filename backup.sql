--
-- PostgreSQL database dump
--

\restrict 3FVM7VRd2h6VhUymIaGKj7AQ1EnpmsJz4qKUjVEiIsgPF0sE9UcYxPiedlhR3hx

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    phone character varying(30),
    message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: destinations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.destinations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    image character varying(255) NOT NULL
);


ALTER TABLE public.destinations OWNER TO postgres;

--
-- Name: destinations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.destinations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.destinations_id_seq OWNER TO postgres;

--
-- Name: destinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.destinations_id_seq OWNED BY public.destinations.id;


--
-- Name: packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages (
    id integer NOT NULL,
    destination_id integer,
    title character varying(200) NOT NULL,
    duration character varying(100) NOT NULL,
    price integer NOT NULL,
    includes jsonb NOT NULL
);


ALTER TABLE public.packages OWNER TO postgres;

--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.packages_id_seq OWNER TO postgres;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    name character varying(100),
    message text,
    rating text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: destinations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinations ALTER COLUMN id SET DEFAULT nextval('public.destinations_id_seq'::regclass);


--
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, name, email, phone, message, created_at) FROM stdin;
\.


--
-- Data for Name: destinations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.destinations (id, name, slug, image) FROM stdin;
1	Sikkim	sikkim	/Images/sikkim.png
2	Darjeeling	darjeeling	/Images/darjeeling.png
3	Sikkim-Darjeeling	sikkim-darjeeling	/Images/sik-dar.png
4	Gangtok-Pelling	gangtok-pelling	/Images/gan-pell.png
5	North Sikkim	north-sikkim	/Images/NorthSikkim.png
6	Andaman	andaman	/Images/andaman.png
7	Bhutan	bhutan	/Images/bhutan.png
8	Thailand	thailand	/Images/thailand.png
\.


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages (id, destination_id, title, duration, price, includes) FROM stdin;
1	1	Sikkim Budget Trip	4 Days 3 Nights	14000	[{"day": "Day 1", "activity": "Arrival in Gangtok, check-in hotel, evening MG Marg."}, {"day": "Day 2", "activity": "Tsomgo Lake visit, Baba Mandir excursion, local food."}, {"day": "Day 3", "activity": "Rumtek Monastery, Banjhakri Falls, Hanuman Tok sightseeing."}, {"day": "Day 4", "activity": "Breakfast & departure from Gangtok."}]
2	1	Sikkim Deluxe Tour	5 Days 4 Nights	19000	[{"day": "Day 1", "activity": "Arrival & evening at MG Marg."}, {"day": "Day 2", "activity": "Tsomgo Lake & Baba Mandir full day excursion."}, {"day": "Day 3", "activity": "Transfer to Pelling, Sky Walk, Rabdentse Ruins."}, {"day": "Day 4", "activity": "Pelling sightseeing: Kanchenjunga View Point."}, {"day": "Day 5", "activity": "Breakfast & departure."}]
3	2	Darjeeling Classic	3 Days 2 Nights	11000	[{"day": "Day 1", "activity": "Arrival & hotel check-in, evening Mall Road stroll."}, {"day": "Day 2", "activity": "Tiger Hill sunrise, Himalayan Mountaineering Institute, tea garden."}, {"day": "Day 3", "activity": "Toy Train ride, local sightseeing & departure."}]
4	2	Darjeeling Premium	4 Days 3 Nights	16000	[{"day": "Day 1", "activity": "Luxury hotel check-in, relax."}, {"day": "Day 2", "activity": "Tiger Hill sunrise, Mt. Institute, Batasia Loop."}, {"day": "Day 3", "activity": "Mirik lake day trip with sightseeing."}, {"day": "Day 4", "activity": "Shopping, Mall Road & departure."}]
5	3	Sikkim-Darjeeling Combo	6 Days 5 Nights	22000	[{"day": "Day 1", "activity": "Arrival Gangtok, check-in hotel, evening MG Marg."}, {"day": "Day 2", "activity": "Tsomgo Lake, Baba Mandir excursion."}, {"day": "Day 3", "activity": "Transfer to Darjeeling, relax."}, {"day": "Day 4", "activity": "Tiger Hill sunrise, local sightseeing."}, {"day": "Day 5", "activity": "Darjeeling tea garden & Mall Road."}, {"day": "Day 6", "activity": "Breakfast & departure."}]
6	3	Romantic Combo Special	6 Days 5 Nights	26000	[{"day": "Day 1", "activity": "Arrival, hotel check-in, romantic candle dinner."}, {"day": "Day 2", "activity": "Gangtok sightseeing: Tsomgo Lake, Baba Mandir."}, {"day": "Day 3", "activity": "Transfer to Darjeeling, relax, evening city walk."}, {"day": "Day 4", "activity": "Tiger Hill sunrise & tea garden tour."}, {"day": "Day 5", "activity": "Local exploration & shopping."}, {"day": "Day 6", "activity": "Breakfast & departure."}]
7	4	Gangtok-Pelling Explorer	5 Days 4 Nights	18000	[{"day": "Day 1", "activity": "Arrival Gangtok, check-in."}, {"day": "Day 2", "activity": "Gangtok sightseeing: Rumtek Monastery, MG Marg."}, {"day": "Day 3", "activity": "Transfer Pelling, Sky Walk & Rabdentse Ruins."}, {"day": "Day 4", "activity": "Pelling local sightseeing & Kanchenjunga Viewpoint."}, {"day": "Day 5", "activity": "Breakfast & departure."}]
8	4	Premium Gangtok-Pelling	5 Days 4 Nights	23000	[{"day": "Day 1", "activity": "Luxury hotel check-in."}, {"day": "Day 2", "activity": "Gangtok sightseeing full day."}, {"day": "Day 3", "activity": "Transfer to Pelling, Sky Walk & sightseeing."}, {"day": "Day 4", "activity": "Pelling & local sightseeing, shopping."}, {"day": "Day 5", "activity": "Breakfast & departure."}]
9	5	North Sikkim Adventure	4 Days 3 Nights	17000	[{"day": "Day 1", "activity": "Arrival in Lachen, check-in, local sightseeing."}, {"day": "Day 2", "activity": "Gurudongmar Lake & Yumthang Valley tour."}, {"day": "Day 3", "activity": "Lachung sightseeing: waterfalls, monastery visit."}, {"day": "Day 4", "activity": "Breakfast & departure."}]
10	5	North Sikkim Premium	5 Days 4 Nights	21000	[{"day": "Day 1", "activity": "Arrival in Lachen, luxury stay, relax."}, {"day": "Day 2", "activity": "Gurudongmar Lake, full day excursion with guide."}, {"day": "Day 3", "activity": "Yumthang Valley, hot springs visit."}, {"day": "Day 4", "activity": "Lachung sightseeing & premium dinner."}, {"day": "Day 5", "activity": "Breakfast & departure."}]
11	6	Andaman Beach Trip	5 Days 4 Nights	26000	[{"day": "Day 1", "activity": "Arrival at Port Blair, hotel check-in, Cellular Jail visit."}, {"day": "Day 2", "activity": "Havelock Island, Radhanagar Beach, water activities."}, {"day": "Day 3", "activity": "Neil Island day trip & sightseeing."}, {"day": "Day 4", "activity": "Local market visit & relax at hotel."}, {"day": "Day 5", "activity": "Breakfast & departure."}]
12	6	Andaman Honeymoon	6 Days 5 Nights	32000	[{"day": "Day 1", "activity": "Arrival & luxury resort check-in."}, {"day": "Day 2", "activity": "Havelock Island: Private beach, snorkeling."}, {"day": "Day 3", "activity": "Radhanagar Beach & romantic candle dinner."}, {"day": "Day 4", "activity": "Neil Island sightseeing."}, {"day": "Day 5", "activity": "Water activities & relaxation."}, {"day": "Day 6", "activity": "Breakfast & departure."}]
13	7	Bhutan Explorer	5 Days 4 Nights	24000	[{"day": "Day 1", "activity": "Arrival Paro, hotel check-in."}, {"day": "Day 2", "activity": "Paro sightseeing: Rinpung Dzong, Paro Taktsang (Tiger's Nest)."}, {"day": "Day 3", "activity": "Thimphu sightseeing: Memorial Chorten, local markets."}, {"day": "Day 4", "activity": "Punakha day trip: Punakha Dzong & suspension bridge."}, {"day": "Day 5", "activity": "Breakfast & departure."}]
14	7	Bhutan Luxury	6 Days 5 Nights	30000	[{"day": "Day 1", "activity": "Arrival Paro, luxury hotel check-in."}, {"day": "Day 2", "activity": "Paro sightseeing & private guide."}, {"day": "Day 3", "activity": "Thimphu sightseeing with premium hotels."}, {"day": "Day 4", "activity": "Punakha day trip & river rafting optional."}, {"day": "Day 5", "activity": "Leisure day, spa, cultural show."}, {"day": "Day 6", "activity": "Breakfast & departure."}]
15	8	Thailand Budget Trip	5 Days 4 Nights	35000	[{"day": "Day 1", "activity": "Arrival Bangkok, hotel check-in, evening explore local market."}, {"day": "Day 2", "activity": "Bangkok city tour: Grand Palace, Wat Pho, Chao Phraya River."}, {"day": "Day 3", "activity": "Pattaya & Coral Island day trip."}, {"day": "Day 4", "activity": "Local sightseeing & shopping."}, {"day": "Day 5", "activity": "Breakfast & departure."}]
16	8	Thailand Premium Holiday	6 Days 5 Nights	45000	[{"day": "Day 1", "activity": "Arrival & luxury hotel check-in."}, {"day": "Day 2", "activity": "Bangkok city luxury tour: Grand Palace, River cruise."}, {"day": "Day 3", "activity": "Pattaya & Coral Island with private boat."}, {"day": "Day 4", "activity": "Ayutthaya day trip with guided tour."}, {"day": "Day 5", "activity": "Relax at luxury resort & shopping."}, {"day": "Day 6", "activity": "Breakfast & departure."}]
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, name, message, rating, created_at) FROM stdin;
8	Nikhil Sharma	hello	5	2026-03-22 18:35:35.906388
9	Ayush Sharma	nikhil	5	2026-03-22 18:35:49.931945
10	Ayush Sharma	nfwndin	3	2026-03-22 18:36:05.178334
11	Nikhil Sharma	nianinin	4	2026-03-22 18:36:16.907047
12	Nikhil Sharma	ni	3	2026-03-22 18:38:06.245572
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 12, true);


--
-- Name: destinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.destinations_id_seq', 1, false);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_id_seq', 16, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 12, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: destinations destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (id);


--
-- Name: destinations destinations_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_slug_key UNIQUE (slug);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: packages packages_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 3FVM7VRd2h6VhUymIaGKj7AQ1EnpmsJz4qKUjVEiIsgPF0sE9UcYxPiedlhR3hx

