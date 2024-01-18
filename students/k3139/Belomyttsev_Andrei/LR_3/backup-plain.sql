--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Homebrew)
-- Dumped by pg_dump version 16.1

-- Started on 2023-12-27 15:41:50 MSK

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
-- TOC entry 3768 (class 1262 OID 26927)
-- Name: razvit; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE razvit WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE razvit OWNER TO postgres;

\connect razvit

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: andrey
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO andrey;

--
-- TOC entry 6 (class 2615 OID 29654)
-- Name: razvit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA razvit;


ALTER SCHEMA razvit OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 29811)
-- Name: album; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.album (
    album_id integer NOT NULL,
    album_name character varying(50),
    fk_author_id integer NOT NULL,
    fk_genre_id integer,
    description text
);


ALTER TABLE razvit.album OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 29810)
-- Name: album_album_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.album_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.album_album_id_seq OWNER TO postgres;

--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 232
-- Name: album_album_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.album_album_id_seq OWNED BY razvit.album.album_id;


--
-- TOC entry 225 (class 1259 OID 29756)
-- Name: article; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.article (
    article_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    title text NOT NULL,
    create_date date NOT NULL,
    approved boolean DEFAULT false,
    text text NOT NULL
);


ALTER TABLE razvit.article OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 29755)
-- Name: article_article_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.article_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.article_article_id_seq OWNER TO postgres;

--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 224
-- Name: article_article_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.article_article_id_seq OWNED BY razvit.article.article_id;


--
-- TOC entry 231 (class 1259 OID 29797)
-- Name: author; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.author (
    author_id integer NOT NULL,
    author_name character varying(100),
    fk_genre_id integer,
    description text
);


ALTER TABLE razvit.author OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 29796)
-- Name: author_author_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.author_author_id_seq OWNER TO postgres;

--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 230
-- Name: author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.author_author_id_seq OWNED BY razvit.author.author_id;


--
-- TOC entry 215 (class 1259 OID 29681)
-- Name: band; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.band (
    band_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    apikey character(20),
    model character varying(10),
    version character varying(10),
    last_time time without time zone
);


ALTER TABLE razvit.band OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 29680)
-- Name: band_band_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.band_band_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.band_band_id_seq OWNER TO postgres;

--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 214
-- Name: band_band_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.band_band_id_seq OWNED BY razvit.band.band_id;


--
-- TOC entry 236 (class 1259 OID 29860)
-- Name: channel; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.channel (
    channel_id character(24) NOT NULL,
    url character(56),
    title character varying(100),
    views bigint,
    subs integer,
    videos integer,
    lang character(2),
    category character varying(50),
    theme character varying(50),
    avatar_default text,
    avatar_medium text,
    avatar_high text,
    fk_user_id integer NOT NULL,
    approved boolean DEFAULT false,
    CONSTRAINT channel_subs_check CHECK ((subs >= 0)),
    CONSTRAINT channel_videos_check CHECK ((videos >= 0)),
    CONSTRAINT channel_views_check CHECK ((views >= 0))
);


ALTER TABLE razvit.channel OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 29771)
-- Name: comment; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.comment (
    comment_id integer NOT NULL,
    fk_article_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    create_date date NOT NULL,
    text text NOT NULL
);


ALTER TABLE razvit.comment OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 29770)
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.comment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.comment_comment_id_seq OWNER TO postgres;

--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 226
-- Name: comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.comment_comment_id_seq OWNED BY razvit.comment.comment_id;


--
-- TOC entry 221 (class 1259 OID 29726)
-- Name: extension; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.extension (
    extension_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    channels text[],
    words text[],
    activeurl text[],
    videourl text[],
    audiourl text[],
    blackurl text[]
);


ALTER TABLE razvit.extension OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 29725)
-- Name: extension_extension_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.extension_extension_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.extension_extension_id_seq OWNER TO postgres;

--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 220
-- Name: extension_extension_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.extension_extension_id_seq OWNED BY razvit.extension.extension_id;


--
-- TOC entry 229 (class 1259 OID 29790)
-- Name: genre; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.genre (
    genre_id integer NOT NULL,
    genre_name character varying(20)
);


ALTER TABLE razvit.genre OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 29789)
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.genre_genre_id_seq OWNER TO postgres;

--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 228
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.genre_genre_id_seq OWNED BY razvit.genre.genre_id;


--
-- TOC entry 217 (class 1259 OID 29695)
-- Name: mode; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.mode (
    mode_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    name character varying(20) NOT NULL,
    value integer,
    oldvalue integer
);


ALTER TABLE razvit.mode OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 29694)
-- Name: mode_mode_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.mode_mode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.mode_mode_id_seq OWNER TO postgres;

--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 216
-- Name: mode_mode_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.mode_mode_id_seq OWNED BY razvit.mode.mode_id;


--
-- TOC entry 223 (class 1259 OID 29742)
-- Name: order; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit."order" (
    order_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    phone_number character varying(20),
    address text,
    postcode character varying(10) NOT NULL,
    delivered boolean,
    telegram character varying(50)
);


ALTER TABLE razvit."order" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 29741)
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.order_order_id_seq OWNER TO postgres;

--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 222
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.order_order_id_seq OWNED BY razvit."order".order_id;


--
-- TOC entry 211 (class 1259 OID 29656)
-- Name: role; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.role (
    role_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE razvit.role OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 29655)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.role_role_id_seq OWNER TO postgres;

--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 210
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.role_role_id_seq OWNED BY razvit.role.role_id;


--
-- TOC entry 219 (class 1259 OID 29707)
-- Name: schedule; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.schedule (
    schedule_id integer NOT NULL,
    fk_band_id integer NOT NULL,
    fk_mode_id integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    weekdays boolean[] NOT NULL
);


ALTER TABLE razvit.schedule OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 29706)
-- Name: schedule_schedule_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.schedule_schedule_id_seq OWNER TO postgres;

--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 218
-- Name: schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.schedule_schedule_id_seq OWNED BY razvit.schedule.schedule_id;


--
-- TOC entry 235 (class 1259 OID 29830)
-- Name: song; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.song (
    song_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    create_date date NOT NULL,
    approved boolean DEFAULT false,
    fk_author_id integer NOT NULL,
    song_name character varying(100) NOT NULL,
    fk_album_id integer,
    fk_genre_id integer,
    lang character(2),
    year smallint,
    youtube_link character varying(100),
    description text,
    lyrics text,
    CONSTRAINT song_year_check CHECK (((year >= 1000) AND (year <= 2100)))
);


ALTER TABLE razvit.song OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 29829)
-- Name: song_song_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.song_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.song_song_id_seq OWNER TO postgres;

--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 234
-- Name: song_song_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.song_song_id_seq OWNED BY razvit.song.song_id;


--
-- TOC entry 213 (class 1259 OID 29663)
-- Name: username; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.username (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    reg_date date NOT NULL,
    about text,
    fk_role_id integer DEFAULT 3 NOT NULL,
    CONSTRAINT username_email_check CHECK (((email)::text ~~ '%_@_%.__%'::text)),
    CONSTRAINT username_password_check CHECK ((length((password)::text) >= 8)),
    CONSTRAINT username_username_check CHECK ((length((username)::text) >= 4))
);


ALTER TABLE razvit.username OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 29662)
-- Name: username_user_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.username_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.username_user_id_seq OWNER TO postgres;

--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 212
-- Name: username_user_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.username_user_id_seq OWNED BY razvit.username.user_id;


--
-- TOC entry 238 (class 1259 OID 29877)
-- Name: website; Type: TABLE; Schema: razvit; Owner: postgres
--

CREATE TABLE razvit.website (
    website_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    approved boolean DEFAULT false,
    url character varying(100) NOT NULL,
    description text
);


ALTER TABLE razvit.website OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 29876)
-- Name: website_website_id_seq; Type: SEQUENCE; Schema: razvit; Owner: postgres
--

CREATE SEQUENCE razvit.website_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE razvit.website_website_id_seq OWNER TO postgres;

--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 237
-- Name: website_website_id_seq; Type: SEQUENCE OWNED BY; Schema: razvit; Owner: postgres
--

ALTER SEQUENCE razvit.website_website_id_seq OWNED BY razvit.website.website_id;


--
-- TOC entry 3527 (class 2604 OID 29814)
-- Name: album album_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.album ALTER COLUMN album_id SET DEFAULT nextval('razvit.album_album_id_seq'::regclass);


--
-- TOC entry 3522 (class 2604 OID 29759)
-- Name: article article_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.article ALTER COLUMN article_id SET DEFAULT nextval('razvit.article_article_id_seq'::regclass);


--
-- TOC entry 3526 (class 2604 OID 29800)
-- Name: author author_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.author ALTER COLUMN author_id SET DEFAULT nextval('razvit.author_author_id_seq'::regclass);


--
-- TOC entry 3517 (class 2604 OID 29684)
-- Name: band band_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.band ALTER COLUMN band_id SET DEFAULT nextval('razvit.band_band_id_seq'::regclass);


--
-- TOC entry 3524 (class 2604 OID 29774)
-- Name: comment comment_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.comment ALTER COLUMN comment_id SET DEFAULT nextval('razvit.comment_comment_id_seq'::regclass);


--
-- TOC entry 3520 (class 2604 OID 29729)
-- Name: extension extension_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.extension ALTER COLUMN extension_id SET DEFAULT nextval('razvit.extension_extension_id_seq'::regclass);


--
-- TOC entry 3525 (class 2604 OID 29793)
-- Name: genre genre_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.genre ALTER COLUMN genre_id SET DEFAULT nextval('razvit.genre_genre_id_seq'::regclass);


--
-- TOC entry 3518 (class 2604 OID 29698)
-- Name: mode mode_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.mode ALTER COLUMN mode_id SET DEFAULT nextval('razvit.mode_mode_id_seq'::regclass);


--
-- TOC entry 3521 (class 2604 OID 29745)
-- Name: order order_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit."order" ALTER COLUMN order_id SET DEFAULT nextval('razvit.order_order_id_seq'::regclass);


--
-- TOC entry 3514 (class 2604 OID 29659)
-- Name: role role_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.role ALTER COLUMN role_id SET DEFAULT nextval('razvit.role_role_id_seq'::regclass);


--
-- TOC entry 3519 (class 2604 OID 29710)
-- Name: schedule schedule_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.schedule ALTER COLUMN schedule_id SET DEFAULT nextval('razvit.schedule_schedule_id_seq'::regclass);


--
-- TOC entry 3528 (class 2604 OID 29833)
-- Name: song song_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.song ALTER COLUMN song_id SET DEFAULT nextval('razvit.song_song_id_seq'::regclass);


--
-- TOC entry 3515 (class 2604 OID 29666)
-- Name: username user_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.username ALTER COLUMN user_id SET DEFAULT nextval('razvit.username_user_id_seq'::regclass);


--
-- TOC entry 3531 (class 2604 OID 29880)
-- Name: website website_id; Type: DEFAULT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.website ALTER COLUMN website_id SET DEFAULT nextval('razvit.website_website_id_seq'::regclass);


--
-- TOC entry 3757 (class 0 OID 29811)
-- Dependencies: 233
-- Data for Name: album; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.album VALUES (1, 'Наследие', 3, 1, 'https://www.youtube.com/watch?v=prxVL-0TOQA');
INSERT INTO razvit.album VALUES (2, 'The Art of War', 1, 1, NULL);
INSERT INTO razvit.album VALUES (3, 'Primo Victoria', 1, 1, NULL);


--
-- TOC entry 3749 (class 0 OID 29756)
-- Dependencies: 225
-- Data for Name: article; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.article VALUES (1, 1, 'Прогресс', '2023-10-01', true, 'Прогресс (лат. progressus — движение вперёд, успех) — направление развития от низшего к высшему, поступательное движение вперед, повышение уровня организации, усложнение способа организации, характеризуется увеличением внутренних связей. Противоположность — регресс.');
INSERT INTO razvit.article VALUES (2, 3, 'Трансгуманизм', '2023-10-02', true, 'Трансгуманизм (от лат. trans — предлог, обозначающий переход, изменение и homo — «человек») — общественный строй, политическая позиция и философская концепция, продвигающие использование достижений науки и технологии для улучшения умственных и физических возможностей человека с целью устранения тех аспектов человеческого существования, которые трансгуманисты считают нежелательными — страданий, болезней, старения и смерти[1]. Трансгуманисты изучают возможности и последствия применения таких технологий, опасности и преимущества их использования, рассматривая в том числе идею конвергенции биологических, информационных, познавательных и нанотехнологий.');
INSERT INTO razvit.article VALUES (3, 2, 'Социализм', '2023-10-05', true, 'Социализм (от лат. socialis — «общественный») — политическая, социальная и экономическая философия и идеология, направленная на реализацию социального равенства и социальной справедливости, достижение которых предполагается в том числе через общественную собственность на средства производства. В более широком смысле социализм можно определить как политическую тенденцию, основным принципом которой является стремление к миру, основанному на гармоничной социальной организации и борьбе с несправедливостью. В экономическом плане социализм характеризуется общественным и/или государственным контролем над экономикой — как над средствами производства, так и над процессом распределения ресурсов и тенденцией к плановой экономике. В зависимости от контекста слово «социализм» может определять идеологию, экономику, политический режим или социальную организацию.');
INSERT INTO razvit.article VALUES (4, 4, 'Инфокоммунизм', '2023-10-09', true, 'Раздавайте торренты!');
INSERT INTO razvit.article VALUES (5, 5, 'Анти-аболиционизм', '2023-10-11', true, 'Аболиционизм (гедонистический трансгуманизм) — направление в биоэтике и трансгуманизме, одобряющее использование биотехнологий для максимизации счастья и прекращения страданий. Слово «аболиционизм» происходит от лат. abolitio, «отмена», что в данном контексте означает «отмену страданий».');
INSERT INTO razvit.article VALUES (6, 2, 'Фашизм', '2023-10-12', true, 'Фашизм - это открытая террористическая диктатура наиболее реакционных, наиболее шовинистических, наиболее империалистических кругов финансового капитала.');
INSERT INTO razvit.article VALUES (7, 1, 'Топ образовательных YouTube каналов', '2023-12-27', true, 'Здесь представлен топ образовательных и научно-популярных YouTube каналов.

TEDx Talks: 39800000 подписчиков, 7637599221 просмотров
TED: 23700000 подписчиков, 2632146365 просмотров
Kurzgesagt – In a Nutshell: 21300000 подписчиков, 2494890490 просмотров
Vsauce: 20900000 подписчиков, 3621226097 просмотров
TED-Ed: 19300000 подписчиков, 3802909425 просмотров
Veritasium: 14300000 подписчиков, 2278009844 просмотров
freeCodeCamp.org: 8580000 подписчиков, 618877153 просмотров
OverSimplified: 7940000 подписчиков, 1058835685 просмотров
RealLifeLore: 7190000 подписчиков, 1547185372 просмотров
ТОПЛЕС: 6560000 подписчиков, 811821559 просмотров
minutephysics: 5700000 подписчиков, 534431024 просмотров
Utopia Show: 5680000 подписчиков, 776303223 просмотров
3Blue1Brown: 5550000 подписчиков, 367187196 просмотров
Vsauce2: 4540000 подписчиков, 783437919 просмотров
edureka!: 3880000 подписчиков, 400424459 просмотров
Programming with Mosh: 3610000 подписчиков, 182066169 просмотров
Physics Girl: 2890000 подписчиков, 298517395 просмотров
Fireship: 2500000 подписчиков, 325855545 просмотров
GalileoRU: 2250000 подписчиков, 850405399 просмотров
Traversy Media: 2160000 подписчиков, 205542113 просмотров
AlexGyver: 2150000 подписчиков, 317486205 просмотров
Thoisoi: 2000000 подписчиков, 324057707 просмотров
GEO: 1970000 подписчиков, 217081566 просмотров
Vert Dider: 1890000 подписчиков, 279245188 просмотров
PolyMatter: 1860000 подписчиков, 211474323 просмотров
Хауди Хо™ - Просто о мире IT!: 1850000 подписчиков, 198828871 просмотров
Физика от Побединского: 1600000 подписчиков, 141105899 просмотров
Arzamas: 1580000 подписчиков, 105962181 просмотров
MyGap: 1530000 подписчиков, 130681983 просмотров
Artur Sharifov: 1490000 подписчиков, 110353141 просмотров
Web Dev Simplified: 1440000 подписчиков, 123996050 просмотров
Tech With Tim: 1370000 подписчиков, 127798483 просмотров
Bro Code: 1360000 подписчиков, 65429193 просмотров
ПостНаука: 1320000 подписчиков, 158323572 просмотров
Envato Tuts+: 1310000 подписчиков, 116916081 просмотров
Derek Banas: 1270000 подписчиков, 119386454 просмотров
SciOne: 1270000 подписчиков, 112648760 просмотров
Павел ВИКТОР: 1120000 подписчиков, 84214661 просмотров
ALEX LAB: 922000 подписчиков, 42643319 просмотров
Космос Просто: 916000 подписчиков, 138646361 просмотров
Geo History: 915000 подписчиков, 128438774 просмотров
Химия – Просто: 900000 подписчиков, 101958806 просмотров
developedbyed: 896000 подписчиков, 51343172 просмотров
Academind: 891000 подписчиков, 73633924 просмотров
Гоша Дударь: 867000 подписчиков, 133524205 просмотров
Redroom: 846000 подписчиков, 131556574 просмотров
Мудреныч: 838000 подписчиков, 138221474 просмотров
Kevin Powell: 826000 подписчиков, 72302070 просмотров
LOONY: 807000 подписчиков, 76988971 просмотров
Гео-История: 807000 подписчиков, 117622407 просмотров
LearnCode.academy: 767000 подписчиков, 49632440 просмотров
Hi Dev! – Электроника: 733000 подписчиков, 44349078 просмотров
Инглекс: 716000 подписчиков, 84732664 просмотров
Инглиш Шоу: 641000 подписчиков, 33162691 просмотров
Easy History: 598000 подписчиков, 89988716 просмотров
Alex Burkan: 595000 подписчиков, 21370275 просмотров
Caleb Curry: 581000 подписчиков, 46384277 просмотров
Математик МГУ: 566000 подписчиков, 59271214 просмотров
Alpha Centauri: 561000 подписчиков, 145140272 просмотров
VideoSmile: 529000 подписчиков, 52007580 просмотров
Доктор Грег: 527000 подписчиков, 59084263 просмотров
Flutter: 523000 подписчиков, 72602081 просмотров
Цифровая история: 522000 подписчиков, 107329706 просмотров
GetAClass - Физика в опытах и экспериментах: 506000 подписчиков, 58251935 просмотров
АНТРОПОГЕНЕЗ.РУ: 497000 подписчиков, 70281276 просмотров
Valery Volkov: 494000 подписчиков, 156243829 просмотров
KhanAcademyRussian: 478000 подписчиков, 45650997 просмотров
АРХИВАРИУС: 463000 подписчиков, 37357978 просмотров
Редакция.Наука: 417000 подписчиков, 39143816 просмотров
VoicePower: 415000 подписчиков, 54273874 просмотров
Береста: 393000 подписчиков, 84148333 просмотров
loftblog: 387000 подписчиков, 37285755 просмотров
Заметки Ардуинщика: 375000 подписчиков, 21894368 просмотров
Борис Трушин: 368000 подписчиков, 49596733 просмотров
DevTips: 356000 подписчиков, 17449961 просмотров
#SimpleCode: 354000 подписчиков, 53769156 просмотров
Codecourse: 342000 подписчиков, 35847806 просмотров
LearnWebCode: 336000 подписчиков, 26225132 просмотров
Видеокурсы DA VINCI: 332000 подписчиков, 37957304 просмотров
Beyond Fireship: 320000 подписчиков, 8949953 просмотров
Мудреныч переводит: 307000 подписчиков, 37833297 просмотров
Владилен Минин: 300000 подписчиков, 38859740 просмотров
Sergej Kuts: 289000 подписчиков, 17636821 просмотров
Фоксфорд: 279000 подписчиков, 20285598 просмотров
NeuralNine: 277000 подписчиков, 19865829 просмотров
Неземной подкаст Владимира Сурдина: 264000 подписчиков, 24916915 просмотров
Упоротый Палеонтолог: 246000 подписчиков, 36829035 просмотров
Школково ЕГЭ, ОГЭ, олимпиады: 241000 подписчиков, 32878030 просмотров
Школа itProger / Программирование: 240000 подписчиков, 23999176 просмотров
Макар Светлый: 229000 подписчиков, 28960256 просмотров
Wild Mathing: 213000 подписчиков, 20930592 просмотров
PythonToday: 213000 подписчиков, 11027461 просмотров
Alek OS: 212000 подписчиков, 9584815 просмотров
Atlantis: 207000 подписчиков, 8814137 просмотров
Лекториум: 184000 подписчиков, 19582503 просмотров
Merion Academy: 169000 подписчиков, 8530054 просмотров
Александр Панчин: 164000 подписчиков, 12607072 просмотров
bezbotvy: 158000 подписчиков, 26673226 просмотров
Улица Шкловского: 151000 подписчиков, 14902038 просмотров
Astro Channel: 150000 подписчиков, 18258206 просмотров
Glo Academy: 147000 подписчиков, 12677436 просмотров
Хамибин 2.0: 141000 подписчиков, 16494873 просмотров
egoroff_channel: 133000 подписчиков, 14717227 просмотров
selfedu: 131000 подписчиков, 18100294 просмотров
Space Room: 124000 подписчиков, 7106480 просмотров
webDev: 110000 подписчиков, 9741899 просмотров
Анна Блок: 95500 подписчиков, 9322802 просмотров');


--
-- TOC entry 3755 (class 0 OID 29797)
-- Dependencies: 231
-- Data for Name: author; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.author VALUES (1, 'Sabaton', 1, 'Шведская хэви-пауэр-метал группа, основанная в декабре 1999 года. Основной темой для песен являются войны. https://www.youtube.com/@Sabaton');
INSERT INTO razvit.author VALUES (2, 'Научно-технический рэп', 2, 'Рэп на тему науки. https://vk.com/nii_rap');
INSERT INTO razvit.author VALUES (3, 'Radio Tapok', 1, 'Рок на тему военной истории, каверы Sabaton. https://www.youtube.com/@RADIOTAPOK');
INSERT INTO razvit.author VALUES (4, 'Эля Смит & Чёрное Олово', 2, 'https://www.youtube.com/@elya_smith');
INSERT INTO razvit.author VALUES (5, 'District 23', 2, 'https://www.youtube.com/@DISTRICT23MUSIC');


--
-- TOC entry 3739 (class 0 OID 29681)
-- Dependencies: 215
-- Data for Name: band; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.band VALUES (1, 1, 'WzT1PzcRM26PXHu5gqQR', '2.0', '0.3', NULL);
INSERT INTO razvit.band VALUES (2, 2, 'BGWyohEc0tnxE0tKayM8', '1.0', '0.1', NULL);
INSERT INTO razvit.band VALUES (3, 3, 'HGsV0ueA8ETi2GaAgfNN', '2.1', '0.2', NULL);
INSERT INTO razvit.band VALUES (4, 4, 'X26rA3IzuhnrL02Iz6PB', '2.0', '0.3', NULL);
INSERT INTO razvit.band VALUES (5, 5, 'lCb0OIyAN9x35t8AdM9j', '2.2', '0.2', NULL);


--
-- TOC entry 3760 (class 0 OID 29860)
-- Dependencies: 236
-- Data for Name: channel; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.channel VALUES ('UCHnyfMqiRRG1u-2MsSQLbXA', 'https://www.youtube.com/channel/UCHnyfMqiRRG1u-2MsSQLbXA', 'Veritasium', 2278009844, 14300000, 378, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKZCB8Du5V9Tx6DvgFSwCnUWv8wXya2n97oRc7aF_w=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZCB8Du5V9Tx6DvgFSwCnUWv8wXya2n97oRc7aF_w=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZCB8Du5V9Tx6DvgFSwCnUWv8wXya2n97oRc7aF_w=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCP5tjEmvPItGyLhmjdwP7Ww', 'https://www.youtube.com/channel/UCP5tjEmvPItGyLhmjdwP7Ww', 'RealLifeLore', 1547185372, 7190000, 335, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKa4Ei0w6zq6FXKCD3tBEdPvTd70Cmo8ZoP5G02EHQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKa4Ei0w6zq6FXKCD3tBEdPvTd70Cmo8ZoP5G02EHQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKa4Ei0w6zq6FXKCD3tBEdPvTd70Cmo8ZoP5G02EHQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCrWWcscvUWaqdQJLQQGO6BA', 'https://www.youtube.com/channel/UCrWWcscvUWaqdQJLQQGO6BA', 'PythonToday', 11027461, 213000, 181, 'ru', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKYzaVw9Bzqj7BeQc8IfjwA_1Wfep500blGS0a0h=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYzaVw9Bzqj7BeQc8IfjwA_1Wfep500blGS0a0h=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYzaVw9Bzqj7BeQc8IfjwA_1Wfep500blGS0a0h=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCgNg3vwj3xt7QOrcIDaHdFg', 'https://www.youtube.com/channel/UCgNg3vwj3xt7QOrcIDaHdFg', 'PolyMatter', 211474323, 1860000, 147, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKZDOPaLQEA8tOdzVSK2WspB4mWyJhgSksTwQrtqFQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZDOPaLQEA8tOdzVSK2WspB4mWyJhgSksTwQrtqFQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZDOPaLQEA8tOdzVSK2WspB4mWyJhgSksTwQrtqFQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCNIuvl7V8zACPpTmmNIqP2A', 'https://www.youtube.com/channel/UCNIuvl7V8zACPpTmmNIqP2A', 'OverSimplified', 1058835685, 7940000, 29, 'en', 'popsci', 'history', 'https://yt3.ggpht.com/ytc/APkrFKZi_w7Kkipuo0T_Ofz3PCNRxehaToae7Ejdus1s5Q=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZi_w7Kkipuo0T_Ofz3PCNRxehaToae7Ejdus1s5Q=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZi_w7Kkipuo0T_Ofz3PCNRxehaToae7Ejdus1s5Q=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCCROBQj3rdGNc-E_aMpbV_A', 'https://www.youtube.com/channel/UCCROBQj3rdGNc-E_aMpbV_A', 'MyGap', 130681983, 1530000, 244, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKaZtmXEYlpTcMjTsfPQiVs80YAlkjMED85YTysqcw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaZtmXEYlpTcMjTsfPQiVs80YAlkjMED85YTysqcw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaZtmXEYlpTcMjTsfPQiVs80YAlkjMED85YTysqcw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCSTYGpIpMIiQPspjLplB6Ow', 'https://www.youtube.com/channel/UCSTYGpIpMIiQPspjLplB6Ow', 'Merion Academy', 8530054, 169000, 128, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/tFFW21uMfFNTJtgBIbIssHtfhLtY1KfRZUmMWFEPCFqKsPynyzg2S1j6TzR8M1pa-jjWUyg8zw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/tFFW21uMfFNTJtgBIbIssHtfhLtY1KfRZUmMWFEPCFqKsPynyzg2S1j6TzR8M1pa-jjWUyg8zw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/tFFW21uMfFNTJtgBIbIssHtfhLtY1KfRZUmMWFEPCFqKsPynyzg2S1j6TzR8M1pa-jjWUyg8zw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCY6A_tZAikULMr46WlfntRw', 'https://www.youtube.com/channel/UCY6A_tZAikULMr46WlfntRw', 'Hi Dev! – Электроника', 44349078, 733000, 114, 'ru', 'popsci', 'electronics', 'https://yt3.ggpht.com/ytc/APkrFKYAG0LFKHbILKeyO8vweU7adKhcFVwTyEHgKXO0-A=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYAG0LFKHbILKeyO8vweU7adKhcFVwTyEHgKXO0-A=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYAG0LFKHbILKeyO8vweU7adKhcFVwTyEHgKXO0-A=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC2Cl2g2xFTZoAEldxYVzQFg', 'https://www.youtube.com/channel/UC2Cl2g2xFTZoAEldxYVzQFg', 'Geo History', 128438774, 915000, 89, 'en', 'popsci', 'history', 'https://yt3.ggpht.com/ytc/APkrFKagYIEvjEEDx7UhXIu8XrgU7XWoMnT3Z598FhM-=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKagYIEvjEEDx7UhXIu8XrgU7XWoMnT3Z598FhM-=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKagYIEvjEEDx7UhXIu8XrgU7XWoMnT3Z598FhM-=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCLfB9ZPH1EtxdNY3005GkAw', 'https://www.youtube.com/channel/UCLfB9ZPH1EtxdNY3005GkAw', 'Easy History', 89988716, 598000, 66, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/ytc/APkrFKbOlSV5tcUGuQ4dsAe32rUi3PtJX-kYjjp3eV7l=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbOlSV5tcUGuQ4dsAe32rUi3PtJX-kYjjp3eV7l=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbOlSV5tcUGuQ4dsAe32rUi3PtJX-kYjjp3eV7l=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCgtAOyEQdAyjvm9ATCi_Aig', 'https://www.youtube.com/channel/UCgtAOyEQdAyjvm9ATCi_Aig', 'AlexGyver', 317486205, 2150000, 381, 'ru', 'popsci', 'electronics', 'https://yt3.ggpht.com/AGRYS8OHdqz_bSdKqwuL4yT9LOi5Plv-muzmfL85U4wh7DtdC8meNP7KLU8Dg52LYZYGEqjC=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/AGRYS8OHdqz_bSdKqwuL4yT9LOi5Plv-muzmfL85U4wh7DtdC8meNP7KLU8Dg52LYZYGEqjC=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/AGRYS8OHdqz_bSdKqwuL4yT9LOi5Plv-muzmfL85U4wh7DtdC8meNP7KLU8Dg52LYZYGEqjC=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCGLsHbMw8WCOB6tu0sKyG9w', 'https://www.youtube.com/channel/UCGLsHbMw8WCOB6tu0sKyG9w', 'Мудреныч', 138221474, 838000, 121, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/DK-e6M8cOVEQOSC7lx6Ywj1gPLJH5zEUN1j0thTLMt3k-q4QPrUaw6BYAY7McHLo2hrX51s7jo4=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/DK-e6M8cOVEQOSC7lx6Ywj1gPLJH5zEUN1j0thTLMt3k-q4QPrUaw6BYAY7McHLo2hrX51s7jo4=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/DK-e6M8cOVEQOSC7lx6Ywj1gPLJH5zEUN1j0thTLMt3k-q4QPrUaw6BYAY7McHLo2hrX51s7jo4=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC7Rv1lW8L2RYKF-Q-GZXmUQ', 'https://www.youtube.com/channel/UC7Rv1lW8L2RYKF-Q-GZXmUQ', 'Мудреныч переводит', 37833297, 307000, 43, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/ytc/APkrFKbX5DbO5R5ZiGH5no0Oz4I-RnDK8BYs8Trs1F2pUw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbX5DbO5R5ZiGH5no0Oz4I-RnDK8BYs8Trs1F2pUw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbX5DbO5R5ZiGH5no0Oz4I-RnDK8BYs8Trs1F2pUw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC6DxE5GWRxZKwNdcOzV5hWw', 'https://www.youtube.com/channel/UC6DxE5GWRxZKwNdcOzV5hWw', 'Доктор Грег', 59084263, 527000, 110, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKaYj300MCbXlzxfsIxDcewFEzcaH0dBrFhdh5Y5CQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaYj300MCbXlzxfsIxDcewFEzcaH0dBrFhdh5Y5CQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaYj300MCbXlzxfsIxDcewFEzcaH0dBrFhdh5Y5CQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCYO_jab_esuFRV4b17AJtAw', 'https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw', '3Blue1Brown', 367187196, 5550000, 135, 'en', 'popsci', 'math', 'https://yt3.ggpht.com/ytc/APkrFKa78JclPNY9Oh8Fy2b4v7PMDOKFcZcbKHum1tkd8A=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKa78JclPNY9Oh8Fy2b4v7PMDOKFcZcbKHum1tkd8A=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKa78JclPNY9Oh8Fy2b4v7PMDOKFcZcbKHum1tkd8A=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCMcC_43zGHttf9bY-xJOTwA', 'https://www.youtube.com/channel/UCMcC_43zGHttf9bY-xJOTwA', 'egoroff_channel', 14717227, 133000, 598, 'ru', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKZSA4EM2_YEDFgv-FI-nXRQaI4wRjeJIbU27sRahw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZSA4EM2_YEDFgv-FI-nXRQaI4wRjeJIbU27sRahw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZSA4EM2_YEDFgv-FI-nXRQaI4wRjeJIbU27sRahw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCtLKO1Cb2GVNrbU7Fi0pM0w', 'https://www.youtube.com/channel/UCtLKO1Cb2GVNrbU7Fi0pM0w', '#SimpleCode', 53769156, 354000, 362, 'ru', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKavInAwCu5Yr7040x_Ai0IcsXCTvcZjAuzHfNZF3A=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKavInAwCu5Yr7040x_Ai0IcsXCTvcZjAuzHfNZF3A=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKavInAwCu5Yr7040x_Ai0IcsXCTvcZjAuzHfNZF3A=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCg8ss4xW9jASrqWGP30jXiw', 'https://www.youtube.com/channel/UCg8ss4xW9jASrqWGP30jXiw', 'Владилен Минин', 38859740, 300000, 270, 'ru', 'edu', 'programming', 'https://yt3.ggpht.com/xJ7g4L_NY84e8Q76ymiuzeeUyXiZFtaYlxLcmTfy_DLwUFrw0vK8-pwZUA5THCJedO262hksXA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/xJ7g4L_NY84e8Q76ymiuzeeUyXiZFtaYlxLcmTfy_DLwUFrw0vK8-pwZUA5THCJedO262hksXA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/xJ7g4L_NY84e8Q76ymiuzeeUyXiZFtaYlxLcmTfy_DLwUFrw0vK8-pwZUA5THCJedO262hksXA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UClJzWfGWuGJL2t-3dYKcHTA', 'https://www.youtube.com/channel/UClJzWfGWuGJL2t-3dYKcHTA', 'selfedu', 18100294, 131000, 993, 'ru', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKbBQbUO4GNidkFrqA7WNxS_vUsiqFFd5VjdxVAp=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbBQbUO4GNidkFrqA7WNxS_vUsiqFFd5VjdxVAp=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbBQbUO4GNidkFrqA7WNxS_vUsiqFFd5VjdxVAp=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC0iVXUmtQ1_BxvgXmlvU3ig', 'https://www.youtube.com/channel/UC0iVXUmtQ1_BxvgXmlvU3ig', 'Фоксфорд', 20285598, 279000, 1365, 'ru', 'edu', 'all', 'https://yt3.ggpht.com/UCbP-6qWB9__DTrLhZUgNBb118JX1iY4dXSkRLQbezeAPc6_GVRrB4XnUu8GnAH8YEwVfb0nnp8=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/UCbP-6qWB9__DTrLhZUgNBb118JX1iY4dXSkRLQbezeAPc6_GVRrB4XnUu8GnAH8YEwVfb0nnp8=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/UCbP-6qWB9__DTrLhZUgNBb118JX1iY4dXSkRLQbezeAPc6_GVRrB4XnUu8GnAH8YEwVfb0nnp8=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UClRaCOmyHg8f96cpZVmWwKQ', 'https://www.youtube.com/channel/UClRaCOmyHg8f96cpZVmWwKQ', 'Видеокурсы DA VINCI', 37957304, 332000, 1453, 'ru', 'edu', 'math', 'https://yt3.ggpht.com/E5WAqFRGsfowX2ctT_ssOzQSlE3B3VKTx7zJzY3uPgI_9jb8Xb0tZBs4anXOXlSraMkCHApD8g=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/E5WAqFRGsfowX2ctT_ssOzQSlE3B3VKTx7zJzY3uPgI_9jb8Xb0tZBs4anXOXlSraMkCHApD8g=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/E5WAqFRGsfowX2ctT_ssOzQSlE3B3VKTx7zJzY3uPgI_9jb8Xb0tZBs4anXOXlSraMkCHApD8g=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCi3lxprPEKGjpmzzN90sceA', 'https://www.youtube.com/channel/UCi3lxprPEKGjpmzzN90sceA', 'Sergej Kuts', 17636821, 289000, 90, 'ru', 'edu', 'math', 'https://yt3.ggpht.com/ytc/APkrFKaMOohnY7CSFYwFylsnHeVAgLcLZbfovmpqRLQJKw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaMOohnY7CSFYwFylsnHeVAgLcLZbfovmpqRLQJKw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaMOohnY7CSFYwFylsnHeVAgLcLZbfovmpqRLQJKw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCSdmht0kbvfnItRMNcr4qZA', 'https://www.youtube.com/channel/UCSdmht0kbvfnItRMNcr4qZA', 'Математик МГУ', 59271214, 566000, 479, 'ru', 'edu', 'math', 'https://yt3.ggpht.com/ytc/APkrFKaooFZZDxBs4P8lThZzpd0m3V85e0Gd0QH1GK4uqw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaooFZZDxBs4P8lThZzpd0m3V85e0Gd0QH1GK4uqw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaooFZZDxBs4P8lThZzpd0m3V85e0Gd0QH1GK4uqw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCsXVk37bltHxD1rDPwtNM8Q', 'https://www.youtube.com/channel/UCsXVk37bltHxD1rDPwtNM8Q', 'Kurzgesagt – In a Nutshell', 2494890490, 21300000, 194, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKaHuotB178A3_ar_1xwrchH_bEo4wjg6A-kXFErPA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaHuotB178A3_ar_1xwrchH_bEo4wjg6A-kXFErPA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaHuotB178A3_ar_1xwrchH_bEo4wjg6A-kXFErPA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCsBjURrPoezykLs9EqgamOA', 'https://www.youtube.com/channel/UCsBjURrPoezykLs9EqgamOA', 'Fireship', 325855545, 2500000, 584, 'en', 'popsci', 'it', 'https://yt3.ggpht.com/ytc/APkrFKb--NH6RwAGHYsD3KfxX-SAgWgIHrjR5E4Jb5SDSQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKb--NH6RwAGHYsD3KfxX-SAgWgIHrjR5E4Jb5SDSQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKb--NH6RwAGHYsD3KfxX-SAgWgIHrjR5E4Jb5SDSQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC2Xd-TjJByJyK2w1zNwY0zQ', 'https://www.youtube.com/channel/UC2Xd-TjJByJyK2w1zNwY0zQ', 'Beyond Fireship', 8949953, 320000, 34, 'en', 'popsci', 'it', 'https://yt3.ggpht.com/3MC9XX7rtxeS55uoOQG2nvJ7zaBd17r8Uh0yk_R3KyKjAK_u4RlHhZcTCkx4yym0guGWdefD5Q=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/3MC9XX7rtxeS55uoOQG2nvJ7zaBd17r8Uh0yk_R3KyKjAK_u4RlHhZcTCkx4yym0guGWdefD5Q=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/3MC9XX7rtxeS55uoOQG2nvJ7zaBd17r8Uh0yk_R3KyKjAK_u4RlHhZcTCkx4yym0guGWdefD5Q=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC8butISFwT-Wl7EV0hUK0BQ', 'https://www.youtube.com/channel/UC8butISFwT-Wl7EV0hUK0BQ', 'freeCodeCamp.org', 618877153, 8580000, 1540, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKaqca-xQcJtp1Pqv-APucCa0nToHYGPVT00YBGOSw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaqca-xQcJtp1Pqv-APucCa0nToHYGPVT00YBGOSw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaqca-xQcJtp1Pqv-APucCa0nToHYGPVT00YBGOSw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCsvvJ2a1qn_mr7IlXJ7bA4g', 'https://www.youtube.com/channel/UCsvvJ2a1qn_mr7IlXJ7bA4g', 'Atlantis', 8814137, 207000, 66, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/G--Wy1Nl76aCMTYzN4ITYT9bbDx4_pih8h8oWQCKkL4JJP0WcrztJ-JEZ7EeirNSv9LDa6XO5A=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/G--Wy1Nl76aCMTYzN4ITYT9bbDx4_pih8h8oWQCKkL4JJP0WcrztJ-JEZ7EeirNSv9LDa6XO5A=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/G--Wy1Nl76aCMTYzN4ITYT9bbDx4_pih8h8oWQCKkL4JJP0WcrztJ-JEZ7EeirNSv9LDa6XO5A=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCn5wduCq2Mus0v85QZn9IaA', 'https://www.youtube.com/channel/UCn5wduCq2Mus0v85QZn9IaA', 'Анна Блок', 9322802, 95500, 324, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/KGByoiWoDomt9iOchf1O_OUlP8J-Ht1Krk6m0H6dD8RGQU__9tTIg0iB0cqqMznFwZPSqhgWag=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/KGByoiWoDomt9iOchf1O_OUlP8J-Ht1Krk6m0H6dD8RGQU__9tTIg0iB0cqqMznFwZPSqhgWag=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/KGByoiWoDomt9iOchf1O_OUlP8J-Ht1Krk6m0H6dD8RGQU__9tTIg0iB0cqqMznFwZPSqhgWag=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCEgthFK2fjRhMXE4kGRatmQ', 'https://www.youtube.com/channel/UCEgthFK2fjRhMXE4kGRatmQ', 'VideoSmile', 52007580, 529000, 718, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/2grgf7qy8qoqWjm_mulmJB-n_r2Dxw5IUtyhLuE4xLXxD8wmspdA3GcYYEnSi1J67mrAZWzh=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/2grgf7qy8qoqWjm_mulmJB-n_r2Dxw5IUtyhLuE4xLXxD8wmspdA3GcYYEnSi1J67mrAZWzh=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/2grgf7qy8qoqWjm_mulmJB-n_r2Dxw5IUtyhLuE4xLXxD8wmspdA3GcYYEnSi1J67mrAZWzh=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCvuY904el7JvBlPbdqbfguw', 'https://www.youtube.com/channel/UCvuY904el7JvBlPbdqbfguw', 'Гоша Дударь', 133524205, 867000, 1216, 'ru', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKaOI9Pe3WgW6Cj4frmPpGO1W2SOlvrjIxCpyQvyaQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaOI9Pe3WgW6Cj4frmPpGO1W2SOlvrjIxCpyQvyaQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaOI9Pe3WgW6Cj4frmPpGO1W2SOlvrjIxCpyQvyaQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCCXF68Da_ndcmvv_9OG75Cw', 'https://www.youtube.com/channel/UCCXF68Da_ndcmvv_9OG75Cw', 'Школа itProger / Программирование', 23999176, 240000, 294, 'ru', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKazU_dSnfPzdL0q45494JYUp7hhC6nVPh3GUVxS=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKazU_dSnfPzdL0q45494JYUp7hhC6nVPh3GUVxS=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKazU_dSnfPzdL0q45494JYUp7hhC6nVPh3GUVxS=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC_AsNtp2et6oLuNrfaXBF1Q', 'https://www.youtube.com/channel/UC_AsNtp2et6oLuNrfaXBF1Q', 'Инглекс', 84732664, 716000, 452, 'ru', 'edu', 'english', 'https://yt3.ggpht.com/9tvFl_DjSSgQ7353GU1VICk0gCHeM-B4l1Js68qOHuqJsaxHdv9UB-ARK-awdSCXE7n9owYaww=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/9tvFl_DjSSgQ7353GU1VICk0gCHeM-B4l1Js68qOHuqJsaxHdv9UB-ARK-awdSCXE7n9owYaww=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/9tvFl_DjSSgQ7353GU1VICk0gCHeM-B4l1Js68qOHuqJsaxHdv9UB-ARK-awdSCXE7n9owYaww=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCF2cYykA5jFZTF6Y5j1zy7A', 'https://www.youtube.com/channel/UCF2cYykA5jFZTF6Y5j1zy7A', 'Инглиш Шоу', 33162691, 641000, 552, 'ru', 'edu', 'english', 'https://yt3.ggpht.com/ytc/APkrFKbnlmsbkZoYFKHZx9gN4xPuAVlOuiwr2Hr9yCnm=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbnlmsbkZoYFKHZx9gN4xPuAVlOuiwr2Hr9yCnm=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbnlmsbkZoYFKHZx9gN4xPuAVlOuiwr2Hr9yCnm=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCY3sxY1IkEC4c210mDrU83w', 'https://www.youtube.com/channel/UCY3sxY1IkEC4c210mDrU83w', 'Гео-История', 117622407, 807000, 37, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/ytc/APkrFKYKCPjy-hA_xc7OZrCHP1b7Zn-bzX6v0N5396-I=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYKCPjy-hA_xc7OZrCHP1b7Zn-bzX6v0N5396-I=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYKCPjy-hA_xc7OZrCHP1b7Zn-bzX6v0N5396-I=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCLDpIKDTFBSwIYtAG0Wpibg', 'https://www.youtube.com/channel/UCLDpIKDTFBSwIYtAG0Wpibg', 'Valery Volkov', 156243829, 494000, 3712, 'ru', 'edu', 'math', 'https://yt3.ggpht.com/yhGrGgOsiBLkvdqzK3Y-b2B8MyFopyENoMwdoowMf9Tmma-IZX9b2JHqPGDhzGqHKf07RTzcTg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/yhGrGgOsiBLkvdqzK3Y-b2B8MyFopyENoMwdoowMf9Tmma-IZX9b2JHqPGDhzGqHKf07RTzcTg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/yhGrGgOsiBLkvdqzK3Y-b2B8MyFopyENoMwdoowMf9Tmma-IZX9b2JHqPGDhzGqHKf07RTzcTg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCE9ODjNIkOHrnSdkYWLfYhg', 'https://www.youtube.com/channel/UCE9ODjNIkOHrnSdkYWLfYhg', 'webDev', 9741899, 110000, 570, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/ytc/APkrFKbx39K4W-D1fHELyKuLguYjx4V0QX0-CPR4-dfqXA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbx39K4W-D1fHELyKuLguYjx4V0QX0-CPR4-dfqXA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbx39K4W-D1fHELyKuLguYjx4V0QX0-CPR4-dfqXA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCIIt69f5D44s2cdb9vXQNzA', 'https://www.youtube.com/channel/UCIIt69f5D44s2cdb9vXQNzA', 'loftblog', 37285755, 387000, 1706, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/BnwaLV2kNJEY-4cJmQ_XhnNblIuStqvSXMu0ogEpz2WuKuvH_edwg1-zP6GtU6_wYcIIDx60dhk=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/BnwaLV2kNJEY-4cJmQ_XhnNblIuStqvSXMu0ogEpz2WuKuvH_edwg1-zP6GtU6_wYcIIDx60dhk=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/BnwaLV2kNJEY-4cJmQ_XhnNblIuStqvSXMu0ogEpz2WuKuvH_edwg1-zP6GtU6_wYcIIDx60dhk=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCVswRUcKC-M35RzgPRv8qUg', 'https://www.youtube.com/channel/UCVswRUcKC-M35RzgPRv8qUg', 'Glo Academy', 12677436, 147000, 597, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/xAgOa68q7xRuIuaipFaiUbWIgszqVQQqzy9gxYtKaFZ3BRfCOp7Sq-mf5Bd8aMhWS5DAslU4N-w=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/xAgOa68q7xRuIuaipFaiUbWIgszqVQQqzy9gxYtKaFZ3BRfCOp7Sq-mf5Bd8aMhWS5DAslU4N-w=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/xAgOa68q7xRuIuaipFaiUbWIgszqVQQqzy9gxYtKaFZ3BRfCOp7Sq-mf5Bd8aMhWS5DAslU4N-w=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC7f5bVxWsm3jlZIPDzOMcAg', 'https://www.youtube.com/channel/UC7f5bVxWsm3jlZIPDzOMcAg', 'Хауди Хо™ - Просто о мире IT!', 198828871, 1850000, 429, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/Yekc-VYH1l8YLSAB9r15zYXTEvjiNqYSLQ3NXY0xQdxDwPqtKXzHSokZ7CUSPyaftpFVJEdg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/Yekc-VYH1l8YLSAB9r15zYXTEvjiNqYSLQ3NXY0xQdxDwPqtKXzHSokZ7CUSPyaftpFVJEdg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/Yekc-VYH1l8YLSAB9r15zYXTEvjiNqYSLQ3NXY0xQdxDwPqtKXzHSokZ7CUSPyaftpFVJEdg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC8wZnXYK_CGKlBcZp-GxYPA', 'https://www.youtube.com/channel/UC8wZnXYK_CGKlBcZp-GxYPA', 'NeuralNine', 19865829, 277000, 652, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/mUAVlzjzD4g581jDzS5Hkn6dnuFz1BeCZMQVomvZDiKN2o6MpdO4DbFq88k1coYjOHDmdypH5Q=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/mUAVlzjzD4g581jDzS5Hkn6dnuFz1BeCZMQVomvZDiKN2o6MpdO4DbFq88k1coYjOHDmdypH5Q=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/mUAVlzjzD4g581jDzS5Hkn6dnuFz1BeCZMQVomvZDiKN2o6MpdO4DbFq88k1coYjOHDmdypH5Q=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCQdPrDypfQeY5euAPbdc11g', 'https://www.youtube.com/channel/UCQdPrDypfQeY5euAPbdc11g', 'Физика от Побединского', 141105899, 1600000, 142, 'ru', 'popsci', 'physics', 'https://yt3.ggpht.com/ytc/APkrFKZB7TX-ee2m-AYMVJLoE_UPKiEfnk060cBOQ5Ccig=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZB7TX-ee2m-AYMVJLoE_UPKiEfnk060cBOQ5Ccig=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZB7TX-ee2m-AYMVJLoE_UPKiEfnk060cBOQ5Ccig=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC4SVo0Ue36XCfOyb5Lh1viQ', 'https://www.youtube.com/channel/UC4SVo0Ue36XCfOyb5Lh1viQ', 'Bro Code', 65429193, 1360000, 621, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKajeJQEU3SzSyfbXlLyAmQu03lss6eNW79LdrcyDQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKajeJQEU3SzSyfbXlLyAmQu03lss6eNW79LdrcyDQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKajeJQEU3SzSyfbXlLyAmQu03lss6eNW79LdrcyDQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCEBfCZwWKn4JzCKojL75B-Q', 'https://www.youtube.com/channel/UCEBfCZwWKn4JzCKojL75B-Q', 'Космос Просто', 138646361, 916000, 340, 'ru', 'popsci', 'space', 'https://yt3.ggpht.com/ytc/APkrFKYNqjPlFXcRmcF4k7kUopwVz1sQjr-WvTta5_mMQUY=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYNqjPlFXcRmcF4k7kUopwVz1sQjr-WvTta5_mMQUY=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYNqjPlFXcRmcF4k7kUopwVz1sQjr-WvTta5_mMQUY=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC4axiS76D784-ofoTdo5zOA', 'https://www.youtube.com/channel/UC4axiS76D784-ofoTdo5zOA', 'Заметки Ардуинщика', 21894368, 375000, 86, 'ru', 'edu', 'electronics', 'https://yt3.ggpht.com/52VUaFdsdahV1c8TP9ZnvCeVwSbC0V4YwDYa8PFkcNXtt68lfScOKYezYSSm8_E9CU2rfAcpdO4=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/52VUaFdsdahV1c8TP9ZnvCeVwSbC0V4YwDYa8PFkcNXtt68lfScOKYezYSSm8_E9CU2rfAcpdO4=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/52VUaFdsdahV1c8TP9ZnvCeVwSbC0V4YwDYa8PFkcNXtt68lfScOKYezYSSm8_E9CU2rfAcpdO4=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCm6afd4QMkQyoViRBai5nFQ', 'https://www.youtube.com/channel/UCm6afd4QMkQyoViRBai5nFQ', 'Space Room', 7106480, 124000, 108, 'ru', 'popsci', 'space', 'https://yt3.ggpht.com/ytc/APkrFKahyCnEVe1Dv_Qw1y0ooCCqPm8FCu6uB6s6KT0pXA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKahyCnEVe1Dv_Qw1y0ooCCqPm8FCu6uB6s6KT0pXA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKahyCnEVe1Dv_Qw1y0ooCCqPm8FCu6uB6s6KT0pXA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCIn6hza5Ai119FJnLMJzECQ', 'https://www.youtube.com/channel/UCIn6hza5Ai119FJnLMJzECQ', 'Alek OS', 9584815, 212000, 44, 'ru', 'edu', 'it', 'https://yt3.ggpht.com/ytc/APkrFKaubO5iBiUnDBLsPNaZDHHXfU6AHrNH9LRtzjGO7g=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaubO5iBiUnDBLsPNaZDHHXfU6AHrNH9LRtzjGO7g=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaubO5iBiUnDBLsPNaZDHHXfU6AHrNH9LRtzjGO7g=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCVTlvUkGslCV_h-nSAId8Sw', 'https://www.youtube.com/channel/UCVTlvUkGslCV_h-nSAId8Sw', 'LearnCode.academy', 49632440, 767000, 168, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKb6-jTm76YdMJh9mECn_ve_w2MVPK3_4_AUe07S=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKb6-jTm76YdMJh9mECn_ve_w2MVPK3_4_AUe07S=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKb6-jTm76YdMJh9mECn_ve_w2MVPK3_4_AUe07S=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCWv7vMbMWH4-V0ZXdmDpPBA', 'https://www.youtube.com/channel/UCWv7vMbMWH4-V0ZXdmDpPBA', 'Programming with Mosh', 182066169, 3610000, 179, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ebu9ZksIXw0tUWBZd6rtk-It8VGSk8AdfSI_eGR-fl6WGet9LnVPngNQCmjdLJeGXpuylwYInQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ebu9ZksIXw0tUWBZd6rtk-It8VGSk8AdfSI_eGR-fl6WGet9LnVPngNQCmjdLJeGXpuylwYInQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ebu9ZksIXw0tUWBZd6rtk-It8VGSk8AdfSI_eGR-fl6WGet9LnVPngNQCmjdLJeGXpuylwYInQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCwXdFgeE9KYzlDdR7TG9cMw', 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw', 'Flutter', 72602081, 523000, 472, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCpOIUW62tnJTtpWFABxWZ8g', 'https://www.youtube.com/channel/UCpOIUW62tnJTtpWFABxWZ8g', 'Codecourse', 35847806, 342000, 1359, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKYVmJ6naCrz9kxzWTjBO3Q2r4bSwtgF83NwfQbPzg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYVmJ6naCrz9kxzWTjBO3Q2r4bSwtgF83NwfQbPzg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYVmJ6naCrz9kxzWTjBO3Q2r4bSwtgF83NwfQbPzg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCwRXb5dUK4cvsHbx-rGzSgw', 'https://www.youtube.com/channel/UCwRXb5dUK4cvsHbx-rGzSgw', 'Derek Banas', 119386454, 1270000, 1232, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKYqBX57MMTR-p1C0tYmERNQ_w4Rn2D2QGvc5Cq_dw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYqBX57MMTR-p1C0tYmERNQ_w4Rn2D2QGvc5Cq_dw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYqBX57MMTR-p1C0tYmERNQ_w4Rn2D2QGvc5Cq_dw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCZUyPT9DkJWmS_DzdOi7RIA', 'https://www.youtube.com/channel/UCZUyPT9DkJWmS_DzdOi7RIA', 'Caleb Curry', 46384277, 581000, 1705, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKbpSojje_-tkBQecNtFuPdSCrg3ZT0FhaYjln9k0g=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbpSojje_-tkBQecNtFuPdSCrg3ZT0FhaYjln9k0g=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbpSojje_-tkBQecNtFuPdSCrg3ZT0FhaYjln9k0g=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCyIe-61Y8C4_o-zZCtO4ETQ', 'https://www.youtube.com/channel/UCyIe-61Y8C4_o-zZCtO4ETQ', 'DevTips', 17449961, 356000, 347, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKYhnO3KAKUr_nUXs8AmZkx8DBQqNz22LMh0PIbHhA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYhnO3KAKUr_nUXs8AmZkx8DBQqNz22LMh0PIbHhA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYhnO3KAKUr_nUXs8AmZkx8DBQqNz22LMh0PIbHhA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UClb90NQQcskPUGDIXsQEz5Q', 'https://www.youtube.com/channel/UClb90NQQcskPUGDIXsQEz5Q', 'developedbyed', 51343172, 896000, 236, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/JfcqVinxsIc8dYsPIrp6IBDRMBb420BqVd2bzS9wqcMWBTzmnjUJ74Q0VByY1gUA8p-AYZQzxQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/JfcqVinxsIc8dYsPIrp6IBDRMBb420BqVd2bzS9wqcMWBTzmnjUJ74Q0VByY1gUA8p-AYZQzxQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/JfcqVinxsIc8dYsPIrp6IBDRMBb420BqVd2bzS9wqcMWBTzmnjUJ74Q0VByY1gUA8p-AYZQzxQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC4JX40jDee_tINbkjycV4Sg', 'https://www.youtube.com/channel/UC4JX40jDee_tINbkjycV4Sg', 'Tech With Tim', 127798483, 1370000, 932, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKYHht64W4oJH1AaeZH7o5CBS2B2xLMTDrPyaN0TiA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYHht64W4oJH1AaeZH7o5CBS2B2xLMTDrPyaN0TiA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYHht64W4oJH1AaeZH7o5CBS2B2xLMTDrPyaN0TiA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCo2JwjPSEc9U8ZJ_KQi6rDQ', 'https://www.youtube.com/channel/UCo2JwjPSEc9U8ZJ_KQi6rDQ', 'Борис Трушин', 49596733, 368000, 684, 'ru', 'edu', 'math', 'https://yt3.ggpht.com/ytc/APkrFKZj1TAv7JdMGZZ1lTniQvQFjOV1Wr7stTDyYvtDJQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZj1TAv7JdMGZZ1lTniQvQFjOV1Wr7stTDyYvtDJQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZj1TAv7JdMGZZ1lTniQvQFjOV1Wr7stTDyYvtDJQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCj0Od_id0gPbmwZ65U8xwrw', 'https://www.youtube.com/channel/UCj0Od_id0gPbmwZ65U8xwrw', 'Wild Mathing', 20930592, 213000, 309, 'ru', 'popsci', 'math', 'https://yt3.ggpht.com/ytc/APkrFKaOShVsywcLela_3Wv_1EvOm7me6muXl9p5TUwhYg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaOShVsywcLela_3Wv_1EvOm7me6muXl9p5TUwhYg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaOShVsywcLela_3Wv_1EvOm7me6muXl9p5TUwhYg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCkw4JCwteGrDHIsyIIKo4tQ', 'https://www.youtube.com/channel/UCkw4JCwteGrDHIsyIIKo4tQ', 'edureka!', 400424459, 3880000, 10332, 'en', 'edu', 'it', 'https://yt3.ggpht.com/OtB--dcR_oNUZUaUsuyk2ShT5nFYjEcj9Yxx50-Nner03vXKt4IWXtP--JrnSGQbwRSHYuVb38g=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/OtB--dcR_oNUZUaUsuyk2ShT5nFYjEcj9Yxx50-Nner03vXKt4IWXtP--JrnSGQbwRSHYuVb38g=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/OtB--dcR_oNUZUaUsuyk2ShT5nFYjEcj9Yxx50-Nner03vXKt4IWXtP--JrnSGQbwRSHYuVb38g=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCFbNIlppjAuEX4znoulh0Cw', 'https://www.youtube.com/channel/UCFbNIlppjAuEX4znoulh0Cw', 'Web Dev Simplified', 123996050, 1440000, 648, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKZWeMCsx4Q9e_Hm6nhOOUQ3fv96QGUXiMr1-pPP=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZWeMCsx4Q9e_Hm6nhOOUQ3fv96QGUXiMr1-pPP=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZWeMCsx4Q9e_Hm6nhOOUQ3fv96QGUXiMr1-pPP=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC29ju8bIPH5as8OGnQzwJyA', 'https://www.youtube.com/channel/UC29ju8bIPH5as8OGnQzwJyA', 'Traversy Media', 205542113, 2160000, 961, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKYcYswt_UhD7D0j6ddiQz6Gb8Q_vSJOjhYI0CoXSw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYcYswt_UhD7D0j6ddiQz6Gb8Q_vSJOjhYI0CoXSw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYcYswt_UhD7D0j6ddiQz6Gb8Q_vSJOjhYI0CoXSw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCSJbGtTlrDami-tDGPUV9-w', 'https://www.youtube.com/channel/UCSJbGtTlrDami-tDGPUV9-w', 'Academind', 73633924, 891000, 668, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/z8m8Nc31z3PdVqbMPzS_MEApQKgXjP6faDEto0lIPXy9S50QSSMtCYHZ5V-opH73q9BAjxpb_g=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/z8m8Nc31z3PdVqbMPzS_MEApQKgXjP6faDEto0lIPXy9S50QSSMtCYHZ5V-opH73q9BAjxpb_g=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/z8m8Nc31z3PdVqbMPzS_MEApQKgXjP6faDEto0lIPXy9S50QSSMtCYHZ5V-opH73q9BAjxpb_g=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCJZv4d5rbIKd4QHMPkcABCw', 'https://www.youtube.com/channel/UCJZv4d5rbIKd4QHMPkcABCw', 'Kevin Powell', 72302070, 826000, 712, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKa6XiLa13mMVPzkmmTBcgNPjjqCGPrY86KfJFmf5w=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKa6XiLa13mMVPzkmmTBcgNPjjqCGPrY86KfJFmf5w=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKa6XiLa13mMVPzkmmTBcgNPjjqCGPrY86KfJFmf5w=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCHRp19HU7Y2LwfI0Ai6WAGQ', 'https://www.youtube.com/channel/UCHRp19HU7Y2LwfI0Ai6WAGQ', 'LearnWebCode', 26225132, 336000, 153, 'en', 'edu', 'programming', 'https://yt3.ggpht.com/ytc/APkrFKZGQPziv5IFoaIzPbA0SVhIKgs7uRg_p127F61l=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZGQPziv5IFoaIzPbA0SVhIKgs7uRg_p127F61l=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZGQPziv5IFoaIzPbA0SVhIKgs7uRg_p127F61l=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCpNzWUlO6PVb_v7chefBnig', 'https://www.youtube.com/channel/UCpNzWUlO6PVb_v7chefBnig', 'GalileoRU', 850405399, 2250000, 2054, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKZHbAEtGVFDQV6wt0ltwTF_jyN6qXPAqu7TGj5UmQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZHbAEtGVFDQV6wt0ltwTF_jyN6qXPAqu7TGj5UmQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZHbAEtGVFDQV6wt0ltwTF_jyN6qXPAqu7TGj5UmQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCjAmQ-4NL3UZX0W_nmjn4_w', 'https://www.youtube.com/channel/UCjAmQ-4NL3UZX0W_nmjn4_w', 'Thoisoi', 324057707, 2000000, 374, 'ru', 'popsci', 'chemistry', 'https://yt3.ggpht.com/ytc/APkrFKbNixpVCHtdxwCWYrKZwN_Sd0p0roIHLpIx2et4jg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbNixpVCHtdxwCWYrKZwN_Sd0p0roIHLpIx2et4jg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbNixpVCHtdxwCWYrKZwN_Sd0p0roIHLpIx2et4jg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCSPd93is2UQsd_jZ6yHBfqQ', 'https://www.youtube.com/channel/UCSPd93is2UQsd_jZ6yHBfqQ', 'ПостНаука', 158323572, 1320000, 3805, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/7ViVz98LQW6fQvs8uvU3ye87y9I2cKQuoUZRE8W_3n7hz0187xYR3h4fnqDM0DMFxkZtk-hWDLs=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/7ViVz98LQW6fQvs8uvU3ye87y9I2cKQuoUZRE8W_3n7hz0187xYR3h4fnqDM0DMFxkZtk-hWDLs=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/7ViVz98LQW6fQvs8uvU3ye87y9I2cKQuoUZRE8W_3n7hz0187xYR3h4fnqDM0DMFxkZtk-hWDLs=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCWfhBu4fAt126ZbxREz3IBw', 'https://www.youtube.com/channel/UCWfhBu4fAt126ZbxREz3IBw', 'Павел ВИКТОР', 84214661, 1120000, 1230, 'ru', 'edu', 'physics', 'https://yt3.ggpht.com/ytc/APkrFKb2zpdyKVc3ku5sb3ZOclrmmfWd79vJMREjCwCJNg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKb2zpdyKVc3ku5sb3ZOclrmmfWd79vJMREjCwCJNg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKb2zpdyKVc3ku5sb3ZOclrmmfWd79vJMREjCwCJNg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCRzZSz5JlSfN6Ba164vqVCg', 'https://www.youtube.com/channel/UCRzZSz5JlSfN6Ba164vqVCg', 'Химия – Просто', 101958806, 900000, 288, 'ru', 'popsci', 'chemistry', 'https://yt3.ggpht.com/ytc/APkrFKaP_HtxfH6oLeT2HPwnTeLtHc7e5B32LEVUnO2TjQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaP_HtxfH6oLeT2HPwnTeLtHc7e5B32LEVUnO2TjQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaP_HtxfH6oLeT2HPwnTeLtHc7e5B32LEVUnO2TjQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCsK1oV0PGkcZ1UhFtajx0dg', 'https://www.youtube.com/channel/UCsK1oV0PGkcZ1UhFtajx0dg', 'Redroom', 131556574, 846000, 300, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/ytc/APkrFKZjO91vMpUDlDb8Y8Etbh9grPY8F925d_cnc48d=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZjO91vMpUDlDb8Y8Etbh9grPY8F925d_cnc48d=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZjO91vMpUDlDb8Y8Etbh9grPY8F925d_cnc48d=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCmeHX75iiqezgdKgYfrFKSA', 'https://www.youtube.com/channel/UCmeHX75iiqezgdKgYfrFKSA', 'АНТРОПОГЕНЕЗ.РУ', 70281276, 497000, 581, 'ru', 'popsci', 'biology', 'https://yt3.ggpht.com/8cV0y2Q6upTFUUFTaOqaCP80qtPffus8YkmGDU43MB1gGb7n3n4vB7HHpBsAwsomuvPkZ7Yq=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/8cV0y2Q6upTFUUFTaOqaCP80qtPffus8YkmGDU43MB1gGb7n3n4vB7HHpBsAwsomuvPkZ7Yq=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/8cV0y2Q6upTFUUFTaOqaCP80qtPffus8YkmGDU43MB1gGb7n3n4vB7HHpBsAwsomuvPkZ7Yq=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCGm2Q52ewdFb5C8gG7G5tjw', 'https://www.youtube.com/channel/UCGm2Q52ewdFb5C8gG7G5tjw', 'KhanAcademyRussian', 45650997, 478000, 4889, 'ru', 'edu', 'all', 'https://yt3.ggpht.com/ytc/APkrFKbM6Dv4j6DUCwp0bt-d5j7lfgsAdn5rJYbGq3fP=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbM6Dv4j6DUCwp0bt-d5j7lfgsAdn5rJYbGq3fP=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbM6Dv4j6DUCwp0bt-d5j7lfgsAdn5rJYbGq3fP=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCTicegJcrtbsT-vYbwAGssg', 'https://www.youtube.com/channel/UCTicegJcrtbsT-vYbwAGssg', 'Макар Светлый', 28960256, 229000, 185, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKbetchg2cHabqhQfzvUqeiwL4EVgQQqpzIYBCEQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbetchg2cHabqhQfzvUqeiwL4EVgQQqpzIYBCEQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbetchg2cHabqhQfzvUqeiwL4EVgQQqpzIYBCEQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC-yTIuKauNecL0Tl6ChD0yw', 'https://www.youtube.com/channel/UC-yTIuKauNecL0Tl6ChD0yw', 'Alpha Centauri', 145140272, 561000, 1517, 'ru', 'popsci', 'space', 'https://yt3.ggpht.com/ytc/APkrFKbVm-Hg5Xg5oC3mB6BZAdWaa_H8O0z4Y5VJPwE-SQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbVm-Hg5Xg5oC3mB6BZAdWaa_H8O0z4Y5VJPwE-SQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbVm-Hg5Xg5oC3mB6BZAdWaa_H8O0z4Y5VJPwE-SQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCUmeLZofGMhO5lVOHUEUU2A', 'https://www.youtube.com/channel/UCUmeLZofGMhO5lVOHUEUU2A', 'Улица Шкловского', 14902038, 151000, 120, 'ru', 'popsci', 'space', 'https://yt3.ggpht.com/hz5OlkigG9D7UMEo3fiua0-VeE0aFcJz7sNiwgkiyzkT_cxckrr9F-HBlh58TG6rb7Vc1NCR=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/hz5OlkigG9D7UMEo3fiua0-VeE0aFcJz7sNiwgkiyzkT_cxckrr9F-HBlh58TG6rb7Vc1NCR=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/hz5OlkigG9D7UMEo3fiua0-VeE0aFcJz7sNiwgkiyzkT_cxckrr9F-HBlh58TG6rb7Vc1NCR=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCxAGkrJYNlpC1jfnJvE_6Lw', 'https://www.youtube.com/channel/UCxAGkrJYNlpC1jfnJvE_6Lw', 'Лекториум', 19582503, 184000, 7246, 'ru', 'edu', 'all', 'https://yt3.ggpht.com/ytc/APkrFKYyfQYGqFz8hMFc15VrfhKLXULvDLIeo5vTVXlIlQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYyfQYGqFz8hMFc15VrfhKLXULvDLIeo5vTVXlIlQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYyfQYGqFz8hMFc15VrfhKLXULvDLIeo5vTVXlIlQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCVgvnGSFU41kIhEc09aztEg', 'https://www.youtube.com/channel/UCVgvnGSFU41kIhEc09aztEg', 'Arzamas', 105962181, 1580000, 762, 'ru', 'popsci', 'social', 'https://yt3.ggpht.com/ytc/APkrFKadGIXtb0R7f1fLEEkNX2cepMqiRlUojOANFVU7=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKadGIXtb0R7f1fLEEkNX2cepMqiRlUojOANFVU7=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKadGIXtb0R7f1fLEEkNX2cepMqiRlUojOANFVU7=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCxtTXA5DU1bZHLLomu83zVw', 'https://www.youtube.com/channel/UCxtTXA5DU1bZHLLomu83zVw', 'Artur Sharifov', 110353141, 1490000, 143, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/0xTP-oldNlBEa6xV4qaX2a1YklR7zKt1MiGYLuw06mi-kXdrCmvAzwS1H-8RMUw3RqGa62dw1xI=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/0xTP-oldNlBEa6xV4qaX2a1YklR7zKt1MiGYLuw06mi-kXdrCmvAzwS1H-8RMUw3RqGa62dw1xI=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/0xTP-oldNlBEa6xV4qaX2a1YklR7zKt1MiGYLuw06mi-kXdrCmvAzwS1H-8RMUw3RqGa62dw1xI=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCY6zVRa3Km52bsBmpyQnk6A', 'https://www.youtube.com/channel/UCY6zVRa3Km52bsBmpyQnk6A', 'Vert Dider', 279245188, 1890000, 648, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKa7nMd1XzxFUYU5CMKIqEV6fZZw9lMfZGEyNmUMHA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKa7nMd1XzxFUYU5CMKIqEV6fZZw9lMfZGEyNmUMHA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKa7nMd1XzxFUYU5CMKIqEV6fZZw9lMfZGEyNmUMHA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCyjf5CxCNEc9ALYlalBiKDQ', 'https://www.youtube.com/channel/UCyjf5CxCNEc9ALYlalBiKDQ', 'GEO', 217081566, 1970000, 117, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/0hAbF-TC91U6I_Fxdz-XSOJBThknQjVzy6WMod6S5v9HZvJJ2v1WmmYhUbfT3N6-wXEpkLE9Vw=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/0hAbF-TC91U6I_Fxdz-XSOJBThknQjVzy6WMod6S5v9HZvJJ2v1WmmYhUbfT3N6-wXEpkLE9Vw=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/0hAbF-TC91U6I_Fxdz-XSOJBThknQjVzy6WMod6S5v9HZvJJ2v1WmmYhUbfT3N6-wXEpkLE9Vw=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC8M5YVWQan_3Elm-URehz9w', 'https://www.youtube.com/channel/UC8M5YVWQan_3Elm-URehz9w', 'Utopia Show', 776303223, 5680000, 160, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/APkrFKYZQgSTrGt4WANlU_GYfWNUWrJCntyu4p_HqdVTNA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYZQgSTrGt4WANlU_GYfWNUWrJCntyu4p_HqdVTNA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYZQgSTrGt4WANlU_GYfWNUWrJCntyu4p_HqdVTNA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCSaVoRErW4kqKsDqExs2MXA', 'https://www.youtube.com/channel/UCSaVoRErW4kqKsDqExs2MXA', 'SciOne', 112648760, 1270000, 386, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/c_NCwrYam1kpR59CVfIeCFhxj5nvEbAnYEKP8bcqAzI6CdkbL5jtLdSnD1INpuDlY3d2s4oxPg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/c_NCwrYam1kpR59CVfIeCFhxj5nvEbAnYEKP8bcqAzI6CdkbL5jtLdSnD1INpuDlY3d2s4oxPg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/c_NCwrYam1kpR59CVfIeCFhxj5nvEbAnYEKP8bcqAzI6CdkbL5jtLdSnD1INpuDlY3d2s4oxPg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCQigg2dPeIMA3u4tslYq0zg', 'https://www.youtube.com/channel/UCQigg2dPeIMA3u4tslYq0zg', 'LOONY', 76988971, 807000, 113, 'ru', 'popsci', 'medicine', 'https://yt3.ggpht.com/ytc/APkrFKY_nkvNOnGwSTX-7mZKPGzenV6vuDNJy6IH0Gigeg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKY_nkvNOnGwSTX-7mZKPGzenV6vuDNJy6IH0Gigeg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKY_nkvNOnGwSTX-7mZKPGzenV6vuDNJy6IH0Gigeg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCSiMRgysUoHBUcbKnhJMlSA', 'https://www.youtube.com/channel/UCSiMRgysUoHBUcbKnhJMlSA', 'GetAClass - Физика в опытах и экспериментах', 58251935, 506000, 681, 'ru', 'popsci', 'physics', 'https://yt3.ggpht.com/Myvqn15mZQCRRaFSuEN80YyPFKuEgm3PvdgT3MZBzK4-WIKB0qGDLP25KIJ6ObfGNs4IcWr_CIs=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/Myvqn15mZQCRRaFSuEN80YyPFKuEgm3PvdgT3MZBzK4-WIKB0qGDLP25KIJ6ObfGNs4IcWr_CIs=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/Myvqn15mZQCRRaFSuEN80YyPFKuEgm3PvdgT3MZBzK4-WIKB0qGDLP25KIJ6ObfGNs4IcWr_CIs=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCc1vIgxxnzkz8-YhGuVYYYQ', 'https://www.youtube.com/channel/UCc1vIgxxnzkz8-YhGuVYYYQ', 'АРХИВАРИУС', 37357978, 463000, 67, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/ytc/APkrFKZCsgSg3-mTAp4Am28Gjx85rUxtITZegBYgwH20Ww=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZCsgSg3-mTAp4Am28Gjx85rUxtITZegBYgwH20Ww=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKZCsgSg3-mTAp4Am28Gjx85rUxtITZegBYgwH20Ww=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCZowYvtjz-HOMubZW1Si-9g', 'https://www.youtube.com/channel/UCZowYvtjz-HOMubZW1Si-9g', 'Упоротый Палеонтолог', 36829035, 246000, 181, 'ru', 'popsci', 'biology', 'https://yt3.ggpht.com/ytc/APkrFKaavqg_6CDk831zOJV13e7AtnZAraxMmp5y2Rqj=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaavqg_6CDk831zOJV13e7AtnZAraxMmp5y2Rqj=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaavqg_6CDk831zOJV13e7AtnZAraxMmp5y2Rqj=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCOsAqQmUsk5bBl4ydsTNS-g', 'https://www.youtube.com/channel/UCOsAqQmUsk5bBl4ydsTNS-g', 'Хамибин 2.0', 16494873, 141000, 92, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/nGrKaRFyrVUG6dZW1meB8wyTHVIsB0ghpPPIgA8uJoGHRd6fXyf_xQ3PHuLtUwn6MKMRM-WW=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/nGrKaRFyrVUG6dZW1meB8wyTHVIsB0ghpPPIgA8uJoGHRd6fXyf_xQ3PHuLtUwn6MKMRM-WW=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/nGrKaRFyrVUG6dZW1meB8wyTHVIsB0ghpPPIgA8uJoGHRd6fXyf_xQ3PHuLtUwn6MKMRM-WW=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCf-vHLevJIdQjm3t2fVUrjg', 'https://www.youtube.com/channel/UCf-vHLevJIdQjm3t2fVUrjg', 'Береста', 84148333, 393000, 229, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/ytc/APkrFKbQnzEmz9ORue2BUP_E-Zd5WR6a6yTeM1hId8VP=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbQnzEmz9ORue2BUP_E-Zd5WR6a6yTeM1hId8VP=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKbQnzEmz9ORue2BUP_E-Zd5WR6a6yTeM1hId8VP=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC7DdEm33SyaTDtWYGO2CwdA', 'https://www.youtube.com/channel/UC7DdEm33SyaTDtWYGO2CwdA', 'Physics Girl', 298517395, 2890000, 243, 'en', 'popsci', 'physics', 'https://yt3.ggpht.com/ytc/APkrFKYPfEBe5BqlsDy_YSpjMuLsbz-BmUNdnciiIy2VeA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYPfEBe5BqlsDy_YSpjMuLsbz-BmUNdnciiIy2VeA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYPfEBe5BqlsDy_YSpjMuLsbz-BmUNdnciiIy2VeA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCUHW94eEFW7hkUMVaZz4eDg', 'https://www.youtube.com/channel/UCUHW94eEFW7hkUMVaZz4eDg', 'minutephysics', 534431024, 5700000, 271, 'en', 'popsci', 'physics', 'https://yt3.ggpht.com/ytc/APkrFKY67uuswtne4qkAy9X1q00FlcoNKb1AMX15MCMR=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKY67uuswtne4qkAy9X1q00FlcoNKb1AMX15MCMR=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKY67uuswtne4qkAy9X1q00FlcoNKb1AMX15MCMR=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC8lxnUR_CzruT2KA6cb7p0Q', 'https://www.youtube.com/channel/UC8lxnUR_CzruT2KA6cb7p0Q', 'Envato Tuts+', 116916081, 1310000, 5272, 'en', 'edu', 'it', 'https://yt3.ggpht.com/ytc/APkrFKYUOvGTub7T3M2PaniiBiOGJBe6eyCjzo3_eVZzjQ=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYUOvGTub7T3M2PaniiBiOGJBe6eyCjzo3_eVZzjQ=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYUOvGTub7T3M2PaniiBiOGJBe6eyCjzo3_eVZzjQ=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC4WAsHhtleuEGKX9x_Kbd9w', 'https://www.youtube.com/channel/UC4WAsHhtleuEGKX9x_Kbd9w', 'Неземной подкаст Владимира Сурдина', 24916915, 264000, 98, 'ru', 'popsci', 'space', 'https://yt3.ggpht.com/ytc/APkrFKaUzeF8SVLUzMfVaCOUoLAEVkfE8kDgRRud6Hvb=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaUzeF8SVLUzMfVaCOUoLAEVkfE8kDgRRud6Hvb=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKaUzeF8SVLUzMfVaCOUoLAEVkfE8kDgRRud6Hvb=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCmNDf2w5wy9m61bq7IqmWZg', 'https://www.youtube.com/channel/UCmNDf2w5wy9m61bq7IqmWZg', 'Цифровая история', 107329706, 522000, 708, 'ru', 'popsci', 'history', 'https://yt3.ggpht.com/gc5yAY2vLrJTQJmX5AwzG7gq9nQzwGsD08eBIO9QOryLwWJm3epuTvFnrc3PJe7s_VCEETIw-ek=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/gc5yAY2vLrJTQJmX5AwzG7gq9nQzwGsD08eBIO9QOryLwWJm3epuTvFnrc3PJe7s_VCEETIw-ek=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/gc5yAY2vLrJTQJmX5AwzG7gq9nQzwGsD08eBIO9QOryLwWJm3epuTvFnrc3PJe7s_VCEETIw-ek=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC0yEgH2COTqGKu1G59r6BZA', 'https://www.youtube.com/channel/UC0yEgH2COTqGKu1G59r6BZA', 'Astro Channel', 18258206, 150000, 838, 'ru', 'popsci', 'space', 'https://yt3.ggpht.com/U42atZ3APJjpDD-t3xuJRwAmTbj4uV8tJRIk7wAtHh0DxsIhh8v2UNJPG-z759MROnumKziyKg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/U42atZ3APJjpDD-t3xuJRwAmTbj4uV8tJRIk7wAtHh0DxsIhh8v2UNJPG-z759MROnumKziyKg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/U42atZ3APJjpDD-t3xuJRwAmTbj4uV8tJRIk7wAtHh0DxsIhh8v2UNJPG-z759MROnumKziyKg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCxWeAHyOBQWsw8jZhxWz5iw', 'https://www.youtube.com/channel/UCxWeAHyOBQWsw8jZhxWz5iw', 'Школково ЕГЭ, ОГЭ, олимпиады', 32878030, 241000, 2663, 'ru', 'edu', 'all', 'https://yt3.ggpht.com/22I55wt7ACZ-TkzuD6OKr0Zgvtmyn4iQ4IP2NitQFlzbjfQAlpACRTyAwXXQS1f23qJbENKLK6w=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/22I55wt7ACZ-TkzuD6OKr0Zgvtmyn4iQ4IP2NitQFlzbjfQAlpACRTyAwXXQS1f23qJbENKLK6w=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/22I55wt7ACZ-TkzuD6OKr0Zgvtmyn4iQ4IP2NitQFlzbjfQAlpACRTyAwXXQS1f23qJbENKLK6w=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCP4ZkYVW3twRgX9knANWyrg', 'https://www.youtube.com/channel/UCP4ZkYVW3twRgX9knANWyrg', 'bezbotvy', 26673226, 158000, 913, 'ru', 'edu', 'math', 'https://yt3.ggpht.com/ytc/APkrFKYpUpv6l1136PuFthMTaUrMFBSLOv34RqW-7RLH=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYpUpv6l1136PuFthMTaUrMFBSLOv34RqW-7RLH=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/APkrFKYpUpv6l1136PuFthMTaUrMFBSLOv34RqW-7RLH=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC2q4mHrzoR48mwSuAYtVPtQ', 'https://www.youtube.com/channel/UC2q4mHrzoR48mwSuAYtVPtQ', 'Александр Панчин', 12607072, 164000, 92, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/m72tmxTgUANAZ10cKNSobxKw5jE_8VLQnUfikM8sfMhHnY3WGbOuBW8-WX2c1zFFKLbYrMLCcg=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/m72tmxTgUANAZ10cKNSobxKw5jE_8VLQnUfikM8sfMhHnY3WGbOuBW8-WX2c1zFFKLbYrMLCcg=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/m72tmxTgUANAZ10cKNSobxKw5jE_8VLQnUfikM8sfMhHnY3WGbOuBW8-WX2c1zFFKLbYrMLCcg=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCAuUUnT6oDeKwE6v1NGQxug', 'https://www.youtube.com/channel/UCAuUUnT6oDeKwE6v1NGQxug', 'TED', 2632146365, 23700000, 4570, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/AIf8zZSzWW_eRt_wcp6hGsTxwOnmAml365eUL4qcg-voTA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZSzWW_eRt_wcp6hGsTxwOnmAml365eUL4qcg-voTA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZSzWW_eRt_wcp6hGsTxwOnmAml365eUL4qcg-voTA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCsooa4yRKGN_zEE8iknghZA', 'https://www.youtube.com/channel/UCsooa4yRKGN_zEE8iknghZA', 'TED-Ed', 3802909425, 19300000, 2117, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/HjXKmDGoAp6b-JdGYpqJYYeN4S_CMpD_kqWvldpN53cbzn-i73t6mVNo8mNki-xLPwi0BVSFi-o=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/HjXKmDGoAp6b-JdGYpqJYYeN4S_CMpD_kqWvldpN53cbzn-i73t6mVNo8mNki-xLPwi0BVSFi-o=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/HjXKmDGoAp6b-JdGYpqJYYeN4S_CMpD_kqWvldpN53cbzn-i73t6mVNo8mNki-xLPwi0BVSFi-o=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCsT0YIqwnpJCM-mx7-gSA4Q', 'https://www.youtube.com/channel/UCsT0YIqwnpJCM-mx7-gSA4Q', 'TEDx Talks', 7637599221, 39800000, 208090, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/70r5TkYTLC0cpKLAiQEvcWLeIHB8yxoiog0nQIK9MmnZHqkICy0YA-jAaqfT2ChOBwehskjf5g=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/70r5TkYTLC0cpKLAiQEvcWLeIHB8yxoiog0nQIK9MmnZHqkICy0YA-jAaqfT2ChOBwehskjf5g=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/70r5TkYTLC0cpKLAiQEvcWLeIHB8yxoiog0nQIK9MmnZHqkICy0YA-jAaqfT2ChOBwehskjf5g=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC2Ru64PHqW4FxoP0xhQRvJg', 'https://www.youtube.com/channel/UC2Ru64PHqW4FxoP0xhQRvJg', 'ТОПЛЕС', 811821559, 6560000, 208, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/DzXAtkmliMwC3WybWvc6ztoFQW-coO0Y8hDYdgvrTV8ieKYX7ZZyWAt4NBose-jvRB3Z7MNhkA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/DzXAtkmliMwC3WybWvc6ztoFQW-coO0Y8hDYdgvrTV8ieKYX7ZZyWAt4NBose-jvRB3Z7MNhkA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/DzXAtkmliMwC3WybWvc6ztoFQW-coO0Y8hDYdgvrTV8ieKYX7ZZyWAt4NBose-jvRB3Z7MNhkA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCDK8SFd2iuF_h4kklUoueJw', 'https://www.youtube.com/channel/UCDK8SFd2iuF_h4kklUoueJw', 'Редакция.Наука', 39143816, 417000, 238, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/tnUQTpguzP2gZbbYrjJo2oSGWA0Q6BbuH-Gc0JwCM94JNyrj8aitTjXPHAaQ4vI4kcwIZrW94g=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/tnUQTpguzP2gZbbYrjJo2oSGWA0Q6BbuH-Gc0JwCM94JNyrj8aitTjXPHAaQ4vI4kcwIZrW94g=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/tnUQTpguzP2gZbbYrjJo2oSGWA0Q6BbuH-Gc0JwCM94JNyrj8aitTjXPHAaQ4vI4kcwIZrW94g=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UC6nSFpj9HTCZ5t-N3Rm3-HA', 'https://www.youtube.com/channel/UC6nSFpj9HTCZ5t-N3Rm3-HA', 'Vsauce', 3621226097, 20900000, 506, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/AIf8zZS5rw1HUlwKPR0ERetSUCbi_D83ik5eGJjr0hGVCA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZS5rw1HUlwKPR0ERetSUCbi_D83ik5eGJjr0hGVCA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZS5rw1HUlwKPR0ERetSUCbi_D83ik5eGJjr0hGVCA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UChh4KdOL_b1D5oc3yJiaq6A', 'https://www.youtube.com/channel/UChh4KdOL_b1D5oc3yJiaq6A', 'VoicePower', 54273874, 415000, 221, 'ru', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/AIf8zZQNu4WL7qaIdBx-bIqwPbI7kJrCFwyxe2T1vCjk=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZQNu4WL7qaIdBx-bIqwPbI7kJrCFwyxe2T1vCjk=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZQNu4WL7qaIdBx-bIqwPbI7kJrCFwyxe2T1vCjk=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCqmugCqELzhIMNYnsjScXXw', 'https://www.youtube.com/channel/UCqmugCqELzhIMNYnsjScXXw', 'Vsauce2', 783437919, 4540000, 474, 'en', 'popsci', 'all', 'https://yt3.ggpht.com/ytc/AIf8zZQFJ_8EKurNhaudxBhcghY6HmER8naKejfTuFB_LA=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZQFJ_8EKurNhaudxBhcghY6HmER8naKejfTuFB_LA=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZQFJ_8EKurNhaudxBhcghY6HmER8naKejfTuFB_LA=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCEVelHmwuCqyje6YTAP2UIA', 'https://www.youtube.com/channel/UCEVelHmwuCqyje6YTAP2UIA', 'ALEX LAB', 42643319, 922000, 51, 'en', 'popsci', 'physics', 'https://yt3.ggpht.com/8mlDnq5DMSEy4PR-IteJHOziV93HoYQY9iRFR36vm8dCvAQjOfBWd_wMlJPmJmagzqOI0V4y=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/8mlDnq5DMSEy4PR-IteJHOziV93HoYQY9iRFR36vm8dCvAQjOfBWd_wMlJPmJmagzqOI0V4y=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/8mlDnq5DMSEy4PR-IteJHOziV93HoYQY9iRFR36vm8dCvAQjOfBWd_wMlJPmJmagzqOI0V4y=s800-c-k-c0x00ffffff-no-rj', 1, true);
INSERT INTO razvit.channel VALUES ('UCah9pzaxpAeDLQ20hcufc2g', 'https://www.youtube.com/channel/UCah9pzaxpAeDLQ20hcufc2g', 'Alex Burkan', 21370275, 595000, 86, 'ru', 'popsci', 'physics', 'https://yt3.ggpht.com/ytc/AIf8zZSUJmoPOJ-0m3I5MIFHFMZG3ftP3aMkOhSPTSZRRw0=s88-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZSUJmoPOJ-0m3I5MIFHFMZG3ftP3aMkOhSPTSZRRw0=s240-c-k-c0x00ffffff-no-rj', 'https://yt3.ggpht.com/ytc/AIf8zZSUJmoPOJ-0m3I5MIFHFMZG3ftP3aMkOhSPTSZRRw0=s800-c-k-c0x00ffffff-no-rj', 1, true);


--
-- TOC entry 3751 (class 0 OID 29771)
-- Dependencies: 227
-- Data for Name: comment; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.comment VALUES (1, 1, 2, '2023-12-01', 'Базированная база');
INSERT INTO razvit.comment VALUES (2, 1, 3, '2023-12-02', 'База');
INSERT INTO razvit.comment VALUES (3, 1, 4, '2023-12-24', 'База!');
INSERT INTO razvit.comment VALUES (4, 1, 5, '2023-12-24', 'Кринж');
INSERT INTO razvit.comment VALUES (5, 2, 5, '2023-12-24', 'Криинж');
INSERT INTO razvit.comment VALUES (6, 3, 5, '2023-12-25', 'Кринж');
INSERT INTO razvit.comment VALUES (7, 4, 5, '2023-12-25', 'Кринжовый кринж');
INSERT INTO razvit.comment VALUES (8, 5, 5, '2023-12-26', 'Кринж');
INSERT INTO razvit.comment VALUES (9, 6, 5, '2023-12-26', 'Кринжовый кринж');


--
-- TOC entry 3745 (class 0 OID 29726)
-- Dependencies: 221
-- Data for Name: extension; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.extension VALUES (1, 1, '{RealLifeLore,Veritasium,"Kurzgesagt – In a Nutshell"}', '{python,javascript,html}', '{stepik.org,itmo.ru}', '{stepik.org}', '{litres.ru}', '{tiktok.com}');
INSERT INTO razvit.extension VALUES (2, 2, '{3Blue1Brown,RealLifeLore}', '{linux,wordpress}', '{learnsql.ru,itmo.ru,w3schools.com}', '{}', '{}', '{instagram.com,facebook.com}');
INSERT INTO razvit.extension VALUES (3, 3, '{Fireship,"Bro Code",Инглекс}', '{swift,xcode}', '{developer.mozilla.org,developer.chrome.com}', '{}', '{}', '{facebook.com}');
INSERT INTO razvit.extension VALUES (4, 4, '{MyGap,"Physics Girl","Космос Просто"}', '{css,html,javascript}', '{learnsql.ru,postgresql.org,mongodb.com}', '{}', '{}', '{vk.com,tiktok.com}');
INSERT INTO razvit.extension VALUES (5, 5, '{"Geo History",Redroom,Мудреныч}', '{fastapi,python,css,html,javascript}', '{foxford.ru,sololearn.com}', '{}', '{}', '{tiktok.com}');


--
-- TOC entry 3753 (class 0 OID 29790)
-- Dependencies: 229
-- Data for Name: genre; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.genre VALUES (1, 'Рок');
INSERT INTO razvit.genre VALUES (2, 'Рэп');
INSERT INTO razvit.genre VALUES (3, 'Поп');
INSERT INTO razvit.genre VALUES (4, 'Джаз');
INSERT INTO razvit.genre VALUES (5, 'Классика');


--
-- TOC entry 3741 (class 0 OID 29695)
-- Dependencies: 217
-- Data for Name: mode; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.mode VALUES (1, 1, 'extension', 34785, 34780);
INSERT INTO razvit.mode VALUES (2, 1, 'heart', 4452, 4452);
INSERT INTO razvit.mode VALUES (3, 2, 'extension', 45325, 45325);
INSERT INTO razvit.mode VALUES (4, 2, 'program', 2424452, 2424449);
INSERT INTO razvit.mode VALUES (5, 3, 'extension', 6224, 6222);


--
-- TOC entry 3747 (class 0 OID 29742)
-- Dependencies: 223
-- Data for Name: order; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit."order" VALUES (1, 1, '88005553535', 'Кемеровская область, город Егорьевск, шоссе Будапештсткая, 79', '126266', true, '@andrei');
INSERT INTO razvit."order" VALUES (2, 3, '89115534589', 'Калининградская область, город Клин, пр. Гоголя, 34', '123296', true, '@alexei');
INSERT INTO razvit."order" VALUES (3, 2, '89115535843', 'Пензенская область, город Мытищи, спуск Косиора, 79', '941574', true, '@alice');


--
-- TOC entry 3735 (class 0 OID 29656)
-- Dependencies: 211
-- Data for Name: role; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.role VALUES (1, 'admin');
INSERT INTO razvit.role VALUES (2, 'moderator');
INSERT INTO razvit.role VALUES (3, 'user');


--
-- TOC entry 3743 (class 0 OID 29707)
-- Dependencies: 219
-- Data for Name: schedule; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.schedule VALUES (1, 1, 1, '15:00:00', '17:00:00', '{t,t,t,t,t,t,f}');
INSERT INTO razvit.schedule VALUES (2, 2, 2, '10:00:00', '15:00:00', '{t,f,f,f,f,f,f}');
INSERT INTO razvit.schedule VALUES (3, 3, 1, '18:00:00', '20:00:00', '{t,f,t,f,t,t,t}');


--
-- TOC entry 3759 (class 0 OID 29830)
-- Dependencies: 235
-- Data for Name: song; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.song VALUES (1, 1, '2023-10-20', true, 1, 'Panzerkampf', 2, 1, 'en', 2008, 'https://www.youtube.com/watch?v=3vEW_r4Swn8', 'https://www.youtube.com/watch?v=snJ6phce4To', NULL);
INSERT INTO razvit.song VALUES (2, 1, '2023-10-20', true, 1, 'Counterstrike', 3, 1, 'en', 2005, 'https://www.youtube.com/watch?v=xKOxIcfuzx0', 'https://www.youtube.com/watch?v=lEPJbqlHlv0', NULL);
INSERT INTO razvit.song VALUES (3, 1, '2023-10-20', true, 3, 'Чёрный октябрь', 1, 1, 'ru', 2022, 'https://www.youtube.com/watch?v=UKyM3bofM8M', NULL, '30 лет назад Москва встречала\n93-й год в обломках баррикад\nЕльцин свергнул избранный парламент\nНо узнав, что отстранён — он тут же ввёл войска\nВзять до рассвета дом Верховного Совета!\nВывести части, что лояльны нашей власти\nВ бой полк десанта, Кремль дал свою команду\nАрмия с нами и бунт падёт!\nМы писали свою историю\nКисть обрамляла режим\nКрасной кровью на Белом доме\nПод сводом небес голубым\nГде шёл чёрный дым!\nИ шёл чёрный дым!\nСтороны склоняли генералов\nПрисягнуть под их контроль и выполнить приказ!\nТанки били залпами, снаряды разрывались в окнах\nУ ворот стоял спецназ\nПод арест президента, захватите телецентр!\nЖечь баррикады, это новый узурпатор!\nНадеть жилеты, власть Верховному Совету!\nПравда за нами и Кремль падёт!\nМы писали свою историю\nКисть обрамляла режим\nКрасной кровью на Белом доме\nПод сводом небес голубым\nГде шёл чёрный дым!\nМосква встретит новый день\nВстретит сотнями смертей\nИ осенний дождь\nСмоет кровь с рук её детей\nИ под шумный марш солдат\nНа обломках баррикад\nТа иллюзия республики\nВстречала свой закат\nИ шёл чёрный дым!\nИ шёл чёрный дым! (Дым, дым)\nИ шёл чёрный дым!\nМы писали свою историю\nКисть обрамляла режим\nКрасной кровью на Белом доме\nПод сводом небес голубым\nГде шёл чёрный дым!\nИ шёл чёрный дым!');
INSERT INTO razvit.song VALUES (4, 1, '2023-10-20', true, 3, 'Panzerkampf', NULL, 1, 'ru', 2018, 'https://www.youtube.com/watch?v=hSK_f1L0-xE', NULL, NULL);
INSERT INTO razvit.song VALUES (5, 1, '2023-10-20', true, 2, 'Теорема Лагранжа', NULL, 2, 'ru', NULL, 'https://www.youtube.com/watch?v=GwDClnIBUIg', NULL, 'У меня одна только радость на лице,\nВедь всегда найдётся такая точка c,\nЧто f(b) - f(a) / b - a\nРавно f''(c). Оу, вот это да!\n\nЧто-то я забылся, пора знать честь,\nf на [a, b] непрерывна и производная есть.\nДавно прошли времена и хип-хопа и гранжа.\nЧто же вечно? Теорема Лагранжа!\n\nПерелети-переплыви туда-обратно Ла-Манш.\nТы не найдёшь никого круче, чем Жозеф Луи Лагранж.\nЗабудут Жоржа Помпиду (кого?), и даже Ассанжа,\nНо будут помнить и в аду теорему Лагранжа. x2\n\nТеорема, в сущности, сдаётся без боя:\nСделаем из f к-к-к-кое-что другое.\nВычтем f от a, юные зрители,\nЕщё вычтем дробь, у неё в числителе:\n\nf(b) - f(a) на x - a, \nВ знаменателе b - a... Ну как, ещё не спятили?\nЗачем конструкция? Не поняли что ли?\nДля неё же выполняется теорема Ролля!\n\nПерелети-переплыви туда-обратно Ла-Манш.\nТы не найдёшь никого круче, чем Жозеф Луи Лагранж.\nЗабудут Жоржа Помпиду (кого?), и даже Ассанжа,\nНо будут помнить и в аду теорему Лагранжа. x2\n\nУщипни меня: наверное, я сплю!\nНовая функция на концах равна нулю.\nЗначит, в середине есть какая-то точка,\nГде производная ноль? Умница, дочка!\n\nПроизводную, родимую, от функции берём,\nВ этой точке c, come, baby, come on!\nПолучаем ч.т.д. и т.п. и т.д.\nСдать это легче, чем с ТП лавэ срубить в ГИБДД.(?)\n\nПерелети-переплыви туда-обратно Ла-Манш.\nТы не найдёшь никого круче, чем Жозеф Луи Лагранж.\nЗабудут Жоржа Помпиду (кого?), и даже Ассанжа,\nНо будут помнить и в аду теорему Лагранжа. x3');
INSERT INTO razvit.song VALUES (6, 1, '2023-10-24', true, 2, 'Расцвет древнерусского государства', NULL, 4, 'ru', 2020, 'https://www.youtube.com/watch?v=XaVM6T7yUS4', NULL, 'Расцвет древнерусского государства\nБудем постепенно изучать наше царство.\nЕсли ты не знаешь про крещение Руси то я рекомендую тебе тут оставаться.\n\nПервая междоусобица,\nТри князя брата не могли наверное не ссориться. \nОлег, Ярополк и конечно Владимир.\nПоследний одержит победу над ними.\n\nС 80 по тыща сто пятнадцатый \nВладимир был великим князей, извиняйте братцы и \nПервая попытка - реформа язычества\nНеудачное за перуна поручительство.\n\nКрещение Руси- девятьсот восемьдесят восемь \nВладимир крестился в городе Корсунь\nЗаложил Владимир Белгород Переславль.\nВ жизни крестьян десятину добавил.\n\nУкрепление государства и княжеской власти\nСоц. неравенство оправдаем здрасте \nМягче чем язычество и с Византией дружим\nВот тебе причины принятия, ну же!\n\nЗначение кстати довольно весомо\nИскусство развивается, первые школы\nМеждународный поднял авторитет\nС византией связи, единство - привет)\n\nЧе по иерархии церкви\nПатриарх константинопольський - верхний\nНиже Киевский митрополит\nЕпископы ниже, там каждый следит. \n\nЯрослав Мудрый был очень умный\nЛествичное право попробуй придумай.\nРусская правда - сборник красивый\nМера наказания за убийство - вира.\n\nЮрьев в тридцатом году основал \nВ тридцать шестом печенегов развал \nСоюз в сорок первом с Польским королём \nЦеркви глава - Илларион\n\nВсе на Руси разные кстати\nБояре - представители родоплеменной знати\nЛюди или смерды - население свободное \nХолоп - местный раб, челядин - инородный\n\nЗакуп - должен отработать купу \nРядович заключает ряд с бояриным круто\nУстройство политики тоже нормальное \nЭто монархия, раннефеодальная\n\nПосле Ярика междоусобица-три\nСанта-барбара, ты посмотри:\nРазбираться с ней стоит вне трека\nПосле этих тёрок было время человека \n\nКоторый правил так что прямо вах вах\nЗвали его Кстати Владимир Мономах\nВ девяносто седьмом съезд в любече крю \nКаждый да держит вотчину свою \n\nТыща сто тринадцатый, беспорядки здравствуйте \nВ Киеве после Святополка властвуют \nУстав о резах и закупах в здании\nМономах и ко тогда его представили. \n\nПоучение Владимира мономаха детям\nПовесть временных лет - Нестору приветик\nРазвиваем письменность, че ещё скажешь \nКрещение Руси это точно не лажа.\n\nНестор, что у нас дальше по книге?\nПравит некий Мстислав Великий\nГосударство целым так и сохраняет\nПоловцев смело от границ оттесняет.\n\nДальше времена, где разом все поссорились\nЭто называют феодальная разбробленность\nВ будущем решим с тобою этот вопросик\nТолько не сейчас, а в следующем видосе.\n\nВроде бы всё на сегодня кенты\nТы пишешь комменты, мы пишем биты\nНадеюсь сердечки ваши задели\nЧерное Олово, Смит Эля');
INSERT INTO razvit.song VALUES (7, 1, '2023-10-24', true, 2, 'Первые князья', NULL, 4, 'ru', 2020, 'https://www.youtube.com/watch?v=gxc1IcjnsUk', NULL, 'Всё, больше молчать нельзя,\nТема нашего урока – первые князья.\nИсточник инфы своё знает место –\nПовесть временных лет, где автор Нестор.\n\nВ 862 году было призвание варягов, я тебе не вру.\nВ Белоозере Синеус, в Киеве Аскольд и Дир, \nТрувор в Изборске тоже грамотно сидит.\n\nПервым князем на Руси считаем мы Рюрика – славяне кривичи призвали, чудненько,\nПравил в Ладоге, но это всё ясли, \nПосле Новгород – там поднялся.\n\nС 79 по 912 Вещий Олег правил, как могли бы догадаться.\n882 год – государства Древнерусского рождения, вот.\nДела было так: был поход на Киев,\nПо пути Смоленск ещё мы захватили.\nАскольда и Дира выманил и уничтожил.\nКиев и Новгород – объединяться можем.\n\nДа будет Киев матерью городам русским!,\nВнутри всё классно, а с наружи, допустим,\nВ 907, потом спустя 4 года, на Византию двигал Олежа походы,\nИ двигал он, видимо, вообще не зря,\nДоговор подписан – мы теперь друзья.\nТорговля без пошлин – это точно нужно, возможность найма русских в византийскую службу.\nРазвитие торговли, угрозы нападения, союзы племенные, социальное расслоение, экономическая и плюс неравенство – \nВот так вот государство и получается.\n\nИгорь – это Рюрика сын,\nИ я не знаю, что конкретно не так было с ним,\nНо с 12 и по 45 правил Русью, будто курица лапой.\nВ 15 году с печенегами мир,\nПоходы к византийцам бесполезные, блин,\nПолюдье было для сбора дани,\nКнязь Мал и древляне Игоряна убрали.\n\nЯ вас прошу, не сжигайте только\nПосле Игоряна будет править Ольга,\nС 45 по 62, мстим за мужа, туториал такой:\nЗаживо древлян погребаешь, раз,\nПотом сжигаешь с ними бани, не поможет таз,\nЗатем во время тризны ты бьешь всех насмерть и сжигаешь Искоростень тупо насмерть\nПолюдье в 45 поменяют на повоз,\nУрок – размер дани, место сбора – это погост.\nТиун – это княжеский управляющий.\nВ 57 крестилась я ещё.\n\nС 62 по 72 Святослав, сын Ольги, правил молодой страной,\nАлександр Македонский русской истории –\nМы с Карамзиным тут даже не спорили.\nПобедил вятичей данью наказав,\nЗемля тебе пухом, Хазарский каганат,\nТмутаракань, ну перестань,\nСвятослав захватывает Тмутаракань.\nПотом с 70 по 71 баттл с Византией нам потрепет нервы.\nВ 71, для наших прикол, договор подписан в городе Доростол.\nРусь теперь обязана века Византии,\nВ походах на помощь отказ запретили,\nСвятослав, домой доберешься сам.\nПо пути его грохнул Куря хан.');
INSERT INTO razvit.song VALUES (8, 1, '2023-10-24', true, 2, 'Рэп про восточных славян', NULL, 4, 'ru', 2020, 'https://www.youtube.com/watch?v=G3sg7w456Qc', NULL, 'Восточные славяне это тема намбер ван. \nДавай устройся поудобней, мой маленький падаван.\nМы буквально по кусочкам эту тему разберём. \nИ если ты готов нырять - то погружение начнём! \n\nСлавян относят к индо-европейской семье,\nА восточная их часть это предки тебе.\nТипо варяги на севере, финно угры - восток, \nВизантия - на юге, наши соседи - рил-ток.\n\nВятичи, древляне, полочане, радимичи, \nДреговичи, поляне, северяне и кривичи, \nИльменские славяне - это всё племена. \n\nТеперь к занятиям славян перейдём, господа. \nПодсечно-огневого земледелия суть, \nКогда деревья вырубают - удобряется путь. \nА если траву выжигают и зола - удобрение, то это переложное, чёрт возьми, земледелие. \n\nЕщё они охотились: рыбалка, пушнина. \nТакже скотоводство: козы, овцы и свиньи. \nНо в пищу шли репа, капуста, пшеница. \nСоха, плуг и серп тебе могли пригодиться. \n\nБез торговли точно некуда. \nВывозили мёд, пушнину ну и лоскут. Да! \nА на импорт шли специи, оружие, вино. \nИ для бартера путь стоит уже давным давно!\n\nИз варяг греки через озёра и реки\nСоединили вовеки Европы север и юг!\nОт Балтийского моря идо Чёрного моря\nДревнерусские дяденьки за товаром снуют!\n\nМоре Балтийское, речка Нева, озеро Ладожское, Волхов река, озеро Ильмень\nПосле - Ломоть и Днепр\nЧёрное море служит финишем этим! \n\nНовгород и Киев были в центре торговли. \nВ целом города теперь у рек часто строили,\nТорговые пути ведь проходили по рекам.\nТушить пожары легче, как и сдерживать набеги!\n\nТолько видом выключать ты постой!\n\nРасскажу я сейчас про общественный строй.\nСначала была родовая община - \nРодственники с общим хозяйством не кинут. \nСоседская община или вервь состояла из несвязанных родством больших семей. \nПлеменной союз это конечно далеко блин не царство, это было незадолго до государства! \n\nУ князя были функции помимо военной: ещё религиозная и даже судебная! \nВече это сотка только взрослых мужчин. \n\nДавайте соберемся все и вопросик решим! \n\nДружина это войско князя, их не беси - \nОни лучшие из лучших были в древней Руси. \nИз мирного народа если будет сплочение - \nЭто войско назовется народное ополчение! \n\nА что у них за вера в целом, ваше величество? \nУ славян восточных кстаии это было язычество - там обожествляли окружающий мир. \nИ полетеизм, я чуть не забыл! \nПерун это бог молний и грома. \nСтрибог - бог ветра, что тоже знакомо. \nВелес кстати это бог скотоводства. \nНу а Ярило - бог весеннего солнца. \nМакошь - плодородия кстати богиня. \nСолнечный богто Даждьбог, мы примем. \nВолх это жрец, что служит народу. \nИдол - предмет поклонения богу. \n\nНадеюсь, что инфой вы насытились здорово\nС вами Эля Смит и Черное Олово\nМожет ты напомнил историей голову? \nС вами Эля Смит и Чёрное Олово');
INSERT INTO razvit.song VALUES (9, 1, '2023-10-24', true, 2, 'Раздробленность древней руси', NULL, 4, 'ru', 2021, 'https://www.youtube.com/watch?v=LqupNfb35Hc', NULL, 'Сегодня мы с тобою затусим\nПредставляю вам раздробленность древней Руси.\nСложно по учебнику? Но не парься ты:\nИстория гораздо интересней под биты\n\nСперва две теории рассмотрим с тобой\nАнтинорманнская с Норманнской рамсили меж собой. \nЗа норманистов Миллер, Шлецер и Байер\nРыбаков и Ломоносов против выступали.\n\nНорманнисты думали что Русь слово норманнское\nПрям из Скандинавии варяги иностранцы и\nЭта теория есть в прям в ПВЛ\nСлавянский человек страну создать бы не сумел.\n\nУ Антинорманнистов Русь славянские корни.\nВаряги эт славяне с Балтийского моря\nУ них в девятом веке тоже не было страны\nКлассные теории, не спорю пацаны.\n\nНо нельзя вообще без компромисса\n(Теория была и у центристов.)\nНо рассмотреть нужно нам попытаться\nПризнаки цетрализованного государства.\n\n(Единый правитель, территория единая)\nОдна столица и законы общие приняты\nТак же центральные органы власти\nРаспад на территории - уделы, ну здрасте.\n\nМеждоусобицы, боярства укрепление \nКиев как центр уменьшил значение\nУпадок пути из варяг в греки\nТакие вот причины раздробленности чекай.\n\nРазвитие торговли и рост городов,\nНовые земли для сельских работ.\nРазвитие хозяйств и культуры затусит\nЭто типа раздробленности плюсы.\n\n(Дробление земель, ослабленье обороны)\nЭто минусы разбитой короны.\nВместе со мной на территорию глянь \nПервая Владимиро-Суздальская земля.\n\nЛесистый край, много плодородной почвы\nТорговый волжский путь проходит между прочим\nПостоянный приток населения с Юга\nПервый правит князь Юрий Долгорукий.\n\nПеренес столицу в Суздаль из Ростова\nДимитров и Звенигород основаны, здорова\nТыща сто сорок семь- упоминание Москвы\nС волжской Булгарией активно рамсил.\n\nЕсли у тебя видение как у него скорей\nТебя стану называть я Боголюбский Андрей.\nПеренес столицу из Суздаля в Владимир\nПодчинил Новгород и нафиг сжёг Киев.\n\nЧерное Олово - ник ничего\nНо как тебе Всеволод Большое Гнездо?\nВеликий князь Владимирский себя так звал чудик \nПосле него Всеволодович Юрий.\n\nРеспублика у Русских? По-моему, бред\nОна была на Новгородской земле.\nОтрасли ведущие - торговля с ремеслом.\nЗемледелие слабое, просто ни о чем.\n\nКнязь у Новгородцев для войны и налогов\nА Вече же решало больше намного.\nВладыка за казну и за церковный суд.\n300 золотых поясов тут как тут.\n\nНа пересечении торговых путей,\nПлюс боярство здесь весомо сильней.\nНовгород от Киева в дали находился\nИменно поэтому и отсоединился.\n\nГалицко-волынское, каков ваш спектр?\nМы - пашенного земледелия центр.\nГорода растут, и торгуем, друзья\nС Киевом терки, но че там князья?\n\nВ чем смысл? Ярослав Осмомысл \nКняжества Расцвет, ты это осмыслил?\nДальше правил Мстиставич Роман\nВолынскую и Галицкую земли собрал.\n\n(Галицкий Данилка Киев вот занял\nКак король Руси венчается Даня)\nПри нем вот прям наивысший расцвет\nПочему про Киев до сих пор текста нет?\n\nКиевское княжество просто в упадке\nЗемлю истощили набеги и нападки.\nСтоя на окраине очень уязвим.\nЕщё другие княжества борются с ним.\n\nДа это хит, прям на бит Эля Смит\nНакидала мне инфы и я читаю как биг.\nМы инфу, ты коммент, всё вроде бы поровну\nДля тебя читал тут Черное Олово.');
INSERT INTO razvit.song VALUES (10, 1, '2023-10-24', true, 2, 'Монгольское нашествие', NULL, 4, 'ru', 2021, 'https://www.youtube.com/watch?v=Ggb_Osm6jjY', NULL, 'Рус телен мин беркайчан да онытман\nТатар телендә укыйм like елгалар.\nКоткарылмаслар минеке кошлар\nЧөнки очам on the beat, ир-рат.\n\nДа, ща я зачитал на Татарском\nЗнаю, это было довольно ужасно\nСпорим, такое не найдете вы в книгах\nЗапрещаю говорить Ордынское иго.\n\nТринадцатый век, и монголы в степях\nЗахватили племена соседних ребят.\nВ тыща двести шестом на курултае\nТемучина Чингисханом провозглашаем.\n\nИ понеслось блин : якуты, буряты, \nКиргизы, и северный Китай вот помятый\nСредняя Азия плюс Закавказье и \nДальше про Русь уже буду рассказывать.\n\nТысяча двести двадцать третий\nМожет, достойно монголов встретим?\nТри Мстислава плюс хан Котян\nДжэбэ с Субедэем напротив там.\n\nПроиграли\n\nА потому что надо\nБыть единым войском, что логично, правда\nПоловцы, начали союзников грабить\nФляга свистит и никак не исправить.\n\nДа, монголы оказались хитрей\nЗаманили наших в глубины степей\nПлюс полководцы крутые и в общем\nАрмия противника банально блин больше.\n\nЧто? Слова тут непонятные, скверные?\nЧтож, давай с тобой рассмотрим ща термины.\nХан - правитель орды золотой\nЧисло - перепись населения, бой.\n\nБаскак - представитель орды у захваченных\nВыход - это дань, Русский, выплачивай.\nГрамота на княжение - ярлык\nНадеюсь к такой скорости ты уже привык.\n\nУ Чингисхана был внук - Батый\nИ с его походами мы перейдем на ты.\nЭто по сути огромный квест\nПредставляю вам трип из захваченных мест\n\nВолжская булгария, Княжество рязанское\nКоломна, Москва Филипп Нянька, здравствуйте\nВладимир, Суздаль, Битва на Сити\nКозельск семь недель держался, спасите\n\nПереяславцы, Черниговцы после\nКиевское Княжество и Галич тут вот с ним\nНу и возвращение в низовье Волги\nДа, этот путь был трудным и долгим.\n\nЧё до Новгорода вы не дошли?\nНас стало меньше, весна плюс шалит\nЗапасы кончались, если быть точным\nДа и на севере кочевникам не очень\n\nТысяча двести сорок три\nОрда Золотая, вот же, смотри!\nЭто ж надо было так монголов поднять\nБатый ты красавчик, ну-ка дай пять.\n\nЧтобы тут править нужны ярлыки\nВыход обязан платить, ну прикинь.\nРемесленников угоняли прямо в Орду\nВ политике княжеств я место займу\n\nРазорены десятки городов\nМинус население, культурный покров\nСорван, экономику торговлю тормозят\nБыт друг на друга тут не может не влиять.\n\nЭто вроде всё на сегодня\nИнтеллект за видео поднял?\nЭтот видос пускай на транслит\nЧёрное Олово Эля Смит.');
INSERT INTO razvit.song VALUES (11, 1, '2023-10-24', true, 2, 'Культура древней руси', NULL, 4, 'ru', 2021, 'https://www.youtube.com/watch?v=nWRZyAj9Nxo', NULL, 'От жития и до древнего Урбана\nЯ Дикаря превращаю в культурного.\nБыть бескультурным?Боже, упаси\nЭто Культура древней Руси.\n\nМы с литературы с тобою начнём\nАзбука? Кирил и Мефодий - зачёт.\nУ меня тут парочка различных книжуль\nПодходи поближе ща я все покажу.\n\nЭто новгородская берестяная грамота\nСлово о законе и благодати надо вам?\nСлева Остромирово Евангелие\nВыговорить все это смог еле еле я.\n\nПовесть временных лет, знай свое место\nНаписал в 12 веке тебя Нестор.\nВ этом же веке перевод Александрии\nПро Македонского тогда переводили.\n\nЭй, хрущевки и сталенки в урну\nРазвивайся архитектурно.\nМне бы вам про церкви инфу донести\nВот кстати крестово-купольный стиль.\n\nЦерковь десятинная - каменная первая\nВладимир после Корсуни решил - идея верная.\nВ Киеве стояла, Десятину платят церкви\nИ была построена она в десятом веке.\n\nЗнаю, вы наверное морально не готовы\nЩа будем различать Софийские Соборы\nВ киевском зелёные будут купола\nВ новгородском серые, вот это да\n\nЕсли тебе кажется - перекрестись\nИконы писали вот и вся жиповись.\nВот - мозаика Богоматерь Оранта\nЗнамение Пресвятой Богородицы вам тут.\n\nБез драгоценностей жить очень грустно\nРасцветало здесь Ювелирное искусство.\nСкань - узор из проволки , зернь - из шариков\nЭмаль перегородчатая - ячейки заполняют там.\n\nТермины по классике: начинаем спич\nПлинфа - это тонкий обоженный кирпич\nЧернь это смесь серебра свинца и меди \nЗодчество - искусство зданий возведения.\n\nБереста - это кора, сверху на берёзе\nПергамент - то на чем писали, серьезно.\nФреска - рисованье по сырой штукатурке\nЧто у нас своё, а что из чужой культурки?\n\nНаше это вот былины,двоеверие\nТак же сказанья, ювелирные изделия\nКниги, иконопись мозаика и фреска\nЭто византийское насколько мне известно.\n\nЭто конец просвещенного тура\nШаришь теперь, что такое культура.\nЗдесь Эля Смит и Чёрное Олово\nПреподнесли информацию снова вам.');
INSERT INTO razvit.song VALUES (12, 1, '2023-10-24', true, 2, 'Нашествие запада', NULL, 4, 'ru', 2021, 'https://www.youtube.com/watch?v=2DXwXygnhkQ', NULL, 'Русь, тебе орды маловато?\nВ это дело залетает загнивающий запад.\nВы католики, да там? Погодите ребята\nПравославно покарать вас надо когда-то.\n\nНачнем.\n\nСразу на Прибалтику глаз положим\nКатолицизм задвигать ты решил?\nТипа мы захватим кучу кучу новых земель\nДа ещё контроль ваших торговых путей.\n\nЗамутить просто Орден тевтонский\nЭто получилось в тыща сто девяностом.\nРигу основали в тыща двести первом\nЧерез год орден меченосцев будет сделан.\n\nВ тысяча двести тридцать седьмом\nОрден Ливонский ворвётся в твой дом.\nС русью баттлить причина веская\nЧерез три года будет битва Невская.\n\nБиргер за Шведов версус Саня Ярославич\nГаврило Алексеич на корабль уже скачет.\nМинус воевода и даже епископ\nПришли по шведски, ушли по английски.\n\nВроде победил ты Саша врага\nНо мы изгоняем тебя братик пока.\nИзборск и Псков захватили Ливонцы\nСаня, ты в порядке? Может вернёшься?\n\nТыща двести сорок два - баттл будет тот ещё\nЕго будут называть Ледовое побоище.\nВы совсем поехали с такими-то доспехами\nСвинья вас разобьет пора прощаться вам с успехами.\n\nДа судить уже не мне но это поражение\nЛивонцы уходите ведь проиграно сражение.\nДа ты просто лох, фу. Саня просто бог тут\nС пикчей святой ему выдайте кофту.\n\nРусь, ну никак спокойно жить вам\nК нашим проблемам плюсом Литва.\nМиндовг сделал страну себе изи\nРюрик бы лайкнул, чисто блин жиза.\n\nРусь и Литва заколлабились знатно\nИ нам про помощь нужно узнать, но\nЛитва помогла Руси объединиться?\nЩа аргументы должны появиться.\n\nОбычаи в сохранности, дань небольшая\nЗащита от орды нападений решает.\nРусский язык - государственный даже\nИ православие не ущемляют наше.\n\nЛитву как католиков как бы крестили\nНациональный гнёт was its really.\nПротив княжеств союз с Ордой\nАргументы против себе открой.\n\nБольше активности вашей процент\nЛайк, подписка и даже коммент.\nМы тут родные с вами, ну что же\nВ сердце - Эля, на бите - Лёша.');
INSERT INTO razvit.song VALUES (13, 1, '2023-10-24', true, 2, 'Усиление Москвы часть 1', NULL, NULL, 'ru', 2021, 'https://www.youtube.com/watch?v=ZJ5ud3R3qe8', NULL, 'Зачитаю про Москву\nСобянин постой \nЭти дяди двигались где-то лет сто\nСадись и не стой, ручка, листок\nРазвитие княжества чекай исток.\n\nПричины единения русских земель\nНам разобраться будет ща цель.\nОсвободиться бы нам от орды\nРоль князя повысилась: больше владык!\n\nЕдинение национального сознания\nРазвитие торговли, экономики терзания\nПравовые нормы и единый язык\nНу и к православию народ наш привык.\n\nПричины возвышения чекай теперь\nНаходилась у торговых прямо путей\nТвердый порядок наследства престола\nЦерковь берет Москву за основу.\n\nДэн Александрович, Невского сын\nВзял и Коломну присоединил,\nПереяславское княжество сможет\nВо Владимир на Клязьме Митрополита тоже.\n\nЮрий Данилыч, с математикой Найс:\nСмело плюсуем город Можайск.\nЗнаю, ты ждёшь, стоишь у двери:\nВот тебе Баттл Москвы и Твери.\n\nЮра на Кончаке ради ярлыка женился\nМиша Ярославич тверской разозлился.\nПрям под Бортенево Тверь победила\nЮра - в Орду, Кончака - в могилу(\n\nОклеветал Михаила Юрец\nОрда не прощает - Мише конец.\nДмитрий Грозные Очи - месть вам\nЮру убьет, а его убьет Хан.\n\nАлексей Михалыч в Твери теперь правит\nТолько Чолкан всё с грязью мешает.\nПротив Орды Тверь восстанет, но тут\nКалита подавит: он за Орду.\n\nРатата - Иван Калита\nЕсли братва - то только Орда.\nОн корешился с Ордой очень тесно\nМитрополит - в Москве твоё место.\n\nПосле Вани был гордый Семён\nСын Калиты, нужно больше имён!\nЕщё один сын это был Иван Красный\nС Ордой на коннекте, баттлить опасно.\n\nВот такая Московская власть\nЭто кстати только первая часть.\nДальше больше, а как вы хотели?\nЧёрное Олово, Смит Эля.');
INSERT INTO razvit.song VALUES (14, 1, '2023-10-24', true, 2, 'Усиление Москвы часть 2', NULL, NULL, 'ru', 2021, 'https://www.youtube.com/watch?v=h13EnReePNg', NULL, 'Хочешь подгоню вторую часть? Ведь\nРазвлекаться можно, учась, ееее\nКняжество Московское кто привознес?\nИменно об этом будет этот видос.\n\nДмитрий Донской паренек молодой\nМитрополит Алексий был правой рукой.\nКстати Литовщина: мы даём бой\nПротивостояние будет с Литвой.\n\nСоветую погромче прибавить бит вам\nЯ затру тут за Куликовскую битву.\nДимка Донской версус Темник Мамай\nЧто там по силам, давай оглашай!\n\nВраг заключил договор с Ягайло \nИ Олег рязанский типа помогал но\nДима был Сергием благословлен\nПлюс ещё засадный полк оказался силён.\n\nПобедили, мы win. Нам не нужно причин\nЛишь значение победы ща запечатлим.\nГлавные силы Орды разбиты \nТеперь как общерусский князь будет Дмитрий\n\nМощный подъем нациального сознания\nДань ненадолго оставила терзания.\nТеперь как центр Москва укрепилась\nХан Тохтамыш, а чё там случилось?\n\nВасилий Дмитрич это твой квиддич\nПосле Донского на престол выйдешь\nХан, извиняюсь, прошу прощения\nЯ у тебя не возьму разрешения.\n\nПрисоединение ниженовгородского\nПлюс ещё нашествие Тамерлана жёсткого.\nПосле его смерти начинаются усобицы\nИ тогда на ханства поделить условятся.\n\nВот вам нашествие хана Едигея\nБитву Грюнвальдскую, если хотели.\nУ меня тут ещё много дат.\nЯ ещё много могу вам отдать.\n\nФеодальная война страшно звучит\nПредлагаю это отдельно учить.\nНо вот ещё будет Вася Тёмный\nРПЦ автокефальна, че мне.\n\nВот с Мск мы закрыли вопрос\nЭто второй был по счету видос.\nДальше - больше. За хитом хит\nЧёрное Олово, Эля Смит');
INSERT INTO razvit.song VALUES (15, 1, '2023-10-24', true, 2, 'Культура послемонгольской Руси', NULL, NULL, 'ru', 2021, 'https://www.youtube.com/watch?v=98FEDb_g438', NULL, 'Культура до и послемонгольской Руси\nТуром будем с вами по местам колесить.\nОт соборов и до икон всяких\nЭтот видос юбилейный, десятый. \n\nГеоргиевский собор Юрьева монастыря\nЦерковь Спаса на Недерице смотрит на тебя\nДмитриевский Собор и Золотые Ворота\nУспенский собор во Владимире вот он.\n\nПосле монголов другие постройки\nТроицкий Собор вот с вами рассмотрим.\nСпас на Ковалеве, Спас преображения\nЧто ещё сказать? Уважение.\n\nБудет слово о погибели земли русской\nСказание о Мамаевом побоище? Допустим\nХронографы и повести с нами познакомились\nА теперь коронная фраза: иконопись.\n\nФеофан грек был тупо гуру фресок\nСписок из работ его довольно интересен.\nАрхангельский Собор, Благовещенский ещё\nЦерковь Рождества Богородицы в зачёт.\n\nАндрюха Рублев - русский иконописец\nТроица в Троице Сергиевом висит.\nФрески - Звенигород Успенский собор\nИконы в Московском благовещенском - норм.\n\nКроме Рублева был ещё иконописец\nОн как Денис но только Дионисий.\nИосиф-волокамский расписал монастырь\nДа и Ферапонтов не остался простым.\n\nВоинская повесть, публицистика, хождения\nХожденье за три моря, жаждим продолжения\nЧетьи-Минеи, Домострой, Третий Рим\nСтепенная книга прибавилась к ним.\n\nВ тысяча пятьсот шестьдесят четвертом\nКнигопечатание встанет твёрдо.\nПервая печатная книга - Апостол\nКниги копировать стало так просто!\n\nВроде православие живо и здорово\nТолько начались религиозные споры.\nНа два лагеря ребята разбились \nСмотри поподробнее че получилось.\n\nНестяжатели, с ними Нил Сорский\nПротив имущества церковного жёстко.\nИосифляне с Волоцким Иосифом\nИмущество церкви просто так не бросили.\n\nТёрки тёрками, чё вы как дети?\nИосифлян поддержал Василий Третий.\nМинус нестяжатели, имущество оставим\nЦерковь богата, другою не станет.\n\nВот и десятый видос на разгон\nМы завершаем первый сезон\nДальше ЕГЭ и каникулы, здорово?\nСпасибо за всё: с вами Эля И Олово!');
INSERT INTO razvit.song VALUES (16, 1, '2023-10-24', true, 2, 'Эпоха Ивана Грозного', NULL, NULL, 'ru', 2021, 'https://www.youtube.com/watch?v=SJQKXdMoXjk', NULL, 'Это Ваня Грозный на бите!\nНа Руси точно был тогда авторитет.\nИ его менталитет \nМы поизучаем чё бы нет\nТак что не сиди и выкупай этот куплет.\n\nЕсли подойти довольно близко\nТо начать стоит с Елены Глинской.\nДа, она была регентом Вани\nДенежную сферу немного поправим.\n\nС тридцать восьмого по сорок седьмой\nБельские с Шуйскими правят страной\nТолько Ванёк подрос немного\nИ сразу открылась на трон дорога.\n\nТысяча пятьсот сорок семь\nВенчание на царство - да, мы обнаглели совсем\nФри от орды, Византийские корни\nЕдинство страны, надеюсь, запомнил.\n\nКурбский Адашев, Макарий Сильвестр\nВместе с Висковатым эти парни известны.\nИзбранная рада, приближенные вроде\nГрозному точно ребята подходят.\n\nЗемский Собор, Собор примирения\nВ 49 его день рождения\nВысший сословно представительный орган\nЦарь за приказы, да, это годно.\n\nЗемский Пушкарский Поместный Ямской\nСтрелецкий Разрядный и Приход Большой\nПосольский Разбойный и Челобитный\nЭто приказы, тебе выучить их бы.\n\nГубная и Земская будут реформы\nМинус наместники, стало просторно\nТак же отмена системы кормлений\nБольшая соха - налог поземельный.\n\nЧё по войне? Уложенье о службе\nВойско стрелецкое чисто по дружбе.\nИзбранная тысяча тоже будет скоро\nТак же запрет местнических споров.\n\nВ тысяча пятьсот пятьдесятом году\nНовый судебник я смело приму.\nТам наказание строго за взятки\nРазмер пожилого выше в порядке.\n\nЗемлевладелец в ответ за крестьян\nЛюдям лихим тяжелее чем нам\nПраво наместников мы урезаем\nКстати, Стоглав ещё составляем.\n\nЩа пробежимся мы быстренько туром\nЧто там в политике было структурой.\nСверху был царь, там боярская дума\nЗемский Собор, приказы, старосты будут.\n\nДумали что второй части не будет\nВпереди более прикольные люди\nНу а пока интерес тут горит\nЧёрное Олово, Эля Смит.');
INSERT INTO razvit.song VALUES (17, 1, '2023-10-24', true, 2, 'Смута часть 1', NULL, NULL, 'ru', 2021, 'https://www.youtube.com/watch?v=xfeR4qagois', NULL, 'Хочешь навести суету?\nСтрану пошатать типа эту и ту\nИ потом на Ютуб \nПрямо к Эле Смит на канал, \nРолик про смуту тут как сериал.\n\nНачинаем\n\nУбеждение как тут старше стать\nУчреждение патриаршества, да\nТысяча пятьсот восемьдесят девятый\nУглическое дело чета непонятно.\n\nТут довольно много разных версий\nОтносительно Димки смерти.\nСлучай несчастный или убийство\nЛибо Лжедмитрий вот так сохранился.\n\nКризис, опричнина, минус династия\nПлюс самозванцы такие ну здрасьте\nБоярство активно, голод массовый круто\nЧто ещё нужно? Встречайте: смута.\n\nБоря Годунов - первый выборный царь\nФёдор Иванович тут рядышком встань.\nИрина вдова, Патриарх Иов\nКаждый Бориса тут выбрать готов.\n\nДворянских детей учить за границу\nХлопка Косолапа движуха случится.\nЮрьев день снова и беглых крестьян\nБольше не ищем, спасибо Борян.\n\nПосле Лжедмитрий, пока ещё первый\nБеглый монах, звали Гришка Отрепьев\nКак настоящий блин депутат\nПообещать всегда будет рад.\n\nРусь в католичество - Римскому папе\nСеверск Смоленск - Сигизмунду покатит\nМнишеку Новгород, Псковские земли\nГрамоты прелестные крестьянам тут внемлет.\n\nНачал в Москву было двигать Димон\nНо при Добрыничах жёсткий облом\nСмерть Годунова была очень кстати\nМать сына признала, и хватит.\n\nНо на престоле не всё было гладко\nРусских традиций не чтил новый папка\nПлюс обещания выполнить влом\nИ со свободой крестьянской облом.\n\nБлаго появился тут Шуйский Василий\nСможет Лжедмитрия быстро осилить\nЗаговор сделав, минус Димас\nК Шуйскому Васе царская власть.\n\nПоловина смуты прошло за видос но\nВторая часть будет более сносной\nЭля Смит и Чёрное Олово \nРэп плюс история, всё вроде поровну.');
INSERT INTO razvit.song VALUES (18, 1, '2023-10-24', true, 2, 'Смута часть 2', NULL, NULL, 'ru', 2021, 'https://www.youtube.com/watch?v=e-RHdRc67xA', NULL, 'Это снова Смута, часть номер два\nЗалетай и слушай, ну же, братва.\nЕсли ты подумал будто мы не продолжаем гнуть линию \nПересматривать приоритеты пора.\n\nШуйский Василий на Земском был выкликнут\nКрестоцеловальную запись нам выкатил.\nБоярства привилегии сохранить нужно\nБез суда не казнить, доносы не слушать.\n\nВосстание Болотникова да это бунт\nБоярским царём недовольные тут\nПлюс крепостное ужесточили.\nНа престол природного царя, пусть чилит.\n\nДвинем с Путивля, осада Москвы\nПосле битва у деревни Котлы.\nВойско Петра, после в Тулу был Трип.\nСпустя 4 месяца Болотников рип.\n\nО крестьянах уложение быстро\nЦелых 15 лет срок сыска.\nВот и Лжедмитрий версия два\nВместе с заруцким строит войска.\n\nВ Тушино встали, наделал чё ты\nТут начались Тушинские перелёты.\nПосле самозванец в Калугу бежал\nЛагерь распался, Диму не жаль.\n\nСемибоярщина после Шуйского правит\nИз Польши Владислав компанию составит.\nСигизмунд третий не прочь на престол, плюс\nКарл Филипп на себя тянет пояс.\n\nПервое народное ополчение\nТрубецкой Заруцкий Ляпунов гении:\nКазаки Заруцкого грабить нарвались\nУбили своего, вот так и распалось.\n\nВторое ополчение Пожарский и Минин\nСовет всея земли, Ходкевич вот с ними\nРешил потягаться, но проиграл:\nВновь у Москвы тут свободен штурвал.\n\nСмуты итоги рассмотрим щас, чё мы\nРазорены тут многие районы.\nПромыслы минус, ремёсла в упадок\nВ казне у страны вообще непорядок.\n\nЗемский Собор, вот все претенденты\nРоманова выбрали боярские агенты\nМолод, природен и родовит\nОтец Филарет это в принципе чит.\n\nСмутное время не вышло у Окси\nНо не грусти, если честно то бог с ним\nВ рэпе есть лучше эпохи лонгрид:\nЧёрное Олово, Эля Смит.');
INSERT INTO razvit.song VALUES (19, 1, '2023-10-24', true, 2, 'Михаил Романов', NULL, NULL, 'ru', 2022, 'https://www.youtube.com/watch?v=B9fFczmCPc0', NULL, 'Время смуты всё, но не выдыхаем чё стоишь\nНа повестке сегодня Михаил Фёдорыч.\nЧтобы всё пофиксить нам нужен спец, но\nПерезаряжай династию и летс гоу.\n\nТысяча четырнадцать тут летит башка\nКазнены Заруцкий и ворёнок Ивашка.\nСтолбовский мир семнадцатый Новгород вернули\nВосемнадцатый перемирие Деулинское\n\nС кое-какими силами Филарит из плена\nВозвращается и сразу Патриархом не проблема.\nАктивная деятельность Земского собора.\nMake Russia Great снова.\n\nНовые писцовые книги для налогов\nСлобода немецкая отдельным народам\nСоздание полков иноземного строя.\nУрочные лета мы увеличив расстроим\n\nКрестьян реформа местного самоуправления \nЗатронула старост воеводы вдруг заменят их\nА тут ещё и мануфактуры появились\nЗаволжская с Сибирской землёй присоединились.\n\nРемесло перерастает в рыночное производство\nМастерских ремесленных много разведётся.\nЕщё один тезис сразу выдать готов прям\nЧто рядом с рынком? Правильно: торговля.\n\nФормирование рынка всероссийского\nЯрмарки Архангельская или Ирбитская.\nРазвитие торговли как экспорт так и импорт\nТорговый устав мелкие пошлины вынь тут\n\nВ новоторговом далее уставе\nИностранные купцы оптом продавали\nВысокие пошлины импортным товарам:\nЧтобы от налогов России был навар им.\n\nЧто у нас на западе? Смоленская война\nБились с Поляками в эти вот года.\nПричина вернуть себе свои земли\nСигизмунд умер значит битва не дремлет.\n\nМихаил Шеин осаждает Смоленск но\nТерпит неудачу и Владислав главенство\nВ этом конфликте сразу занимает\nПоляновский мирный договор заключают.\n\nЧто насчёт Юга, ваше превосходительство\nЗасечной черты Белгородской строительство.\nАзовское сидение - казаки Азов заняли\nНо Земский собор и ко его в Россию не взяли.\n\nНовая эпоха всё будто бы заново\nВот такой вот опыт у первого Романова.\nПесня про Столыпина? Будет, но не скоро вам\nТут Эля Смит и Чёрное Олово.');
INSERT INTO razvit.song VALUES (20, 1, '2023-10-24', true, 2, 'Алексей Михайлович Тишайший', NULL, NULL, 'ru', 2022, 'https://www.youtube.com/watch?v=_XGQ5jSIv9w', NULL, 'Как говорится: что было дальше?\nНа повестке Алексей Михайлович Тишайший.\nНу и врун ты, там же были бунты\nНо зато без военной суеты.\n\nЗемских соборов здесь куча такая: давай разгребать заново\nПерелезаем через соборы с Алексеем Романовым.\n\nНа одном из боярских схождений\nПриняли Соборное мы уложенье.\nТысяча шестьсот сорок девятый:\nКомиссия с Никитой Одоевским, ребята.\n\nЮрьев день к черту, минус срок сыска\nКрепостное право закрепляем мы быстро\nВотчина с поместьем? Одно и тоже\nПрава всех сословий разложим\n\nПричины закрепощения крестьян\nВласть царя сильней, опора в виде дворян.\nМалообразованность, мануфактуры в массы\nДа и экономику поднять будет классно.\n\nВ церкви движуха куда интереснее\nРевнители древнего благочестия.\nКто-то за трушные русские книги\nА кто-то в греческих правду увидит.\n\nНикон решил что это не норма \nДавайте проведем церковную реформу?\nКниги уничтожены, традиции поломаны\nСтранно что не нравится вам. Гнев не обоснованный!\n\nРаскол на лицо: слева Никон-балагур\nРаскольники и с ними Протопоп Аввакум.\nС церковью ок, но кажется будто\nЯ обещал вам поведать про бунты.\n\nПричины обилия подобных движений\nНалоговый гнет и закрепощение\nПопытка казаков ограничить и плюс\nЦерковный раскол, извини повторюсь.\n\nВ сорок восьмом был соляной бунт\nДальше Псков и Новгород тут\nВ тысяча шестьсот шестьдесят втором\nМедный бунт, и только потом.\n\nСоловецкое восстание: бог вам в помощь\nНу а Стёпу Разина ты точно запомнишь\nСтепа был против вот такой жизни\nНо как оказалось бунты это не изи.\n\nВремя сейчас такое что жить уже страшно\nИ Леха был Тишайший а век-то бунташный\nСтавь лайк пиши коммент и потом на репит\nЧёрное Олово и Эля Смит.');
INSERT INTO razvit.song VALUES (21, 1, '2023-10-24', true, 2, 'Культура 17 века', NULL, NULL, 'ru', 2022, 'https://www.youtube.com/watch?v=dp8vEckcaa8', NULL, 'Культура на Руси в семнадцатом веке\nОчень много нового, как в этом треке.\nЭти две минуты без душных речей\nНаливай чай, начинаем скорей.\n\nЧё по тенденциям? Тут обмирщенье\nСветская культура, моё почтение.\nВырастет наука тут и образование\nС западными странами связей влияние.\n\nО ерше ершовиче, о суде шемякином\nЭто всё сатира если не понятно вам.\nРифмологион, Вертоград многоцветный\nСимеон Полоцкий, учил царских деток.\n\nАвраамий палицин - автор сказания\nВременник написал Тимофеев Ваня и\nЮрий Крижанич напишет Политику\nВести куранты, вы посмотрите-ка.\n\nУ Славяно-греко-латинской академии\nБратья Лихуды основать давно хотели и \nРядом букварь Василия Бурцева\nПервая книжная лавка замутится.\n\nВ архитектуре тут тоже всё ок вот\nНовый стилёк называют барокко.\nВот посмотри, многоярусность, пафос\nВ целом нарядность, ставлю пять классов.\n\nНу и ещё узорочий стайл\nАссиметричность, арки, места\nТут изразцы, красный, белый кирпич\nМного декора, на каждой из пикч.\n\nЖивопись в плен от церковных оков\nСвой Артемий Лебедев: Симон Ушаков.\nВседержитель справа, слева вот троица\nПредлагаю быстренько с ними познакомиться.\n\nМежду иконой и светский портретом\nНекая Парсуна встала, а это\nШаг к чему-то светскому, как и везде тут\nПостепенно падают церковные запреты.\n\nВидишь ли история - не только политота\nБез искусства мы все превратимся в идиотов.\nТак что изучай, пока бьётся тут бит\nЧёрное Олово и Эля Смит.');
INSERT INTO razvit.song VALUES (22, 1, '2023-10-24', true, 2, 'Северная война', NULL, NULL, 'ru', 2022, 'https://www.youtube.com/watch?v=3nyknWiuyIk', NULL, 'Оу йе\nСеверная война сейчас на бите.\nTell about it? Why not?\nHere is Elya Smith, yee\nIf we''re talking about numbers, it''s twice ten.\nBlack Tin in your headphones, lets start god damn.\n\nДевяносто пятый, девяносто шестой \nАзовские походы прерывают покой.\nПервый поход, Шереметьев, провал\nГоловин Лефорт Гордон - Азов себе взял.\n\nСтроим там для укрепленья крепость Таганрог\nВеликое посольство - Европы островок.\nИщем знакомства для Турецкой войны.\nПлюс новые ремесла и умения нужны.\n\nВозницын Головин Михайлов Лефорт\nВ Германию Голландию Швецию вот\nСтрелецкое восстание: мы домой, Оки\nНо зато весомые получим итоги.\n\nВербовка иностранных специалистов\nКораблестроение как ремесло признать\nСоздание против Швеции союза\nЗакупку военных принадлежностей заюзать.\n\nВ тысяча шестьсот девяносто девятом\nАнтиШведский союз оформляй там.\nРечь Посполитая, Саксония и Дания\nНу и Россия, денем мы куда ее.\n\nКонстантинопольский с Турцией мир\nШвеции быстро войну объявим.\nБалтийское море нам было нужно\nШвеция Россия в Балтике не дружат.\n\nПервый этап называем мы Датский\nМы проиграли под Нарвой дурацкой\nЭто служит толчком к Реформам\nРеорганизуемся и вдарим повторно.\n\nПольский этап, Шведы Польшу хватают\nНаш Архангельск, Нотебург забираем.\nСтроим Питер и переносим столицу\nЯм Копорье Нарва Тарту присоединиться.\n\nВот он долгожданный русский этап.\nПолтавская битва - знаем итак.\nПолная победа России в войне\nШведам будет плохо после этого вдвойне.\n\nРост авторитета, вновь Северный союз\nС Данией братья, это тоже плюс.\nСледущий Турецкий этап был отвратный\nТуркам Азов возвращаем обратно.\n\nНорвежско шведский удачный весьма\nУ мыса Гангут победа была.\nНиштадский мир - в Балтийское путь\nРост авторитета, империя тут.\n\nПосле получим Каспийского запад\nНо всё это действия другого сетапа\nА на сегодня всё, лайк за английский\nБереги себя и своих близких.');
INSERT INTO razvit.song VALUES (23, 5, '2023-10-24', true, 2, 'История России в 30 стилях рэпа', NULL, 5, 'ru', 2020, 'https://www.youtube.com/watch?v=I-C1x_8UGtE', NULL, NULL);
INSERT INTO razvit.song VALUES (24, 5, '2023-10-24', true, 2, 'Всемирная история в 30 стилях рэпа', NULL, 5, 'ru', 2021, 'https://www.youtube.com/watch?v=0DI7iaDLw3w', NULL, NULL);


--
-- TOC entry 3737 (class 0 OID 29663)
-- Dependencies: 213
-- Data for Name: username; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.username VALUES (1, 'andrei', 'andrei@gmail.com', 'qwerty21334', '2023-10-02', 'Меня зовут Андрей. Учусь в ИТМО', 1);
INSERT INTO razvit.username VALUES (2, 'alisa', 'alisa@mail.ru', 'asdfghjkl3344', '2023-10-09', NULL, 3);
INSERT INTO razvit.username VALUES (3, 'alexey', 'alex@alexgyver.ru', 'alexsuper23443', '2023-10-15', 'Мой сайт - alexgyver.ru', 3);
INSERT INTO razvit.username VALUES (4, 'dima', 'dimon@mail.ru', 'dimasick2343', '2023-10-18', 'Я Димооон', 3);
INSERT INTO razvit.username VALUES (5, 'sasha', 'sanya@mail.ru', 'sansanych4432', '2023-10-20', NULL, 3);


--
-- TOC entry 3762 (class 0 OID 29877)
-- Dependencies: 238
-- Data for Name: website; Type: TABLE DATA; Schema: razvit; Owner: postgres
--

INSERT INTO razvit.website VALUES (1, 1, true, 'metanit.com', 'Обучение программированию');
INSERT INTO razvit.website VALUES (2, 1, true, 'tproger.ru', 'Обучение программированию');
INSERT INTO razvit.website VALUES (3, 1, true, 'foxford.ru', 'Образование');
INSERT INTO razvit.website VALUES (4, 1, true, 'learn.javascript.ru', 'Обучение программированию на JavaScript');
INSERT INTO razvit.website VALUES (5, 2, true, 'developer.apple.com', 'Программирование');
INSERT INTO razvit.website VALUES (6, 2, true, 'developer.mozilla.org', 'Программирование');
INSERT INTO razvit.website VALUES (7, 2, true, 'developer.chrome.com', 'Программирование');
INSERT INTO razvit.website VALUES (8, 4, true, 'alexgyver.ru', 'Сайт AlexGyver''а по электронике');
INSERT INTO razvit.website VALUES (9, 4, true, 'stepik.org', 'Образовательная платформа');
INSERT INTO razvit.website VALUES (10, 4, true, 'openedu.ru', 'Образовательная платформа');
INSERT INTO razvit.website VALUES (11, 5, true, 'codecademy.com', 'Обучение программированию');
INSERT INTO razvit.website VALUES (12, 5, true, 'sololearn.com', 'Обучение программированию');
INSERT INTO razvit.website VALUES (13, 5, true, 'quizlet.com', 'Карточки для изучения');
INSERT INTO razvit.website VALUES (14, 5, true, 'randomnerdtutorials.com', 'Сайт с туториалами по ESP32 и ESP8266');
INSERT INTO razvit.website VALUES (15, 5, true, 'readthedocs.io', 'Документации');


--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 232
-- Name: album_album_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.album_album_id_seq', 1, false);


--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 224
-- Name: article_article_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.article_article_id_seq', 7, true);


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 230
-- Name: author_author_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.author_author_id_seq', 1, false);


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 214
-- Name: band_band_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.band_band_id_seq', 1, false);


--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 226
-- Name: comment_comment_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.comment_comment_id_seq', 1, false);


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 220
-- Name: extension_extension_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.extension_extension_id_seq', 1, false);


--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 228
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.genre_genre_id_seq', 1, false);


--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 216
-- Name: mode_mode_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.mode_mode_id_seq', 1, false);


--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 222
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.order_order_id_seq', 1, false);


--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 210
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.role_role_id_seq', 1, false);


--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 218
-- Name: schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.schedule_schedule_id_seq', 1, false);


--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 234
-- Name: song_song_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.song_song_id_seq', 1, false);


--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 212
-- Name: username_user_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.username_user_id_seq', 1, false);


--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 237
-- Name: website_website_id_seq; Type: SEQUENCE SET; Schema: razvit; Owner: postgres
--

SELECT pg_catalog.setval('razvit.website_website_id_seq', 1, false);


--
-- TOC entry 3567 (class 2606 OID 29818)
-- Name: album album_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (album_id);


--
-- TOC entry 3559 (class 2606 OID 29764)
-- Name: article article_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (article_id);


--
-- TOC entry 3565 (class 2606 OID 29804)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- TOC entry 3545 (class 2606 OID 29688)
-- Name: band band_fk_user_id_key; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.band
    ADD CONSTRAINT band_fk_user_id_key UNIQUE (fk_user_id);


--
-- TOC entry 3547 (class 2606 OID 29686)
-- Name: band band_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.band
    ADD CONSTRAINT band_pkey PRIMARY KEY (band_id);


--
-- TOC entry 3571 (class 2606 OID 29870)
-- Name: channel channel_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (channel_id);


--
-- TOC entry 3561 (class 2606 OID 29778)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 3553 (class 2606 OID 29735)
-- Name: extension extension_fk_user_id_key; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.extension
    ADD CONSTRAINT extension_fk_user_id_key UNIQUE (fk_user_id);


--
-- TOC entry 3555 (class 2606 OID 29733)
-- Name: extension extension_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.extension
    ADD CONSTRAINT extension_pkey PRIMARY KEY (extension_id);


--
-- TOC entry 3563 (class 2606 OID 29795)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 3549 (class 2606 OID 29700)
-- Name: mode mode_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.mode
    ADD CONSTRAINT mode_pkey PRIMARY KEY (mode_id);


--
-- TOC entry 3557 (class 2606 OID 29749)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3541 (class 2606 OID 29661)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 3551 (class 2606 OID 29714)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);


--
-- TOC entry 3569 (class 2606 OID 29839)
-- Name: song song_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (song_id);


--
-- TOC entry 3543 (class 2606 OID 29674)
-- Name: username username_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.username
    ADD CONSTRAINT username_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3573 (class 2606 OID 29885)
-- Name: website website_pkey; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.website
    ADD CONSTRAINT website_pkey PRIMARY KEY (website_id);


--
-- TOC entry 3575 (class 2606 OID 29887)
-- Name: website website_url_key; Type: CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.website
    ADD CONSTRAINT website_url_key UNIQUE (url);


--
-- TOC entry 3587 (class 2606 OID 29819)
-- Name: album album_fk_author_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.album
    ADD CONSTRAINT album_fk_author_id_fkey FOREIGN KEY (fk_author_id) REFERENCES razvit.author(author_id);


--
-- TOC entry 3588 (class 2606 OID 29824)
-- Name: album album_fk_genre_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.album
    ADD CONSTRAINT album_fk_genre_id_fkey FOREIGN KEY (fk_genre_id) REFERENCES razvit.genre(genre_id);


--
-- TOC entry 3583 (class 2606 OID 29765)
-- Name: article article_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.article
    ADD CONSTRAINT article_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);


--
-- TOC entry 3586 (class 2606 OID 29805)
-- Name: author author_fk_genre_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.author
    ADD CONSTRAINT author_fk_genre_id_fkey FOREIGN KEY (fk_genre_id) REFERENCES razvit.genre(genre_id);


--
-- TOC entry 3577 (class 2606 OID 29689)
-- Name: band band_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.band
    ADD CONSTRAINT band_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);


--
-- TOC entry 3593 (class 2606 OID 29871)
-- Name: channel channel_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.channel
    ADD CONSTRAINT channel_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);


--
-- TOC entry 3584 (class 2606 OID 29779)
-- Name: comment comment_fk_article_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.comment
    ADD CONSTRAINT comment_fk_article_id_fkey FOREIGN KEY (fk_article_id) REFERENCES razvit.article(article_id);


--
-- TOC entry 3585 (class 2606 OID 29784)
-- Name: comment comment_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.comment
    ADD CONSTRAINT comment_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);


--
-- TOC entry 3581 (class 2606 OID 29736)
-- Name: extension extension_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.extension
    ADD CONSTRAINT extension_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.band(band_id);


--
-- TOC entry 3578 (class 2606 OID 29701)
-- Name: mode mode_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.mode
    ADD CONSTRAINT mode_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.band(band_id);


--
-- TOC entry 3582 (class 2606 OID 29750)
-- Name: order order_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit."order"
    ADD CONSTRAINT order_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);


--
-- TOC entry 3579 (class 2606 OID 29715)
-- Name: schedule schedule_fk_band_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.schedule
    ADD CONSTRAINT schedule_fk_band_id_fkey FOREIGN KEY (fk_band_id) REFERENCES razvit.band(band_id);


--
-- TOC entry 3580 (class 2606 OID 29720)
-- Name: schedule schedule_fk_mode_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.schedule
    ADD CONSTRAINT schedule_fk_mode_id_fkey FOREIGN KEY (fk_mode_id) REFERENCES razvit.mode(mode_id);


--
-- TOC entry 3589 (class 2606 OID 29850)
-- Name: song song_fk_album_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_fk_album_id_fkey FOREIGN KEY (fk_album_id) REFERENCES razvit.album(album_id);


--
-- TOC entry 3590 (class 2606 OID 29845)
-- Name: song song_fk_author_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_fk_author_id_fkey FOREIGN KEY (fk_author_id) REFERENCES razvit.author(author_id);


--
-- TOC entry 3591 (class 2606 OID 29855)
-- Name: song song_fk_genre_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_fk_genre_id_fkey FOREIGN KEY (fk_genre_id) REFERENCES razvit.genre(genre_id);


--
-- TOC entry 3592 (class 2606 OID 29840)
-- Name: song song_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);


--
-- TOC entry 3576 (class 2606 OID 29675)
-- Name: username username_fk_role_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.username
    ADD CONSTRAINT username_fk_role_id_fkey FOREIGN KEY (fk_role_id) REFERENCES razvit.role(role_id);


--
-- TOC entry 3594 (class 2606 OID 29888)
-- Name: website website_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: razvit; Owner: postgres
--

ALTER TABLE ONLY razvit.website
    ADD CONSTRAINT website_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);


--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: andrey
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-12-27 15:41:51 MSK

--
-- PostgreSQL database dump complete
--

