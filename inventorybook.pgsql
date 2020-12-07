--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: Books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Books" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    quantity integer NOT NULL,
    "userId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Books" OWNER TO postgres;

--
-- Name: Books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Books_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Books_id_seq" OWNER TO postgres;

--
-- Name: Books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Books_id_seq" OWNED BY public."Books".id;


--
-- Name: Detailpinjams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Detailpinjams" (
    id integer NOT NULL,
    nama_peminjam character varying(255),
    jumlah integer,
    "peminjamanId" integer,
    "bookId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Detailpinjams" OWNER TO postgres;

--
-- Name: Detailpinjams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Detailpinjams_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Detailpinjams_id_seq" OWNER TO postgres;

--
-- Name: Detailpinjams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Detailpinjams_id_seq" OWNED BY public."Detailpinjams".id;


--
-- Name: Peminjamans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Peminjamans" (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    tanggal_pinjam timestamp with time zone NOT NULL,
    tanggal_kembali timestamp with time zone NOT NULL,
    "userId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Peminjamans" OWNER TO postgres;

--
-- Name: Peminjamans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Peminjamans_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Peminjamans_id_seq" OWNER TO postgres;

--
-- Name: Peminjamans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Peminjamans_id_seq" OWNED BY public."Peminjamans".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Books" ALTER COLUMN id SET DEFAULT nextval('public."Books_id_seq"'::regclass);


--
-- Name: Detailpinjams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Detailpinjams" ALTER COLUMN id SET DEFAULT nextval('public."Detailpinjams_id_seq"'::regclass);


--
-- Name: Peminjamans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Peminjamans" ALTER COLUMN id SET DEFAULT nextval('public."Peminjamans_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: Books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Books" (id, title, author, description, quantity, "userId", "createdAt", "updatedAt") FROM stdin;
11	Alkitab	Alwin	Religius	40	8	2020-11-27 20:25:31.693+07	2020-11-27 20:25:31.693+07
12	Python 7	Frans	Pintar 10 menit	40	8	2020-11-29 11:26:01.941+07	2020-11-30 13:43:20.47+07
24	Operasi Sistem	Natha	Pintar OS dalam 10 menit	20	8	2020-11-30 14:05:32.377+07	2020-12-01 12:34:51.228+07
25	ANSI	YUDISTIRA	Pintar Ansi dalam 10 menit	4344	8	2020-11-30 14:26:10.395+07	2020-12-01 13:43:36.377+07
\.


--
-- Data for Name: Detailpinjams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Detailpinjams" (id, nama_peminjam, jumlah, "peminjamanId", "bookId", "createdAt", "updatedAt") FROM stdin;
3	Anggi Sonia Sinaga	30	24	13	2020-12-01 12:37:57.441+07	2020-12-01 12:41:13.974+07
\.


--
-- Data for Name: Peminjamans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Peminjamans" (id, status, tanggal_pinjam, tanggal_kembali, "userId", "createdAt", "updatedAt") FROM stdin;
13	Diperpanjang	2020-11-29 07:00:00+07	2020-12-10 07:00:00+07	8	2020-11-30 13:43:39.831+07	2020-11-30 13:43:39.831+07
14	Ditunda	2020-11-29 07:00:00+07	2020-12-10 07:00:00+07	8	2020-11-30 14:05:46.419+07	2020-11-30 14:05:46.419+07
15	Dibatalkan	2020-11-29 07:00:00+07	2020-12-10 07:00:00+07	8	2020-11-30 14:25:50.197+07	2020-11-30 14:25:50.197+07
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20201127093116-create-user.js
20201127093910-create-book.js
20201129044640-create-peminjaman.js
20201130063736-create-detail-pinjam.js
20201130072329-create-detail-pinjam.js
20201201024255-create-detailpinjam.js
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, name, username, email, password, "createdAt", "updatedAt") FROM stdin;
8	Supriyanti D Situmorang	Yanti Situmorang	Yantisitumorang06@gmail.com	yanti123	2020-11-27 20:00:32.326+07	2020-11-30 11:36:38.963+07
28	Fellin 	Fellin	Fellin@gmail.com	Fellin	2020-11-30 14:27:36.555+07	2020-11-30 14:27:36.555+07
\.


--
-- Name: Books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Books_id_seq"', 25, true);


--
-- Name: Detailpinjams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Detailpinjams_id_seq"', 3, true);


--
-- Name: Peminjamans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Peminjamans_id_seq"', 17, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 28, true);


--
-- Name: Books Books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Books"
    ADD CONSTRAINT "Books_pkey" PRIMARY KEY (id);


--
-- Name: Detailpinjams Detailpinjams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Detailpinjams"
    ADD CONSTRAINT "Detailpinjams_pkey" PRIMARY KEY (id);


--
-- Name: Peminjamans Peminjamans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Peminjamans"
    ADD CONSTRAINT "Peminjamans_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Books Books_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Books"
    ADD CONSTRAINT "Books_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;


--
-- Name: Peminjamans Peminjamans_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Peminjamans"
    ADD CONSTRAINT "Peminjamans_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

