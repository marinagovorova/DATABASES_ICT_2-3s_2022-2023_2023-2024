toc.dat                                                                                             0000600 0004000 0002000 00000111500 14536110234 0014434 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   7    7                {            Restaurant_db    16.1    16.1 r    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16577    Restaurant_db    DATABASE     �   CREATE DATABASE "Restaurant_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Restaurant_db";
                postgres    false                     2615    16578 	   restauran    SCHEMA        CREATE SCHEMA restauran;
    DROP SCHEMA restauran;
                postgres    false         �           0    0    SCHEMA restauran    COMMENT     9   COMMENT ON SCHEMA restauran IS 'standard public schema';
                   postgres    false    5         �            1259    16579    cost    TABLE     �   CREATE TABLE restauran.cost (
    id_dish integer NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_by timestamp without time zone NOT NULL,
    cost_id integer NOT NULL,
    CONSTRAINT cost_check CHECK ((date_from <= date_by))
);
    DROP TABLE restauran.cost;
    	   restauran         heap    postgres    false    5         �            1259    16583    cost_cost_id_seq    SEQUENCE     �   CREATE SEQUENCE restauran.cost_cost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE restauran.cost_cost_id_seq;
    	   restauran          postgres    false    5    215         �           0    0    cost_cost_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE restauran.cost_cost_id_seq OWNED BY restauran.cost.cost_id;
       	   restauran          postgres    false    216         �            1259    16584    dish    TABLE     �   CREATE TABLE restauran.dish (
    id_dish integer NOT NULL,
    dish_type character varying(20) NOT NULL,
    name character varying(30) NOT NULL,
    CONSTRAINT dish_dish_type_check CHECK (((dish_type)::text ~ '^[А-Яа-я]+$'::text))
);
    DROP TABLE restauran.dish;
    	   restauran         heap    postgres    false    5         �            1259    16588    dish_composition    TABLE     !  CREATE TABLE restauran.dish_composition (
    id_dish integer NOT NULL,
    id_ingredient integer NOT NULL,
    ingredient_volume integer NOT NULL,
    dish_composition_id integer NOT NULL,
    measure_unit character varying(15) NOT NULL,
    CONSTRAINT check_measure CHECK (((measure_unit)::text = ANY (ARRAY[('мл'::character varying)::text, ('гр'::character varying)::text, ('кг'::character varying)::text, ('шт'::character varying)::text]))),
    CONSTRAINT dish_composition_ingredient_volume_check CHECK ((ingredient_volume > 0))
);
 '   DROP TABLE restauran.dish_composition;
    	   restauran         heap    postgres    false    5         �            1259    16592 (   dish_composition_dish_composition_id_seq    SEQUENCE     �   CREATE SEQUENCE restauran.dish_composition_dish_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE restauran.dish_composition_dish_composition_id_seq;
    	   restauran          postgres    false    218    5         �           0    0 (   dish_composition_dish_composition_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE restauran.dish_composition_dish_composition_id_seq OWNED BY restauran.dish_composition.dish_composition_id;
       	   restauran          postgres    false    219         �            1259    16593    dish_id_dish_seq    SEQUENCE     �   CREATE SEQUENCE restauran.dish_id_dish_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE restauran.dish_id_dish_seq;
    	   restauran          postgres    false    5    217         �           0    0    dish_id_dish_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE restauran.dish_id_dish_seq OWNED BY restauran.dish.id_dish;
       	   restauran          postgres    false    220         �            1259    16594    employee    TABLE     �   CREATE TABLE restauran.employee (
    id_employee integer NOT NULL,
    passport_data character varying(100) NOT NULL,
    fio character varying(50) NOT NULL,
    id_post integer NOT NULL
);
    DROP TABLE restauran.employee;
    	   restauran         heap    postgres    false    5         �            1259    16597    employee_id_employee_seq    SEQUENCE     �   CREATE SEQUENCE restauran.employee_id_employee_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE restauran.employee_id_employee_seq;
    	   restauran          postgres    false    5    221         �           0    0    employee_id_employee_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE restauran.employee_id_employee_seq OWNED BY restauran.employee.id_employee;
       	   restauran          postgres    false    222         �            1259    16598 
   ingredient    TABLE     �  CREATE TABLE restauran.ingredient (
    id_ingredient integer NOT NULL,
    name character varying(40) NOT NULL,
    product_type character varying(20) NOT NULL,
    required_stock double precision NOT NULL,
    quantity_in_stock double precision NOT NULL,
    caloric_content integer NOT NULL,
    CONSTRAINT ingredient_caloric_content_check CHECK ((caloric_content >= 0)),
    CONSTRAINT ingredient_required_stock_check CHECK ((required_stock > (0)::double precision))
);
 !   DROP TABLE restauran.ingredient;
    	   restauran         heap    postgres    false    5         �            1259    16603    ingredient_id_ingredient_seq    SEQUENCE     �   CREATE SEQUENCE restauran.ingredient_id_ingredient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE restauran.ingredient_id_ingredient_seq;
    	   restauran          postgres    false    5    223         �           0    0    ingredient_id_ingredient_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE restauran.ingredient_id_ingredient_seq OWNED BY restauran.ingredient.id_ingredient;
       	   restauran          postgres    false    224         �            1259    16604    order_composition    TABLE     C  CREATE TABLE restauran.order_composition (
    id_dish integer NOT NULL,
    id_order integer NOT NULL,
    number_of_servings integer NOT NULL,
    ready_status character varying(14) NOT NULL,
    order_composition_id integer NOT NULL,
    CONSTRAINT order_composition_number_of_servings_check CHECK ((number_of_servings > 0)),
    CONSTRAINT order_composition_ready_status_check CHECK (((ready_status)::text = ANY (ARRAY[('Готово'::character varying)::text, ('Взято в работу'::character varying)::text, ('В ожидании'::character varying)::text])))
);
 (   DROP TABLE restauran.order_composition;
    	   restauran         heap    postgres    false    5         �            1259    16609 *   order_composition_order_composition_id_seq    SEQUENCE     �   CREATE SEQUENCE restauran.order_composition_order_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE restauran.order_composition_order_composition_id_seq;
    	   restauran          postgres    false    5    225         �           0    0 *   order_composition_order_composition_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE restauran.order_composition_order_composition_id_seq OWNED BY restauran.order_composition.order_composition_id;
       	   restauran          postgres    false    226         �            1259    16610    orders    TABLE     ;  CREATE TABLE restauran.orders (
    id_order integer NOT NULL,
    order_date timestamp without time zone NOT NULL,
    book_date timestamp without time zone,
    cost numeric NOT NULL,
    id_waiter integer NOT NULL,
    id_table integer NOT NULL,
    CONSTRAINT orders_cost_check CHECK ((cost > (0)::numeric))
);
    DROP TABLE restauran.orders;
    	   restauran         heap    postgres    false    5         �            1259    16616    orders_id_order_seq    SEQUENCE     �   CREATE SEQUENCE restauran.orders_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE restauran.orders_id_order_seq;
    	   restauran          postgres    false    5    227         �           0    0    orders_id_order_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE restauran.orders_id_order_seq OWNED BY restauran.orders.id_order;
       	   restauran          postgres    false    228         �            1259    16617    post    TABLE     �   CREATE TABLE restauran.post (
    id_post integer NOT NULL,
    name character varying(30) NOT NULL,
    salary numeric NOT NULL,
    CONSTRAINT post_salary_check CHECK ((salary > (0)::numeric))
);
    DROP TABLE restauran.post;
    	   restauran         heap    postgres    false    5         �            1259    16623    post_id_post_seq    SEQUENCE     �   CREATE SEQUENCE restauran.post_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE restauran.post_id_post_seq;
    	   restauran          postgres    false    5    229         �           0    0    post_id_post_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE restauran.post_id_post_seq OWNED BY restauran.post.id_post;
       	   restauran          postgres    false    230         �            1259    16624    purchase    TABLE     !  CREATE TABLE restauran.purchase (
    id_purchase integer NOT NULL,
    puschase_date date NOT NULL,
    provider character varying(30) NOT NULL,
    purchase_volume integer NOT NULL,
    ingredient_price integer NOT NULL,
    id_ingredient integer,
    expiration_date timestamp without time zone NOT NULL,
    remaining_amount_of_ingredient integer NOT NULL,
    measure_unit_purchase character varying(15) NOT NULL,
    CONSTRAINT check_measure CHECK (((measure_unit_purchase)::text = ANY (ARRAY[('мл'::character varying)::text, ('гр'::character varying)::text, ('кг'::character varying)::text, ('шт'::character varying)::text]))),
    CONSTRAINT purchase_ingredient_price_check CHECK ((ingredient_price > 0)),
    CONSTRAINT purchase_purchase_volume_check CHECK ((purchase_volume > 0))
);
    DROP TABLE restauran.purchase;
    	   restauran         heap    postgres    false    5         �            1259    16629    purchase_id_purchase_seq    SEQUENCE     �   CREATE SEQUENCE restauran.purchase_id_purchase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE restauran.purchase_id_purchase_seq;
    	   restauran          postgres    false    5    231         �           0    0    purchase_id_purchase_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE restauran.purchase_id_purchase_seq OWNED BY restauran.purchase.id_purchase;
       	   restauran          postgres    false    232         �            1259    16630    shift    TABLE     �   CREATE TABLE restauran.shift (
    id_shift integer NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_by timestamp without time zone NOT NULL,
    CONSTRAINT shift_check2 CHECK ((date_by >= date_from))
);
    DROP TABLE restauran.shift;
    	   restauran         heap    postgres    false    5         �            1259    16634    shift_id_shift_seq    SEQUENCE     �   CREATE SEQUENCE restauran.shift_id_shift_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE restauran.shift_id_shift_seq;
    	   restauran          postgres    false    5    233         �           0    0    shift_id_shift_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE restauran.shift_id_shift_seq OWNED BY restauran.shift.id_shift;
       	   restauran          postgres    false    234         �            1259    16635    skill    TABLE     �   CREATE TABLE restauran.skill (
    id_employee integer NOT NULL,
    id_dish integer NOT NULL,
    skill_id integer NOT NULL
);
    DROP TABLE restauran.skill;
    	   restauran         heap    postgres    false    5         �            1259    16638    skill_skill_id_seq    SEQUENCE     �   CREATE SEQUENCE restauran.skill_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE restauran.skill_skill_id_seq;
    	   restauran          postgres    false    5    235         �           0    0    skill_skill_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE restauran.skill_skill_id_seq OWNED BY restauran.skill.skill_id;
       	   restauran          postgres    false    236         �            1259    16639    tables    TABLE     �  CREATE TABLE restauran.tables (
    id_table integer NOT NULL,
    cleaning_status character varying(3) NOT NULL,
    reservation_status character varying(3) NOT NULL,
    CONSTRAINT tables_cleaning_status_check CHECK (((cleaning_status)::text = ANY (ARRAY[('Да'::character varying)::text, ('Нет'::character varying)::text]))),
    CONSTRAINT tables_reservation_status_check CHECK (((reservation_status)::text = ANY (ARRAY[('Да'::character varying)::text, ('Нет'::character varying)::text])))
);
    DROP TABLE restauran.tables;
    	   restauran         heap    postgres    false    5         �            1259    16644    tables_id_table_seq    SEQUENCE     �   CREATE SEQUENCE restauran.tables_id_table_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE restauran.tables_id_table_seq;
    	   restauran          postgres    false    5    237         �           0    0    tables_id_table_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE restauran.tables_id_table_seq OWNED BY restauran.tables.id_table;
       	   restauran          postgres    false    238         �            1259    16645 	   timetable    TABLE     �  CREATE TABLE restauran.timetable (
    id_employee integer NOT NULL,
    id_shift integer NOT NULL,
    status_at_work character varying(10) NOT NULL,
    timetable_id integer NOT NULL,
    CONSTRAINT timetable_status_at_work_check CHECK (((status_at_work)::text = ANY (ARRAY[('По графику'::character varying)::text, ('Доп'::character varying)::text, ('Больн'::character varying)::text, ('Отгул'::character varying)::text])))
);
     DROP TABLE restauran.timetable;
    	   restauran         heap    postgres    false    5         �            1259    16649    timetable_timetable_id_seq    SEQUENCE     �   CREATE SEQUENCE restauran.timetable_timetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE restauran.timetable_timetable_id_seq;
    	   restauran          postgres    false    5    239         �           0    0    timetable_timetable_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE restauran.timetable_timetable_id_seq OWNED BY restauran.timetable.timetable_id;
       	   restauran          postgres    false    240         �           2604    16651    cost cost_id    DEFAULT     r   ALTER TABLE ONLY restauran.cost ALTER COLUMN cost_id SET DEFAULT nextval('restauran.cost_cost_id_seq'::regclass);
 >   ALTER TABLE restauran.cost ALTER COLUMN cost_id DROP DEFAULT;
    	   restauran          postgres    false    216    215         �           2604    16654    dish id_dish    DEFAULT     r   ALTER TABLE ONLY restauran.dish ALTER COLUMN id_dish SET DEFAULT nextval('restauran.dish_id_dish_seq'::regclass);
 >   ALTER TABLE restauran.dish ALTER COLUMN id_dish DROP DEFAULT;
    	   restauran          postgres    false    220    217         �           2604    16657 $   dish_composition dish_composition_id    DEFAULT     �   ALTER TABLE ONLY restauran.dish_composition ALTER COLUMN dish_composition_id SET DEFAULT nextval('restauran.dish_composition_dish_composition_id_seq'::regclass);
 V   ALTER TABLE restauran.dish_composition ALTER COLUMN dish_composition_id DROP DEFAULT;
    	   restauran          postgres    false    219    218         �           2604    16799    employee id_employee    DEFAULT     �   ALTER TABLE ONLY restauran.employee ALTER COLUMN id_employee SET DEFAULT nextval('restauran.employee_id_employee_seq'::regclass);
 F   ALTER TABLE restauran.employee ALTER COLUMN id_employee DROP DEFAULT;
    	   restauran          postgres    false    222    221         �           2604    16660    ingredient id_ingredient    DEFAULT     �   ALTER TABLE ONLY restauran.ingredient ALTER COLUMN id_ingredient SET DEFAULT nextval('restauran.ingredient_id_ingredient_seq'::regclass);
 J   ALTER TABLE restauran.ingredient ALTER COLUMN id_ingredient DROP DEFAULT;
    	   restauran          postgres    false    224    223         �           2604    16666 &   order_composition order_composition_id    DEFAULT     �   ALTER TABLE ONLY restauran.order_composition ALTER COLUMN order_composition_id SET DEFAULT nextval('restauran.order_composition_order_composition_id_seq'::regclass);
 X   ALTER TABLE restauran.order_composition ALTER COLUMN order_composition_id DROP DEFAULT;
    	   restauran          postgres    false    226    225         �           2604    16672    orders id_order    DEFAULT     x   ALTER TABLE ONLY restauran.orders ALTER COLUMN id_order SET DEFAULT nextval('restauran.orders_id_order_seq'::regclass);
 A   ALTER TABLE restauran.orders ALTER COLUMN id_order DROP DEFAULT;
    	   restauran          postgres    false    228    227         �           2604    16676    post id_post    DEFAULT     r   ALTER TABLE ONLY restauran.post ALTER COLUMN id_post SET DEFAULT nextval('restauran.post_id_post_seq'::regclass);
 >   ALTER TABLE restauran.post ALTER COLUMN id_post DROP DEFAULT;
    	   restauran          postgres    false    230    229         �           2604    16681    purchase id_purchase    DEFAULT     �   ALTER TABLE ONLY restauran.purchase ALTER COLUMN id_purchase SET DEFAULT nextval('restauran.purchase_id_purchase_seq'::regclass);
 F   ALTER TABLE restauran.purchase ALTER COLUMN id_purchase DROP DEFAULT;
    	   restauran          postgres    false    232    231         �           2604    16685    shift id_shift    DEFAULT     v   ALTER TABLE ONLY restauran.shift ALTER COLUMN id_shift SET DEFAULT nextval('restauran.shift_id_shift_seq'::regclass);
 @   ALTER TABLE restauran.shift ALTER COLUMN id_shift DROP DEFAULT;
    	   restauran          postgres    false    234    233         �           2604    16688    skill skill_id    DEFAULT     v   ALTER TABLE ONLY restauran.skill ALTER COLUMN skill_id SET DEFAULT nextval('restauran.skill_skill_id_seq'::regclass);
 @   ALTER TABLE restauran.skill ALTER COLUMN skill_id DROP DEFAULT;
    	   restauran          postgres    false    236    235         �           2604    16694    tables id_table    DEFAULT     x   ALTER TABLE ONLY restauran.tables ALTER COLUMN id_table SET DEFAULT nextval('restauran.tables_id_table_seq'::regclass);
 A   ALTER TABLE restauran.tables ALTER COLUMN id_table DROP DEFAULT;
    	   restauran          postgres    false    238    237         �           2604    16698    timetable timetable_id    DEFAULT     �   ALTER TABLE ONLY restauran.timetable ALTER COLUMN timetable_id SET DEFAULT nextval('restauran.timetable_timetable_id_seq'::regclass);
 H   ALTER TABLE restauran.timetable ALTER COLUMN timetable_id DROP DEFAULT;
    	   restauran          postgres    false    240    239         h          0    16579    cost 
   TABLE DATA           G   COPY restauran.cost (id_dish, date_from, date_by, cost_id) FROM stdin;
 	   restauran          postgres    false    215       4968.dat j          0    16584    dish 
   TABLE DATA           ;   COPY restauran.dish (id_dish, dish_type, name) FROM stdin;
 	   restauran          postgres    false    217       4970.dat k          0    16588    dish_composition 
   TABLE DATA           {   COPY restauran.dish_composition (id_dish, id_ingredient, ingredient_volume, dish_composition_id, measure_unit) FROM stdin;
 	   restauran          postgres    false    218       4971.dat n          0    16594    employee 
   TABLE DATA           O   COPY restauran.employee (id_employee, passport_data, fio, id_post) FROM stdin;
 	   restauran          postgres    false    221       4974.dat p          0    16598 
   ingredient 
   TABLE DATA           ~   COPY restauran.ingredient (id_ingredient, name, product_type, required_stock, quantity_in_stock, caloric_content) FROM stdin;
 	   restauran          postgres    false    223       4976.dat r          0    16604    order_composition 
   TABLE DATA           y   COPY restauran.order_composition (id_dish, id_order, number_of_servings, ready_status, order_composition_id) FROM stdin;
 	   restauran          postgres    false    225       4978.dat t          0    16610    orders 
   TABLE DATA           _   COPY restauran.orders (id_order, order_date, book_date, cost, id_waiter, id_table) FROM stdin;
 	   restauran          postgres    false    227       4980.dat v          0    16617    post 
   TABLE DATA           8   COPY restauran.post (id_post, name, salary) FROM stdin;
 	   restauran          postgres    false    229       4982.dat x          0    16624    purchase 
   TABLE DATA           �   COPY restauran.purchase (id_purchase, puschase_date, provider, purchase_volume, ingredient_price, id_ingredient, expiration_date, remaining_amount_of_ingredient, measure_unit_purchase) FROM stdin;
 	   restauran          postgres    false    231       4984.dat z          0    16630    shift 
   TABLE DATA           @   COPY restauran.shift (id_shift, date_from, date_by) FROM stdin;
 	   restauran          postgres    false    233       4986.dat |          0    16635    skill 
   TABLE DATA           B   COPY restauran.skill (id_employee, id_dish, skill_id) FROM stdin;
 	   restauran          postgres    false    235       4988.dat ~          0    16639    tables 
   TABLE DATA           R   COPY restauran.tables (id_table, cleaning_status, reservation_status) FROM stdin;
 	   restauran          postgres    false    237       4990.dat �          0    16645 	   timetable 
   TABLE DATA           [   COPY restauran.timetable (id_employee, id_shift, status_at_work, timetable_id) FROM stdin;
 	   restauran          postgres    false    239       4992.dat �           0    0    cost_cost_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('restauran.cost_cost_id_seq', 3, true);
       	   restauran          postgres    false    216         �           0    0 (   dish_composition_dish_composition_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('restauran.dish_composition_dish_composition_id_seq', 3, true);
       	   restauran          postgres    false    219         �           0    0    dish_id_dish_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('restauran.dish_id_dish_seq', 1, false);
       	   restauran          postgres    false    220         �           0    0    employee_id_employee_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('restauran.employee_id_employee_seq', 1, false);
       	   restauran          postgres    false    222         �           0    0    ingredient_id_ingredient_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('restauran.ingredient_id_ingredient_seq', 1, false);
       	   restauran          postgres    false    224         �           0    0 *   order_composition_order_composition_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('restauran.order_composition_order_composition_id_seq', 3, true);
       	   restauran          postgres    false    226         �           0    0    orders_id_order_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('restauran.orders_id_order_seq', 1, false);
       	   restauran          postgres    false    228         �           0    0    post_id_post_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('restauran.post_id_post_seq', 1, false);
       	   restauran          postgres    false    230         �           0    0    purchase_id_purchase_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('restauran.purchase_id_purchase_seq', 1, false);
       	   restauran          postgres    false    232         �           0    0    shift_id_shift_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('restauran.shift_id_shift_seq', 1, false);
       	   restauran          postgres    false    234         �           0    0    skill_skill_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('restauran.skill_skill_id_seq', 3, true);
       	   restauran          postgres    false    236         �           0    0    tables_id_table_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('restauran.tables_id_table_seq', 1, false);
       	   restauran          postgres    false    238         �           0    0    timetable_timetable_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('restauran.timetable_timetable_id_seq', 3, true);
       	   restauran          postgres    false    240         �           2606    16700    cost cost_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY restauran.cost
    ADD CONSTRAINT cost_pkey PRIMARY KEY (cost_id);
 ;   ALTER TABLE ONLY restauran.cost DROP CONSTRAINT cost_pkey;
    	   restauran            postgres    false    215         �           2606    16702 &   dish_composition dish_composition_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_pkey PRIMARY KEY (dish_composition_id);
 S   ALTER TABLE ONLY restauran.dish_composition DROP CONSTRAINT dish_composition_pkey;
    	   restauran            postgres    false    218         �           2606    16704    dish dish_name_unique 
   CONSTRAINT     b   ALTER TABLE ONLY restauran.dish
    ADD CONSTRAINT dish_name_unique UNIQUE (name) INCLUDE (name);
 B   ALTER TABLE ONLY restauran.dish DROP CONSTRAINT dish_name_unique;
    	   restauran            postgres    false    217         �           2606    16707    dish dish_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY restauran.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id_dish);
 ;   ALTER TABLE ONLY restauran.dish DROP CONSTRAINT dish_pkey;
    	   restauran            postgres    false    217         �           2606    16709    employee employee_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id_employee);
 C   ALTER TABLE ONLY restauran.employee DROP CONSTRAINT employee_pkey;
    	   restauran            postgres    false    221         �           2606    16711 !   ingredient ingredient_name_unique 
   CONSTRAINT     n   ALTER TABLE ONLY restauran.ingredient
    ADD CONSTRAINT ingredient_name_unique UNIQUE (name) INCLUDE (name);
 N   ALTER TABLE ONLY restauran.ingredient DROP CONSTRAINT ingredient_name_unique;
    	   restauran            postgres    false    223         �           2606    16713    ingredient ingredient_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY restauran.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id_ingredient);
 G   ALTER TABLE ONLY restauran.ingredient DROP CONSTRAINT ingredient_pkey;
    	   restauran            postgres    false    223         �           2606    16715    post name_unique 
   CONSTRAINT     ]   ALTER TABLE ONLY restauran.post
    ADD CONSTRAINT name_unique UNIQUE (name) INCLUDE (name);
 =   ALTER TABLE ONLY restauran.post DROP CONSTRAINT name_unique;
    	   restauran            postgres    false    229         �           2606    16717 (   order_composition order_composition_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_pkey PRIMARY KEY (order_composition_id);
 U   ALTER TABLE ONLY restauran.order_composition DROP CONSTRAINT order_composition_pkey;
    	   restauran            postgres    false    225         �           2606    16719    orders orders_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);
 ?   ALTER TABLE ONLY restauran.orders DROP CONSTRAINT orders_pkey;
    	   restauran            postgres    false    227         �           2606    16721    employee passport_data_unique 
   CONSTRAINT     |   ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT passport_data_unique UNIQUE (passport_data) INCLUDE (passport_data);
 J   ALTER TABLE ONLY restauran.employee DROP CONSTRAINT passport_data_unique;
    	   restauran            postgres    false    221         �           2606    16723    post post_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY restauran.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id_post);
 ;   ALTER TABLE ONLY restauran.post DROP CONSTRAINT post_pkey;
    	   restauran            postgres    false    229         �           2606    16725    purchase purchase_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY restauran.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id_purchase);
 C   ALTER TABLE ONLY restauran.purchase DROP CONSTRAINT purchase_pkey;
    	   restauran            postgres    false    231         �           2606    16727    shift shift_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY restauran.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (id_shift);
 =   ALTER TABLE ONLY restauran.shift DROP CONSTRAINT shift_pkey;
    	   restauran            postgres    false    233         �           2606    16729    skill skill_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (skill_id);
 =   ALTER TABLE ONLY restauran.skill DROP CONSTRAINT skill_pkey;
    	   restauran            postgres    false    235         �           2606    16731    tables tables_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY restauran.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id_table);
 ?   ALTER TABLE ONLY restauran.tables DROP CONSTRAINT tables_pkey;
    	   restauran            postgres    false    237         �           2606    16733    timetable timetable_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (timetable_id);
 E   ALTER TABLE ONLY restauran.timetable DROP CONSTRAINT timetable_pkey;
    	   restauran            postgres    false    239         �           2606    16734    cost cost_id_dish_fkey    FK CONSTRAINT        ALTER TABLE ONLY restauran.cost
    ADD CONSTRAINT cost_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);
 C   ALTER TABLE ONLY restauran.cost DROP CONSTRAINT cost_id_dish_fkey;
    	   restauran          postgres    false    215    4783    217         �           2606    16739 .   dish_composition dish_composition_id_dish_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);
 [   ALTER TABLE ONLY restauran.dish_composition DROP CONSTRAINT dish_composition_id_dish_fkey;
    	   restauran          postgres    false    4783    217    218         �           2606    16744 4   dish_composition dish_composition_id_ingredient_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES restauran.ingredient(id_ingredient);
 a   ALTER TABLE ONLY restauran.dish_composition DROP CONSTRAINT dish_composition_id_ingredient_fkey;
    	   restauran          postgres    false    4793    223    218         �           2606    16749    employee employee_id_post_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT employee_id_post_fkey FOREIGN KEY (id_post) REFERENCES restauran.post(id_post);
 K   ALTER TABLE ONLY restauran.employee DROP CONSTRAINT employee_id_post_fkey;
    	   restauran          postgres    false    229    4801    221         �           2606    16802    purchase ing    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.purchase
    ADD CONSTRAINT ing FOREIGN KEY (id_ingredient) REFERENCES restauran.ingredient(id_ingredient);
 9   ALTER TABLE ONLY restauran.purchase DROP CONSTRAINT ing;
    	   restauran          postgres    false    4793    223    231         �           2606    16759 0   order_composition order_composition_id_dish_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);
 ]   ALTER TABLE ONLY restauran.order_composition DROP CONSTRAINT order_composition_id_dish_fkey;
    	   restauran          postgres    false    225    4783    217         �           2606    16764 1   order_composition order_composition_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_id_order_fkey FOREIGN KEY (id_order) REFERENCES restauran.orders(id_order);
 ^   ALTER TABLE ONLY restauran.order_composition DROP CONSTRAINT order_composition_id_order_fkey;
    	   restauran          postgres    false    4797    227    225         �           2606    16769    orders orders_id_table_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_id_table_fkey FOREIGN KEY (id_table) REFERENCES restauran.tables(id_table);
 H   ALTER TABLE ONLY restauran.orders DROP CONSTRAINT orders_id_table_fkey;
    	   restauran          postgres    false    4809    237    227         �           2606    16774    orders orders_id_waiter_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_id_waiter_fkey FOREIGN KEY (id_waiter) REFERENCES restauran.employee(id_employee);
 I   ALTER TABLE ONLY restauran.orders DROP CONSTRAINT orders_id_waiter_fkey;
    	   restauran          postgres    false    227    221    4787         �           2606    16779    skill skill_id_dish_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);
 E   ALTER TABLE ONLY restauran.skill DROP CONSTRAINT skill_id_dish_fkey;
    	   restauran          postgres    false    217    4783    235         �           2606    16784    skill skill_id_employee_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES restauran.employee(id_employee);
 I   ALTER TABLE ONLY restauran.skill DROP CONSTRAINT skill_id_employee_fkey;
    	   restauran          postgres    false    235    221    4787         �           2606    16789 $   timetable timetable_id_employee_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES restauran.employee(id_employee);
 Q   ALTER TABLE ONLY restauran.timetable DROP CONSTRAINT timetable_id_employee_fkey;
    	   restauran          postgres    false    4787    239    221         �           2606    16794 !   timetable timetable_id_shift_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_id_shift_fkey FOREIGN KEY (id_shift) REFERENCES restauran.shift(id_shift);
 N   ALTER TABLE ONLY restauran.timetable DROP CONSTRAINT timetable_id_shift_fkey;
    	   restauran          postgres    false    4805    233    239                                                                                                                                                                                                        4968.dat                                                                                            0000600 0004000 0002000 00000000211 14536110234 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-03-07 12:00:00	2023-03-07 12:30:00	1
2	2023-03-08 15:28:00	2023-03-08 15:45:00	2
3	2023-03-08 15:40:00	2023-03-08 16:00:00	3
\.


                                                                                                                                                                                                                                                                                                                                                                                       4970.dat                                                                                            0000600 0004000 0002000 00000000200 14536110234 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	горячее	Мясо по-французски
3	дессерт	Торт "Наполеон"
1	салат	Цезарь
\.


                                                                                                                                                                                                                                                                                                                                                                                                4971.dat                                                                                            0000600 0004000 0002000 00000000054 14536110234 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	3	2	1	шт
2	1	1	2	гр
2	2	1	3	гр
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    4974.dat                                                                                            0000600 0004000 0002000 00000000276 14536110234 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	4018 998445	Иванов Иван Иванович	3
2	5334 584036	Лопаткина Виктория Юрьевна	1
3	3804 638490	Петров Максим Максимович	3
\.


                                                                                                                                                                                                                                                                                                                                  4976.dat                                                                                            0000600 0004000 0002000 00000000164 14536110234 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Говядина	Мясо	8	7	187
1	Лук	Овощи	5	3.5	40
3	Яйцо куриное	Яйца	10	9.2	143
\.


                                                                                                                                                                                                                                                                                                                                                                                                            4978.dat                                                                                            0000600 0004000 0002000 00000000131 14536110234 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	1	2	Взято в работу	1
1	2	1	Готово	2
3	1	1	В ожидании	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                       4980.dat                                                                                            0000600 0004000 0002000 00000000134 14536110234 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-03-07 18:00:00	\N	506.95	1	1
2	2023-03-07 18:36:00	2023-03-07 18:00:00	1263	3	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                    4982.dat                                                                                            0000600 0004000 0002000 00000000114 14536110234 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Повар	60000
2	Шеф-повар	100000
3	Официант	45000
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                    4984.dat                                                                                            0000600 0004000 0002000 00000000351 14536110234 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-06-03	ООО "Огурчик"	100	20	1	2023-03-11 09:00:00	3	кг
2	2023-06-03	"У Молочника"	50	40	3	2023-03-10 09:00:00	40	шт
3	2023-07-03	ООО "Дары природы"	140	50	2	2023-03-08 09:00:00	5	кг
\.


                                                                                                                                                                                                                                                                                       4986.dat                                                                                            0000600 0004000 0002000 00000000203 14536110234 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-03-07 09:00:00	2023-03-07 20:00:00
2	2023-03-07 08:00:00	2023-03-07 20:00:00
3	2023-03-08 08:00:00	2023-03-08 20:00:00
\.


                                                                                                                                                                                                                                                                                                                                                                                             4988.dat                                                                                            0000600 0004000 0002000 00000000027 14536110234 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	2	1
2	1	2
2	3	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         4990.dat                                                                                            0000600 0004000 0002000 00000000057 14536110234 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Да	Нет
2	Нет	Нет
3	Да	Да
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 4992.dat                                                                                            0000600 0004000 0002000 00000000075 14536110234 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	3	По графику	1
3	1	Доп	2
3	2	Отгул	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                   restore.sql                                                                                         0000600 0004000 0002000 00000073057 14536110234 0015377 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

DROP DATABASE "Restaurant_db";
--
-- Name: Restaurant_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Restaurant_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Restaurant_db" OWNER TO postgres;

\connect "Restaurant_db"

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
-- Name: restauran; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA restauran;


ALTER SCHEMA restauran OWNER TO postgres;

--
-- Name: SCHEMA restauran; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA restauran IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cost; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.cost (
    id_dish integer NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_by timestamp without time zone NOT NULL,
    cost_id integer NOT NULL,
    CONSTRAINT cost_check CHECK ((date_from <= date_by))
);


ALTER TABLE restauran.cost OWNER TO postgres;

--
-- Name: cost_cost_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.cost_cost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.cost_cost_id_seq OWNER TO postgres;

--
-- Name: cost_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.cost_cost_id_seq OWNED BY restauran.cost.cost_id;


--
-- Name: dish; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.dish (
    id_dish integer NOT NULL,
    dish_type character varying(20) NOT NULL,
    name character varying(30) NOT NULL,
    CONSTRAINT dish_dish_type_check CHECK (((dish_type)::text ~ '^[А-Яа-я]+$'::text))
);


ALTER TABLE restauran.dish OWNER TO postgres;

--
-- Name: dish_composition; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.dish_composition (
    id_dish integer NOT NULL,
    id_ingredient integer NOT NULL,
    ingredient_volume integer NOT NULL,
    dish_composition_id integer NOT NULL,
    measure_unit character varying(15) NOT NULL,
    CONSTRAINT check_measure CHECK (((measure_unit)::text = ANY (ARRAY[('мл'::character varying)::text, ('гр'::character varying)::text, ('кг'::character varying)::text, ('шт'::character varying)::text]))),
    CONSTRAINT dish_composition_ingredient_volume_check CHECK ((ingredient_volume > 0))
);


ALTER TABLE restauran.dish_composition OWNER TO postgres;

--
-- Name: dish_composition_dish_composition_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.dish_composition_dish_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.dish_composition_dish_composition_id_seq OWNER TO postgres;

--
-- Name: dish_composition_dish_composition_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.dish_composition_dish_composition_id_seq OWNED BY restauran.dish_composition.dish_composition_id;


--
-- Name: dish_id_dish_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.dish_id_dish_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.dish_id_dish_seq OWNER TO postgres;

--
-- Name: dish_id_dish_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.dish_id_dish_seq OWNED BY restauran.dish.id_dish;


--
-- Name: employee; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.employee (
    id_employee integer NOT NULL,
    passport_data character varying(100) NOT NULL,
    fio character varying(50) NOT NULL,
    id_post integer NOT NULL
);


ALTER TABLE restauran.employee OWNER TO postgres;

--
-- Name: employee_id_employee_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.employee_id_employee_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.employee_id_employee_seq OWNER TO postgres;

--
-- Name: employee_id_employee_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.employee_id_employee_seq OWNED BY restauran.employee.id_employee;


--
-- Name: ingredient; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.ingredient (
    id_ingredient integer NOT NULL,
    name character varying(40) NOT NULL,
    product_type character varying(20) NOT NULL,
    required_stock double precision NOT NULL,
    quantity_in_stock double precision NOT NULL,
    caloric_content integer NOT NULL,
    CONSTRAINT ingredient_caloric_content_check CHECK ((caloric_content >= 0)),
    CONSTRAINT ingredient_required_stock_check CHECK ((required_stock > (0)::double precision))
);


ALTER TABLE restauran.ingredient OWNER TO postgres;

--
-- Name: ingredient_id_ingredient_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.ingredient_id_ingredient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.ingredient_id_ingredient_seq OWNER TO postgres;

--
-- Name: ingredient_id_ingredient_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.ingredient_id_ingredient_seq OWNED BY restauran.ingredient.id_ingredient;


--
-- Name: order_composition; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.order_composition (
    id_dish integer NOT NULL,
    id_order integer NOT NULL,
    number_of_servings integer NOT NULL,
    ready_status character varying(14) NOT NULL,
    order_composition_id integer NOT NULL,
    CONSTRAINT order_composition_number_of_servings_check CHECK ((number_of_servings > 0)),
    CONSTRAINT order_composition_ready_status_check CHECK (((ready_status)::text = ANY (ARRAY[('Готово'::character varying)::text, ('Взято в работу'::character varying)::text, ('В ожидании'::character varying)::text])))
);


ALTER TABLE restauran.order_composition OWNER TO postgres;

--
-- Name: order_composition_order_composition_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.order_composition_order_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.order_composition_order_composition_id_seq OWNER TO postgres;

--
-- Name: order_composition_order_composition_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.order_composition_order_composition_id_seq OWNED BY restauran.order_composition.order_composition_id;


--
-- Name: orders; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.orders (
    id_order integer NOT NULL,
    order_date timestamp without time zone NOT NULL,
    book_date timestamp without time zone,
    cost numeric NOT NULL,
    id_waiter integer NOT NULL,
    id_table integer NOT NULL,
    CONSTRAINT orders_cost_check CHECK ((cost > (0)::numeric))
);


ALTER TABLE restauran.orders OWNER TO postgres;

--
-- Name: orders_id_order_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.orders_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.orders_id_order_seq OWNER TO postgres;

--
-- Name: orders_id_order_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.orders_id_order_seq OWNED BY restauran.orders.id_order;


--
-- Name: post; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.post (
    id_post integer NOT NULL,
    name character varying(30) NOT NULL,
    salary numeric NOT NULL,
    CONSTRAINT post_salary_check CHECK ((salary > (0)::numeric))
);


ALTER TABLE restauran.post OWNER TO postgres;

--
-- Name: post_id_post_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.post_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.post_id_post_seq OWNER TO postgres;

--
-- Name: post_id_post_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.post_id_post_seq OWNED BY restauran.post.id_post;


--
-- Name: purchase; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.purchase (
    id_purchase integer NOT NULL,
    puschase_date date NOT NULL,
    provider character varying(30) NOT NULL,
    purchase_volume integer NOT NULL,
    ingredient_price integer NOT NULL,
    id_ingredient integer,
    expiration_date timestamp without time zone NOT NULL,
    remaining_amount_of_ingredient integer NOT NULL,
    measure_unit_purchase character varying(15) NOT NULL,
    CONSTRAINT check_measure CHECK (((measure_unit_purchase)::text = ANY (ARRAY[('мл'::character varying)::text, ('гр'::character varying)::text, ('кг'::character varying)::text, ('шт'::character varying)::text]))),
    CONSTRAINT purchase_ingredient_price_check CHECK ((ingredient_price > 0)),
    CONSTRAINT purchase_purchase_volume_check CHECK ((purchase_volume > 0))
);


ALTER TABLE restauran.purchase OWNER TO postgres;

--
-- Name: purchase_id_purchase_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.purchase_id_purchase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.purchase_id_purchase_seq OWNER TO postgres;

--
-- Name: purchase_id_purchase_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.purchase_id_purchase_seq OWNED BY restauran.purchase.id_purchase;


--
-- Name: shift; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.shift (
    id_shift integer NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_by timestamp without time zone NOT NULL,
    CONSTRAINT shift_check2 CHECK ((date_by >= date_from))
);


ALTER TABLE restauran.shift OWNER TO postgres;

--
-- Name: shift_id_shift_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.shift_id_shift_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.shift_id_shift_seq OWNER TO postgres;

--
-- Name: shift_id_shift_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.shift_id_shift_seq OWNED BY restauran.shift.id_shift;


--
-- Name: skill; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.skill (
    id_employee integer NOT NULL,
    id_dish integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE restauran.skill OWNER TO postgres;

--
-- Name: skill_skill_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.skill_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.skill_skill_id_seq OWNER TO postgres;

--
-- Name: skill_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.skill_skill_id_seq OWNED BY restauran.skill.skill_id;


--
-- Name: tables; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.tables (
    id_table integer NOT NULL,
    cleaning_status character varying(3) NOT NULL,
    reservation_status character varying(3) NOT NULL,
    CONSTRAINT tables_cleaning_status_check CHECK (((cleaning_status)::text = ANY (ARRAY[('Да'::character varying)::text, ('Нет'::character varying)::text]))),
    CONSTRAINT tables_reservation_status_check CHECK (((reservation_status)::text = ANY (ARRAY[('Да'::character varying)::text, ('Нет'::character varying)::text])))
);


ALTER TABLE restauran.tables OWNER TO postgres;

--
-- Name: tables_id_table_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.tables_id_table_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.tables_id_table_seq OWNER TO postgres;

--
-- Name: tables_id_table_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.tables_id_table_seq OWNED BY restauran.tables.id_table;


--
-- Name: timetable; Type: TABLE; Schema: restauran; Owner: postgres
--

CREATE TABLE restauran.timetable (
    id_employee integer NOT NULL,
    id_shift integer NOT NULL,
    status_at_work character varying(10) NOT NULL,
    timetable_id integer NOT NULL,
    CONSTRAINT timetable_status_at_work_check CHECK (((status_at_work)::text = ANY (ARRAY[('По графику'::character varying)::text, ('Доп'::character varying)::text, ('Больн'::character varying)::text, ('Отгул'::character varying)::text])))
);


ALTER TABLE restauran.timetable OWNER TO postgres;

--
-- Name: timetable_timetable_id_seq; Type: SEQUENCE; Schema: restauran; Owner: postgres
--

CREATE SEQUENCE restauran.timetable_timetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE restauran.timetable_timetable_id_seq OWNER TO postgres;

--
-- Name: timetable_timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: restauran; Owner: postgres
--

ALTER SEQUENCE restauran.timetable_timetable_id_seq OWNED BY restauran.timetable.timetable_id;


--
-- Name: cost cost_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.cost ALTER COLUMN cost_id SET DEFAULT nextval('restauran.cost_cost_id_seq'::regclass);


--
-- Name: dish id_dish; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish ALTER COLUMN id_dish SET DEFAULT nextval('restauran.dish_id_dish_seq'::regclass);


--
-- Name: dish_composition dish_composition_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish_composition ALTER COLUMN dish_composition_id SET DEFAULT nextval('restauran.dish_composition_dish_composition_id_seq'::regclass);


--
-- Name: employee id_employee; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.employee ALTER COLUMN id_employee SET DEFAULT nextval('restauran.employee_id_employee_seq'::regclass);


--
-- Name: ingredient id_ingredient; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.ingredient ALTER COLUMN id_ingredient SET DEFAULT nextval('restauran.ingredient_id_ingredient_seq'::regclass);


--
-- Name: order_composition order_composition_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.order_composition ALTER COLUMN order_composition_id SET DEFAULT nextval('restauran.order_composition_order_composition_id_seq'::regclass);


--
-- Name: orders id_order; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.orders ALTER COLUMN id_order SET DEFAULT nextval('restauran.orders_id_order_seq'::regclass);


--
-- Name: post id_post; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.post ALTER COLUMN id_post SET DEFAULT nextval('restauran.post_id_post_seq'::regclass);


--
-- Name: purchase id_purchase; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.purchase ALTER COLUMN id_purchase SET DEFAULT nextval('restauran.purchase_id_purchase_seq'::regclass);


--
-- Name: shift id_shift; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.shift ALTER COLUMN id_shift SET DEFAULT nextval('restauran.shift_id_shift_seq'::regclass);


--
-- Name: skill skill_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.skill ALTER COLUMN skill_id SET DEFAULT nextval('restauran.skill_skill_id_seq'::regclass);


--
-- Name: tables id_table; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.tables ALTER COLUMN id_table SET DEFAULT nextval('restauran.tables_id_table_seq'::regclass);


--
-- Name: timetable timetable_id; Type: DEFAULT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.timetable ALTER COLUMN timetable_id SET DEFAULT nextval('restauran.timetable_timetable_id_seq'::regclass);


--
-- Data for Name: cost; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.cost (id_dish, date_from, date_by, cost_id) FROM stdin;
\.
COPY restauran.cost (id_dish, date_from, date_by, cost_id) FROM '$$PATH$$/4968.dat';

--
-- Data for Name: dish; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.dish (id_dish, dish_type, name) FROM stdin;
\.
COPY restauran.dish (id_dish, dish_type, name) FROM '$$PATH$$/4970.dat';

--
-- Data for Name: dish_composition; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.dish_composition (id_dish, id_ingredient, ingredient_volume, dish_composition_id, measure_unit) FROM stdin;
\.
COPY restauran.dish_composition (id_dish, id_ingredient, ingredient_volume, dish_composition_id, measure_unit) FROM '$$PATH$$/4971.dat';

--
-- Data for Name: employee; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.employee (id_employee, passport_data, fio, id_post) FROM stdin;
\.
COPY restauran.employee (id_employee, passport_data, fio, id_post) FROM '$$PATH$$/4974.dat';

--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.ingredient (id_ingredient, name, product_type, required_stock, quantity_in_stock, caloric_content) FROM stdin;
\.
COPY restauran.ingredient (id_ingredient, name, product_type, required_stock, quantity_in_stock, caloric_content) FROM '$$PATH$$/4976.dat';

--
-- Data for Name: order_composition; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.order_composition (id_dish, id_order, number_of_servings, ready_status, order_composition_id) FROM stdin;
\.
COPY restauran.order_composition (id_dish, id_order, number_of_servings, ready_status, order_composition_id) FROM '$$PATH$$/4978.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.orders (id_order, order_date, book_date, cost, id_waiter, id_table) FROM stdin;
\.
COPY restauran.orders (id_order, order_date, book_date, cost, id_waiter, id_table) FROM '$$PATH$$/4980.dat';

--
-- Data for Name: post; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.post (id_post, name, salary) FROM stdin;
\.
COPY restauran.post (id_post, name, salary) FROM '$$PATH$$/4982.dat';

--
-- Data for Name: purchase; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.purchase (id_purchase, puschase_date, provider, purchase_volume, ingredient_price, id_ingredient, expiration_date, remaining_amount_of_ingredient, measure_unit_purchase) FROM stdin;
\.
COPY restauran.purchase (id_purchase, puschase_date, provider, purchase_volume, ingredient_price, id_ingredient, expiration_date, remaining_amount_of_ingredient, measure_unit_purchase) FROM '$$PATH$$/4984.dat';

--
-- Data for Name: shift; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.shift (id_shift, date_from, date_by) FROM stdin;
\.
COPY restauran.shift (id_shift, date_from, date_by) FROM '$$PATH$$/4986.dat';

--
-- Data for Name: skill; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.skill (id_employee, id_dish, skill_id) FROM stdin;
\.
COPY restauran.skill (id_employee, id_dish, skill_id) FROM '$$PATH$$/4988.dat';

--
-- Data for Name: tables; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.tables (id_table, cleaning_status, reservation_status) FROM stdin;
\.
COPY restauran.tables (id_table, cleaning_status, reservation_status) FROM '$$PATH$$/4990.dat';

--
-- Data for Name: timetable; Type: TABLE DATA; Schema: restauran; Owner: postgres
--

COPY restauran.timetable (id_employee, id_shift, status_at_work, timetable_id) FROM stdin;
\.
COPY restauran.timetable (id_employee, id_shift, status_at_work, timetable_id) FROM '$$PATH$$/4992.dat';

--
-- Name: cost_cost_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.cost_cost_id_seq', 3, true);


--
-- Name: dish_composition_dish_composition_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.dish_composition_dish_composition_id_seq', 3, true);


--
-- Name: dish_id_dish_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.dish_id_dish_seq', 1, false);


--
-- Name: employee_id_employee_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.employee_id_employee_seq', 1, false);


--
-- Name: ingredient_id_ingredient_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.ingredient_id_ingredient_seq', 1, false);


--
-- Name: order_composition_order_composition_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.order_composition_order_composition_id_seq', 3, true);


--
-- Name: orders_id_order_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.orders_id_order_seq', 1, false);


--
-- Name: post_id_post_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.post_id_post_seq', 1, false);


--
-- Name: purchase_id_purchase_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.purchase_id_purchase_seq', 1, false);


--
-- Name: shift_id_shift_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.shift_id_shift_seq', 1, false);


--
-- Name: skill_skill_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.skill_skill_id_seq', 3, true);


--
-- Name: tables_id_table_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.tables_id_table_seq', 1, false);


--
-- Name: timetable_timetable_id_seq; Type: SEQUENCE SET; Schema: restauran; Owner: postgres
--

SELECT pg_catalog.setval('restauran.timetable_timetable_id_seq', 3, true);


--
-- Name: cost cost_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.cost
    ADD CONSTRAINT cost_pkey PRIMARY KEY (cost_id);


--
-- Name: dish_composition dish_composition_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_pkey PRIMARY KEY (dish_composition_id);


--
-- Name: dish dish_name_unique; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish
    ADD CONSTRAINT dish_name_unique UNIQUE (name) INCLUDE (name);


--
-- Name: dish dish_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id_dish);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id_employee);


--
-- Name: ingredient ingredient_name_unique; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.ingredient
    ADD CONSTRAINT ingredient_name_unique UNIQUE (name) INCLUDE (name);


--
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id_ingredient);


--
-- Name: post name_unique; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.post
    ADD CONSTRAINT name_unique UNIQUE (name) INCLUDE (name);


--
-- Name: order_composition order_composition_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_pkey PRIMARY KEY (order_composition_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);


--
-- Name: employee passport_data_unique; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT passport_data_unique UNIQUE (passport_data) INCLUDE (passport_data);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id_post);


--
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id_purchase);


--
-- Name: shift shift_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (id_shift);


--
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (skill_id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id_table);


--
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (timetable_id);


--
-- Name: cost cost_id_dish_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.cost
    ADD CONSTRAINT cost_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);


--
-- Name: dish_composition dish_composition_id_dish_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);


--
-- Name: dish_composition dish_composition_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.dish_composition
    ADD CONSTRAINT dish_composition_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES restauran.ingredient(id_ingredient);


--
-- Name: employee employee_id_post_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.employee
    ADD CONSTRAINT employee_id_post_fkey FOREIGN KEY (id_post) REFERENCES restauran.post(id_post);


--
-- Name: purchase ing; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.purchase
    ADD CONSTRAINT ing FOREIGN KEY (id_ingredient) REFERENCES restauran.ingredient(id_ingredient);


--
-- Name: order_composition order_composition_id_dish_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);


--
-- Name: order_composition order_composition_id_order_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.order_composition
    ADD CONSTRAINT order_composition_id_order_fkey FOREIGN KEY (id_order) REFERENCES restauran.orders(id_order);


--
-- Name: orders orders_id_table_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_id_table_fkey FOREIGN KEY (id_table) REFERENCES restauran.tables(id_table);


--
-- Name: orders orders_id_waiter_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.orders
    ADD CONSTRAINT orders_id_waiter_fkey FOREIGN KEY (id_waiter) REFERENCES restauran.employee(id_employee);


--
-- Name: skill skill_id_dish_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_id_dish_fkey FOREIGN KEY (id_dish) REFERENCES restauran.dish(id_dish);


--
-- Name: skill skill_id_employee_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.skill
    ADD CONSTRAINT skill_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES restauran.employee(id_employee);


--
-- Name: timetable timetable_id_employee_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES restauran.employee(id_employee);


--
-- Name: timetable timetable_id_shift_fkey; Type: FK CONSTRAINT; Schema: restauran; Owner: postgres
--

ALTER TABLE ONLY restauran.timetable
    ADD CONSTRAINT timetable_id_shift_fkey FOREIGN KEY (id_shift) REFERENCES restauran.shift(id_shift);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 