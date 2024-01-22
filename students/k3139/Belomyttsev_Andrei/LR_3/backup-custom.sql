PGDMP                       {            razvit    14.8 (Homebrew)    16.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    26927    razvit    DATABASE     h   CREATE DATABASE razvit WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE razvit;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                andrey    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   andrey    false    4                        2615    26928    razvit    SCHEMA        CREATE SCHEMA razvit;
    DROP SCHEMA razvit;
                postgres    false            �            1259    27084    album    TABLE     �   CREATE TABLE razvit.album (
    album_id integer NOT NULL,
    album_name character varying(50),
    fk_author_id integer NOT NULL,
    fk_genre_id integer,
    description text
);
    DROP TABLE razvit.album;
       razvit         heap    postgres    false    6            �            1259    27083    album_album_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.album_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE razvit.album_album_id_seq;
       razvit          postgres    false    6    233            �           0    0    album_album_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE razvit.album_album_id_seq OWNED BY razvit.album.album_id;
          razvit          postgres    false    232            �            1259    27030    article    TABLE     �   CREATE TABLE razvit.article (
    article_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    title text NOT NULL,
    create_date date NOT NULL,
    text text NOT NULL
);
    DROP TABLE razvit.article;
       razvit         heap    postgres    false    6            �            1259    27029    article_article_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.article_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE razvit.article_article_id_seq;
       razvit          postgres    false    6    225            �           0    0    article_article_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE razvit.article_article_id_seq OWNED BY razvit.article.article_id;
          razvit          postgres    false    224            �            1259    27070    author    TABLE     �   CREATE TABLE razvit.author (
    author_id integer NOT NULL,
    author_name character varying(100),
    fk_genre_id integer,
    description text
);
    DROP TABLE razvit.author;
       razvit         heap    postgres    false    6            �            1259    27069    author_author_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE razvit.author_author_id_seq;
       razvit          postgres    false    231    6            �           0    0    author_author_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE razvit.author_author_id_seq OWNED BY razvit.author.author_id;
          razvit          postgres    false    230            �            1259    26955    band    TABLE     �   CREATE TABLE razvit.band (
    band_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    apikey character(20),
    model character varying(10),
    version character varying(10),
    last_time time without time zone
);
    DROP TABLE razvit.band;
       razvit         heap    postgres    false    6            �            1259    26954    band_band_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.band_band_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE razvit.band_band_id_seq;
       razvit          postgres    false    215    6            �           0    0    band_band_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE razvit.band_band_id_seq OWNED BY razvit.band.band_id;
          razvit          postgres    false    214            �            1259    27133    channel    TABLE     K  CREATE TABLE razvit.channel (
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
    DROP TABLE razvit.channel;
       razvit         heap    postgres    false    6            �            1259    27044    comment    TABLE     �   CREATE TABLE razvit.comment (
    comment_id integer NOT NULL,
    fk_article_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    create_date date NOT NULL,
    text text NOT NULL
);
    DROP TABLE razvit.comment;
       razvit         heap    postgres    false    6            �            1259    27043    comment_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.comment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE razvit.comment_comment_id_seq;
       razvit          postgres    false    227    6            �           0    0    comment_comment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE razvit.comment_comment_id_seq OWNED BY razvit.comment.comment_id;
          razvit          postgres    false    226            �            1259    27000 	   extension    TABLE     �   CREATE TABLE razvit.extension (
    extension_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    channels text[],
    words text[],
    activeurl text[],
    videourl text[],
    audiourl text[],
    blackurl text[]
);
    DROP TABLE razvit.extension;
       razvit         heap    postgres    false    6            �            1259    26999    extension_extension_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.extension_extension_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE razvit.extension_extension_id_seq;
       razvit          postgres    false    6    221            �           0    0    extension_extension_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE razvit.extension_extension_id_seq OWNED BY razvit.extension.extension_id;
          razvit          postgres    false    220            �            1259    27063    genre    TABLE     c   CREATE TABLE razvit.genre (
    genre_id integer NOT NULL,
    genre_name character varying(20)
);
    DROP TABLE razvit.genre;
       razvit         heap    postgres    false    6            �            1259    27062    genre_genre_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE razvit.genre_genre_id_seq;
       razvit          postgres    false    229    6            �           0    0    genre_genre_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE razvit.genre_genre_id_seq OWNED BY razvit.genre.genre_id;
          razvit          postgres    false    228            �            1259    26969    mode    TABLE     �   CREATE TABLE razvit.mode (
    mode_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    name character varying(20) NOT NULL,
    value integer,
    oldvalue integer
);
    DROP TABLE razvit.mode;
       razvit         heap    postgres    false    6            �            1259    26968    mode_mode_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.mode_mode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE razvit.mode_mode_id_seq;
       razvit          postgres    false    6    217            �           0    0    mode_mode_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE razvit.mode_mode_id_seq OWNED BY razvit.mode.mode_id;
          razvit          postgres    false    216            �            1259    27016    order    TABLE       CREATE TABLE razvit."order" (
    order_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    phone_number character varying(20),
    address text,
    postcode character varying(10) NOT NULL,
    delivered boolean,
    telegram character varying(50)
);
    DROP TABLE razvit."order";
       razvit         heap    postgres    false    6            �            1259    27015    order_order_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE razvit.order_order_id_seq;
       razvit          postgres    false    223    6            �           0    0    order_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE razvit.order_order_id_seq OWNED BY razvit."order".order_id;
          razvit          postgres    false    222            �            1259    26930    role    TABLE     d   CREATE TABLE razvit.role (
    role_id integer NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE razvit.role;
       razvit         heap    postgres    false    6            �            1259    26929    role_role_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE razvit.role_role_id_seq;
       razvit          postgres    false    211    6            �           0    0    role_role_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE razvit.role_role_id_seq OWNED BY razvit.role.role_id;
          razvit          postgres    false    210            �            1259    26981    schedule    TABLE       CREATE TABLE razvit.schedule (
    schedule_id integer NOT NULL,
    fk_band_id integer NOT NULL,
    fk_mode_id integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    weekdays boolean[] NOT NULL
);
    DROP TABLE razvit.schedule;
       razvit         heap    postgres    false    6            �            1259    26980    schedule_schedule_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE razvit.schedule_schedule_id_seq;
       razvit          postgres    false    219    6            �           0    0    schedule_schedule_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE razvit.schedule_schedule_id_seq OWNED BY razvit.schedule.schedule_id;
          razvit          postgres    false    218            �            1259    27103    song    TABLE     �  CREATE TABLE razvit.song (
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
    DROP TABLE razvit.song;
       razvit         heap    postgres    false    6            �            1259    27102    song_song_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.song_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE razvit.song_song_id_seq;
       razvit          postgres    false    235    6            �           0    0    song_song_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE razvit.song_song_id_seq OWNED BY razvit.song.song_id;
          razvit          postgres    false    234            �            1259    26937    username    TABLE       CREATE TABLE razvit.username (
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
    DROP TABLE razvit.username;
       razvit         heap    postgres    false    6            �            1259    26936    username_user_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.username_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE razvit.username_user_id_seq;
       razvit          postgres    false    213    6            �           0    0    username_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE razvit.username_user_id_seq OWNED BY razvit.username.user_id;
          razvit          postgres    false    212            �            1259    27150    website    TABLE     �   CREATE TABLE razvit.website (
    website_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    approved boolean DEFAULT false,
    url character varying(100) NOT NULL,
    description text
);
    DROP TABLE razvit.website;
       razvit         heap    postgres    false    6            �            1259    27149    website_website_id_seq    SEQUENCE     �   CREATE SEQUENCE razvit.website_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE razvit.website_website_id_seq;
       razvit          postgres    false    6    238            �           0    0    website_website_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE razvit.website_website_id_seq OWNED BY razvit.website.website_id;
          razvit          postgres    false    237            �           2604    27087    album album_id    DEFAULT     p   ALTER TABLE ONLY razvit.album ALTER COLUMN album_id SET DEFAULT nextval('razvit.album_album_id_seq'::regclass);
 =   ALTER TABLE razvit.album ALTER COLUMN album_id DROP DEFAULT;
       razvit          postgres    false    232    233    233            �           2604    27033    article article_id    DEFAULT     x   ALTER TABLE ONLY razvit.article ALTER COLUMN article_id SET DEFAULT nextval('razvit.article_article_id_seq'::regclass);
 A   ALTER TABLE razvit.article ALTER COLUMN article_id DROP DEFAULT;
       razvit          postgres    false    224    225    225            �           2604    27073    author author_id    DEFAULT     t   ALTER TABLE ONLY razvit.author ALTER COLUMN author_id SET DEFAULT nextval('razvit.author_author_id_seq'::regclass);
 ?   ALTER TABLE razvit.author ALTER COLUMN author_id DROP DEFAULT;
       razvit          postgres    false    230    231    231            �           2604    26958    band band_id    DEFAULT     l   ALTER TABLE ONLY razvit.band ALTER COLUMN band_id SET DEFAULT nextval('razvit.band_band_id_seq'::regclass);
 ;   ALTER TABLE razvit.band ALTER COLUMN band_id DROP DEFAULT;
       razvit          postgres    false    215    214    215            �           2604    27047    comment comment_id    DEFAULT     x   ALTER TABLE ONLY razvit.comment ALTER COLUMN comment_id SET DEFAULT nextval('razvit.comment_comment_id_seq'::regclass);
 A   ALTER TABLE razvit.comment ALTER COLUMN comment_id DROP DEFAULT;
       razvit          postgres    false    226    227    227            �           2604    27003    extension extension_id    DEFAULT     �   ALTER TABLE ONLY razvit.extension ALTER COLUMN extension_id SET DEFAULT nextval('razvit.extension_extension_id_seq'::regclass);
 E   ALTER TABLE razvit.extension ALTER COLUMN extension_id DROP DEFAULT;
       razvit          postgres    false    220    221    221            �           2604    27066    genre genre_id    DEFAULT     p   ALTER TABLE ONLY razvit.genre ALTER COLUMN genre_id SET DEFAULT nextval('razvit.genre_genre_id_seq'::regclass);
 =   ALTER TABLE razvit.genre ALTER COLUMN genre_id DROP DEFAULT;
       razvit          postgres    false    229    228    229            �           2604    26972    mode mode_id    DEFAULT     l   ALTER TABLE ONLY razvit.mode ALTER COLUMN mode_id SET DEFAULT nextval('razvit.mode_mode_id_seq'::regclass);
 ;   ALTER TABLE razvit.mode ALTER COLUMN mode_id DROP DEFAULT;
       razvit          postgres    false    216    217    217            �           2604    27019    order order_id    DEFAULT     r   ALTER TABLE ONLY razvit."order" ALTER COLUMN order_id SET DEFAULT nextval('razvit.order_order_id_seq'::regclass);
 ?   ALTER TABLE razvit."order" ALTER COLUMN order_id DROP DEFAULT;
       razvit          postgres    false    223    222    223            �           2604    26933    role role_id    DEFAULT     l   ALTER TABLE ONLY razvit.role ALTER COLUMN role_id SET DEFAULT nextval('razvit.role_role_id_seq'::regclass);
 ;   ALTER TABLE razvit.role ALTER COLUMN role_id DROP DEFAULT;
       razvit          postgres    false    210    211    211            �           2604    26984    schedule schedule_id    DEFAULT     |   ALTER TABLE ONLY razvit.schedule ALTER COLUMN schedule_id SET DEFAULT nextval('razvit.schedule_schedule_id_seq'::regclass);
 C   ALTER TABLE razvit.schedule ALTER COLUMN schedule_id DROP DEFAULT;
       razvit          postgres    false    218    219    219            �           2604    27106    song song_id    DEFAULT     l   ALTER TABLE ONLY razvit.song ALTER COLUMN song_id SET DEFAULT nextval('razvit.song_song_id_seq'::regclass);
 ;   ALTER TABLE razvit.song ALTER COLUMN song_id DROP DEFAULT;
       razvit          postgres    false    234    235    235            �           2604    26940    username user_id    DEFAULT     t   ALTER TABLE ONLY razvit.username ALTER COLUMN user_id SET DEFAULT nextval('razvit.username_user_id_seq'::regclass);
 ?   ALTER TABLE razvit.username ALTER COLUMN user_id DROP DEFAULT;
       razvit          postgres    false    212    213    213            �           2604    27153    website website_id    DEFAULT     x   ALTER TABLE ONLY razvit.website ALTER COLUMN website_id SET DEFAULT nextval('razvit.website_website_id_seq'::regclass);
 A   ALTER TABLE razvit.website ALTER COLUMN website_id DROP DEFAULT;
       razvit          postgres    false    237    238    238            �          0    27084    album 
   TABLE DATA           ]   COPY razvit.album (album_id, album_name, fk_author_id, fk_genre_id, description) FROM stdin;
    razvit          postgres    false    233   ��       �          0    27030    article 
   TABLE DATA           S   COPY razvit.article (article_id, fk_user_id, title, create_date, text) FROM stdin;
    razvit          postgres    false    225   ��       �          0    27070    author 
   TABLE DATA           R   COPY razvit.author (author_id, author_name, fk_genre_id, description) FROM stdin;
    razvit          postgres    false    231   ��       �          0    26955    band 
   TABLE DATA           V   COPY razvit.band (band_id, fk_user_id, apikey, model, version, last_time) FROM stdin;
    razvit          postgres    false    215   �       �          0    27133    channel 
   TABLE DATA           �   COPY razvit.channel (channel_id, url, title, views, subs, videos, lang, category, theme, avatar_default, avatar_medium, avatar_high, fk_user_id, approved) FROM stdin;
    razvit          postgres    false    236   ��       �          0    27044    comment 
   TABLE DATA           [   COPY razvit.comment (comment_id, fk_article_id, fk_user_id, create_date, text) FROM stdin;
    razvit          postgres    false    227   r�       �          0    27000 	   extension 
   TABLE DATA           w   COPY razvit.extension (extension_id, fk_user_id, channels, words, activeurl, videourl, audiourl, blackurl) FROM stdin;
    razvit          postgres    false    221   ��       �          0    27063    genre 
   TABLE DATA           5   COPY razvit.genre (genre_id, genre_name) FROM stdin;
    razvit          postgres    false    229   ��       �          0    26969    mode 
   TABLE DATA           J   COPY razvit.mode (mode_id, fk_user_id, name, value, oldvalue) FROM stdin;
    razvit          postgres    false    217   �       �          0    27016    order 
   TABLE DATA           m   COPY razvit."order" (order_id, fk_user_id, phone_number, address, postcode, delivered, telegram) FROM stdin;
    razvit          postgres    false    223   ��       �          0    26930    role 
   TABLE DATA           -   COPY razvit.role (role_id, name) FROM stdin;
    razvit          postgres    false    211   ��       �          0    26981    schedule 
   TABLE DATA           g   COPY razvit.schedule (schedule_id, fk_band_id, fk_mode_id, start_time, end_time, weekdays) FROM stdin;
    razvit          postgres    false    219   ��       �          0    27103    song 
   TABLE DATA           �   COPY razvit.song (song_id, fk_user_id, create_date, approved, fk_author_id, song_name, fk_album_id, fk_genre_id, lang, year, youtube_link, description, lyrics) FROM stdin;
    razvit          postgres    false    235   �       �          0    26937    username 
   TABLE DATA           c   COPY razvit.username (user_id, username, email, password, reg_date, about, fk_role_id) FROM stdin;
    razvit          postgres    false    213   �,      �          0    27150    website 
   TABLE DATA           U   COPY razvit.website (website_id, fk_user_id, approved, url, description) FROM stdin;
    razvit          postgres    false    238   �-      �           0    0    album_album_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('razvit.album_album_id_seq', 1, false);
          razvit          postgres    false    232            �           0    0    article_article_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('razvit.article_article_id_seq', 1, false);
          razvit          postgres    false    224            �           0    0    author_author_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('razvit.author_author_id_seq', 1, false);
          razvit          postgres    false    230            �           0    0    band_band_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('razvit.band_band_id_seq', 1, false);
          razvit          postgres    false    214            �           0    0    comment_comment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('razvit.comment_comment_id_seq', 1, false);
          razvit          postgres    false    226            �           0    0    extension_extension_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('razvit.extension_extension_id_seq', 1, false);
          razvit          postgres    false    220            �           0    0    genre_genre_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('razvit.genre_genre_id_seq', 1, false);
          razvit          postgres    false    228            �           0    0    mode_mode_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('razvit.mode_mode_id_seq', 1, false);
          razvit          postgres    false    216            �           0    0    order_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('razvit.order_order_id_seq', 1, false);
          razvit          postgres    false    222            �           0    0    role_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('razvit.role_role_id_seq', 1, false);
          razvit          postgres    false    210            �           0    0    schedule_schedule_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('razvit.schedule_schedule_id_seq', 1, false);
          razvit          postgres    false    218            �           0    0    song_song_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('razvit.song_song_id_seq', 1, false);
          razvit          postgres    false    234            �           0    0    username_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('razvit.username_user_id_seq', 1, false);
          razvit          postgres    false    212            �           0    0    website_website_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('razvit.website_website_id_seq', 1, false);
          razvit          postgres    false    237            �           2606    27091    album album_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY razvit.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (album_id);
 :   ALTER TABLE ONLY razvit.album DROP CONSTRAINT album_pkey;
       razvit            postgres    false    233            �           2606    27037    article article_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY razvit.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (article_id);
 >   ALTER TABLE ONLY razvit.article DROP CONSTRAINT article_pkey;
       razvit            postgres    false    225            �           2606    27077    author author_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY razvit.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);
 <   ALTER TABLE ONLY razvit.author DROP CONSTRAINT author_pkey;
       razvit            postgres    false    231            �           2606    26962    band band_fk_user_id_key 
   CONSTRAINT     Y   ALTER TABLE ONLY razvit.band
    ADD CONSTRAINT band_fk_user_id_key UNIQUE (fk_user_id);
 B   ALTER TABLE ONLY razvit.band DROP CONSTRAINT band_fk_user_id_key;
       razvit            postgres    false    215            �           2606    26960    band band_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY razvit.band
    ADD CONSTRAINT band_pkey PRIMARY KEY (band_id);
 8   ALTER TABLE ONLY razvit.band DROP CONSTRAINT band_pkey;
       razvit            postgres    false    215            �           2606    27143    channel channel_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY razvit.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (channel_id);
 >   ALTER TABLE ONLY razvit.channel DROP CONSTRAINT channel_pkey;
       razvit            postgres    false    236            �           2606    27051    comment comment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY razvit.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);
 >   ALTER TABLE ONLY razvit.comment DROP CONSTRAINT comment_pkey;
       razvit            postgres    false    227            �           2606    27009 "   extension extension_fk_user_id_key 
   CONSTRAINT     c   ALTER TABLE ONLY razvit.extension
    ADD CONSTRAINT extension_fk_user_id_key UNIQUE (fk_user_id);
 L   ALTER TABLE ONLY razvit.extension DROP CONSTRAINT extension_fk_user_id_key;
       razvit            postgres    false    221            �           2606    27007    extension extension_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY razvit.extension
    ADD CONSTRAINT extension_pkey PRIMARY KEY (extension_id);
 B   ALTER TABLE ONLY razvit.extension DROP CONSTRAINT extension_pkey;
       razvit            postgres    false    221            �           2606    27068    genre genre_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY razvit.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);
 :   ALTER TABLE ONLY razvit.genre DROP CONSTRAINT genre_pkey;
       razvit            postgres    false    229            �           2606    26974    mode mode_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY razvit.mode
    ADD CONSTRAINT mode_pkey PRIMARY KEY (mode_id);
 8   ALTER TABLE ONLY razvit.mode DROP CONSTRAINT mode_pkey;
       razvit            postgres    false    217            �           2606    27023    order order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY razvit."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY razvit."order" DROP CONSTRAINT order_pkey;
       razvit            postgres    false    223            �           2606    26935    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY razvit.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);
 8   ALTER TABLE ONLY razvit.role DROP CONSTRAINT role_pkey;
       razvit            postgres    false    211            �           2606    26988    schedule schedule_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY razvit.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);
 @   ALTER TABLE ONLY razvit.schedule DROP CONSTRAINT schedule_pkey;
       razvit            postgres    false    219            �           2606    27112    song song_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (song_id);
 8   ALTER TABLE ONLY razvit.song DROP CONSTRAINT song_pkey;
       razvit            postgres    false    235            �           2606    26948    username username_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY razvit.username
    ADD CONSTRAINT username_pkey PRIMARY KEY (user_id);
 @   ALTER TABLE ONLY razvit.username DROP CONSTRAINT username_pkey;
       razvit            postgres    false    213            �           2606    27158    website website_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY razvit.website
    ADD CONSTRAINT website_pkey PRIMARY KEY (website_id);
 >   ALTER TABLE ONLY razvit.website DROP CONSTRAINT website_pkey;
       razvit            postgres    false    238            �           2606    27160    website website_url_key 
   CONSTRAINT     Q   ALTER TABLE ONLY razvit.website
    ADD CONSTRAINT website_url_key UNIQUE (url);
 A   ALTER TABLE ONLY razvit.website DROP CONSTRAINT website_url_key;
       razvit            postgres    false    238                       2606    27092    album album_fk_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.album
    ADD CONSTRAINT album_fk_author_id_fkey FOREIGN KEY (fk_author_id) REFERENCES razvit.author(author_id);
 G   ALTER TABLE ONLY razvit.album DROP CONSTRAINT album_fk_author_id_fkey;
       razvit          postgres    false    233    231    3564                       2606    27097    album album_fk_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.album
    ADD CONSTRAINT album_fk_genre_id_fkey FOREIGN KEY (fk_genre_id) REFERENCES razvit.genre(genre_id);
 F   ALTER TABLE ONLY razvit.album DROP CONSTRAINT album_fk_genre_id_fkey;
       razvit          postgres    false    233    229    3562            �           2606    27038    article article_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.article
    ADD CONSTRAINT article_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);
 I   ALTER TABLE ONLY razvit.article DROP CONSTRAINT article_fk_user_id_fkey;
       razvit          postgres    false    225    213    3542                       2606    27078    author author_fk_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.author
    ADD CONSTRAINT author_fk_genre_id_fkey FOREIGN KEY (fk_genre_id) REFERENCES razvit.genre(genre_id);
 H   ALTER TABLE ONLY razvit.author DROP CONSTRAINT author_fk_genre_id_fkey;
       razvit          postgres    false    229    3562    231            �           2606    26963    band band_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.band
    ADD CONSTRAINT band_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);
 C   ALTER TABLE ONLY razvit.band DROP CONSTRAINT band_fk_user_id_fkey;
       razvit          postgres    false    3542    215    213                       2606    27144    channel channel_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.channel
    ADD CONSTRAINT channel_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);
 I   ALTER TABLE ONLY razvit.channel DROP CONSTRAINT channel_fk_user_id_fkey;
       razvit          postgres    false    3542    236    213            �           2606    27052 "   comment comment_fk_article_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.comment
    ADD CONSTRAINT comment_fk_article_id_fkey FOREIGN KEY (fk_article_id) REFERENCES razvit.article(article_id);
 L   ALTER TABLE ONLY razvit.comment DROP CONSTRAINT comment_fk_article_id_fkey;
       razvit          postgres    false    3558    225    227                        2606    27057    comment comment_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.comment
    ADD CONSTRAINT comment_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);
 I   ALTER TABLE ONLY razvit.comment DROP CONSTRAINT comment_fk_user_id_fkey;
       razvit          postgres    false    3542    227    213            �           2606    27010 #   extension extension_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.extension
    ADD CONSTRAINT extension_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.band(band_id);
 M   ALTER TABLE ONLY razvit.extension DROP CONSTRAINT extension_fk_user_id_fkey;
       razvit          postgres    false    215    3546    221            �           2606    26975    mode mode_fk_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY razvit.mode
    ADD CONSTRAINT mode_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.band(band_id);
 C   ALTER TABLE ONLY razvit.mode DROP CONSTRAINT mode_fk_user_id_fkey;
       razvit          postgres    false    215    217    3546            �           2606    27024    order order_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit."order"
    ADD CONSTRAINT order_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);
 G   ALTER TABLE ONLY razvit."order" DROP CONSTRAINT order_fk_user_id_fkey;
       razvit          postgres    false    3542    213    223            �           2606    26989 !   schedule schedule_fk_band_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.schedule
    ADD CONSTRAINT schedule_fk_band_id_fkey FOREIGN KEY (fk_band_id) REFERENCES razvit.band(band_id);
 K   ALTER TABLE ONLY razvit.schedule DROP CONSTRAINT schedule_fk_band_id_fkey;
       razvit          postgres    false    219    215    3546            �           2606    26994 !   schedule schedule_fk_mode_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.schedule
    ADD CONSTRAINT schedule_fk_mode_id_fkey FOREIGN KEY (fk_mode_id) REFERENCES razvit.mode(mode_id);
 K   ALTER TABLE ONLY razvit.schedule DROP CONSTRAINT schedule_fk_mode_id_fkey;
       razvit          postgres    false    219    217    3548                       2606    27123    song song_fk_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_fk_album_id_fkey FOREIGN KEY (fk_album_id) REFERENCES razvit.album(album_id);
 D   ALTER TABLE ONLY razvit.song DROP CONSTRAINT song_fk_album_id_fkey;
       razvit          postgres    false    3566    235    233                       2606    27118    song song_fk_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_fk_author_id_fkey FOREIGN KEY (fk_author_id) REFERENCES razvit.author(author_id);
 E   ALTER TABLE ONLY razvit.song DROP CONSTRAINT song_fk_author_id_fkey;
       razvit          postgres    false    231    3564    235                       2606    27128    song song_fk_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_fk_genre_id_fkey FOREIGN KEY (fk_genre_id) REFERENCES razvit.genre(genre_id);
 D   ALTER TABLE ONLY razvit.song DROP CONSTRAINT song_fk_genre_id_fkey;
       razvit          postgres    false    3562    235    229                       2606    27113    song song_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.song
    ADD CONSTRAINT song_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);
 C   ALTER TABLE ONLY razvit.song DROP CONSTRAINT song_fk_user_id_fkey;
       razvit          postgres    false    3542    235    213            �           2606    26949 !   username username_fk_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.username
    ADD CONSTRAINT username_fk_role_id_fkey FOREIGN KEY (fk_role_id) REFERENCES razvit.role(role_id);
 K   ALTER TABLE ONLY razvit.username DROP CONSTRAINT username_fk_role_id_fkey;
       razvit          postgres    false    213    3540    211            	           2606    27161    website website_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY razvit.website
    ADD CONSTRAINT website_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES razvit.username(user_id);
 I   ALTER TABLE ONLY razvit.website DROP CONSTRAINT website_fk_user_id_fkey;
       razvit          postgres    false    213    3542    238            �   z   x�3�0���v_�za˅�rsrf��[�뗗��U旖�&��%���'�$gؗ�U�����:rq�d�*8�(�)�'�r��qse��+�e&��e&��c���� �P)�      �   �  x��XMo#E=ǿ����$�"�[�C@"-x�,w{�l�J6ā,��eb����X�/���^����w�=��U�ޫ���������.�7vS7=89:yvx|tx�}f>��]02/��ߟwq���o򻱑]��>�����~nqf�~��и�����'�=����j�}Yu�+����[������`��Ʀ0�nᎬl�lh`�������a=sw8W�'�\�B�gi�vcƨ6W&�7T/`�5>R�m�xR���+X~����W�.���+�I|3|��q7B ץi�1th�=.b�]ɍ7��خGF�%�as��J�;�OURG�����(��%�T^ojB��g��dy~�:?��Sc�Pӓ% l
_����X�2+@�`fh��V�K��Ǵ��/�ɘ�ئO���â��	�r��O $�k�����Z6�����
�����q��:Ӭ��zc��9�����j�	��B�����eH���A�5�xS\/%��\
��\�\�@�뒾��i�����
�����i�2C��!�{ҟp�ez�f:j�;�Nz�@�Vu{A5�ʬ��
���q}ܣ�b���Y3b�5��l %Pz�L)�pLnƲB�B/��S!%|Bʾ<���Մ�K��y���$��!�G^�eyh�@q}�z���ƶ����$����<4ʄ=�LH�R*$8�&��*X�xc?���#X��a֥��������&!)�T�ҹ�%�(i<,���s�R�$瓜���2<;@	{��b5��.p�{�����g�/�.|�Wm�j�����جBϯ��B��*N�RTR�n�)��6XA.R�bQ��?^�jCrWӥo�ݯ�����߰���-�K�^���l�e[���3���?��Qc��
�To��:�p)���ou���7�Cv���!��:6���=�C�FOgR�u/e4���G��ܽ(]U���V.т�J�үdM�\8��ռ1�CŦ1��#¿	���P����M[N�+2t�?�B�;|
v,���$-���#F�%���\|`�#kXM>��[|�I�睍:�đ� '��v|����
��m��l]��9�=�*���*-����hkn0�j):�$�l?w4�ƹ@	��tbݍ(V���;��t����zx8%��?Oä�v��=e��b9�����v+!��[���)�2w��xk|�wiL!���|&��m_�B�Iw������7�Hۘ]�BN2<|4x.��/�)9ľ�w��v���w�ؒ`�l�y�p%G���&Da/woY�S��[�1���� o2"������^N��!�<kV���/���Roj�w�AP�]����ZzQ�_]�X�54�~3~q��l<�ĀHt��2�Z�N$���v��[E�4�r܍�)>R��S7�ti��C�$t] B/t�`�d9�t�é"��N���*a�f�ԡ#�Lt��7=�cj�f}�8�E��a@3)�2G\Ҽ2T���ׂ�\_#$u��W��`�?���      �   �  x�}Q�JQ^�<�]����Jt3Dj�@FLGtL܍#�BLz��V�	��4��y��{���6s�=���obZ�*Y���b=ӜZp��4��!��
#��}�c�"�A�4���7�x�7���`oM,�p��-�	<ze�K&���܂f����-�}��!KL�$��}tׂ'�C�o�����!���lE��n��9�S�e�=�9���+7�+"�x�2D#P�C)��魆�,�t�S�u�g��^�Oö�-��'��ui;�`5���u
���8Rx�rRVC���!��g@�H����0�ʘ�B�,{�h���#b�{���Ȓ*@�Ryo��O��U�*��[����v[v���;3_ș�B<qz�7������'�9E�      �   p   x�3�4��
1�J�52��(5M/�4�3�4�3���2�4�tr���pM6(ɫp5(�N����4�1�1�4��p/3(Mu�p�4rOtLO���cTcR���� x��      �      x��}����q�5��+�	F8R� A�	� H�R�@HW:8�SJʲd�U>�:ةܸj,i*�3z�W��g�'�).�`f�={kvO�ݫ�Ww/�D�V:z��*����\�7�����������,7�O�8���Q��Vo	jN�eF��aE)��;�����;N�9ć��:F|��̰Ov���]����mV�'�њ��|Nh�r&�Ӯ�(�H]��bUh�P�ܢ����O)MC��,����PC��D(��Q�;���d�R9���^x��L(�n�ۅL- �n�#{[g'N!p
�	�B;¼R�Rf�=.��H�W#�ǲnϖO�M�\��X&�f-(W�v��q��d��R�.��=�g3aJvA�솠\fn)�m��Q
'��46�Ah�����;�$�%Fz��.X�2���VG��:3��~�n���90l�6`�c�
��0�;l�&;�T��9�f��yc`�w l��㠔�,s��#�p�j�ȫuտ~�!�S��z,�M�J[��ez������>U�Y��m�\E��_1?�FW,'�0��G���ӓ�,��x[ϱ;L�4F�4ѡ�J�|���Y���{����C��f��0���ώk(��P=��S$%Z���o�0���ͧݙ�%�0���Ɛ���토T
ơS{A�F�61{e�@j������UO�%�J��g�V���`�K=�&t�L�V��\E����.ă$z39=��C�%� 1�A���腵�	��0E�a"�\}"Ju�y��Y��D�\��'�0�uESL�A�uǙ����J�~O���Q*�QY���J5�%�`@��T�]=N�3U?J�Sa�!]'�M�f��:��\�(���~Cp����^��;?~���巗�.�y��w߹|y�����7�O;8��\��� ��8V�đg���V������#��ҧ�Q)��V_+��7؍VSb�D4�*Z�4�0r�C�}e���>�Z5�jn
N�2x���c4E�!����N{'���ϔ�Ĝ^%;�Z-c)R�5��}W���\@-<.(�;d��]f-�^v�'z��=bz7{FZ~��04M!d���ӐE��(Y�4XhDf�B>��u04Q=LΆ+h���s4*hA�����^���Ӳ7���?��pކ�����s�:�`��$
u�@�&���Cd������Xm̅=:�/f<�98Aa^��1M�x�R|fst�Ldj4Vi~G�c}����=L��?J�!�!^�S*�%7�Y��R`@������}����@���Ż���:��Q��;4F�FF���#�!%ښj��t�Q������ဨz����U�R���#>��(Ȯ��d�1�&+I)?�f���� ���7@�OH����\��$�W�:�n������w�Ϯ��e'������5ETC���T�U��[����)1'֞0 ��V��#~Dw��V���M�����q�I�?�a9?�G�Ķ��F�@u�����	��˗��r���_�g.L�(�u�z�p�G�Sݯ�u�3WAuަ♷��߫,c �ݤ��.�\��*���8�{y�t���I��\�M�b�P�tC���t���:I!u�����z#�(��F�އJ�C+�':3u�~�����%~:�[k����6�&Wт1pw�,n�c�0Ȳ-c��y8U
���Ag'�v�y���*B�(U�uM#�@�-5����{��{|w��"��3Cċ��ESE�tn�����U��؁ø�[6M�Dm��*�����X��w-�:\l;��:{$;�_#]}g�I�؂�	=�`>�5,Z�SN��g�j����X+[V����a��N�4��K�g�q)��<�n^~t����&�Vp�x��]�Ӧ��E���C�5y������yH���f�ӸC�(���r�\y�~f��yl�ʶ���B�'|�СX�,���cOQu���qn���QΟ
�η��VX��p�ff�#k������lr�a��k�4�3��5�3S���ĳ����R��y�9��w��mB�������
Z����0{�J���O�U�T��pC���`�����	G/��0J͹�R�5w�$���v�r���e��lx%�ku7�BW����j���g�S9�l�A�']|�9-D��{��5�(:���Tݏ2�\���tnpӰ��-CZ��.�HNyC�vٟ����'��wߩ?����&N8��&��`�S甯7��������d����n�b�Z��I�i5[=��i#�LU�J�ry'nߤW&���)nD��*X$���쁧w	�T���T�w�·D��VՄ�S�q�7N�s��Q���"1�F�J_ퟁ8� >�������E��h�h�nl���6>��cm�Q�R`-�,p�nH����y�Fb6�&V�� \����O�}��������o�@�Ǘ_��J!(�w��V(�1�⸿^������@q����CL�	lx6@��[Q��u�0�P���=F�A68�H��E6�hw{Cp�'��I�]v����eRۜ���*�3xmqxmo�[�ǭ#�;�y�u�f���l�s�X�`c�b��w$�W�^"��r�U���=��:O�ة��8ezǝNA��`�K���%�8���J��E��u�Aი�&r^��@Oyl�=���[��A�ω>4��hS�W�"��q�*zeC�?��r�H5)t�1��]��#��k�hg�:���3u2
�&q�jE%��YDOg��Tetm�JhՅ��f��ʑώ69>��R��/�����v������Q~�
�ﴙg�_(�2�z�#����m�\kG�>��]�Dh����z��_]+��������g�0; ���rnq)�@dM�a�+L�I`-,8�{�t�r�6aB��jH�,���d���2/��4�#U'����`� A��ip��W\Tt�1M��o�K�t��q��exi%U6���5�s�d�81c� WS����e������sGT�S�D�uĈ�qzC��������\����&�0��0�a�k��S�wi	�2��1��M-w�L7S5��!4ȐQ�'Cx@�<=f�f�d����.l�R����8����x��LՏ��T�wh��2�?B��ܕV=|/̍,q�75�v�E�N���b�v��O��&����Dw�nKK��~�	� v�h���� D5+�q����ՙ��0=�,&X�ދ2$�0a�����)~��'B���)��4�	��Ȧ}4���^��`��~����˦���Z���5p�7L4I��`!�t�3����%���6	�0E��b�_<s�rv*�V���*Z��0�uϯ�$��ȶ��i�L��@��!x�_��Ԟ��5�^&��8�˷_.�p���U�㧗������_ֿj�|>��0E։����M�V��^D[����'�,y���u92�dT��hC.��ԂB�C�M'�u22�dk��}�	������W�ۭ�ۡq
CI�=�k�����Չv��ު 1٩lx���(��� ����7p$���0%��t���q�'F�B�|���V=*b�B7�ǃ�g�~��¾C}��r�~��I�𑪤@®�_S���?{���w��`B�$�tH�zWG���A% 
��ܯc�?���n���Ղi�	:H����6�@-����a�YG�}��-�C>Qi�����)���K��w�}�����R;X�Ku��,�Η���G�에�n�5]'�@FLjAf�"O����D *h1
�^=G���.
Q�X^<$��!����/Z��S!H�h����k/�� 5zWH��4�����>V#L�L�KKe?>��I,vҖQ�Ѐ���1���(�[	��hSs����3�g�~��g¾��0Sޟ��� ��^_���B���1y��a(����������ԇ�3�l�q9�ǻ\�ϸ�V0��s���7���EE�
�I���̖�q<E-�dN�٤9o    �63�xW�!JAt0�5����nTc�O�=­a8۬�hbb�Ȏ��J��x�;T�2��Ʊ�U2)d*�)tK�3	���a���Qj���ZZ�Uk�AF̫�<?�G�0o
A��x)���cd���J�e���F�Q�y.�w��j.�]Z���X���g#��ƺ�-7=P�#n��M��\<�*>�w����~���7=�%L��LC�֢�WS�bAX�!x��˧����/�O���?���>�}�^���f�����u���f��Я�8���:tgoA�>@Z/�.� D������&G}1�a���g��/�c6ZU�E�_S���Kc��ڰg?~N?O���!߻&*��Jm8at��κ��oN�<1��9�$�f(�z�P'?��C�Z��_�������`�v��+��pki���i�{�	������?���bݟ��.�7�>S���?��g����a;st��Yٴ-�7/�x���_��k����\���K�d5�_������˗�ـ4�>� �|ߖ��dY�LA��]JYA����K�p�6�<�z�h��՝������AE��pw8�Z�F����4����<�z��n�\'H�v��5��W�Hy�]��g=[T�rk��qɆ�Ƃ4%�ɒb�vb�|��2���Gp����[�Q�+n�c��B@�@��Ms���n��7N�f���I�D:�k5�?�K���/
L���W�<����ګ��*$��	�<)�AlBi��mJ�:ZT7 r�茳��H��q(�ƊP?���__���լ��	�~�4�בV�C����h��Q6]�Y�K �έ�ϩ��};�WC,Z��ut��X���z��-���d�e$l�t�;��X����p*�lY�9{f���e����|!ilm|&�ge�y��Qİo.�|��qء����~�Z�B`�a;6ܒ�z���ͬ@J8�9�(�t��ɼK��H��� �*Z�ap�� �V�z���XV=���l��_��C�8�4K%����ދ������q*O�5?��*��ɀϳ��T��\E��a�+\(�I�i�i��h����c�H�&���x_��C��`��_���[���|%�Hݖ�.��hsr6*i���Vu`��+��%FPw8[���dJ�i�ze��A��yCP�=/���/R���Fa�DH�S8�ŀ3�9�ާ⪀3u�]�d��!1�5a��Y{�7�0�����G��&3.����V��
]�\���Q��
��wP�����1#�
x{N)cI �{C���5�J�(L#�^G4(3|�x:��~�[Y�Q�$tM#\w�;>6b�,D����*h�gA!�a�0�%�f�P��>�=/�4Ha��`�`�8OR��է!E�d�{��<<`�D�Z8$#�K*f���ߝb34��E���46)�3S�ڜ��*Z$!�0�Y�|e�:­S:0�P"T��u}\�w�:~���v���I����=*M������cwEP��̡�����٦��ʣ3�d�qc���Wт6pwh[���0�~����5A���8��'Iʐ���!h���X氈}��@پ;s�I��e{�%;l��}��� b�p[W�"��q��Rt �i��P��)�S@R���sR�C3&��C"��|_���ddn4�F�HM6��Ji6\��4ߝ'��%�Es���	�����ø7�m2�d6�ҽ�
��Jg�� ����휜 >8�Y:v�@0Cꠃf���	��pk5/:��E�z*�Ɂ��\���=j6jV�8ZҲ�Ta�C
��Z�ԑ�����׳��x��LՏ��T���s����l2qb�����H4sCPq,�e�$�6'"��~S=�7�7#�%k8�\w�v��XR�D.�	�x��XE��q�����Y�J�����#�jo^��}��w_.?��w��g�=:8C0$�au�H_/6h��﵏(�ڒ�^#�y�Ӭ�O5d�Pi��~��a�U��*Z�A�øC�O�g�;��5I���H@B��K/�_���ƌP��`�A�z���j�`3�Ӆ��ea����`��靦!:d���@(j�꭪j�*�L7 øCؾ��\�9B�Ĵ�Q�g �vC�6�:y0����0��x��a4��8������
�4�B�m�7�D]�����]�
�u�g��~>04���N�Q���U&C�0���,拁�k&��}'O��(��~�ޜ����yo�WQ�.4�rCpYgu(���s��
	�����
�����^:����l!�ө:ö'��	�ʓ:�r�����po���s��a��T�fU1,AR��Jb��$-_$������"V{�כ�&#yK@c�i�mT��x�'mۛU�`ҳ�i1���.�\�j5���E@��֚�)dJ��F�A/Ȫ�@@�z|\��ҋ���Ơx�� �s�YE���
�m�hJr��H=�0�V�Ln���p ʫ�Y�l��2N�	�
;2]�?������e����0?\�p�HLqd㳁$�-��io�����q�,��Pn��;4J�����M����`����>����Ⱦ�9�ir���-�j	��Q8�;�����������d�������>#��T(��R�Bص��y>�MǢ0�+�D���+�d�抣]J����P'�}i�0���"(�{��j�SR��͉�\gۍ��8����x�vh�a�d:��Z��|�����d{�����Fd�����<�d��S��j�*KVт-p��D6�A�d�����D���,�り{i�5�-`���f��WϠ~HVMp�����w>h� ���ԓѺ�l6|��X��u2�oU�VѢ��^ #�楨:K퍿&�Aw{�7���ko��_	��6��1#(��|�P��	 [�4O�z<[���)�󓊕M���Z�Y��y�^n��r+���>�\|y	��y��������Ì>U��T?��n�����-�!(�6��^��]��!X�^~y���ۗˏ.?������q�i��s��3A��r��~k��p�v9�,l�����V���viS�i(�{>Wp�I+V��a�ao^�1�	�5?5䐼!x�����	�?}h���0�ts�ϼ_PN�o�Æ�d�퀌ǎ��"R�q6�(��b踧��U�V-��*ZD��0�!����Z#�����@��>.8w�i+E0� H�y	����7����)������I�t/3]f��:�gP��X���v�r8��6�p@�z����"<��T;{�ӷ�?{R��!x�a}V�����E�C��_����_]�����E��Q����μ�^~��2Ӌ�xw�>������A�j_1�G��i����m���>xǤ.�L*�"�ԥ�C7e�4�_S��aZ���Q�����e!:#P���&��;���z��ィ�7�����i�Q�f�ӴW5]p4��_1��#��	�I^�lf�M�T�ݥ��P7�#�mS`U���p�-ų���J23U��n��� ���`�]�	n���~��:����w?���f8	�Y'����`�����rw�50̣;�V'��x��i���x�D���Z-�TЂ6Pwh�JE�GF>q�1�$��p	bd7���/�eF�xͦ~��:3!��v*��0��Վ�9,��5k/c3��p��6���n=1����øÚ:�u�$wJ�t��T�=���_\70�I3��,Yk`����������V����1��N`xJ�z1��r�4�}kXQ��+v{�����:[�$a�Р��dbR��L����>O�?����
��EO����hx�m�1���������[>���N�����^�:5E�8��	��ۙ.��J}!�d��+u|�Ǣ'E[b��t�U����qogw��E_ő���,�1���E��lRa�n�"u���_,M����� k�mA\e&<���v���'+�r�ћj�O�I_S�6I#��)#(�{֕)+��U�\��:r��J �  ����I�'/�H�m���1Cp��]_��1�@>+2�$����Gc����T5���q^�d�A���pቭ�2�蹤��($j���UjO��(��~ooYis�j���P΢=	r��Ԝ${�=�I���:0���f�n�x��U*�ldU�����4�=�ܮ�H۵�+'�*ڽ�	��͋��0����[�;s��Űc=0��7�|�!(���`!H�>��p �{a�5���1�J���ٮ��b:�*�>��ZU�K)��qb��p���e�jnlBBŪw؏{�����3U?l�τ}o�D��rfD���:w�
�}��j<�v�qѡ(�1����}��K��z�[(���Kv�A�.'�2rQV��a38ښ2i՟��E���m����^����Q�{��V@�P}\pay�fk��.�"ᯇ����w��6�Ht#D��9�p�Vt��{����3�H�dڴ�l%���7Ǆ���E�#����h��g����g�~�ۧ¾�2���P[vD��r<K�W@+�>.8�N'z�24�P�Wg��z�۳�}Zw?�M�?M��P,�D��,TN�����KR���sZ�D�ha��0�Y�'�we�ƃ�j���JP�����d,i���Ʋ�_�\��������w�����˻��, ����Y��6�\._���N��"Ft�|8@�W_I��!D��q��_�	���]��'{�`Һ[�ph)���Q��2J��!95��$�Ek�l8��K��~��x.�;������U���tW�5]�A���^~z���O.?���'�_\~��(���n�4���[�L��t��aP���QZ��4���LT�ή��
/[�����}8�{�q��2��S)7�Kd�A���!XS��k��w�kj�/׆��^�wm��k��W����ip}�:E�{� �0N�݆��=�!�t�!�C�Y�f�,��D�G�M"��E
��Ӕ=�B5�f7�K;U&���ͶҦU��/����I7�CRX������Y����y�L4U ��K	�.]��@�.�s�,�X:��`n��U�ݜg�<�ǙZD�4���\>L��?J�!ߡ}�c�4�b���������/�'�gצ�O;4��4��1W������9��^X1�y�]U����M,�A��#!�h�Z��R@-np@!�[*�۽�����R�(W� 1�A�5�y�$�M ��N��±ޗ���m���c���F_|)�fuCubG��%�9�rW`-"cp�n�Kwz�%��UI3��� VvC0��<s����pC`ov��F!o����<-����{�dV����OF&�J+��8�������½�Pp������\AG,i��z��ソ�dd�g鿯�M���\�`��T@��S��T�'A�M��Qو<��M�a�!����8ںjա��Y�0��X����'�	�sތL��wC���u�����Q��uZ��__�J��,Z�Q��u����:'�ٻ�7{C�h���3˵'%����VF��ӧ�X���fpS5�=m���{~7��698�m�S@-�SP���&�-��dB1��x�k�yC��?k���������K����7�`
C����͢�����-;�(Y=���2�+�-*���fTHy�v�┙M�r\,�!�r�ԏ���n4��S�rS㩺�����|p��Pn��Q��4]1 ��A6͚�ۯ��YoH4;����گ��F��Xy�xʰs>�l��>�kt6��{�`����Tt]�����,@E0�|������u�g�~���¾w��t�A9�ΖiA�k����z��_����?����W�_��?�\[~��6�q�������t0��hk"�k.��$v��EE�(2��֐��r���x�;ea��et�e�~P��v���+%[�V��E����MF��x�驺~�����|2����ˊ�n��#v�,��↠�Tf��ʆ��\@���2�Z]��É#弟��b����.���ϏK���m�6@-b6P��*�p�T���b��z��@;Pn^~��#���[�4�6��/���u���07sn��1��SH�YxVv*;a�l�&��<�
��mhm<�ԭ���t+��Hǖ�9ͻKZ�P������i�Y�{�g�~�Y�g¾�%���F
�Ψ�'d"��9���Tz|m�X3Ά�u���ω����'�w���-݌`-�g�m
�@�B���i�aP��u��t��7�1T�&�}ƽI�86�r>&��ף�}�s����5WP�nfNQfp�� �:as�6�2 t��(䅘=�&4��p�3�N:��qy
�Ä�,�� ��22�&1N�t˅w�E߃�y|��G	~.�{�+�.��0�$(<S�n�� ���`���E1�}ڡH�E:C�g�a�\)8!����9�:�Ƭ7띬��]�<�^����8b�0Z�{�+a��|�8n�s���qӽ�%w��T���3a�;��9�˃��c>���i�o^g����u������BL�$ȯ�:��j�f�0�Ö��<Yd������)��.�ۻS�h����^�K6�'�8u �4�bkJ�����3U?��Sa�a�ы��zy���}�ƹ3I�n^~z}���:P�������0�1!;8B�.v��H�)�]^��nmց�?��x!,YxFv�| 	<,8����2�i��%Xc��D|o�:Y2�������
��g@F���g
�&2h��C���7���-���(R�S0�,y?�N��Q��@��<�{s'[���mx���#�v�k��h��øÖ��#{:ޘO�V=��~CP�=�i�_%G)����F���\���
s6���:��=CfȦH�	�/ʳ�*ȉ�/|>���LC���1�wܱ7�\Q��Q�/��
Ĺ�|�*�C��Q��9��H�f�1�����7ʓ�k����Z;W'aoNG���J��n�m�
\E��a�{7Ps�AX�ܱ�RWXU�^�!Ȏ{��1���(�cXM�z�@�_��a�GG����琘9����4��Lg�y������;�����R0��ah��T�5�||���?�D�y��n�̡2����3v�|k� A�A6p�/�<�Q�L��Q����	�_׿�0����CL$$�?�Kk�f2fH������z>/�6��'�@� i���o}�[�@��      �   <   x�3�4�4�4202�54�50�0�bÅ�^��e�3F�q^�xaÅ�6p��qqq �8      �   �   x�U�Aj�@E��S����P(Yt�U7SG�Uό\�&Ic�Coؓt���@�/��T�JM/`�[��~F1���s�S�t��~��O>7�6J���⬦�Kz����MhGѽ8�A`ġ$�4���㝙�Ea��� 4��s�R+5�k�Z3��=n���8w0�çM	7�K�b:6n�ԭi���������㨋��h�7ိ�c�dR;؃��ttBk��Ϳ��L��+���VfY�f�Z      �   G   x�ȹ�0E�x1H\�Ќ #"�6�po;��hF��jꈝ�ٸ�4-�����'/)��k$� G!      �   \   x�M�;� D��0�,����X0j!8H����м-v�:r��}�H^�I�=�6{Xs!��=�Y�z�O��\9my=	S,e���X �K��/��M      �   �   x���AN�0E��)|����8uv��,*!�ˆn���bS!qCQ�^�ύ�Nľ�ly�����QF�0�z���~��|I�Dy�>�㵑Y�[�/���Ț�A�kY1���i��-"�,���Ƣ��U��Җ��Sg7W��<�ʩPC?�U2I���Ԉ�$c�Q��Q�W���]b��lg��}]ߓ��g�P8����w:O"�����=�А�L�d���3�W��b��/��|�e�6��g      �   (   x�3�LL����2���OI-J,�/�2�,-N-����� �	      �   C   x�3�4AS+ �44�2�Kt0��ˈ`�L����˘�d�T�� Ya-W� �I�      �      x���ے\�u%�L~�擥��2�"������e[n[��u��CR�E�@�E�Ou!.4@B&��%K~����Y���R��w�����c�9�Z;��~���*s�u��1ǜ��C�:���3k�];��C���������K����:��|�b��G�|�K�~���?��7�xc��W^���3֟}�����KϾp��ϙ_~�~��c?|��?��ſ��/^x��c��CO��ç�G�篼~�҅W_���/]x�L���>�Ϳ�Oo~���^��7}�g_�����3���_���Gmg�������n4��zsT5���jw��v������C��n�8��7������g^y��O~�{�Cg��i3i��f������U�q�h7��f��f�nv���>t���>��ŧά�0���tـ��?-�Y��a{��~vc�hj�E3������7�+ݯ�U��Q�č��v��V�om:݇�>�{���{���=�fQu�8�xG����nu��F���vOhou���wl`�˶�m��A3��M薽p���Ӵ5���v��䍪�+��t��0�l�6���\7��r�è��֠jv�#>��M�~��ԕ-����-V�݂�d����n�G6�����\p9ݟ�m$ݓ1��}����v�[�)�m�w�ެ��ٮت��m{�{ݧgM��t�w?U���n]�P'�e�y��d>��t�������k�sa��޴�~�_�@�N׎ͩ�0����\b,b7����n�r���[ݧ�\t�}3��}�3�!��̻O�٢�HN�y�u;�׼o�U�װ���g�hl���>����ۅS3�;X��&la�X���38�\�ޙ�.�1���b�j�n׵���C�JܣC���[��8ċO���
�j7p�&��ܝ�Klb7������e{��6��howx�N��]��Hۀ�c�QN�qԶ�q6���R;���w[��}��M8{L�_L�ؘz������]^�9N�m�I�nE7 #�5�P8q;�lX��{D�V���%����%n����D��(̣�,ť�?���GC`��}�Y�A�X~�{@w�p�f\�����o%�b7��|ڢ[�1���}~A�ka2�{Ķ��I{��2 �_7���ۚ�'��-�؎�N�W�l��vئ�M�&[q/�K���ۇ�r�M}g�x����I_������@���Wz���K���Ǿ�5���֩ۖ/��~�ܩ�~t����;�����O?��	V�DI�u˸/+��O���}����Ʒ������}�y���r�M;��VڶFǱL[W�Fl���N0hM��w�ܧ$4!xDig�͞�c�.�s��P=�'�r��o<��j����߬��z���y��琮s���|��o�Wͧ���h+d��&U<m��I�u�͟�0��6���!��f���p�������³�%����Tdأ#_8{��n#�C�;�mJ�͝���:S7'kP5'z~���i��:5��=�\������j�N��AQ�/N���iհm����ԵW~d����5�m�I���x6jX+�v�M�����v/����a�ⷻ�v/�{���?�~m�j2�_0���g��'f:t����s�`�̤���\0po �	��Sg��Bh=M���s�z󴖴Xx;�f
m��آ��	=���RsS��9K�4Ʈ�@�q���w���1յ���:�$�d]��d_}�M��N�����r��T���U����Q�E{*v�F��m�+>b�f"~����������A%?�PЄ��_�}^_��'�S���.�&��[7{�9�?:4��Mo����t����Ifd'׉ϸc�&��듌��K�$����9>�}��ޡ�mw��t��z�,����6�:��$~o��������z�a�KL�9~���5��tu����n�z�5���;v�%��k����9UiwR��r]���3�t���-��A��ڐf��Z/�4�;�N�:C�w�Z� �S�Ug\���g�⿫W.>�&��b����n�7�u��_'��K-��w��u��8�f|�k>� �F��&7`���t����ng��i���7��-�_}��<��ܖ|����pp�Љ�����L���ش2�PeX��F47��`���������x�G?|����L��K�ԉ�����Q��Y7� �A�uj�M���8*T`\kz#���j���6V|�v&�AmB��[0�=��NuH��sm:��^�{
5<� 2b����􆝃c(�CX�CM`����ٓ��i�To�TaPޟ�w��;%��nv42�[P$�X��bN �j"�c����	�2����Ƽ��3|v�'��#݊�0U��5l��2� �h*���ݫ��%3?PI����0'_������Z��I7�-8/kt���R�ɀ���ބ���B��� ��'��	^	���-�KS��W�5�'#�҄K�mB4� l.~�z��33�F����{��&`�.��\j[��g�q�gT.�qZ�|N�0�&wH{ ���j��Wiصm� {xB�b_�/�E�i�VJ�*ݣ���C[���{e�
�v;E�S�HH�t��GL*b&;ԏ��ge�i�W�i�c��vP)�M#���_;:��s���b��)���O,�1��XՑ \v�( � Gl�(�5r�؆D�V8۸=pG:	|��^'4	���`�2lG����xW�J�z��WЌ����@����[9&���{ͤ2t���A�5���\��d�H�a�W��Α�x$2�����C����k���5��+�mǔ?��W��3������ݷ!����~��<n�Ta�%-<f��i_�(�h�D����KE:���@,�O�.\��C�S�f����x{��7ߠ�����a�9�qn>m~��,-T�v��A�����z���� �04`��@�]��`HDA�ז_�E��uY���BM�Q���#7��Uҿ���c��3?CIm�S���M�����EaS�k.+.TmT3�m2_�Q.���L ��2�¤�_��n�����B�v�a�yz�G����8`Q�5�g���%����ɕZH����{�}k�����|�d��`����ELH���1>l�'� %��z���v���yGb���w�%](Έ�a?������Oh�-
�/��/���.?m��B.��0���4��&1fX��v�K�_��a��2�h�!dq_t��Z��5�;��Á�i��6&~�ù�x�F��c��dk+s�δ���X�zZ����-�Le�Yr�vt �Yx�K����.�̄!XP�	vsFU����C�x��⽷�_�J�L���A�����z�p,�0u�I���4������͊�I*�|a{/����B6f����]��iؔ�jW��Q�1�'ؔ@>�C�I��IۥŚ�����Ս;��ւ��!�Am�LmFC��CZ���2�Q
Uh�Ĝmk���p2�����1٫|��3s�e�@�<�	)6k 5=�f�(�\�r�k5��I
+�Q�i���{M.���
�v�!�Z��9Hj5lW��ٵ����M[�/�o&���V��)�1�d��Μ�#o�6�����_c*�E{��o�^2^�Y@�D�'��N�Q)l���� w���A�36qeKaDeL�B~�s-2Q����?w�֗�gl���I���ݾ�¢�[ԲV`�%*����v/�:Z߉kr��ie�L��w#��pD�t:}�n'Wr�Ԅ��[�NA��oG�����)������,����h���3��M�Z��!G!�F �$R���$$��Si�Š� ���fo<��
�����	Ħ�f�����Ϟ�޳?��ڏ^�f�[2�����CyD0�h�Ѫ��g,�>�)�f�����~���]��� V�i���s2]r+!g[�8[ؓ����+�<�B�!������d�OaI�[m$��r�w��Ҷێ@8̀ �uB&+�U�{��l���/wL0v�����    y~HO_�d�E͌\� �\� �P֬o�o
D�Z����;�n��N�T��A+�(B��S��a��?��
�����u2�8�x�;�����N�sB�1ʵ���/ݭ�x�
�S���z��C0fa��)�QH�w�œO���ո�t�K�k���&10��@�7\*��፛~�L���#7����id��4%*EJ�����Y��PZaw܌���B{ncWuZ������U@����	k�5Wk��P�)J�x�!d�܍�p�!TY�x����-�Y�eU©����a5�㰢D>=��ԣO�2�%K�?�M�1�y�Q��x�8}�� t.���vJ����Ύ��4s���}'ĖQ5)���ȹ��q�֜�a���$��+&	���L3�SW��U�!r=��-�8��پ�h/�#!�7!���=	�0|��U5hȪmӅYO|��n!����s\��ӟ-���ح�M3�R6Ʃ�"�W"�+ƫ�ڮ@�m)8�i$�s�q˧f�Z"�~���t��mS!��O_��Ϝx���L�sΊ �V2�}�!�6���e���f���_-��4K�:"��^����O=�Լ��D�D���ѯV��,O�j�pdq }�EÜ���l�'>�L�1nG����=�Ţ�
��)C��S׸�U;�{�E���H�i�ly�7���t�ی��Ӭ�{r���)�� �.�����Nì�\T�j�;I�g��yL�GĶ�cl0-�E�A�ǯ�<�*��0v2ĮO��<���:��C�����>	^I	m��m�՞�9�8l&�S�~�p�����R\��0���CV�����3b��E���u@`��n;]A<8���l.N�;�C��)��3e��&���#��+���@"�獊��8IF��.O�� !7O�W�tڌ
�2�?��Fn���5z�X<�1A�!<K��<�(�ߎ
.s���b>��c�P�a ��z��ڒ��qrF�e7+PwU�>�*g=G�c�#�d�܃1������O˿�5l��ܻ�/Wp�K��}%<�Ь"[7(�;S���TY����u��P���S���2�_�s�����F�h�t�85p�,7�'�,����TZ�v����B���XϜ2�lGq�apsoF�L�d���m>�;x^���'$q"m\�s�}3~�i{��k��Z�~dN�@PXN�d�݇���k�m��?��O�YA'A��R�e�>�5����3�=���=���{��G�lޮ܏M�i;��Q& Ӆ��!�X�!�J�o.��Vq���ke����."�g��?{��-�M���Uxפ�Fl���>�n%����u�FyC9�kU&����ː�%=�qT{7-_�ЃSE���B�!@���Dِ��"�0�����#p5��B�m��d��.UBm�$��l�1�9=m�����z,Fr��(�h,iG)�a[6)�I��.����K�pK�n�q�Ls����bW� h@!��U�����X�0>�.N��=���Wb���0��rAv\i�� ����d�P	�BOebL'��k��sLL��Cj3�9�V(�@ӊ(�Xﴌ�R�I'%<�V��Ţ9����@�Nhv���&�!+��@�����㷕a[�S�xI$�����ئz�b�ݱ�M;�\���vpyo��l�X���1P��5�7���{��p�r�{A/�,��C �~����pc܋l��wL:]󰿝��@5�M8�kr����v1�����e�v��10G�Mp��(��`�D���ǩ���T��5�b��q��Z��L�&��n6��?@L��w��E�������DHN7���c�W��d������)�+��C�p>�]�J\^V򪎙T��yXa�o�M��U���(�/Ϩ�xy�ï\��h�S:)

��v�oA����|F�b$���?'��GS���7���g��1�9�ƾ0�LV��y�D41ؓp#��/�}��cFH�$$�"���Ke��䎯�3�D��3Ěbi&ZIt�%��M
p��i�>�$dGS�`�D��W�h��y��D�e��v/��	�
�/�0������0��9j�Ax"�S��|�e��Õ��w�!����p�,!��܃�	��8�d��zb���&z���?�s��������Ұ���J";�x���Hy4چy�`�hW�%�i��	�8�����c�K�ӳ
+}��T��g+ܺ9���prR��_�����ZU�G�9Ms�?�'C�l�� h��e�g�9��]},�[+�O�y����7<8Al�O�_nB\�/z}޻~�ݽکE�4��A�ؐ��T7�ΠaL�t|Dv/B�m�?Y��v�=T��0,�=�B冿D�q3y��w��P/�2�A�ΝP�0��@m���"[���`�X��u�?��0o���o����^�mbΛb�R��MryB7%n�0���
�O�������WL��s�zĦ�"&R�;�8�k�^ɭ���3(n����&��s�ϑW�3�}w�����

�ZDm��<��M�ʂ�G��e�[GB�e�y�1fՋ�(f���GR�p��m���GQ^5(Z�l�~���7�dƫ�1v(d�|�o��Yr�˱�� �H�;t
��l4^�B�V��';���(��<h	00��?���lHy,�D�ʑ>�9�i�/��_�Ý!���,3�b� W�:��L���_CHڌx[�C*���<��z�2�O
h��Bg䕔6�����\��(��e�=M� �t�Z�����T*BB�<�"Y�m�r>�ݹ��~���	�h����e"��Α�SD���_���<�̙���H�nSиfD��D6|��W�ٖ�KD��}�9�\w�K~��I�8�h�r��U�h����b�M�e��%<�q���r��G��M�~ơ8��x�$%q֢��|�tI�#��o�n��1��$�'KY8A~��z������V6M�IE��jbn����kT��� \�#��9��c~�������J����l*LV�A�٨���v�^���.���Z�L�!�[&�.c�^�{ dG�DR�&���ff�@*͔�Y~������PY=�g��� �����U�`�F\����Y,V9��'��u�ng�`r}	x�|���Q̓�9�r�`�猸ys��:����0�ݣ%'Ds���
����%�#؈�B%"���-�ͽ|��3Y*��c�׿��-W!����/��5�%eF�rո:S�a!�c��+}-�7�_��U�A�JC�9a-�\
:`�	�o�W� ʜ����E��o��E1îv�"�� "d`C>���	���K#'�Owi
 �_���'D)�M� ��(�'h��H��9}:���H��tc�tr�$8l��L\���'�pI�C�F��`1_N�H	�_�Lb�G��\	O�r�h���'	�q���X4�����:�x�����,��3���^X����M�����
i�@��u��.Ia�"B8�Ԫ �73�p&|e3��O)c��%�_gq���`H._uA��D<IYE{?we���A�ʜ��2�R�?���:mCIC�������/{�Q�N��2��0s\P�rf�߮���N�\�qq���e3���J�PK�0#�W�J�!�qT�e���Ă���XD̩*�\����U=��6�� ��B����sV�R�;3$pZ&y�$T��B6:*5o�A��u��fao�$�!��i,3��Zn�E������k�k���di*�}yCT�����2}fKԣ[<�L�K��f.�h��Gk1�:VH�]� ��a�e��ۀ���L�Kk�"�v3Ȯy��ڧ��	�3�ZD�n+p#��+������ȜK�F�XDq�{3M��o�X�����j�폮��Z]�����2�8)��S!�C�o��A����Q�L�O��I�:��
s�N�[�UD�J�H��*�E>�L�����U�ƙN\�� �����Q$�Ė�    ?��y�@$�&U���2��t���1�!!�"ψ�Izi'DI�.ikME��+*,�<pm�8��r_���e*���N��S��DB|2�Z��k	��!lw�HS�K�nA�9!*�U�`V=.-�.�"K` ,���n{��ܞ��B�5�wʹx(Y�ڜ��>��-�z\]�Q{ V���7p�?&y�D�a�밒�f�:G�EeE�2�l�����l$H��Z-���SR{�U��2)��{����ޘ�Lv��U�j����T��$����TJbws��o;pΣ")��M�����zɄ�,(?<���'�:�^g���%{�.ݡ�J�͗=�����?����L�ө�č�EF#�1г���� ��nQ�9"Dt�Q9l�k�j�j��e
��pǺk.6��_3��u.�`���H��ik=i:��2�l��㼄�;��e����eA��7�J2�UE0�������j����e=�UcVJ��m�{�;�A>���5(wB(dEv��֖"�3��3;���T�O�>L 1�%���m��P���y6j˼ߓ�N��9p'c6g�EV��jSh��S�������ߤr*�A^�����A��}������~������c=;�1Q���h3F��$Ɇ�������N��{����/���JX�%MU/��҅�a-�d��5l�|�M�]�������[�� �+ΪW.V�^�P=s��%]7�pk�<�n��@��N�A<h1���w˓����~�)E��8^N�f6H�%��#�
�Ru�(����wx����/-��$�Yѱ�i�kW��`�z���]g"<v�
�� �$�3'���%
r;U�c�����k��;�t�G1+WdhרƀMց����:ʌ�B03�S�ٹ[�4��Oq�" �$#w�?IN��E=�sF�<�u���R����S�2*h��yo,����P�jV(��:x߅�΃�ک\B�i�KW2���J_�o
~H��F�(oS{-+EUV$"��a��&����3�T#��0W���b}V�d����v|Zdn�y0�6�G^�dhv�ђϵ�H��NLH	��lW�eri��e��N��_����Y��'̝,�g�'%�Ru����:�z����ؾ�T���[����8*Bx�Y�\!��:R�BNH�p��D��4�!;�1c���˚ފ�q�P�*E��l3(�SC�|�}ƞE��+M*s����:W)�
\dF�8댔��잳��o�8��y��>��w��J��78�k+"����lL��n+6^iX��%�PE7�����ܿRZ>F\�U�b��/2���6(@�,c>���kS)	�7¬l����d��%���9�4�<�Q9(..U���E�5�C.�=.�-ק�.v��S ���K�1Bda8��~�x��%�`�H���v�v��܉@���	��f�萡��	�{�V��o��?��3�ܤM�M�ה �dO������l���W�8v7��ۑ����.#/>���	И�~�'�ɶCo���c1F��"�0�[��P�+���ԗ���-�g�J_Ѥ�!�?��c��3���*a��QDTiFp{�� 4��lR�+x�[�*������~����K �*qH�e����' ��Ni5x,�������5��VXŤ@y)ӫIm
��u�0N���Ql���EG�j3I�%H��
?Ȃ�#Qmv�}���TT�R=�LY<�Ʉ�0H�WVX\Qq�m�S��
�ck���q�5j�1��~�P�p|�<�����h�nP��,Ǵ����"���l�g t"�/��7Y��С;F��?z5)���Ju�d9�{6����@.�6s��j��B��1�d�H��0A�<��>�/z�.���X�X�}�����_؉@�ǰ^��Xț0|��M�<"b��g'0���υ
0�}+X��-�I��x��F�DC%b��NH�՜�>p���S+Ж�����^������Ϟ��7_��)/:Na���`>XeY�6�?���p�7�\�-�,�	��gov5ʠm�w�~?`yrʢ�j�o�C F��2�녝�z�����s���(���JSı�D�ۼX�(�s�%Ւ�@2�3�q#8=������+����G�
�'��.ȼY��U�����jNfn�����]d$9G{�9T��vb��~��
�|�zf�|��Ĵ��(���2����dd;ћ���� �j�<��X��Qژd���Ѫ��U�ɸv
��
�2��q�R�-���Ru�FeW?#��\jC�Ѷ���-�D��st�p��W��+�d�L�U���I�x}Te�{]�-žtˉc7�7t�_�P^	>�n�rs7Xd���dưO5Pp�T�v�6�;���=ȋ{�Se�&��>d;�*�s����
K?����m�9�F�i�U�(��)<�;�YE�	
	�K���b�'��]	Ųz�ԟ�3D}�VB9˞���oN ��߲�H�fN�&���F�8J��]	�>�6��O2��'�r�b��'��J��tJge��I�(�t�AL���pQkdyZ՚��x�yCO7�UBo�m9X{�]O'~�V�!"^��f���1�j�{:�X��8���sZ�_���f� `B��^���aB;��@ ��q,���(�P�ݵʨ h<�*�Y���a(�@�o�6��+!��S.����xg���5#
B�|Oۙ�U�]v렐P�I�Mt�c�ӽ��h^��qj5��na0�P����%)Y+!U�\f ��5A�;��C~�+�I��0���8�xFTY�\�<!my���G��� ̗��3����{�s�z�z{Z�����Q�V�ڍe�o���ZU�~���G4�I��1�)er�:ő5�ݢ(M�P7���ݭ��P3ҥI�:hԌ7�^�	C8q-6.8�s	""<�E �Ǥ�{3ps�0v��2�h��y�P"JdL�:\��n{B	ɷ���#�,U�l"N���;�VCq�b�������J���w��W�~�}�w���*J噇�,wb(6YH���)��O��	�Q��}Q�S�R���<����\w�*I_��;����㷞���K�"힐@]�>3�����ˉ��!-�F���1�S>j�y]}ŋDD�$UB0o�][�`�t�*n%�'XI�ӽ蕺��������RD��,6�K�%��DP,������b�RQ�};M�釪��D]�T� Y�F6$կ*8<c@�*z��?������TQ�i��6��Ҩ ��y}�<���� �B���ֈ
�c+e,A�V��-��[��!�����[
�_Y�C^��6Q�e_`J���U���ӽ���FT�ո�R���IBa��pk��ryG��1��j\?�U��b�(s���[a�R�r?-H�2����g�M�R�0͇�j'ً@�~'@<�	]$ʡvz�B7^��9ۙG<!�O�7z#{8ʊ�iLf�l�� OW��Y�5TJ\��-�7�p�s��"��U��495q6(�6ı��KF�'L�n>#�0��Ȝ��Ce͆W�y�t@�����g�٨/J��"�3wE�����D+Ss�ɹ*�Ŏ�-���f̽�䚬I(L��b��=�
���(d����,�&P��V���ݛ��m���T��0���悈�����xRa/:�C��Y���n���7tI�NJ:�k��$D��{xX��[y�4^�I�S�ݭT��5jS�	
&
�%�[�1my����&�/P�e=���gT�^&�ݹ�V�Hk駊�j!p�~8Z��o�"w��OPq�I��+�pV��P�AID�=QȔ+�8ч�\�%�������R~��*��̨���BƦ�#V5�E�/��"��9�M[9�!��E�:P^�2�U�N�ݔKL�(���f�g�yjIב�Wza�}bOAu.�4Qo�\ Df��G��w��*\�L����O>��*~օ(,Y�D$����H�}� xq�.��Wݞ�fn�N)X#��B�Ū���G���D�Ǥ��z{k!    ��
�m���l�9ύ�Eʐ�1+kG�n�]
x0�O�z7s�z��kՋ�^�^�p���Z�U}��pe���t{�,,ow���k�m�hVd�2E���w*��مO��B�z<��z�g ��`a+d#��q����{���ێ� a�N<�A���?2��]�O�Y��}Ѳ�D�yY�`^���yr���������z�g���?H�c��{��_�Mu�0��)����j�(X�7\�њ���R�%�Bmx8���L&���c�i[�\�d��|]���̬ϯK�Hc�����V�4Y%�E����ό�w���A	�Ϥn�u���!�s����m�ꠝ�a�YAM�����Q�d^T�W�<����UX"C���_�cH� 8���a��p�=�]�5�T�ȭI�b��1:^)D=���1HΕ����;c�z\��O�#��LuU�{�#����$'�h!#;˩f��[9ɢ_�v�b[��*�����	u�۩�����E���'¨�W��4*b�.83m/�n��ۜ��%YF
���P�dE�9���d���:m���;Hz4�:�ج����-��Z�M\���;K�����6�,{��Ґ��zh�*���[����r���ӆZ��۔�J�S�l?�t��T��V�O;n&QR;gI�0�#��c���N;!�Id�%���_ʯL5�T���=�z�;��{-��y�9���O5(g��ej/��F���b (Ńr�6l�?�p^I����X�ר�(�c���򑼸 ��8��S��K�����io�s����j�-{R���#Gi:8�X�8	��
Y��(��ۨ�,��MeWb��Z�L��Y\؆��=�m&�!����7w�~K�i\Ul�Y��%Ǵ��)XǈRs�!�*��Y\7��)����SSۓT�m�9�a�)�jh�U떤�g�O����������QA��w�������.;����*�C*̃��{�K�r���MI_f���ے�m�w�5q��a�E3����M.����>y�.r1|�	ẘm^�j�žf��̂vd#-I�>���`y���$�ë�A�,b�����wX������©3߹����o����Q6T��"�h<=�,��<���c���|,��Y�єn�2�C�;��x������T n��kYc���#����wJ!�Se�v�pWD��b�N��SGNʣ:�@��=�$/�]&æ%E���!+�Ӆ�P���|<��%��z��/�b�26��́�m�@�6�E��S�DX+��Jo��G���$"#D1H�9��x����.��j0*z�^�PWX>n��Ŝ"�^ĭr���vr,
�)j��&��뎃�Y�.�A�n��:5����SR�)P�.AaJ�]���D�]q�F��E�l��"$�R��;=~����RY��T�ԭd"���¬;ho�xq��+49��,`�xӵ�$fM��B3y����(8��W��}��z���9~n*�YѮ�G�$y
a/��Q�pMVN'�Y�������|��*g�~�|'�YnT�|�F�Lʾ�~��e��Ĥ�^x������^��0��I'������pk� ��a�b�̢ޑb�ǒ���S
�$��^���gv��l'�"TQ}D��dxO����,o�� 5���O2�z�ϖ<�������{'��b.?@�>,�Ɖ�LuV�}BZ�-`T�RCOdU�6��(�&R>����Q9H�4Ƒ\� �"�o���m('��	 Y�w�i�~G�o�5�y���+�,*���G����q�+_�:Z�3�/�F��5*����u����ì���0i�Q�Ml���lKS%��F�z���[�-?�h\w&�pm �L�'c���|�kըg�9����XƇq��ټ�4v�1�� ��k�7�L 3�e�~ٶ&Wi;�l��b^+S�Q0@��0���/��K��ç�*	1��.��o$���"�5�秞�����3?y��3�ȗ3M��U���/�+�M��=@Ugb����4}JJ��9JI;"�cL�:6��_��}�<�x�?�~���7a�����t`�+G�y� ~	^�J���]y}�\آ�WhDڡ�ju�߷��A5�iPu��H��6��!�/z��lN�`c�J�.
�%�R�cQ�(g�P̓��{*9�[�AWڏI�"�_�`�#3
hנJg����:�+mI�6X����J �Ύ�s�N��Q����ְ~PV�V��x-���q��G�cVVs./g�U�ĵOL���?�("r|��E%Y)�`1�+X��� �Gm�,�Y���Yi&k��U�r���YI�H���i�*���|;�a�e��c��uO�
�m�`�rzw�s`�,�v���^�aL�:K粨bc�@�.���2;`�.�]�ϓ���iB�I� �ʒ�_&0�RD��hʑ�|���?�E̗�C��@�$�G)��>+"���]�MG]����_M4CL24j�VDy��4w�Y6\_�'
jm�u�b&[�JcW�Y�Y�,43np���.�\�0�zS1��.��L��7�W��zo��6���r�J.5a!�h�51�&p��H�#��Ev_$�v]ĄTi��V��X���fԣ�*[����ke&�ky�2��L5�u<��Ry��paэçɊb��/Mj��D#���i��4�����3�Z��f9���v)6�L*5�[��j�?M�*!1���9̡o���:�QW]g�zv�ӟV@q���
����f�j"��:1�=��@L���أ?!���<Q�#e����L��g���|�Rn4Ӭ��mYb�rfU�1������3Es>�� ��2Y$��ù$�@�k���,yW�[1z���,U9�.u�t<_�Kk�Íf+�+�K�2�Y���I��˞C_�,����<�FD0�)T�.(J�m&��Η�'��\�ߓ�!���~	�Ź�n��[x-9�-�#y�w3��O}k����������F$���k��?�˿��������g/�'�ߌ��+��z�K\�GB*8A�U�U�A�ax�T@��nXz��Et�q��	��!c1�1�q��"�s@����ر
��&���GYT����G,��'ҍG��)�Q�Y�<KІ�M�]-z7�����
�q���>"�9��9�Y;�Аb���;����]q��Dq�^���p�Z��P@憠�(��m <��XYnvS6��6�x��J:���BI���4�1eaoNB
7��hӒ+�zm�J�ʼ�k������ļX�|@�5�Ѭ� �L�1k���<�}��ic����d���)}�Zm�pZ�(K��`k��a����d_5�KF�A9E���8���Whz�q�a�s�U7�0y��]������'�L$��$eo �u
����Pk��4�mQ�Z�L4Μ�F�TX-:a��y%U�>�=�v$3,���
��z�]=�T�ŊF��l��Ϋ_ofA��X���"9�Q���&[UI:���xPb'�f�r�X'��^�o���������IB~>g�4@}�V�׫ʻL%�iQ��˼\8���U�դ�j�̼rڠ��1 �����������'����H=�<XF/ʊTi�e�f6n�BN��$niY�_���J�Y0-$��� ��7�7j���P�~�j>uԚ;��0�8AS�"E���y����VB(���H����\��>w�Z1{ɋB��KA׊8��3�Ev?���Ws:��d~6����y'+�]�DI��NK�q
�E��������I�s��w�6n��(~C��ķ���!6��c�X��N���KS0��	���t��p��#�"�$��V�g6l��S��̘��DN�~�U�9AmJڙ��8o�=��4���[���Er��?v���brCg�8%�{�mA�9o!�zW6$D�۟�=۳�2�iB�ē�߈�u�|�z��<.V�O��J���.�y��T�Ȑ��7j����RFk�}�>���f�����7�w��kD��>��
7jW���O�ɛ�]��c�x��W^|m���%��7��M�\R�C/���ފ��F}��epn����    �-G����*]$��c!�R�I^����(/�V��1&�P�4��"�9RG�R/���N�]��s���R �>o��� _>!=�^�/9f3��F_f�$�ٞ��MtuK�f9�Z���ZBI�n���y��m>��&�KP�j�9�\
�S>��̭;��g{2���T���1~C�0�]f��#� ����y\r���O����B�VTN����<��ya�xPV�b��W�݄�gqo��z��Di����VE�o5�fLE� ��3�aS>��#�X$q�'��C�1*����lܔ�C��o�	m l�(��΅�vC�Ɓ>�[�N����"cϔ6��.[+�~[�b<�����2@J����� ��f���b�mT��h��:�51�J�#�3���b�ICS �jC$���S���=�H_��b������+5噪��R�b��?U�Լ1�|�+b�+n� Sl:\�yp�c��8��A4�C��e��%@�䄓�M��*��/O��c|c�W������<�h]f^�펬��ɹ�ZZ�Ӣ�9��}��k�Jj!Xl�	ǻ
F�wA�Np��������}�Y���D������]ڼ.E'KǥIE�P�ލ���+e>Dy��R9�?	����=�YtZ�v�S\"��M�,�u-a�-DQ(6Yi�,��k���f�@�C��&M�t�N�y�$HƕR��X�}yN�ƌ^tx̨�T��Z<�輊�u�M?�b��M��R�sy4J�v��O_]x��l��Ȗ=i ��4�.��x�Q/��%H����h��Rl�M�"O�w��F�.}�L��q�rd��4���2Sr6��
����f.k�Y���Q&��*��7A�.�N�竖1��۾k]���p���f%���c�C��Wu(�nf˅���O�췞x�?d��\��k�B��m(:�����
.'�������[��A���ƭ��2�?���>��X���O�<�M&��L�� ���BD��[XZ_v�$��c,^�u'j����܆���W#:Ǘ�����뮋��lѐ��6�'�

k�ͫ��R�rU*��V��ƫ�������#ȥ��o��&�K��X�`��5̲ᶽ�DLI�mI�[J�(�R"�1�s��u nG��B��:qz�zz�Vӛ�HvH��M�'�}�(����˼P��н�ՙU��1q�KPϕ��q�����-6���oY�8@��}�N���	�T�9f�C�׊ݫ�W�H��WL�n'�QvU��&2�O=�ձ��
1x!�|���(�`��~\�����@7������6�Q�9�)����jT��i"jU�
�KzZ��*��^2C�Kh��FZ������Q�dn$RYt��V��R����|�ׁK���u�Y������Y��]��Y87uF�m��-��'I7K��I�Ky�f��T�s-/� Ԯ<���^w�hl���d�xű����l�����Ä��6����1�`;E"�@�������ێ�;#�&�Ϻ��<������h����X��_���NQ@.A��a)YPn.��)w���١�KU0��Y8���=:�*p����E�"z��	K�U^�Z���
�MU��;+A��fV8Jo^t>���dh���W�ȑ�g)#3/;S��q#�1��KH�8`��YNVV�@���9���5��v���zeazJ=eԘJ�|�����0C�=b�r�w��0�x�6�jթ����ڠT�(�Y{Y�EC���}��\T�v[i_�ģ�[�����)C���m3����y���~{��k9f��(�w��m�ۻ�+֊(��Y��U�#�g��r�~�H�S+�G��ܶ¹8�@��Ϟz�?>�O?��}�Q8�c	swޏ�\_Z�����s��kQ1�LC8����U�T�b끿��}0[T�p�nf2�'�Gr�ξ���ɻ�}��5}��a��G��(��G�"v;�k�
QA���:$@�t�܉^K�F}̔���"���+H�[���W�k:��@�� �T�t���Y��?��L�(>�6���l��1�C����F��t�阳�4�
C��S+��}|]0�z�u����^qK�d �KM��Q�¹���{������.T?x���^<_}���/e�x�yy�/z�W�/���TM�=�]Ǧ��Nm����	������#~��K�S�=xkY�=%~��|����z��q����sh�W��#�~4ݎ��ܹ���D^��h�ީ��0t���.
S}F��ƛ( ܧl���I�5����~����}�r /Yo����M;Y���ݷ��A�S��>�OͰ2�*o�]&Z�(Ao�TV$�tȟ[DM��C���'\u#{Sњ��d	�[Y��_Dgb�f{ɸ��m�U^-.��²a�`N�ȹ*X!�_ڳ�|����X$U���n���l6u�3�#��CڒV�T2��h!Y���~V+�yP�����F�.��!F�k��}��/�D
�U=?eH�G��������Z�4.�Q�빆�#˃"vm���z✄��L�{�\��_=�lƒp<0؍�����r���5�"c�^:Yղ�	���vbrn)Ք���RrP%�`;���{*��,r���W�~#���+���{�n����^¤��gWX]�"RU�d����H!A��#�N?>�[�8�d��WU�r� ���U�C�y�o�\�����f[��Oa�Rr&DY�(�������4N��O�x=JH�|Vu��"M��P$��hLn��W~��Q���O�ms�\�܆ԩ;(��c��V��[�-*��d�(�e����yN���چ!D���аJ!���y�dQ��Fܯ�����C>Uχ���&�hwZ��?ܷ�~GVw��� ͪC	9�����O?��O!�#���rql����5���������~��_>��:P���%;5~6�}Y :�_��/�?3���4���l�6$�dqB�(`�N9���ޛ�}rV]�#MVoQK"k�vL�TV��l^lK���ܖ�Zw4����+���]�Y�%D��8�yB0���̙������ߔ�X7Ѥ9�!?�2�������RLɜ.�N����m�� <AP��nȘ��G�E��O|��\���E{Et"ܐ^�)%�F�|F��%�oJ��Q^������O�M��dT�t7_���\&v��孕z�AV�Fs�bQ+YL�Sp>d��aDO�]x<�b���q�q�q)ד6���8�:\��}ݧQ��x��)�������A�����y�^�lI�]:^"c���F��6�ݱ�:�sxЋ�}h{�Z�W�(���y5� ���:�k�yB��qP�,���)(6^	�M�X��ۻn��z����m����$��z��L"�3ZH[NY����J�@��9c�v BRN=x�#bm>�6BWm�$�n,�9�K*@��YjB�i���I���{NX��E&b!����6�o��6,��U��������a@v�wU��,.�@�����j2�����i��:�}���Lw���"�H��I	�{������Ê����}��w���F�;�P��������z*ǁ���E�:��n�E���t� �����pT0����T��&�C/ghY��*U��X�(w')GN#�~�J�* �H���r���2u���p���^C���ن���[��;i�-r�#ϻ�%����H�\�(E��k�V@��A���Q�QS�8���=�I� G��H�J��d�M�6T�u�X t�~q�Fi�Vr�㵂CçDi�*dD�{A�k^$�D�,�C��K`���@�N��
�N=�	�����=~��'��g_z����Ԕ���)Nh�݌;5�^�񭈹��NЁh��h��-��d82��Qh�n�lٕ�_�� ����r�(E�'+2'�ȫU�ف�(���/ 
UJ���hV4���u�">
�]�;��. ㉓^��7�o5�*-:���
�H���yF�<���������R|�y �  � ."#�.),����(�����o�B��s�tD*�T�V�ī]�����^�jh��h�.,t����\=����u����>d�����e�:7�&*c�HEڧ����T�韗����Z�tBS)�w�r��b&��NϹ���I*�������L�+�<RR�4TP�'�E�(��{��y�8��TʌVʹ�1��������e�J׫��)A'�eV�Վ=�ED �����2����+�����O��<�HH�ؑ��J6�@[)xI��3A�0�e52�e+3!lX[��[E��(4L�Ƌ���ۦA~�w���弘����.��@2�?}!�S6ے;�|�,c�Q!e�齘�G��#R���?���ei����
�vW�Z�-���6k�0�&��l4�qR<cW��Ȥ<�E������/K�ox�o1zNqvv�"���k�EF��#��Ü�$� ���Ir�+m�k��=H�2H�O
���2A�WR?�>�����;Z�<鼰z@�'NB��TO:�N��n(%�	����Q��-���!����^��T�?Vz�Ms�x# �}Q�09������Rq�E%�ɛ���^1��ݖ�ML�^N�6L����(�J�8T�1a���D��b�M伃(`a�,��)k)��KEN�^�����m���+uU���sQa��i�����K�������\}j������uh��W�@�嗫��t��^�t���ު.�rɰ�������ת�����?������|��������_z��������̅W_t��תKo��l���-���g_���ŋU��nn�V/\8��_������_�p��K�_�T=��O�������}��w�%�{��j�~���"v�9�,� {h�I���D�k|u�H�[4�RG^��c������� .<���~���ZO�ੇ��7Nl�>���� `|�F`�"�+N���S
��o���E����J�D'�V4�����]�V��LWW�!��Θ�:�AQW���&%̓ث����Q�I.�J1��&K���|����>�u�8�\�`��1�;��!̛~ɠ�b3o���c�=3� F��n0�d��2�p���T��KP�Y^'f�4\N{ntm��vS�@�w%*�D+b�qJ6W����y*�M�3c_CU�;fI{�ʢU���1��A\�	�JC>��* �/E�VH�r-�����ɺ�{�+k��E%��g�~ʋ�0��9I��/�Ŕ7���:��or;3��w$��Y�'B�����g�o�9=�����ĎL�u@S#�T���ww���?�g6S�Ꭹ��v�����"s,]��b����Ǒ�녗�)���l�MCee���������Ǒ���?
(�!O��V혮�K����^O�v�h���T8�*���N�@���@���Fr�8+}��ZM~P�ѽ�e�Xx�3���YC֕�p�u�m�")��h&2�4U�:&An��T��L�N����k6
�F���j��ԕ�ľ�~�Isob��,���߽�l�iM�y��i�KZs�7q�<�N$
!k,�0F̙^��8Y\ �b�8�	p�ˎ�+��])�H<)12�2]�Z*6������l��X'��d����+
��+����J�P�S�4*tɲ��:�!�[��e"8��`涰��L��rѾ<hA��/R�E�t+U�{A7��YU& k�� ��}�'�2)yB
�W�;r'r��d�@'�o5|����̸�4���&��w�����,���{Y\�=�88dA�9��|h��-+��)�.圱�a�Uk�;�kU����#ڿ|gM`�t0���=.���zf�[��So���}��w��=|zU;�ۊ��M+��8���?���=���o��g�Ѐ�^����.P�      �     x�UO1N�0�ׯ�%��]^�����Kr`s@:
$(((< tA$roX��u@ᐥY��gv6�dF��%�kUVa����T��V�RN@DBqD�߱w7?p�kw�.8�b�o�&]���]�r����4�3�*���dXd��l���mmڅ�&�>��Py{�� ��.�$��2����[�+v�/����M +k�aьA<e�tNv[n;�/����Կ��`�-a���B�'҂��BD��f!c�
��      �   �  x������0���S䶷�t�R�{@H{Z�׽X��8qpܪ���.@/�8�x�,P5ۖ�+��h�v�R�Z�*ROf>��{q���k��:Jd�7�1S���j��pgư�_x�`�W��?q�	�3i8�.��r���S���AG*�a��<��3�'8Uy��i����G��
/�v�Ա�s!l���ޒPVs�4��TI�����Z����[��
>��[���[3	�1��FO�O��Mh>�
�Y���X�!��ԼH_{�{�	V��G똙Y���;�`�*?qԟs�{� `Ď�H��x6<rc?���ʑ?�oz�H����%�����P��[�fjX��fFb?���Lf9WL��T)���="�6D��8FJeM�Z�y�h_�6�n_Z�f��~F�L_s&�2Je _P��L� �2�V���r�!+�     