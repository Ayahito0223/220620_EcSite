--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SJIS';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO ecsiteadmin;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO ecsiteadmin;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO ecsiteadmin;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO ecsiteadmin;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: accounts_customuser; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.accounts_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    created date NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    address character varying(30) NOT NULL,
    tel character varying(30) NOT NULL
);


ALTER TABLE public.accounts_customuser OWNER TO ecsiteadmin;

--
-- Name: accounts_customuser_groups; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.accounts_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_groups OWNER TO ecsiteadmin;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.accounts_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_customuser_groups_id_seq OWNER TO ecsiteadmin;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.accounts_customuser_groups_id_seq OWNED BY public.accounts_customuser_groups.id;


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.accounts_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_customuser_id_seq OWNER TO ecsiteadmin;

--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.accounts_customuser_id_seq OWNED BY public.accounts_customuser.id;


--
-- Name: accounts_customuser_user_permissions; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.accounts_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_user_permissions OWNER TO ecsiteadmin;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.accounts_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_customuser_user_permissions_id_seq OWNER TO ecsiteadmin;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.accounts_customuser_user_permissions_id_seq OWNED BY public.accounts_customuser_user_permissions.id;


--
-- Name: app_item; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.app_item (
    number integer NOT NULL,
    slug character varying(64) NOT NULL,
    code character varying(7) NOT NULL,
    pref_reading text NOT NULL,
    city_reading text NOT NULL,
    area_reading text NOT NULL,
    prefecture text NOT NULL,
    city text NOT NULL,
    area text NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.app_item OWNER TO ecsiteadmin;

--
-- Name: app_item_number_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.app_item_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_item_number_seq OWNER TO ecsiteadmin;

--
-- Name: app_item_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.app_item_number_seq OWNED BY public.app_item.number;


--
-- Name: app_order; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.app_order (
    id bigint NOT NULL,
    start_date timestamp with time zone NOT NULL,
    ordered_data timestamp with time zone NOT NULL,
    ordered boolean NOT NULL,
    user_id bigint NOT NULL,
    payment_id bigint
);


ALTER TABLE public.app_order OWNER TO ecsiteadmin;

--
-- Name: app_order_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.app_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_order_id_seq OWNER TO ecsiteadmin;

--
-- Name: app_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.app_order_id_seq OWNED BY public.app_order.id;


--
-- Name: app_order_items; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.app_order_items (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    orderitem_id bigint NOT NULL
);


ALTER TABLE public.app_order_items OWNER TO ecsiteadmin;

--
-- Name: app_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.app_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_order_items_id_seq OWNER TO ecsiteadmin;

--
-- Name: app_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.app_order_items_id_seq OWNED BY public.app_order_items.id;


--
-- Name: app_orderitem; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.app_orderitem (
    id bigint NOT NULL,
    ordered boolean NOT NULL,
    quantity integer NOT NULL,
    item_id integer NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.app_orderitem OWNER TO ecsiteadmin;

--
-- Name: app_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.app_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_orderitem_id_seq OWNER TO ecsiteadmin;

--
-- Name: app_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.app_orderitem_id_seq OWNED BY public.app_orderitem.id;


--
-- Name: app_payment; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.app_payment (
    id bigint NOT NULL,
    stripe_charge_id character varying(50) NOT NULL,
    amount integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.app_payment OWNER TO ecsiteadmin;

--
-- Name: app_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.app_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_payment_id_seq OWNER TO ecsiteadmin;

--
-- Name: app_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.app_payment_id_seq OWNED BY public.app_payment.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ecsiteadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ecsiteadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ecsiteadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ecsiteadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ecsiteadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ecsiteadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ecsiteadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ecsiteadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ecsiteadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ecsiteadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ecsiteadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ecsiteadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ecsiteadmin;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO ecsiteadmin;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO ecsiteadmin;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO ecsiteadmin;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO ecsiteadmin;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO ecsiteadmin;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO ecsiteadmin;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO ecsiteadmin;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO ecsiteadmin;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: ecsiteadmin
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO ecsiteadmin;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: ecsiteadmin
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO ecsiteadmin;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecsiteadmin
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: accounts_customuser id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_id_seq'::regclass);


--
-- Name: accounts_customuser_groups id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_groups_id_seq'::regclass);


--
-- Name: accounts_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_customuser_user_permissions_id_seq'::regclass);


--
-- Name: app_item number; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_item ALTER COLUMN number SET DEFAULT nextval('public.app_item_number_seq'::regclass);


--
-- Name: app_order id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order ALTER COLUMN id SET DEFAULT nextval('public.app_order_id_seq'::regclass);


--
-- Name: app_order_items id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order_items ALTER COLUMN id SET DEFAULT nextval('public.app_order_items_id_seq'::regclass);


--
-- Name: app_orderitem id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_orderitem ALTER COLUMN id SET DEFAULT nextval('public.app_orderitem_id_seq'::regclass);


--
-- Name: app_payment id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_payment ALTER COLUMN id SET DEFAULT nextval('public.app_payment_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	test@a.com	f	t	2
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: accounts_customuser; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.accounts_customuser (id, password, last_login, is_superuser, email, first_name, last_name, created, is_staff, is_active, address, tel) FROM stdin;
1	pbkdf2_sha256$320000$b8BVxFLTfiKa4rp2mliRV8$g98ecpr0d7If3Ou0ZdpLuWZ3WQa1sfc3zbQmhScE6LA=	2022-07-07 13:43:34.374298+09	t	admin@a.com	admin	admin	2022-06-25	t	t	admin	admin
2	pbkdf2_sha256$320000$akrIbeSjRdbvzGxThIQk4S$qak7oUXcwYOi7efTT2us1JKxj7ue4rB27kEtLf8J1cY=	2022-07-07 14:28:45.803713+09	f	test@a.com	Ç©Ç´Ç≠ÇØÇ±	Ç†Ç¢Ç§Ç¶Ç®	2022-07-07	f	t		
\.


--
-- Data for Name: accounts_customuser_groups; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.accounts_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.accounts_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: app_item; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.app_item (number, slug, code, pref_reading, city_reading, area_reading, prefecture, city, area, price, quantity) FROM stdin;
2	a195688498ac623a20fde296cc1a6dc4	0600000	ÉzÉbÉJÉCÉhÉE	ÉTÉbÉ|ÉçÉVÉ`ÉÖÉEÉIÉEÉN	ÉCÉJÉjÉPÉCÉTÉCÉKÉiÉCÉoÉAÉC	ñkäCìπ	éDñyésíÜâõãÊ	à»â∫Ç…åfç⁄Ç™Ç»Ç¢èÍçá	100	1
3	3129c8293d978be1b64507335d614eae	0640941	ÉzÉbÉJÉCÉhÉE	ÉTÉbÉ|ÉçÉVÉ`ÉÖÉEÉIÉEÉN	ÉAÉTÉqÉKÉIÉJ	ñkäCìπ	éDñyésíÜâõãÊ	àÆÉPãu	2532	0
\.


--
-- Data for Name: app_order; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.app_order (id, start_date, ordered_data, ordered, user_id, payment_id) FROM stdin;
1	2022-07-03 14:37:48.150585+09	2022-07-03 14:37:48.150585+09	f	1	\N
\.


--
-- Data for Name: app_order_items; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.app_order_items (id, order_id, orderitem_id) FROM stdin;
7	1	7
\.


--
-- Data for Name: app_orderitem; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.app_orderitem (id, ordered, quantity, item_id, user_id) FROM stdin;
7	f	1	2	1
\.


--
-- Data for Name: app_payment; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.app_payment (id, stripe_charge_id, amount, "timestamp", user_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_customuser
22	Can change user	6	change_customuser
23	Can delete user	6	delete_customuser
24	Can view user	6	view_customuser
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add email address	8	add_emailaddress
30	Can change email address	8	change_emailaddress
31	Can delete email address	8	delete_emailaddress
32	Can view email address	8	view_emailaddress
33	Can add email confirmation	9	add_emailconfirmation
34	Can change email confirmation	9	change_emailconfirmation
35	Can delete email confirmation	9	delete_emailconfirmation
36	Can view email confirmation	9	view_emailconfirmation
37	Can add social account	10	add_socialaccount
38	Can change social account	10	change_socialaccount
39	Can delete social account	10	delete_socialaccount
40	Can view social account	10	view_socialaccount
41	Can add social application	11	add_socialapp
42	Can change social application	11	change_socialapp
43	Can delete social application	11	delete_socialapp
44	Can view social application	11	view_socialapp
45	Can add social application token	12	add_socialtoken
46	Can change social application token	12	change_socialtoken
47	Can delete social application token	12	delete_socialtoken
48	Can view social application token	12	view_socialtoken
49	Can add item	13	add_item
50	Can change item	13	change_item
51	Can delete item	13	delete_item
52	Can view item	13	view_item
53	Can add order	14	add_order
54	Can change order	14	change_order
55	Can delete order	14	delete_order
56	Can view order	14	view_order
57	Can add order item	15	add_orderitem
58	Can change order item	15	change_orderitem
59	Can delete order item	15	delete_orderitem
60	Can view order item	15	view_orderitem
61	Can add payment	16	add_payment
62	Can change payment	16	change_payment
63	Can delete payment	16	delete_payment
64	Can view payment	16	view_payment
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-06-25 20:46:59.170687+09	1	teset	1	[{"added": {}}]	13	1
2	2022-06-25 20:59:24.702465+09	1	teset	2	[{"changed": {"fields": ["Slug"]}}]	13	1
3	2022-06-25 21:04:10.844085+09	1	teset	3		13	1
4	2022-06-25 21:04:50.10547+09	2	hw	1	[{"added": {}}]	13	1
5	2022-06-25 21:21:37.587872+09	2	éDñyésíÜâõãÊ	2	[{"changed": {"fields": ["Code", "Pref reading", "City reading", "Area reading", "Prefecture", "City", "Area"]}}]	13	1
6	2022-06-25 21:22:09.359793+09	3	éDñyésíÜâõãÊ	1	[{"added": {}}]	13	1
7	2022-07-03 17:59:35.189465+09	2	éDñyésíÜâõãÊ	2	[{"changed": {"fields": ["Price"]}}]	13	1
8	2022-07-03 17:59:49.662187+09	3	éDñyésíÜâõãÊ	2	[{"changed": {"fields": ["Price"]}}]	13	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	customuser
7	sites	site
8	account	emailaddress
9	account	emailconfirmation
10	socialaccount	socialaccount
11	socialaccount	socialapp
12	socialaccount	socialtoken
13	app	item
14	app	order
15	app	orderitem
16	app	payment
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-06-25 20:44:50.146808+09
2	contenttypes	0002_remove_content_type_name	2022-06-25 20:44:50.226267+09
3	auth	0001_initial	2022-06-25 20:44:50.41808+09
4	auth	0002_alter_permission_name_max_length	2022-06-25 20:44:50.439101+09
5	auth	0003_alter_user_email_max_length	2022-06-25 20:44:50.46236+09
6	auth	0004_alter_user_username_opts	2022-06-25 20:44:50.488436+09
7	auth	0005_alter_user_last_login_null	2022-06-25 20:44:50.513324+09
8	auth	0006_require_contenttypes_0002	2022-06-25 20:44:50.520054+09
9	auth	0007_alter_validators_add_error_messages	2022-06-25 20:44:50.546606+09
10	auth	0008_alter_user_username_max_length	2022-06-25 20:44:50.569805+09
11	auth	0009_alter_user_last_name_max_length	2022-06-25 20:44:50.596273+09
12	auth	0010_alter_group_name_max_length	2022-06-25 20:44:50.653522+09
13	auth	0011_update_proxy_permissions	2022-06-25 20:44:50.676526+09
14	auth	0012_alter_user_first_name_max_length	2022-06-25 20:44:50.706195+09
15	accounts	0001_initial	2022-06-25 20:44:50.903603+09
16	account	0001_initial	2022-06-25 20:44:51.073531+09
17	account	0002_email_max_length	2022-06-25 20:44:51.113454+09
18	accounts	0002_alter_customuser_created_alter_customuser_department_and_more	2022-06-25 20:44:51.284511+09
19	accounts	0003_alter_customuser_created_alter_customuser_department_and_more	2022-06-25 20:44:51.459617+09
20	accounts	0004_remove_customuser_department_customuser_address_and_more	2022-06-25 20:44:51.706416+09
21	admin	0001_initial	2022-06-25 20:44:51.861572+09
22	admin	0002_logentry_remove_auto_add	2022-06-25 20:44:51.922008+09
23	admin	0003_logentry_add_action_flag_choices	2022-06-25 20:44:51.9676+09
24	sessions	0001_initial	2022-06-25 20:44:52.024081+09
25	sites	0001_initial	2022-06-25 20:44:52.057243+09
26	sites	0002_alter_domain_unique	2022-06-25 20:44:52.08734+09
27	socialaccount	0001_initial	2022-06-25 20:44:52.40319+09
28	socialaccount	0002_token_max_lengths	2022-06-25 20:44:52.498681+09
29	socialaccount	0003_extra_data_default_dict	2022-06-25 20:44:52.539651+09
30	app	0001_initial	2022-06-25 20:46:17.161886+09
31	app	0002_alter_item_slug	2022-06-25 20:57:23.904463+09
32	app	0003_item_price_item_quantity	2022-06-25 21:01:19.075563+09
33	app	0004_alter_item_price_alter_item_quantity	2022-06-25 21:03:44.81098+09
34	app	0005_orderitem_order	2022-06-27 21:47:57.133371+09
35	app	0006_payment_order_payment	2022-07-03 18:41:25.907579+09
36	app	0007_alter_item_quantity_alter_item_slug	2022-07-03 21:21:32.350939+09
37	app	0008_alter_item_slug	2022-07-03 21:40:39.863742+09
38	app	0009_alter_item_slug	2022-07-07 13:38:22.774234+09
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
065teu90yslju1q4uptmmlq9pi0x0cdn	.eJxVjEEOwiAQRe_C2pB2ygi4dO8ZyACDRQ2Y0iYa4921SRe6_e_99xKOlnl0S-PJ5SgOohe7381TuHJZQbxQOVcZapmn7OWqyI02eaqRb8fN_QuM1MbvGwZvul5rMgBRBQ_aKIOKrDUeE2Ci4D3SgElZ7iAGNIyse9hHGBLZNdq4tVyL48c9T09x6N4fcLc-6Q:1o7yBg:reOTmW7pMaUI1zS6Vo9aNxU8MyOVhVHKnM6qcvO74lw	2022-07-17 20:54:52.958867+09
n06jq9gey46q61igwk6ui033qhavhq69	.eJxVjDsOgzAQBe_iOkL4C6RMnzNY690lOHFsCXCaKHcPSDS0b2beVwBiqXn1H57jGJk8vyEmcc01pYvwUNfJ14VnH0lchRKnLQC-OO-AnpAfpcGS1zmGZleagy7NvRCn2-GeDiZYpq1Gay0ZVKYfgmpNGJRlcCglyRZaA1p1znaOtBr1aAxvDgdGTb1EOTgnfn8clEKV:1o9K4D:sVtNTqXdhLFXdsRvRl1gg6aaLyr5oiFOS2TwEFNjLfg	2022-07-21 14:28:45.808713+09
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: ecsiteadmin
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.accounts_customuser_groups_id_seq', 1, false);


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.accounts_customuser_id_seq', 2, true);


--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.accounts_customuser_user_permissions_id_seq', 1, false);


--
-- Name: app_item_number_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.app_item_number_seq', 3, true);


--
-- Name: app_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.app_order_id_seq', 1, true);


--
-- Name: app_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.app_order_items_id_seq', 7, true);


--
-- Name: app_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.app_orderitem_id_seq', 7, true);


--
-- Name: app_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.app_payment_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 8, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 38, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecsiteadmin
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_email_key UNIQUE (email);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq UNIQUE (customuser_id, group_id);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_customuser_id_permission_9632a709_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_customuser_id_permission_9632a709_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: app_item app_item_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_item
    ADD CONSTRAINT app_item_pkey PRIMARY KEY (number);


--
-- Name: app_item app_item_slug_a99ba8e5_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_item
    ADD CONSTRAINT app_item_slug_a99ba8e5_uniq UNIQUE (slug);


--
-- Name: app_order_items app_order_items_order_id_orderitem_id_8ffc46de_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order_items
    ADD CONSTRAINT app_order_items_order_id_orderitem_id_8ffc46de_uniq UNIQUE (order_id, orderitem_id);


--
-- Name: app_order_items app_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order_items
    ADD CONSTRAINT app_order_items_pkey PRIMARY KEY (id);


--
-- Name: app_order app_order_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order
    ADD CONSTRAINT app_order_pkey PRIMARY KEY (id);


--
-- Name: app_orderitem app_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_pkey PRIMARY KEY (id);


--
-- Name: app_payment app_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_payment
    ADD CONSTRAINT app_payment_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: accounts_customuser_email_4fd8e7ce_like; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX accounts_customuser_email_4fd8e7ce_like ON public.accounts_customuser USING btree (email varchar_pattern_ops);


--
-- Name: accounts_customuser_groups_customuser_id_bc55088e; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX accounts_customuser_groups_customuser_id_bc55088e ON public.accounts_customuser_groups USING btree (customuser_id);


--
-- Name: accounts_customuser_groups_group_id_86ba5f9e; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX accounts_customuser_groups_group_id_86ba5f9e ON public.accounts_customuser_groups USING btree (group_id);


--
-- Name: accounts_customuser_user_permissions_customuser_id_0deaefae; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX accounts_customuser_user_permissions_customuser_id_0deaefae ON public.accounts_customuser_user_permissions USING btree (customuser_id);


--
-- Name: accounts_customuser_user_permissions_permission_id_aea3d0e5; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX accounts_customuser_user_permissions_permission_id_aea3d0e5 ON public.accounts_customuser_user_permissions USING btree (permission_id);


--
-- Name: app_item_slug_a99ba8e5_like; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX app_item_slug_a99ba8e5_like ON public.app_item USING btree (slug varchar_pattern_ops);


--
-- Name: app_order_items_order_id_fc630146; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX app_order_items_order_id_fc630146 ON public.app_order_items USING btree (order_id);


--
-- Name: app_order_items_orderitem_id_5617e875; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX app_order_items_orderitem_id_5617e875 ON public.app_order_items USING btree (orderitem_id);


--
-- Name: app_order_payment_id_c3c99e41; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX app_order_payment_id_c3c99e41 ON public.app_order USING btree (payment_id);


--
-- Name: app_order_user_id_f25a9fc4; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX app_order_user_id_f25a9fc4 ON public.app_order USING btree (user_id);


--
-- Name: app_orderitem_item_id_e0075062; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX app_orderitem_item_id_e0075062 ON public.app_orderitem USING btree (item_id);


--
-- Name: app_orderitem_user_id_32e31a66; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX app_orderitem_user_id_32e31a66 ON public.app_orderitem USING btree (user_id);


--
-- Name: app_payment_user_id_0f781b98; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX app_payment_user_id_0f781b98 ON public.app_payment USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: ecsiteadmin
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_user_permissions accounts_customuser__customuser_id_0deaefae_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__customuser_id_0deaefae_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser__customuser_id_bc55088e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser__customuser_id_bc55088e_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_user_permissions accounts_customuser__permission_id_aea3d0e5_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__permission_id_aea3d0e5_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_order_items app_order_items_order_id_fc630146_fk_app_order_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order_items
    ADD CONSTRAINT app_order_items_order_id_fc630146_fk_app_order_id FOREIGN KEY (order_id) REFERENCES public.app_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_order_items app_order_items_orderitem_id_5617e875_fk_app_orderitem_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order_items
    ADD CONSTRAINT app_order_items_orderitem_id_5617e875_fk_app_orderitem_id FOREIGN KEY (orderitem_id) REFERENCES public.app_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_order app_order_payment_id_c3c99e41_fk_app_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order
    ADD CONSTRAINT app_order_payment_id_c3c99e41_fk_app_payment_id FOREIGN KEY (payment_id) REFERENCES public.app_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_order app_order_user_id_f25a9fc4_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_order
    ADD CONSTRAINT app_order_user_id_f25a9fc4_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_orderitem app_orderitem_item_id_e0075062_fk_app_item_number; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_item_id_e0075062_fk_app_item_number FOREIGN KEY (item_id) REFERENCES public.app_item(number) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_orderitem app_orderitem_user_id_32e31a66_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_user_id_32e31a66_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_payment app_payment_user_id_0f781b98_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.app_payment
    ADD CONSTRAINT app_payment_user_id_0f781b98_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_social_user_id_8146e70c_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: ecsiteadmin
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_social_user_id_8146e70c_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

