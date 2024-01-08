--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2024-01-08 14:40:45

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
-- TOC entry 210 (class 1259 OID 16392)
-- Name: chat; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.chat (
    id integer NOT NULL,
    title text NOT NULL,
    create_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp(3) without time zone NOT NULL,
    creator_id integer NOT NULL
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
-- TOC entry 3354 (class 0 OID 0)
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
    chat_id integer NOT NULL,
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
-- TOC entry 3355 (class 0 OID 0)
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
-- TOC entry 3356 (class 0 OID 0)
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
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 3181 (class 2604 OID 16419)
-- Name: chat id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.chat ALTER COLUMN id SET DEFAULT nextval('public.chat_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 16420)
-- Name: message id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 16421)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 16422)
-- Name: user_chat id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat ALTER COLUMN id SET DEFAULT nextval('public.user_chat_id_seq'::regclass);


--
-- TOC entry 3341 (class 0 OID 16392)
-- Dependencies: 210
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.chat VALUES (4, 'chat 2', '2023-12-28 07:46:26.173', '2023-12-28 07:46:26.173', 1);
INSERT INTO public.chat VALUES (5, 'chat 3', '2023-12-28 07:48:59.075', '2023-12-28 07:48:59.075', 1);
INSERT INTO public.chat VALUES (7, 'chat 5', '2023-12-28 07:49:11.068', '2023-12-28 07:49:11.068', 1);
INSERT INTO public.chat VALUES (8, 'chat 6', '2023-12-28 07:49:14.976', '2023-12-28 07:49:14.976', 1);
INSERT INTO public.chat VALUES (9, 'chat 7', '2023-12-28 07:49:19.681', '2023-12-28 07:49:19.681', 1);
INSERT INTO public.chat VALUES (1, 'chat 111', '2023-12-27 07:51:23.514', '2023-12-28 11:07:03.355', 1);


--
-- TOC entry 3343 (class 0 OID 16399)
-- Dependencies: 212
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.message VALUES (2, 'test2', 3, '2023-12-27 11:50:06.187', '2023-12-27 11:50:06.187', 1, 'text');
INSERT INTO public.message VALUES (4, 'test23', 3, '2023-12-27 11:50:30.833', '2023-12-27 11:50:30.833', 1, 'text');
INSERT INTO public.message VALUES (5, 'test23', 1, '2023-12-27 11:50:39.51', '2023-12-27 11:50:39.51', 1, 'text');
INSERT INTO public.message VALUES (7, 'lm;', 1, '2024-01-03 13:46:51.937', '2024-01-03 13:46:51.937', 4, 'text');
INSERT INTO public.message VALUES (8, 'asdfadsf', 1, '2024-01-03 13:49:41.943', '2024-01-03 13:49:41.943', 4, 'text');
INSERT INTO public.message VALUES (9, 'cxvzxvzx', 1, '2024-01-03 14:18:19.289', '2024-01-03 14:18:19.289', 4, 'text');
INSERT INTO public.message VALUES (10, 'asfsafa', 1, '2024-01-04 06:14:41.729', '2024-01-04 06:14:41.729', 4, 'text');
INSERT INTO public.message VALUES (11, 'zxcvzxv', 1, '2024-01-04 06:38:59.286', '2024-01-04 06:38:59.286', 4, 'text');
INSERT INTO public.message VALUES (13, 'bnjhg', 1, '2024-01-04 06:43:01.178', '2024-01-04 06:43:01.178', 4, 'text');
INSERT INTO public.message VALUES (14, 'test 1', 1, '2024-01-04 12:15:18.088', '2024-01-04 12:15:18.088', 4, 'text');
INSERT INTO public.message VALUES (15, 'asdsad', 1, '2024-01-08 09:10:58.835', '2024-01-08 09:10:58.835', 4, 'text');
INSERT INTO public.message VALUES (16, 'test sending message', 1, '2024-01-08 09:11:25.594', '2024-01-08 09:11:25.594', 4, 'text');


--
-- TOC entry 3345 (class 0 OID 16406)
-- Dependencies: 214
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."user" VALUES (3, 'test2@test.by', 'test2', '2023-12-27 06:51:38.884', '2023-12-27 06:51:38.884');
INSERT INTO public."user" VALUES (1, 'test1@test.by', 'test1', '2023-12-27 06:47:21.604', '2023-12-27 07:26:45.776');
INSERT INTO public."user" VALUES (5, 'test4@test.by', 'test4', '2023-12-28 07:40:32.219', '2023-12-28 07:40:32.219');
INSERT INTO public."user" VALUES (6, 'test5@test.by', 'test5', '2023-12-28 07:40:43.733', '2023-12-28 07:40:43.733');
INSERT INTO public."user" VALUES (7, 'test6@test.by', 'test6', '2023-12-28 07:40:48.819', '2023-12-28 07:40:48.819');
INSERT INTO public."user" VALUES (8, 'test8@test.by', 'test8', '2024-01-03 08:17:30.309', '2024-01-03 08:17:30.309');


--
-- TOC entry 3346 (class 0 OID 16412)
-- Dependencies: 215
-- Data for Name: user_chat; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.user_chat VALUES (9, 4, 1, '2023-12-28 07:46:26.173', '2023-12-28 07:46:26.173', false);
INSERT INTO public.user_chat VALUES (10, 4, 3, '2023-12-28 07:46:26.173', '2023-12-28 07:46:26.173', false);
INSERT INTO public.user_chat VALUES (11, 4, 5, '2023-12-28 07:46:26.173', '2023-12-28 07:46:26.173', false);
INSERT INTO public.user_chat VALUES (12, 5, 3, '2023-12-28 07:48:59.075', '2023-12-28 07:48:59.075', false);
INSERT INTO public.user_chat VALUES (13, 5, 5, '2023-12-28 07:48:59.075', '2023-12-28 07:48:59.075', false);
INSERT INTO public.user_chat VALUES (18, 8, 6, '2023-12-28 07:49:14.976', '2023-12-28 07:49:14.976', false);
INSERT INTO public.user_chat VALUES (19, 8, 1, '2023-12-28 07:49:14.976', '2023-12-28 07:49:14.976', false);
INSERT INTO public.user_chat VALUES (20, 9, 7, '2023-12-28 07:49:19.681', '2023-12-28 07:49:19.681', false);
INSERT INTO public.user_chat VALUES (21, 9, 1, '2023-12-28 07:49:19.681', '2023-12-28 07:49:19.681', false);
INSERT INTO public.user_chat VALUES (22, 1, 7, '2023-12-28 11:04:07.924', '2023-12-28 11:04:07.924', false);
INSERT INTO public.user_chat VALUES (24, 1, 6, '2023-12-28 11:07:03.355', '2023-12-28 11:07:03.355', false);
INSERT INTO public.user_chat VALUES (25, 1, 5, '2023-12-28 11:07:03.355', '2023-12-28 11:07:03.355', false);


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 211
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.chat_id_seq', 9, true);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 213
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.message_id_seq', 17, true);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_chat_id_seq', 25, true);


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_id_seq', 8, true);


--
-- TOC entry 3190 (class 2606 OID 16426)
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16428)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 16430)
-- Name: user_chat user_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 16432)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 1259 OID 16433)
-- Name: user_email_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX user_email_key ON public."user" USING btree (email);


--
-- TOC entry 3198 (class 2606 OID 16434)
-- Name: message message_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_author_id_fkey FOREIGN KEY (author_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3199 (class 2606 OID 16882)
-- Name: message message_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3200 (class 2606 OID 16444)
-- Name: user_chat user_chat_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3201 (class 2606 OID 16449)
-- Name: user_chat user_chat_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_chat
    ADD CONSTRAINT user_chat_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2024-01-08 14:40:48

--
-- PostgreSQL database dump complete
--

