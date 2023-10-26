PGDMP  ,    6            	    {            itmo_bd    16.0    16.0 l    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    16520    itmo_bd    DATABASE     {   CREATE DATABASE itmo_bd WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE itmo_bd;
                postgres    false            �            1259    16522    alien    TABLE     \   CREATE TABLE public.alien (
    id_alien integer NOT NULL,
    humanoid integer NOT NULL
);
    DROP TABLE public.alien;
       public         heap    postgres    false            �            1259    16521    alien_id_alien_seq    SEQUENCE     �   CREATE SEQUENCE public.alien_id_alien_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.alien_id_alien_seq;
       public          postgres    false    216            =           0    0    alien_id_alien_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.alien_id_alien_seq OWNED BY public.alien.id_alien;
          public          postgres    false    215            �            1259    16572    arms    TABLE     �   CREATE TABLE public.arms (
    id_arms integer NOT NULL,
    quantity integer,
    fingers integer NOT NULL,
    CONSTRAINT quantity CHECK ((quantity >= 0))
);
    DROP TABLE public.arms;
       public         heap    postgres    false            �            1259    16571    arms_id_arms_seq    SEQUENCE     �   CREATE SEQUENCE public.arms_id_arms_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.arms_id_arms_seq;
       public          postgres    false    229            >           0    0    arms_id_arms_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.arms_id_arms_seq OWNED BY public.arms.id_arms;
          public          postgres    false    228            �            1259    16588    bodies    TABLE     �   CREATE TABLE public.bodies (
    id_bodies integer NOT NULL,
    type character varying NOT NULL,
    CONSTRAINT type CHECK (((type)::text = ANY ((ARRAY['human'::character varying, 'alien'::character varying, 'unknown'::character varying])::text[])))
);
    DROP TABLE public.bodies;
       public         heap    postgres    false            �            1259    16587    bodies_id_bodies_seq    SEQUENCE     �   CREATE SEQUENCE public.bodies_id_bodies_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.bodies_id_bodies_seq;
       public          postgres    false    233            ?           0    0    bodies_id_bodies_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.bodies_id_bodies_seq OWNED BY public.bodies.id_bodies;
          public          postgres    false    232            �            1259    16606    fingers    TABLE     W   CREATE TABLE public.fingers (
    id_fingers integer NOT NULL,
    quantity integer
);
    DROP TABLE public.fingers;
       public         heap    postgres    false            �            1259    16605    fingers_id_fingers_seq    SEQUENCE     �   CREATE SEQUENCE public.fingers_id_fingers_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.fingers_id_fingers_seq;
       public          postgres    false    237            @           0    0    fingers_id_fingers_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.fingers_id_fingers_seq OWNED BY public.fingers.id_fingers;
          public          postgres    false    236            �            1259    16579    hair    TABLE     a   CREATE TABLE public.hair (
    id_hair integer NOT NULL,
    color character varying NOT NULL
);
    DROP TABLE public.hair;
       public         heap    postgres    false            �            1259    16578    hair_id_hair_seq    SEQUENCE     �   CREATE SEQUENCE public.hair_id_hair_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.hair_id_hair_seq;
       public          postgres    false    231            A           0    0    hair_id_hair_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.hair_id_hair_seq OWNED BY public.hair.id_hair;
          public          postgres    false    230            �            1259    16529    human    TABLE     �   CREATE TABLE public.human (
    id_human integer NOT NULL,
    having_belief boolean,
    humanoid integer NOT NULL,
    pasport integer NOT NULL
);
    DROP TABLE public.human;
       public         heap    postgres    false            �            1259    16528    human_id_human_seq    SEQUENCE     �   CREATE SEQUENCE public.human_id_human_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.human_id_human_seq;
       public          postgres    false    218            B           0    0    human_id_human_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.human_id_human_seq OWNED BY public.human.id_human;
          public          postgres    false    217            �            1259    16554    human_theory    TABLE     d   CREATE TABLE public.human_theory (
    id_theory integer NOT NULL,
    id_human integer NOT NULL
);
     DROP TABLE public.human_theory;
       public         heap    postgres    false            �            1259    16536    humanoid    TABLE     �   CREATE TABLE public.humanoid (
    id_humanoid integer NOT NULL,
    legs integer NOT NULL,
    arms integer NOT NULL,
    hair integer NOT NULL,
    bodies integer NOT NULL,
    skin integer NOT NULL
);
    DROP TABLE public.humanoid;
       public         heap    postgres    false            �            1259    16535    humanoid_id_humanoid_seq    SEQUENCE     �   CREATE SEQUENCE public.humanoid_id_humanoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.humanoid_id_humanoid_seq;
       public          postgres    false    220            C           0    0    humanoid_id_humanoid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.humanoid_id_humanoid_seq OWNED BY public.humanoid.id_humanoid;
          public          postgres    false    219            �            1259    16565    legs    TABLE     �   CREATE TABLE public.legs (
    id_legs integer NOT NULL,
    quantity integer,
    fingers integer NOT NULL,
    CONSTRAINT quantity CHECK ((quantity >= 0))
);
    DROP TABLE public.legs;
       public         heap    postgres    false            �            1259    16564    legs_id_legs_seq    SEQUENCE     �   CREATE SEQUENCE public.legs_id_legs_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.legs_id_legs_seq;
       public          postgres    false    227            D           0    0    legs_id_legs_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.legs_id_legs_seq OWNED BY public.legs.id_legs;
          public          postgres    false    226            �            1259    16543    pasport    TABLE     �   CREATE TABLE public.pasport (
    id_pasport integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    age integer NOT NULL,
    CONSTRAINT age CHECK ((age > 13))
);
    DROP TABLE public.pasport;
       public         heap    postgres    false            �            1259    16542    pasport_id_pasport_seq    SEQUENCE     �   CREATE SEQUENCE public.pasport_id_pasport_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pasport_id_pasport_seq;
       public          postgres    false    222            E           0    0    pasport_id_pasport_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pasport_id_pasport_seq OWNED BY public.pasport.id_pasport;
          public          postgres    false    221            �            1259    16597    skin    TABLE     a   CREATE TABLE public.skin (
    id_skin integer NOT NULL,
    color character varying NOT NULL
);
    DROP TABLE public.skin;
       public         heap    postgres    false            �            1259    16596    skin_id_skin_seq    SEQUENCE     �   CREATE SEQUENCE public.skin_id_skin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.skin_id_skin_seq;
       public          postgres    false    235            F           0    0    skin_id_skin_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.skin_id_skin_seq OWNED BY public.skin.id_skin;
          public          postgres    false    234            �            1259    16558    theory    TABLE     �   CREATE TABLE public.theory (
    id_theory integer NOT NULL,
    number integer,
    CONSTRAINT number_greater_than_zero CHECK ((number > 0))
);
    DROP TABLE public.theory;
       public         heap    postgres    false            �            1259    16557    theory_id_theory_seq    SEQUENCE     �   CREATE SEQUENCE public.theory_id_theory_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.theory_id_theory_seq;
       public          postgres    false    225            G           0    0    theory_id_theory_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.theory_id_theory_seq OWNED BY public.theory.id_theory;
          public          postgres    false    224            P           2604    16525    alien id_alien    DEFAULT     p   ALTER TABLE ONLY public.alien ALTER COLUMN id_alien SET DEFAULT nextval('public.alien_id_alien_seq'::regclass);
 =   ALTER TABLE public.alien ALTER COLUMN id_alien DROP DEFAULT;
       public          postgres    false    215    216    216            V           2604    16575    arms id_arms    DEFAULT     l   ALTER TABLE ONLY public.arms ALTER COLUMN id_arms SET DEFAULT nextval('public.arms_id_arms_seq'::regclass);
 ;   ALTER TABLE public.arms ALTER COLUMN id_arms DROP DEFAULT;
       public          postgres    false    229    228    229            X           2604    16591    bodies id_bodies    DEFAULT     t   ALTER TABLE ONLY public.bodies ALTER COLUMN id_bodies SET DEFAULT nextval('public.bodies_id_bodies_seq'::regclass);
 ?   ALTER TABLE public.bodies ALTER COLUMN id_bodies DROP DEFAULT;
       public          postgres    false    233    232    233            Z           2604    16609    fingers id_fingers    DEFAULT     x   ALTER TABLE ONLY public.fingers ALTER COLUMN id_fingers SET DEFAULT nextval('public.fingers_id_fingers_seq'::regclass);
 A   ALTER TABLE public.fingers ALTER COLUMN id_fingers DROP DEFAULT;
       public          postgres    false    236    237    237            W           2604    16582    hair id_hair    DEFAULT     l   ALTER TABLE ONLY public.hair ALTER COLUMN id_hair SET DEFAULT nextval('public.hair_id_hair_seq'::regclass);
 ;   ALTER TABLE public.hair ALTER COLUMN id_hair DROP DEFAULT;
       public          postgres    false    230    231    231            Q           2604    16532    human id_human    DEFAULT     p   ALTER TABLE ONLY public.human ALTER COLUMN id_human SET DEFAULT nextval('public.human_id_human_seq'::regclass);
 =   ALTER TABLE public.human ALTER COLUMN id_human DROP DEFAULT;
       public          postgres    false    217    218    218            R           2604    16539    humanoid id_humanoid    DEFAULT     |   ALTER TABLE ONLY public.humanoid ALTER COLUMN id_humanoid SET DEFAULT nextval('public.humanoid_id_humanoid_seq'::regclass);
 C   ALTER TABLE public.humanoid ALTER COLUMN id_humanoid DROP DEFAULT;
       public          postgres    false    220    219    220            U           2604    16568    legs id_legs    DEFAULT     l   ALTER TABLE ONLY public.legs ALTER COLUMN id_legs SET DEFAULT nextval('public.legs_id_legs_seq'::regclass);
 ;   ALTER TABLE public.legs ALTER COLUMN id_legs DROP DEFAULT;
       public          postgres    false    227    226    227            S           2604    16546    pasport id_pasport    DEFAULT     x   ALTER TABLE ONLY public.pasport ALTER COLUMN id_pasport SET DEFAULT nextval('public.pasport_id_pasport_seq'::regclass);
 A   ALTER TABLE public.pasport ALTER COLUMN id_pasport DROP DEFAULT;
       public          postgres    false    222    221    222            Y           2604    16600    skin id_skin    DEFAULT     l   ALTER TABLE ONLY public.skin ALTER COLUMN id_skin SET DEFAULT nextval('public.skin_id_skin_seq'::regclass);
 ;   ALTER TABLE public.skin ALTER COLUMN id_skin DROP DEFAULT;
       public          postgres    false    234    235    235            T           2604    16561    theory id_theory    DEFAULT     t   ALTER TABLE ONLY public.theory ALTER COLUMN id_theory SET DEFAULT nextval('public.theory_id_theory_seq'::regclass);
 ?   ALTER TABLE public.theory ALTER COLUMN id_theory DROP DEFAULT;
       public          postgres    false    224    225    225            !          0    16522    alien 
   TABLE DATA           3   COPY public.alien (id_alien, humanoid) FROM stdin;
    public          postgres    false    216   �t       .          0    16572    arms 
   TABLE DATA           :   COPY public.arms (id_arms, quantity, fingers) FROM stdin;
    public          postgres    false    229   u       2          0    16588    bodies 
   TABLE DATA           1   COPY public.bodies (id_bodies, type) FROM stdin;
    public          postgres    false    233   6u       6          0    16606    fingers 
   TABLE DATA           7   COPY public.fingers (id_fingers, quantity) FROM stdin;
    public          postgres    false    237   cu       0          0    16579    hair 
   TABLE DATA           .   COPY public.hair (id_hair, color) FROM stdin;
    public          postgres    false    231   �u       #          0    16529    human 
   TABLE DATA           K   COPY public.human (id_human, having_belief, humanoid, pasport) FROM stdin;
    public          postgres    false    218   �u       (          0    16554    human_theory 
   TABLE DATA           ;   COPY public.human_theory (id_theory, id_human) FROM stdin;
    public          postgres    false    223   �u       %          0    16536    humanoid 
   TABLE DATA           O   COPY public.humanoid (id_humanoid, legs, arms, hair, bodies, skin) FROM stdin;
    public          postgres    false    220   v       ,          0    16565    legs 
   TABLE DATA           :   COPY public.legs (id_legs, quantity, fingers) FROM stdin;
    public          postgres    false    227   Av       '          0    16543    pasport 
   TABLE DATA           A   COPY public.pasport (id_pasport, name, surname, age) FROM stdin;
    public          postgres    false    222   pv       4          0    16597    skin 
   TABLE DATA           .   COPY public.skin (id_skin, color) FROM stdin;
    public          postgres    false    235   �v       *          0    16558    theory 
   TABLE DATA           3   COPY public.theory (id_theory, number) FROM stdin;
    public          postgres    false    225   �v       H           0    0    alien_id_alien_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.alien_id_alien_seq', 1, true);
          public          postgres    false    215            I           0    0    arms_id_arms_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.arms_id_arms_seq', 3, true);
          public          postgres    false    228            J           0    0    bodies_id_bodies_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.bodies_id_bodies_seq', 3, true);
          public          postgres    false    232            K           0    0    fingers_id_fingers_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.fingers_id_fingers_seq', 3, true);
          public          postgres    false    236            L           0    0    hair_id_hair_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.hair_id_hair_seq', 4, true);
          public          postgres    false    230            M           0    0    human_id_human_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.human_id_human_seq', 4, true);
          public          postgres    false    217            N           0    0    humanoid_id_humanoid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.humanoid_id_humanoid_seq', 9, true);
          public          postgres    false    219            O           0    0    legs_id_legs_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.legs_id_legs_seq', 3, true);
          public          postgres    false    226            P           0    0    pasport_id_pasport_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.pasport_id_pasport_seq', 3, true);
          public          postgres    false    221            Q           0    0    skin_id_skin_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.skin_id_skin_seq', 5, true);
          public          postgres    false    234            R           0    0    theory_id_theory_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.theory_id_theory_seq', 3, true);
          public          postgres    false    224            a           2606    16527    alien alien_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_pkey PRIMARY KEY (id_alien);
 :   ALTER TABLE ONLY public.alien DROP CONSTRAINT alien_pkey;
       public            postgres    false    216            y           2606    16577    arms arms_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.arms
    ADD CONSTRAINT arms_pkey PRIMARY KEY (id_arms);
 8   ALTER TABLE ONLY public.arms DROP CONSTRAINT arms_pkey;
       public            postgres    false    229            ~           2606    16595    bodies bodies_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.bodies
    ADD CONSTRAINT bodies_pkey PRIMARY KEY (id_bodies);
 <   ALTER TABLE ONLY public.bodies DROP CONSTRAINT bodies_pkey;
       public            postgres    false    233            �           2606    16688 
   skin color 
   CONSTRAINT     V   ALTER TABLE ONLY public.skin
    ADD CONSTRAINT color UNIQUE (color) INCLUDE (color);
 4   ALTER TABLE ONLY public.skin DROP CONSTRAINT color;
       public            postgres    false    235            �           2606    16611    fingers fingers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.fingers
    ADD CONSTRAINT fingers_pkey PRIMARY KEY (id_fingers);
 >   ALTER TABLE ONLY public.fingers DROP CONSTRAINT fingers_pkey;
       public            postgres    false    237            |           2606    16586    hair hair_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.hair
    ADD CONSTRAINT hair_pkey PRIMARY KEY (id_hair);
 8   ALTER TABLE ONLY public.hair DROP CONSTRAINT hair_pkey;
       public            postgres    false    231            f           2606    16534    human human_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.human
    ADD CONSTRAINT human_pkey PRIMARY KEY (id_human);
 :   ALTER TABLE ONLY public.human DROP CONSTRAINT human_pkey;
       public            postgres    false    218            m           2606    16541    humanoid humanoid_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT humanoid_pkey PRIMARY KEY (id_humanoid);
 @   ALTER TABLE ONLY public.humanoid DROP CONSTRAINT humanoid_pkey;
       public            postgres    false    220            w           2606    16570    legs legs_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.legs
    ADD CONSTRAINT legs_pkey PRIMARY KEY (id_legs);
 8   ALTER TABLE ONLY public.legs DROP CONSTRAINT legs_pkey;
       public            postgres    false    227            s           2606    16690    theory number 
   CONSTRAINT     [   ALTER TABLE ONLY public.theory
    ADD CONSTRAINT number UNIQUE (number) INCLUDE (number);
 7   ALTER TABLE ONLY public.theory DROP CONSTRAINT number;
       public            postgres    false    225            o           2606    16550    pasport pasport_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pasport
    ADD CONSTRAINT pasport_pkey PRIMARY KEY (id_pasport);
 >   ALTER TABLE ONLY public.pasport DROP CONSTRAINT pasport_pkey;
       public            postgres    false    222            �           2606    16604    skin skin_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.skin
    ADD CONSTRAINT skin_pkey PRIMARY KEY (id_skin);
 8   ALTER TABLE ONLY public.skin DROP CONSTRAINT skin_pkey;
       public            postgres    false    235            u           2606    16563    theory theory_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.theory
    ADD CONSTRAINT theory_pkey PRIMARY KEY (id_theory);
 <   ALTER TABLE ONLY public.theory DROP CONSTRAINT theory_pkey;
       public            postgres    false    225            g           1259    16659    fki_arms_fkey    INDEX     B   CREATE INDEX fki_arms_fkey ON public.humanoid USING btree (arms);
 !   DROP INDEX public.fki_arms_fkey;
       public            postgres    false    220            h           1259    16671    fki_bodies_fkey    INDEX     F   CREATE INDEX fki_bodies_fkey ON public.humanoid USING btree (bodies);
 #   DROP INDEX public.fki_bodies_fkey;
       public            postgres    false    220            z           1259    16623    fki_fingers_fkey    INDEX     D   CREATE INDEX fki_fingers_fkey ON public.arms USING btree (fingers);
 $   DROP INDEX public.fki_fingers_fkey;
       public            postgres    false    229            i           1259    16665    fki_hair_fkey    INDEX     B   CREATE INDEX fki_hair_fkey ON public.humanoid USING btree (hair);
 !   DROP INDEX public.fki_hair_fkey;
       public            postgres    false    220            b           1259    16617    fki_humanoid    INDEX     B   CREATE INDEX fki_humanoid ON public.alien USING btree (humanoid);
     DROP INDEX public.fki_humanoid;
       public            postgres    false    216            c           1259    16629    fki_humanoid_fkey    INDEX     G   CREATE INDEX fki_humanoid_fkey ON public.human USING btree (humanoid);
 %   DROP INDEX public.fki_humanoid_fkey;
       public            postgres    false    218            p           1259    16647    fki_id_human_fkey    INDEX     N   CREATE INDEX fki_id_human_fkey ON public.human_theory USING btree (id_human);
 %   DROP INDEX public.fki_id_human_fkey;
       public            postgres    false    223            q           1259    16641    fki_id_theory_fkey    INDEX     P   CREATE INDEX fki_id_theory_fkey ON public.human_theory USING btree (id_theory);
 &   DROP INDEX public.fki_id_theory_fkey;
       public            postgres    false    223            d           1259    16635    fki_pasport_fkey    INDEX     E   CREATE INDEX fki_pasport_fkey ON public.human USING btree (pasport);
 $   DROP INDEX public.fki_pasport_fkey;
       public            postgres    false    218            j           1259    16677    fki_skin_fkey    INDEX     B   CREATE INDEX fki_skin_fkey ON public.humanoid USING btree (skin);
 !   DROP INDEX public.fki_skin_fkey;
       public            postgres    false    220            k           1259    16653    fki_р    INDEX     =   CREATE INDEX "fki_р" ON public.humanoid USING btree (legs);
    DROP INDEX public."fki_р";
       public            postgres    false    220            �           2606    16654    humanoid arms_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT arms_fkey FOREIGN KEY (arms) REFERENCES public.arms(id_arms);
 <   ALTER TABLE ONLY public.humanoid DROP CONSTRAINT arms_fkey;
       public          postgres    false    220    4729    229            �           2606    16666    humanoid bodies_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT bodies_fkey FOREIGN KEY (bodies) REFERENCES public.bodies(id_bodies);
 >   ALTER TABLE ONLY public.humanoid DROP CONSTRAINT bodies_fkey;
       public          postgres    false    233    220    4734            �           2606    16618    arms fingers_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.arms
    ADD CONSTRAINT fingers_fkey FOREIGN KEY (fingers) REFERENCES public.fingers(id_fingers);
 ;   ALTER TABLE ONLY public.arms DROP CONSTRAINT fingers_fkey;
       public          postgres    false    237    4740    229            �           2606    16678    legs fingers_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.legs
    ADD CONSTRAINT fingers_fkey FOREIGN KEY (fingers) REFERENCES public.fingers(id_fingers);
 ;   ALTER TABLE ONLY public.legs DROP CONSTRAINT fingers_fkey;
       public          postgres    false    237    4740    227            �           2606    16660    humanoid hair_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT hair_fkey FOREIGN KEY (hair) REFERENCES public.hair(id_hair);
 <   ALTER TABLE ONLY public.humanoid DROP CONSTRAINT hair_fkey;
       public          postgres    false    231    220    4732            �           2606    16612    alien humanoid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.alien
    ADD CONSTRAINT humanoid_fkey FOREIGN KEY (humanoid) REFERENCES public.humanoid(id_humanoid);
 =   ALTER TABLE ONLY public.alien DROP CONSTRAINT humanoid_fkey;
       public          postgres    false    216    4717    220            �           2606    16624    human humanoid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.human
    ADD CONSTRAINT humanoid_fkey FOREIGN KEY (humanoid) REFERENCES public.humanoid(id_humanoid);
 =   ALTER TABLE ONLY public.human DROP CONSTRAINT humanoid_fkey;
       public          postgres    false    218    220    4717            �           2606    16642    human_theory id_human_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.human_theory
    ADD CONSTRAINT id_human_fkey FOREIGN KEY (id_human) REFERENCES public.human(id_human);
 D   ALTER TABLE ONLY public.human_theory DROP CONSTRAINT id_human_fkey;
       public          postgres    false    4710    223    218            �           2606    16636    human_theory id_theory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.human_theory
    ADD CONSTRAINT id_theory_fkey FOREIGN KEY (id_theory) REFERENCES public.theory(id_theory);
 E   ALTER TABLE ONLY public.human_theory DROP CONSTRAINT id_theory_fkey;
       public          postgres    false    223    225    4725            �           2606    16648    humanoid legs_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT legs_fkey FOREIGN KEY (legs) REFERENCES public.legs(id_legs);
 <   ALTER TABLE ONLY public.humanoid DROP CONSTRAINT legs_fkey;
       public          postgres    false    4727    220    227            �           2606    16630    human pasport_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.human
    ADD CONSTRAINT pasport_fkey FOREIGN KEY (pasport) REFERENCES public.pasport(id_pasport);
 <   ALTER TABLE ONLY public.human DROP CONSTRAINT pasport_fkey;
       public          postgres    false    222    4719    218            �           2606    16672    humanoid skin_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.humanoid
    ADD CONSTRAINT skin_fkey FOREIGN KEY (skin) REFERENCES public.skin(id_skin);
 <   ALTER TABLE ONLY public.humanoid DROP CONSTRAINT skin_fkey;
       public          postgres    false    220    235    4738            !      x�3�4����� k       .      x�3�44�4�2�44RƜ�@W� -�L      2      x�3��(�M��2�L��L������ A;T      6      x�3�44�2�46�2�42����� ��      0   *   x�3�L*�/��2�L���KI�22���L8�RS�b���� �K	�      #      x�3�,�4�4�2�L�4�4����� #^�      (      x������ � �      %      x�3�4�A.#N8�2�@CNc�=... ek�      ,      x�3�44�4�2�44RƜ�@W� -�L      '   2   x�3������t�O�46�2��J�K�L��9s2S�8#8�M�b���� �
^      4   *   x�3�,��,I�2�L�IL��2ҥ�\&��E��y\1z\\\ ��	�      *      x�3�41�2�433�2�44 A�=... 0x�     