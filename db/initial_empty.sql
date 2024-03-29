--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2024-01-10 10:00:41

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
-- TOC entry 217 (class 1259 OID 25257)
-- Name: chat; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.chat (
    id integer NOT NULL,
    title text NOT NULL,
    creator_id integer DEFAULT 0 NOT NULL,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.chat OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 25256)
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
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 216
-- Name: chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.chat_id_seq OWNED BY public.chat.id;


--
-- TOC entry 215 (class 1259 OID 25247)
-- Name: message; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.message (
    id integer NOT NULL,
    text text NOT NULL,
    type text NOT NULL,
    author_id integer NOT NULL,
    chat_id integer NOT NULL,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.message OWNER TO admin;

--
-- TOC entry 214 (class 1259 OID 25246)
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
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 214
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;


--
-- TOC entry 213 (class 1259 OID 25236)
-- Name: session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.session (
    id integer NOT NULL,
    user_id integer NOT NULL,
    access_token text NOT NULL,
    refresh_token text NOT NULL,
    ip text NOT NULL,
    device_info text NOT NULL,
    is_used boolean DEFAULT false,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO admin;

--
-- TOC entry 212 (class 1259 OID 25235)
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id_seq OWNER TO admin;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 212
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- TOC entry 211 (class 1259 OID 25226)
-- Name: user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email text NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    middle_name text,
    last_name text NOT NULL,
    name text,
    avatar bytea,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 25268)
-- Name: user_chat; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_chat (
    id integer NOT NULL,
    chat_id integer NOT NULL,
    user_id integer NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.user_chat OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 25267)
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
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_chat_id_seq OWNED BY public.user_chat.id;


--
-- TOC entry 210 (class 1259 OID 25225)
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
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 210
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 3191 (class 2604 OID 25260)
-- Name: chat id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.chat ALTER COLUMN id SET DEFAULT nextval('public.chat_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 25250)
-- Name: message id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 25239)
-- Name: session id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 25229)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 25271)
-- Name: user_chat id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat ALTER COLUMN id SET DEFAULT nextval('public.user_chat_id_seq'::regclass);


--
-- TOC entry 3360 (class 0 OID 25257)
-- Dependencies: 217
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3358 (class 0 OID 25247)
-- Dependencies: 215
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3356 (class 0 OID 25236)
-- Dependencies: 213
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3354 (class 0 OID 25226)
-- Dependencies: 211
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3362 (class 0 OID 25268)
-- Dependencies: 219
-- Data for Name: user_chat; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 216
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.chat_id_seq', 1, false);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 214
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.message_id_seq', 1, false);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 212
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.session_id_seq', 1, false);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_chat_id_seq', 1, false);


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 210
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3206 (class 2606 OID 25266)
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 25255)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 25245)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 25275)
-- Name: user_chat user_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 25234)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 1259 OID 25276)
-- Name: user_email_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX user_email_key ON public."user" USING btree (email);


--
-- TOC entry 3198 (class 1259 OID 25277)
-- Name: user_login_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX user_login_key ON public."user" USING btree (login);


--
-- TOC entry 3210 (class 2606 OID 25283)
-- Name: message message_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_author_id_fkey FOREIGN KEY (author_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3211 (class 2606 OID 25288)
-- Name: message message_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3209 (class 2606 OID 25278)
-- Name: session session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3212 (class 2606 OID 25293)
-- Name: user_chat user_chat_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3213 (class 2606 OID 25298)
-- Name: user_chat user_chat_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2024-01-10 10:00:42

--
-- PostgreSQL database dump complete
--

