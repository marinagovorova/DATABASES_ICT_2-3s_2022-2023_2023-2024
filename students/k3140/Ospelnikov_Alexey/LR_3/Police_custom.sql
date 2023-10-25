PGDMP  9    '            	    {            Police_department    16.0    16.0 p    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16403    Police_department    DATABASE     �   CREATE DATABASE "Police_department" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 #   DROP DATABASE "Police_department";
                postgres    false            �           0    0    DATABASE "Police_department"    COMMENT     �   COMMENT ON DATABASE "Police_department" IS 'Database, which contains information about traffic accidents, cars, their owners, etc.';
                   postgres    false    4999                        2615    16404    Police-schema    SCHEMA        CREATE SCHEMA "Police-schema";
    DROP SCHEMA "Police-schema";
                postgres    false            �            1259    16641    Car    TABLE     �  CREATE TABLE "Police-schema"."Car" (
    car_brand character(20) NOT NULL,
    year_maden integer NOT NULL,
    colour character(20) NOT NULL,
    car_code bigint NOT NULL,
    vehicle_code bigint NOT NULL,
    CONSTRAINT "Car_car_code_check" CHECK ((car_code > 0)),
    CONSTRAINT "Car_vehicle_code_check" CHECK ((vehicle_code > 0)),
    CONSTRAINT "Car_year_maden_check" CHECK ((year_maden > 1950))
);
 "   DROP TABLE "Police-schema"."Car";
       Police-schema         heap    postgres    false    6            �           0    0    TABLE "Car"    COMMENT     J   COMMENT ON TABLE "Police-schema"."Car" IS 'Info about driver''s vehicle';
          Police-schema          postgres    false    232            �            1259    16412 	   Car owner    TABLE     �  CREATE TABLE "Police-schema"."Car owner" (
    driving_licence_number bigint NOT NULL,
    full_name character(50) NOT NULL,
    passport_number bigint NOT NULL,
    phone_number bigint NOT NULL,
    adress text NOT NULL,
    CONSTRAINT "Car owner_driving_licence_number_check" CHECK ((driving_licence_number > 0)),
    CONSTRAINT "Car owner_passport_number_check" CHECK ((passport_number > 0)),
    CONSTRAINT "Car owner_phone_number_check" CHECK ((phone_number > 0))
);
 (   DROP TABLE "Police-schema"."Car owner";
       Police-schema         heap    postgres    false    6            �           0    0    TABLE "Car owner"    COMMENT     u   COMMENT ON TABLE "Police-schema"."Car owner" IS 'Information about car''s owner, his passport, phone numbers, etc.';
          Police-schema          postgres    false    216            �            1259    16653    Car properties    TABLE     �  CREATE TABLE "Police-schema"."Car properties" (
    bodywork_type character(20) NOT NULL,
    engine_type character(20) NOT NULL,
    engine_volume double precision NOT NULL,
    transmission_type character(10) NOT NULL,
    vehicle_code bigint NOT NULL,
    vin_number character(18) NOT NULL,
    CONSTRAINT "Car properties_engine_volume_check" CHECK ((engine_volume > (0)::double precision)),
    CONSTRAINT "Car properties_vehicle_code_check" CHECK ((vehicle_code > 0))
);
 -   DROP TABLE "Police-schema"."Car properties";
       Police-schema         heap    postgres    false    6            �           0    0    TABLE "Car properties"    COMMENT     b   COMMENT ON TABLE "Police-schema"."Car properties" IS 'Manual with data about vehicle properties';
          Police-schema          postgres    false    233            �            1259    16795    Car_car_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Car_car_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "Police-schema"."Car_car_code_seq";
       Police-schema          postgres    false    6    232            �           0    0    Car_car_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "Police-schema"."Car_car_code_seq" OWNED BY "Police-schema"."Car".car_code;
          Police-schema          postgres    false    234            �            1259    16817    Car_vehicle_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Car_vehicle_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE "Police-schema"."Car_vehicle_code_seq";
       Police-schema          postgres    false    6    232            �           0    0    Car_vehicle_code_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "Police-schema"."Car_vehicle_code_seq" OWNED BY "Police-schema"."Car".vehicle_code;
          Police-schema          postgres    false    235            �            1259    16452    Traffic inspector    TABLE       CREATE TABLE "Police-schema"."Traffic inspector" (
    traffic_inspector_personal_code bigint NOT NULL,
    full_name character(50),
    phone_number bigint,
    rank character(30),
    police_department_code bigint NOT NULL,
    CONSTRAINT "Traffic inspector_phone_number_check" CHECK ((phone_number > 0)),
    CONSTRAINT "Traffic inspector_police_department_code_check" CHECK ((police_department_code > 0)),
    CONSTRAINT "Traffic inspector_traffic_inspector_personal_code_check" CHECK ((traffic_inspector_personal_code > 0))
);
 0   DROP TABLE "Police-schema"."Traffic inspector";
       Police-schema         heap    postgres    false    6            �           0    0    TABLE "Traffic inspector"    COMMENT     r   COMMENT ON TABLE "Police-schema"."Traffic inspector" IS 'Information about traffic inspector, his personal data';
          Police-schema          postgres    false    222            �            1259    16450 5   Traffic inspector_traffic_inspector_personal_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE "Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq";
       Police-schema          postgres    false    6    222            �           0    0 5   Traffic inspector_traffic_inspector_personal_code_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq" OWNED BY "Police-schema"."Traffic inspector".traffic_inspector_personal_code;
          Police-schema          postgres    false    220            �            1259    16430    Police department    TABLE     �  CREATE TABLE "Police-schema"."Police department" (
    department_code bigint DEFAULT nextval('"Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq"'::regclass) NOT NULL,
    department_name character(50) NOT NULL,
    adress text NOT NULL,
    department_phone_number bigint NOT NULL,
    CONSTRAINT "Police department_department_code_check" CHECK ((department_code > 0)),
    CONSTRAINT "Police department_department_phone_number_check" CHECK ((department_phone_number > 0))
);
 0   DROP TABLE "Police-schema"."Police department";
       Police-schema         heap    postgres    false    220    6            �           0    0    TABLE "Police department"    COMMENT     _   COMMENT ON TABLE "Police-schema"."Police department" IS 'Information about police department';
          Police-schema          postgres    false    219            �            1259    16506    Registred car    TABLE     C  CREATE TABLE "Police-schema"."Registred car" (
    car_code bigint NOT NULL,
    operation_code bigint NOT NULL,
    driving_licence_number bigint NOT NULL,
    registration_number character(9) NOT NULL,
    registration_date date NOT NULL,
    department_code bigint NOT NULL,
    CONSTRAINT "Registred car_car_code_check" CHECK ((car_code > 0)),
    CONSTRAINT "Registred car_driving_licence_number_check" CHECK ((driving_licence_number > 0)),
    CONSTRAINT "Registred car_operation_code_check" CHECK ((operation_code > 0)),
    CONSTRAINT "Registred car_registration_date_check" CHECK ((registration_date > '1950-01-01'::date)),
    CONSTRAINT "Registred car_registration_number_check" CHECK ((registration_number ~* '[ABEKMHOPCTYXАБЕКМНОРСТУХ]{1}[0-9]{3}[ABEKMHOPCTYXАБЕКМНОРСТУХ]{2}[0-9]{2,3}'::text))
);
 ,   DROP TABLE "Police-schema"."Registred car";
       Police-schema         heap    postgres    false    6            �           0    0    TABLE "Registred car"    COMMENT     �   COMMENT ON TABLE "Police-schema"."Registred car" IS 'This table contains info about registred vehicle: country number, date and department of registration';
          Police-schema          postgres    false    228            �            1259    16503    Registred car_car_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Registred car_car_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE "Police-schema"."Registred car_car_code_seq";
       Police-schema          postgres    false    6    228            �           0    0    Registred car_car_code_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE "Police-schema"."Registred car_car_code_seq" OWNED BY "Police-schema"."Registred car".car_code;
          Police-schema          postgres    false    226            �            1259    16504     Registred car_operation_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Registred car_operation_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE "Police-schema"."Registred car_operation_code_seq";
       Police-schema          postgres    false    6    228            �           0    0     Registred car_operation_code_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE "Police-schema"."Registred car_operation_code_seq" OWNED BY "Police-schema"."Registred car".operation_code;
          Police-schema          postgres    false    227            �            1259    16489    Traffic accident    TABLE     �  CREATE TABLE "Police-schema"."Traffic accident" (
    accident_code bigint NOT NULL,
    description text NOT NULL,
    driver_guiltiness text NOT NULL,
    accident_place text NOT NULL,
    accident_date date NOT NULL,
    traffic_inspector_personal_code bigint NOT NULL,
    car_code bigint NOT NULL,
    CONSTRAINT "Traffic accident_accident_code_check" CHECK ((accident_code > 0)),
    CONSTRAINT "Traffic accident_accident_date_check" CHECK ((accident_date > '1950-01-01'::date)),
    CONSTRAINT "Traffic accident_car_code_check" CHECK ((car_code > 0)),
    CONSTRAINT "Traffic accident_traffic_inspector_personal_code_check" CHECK ((traffic_inspector_personal_code > 0))
);
 /   DROP TABLE "Police-schema"."Traffic accident";
       Police-schema         heap    postgres    false    6            �           0    0    TABLE "Traffic accident"    COMMENT     W   COMMENT ON TABLE "Police-schema"."Traffic accident" IS 'Info about traffic accidents';
          Police-schema          postgres    false    225            �            1259    16487 "   Traffic accident_accident_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Traffic accident_accident_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE "Police-schema"."Traffic accident_accident_code_seq";
       Police-schema          postgres    false    225    6            �           0    0 "   Traffic accident_accident_code_seq    SEQUENCE OWNED BY        ALTER SEQUENCE "Police-schema"."Traffic accident_accident_code_seq" OWNED BY "Police-schema"."Traffic accident".accident_code;
          Police-schema          postgres    false    223            �            1259    16488 4   Traffic accident_traffic_inspector_personal_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Traffic accident_traffic_inspector_personal_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE "Police-schema"."Traffic accident_traffic_inspector_personal_code_seq";
       Police-schema          postgres    false    6    225            �           0    0 4   Traffic accident_traffic_inspector_personal_code_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "Police-schema"."Traffic accident_traffic_inspector_personal_code_seq" OWNED BY "Police-schema"."Traffic accident".traffic_inspector_personal_code;
          Police-schema          postgres    false    224            �            1259    16451 ,   Traffic inspector_police_department_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Traffic inspector_police_department_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 N   DROP SEQUENCE "Police-schema"."Traffic inspector_police_department_code_seq";
       Police-schema          postgres    false    222    6            �           0    0 ,   Traffic inspector_police_department_code_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "Police-schema"."Traffic inspector_police_department_code_seq" OWNED BY "Police-schema"."Traffic inspector".police_department_code;
          Police-schema          postgres    false    221            �            1259    16608    Traffic laws violation    TABLE     �  CREATE TABLE "Police-schema"."Traffic laws violation" (
    violation_code bigint NOT NULL,
    violation_place text NOT NULL,
    violation_date date NOT NULL,
    violation_type character(50) NOT NULL,
    accident_code bigint NOT NULL,
    car_code bigint NOT NULL,
    registred_violation_code bigint NOT NULL,
    CONSTRAINT "Traffic laws violation_accident_code_check" CHECK ((accident_code > 0)),
    CONSTRAINT "Traffic laws violation_car_code_check" CHECK ((car_code > 0)),
    CONSTRAINT "Traffic laws violation_registred_violation_code_check" CHECK ((registred_violation_code > 0)),
    CONSTRAINT "Traffic laws violation_violation_code_check" CHECK ((violation_code > 0))
);
 5   DROP TABLE "Police-schema"."Traffic laws violation";
       Police-schema         heap    postgres    false    6            �           0    0    TABLE "Traffic laws violation"    COMMENT     u   COMMENT ON TABLE "Police-schema"."Traffic laws violation" IS 'Info about Traffic violation and punishment for them';
          Police-schema          postgres    false    231            �            1259    16606 (   Traffic laws violation_accident_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Traffic laws violation_accident_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE "Police-schema"."Traffic laws violation_accident_code_seq";
       Police-schema          postgres    false    231    6            �           0    0 (   Traffic laws violation_accident_code_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "Police-schema"."Traffic laws violation_accident_code_seq" OWNED BY "Police-schema"."Traffic laws violation".accident_code;
          Police-schema          postgres    false    229            �            1259    16607 #   Traffic laws violation_car_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Traffic laws violation_car_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE "Police-schema"."Traffic laws violation_car_code_seq";
       Police-schema          postgres    false    231    6            �           0    0 #   Traffic laws violation_car_code_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "Police-schema"."Traffic laws violation_car_code_seq" OWNED BY "Police-schema"."Traffic laws violation".car_code;
          Police-schema          postgres    false    230            �            1259    16866 2   Traffic laws violation_registed_violation_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Traffic laws violation_registed_violation_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 T   DROP SEQUENCE "Police-schema"."Traffic laws violation_registed_violation_code_seq";
       Police-schema          postgres    false    231    6            �           0    0 2   Traffic laws violation_registed_violation_code_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "Police-schema"."Traffic laws violation_registed_violation_code_seq" OWNED BY "Police-schema"."Traffic laws violation".registred_violation_code;
          Police-schema          postgres    false    236            �            1259    16422    Violation manual    TABLE     "  CREATE TABLE "Police-schema"."Violation manual" (
    violation_code bigint NOT NULL,
    violation_name text NOT NULL,
    punishment character(50) NOT NULL,
    violation_class character(50) NOT NULL,
    CONSTRAINT "Violation manual_violation_code_check" CHECK ((violation_code > 0))
);
 /   DROP TABLE "Police-schema"."Violation manual";
       Police-schema         heap    postgres    false    6            �           0    0    TABLE "Violation manual"    COMMENT     �   COMMENT ON TABLE "Police-schema"."Violation manual" IS 'Manual contains information about defferent types of violation, their discription and punishment';
          Police-schema          postgres    false    218            �            1259    16421 #   Violation manual_violation_code_seq    SEQUENCE     �   CREATE SEQUENCE "Police-schema"."Violation manual_violation_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE "Police-schema"."Violation manual_violation_code_seq";
       Police-schema          postgres    false    6    218            �           0    0 #   Violation manual_violation_code_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "Police-schema"."Violation manual_violation_code_seq" OWNED BY "Police-schema"."Violation manual".violation_code;
          Police-schema          postgres    false    217            �           2604    16818    Car vehicle_code    DEFAULT     �   ALTER TABLE ONLY "Police-schema"."Car" ALTER COLUMN vehicle_code SET DEFAULT nextval('"Police-schema"."Car_vehicle_code_seq"'::regclass);
 J   ALTER TABLE "Police-schema"."Car" ALTER COLUMN vehicle_code DROP DEFAULT;
       Police-schema          postgres    false    235    232            �           2604    16509    Registred car car_code    DEFAULT     �   ALTER TABLE ONLY "Police-schema"."Registred car" ALTER COLUMN car_code SET DEFAULT nextval('"Police-schema"."Registred car_car_code_seq"'::regclass);
 P   ALTER TABLE "Police-schema"."Registred car" ALTER COLUMN car_code DROP DEFAULT;
       Police-schema          postgres    false    228    226    228                       2604    16492    Traffic accident accident_code    DEFAULT     �   ALTER TABLE ONLY "Police-schema"."Traffic accident" ALTER COLUMN accident_code SET DEFAULT nextval('"Police-schema"."Traffic accident_accident_code_seq"'::regclass);
 X   ALTER TABLE "Police-schema"."Traffic accident" ALTER COLUMN accident_code DROP DEFAULT;
       Police-schema          postgres    false    223    225    225            ~           2604    16455 1   Traffic inspector traffic_inspector_personal_code    DEFAULT     �   ALTER TABLE ONLY "Police-schema"."Traffic inspector" ALTER COLUMN traffic_inspector_personal_code SET DEFAULT nextval('"Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq"'::regclass);
 k   ALTER TABLE "Police-schema"."Traffic inspector" ALTER COLUMN traffic_inspector_personal_code DROP DEFAULT;
       Police-schema          postgres    false    222    220    222            �           2604    16867 /   Traffic laws violation registred_violation_code    DEFAULT     �   ALTER TABLE ONLY "Police-schema"."Traffic laws violation" ALTER COLUMN registred_violation_code SET DEFAULT nextval('"Police-schema"."Traffic laws violation_registed_violation_code_seq"'::regclass);
 i   ALTER TABLE "Police-schema"."Traffic laws violation" ALTER COLUMN registred_violation_code DROP DEFAULT;
       Police-schema          postgres    false    236    231            |           2604    16425    Violation manual violation_code    DEFAULT     �   ALTER TABLE ONLY "Police-schema"."Violation manual" ALTER COLUMN violation_code SET DEFAULT nextval('"Police-schema"."Violation manual_violation_code_seq"'::regclass);
 Y   ALTER TABLE "Police-schema"."Violation manual" ALTER COLUMN violation_code DROP DEFAULT;
       Police-schema          postgres    false    217    218    218            }          0    16641    Car 
   TABLE DATA           _   COPY "Police-schema"."Car" (car_brand, year_maden, colour, car_code, vehicle_code) FROM stdin;
    Police-schema          postgres    false    232   ��       m          0    16412 	   Car owner 
   TABLE DATA           x   COPY "Police-schema"."Car owner" (driving_licence_number, full_name, passport_number, phone_number, adress) FROM stdin;
    Police-schema          postgres    false    216   �       ~          0    16653    Car properties 
   TABLE DATA           �   COPY "Police-schema"."Car properties" (bodywork_type, engine_type, engine_volume, transmission_type, vehicle_code, vin_number) FROM stdin;
    Police-schema          postgres    false    233   G�       p          0    16430    Police department 
   TABLE DATA           y   COPY "Police-schema"."Police department" (department_code, department_name, adress, department_phone_number) FROM stdin;
    Police-schema          postgres    false    219   ��       y          0    16506    Registred car 
   TABLE DATA           �   COPY "Police-schema"."Registred car" (car_code, operation_code, driving_licence_number, registration_number, registration_date, department_code) FROM stdin;
    Police-schema          postgres    false    228   
�       v          0    16489    Traffic accident 
   TABLE DATA           �   COPY "Police-schema"."Traffic accident" (accident_code, description, driver_guiltiness, accident_place, accident_date, traffic_inspector_personal_code, car_code) FROM stdin;
    Police-schema          postgres    false    225   ]�       s          0    16452    Traffic inspector 
   TABLE DATA           �   COPY "Police-schema"."Traffic inspector" (traffic_inspector_personal_code, full_name, phone_number, rank, police_department_code) FROM stdin;
    Police-schema          postgres    false    222   ��       |          0    16608    Traffic laws violation 
   TABLE DATA           �   COPY "Police-schema"."Traffic laws violation" (violation_code, violation_place, violation_date, violation_type, accident_code, car_code, registred_violation_code) FROM stdin;
    Police-schema          postgres    false    231   �       o          0    16422    Violation manual 
   TABLE DATA           r   COPY "Police-schema"."Violation manual" (violation_code, violation_name, punishment, violation_class) FROM stdin;
    Police-schema          postgres    false    218   w�       �           0    0    Car_car_code_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"Police-schema"."Car_car_code_seq"', 6, true);
          Police-schema          postgres    false    234            �           0    0    Car_vehicle_code_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"Police-schema"."Car_vehicle_code_seq"', 3, true);
          Police-schema          postgres    false    235            �           0    0    Registred car_car_code_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"Police-schema"."Registred car_car_code_seq"', 2, true);
          Police-schema          postgres    false    226            �           0    0     Registred car_operation_code_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('"Police-schema"."Registred car_operation_code_seq"', 2, true);
          Police-schema          postgres    false    227            �           0    0 "   Traffic accident_accident_code_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('"Police-schema"."Traffic accident_accident_code_seq"', 5, true);
          Police-schema          postgres    false    223            �           0    0 4   Traffic accident_traffic_inspector_personal_code_seq    SEQUENCE SET     m   SELECT pg_catalog.setval('"Police-schema"."Traffic accident_traffic_inspector_personal_code_seq"', 2, true);
          Police-schema          postgres    false    224            �           0    0 ,   Traffic inspector_police_department_code_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('"Police-schema"."Traffic inspector_police_department_code_seq"', 2, true);
          Police-schema          postgres    false    221            �           0    0 5   Traffic inspector_traffic_inspector_personal_code_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('"Police-schema"."Traffic inspector_traffic_inspector_personal_code_seq"', 9, true);
          Police-schema          postgres    false    220            �           0    0 (   Traffic laws violation_accident_code_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('"Police-schema"."Traffic laws violation_accident_code_seq"', 1, false);
          Police-schema          postgres    false    229            �           0    0 #   Traffic laws violation_car_code_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('"Police-schema"."Traffic laws violation_car_code_seq"', 1, false);
          Police-schema          postgres    false    230            �           0    0 2   Traffic laws violation_registed_violation_code_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('"Police-schema"."Traffic laws violation_registed_violation_code_seq"', 3, true);
          Police-schema          postgres    false    236            �           0    0 #   Violation manual_violation_code_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('"Police-schema"."Violation manual_violation_code_seq"', 3, true);
          Police-schema          postgres    false    217            �           2606    16911 .   Car owner Car owner_driving_licence_number_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Car owner"
    ADD CONSTRAINT "Car owner_driving_licence_number_key" UNIQUE (driving_licence_number);
 e   ALTER TABLE ONLY "Police-schema"."Car owner" DROP CONSTRAINT "Car owner_driving_licence_number_key";
       Police-schema            postgres    false    216            �           2606    16913 '   Car owner Car owner_passport_number_key 
   CONSTRAINT     z   ALTER TABLE ONLY "Police-schema"."Car owner"
    ADD CONSTRAINT "Car owner_passport_number_key" UNIQUE (passport_number);
 ^   ALTER TABLE ONLY "Police-schema"."Car owner" DROP CONSTRAINT "Car owner_passport_number_key";
       Police-schema            postgres    false    216            �           2606    16915 $   Car owner Car owner_phone_number_key 
   CONSTRAINT     t   ALTER TABLE ONLY "Police-schema"."Car owner"
    ADD CONSTRAINT "Car owner_phone_number_key" UNIQUE (phone_number);
 [   ALTER TABLE ONLY "Police-schema"."Car owner" DROP CONSTRAINT "Car owner_phone_number_key";
       Police-schema            postgres    false    216            �           2606    16676    Car owner Car owner_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY "Police-schema"."Car owner"
    ADD CONSTRAINT "Car owner_pkey" PRIMARY KEY (driving_licence_number);
 O   ALTER TABLE ONLY "Police-schema"."Car owner" DROP CONSTRAINT "Car owner_pkey";
       Police-schema            postgres    false    216            �           2606    16816 #   Car properties Car properties_pkey1 
   CONSTRAINT     x   ALTER TABLE ONLY "Police-schema"."Car properties"
    ADD CONSTRAINT "Car properties_pkey1" PRIMARY KEY (vehicle_code);
 Z   ALTER TABLE ONLY "Police-schema"."Car properties" DROP CONSTRAINT "Car properties_pkey1";
       Police-schema            postgres    false    233            �           2606    16909 .   Car properties Car properties_vehicle_code_key 
   CONSTRAINT     ~   ALTER TABLE ONLY "Police-schema"."Car properties"
    ADD CONSTRAINT "Car properties_vehicle_code_key" UNIQUE (vehicle_code);
 e   ALTER TABLE ONLY "Police-schema"."Car properties" DROP CONSTRAINT "Car properties_vehicle_code_key";
       Police-schema            postgres    false    233            �           2606    16907 ,   Car properties Car properties_vin_number_key 
   CONSTRAINT     z   ALTER TABLE ONLY "Police-schema"."Car properties"
    ADD CONSTRAINT "Car properties_vin_number_key" UNIQUE (vin_number);
 c   ALTER TABLE ONLY "Police-schema"."Car properties" DROP CONSTRAINT "Car properties_vin_number_key";
       Police-schema            postgres    false    233            �           2606    16919    Car Car_car_code_key 
   CONSTRAINT     `   ALTER TABLE ONLY "Police-schema"."Car"
    ADD CONSTRAINT "Car_car_code_key" UNIQUE (car_code);
 K   ALTER TABLE ONLY "Police-schema"."Car" DROP CONSTRAINT "Car_car_code_key";
       Police-schema            postgres    false    232            �           2606    16824    Car Car_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "Police-schema"."Car"
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY (vehicle_code);
 C   ALTER TABLE ONLY "Police-schema"."Car" DROP CONSTRAINT "Car_pkey";
       Police-schema            postgres    false    232            �           2606    16917    Car Car_vehicle_code_key 
   CONSTRAINT     h   ALTER TABLE ONLY "Police-schema"."Car"
    ADD CONSTRAINT "Car_vehicle_code_key" UNIQUE (vehicle_code);
 O   ALTER TABLE ONLY "Police-schema"."Car" DROP CONSTRAINT "Car_vehicle_code_key";
       Police-schema            postgres    false    232            �           2606    16976 7   Police department Police department_department_code_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Police department"
    ADD CONSTRAINT "Police department_department_code_key" UNIQUE (department_code);
 n   ALTER TABLE ONLY "Police-schema"."Police department" DROP CONSTRAINT "Police department_department_code_key";
       Police-schema            postgres    false    219            �           2606    16901 ?   Police department Police department_department_phone_number_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Police department"
    ADD CONSTRAINT "Police department_department_phone_number_key" UNIQUE (department_phone_number);
 v   ALTER TABLE ONLY "Police-schema"."Police department" DROP CONSTRAINT "Police department_department_phone_number_key";
       Police-schema            postgres    false    219            �           2606    16458 (   Police department Police department_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Police department"
    ADD CONSTRAINT "Police department_pkey" PRIMARY KEY (department_code);
 _   ALTER TABLE ONLY "Police-schema"."Police department" DROP CONSTRAINT "Police department_pkey";
       Police-schema            postgres    false    219            �           2606    16921 (   Registred car Registred car_car_code_key 
   CONSTRAINT     t   ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_car_code_key" UNIQUE (car_code);
 _   ALTER TABLE ONLY "Police-schema"."Registred car" DROP CONSTRAINT "Registred car_car_code_key";
       Police-schema            postgres    false    228            �           2606    16925 6   Registred car Registred car_driving_licence_number_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_driving_licence_number_key" UNIQUE (driving_licence_number);
 m   ALTER TABLE ONLY "Police-schema"."Registred car" DROP CONSTRAINT "Registred car_driving_licence_number_key";
       Police-schema            postgres    false    228            �           2606    16923 .   Registred car Registred car_operation_code_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_operation_code_key" UNIQUE (operation_code);
 e   ALTER TABLE ONLY "Police-schema"."Registred car" DROP CONSTRAINT "Registred car_operation_code_key";
       Police-schema            postgres    false    228            �           2606    16513     Registred car Registred car_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_pkey" PRIMARY KEY (car_code);
 W   ALTER TABLE ONLY "Police-schema"."Registred car" DROP CONSTRAINT "Registred car_pkey";
       Police-schema            postgres    false    228            �           2606    16927 3   Registred car Registred car_registration_number_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_registration_number_key" UNIQUE (registration_number);
 j   ALTER TABLE ONLY "Police-schema"."Registred car" DROP CONSTRAINT "Registred car_registration_number_key";
       Police-schema            postgres    false    228            �           2606    16945 3   Traffic accident Traffic accident_accident_code_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic accident"
    ADD CONSTRAINT "Traffic accident_accident_code_key" UNIQUE (accident_code);
 j   ALTER TABLE ONLY "Police-schema"."Traffic accident" DROP CONSTRAINT "Traffic accident_accident_code_key";
       Police-schema            postgres    false    225            �           2606    16497 &   Traffic accident Traffic accident_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY "Police-schema"."Traffic accident"
    ADD CONSTRAINT "Traffic accident_pkey" PRIMARY KEY (accident_code);
 ]   ALTER TABLE ONLY "Police-schema"."Traffic accident" DROP CONSTRAINT "Traffic accident_pkey";
       Police-schema            postgres    false    225            �           2606    16953 4   Traffic inspector Traffic inspector_phone_number_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic inspector"
    ADD CONSTRAINT "Traffic inspector_phone_number_key" UNIQUE (phone_number);
 k   ALTER TABLE ONLY "Police-schema"."Traffic inspector" DROP CONSTRAINT "Traffic inspector_phone_number_key";
       Police-schema            postgres    false    222            �           2606    16466 (   Traffic inspector Traffic inspector_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic inspector"
    ADD CONSTRAINT "Traffic inspector_pkey" PRIMARY KEY (traffic_inspector_personal_code);
 _   ALTER TABLE ONLY "Police-schema"."Traffic inspector" DROP CONSTRAINT "Traffic inspector_pkey";
       Police-schema            postgres    false    222            �           2606    16951 G   Traffic inspector Traffic inspector_traffic_inspector_personal_code_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic inspector"
    ADD CONSTRAINT "Traffic inspector_traffic_inspector_personal_code_key" UNIQUE (traffic_inspector_personal_code);
 ~   ALTER TABLE ONLY "Police-schema"."Traffic inspector" DROP CONSTRAINT "Traffic inspector_traffic_inspector_personal_code_key";
       Police-schema            postgres    false    222            �           2606    16875 2   Traffic laws violation Traffic laws violation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_pkey" PRIMARY KEY (registred_violation_code);
 i   ALTER TABLE ONLY "Police-schema"."Traffic laws violation" DROP CONSTRAINT "Traffic laws violation_pkey";
       Police-schema            postgres    false    231            �           2606    16963 I   Traffic laws violation Traffic laws violation_registed_violation_code_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_registed_violation_code_key" UNIQUE (registred_violation_code);
 �   ALTER TABLE ONLY "Police-schema"."Traffic laws violation" DROP CONSTRAINT "Traffic laws violation_registed_violation_code_key";
       Police-schema            postgres    false    231            �           2606    16429 &   Violation manual Violation manual_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "Police-schema"."Violation manual"
    ADD CONSTRAINT "Violation manual_pkey" PRIMARY KEY (violation_code);
 ]   ALTER TABLE ONLY "Police-schema"."Violation manual" DROP CONSTRAINT "Violation manual_pkey";
       Police-schema            postgres    false    218            �           2606    16668 4   Violation manual Violation manual_violation_code_key 
   CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Violation manual"
    ADD CONSTRAINT "Violation manual_violation_code_key" UNIQUE (violation_code);
 k   ALTER TABLE ONLY "Police-schema"."Violation manual" DROP CONSTRAINT "Violation manual_violation_code_key";
       Police-schema            postgres    false    218            �           2606    16829 /   Car properties Car properties_vehicle_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Car properties"
    ADD CONSTRAINT "Car properties_vehicle_code_fkey" FOREIGN KEY (vehicle_code) REFERENCES "Police-schema"."Car"(vehicle_code);
 f   ALTER TABLE ONLY "Police-schema"."Car properties" DROP CONSTRAINT "Car properties_vehicle_code_fkey";
       Police-schema          postgres    false    232    233    4811            �           2606    16803    Car Car_car_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Car"
    ADD CONSTRAINT "Car_car_code_fkey" FOREIGN KEY (car_code) REFERENCES "Police-schema"."Registred car"(car_code);
 L   ALTER TABLE ONLY "Police-schema"."Car" DROP CONSTRAINT "Car_car_code_fkey";
       Police-schema          postgres    false    228    4801    232            �           2606    16810 0   Registred car Registred car_department_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_department_code_fkey" FOREIGN KEY (department_code) REFERENCES "Police-schema"."Police department"(department_code);
 g   ALTER TABLE ONLY "Police-schema"."Registred car" DROP CONSTRAINT "Registred car_department_code_fkey";
       Police-schema          postgres    false    219    4783    228            �           2606    16765 7   Registred car Registred car_driving_licence_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Registred car"
    ADD CONSTRAINT "Registred car_driving_licence_number_fkey" FOREIGN KEY (driving_licence_number) REFERENCES "Police-schema"."Car owner"(driving_licence_number);
 n   ALTER TABLE ONLY "Police-schema"."Registred car" DROP CONSTRAINT "Registred car_driving_licence_number_fkey";
       Police-schema          postgres    false    228    4773    216            �           2606    16838 /   Traffic accident Traffic accident_car_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic accident"
    ADD CONSTRAINT "Traffic accident_car_code_fkey" FOREIGN KEY (car_code) REFERENCES "Police-schema"."Registred car"(car_code);
 f   ALTER TABLE ONLY "Police-schema"."Traffic accident" DROP CONSTRAINT "Traffic accident_car_code_fkey";
       Police-schema          postgres    false    225    4801    228            �           2606    16498 F   Traffic accident Traffic accident_traffic_inspector_personal_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic accident"
    ADD CONSTRAINT "Traffic accident_traffic_inspector_personal_code_fkey" FOREIGN KEY (traffic_inspector_personal_code) REFERENCES "Police-schema"."Traffic inspector"(traffic_inspector_personal_code);
 }   ALTER TABLE ONLY "Police-schema"."Traffic accident" DROP CONSTRAINT "Traffic accident_traffic_inspector_personal_code_fkey";
       Police-schema          postgres    false    222    225    4787            �           2606    16468 ?   Traffic inspector Traffic inspector_police_department_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic inspector"
    ADD CONSTRAINT "Traffic inspector_police_department_code_fkey" FOREIGN KEY (police_department_code) REFERENCES "Police-schema"."Police department"(department_code);
 v   ALTER TABLE ONLY "Police-schema"."Traffic inspector" DROP CONSTRAINT "Traffic inspector_police_department_code_fkey";
       Police-schema          postgres    false    222    219    4783            �           2606    16617 @   Traffic laws violation Traffic laws violation_accident_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_accident_code_fkey" FOREIGN KEY (accident_code) REFERENCES "Police-schema"."Traffic accident"(accident_code);
 w   ALTER TABLE ONLY "Police-schema"."Traffic laws violation" DROP CONSTRAINT "Traffic laws violation_accident_code_fkey";
       Police-schema          postgres    false    4793    231    225            �           2606    16623 ;   Traffic laws violation Traffic laws violation_car_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_car_code_fkey" FOREIGN KEY (car_code) REFERENCES "Police-schema"."Registred car"(car_code);
 r   ALTER TABLE ONLY "Police-schema"."Traffic laws violation" DROP CONSTRAINT "Traffic laws violation_car_code_fkey";
       Police-schema          postgres    false    4801    228    231            �           2606    16783 A   Traffic laws violation Traffic laws violation_violation_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Police-schema"."Traffic laws violation"
    ADD CONSTRAINT "Traffic laws violation_violation_code_fkey" FOREIGN KEY (violation_code) REFERENCES "Police-schema"."Violation manual"(violation_code);
 x   ALTER TABLE ONLY "Police-schema"."Traffic laws violation" DROP CONSTRAINT "Traffic laws violation_violation_code_fkey";
       Police-schema          postgres    false    218    4775    231            }   R   x���L/��T@�������99��h2Ɯ�\��9
h�������)'19C�ӈ�7�*%]�����%&]�Ә+F��� |D�      m   M   x����	�@���
+��t���C|�a�b	7�����2NA�Hb�>�V3�����s�gE"3!�V3� c��      ~   [   x�3V�����8}S�3`*8ӌ�ӌ�Ҁ4T�Vm��L9KK��F� L�!V��M�@v�!gf~fFf~iFifjF)��=... ��&�      p   H   x��ͱ�@�O�	"������~��d��RoY�j&�<����N�"�`��彿��8/���'      y   C   x�E��� ���
 5�m���;Ȗ
U�%�KP*O�B!	Ci�߲`�D;��NY����'?      v   N   x�M���@k{�ǩX�	hI	�w8<��sNB�����
�n�����@H��g��u�e�b��{�A���c%� ��K      s   P   x�3�,OMK-OKKU p��!gpjQ:eF\F�i`�7n:�obV~nU�\��@���H1b8�Ojf	5�\1z\\\ ��,�      |   L   x��̱�@��\�|�z!}���cK��Ym<��9G�	�|��Fl�AЄ��{����9(#�؃("�>���	$�      o   C   x�3�4�,OKMK-W p��5�����ˈ�lI�ljI%E�1�!gZ�I�@m"-�b���� ȗ1�     