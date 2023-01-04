--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order integer
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order integer,
    user_order integer
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chapters (
    id integer NOT NULL,
    title character varying(255),
    content text,
    summary text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.chapters OWNER TO postgres;

--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chapters_id_seq OWNER TO postgres;

--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order integer
);


ALTER TABLE public.files_folder_links OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order integer
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: subtopics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subtopics (
    id integer NOT NULL,
    title character varying(255),
    content text,
    summary text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.subtopics OWNER TO postgres;

--
-- Name: subtopics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subtopics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subtopics_id_seq OWNER TO postgres;

--
-- Name: subtopics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subtopics_id_seq OWNED BY public.subtopics.id;


--
-- Name: subtopics_topic_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subtopics_topic_links (
    id integer NOT NULL,
    subtopic_id integer,
    topic_id integer,
    subtopic_order integer
);


ALTER TABLE public.subtopics_topic_links OWNER TO postgres;

--
-- Name: subtopics_topic_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subtopics_topic_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subtopics_topic_links_id_seq OWNER TO postgres;

--
-- Name: subtopics_topic_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subtopics_topic_links_id_seq OWNED BY public.subtopics_topic_links.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    title character varying(255),
    content text,
    summary text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.topics OWNER TO postgres;

--
-- Name: topics_chapter_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics_chapter_links (
    id integer NOT NULL,
    topic_id integer,
    chapter_id integer,
    topic_order integer
);


ALTER TABLE public.topics_chapter_links OWNER TO postgres;

--
-- Name: topics_chapter_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_chapter_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_chapter_links_id_seq OWNER TO postgres;

--
-- Name: topics_chapter_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_chapter_links_id_seq OWNED BY public.topics_chapter_links.id;


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO postgres;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order integer
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order integer
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order integer
);


ALTER TABLE public.upload_folders_parent_links OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: subtopics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics ALTER COLUMN id SET DEFAULT nextval('public.subtopics_id_seq'::regclass);


--
-- Name: subtopics_topic_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics_topic_links ALTER COLUMN id SET DEFAULT nextval('public.subtopics_topic_links_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: topics_chapter_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics_chapter_links ALTER COLUMN id SET DEFAULT nextval('public.topics_chapter_links_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
11	plugin::upload.read	\N	{}	[]	2022-11-15 02:17:51.983	2022-11-15 02:17:51.983	\N	\N
12	plugin::upload.assets.create	\N	{}	[]	2022-11-15 02:17:52.226	2022-11-15 02:17:52.226	\N	\N
13	plugin::upload.assets.update	\N	{}	[]	2022-11-15 02:17:52.473	2022-11-15 02:17:52.473	\N	\N
14	plugin::upload.assets.download	\N	{}	[]	2022-11-15 02:17:52.718	2022-11-15 02:17:52.718	\N	\N
15	plugin::upload.assets.copy-link	\N	{}	[]	2022-11-15 02:17:52.967	2022-11-15 02:17:52.967	\N	\N
24	plugin::upload.read	\N	{}	["admin::is-creator"]	2022-11-15 02:17:55.18	2022-11-15 02:17:55.18	\N	\N
25	plugin::upload.assets.create	\N	{}	[]	2022-11-15 02:17:55.429	2022-11-15 02:17:55.429	\N	\N
26	plugin::upload.assets.update	\N	{}	["admin::is-creator"]	2022-11-15 02:17:55.684	2022-11-15 02:17:55.684	\N	\N
27	plugin::upload.assets.download	\N	{}	[]	2022-11-15 02:17:55.93	2022-11-15 02:17:55.93	\N	\N
28	plugin::upload.assets.copy-link	\N	{}	[]	2022-11-15 02:17:56.176	2022-11-15 02:17:56.176	\N	\N
29	plugin::content-manager.explorer.create	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-11-15 02:17:56.78	2022-11-15 02:17:56.78	\N	\N
32	plugin::content-manager.explorer.read	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-11-15 02:17:57.505	2022-11-15 02:17:57.505	\N	\N
35	plugin::content-manager.explorer.update	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-11-15 02:17:58.246	2022-11-15 02:17:58.246	\N	\N
38	plugin::content-manager.explorer.delete	plugin::users-permissions.user	{}	[]	2022-11-15 02:17:58.982	2022-11-15 02:17:58.982	\N	\N
43	plugin::content-manager.single-types.configure-view	\N	{}	[]	2022-11-15 02:18:00.244	2022-11-15 02:18:00.244	\N	\N
44	plugin::content-manager.collection-types.configure-view	\N	{}	[]	2022-11-15 02:18:00.492	2022-11-15 02:18:00.492	\N	\N
45	plugin::content-manager.components.configure-layout	\N	{}	[]	2022-11-15 02:18:00.742	2022-11-15 02:18:00.742	\N	\N
46	plugin::content-type-builder.read	\N	{}	[]	2022-11-15 02:18:00.988	2022-11-15 02:18:00.988	\N	\N
47	plugin::email.settings.read	\N	{}	[]	2022-11-15 02:18:01.239	2022-11-15 02:18:01.239	\N	\N
48	plugin::upload.read	\N	{}	[]	2022-11-15 02:18:01.484	2022-11-15 02:18:01.484	\N	\N
49	plugin::upload.assets.create	\N	{}	[]	2022-11-15 02:18:01.739	2022-11-15 02:18:01.739	\N	\N
50	plugin::upload.assets.update	\N	{}	[]	2022-11-15 02:18:01.983	2022-11-15 02:18:01.983	\N	\N
51	plugin::upload.assets.download	\N	{}	[]	2022-11-15 02:18:02.222	2022-11-15 02:18:02.222	\N	\N
52	plugin::upload.assets.copy-link	\N	{}	[]	2022-11-15 02:18:02.474	2022-11-15 02:18:02.474	\N	\N
53	plugin::upload.settings.read	\N	{}	[]	2022-11-15 02:18:02.714	2022-11-15 02:18:02.714	\N	\N
54	plugin::i18n.locale.create	\N	{}	[]	2022-11-15 02:18:02.97	2022-11-15 02:18:02.97	\N	\N
55	plugin::i18n.locale.read	\N	{}	[]	2022-11-15 02:18:03.222	2022-11-15 02:18:03.222	\N	\N
56	plugin::i18n.locale.update	\N	{}	[]	2022-11-15 02:18:03.466	2022-11-15 02:18:03.466	\N	\N
57	plugin::i18n.locale.delete	\N	{}	[]	2022-11-15 02:18:03.73	2022-11-15 02:18:03.73	\N	\N
58	plugin::users-permissions.roles.create	\N	{}	[]	2022-11-15 02:18:03.997	2022-11-15 02:18:03.997	\N	\N
59	plugin::users-permissions.roles.read	\N	{}	[]	2022-11-15 02:18:04.244	2022-11-15 02:18:04.244	\N	\N
60	plugin::users-permissions.roles.update	\N	{}	[]	2022-11-15 02:18:04.489	2022-11-15 02:18:04.489	\N	\N
61	plugin::users-permissions.roles.delete	\N	{}	[]	2022-11-15 02:18:04.736	2022-11-15 02:18:04.736	\N	\N
62	plugin::users-permissions.providers.read	\N	{}	[]	2022-11-15 02:18:04.982	2022-11-15 02:18:04.982	\N	\N
63	plugin::users-permissions.providers.update	\N	{}	[]	2022-11-15 02:18:05.24	2022-11-15 02:18:05.24	\N	\N
64	plugin::users-permissions.email-templates.read	\N	{}	[]	2022-11-15 02:18:05.484	2022-11-15 02:18:05.484	\N	\N
65	plugin::users-permissions.email-templates.update	\N	{}	[]	2022-11-15 02:18:05.736	2022-11-15 02:18:05.736	\N	\N
66	plugin::users-permissions.advanced-settings.read	\N	{}	[]	2022-11-15 02:18:05.982	2022-11-15 02:18:05.982	\N	\N
67	plugin::users-permissions.advanced-settings.update	\N	{}	[]	2022-11-15 02:18:06.227	2022-11-15 02:18:06.227	\N	\N
68	admin::marketplace.read	\N	{}	[]	2022-11-15 02:18:06.47	2022-11-15 02:18:06.47	\N	\N
69	admin::marketplace.plugins.install	\N	{}	[]	2022-11-15 02:18:06.714	2022-11-15 02:18:06.714	\N	\N
70	admin::marketplace.plugins.uninstall	\N	{}	[]	2022-11-15 02:18:06.972	2022-11-15 02:18:06.972	\N	\N
71	admin::webhooks.create	\N	{}	[]	2022-11-15 02:18:07.226	2022-11-15 02:18:07.226	\N	\N
72	admin::webhooks.read	\N	{}	[]	2022-11-15 02:18:07.471	2022-11-15 02:18:07.471	\N	\N
73	admin::webhooks.update	\N	{}	[]	2022-11-15 02:18:07.723	2022-11-15 02:18:07.723	\N	\N
74	admin::webhooks.delete	\N	{}	[]	2022-11-15 02:18:07.965	2022-11-15 02:18:07.965	\N	\N
75	admin::users.create	\N	{}	[]	2022-11-15 02:18:08.209	2022-11-15 02:18:08.209	\N	\N
76	admin::users.read	\N	{}	[]	2022-11-15 02:18:08.454	2022-11-15 02:18:08.454	\N	\N
77	admin::users.update	\N	{}	[]	2022-11-15 02:18:08.7	2022-11-15 02:18:08.7	\N	\N
78	admin::users.delete	\N	{}	[]	2022-11-15 02:18:08.949	2022-11-15 02:18:08.949	\N	\N
79	admin::roles.create	\N	{}	[]	2022-11-15 02:18:09.191	2022-11-15 02:18:09.191	\N	\N
80	admin::roles.read	\N	{}	[]	2022-11-15 02:18:09.427	2022-11-15 02:18:09.427	\N	\N
81	admin::roles.update	\N	{}	[]	2022-11-15 02:18:09.682	2022-11-15 02:18:09.682	\N	\N
82	admin::roles.delete	\N	{}	[]	2022-11-15 02:18:09.939	2022-11-15 02:18:09.939	\N	\N
83	admin::api-tokens.access	\N	{}	[]	2022-11-15 02:18:10.193	2022-11-15 02:18:10.193	\N	\N
84	admin::api-tokens.create	\N	{}	[]	2022-11-15 02:18:10.445	2022-11-15 02:18:10.445	\N	\N
85	admin::api-tokens.read	\N	{}	[]	2022-11-15 02:18:10.692	2022-11-15 02:18:10.692	\N	\N
86	admin::api-tokens.update	\N	{}	[]	2022-11-15 02:18:10.934	2022-11-15 02:18:10.934	\N	\N
87	admin::api-tokens.regenerate	\N	{}	[]	2022-11-15 02:18:11.199	2022-11-15 02:18:11.199	\N	\N
88	admin::api-tokens.delete	\N	{}	[]	2022-11-15 02:18:11.444	2022-11-15 02:18:11.444	\N	\N
89	admin::project-settings.update	\N	{}	[]	2022-11-15 02:18:11.698	2022-11-15 02:18:11.698	\N	\N
90	admin::project-settings.read	\N	{}	[]	2022-11-15 02:18:11.979	2022-11-15 02:18:11.979	\N	\N
121	plugin::content-manager.explorer.create	api::chapter.chapter	{"fields": ["title", "content", "cover", "summary", "topics"]}	[]	2022-12-22 00:37:20.084	2022-12-22 00:37:20.084	\N	\N
122	plugin::content-manager.explorer.create	api::subtopic.subtopic	{"fields": ["title", "content", "cover", "summary", "topic"]}	[]	2022-12-22 00:37:21.136	2022-12-22 00:37:21.136	\N	\N
123	plugin::content-manager.explorer.create	api::topic.topic	{"fields": ["title", "content", "cover", "summary", "chapter", "subtopics"]}	[]	2022-12-22 00:37:22.186	2022-12-22 00:37:22.186	\N	\N
124	plugin::content-manager.explorer.read	api::chapter.chapter	{"fields": ["title", "content", "cover", "summary", "topics"]}	[]	2022-12-22 00:37:23.236	2022-12-22 00:37:23.236	\N	\N
125	plugin::content-manager.explorer.read	api::subtopic.subtopic	{"fields": ["title", "content", "cover", "summary", "topic"]}	[]	2022-12-22 00:37:24.285	2022-12-22 00:37:24.285	\N	\N
126	plugin::content-manager.explorer.read	api::topic.topic	{"fields": ["title", "content", "cover", "summary", "chapter", "subtopics"]}	[]	2022-12-22 00:37:25.335	2022-12-22 00:37:25.335	\N	\N
127	plugin::content-manager.explorer.update	api::chapter.chapter	{"fields": ["title", "content", "cover", "summary", "topics"]}	[]	2022-12-22 00:37:26.385	2022-12-22 00:37:26.385	\N	\N
128	plugin::content-manager.explorer.update	api::subtopic.subtopic	{"fields": ["title", "content", "cover", "summary", "topic"]}	[]	2022-12-22 00:37:27.434	2022-12-22 00:37:27.434	\N	\N
129	plugin::content-manager.explorer.update	api::topic.topic	{"fields": ["title", "content", "cover", "summary", "chapter", "subtopics"]}	[]	2022-12-22 00:37:28.484	2022-12-22 00:37:28.484	\N	\N
130	plugin::content-manager.explorer.delete	api::chapter.chapter	{}	[]	2022-12-22 00:37:29.534	2022-12-22 00:37:29.534	\N	\N
131	plugin::content-manager.explorer.delete	api::subtopic.subtopic	{}	[]	2022-12-22 00:37:30.584	2022-12-22 00:37:30.584	\N	\N
132	plugin::content-manager.explorer.delete	api::topic.topic	{}	[]	2022-12-22 00:37:31.634	2022-12-22 00:37:31.634	\N	\N
133	plugin::content-manager.explorer.publish	api::chapter.chapter	{}	[]	2022-12-22 00:37:32.684	2022-12-22 00:37:32.684	\N	\N
134	plugin::content-manager.explorer.publish	api::subtopic.subtopic	{}	[]	2022-12-22 00:37:33.734	2022-12-22 00:37:33.734	\N	\N
135	plugin::content-manager.explorer.publish	api::topic.topic	{}	[]	2022-12-22 00:37:34.784	2022-12-22 00:37:34.784	\N	\N
136	plugin::content-manager.explorer.create	api::chapter.chapter	{"fields": ["content", "cover", "summary", "title", "topics"]}	[]	2022-12-22 13:44:25.653	2022-12-22 13:44:25.653	\N	\N
137	plugin::content-manager.explorer.read	api::chapter.chapter	{"fields": ["content", "cover", "summary", "title", "topics"]}	[]	2022-12-22 13:44:26.708	2022-12-22 13:44:26.708	\N	\N
138	plugin::content-manager.explorer.update	api::chapter.chapter	{"fields": ["content", "cover", "summary", "title", "topics"]}	[]	2022-12-22 13:44:27.757	2022-12-22 13:44:27.757	\N	\N
139	plugin::content-manager.explorer.delete	api::chapter.chapter	{}	[]	2022-12-22 13:44:28.805	2022-12-22 13:44:28.805	\N	\N
140	plugin::content-manager.explorer.publish	api::chapter.chapter	{}	[]	2022-12-22 13:44:29.853	2022-12-22 13:44:29.853	\N	\N
141	plugin::content-manager.explorer.create	api::subtopic.subtopic	{"fields": ["content", "cover", "summary", "title", "topic"]}	[]	2022-12-22 13:44:30.902	2022-12-22 13:44:30.902	\N	\N
142	plugin::content-manager.explorer.read	api::subtopic.subtopic	{"fields": ["content", "cover", "summary", "title", "topic"]}	[]	2022-12-22 13:44:31.951	2022-12-22 13:44:31.951	\N	\N
143	plugin::content-manager.explorer.update	api::subtopic.subtopic	{"fields": ["content", "cover", "summary", "title", "topic"]}	[]	2022-12-22 13:44:32.999	2022-12-22 13:44:32.999	\N	\N
144	plugin::content-manager.explorer.delete	api::subtopic.subtopic	{}	[]	2022-12-22 13:44:34.048	2022-12-22 13:44:34.048	\N	\N
145	plugin::content-manager.explorer.publish	api::subtopic.subtopic	{}	[]	2022-12-22 13:44:35.097	2022-12-22 13:44:35.097	\N	\N
146	plugin::content-manager.explorer.create	api::topic.topic	{"fields": ["chapter", "content", "cover", "subtopics", "summary", "title"]}	[]	2022-12-22 13:44:36.145	2022-12-22 13:44:36.145	\N	\N
147	plugin::content-manager.explorer.read	api::topic.topic	{"fields": ["chapter", "content", "cover", "subtopics", "summary", "title"]}	[]	2022-12-22 13:44:37.193	2022-12-22 13:44:37.193	\N	\N
148	plugin::content-manager.explorer.update	api::topic.topic	{"fields": ["chapter", "content", "cover", "subtopics", "summary", "title"]}	[]	2022-12-22 13:44:38.241	2022-12-22 13:44:38.241	\N	\N
149	plugin::content-manager.explorer.delete	api::topic.topic	{}	[]	2022-12-22 13:44:39.289	2022-12-22 13:44:39.289	\N	\N
150	plugin::content-manager.explorer.publish	api::topic.topic	{}	[]	2022-12-22 13:44:40.338	2022-12-22 13:44:40.338	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
11	11	2	\N
12	12	2	\N
13	13	2	\N
14	14	2	\N
15	15	2	\N
24	24	3	\N
25	25	3	\N
26	26	3	\N
27	27	3	\N
28	28	3	\N
29	29	1	\N
32	32	1	\N
35	35	1	\N
38	38	1	\N
43	43	1	\N
44	44	1	\N
45	45	1	\N
46	46	1	\N
47	47	1	\N
48	48	1	\N
49	49	1	\N
50	50	1	\N
51	51	1	\N
52	52	1	\N
53	53	1	\N
54	54	1	\N
55	55	1	\N
56	56	1	\N
57	57	1	\N
58	58	1	\N
59	59	1	\N
60	60	1	\N
61	61	1	\N
62	62	1	\N
63	63	1	\N
64	64	1	\N
65	65	1	\N
66	66	1	\N
67	67	1	\N
68	68	1	\N
69	69	1	\N
70	70	1	\N
71	71	1	\N
72	72	1	\N
73	73	1	\N
74	74	1	\N
75	75	1	\N
76	76	1	\N
77	77	1	\N
78	78	1	\N
79	79	1	\N
80	80	1	\N
81	81	1	\N
82	82	1	\N
83	83	1	\N
84	84	1	\N
85	85	1	\N
86	86	1	\N
87	87	1	\N
88	88	1	\N
89	89	1	\N
90	90	1	\N
121	121	1	1
122	122	1	2
123	123	1	3
124	124	1	4
125	125	1	5
126	126	1	6
127	127	1	7
128	128	1	8
129	129	1	9
130	130	1	10
131	131	1	11
132	132	1	12
133	133	1	13
134	134	1	14
135	135	1	15
136	136	2	1
137	137	2	2
138	138	2	3
139	139	2	4
140	140	2	5
141	141	2	6
142	142	2	7
143	143	2	8
144	144	2	9
145	145	2	10
146	146	2	11
147	147	2	12
148	148	2	13
149	149	2	14
150	150	2	15
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2022-11-15 02:17:48.782	2022-11-15 02:17:48.782	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2022-11-15 02:17:49.362	2022-11-15 02:17:49.362	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2022-11-15 02:17:49.118	2022-12-22 13:44:23.317	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	Cristóbal	UFRO	\N	c.gajardo05@ufromail.cl	$2a$10$6aIfqmE8FS3W7FkzWYzs/eMfvn3r1f6L1mjdwGJx4EqLQY3akhAnC	\N	\N	t	f	\N	2022-11-23 21:41:00.497	2022-12-10 00:12:05.08	\N	\N
4	Iván	González	\N	i.gonzalez06@ufromail.cl	$2a$10$YpaTjx8SsDhI6UhSCdLgNefWU7ELTd53iJqMlL9GlbuKA64HWC2Ly	\N	\N	t	f	\N	2022-12-20 01:41:50.37	2022-12-20 01:42:35.515	\N	\N
5	Jaime	Bustos	\N	jaime.bustos@ufrontera.cl	\N	\N	f14add7fb4b1cd16bec4b641276974c7a4b8056a	f	f	\N	2022-12-20 01:43:03.422	2022-12-20 01:43:03.422	\N	\N
1	Cristóbal	Gajardo Vera	\N	cristobalgajardo.v@gmail.com	$2a$10$.nJN48ArwYnkI3H3mtIglezaoCuOyxLfpZTtt94EHbO4i0D.w.b.K	\N	\N	t	f	\N	2022-11-15 02:28:21.212	2022-12-20 01:43:46.703	\N	\N
3	Ricardo	Sepúlveda	\N	ricardo.sepulveda@ufrontera.cl	$2a$10$4yCLwTfQUAHKRxPKH9OxuuV4xeC71cg3THLvGJhg5J6O/WRg1FgHS	\N	\N	t	f	\N	2022-12-20 01:40:59.512	2022-12-20 01:45:42.795	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
1	1	1	\N	\N
2	2	2	1	1
3	3	2	1	2
4	4	2	1	3
5	5	2	1	4
\.


--
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chapters (id, title, content, summary, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
3	CAPITULO III: CADENAS DE MARKOV 		\N	2022-12-22 14:28:24.086	2022-12-22 14:28:24.086	\N	3	3
4	CAPITULO IV: TEORIA DE COLAS 		\N	2022-12-22 14:29:11.097	2022-12-22 14:29:11.097	\N	3	3
1	CAPITULO 1:  AXIOMATICA PROBABILISTICA 	<p style="text-align:justify;"><span style="font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-size:21px;"><i>En este capítulo se introducen los conceptos que caracterizan los fenómenos aleatorios espacios muestrales y &nbsp;algebra de sucesos para ilustrar escenarios probabilísticos y su resolución matemática y algebraica de sus axiomas y distribuciones de probabilidades con el propósito de predecir fenómenos de naturaleza aleatoria&nbsp;</i></span></p><p style="text-align:justify;"><span style="font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-size:21px;"><i>Los tópicos a revisar son:</i></span></p><ul><li style="text-align:justify;"><span style="font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-size:21px;"><i>Conceptos básicos&nbsp;</i></span></li><li style="text-align:justify;"><span style="font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-size:21px;"><i>Teoremas de probabilidad&nbsp;</i></span></li><li style="text-align:justify;"><span style="font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-size:21px;"><i>Técnicas de conteo</i></span></li><li style="text-align:justify;"><span style="font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-size:21px;"><i>Distribución de probabilidades : Discretas y Continuas</i></span></li></ul><p>&nbsp;</p>	\N	2022-12-22 14:26:58.398	2022-12-22 17:26:34.065	2022-12-22 15:02:03.676	3	3
2	CAPITULO II PROCESOS DE POISSON	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734680521.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734710569.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734769231.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734804569.png"></figure>	\N	2022-12-22 14:27:45.717	2022-12-22 18:47:11.292	2022-12-22 18:47:11.114	3	3
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
6	LOGO_UFRO.png	LOGO_UFRO.png	LOGO_UFRO.png	1200	1226	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_LOGO_UFRO_1669240436381.png", "hash": 1669240436381, "mime": "image/png", "name": "large_LOGO_UFRO.png", "path": null, "size": 221.27, "width": 979, "height": 1000}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_LOGO_UFRO_1669240436377.png", "hash": 1669240436377, "mime": "image/png", "name": "small_LOGO_UFRO.png", "path": null, "size": 89.32, "width": 489, "height": 500}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_LOGO_UFRO_1669240436380.png", "hash": 1669240436380, "mime": "image/png", "name": "medium_LOGO_UFRO.png", "path": null, "size": 150.31, "width": 734, "height": 750}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_LOGO_UFRO_1669240436013.png", "hash": 1669240436013, "mime": "image/png", "name": "thumbnail_LOGO_UFRO.png", "path": null, "size": 19.23, "width": 153, "height": 156}}	1669240435929	.png	image/png	93.30	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/LOGO_UFRO_1669240435929.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-11-23 21:53:58.197	2022-11-23 21:55:28.956	2	2
7	Logo ICI-M UFRO.png	Logo ICI-M UFRO.png	Logo ICI-M UFRO.png	5826	7782	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_Logo ICI-M UFRO_1670630687969.png", "hash": 1670630687969, "mime": "image/png", "name": "large_Logo ICI-M UFRO.png", "path": null, "size": 90.41, "width": 749, "height": 1000}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Logo ICI-M UFRO_1670630687966.png", "hash": 1670630687966, "mime": "image/png", "name": "small_Logo ICI-M UFRO.png", "path": null, "size": 40.37, "width": 374, "height": 500}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Logo ICI-M UFRO_1670630687963.png", "hash": 1670630687963, "mime": "image/png", "name": "medium_Logo ICI-M UFRO.png", "path": null, "size": 64.76, "width": 561, "height": 750}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Logo ICI-M UFRO_1670630685332.png", "hash": 1670630685332, "mime": "image/png", "name": "thumbnail_Logo ICI-M UFRO.png", "path": null, "size": 10.61, "width": 117, "height": 156}}	1670630684054	.png	image/png	448.71	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Logo ICI-M UFRO_1670630684054.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-10 00:04:49.386	2022-12-10 00:04:49.386	1	1
8	E2-U3.png	E2-U3.png	E2-U3.png	524	275	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_E2-U3_1671541712834.png", "hash": 1671541712834, "mime": "image/png", "name": "small_E2-U3.png", "path": null, "size": 43.03, "width": 500, "height": 262}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_E2-U3_1671541712635.png", "hash": 1671541712635, "mime": "image/png", "name": "thumbnail_E2-U3.png", "path": null, "size": 19.64, "width": 245, "height": 129}}	1671541712314	.png	image/png	9.05	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/E2-U3_1671541712314.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 13:08:34.836	2022-12-20 13:08:34.836	3	3
9	Captura de pantalla 2022-12-20 105114.png	Captura de pantalla 2022-12-20 105114.png	Captura de pantalla 2022-12-20 105114.png	826	436	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Captura de pantalla 2022-12-20 105114_1671544305651.png", "hash": 1671544305651, "mime": "image/png", "name": "small_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 52.82, "width": 500, "height": 264}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Captura de pantalla 2022-12-20 105114_1671544305653.png", "hash": 1671544305653, "mime": "image/png", "name": "medium_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 100.87, "width": 750, "height": 396}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Captura de pantalla 2022-12-20 105114_1671544305413.png", "hash": 1671544305413, "mime": "image/png", "name": "thumbnail_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 17.4, "width": 245, "height": 129}}	1671544305368	.png	image/png	66.13	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Captura de pantalla 2022-12-20 105114_1671544305368.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 13:51:47.302	2022-12-20 13:51:47.302	3	3
10	image.png	\N	\N	172	105	\N	1671544660159	.png	image/png	1.34	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671544660159.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 13:57:41.665	2022-12-20 13:57:41.665	3	3
11	image.png	\N	\N	173	105	\N	1671544749199	.png	image/png	1.41	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671544749199.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 13:59:10.75	2022-12-20 13:59:10.75	3	3
12	image.png	\N	\N	144	91	\N	1671544985630	.png	image/png	1.33	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671544985630.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:03:07.25	2022-12-20 14:03:07.25	3	3
13	image.png	\N	\N	144	90	\N	1671545006622	.png	image/png	1.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671545006622.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:03:27.925	2022-12-20 14:03:27.925	3	3
14	image.png	\N	\N	144	90	\N	1671545047104	.png	image/png	1.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671545047104.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:04:08.526	2022-12-20 14:04:08.526	3	3
15	image.png	\N	\N	232	25	\N	1671545142985	.png	image/png	0.90	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671545142985.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:05:44.342	2022-12-20 14:05:44.342	3	3
16	image.png	\N	\N	50	25	\N	1671545142988	.png	image/png	0.39	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671545142988.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:05:44.58	2022-12-20 14:05:44.58	3	3
41	image.png	\N	\N	158	26	\N	1671550466630	.png	image/png	0.73	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466630.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.153	2022-12-20 15:34:28.153	3	3
17	image.png	\N	\N	507	166	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671546434883.png", "hash": 1671546434883, "mime": "image/png", "name": "small_image.png", "path": null, "size": 13.9, "width": 500, "height": 164}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671546434684.png", "hash": 1671546434684, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.59, "width": 245, "height": 80}}	1671546434662	.png	image/png	5.14	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671546434662.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:27:16.355	2022-12-20 14:27:16.355	3	3
18	image.png	\N	\N	252	215	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671547576262.png", "hash": 1671547576262, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.22, "width": 183, "height": 156}}	1671547576235	.png	image/png	2.53	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671547576235.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:46:17.934	2022-12-20 14:46:17.934	3	3
19	image.png	\N	\N	172	105	\N	1671547596884	.png	image/png	1.34	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671547596884.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:46:38.421	2022-12-20 14:46:38.421	3	3
20	image.png	\N	\N	173	105	\N	1671547645368	.png	image/png	1.41	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671547645368.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:47:26.754	2022-12-20 14:47:26.754	3	3
21	union-de-sucesos-1.jpg	union-de-sucesos-1.jpg	union-de-sucesos-1.jpg	900	506	{"small": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_union-de-sucesos-1_1671547749138.jpg", "hash": 1671547749138, "mime": "image/jpeg", "name": "small_union-de-sucesos-1.jpg", "path": null, "size": 12.92, "width": 500, "height": 281}, "medium": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_union-de-sucesos-1_1671547749136.jpg", "hash": 1671547749136, "mime": "image/jpeg", "name": "medium_union-de-sucesos-1.jpg", "path": null, "size": 26.2, "width": 750, "height": 422}, "thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_union-de-sucesos-1_1671547748919.jpg", "hash": 1671547748919, "mime": "image/jpeg", "name": "thumbnail_union-de-sucesos-1.jpg", "path": null, "size": 4.56, "width": 245, "height": 138}}	1671547748898	.jpg	image/jpeg	36.52	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/union-de-sucesos-1_1671547748898.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:49:10.367	2022-12-20 14:49:10.367	3	3
22	interseccion-de-sucesos.jpg	interseccion-de-sucesos.jpg	interseccion-de-sucesos.jpg	1024	576	{"large": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_interseccion-de-sucesos_1671547962439.jpg", "hash": 1671547962439, "mime": "image/jpeg", "name": "large_interseccion-de-sucesos.jpg", "path": null, "size": 35.85, "width": 1000, "height": 563}, "small": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_interseccion-de-sucesos_1671547962443.jpg", "hash": 1671547962443, "mime": "image/jpeg", "name": "small_interseccion-de-sucesos.jpg", "path": null, "size": 12.77, "width": 500, "height": 281}, "medium": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_interseccion-de-sucesos_1671547962442.jpg", "hash": 1671547962442, "mime": "image/jpeg", "name": "medium_interseccion-de-sucesos.jpg", "path": null, "size": 23.36, "width": 750, "height": 422}, "thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_interseccion-de-sucesos_1671547962218.jpg", "hash": 1671547962218, "mime": "image/jpeg", "name": "thumbnail_interseccion-de-sucesos.jpg", "path": null, "size": 4.43, "width": 245, "height": 138}}	1671547962201	.jpg	image/jpeg	35.30	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/interseccion-de-sucesos_1671547962201.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:52:43.862	2022-12-20 14:52:43.862	3	3
23	image.png	\N	\N	144	91	\N	1671548023258	.png	image/png	1.33	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671548023258.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:53:45.141	2022-12-20 14:53:45.141	3	3
24	image.png	\N	\N	144	90	\N	1671548048715	.png	image/png	1.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671548048715.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:54:09.876	2022-12-20 14:54:09.876	3	3
25	complementario.jpg	complementario.jpg	complementario.jpg	290	234	{"thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_complementario_1671548364000.jpg", "hash": 1671548364000, "mime": "image/jpeg", "name": "thumbnail_complementario.jpg", "path": null, "size": 4.52, "width": 193, "height": 156}}	1671548363988	.jpg	image/jpeg	9.14	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/complementario_1671548363988.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 14:59:25.39	2022-12-20 14:59:25.39	3	3
26	image.png	\N	\N	50	25	\N	1671548478526	.png	image/png	0.39	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671548478526.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:01:20.46	2022-12-20 15:01:20.46	3	3
27	image.png	\N	\N	232	25	\N	1671548513546	.png	image/png	0.90	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671548513546.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:01:54.849	2022-12-20 15:01:54.849	3	3
28	Diferencia-de-sucesos.png	Diferencia-de-sucesos.png	Diferencia-de-sucesos.png	335	251	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Diferencia-de-sucesos_1671548696623.png", "hash": 1671548696623, "mime": "image/png", "name": "thumbnail_Diferencia-de-sucesos.png", "path": null, "size": 15.58, "width": 208, "height": 156}}	1671548696603	.png	image/png	29.09	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Diferencia-de-sucesos_1671548696603.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:04:57.983	2022-12-20 15:04:57.983	3	3
42	image.png	\N	\N	125	25	\N	1671550466807	.png	image/png	0.69	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466807.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.209	2022-12-20 15:34:28.209	3	3
29	disjuntos.png	disjuntos.png	disjuntos.png	247	204	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_disjuntos_1671548910541.png", "hash": 1671548910541, "mime": "image/png", "name": "thumbnail_disjuntos.png", "path": null, "size": 9.52, "width": 189, "height": 156}}	1671548910522	.png	image/png	3.80	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/disjuntos_1671548910522.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:08:32.713	2022-12-20 15:08:32.713	3	3
30	PROPIEDADES PROBABILIDAD.png	PROPIEDADES PROBABILIDAD.png	PROPIEDADES PROBABILIDAD.png	329	153	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROPIEDADES PROBABILIDAD_1671549394818.png", "hash": 1671549394818, "mime": "image/png", "name": "thumbnail_PROPIEDADES PROBABILIDAD.png", "path": null, "size": 24.39, "width": 245, "height": 114}}	1671549394799	.png	image/png	7.14	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROPIEDADES PROBABILIDAD_1671549394799.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:16:36.612	2022-12-20 15:16:36.612	3	3
31	Captura de pantalla 2022-12-20 105114.png	Captura de pantalla 2022-12-20 105114.png	Captura de pantalla 2022-12-20 105114.png	826	436	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Captura de pantalla 2022-12-20 105114_1671549395253.png", "hash": 1671549395253, "mime": "image/png", "name": "small_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 52.82, "width": 500, "height": 264}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Captura de pantalla 2022-12-20 105114_1671549395255.png", "hash": 1671549395255, "mime": "image/png", "name": "medium_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 100.87, "width": 750, "height": 396}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Captura de pantalla 2022-12-20 105114_1671549395007.png", "hash": 1671549395007, "mime": "image/png", "name": "thumbnail_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 17.4, "width": 245, "height": 129}}	1671549394964	.png	image/png	66.13	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Captura de pantalla 2022-12-20 105114_1671549394964.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:16:37.007	2022-12-20 15:16:37.007	3	3
32	Captura de pantalla 2022-12-20 105114.png	\N	\N	826	436	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Captura de pantalla 2022-12-20 105114_1671549462437.png", "hash": 1671549462437, "mime": "image/png", "name": "small_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 52.82, "width": 500, "height": 264}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Captura de pantalla 2022-12-20 105114_1671549462439.png", "hash": 1671549462439, "mime": "image/png", "name": "medium_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 100.87, "width": 750, "height": 396}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Captura de pantalla 2022-12-20 105114_1671549462199.png", "hash": 1671549462199, "mime": "image/png", "name": "thumbnail_Captura de pantalla 2022-12-20 105114.png", "path": null, "size": 17.4, "width": 245, "height": 129}}	1671549462157	.png	image/png	66.13	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Captura de pantalla 2022-12-20 105114_1671549462157.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:17:43.949	2022-12-20 15:17:43.949	3	3
33	PROBABILIDAD.png	PROBABILIDAD.png	PROBABILIDAD.png	749	706	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_PROBABILIDAD_1671549860733.png", "hash": 1671549860733, "mime": "image/png", "name": "small_PROBABILIDAD.png", "path": null, "size": 109.28, "width": 500, "height": 471}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROBABILIDAD_1671549860512.png", "hash": 1671549860512, "mime": "image/png", "name": "thumbnail_PROBABILIDAD.png", "path": null, "size": 26.27, "width": 166, "height": 156}}	1671549860470	.png	image/png	50.21	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROBABILIDAD_1671549860470.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:24:22.178	2022-12-20 15:24:22.178	3	3
34	image.png	\N	\N	83	25	\N	1671550466694	.png	image/png	0.60	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466694.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.031	2022-12-20 15:34:28.031	3	3
35	image.png	\N	\N	91	25	\N	1671550466751	.png	image/png	0.60	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466751.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.057	2022-12-20 15:34:28.057	3	3
36	image.png	\N	\N	15	25	\N	1671550466701	.png	image/png	0.17	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466701.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.062	2022-12-20 15:34:28.062	3	3
37	image.png	\N	\N	92	25	\N	1671550466783	.png	image/png	0.60	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466783.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.096	2022-12-20 15:34:28.096	3	3
38	image.png	\N	\N	408	25	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671550466722.png", "hash": 1671550466722, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.97, "width": 245, "height": 15}}	1671550466706	.png	image/png	1.14	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466706.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.105	2022-12-20 15:34:28.105	3	3
39	image.png	\N	\N	319	25	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671550466716.png", "hash": 1671550466716, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 6.66, "width": 245, "height": 19}}	1671550466697	.png	image/png	0.97	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466697.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.129	2022-12-20 15:34:28.129	3	3
40	image.png	\N	\N	113	25	\N	1671550466698	.png	image/png	0.67	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466698.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.131	2022-12-20 15:34:28.131	3	3
43	image.png	\N	\N	216	25	\N	1671550466725	.png	image/png	0.84	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466725.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.259	2022-12-20 15:34:28.259	3	3
47	image.png	\N	\N	418	25	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671550641180.png", "hash": 1671550641180, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.97, "width": 245, "height": 15}}	1671550641161	.png	image/png	1.20	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550641161.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:37:22.846	2022-12-20 15:37:22.846	3	3
44	image.png	\N	\N	214	25	\N	1671550466708	.png	image/png	0.85	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550466708.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:34:28.489	2022-12-20 15:34:28.489	3	3
45	image.png	\N	\N	736	51	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671550558111.png", "hash": 1671550558111, "mime": "image/png", "name": "small_image.png", "path": null, "size": 12.1, "width": 500, "height": 35}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671550557924.png", "hash": 1671550557924, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.45, "width": 245, "height": 17}}	1671550557909	.png	image/png	2.24	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550557909.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:35:59.479	2022-12-20 15:35:59.479	3	3
46	image.png	\N	\N	334	25	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671550641178.png", "hash": 1671550641178, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 6.19, "width": 245, "height": 18}}	1671550641163	.png	image/png	1.04	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671550641163.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 15:37:22.521	2022-12-20 15:37:22.521	3	3
48	image.png	\N	\N	376	106	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671553655299.png", "hash": 1671553655299, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.18, "width": 245, "height": 69}}	1671553655279	.png	image/png	2.84	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671553655279.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 16:27:36.877	2022-12-20 16:27:36.877	3	3
49	PROBABILIDAD CONDICIONAL.png	PROBABILIDAD CONDICIONAL.png	PROBABILIDAD CONDICIONAL.png	439	332	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROBABILIDAD CONDICIONAL_1671554088269.png", "hash": 1671554088269, "mime": "image/png", "name": "thumbnail_PROBABILIDAD CONDICIONAL.png", "path": null, "size": 17.33, "width": 206, "height": 156}}	1671554088229	.png	image/png	36.43	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROBABILIDAD CONDICIONAL_1671554088229.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 16:34:49.781	2022-12-20 16:34:49.781	3	3
50	image.png	\N	\N	1256	352	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_image_1671554557981.png", "hash": 1671554557981, "mime": "image/png", "name": "large_image.png", "path": null, "size": 169.24, "width": 1000, "height": 280}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671554557975.png", "hash": 1671554557975, "mime": "image/png", "name": "small_image.png", "path": null, "size": 57.94, "width": 500, "height": 140}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671554557979.png", "hash": 1671554557979, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 107.43, "width": 750, "height": 210}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671554557717.png", "hash": 1671554557717, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.85, "width": 245, "height": 69}}	1671554557665	.png	image/png	217.15	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671554557665.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 16:42:39.899	2022-12-20 16:42:39.899	3	3
51	independencia de eventos.png	independencia de eventos.png	independencia de eventos.png	258	387	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_independencia de eventos_1671555040862.png", "hash": 1671555040862, "mime": "image/png", "name": "thumbnail_independencia de eventos.png", "path": null, "size": 22.02, "width": 104, "height": 156}}	1671555040835	.png	image/png	80.78	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/independencia de eventos_1671555040835.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 16:50:42.372	2022-12-20 16:50:42.372	3	3
52	image.png	\N	\N	567	139	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671556254894.png", "hash": 1671556254894, "mime": "image/png", "name": "small_image.png", "path": null, "size": 8.98, "width": 500, "height": 123}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671556254697.png", "hash": 1671556254697, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 3.66, "width": 245, "height": 60}}	1671556254678	.png	image/png	3.22	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671556254678.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:10:56.243	2022-12-20 17:10:56.243	3	3
53	image.png	\N	\N	567	139	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671556287687.png", "hash": 1671556287687, "mime": "image/png", "name": "small_image.png", "path": null, "size": 8.98, "width": 500, "height": 123}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671556287490.png", "hash": 1671556287490, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 3.66, "width": 245, "height": 60}}	1671556287473	.png	image/png	3.22	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671556287473.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:11:28.725	2022-12-20 17:11:28.725	3	3
172	AXIOMATICA PROBABILISTICA.png	AXIOMATICA PROBABILISTICA.png	AXIOMATICA PROBABILISTICA.png	350	247	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_AXIOMATICA PROBABILISTICA_1671721292447.png", "hash": 1671721292447, "mime": "image/png", "name": "thumbnail_AXIOMATICA PROBABILISTICA.png", "path": null, "size": 53.06, "width": 221, "height": 156}}	1671721292412	.png	image/png	69.33	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/AXIOMATICA PROBABILISTICA_1671721292412.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:01:34.145	2022-12-22 15:01:34.145	3	3
54	image.png	\N	\N	556	335	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671556326588.png", "hash": 1671556326588, "mime": "image/png", "name": "small_image.png", "path": null, "size": 43.96, "width": 500, "height": 301}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671556326374.png", "hash": 1671556326374, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.11, "width": 245, "height": 148}}	1671556326343	.png	image/png	13.13	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671556326343.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:12:07.965	2022-12-20 17:12:07.965	3	3
55	TEPOREMA DE PROBABILIDAD TOTAL.gif	TEPOREMA DE PROBABILIDAD TOTAL.gif	TEPOREMA DE PROBABILIDAD TOTAL.gif	600	512	\N	1671557387943	.gif	image/gif	15.95	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/TEPOREMA DE PROBABILIDAD TOTAL_1671557387943.gif	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:29:49.167	2022-12-20 17:29:49.167	3	3
56	TEPOREMA DE PROBABILIDAD TOTAL.gif	TEPOREMA DE PROBABILIDAD TOTAL.gif	TEPOREMA DE PROBABILIDAD TOTAL.gif	600	512	\N	1671557387946	.gif	image/gif	15.95	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/TEPOREMA DE PROBABILIDAD TOTAL_1671557387946.gif	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:29:49.261	2022-12-20 17:29:49.261	3	3
57	image.png	\N	\N	444	95	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671558034794.png", "hash": 1671558034794, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.72, "width": 245, "height": 52}}	1671558034776	.png	image/png	2.95	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671558034776.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:40:36.63	2022-12-20 17:40:36.63	3	3
58	image.png	\N	\N	315	204	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671558198306.png", "hash": 1671558198306, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.27, "width": 241, "height": 156}}	1671558198285	.png	image/png	1.63	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671558198285.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:43:19.891	2022-12-20 17:43:19.891	3	3
59	image.png	\N	\N	318	105	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671558385362.png", "hash": 1671558385362, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 2.95, "width": 245, "height": 81}}	1671558385343	.png	image/png	1.70	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671558385343.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:46:26.772	2022-12-20 17:46:26.772	3	3
60	image.png	\N	\N	620	110	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671558463290.png", "hash": 1671558463290, "mime": "image/png", "name": "small_image.png", "path": null, "size": 22.88, "width": 500, "height": 89}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671558463092.png", "hash": 1671558463092, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 8.03, "width": 245, "height": 43}}	1671558463074	.png	image/png	5.07	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671558463074.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:47:44.861	2022-12-20 17:47:44.861	3	3
61	image.png	\N	\N	607	366	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671558486213.png", "hash": 1671558486213, "mime": "image/png", "name": "small_image.png", "path": null, "size": 45.34, "width": 500, "height": 301}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671558485999.png", "hash": 1671558485999, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.25, "width": 245, "height": 148}}	1671558485967	.png	image/png	15.15	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671558485967.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:48:07.501	2022-12-20 17:48:07.501	3	3
62	TEOREMA DE BAYES.png	TEOREMA DE BAYES.png	TEOREMA DE BAYES.png	500	430	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_TEOREMA DE BAYES_1671558538094.png", "hash": 1671558538094, "mime": "image/png", "name": "thumbnail_TEOREMA DE BAYES.png", "path": null, "size": 31.97, "width": 181, "height": 156}}	1671558538057	.png	image/png	109.36	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/TEOREMA DE BAYES_1671558538057.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 17:48:59.599	2022-12-20 17:48:59.599	3	3
63	TECNICAS DE CONTEO.webp	TECNICAS DE CONTEO.webp	TECNICAS DE CONTEO.webp	638	493	{"small": {"ext": ".webp", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_TECNICAS DE CONTEO_1671559574687.webp", "hash": 1671559574687, "mime": "image/webp", "name": "small_TECNICAS DE CONTEO.webp", "path": null, "size": 13.71, "width": 500, "height": 386}, "thumbnail": {"ext": ".webp", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_TECNICAS DE CONTEO_1671559574451.webp", "hash": 1671559574451, "mime": "image/webp", "name": "thumbnail_TECNICAS DE CONTEO.webp", "path": null, "size": 3.75, "width": 202, "height": 156}}	1671559574425	.webp	image/webp	22.52	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/TECNICAS DE CONTEO_1671559574425.webp	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 18:06:16.218	2022-12-20 18:06:16.218	3	3
71	image.png	\N	\N	610	260	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671572257867.png", "hash": 1671572257867, "mime": "image/png", "name": "small_image.png", "path": null, "size": 12.93, "width": 500, "height": 213}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671572257661.png", "hash": 1671572257661, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.75, "width": 245, "height": 104}}	1671572257634	.png	image/png	3.78	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671572257634.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 21:37:39.397	2022-12-20 21:37:39.397	3	3
64	regla de la multiplicacion.png	regla de la multiplicacion.png	regla de la multiplicacion.png	817	366	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_regla de la multiplicacion_1671561723286.png", "hash": 1671561723286, "mime": "image/png", "name": "small_regla de la multiplicacion.png", "path": null, "size": 119.63, "width": 500, "height": 224}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_regla de la multiplicacion_1671561723288.png", "hash": 1671561723288, "mime": "image/png", "name": "medium_regla de la multiplicacion.png", "path": null, "size": 258.4, "width": 750, "height": 336}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_regla de la multiplicacion_1671561723031.png", "hash": 1671561723031, "mime": "image/png", "name": "thumbnail_regla de la multiplicacion.png", "path": null, "size": 31, "width": 245, "height": 110}}	1671561722987	.png	image/png	230.00	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/regla de la multiplicacion_1671561722987.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 18:42:05.154	2022-12-20 18:42:05.154	3	3
65	image.png	\N	\N	319	134	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671562835684.png", "hash": 1671562835684, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 12.24, "width": 245, "height": 103}}	1671562835663	.png	image/png	16.90	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671562835663.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 19:00:37.426	2022-12-20 19:00:37.426	3	3
66	image.png	\N	\N	1114	253	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_image_1671563006512.png", "hash": 1671563006512, "mime": "image/png", "name": "large_image.png", "path": null, "size": 126.71, "width": 1000, "height": 227}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671563006511.png", "hash": 1671563006511, "mime": "image/png", "name": "small_image.png", "path": null, "size": 41.32, "width": 500, "height": 114}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671563006514.png", "hash": 1671563006514, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 77.74, "width": 750, "height": 170}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671563006286.png", "hash": 1671563006286, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 13.58, "width": 245, "height": 56}}	1671563006245	.png	image/png	130.35	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671563006245.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 19:03:28.102	2022-12-20 19:03:28.102	3	3
67	permutacion.png	permutacion.png	permutacion.png	862	610	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_permutacion_1671563743286.png", "hash": 1671563743286, "mime": "image/png", "name": "small_permutacion.png", "path": null, "size": 84.61, "width": 500, "height": 354}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_permutacion_1671563743288.png", "hash": 1671563743288, "mime": "image/png", "name": "medium_permutacion.png", "path": null, "size": 152.63, "width": 750, "height": 531}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_permutacion_1671563743035.png", "hash": 1671563743035, "mime": "image/png", "name": "thumbnail_permutacion.png", "path": null, "size": 24.74, "width": 220, "height": 156}}	1671563742978	.png	image/png	72.92	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/permutacion_1671563742978.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 19:15:44.865	2022-12-20 19:15:44.865	3	3
68	image.png	\N	\N	876	158	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671564038724.png", "hash": 1671564038724, "mime": "image/png", "name": "small_image.png", "path": null, "size": 18.83, "width": 500, "height": 90}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671564038721.png", "hash": 1671564038721, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 35.42, "width": 750, "height": 135}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671564038513.png", "hash": 1671564038513, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 6.7, "width": 245, "height": 44}}	1671564038489	.png	image/png	37.08	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671564038489.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 19:20:40.318	2022-12-20 19:20:40.318	3	3
69	Combinacion.png	Combinacion.png	Combinacion.png	833	527	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Combinacion_1671564175938.png", "hash": 1671564175938, "mime": "image/png", "name": "small_Combinacion.png", "path": null, "size": 70.47, "width": 500, "height": 316}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Combinacion_1671564175936.png", "hash": 1671564175936, "mime": "image/png", "name": "medium_Combinacion.png", "path": null, "size": 127.28, "width": 750, "height": 474}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Combinacion_1671564175687.png", "hash": 1671564175687, "mime": "image/png", "name": "thumbnail_Combinacion.png", "path": null, "size": 24.94, "width": 245, "height": 155}}	1671564175639	.png	image/png	75.79	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Combinacion_1671564175639.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 19:22:57.414	2022-12-20 19:22:57.414	3	3
70	V.A..jpg	V.A..jpg	V.A..jpg	409	247	{"thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_V.A._1671571724199.jpg", "hash": 1671571724199, "mime": "image/jpeg", "name": "thumbnail_V.A..jpg", "path": null, "size": 5.26, "width": 245, "height": 148}}	1671571724180	.jpg	image/jpeg	11.02	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/V.A._1671571724180.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 21:28:45.591	2022-12-20 21:28:45.591	3	3
72	image.png	\N	\N	610	260	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671572303326.png", "hash": 1671572303326, "mime": "image/png", "name": "small_image.png", "path": null, "size": 12.93, "width": 500, "height": 213}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671572303119.png", "hash": 1671572303119, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.75, "width": 245, "height": 104}}	1671572303092	.png	image/png	3.78	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671572303092.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 21:38:24.652	2022-12-20 21:38:24.652	3	3
73	image.png	\N	\N	470	42	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671572409758.png", "hash": 1671572409758, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.49, "width": 245, "height": 22}}	1671572409745	.png	image/png	2.71	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671572409745.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 21:40:11.317	2022-12-20 21:40:11.317	3	3
74	image.png	\N	\N	827	427	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576019478.png", "hash": 1671576019478, "mime": "image/png", "name": "small_image.png", "path": null, "size": 42.36, "width": 500, "height": 258}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576019480.png", "hash": 1671576019480, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 79.66, "width": 750, "height": 387}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576019239.png", "hash": 1671576019239, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.09, "width": 245, "height": 126}}	1671576019193	.png	image/png	41.56	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576019193.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:40:21.248	2022-12-20 22:40:21.248	3	3
75	image.png	\N	\N	831	558	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576116039.png", "hash": 1671576116039, "mime": "image/png", "name": "small_image.png", "path": null, "size": 59.99, "width": 500, "height": 336}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576116042.png", "hash": 1671576116042, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 112.24, "width": 750, "height": 504}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576115783.png", "hash": 1671576115783, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.61, "width": 232, "height": 156}}	1671576115733	.png	image/png	42.71	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576115733.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:41:57.708	2022-12-20 22:41:57.708	3	3
76	image.png	\N	\N	809	528	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576291324.png", "hash": 1671576291324, "mime": "image/png", "name": "small_image.png", "path": null, "size": 62.75, "width": 500, "height": 326}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576291326.png", "hash": 1671576291326, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 113.14, "width": 750, "height": 489}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576291076.png", "hash": 1671576291076, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.33, "width": 239, "height": 156}}	1671576291024	.png	image/png	42.17	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576291024.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:44:52.764	2022-12-20 22:44:52.764	3	3
77	image.png	\N	\N	822	372	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576342073.png", "hash": 1671576342073, "mime": "image/png", "name": "small_image.png", "path": null, "size": 43.82, "width": 500, "height": 226}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576342075.png", "hash": 1671576342075, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 78.69, "width": 750, "height": 339}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576341842.png", "hash": 1671576341842, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.68, "width": 245, "height": 111}}	1671576341793	.png	image/png	22.61	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576341793.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:45:43.479	2022-12-20 22:45:43.479	3	3
78	image.png	\N	\N	846	598	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576449742.png", "hash": 1671576449742, "mime": "image/png", "name": "small_image.png", "path": null, "size": 70.38, "width": 500, "height": 353}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576449740.png", "hash": 1671576449740, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 129.5, "width": 750, "height": 530}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576449479.png", "hash": 1671576449479, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.96, "width": 221, "height": 156}}	1671576449424	.png	image/png	55.71	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576449424.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:47:31.231	2022-12-20 22:47:31.231	3	3
105	image.png	\N	\N	245	141	\N	1671591799051	.png	image/png	11.57	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671591799051.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:03:20.599	2022-12-21 03:03:20.599	4	4
79	image.png	\N	\N	847	510	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576567101.png", "hash": 1671576567101, "mime": "image/png", "name": "small_image.png", "path": null, "size": 57.43, "width": 500, "height": 301}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576567103.png", "hash": 1671576567103, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 105.95, "width": 750, "height": 452}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576566860.png", "hash": 1671576566860, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.32, "width": 245, "height": 148}}	1671576566814	.png	image/png	36.94	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576566814.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:49:28.5	2022-12-20 22:49:28.5	3	3
80	image.png	\N	\N	872	545	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576658914.png", "hash": 1671576658914, "mime": "image/png", "name": "small_image.png", "path": null, "size": 52.72, "width": 500, "height": 313}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576658916.png", "hash": 1671576658916, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 95.39, "width": 750, "height": 469}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576658671.png", "hash": 1671576658671, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.62, "width": 245, "height": 153}}	1671576658612	.png	image/png	38.19	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576658612.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:51:00.259	2022-12-20 22:51:00.259	3	3
81	image.png	\N	\N	854	649	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576850300.png", "hash": 1671576850300, "mime": "image/png", "name": "small_image.png", "path": null, "size": 92.33, "width": 500, "height": 380}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576850302.png", "hash": 1671576850302, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 168.79, "width": 750, "height": 570}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576850046.png", "hash": 1671576850046, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24, "width": 205, "height": 156}}	1671576849982	.png	image/png	125.49	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576849982.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:54:12.16	2022-12-20 22:54:12.16	3	3
82	image.png	\N	\N	855	584	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671576923868.png", "hash": 1671576923868, "mime": "image/png", "name": "small_image.png", "path": null, "size": 65.25, "width": 500, "height": 342}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671576923870.png", "hash": 1671576923870, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 121.91, "width": 750, "height": 512}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671576923608.png", "hash": 1671576923608, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.38, "width": 228, "height": 156}}	1671576923555	.png	image/png	54.44	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671576923555.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:55:25.388	2022-12-20 22:55:25.388	3	3
83	image.png	\N	\N	864	462	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671577015887.png", "hash": 1671577015887, "mime": "image/png", "name": "small_image.png", "path": null, "size": 91.41, "width": 500, "height": 267}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671577015889.png", "hash": 1671577015889, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 176.01, "width": 750, "height": 401}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671577015641.png", "hash": 1671577015641, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 29.42, "width": 245, "height": 131}}	1671577015586	.png	image/png	152.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671577015586.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:56:57.492	2022-12-20 22:56:57.492	3	3
84	image.png	\N	\N	740	371	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671577076610.png", "hash": 1671577076610, "mime": "image/png", "name": "small_image.png", "path": null, "size": 46.47, "width": 500, "height": 251}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671577076395.png", "hash": 1671577076395, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.08, "width": 245, "height": 123}}	1671577076359	.png	image/png	35.28	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671577076359.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:57:58.032	2022-12-20 22:57:58.032	3	3
136	image.png	\N	\N	538	290	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671625219338.png", "hash": 1671625219338, "mime": "image/png", "name": "small_image.png", "path": null, "size": 48.45, "width": 500, "height": 270}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625219116.png", "hash": 1671625219116, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.41, "width": 245, "height": 132}}	1671625219077	.png	image/png	38.87	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625219077.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:20:20.714	2022-12-21 12:20:20.714	3	3
85	image.png	\N	\N	863	464	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671577120548.png", "hash": 1671577120548, "mime": "image/png", "name": "small_image.png", "path": null, "size": 92.22, "width": 500, "height": 269}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671577120551.png", "hash": 1671577120551, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 175.37, "width": 750, "height": 403}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671577120294.png", "hash": 1671577120294, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 29.73, "width": 245, "height": 132}}	1671577120243	.png	image/png	152.39	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671577120243.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 22:58:42.364	2022-12-20 22:58:42.364	3	3
86	V.A.D.png	V.A.D.png	V.A.D.png	364	138	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_V.A.D_1671577623782.png", "hash": 1671577623782, "mime": "image/png", "name": "thumbnail_V.A.D.png", "path": null, "size": 7.45, "width": 245, "height": 93}}	1671577623765	.png	image/png	3.69	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/V.A.D_1671577623765.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:07:04.952	2022-12-20 23:07:04.952	3	3
87	image.png	\N	\N	802	619	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671577957021.png", "hash": 1671577957021, "mime": "image/png", "name": "small_image.png", "path": null, "size": 62.68, "width": 500, "height": 386}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671577957023.png", "hash": 1671577957023, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 118.32, "width": 750, "height": 579}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671577956748.png", "hash": 1671577956748, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.45, "width": 202, "height": 156}}	1671577956681	.png	image/png	85.26	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671577956681.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:12:38.721	2022-12-20 23:12:38.721	3	3
88	image.png	\N	\N	809	670	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671578167932.png", "hash": 1671578167932, "mime": "image/png", "name": "small_image.png", "path": null, "size": 65.18, "width": 500, "height": 414}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671578167933.png", "hash": 1671578167933, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 119.89, "width": 750, "height": 621}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671578167664.png", "hash": 1671578167664, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.36, "width": 188, "height": 156}}	1671578167608	.png	image/png	58.68	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671578167608.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:16:09.512	2022-12-20 23:16:09.512	3	3
89	image.png	\N	\N	947	560	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671578307966.png", "hash": 1671578307966, "mime": "image/png", "name": "small_image.png", "path": null, "size": 41.97, "width": 500, "height": 296}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671578307968.png", "hash": 1671578307968, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 76.53, "width": 750, "height": 444}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671578307710.png", "hash": 1671578307710, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.65, "width": 245, "height": 145}}	1671578307658	.png	image/png	75.35	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671578307658.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:18:29.313	2022-12-20 23:18:29.313	3	3
90	image.png	\N	\N	897	583	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671578382724.png", "hash": 1671578382724, "mime": "image/png", "name": "small_image.png", "path": null, "size": 45.55, "width": 500, "height": 325}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671578382726.png", "hash": 1671578382726, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 83.09, "width": 750, "height": 487}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671578382468.png", "hash": 1671578382468, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.75, "width": 240, "height": 156}}	1671578382412	.png	image/png	79.42	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671578382412.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:19:44.596	2022-12-20 23:19:44.596	3	3
91	image.png	\N	\N	813	353	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671578435180.png", "hash": 1671578435180, "mime": "image/png", "name": "small_image.png", "path": null, "size": 31.53, "width": 500, "height": 217}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671578435177.png", "hash": 1671578435177, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 56.88, "width": 750, "height": 326}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671578434942.png", "hash": 1671578434942, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.87, "width": 245, "height": 106}}	1671578434905	.png	image/png	34.55	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671578434905.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:20:36.455	2022-12-20 23:20:36.455	3	3
92	image.png	\N	\N	849	566	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671578520021.png", "hash": 1671578520021, "mime": "image/png", "name": "small_image.png", "path": null, "size": 67.16, "width": 500, "height": 333}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671578520019.png", "hash": 1671578520019, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 125.17, "width": 750, "height": 500}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671578519767.png", "hash": 1671578519767, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.39, "width": 234, "height": 156}}	1671578519720	.png	image/png	104.07	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671578519720.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:22:01.604	2022-12-20 23:22:01.604	3	3
93	distribuciones continuas.png	distribuciones continuas.png	distribuciones continuas.png	1152	806	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_distribuciones continuas_1671579064298.png", "hash": 1671579064298, "mime": "image/png", "name": "large_distribuciones continuas.png", "path": null, "size": 45.85, "width": 1000, "height": 700}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_distribuciones continuas_1671579064301.png", "hash": 1671579064301, "mime": "image/png", "name": "small_distribuciones continuas.png", "path": null, "size": 19.41, "width": 500, "height": 350}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_distribuciones continuas_1671579064300.png", "hash": 1671579064300, "mime": "image/png", "name": "medium_distribuciones continuas.png", "path": null, "size": 31.82, "width": 750, "height": 525}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_distribuciones continuas_1671579064052.png", "hash": 1671579064052, "mime": "image/png", "name": "thumbnail_distribuciones continuas.png", "path": null, "size": 7.09, "width": 223, "height": 156}}	1671579064002	.png	image/png	10.17	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/distribuciones continuas_1671579064002.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:31:05.818	2022-12-20 23:31:05.818	3	3
94	image.png	\N	\N	804	625	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671579245803.png", "hash": 1671579245803, "mime": "image/png", "name": "small_image.png", "path": null, "size": 99.88, "width": 500, "height": 389}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671579245805.png", "hash": 1671579245805, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 182.73, "width": 750, "height": 583}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671579245538.png", "hash": 1671579245538, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 26.15, "width": 201, "height": 156}}	1671579245484	.png	image/png	64.56	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671579245484.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:34:07.546	2022-12-20 23:34:07.546	3	3
95	image.png	\N	\N	736	586	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671579273714.png", "hash": 1671579273714, "mime": "image/png", "name": "small_image.png", "path": null, "size": 57.62, "width": 500, "height": 398}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671579273482.png", "hash": 1671579273482, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.03, "width": 196, "height": 156}}	1671579273438	.png	image/png	67.91	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671579273438.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:34:35.005	2022-12-20 23:34:35.005	3	3
96	image.png	\N	\N	810	629	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671579302652.png", "hash": 1671579302652, "mime": "image/png", "name": "small_image.png", "path": null, "size": 57.28, "width": 500, "height": 388}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671579302654.png", "hash": 1671579302654, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 101.35, "width": 750, "height": 582}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671579302401.png", "hash": 1671579302401, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.45, "width": 201, "height": 156}}	1671579302355	.png	image/png	31.87	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671579302355.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:35:04.34	2022-12-20 23:35:04.34	3	3
97	image.png	\N	\N	789	634	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671579330892.png", "hash": 1671579330892, "mime": "image/png", "name": "small_image.png", "path": null, "size": 58.63, "width": 500, "height": 402}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671579330894.png", "hash": 1671579330894, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 106.21, "width": 750, "height": 603}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671579330637.png", "hash": 1671579330637, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.74, "width": 194, "height": 156}}	1671579330588	.png	image/png	59.74	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671579330588.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:35:32.152	2022-12-20 23:35:32.152	3	3
98	propiedades variables aleatorias.png	propiedades variables aleatorias.png	propiedades variables aleatorias.png	1920	1080	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_propiedades variables aleatorias_1671579622079.png", "hash": 1671579622079, "mime": "image/png", "name": "large_propiedades variables aleatorias.png", "path": null, "size": 147.57, "width": 1000, "height": 563}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_propiedades variables aleatorias_1671579622076.png", "hash": 1671579622076, "mime": "image/png", "name": "small_propiedades variables aleatorias.png", "path": null, "size": 50.77, "width": 500, "height": 281}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_propiedades variables aleatorias_1671579622078.png", "hash": 1671579622078, "mime": "image/png", "name": "medium_propiedades variables aleatorias.png", "path": null, "size": 96.35, "width": 750, "height": 422}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_propiedades variables aleatorias_1671579621806.png", "hash": 1671579621806, "mime": "image/png", "name": "thumbnail_propiedades variables aleatorias.png", "path": null, "size": 16.16, "width": 245, "height": 138}}	1671579621736	.png	image/png	112.91	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/propiedades variables aleatorias_1671579621736.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:40:23.566	2022-12-20 23:40:23.566	3	3
99	Propiedades V.A.png	Propiedades V.A.png	Propiedades V.A.png	1920	1080	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_Propiedades V.A_1671579622142.png", "hash": 1671579622142, "mime": "image/png", "name": "large_Propiedades V.A.png", "path": null, "size": 147.57, "width": 1000, "height": 563}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Propiedades V.A_1671579622135.png", "hash": 1671579622135, "mime": "image/png", "name": "small_Propiedades V.A.png", "path": null, "size": 50.77, "width": 500, "height": 281}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Propiedades V.A_1671579622140.png", "hash": 1671579622140, "mime": "image/png", "name": "medium_Propiedades V.A.png", "path": null, "size": 96.35, "width": 750, "height": 422}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Propiedades V.A_1671579621811.png", "hash": 1671579621811, "mime": "image/png", "name": "thumbnail_Propiedades V.A.png", "path": null, "size": 16.16, "width": 245, "height": 138}}	1671579621739	.png	image/png	112.91	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Propiedades V.A_1671579621739.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-20 23:40:23.61	2022-12-20 23:40:23.61	3	3
100	Imagen1.png	Imagen1.png	Imagen1.png	1227	1119	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_Imagen1_1671590122982.png", "hash": 1671590122982, "mime": "image/png", "name": "large_Imagen1.png", "path": null, "size": 126.17, "width": 1000, "height": 912}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Imagen1_1671590122979.png", "hash": 1671590122979, "mime": "image/png", "name": "small_Imagen1.png", "path": null, "size": 42.18, "width": 500, "height": 456}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Imagen1_1671590122983.png", "hash": 1671590122983, "mime": "image/png", "name": "medium_Imagen1.png", "path": null, "size": 78.11, "width": 750, "height": 684}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Imagen1_1671590122625.png", "hash": 1671590122625, "mime": "image/png", "name": "thumbnail_Imagen1.png", "path": null, "size": 9.63, "width": 171, "height": 156}}	1671590122543	.png	image/png	152.98	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Imagen1_1671590122543.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 02:35:24.504	2022-12-21 02:35:24.504	4	4
101	image.png	\N	\N	1042	430	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_image_1671591558079.png", "hash": 1671591558079, "mime": "image/png", "name": "large_image.png", "path": null, "size": 105.59, "width": 1000, "height": 413}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671591558078.png", "hash": 1671591558078, "mime": "image/png", "name": "small_image.png", "path": null, "size": 41.56, "width": 500, "height": 206}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671591558081.png", "hash": 1671591558081, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 70.53, "width": 750, "height": 310}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671591557816.png", "hash": 1671591557816, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.25, "width": 245, "height": 101}}	1671591557778	.png	image/png	34.55	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671591557778.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 02:59:19.613	2022-12-21 02:59:19.613	4	4
102	Discrete,markov.jpg	Discrete,markov.jpg	Discrete,markov.jpg	589	177	{"small": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Discrete,markov_1671591627830.jpg", "hash": 1671591627830, "mime": "image/jpeg", "name": "small_Discrete,markov.jpg", "path": null, "size": 15.13, "width": 500, "height": 150}, "thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Discrete,markov_1671591627636.jpg", "hash": 1671591627636, "mime": "image/jpeg", "name": "thumbnail_Discrete,markov.jpg", "path": null, "size": 6.29, "width": 245, "height": 74}}	1671591627622	.jpg	image/jpeg	18.72	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Discrete,markov_1671591627622.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:00:29.19	2022-12-21 03:00:29.19	4	4
103	image.png	\N	\N	655	377	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671591724340.png", "hash": 1671591724340, "mime": "image/png", "name": "small_image.png", "path": null, "size": 42.19, "width": 500, "height": 288}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671591724124.png", "hash": 1671591724124, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.07, "width": 245, "height": 141}}	1671591724088	.png	image/png	22.11	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671591724088.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:02:05.736	2022-12-21 03:02:05.736	4	4
104	image.png	\N	\N	921	530	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671591778801.png", "hash": 1671591778801, "mime": "image/png", "name": "small_image.png", "path": null, "size": 40.9, "width": 500, "height": 288}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671591778802.png", "hash": 1671591778802, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 77.62, "width": 750, "height": 432}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671591778555.png", "hash": 1671591778555, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.41, "width": 245, "height": 141}}	1671591778505	.png	image/png	86.50	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671591778505.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:03:00.232	2022-12-21 03:03:00.232	4	4
106	image.png	\N	\N	901	154	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671591978550.png", "hash": 1671591978550, "mime": "image/png", "name": "small_image.png", "path": null, "size": 15.42, "width": 500, "height": 85}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671591978546.png", "hash": 1671591978546, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 27.66, "width": 750, "height": 128}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671591978341.png", "hash": 1671591978341, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.98, "width": 245, "height": 42}}	1671591978319	.png	image/png	7.09	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671591978319.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:06:20.001	2022-12-21 03:06:20.001	4	4
107	chapman.png	chapman.png	chapman.png	589	331	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_chapman_1671592168783.png", "hash": 1671592168783, "mime": "image/png", "name": "small_chapman.png", "path": null, "size": 41.68, "width": 500, "height": 281}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_chapman_1671592168571.png", "hash": 1671592168571, "mime": "image/png", "name": "thumbnail_chapman.png", "path": null, "size": 17.65, "width": 245, "height": 138}}	1671592168539	.png	image/png	34.96	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/chapman_1671592168539.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:09:30.063	2022-12-21 03:09:30.063	4	4
108	image.png	\N	\N	605	107	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671592699343.png", "hash": 1671592699343, "mime": "image/png", "name": "small_image.png", "path": null, "size": 15.79, "width": 500, "height": 88}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671592699151.png", "hash": 1671592699151, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 6.33, "width": 245, "height": 43}}	1671592699135	.png	image/png	5.05	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671592699135.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:18:20.706	2022-12-21 03:18:20.706	4	4
109	image.png	\N	\N	559	108	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671592736845.png", "hash": 1671592736845, "mime": "image/png", "name": "small_image.png", "path": null, "size": 14.63, "width": 500, "height": 97}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671592736651.png", "hash": 1671592736651, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.96, "width": 245, "height": 47}}	1671592736635	.png	image/png	3.32	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671592736635.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:18:58.001	2022-12-21 03:18:58.001	4	4
110	image.png	\N	\N	549	112	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671592765504.png", "hash": 1671592765504, "mime": "image/png", "name": "small_image.png", "path": null, "size": 14.88, "width": 500, "height": 102}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671592765310.png", "hash": 1671592765310, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 6.27, "width": 245, "height": 50}}	1671592765293	.png	image/png	3.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671592765293.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:19:26.774	2022-12-21 03:19:26.774	4	4
111	image.png	\N	\N	393	145	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671592849534.png", "hash": 1671592849534, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 10.36, "width": 245, "height": 90}}	1671592849514	.png	image/png	4.92	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671592849514.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:20:51.306	2022-12-21 03:20:51.306	4	4
112	image.png	\N	\N	853	636	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671593037678.png", "hash": 1671593037678, "mime": "image/png", "name": "small_image.png", "path": null, "size": 53.14, "width": 500, "height": 373}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671593037679.png", "hash": 1671593037679, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 91.3, "width": 750, "height": 559}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671593037428.png", "hash": 1671593037428, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.8, "width": 209, "height": 156}}	1671593037375	.png	image/png	28.38	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671593037375.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:23:59.198	2022-12-21 03:23:59.198	4	4
113	ergodica.jpg	ergodica.jpg	ergodica.jpg	589	442	{"small": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_ergodica_1671593200179.jpg", "hash": 1671593200179, "mime": "image/jpeg", "name": "small_ergodica.jpg", "path": null, "size": 17.5, "width": 500, "height": 375}, "thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_ergodica_1671593199982.jpg", "hash": 1671593199982, "mime": "image/jpeg", "name": "thumbnail_ergodica.jpg", "path": null, "size": 5.59, "width": 208, "height": 156}}	1671593199964	.jpg	image/jpeg	22.28	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/ergodica_1671593199964.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 03:26:41.273	2022-12-21 03:26:41.273	4	4
114	image.png	\N	\N	940	437	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671622501621.png", "hash": 1671622501621, "mime": "image/png", "name": "small_image.png", "path": null, "size": 73.14, "width": 500, "height": 232}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671622501618.png", "hash": 1671622501618, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 146.55, "width": 750, "height": 349}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671622501365.png", "hash": 1671622501365, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.44, "width": 245, "height": 114}}	1671622501302	.png	image/png	199.87	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671622501302.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:35:03.291	2022-12-21 11:35:03.291	3	3
115	union-de-sucesos-1.jpg	\N	\N	900	506	{"small": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_union-de-sucesos-1_1671622565514.jpg", "hash": 1671622565514, "mime": "image/jpeg", "name": "small_union-de-sucesos-1.jpg", "path": null, "size": 12.92, "width": 500, "height": 281}, "medium": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_union-de-sucesos-1_1671622565512.jpg", "hash": 1671622565512, "mime": "image/jpeg", "name": "medium_union-de-sucesos-1.jpg", "path": null, "size": 26.2, "width": 750, "height": 422}, "thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_union-de-sucesos-1_1671622565297.jpg", "hash": 1671622565297, "mime": "image/jpeg", "name": "thumbnail_union-de-sucesos-1.jpg", "path": null, "size": 4.56, "width": 245, "height": 138}}	1671622565270	.jpg	image/jpeg	36.52	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/union-de-sucesos-1_1671622565270.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:36:08.16	2022-12-21 11:36:08.16	3	3
116	interseccion-de-sucesos.jpg	\N	\N	1024	576	{"large": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_interseccion-de-sucesos_1671622678929.jpg", "hash": 1671622678929, "mime": "image/jpeg", "name": "large_interseccion-de-sucesos.jpg", "path": null, "size": 35.85, "width": 1000, "height": 563}, "small": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_interseccion-de-sucesos_1671622678927.jpg", "hash": 1671622678927, "mime": "image/jpeg", "name": "small_interseccion-de-sucesos.jpg", "path": null, "size": 12.77, "width": 500, "height": 281}, "medium": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_interseccion-de-sucesos_1671622678932.jpg", "hash": 1671622678932, "mime": "image/jpeg", "name": "medium_interseccion-de-sucesos.jpg", "path": null, "size": 23.36, "width": 750, "height": 422}, "thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_interseccion-de-sucesos_1671622678702.jpg", "hash": 1671622678702, "mime": "image/jpeg", "name": "thumbnail_interseccion-de-sucesos.jpg", "path": null, "size": 4.43, "width": 245, "height": 138}}	1671622678686	.jpg	image/jpeg	35.30	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/interseccion-de-sucesos_1671622678686.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:38:00.502	2022-12-21 11:38:00.502	3	3
117	complementario.jpg	\N	\N	290	234	{"thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_complementario_1671623007146.jpg", "hash": 1671623007146, "mime": "image/jpeg", "name": "thumbnail_complementario.jpg", "path": null, "size": 4.52, "width": 193, "height": 156}}	1671623007132	.jpg	image/jpeg	9.14	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/complementario_1671623007132.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:43:28.692	2022-12-21 11:43:28.692	3	3
118	Diferencia-de-sucesos.png	\N	\N	335	251	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Diferencia-de-sucesos_1671623064703.png", "hash": 1671623064703, "mime": "image/png", "name": "thumbnail_Diferencia-de-sucesos.png", "path": null, "size": 15.58, "width": 208, "height": 156}}	1671623064681	.png	image/png	29.09	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Diferencia-de-sucesos_1671623064681.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:44:26.013	2022-12-21 11:44:26.013	3	3
119	disjuntos.png	\N	\N	247	204	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_disjuntos_1671623194045.png", "hash": 1671623194045, "mime": "image/png", "name": "thumbnail_disjuntos.png", "path": null, "size": 9.52, "width": 189, "height": 156}}	1671623194025	.png	image/png	3.80	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/disjuntos_1671623194025.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:46:35.592	2022-12-21 11:46:35.592	3	3
120	regla de la multiplicacion.png	\N	\N	817	366	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_regla de la multiplicacion_1671623582991.png", "hash": 1671623582991, "mime": "image/png", "name": "small_regla de la multiplicacion.png", "path": null, "size": 119.63, "width": 500, "height": 224}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_regla de la multiplicacion_1671623582993.png", "hash": 1671623582993, "mime": "image/png", "name": "medium_regla de la multiplicacion.png", "path": null, "size": 258.4, "width": 750, "height": 336}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_regla de la multiplicacion_1671623582723.png", "hash": 1671623582723, "mime": "image/png", "name": "thumbnail_regla de la multiplicacion.png", "path": null, "size": 31, "width": 245, "height": 110}}	1671623582673	.png	image/png	230.00	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/regla de la multiplicacion_1671623582673.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:53:04.72	2022-12-21 11:53:04.72	3	3
121	permutacion.png	\N	\N	862	610	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_permutacion_1671623719507.png", "hash": 1671623719507, "mime": "image/png", "name": "small_permutacion.png", "path": null, "size": 84.61, "width": 500, "height": 354}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_permutacion_1671623719511.png", "hash": 1671623719511, "mime": "image/png", "name": "medium_permutacion.png", "path": null, "size": 152.63, "width": 750, "height": 531}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_permutacion_1671623719243.png", "hash": 1671623719243, "mime": "image/png", "name": "thumbnail_permutacion.png", "path": null, "size": 24.74, "width": 220, "height": 156}}	1671623719185	.png	image/png	72.92	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/permutacion_1671623719185.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:55:21.023	2022-12-21 11:55:21.023	3	3
122	Combinacion.png	\N	\N	833	527	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Combinacion_1671623920849.png", "hash": 1671623920849, "mime": "image/png", "name": "small_Combinacion.png", "path": null, "size": 70.47, "width": 500, "height": 316}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Combinacion_1671623920848.png", "hash": 1671623920848, "mime": "image/png", "name": "medium_Combinacion.png", "path": null, "size": 127.28, "width": 750, "height": 474}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Combinacion_1671623920595.png", "hash": 1671623920595, "mime": "image/png", "name": "thumbnail_Combinacion.png", "path": null, "size": 24.94, "width": 245, "height": 155}}	1671623920538	.png	image/png	75.79	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Combinacion_1671623920538.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 11:58:42.294	2022-12-21 11:58:42.294	3	3
123	PROBABILIDAD.png	\N	\N	749	706	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_PROBABILIDAD_1671624007033.png", "hash": 1671624007033, "mime": "image/png", "name": "small_PROBABILIDAD.png", "path": null, "size": 109.28, "width": 500, "height": 471}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROBABILIDAD_1671624006799.png", "hash": 1671624006799, "mime": "image/png", "name": "thumbnail_PROBABILIDAD.png", "path": null, "size": 26.27, "width": 166, "height": 156}}	1671624006747	.png	image/png	50.21	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROBABILIDAD_1671624006747.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:00:08.39	2022-12-21 12:00:08.39	3	3
124	propiedades de probabilidades1.jfif	propiedades de probabilidades1.jfif	propiedades de probabilidades1.jfif	400	310	\N	1671624553923	.jfif	image/jpeg	10.68	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/propiedades de probabilidades1_1671624553923.jfif	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:09:15.254	2022-12-21 12:09:15.254	3	3
125	propiedades de probabilidades1.jfif	propiedades de probabilidades1.jfif	propiedades de probabilidades1.jfif	400	310	\N	1671624553928	.jfif	image/jpeg	10.68	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/propiedades de probabilidades1_1671624553928.jfif	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:09:15.339	2022-12-21 12:09:15.339	3	3
126	image.png	\N	\N	975	184	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671624736242.png", "hash": 1671624736242, "mime": "image/png", "name": "small_image.png", "path": null, "size": 29.11, "width": 500, "height": 94}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671624736238.png", "hash": 1671624736238, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 54.37, "width": 750, "height": 142}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671624736010.png", "hash": 1671624736010, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 9.47, "width": 245, "height": 46}}	1671624735973	.png	image/png	22.52	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671624735973.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:12:17.636	2022-12-21 12:12:17.636	3	3
127	image.png	\N	\N	283	149	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671624761775.png", "hash": 1671624761775, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 8.77, "width": 245, "height": 129}}	1671624761743	.png	image/png	7.69	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671624761743.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:12:42.811	2022-12-21 12:12:42.811	3	3
128	image.png	\N	\N	694	137	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671624785564.png", "hash": 1671624785564, "mime": "image/png", "name": "small_image.png", "path": null, "size": 25.31, "width": 500, "height": 99}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671624785363.png", "hash": 1671624785363, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 9.12, "width": 245, "height": 48}}	1671624785336	.png	image/png	19.68	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671624785336.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:13:06.801	2022-12-21 12:13:06.801	3	3
144	PROCESO DE POISSON.png	\N	\N	571	463	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_PROCESO DE POISSON_1671627995433.png", "hash": 1671627995433, "mime": "image/png", "name": "small_PROCESO DE POISSON.png", "path": null, "size": 26.61, "width": 500, "height": 405}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROCESO DE POISSON_1671627995217.png", "hash": 1671627995217, "mime": "image/png", "name": "thumbnail_PROCESO DE POISSON.png", "path": null, "size": 9.51, "width": 192, "height": 156}}	1671627995186	.png	image/png	3.21	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROCESO DE POISSON_1671627995186.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:06:36.852	2022-12-21 13:06:36.852	3	3
129	image.png	\N	\N	936	163	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671624811333.png", "hash": 1671624811333, "mime": "image/png", "name": "small_image.png", "path": null, "size": 20.97, "width": 500, "height": 87}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671624811331.png", "hash": 1671624811331, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 38.52, "width": 750, "height": 131}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671624811108.png", "hash": 1671624811108, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 7.57, "width": 245, "height": 43}}	1671624811078	.png	image/png	22.42	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671624811078.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:13:32.635	2022-12-21 12:13:32.635	3	3
130	image.png	\N	\N	960	537	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671624915236.png", "hash": 1671624915236, "mime": "image/png", "name": "small_image.png", "path": null, "size": 80.69, "width": 500, "height": 280}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671624915239.png", "hash": 1671624915239, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 148.44, "width": 750, "height": 420}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671624914962.png", "hash": 1671624914962, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 27.77, "width": 245, "height": 137}}	1671624914893	.png	image/png	72.42	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671624914893.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:15:16.747	2022-12-21 12:15:16.747	3	3
131	image.png	\N	\N	844	474	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671624942768.png", "hash": 1671624942768, "mime": "image/png", "name": "small_image.png", "path": null, "size": 67.99, "width": 500, "height": 281}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671624942773.png", "hash": 1671624942773, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 128.61, "width": 750, "height": 421}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671624942515.png", "hash": 1671624942515, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.93, "width": 245, "height": 138}}	1671624942456	.png	image/png	62.88	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671624942456.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:15:44.188	2022-12-21 12:15:44.188	3	3
132	image.png	\N	\N	854	513	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671624963944.png", "hash": 1671624963944, "mime": "image/png", "name": "small_image.png", "path": null, "size": 69.72, "width": 500, "height": 300}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671624963947.png", "hash": 1671624963947, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 130.58, "width": 750, "height": 451}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671624963686.png", "hash": 1671624963686, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.55, "width": 245, "height": 147}}	1671624963633	.png	image/png	64.75	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671624963633.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:16:05.168	2022-12-21 12:16:05.168	3	3
133	image.png	\N	\N	938	196	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671625086089.png", "hash": 1671625086089, "mime": "image/png", "name": "small_image.png", "path": null, "size": 34.18, "width": 500, "height": 104}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671625086086.png", "hash": 1671625086086, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 63.36, "width": 750, "height": 157}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625085846.png", "hash": 1671625085846, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.03, "width": 245, "height": 51}}	1671625085810	.png	image/png	27.10	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625085810.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:18:07.549	2022-12-21 12:18:07.549	3	3
134	image.png	\N	\N	932	225	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671625140977.png", "hash": 1671625140977, "mime": "image/png", "name": "small_image.png", "path": null, "size": 36.42, "width": 500, "height": 121}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671625140979.png", "hash": 1671625140979, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 68.45, "width": 750, "height": 181}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625140747.png", "hash": 1671625140747, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.48, "width": 245, "height": 59}}	1671625140705	.png	image/png	27.44	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625140705.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:19:02.267	2022-12-21 12:19:02.267	3	3
135	image.png	\N	\N	455	139	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625163755.png", "hash": 1671625163755, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 12.15, "width": 245, "height": 75}}	1671625163729	.png	image/png	9.34	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625163729.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:19:24.897	2022-12-21 12:19:24.897	3	3
137	image.png	\N	\N	940	152	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671625245014.png", "hash": 1671625245014, "mime": "image/png", "name": "small_image.png", "path": null, "size": 16.14, "width": 500, "height": 81}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671625245009.png", "hash": 1671625245009, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 29.75, "width": 750, "height": 121}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625244790.png", "hash": 1671625244790, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.76, "width": 245, "height": 40}}	1671625244755	.png	image/png	31.54	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625244755.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:20:46.343	2022-12-21 12:20:46.343	3	3
138	image.png	\N	\N	397	84	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625274455.png", "hash": 1671625274455, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 6.56, "width": 245, "height": 52}}	1671625274419	.png	image/png	9.67	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625274419.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:21:14.932	2022-12-21 12:21:14.932	3	3
139	image.png	\N	\N	517	76	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671625295207.png", "hash": 1671625295207, "mime": "image/png", "name": "small_image.png", "path": null, "size": 14.34, "width": 500, "height": 74}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625295010.png", "hash": 1671625295010, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.1, "width": 245, "height": 36}}	1671625294985	.png	image/png	11.31	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625294985.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:21:36.334	2022-12-21 12:21:36.334	3	3
140	image.png	\N	\N	542	72	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671625331973.png", "hash": 1671625331973, "mime": "image/png", "name": "small_image.png", "path": null, "size": 12.76, "width": 500, "height": 66}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625331775.png", "hash": 1671625331775, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.64, "width": 245, "height": 33}}	1671625331751	.png	image/png	10.87	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625331751.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:22:12.868	2022-12-21 12:22:12.868	3	3
141	image.png	\N	\N	940	354	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671625419034.png", "hash": 1671625419034, "mime": "image/png", "name": "small_image.png", "path": null, "size": 37.31, "width": 500, "height": 188}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671625419032.png", "hash": 1671625419032, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 62.11, "width": 750, "height": 282}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671625418798.png", "hash": 1671625418798, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.28, "width": 245, "height": 92}}	1671625418754	.png	image/png	24.31	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671625418754.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:23:40.456	2022-12-21 12:23:40.456	3	3
142	image.png	\N	\N	904	469	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671627558413.png", "hash": 1671627558413, "mime": "image/png", "name": "small_image.png", "path": null, "size": 83.66, "width": 500, "height": 259}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671627558415.png", "hash": 1671627558415, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 161.08, "width": 750, "height": 389}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671627558153.png", "hash": 1671627558153, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 26.3, "width": 245, "height": 127}}	1671627558090	.png	image/png	124.33	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671627558090.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 12:59:20.021	2022-12-21 12:59:20.021	3	3
143	image.png	\N	\N	966	452	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671627605034.png", "hash": 1671627605034, "mime": "image/png", "name": "small_image.png", "path": null, "size": 55.99, "width": 500, "height": 234}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671627605037.png", "hash": 1671627605037, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 100.75, "width": 750, "height": 351}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671627604783.png", "hash": 1671627604783, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.85, "width": 245, "height": 115}}	1671627604730	.png	image/png	38.72	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671627604730.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:00:06.404	2022-12-21 13:00:06.404	3	3
145	PROCESO DE POISSON.png	PROCESO DE POISSON.png	PROCESO DE POISSON.png	571	463	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_PROCESO DE POISSON_1671628034485.png", "hash": 1671628034485, "mime": "image/png", "name": "small_PROCESO DE POISSON.png", "path": null, "size": 26.61, "width": 500, "height": 405}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROCESO DE POISSON_1671628034276.png", "hash": 1671628034276, "mime": "image/png", "name": "thumbnail_PROCESO DE POISSON.png", "path": null, "size": 9.51, "width": 192, "height": 156}}	1671628034242	.png	image/png	3.21	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROCESO DE POISSON_1671628034242.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:07:15.591	2022-12-21 13:07:15.591	3	3
146	PROCESO DE POISSON HOMOGENEO.png	PROCESO DE POISSON HOMOGENEO.png	PROCESO DE POISSON HOMOGENEO.png	595	120	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_PROCESO DE POISSON HOMOGENEO_1671628320291.png", "hash": 1671628320291, "mime": "image/png", "name": "small_PROCESO DE POISSON HOMOGENEO.png", "path": null, "size": 15.77, "width": 500, "height": 101}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROCESO DE POISSON HOMOGENEO_1671628320085.png", "hash": 1671628320085, "mime": "image/png", "name": "thumbnail_PROCESO DE POISSON HOMOGENEO.png", "path": null, "size": 5.9, "width": 245, "height": 49}}	1671628320060	.png	image/png	4.51	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROCESO DE POISSON HOMOGENEO_1671628320060.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:12:01.55	2022-12-21 13:12:01.55	3	3
147	image.png	\N	\N	844	537	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671628992461.png", "hash": 1671628992461, "mime": "image/png", "name": "small_image.png", "path": null, "size": 72.46, "width": 500, "height": 318}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671628992462.png", "hash": 1671628992462, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 130.29, "width": 750, "height": 477}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671628992207.png", "hash": 1671628992207, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 25.46, "width": 245, "height": 156}}	1671628992156	.png	image/png	40.45	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671628992156.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:23:13.969	2022-12-21 13:23:13.969	3	3
148	image.png	\N	\N	895	449	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629017936.png", "hash": 1671629017936, "mime": "image/png", "name": "small_image.png", "path": null, "size": 51.33, "width": 500, "height": 251}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671629017938.png", "hash": 1671629017938, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 92.97, "width": 750, "height": 376}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629017684.png", "hash": 1671629017684, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.61, "width": 245, "height": 123}}	1671629017638	.png	image/png	33.10	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629017638.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:23:39.6	2022-12-21 13:23:39.6	3	3
149	image.png	\N	\N	914	596	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629084341.png", "hash": 1671629084341, "mime": "image/png", "name": "small_image.png", "path": null, "size": 59.61, "width": 500, "height": 326}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671629084343.png", "hash": 1671629084343, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 105.25, "width": 750, "height": 489}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629084063.png", "hash": 1671629084063, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.14, "width": 239, "height": 156}}	1671629083989	.png	image/png	45.58	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629083989.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:24:45.788	2022-12-21 13:24:45.788	3	3
150	image.png	\N	\N	970	608	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629128046.png", "hash": 1671629128046, "mime": "image/png", "name": "small_image.png", "path": null, "size": 62.3, "width": 500, "height": 313}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671629128047.png", "hash": 1671629128047, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 109.64, "width": 750, "height": 470}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629127787.png", "hash": 1671629127787, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.17, "width": 245, "height": 154}}	1671629127734	.png	image/png	45.68	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629127734.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:25:29.38	2022-12-21 13:25:29.38	3	3
158	image.png	\N	\N	595	120	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629753775.png", "hash": 1671629753775, "mime": "image/png", "name": "small_image.png", "path": null, "size": 15.25, "width": 500, "height": 101}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629753579.png", "hash": 1671629753579, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.89, "width": 245, "height": 49}}	1671629753560	.png	image/png	4.45	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629753560.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:35:54.875	2022-12-21 13:35:54.875	3	3
151	image.png	\N	\N	962	566	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629180604.png", "hash": 1671629180604, "mime": "image/png", "name": "small_image.png", "path": null, "size": 50.32, "width": 500, "height": 294}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671629180610.png", "hash": 1671629180610, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 90.06, "width": 750, "height": 441}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629180344.png", "hash": 1671629180344, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.45, "width": 245, "height": 144}}	1671629180287	.png	image/png	39.71	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629180287.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:26:21.979	2022-12-21 13:26:21.979	3	3
152	image.png	\N	\N	931	516	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629238116.png", "hash": 1671629238116, "mime": "image/png", "name": "small_image.png", "path": null, "size": 41.44, "width": 500, "height": 277}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671629238119.png", "hash": 1671629238119, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 73.26, "width": 750, "height": 416}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629237849.png", "hash": 1671629237849, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.5, "width": 245, "height": 136}}	1671629237788	.png	image/png	31.18	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629237788.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:27:19.424	2022-12-21 13:27:19.424	3	3
153	image.png	\N	\N	862	189	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629331256.png", "hash": 1671629331256, "mime": "image/png", "name": "small_image.png", "path": null, "size": 18.95, "width": 500, "height": 110}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671629331258.png", "hash": 1671629331258, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 34.47, "width": 750, "height": 164}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629331047.png", "hash": 1671629331047, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 6.65, "width": 245, "height": 54}}	1671629331017	.png	image/png	12.06	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629331017.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:28:52.713	2022-12-21 13:28:52.713	3	3
154	image.png	\N	\N	719	347	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629403863.png", "hash": 1671629403863, "mime": "image/png", "name": "small_image.png", "path": null, "size": 36.02, "width": 500, "height": 241}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629403647.png", "hash": 1671629403647, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 13.92, "width": 245, "height": 118}}	1671629403609	.png	image/png	18.97	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629403609.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:30:05.354	2022-12-21 13:30:05.354	3	3
155	image.png	\N	\N	921	488	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629432419.png", "hash": 1671629432419, "mime": "image/png", "name": "small_image.png", "path": null, "size": 45.12, "width": 500, "height": 265}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671629432421.png", "hash": 1671629432421, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 78.68, "width": 750, "height": 397}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629432166.png", "hash": 1671629432166, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.3, "width": 245, "height": 130}}	1671629432112	.png	image/png	31.08	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629432112.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:30:33.744	2022-12-21 13:30:33.744	3	3
156	image.png	\N	\N	595	120	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629678052.png", "hash": 1671629678052, "mime": "image/png", "name": "small_image.png", "path": null, "size": 15.57, "width": 500, "height": 101}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629677854.png", "hash": 1671629677854, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.98, "width": 245, "height": 49}}	1671629677832	.png	image/png	4.67	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629677832.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:34:39.333	2022-12-21 13:34:39.333	3	3
157	image.png	\N	\N	595	120	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671629734943.png", "hash": 1671629734943, "mime": "image/png", "name": "small_image.png", "path": null, "size": 15.25, "width": 500, "height": 101}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671629734746.png", "hash": 1671629734746, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.89, "width": 245, "height": 49}}	1671629734726	.png	image/png	4.45	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671629734726.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:35:36.03	2022-12-21 13:35:36.03	3	3
159	image.png	\N	\N	845	520	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630109347.png", "hash": 1671630109347, "mime": "image/png", "name": "small_image.png", "path": null, "size": 72.51, "width": 500, "height": 308}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630109345.png", "hash": 1671630109345, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 129.38, "width": 750, "height": 462}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630109095.png", "hash": 1671630109095, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 25.37, "width": 245, "height": 151}}	1671630109045	.png	image/png	40.31	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630109045.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:41:50.788	2022-12-21 13:41:50.788	3	3
160	image.png	\N	\N	895	442	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630139623.png", "hash": 1671630139623, "mime": "image/png", "name": "small_image.png", "path": null, "size": 51.13, "width": 500, "height": 247}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630139625.png", "hash": 1671630139625, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 92.37, "width": 750, "height": 370}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630139380.png", "hash": 1671630139380, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.58, "width": 245, "height": 121}}	1671630139334	.png	image/png	33.05	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630139334.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:42:21.193	2022-12-21 13:42:21.193	3	3
161	image.png	\N	\N	911	597	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630169033.png", "hash": 1671630169033, "mime": "image/png", "name": "small_image.png", "path": null, "size": 59.69, "width": 500, "height": 328}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630169036.png", "hash": 1671630169036, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 106.29, "width": 750, "height": 491}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630168756.png", "hash": 1671630168756, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.14, "width": 238, "height": 156}}	1671630168703	.png	image/png	45.54	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630168703.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:42:50.481	2022-12-21 13:42:50.481	3	3
162	image.png	\N	\N	958	602	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630190942.png", "hash": 1671630190942, "mime": "image/png", "name": "small_image.png", "path": null, "size": 63.17, "width": 500, "height": 314}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630190944.png", "hash": 1671630190944, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 109.97, "width": 750, "height": 471}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630190671.png", "hash": 1671630190671, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.25, "width": 245, "height": 154}}	1671630190610	.png	image/png	45.57	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630190610.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:43:12.29	2022-12-21 13:43:12.29	3	3
163	image.png	\N	\N	950	561	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630223888.png", "hash": 1671630223888, "mime": "image/png", "name": "small_image.png", "path": null, "size": 50.73, "width": 500, "height": 295}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630223891.png", "hash": 1671630223891, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 90.07, "width": 750, "height": 443}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630223631.png", "hash": 1671630223631, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.66, "width": 245, "height": 145}}	1671630223578	.png	image/png	39.57	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630223578.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:43:45.257	2022-12-21 13:43:45.257	3	3
164	image.png	\N	\N	976	613	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630264103.png", "hash": 1671630264103, "mime": "image/png", "name": "small_image.png", "path": null, "size": 61.72, "width": 500, "height": 314}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630264107.png", "hash": 1671630264107, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 107.95, "width": 750, "height": 471}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630263835.png", "hash": 1671630263835, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.73, "width": 245, "height": 154}}	1671630263771	.png	image/png	45.84	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630263771.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:44:25.853	2022-12-21 13:44:25.853	3	3
252	V.A.D.png	V.A.D.png	V.A.D.png	364	138	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_V.A.D_1671728073824.png", "hash": 1671728073824, "mime": "image/png", "name": "thumbnail_V.A.D.png", "path": null, "size": 7.45, "width": 245, "height": 93}}	1671728073809	.png	image/png	3.69	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/V.A.D_1671728073809.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:54:34.885	2022-12-22 16:55:28.174	3	3
165	image.png	\N	\N	860	187	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630289853.png", "hash": 1671630289853, "mime": "image/png", "name": "small_image.png", "path": null, "size": 18.67, "width": 500, "height": 109}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630289851.png", "hash": 1671630289851, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 34.39, "width": 750, "height": 163}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630289641.png", "hash": 1671630289641, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 6.61, "width": 245, "height": 53}}	1671630289612	.png	image/png	12.03	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630289612.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:44:51.064	2022-12-21 13:44:51.064	3	3
166	image.png	\N	\N	943	344	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630328935.png", "hash": 1671630328935, "mime": "image/png", "name": "small_image.png", "path": null, "size": 25.96, "width": 500, "height": 182}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630328933.png", "hash": 1671630328933, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 45.21, "width": 750, "height": 274}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630328700.png", "hash": 1671630328700, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 9.78, "width": 245, "height": 89}}	1671630328661	.png	image/png	19.90	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630328661.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:45:30.183	2022-12-21 13:45:30.183	3	3
167	image.png	\N	\N	924	524	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630389505.png", "hash": 1671630389505, "mime": "image/png", "name": "small_image.png", "path": null, "size": 48.24, "width": 500, "height": 284}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630389508.png", "hash": 1671630389508, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 83.58, "width": 750, "height": 425}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630389253.png", "hash": 1671630389253, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.93, "width": 245, "height": 139}}	1671630389196	.png	image/png	33.02	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630389196.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:46:30.878	2022-12-21 13:46:30.878	3	3
168	image.png	\N	\N	684	330	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630455555.png", "hash": 1671630455555, "mime": "image/png", "name": "small_image.png", "path": null, "size": 32.42, "width": 500, "height": 241}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630455337.png", "hash": 1671630455337, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 12.53, "width": 245, "height": 118}}	1671630455299	.png	image/png	16.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630455299.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:47:36.985	2022-12-21 13:47:36.985	3	3
169	image.png	\N	\N	683	283	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630474661.png", "hash": 1671630474661, "mime": "image/png", "name": "small_image.png", "path": null, "size": 27.75, "width": 500, "height": 207}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630474446.png", "hash": 1671630474446, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 10.94, "width": 245, "height": 102}}	1671630474410	.png	image/png	13.96	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630474410.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:47:55.882	2022-12-21 13:47:55.882	3	3
170	image.png	\N	\N	910	397	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671630557018.png", "hash": 1671630557018, "mime": "image/png", "name": "small_image.png", "path": null, "size": 45.47, "width": 500, "height": 218}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671630557020.png", "hash": 1671630557020, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 83.62, "width": 750, "height": 327}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671630556774.png", "hash": 1671630556774, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.81, "width": 245, "height": 107}}	1671630556730	.png	image/png	30.18	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671630556730.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:49:18.582	2022-12-21 13:49:18.582	3	3
171	TEST DE APLICABILIDAD POISSON HOMOGENEO.png	TEST DE APLICABILIDAD POISSON HOMOGENEO.png	TEST DE APLICABILIDAD POISSON HOMOGENEO.png	625	108	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_TEST DE APLICABILIDAD POISSON HOMOGENEO_1671630747838.png", "hash": 1671630747838, "mime": "image/png", "name": "small_TEST DE APLICABILIDAD POISSON HOMOGENEO.png", "path": null, "size": 23.84, "width": 500, "height": 86}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_TEST DE APLICABILIDAD POISSON HOMOGENEO_1671630747636.png", "hash": 1671630747636, "mime": "image/png", "name": "thumbnail_TEST DE APLICABILIDAD POISSON HOMOGENEO.png", "path": null, "size": 8.62, "width": 245, "height": 42}}	1671630747609	.png	image/png	9.08	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/TEST DE APLICABILIDAD POISSON HOMOGENEO_1671630747609.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-21 13:52:28.924	2022-12-21 13:52:28.924	3	3
173	image.png	\N	\N	833	553	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671721404422.png", "hash": 1671721404422, "mime": "image/png", "name": "small_image.png", "path": null, "size": 76.83, "width": 500, "height": 332}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671721404424.png", "hash": 1671721404424, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 140.87, "width": 750, "height": 498}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671721404166.png", "hash": 1671721404166, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.65, "width": 235, "height": 156}}	1671721404119	.png	image/png	45.67	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721404119.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:03:25.831	2022-12-22 15:03:25.831	3	3
174	image.png	\N	\N	841	332	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671721453510.png", "hash": 1671721453510, "mime": "image/png", "name": "small_image.png", "path": null, "size": 41.52, "width": 500, "height": 197}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671721453512.png", "hash": 1671721453512, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 74.52, "width": 750, "height": 296}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671721453282.png", "hash": 1671721453282, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.79, "width": 245, "height": 97}}	1671721453248	.png	image/png	23.52	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721453248.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:04:14.977	2022-12-22 15:04:14.977	3	3
175	image.png	\N	\N	808	450	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671721499476.png", "hash": 1671721499476, "mime": "image/png", "name": "small_image.png", "path": null, "size": 48.78, "width": 500, "height": 278}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671721499478.png", "hash": 1671721499478, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 93.8, "width": 750, "height": 418}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671721499224.png", "hash": 1671721499224, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.07, "width": 245, "height": 136}}	1671721499185	.png	image/png	55.74	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721499185.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:05:00.761	2022-12-22 15:05:00.761	3	3
176	image.png	\N	\N	832	575	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671721563826.png", "hash": 1671721563826, "mime": "image/png", "name": "small_image.png", "path": null, "size": 53.07, "width": 500, "height": 346}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671721563828.png", "hash": 1671721563828, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 95.2, "width": 750, "height": 518}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671721563579.png", "hash": 1671721563579, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.5, "width": 226, "height": 156}}	1671721563534	.png	image/png	34.16	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721563534.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:06:05.316	2022-12-22 15:06:05.316	3	3
177	image.png	\N	\N	873	414	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671721599367.png", "hash": 1671721599367, "mime": "image/png", "name": "small_image.png", "path": null, "size": 38.96, "width": 500, "height": 237}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671721599372.png", "hash": 1671721599372, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 68.58, "width": 750, "height": 356}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671721599133.png", "hash": 1671721599133, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 13.51, "width": 245, "height": 116}}	1671721599095	.png	image/png	25.93	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721599095.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:06:40.595	2022-12-22 15:06:40.595	3	3
178	image.png	\N	\N	842	594	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671721682743.png", "hash": 1671721682743, "mime": "image/png", "name": "small_image.png", "path": null, "size": 54.98, "width": 500, "height": 353}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671721682744.png", "hash": 1671721682744, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 97.53, "width": 750, "height": 529}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671721682494.png", "hash": 1671721682494, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.36, "width": 221, "height": 156}}	1671721682445	.png	image/png	35.12	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721682445.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:08:04.444	2022-12-22 15:08:04.444	3	3
179	image.png	\N	\N	821	438	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671721766370.png", "hash": 1671721766370, "mime": "image/png", "name": "small_image.png", "path": null, "size": 58.19, "width": 500, "height": 267}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671721766372.png", "hash": 1671721766372, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 105.4, "width": 750, "height": 400}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671721766136.png", "hash": 1671721766136, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.48, "width": 245, "height": 131}}	1671721766094	.png	image/png	63.60	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721766094.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:09:27.956	2022-12-22 15:09:27.956	3	3
180	image.png	\N	\N	957	477	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671721802584.png", "hash": 1671721802584, "mime": "image/png", "name": "small_image.png", "path": null, "size": 31.66, "width": 500, "height": 249}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671721802585.png", "hash": 1671721802585, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 57.35, "width": 750, "height": 374}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671721802345.png", "hash": 1671721802345, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 12.12, "width": 245, "height": 122}}	1671721802298	.png	image/png	45.48	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721802298.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:10:04.044	2022-12-22 15:10:04.044	3	3
181	PROPIEDADES PROBABILIDAD.png	\N	\N	329	153	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROPIEDADES PROBABILIDAD_1671721947213.png", "hash": 1671721947213, "mime": "image/png", "name": "thumbnail_PROPIEDADES PROBABILIDAD.png", "path": null, "size": 24.39, "width": 245, "height": 114}}	1671721947196	.png	image/png	7.14	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROPIEDADES PROBABILIDAD_1671721947196.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:12:28.775	2022-12-22 15:12:28.775	3	3
182	image.png	\N	\N	846	458	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722144503.png", "hash": 1671722144503, "mime": "image/png", "name": "small_image.png", "path": null, "size": 43.64, "width": 500, "height": 271}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722144505.png", "hash": 1671722144505, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 78.32, "width": 750, "height": 406}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722144271.png", "hash": 1671722144271, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.74, "width": 245, "height": 133}}	1671722144229	.png	image/png	27.65	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722144229.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:15:45.861	2022-12-22 15:15:45.861	3	3
183	PROBABILIDAD.png	PROBABILIDAD.png	PROBABILIDAD.png	749	706	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_PROBABILIDAD_1671722230993.png", "hash": 1671722230993, "mime": "image/png", "name": "small_PROBABILIDAD.png", "path": null, "size": 109.28, "width": 500, "height": 471}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROBABILIDAD_1671722230767.png", "hash": 1671722230767, "mime": "image/png", "name": "thumbnail_PROBABILIDAD.png", "path": null, "size": 26.27, "width": 166, "height": 156}}	1671722230723	.png	image/png	50.21	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROBABILIDAD_1671722230723.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:17:12.377	2022-12-22 15:17:12.377	3	3
184	PROBABILIDAD.png	PROBABILIDAD.png	PROBABILIDAD.png	749	706	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_PROBABILIDAD_1671722230991.png", "hash": 1671722230991, "mime": "image/png", "name": "small_PROBABILIDAD.png", "path": null, "size": 109.28, "width": 500, "height": 471}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROBABILIDAD_1671722230766.png", "hash": 1671722230766, "mime": "image/png", "name": "thumbnail_PROBABILIDAD.png", "path": null, "size": 26.27, "width": 166, "height": 156}}	1671722230721	.png	image/png	50.21	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROBABILIDAD_1671722230721.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:17:12.382	2022-12-22 15:17:12.382	3	3
185	image.png	\N	\N	837	588	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722277953.png", "hash": 1671722277953, "mime": "image/png", "name": "small_image.png", "path": null, "size": 49.12, "width": 500, "height": 351}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722277955.png", "hash": 1671722277955, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 85.55, "width": 750, "height": 527}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722277709.png", "hash": 1671722277709, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.2, "width": 222, "height": 156}}	1671722277660	.png	image/png	32.26	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722277660.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:17:59.172	2022-12-22 15:17:59.172	3	3
186	image.png	\N	\N	847	605	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722331550.png", "hash": 1671722331550, "mime": "image/png", "name": "small_image.png", "path": null, "size": 64.31, "width": 500, "height": 357}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722331553.png", "hash": 1671722331553, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 117.4, "width": 750, "height": 536}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722331293.png", "hash": 1671722331293, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.42, "width": 218, "height": 156}}	1671722331244	.png	image/png	57.90	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722331244.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:18:53.1	2022-12-22 15:18:53.1	3	3
187	image.png	\N	\N	955	635	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722415800.png", "hash": 1671722415800, "mime": "image/png", "name": "small_image.png", "path": null, "size": 73.27, "width": 500, "height": 332}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722415799.png", "hash": 1671722415799, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 129.64, "width": 750, "height": 499}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722415543.png", "hash": 1671722415543, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.89, "width": 235, "height": 156}}	1671722415494	.png	image/png	53.34	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722415494.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:20:17.238	2022-12-22 15:20:17.238	3	3
188	image.png	\N	\N	814	462	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722442524.png", "hash": 1671722442524, "mime": "image/png", "name": "small_image.png", "path": null, "size": 47.57, "width": 500, "height": 284}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722442526.png", "hash": 1671722442526, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 85.59, "width": 750, "height": 426}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722442293.png", "hash": 1671722442293, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.18, "width": 245, "height": 139}}	1671722442252	.png	image/png	29.23	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722442252.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:20:43.999	2022-12-22 15:20:43.999	3	3
189	image.png	\N	\N	827	469	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722469209.png", "hash": 1671722469209, "mime": "image/png", "name": "small_image.png", "path": null, "size": 46.27, "width": 500, "height": 284}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722469211.png", "hash": 1671722469211, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 83.11, "width": 750, "height": 425}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722468978.png", "hash": 1671722468978, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.98, "width": 245, "height": 139}}	1671722468937	.png	image/png	29.29	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722468937.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:21:10.784	2022-12-22 15:21:10.784	3	3
190	image.png	\N	\N	982	225	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722548168.png", "hash": 1671722548168, "mime": "image/png", "name": "small_image.png", "path": null, "size": 30.06, "width": 500, "height": 115}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722548170.png", "hash": 1671722548170, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 56.38, "width": 750, "height": 172}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722547950.png", "hash": 1671722547950, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 9.86, "width": 245, "height": 56}}	1671722547925	.png	image/png	23.73	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722547925.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:22:29.743	2022-12-22 15:22:29.743	3	3
191	image.png	\N	\N	292	165	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722573683.png", "hash": 1671722573683, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 8.53, "width": 245, "height": 138}}	1671722573664	.png	image/png	7.79	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722573664.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:22:54.993	2022-12-22 15:22:54.993	3	3
192	image.png	\N	\N	687	142	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722599890.png", "hash": 1671722599890, "mime": "image/png", "name": "small_image.png", "path": null, "size": 26.6, "width": 500, "height": 103}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722599693.png", "hash": 1671722599693, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 9.33, "width": 245, "height": 51}}	1671722599674	.png	image/png	22.69	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722599674.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:23:21.065	2022-12-22 15:23:21.065	3	3
193	image.png	\N	\N	687	142	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722613376.png", "hash": 1671722613376, "mime": "image/png", "name": "small_image.png", "path": null, "size": 26.6, "width": 500, "height": 103}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722613180.png", "hash": 1671722613180, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 9.33, "width": 245, "height": 51}}	1671722613161	.png	image/png	22.69	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722613161.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:23:34.389	2022-12-22 15:23:34.389	3	3
194	image.png	\N	\N	385	151	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722686464.png", "hash": 1671722686464, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 8.87, "width": 245, "height": 96}}	1671722686446	.png	image/png	11.84	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722686446.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:24:47.985	2022-12-22 15:24:47.985	3	3
195	image.png	\N	\N	836	534	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722744987.png", "hash": 1671722744987, "mime": "image/png", "name": "small_image.png", "path": null, "size": 57.87, "width": 500, "height": 319}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722744990.png", "hash": 1671722744990, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 102.94, "width": 750, "height": 479}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722744744.png", "hash": 1671722744744, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.71, "width": 244, "height": 156}}	1671722744701	.png	image/png	37.14	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722744701.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:25:46.39	2022-12-22 15:25:46.39	3	3
196	image.png	\N	\N	854	506	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722767532.png", "hash": 1671722767532, "mime": "image/png", "name": "small_image.png", "path": null, "size": 69.59, "width": 500, "height": 296}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722767530.png", "hash": 1671722767530, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 130.25, "width": 750, "height": 444}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722767276.png", "hash": 1671722767276, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.7, "width": 245, "height": 145}}	1671722767234	.png	image/png	64.68	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722767234.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:26:09.215	2022-12-22 15:26:09.215	3	3
197	image.png	\N	\N	903	341	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722809687.png", "hash": 1671722809687, "mime": "image/png", "name": "small_image.png", "path": null, "size": 67.17, "width": 500, "height": 189}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722809685.png", "hash": 1671722809685, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 123.56, "width": 750, "height": 283}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722809460.png", "hash": 1671722809460, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.31, "width": 245, "height": 93}}	1671722809426	.png	image/png	107.92	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722809426.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:26:51.412	2022-12-22 15:26:51.412	3	3
198	image.png	\N	\N	896	601	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671722867161.png", "hash": 1671722867161, "mime": "image/png", "name": "small_image.png", "path": null, "size": 86.28, "width": 500, "height": 335}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671722867162.png", "hash": 1671722867162, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 164.96, "width": 750, "height": 503}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671722866905.png", "hash": 1671722866905, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 27.62, "width": 233, "height": 156}}	1671722866854	.png	image/png	136.05	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722866854.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:27:48.688	2022-12-22 15:27:48.688	3	3
199	image.png	\N	\N	974	407	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671723162839.png", "hash": 1671723162839, "mime": "image/png", "name": "small_image.png", "path": null, "size": 53.19, "width": 500, "height": 209}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671723162841.png", "hash": 1671723162841, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 97.8, "width": 750, "height": 313}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671723162608.png", "hash": 1671723162608, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.92, "width": 245, "height": 102}}	1671723162564	.png	image/png	38.67	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671723162564.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:32:44.563	2022-12-22 15:32:44.563	3	3
200	TECNICAS DE CONTEO.webp	TECNICAS DE CONTEO.webp	TECNICAS DE CONTEO.webp	638	493	{"small": {"ext": ".webp", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_TECNICAS DE CONTEO_1671723363336.webp", "hash": 1671723363336, "mime": "image/webp", "name": "small_TECNICAS DE CONTEO.webp", "path": null, "size": 13.71, "width": 500, "height": 386}, "thumbnail": {"ext": ".webp", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_TECNICAS DE CONTEO_1671723363102.webp", "hash": 1671723363102, "mime": "image/webp", "name": "thumbnail_TECNICAS DE CONTEO.webp", "path": null, "size": 3.75, "width": 202, "height": 156}}	1671723363075	.webp	image/webp	22.52	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/TECNICAS DE CONTEO_1671723363075.webp	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:36:04.692	2022-12-22 15:36:04.692	3	3
201	image.png	\N	\N	831	523	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671723753550.png", "hash": 1671723753550, "mime": "image/png", "name": "small_image.png", "path": null, "size": 71.23, "width": 500, "height": 315}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671723753551.png", "hash": 1671723753551, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 131.75, "width": 750, "height": 472}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671723753310.png", "hash": 1671723753310, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.98, "width": 245, "height": 154}}	1671723753266	.png	image/png	41.88	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671723753266.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:42:35.232	2022-12-22 15:42:35.232	3	3
202	image.png	\N	\N	817	367	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671723776495.png", "hash": 1671723776495, "mime": "image/png", "name": "small_image.png", "path": null, "size": 49.19, "width": 500, "height": 225}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671723776496.png", "hash": 1671723776496, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 91.62, "width": 750, "height": 337}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671723776273.png", "hash": 1671723776273, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.81, "width": 245, "height": 110}}	1671723776237	.png	image/png	28.51	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671723776237.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:42:57.936	2022-12-22 15:42:57.936	3	3
203	regla de la multiplicacion.png	\N	\N	817	366	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_regla de la multiplicacion_1671723848389.png", "hash": 1671723848389, "mime": "image/png", "name": "small_regla de la multiplicacion.png", "path": null, "size": 119.63, "width": 500, "height": 224}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_regla de la multiplicacion_1671723848391.png", "hash": 1671723848391, "mime": "image/png", "name": "medium_regla de la multiplicacion.png", "path": null, "size": 258.4, "width": 750, "height": 336}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_regla de la multiplicacion_1671723848135.png", "hash": 1671723848135, "mime": "image/png", "name": "thumbnail_regla de la multiplicacion.png", "path": null, "size": 31, "width": 245, "height": 110}}	1671723848091	.png	image/png	230.00	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/regla de la multiplicacion_1671723848091.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:44:10.034	2022-12-22 15:44:10.034	3	3
204	PRINCIPIO DE LA MULTIPLICACION.png	PRINCIPIO DE LA MULTIPLICACION.png	PRINCIPIO DE LA MULTIPLICACION.png	223	226	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PRINCIPIO DE LA MULTIPLICACION_1671723993828.png", "hash": 1671723993828, "mime": "image/png", "name": "thumbnail_PRINCIPIO DE LA MULTIPLICACION.png", "path": null, "size": 23.31, "width": 154, "height": 156}}	1671723993809	.png	image/png	7.84	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PRINCIPIO DE LA MULTIPLICACION_1671723993809.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:46:34.998	2022-12-22 15:47:53.346	3	3
205	image.png	\N	\N	953	349	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671724413704.png", "hash": 1671724413704, "mime": "image/png", "name": "small_image.png", "path": null, "size": 45.04, "width": 500, "height": 183}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671724413706.png", "hash": 1671724413706, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 83.37, "width": 750, "height": 275}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671724413477.png", "hash": 1671724413477, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.15, "width": 245, "height": 90}}	1671724413443	.png	image/png	46.30	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724413443.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:53:35.311	2022-12-22 15:53:35.311	3	3
206	image.png	\N	\N	953	349	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671724445111.png", "hash": 1671724445111, "mime": "image/png", "name": "small_image.png", "path": null, "size": 45.04, "width": 500, "height": 183}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671724445112.png", "hash": 1671724445112, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 83.37, "width": 750, "height": 275}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671724444885.png", "hash": 1671724444885, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.15, "width": 245, "height": 90}}	1671724444851	.png	image/png	46.30	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724444851.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:54:06.588	2022-12-22 15:54:06.588	3	3
207	image.png	\N	\N	848	613	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671724640400.png", "hash": 1671724640400, "mime": "image/png", "name": "small_image.png", "path": null, "size": 85.44, "width": 500, "height": 361}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671724640402.png", "hash": 1671724640402, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 154.76, "width": 750, "height": 542}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671724640151.png", "hash": 1671724640151, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.94, "width": 216, "height": 156}}	1671724640101	.png	image/png	103.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724640101.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:57:21.976	2022-12-22 15:57:21.976	3	3
208	image.png	\N	\N	830	610	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671724703430.png", "hash": 1671724703430, "mime": "image/png", "name": "small_image.png", "path": null, "size": 87.41, "width": 500, "height": 367}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671724703432.png", "hash": 1671724703432, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 158.44, "width": 750, "height": 551}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671724703182.png", "hash": 1671724703182, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.23, "width": 212, "height": 156}}	1671724703127	.png	image/png	103.02	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724703127.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:58:25.065	2022-12-22 15:58:25.065	3	3
209	image.png	\N	\N	864	595	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671724759766.png", "hash": 1671724759766, "mime": "image/png", "name": "small_image.png", "path": null, "size": 86.89, "width": 500, "height": 344}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671724759768.png", "hash": 1671724759768, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 154.46, "width": 750, "height": 516}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671724759515.png", "hash": 1671724759515, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 26.78, "width": 227, "height": 156}}	1671724759470	.png	image/png	73.55	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724759470.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 15:59:21.249	2022-12-22 15:59:21.249	3	3
210	PERMUTACION.-.png	PERMUTACION.-.png	PERMUTACION.-.png	318	158	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PERMUTACION.-_1671724864537.png", "hash": 1671724864537, "mime": "image/png", "name": "thumbnail_PERMUTACION.-.png", "path": null, "size": 12.2, "width": 245, "height": 122}}	1671724864518	.png	image/png	4.47	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PERMUTACION.-_1671724864518.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:01:05.77	2022-12-22 16:01:05.77	3	3
211	image.png	\N	\N	851	585	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671724924374.png", "hash": 1671724924374, "mime": "image/png", "name": "small_image.png", "path": null, "size": 86.7, "width": 500, "height": 344}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671724924376.png", "hash": 1671724924376, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 156.23, "width": 750, "height": 516}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671724924126.png", "hash": 1671724924126, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 26.75, "width": 227, "height": 156}}	1671724924076	.png	image/png	72.99	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724924076.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:02:06.146	2022-12-22 16:02:06.146	3	3
212	image.png	\N	\N	793	434	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671725073254.png", "hash": 1671725073254, "mime": "image/png", "name": "small_image.png", "path": null, "size": 55.8, "width": 500, "height": 274}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671725073260.png", "hash": 1671725073260, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 101.87, "width": 750, "height": 410}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671725073019.png", "hash": 1671725073019, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.77, "width": 245, "height": 134}}	1671725072977	.png	image/png	45.48	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725072977.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:04:34.803	2022-12-22 16:04:34.803	3	3
213	image.png	\N	\N	824	564	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671725112119.png", "hash": 1671725112119, "mime": "image/png", "name": "small_image.png", "path": null, "size": 72.55, "width": 500, "height": 342}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671725112120.png", "hash": 1671725112120, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 132.89, "width": 750, "height": 513}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671725111872.png", "hash": 1671725111872, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.08, "width": 228, "height": 156}}	1671725111826	.png	image/png	77.40	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725111826.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:05:13.556	2022-12-22 16:05:13.556	3	3
214	Combinacion.-.jfif	Combinacion.-.jfif	Combinacion.-.jfif	329	153	{"thumbnail": {"ext": ".jfif", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Combinacion.-_1671725206955.jfif", "hash": 1671725206955, "mime": "image/jpeg", "name": "thumbnail_Combinacion.-.jfif", "path": null, "size": 9.41, "width": 245, "height": 114}}	1671725206943	.jfif	image/jpeg	11.38	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Combinacion.-_1671725206943.jfif	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:06:48.249	2022-12-22 16:07:23.199	3	3
215	Combinacion.-.jfif	Combinacion.-.jfif	Combinacion.-.jfif	329	153	{"thumbnail": {"ext": ".jfif", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Combinacion.-_1671725295942.jfif", "hash": 1671725295942, "mime": "image/jpeg", "name": "thumbnail_Combinacion.-.jfif", "path": null, "size": 9.41, "width": 245, "height": 114}}	1671725295928	.jfif	image/jpeg	11.38	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Combinacion.-_1671725295928.jfif	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:08:17.049	2022-12-22 16:08:17.049	3	3
216	image.png	\N	\N	656	613	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671725879704.png", "hash": 1671725879704, "mime": "image/png", "name": "small_image.png", "path": null, "size": 55.04, "width": 500, "height": 467}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671725879471.png", "hash": 1671725879471, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.43, "width": 167, "height": 156}}	1671725879428	.png	image/png	31.87	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725879428.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:18:01.022	2022-12-22 16:18:01.022	3	3
217	image.png	\N	\N	795	537	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671725913336.png", "hash": 1671725913336, "mime": "image/png", "name": "small_image.png", "path": null, "size": 56.69, "width": 500, "height": 338}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671725913338.png", "hash": 1671725913338, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 104.64, "width": 750, "height": 507}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671725913092.png", "hash": 1671725913092, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.58, "width": 231, "height": 156}}	1671725913052	.png	image/png	32.49	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725913052.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:18:34.775	2022-12-22 16:18:34.775	3	3
218	image.png	\N	\N	607	366	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671725924811.png", "hash": 1671725924811, "mime": "image/png", "name": "small_image.png", "path": null, "size": 45.34, "width": 500, "height": 301}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671725924598.png", "hash": 1671725924598, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.25, "width": 245, "height": 148}}	1671725924569	.png	image/png	15.15	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725924569.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:18:46.195	2022-12-22 16:18:46.195	3	3
278	image.png	\N	\N	748	523	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671734769504.png", "hash": 1671734769504, "mime": "image/png", "name": "small_image.png", "path": null, "size": 79.62, "width": 500, "height": 350}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671734769274.png", "hash": 1671734769274, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.59, "width": 223, "height": 156}}	1671734769231	.png	image/png	38.00	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734769231.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:46:10.833	2022-12-22 18:46:10.833	3	3
219	image.png	\N	\N	928	195	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671725982718.png", "hash": 1671725982718, "mime": "image/png", "name": "small_image.png", "path": null, "size": 34.73, "width": 500, "height": 105}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671725982720.png", "hash": 1671725982720, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 64.86, "width": 750, "height": 158}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671725982502.png", "hash": 1671725982502, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 10.87, "width": 245, "height": 51}}	1671725982477	.png	image/png	27.07	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725982477.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:19:44.008	2022-12-22 16:19:44.008	3	3
220	image.png	\N	\N	932	188	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726007319.png", "hash": 1671726007319, "mime": "image/png", "name": "small_image.png", "path": null, "size": 32.68, "width": 500, "height": 101}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726007321.png", "hash": 1671726007321, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 61.49, "width": 750, "height": 151}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726007104.png", "hash": 1671726007104, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 10.5, "width": 245, "height": 49}}	1671726007080	.png	image/png	24.58	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726007080.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:20:08.65	2022-12-22 16:20:08.65	3	3
221	image.png	\N	\N	456	287	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726049287.png", "hash": 1671726049287, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.39, "width": 245, "height": 154}}	1671726049259	.png	image/png	16.20	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726049259.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:20:50.635	2022-12-22 16:20:50.635	3	3
222	image.png	\N	\N	748	413	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726066061.png", "hash": 1671726066061, "mime": "image/png", "name": "small_image.png", "path": null, "size": 49.09, "width": 500, "height": 276}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726065842.png", "hash": 1671726065842, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.27, "width": 245, "height": 135}}	1671726065805	.png	image/png	69.36	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726065805.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:21:07.336	2022-12-22 16:21:07.336	3	3
223	image.png	\N	\N	615	100	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726084350.png", "hash": 1671726084350, "mime": "image/png", "name": "small_image.png", "path": null, "size": 11.27, "width": 500, "height": 81}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726084158.png", "hash": 1671726084158, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 4.43, "width": 245, "height": 40}}	1671726084140	.png	image/png	6.23	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726084140.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:21:25.482	2022-12-22 16:21:25.482	3	3
224	image.png	\N	\N	756	90	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726096122.png", "hash": 1671726096122, "mime": "image/png", "name": "small_image.png", "path": null, "size": 9.34, "width": 500, "height": 60}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726096121.png", "hash": 1671726096121, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 17.11, "width": 750, "height": 89}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726095922.png", "hash": 1671726095922, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 3.67, "width": 245, "height": 29}}	1671726095905	.png	image/png	6.73	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726095905.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:21:37.2	2022-12-22 16:21:37.2	3	3
225	image.png	\N	\N	799	85	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726106448.png", "hash": 1671726106448, "mime": "image/png", "name": "small_image.png", "path": null, "size": 8.58, "width": 500, "height": 53}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726106446.png", "hash": 1671726106446, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 15.12, "width": 750, "height": 80}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726106249.png", "hash": 1671726106249, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 3.39, "width": 245, "height": 26}}	1671726106234	.png	image/png	5.10	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726106234.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:21:47.494	2022-12-22 16:21:47.494	3	3
361	V.A..jpg	V.A..jpg	V.A..jpg	409	247	{"thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_V.A._1671752196197.jpg", "hash": 1671752196197, "mime": "image/jpeg", "name": "thumbnail_V.A..jpg", "path": null, "size": 5.26, "width": 245, "height": 148}}	1671752196183	.jpg	image/jpeg	11.02	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/V.A._1671752196183.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 23:36:37.669	2022-12-22 23:36:37.669	3	3
226	image.png	\N	\N	773	614	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726175361.png", "hash": 1671726175361, "mime": "image/png", "name": "small_image.png", "path": null, "size": 82.6, "width": 500, "height": 397}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726175363.png", "hash": 1671726175363, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 142.09, "width": 750, "height": 596}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726175116.png", "hash": 1671726175116, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.73, "width": 196, "height": 156}}	1671726175065	.png	image/png	50.11	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726175065.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:22:57.06	2022-12-22 16:22:57.06	3	3
227	image.png	\N	\N	799	85	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726193618.png", "hash": 1671726193618, "mime": "image/png", "name": "small_image.png", "path": null, "size": 8.58, "width": 500, "height": 53}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726193617.png", "hash": 1671726193617, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 15.12, "width": 750, "height": 80}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726193421.png", "hash": 1671726193421, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 3.39, "width": 245, "height": 26}}	1671726193404	.png	image/png	5.10	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726193404.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:23:14.891	2022-12-22 16:23:14.891	3	3
228	image.png	\N	\N	926	663	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726566226.png", "hash": 1671726566226, "mime": "image/png", "name": "small_image.png", "path": null, "size": 78.66, "width": 500, "height": 358}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726566230.png", "hash": 1671726566230, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 146.38, "width": 750, "height": 537}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726565959.png", "hash": 1671726565959, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.46, "width": 218, "height": 156}}	1671726565910	.png	image/png	55.85	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726565910.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:29:27.822	2022-12-22 16:29:27.822	3	3
229	image.png	\N	\N	884	676	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726653583.png", "hash": 1671726653583, "mime": "image/png", "name": "small_image.png", "path": null, "size": 239.07, "width": 500, "height": 382}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726653586.png", "hash": 1671726653586, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 480.12, "width": 750, "height": 574}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726653311.png", "hash": 1671726653311, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 51.71, "width": 204, "height": 156}}	1671726653256	.png	image/png	358.12	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726653256.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:30:55.679	2022-12-22 16:30:55.679	3	3
230	image.png	\N	\N	913	300	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726795275.png", "hash": 1671726795275, "mime": "image/png", "name": "small_image.png", "path": null, "size": 39.02, "width": 500, "height": 164}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726795276.png", "hash": 1671726795276, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 72.44, "width": 750, "height": 246}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726795054.png", "hash": 1671726795054, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 13.56, "width": 245, "height": 81}}	1671726795019	.png	image/png	28.73	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726795019.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:33:16.612	2022-12-22 16:33:16.612	3	3
231	image.png	\N	\N	807	310	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726868227.png", "hash": 1671726868227, "mime": "image/png", "name": "small_image.png", "path": null, "size": 159.38, "width": 500, "height": 192}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726868229.png", "hash": 1671726868229, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 332.53, "width": 750, "height": 288}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726867992.png", "hash": 1671726867992, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 44.47, "width": 245, "height": 94}}	1671726867948	.png	image/png	256.66	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726867948.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:34:29.982	2022-12-22 16:34:29.982	3	3
232	image.png	\N	\N	807	310	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726943552.png", "hash": 1671726943552, "mime": "image/png", "name": "small_image.png", "path": null, "size": 159.38, "width": 500, "height": 192}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726943554.png", "hash": 1671726943554, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 332.53, "width": 750, "height": 288}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726943322.png", "hash": 1671726943322, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 44.47, "width": 245, "height": 94}}	1671726943282	.png	image/png	256.66	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726943282.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:35:45.569	2022-12-22 16:35:45.569	3	3
233	image.png	\N	\N	754	523	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671726998726.png", "hash": 1671726998726, "mime": "image/png", "name": "small_image.png", "path": null, "size": 52.67, "width": 500, "height": 347}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671726998728.png", "hash": 1671726998728, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 100.34, "width": 750, "height": 520}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671726998486.png", "hash": 1671726998486, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.37, "width": 225, "height": 156}}	1671726998442	.png	image/png	48.09	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726998442.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:36:40.161	2022-12-22 16:36:40.161	3	3
234	image.png	\N	\N	825	430	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727020447.png", "hash": 1671727020447, "mime": "image/png", "name": "small_image.png", "path": null, "size": 42.39, "width": 500, "height": 261}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727020449.png", "hash": 1671727020449, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 80.11, "width": 750, "height": 391}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727020215.png", "hash": 1671727020215, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.99, "width": 245, "height": 128}}	1671727020175	.png	image/png	41.61	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727020175.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:37:01.742	2022-12-22 16:37:01.742	3	3
235	image.png	\N	\N	830	602	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727101294.png", "hash": 1671727101294, "mime": "image/png", "name": "small_image.png", "path": null, "size": 71.16, "width": 500, "height": 363}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727101292.png", "hash": 1671727101292, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 130.51, "width": 750, "height": 544}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727101046.png", "hash": 1671727101046, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.83, "width": 215, "height": 156}}	1671727100995	.png	image/png	48.11	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727100995.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:38:22.913	2022-12-22 16:38:22.913	3	3
236	image.png	\N	\N	749	320	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727130394.png", "hash": 1671727130394, "mime": "image/png", "name": "small_image.png", "path": null, "size": 32.24, "width": 500, "height": 214}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727130185.png", "hash": 1671727130185, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.39, "width": 245, "height": 105}}	1671727130154	.png	image/png	19.25	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727130154.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:38:51.612	2022-12-22 16:38:51.612	3	3
237	image.png	\N	\N	846	564	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727214548.png", "hash": 1671727214548, "mime": "image/png", "name": "small_image.png", "path": null, "size": 66.02, "width": 500, "height": 333}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727214546.png", "hash": 1671727214546, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 120.23, "width": 750, "height": 500}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727214300.png", "hash": 1671727214300, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.82, "width": 234, "height": 156}}	1671727214254	.png	image/png	46.22	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727214254.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:40:16.008	2022-12-22 16:40:16.008	3	3
238	image.png	\N	\N	831	370	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727242013.png", "hash": 1671727242013, "mime": "image/png", "name": "small_image.png", "path": null, "size": 43.27, "width": 500, "height": 223}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727242015.png", "hash": 1671727242015, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 78.42, "width": 750, "height": 334}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727241789.png", "hash": 1671727241789, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.49, "width": 245, "height": 109}}	1671727241753	.png	image/png	22.52	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727241753.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:40:43.307	2022-12-22 16:40:43.307	3	3
239	image.png	\N	\N	933	639	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727274794.png", "hash": 1671727274794, "mime": "image/png", "name": "small_image.png", "path": null, "size": 82.65, "width": 500, "height": 342}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727274796.png", "hash": 1671727274796, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 155.99, "width": 750, "height": 514}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727274532.png", "hash": 1671727274532, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.97, "width": 228, "height": 156}}	1671727274481	.png	image/png	119.36	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727274481.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:41:16.355	2022-12-22 16:41:16.355	3	3
240	image.png	\N	\N	846	660	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727333059.png", "hash": 1671727333059, "mime": "image/png", "name": "small_image.png", "path": null, "size": 81.55, "width": 500, "height": 390}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727333061.png", "hash": 1671727333061, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 149.73, "width": 750, "height": 585}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727332799.png", "hash": 1671727332799, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.25, "width": 200, "height": 156}}	1671727332752	.png	image/png	65.72	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727332752.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:42:14.738	2022-12-22 16:42:14.738	3	3
241	image.png	\N	\N	997	612	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727379556.png", "hash": 1671727379556, "mime": "image/png", "name": "small_image.png", "path": null, "size": 105.2, "width": 500, "height": 307}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727379558.png", "hash": 1671727379558, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 202.2, "width": 750, "height": 460}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727379300.png", "hash": 1671727379300, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 33.56, "width": 245, "height": 150}}	1671727379239	.png	image/png	213.90	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727379239.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:43:01.177	2022-12-22 16:43:01.177	3	3
242	image.png	\N	\N	901	467	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727415137.png", "hash": 1671727415137, "mime": "image/png", "name": "small_image.png", "path": null, "size": 51.33, "width": 500, "height": 259}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727415139.png", "hash": 1671727415139, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 94.88, "width": 750, "height": 389}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727414899.png", "hash": 1671727414899, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.03, "width": 245, "height": 127}}	1671727414857	.png	image/png	35.95	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727414857.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:43:36.502	2022-12-22 16:43:36.502	3	3
243	image.png	\N	\N	852	528	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727454287.png", "hash": 1671727454287, "mime": "image/png", "name": "small_image.png", "path": null, "size": 55.93, "width": 500, "height": 310}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727454288.png", "hash": 1671727454288, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 101.16, "width": 750, "height": 465}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727454050.png", "hash": 1671727454050, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.64, "width": 245, "height": 152}}	1671727454007	.png	image/png	39.00	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727454007.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:44:15.663	2022-12-22 16:44:15.663	3	3
244	image.png	\N	\N	862	473	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727478219.png", "hash": 1671727478219, "mime": "image/png", "name": "small_image.png", "path": null, "size": 54.7, "width": 500, "height": 274}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727478221.png", "hash": 1671727478221, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 101.82, "width": 750, "height": 412}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727477988.png", "hash": 1671727477988, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.7, "width": 245, "height": 134}}	1671727477942	.png	image/png	65.36	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727477942.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:44:39.63	2022-12-22 16:44:39.63	3	3
245	image.png	\N	\N	962	654	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727559402.png", "hash": 1671727559402, "mime": "image/png", "name": "small_image.png", "path": null, "size": 79.45, "width": 500, "height": 340}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727559404.png", "hash": 1671727559404, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 145.68, "width": 750, "height": 510}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727559143.png", "hash": 1671727559143, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 25.07, "width": 229, "height": 156}}	1671727559092	.png	image/png	133.74	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727559092.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:46:01.25	2022-12-22 16:46:01.25	3	3
246	image.png	\N	\N	864	556	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727586802.png", "hash": 1671727586802, "mime": "image/png", "name": "small_image.png", "path": null, "size": 72.67, "width": 500, "height": 322}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727586804.png", "hash": 1671727586804, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 132.61, "width": 750, "height": 483}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727586557.png", "hash": 1671727586557, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.96, "width": 242, "height": 156}}	1671727586506	.png	image/png	66.01	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727586506.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:46:28.201	2022-12-22 16:46:28.201	3	3
247	image.png	\N	\N	896	381	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727643475.png", "hash": 1671727643475, "mime": "image/png", "name": "small_image.png", "path": null, "size": 44.45, "width": 500, "height": 213}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727643476.png", "hash": 1671727643476, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 81.5, "width": 750, "height": 319}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727643248.png", "hash": 1671727643248, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.36, "width": 245, "height": 104}}	1671727643211	.png	image/png	66.55	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727643211.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:47:24.826	2022-12-22 16:47:24.826	3	3
248	image.png	\N	\N	846	700	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727806790.png", "hash": 1671727806790, "mime": "image/png", "name": "small_image.png", "path": null, "size": 83.6, "width": 500, "height": 414}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727806793.png", "hash": 1671727806793, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 155.85, "width": 750, "height": 621}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727806526.png", "hash": 1671727806526, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.41, "width": 189, "height": 156}}	1671727806480	.png	image/png	75.51	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727806480.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:50:08.283	2022-12-22 16:50:08.283	3	3
249	image.png	\N	\N	985	480	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727877380.png", "hash": 1671727877380, "mime": "image/png", "name": "small_image.png", "path": null, "size": 87.34, "width": 500, "height": 244}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727877383.png", "hash": 1671727877383, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 166.68, "width": 750, "height": 365}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727877138.png", "hash": 1671727877138, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 27.93, "width": 245, "height": 119}}	1671727877096	.png	image/png	185.30	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727877096.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:51:18.945	2022-12-22 16:51:18.945	3	3
250	image.png	\N	\N	829	458	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671727979880.png", "hash": 1671727979880, "mime": "image/png", "name": "small_image.png", "path": null, "size": 51.71, "width": 500, "height": 276}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671727979882.png", "hash": 1671727979882, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 93.71, "width": 750, "height": 414}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671727979645.png", "hash": 1671727979645, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.21, "width": 245, "height": 135}}	1671727979606	.png	image/png	49.72	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727979606.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:53:01.289	2022-12-22 16:53:01.289	3	3
251	image.png	\N	\N	880	299	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671728038109.png", "hash": 1671728038109, "mime": "image/png", "name": "small_image.png", "path": null, "size": 35.56, "width": 500, "height": 170}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671728038108.png", "hash": 1671728038108, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 63.02, "width": 750, "height": 255}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671728037887.png", "hash": 1671728037887, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 12.48, "width": 245, "height": 83}}	1671728037855	.png	image/png	35.56	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728037855.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 16:53:59.353	2022-12-22 16:53:59.353	3	3
253	image.png	\N	\N	917	234	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671728670732.png", "hash": 1671728670732, "mime": "image/png", "name": "small_image.png", "path": null, "size": 27.01, "width": 500, "height": 128}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671728670730.png", "hash": 1671728670730, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 49.19, "width": 750, "height": 191}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671728670518.png", "hash": 1671728670518, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 9.4, "width": 245, "height": 63}}	1671728670487	.png	image/png	20.12	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728670487.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:04:32.065	2022-12-22 17:04:32.065	3	3
254	image.png	\N	\N	942	465	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671728698606.png", "hash": 1671728698606, "mime": "image/png", "name": "small_image.png", "path": null, "size": 59.95, "width": 500, "height": 247}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671728698607.png", "hash": 1671728698607, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 110.05, "width": 750, "height": 370}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671728698366.png", "hash": 1671728698366, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.14, "width": 245, "height": 121}}	1671728698323	.png	image/png	42.59	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728698323.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:05:00.031	2022-12-22 17:05:00.031	3	3
255	image.png	\N	\N	749	207	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671728838063.png", "hash": 1671728838063, "mime": "image/png", "name": "small_image.png", "path": null, "size": 9.18, "width": 500, "height": 138}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671728837864.png", "hash": 1671728837864, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 3.7, "width": 245, "height": 68}}	1671728837842	.png	image/png	6.85	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728837842.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:07:19.39	2022-12-22 17:07:19.39	3	3
256	image.png	\N	\N	885	507	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671728902639.png", "hash": 1671728902639, "mime": "image/png", "name": "small_image.png", "path": null, "size": 47.34, "width": 500, "height": 286}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671728902641.png", "hash": 1671728902641, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 88.28, "width": 750, "height": 430}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671728902400.png", "hash": 1671728902400, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.27, "width": 245, "height": 140}}	1671728902349	.png	image/png	84.84	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728902349.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:08:24.178	2022-12-22 17:08:24.178	3	3
257	image.png	\N	\N	976	591	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671728967195.png", "hash": 1671728967195, "mime": "image/png", "name": "small_image.png", "path": null, "size": 43.16, "width": 500, "height": 303}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671728967197.png", "hash": 1671728967197, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 78.59, "width": 750, "height": 454}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671728966946.png", "hash": 1671728966946, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.06, "width": 245, "height": 148}}	1671728966894	.png	image/png	79.88	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728966894.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:09:28.691	2022-12-22 17:09:28.691	3	3
258	image.png	\N	\N	916	497	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671728988409.png", "hash": 1671728988409, "mime": "image/png", "name": "small_image.png", "path": null, "size": 93.73, "width": 500, "height": 271}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671728988410.png", "hash": 1671728988410, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 177.44, "width": 750, "height": 407}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671728988166.png", "hash": 1671728988166, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 29.19, "width": 245, "height": 133}}	1671728988117	.png	image/png	183.10	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728988117.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:09:49.97	2022-12-22 17:09:49.97	3	3
259	image.png	\N	\N	928	608	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729008871.png", "hash": 1671729008871, "mime": "image/png", "name": "small_image.png", "path": null, "size": 48.4, "width": 500, "height": 328}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729008873.png", "hash": 1671729008873, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 87.77, "width": 750, "height": 491}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729008621.png", "hash": 1671729008621, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.29, "width": 238, "height": 156}}	1671729008568	.png	image/png	85.19	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729008568.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:10:10.161	2022-12-22 17:10:10.161	3	3
260	image.png	\N	\N	873	393	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729037540.png", "hash": 1671729037540, "mime": "image/png", "name": "small_image.png", "path": null, "size": 30.72, "width": 500, "height": 225}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729037538.png", "hash": 1671729037538, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 54.37, "width": 750, "height": 338}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729037311.png", "hash": 1671729037311, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.4, "width": 245, "height": 110}}	1671729037275	.png	image/png	36.47	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729037275.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:10:38.856	2022-12-22 17:10:38.856	3	3
261	image.png	\N	\N	882	546	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729057242.png", "hash": 1671729057242, "mime": "image/png", "name": "small_image.png", "path": null, "size": 129.72, "width": 500, "height": 310}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729057244.png", "hash": 1671729057244, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 245.41, "width": 750, "height": 464}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729056991.png", "hash": 1671729056991, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 41.02, "width": 245, "height": 152}}	1671729056940	.png	image/png	215.45	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729056940.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:10:58.65	2022-12-22 17:10:58.65	3	3
262	image.png	\N	\N	903	584	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729079955.png", "hash": 1671729079955, "mime": "image/png", "name": "small_image.png", "path": null, "size": 67.85, "width": 500, "height": 323}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729079953.png", "hash": 1671729079953, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 126.05, "width": 750, "height": 485}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729079700.png", "hash": 1671729079700, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.54, "width": 241, "height": 156}}	1671729079652	.png	image/png	117.67	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729079652.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:11:21.419	2022-12-22 17:11:21.419	3	3
263	image.png	\N	\N	944	521	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729100007.png", "hash": 1671729100007, "mime": "image/png", "name": "small_image.png", "path": null, "size": 60.63, "width": 500, "height": 276}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729100009.png", "hash": 1671729100009, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 108.88, "width": 750, "height": 414}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729099760.png", "hash": 1671729099760, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.64, "width": 245, "height": 135}}	1671729099709	.png	image/png	76.70	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729099709.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:11:41.509	2022-12-22 17:11:41.509	3	3
265	image.png	\N	\N	997	675	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729400647.png", "hash": 1671729400647, "mime": "image/png", "name": "small_image.png", "path": null, "size": 53.52, "width": 500, "height": 339}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729400648.png", "hash": 1671729400648, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 97.4, "width": 750, "height": 508}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729400361.png", "hash": 1671729400361, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.87, "width": 230, "height": 156}}	1671729400305	.png	image/png	63.58	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729400305.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:16:42.081	2022-12-22 17:16:42.081	3	3
264	distribuciones continuas.png	distribuciones continuas.png	distribuciones continuas.png	1152	806	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_distribuciones continuas_1671729174576.png", "hash": 1671729174576, "mime": "image/png", "name": "large_distribuciones continuas.png", "path": null, "size": 45.85, "width": 1000, "height": 700}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_distribuciones continuas_1671729174579.png", "hash": 1671729174579, "mime": "image/png", "name": "small_distribuciones continuas.png", "path": null, "size": 19.41, "width": 500, "height": 350}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_distribuciones continuas_1671729174578.png", "hash": 1671729174578, "mime": "image/png", "name": "medium_distribuciones continuas.png", "path": null, "size": 31.82, "width": 750, "height": 525}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_distribuciones continuas_1671729174331.png", "hash": 1671729174331, "mime": "image/png", "name": "thumbnail_distribuciones continuas.png", "path": null, "size": 7.09, "width": 223, "height": 156}}	1671729174285	.png	image/png	10.17	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/distribuciones continuas_1671729174285.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:12:55.847	2022-12-22 17:13:30.439	3	3
266	image.png	\N	\N	964	668	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729422389.png", "hash": 1671729422389, "mime": "image/png", "name": "small_image.png", "path": null, "size": 55.47, "width": 500, "height": 346}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729422392.png", "hash": 1671729422392, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 101.31, "width": 750, "height": 520}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729422131.png", "hash": 1671729422131, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.01, "width": 225, "height": 156}}	1671729422083	.png	image/png	63.13	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729422083.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:17:03.784	2022-12-22 17:17:03.784	3	3
267	image.png	\N	\N	839	593	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729466511.png", "hash": 1671729466511, "mime": "image/png", "name": "small_image.png", "path": null, "size": 89.21, "width": 500, "height": 353}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729466513.png", "hash": 1671729466513, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 163.06, "width": 750, "height": 530}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729466262.png", "hash": 1671729466262, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 26.55, "width": 221, "height": 156}}	1671729466215	.png	image/png	60.61	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729466215.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:17:48.29	2022-12-22 17:17:48.29	3	3
268	image.png	\N	\N	843	597	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729491614.png", "hash": 1671729491614, "mime": "image/png", "name": "small_image.png", "path": null, "size": 88.22, "width": 500, "height": 354}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729491616.png", "hash": 1671729491616, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 159.64, "width": 750, "height": 531}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729491366.png", "hash": 1671729491366, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 26.19, "width": 220, "height": 156}}	1671729491320	.png	image/png	60.60	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729491320.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:18:13.057	2022-12-22 17:18:13.057	3	3
269	image.png	\N	\N	725	620	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729517896.png", "hash": 1671729517896, "mime": "image/png", "name": "small_image.png", "path": null, "size": 62.42, "width": 500, "height": 428}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729517665.png", "hash": 1671729517665, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 13.58, "width": 182, "height": 156}}	1671729517612	.png	image/png	72.23	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729517612.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:18:39.188	2022-12-22 17:18:39.188	3	3
270	image.png	\N	\N	970	582	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729582626.png", "hash": 1671729582626, "mime": "image/png", "name": "small_image.png", "path": null, "size": 47.2, "width": 500, "height": 300}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729582628.png", "hash": 1671729582628, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 82.3, "width": 750, "height": 450}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729582348.png", "hash": 1671729582348, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.74, "width": 245, "height": 147}}	1671729582298	.png	image/png	33.07	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729582298.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:19:44.329	2022-12-22 17:19:44.329	3	3
271	image.png	\N	\N	826	655	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729609276.png", "hash": 1671729609276, "mime": "image/png", "name": "small_image.png", "path": null, "size": 58, "width": 500, "height": 396}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729609277.png", "hash": 1671729609277, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 103.8, "width": 750, "height": 595}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729608992.png", "hash": 1671729608992, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.79, "width": 197, "height": 156}}	1671729608946	.png	image/png	63.54	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729608946.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:20:10.805	2022-12-22 17:20:10.805	3	3
272	image.png	\N	\N	970	624	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729651014.png", "hash": 1671729651014, "mime": "image/png", "name": "small_image.png", "path": null, "size": 63.66, "width": 500, "height": 322}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729651013.png", "hash": 1671729651013, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 116.54, "width": 750, "height": 482}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729650756.png", "hash": 1671729650756, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.1, "width": 243, "height": 156}}	1671729650693	.png	image/png	109.60	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729650693.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:20:52.683	2022-12-22 17:20:52.683	3	3
273	image.png	\N	\N	842	501	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729707550.png", "hash": 1671729707550, "mime": "image/png", "name": "small_image.png", "path": null, "size": 57.82, "width": 500, "height": 298}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729707552.png", "hash": 1671729707552, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 113.03, "width": 750, "height": 446}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729707312.png", "hash": 1671729707312, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.31, "width": 245, "height": 146}}	1671729707265	.png	image/png	110.13	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729707265.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:21:48.947	2022-12-22 17:21:48.947	3	3
274	image.png	\N	\N	916	594	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729726739.png", "hash": 1671729726739, "mime": "image/png", "name": "small_image.png", "path": null, "size": 71.31, "width": 500, "height": 324}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729726737.png", "hash": 1671729726737, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 129.29, "width": 750, "height": 486}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729726483.png", "hash": 1671729726483, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.69, "width": 241, "height": 156}}	1671729726424	.png	image/png	118.92	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729726424.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:22:08.081	2022-12-22 17:22:08.081	3	3
275	image.png	\N	\N	876	348	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671729761631.png", "hash": 1671729761631, "mime": "image/png", "name": "small_image.png", "path": null, "size": 33.01, "width": 500, "height": 199}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671729761629.png", "hash": 1671729761629, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 63.04, "width": 750, "height": 298}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671729761407.png", "hash": 1671729761407, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 12.2, "width": 245, "height": 97}}	1671729761367	.png	image/png	59.43	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729761367.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 17:22:42.992	2022-12-22 17:22:42.992	3	3
276	image.png	\N	\N	809	404	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671734680791.png", "hash": 1671734680791, "mime": "image/png", "name": "small_image.png", "path": null, "size": 82.35, "width": 500, "height": 250}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671734680793.png", "hash": 1671734680793, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 160.22, "width": 750, "height": 375}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671734680562.png", "hash": 1671734680562, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 25.83, "width": 245, "height": 122}}	1671734680521	.png	image/png	101.26	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734680521.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:44:42.312	2022-12-22 18:44:42.312	3	3
277	image.png	\N	\N	870	422	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671734710836.png", "hash": 1671734710836, "mime": "image/png", "name": "small_image.png", "path": null, "size": 55.54, "width": 500, "height": 243}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671734710838.png", "hash": 1671734710838, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 100.22, "width": 750, "height": 364}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671734710609.png", "hash": 1671734710609, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.87, "width": 245, "height": 119}}	1671734710569	.png	image/png	33.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734710569.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:45:12.265	2022-12-22 18:45:12.265	3	3
279	image.png	\N	\N	793	397	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671734804837.png", "hash": 1671734804837, "mime": "image/png", "name": "small_image.png", "path": null, "size": 52.68, "width": 500, "height": 250}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671734804839.png", "hash": 1671734804839, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 95.57, "width": 750, "height": 375}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671734804605.png", "hash": 1671734804605, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.91, "width": 245, "height": 123}}	1671734804569	.png	image/png	28.83	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734804569.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:46:46.264	2022-12-22 18:46:46.264	3	3
280	image.png	\N	\N	631	165	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671734948178.png", "hash": 1671734948178, "mime": "image/png", "name": "small_image.png", "path": null, "size": 26.15, "width": 500, "height": 131}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671734947979.png", "hash": 1671734947979, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 8.95, "width": 245, "height": 64}}	1671734947959	.png	image/png	10.13	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734947959.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:49:09.789	2022-12-22 18:49:09.789	3	3
281	image.png	\N	\N	830	536	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671734976086.png", "hash": 1671734976086, "mime": "image/png", "name": "small_image.png", "path": null, "size": 58.57, "width": 500, "height": 323}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671734976088.png", "hash": 1671734976088, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 104.41, "width": 750, "height": 484}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671734975841.png", "hash": 1671734975841, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.72, "width": 242, "height": 156}}	1671734975794	.png	image/png	39.99	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734975794.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:49:37.452	2022-12-22 18:49:37.452	3	3
282	image.png	\N	\N	934	673	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735135196.png", "hash": 1671735135196, "mime": "image/png", "name": "small_image.png", "path": null, "size": 77.08, "width": 500, "height": 360}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735135198.png", "hash": 1671735135198, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 136.08, "width": 750, "height": 540}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735134931.png", "hash": 1671735134931, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.93, "width": 216, "height": 156}}	1671735134882	.png	image/png	58.42	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735134882.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:52:16.795	2022-12-22 18:52:16.795	3	3
283	image.png	\N	\N	868	581	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735188643.png", "hash": 1671735188643, "mime": "image/png", "name": "small_image.png", "path": null, "size": 57.8, "width": 500, "height": 335}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735188646.png", "hash": 1671735188646, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 102.56, "width": 750, "height": 502}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735188395.png", "hash": 1671735188395, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.61, "width": 233, "height": 156}}	1671735188348	.png	image/png	39.03	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735188348.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:53:10.021	2022-12-22 18:53:10.021	3	3
284	image.png	\N	\N	796	185	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735233466.png", "hash": 1671735233466, "mime": "image/png", "name": "small_image.png", "path": null, "size": 21.19, "width": 500, "height": 116}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735233465.png", "hash": 1671735233465, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 38.87, "width": 750, "height": 174}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735233261.png", "hash": 1671735233261, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 7.5, "width": 245, "height": 57}}	1671735233238	.png	image/png	12.09	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735233238.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:53:54.69	2022-12-22 18:53:54.69	3	3
285	image.png	\N	\N	777	581	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735300679.png", "hash": 1671735300679, "mime": "image/png", "name": "small_image.png", "path": null, "size": 56.08, "width": 500, "height": 374}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735300680.png", "hash": 1671735300680, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 99.88, "width": 750, "height": 561}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735300432.png", "hash": 1671735300432, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.36, "width": 209, "height": 156}}	1671735300381	.png	image/png	32.74	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735300381.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:55:02.097	2022-12-22 18:55:02.097	3	3
286	image.png	\N	\N	928	480	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735335220.png", "hash": 1671735335220, "mime": "image/png", "name": "small_image.png", "path": null, "size": 44.62, "width": 500, "height": 259}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735335221.png", "hash": 1671735335221, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 76.96, "width": 750, "height": 388}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735334979.png", "hash": 1671735334979, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.01, "width": 245, "height": 127}}	1671735334935	.png	image/png	30.70	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735334935.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:55:36.519	2022-12-22 18:55:36.519	3	3
287	image.png	\N	\N	674	277	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735354586.png", "hash": 1671735354586, "mime": "image/png", "name": "small_image.png", "path": null, "size": 27.96, "width": 500, "height": 205}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735354382.png", "hash": 1671735354382, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 10.85, "width": 245, "height": 101}}	1671735354355	.png	image/png	13.83	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735354355.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 18:55:55.432	2022-12-22 18:55:55.432	3	3
288	image.png	\N	\N	916	604	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735751104.png", "hash": 1671735751104, "mime": "image/png", "name": "small_image.png", "path": null, "size": 59.58, "width": 500, "height": 330}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735751106.png", "hash": 1671735751106, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 104.7, "width": 750, "height": 495}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735750844.png", "hash": 1671735750844, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.6, "width": 237, "height": 156}}	1671735750794	.png	image/png	45.71	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735750794.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:02:32.537	2022-12-22 19:02:32.537	3	3
289	image.png	\N	\N	912	678	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735773687.png", "hash": 1671735773687, "mime": "image/png", "name": "small_image.png", "path": null, "size": 79.1, "width": 500, "height": 372}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735773689.png", "hash": 1671735773689, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 141.48, "width": 750, "height": 558}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735773428.png", "hash": 1671735773428, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.34, "width": 210, "height": 156}}	1671735773379	.png	image/png	58.12	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735773379.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:02:55.137	2022-12-22 19:02:55.137	3	3
290	image.png	\N	\N	862	571	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735808015.png", "hash": 1671735808015, "mime": "image/png", "name": "small_image.png", "path": null, "size": 57.92, "width": 500, "height": 331}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735808017.png", "hash": 1671735808017, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 104.05, "width": 750, "height": 497}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735807759.png", "hash": 1671735807759, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.12, "width": 236, "height": 156}}	1671735807713	.png	image/png	38.89	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735807713.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:03:29.471	2022-12-22 19:03:29.471	3	3
291	image.png	\N	\N	800	192	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735828352.png", "hash": 1671735828352, "mime": "image/png", "name": "small_image.png", "path": null, "size": 20.88, "width": 500, "height": 120}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735828354.png", "hash": 1671735828354, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 38.58, "width": 750, "height": 180}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735828149.png", "hash": 1671735828149, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 7.48, "width": 245, "height": 59}}	1671735828125	.png	image/png	12.18	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735828125.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:03:49.623	2022-12-22 19:03:49.623	3	3
292	image.png	\N	\N	789	524	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735859628.png", "hash": 1671735859628, "mime": "image/png", "name": "small_image.png", "path": null, "size": 50.68, "width": 500, "height": 332}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735859630.png", "hash": 1671735859630, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 91.03, "width": 750, "height": 498}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735859387.png", "hash": 1671735859387, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18, "width": 235, "height": 156}}	1671735859342	.png	image/png	30.30	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735859342.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:04:20.927	2022-12-22 19:04:20.927	3	3
293	image.png	\N	\N	915	479	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735885007.png", "hash": 1671735885007, "mime": "image/png", "name": "small_image.png", "path": null, "size": 45.35, "width": 500, "height": 262}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671735885010.png", "hash": 1671735885010, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 77.91, "width": 750, "height": 393}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735884766.png", "hash": 1671735884766, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.35, "width": 245, "height": 128}}	1671735884724	.png	image/png	30.58	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735884724.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:04:46.299	2022-12-22 19:04:46.299	3	3
294	image.png	\N	\N	671	276	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671735903690.png", "hash": 1671735903690, "mime": "image/png", "name": "small_image.png", "path": null, "size": 28.22, "width": 500, "height": 206}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671735903486.png", "hash": 1671735903486, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.06, "width": 245, "height": 101}}	1671735903459	.png	image/png	13.81	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735903459.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:05:04.875	2022-12-22 19:05:04.875	3	3
295	image.png	\N	\N	917	416	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671736001972.png", "hash": 1671736001972, "mime": "image/png", "name": "small_image.png", "path": null, "size": 44.39, "width": 500, "height": 227}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671736001974.png", "hash": 1671736001974, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 79.95, "width": 750, "height": 340}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671736001731.png", "hash": 1671736001731, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.38, "width": 245, "height": 111}}	1671736001692	.png	image/png	29.75	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671736001692.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:06:43.277	2022-12-22 19:06:43.277	3	3
296	PROCESO DE POISSON HOMOGENEO.png	PROCESO DE POISSON HOMOGENEO.png	PROCESO DE POISSON HOMOGENEO.png	352	111	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROCESO DE POISSON HOMOGENEO_1671736183792.png", "hash": 1671736183792, "mime": "image/png", "name": "thumbnail_PROCESO DE POISSON HOMOGENEO.png", "path": null, "size": 5.93, "width": 245, "height": 77}}	1671736183776	.png	image/png	3.24	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROCESO DE POISSON HOMOGENEO_1671736183776.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:09:45.341	2022-12-22 19:09:45.341	3	3
297	TEST DE APLICABILIDAD POISSON HOMOGENEO.png	TEST DE APLICABILIDAD POISSON HOMOGENEO.png	TEST DE APLICABILIDAD POISSON HOMOGENEO.png	502	206	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_TEST DE APLICABILIDAD POISSON HOMOGENEO_1671736425680.png", "hash": 1671736425680, "mime": "image/png", "name": "small_TEST DE APLICABILIDAD POISSON HOMOGENEO.png", "path": null, "size": 37.86, "width": 500, "height": 205}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_TEST DE APLICABILIDAD POISSON HOMOGENEO_1671736425478.png", "hash": 1671736425478, "mime": "image/png", "name": "thumbnail_TEST DE APLICABILIDAD POISSON HOMOGENEO.png", "path": null, "size": 12.89, "width": 245, "height": 101}}	1671736425456	.png	image/png	11.12	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/TEST DE APLICABILIDAD POISSON HOMOGENEO_1671736425456.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:13:47.05	2022-12-22 19:13:47.05	3	3
298	image.png	\N	\N	918	438	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671736570799.png", "hash": 1671736570799, "mime": "image/png", "name": "small_image.png", "path": null, "size": 56.33, "width": 500, "height": 239}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671736570801.png", "hash": 1671736570801, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 102.41, "width": 750, "height": 358}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671736570559.png", "hash": 1671736570559, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.69, "width": 245, "height": 117}}	1671736570517	.png	image/png	39.53	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671736570517.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:16:12.39	2022-12-22 19:16:12.39	3	3
299	image.png	\N	\N	874	422	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671736598830.png", "hash": 1671736598830, "mime": "image/png", "name": "small_image.png", "path": null, "size": 36.65, "width": 500, "height": 241}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671736598826.png", "hash": 1671736598826, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 64.51, "width": 750, "height": 362}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671736598598.png", "hash": 1671736598598, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 12.82, "width": 245, "height": 118}}	1671736598557	.png	image/png	25.25	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671736598557.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:16:40.148	2022-12-22 19:16:40.148	3	3
300	image.png	\N	\N	937	468	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671736635239.png", "hash": 1671736635239, "mime": "image/png", "name": "small_image.png", "path": null, "size": 49.33, "width": 500, "height": 250}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671736635241.png", "hash": 1671736635241, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 88.6, "width": 750, "height": 375}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671736635000.png", "hash": 1671736635000, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.64, "width": 245, "height": 122}}	1671736634955	.png	image/png	36.63	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671736634955.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 19:17:16.697	2022-12-22 19:17:16.697	3	3
301	Tiempo Entre Eventos.png	Tiempo Entre Eventos.png	Tiempo Entre Eventos.png	422	123	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Tiempo Entre Eventos_1671742234261.png", "hash": 1671742234261, "mime": "image/png", "name": "thumbnail_Tiempo Entre Eventos.png", "path": null, "size": 4, "width": 245, "height": 71}}	1671742234244	.png	image/png	6.55	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Tiempo Entre Eventos_1671742234244.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:50:35.569	2022-12-22 20:50:35.569	3	3
302	image.png	\N	\N	863	557	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742269054.png", "hash": 1671742269054, "mime": "image/png", "name": "small_image.png", "path": null, "size": 53.18, "width": 500, "height": 323}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742269056.png", "hash": 1671742269056, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 94.6, "width": 750, "height": 484}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742268804.png", "hash": 1671742268804, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.47, "width": 242, "height": 156}}	1671742268758	.png	image/png	36.09	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742268758.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:51:10.622	2022-12-22 20:51:10.622	3	3
303	image.png	\N	\N	820	493	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742286480.png", "hash": 1671742286480, "mime": "image/png", "name": "small_image.png", "path": null, "size": 31.39, "width": 500, "height": 301}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742286476.png", "hash": 1671742286476, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 53.28, "width": 750, "height": 451}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742286241.png", "hash": 1671742286241, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.76, "width": 245, "height": 147}}	1671742286201	.png	image/png	22.76	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742286201.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:51:27.94	2022-12-22 20:51:27.94	3	3
304	image.png	\N	\N	843	634	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742347939.png", "hash": 1671742347939, "mime": "image/png", "name": "small_image.png", "path": null, "size": 64.01, "width": 500, "height": 376}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742347940.png", "hash": 1671742347940, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 114.4, "width": 750, "height": 564}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742347689.png", "hash": 1671742347689, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.89, "width": 207, "height": 156}}	1671742347644	.png	image/png	44.10	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742347644.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:52:29.362	2022-12-22 20:52:29.362	3	3
305	image.png	\N	\N	837	645	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742390574.png", "hash": 1671742390574, "mime": "image/png", "name": "small_image.png", "path": null, "size": 53.96, "width": 500, "height": 385}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742390576.png", "hash": 1671742390576, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 93.89, "width": 750, "height": 578}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742390325.png", "hash": 1671742390325, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.03, "width": 202, "height": 156}}	1671742390284	.png	image/png	39.15	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742390284.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:53:12.102	2022-12-22 20:53:12.102	3	3
306	image.png	\N	\N	937	660	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742454104.png", "hash": 1671742454104, "mime": "image/png", "name": "small_image.png", "path": null, "size": 70.23, "width": 500, "height": 352}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742454103.png", "hash": 1671742454103, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 121.32, "width": 750, "height": 528}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742453845.png", "hash": 1671742453845, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.41, "width": 221, "height": 156}}	1671742453800	.png	image/png	53.44	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742453800.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:54:15.546	2022-12-22 20:54:15.546	3	3
307	image.png	\N	\N	848	633	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742494359.png", "hash": 1671742494359, "mime": "image/png", "name": "small_image.png", "path": null, "size": 55.55, "width": 500, "height": 373}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742494361.png", "hash": 1671742494361, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 96.67, "width": 750, "height": 560}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742494107.png", "hash": 1671742494107, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.65, "width": 209, "height": 156}}	1671742494059	.png	image/png	39.92	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742494059.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:54:55.751	2022-12-22 20:54:55.751	3	3
308	Tiempo Entre Eventos.png	Tiempo Entre Eventos.png	Tiempo Entre Eventos.png	422	123	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Tiempo Entre Eventos_1671742532655.png", "hash": 1671742532655, "mime": "image/png", "name": "thumbnail_Tiempo Entre Eventos.png", "path": null, "size": 4, "width": 245, "height": 71}}	1671742532639	.png	image/png	6.55	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Tiempo Entre Eventos_1671742532639.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:55:33.78	2022-12-22 20:55:33.78	3	3
309	image.png	\N	\N	939	533	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742722053.png", "hash": 1671742722053, "mime": "image/png", "name": "small_image.png", "path": null, "size": 53.69, "width": 500, "height": 284}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742722055.png", "hash": 1671742722055, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 99.67, "width": 750, "height": 426}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742721814.png", "hash": 1671742721814, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.92, "width": 245, "height": 139}}	1671742721766	.png	image/png	39.80	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742721766.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:58:43.904	2022-12-22 20:58:43.904	3	3
310	image.png	\N	\N	822	521	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742771374.png", "hash": 1671742771374, "mime": "image/png", "name": "small_image.png", "path": null, "size": 58.93, "width": 500, "height": 317}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742771375.png", "hash": 1671742771375, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 105.76, "width": 750, "height": 475}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742771128.png", "hash": 1671742771128, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 21.37, "width": 245, "height": 155}}	1671742771086	.png	image/png	33.61	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742771086.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 20:59:32.771	2022-12-22 20:59:32.771	3	3
311	image.png	\N	\N	941	459	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742899759.png", "hash": 1671742899759, "mime": "image/png", "name": "small_image.png", "path": null, "size": 67.92, "width": 500, "height": 244}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742899755.png", "hash": 1671742899755, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 125.68, "width": 750, "height": 366}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742899518.png", "hash": 1671742899518, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.88, "width": 245, "height": 120}}	1671742899472	.png	image/png	42.76	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742899472.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:01:41.338	2022-12-22 21:01:41.338	3	3
312	image.png	\N	\N	939	174	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742942037.png", "hash": 1671742942037, "mime": "image/png", "name": "small_image.png", "path": null, "size": 23.33, "width": 500, "height": 93}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742942035.png", "hash": 1671742942035, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 43.12, "width": 750, "height": 139}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742941826.png", "hash": 1671742941826, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 8.31, "width": 245, "height": 45}}	1671742941804	.png	image/png	14.86	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742941804.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:02:23.304	2022-12-22 21:02:23.304	3	3
313	image.png	\N	\N	855	429	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742960768.png", "hash": 1671742960768, "mime": "image/png", "name": "small_image.png", "path": null, "size": 47.88, "width": 500, "height": 251}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742960770.png", "hash": 1671742960770, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 84.61, "width": 750, "height": 376}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742960537.png", "hash": 1671742960537, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.91, "width": 245, "height": 123}}	1671742960500	.png	image/png	26.17	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742960500.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:02:42.298	2022-12-22 21:02:42.298	3	3
314	image.png	\N	\N	875	443	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671742980480.png", "hash": 1671742980480, "mime": "image/png", "name": "small_image.png", "path": null, "size": 48.66, "width": 500, "height": 253}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671742980483.png", "hash": 1671742980483, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 86.58, "width": 750, "height": 380}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671742980241.png", "hash": 1671742980241, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.39, "width": 245, "height": 124}}	1671742980199	.png	image/png	27.85	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742980199.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:03:01.735	2022-12-22 21:03:01.735	3	3
315	image.png	\N	\N	878	437	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743004274.png", "hash": 1671743004274, "mime": "image/png", "name": "small_image.png", "path": null, "size": 58.29, "width": 500, "height": 249}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743004276.png", "hash": 1671743004276, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 106.41, "width": 750, "height": 373}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743004033.png", "hash": 1671743004033, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.52, "width": 245, "height": 122}}	1671743003992	.png	image/png	35.35	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743003992.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:03:25.55	2022-12-22 21:03:25.55	3	3
316	Distribucion de tiempos entre eventos.png	Distribucion de tiempos entre eventos.png	Distribucion de tiempos entre eventos.png	821	151	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Distribucion de tiempos entre eventos_1671743119489.png", "hash": 1671743119489, "mime": "image/png", "name": "small_Distribucion de tiempos entre eventos.png", "path": null, "size": 12.29, "width": 500, "height": 92}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Distribucion de tiempos entre eventos_1671743119487.png", "hash": 1671743119487, "mime": "image/png", "name": "medium_Distribucion de tiempos entre eventos.png", "path": null, "size": 22.11, "width": 750, "height": 138}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Distribucion de tiempos entre eventos_1671743119286.png", "hash": 1671743119286, "mime": "image/png", "name": "thumbnail_Distribucion de tiempos entre eventos.png", "path": null, "size": 5.07, "width": 245, "height": 45}}	1671743119265	.png	image/png	17.05	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Distribucion de tiempos entre eventos_1671743119265.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:05:20.588	2022-12-22 21:06:29.787	3	3
317	Distribucion de tiempos entre eventos.png	Distribucion de tiempos entre eventos.png	Distribucion de tiempos entre eventos.png	821	151	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_Distribucion de tiempos entre eventos_1671743213754.png", "hash": 1671743213754, "mime": "image/png", "name": "small_Distribucion de tiempos entre eventos.png", "path": null, "size": 12.29, "width": 500, "height": 92}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_Distribucion de tiempos entre eventos_1671743213752.png", "hash": 1671743213752, "mime": "image/png", "name": "medium_Distribucion de tiempos entre eventos.png", "path": null, "size": 22.11, "width": 750, "height": 138}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_Distribucion de tiempos entre eventos_1671743213551.png", "hash": 1671743213551, "mime": "image/png", "name": "thumbnail_Distribucion de tiempos entre eventos.png", "path": null, "size": 5.07, "width": 245, "height": 45}}	1671743213529	.png	image/png	17.05	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/Distribucion de tiempos entre eventos_1671743213529.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:06:54.815	2022-12-22 21:06:54.815	3	3
318	image.png	\N	\N	928	287	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743317217.png", "hash": 1671743317217, "mime": "image/png", "name": "small_image.png", "path": null, "size": 35.73, "width": 500, "height": 155}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743317215.png", "hash": 1671743317215, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 63.29, "width": 750, "height": 232}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743316999.png", "hash": 1671743316999, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 12.59, "width": 245, "height": 76}}	1671743316971	.png	image/png	23.68	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743316971.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:08:38.668	2022-12-22 21:08:38.668	3	3
319	image.png	\N	\N	947	603	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743501976.png", "hash": 1671743501976, "mime": "image/png", "name": "small_image.png", "path": null, "size": 67.37, "width": 500, "height": 318}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743501974.png", "hash": 1671743501974, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 118.9, "width": 750, "height": 478}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743501721.png", "hash": 1671743501721, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.44, "width": 245, "height": 156}}	1671743501671	.png	image/png	48.00	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743501671.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:11:43.531	2022-12-22 21:11:43.531	3	3
320	image.png	\N	\N	936	567	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743541399.png", "hash": 1671743541399, "mime": "image/png", "name": "small_image.png", "path": null, "size": 54.18, "width": 500, "height": 303}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743541401.png", "hash": 1671743541401, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 97.12, "width": 750, "height": 454}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743541154.png", "hash": 1671743541154, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.88, "width": 245, "height": 148}}	1671743541102	.png	image/png	39.82	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743541102.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:12:22.773	2022-12-22 21:12:22.773	3	3
321	image.png	\N	\N	812	634	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743571352.png", "hash": 1671743571352, "mime": "image/png", "name": "small_image.png", "path": null, "size": 59.72, "width": 500, "height": 390}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743571354.png", "hash": 1671743571354, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 107.52, "width": 750, "height": 586}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743571094.png", "hash": 1671743571094, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.02, "width": 200, "height": 156}}	1671743571052	.png	image/png	36.90	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743571052.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:12:52.708	2022-12-22 21:12:52.708	3	3
322	image.png	\N	\N	930	540	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743595419.png", "hash": 1671743595419, "mime": "image/png", "name": "small_image.png", "path": null, "size": 53.67, "width": 500, "height": 290}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743595422.png", "hash": 1671743595422, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 95.16, "width": 750, "height": 435}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743595176.png", "hash": 1671743595176, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.64, "width": 245, "height": 142}}	1671743595131	.png	image/png	39.21	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743595131.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:13:16.796	2022-12-22 21:13:16.796	3	3
323	image.png	\N	\N	902	556	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743644507.png", "hash": 1671743644507, "mime": "image/png", "name": "small_image.png", "path": null, "size": 54.77, "width": 500, "height": 308}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743644509.png", "hash": 1671743644509, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 98.93, "width": 750, "height": 462}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743644262.png", "hash": 1671743644262, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.84, "width": 245, "height": 151}}	1671743644215	.png	image/png	38.00	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743644215.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:14:06.157	2022-12-22 21:14:06.157	3	3
324	image.png	\N	\N	861	526	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743896811.png", "hash": 1671743896811, "mime": "image/png", "name": "small_image.png", "path": null, "size": 49.23, "width": 500, "height": 305}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743896813.png", "hash": 1671743896813, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 87.62, "width": 750, "height": 458}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743896572.png", "hash": 1671743896572, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.15, "width": 245, "height": 150}}	1671743896528	.png	image/png	33.62	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743896528.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:18:18.217	2022-12-22 21:18:18.217	3	3
325	image.png	\N	\N	870	518	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671743974062.png", "hash": 1671743974062, "mime": "image/png", "name": "small_image.png", "path": null, "size": 49.07, "width": 500, "height": 298}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671743974064.png", "hash": 1671743974064, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 86.46, "width": 750, "height": 447}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671743973820.png", "hash": 1671743973820, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.97, "width": 245, "height": 146}}	1671743973779	.png	image/png	33.53	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743973779.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:19:35.502	2022-12-22 21:19:35.502	3	3
326	image.png	\N	\N	948	508	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671744101029.png", "hash": 1671744101029, "mime": "image/png", "name": "small_image.png", "path": null, "size": 48.79, "width": 500, "height": 268}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671744101031.png", "hash": 1671744101031, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 86.15, "width": 750, "height": 402}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671744100782.png", "hash": 1671744100782, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.69, "width": 245, "height": 131}}	1671744100733	.png	image/png	36.00	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671744100733.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:21:42.457	2022-12-22 21:21:42.457	3	3
327	image.png	\N	\N	928	163	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671744890335.png", "hash": 1671744890335, "mime": "image/png", "name": "small_image.png", "path": null, "size": 24.1, "width": 500, "height": 88}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671744890334.png", "hash": 1671744890334, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 42.91, "width": 750, "height": 132}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671744890125.png", "hash": 1671744890125, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 8.21, "width": 245, "height": 43}}	1671744890104	.png	image/png	17.75	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671744890104.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:34:51.839	2022-12-22 21:34:51.839	3	3
328	image.png	\N	\N	831	487	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671744919492.png", "hash": 1671744919492, "mime": "image/png", "name": "small_image.png", "path": null, "size": 48.88, "width": 500, "height": 293}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671744919494.png", "hash": 1671744919494, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 86.66, "width": 750, "height": 440}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671744919257.png", "hash": 1671744919257, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.32, "width": 245, "height": 144}}	1671744919217	.png	image/png	30.81	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671744919217.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:35:20.711	2022-12-22 21:35:20.711	3	3
329	image.png	\N	\N	844	463	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671744955896.png", "hash": 1671744955896, "mime": "image/png", "name": "small_image.png", "path": null, "size": 50.84, "width": 500, "height": 274}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671744955898.png", "hash": 1671744955898, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 90.92, "width": 750, "height": 411}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671744955664.png", "hash": 1671744955664, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.53, "width": 245, "height": 134}}	1671744955625	.png	image/png	31.79	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671744955625.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:35:57.386	2022-12-22 21:35:57.386	3	3
330	image.png	\N	\N	915	122	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745065899.png", "hash": 1671745065899, "mime": "image/png", "name": "small_image.png", "path": null, "size": 21.96, "width": 500, "height": 67}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745065896.png", "hash": 1671745065896, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 40.13, "width": 750, "height": 100}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745065693.png", "hash": 1671745065693, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 7.36, "width": 245, "height": 33}}	1671745065675	.png	image/png	15.94	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745065675.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:37:47.796	2022-12-22 21:37:47.796	3	3
331	image.png	\N	\N	920	155	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745093928.png", "hash": 1671745093928, "mime": "image/png", "name": "small_image.png", "path": null, "size": 23.83, "width": 500, "height": 84}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745093926.png", "hash": 1671745093926, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 43.32, "width": 750, "height": 126}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745093717.png", "hash": 1671745093717, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 8.13, "width": 245, "height": 41}}	1671745093695	.png	image/png	17.37	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745093695.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:38:15.169	2022-12-22 21:38:15.169	3	3
332	image.png	\N	\N	834	489	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745115160.png", "hash": 1671745115160, "mime": "image/png", "name": "small_image.png", "path": null, "size": 48.48, "width": 500, "height": 293}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745115162.png", "hash": 1671745115162, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 86.71, "width": 750, "height": 440}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745114923.png", "hash": 1671745114923, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.22, "width": 245, "height": 144}}	1671745114883	.png	image/png	30.90	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745114883.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:38:36.822	2022-12-22 21:38:36.822	3	3
333	image.png	\N	\N	840	433	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745139667.png", "hash": 1671745139667, "mime": "image/png", "name": "small_image.png", "path": null, "size": 50.75, "width": 500, "height": 258}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745139669.png", "hash": 1671745139669, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 91.22, "width": 750, "height": 387}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745139438.png", "hash": 1671745139438, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.59, "width": 245, "height": 126}}	1671745139400	.png	image/png	31.58	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745139400.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:39:00.983	2022-12-22 21:39:00.983	3	3
353	PROCESO DE POISSON COMPUESTO.png	PROCESO DE POISSON COMPUESTO.png	PROCESO DE POISSON COMPUESTO.png	857	478	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_PROCESO DE POISSON COMPUESTO_1671746344438.png", "hash": 1671746344438, "mime": "image/png", "name": "small_PROCESO DE POISSON COMPUESTO.png", "path": null, "size": 130.57, "width": 500, "height": 279}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_PROCESO DE POISSON COMPUESTO_1671746344440.png", "hash": 1671746344440, "mime": "image/png", "name": "medium_PROCESO DE POISSON COMPUESTO.png", "path": null, "size": 272.21, "width": 750, "height": 418}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROCESO DE POISSON COMPUESTO_1671746344198.png", "hash": 1671746344198, "mime": "image/png", "name": "thumbnail_PROCESO DE POISSON COMPUESTO.png", "path": null, "size": 36.91, "width": 245, "height": 137}}	1671746344153	.png	image/png	314.33	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROCESO DE POISSON COMPUESTO_1671746344153.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:59:06.054	2022-12-22 21:59:06.054	3	3
354	PROCESO DE POISSON NO HOMOGENEO.png	PROCESO DE POISSON NO HOMOGENEO.png	PROCESO DE POISSON NO HOMOGENEO.png	411	122	{"thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_PROCESO DE POISSON NO HOMOGENEO_1671747651069.png", "hash": 1671747651069, "mime": "image/png", "name": "thumbnail_PROCESO DE POISSON NO HOMOGENEO.png", "path": null, "size": 9.23, "width": 245, "height": 73}}	1671747651054	.png	image/png	6.03	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROCESO DE POISSON NO HOMOGENEO_1671747651054.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 22:20:52.829	2022-12-22 22:21:50.59	3	3
334	image.png	\N	\N	839	514	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745227816.png", "hash": 1671745227816, "mime": "image/png", "name": "small_image.png", "path": null, "size": 51.48, "width": 500, "height": 306}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745227819.png", "hash": 1671745227819, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 94.69, "width": 750, "height": 459}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745227574.png", "hash": 1671745227574, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 18.79, "width": 245, "height": 150}}	1671745227529	.png	image/png	40.97	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745227529.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:40:29.227	2022-12-22 21:40:29.227	3	3
335	image.png	\N	\N	511	401	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745254635.png", "hash": 1671745254635, "mime": "image/png", "name": "small_image.png", "path": null, "size": 109.82, "width": 500, "height": 392}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745254410.png", "hash": 1671745254410, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 24.37, "width": 199, "height": 156}}	1671745254373	.png	image/png	96.72	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745254373.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:40:55.96	2022-12-22 21:40:55.96	3	3
336	image.png	\N	\N	919	443	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745295682.png", "hash": 1671745295682, "mime": "image/png", "name": "small_image.png", "path": null, "size": 68.97, "width": 500, "height": 241}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745295680.png", "hash": 1671745295680, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 127.79, "width": 750, "height": 362}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745295443.png", "hash": 1671745295443, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.3, "width": 245, "height": 118}}	1671745295400	.png	image/png	47.92	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745295400.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:41:37.419	2022-12-22 21:41:37.419	3	3
337	image.png	\N	\N	799	109	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745324920.png", "hash": 1671745324920, "mime": "image/png", "name": "small_image.png", "path": null, "size": 15.99, "width": 500, "height": 68}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745324918.png", "hash": 1671745324918, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 28.74, "width": 750, "height": 102}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745324720.png", "hash": 1671745324720, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 5.71, "width": 245, "height": 33}}	1671745324704	.png	image/png	9.16	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745324704.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:42:06.089	2022-12-22 21:42:06.089	3	3
338	image.png	\N	\N	739	627	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745364806.png", "hash": 1671745364806, "mime": "image/png", "name": "small_image.png", "path": null, "size": 50.42, "width": 500, "height": 424}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745364571.png", "hash": 1671745364571, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.71, "width": 184, "height": 156}}	1671745364533	.png	image/png	27.74	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745364533.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:42:46.012	2022-12-22 21:42:46.012	3	3
339	image.png	\N	\N	883	287	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745408314.png", "hash": 1671745408314, "mime": "image/png", "name": "small_image.png", "path": null, "size": 34.55, "width": 500, "height": 163}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745408313.png", "hash": 1671745408313, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 60.82, "width": 750, "height": 244}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745408093.png", "hash": 1671745408093, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.77, "width": 245, "height": 80}}	1671745408063	.png	image/png	22.85	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745408063.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:43:29.665	2022-12-22 21:43:29.665	3	3
340	image.png	\N	\N	865	617	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745497123.png", "hash": 1671745497123, "mime": "image/png", "name": "small_image.png", "path": null, "size": 77.57, "width": 500, "height": 357}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745497125.png", "hash": 1671745497125, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 139.99, "width": 750, "height": 535}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745496872.png", "hash": 1671745496872, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.79, "width": 219, "height": 156}}	1671745496820	.png	image/png	50.32	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745496820.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:44:58.905	2022-12-22 21:44:58.905	3	3
341	image.png	\N	\N	961	277	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745629914.png", "hash": 1671745629914, "mime": "image/png", "name": "small_image.png", "path": null, "size": 34.72, "width": 500, "height": 144}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745629912.png", "hash": 1671745629912, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 64.65, "width": 750, "height": 216}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745629692.png", "hash": 1671745629692, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 11.86, "width": 245, "height": 71}}	1671745629662	.png	image/png	24.18	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745629662.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:47:11.333	2022-12-22 21:47:11.333	3	3
342	image.png	\N	\N	936	486	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745765361.png", "hash": 1671745765361, "mime": "image/png", "name": "small_image.png", "path": null, "size": 59.23, "width": 500, "height": 260}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745765365.png", "hash": 1671745765365, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 109.7, "width": 750, "height": 389}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745765121.png", "hash": 1671745765121, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 20.01, "width": 245, "height": 127}}	1671745765078	.png	image/png	42.58	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745765078.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:49:26.989	2022-12-22 21:49:26.989	3	3
343	image.png	\N	\N	969	649	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745911811.png", "hash": 1671745911811, "mime": "image/png", "name": "small_image.png", "path": null, "size": 139, "width": 500, "height": 335}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745911813.png", "hash": 1671745911813, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 278.82, "width": 750, "height": 502}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745911518.png", "hash": 1671745911518, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 39.1, "width": 233, "height": 156}}	1671745911457	.png	image/png	332.94	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745911457.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:51:53.517	2022-12-22 21:51:53.517	3	3
344	image.png	\N	\N	840	599	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745946413.png", "hash": 1671745946413, "mime": "image/png", "name": "small_image.png", "path": null, "size": 68.31, "width": 500, "height": 357}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745946412.png", "hash": 1671745946412, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 127.03, "width": 750, "height": 535}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745946165.png", "hash": 1671745946165, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.65, "width": 219, "height": 156}}	1671745946118	.png	image/png	42.96	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745946118.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:52:27.835	2022-12-22 21:52:27.835	3	3
345	image.png	\N	\N	840	599	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745960011.png", "hash": 1671745960011, "mime": "image/png", "name": "small_image.png", "path": null, "size": 68.31, "width": 500, "height": 357}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745960009.png", "hash": 1671745960009, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 127.03, "width": 750, "height": 535}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745959761.png", "hash": 1671745959761, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.65, "width": 219, "height": 156}}	1671745959713	.png	image/png	42.96	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745959713.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:52:41.289	2022-12-22 21:52:41.289	3	3
346	image.png	\N	\N	840	599	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671745975132.png", "hash": 1671745975132, "mime": "image/png", "name": "small_image.png", "path": null, "size": 68.31, "width": 500, "height": 357}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671745975134.png", "hash": 1671745975134, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 127.03, "width": 750, "height": 535}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671745974884.png", "hash": 1671745974884, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 19.65, "width": 219, "height": 156}}	1671745974838	.png	image/png	42.96	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745974838.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:52:56.488	2022-12-22 21:52:56.488	3	3
347	image.png	\N	\N	850	623	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671746057169.png", "hash": 1671746057169, "mime": "image/png", "name": "small_image.png", "path": null, "size": 52.6, "width": 500, "height": 366}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671746057171.png", "hash": 1671746057171, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 91.86, "width": 750, "height": 550}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671746056924.png", "hash": 1671746056924, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.27, "width": 213, "height": 156}}	1671746056876	.png	image/png	34.54	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746056876.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:54:18.694	2022-12-22 21:54:18.694	3	3
348	image.png	\N	\N	850	623	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671746077831.png", "hash": 1671746077831, "mime": "image/png", "name": "small_image.png", "path": null, "size": 52.6, "width": 500, "height": 366}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671746077833.png", "hash": 1671746077833, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 91.86, "width": 750, "height": 550}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671746077584.png", "hash": 1671746077584, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 15.27, "width": 213, "height": 156}}	1671746077539	.png	image/png	34.54	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746077539.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:54:39.338	2022-12-22 21:54:39.338	3	3
349	image.png	\N	\N	842	533	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671746102695.png", "hash": 1671746102695, "mime": "image/png", "name": "small_image.png", "path": null, "size": 46.64, "width": 500, "height": 317}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671746102697.png", "hash": 1671746102697, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 80.15, "width": 750, "height": 475}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671746102457.png", "hash": 1671746102457, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 16.74, "width": 245, "height": 155}}	1671746102417	.png	image/png	30.40	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746102417.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:55:03.988	2022-12-22 21:55:03.988	3	3
350	image.png	\N	\N	836	644	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671746176427.png", "hash": 1671746176427, "mime": "image/png", "name": "small_image.png", "path": null, "size": 70.41, "width": 500, "height": 385}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671746176429.png", "hash": 1671746176429, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 129.01, "width": 750, "height": 578}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671746176177.png", "hash": 1671746176177, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.83, "width": 203, "height": 156}}	1671746176129	.png	image/png	41.47	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746176129.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:56:18.158	2022-12-22 21:56:18.158	3	3
351	image.png	\N	\N	836	644	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671746190500.png", "hash": 1671746190500, "mime": "image/png", "name": "small_image.png", "path": null, "size": 70.41, "width": 500, "height": 385}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671746190499.png", "hash": 1671746190499, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 129.01, "width": 750, "height": 578}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671746190250.png", "hash": 1671746190250, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 17.83, "width": 203, "height": 156}}	1671746190206	.png	image/png	41.47	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746190206.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:56:31.982	2022-12-22 21:56:31.982	3	3
352	image.png	\N	\N	1282	766	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_image_1671746221389.png", "hash": 1671746221389, "mime": "image/png", "name": "large_image.png", "path": null, "size": 181.73, "width": 1000, "height": 598}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671746221387.png", "hash": 1671746221387, "mime": "image/png", "name": "small_image.png", "path": null, "size": 67.49, "width": 500, "height": 299}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671746221386.png", "hash": 1671746221386, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 118.15, "width": 750, "height": 448}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671746221089.png", "hash": 1671746221089, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 23.84, "width": 245, "height": 146}}	1671746221025	.png	image/png	195.47	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746221025.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 21:57:02.729	2022-12-22 21:57:02.729	3	3
355	image.png	\N	\N	786	394	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671748164931.png", "hash": 1671748164931, "mime": "image/png", "name": "small_image.png", "path": null, "size": 40.95, "width": 500, "height": 251}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671748164933.png", "hash": 1671748164933, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 76.2, "width": 750, "height": 376}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671748164702.png", "hash": 1671748164702, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 14.45, "width": 245, "height": 123}}	1671748164662	.png	image/png	43.89	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748164662.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 22:29:26.311	2022-12-22 22:29:26.311	3	3
356	image.png	\N	\N	800	399	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671748218561.png", "hash": 1671748218561, "mime": "image/png", "name": "small_image.png", "path": null, "size": 64.31, "width": 500, "height": 249}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671748218563.png", "hash": 1671748218563, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 117.89, "width": 750, "height": 374}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671748218329.png", "hash": 1671748218329, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.87, "width": 245, "height": 122}}	1671748218293	.png	image/png	47.91	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748218293.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 22:30:19.896	2022-12-22 22:30:19.896	3	3
357	image.png	\N	\N	801	500	{"small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671748267247.png", "hash": 1671748267247, "mime": "image/png", "name": "small_image.png", "path": null, "size": 65.06, "width": 500, "height": 312}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671748267250.png", "hash": 1671748267250, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 117.85, "width": 750, "height": 468}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671748267011.png", "hash": 1671748267011, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 22.39, "width": 245, "height": 153}}	1671748266964	.png	image/png	56.75	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748266964.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 22:31:08.752	2022-12-22 22:31:08.752	3	3
358	integrales.jpg	\N	\N	527	716	{"small": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_integrales_1671748603450.jpg", "hash": 1671748603450, "mime": "image/jpeg", "name": "small_integrales.jpg", "path": null, "size": 43.13, "width": 368, "height": 500}, "thumbnail": {"ext": ".jpg", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_integrales_1671748603253.jpg", "hash": 1671748603253, "mime": "image/jpeg", "name": "thumbnail_integrales.jpg", "path": null, "size": 5.61, "width": 115, "height": 156}}	1671748603238	.jpg	image/jpeg	71.64	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/integrales_1671748603238.jpg	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 22:36:44.719	2022-12-22 22:36:44.719	3	3
359	image.png	\N	\N	1364	910	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_image_1671748678989.png", "hash": 1671748678989, "mime": "image/png", "name": "large_image.png", "path": null, "size": 250.98, "width": 1000, "height": 667}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671748678980.png", "hash": 1671748678980, "mime": "image/png", "name": "small_image.png", "path": null, "size": 90.15, "width": 500, "height": 334}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671748678987.png", "hash": 1671748678987, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 165.83, "width": 750, "height": 500}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671748678673.png", "hash": 1671748678673, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 28.77, "width": 234, "height": 156}}	1671748678592	.png	image/png	101.65	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748678592.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 22:38:00.648	2022-12-22 22:38:00.648	3	3
360	image.png	\N	\N	1364	910	{"large": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/large_image_1671748694765.png", "hash": 1671748694765, "mime": "image/png", "name": "large_image.png", "path": null, "size": 250.98, "width": 1000, "height": 667}, "small": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/small_image_1671748694762.png", "hash": 1671748694762, "mime": "image/png", "name": "small_image.png", "path": null, "size": 90.15, "width": 500, "height": 334}, "medium": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/medium_image_1671748694764.png", "hash": 1671748694764, "mime": "image/png", "name": "medium_image.png", "path": null, "size": 165.83, "width": 750, "height": 500}, "thumbnail": {"ext": ".png", "url": "https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/thumbnail_image_1671748694449.png", "hash": 1671748694449, "mime": "image/png", "name": "thumbnail_image.png", "path": null, "size": 28.77, "width": 234, "height": 156}}	1671748694373	.png	image/png	101.65	https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748694373.png	\N	strapi-provider-upload-supabase-v4	\N	/	2022-12-22 22:38:16.665	2022-12-22 22:38:16.665	3	3
\.


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
93	210	2	api::subtopic.subtopic	cover	1
6	6	2	api::tutorial.tutorial	cover	1
7	7	3	api::tutorial.tutorial	cover	1
97	183	2	api::topic.topic	cover	1
104	172	1	api::chapter.chapter	cover	1
105	145	2	api::chapter.chapter	cover	1
108	297	7	api::subtopic.subtopic	cover	1
110	264	5	api::subtopic.subtopic	cover	1
111	252	4	api::subtopic.subtopic	cover	1
113	308	8	api::subtopic.subtopic	cover	1
114	296	5	api::topic.topic	cover	1
118	317	9	api::subtopic.subtopic	cover	1
119	353	12	api::subtopic.subtopic	cover	1
123	354	6	api::topic.topic	cover	1
124	215	3	api::subtopic.subtopic	cover	1
125	361	4	api::topic.topic	cover	1
46	98	16	api::subtopic.subtopic	cover	1
47	100	3	api::chapter.chapter	cover	1
50	102	7	api::topic.topic	cover	1
56	107	17	api::subtopic.subtopic	cover	1
58	113	18	api::subtopic.subtopic	cover	1
76	171	19	api::subtopic.subtopic	cover	1
79	146	8	api::topic.topic	cover	1
84	30	1	api::topic.topic	cover	1
86	200	3	api::topic.topic	cover	1
90	204	1	api::subtopic.subtopic	cover	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2022-11-15 02:17:46.049	2022-11-15 02:17:46.049	\N	\N
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	Staging read-only access		read-only	734a2d359f5857ae102dec7d1d7a996155f6bdb57b6072231d6a47c62ce0a71fde2dcc8b6f7e78c9a374a7ac5089efcadd00919ec4d6564a1142837927d95cd1	2022-12-24 00:19:27.743	\N	\N	2022-11-15 22:57:50.27	2022-12-24 00:19:27.743	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
3	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}],[{"name":"roles","size":6}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"path","size":6},{"name":"parent","size":6}],[{"name":"children","size":6},{"name":"files","size":6}]]}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folderPath","size":6},{"name":"folder","size":6}]]}}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]}}	object	\N	\N
17	plugin_i18n_default_locale	"en"	string	\N	\N
18	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}	object	\N	\N
19	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
20	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
15	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4},{"name":"permissions","size":6}]]}}	object	\N	\N
16	plugin_upload_metrics	{"weeklySchedule":"15 1 21 * * 3","lastWeeklyUpdate":1671502967857}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"integer","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"integer","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"api::chapter.chapter":{"kind":"collectionType","collectionName":"chapters","info":{"singularName":"chapter","pluralName":"chapters","displayName":"Chapter","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"content":{"type":"richtext","required":true},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"summary":{"type":"text","maxLength":255},"topics":{"type":"relation","relation":"oneToMany","target":"api::topic.topic","mappedBy":"chapter"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"chapters","info":{"singularName":"chapter","pluralName":"chapters","displayName":"Chapter","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"content":{"type":"richtext","required":true},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"summary":{"type":"text","maxLength":255},"topics":{"type":"relation","relation":"oneToMany","target":"api::topic.topic","mappedBy":"chapter"}},"kind":"collectionType"},"modelType":"contentType","modelName":"chapter","connection":"default","uid":"api::chapter.chapter","apiName":"chapter","globalId":"Chapter","actions":{},"lifecycles":{}},"api::subtopic.subtopic":{"kind":"collectionType","collectionName":"subtopics","info":{"singularName":"subtopic","pluralName":"subtopics","displayName":"Subtopic","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"content":{"type":"richtext","required":true},"cover":{"allowedTypes":["images"],"type":"media","multiple":false},"summary":{"type":"text","maxLength":255},"topic":{"type":"relation","relation":"manyToOne","target":"api::topic.topic","inversedBy":"subtopics"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"subtopics","info":{"singularName":"subtopic","pluralName":"subtopics","displayName":"Subtopic","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"content":{"type":"richtext","required":true},"cover":{"allowedTypes":["images"],"type":"media","multiple":false},"summary":{"type":"text","maxLength":255},"topic":{"type":"relation","relation":"manyToOne","target":"api::topic.topic","inversedBy":"subtopics"}},"kind":"collectionType"},"modelType":"contentType","modelName":"subtopic","connection":"default","uid":"api::subtopic.subtopic","apiName":"subtopic","globalId":"Subtopic","actions":{},"lifecycles":{}},"api::topic.topic":{"kind":"collectionType","collectionName":"topics","info":{"singularName":"topic","pluralName":"topics","displayName":"Topic","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"content":{"type":"richtext","required":true},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"summary":{"type":"text","maxLength":255},"chapter":{"type":"relation","relation":"manyToOne","target":"api::chapter.chapter","inversedBy":"topics"},"subtopics":{"type":"relation","relation":"oneToMany","target":"api::subtopic.subtopic","mappedBy":"topic"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"topics","info":{"singularName":"topic","pluralName":"topics","displayName":"Topic","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"content":{"type":"richtext","required":true},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"summary":{"type":"text","maxLength":255},"chapter":{"type":"relation","relation":"manyToOne","target":"api::chapter.chapter","inversedBy":"topics"},"subtopics":{"type":"relation","relation":"oneToMany","target":"api::subtopic.subtopic","mappedBy":"topic"}},"kind":"collectionType"},"modelType":"contentType","modelName":"topic","connection":"default","uid":"api::topic.topic","apiName":"topic","globalId":"Topic","actions":{},"lifecycles":{}}}	object	\N	\N
21	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object	\N	\N
6	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
2	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}	object	\N	\N
25	plugin_content_manager_configuration_content_types::api::chapter.chapter	{"uid":"api::chapter.chapter","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"summary":{"edit":{"label":"summary","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"summary","searchable":true,"sortable":true}},"topics":{"edit":{"label":"topics","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"topics","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","cover","summary"],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"cover","size":6},{"name":"summary","size":6}],[{"name":"topics","size":6}]]}}	object	\N	\N
26	plugin_content_manager_configuration_content_types::api::subtopic.subtopic	{"uid":"api::subtopic.subtopic","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"summary":{"edit":{"label":"summary","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"summary","searchable":true,"sortable":true}},"topic":{"edit":{"label":"topic","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"topic","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","cover","summary"],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"cover","size":6},{"name":"summary","size":6}],[{"name":"topic","size":6}]]}}	object	\N	\N
27	plugin_content_manager_configuration_content_types::api::topic.topic	{"uid":"api::topic.topic","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"summary":{"edit":{"label":"summary","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"summary","searchable":true,"sortable":true}},"chapter":{"edit":{"label":"chapter","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"chapter","searchable":true,"sortable":true}},"subtopics":{"edit":{"label":"subtopics","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"subtopics","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","cover","summary"],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"cover","size":6},{"name":"summary","size":6}],[{"name":"chapter","size":6},{"name":"subtopics","size":6}]]}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
5	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"chapters","indexes":[{"name":"chapters_created_by_id_fk","columns":["created_by_id"]},{"name":"chapters_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"chapters_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"chapters_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"summary","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"subtopics","indexes":[{"name":"subtopics_created_by_id_fk","columns":["created_by_id"]},{"name":"subtopics_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"subtopics_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"subtopics_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"summary","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"topics","indexes":[{"name":"topics_created_by_id_fk","columns":["created_by_id"]},{"name":"topics_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"topics_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"topics_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"summary","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"subtopics_topic_links","indexes":[{"name":"subtopics_topic_links_fk","columns":["subtopic_id"]},{"name":"subtopics_topic_links_inv_fk","columns":["topic_id"]},{"name":"subtopics_topic_links_unique","columns":["subtopic_id","topic_id"],"type":"unique"},{"name":"subtopics_topic_links_order_inv_fk","columns":["subtopic_order"]}],"foreignKeys":[{"name":"subtopics_topic_links_fk","columns":["subtopic_id"],"referencedColumns":["id"],"referencedTable":"subtopics","onDelete":"CASCADE"},{"name":"subtopics_topic_links_inv_fk","columns":["topic_id"],"referencedColumns":["id"],"referencedTable":"topics","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"subtopic_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"topic_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"subtopic_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"topics_chapter_links","indexes":[{"name":"topics_chapter_links_fk","columns":["topic_id"]},{"name":"topics_chapter_links_inv_fk","columns":["chapter_id"]},{"name":"topics_chapter_links_unique","columns":["topic_id","chapter_id"],"type":"unique"},{"name":"topics_chapter_links_order_inv_fk","columns":["topic_order"]}],"foreignKeys":[{"name":"topics_chapter_links_fk","columns":["topic_id"],"referencedColumns":["id"],"referencedTable":"topics","onDelete":"CASCADE"},{"name":"topics_chapter_links_inv_fk","columns":["chapter_id"],"referencedColumns":["id"],"referencedTable":"chapters","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"topic_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"chapter_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"topic_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2022-12-22 00:37:04.864	747a0b7639eeb57dbc372e0789a1d266
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: subtopics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subtopics (id, title, content, summary, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	1.3.1 Regla de la multiplicación 	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671723776237.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/regla de la multiplicacion_1671723848091.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724444851.png"></figure>	\N	2022-12-22 15:46:55.92	2022-12-22 15:54:12.702	2022-12-22 15:47:10.353	3	3
6	1.4.3. Propiedades y operaciones de variables aleatorias continuas	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729422083.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729491320.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729517612.png"></figure><figure class="image image_resized" style="width:88.05%;"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729582298.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729608946.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729650693.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729707265.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729726424.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729761367.png"></figure>	\N	2022-12-22 17:24:21.043	2022-12-22 17:24:49.013	2022-12-22 17:24:48.835	3	3
2	1.3.2 Permutación 	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724703127.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671724924076.png"></figure><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>	\N	2022-12-22 15:53:39.196	2022-12-22 16:02:42.4	2022-12-22 16:02:42.223	3	3
5	1.4.1 Variables aleatorias continuas	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728670487.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728698323.png"></figure><p><span style="font-family:'Times New Roman', Times, serif;font-size:35px;"><i>En el caso de las distribuciones de probabilidades continuas debe cumplirse:</i></span></p><p><img class="image_resized" style="width:54.39%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728837842.png"></p><p><img class="image_resized" style="width:86.81%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728902349.png"></p><p>&nbsp;</p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728966894.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728988117.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729008568.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729037275.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729056940.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729079652.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671729099709.png"></figure><p>&nbsp;</p>	\N	2022-12-22 17:13:11.448	2022-12-22 20:47:01.196	2022-12-22 17:14:24.032	3	3
4	1.4.2 Variables aleatorias discretas	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726795019.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726943282.png"></figure><p><span style="font-family:'Times New Roman', Times, serif;font-size:27px;"><i><strong>EN LAS DISTRIBUCION DE PROBABILIDADES DISCRETAS SE CUMPLE</strong></i></span></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726998442.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727020175.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727100995.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727130154.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727214254.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727241753.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727274481.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727332752.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727379239.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727414857.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727454007.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727477942.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727559092.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727586506.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727643211.png"></figure><p><span style="font-family:'Times New Roman', Times, serif;font-size:27px;"><i><strong>Si hubiesen mas de 2 poblaciones y de cada población se extrae una muestra se tiene:</strong></i></span></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727806480.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727877096.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671727979606.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671728037855.png"></figure>	\N	2022-12-22 16:54:50.955	2022-12-22 20:47:33.354	2022-12-22 16:55:58.193	3	3
3	1.3.3 Combinación	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725072977.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725111826.png"></figure><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>	\N	2022-12-22 16:06:58.35	2022-12-22 22:47:30.35	2022-12-22 16:08:43.064	3	3
7	2.1.1. Test de aplicabilidad	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671734947959.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735750794.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735773379.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735807713.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735828125.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735859342.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735884724.png"></figure><p><img class="image_resized" style="width:64%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671735903459.png"></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671736570517.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671736598557.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671736634955.png"></figure><p>&nbsp;</p>	\N	2022-12-22 18:59:54.117	2022-12-22 19:17:27.826	2022-12-22 19:14:11.158	3	3
10	2.1.4. Distribución condicional entre eventos	<p><span style="color:hsl(240,75%,60%);font-family:'Times New Roman', Times, serif;font-size:27px;"><i><strong>2.1.4.1 Papel de la Distribución Uniforme</strong></i></span></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743973779.png"></figure><p><span style="color:hsl(240,75%,60%);font-family:'Times New Roman', Times, serif;font-size:27px;"><i><strong>2.1.4.2 Papel de la Distribución Binomial&nbsp;</strong></i></span></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671744100733.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745093695.png"></figure><p><img class="image_resized" style="width:76.27%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745114883.png"></p><p><img class="image_resized" style="width:76.08%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745139400.png"></p><p>&nbsp;</p>	\N	2022-12-22 21:32:21.94	2022-12-22 21:39:23.015	2022-12-22 21:32:50.303	3	3
8	2.1.2  Tiempo entre eventos	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742268758.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742286201.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742347644.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742390284.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742453800.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742494059.png"></figure>	\N	2022-12-22 20:54:58.133	2022-12-22 20:55:57.998	2022-12-22 20:55:08.059	3	3
9	2.1.3 Distribución de tiempos entre eventos	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742721766.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742771086.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742941804.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742960500.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671742980199.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743003992.png"></figure><p>&nbsp;</p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743316971.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743501671.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743595131.png"></figure><p>&nbsp;</p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743571052.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671743644215.png"></figure><p>&nbsp;</p>	\N	2022-12-22 21:05:37.106	2022-12-22 21:16:01.17	2022-12-22 21:07:16.29	3	3
11	2.1.5 Descomposición de procesos de poisson 	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745227529.png"></figure><figure class="image image_resized image-style-side" style="width:42.8%;"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745254373.png"></figure><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745295400.png"></figure><p><img class="image_resized" style="width:70.65%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745324704.png"></p><p><img class="image_resized" style="width:88.74%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745364533.png"></p><p><img class="image_resized" style="width:86.8%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745408063.png"></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745496820.png"></figure><p><img class="image_resized" style="width:86.69%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745629662.png"></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745765078.png"></figure>	\N	2022-12-22 21:36:37.336	2022-12-22 21:49:57.341	2022-12-22 21:49:57.164	3	3
12	2.1.6  Procesos de Poisson Compuesto	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745911457.png"></figure><p><img class="image_resized" style="width:85.8%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671745974838.png"></p><p>&nbsp;</p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746102417.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746190206.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671746221025.png"></figure>	\N	2022-12-22 21:57:12.374	2022-12-22 21:59:25.77	2022-12-22 21:59:25.591	3	3
15	2.2.3 Tiempo entre eventos	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748694373.png"></figure><figure class="image"><img></figure>	\N	2022-12-22 22:38:01.028	2022-12-22 22:38:50.922	2022-12-22 22:38:50.745	3	3
13	2.2.1 Test de aplicabilidad	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748218293.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748266964.png"></figure>	\N	2022-12-22 22:29:05.459	2022-12-22 22:48:55.002	2022-12-22 22:32:53.46	3	3
14	2.2.2 Tablas de Integración 	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/integrales_1671748603238.jpg"></figure><p>&nbsp;</p>	\N	2022-12-22 22:36:50.123	2022-12-22 22:49:32.423	2022-12-22 22:39:11.995	3	3
\.


--
-- Data for Name: subtopics_topic_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subtopics_topic_links (id, subtopic_id, topic_id, subtopic_order) FROM stdin;
1	1	3	1
2	2	3	2
3	4	4	1
4	5	4	2
5	6	4	3
6	7	5	1
7	8	5	2
8	9	5	3
9	10	5	4
10	11	5	5
11	12	5	6
12	15	6	1
13	3	3	3
14	13	6	2
15	14	6	3
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics (id, title, content, summary, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	1.1 Conceptos Básicos 	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721404119.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721453248.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721499185.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721563534.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721682445.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721766094.png"></figure><p>&nbsp;</p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671721802298.png"></figure><p><span style="font-family:'Times New Roman', Times, serif;font-size:27px;"><i><strong>Otras propiedades de conjuntos :</strong></i></span></p><figure class="image image_resized" style="width:93.34%;"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/PROPIEDADES PROBABILIDAD_1671721947196.png"></figure><p>&nbsp;</p>	\N	2022-12-22 14:34:26.707	2022-12-22 15:12:57.756	2022-12-22 15:12:57.579	3	3
3	1.3 Técnicas de Conteo	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671723162564.png"></figure>	\N	2022-12-22 14:36:31.019	2022-12-22 16:09:21.434	2022-12-22 16:09:21.255	3	3
2	1.2 Definición y teoremas de probabilidad	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722144229.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722277660.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722331244.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722415494.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722468937.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722547925.png"></figure><p><img class="image_resized" style="width:60.18%;" src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722573664.png"></p><figure class="image image_resized" style="width:94.45%;"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722613161.png"></figure><p><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722686446.png"></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722744701.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722767234.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722809426.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671722866854.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725879428.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725913052.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671725924569.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726007080.png"></figure><p><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726049259.png"></p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726065805.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726084140.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726095905.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726193404.png"></figure><p>&nbsp;</p><p>&nbsp;</p><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726175065.png"></figure><figure class="image"><img></figure>	\N	2022-12-22 14:35:32.856	2022-12-22 16:23:27.969	2022-12-22 15:28:38.891	3	3
4	1.4 Variables Aleatorias 	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726565910.png"></figure><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671726653256.png"></figure>	\N	2022-12-22 14:37:20.826	2022-12-22 23:36:47.766	2022-12-22 16:31:11.688	3	3
5	2.1 Proceso de poisson homogeneo	<figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671736001692.png"></figure><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>	\N	2022-12-22 18:56:07.888	2022-12-22 20:57:00.778	2022-12-22 19:10:23.58	3	3
6	2.2 Proceso de Poisson no Homogeneo	<ul><li><span style="background-color:white;color:#202124;font-family:'Times New Roman', Times, serif;font-size:27px;"><i>Un proceso de Poisson no homogéneo es un&nbsp;proceso con tasa de tiempo estacionaria.</i></span></li><li><span style="background-color:white;color:#202124;font-family:'Times New Roman', Times, serif;font-size:27px;"><i>También&nbsp;conocidos&nbsp;como&nbsp;no&nbsp;estacionarios,&nbsp;se&nbsp;encuentra en que no se requiere la condición de incrementos estacionarios, por lo que se contempla la posibilidad de que algunos sucesos sean más frecuentes en ciertos periodos.</i></span></li></ul><figure class="image"><img src="https://znuldykwnfsssqpluszq.supabase.co/storage/v1/object/public/strapi-uploads/assets/image_1671748164662.png"></figure>	\N	2022-12-22 22:21:11.201	2022-12-22 22:29:32.5	2022-12-22 22:21:22.783	3	3
\.


--
-- Data for Name: topics_chapter_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics_chapter_links (id, topic_id, chapter_id, topic_order) FROM stdin;
1	1	1	1
2	2	1	2
3	3	1	3
4	4	1	4
5	5	2	1
6	6	2	2
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.user.me	2022-11-15 02:17:48.082	2022-11-15 02:17:48.082	\N	\N
2	plugin::users-permissions.auth.changePassword	2022-11-15 02:17:48.082	2022-11-15 02:17:48.082	\N	\N
3	plugin::users-permissions.auth.connect	2022-11-15 02:17:48.329	2022-11-15 02:17:48.329	\N	\N
4	plugin::users-permissions.auth.callback	2022-11-15 02:17:48.329	2022-11-15 02:17:48.329	\N	\N
6	plugin::users-permissions.auth.resetPassword	2022-11-15 02:17:48.329	2022-11-15 02:17:48.329	\N	\N
7	plugin::users-permissions.auth.forgotPassword	2022-11-15 02:17:48.329	2022-11-15 02:17:48.329	\N	\N
5	plugin::users-permissions.auth.register	2022-11-15 02:17:48.329	2022-11-15 02:17:48.329	\N	\N
8	plugin::users-permissions.auth.sendEmailConfirmation	2022-11-15 02:17:48.329	2022-11-15 02:17:48.329	\N	\N
9	plugin::users-permissions.auth.emailConfirmation	2022-11-15 02:17:48.329	2022-11-15 02:17:48.329	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	1	\N
2	2	1	\N
3	3	2	\N
4	4	2	\N
5	8	2	\N
6	9	2	\N
8	5	2	\N
9	7	2	\N
7	6	2	\N
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2022-11-15 02:17:47.557	2022-11-15 02:17:47.557	\N	\N
2	Public	Default role given to unauthenticated user.	public	2022-11-15 02:17:47.727	2022-11-15 22:45:24.352	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 150, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 150, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 5, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 5, true);


--
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chapters_id_seq', 4, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 4, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 361, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 125, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 27, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 5, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: subtopics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subtopics_id_seq', 15, true);


--
-- Name: subtopics_topic_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subtopics_topic_links_id_seq', 15, true);


--
-- Name: topics_chapter_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_chapter_links_id_seq', 6, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 6, true);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 10, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 10, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, true);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: subtopics subtopics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics
    ADD CONSTRAINT subtopics_pkey PRIMARY KEY (id);


--
-- Name: subtopics_topic_links subtopics_topic_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics_topic_links
    ADD CONSTRAINT subtopics_topic_links_pkey PRIMARY KEY (id);


--
-- Name: subtopics_topic_links subtopics_topic_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics_topic_links
    ADD CONSTRAINT subtopics_topic_links_unique UNIQUE (subtopic_id, topic_id);


--
-- Name: topics_chapter_links topics_chapter_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics_chapter_links
    ADD CONSTRAINT topics_chapter_links_pkey PRIMARY KEY (id);


--
-- Name: topics_chapter_links topics_chapter_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics_chapter_links
    ADD CONSTRAINT topics_chapter_links_unique UNIQUE (topic_id, chapter_id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: chapters_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chapters_created_by_id_fk ON public.chapters USING btree (created_by_id);


--
-- Name: chapters_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chapters_updated_by_id_fk ON public.chapters USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: subtopics_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subtopics_created_by_id_fk ON public.subtopics USING btree (created_by_id);


--
-- Name: subtopics_topic_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subtopics_topic_links_fk ON public.subtopics_topic_links USING btree (subtopic_id);


--
-- Name: subtopics_topic_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subtopics_topic_links_inv_fk ON public.subtopics_topic_links USING btree (topic_id);


--
-- Name: subtopics_topic_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subtopics_topic_links_order_inv_fk ON public.subtopics_topic_links USING btree (subtopic_order);


--
-- Name: subtopics_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subtopics_updated_by_id_fk ON public.subtopics USING btree (updated_by_id);


--
-- Name: topics_chapter_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX topics_chapter_links_fk ON public.topics_chapter_links USING btree (topic_id);


--
-- Name: topics_chapter_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX topics_chapter_links_inv_fk ON public.topics_chapter_links USING btree (chapter_id);


--
-- Name: topics_chapter_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX topics_chapter_links_order_inv_fk ON public.topics_chapter_links USING btree (topic_order);


--
-- Name: topics_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX topics_created_by_id_fk ON public.topics USING btree (created_by_id);


--
-- Name: topics_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX topics_updated_by_id_fk ON public.topics USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: chapters chapters_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: chapters chapters_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: subtopics subtopics_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics
    ADD CONSTRAINT subtopics_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: subtopics_topic_links subtopics_topic_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics_topic_links
    ADD CONSTRAINT subtopics_topic_links_fk FOREIGN KEY (subtopic_id) REFERENCES public.subtopics(id) ON DELETE CASCADE;


--
-- Name: subtopics_topic_links subtopics_topic_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics_topic_links
    ADD CONSTRAINT subtopics_topic_links_inv_fk FOREIGN KEY (topic_id) REFERENCES public.topics(id) ON DELETE CASCADE;


--
-- Name: subtopics subtopics_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopics
    ADD CONSTRAINT subtopics_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: topics_chapter_links topics_chapter_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics_chapter_links
    ADD CONSTRAINT topics_chapter_links_fk FOREIGN KEY (topic_id) REFERENCES public.topics(id) ON DELETE CASCADE;


--
-- Name: topics_chapter_links topics_chapter_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics_chapter_links
    ADD CONSTRAINT topics_chapter_links_inv_fk FOREIGN KEY (chapter_id) REFERENCES public.chapters(id) ON DELETE CASCADE;


--
-- Name: topics topics_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: topics topics_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: TABLE admin_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_permissions TO anon;
GRANT ALL ON TABLE public.admin_permissions TO authenticated;
GRANT ALL ON TABLE public.admin_permissions TO service_role;


--
-- Name: SEQUENCE admin_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_permissions_id_seq TO service_role;


--
-- Name: TABLE admin_permissions_role_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_permissions_role_links TO anon;
GRANT ALL ON TABLE public.admin_permissions_role_links TO authenticated;
GRANT ALL ON TABLE public.admin_permissions_role_links TO service_role;


--
-- Name: SEQUENCE admin_permissions_role_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_permissions_role_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_permissions_role_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_permissions_role_links_id_seq TO service_role;


--
-- Name: TABLE admin_roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_roles TO anon;
GRANT ALL ON TABLE public.admin_roles TO authenticated;
GRANT ALL ON TABLE public.admin_roles TO service_role;


--
-- Name: SEQUENCE admin_roles_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_roles_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_roles_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_roles_id_seq TO service_role;


--
-- Name: TABLE admin_users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_users TO anon;
GRANT ALL ON TABLE public.admin_users TO authenticated;
GRANT ALL ON TABLE public.admin_users TO service_role;


--
-- Name: SEQUENCE admin_users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_users_id_seq TO service_role;


--
-- Name: TABLE admin_users_roles_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_users_roles_links TO anon;
GRANT ALL ON TABLE public.admin_users_roles_links TO authenticated;
GRANT ALL ON TABLE public.admin_users_roles_links TO service_role;


--
-- Name: SEQUENCE admin_users_roles_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_users_roles_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_users_roles_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_users_roles_links_id_seq TO service_role;


--
-- Name: TABLE chapters; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.chapters TO anon;
GRANT ALL ON TABLE public.chapters TO authenticated;
GRANT ALL ON TABLE public.chapters TO service_role;


--
-- Name: SEQUENCE chapters_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.chapters_id_seq TO anon;
GRANT ALL ON SEQUENCE public.chapters_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.chapters_id_seq TO service_role;


--
-- Name: TABLE files; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.files TO anon;
GRANT ALL ON TABLE public.files TO authenticated;
GRANT ALL ON TABLE public.files TO service_role;


--
-- Name: TABLE files_folder_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.files_folder_links TO anon;
GRANT ALL ON TABLE public.files_folder_links TO authenticated;
GRANT ALL ON TABLE public.files_folder_links TO service_role;


--
-- Name: SEQUENCE files_folder_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.files_folder_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.files_folder_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.files_folder_links_id_seq TO service_role;


--
-- Name: SEQUENCE files_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.files_id_seq TO anon;
GRANT ALL ON SEQUENCE public.files_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.files_id_seq TO service_role;


--
-- Name: TABLE files_related_morphs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.files_related_morphs TO anon;
GRANT ALL ON TABLE public.files_related_morphs TO authenticated;
GRANT ALL ON TABLE public.files_related_morphs TO service_role;


--
-- Name: SEQUENCE files_related_morphs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.files_related_morphs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.files_related_morphs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.files_related_morphs_id_seq TO service_role;


--
-- Name: TABLE i18n_locale; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.i18n_locale TO anon;
GRANT ALL ON TABLE public.i18n_locale TO authenticated;
GRANT ALL ON TABLE public.i18n_locale TO service_role;


--
-- Name: SEQUENCE i18n_locale_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.i18n_locale_id_seq TO anon;
GRANT ALL ON SEQUENCE public.i18n_locale_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.i18n_locale_id_seq TO service_role;


--
-- Name: TABLE strapi_api_token_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_api_token_permissions TO anon;
GRANT ALL ON TABLE public.strapi_api_token_permissions TO authenticated;
GRANT ALL ON TABLE public.strapi_api_token_permissions TO service_role;


--
-- Name: SEQUENCE strapi_api_token_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_id_seq TO service_role;


--
-- Name: TABLE strapi_api_token_permissions_token_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_api_token_permissions_token_links TO anon;
GRANT ALL ON TABLE public.strapi_api_token_permissions_token_links TO authenticated;
GRANT ALL ON TABLE public.strapi_api_token_permissions_token_links TO service_role;


--
-- Name: SEQUENCE strapi_api_token_permissions_token_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_token_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_token_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_token_links_id_seq TO service_role;


--
-- Name: TABLE strapi_api_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_api_tokens TO anon;
GRANT ALL ON TABLE public.strapi_api_tokens TO authenticated;
GRANT ALL ON TABLE public.strapi_api_tokens TO service_role;


--
-- Name: SEQUENCE strapi_api_tokens_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_api_tokens_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_api_tokens_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_api_tokens_id_seq TO service_role;


--
-- Name: TABLE strapi_core_store_settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_core_store_settings TO anon;
GRANT ALL ON TABLE public.strapi_core_store_settings TO authenticated;
GRANT ALL ON TABLE public.strapi_core_store_settings TO service_role;


--
-- Name: SEQUENCE strapi_core_store_settings_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_core_store_settings_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_core_store_settings_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_core_store_settings_id_seq TO service_role;


--
-- Name: TABLE strapi_database_schema; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_database_schema TO anon;
GRANT ALL ON TABLE public.strapi_database_schema TO authenticated;
GRANT ALL ON TABLE public.strapi_database_schema TO service_role;


--
-- Name: SEQUENCE strapi_database_schema_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_database_schema_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_database_schema_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_database_schema_id_seq TO service_role;


--
-- Name: TABLE strapi_migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_migrations TO anon;
GRANT ALL ON TABLE public.strapi_migrations TO authenticated;
GRANT ALL ON TABLE public.strapi_migrations TO service_role;


--
-- Name: SEQUENCE strapi_migrations_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_migrations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_migrations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_migrations_id_seq TO service_role;


--
-- Name: TABLE strapi_webhooks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_webhooks TO anon;
GRANT ALL ON TABLE public.strapi_webhooks TO authenticated;
GRANT ALL ON TABLE public.strapi_webhooks TO service_role;


--
-- Name: SEQUENCE strapi_webhooks_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_webhooks_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_webhooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_webhooks_id_seq TO service_role;


--
-- Name: TABLE subtopics; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subtopics TO anon;
GRANT ALL ON TABLE public.subtopics TO authenticated;
GRANT ALL ON TABLE public.subtopics TO service_role;


--
-- Name: SEQUENCE subtopics_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.subtopics_id_seq TO anon;
GRANT ALL ON SEQUENCE public.subtopics_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.subtopics_id_seq TO service_role;


--
-- Name: TABLE subtopics_topic_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subtopics_topic_links TO anon;
GRANT ALL ON TABLE public.subtopics_topic_links TO authenticated;
GRANT ALL ON TABLE public.subtopics_topic_links TO service_role;


--
-- Name: SEQUENCE subtopics_topic_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.subtopics_topic_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.subtopics_topic_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.subtopics_topic_links_id_seq TO service_role;


--
-- Name: TABLE topics; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.topics TO anon;
GRANT ALL ON TABLE public.topics TO authenticated;
GRANT ALL ON TABLE public.topics TO service_role;


--
-- Name: TABLE topics_chapter_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.topics_chapter_links TO anon;
GRANT ALL ON TABLE public.topics_chapter_links TO authenticated;
GRANT ALL ON TABLE public.topics_chapter_links TO service_role;


--
-- Name: SEQUENCE topics_chapter_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.topics_chapter_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.topics_chapter_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.topics_chapter_links_id_seq TO service_role;


--
-- Name: SEQUENCE topics_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.topics_id_seq TO anon;
GRANT ALL ON SEQUENCE public.topics_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.topics_id_seq TO service_role;


--
-- Name: TABLE up_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_permissions TO anon;
GRANT ALL ON TABLE public.up_permissions TO authenticated;
GRANT ALL ON TABLE public.up_permissions TO service_role;


--
-- Name: SEQUENCE up_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_permissions_id_seq TO service_role;


--
-- Name: TABLE up_permissions_role_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_permissions_role_links TO anon;
GRANT ALL ON TABLE public.up_permissions_role_links TO authenticated;
GRANT ALL ON TABLE public.up_permissions_role_links TO service_role;


--
-- Name: SEQUENCE up_permissions_role_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_permissions_role_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_permissions_role_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_permissions_role_links_id_seq TO service_role;


--
-- Name: TABLE up_roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_roles TO anon;
GRANT ALL ON TABLE public.up_roles TO authenticated;
GRANT ALL ON TABLE public.up_roles TO service_role;


--
-- Name: SEQUENCE up_roles_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_roles_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_roles_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_roles_id_seq TO service_role;


--
-- Name: TABLE up_users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_users TO anon;
GRANT ALL ON TABLE public.up_users TO authenticated;
GRANT ALL ON TABLE public.up_users TO service_role;


--
-- Name: SEQUENCE up_users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_users_id_seq TO service_role;


--
-- Name: TABLE up_users_role_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_users_role_links TO anon;
GRANT ALL ON TABLE public.up_users_role_links TO authenticated;
GRANT ALL ON TABLE public.up_users_role_links TO service_role;


--
-- Name: SEQUENCE up_users_role_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_users_role_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_users_role_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_users_role_links_id_seq TO service_role;


--
-- Name: TABLE upload_folders; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.upload_folders TO anon;
GRANT ALL ON TABLE public.upload_folders TO authenticated;
GRANT ALL ON TABLE public.upload_folders TO service_role;


--
-- Name: SEQUENCE upload_folders_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.upload_folders_id_seq TO anon;
GRANT ALL ON SEQUENCE public.upload_folders_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.upload_folders_id_seq TO service_role;


--
-- Name: TABLE upload_folders_parent_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.upload_folders_parent_links TO anon;
GRANT ALL ON TABLE public.upload_folders_parent_links TO authenticated;
GRANT ALL ON TABLE public.upload_folders_parent_links TO service_role;


--
-- Name: SEQUENCE upload_folders_parent_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.upload_folders_parent_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.upload_folders_parent_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.upload_folders_parent_links_id_seq TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- PostgreSQL database dump complete
--

