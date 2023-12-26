--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2023-12-19 11:50:22

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO admin;

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16385)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO admin;

--
-- TOC entry 210 (class 1259 OID 16392)
-- Name: chat; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.chat (
    id integer NOT NULL,
    title text NOT NULL,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.chat OWNER TO admin;

--
-- TOC entry 211 (class 1259 OID 16398)
-- Name: chat_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.chat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_id_seq OWNER TO admin;

--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 211
-- Name: chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.chat_id_seq OWNED BY public.chat.id;


--
-- TOC entry 212 (class 1259 OID 16399)
-- Name: message; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.message (
    id integer NOT NULL,
    text text NOT NULL,
    author_id integer NOT NULL,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL,
    chat_id integer,
    type text NOT NULL
);


ALTER TABLE public.message OWNER TO admin;

--
-- TOC entry 213 (class 1259 OID 16405)
-- Name: message_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_id_seq OWNER TO admin;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 213
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;


--
-- TOC entry 214 (class 1259 OID 16406)
-- Name: user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email text NOT NULL,
    name text,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO admin;

--
-- TOC entry 215 (class 1259 OID 16412)
-- Name: user_chat; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_chat (
    id integer NOT NULL,
    chat_id integer NOT NULL,
    user_id integer NOT NULL,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL,
    is_active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.user_chat OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 16417)
-- Name: user_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_chat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_chat_id_seq OWNER TO admin;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_chat_id_seq OWNED BY public.user_chat.id;


--
-- TOC entry 217 (class 1259 OID 16418)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO admin;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 3188 (class 2604 OID 16419)
-- Name: chat id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.chat ALTER COLUMN id SET DEFAULT nextval('public.chat_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16420)
-- Name: message id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 16421)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16422)
-- Name: user_chat id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat ALTER COLUMN id SET DEFAULT nextval('public.user_chat_id_seq'::regclass);


--
-- TOC entry 3350 (class 0 OID 16385)
-- Dependencies: 209
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public._prisma_migrations VALUES ('997a2767-4eea-40fb-841c-bf9942fee908', '406948015ef00ee3a20bc48cf69d4197ed811628510ec3cfaa78fb16fb20d9a1', '2023-12-18 14:46:52.605579+00', '20231218144652_', NULL, NULL, '2023-12-18 14:46:52.246074+00', 1);
INSERT INTO public._prisma_migrations VALUES ('3c295d4b-7b82-492f-ac6d-0f29b5652980', '5d030b3013285f5f75145ab6f1db78775aed36d2ae3225b4deebe82c207af978', '2023-12-19 08:49:48.512999+00', '20231219084948_', NULL, NULL, '2023-12-19 08:49:48.41943+00', 1);


--
-- TOC entry 3351 (class 0 OID 16392)
-- Dependencies: 210
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3353 (class 0 OID 16399)
-- Dependencies: 212
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3355 (class 0 OID 16406)
-- Dependencies: 214
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3356 (class 0 OID 16412)
-- Dependencies: 215
-- Data for Name: user_chat; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 211
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.chat_id_seq', 1, false);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 213
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.message_id_seq', 1, false);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_chat_id_seq', 1, false);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3197 (class 2606 OID 16424)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 16426)
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16428)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16430)
-- Name: user_chat user_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16432)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 1259 OID 16433)
-- Name: user_email_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX user_email_key ON public."user" USING btree (email);


--
-- TOC entry 3207 (class 2606 OID 16434)
-- Name: message message_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_author_id_fkey FOREIGN KEY (author_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3208 (class 2606 OID 16673)
-- Name: message message_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3209 (class 2606 OID 16439)
-- Name: user_chat user_chat_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3210 (class 2606 OID 16444)
-- Name: user_chat user_chat_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2023-12-19 11:50:22

--
-- PostgreSQL database dump complete
--

