--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-31 00:16:02

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
-- TOC entry 218 (class 1259 OID 16481)
-- Name: lekarstvo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lekarstvo (
    id integer NOT NULL,
    nazvanie character varying(255) NOT NULL,
    forma_vypuska character varying(255) NOT NULL,
    sposob_primeneniya text NOT NULL,
    srok_godnosti date NOT NULL,
    cena numeric(10,2) NOT NULL,
    opisanie_prigotovleniya text
);


ALTER TABLE public.lekarstvo OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16480)
-- Name: lekarstvo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lekarstvo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lekarstvo_id_seq OWNER TO postgres;

--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 217
-- Name: lekarstvo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lekarstvo_id_seq OWNED BY public.lekarstvo.id;


--
-- TOC entry 222 (class 1259 OID 16503)
-- Name: pokupatel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokupatel (
    id integer NOT NULL,
    familiya character varying(100) NOT NULL,
    imya character varying(100) NOT NULL,
    otchestvo character varying(100),
    telefon character varying(20) NOT NULL,
    email character varying(255)
);


ALTER TABLE public.pokupatel OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16502)
-- Name: pokupatel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokupatel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pokupatel_id_seq OWNER TO postgres;

--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 221
-- Name: pokupatel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokupatel_id_seq OWNED BY public.pokupatel.id;


--
-- TOC entry 224 (class 1259 OID 16516)
-- Name: prodaja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodaja (
    id integer NOT NULL,
    data timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    summa numeric(10,2) NOT NULL,
    id_prodavec integer NOT NULL,
    id_pokupatel integer NOT NULL
);


ALTER TABLE public.prodaja OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16515)
-- Name: prodaja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prodaja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prodaja_id_seq OWNER TO postgres;

--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 223
-- Name: prodaja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prodaja_id_seq OWNED BY public.prodaja.id;


--
-- TOC entry 226 (class 1259 OID 16534)
-- Name: prodaja_lekarstvo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodaja_lekarstvo (
    id integer NOT NULL,
    id_prodaja integer NOT NULL,
    id_lekarstvo integer NOT NULL
);


ALTER TABLE public.prodaja_lekarstvo OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16533)
-- Name: prodaja_lekarstvo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prodaja_lekarstvo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prodaja_lekarstvo_id_seq OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 225
-- Name: prodaja_lekarstvo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prodaja_lekarstvo_id_seq OWNED BY public.prodaja_lekarstvo.id;


--
-- TOC entry 220 (class 1259 OID 16490)
-- Name: prodavec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodavec (
    id integer NOT NULL,
    familiya character varying(100) NOT NULL,
    imya character varying(100) NOT NULL,
    otchestvo character varying(100),
    telefon character varying(20) NOT NULL,
    email character varying(255)
);


ALTER TABLE public.prodavec OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16489)
-- Name: prodavec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prodavec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prodavec_id_seq OWNER TO postgres;

--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 219
-- Name: prodavec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prodavec_id_seq OWNED BY public.prodavec.id;


--
-- TOC entry 228 (class 1259 OID 16551)
-- Name: recept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recept (
    id integer NOT NULL,
    data_vydachi date DEFAULT CURRENT_DATE NOT NULL,
    familiya_vracha character varying(100) NOT NULL,
    imya_vracha character varying(100) NOT NULL,
    otchestvo_vracha character varying(100),
    id_pokupatel integer NOT NULL,
    id_lekarstvo integer NOT NULL,
    kolichestvo integer NOT NULL,
    CONSTRAINT recept_kolichestvo_check CHECK ((kolichestvo > 0))
);


ALTER TABLE public.recept OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16550)
-- Name: recept_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recept_id_seq OWNER TO postgres;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 227
-- Name: recept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recept_id_seq OWNED BY public.recept.id;


--
-- TOC entry 4666 (class 2604 OID 16484)
-- Name: lekarstvo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lekarstvo ALTER COLUMN id SET DEFAULT nextval('public.lekarstvo_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 16506)
-- Name: pokupatel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokupatel ALTER COLUMN id SET DEFAULT nextval('public.pokupatel_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 16519)
-- Name: prodaja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodaja ALTER COLUMN id SET DEFAULT nextval('public.prodaja_id_seq'::regclass);


--
-- TOC entry 4671 (class 2604 OID 16537)
-- Name: prodaja_lekarstvo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodaja_lekarstvo ALTER COLUMN id SET DEFAULT nextval('public.prodaja_lekarstvo_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 16493)
-- Name: prodavec id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodavec ALTER COLUMN id SET DEFAULT nextval('public.prodavec_id_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 16554)
-- Name: recept id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept ALTER COLUMN id SET DEFAULT nextval('public.recept_id_seq'::regclass);


--
-- TOC entry 4847 (class 0 OID 16481)
-- Dependencies: 218
-- Data for Name: lekarstvo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lekarstvo (id, nazvanie, forma_vypuska, sposob_primeneniya, srok_godnosti, cena, opisanie_prigotovleniya) FROM stdin;
1	Аспирин	Таблетки	Принимать по 1 таблетке 2 раза в день после еды	2026-12-31	150.00	Растворить в воде перед употреблением
2	Нурофен	Капсулы	Принимать внутрь во время еды	2025-08-15	250.50	Глотать целиком, не разжевывая
3	Парацетамол	Таблетки	Принимать по 1 таблетке 3 раза в день	2027-05-20	100.00	Можно запивать молоком
4	Цитрамон	Таблетки	Принимать по 1 таблетке при головной боли	2025-11-30	80.00	Не рекомендуется детям до 12 лет
5	Анальгин	Раствор для инъекций	Внутримышечно, по 2 мл 2 раза в день	2026-03-10	300.00	Перед применением взболтать
\.


--
-- TOC entry 4851 (class 0 OID 16503)
-- Dependencies: 222
-- Data for Name: pokupatel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokupatel (id, familiya, imya, otchestvo, telefon, email) FROM stdin;
1	Смирнов	Дмитрий	Анатольевич	79881112233	smirnov@example.com
2	Кузнецова	Мария	Олеговна	79882223344	kuznetsova@example.com
3	Федоров	Игорь	Сергеевич	79883334455	fedorov@example.com
\.


--
-- TOC entry 4853 (class 0 OID 16516)
-- Dependencies: 224
-- Data for Name: prodaja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prodaja (id, data, summa, id_prodavec, id_pokupatel) FROM stdin;
1	2024-03-10 12:30:00	500.00	1	1
2	2024-03-11 15:45:00	250.50	2	2
3	2024-03-12 09:15:00	600.00	3	3
\.


--
-- TOC entry 4855 (class 0 OID 16534)
-- Dependencies: 226
-- Data for Name: prodaja_lekarstvo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prodaja_lekarstvo (id, id_prodaja, id_lekarstvo) FROM stdin;
1	1	1
2	1	3
3	2	2
4	2	5
5	3	4
6	3	1
\.


--
-- TOC entry 4849 (class 0 OID 16490)
-- Dependencies: 220
-- Data for Name: prodavec; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prodavec (id, familiya, imya, otchestvo, telefon, email) FROM stdin;
1	Иванов	Петр	Александрович	79990001122	ivanov@example.com
2	Петров	Сергей	Владимирович	79991112233	petrov@example.com
3	Сидорова	Анна	Викторовна	79992223344	sidorova@example.com
\.


--
-- TOC entry 4857 (class 0 OID 16551)
-- Dependencies: 228
-- Data for Name: recept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recept (id, data_vydachi, familiya_vracha, imya_vracha, otchestvo_vracha, id_pokupatel, id_lekarstvo, kolichestvo) FROM stdin;
1	2024-02-20	Васильев	Олег	Петрович	1	1	2
2	2024-02-25	Семенова	Екатерина	Алексеевна	2	3	1
3	2024-03-05	Михайлов	Андрей	Николаевич	3	5	3
\.


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 217
-- Name: lekarstvo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lekarstvo_id_seq', 5, true);


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 221
-- Name: pokupatel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokupatel_id_seq', 3, true);


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 223
-- Name: prodaja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prodaja_id_seq', 3, true);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 225
-- Name: prodaja_lekarstvo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prodaja_lekarstvo_id_seq', 6, true);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 219
-- Name: prodavec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prodavec_id_seq', 3, true);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 227
-- Name: recept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recept_id_seq', 3, true);


--
-- TOC entry 4676 (class 2606 OID 16488)
-- Name: lekarstvo lekarstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lekarstvo
    ADD CONSTRAINT lekarstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 4684 (class 2606 OID 16514)
-- Name: pokupatel pokupatel_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokupatel
    ADD CONSTRAINT pokupatel_email_key UNIQUE (email);


--
-- TOC entry 4686 (class 2606 OID 16510)
-- Name: pokupatel pokupatel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokupatel
    ADD CONSTRAINT pokupatel_pkey PRIMARY KEY (id);


--
-- TOC entry 4688 (class 2606 OID 16512)
-- Name: pokupatel pokupatel_telefon_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokupatel
    ADD CONSTRAINT pokupatel_telefon_key UNIQUE (telefon);


--
-- TOC entry 4692 (class 2606 OID 16539)
-- Name: prodaja_lekarstvo prodaja_lekarstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodaja_lekarstvo
    ADD CONSTRAINT prodaja_lekarstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 4690 (class 2606 OID 16522)
-- Name: prodaja prodaja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodaja
    ADD CONSTRAINT prodaja_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 16501)
-- Name: prodavec prodavec_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodavec
    ADD CONSTRAINT prodavec_email_key UNIQUE (email);


--
-- TOC entry 4680 (class 2606 OID 16497)
-- Name: prodavec prodavec_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodavec
    ADD CONSTRAINT prodavec_pkey PRIMARY KEY (id);


--
-- TOC entry 4682 (class 2606 OID 16499)
-- Name: prodavec prodavec_telefon_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodavec
    ADD CONSTRAINT prodavec_telefon_key UNIQUE (telefon);


--
-- TOC entry 4694 (class 2606 OID 16558)
-- Name: recept recept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT recept_pkey PRIMARY KEY (id);


--
-- TOC entry 4697 (class 2606 OID 16545)
-- Name: prodaja_lekarstvo fk_lekarstvo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodaja_lekarstvo
    ADD CONSTRAINT fk_lekarstvo FOREIGN KEY (id_lekarstvo) REFERENCES public.lekarstvo(id) ON DELETE CASCADE;


--
-- TOC entry 4699 (class 2606 OID 16564)
-- Name: recept fk_lekarstvo_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT fk_lekarstvo_r FOREIGN KEY (id_lekarstvo) REFERENCES public.lekarstvo(id) ON DELETE CASCADE;


--
-- TOC entry 4695 (class 2606 OID 16528)
-- Name: prodaja fk_pokupatel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodaja
    ADD CONSTRAINT fk_pokupatel FOREIGN KEY (id_pokupatel) REFERENCES public.pokupatel(id) ON DELETE CASCADE;


--
-- TOC entry 4700 (class 2606 OID 16559)
-- Name: recept fk_pokupatel_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT fk_pokupatel_r FOREIGN KEY (id_pokupatel) REFERENCES public.pokupatel(id) ON DELETE CASCADE;


--
-- TOC entry 4698 (class 2606 OID 16540)
-- Name: prodaja_lekarstvo fk_prodaja; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodaja_lekarstvo
    ADD CONSTRAINT fk_prodaja FOREIGN KEY (id_prodaja) REFERENCES public.prodaja(id) ON DELETE CASCADE;


--
-- TOC entry 4696 (class 2606 OID 16523)
-- Name: prodaja fk_prodavec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodaja
    ADD CONSTRAINT fk_prodavec FOREIGN KEY (id_prodavec) REFERENCES public.prodavec(id) ON DELETE CASCADE;


-- Completed on 2025-03-31 00:16:03

--
-- PostgreSQL database dump complete
--

