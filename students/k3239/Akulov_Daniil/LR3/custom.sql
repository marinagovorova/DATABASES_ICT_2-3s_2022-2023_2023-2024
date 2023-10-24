PGDMP      '            	    {            postgres    16.0    16.0 P    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            X           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4951                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            Y           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16492    client    TABLE     n  CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying(50),
    passportid character varying(10),
    phonenumber character varying(11),
    email character varying(100),
    address character varying(100),
    CONSTRAINT client_email_check CHECK (((email)::text ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'::text)),
    CONSTRAINT client_passportid_check CHECK (((passportid)::text ~ '^[0-9]{10}$'::text)),
    CONSTRAINT client_phonenumber_check CHECK (((phonenumber)::text ~ '^[0-9]{11}$'::text))
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16491    client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.client_id_seq;
       public          postgres    false    217            Z           0    0    client_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;
          public          postgres    false    216            �            1259    16592    credit    TABLE       CREATE TABLE public.credit (
    id integer NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(30) NOT NULL,
    minimumamount integer NOT NULL,
    interestrate real NOT NULL,
    CONSTRAINT credit_minimumamount_check CHECK ((minimumamount > 0))
);
    DROP TABLE public.credit;
       public         heap    postgres    false            �            1259    16600    credit_agreement    TABLE       CREATE TABLE public.credit_agreement (
    id integer NOT NULL,
    currencyid integer NOT NULL,
    creditid integer NOT NULL,
    employeeid integer NOT NULL,
    clientid integer NOT NULL,
    dayofaccrual integer NOT NULL,
    plannedclosingdate date NOT NULL,
    interestamount integer DEFAULT 0,
    currentdebt integer NOT NULL,
    initialamount integer NOT NULL,
    dateofopening date NOT NULL,
    dateofclosing date,
    CONSTRAINT credit_agreement_dayofaccrual_check CHECK (((dayofaccrual > 0) AND (dayofaccrual < 29)))
);
 $   DROP TABLE public.credit_agreement;
       public         heap    postgres    false            �            1259    16599    credit_agreement_id_seq    SEQUENCE     �   CREATE SEQUENCE public.credit_agreement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.credit_agreement_id_seq;
       public          postgres    false    232            [           0    0    credit_agreement_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.credit_agreement_id_seq OWNED BY public.credit_agreement.id;
          public          postgres    false    231            �            1259    16591    credit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.credit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.credit_id_seq;
       public          postgres    false    230            \           0    0    credit_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.credit_id_seq OWNED BY public.credit.id;
          public          postgres    false    229            �            1259    16628    credit_payment_schedule    TABLE     �   CREATE TABLE public.credit_payment_schedule (
    creditagreementid integer NOT NULL,
    plannedpaymentdate date NOT NULL,
    actualpaymentdate date,
    interestpayment integer,
    creditpayment integer
);
 +   DROP TABLE public.credit_payment_schedule;
       public         heap    postgres    false            �            1259    16527    currency    TABLE     Z   CREATE TABLE public.currency (
    id integer NOT NULL,
    name character varying(30)
);
    DROP TABLE public.currency;
       public         heap    postgres    false            �            1259    16526    currency_id_seq    SEQUENCE     �   CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.currency_id_seq;
       public          postgres    false    223            ]           0    0    currency_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;
          public          postgres    false    222            �            1259    16534    deposit    TABLE       CREATE TABLE public.deposit (
    id integer NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(30) NOT NULL,
    minimumamount integer NOT NULL,
    interestrate real NOT NULL,
    CONSTRAINT deposit_minimumamount_check CHECK ((minimumamount > 0))
);
    DROP TABLE public.deposit;
       public         heap    postgres    false            �            1259    16543    deposit_agreement    TABLE     �  CREATE TABLE public.deposit_agreement (
    id integer NOT NULL,
    currencyid integer NOT NULL,
    depositid integer NOT NULL,
    employeeid integer NOT NULL,
    clientid integer NOT NULL,
    dayofaccrual integer NOT NULL,
    plannedclosingdate date NOT NULL,
    amountofpayments integer DEFAULT 0,
    initialamount integer NOT NULL,
    dateofopening date NOT NULL,
    dateofclosing date,
    CONSTRAINT deposit_agreement_dayofaccrual_check CHECK (((dayofaccrual > 0) AND (dayofaccrual < 29)))
);
 %   DROP TABLE public.deposit_agreement;
       public         heap    postgres    false            �            1259    16542    deposit_agreement_id_seq    SEQUENCE     �   CREATE SEQUENCE public.deposit_agreement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.deposit_agreement_id_seq;
       public          postgres    false    227            ^           0    0    deposit_agreement_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.deposit_agreement_id_seq OWNED BY public.deposit_agreement.id;
          public          postgres    false    226            �            1259    16533    deposit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.deposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.deposit_id_seq;
       public          postgres    false    225            _           0    0    deposit_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.deposit_id_seq OWNED BY public.deposit.id;
          public          postgres    false    224            �            1259    16581    deposit_payment_schedule    TABLE     �   CREATE TABLE public.deposit_payment_schedule (
    depositagreementid integer NOT NULL,
    plannedpaymentdate date NOT NULL,
    actualpaymentdate date,
    paymentamount integer
);
 ,   DROP TABLE public.deposit_payment_schedule;
       public         heap    postgres    false            �            1259    16510    employee    TABLE       CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying(50),
    passportid character varying(10),
    phonenumber character varying(11),
    email character varying(100),
    address character varying(100),
    dateofbirth character varying(10),
    salary integer,
    categoryid integer,
    CONSTRAINT employee_email_check CHECK (((email)::text ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'::text)),
    CONSTRAINT employee_passportid_check CHECK (((passportid)::text ~ '^[0-9]{10}$'::text)),
    CONSTRAINT employee_phonenumber_check CHECK (((phonenumber)::text ~ '^[0-9]{11}$'::text)),
    CONSTRAINT employee_salary_check CHECK ((salary > 0))
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    16502    employee_category    TABLE     �   CREATE TABLE public.employee_category (
    id integer NOT NULL,
    description character varying(200),
    salary integer,
    name character varying(30),
    CONSTRAINT employee_category_salary_check CHECK ((salary > 0))
);
 %   DROP TABLE public.employee_category;
       public         heap    postgres    false            �            1259    16501    employee_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.employee_category_id_seq;
       public          postgres    false    219            `           0    0    employee_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.employee_category_id_seq OWNED BY public.employee_category.id;
          public          postgres    false    218            �            1259    16509    employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.employee_id_seq;
       public          postgres    false    221            a           0    0    employee_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;
          public          postgres    false    220            |           2604    16495 	   client id    DEFAULT     f   ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);
 8   ALTER TABLE public.client ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16595 	   credit id    DEFAULT     f   ALTER TABLE ONLY public.credit ALTER COLUMN id SET DEFAULT nextval('public.credit_id_seq'::regclass);
 8   ALTER TABLE public.credit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    16603    credit_agreement id    DEFAULT     z   ALTER TABLE ONLY public.credit_agreement ALTER COLUMN id SET DEFAULT nextval('public.credit_agreement_id_seq'::regclass);
 B   ALTER TABLE public.credit_agreement ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232                       2604    16530    currency id    DEFAULT     j   ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);
 :   ALTER TABLE public.currency ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16537 
   deposit id    DEFAULT     h   ALTER TABLE ONLY public.deposit ALTER COLUMN id SET DEFAULT nextval('public.deposit_id_seq'::regclass);
 9   ALTER TABLE public.deposit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    16546    deposit_agreement id    DEFAULT     |   ALTER TABLE ONLY public.deposit_agreement ALTER COLUMN id SET DEFAULT nextval('public.deposit_agreement_id_seq'::regclass);
 C   ALTER TABLE public.deposit_agreement ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            ~           2604    16513    employee id    DEFAULT     j   ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);
 :   ALTER TABLE public.employee ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            }           2604    16505    employee_category id    DEFAULT     |   ALTER TABLE ONLY public.employee_category ALTER COLUMN id SET DEFAULT nextval('public.employee_category_id_seq'::regclass);
 C   ALTER TABLE public.employee_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            A          0    16492    client 
   TABLE DATA           S   COPY public.client (id, name, passportid, phonenumber, email, address) FROM stdin;
    public          postgres    false    217   vh       N          0    16592    credit 
   TABLE DATA           T   COPY public.credit (id, description, name, minimumamount, interestrate) FROM stdin;
    public          postgres    false    230   vi       P          0    16600    credit_agreement 
   TABLE DATA           �   COPY public.credit_agreement (id, currencyid, creditid, employeeid, clientid, dayofaccrual, plannedclosingdate, interestamount, currentdebt, initialamount, dateofopening, dateofclosing) FROM stdin;
    public          postgres    false    232   2j       Q          0    16628    credit_payment_schedule 
   TABLE DATA           �   COPY public.credit_payment_schedule (creditagreementid, plannedpaymentdate, actualpaymentdate, interestpayment, creditpayment) FROM stdin;
    public          postgres    false    233   �j       G          0    16527    currency 
   TABLE DATA           ,   COPY public.currency (id, name) FROM stdin;
    public          postgres    false    223   �j       I          0    16534    deposit 
   TABLE DATA           U   COPY public.deposit (id, description, name, minimumamount, interestrate) FROM stdin;
    public          postgres    false    225   �j       K          0    16543    deposit_agreement 
   TABLE DATA           �   COPY public.deposit_agreement (id, currencyid, depositid, employeeid, clientid, dayofaccrual, plannedclosingdate, amountofpayments, initialamount, dateofopening, dateofclosing) FROM stdin;
    public          postgres    false    227   �j       L          0    16581    deposit_payment_schedule 
   TABLE DATA           |   COPY public.deposit_payment_schedule (depositagreementid, plannedpaymentdate, actualpaymentdate, paymentamount) FROM stdin;
    public          postgres    false    228   k       E          0    16510    employee 
   TABLE DATA           v   COPY public.employee (id, name, passportid, phonenumber, email, address, dateofbirth, salary, categoryid) FROM stdin;
    public          postgres    false    221   7k       C          0    16502    employee_category 
   TABLE DATA           J   COPY public.employee_category (id, description, salary, name) FROM stdin;
    public          postgres    false    219   �k       b           0    0    client_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.client_id_seq', 4, true);
          public          postgres    false    216            c           0    0    credit_agreement_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.credit_agreement_id_seq', 2, true);
          public          postgres    false    231            d           0    0    credit_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.credit_id_seq', 2, true);
          public          postgres    false    229            e           0    0    currency_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.currency_id_seq', 2, true);
          public          postgres    false    222            f           0    0    deposit_agreement_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.deposit_agreement_id_seq', 1, false);
          public          postgres    false    226            g           0    0    deposit_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.deposit_id_seq', 1, false);
          public          postgres    false    224            h           0    0    employee_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.employee_category_id_seq', 2, true);
          public          postgres    false    218            i           0    0    employee_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.employee_id_seq', 7, true);
          public          postgres    false    220            �           2606    16500    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    217            �           2606    16607 &   credit_agreement credit_agreement_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.credit_agreement DROP CONSTRAINT credit_agreement_pkey;
       public            postgres    false    232            �           2606    16632 4   credit_payment_schedule credit_payment_schedule_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.credit_payment_schedule
    ADD CONSTRAINT credit_payment_schedule_pkey PRIMARY KEY (creditagreementid, plannedpaymentdate);
 ^   ALTER TABLE ONLY public.credit_payment_schedule DROP CONSTRAINT credit_payment_schedule_pkey;
       public            postgres    false    233    233            �           2606    16598    credit credit_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.credit
    ADD CONSTRAINT credit_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.credit DROP CONSTRAINT credit_pkey;
       public            postgres    false    230            �           2606    16532    currency currency_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.currency DROP CONSTRAINT currency_pkey;
       public            postgres    false    223            �           2606    16550 (   deposit_agreement deposit_agreement_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.deposit_agreement DROP CONSTRAINT deposit_agreement_pkey;
       public            postgres    false    227            �           2606    16585 6   deposit_payment_schedule deposit_payment_schedule_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.deposit_payment_schedule
    ADD CONSTRAINT deposit_payment_schedule_pkey PRIMARY KEY (depositagreementid, plannedpaymentdate);
 `   ALTER TABLE ONLY public.deposit_payment_schedule DROP CONSTRAINT deposit_payment_schedule_pkey;
       public            postgres    false    228    228            �           2606    16540    deposit deposit_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.deposit DROP CONSTRAINT deposit_pkey;
       public            postgres    false    225            �           2606    16508 (   employee_category employee_category_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.employee_category
    ADD CONSTRAINT employee_category_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.employee_category DROP CONSTRAINT employee_category_pkey;
       public            postgres    false    219            �           2606    16520    employee employee_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    221            �           2606    16623 /   credit_agreement credit_agreement_clientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(id);
 Y   ALTER TABLE ONLY public.credit_agreement DROP CONSTRAINT credit_agreement_clientid_fkey;
       public          postgres    false    217    4755    232            �           2606    16613 /   credit_agreement credit_agreement_creditid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_creditid_fkey FOREIGN KEY (creditid) REFERENCES public.credit(id);
 Y   ALTER TABLE ONLY public.credit_agreement DROP CONSTRAINT credit_agreement_creditid_fkey;
       public          postgres    false    4769    230    232            �           2606    16608 1   credit_agreement credit_agreement_currencyid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_currencyid_fkey FOREIGN KEY (currencyid) REFERENCES public.currency(id);
 [   ALTER TABLE ONLY public.credit_agreement DROP CONSTRAINT credit_agreement_currencyid_fkey;
       public          postgres    false    4761    232    223            �           2606    16618 1   credit_agreement credit_agreement_employeeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_agreement
    ADD CONSTRAINT credit_agreement_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(id);
 [   ALTER TABLE ONLY public.credit_agreement DROP CONSTRAINT credit_agreement_employeeid_fkey;
       public          postgres    false    232    221    4759            �           2606    16633 F   credit_payment_schedule credit_payment_schedule_creditagreementid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_payment_schedule
    ADD CONSTRAINT credit_payment_schedule_creditagreementid_fkey FOREIGN KEY (creditagreementid) REFERENCES public.credit_agreement(id);
 p   ALTER TABLE ONLY public.credit_payment_schedule DROP CONSTRAINT credit_payment_schedule_creditagreementid_fkey;
       public          postgres    false    4771    232    233            �           2606    16566 1   deposit_agreement deposit_agreement_clientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(id);
 [   ALTER TABLE ONLY public.deposit_agreement DROP CONSTRAINT deposit_agreement_clientid_fkey;
       public          postgres    false    227    217    4755            �           2606    16551 3   deposit_agreement deposit_agreement_currencyid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_currencyid_fkey FOREIGN KEY (currencyid) REFERENCES public.currency(id);
 ]   ALTER TABLE ONLY public.deposit_agreement DROP CONSTRAINT deposit_agreement_currencyid_fkey;
       public          postgres    false    227    223    4761            �           2606    16556 2   deposit_agreement deposit_agreement_depositid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_depositid_fkey FOREIGN KEY (depositid) REFERENCES public.deposit(id);
 \   ALTER TABLE ONLY public.deposit_agreement DROP CONSTRAINT deposit_agreement_depositid_fkey;
       public          postgres    false    225    4763    227            �           2606    16561 3   deposit_agreement deposit_agreement_employeeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deposit_agreement
    ADD CONSTRAINT deposit_agreement_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(id);
 ]   ALTER TABLE ONLY public.deposit_agreement DROP CONSTRAINT deposit_agreement_employeeid_fkey;
       public          postgres    false    227    221    4759            �           2606    16586 I   deposit_payment_schedule deposit_payment_schedule_depositagreementid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deposit_payment_schedule
    ADD CONSTRAINT deposit_payment_schedule_depositagreementid_fkey FOREIGN KEY (depositagreementid) REFERENCES public.deposit_agreement(id);
 s   ALTER TABLE ONLY public.deposit_payment_schedule DROP CONSTRAINT deposit_payment_schedule_depositagreementid_fkey;
       public          postgres    false    228    4765    227            �           2606    16521 !   employee employee_categoryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.employee_category(id);
 K   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_categoryid_fkey;
       public          postgres    false    4757    219    221            A   �   x�E�MJ1�יS� et�4Mv=��mGڵV����S����3gx��/u!Y$/���~�oh�J4h%^�C�	��5v<o%�){z��c'2���3^���.�Co��(���׋�/Ng�X	|0�E3�+(�/�r�h�=:�<�p�6H�#��Y�I�J⑁�2��X���IO�X'�;��X���9��י5�l:Y-��|9���<�;|��'M�-��*\����1C<%'i�$�p�      N   �   x�����0D�v[ �p�5C1�"�T -�!Z�툱Oܱdkv<z��ங�N�bA�J0��J3�ڣ�Z��׫�'�����kGF������[�mr��ߥ+a��<^��`a&*�X�(�@O���kf���g�pA�$7��	��.�����Xk���J      P   H   x�=���0�x�D���� ��ѢF��q	!qc@Q�%�&��H�C���zBp�6�W��V���V���l      Q   #   x�3�4202�54�52���453 a�=... R      G      x�3�,*M����� �7      I      x������ � �      K      x������ � �      L      x������ � �      E   �   x�%�;
�0���S� %6�ymĥnRT(�vpqr�AQJ�=×���=��%��F���qC�&���/����D@�0]$���i�5Y���x%��M^��*��r1�(��{���߄�
��x�X�0�}m�	!���2��H���y2F�)el)c��P      C   t   x�e�A
�@ϻ���&�YQ�A���(YŘ/T��Y��@3U�&q�2G&T��T��Ň{d�Y'��qc����Ƣ�/y@���֮�ei��:��]�%.�UW��*���e_     