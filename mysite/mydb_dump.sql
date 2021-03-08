--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO zaikadaria;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO zaikadaria;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO zaikadaria;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO zaikadaria;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO zaikadaria;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO zaikadaria;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO zaikadaria;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO zaikadaria;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO zaikadaria;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO zaikadaria;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO zaikadaria;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO zaikadaria;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blog_author; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.blog_author (
    id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.blog_author OWNER TO zaikadaria;

--
-- Name: blog_category; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.blog_category (
    id integer NOT NULL,
    cat_name character varying(20) NOT NULL
);


ALTER TABLE public.blog_category OWNER TO zaikadaria;

--
-- Name: blog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.blog_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_category_id_seq OWNER TO zaikadaria;

--
-- Name: blog_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.blog_category_id_seq OWNED BY public.blog_category.id;


--
-- Name: blog_comment; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.blog_comment (
    id integer NOT NULL,
    content text NOT NULL,
    created timestamp with time zone NOT NULL,
    commentator_id integer NOT NULL,
    post_id integer NOT NULL,
    status boolean NOT NULL,
    content_type_id integer,
    email character varying(254) NOT NULL
);


ALTER TABLE public.blog_comment OWNER TO zaikadaria;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.blog_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_comment_id_seq OWNER TO zaikadaria;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.blog_comment_id_seq OWNED BY public.blog_comment.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.blog_post (
    id integer NOT NULL,
    title text NOT NULL,
    author_id integer NOT NULL,
    article text NOT NULL,
    pub_date timestamp with time zone,
    category_id integer
);


ALTER TABLE public.blog_post OWNER TO zaikadaria;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.blog_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_id_seq OWNER TO zaikadaria;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.blog_post_id_seq OWNED BY public.blog_post.id;


--
-- Name: blog_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.blog_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_user_id_seq OWNER TO zaikadaria;

--
-- Name: blog_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.blog_user_id_seq OWNED BY public.blog_author.id;


--
-- Name: comment_comment; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.comment_comment (
    id integer NOT NULL,
    content text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    commentator_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.comment_comment OWNER TO zaikadaria;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.comment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_comment_id_seq OWNER TO zaikadaria;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.comment_comment_id_seq OWNED BY public.comment_comment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO zaikadaria;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO zaikadaria;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO zaikadaria;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO zaikadaria;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO zaikadaria;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO zaikadaria;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO zaikadaria;

--
-- Name: polls_choice; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.polls_choice (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    votes integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.polls_choice OWNER TO zaikadaria;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.polls_choice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_choice_id_seq OWNER TO zaikadaria;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.polls_choice_id_seq OWNED BY public.polls_choice.id;


--
-- Name: polls_question; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.polls_question (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE public.polls_question OWNER TO zaikadaria;

--
-- Name: polls_question_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.polls_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_question_id_seq OWNER TO zaikadaria;

--
-- Name: polls_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.polls_question_id_seq OWNED BY public.polls_question.id;


--
-- Name: userdata_profile; Type: TABLE; Schema: public; Owner: zaikadaria
--

CREATE TABLE public.userdata_profile (
    id integer NOT NULL,
    img character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.userdata_profile OWNER TO zaikadaria;

--
-- Name: userdata_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: zaikadaria
--

CREATE SEQUENCE public.userdata_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userdata_profile_id_seq OWNER TO zaikadaria;

--
-- Name: userdata_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zaikadaria
--

ALTER SEQUENCE public.userdata_profile_id_seq OWNED BY public.userdata_profile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_author id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_author ALTER COLUMN id SET DEFAULT nextval('public.blog_user_id_seq'::regclass);


--
-- Name: blog_category id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_category ALTER COLUMN id SET DEFAULT nextval('public.blog_category_id_seq'::regclass);


--
-- Name: blog_comment id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_comment ALTER COLUMN id SET DEFAULT nextval('public.blog_comment_id_seq'::regclass);


--
-- Name: blog_post id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_post ALTER COLUMN id SET DEFAULT nextval('public.blog_post_id_seq'::regclass);


--
-- Name: comment_comment id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.comment_comment ALTER COLUMN id SET DEFAULT nextval('public.comment_comment_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: polls_choice id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.polls_choice ALTER COLUMN id SET DEFAULT nextval('public.polls_choice_id_seq'::regclass);


--
-- Name: polls_question id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.polls_question ALTER COLUMN id SET DEFAULT nextval('public.polls_question_id_seq'::regclass);


--
-- Name: userdata_profile id; Type: DEFAULT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.userdata_profile ALTER COLUMN id SET DEFAULT nextval('public.userdata_profile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add question	1	add_question
2	Can change question	1	change_question
3	Can delete question	1	delete_question
4	Can view question	1	view_question
5	Can add choice	2	add_choice
6	Can change choice	2	change_choice
7	Can delete choice	2	delete_choice
8	Can view choice	2	view_choice
9	Can add log entry	3	add_logentry
10	Can change log entry	3	change_logentry
11	Can delete log entry	3	delete_logentry
12	Can view log entry	3	view_logentry
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add content type	7	add_contenttype
26	Can change content type	7	change_contenttype
27	Can delete content type	7	delete_contenttype
28	Can view content type	7	view_contenttype
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
33	Can add post	9	add_post
34	Can change post	9	change_post
35	Can delete post	9	delete_post
36	Can view post	9	view_post
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add comment	11	add_comment
42	Can change comment	11	change_comment
43	Can delete comment	11	delete_comment
44	Can view comment	11	view_comment
45	Can add author	10	add_author
46	Can change author	10	change_author
47	Can delete author	10	delete_author
48	Can view author	10	view_author
49	Can add category	12	add_category
50	Can change category	12	change_category
51	Can delete category	12	delete_category
52	Can view category	12	view_category
53	Can add comment	13	add_comment
54	Can change comment	13	change_comment
55	Can delete comment	13	delete_comment
56	Can view comment	13	view_comment
57	Can add profile	14	add_profile
58	Can change profile	14	change_profile
59	Can delete profile	14	delete_profile
60	Can view profile	14	view_profile
61	Can add profile	15	add_profile
62	Can change profile	15	change_profile
63	Can delete profile	15	delete_profile
64	Can view profile	15	view_profile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$216000$eiaKQb7VmKeD$ZwUW3dcD6RuodAP0u1IY4lap5rc6clEeDNSHGvFDS7I=	2021-03-03 17:12:52.890098+00	t	zaikadaria	Daria	Zaika	dashazaika@gmil.com	t	t	2020-11-19 20:45:47+00
3	pbkdf2_sha256$216000$mblZCYd38EqD$ink0Ixe0OBt8tHQD5NM2lS19tqWbMFUDEengfqdpaH8=	\N	f				maria@somename.com	f	t	2020-12-09 11:17:13.050982+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	1
2	2	2
3	2	3
4	2	4
5	2	5
6	2	6
7	2	7
8	2	8
9	2	9
10	2	10
11	2	11
12	2	12
13	2	13
14	2	14
15	2	15
16	2	16
17	2	17
18	2	18
19	2	19
20	2	20
21	2	21
22	2	22
23	2	23
24	2	24
25	2	25
26	2	26
27	2	27
28	2	28
29	2	29
30	2	30
31	2	31
32	2	32
33	2	33
34	2	34
35	2	35
36	2	36
37	2	37
38	2	38
39	2	39
40	2	40
41	2	41
42	2	42
43	2	43
44	2	44
45	2	45
46	2	46
47	2	47
48	2	48
49	2	49
50	2	50
51	2	51
52	2	52
53	2	53
54	2	54
55	2	55
56	2	56
57	2	57
58	2	58
59	2	59
60	2	60
61	2	61
62	2	62
63	2	63
64	2	64
\.


--
-- Data for Name: blog_author; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.blog_author (id, user_id) FROM stdin;
8	2
\.


--
-- Data for Name: blog_category; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.blog_category (id, cat_name) FROM stdin;
3	Politics
2	Science
4	Technics
5	Music
6	History
\.


--
-- Data for Name: blog_comment; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.blog_comment (id, content, created, commentator_id, post_id, status, content_type_id, email) FROM stdin;
1	Some comment	2020-12-08 20:19:00.000689+00	8	2	t	9	dashazaika@gmail.com
13	test1	2021-01-18 16:30:54.791328+00	8	3	f	\N	dashazaika@gmail.com
14	test2	2021-01-18 16:48:36.83355+00	8	3	f	\N	dashazaika@gmail.com
15	test3	2021-01-18 17:19:15.089162+00	8	3	f	\N	dashazaika@gmail.com
\.


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.blog_post (id, title, author_id, article, pub_date, category_id) FROM stdin;
2	Django Blog	8	Django is an open-source web framework, written in Python, that follows the model-view-template architectural pattern. So Python is needed to be installed in your machine. Unfortunately, there was a significant update to Python several years ago that created a big split between Python versions namely Python 2 the legacy version and Python 3 the version in active development. \r\nSince Python 3 is the current version in active development and addressed as the future of Python, Django rolled out a significant update, and now all the releases after Django 2.0 are only compatible with Python 3.x. Therefore this tutorial is strictly for Python 3.x. Make sure you have Python 3 installed on your machine if not follow the below guides.	2020-11-26 14:30:52.510642+00	2
4	Politics Meaning	8	Politics (from Greek: Πολιτικά, politiká, 'affairs of the cities') is the set of activities that are associated with making decisions in groups, or other forms of power relations between individuals, such as the distribution of resources or status. The academic study of politics is referred to as political science.\r\nIt may be used positively in the context of a "political solution" which is compromising and non-violent, or descriptively as "the art or science of government", but also often carries a negative connotation. For example, abolitionist Wendell Phillips declared that "we do not play politics; anti-slavery is no half-jest with us." The concept has been defined in various ways, and different approaches have fundamentally differing views on whether it should be used extensively or limitedly, empirically or normatively, and on whether conflict or co-operation is more essential to it.	2020-11-26 14:33:39.351811+00	3
3	Discovery Techniques	8	When a team starts taking advantage of collaborative sessions, they can often feel a little daunting. Some teams struggle to know where to start, and some don’t feel all the bases are being covered. A collaborative session is an opportunity to really get into the meat of what a team needs to deliver as well as to understand what the value is. Therefore, teams need to spend time probing and questioning ideas to generate useful examples that can aid the team's understanding and guide delivery.\r\nagile testing methodologies\r\nWith this in mind, we created a ‘cheat sheet’ of different techniques that teams can use to learn more about their ideas, the requirements, and the examples. We’ve collated them into what we call ‘discovery cards’ that we use during the Hindsight BDD training course. Here, we want to share these reference 'cards' for techniques to get a conversation started, techniques that allow you to deep dive into ideas, and techniques that can help you generate alternative examples based on the ones you’ve already captured.\r\nFor this post, let’s take a look at how teams can quickly start exploring ideas.	2020-11-26 14:30:52.510642+00	4
9	Political risk concerns heightened by COVID-19	8	Aon’s Risk Maps 2020 reveal the world’s hotspots for risk related to political changes and instability\r\n\r\nAccording to Aon’s latest Risk Maps 2020, 19 countries currently have a very high rating when it comes to political risk. While the risk improved in some countries such as Cote d-Ivoire (from high to medium high), Mexico (from medium high to medium) and Pakistan (from very high to high), others such as Iran, the Maldives and Panama saw a deterioration – with Iran moving to very high risk.\r\n\r\nOf course, political risk isn’t confined to developing economies as China telecoms provider Huawei recently found out following a decision by the UK government to exclude the company from the UK’s 5G infrastructure, but COVID-19, politically motivated trade restrictions, political interference through government expropriation and contract change, and currency risk are all likely to have an impact on the levels of political risk in emerging and frontier markets in 2020; factors that businesses and investors will need to consider carefully when operating in these territories.\r\nThe pandemic impact\r\n\r\nPolitical risk tends to thrive in areas where, according to Aon’s Risk Maps 2020, political violence, institutional and regulatory risk and economic conditions allow it to build. The COVID-19 pandemic will have a major impact on all these subsets of risk not least as the global economy slows and even reverses, creating economic pressures.	2021-01-09 21:46:56.96256+00	3
\.


--
-- Data for Name: comment_comment; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.comment_comment (id, content, created_on, commentator_id, post_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-11-19 20:48:42.00326+00	1	daria	3		6	2
2	2020-11-21 21:14:52.164258+00	2	zaikadaria	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	2
3	2020-11-21 21:17:47.421759+00	2	zaikadaria	2	[]	6	2
4	2020-11-21 21:20:30.833279+00	8	zaikadaria	1	[{"added": {}}]	10	2
5	2020-11-21 21:20:56.566369+00	2	Django Blog	1	[{"added": {}}]	9	2
6	2020-11-21 21:21:10.455928+00	1	zaikadaria +  + Some comment	1	[{"added": {}}]	11	2
7	2020-11-21 21:30:43.522869+00	3	Some more article	1	[{"added": {}}]	9	2
8	2020-11-26 14:33:39.357011+00	4	{} Politics	1	[{"added": {}}]	9	2
9	2020-11-26 19:48:03.767524+00	5	{} Science	1	[{"added": {}}]	9	2
10	2020-11-27 14:09:30.369237+00	5	DNA facts zaikadaria	2	[{"changed": {"fields": ["Title", "Article"]}}]	9	2
11	2020-11-27 14:26:00.442614+00	5	DNA facts blog.Category.None	3		9	2
12	2020-11-27 14:40:51.456538+00	1	Sc	1	[{"added": {}}]	12	2
13	2020-11-27 14:41:15.039303+00	6	DNA facts blog.Category.None	1	[{"added": {}}]	9	2
14	2020-11-27 14:46:33.718811+00	6	DNA facts Sc	2	[{"changed": {"fields": ["Category"]}}]	9	2
15	2020-11-27 14:46:50.230154+00	2	Sc	1	[{"added": {}}]	12	2
16	2020-11-27 14:47:00.0681+00	1	Sc	3		12	2
17	2020-11-27 14:48:06.880826+00	3	Politics	1	[{"added": {}}]	12	2
18	2020-11-27 14:48:12.050213+00	2	Science	2	[{"changed": {"fields": ["Cat name"]}}]	12	2
19	2020-11-27 14:48:18.908716+00	4	Technics	1	[{"added": {}}]	12	2
20	2020-11-27 14:48:26.775694+00	5	Music	1	[{"added": {}}]	12	2
21	2020-11-27 14:48:34.292785+00	6	History	1	[{"added": {}}]	12	2
22	2020-11-27 14:50:12.111871+00	2	Django Blog Science	2	[{"changed": {"fields": ["Article", "Category"]}}]	9	2
23	2020-11-27 14:51:37.85098+00	4	Politics Meaning Politics	2	[{"changed": {"fields": ["Title", "Article", "Category"]}}]	9	2
24	2020-11-27 14:53:58.759751+00	3	Discovery Techniques (Technics)	2	[{"changed": {"fields": ["Title", "Article", "Category"]}}]	9	2
25	2020-11-27 14:57:04.478774+00	1	zaikadaria Amazing facts	2	[{"changed": {"fields": ["Comment text"]}}]	11	2
26	2020-12-08 20:19:00.007907+00	1	Comment 2020-12-08 20:19:00.000689+00:00 by zaikadaria	1	[{"added": {}}]	11	2
27	2020-12-08 20:51:04.534988+00	1	Comment 2020-12-08 20:19:00.000689+00:00 by zaikadaria	2	[{"changed": {"fields": ["Content type"]}}]	11	2
28	2021-01-10 13:20:16.20135+00	10	Political risk concerns heightened by COVID-19 (Politics)	3		9	2
29	2021-01-16 14:09:02.139433+00	2	Comment 2021-01-16 14:09:02.135538+00:00 by zaikadaria	1	[{"added": {}}]	11	2
30	2021-01-16 14:10:19.08915+00	2	Comment 2021-01-16 14:09:02.135538+00:00 by zaikadaria	2	[{"changed": {"fields": ["Status"]}}]	11	2
31	2021-01-16 14:10:23.369794+00	1	Comment 2020-12-08 20:19:00.000689+00:00 by zaikadaria	2	[{"changed": {"fields": ["Status"]}}]	11	2
32	2021-01-18 15:06:02.130267+00	1	Comment 2020-12-08 20:19:00.000689+00:00 by zaikadaria	2	[{"changed": {"fields": ["Email"]}}]	11	2
33	2021-01-18 15:11:22.685644+00	2	Comment 2021-01-16 14:09:02.135538+00:00 by zaikadaria	3		11	2
34	2021-01-18 15:55:10.491907+00	3	Comment 2021-01-18 14:09:02.946385+00:00 by zaikadaria	3		11	2
35	2021-01-18 15:55:10.494434+00	4	Comment 2021-01-18 14:10:59.382099+00:00 by zaikadaria	3		11	2
36	2021-01-18 15:55:10.49641+00	5	Comment 2021-01-18 15:18:23.618808+00:00 by zaikadaria	3		11	2
37	2021-01-18 15:55:10.498432+00	6	Comment 2021-01-18 15:45:43.985314+00:00 by zaikadaria	3		11	2
38	2021-01-18 15:55:10.500876+00	7	Comment 2021-01-18 15:47:25.147564+00:00 by zaikadaria	3		11	2
39	2021-01-18 15:55:10.503311+00	8	Comment 2021-01-18 15:52:14.505632+00:00 by zaikadaria	3		11	2
40	2021-01-18 16:18:25.523376+00	9	Comment 2021-01-18 15:58:54.221786+00:00 by zaikadaria	3		11	2
41	2021-01-18 16:18:25.527865+00	10	Comment 2021-01-18 16:00:08.188687+00:00 by zaikadaria	3		11	2
42	2021-01-18 16:18:25.531206+00	11	Comment 2021-01-18 16:04:43.217232+00:00 by zaikadaria	3		11	2
43	2021-01-18 16:18:25.534301+00	12	Comment 2021-01-18 16:16:45.356975+00:00 by zaikadaria	3		11	2
44	2021-01-19 19:26:17.238175+00	1	zaikadaria	1	[{"added": {}}]	14	2
45	2021-01-19 20:25:22.993017+00	1	zaikadaria	1	[{"added": {}}]	15	2
46	2021-01-19 20:26:17.04475+00	1	zaikadaria	3		15	2
47	2021-01-19 20:26:28.010805+00	2	zaikadaria	1	[{"added": {}}]	15	2
48	2021-01-19 20:31:46.232634+00	2	zaikadaria	2	[{"changed": {"fields": ["Img"]}}]	15	2
49	2021-02-15 16:09:39.406931+00	2	zaikadaria	2	[{"changed": {"fields": ["User permissions"]}}]	6	2
50	2021-02-15 18:59:56.044602+00	2	zaikadaria	2	[{"changed": {"fields": ["Img"]}}]	15	2
51	2021-02-15 19:00:15.934544+00	2	zaikadaria	2	[{"changed": {"fields": ["Img"]}}]	15	2
52	2021-02-15 19:04:19.197942+00	2	zaikadaria	2	[{"changed": {"fields": ["Img"]}}]	15	2
53	2021-02-15 19:07:22.86381+00	2	zaikadaria	2	[{"changed": {"fields": ["Img"]}}]	15	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	polls	question
2	polls	choice
3	admin	logentry
4	auth	permission
5	auth	group
6	auth	user
7	contenttypes	contenttype
8	sessions	session
9	blog	post
11	blog	comment
10	blog	author
12	blog	category
13	comment	comment
14	blog	profile
15	userdata	profile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-11-10 20:40:06.332747+00
2	auth	0001_initial	2020-11-10 20:40:06.381713+00
3	admin	0001_initial	2020-11-10 20:40:06.505348+00
4	admin	0002_logentry_remove_auto_add	2020-11-10 20:40:06.54754+00
5	admin	0003_logentry_add_action_flag_choices	2020-11-10 20:40:06.556867+00
6	contenttypes	0002_remove_content_type_name	2020-11-10 20:40:06.576072+00
7	auth	0002_alter_permission_name_max_length	2020-11-10 20:40:06.588392+00
8	auth	0003_alter_user_email_max_length	2020-11-10 20:40:06.598247+00
9	auth	0004_alter_user_username_opts	2020-11-10 20:40:06.611368+00
10	auth	0005_alter_user_last_login_null	2020-11-10 20:40:06.626472+00
11	auth	0006_require_contenttypes_0002	2020-11-10 20:40:06.630543+00
12	auth	0007_alter_validators_add_error_messages	2020-11-10 20:40:06.642023+00
13	auth	0008_alter_user_username_max_length	2020-11-10 20:40:06.661729+00
14	auth	0009_alter_user_last_name_max_length	2020-11-10 20:40:06.674524+00
15	auth	0010_alter_group_name_max_length	2020-11-10 20:40:06.688762+00
16	auth	0011_update_proxy_permissions	2020-11-10 20:40:06.69967+00
17	auth	0012_alter_user_first_name_max_length	2020-11-10 20:40:06.713115+00
18	polls	0001_initial	2020-11-10 20:40:06.734832+00
19	sessions	0001_initial	2020-11-10 20:40:06.758315+00
20	blog	0001_initial	2020-11-21 14:48:22.995452+00
21	blog	0002_auto_20201121_1654	2020-11-21 16:54:41.599289+00
22	blog	0003_auto_20201121_1923	2020-11-21 19:23:23.863358+00
23	blog	0004_auto_20201121_1940	2020-11-21 19:40:35.90041+00
24	blog	0005_auto_20201121_1947	2020-11-21 21:03:54.240832+00
25	blog	0006_auto_20201121_1957	2020-11-21 21:03:54.278576+00
26	blog	0007_auto_20201121_2000	2020-11-21 21:03:54.292028+00
27	blog	0008_auto_20201121_2001	2020-11-21 21:03:54.30234+00
28	blog	0009_remove_author_name	2020-11-21 21:03:54.309412+00
29	blog	0010_remove_comment_comment_text	2020-11-21 21:03:54.317657+00
30	blog	0011_auto_20201121_2103	2020-11-21 21:03:54.340405+00
31	blog	0012_comment_comment_text	2020-11-21 21:07:47.103787+00
32	blog	0013_auto_20201121_2116	2020-11-21 21:16:43.693518+00
33	blog	0014_auto_20201125_1605	2020-11-25 16:05:43.96074+00
34	blog	0015_post_pub_date	2020-11-26 14:30:52.519306+00
35	blog	0016_auto_20201127_1415	2020-11-27 14:15:10.974731+00
36	blog	0017_auto_20201127_1420	2020-11-27 14:20:59.454519+00
37	blog	0018_auto_20201127_1446	2020-11-27 14:46:20.106866+00
38	blog	0019_auto_20201127_1935	2020-11-27 19:35:14.236888+00
39	blog	0020_delete_comment	2020-12-05 18:06:33.525701+00
40	comment	0001_initial	2020-12-05 18:06:33.580459+00
41	blog	0021_comment	2020-12-07 19:00:26.087273+00
42	blog	0022_auto_20201208_2025	2020-12-08 20:26:03.641127+00
43	blog	0023_comment_content_type	2020-12-08 20:43:38.156775+00
44	blog	0023_auto_20210115_1511	2021-01-15 15:11:35.190646+00
45	blog	0024_comment_email	2021-01-18 12:57:52.806709+00
46	blog	0025_auto_20210118_1325	2021-01-18 13:25:05.199777+00
47	blog	0024_auto_20210119_1914	2021-01-19 19:14:49.387876+00
48	blog	0025_delete_profile	2021-01-19 19:48:38.4137+00
49	userdata	0001_initial	2021-01-19 19:48:38.437316+00
50	userdata	0002_auto_20210124_1112	2021-01-24 11:12:44.799557+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
hy6ze9gmk7q4ww6d47d56ehmxng8wrmk	.eJxVjMsOwiAUBf-FtSFAKRSX7v0GcuBepGpo0sfK-O_apAvdnpk5LxGxrTVuC89xJHEWRpx-t4T84LYDuqPdJpmnts5jkrsiD7rI60T8vBzu30HFUr-19gVQhbNRRXVZKxOSB9GAlKnXzpveWJdt6AbWPVlY5sAOSAGANuL9AfuGOKQ:1kjq27:B880Cme1kYaR6b6DE7ck4J5r0r3AiemhfaE6kChk4_k	2020-12-14 20:44:27.946646+00
z95knpl6dv1bjj1l4t6wt3ng0ngnj2pd	.eJxVjMsOwiAUBf-FtSFAKRSX7v0GcuBepGpo0sfK-O_apAvdnpk5LxGxrTVuC89xJHEWRpx-t4T84LYDuqPdJpmnts5jkrsiD7rI60T8vBzu30HFUr-19gVQhbNRRXVZKxOSB9GAlKnXzpveWJdt6AbWPVlY5sAOSAGANuL9AfuGOKQ:1kjqAf:9dQP3Iost2nEV8HUvfjAQs3hm1vFEivPHuNhW6IPnPQ	2020-12-14 20:53:17.137763+00
10d6695sexnsxq87lmh4u5ngker7e3bz	.eJxVjMsOwiAUBf-FtSFAKRSX7v0GcuBepGpo0sfK-O_apAvdnpk5LxGxrTVuC89xJHEWRpx-t4T84LYDuqPdJpmnts5jkrsiD7rI60T8vBzu30HFUr-19gVQhbNRRXVZKxOSB9GAlKnXzpveWJdt6AbWPVlY5sAOSAGANuL9AfuGOKQ:1kpHgo:XPR9ZjntBu5Dk1saNpkc5VHZMBmJ9ihS1lhc7RR07Wg	2020-12-29 21:16:58.521472+00
c9ujfw16tbrswq7cmx4mi06zq6rd8jdp	.eJxVjMsOwiAUBf-FtSFAKRSX7v0GcuBepGpo0sfK-O_apAvdnpk5LxGxrTVuC89xJHEWRpx-t4T84LYDuqPdJpmnts5jkrsiD7rI60T8vBzu30HFUr-19gVQhbNRRXVZKxOSB9GAlKnXzpveWJdt6AbWPVlY5sAOSAGANuL9AfuGOKQ:1ktBEl:C74h-Pg1v_j53pdMYC7K7tFEx_tkFgZOxEvePzad6QM	2021-01-09 15:12:07.880555+00
13114dv1dkh4a10cry2m5plvwaukxivn	e30:1l3dSl:wQOXrIUcmrLQEGKsmRW45Up_62mmQt6QMCnHU46o58c	2021-02-07 11:21:47.232767+00
cwj1zxee5czo4wlx6n03gkp0wczxab8v	e30:1l3dUz:N8_Ixksyn3HWlAhd8EkSXCrCo3WrgHr5CrISRknnfk8	2021-02-07 11:24:05.11915+00
7fkcr4o1gra9qckpeoak8ywa9n34azox	.eJxVjMsOwiAUBf-FtSFAKRSX7v0GcuBepGpo0sfK-O_apAvdnpk5LxGxrTVuC89xJHEWRpx-t4T84LYDuqPdJpmnts5jkrsiD7rI60T8vBzu30HFUr-19gVQhbNRRXVZKxOSB9GAlKnXzpveWJdt6AbWPVlY5sAOSAGANuL9AfuGOKQ:1l3dWS:5loZgyPcOVVfUhKjA4lq9p1Eh2kfdtnqcOsIztlRMEk	2021-02-07 11:25:36.045112+00
wdswue8q9rh4m0lj6rgp9qz10r7x6pf3	.eJxVjMsOwiAUBf-FtSFAKRSX7v0GcuBepGpo0sfK-O_apAvdnpk5LxGxrTVuC89xJHEWRpx-t4T84LYDuqPdJpmnts5jkrsiD7rI60T8vBzu30HFUr-19gVQhbNRRXVZKxOSB9GAlKnXzpveWJdt6AbWPVlY5sAOSAGANuL9AfuGOKQ:1lAFnD:tRDOORrl5TJBQu1wQZkc6lypGV478ePozz4ymD1OjGs	2021-02-25 17:30:15.013509+00
4gzzfc0dr578qxwxtq1wm1u5wsa7ixws	.eJxVjMsOwiAUBf-FtSFAKRSX7v0GcuBepGpo0sfK-O_apAvdnpk5LxGxrTVuC89xJHEWRpx-t4T84LYDuqPdJpmnts5jkrsiD7rI60T8vBzu30HFUr-19gVQhbNRRXVZKxOSB9GAlKnXzpveWJdt6AbWPVlY5sAOSAGANuL9AfuGOKQ:1lBg8V:lZJDYhQsvPkqecKSpXzYd184H0jq1g02D8ZFJXfzg0o	2021-03-01 15:50:07.501667+00
65a3jhwg3zexlz5lgft9v2p3d6svhpfm	.eJxVjMsOwiAUBf-FtSFAKRSX7v0GcuBepGpo0sfK-O_apAvdnpk5LxGxrTVuC89xJHEWRpx-t4T84LYDuqPdJpmnts5jkrsiD7rI60T8vBzu30HFUr-19gVQhbNRRXVZKxOSB9GAlKnXzpveWJdt6AbWPVlY5sAOSAGANuL9AfuGOKQ:1lHV3M:wHh2u-HGlgxR_-M6jEyr72jGT3s8ZoaCzhybtwMSDpQ	2021-03-17 17:12:52.894853+00
\.


--
-- Data for Name: polls_choice; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.polls_choice (id, choice_text, votes, question_id) FROM stdin;
2	The sky	0	1
1	Not much	1	1
\.


--
-- Data for Name: polls_question; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.polls_question (id, question_text, pub_date) FROM stdin;
1	What's up?	2020-11-12 14:03:52.765754+00
\.


--
-- Data for Name: userdata_profile; Type: TABLE DATA; Schema: public; Owner: zaikadaria
--

COPY public.userdata_profile (id, img, user_id) FROM stdin;
2	pictures/user_img/zaikadaria_iWjJC1v.JPEG	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 64, true);


--
-- Name: blog_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.blog_category_id_seq', 6, true);


--
-- Name: blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.blog_comment_id_seq', 15, true);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.blog_post_id_seq', 10, true);


--
-- Name: blog_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.blog_user_id_seq', 8, true);


--
-- Name: comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.comment_comment_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 53, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 50, true);


--
-- Name: polls_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.polls_choice_id_seq', 3, true);


--
-- Name: polls_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.polls_question_id_seq', 1, true);


--
-- Name: userdata_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zaikadaria
--

SELECT pg_catalog.setval('public.userdata_profile_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_author blog_author_user_id_key; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_author
    ADD CONSTRAINT blog_author_user_id_key UNIQUE (user_id);


--
-- Name: blog_category blog_category_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_category
    ADD CONSTRAINT blog_category_pkey PRIMARY KEY (id);


--
-- Name: blog_comment blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);


--
-- Name: blog_post blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: blog_author blog_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_author
    ADD CONSTRAINT blog_user_pkey PRIMARY KEY (id);


--
-- Name: comment_comment comment_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.comment_comment
    ADD CONSTRAINT comment_comment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: polls_choice polls_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.polls_choice
    ADD CONSTRAINT polls_choice_pkey PRIMARY KEY (id);


--
-- Name: polls_question polls_question_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.polls_question
    ADD CONSTRAINT polls_question_pkey PRIMARY KEY (id);


--
-- Name: userdata_profile userdata_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.userdata_profile
    ADD CONSTRAINT userdata_profile_pkey PRIMARY KEY (id);


--
-- Name: userdata_profile userdata_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.userdata_profile
    ADD CONSTRAINT userdata_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_comment_commentator_id_152d91a9; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX blog_comment_commentator_id_152d91a9 ON public.blog_comment USING btree (commentator_id);


--
-- Name: blog_comment_content_type_id_e26f0063; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX blog_comment_content_type_id_e26f0063 ON public.blog_comment USING btree (content_type_id);


--
-- Name: blog_comment_post_id_580e96ef; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX blog_comment_post_id_580e96ef ON public.blog_comment USING btree (post_id);


--
-- Name: blog_post_author_id_dd7a8485; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX blog_post_author_id_dd7a8485 ON public.blog_post USING btree (author_id);


--
-- Name: blog_post_category_id_c326dbf8; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX blog_post_category_id_c326dbf8 ON public.blog_post USING btree (category_id);


--
-- Name: comment_comment_commentator_id_c18e2a87; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX comment_comment_commentator_id_c18e2a87 ON public.comment_comment USING btree (commentator_id);


--
-- Name: comment_comment_post_id_357153e3; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX comment_comment_post_id_357153e3 ON public.comment_comment USING btree (post_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: polls_choice_question_id_c5b4b260; Type: INDEX; Schema: public; Owner: zaikadaria
--

CREATE INDEX polls_choice_question_id_c5b4b260 ON public.polls_choice USING btree (question_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_author blog_author_user_id_bedbc289_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_author
    ADD CONSTRAINT blog_author_user_id_bedbc289_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_commentator_id_152d91a9_fk_blog_author_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_commentator_id_152d91a9_fk_blog_author_id FOREIGN KEY (commentator_id) REFERENCES public.blog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_content_type_id_e26f0063_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_content_type_id_e26f0063_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_post_id_580e96ef_fk_blog_post_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_post_id_580e96ef_fk_blog_post_id FOREIGN KEY (post_id) REFERENCES public.blog_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post blog_post_author_id_dd7a8485_fk_blog_author_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_author_id_dd7a8485_fk_blog_author_id FOREIGN KEY (author_id) REFERENCES public.blog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post blog_post_category_id_c326dbf8_fk_blog_category_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_category_id_c326dbf8_fk_blog_category_id FOREIGN KEY (category_id) REFERENCES public.blog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comment_comment comment_comment_commentator_id_c18e2a87_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.comment_comment
    ADD CONSTRAINT comment_comment_commentator_id_c18e2a87_fk_auth_user_id FOREIGN KEY (commentator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comment_comment comment_comment_post_id_357153e3_fk_blog_post_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.comment_comment
    ADD CONSTRAINT comment_comment_post_id_357153e3_fk_blog_post_id FOREIGN KEY (post_id) REFERENCES public.blog_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_choice polls_choice_question_id_c5b4b260_fk_polls_question_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.polls_choice
    ADD CONSTRAINT polls_choice_question_id_c5b4b260_fk_polls_question_id FOREIGN KEY (question_id) REFERENCES public.polls_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userdata_profile userdata_profile_user_id_de89e66b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zaikadaria
--

ALTER TABLE ONLY public.userdata_profile
    ADD CONSTRAINT userdata_profile_user_id_de89e66b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

