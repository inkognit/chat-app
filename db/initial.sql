--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2024-02-15 17:34:40

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

INSERT INTO public.chat VALUES (1, 'test1', 1, '2024-01-10 13:52:40.574', '2024-01-10 13:52:40.574');
INSERT INTO public.chat VALUES (2, 'test1', 1, '2024-01-10 13:52:46.127', '2024-01-10 13:52:46.127');
INSERT INTO public.chat VALUES (3, 'test1', 1, '2024-01-10 13:52:49.732', '2024-01-10 13:52:49.732');
INSERT INTO public.chat VALUES (4, 'test1', 1, '2024-01-10 13:53:09.186', '2024-01-10 13:53:09.186');


--
-- TOC entry 3358 (class 0 OID 25247)
-- Dependencies: 215
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.message VALUES (1, 'хэй', 'text', 1, 1, '2024-01-12 14:52:53.703', '2024-01-12 14:52:53.703');
INSERT INTO public.message VALUES (2, 'safdsaf', 'text', 1, 1, '2024-01-15 13:13:49.12', '2024-01-15 13:13:49.12');
INSERT INTO public.message VALUES (3, 'n', 'text', 1, 1, '2024-01-15 13:23:58.891', '2024-01-15 13:23:58.891');
INSERT INTO public.message VALUES (4, 'арп', 'text', 1, 1, '2024-01-17 06:58:08.831', '2024-01-17 06:58:08.831');
INSERT INTO public.message VALUES (5, 'фыва', 'text', 1, 1, '2024-01-17 06:58:45.032', '2024-01-17 06:58:45.032');
INSERT INTO public.message VALUES (6, 'ывпаывп', 'text', 1, 1, '2024-01-17 07:07:00.534', '2024-01-17 07:07:00.534');
INSERT INTO public.message VALUES (7, 'счим', 'text', 1, 1, '2024-01-17 07:40:32.332', '2024-01-17 07:40:32.332');
INSERT INTO public.message VALUES (8, '213', 'text', 3, 1, '2024-01-17 09:10:34.809', '2024-01-17 09:10:34.809');
INSERT INTO public.message VALUES (9, 'qwrqwr', 'text', 1, 1, '2024-01-17 09:11:04.369', '2024-01-17 09:11:04.369');
INSERT INTO public.message VALUES (10, 'asdfasd', 'text', 1, 1, '2024-01-17 09:11:10.865', '2024-01-17 09:11:10.865');
INSERT INTO public.message VALUES (11, '\zcx\zcx', 'text', 1, 1, '2024-01-17 13:04:54.715', '2024-01-17 13:04:54.715');
INSERT INTO public.message VALUES (12, 'asdfasf', 'text', 1, 1, '2024-01-17 13:04:58.075', '2024-01-17 13:04:58.075');
INSERT INTO public.message VALUES (13, 'asfd', 'text', 1, 1, '2024-01-17 13:08:15.963', '2024-01-17 13:08:15.963');
INSERT INTO public.message VALUES (14, 'sad', 'text', 1, 1, '2024-01-17 13:10:43.194', '2024-01-17 13:10:43.194');
INSERT INTO public.message VALUES (15, 'qwe', 'text', 3, 1, '2024-01-18 11:08:48.141', '2024-01-18 11:08:48.141');
INSERT INTO public.message VALUES (16, 'sdfsfsdf', 'text', 1, 1, '2024-01-18 13:21:01.471', '2024-01-18 13:21:01.471');
INSERT INTO public.message VALUES (17, 'test ', 'text', 3, 1, '2024-01-18 13:28:28.366', '2024-01-18 13:28:28.366');
INSERT INTO public.message VALUES (18, '1234', 'text', 3, 1, '2024-01-18 14:05:38.947', '2024-01-18 14:05:38.947');
INSERT INTO public.message VALUES (19, '1233321', 'text', 1, 1, '2024-01-18 14:07:10.409', '2024-01-18 14:07:10.409');
INSERT INTO public.message VALUES (20, '1223121213', 'text', 1, 1, '2024-01-18 14:07:50.583', '2024-01-18 14:07:50.583');
INSERT INTO public.message VALUES (21, 'zgfzfdzdf', 'text', 1, 1, '2024-01-18 14:39:30.332', '2024-01-18 14:39:30.332');
INSERT INTO public.message VALUES (22, 'sdafafds', 'text', 1, 1, '2024-01-18 14:39:56.387', '2024-01-18 14:39:56.387');
INSERT INTO public.message VALUES (23, 'dhffghdhsrty', 'text', 1, 1, '2024-01-18 14:40:21.1', '2024-01-18 14:40:21.1');
INSERT INTO public.message VALUES (24, 'asdfasfasfdsa', 'text', 1, 1, '2024-01-18 14:43:28.111', '2024-01-18 14:43:28.111');
INSERT INTO public.message VALUES (25, 'sdgsd', 'text', 1, 1, '2024-01-18 14:44:12.811', '2024-01-18 14:44:12.811');
INSERT INTO public.message VALUES (26, 'asdfasf', 'text', 1, 1, '2024-01-18 14:47:04.105', '2024-01-18 14:47:04.105');
INSERT INTO public.message VALUES (27, 'fdgd', 'text', 1, 1, '2024-01-18 14:47:38.486', '2024-01-18 14:47:38.486');
INSERT INTO public.message VALUES (28, 'df', 'text', 1, 1, '2024-01-18 14:48:13.96', '2024-01-18 14:48:13.96');
INSERT INTO public.message VALUES (29, 'jghg', 'text', 1, 1, '2024-01-18 14:48:34.758', '2024-01-18 14:48:34.758');
INSERT INTO public.message VALUES (30, 'cng', 'text', 1, 1, '2024-01-18 14:49:16.249', '2024-01-18 14:49:16.249');
INSERT INTO public.message VALUES (31, 'test', 'text', 3, 1, '2024-01-22 06:47:32.926', '2024-01-22 06:47:32.926');
INSERT INTO public.message VALUES (32, 'test2', 'text', 3, 1, '2024-01-22 12:21:13.079', '2024-01-22 12:21:13.079');
INSERT INTO public.message VALUES (33, 'test=', 'text', 3, 1, '2024-01-22 12:59:30.38', '2024-01-22 12:59:30.38');


--
-- TOC entry 3356 (class 0 OID 25236)
-- Dependencies: 213
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.session VALUES (1, 4, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMyIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMyIsImVtYWlsIjoidXNlcjNAdGVzdC5ieSIsImlkIjo0fSwiaWF0IjoxNzA0ODk0NTg2LCJleHAiOjE3MDQ4OTgxODZ9.jnV1FXB6OvEkqXbjLF2UOthQebEEhmLP3sLIq_FIXl4', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMyIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMyIsImVtYWlsIjoidXNlcjNAdGVzdC5ieSIsImlkIjo0fSwiaWF0IjoxNzA0ODk0NTg2LCJleHAiOjE3MDQ5ODA5ODZ9.4RNRCfrv8bY07VvL12_eO4tuUD0b0sVv5BIxG0LuVP4', '::ffff:127.0.0.1', '{"device_model":"Thunder","device_type":"smartphone"}', false, '2024-01-10 13:49:46.945', '2024-01-10 13:49:46.945');
INSERT INTO public.session VALUES (2, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1NjM0MiwiZXhwIjoxNzA0OTU2MzU3fQ.YhnevUz8vA8QdwXMMbtuy0PTJ7dfamUedDzZI2XPkaI', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1NjM0MiwiZXhwIjoxNzA0OTU2NDYyfQ.PY-ASf9kgGwIWTodG35t3R3TZ8_EYqigyKztaDXxmjY', '::ffff:127.0.0.1', '{"device_model":"Thunder","device_type":"smartphone"}', true, '2024-01-11 06:59:02.413', '2024-01-11 07:02:18.751');
INSERT INTO public.session VALUES (3, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1NjUzOCwiZXhwIjoxNzA0OTU2NTUzfQ.6lm2t-pSgQGAq-aVdI_va730yPKAs6KqnwvnpxrBWog', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1NjUzOCwiZXhwIjoxNzA0OTU2NjU4fQ.JKWn9lddRukd_2HINVSgqpUvX6Uh5exBmsKtv7OoIk8', '::ffff:127.0.0.1', '{"device_model":"Thunder","device_type":"smartphone"}', true, '2024-01-11 07:02:18.79', '2024-01-11 07:03:27.59');
INSERT INTO public.session VALUES (4, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1NjYwNywiZXhwIjoxNzA0OTU2NjIyfQ.UKH9KsIHyeeJ_TL6KgiP3IlxYJxU6J5D1EJZuJJHJ7k', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1NjYwNywiZXhwIjoxNzA0OTU2NzI3fQ.c769Q_-jIxRU10Nnx9eqIbZ9iI42ASXUqSOrGij3QtE', '::ffff:127.0.0.1', '{"device_model":"Thunder","device_type":"smartphone"}', true, '2024-01-11 07:03:27.603', '2024-01-11 07:06:03.938');
INSERT INTO public.session VALUES (5, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1Njc2MywiZXhwIjoxNzA0OTU2Nzc4fQ.PW2UdTNzWq23eDvMN-iHk5uNf0w1ZL-MunVS-9-vZfk', 'Bearer:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1Njc2MywiZXhwIjoxNzA0OTU2ODgzfQ.UIE35UaSB-Pcxq7PkouzyGeNGxrhKJwPZhAwo_iinTU', '::ffff:127.0.0.1', '{"device_model":"Thunder","device_type":"smartphone"}', true, '2024-01-11 07:06:03.958', '2024-01-11 07:07:22.554');
INSERT INTO public.session VALUES (6, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1Njg0MiwiZXhwIjoxNzA0OTU2ODU3fQ.ctLBtajJdZEuFMIE2nRlsp0E4xDStiHHY9_cHNovtLc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1Njg0MiwiZXhwIjoxNzA0OTU2OTYyfQ.GASZr3tN7iSK-amJbUCn2oi6XrJBrn35nfpRAni5a70', '::ffff:127.0.0.1', '{"device_model":"Thunder","device_type":"smartphone"}', true, '2024-01-11 07:07:22.563', '2024-01-11 07:09:42.514');
INSERT INTO public.session VALUES (8, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzE0NCwiZXhwIjoxNzA0OTY0MDQ0fQ.jqAUyrXRg4AKZhoTrXhRJmR2TjvDDgS0qYmNOkaZn3I', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzE0NCwiZXhwIjoxNzA1MTM1OTQ0fQ.sw-f2rx1V8zadJjsRIFSwmSWn3FPIB7aidB8YkWuz1Q', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 08:52:27.037', '2024-01-11 08:55:29.529');
INSERT INTO public.session VALUES (9, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzMyOSwiZXhwIjoxNzA0OTY0MjI5fQ.vTwlSUGepiL0VL7cfV2igDx4dW14CQGP6c1ghJ_Gnko', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzMyOSwiZXhwIjoxNzA1MTM2MTI5fQ.7pnRYGpSWJi7fl0fM_CrrCzWFNbDg0zaKE_RV63cXqk', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 08:55:29.538', '2024-01-11 08:59:40.378');
INSERT INTO public.session VALUES (10, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzU4MCwiZXhwIjoxNzA0OTY0NDgwfQ.JR4SkQpMtSxDjTIUJbWOqYEPSNXlsTJQGThvf-J-_M4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzU4MCwiZXhwIjoxNzA1MTM2MzgwfQ.ziy8S29G5PNc_Ks_1QkQB8N1dDToE6YT5oVjqzoSiKU', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 08:59:40.418', '2024-01-11 09:00:16.792');
INSERT INTO public.session VALUES (11, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzYxNiwiZXhwIjoxNzA0OTY0NTE2fQ.NJsJnJMtRZBYcv3_iU0-2PUz6DVSkK8rgrrGJA6HHRM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzYxNiwiZXhwIjoxNzA1MTM2NDE2fQ.0hjS3qwOV-s-8L-9_PkGAiXibXGCC5jOa6BePuS9Rwg', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 09:00:16.819', '2024-01-11 09:01:49.904');
INSERT INTO public.session VALUES (7, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1Njk4MiwiZXhwIjoxNzA0OTU2OTk3fQ.pDRPQWKgB41LbfpTR-7d_kxYYy5djb0wmLfUfloaGKs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk1Njk4MiwiZXhwIjoxNzA0OTU3MTAyfQ.pWhlJOfwi-r3KFLCp_EMPy_0vjr2dgnjgXw09s66LH8', '::ffff:127.0.0.1', '{"device_model":"Thunder","device_type":"smartphone"}', true, '2024-01-11 07:09:42.577', '2024-01-17 12:04:09.062');
INSERT INTO public.session VALUES (12, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzcwOSwiZXhwIjoxNzA0OTY0NjA5fQ.uj86vCJAzy1ESIANKT6VribVSEaNinB4DQ1jYGZdLg8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk2MzcwOSwiZXhwIjoxNzA1MTM2NTA5fQ.sgTSlZ5PkTzmLppk3SlmfmmTxIj2ulIB4CigqUaUn24', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 09:01:49.936', '2024-01-11 11:46:14.901');
INSERT INTO public.session VALUES (13, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3MzU3NCwiZXhwIjoxNzA0OTc0NDc0fQ.30EdeCbpPSfj6XsJlUE_NDNhVbtdkg-yr2f6ObZCFOc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3MzU3NCwiZXhwIjoxNzA1MTQ2Mzc0fQ.hYgSSTv7zRDeHAc3fVh7fel-F8CliewHK0Yjw6OudMU', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 11:46:14.938', '2024-01-11 12:01:23.109');
INSERT INTO public.session VALUES (14, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDQ4MywiZXhwIjoxNzA0OTc1MzgzfQ.gL7D4d4GBbGWdXkLKM-ZLoHPN8_2c-xn5YOusXWp0xo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDQ4MywiZXhwIjoxNzA1MTQ3MjgzfQ.LTdM7RSYK_sgvlOH99R87nL2-RPXMvIDk0NGd891gtc', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:01:23.134', '2024-01-11 12:02:38.328');
INSERT INTO public.session VALUES (15, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDU1OCwiZXhwIjoxNzA0OTc1NDU4fQ.ArygVrKm8ylwbX820qWp5R0mS8nFy1dOIWEmtl80Nag', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDU1OCwiZXhwIjoxNzA1MTQ3MzU4fQ.dWTD8IAS4j-rdCgatjUuMgtTDWCebOffJQxclNR9qqA', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:02:38.358', '2024-01-11 12:03:17.127');
INSERT INTO public.session VALUES (16, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDU5NywiZXhwIjoxNzA0OTc1NDk3fQ.R5IEuR9XhlbIT_2aU628TBv6kf_I9YTqoqDmuF6igN8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDU5NywiZXhwIjoxNzA1MTQ3Mzk3fQ.N8WtwfUEaYjWj8Q2O7N2C5hCecatHtxoZJvwnnDO8HI', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:03:17.151', '2024-01-11 12:03:57.72');
INSERT INTO public.session VALUES (17, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDYzNywiZXhwIjoxNzA0OTc1NTM3fQ.npOwN80m1Ol5u4t4ztRYEiQo3cV4zlXTz_e_dNmgdYg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDYzNywiZXhwIjoxNzA1MTQ3NDM3fQ.FqmRLcjGM2_PfKC6VcXVhx9f7Uu62_4aVN_VYeKzLmw', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:03:57.74', '2024-01-11 12:05:36.761');
INSERT INTO public.session VALUES (18, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDcxMywiZXhwIjoxNzA0OTc1NjEzfQ.AQZC-kwQG1F_RhdV2ZALdy7slToUa_WcRAhsE-SbbL4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDcxOCwiZXhwIjoxNzA1MTQ3NTE4fQ.U4-7aylU8vSGZXA4Caaaec5VGL8WwLzV31aJ42cHw5Y', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:05:53.745', '2024-01-11 12:06:18.63');
INSERT INTO public.session VALUES (19, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDc3OCwiZXhwIjoxNzA0OTc1Njc4fQ.6VBdE83lQmg4IwLRAVKVq6ba257JkXrv_CBKHIfyJD0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDc3OCwiZXhwIjoxNzA1MTQ3NTc4fQ.2AS5STHSxW3lDgeJGSCma8fsYGbEFR1Bs9vjXooizCo', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:06:18.653', '2024-01-11 12:07:33.888');
INSERT INTO public.session VALUES (20, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDg1MywiZXhwIjoxNzA0OTc1NzUzfQ.bGwWaJ8BMJhiPdMMjJm0vPd4sz-FLA9VWvULWQ8QiKM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NDg1MywiZXhwIjoxNzA1MTQ3NjUzfQ.z8CXiuOPvrDQemAGgZQnaCuIwIO1TIpqcjR1vNfPO4E', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:07:33.93', '2024-01-11 12:37:31.458');
INSERT INTO public.session VALUES (21, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NjY1MSwiZXhwIjoxNzA0OTc3NTUxfQ.H13UIr-XceIdcSvqKSFbUre32KvCoGQqe0a6cebkw-s', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NjY1MSwiZXhwIjoxNzA1MTQ5NDUxfQ.y8Wl_KUMiJsnxWCBWv-g_OOg8MI4amOautY9cLLwREM', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:37:31.48', '2024-01-11 12:46:45.305');
INSERT INTO public.session VALUES (22, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzIwNSwiZXhwIjoxNzA0OTc4MTA1fQ.7k6bj-eGtUieBGa1QPI84Qh555RN9PYxJo-C06UqafI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzIwNSwiZXhwIjoxNzA1MTUwMDA1fQ.ZmUR2kC7OoqmYjqAwW-8YwIWe6nPUTt-oPNPMzGzcG0', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:46:45.33', '2024-01-11 12:48:16.02');
INSERT INTO public.session VALUES (23, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzI5NiwiZXhwIjoxNzA0OTc4MTk2fQ.x12pozgmg7vuNrdWjr-ARR1eQdxDK-lEa-4tinu0Mz4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzI5NiwiZXhwIjoxNzA1MTUwMDk2fQ.UvgTP1fusH_tX4u4iPbbs5RHgtEFPRkXivdh-W539Fc', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:48:16.033', '2024-01-11 12:49:11.775');
INSERT INTO public.session VALUES (24, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzM1MSwiZXhwIjoxNzA0OTc4MjUxfQ.45rJjbwRtIeyiywfoKWf8p_FMzsooMvvjg5HJdT98vY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzM1MSwiZXhwIjoxNzA1MTUwMTUxfQ.BIB-_vCCBWOtazpYAzzMAxUAWXOxz_RxI62ag64P9eg', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:49:11.875', '2024-01-11 12:50:37.54');
INSERT INTO public.session VALUES (25, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzQzNywiZXhwIjoxNzA0OTc4MzM3fQ.yf0CRMr6NxyWSt-oHFqdvjWOr50KT0Ovy9QiQITF56U', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzQzNywiZXhwIjoxNzA1MTUwMjM3fQ.Am21tlFBcmlcrHF_87aC-0v17qU6ZiqNjQ0bKItwSCA', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:50:37.565', '2024-01-11 12:51:32.247');
INSERT INTO public.session VALUES (26, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzQ5MiwiZXhwIjoxNzA0OTc4MzkyfQ.9kdx2ki-G3L2vUtnxWOOeQvsqjc-KxTZUkp4kcTRKyA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzQ5MiwiZXhwIjoxNzA1MTUwMjkyfQ.F_EjO28Wpv9dvuoilmU_A4efCI7ftY5HaCetUdQsOcg', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:51:32.271', '2024-01-11 12:52:01.766');
INSERT INTO public.session VALUES (27, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzUyMSwiZXhwIjoxNzA0OTc4NDIxfQ.15xyWX8QejWAHiebzGtggy5CCBhSQoBUTEnB-yV5Bjk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzUyMSwiZXhwIjoxNzA1MTUwMzIxfQ.Xr4BXXIuMS6cvI6RBk3Fb5MsyL3FB1kK4nwKarZT4jA', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:52:01.775', '2024-01-11 12:52:28.03');
INSERT INTO public.session VALUES (28, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzU0OCwiZXhwIjoxNzA0OTc4NDQ4fQ.8e7ZTYcXhzME2fmkEGY_hwUNcz2eu1_S9GFDiWAcPMI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzU0OCwiZXhwIjoxNzA1MTUwMzQ4fQ.L3CJScPo11qByCrVu3bJx57WpbkIoDofVYUKBtlIhZI', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:52:28.052', '2024-01-11 12:53:41.42');
INSERT INTO public.session VALUES (29, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzYyMSwiZXhwIjoxNzA0OTc4NTIxfQ.hoNwkrXz2ZXbOGuUm82k63XmvoVakz7MxEXhFmceXBc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzYyMSwiZXhwIjoxNzA1MTUwNDIxfQ.hMs7pEHckTzDCY8Ezhm2WGJE0N30RpSPltLELLJ4ZJ0', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:53:41.445', '2024-01-11 12:54:22.265');
INSERT INTO public.session VALUES (30, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzY2MiwiZXhwIjoxNzA0OTc4NTYyfQ.bjmJ7FgnFgZ9K77_Q5tNsLqTK4Ox3QcWbCMDXcourao', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzY2MiwiZXhwIjoxNzA1MTUwNDYyfQ.vdXI3OFks1SyMBOK1P0pNmCakxOK5f8BscvvBJRfaVI', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:54:22.278', '2024-01-11 12:55:03.496');
INSERT INTO public.session VALUES (31, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzcwMywiZXhwIjoxNzA0OTc4NjAzfQ.wDQkJ5TKEFRIHHTV4DngBTua7Quzome5DuVQEPnN0Mk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzcwMywiZXhwIjoxNzA1MTUwNTAzfQ.JRuhyI8IamwNE5QNguziPV8Gg-RTwG4nOtpKkEMts6U', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:55:03.519', '2024-01-11 12:55:13.396');
INSERT INTO public.session VALUES (32, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzcxMywiZXhwIjoxNzA0OTc4NjEzfQ.7JYcTziaKZ26fcU7rHNufNW7Ix4lvvw0gLSRy9lGMtg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzcxMywiZXhwIjoxNzA1MTUwNTEzfQ.y-n3KQf3QmqlIHuKVIB9sNZfbbpf5oNWyLgMArpEK3M', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:55:13.421', '2024-01-11 12:58:51.374');
INSERT INTO public.session VALUES (33, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzkzMSwiZXhwIjoxNzA0OTc4ODMxfQ.8nMEaDbn-iX41jcSIssnRUMG3eeLtS4hCYuchObamdc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNDk3NzkzMSwiZXhwIjoxNzA1MTUwNzMxfQ.W2fQ15PzZtPAJuS16NJtKvYFCto8kX9jkPmAkp5BKLQ', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-11 12:58:51.397', '2024-01-12 11:27:09.436');
INSERT INTO public.session VALUES (34, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTA1ODgyOSwiZXhwIjoxNzA1MDU4ODg5fQ.ZFljlcjm3YwMNIE_SPoeUEi5QSJ3i3yzgtRWteqebWs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTA1ODgyOSwiZXhwIjoxNzA1MjMxNjI5fQ.qmTR2huOUjPHGK4oIIWPhL6LVqWz9FS060A0WtFPWVo', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-12 11:27:09.56', '2024-01-15 08:32:00.66');
INSERT INTO public.session VALUES (35, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTMwNzUyMCwiZXhwIjoxNzA1MzA3NTgwfQ.yWUEXo81BeXBv9Ejf1C3AqewRFjsYwckn1-F19arvAs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTMwNzUyMCwiZXhwIjoxNzA1NDgwMzIwfQ.js_LZmW_Cn0RgIb9uUwVOAWfoMWCfa3QA99hqGucr1A', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-15 08:32:00.803', '2024-01-17 12:03:28.342');
INSERT INTO public.session VALUES (36, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NDgyNTkwLCJleHAiOjE3MDU0ODI2NTB9.AbEh8Ca-rPGlYPqsQycveuCPrHGPWPVr_3vJcPW9Lso', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NDgyNTkwLCJleHAiOjE3MDU2NTUzOTB9.w_jfrjaACeWx4NN8E2P3D7QtEPz0NTm8K7IqBkT6iG8', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-17 09:09:50.144', '2024-01-17 12:46:57.299');
INSERT INTO public.session VALUES (38, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NDk1NjE3LCJleHAiOjE3MDU0OTU2Nzd9.uoSI5QOIJ1I4hBC3dqFD2oqg9X3Kv1UJPRV3dmYvkL8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NDk1NjE3LCJleHAiOjE3MDU2Njg0MTd9.rcAtXESJgI33onye6y7hG7x8fcAQ5mhflWPf7EztJi8', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-17 12:46:57.312', '2024-01-17 13:13:47.986');
INSERT INTO public.session VALUES (39, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NDk3MjI3LCJleHAiOjE3MDU0OTcyODd9.85l_GQuH8Nw_uj8mLTRtdXlAEnLFFo-lPDNGAgVVQr4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NDk3MjI3LCJleHAiOjE3MDU2NzAwMjd9.uTAyMv2qtiD-Igiskuwz66ecnJ3BcF0h9hoG4ZLXG-s', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-17 13:13:48.009', '2024-01-18 07:49:08.161');
INSERT INTO public.session VALUES (40, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NTY0MTQ4LCJleHAiOjE3MDU1NjQyMDh9.G-3ZG-BMHmhwyXDi--bffX7AZ6e0AM2mYHa9hmQNxyM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NTY0MTQ4LCJleHAiOjE3MDU3MzY5NDh9.AUraeHbTYJzzUkfF1-tnd3tSYYFaoz3_qrn8FT_026U', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-18 07:49:08.184', '2024-01-18 07:55:04.334');
INSERT INTO public.session VALUES (37, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTQ5NTU3NCwiZXhwIjoxNzA1NDk1NjM0fQ.a_SbL8jSXqwfzSKBxZLjgZnenARZCeWw452_gj_zmRY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTQ5NTU3NCwiZXhwIjoxNzA1NjY4Mzc0fQ.O5yaOE1sZripllLlMEGaU6JZmB6JdEBKCEsgGVUxXqQ', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-17 12:46:14.918', '2024-01-18 08:54:07.579');
INSERT INTO public.session VALUES (41, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NTY0NTA0LCJleHAiOjE3MDU1NjQ1NjR9.cT6sPm03RafjyLkk0i9u3uNRQNO2xgokxSgHMqCny5k', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NTY0NTA0LCJleHAiOjE3MDU3MzczMDR9.KLQoIx9ZuWy4BVcHm9ESLFWjQEn8944IALhgbtvgGmo', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-18 07:55:04.349', '2024-01-19 06:15:19.611');
INSERT INTO public.session VALUES (43, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NjQ0OTE5LCJleHAiOjE3MDU2NDQ5Nzl9.T9PWuZ-QazILpZU02E6zlGR0AbSb8ADovgL746UKfDw', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NjQ0OTE5LCJleHAiOjE3MDU4MTc3MTl9.0p2aA3m0iNLxktxZJuKNsAqbiNOsaYEJmTirtGBlEEs', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-19 06:15:19.716', '2024-01-19 06:20:59.773');
INSERT INTO public.session VALUES (42, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTU2ODA0NywiZXhwIjoxNzA1NTY4MTA3fQ.OphewEOrsg3bNPxBL3An0pi3Eb8gnhwmvod5Mzq2ijU', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTU2ODA0NywiZXhwIjoxNzA1NzQwODQ3fQ.9nolNT-OBep6uGCDdng809h07pQdHZHF_hUGjKRq9-o', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-18 08:54:07.603', '2024-01-22 06:39:28.5');
INSERT INTO public.session VALUES (44, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NjQ1MjU5LCJleHAiOjE3MDU2NDUzMTl9.u65-EK_h1mINDwrTra6I61f0QP_DKMFKlTnM_8VnyLI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1NjQ1MjU5LCJleHAiOjE3MDU4MTgwNTl9.uCheJUYYuwxwoEsyMdVMF9LpFOykPr-zlCj9fJ_71hk', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-19 06:20:59.816', '2024-01-22 06:41:35.349');
INSERT INTO public.session VALUES (46, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1OTA1Njk1LCJleHAiOjE3MDU5MDU3NTV9.krVYv8qOp2Ey8tDpEk7LMpPOJ40_Frz3NE0zFMOo9H8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1OTA1Njk1LCJleHAiOjE3MDYwNzg0OTV9.CQ1xknEy4LFLPwxeRUkhmN6pc5Y-uU_KcF8TewSE9eE', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-22 06:41:35.368', '2024-01-22 12:59:10.753');
INSERT INTO public.session VALUES (45, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTkwNTY1MSwiZXhwIjoxNzA1OTA1NzExfQ.y9VGUyupVx8-hRYGhp0x31s78wSS4RvWG5eZ5pteojg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNTkwNTY1MSwiZXhwIjoxNzA2MDc4NDUxfQ.gZd2DPv3gJqXLdO2mzKW4BwpCTZcmG91gn_twY_KtCE', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-22 06:40:51.991', '2024-01-26 06:47:15.779');
INSERT INTO public.session VALUES (48, 1, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNjI1MTY2MywiZXhwIjoxNzA2MjUxNzIzfQ.IGbyiVGdXnvxj9d1K3ZvFqDNHKUQc1G1ROVmCxG2HkU', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QiLCJmaXJzdF9uYW1lIjoiYWRtaW4iLCJsb2dpbiI6ImFkbWluIiwiZW1haWwiOiJzb21lQHRlc3QuYnkiLCJpZCI6MX0sImlhdCI6MTcwNjI1MTY2MywiZXhwIjoxNzA2NDI0NDYzfQ.vWtPQI-l8QYqPxUDFbVMcwtECimaO4lIhaN-SSsFE6A', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', false, '2024-01-26 06:47:43.071', '2024-01-26 06:47:43.071');
INSERT INTO public.session VALUES (47, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1OTI4MzUwLCJleHAiOjE3MDU5Mjg0MTB9.38BWZtHPUgyRQJMCaw2vKTrrumbQHpaRrSaD7jG0fxU', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA1OTI4MzUwLCJleHAiOjE3MDYxMDExNTB9.Un38Jzr-EsAZuYXoh8zi3Pu9aR4NrFc_8_lsKXFRgRw', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', true, '2024-01-22 12:59:10.801', '2024-01-26 06:52:51.131');
INSERT INTO public.session VALUES (49, 3, 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA2MjUxOTcxLCJleHAiOjE3MDYyNTIwMzF9.Ru7FxpLKV2NvM1ajL6oouVs9WzUBquYur7UrHRqxFMA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Imxhc3RfbmFtZSI6InRlc3QgMiIsImZpcnN0X25hbWUiOiJ1c2VyIiwibG9naW4iOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAdGVzdC5ieSIsImlkIjozfSwiaWF0IjoxNzA2MjUxOTcxLCJleHAiOjE3MDY0MjQ3NzF9.8xQgr-OQaNUFnpEc3Nh3342bakpupeNttqu7uNjnClE', '::1', '{"device_model":"","device_type":"desktop","client_type":"browser","client_name":"Chrome"}', false, '2024-01-26 06:52:51.27', '2024-01-26 06:52:51.27');


--
-- TOC entry 3354 (class 0 OID 25226)
-- Dependencies: 211
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."user" VALUES (1, 'some@test.by', 'admin', '$argon2id$v=19$m=65536,t=3,p=4$anNmNWY0ZXIzZHM0ZjIoNTQyNTZocWFzZHU2KjIwcSMlIWhxKCozKCohJiVHRFdLSDIz$S7EDq6E5T49NKjtuYIuZgkHlTusASGuv8bmodfva14o', 'admin', NULL, 'test', NULL, NULL, '2024-01-10 07:29:32.914', '2024-01-10 07:29:32.914');
INSERT INTO public."user" VALUES (2, 'user@test.by', 'user', '$argon2id$v=19$m=65536,t=3,p=4$anNmNWY0ZXIzZHM0ZjIoNTQyNTZocWFzZHU2KjIwcSMlIWhxKCozKCohJiVHRFdLSDIz$S7EDq6E5T49NKjtuYIuZgkHlTusASGuv8bmodfva14o', 'user', NULL, 'test', NULL, NULL, '2024-01-10 07:30:07.783', '2024-01-10 07:30:07.783');
INSERT INTO public."user" VALUES (3, 'user2@test.by', 'user2', '$argon2id$v=19$m=65536,t=3,p=4$anNmNWY0ZXIzZHM0ZjIoNTQyNTZocWFzZHU2KjIwcSMlIWhxKCozKCohJiVHRFdLSDIz$S7EDq6E5T49NKjtuYIuZgkHlTusASGuv8bmodfva14o', 'user', NULL, 'test 2', NULL, NULL, '2024-01-10 07:33:33.087', '2024-01-10 07:33:33.087');
INSERT INTO public."user" VALUES (4, 'user3@test.by', 'user3', '$argon2id$v=19$m=65536,t=3,p=4$anNmNWY0ZXIzZHM0ZjIoNTQyNTZocWFzZHU2KjIwcSMlIWhxKCozKCohJiVHRFdLSDIz$S7EDq6E5T49NKjtuYIuZgkHlTusASGuv8bmodfva14o', 'user', NULL, 'test 3', NULL, NULL, '2024-01-10 07:33:54.686', '2024-01-10 07:33:54.686');


--
-- TOC entry 3362 (class 0 OID 25268)
-- Dependencies: 219
-- Data for Name: user_chat; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.user_chat VALUES (1, 1, 1, false, '2024-01-10 13:52:40.574', '2024-01-10 13:52:40.574');
INSERT INTO public.user_chat VALUES (2, 1, 3, false, '2024-01-10 13:52:40.574', '2024-01-10 13:52:40.574');
INSERT INTO public.user_chat VALUES (3, 2, 1, false, '2024-01-10 13:52:46.127', '2024-01-10 13:52:46.127');
INSERT INTO public.user_chat VALUES (4, 2, 2, false, '2024-01-10 13:52:46.127', '2024-01-10 13:52:46.127');
INSERT INTO public.user_chat VALUES (5, 3, 1, false, '2024-01-10 13:52:49.732', '2024-01-10 13:52:49.732');
INSERT INTO public.user_chat VALUES (6, 3, 4, false, '2024-01-10 13:52:49.732', '2024-01-10 13:52:49.732');
INSERT INTO public.user_chat VALUES (7, 4, 1, false, '2024-01-10 13:53:09.186', '2024-01-10 13:53:09.186');
INSERT INTO public.user_chat VALUES (8, 4, 4, false, '2024-01-10 13:53:09.186', '2024-01-10 13:53:09.186');
INSERT INTO public.user_chat VALUES (9, 4, 2, false, '2024-01-10 13:53:09.186', '2024-01-10 13:53:09.186');


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 216
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.chat_id_seq', 4, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 214
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.message_id_seq', 33, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 212
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.session_id_seq', 49, true);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_chat_id_seq', 9, true);


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 210
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


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


-- Completed on 2024-02-15 17:34:40

--
-- PostgreSQL database dump complete
--

