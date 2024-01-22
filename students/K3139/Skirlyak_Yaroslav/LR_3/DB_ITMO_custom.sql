PGDMP  9    6            
    {            DB-ITMO    15.4 (Homebrew)    16.0 R    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16402    DB-ITMO    DATABASE     k   CREATE DATABASE "DB-ITMO" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "DB-ITMO";
                postgres    false                        2615    16404 
   Sport_Club    SCHEMA        CREATE SCHEMA "Sport_Club";
    DROP SCHEMA "Sport_Club";
                postgres    false            �            1259    16405    Category    TABLE     �   CREATE TABLE "Sport_Club"."Category" (
    level_of_category integer NOT NULL,
    salary integer NOT NULL,
    score_limit integer NOT NULL
);
 $   DROP TABLE "Sport_Club"."Category";
    
   Sport_Club         heap    postgres    false    5            �            1259    16481    Coach    TABLE     �  CREATE TABLE "Sport_Club"."Coach" (
    number_of_coach integer NOT NULL,
    coach_points integer DEFAULT 0 NOT NULL,
    full_name character varying(50) NOT NULL,
    passport_data character varying(100) NOT NULL,
    category_level integer NOT NULL,
    CONSTRAINT coach_points_check1 CHECK ((coach_points >= 0)),
    CONSTRAINT coach_points_check2 CHECK ((coach_points <= 1000))
);
 !   DROP TABLE "Sport_Club"."Coach";
    
   Sport_Club         heap    postgres    false    5            �            1259    16466    Competition    TABLE     V  CREATE TABLE "Sport_Club"."Competition" (
    number_of_competition integer NOT NULL,
    place character varying(100) NOT NULL,
    competition_type integer NOT NULL,
    competition_level integer NOT NULL,
    CONSTRAINT competition_level CHECK ((competition_level >= 0)),
    CONSTRAINT competition_type CHECK ((competition_type >= 0))
);
 '   DROP TABLE "Sport_Club"."Competition";
    
   Sport_Club         heap    postgres    false    5            �            1259    16578    Cooperation    TABLE     �   CREATE TABLE "Sport_Club"."Cooperation" (
    coach_number integer NOT NULL,
    id_of_qualification_book integer NOT NULL,
    id_of_cooperation integer NOT NULL,
    cooperation_since date NOT NULL,
    cooperation_end date NOT NULL
);
 '   DROP TABLE "Sport_Club"."Cooperation";
    
   Sport_Club         heap    postgres    false    5            �            1259    16473    Doctor    TABLE     �   CREATE TABLE "Sport_Club"."Doctor" (
    doctor_number integer NOT NULL,
    full_name character varying(50) NOT NULL,
    specialization character varying(50) NOT NULL
);
 "   DROP TABLE "Sport_Club"."Doctor";
    
   Sport_Club         heap    postgres    false    5            �            1259    16461    Injury    TABLE     �   CREATE TABLE "Sport_Club"."Injury" (
    number_of_injury integer NOT NULL,
    name_of_injury character varying(100) NOT NULL
);
 "   DROP TABLE "Sport_Club"."Injury";
    
   Sport_Club         heap    postgres    false    5            �            1259    16476    Medicine_card    TABLE     �   CREATE TABLE "Sport_Club"."Medicine_card" (
    number_of_medicine_card integer NOT NULL,
    medicine_inspection character varying(100) NOT NULL,
    sportsman_id integer
);
 )   DROP TABLE "Sport_Club"."Medicine_card";
    
   Sport_Club         heap    postgres    false    5            �            1259    16595    Medicine_testing    TABLE     �   CREATE TABLE "Sport_Club"."Medicine_testing" (
    id_of_medicine_book integer NOT NULL,
    number_from_doctor integer NOT NULL,
    testing_result text NOT NULL,
    testing_date date NOT NULL,
    number_of_testing integer NOT NULL
);
 ,   DROP TABLE "Sport_Club"."Medicine_testing";
    
   Sport_Club         heap    postgres    false    5            �            1259    16560 !   Participation_in_the_competition     TABLE       CREATE TABLE "Sport_Club"."Participation_in_the_competition " (
    id_of_comptetition integer NOT NULL,
    sport_number integer NOT NULL,
    id_of_qualification_book integer NOT NULL,
    competition_result integer NOT NULL,
    particip_compet_id integer NOT NULL
);
 =   DROP TABLE "Sport_Club"."Participation_in_the_competition ";
    
   Sport_Club         heap    postgres    false    5            �            1259    16510    Participation_in_the_training    TABLE     K  CREATE TABLE "Sport_Club"."Participation_in_the_training" (
    coach_id integer NOT NULL,
    sportsmen_id integer NOT NULL,
    sport_id integer NOT NULL,
    training_number integer NOT NULL,
    training_result character varying(100) NOT NULL,
    particip_train_id integer DEFAULT 0 NOT NULL,
    training integer NOT NULL
);
 9   DROP TABLE "Sport_Club"."Participation_in_the_training";
    
   Sport_Club         heap    postgres    false    5            �            1259    16694 *   Participation_in_the_training_training_seq    SEQUENCE     �   CREATE SEQUENCE "Sport_Club"."Participation_in_the_training_training_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE "Sport_Club"."Participation_in_the_training_training_seq";
    
   Sport_Club          postgres    false    5    222            �           0    0 *   Participation_in_the_training_training_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "Sport_Club"."Participation_in_the_training_training_seq" OWNED BY "Sport_Club"."Participation_in_the_training".training;
       
   Sport_Club          postgres    false    228            �            1259    16456 
   Sport_type    TABLE     �   CREATE TABLE "Sport_Club"."Sport_type" (
    number_of_sport_type integer NOT NULL,
    name_of_sport character varying(20) NOT NULL
);
 &   DROP TABLE "Sport_Club"."Sport_type";
    
   Sport_Club         heap    postgres    false    5            �            1259    16530 	   Sportsmen    TABLE     �  CREATE TABLE "Sport_Club"."Sportsmen" (
    sportsman_id integer NOT NULL,
    fullname character varying(50) NOT NULL,
    passport_data character varying(100) NOT NULL,
    qualification integer NOT NULL,
    sportsmen_points integer DEFAULT 0 NOT NULL,
    CONSTRAINT qualification_check CHECK ((qualification >= 0)),
    CONSTRAINT sportsmen_points_check1 CHECK ((sportsmen_points >= 0)),
    CONSTRAINT sportsmen_points_check2 CHECK ((sportsmen_points <= 1000))
);
 %   DROP TABLE "Sport_Club"."Sportsmen";
    
   Sport_Club         heap    postgres    false    5            �            1259    16544    Sportsmen_injury    TABLE       CREATE TABLE "Sport_Club"."Sportsmen_injury" (
    id_of_qualification_book integer NOT NULL,
    number_of_injury integer NOT NULL,
    got_injury_at_date date NOT NULL,
    became_healthy_at_date date NOT NULL,
    sportsmen_injury_id integer NOT NULL
);
 ,   DROP TABLE "Sport_Club"."Sportsmen_injury";
    
   Sport_Club         heap    postgres    false    5            �            1259    16450    Training    TABLE     �   CREATE TABLE "Sport_Club"."Training" (
    number_of_training integer NOT NULL,
    place character varying(100) NOT NULL,
    date_action date NOT NULL,
    CONSTRAINT number_of_training_check CHECK ((number_of_training > 0))
);
 $   DROP TABLE "Sport_Club"."Training";
    
   Sport_Club         heap    postgres    false    5            �           2604    16695 &   Participation_in_the_training training    DEFAULT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training" ALTER COLUMN training SET DEFAULT nextval('"Sport_Club"."Participation_in_the_training_training_seq"'::regclass);
 ]   ALTER TABLE "Sport_Club"."Participation_in_the_training" ALTER COLUMN training DROP DEFAULT;
    
   Sport_Club          postgres    false    228    222            �          0    16405    Category 
   TABLE DATA           R   COPY "Sport_Club"."Category" (level_of_category, salary, score_limit) FROM stdin;
 
   Sport_Club          postgres    false    214   +w       �          0    16481    Coach 
   TABLE DATA           p   COPY "Sport_Club"."Coach" (number_of_coach, coach_points, full_name, passport_data, category_level) FROM stdin;
 
   Sport_Club          postgres    false    221   �w       �          0    16466    Competition 
   TABLE DATA           p   COPY "Sport_Club"."Competition" (number_of_competition, place, competition_type, competition_level) FROM stdin;
 
   Sport_Club          postgres    false    218   �x       �          0    16578    Cooperation 
   TABLE DATA           �   COPY "Sport_Club"."Cooperation" (coach_number, id_of_qualification_book, id_of_cooperation, cooperation_since, cooperation_end) FROM stdin;
 
   Sport_Club          postgres    false    226   �y       �          0    16473    Doctor 
   TABLE DATA           R   COPY "Sport_Club"."Doctor" (doctor_number, full_name, specialization) FROM stdin;
 
   Sport_Club          postgres    false    219   �y       �          0    16461    Injury 
   TABLE DATA           J   COPY "Sport_Club"."Injury" (number_of_injury, name_of_injury) FROM stdin;
 
   Sport_Club          postgres    false    217   ]{       �          0    16476    Medicine_card 
   TABLE DATA           k   COPY "Sport_Club"."Medicine_card" (number_of_medicine_card, medicine_inspection, sportsman_id) FROM stdin;
 
   Sport_Club          postgres    false    220   )|       �          0    16595    Medicine_testing 
   TABLE DATA           �   COPY "Sport_Club"."Medicine_testing" (id_of_medicine_book, number_from_doctor, testing_result, testing_date, number_of_testing) FROM stdin;
 
   Sport_Club          postgres    false    227   �}       �          0    16560 !   Participation_in_the_competition  
   TABLE DATA           �   COPY "Sport_Club"."Participation_in_the_competition " (id_of_comptetition, sport_number, id_of_qualification_book, competition_result, particip_compet_id) FROM stdin;
 
   Sport_Club          postgres    false    225   �}       �          0    16510    Participation_in_the_training 
   TABLE DATA           �   COPY "Sport_Club"."Participation_in_the_training" (coach_id, sportsmen_id, sport_id, training_number, training_result, particip_train_id, training) FROM stdin;
 
   Sport_Club          postgres    false    222   �}       �          0    16456 
   Sport_type 
   TABLE DATA           Q   COPY "Sport_Club"."Sport_type" (number_of_sport_type, name_of_sport) FROM stdin;
 
   Sport_Club          postgres    false    216   U~       �          0    16530 	   Sportsmen 
   TABLE DATA           s   COPY "Sport_Club"."Sportsmen" (sportsman_id, fullname, passport_data, qualification, sportsmen_points) FROM stdin;
 
   Sport_Club          postgres    false    223   �~       �          0    16544    Sportsmen_injury 
   TABLE DATA           �   COPY "Sport_Club"."Sportsmen_injury" (id_of_qualification_book, number_of_injury, got_injury_at_date, became_healthy_at_date, sportsmen_injury_id) FROM stdin;
 
   Sport_Club          postgres    false    224   @�       �          0    16450    Training 
   TABLE DATA           R   COPY "Sport_Club"."Training" (number_of_training, place, date_action) FROM stdin;
 
   Sport_Club          postgres    false    215   ]�       �           0    0 *   Participation_in_the_training_training_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('"Sport_Club"."Participation_in_the_training_training_seq"', 10, true);
       
   Sport_Club          postgres    false    228            �           2606    16410    Category Category_check    CHECK CONSTRAINT     s   ALTER TABLE "Sport_Club"."Category"
    ADD CONSTRAINT "Category_check" CHECK ((level_of_category > 0)) NOT VALID;
 F   ALTER TABLE "Sport_Club"."Category" DROP CONSTRAINT "Category_check";
    
   Sport_Club          postgres    false    214    214            �           2606    16409    Category Category_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "Sport_Club"."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (level_of_category);
 J   ALTER TABLE ONLY "Sport_Club"."Category" DROP CONSTRAINT "Category_pkey";
    
   Sport_Club            postgres    false    214            �           2606    16582    Cooperation Cooperation_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY "Sport_Club"."Cooperation"
    ADD CONSTRAINT "Cooperation_pkey" PRIMARY KEY (id_of_cooperation);
 P   ALTER TABLE ONLY "Sport_Club"."Cooperation" DROP CONSTRAINT "Cooperation_pkey";
    
   Sport_Club            postgres    false    226            �           2606    16611    Doctor Doctor_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY "Sport_Club"."Doctor"
    ADD CONSTRAINT "Doctor_pkey" PRIMARY KEY (doctor_number);
 F   ALTER TABLE ONLY "Sport_Club"."Doctor" DROP CONSTRAINT "Doctor_pkey";
    
   Sport_Club            postgres    false    219            �           2606    16632    Injury Injury_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "Sport_Club"."Injury"
    ADD CONSTRAINT "Injury_pkey" PRIMARY KEY (number_of_injury);
 F   ALTER TABLE ONLY "Sport_Club"."Injury" DROP CONSTRAINT "Injury_pkey";
    
   Sport_Club            postgres    false    217            �           2606    16702     Medicine_card Medicine_card_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "Sport_Club"."Medicine_card"
    ADD CONSTRAINT "Medicine_card_pkey" PRIMARY KEY (number_of_medicine_card);
 T   ALTER TABLE ONLY "Sport_Club"."Medicine_card" DROP CONSTRAINT "Medicine_card_pkey";
    
   Sport_Club            postgres    false    220            �           2606    16674 &   Medicine_testing Medicine_testing_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "Sport_Club"."Medicine_testing"
    ADD CONSTRAINT "Medicine_testing_pkey" PRIMARY KEY (number_of_testing);
 Z   ALTER TABLE ONLY "Sport_Club"."Medicine_testing" DROP CONSTRAINT "Medicine_testing_pkey";
    
   Sport_Club            postgres    false    227            �           2606    16594 H   Participation_in_the_competition  Participation_in_the_competition _pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_competition "
    ADD CONSTRAINT "Participation_in_the_competition _pkey" PRIMARY KEY (particip_compet_id);
 |   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_competition " DROP CONSTRAINT "Participation_in_the_competition _pkey";
    
   Sport_Club            postgres    false    225            �           2606    16700 @   Participation_in_the_training Participation_in_the_training_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training"
    ADD CONSTRAINT "Participation_in_the_training_pkey" PRIMARY KEY (training);
 t   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training" DROP CONSTRAINT "Participation_in_the_training_pkey";
    
   Sport_Club            postgres    false    222            �           2606    16411    Category Salary_check1    CHECK CONSTRAINT     h   ALTER TABLE "Sport_Club"."Category"
    ADD CONSTRAINT "Salary_check1" CHECK ((salary >= 0)) NOT VALID;
 E   ALTER TABLE "Sport_Club"."Category" DROP CONSTRAINT "Salary_check1";
    
   Sport_Club          postgres    false    214    214            �           2606    16412    Category Salary_check2    CHECK CONSTRAINT     n   ALTER TABLE "Sport_Club"."Category"
    ADD CONSTRAINT "Salary_check2" CHECK ((salary <= 1000000)) NOT VALID;
 E   ALTER TABLE "Sport_Club"."Category" DROP CONSTRAINT "Salary_check2";
    
   Sport_Club          postgres    false    214    214            �           2606    16630    Sport_type Sport_type_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "Sport_Club"."Sport_type"
    ADD CONSTRAINT "Sport_type_pkey" PRIMARY KEY (number_of_sport_type);
 N   ALTER TABLE ONLY "Sport_Club"."Sport_type" DROP CONSTRAINT "Sport_type_pkey";
    
   Sport_Club            postgres    false    216            �           2606    16636 &   Sportsmen_injury Sportsmen_injury_pkey 
   CONSTRAINT        ALTER TABLE ONLY "Sport_Club"."Sportsmen_injury"
    ADD CONSTRAINT "Sportsmen_injury_pkey" PRIMARY KEY (sportsmen_injury_id);
 Z   ALTER TABLE ONLY "Sport_Club"."Sportsmen_injury" DROP CONSTRAINT "Sportsmen_injury_pkey";
    
   Sport_Club            postgres    false    224            �           2606    16538    Sportsmen Sportsmen_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY "Sport_Club"."Sportsmen"
    ADD CONSTRAINT "Sportsmen_pkey" PRIMARY KEY (sportsman_id);
 L   ALTER TABLE ONLY "Sport_Club"."Sportsmen" DROP CONSTRAINT "Sportsmen_pkey";
    
   Sport_Club            postgres    false    223            �           2606    16712    Medicine_testing date_chech    CHECK CONSTRAINT     |   ALTER TABLE "Sport_Club"."Medicine_testing"
    ADD CONSTRAINT date_chech CHECK ((testing_date <= CURRENT_DATE)) NOT VALID;
 H   ALTER TABLE "Sport_Club"."Medicine_testing" DROP CONSTRAINT date_chech;
    
   Sport_Club          postgres    false    227    227            �           2606    16713    Sportsmen_injury date_check    CHECK CONSTRAINT     �   ALTER TABLE "Sport_Club"."Sportsmen_injury"
    ADD CONSTRAINT date_check CHECK ((got_injury_at_date <= CURRENT_DATE)) NOT VALID;
 H   ALTER TABLE "Sport_Club"."Sportsmen_injury" DROP CONSTRAINT date_check;
    
   Sport_Club          postgres    false    224    224            �           2606    16715    Training date_check    CHECK CONSTRAINT     s   ALTER TABLE "Sport_Club"."Training"
    ADD CONSTRAINT date_check CHECK ((date_action <= CURRENT_DATE)) NOT VALID;
 @   ALTER TABLE "Sport_Club"."Training" DROP CONSTRAINT date_check;
    
   Sport_Club          postgres    false    215    215            �           2606    16716    Cooperation date_check    CHECK CONSTRAINT     |   ALTER TABLE "Sport_Club"."Cooperation"
    ADD CONSTRAINT date_check CHECK ((cooperation_since <= CURRENT_DATE)) NOT VALID;
 C   ALTER TABLE "Sport_Club"."Cooperation" DROP CONSTRAINT date_check;
    
   Sport_Club          postgres    false    226    226            �           2606    16714    Sportsmen_injury date_check2    CHECK CONSTRAINT     �   ALTER TABLE "Sport_Club"."Sportsmen_injury"
    ADD CONSTRAINT date_check2 CHECK ((became_healthy_at_date <= CURRENT_DATE)) NOT VALID;
 I   ALTER TABLE "Sport_Club"."Sportsmen_injury" DROP CONSTRAINT date_check2;
    
   Sport_Club          postgres    false    224    224            �           2606    16717    Cooperation date_check2    CHECK CONSTRAINT     {   ALTER TABLE "Sport_Club"."Cooperation"
    ADD CONSTRAINT date_check2 CHECK ((cooperation_end <= CURRENT_DATE)) NOT VALID;
 D   ALTER TABLE "Sport_Club"."Cooperation" DROP CONSTRAINT date_check2;
    
   Sport_Club          postgres    false    226    226            �           2606    16613    Doctor doctor_number 
   CONSTRAINT     `   ALTER TABLE ONLY "Sport_Club"."Doctor"
    ADD CONSTRAINT doctor_number UNIQUE (doctor_number);
 F   ALTER TABLE ONLY "Sport_Club"."Doctor" DROP CONSTRAINT doctor_number;
    
   Sport_Club            postgres    false    219            �           2606    16652 "   Sportsmen id_of_qualification_book 
   CONSTRAINT     m   ALTER TABLE ONLY "Sport_Club"."Sportsmen"
    ADD CONSTRAINT id_of_qualification_book UNIQUE (sportsman_id);
 T   ALTER TABLE ONLY "Sport_Club"."Sportsmen" DROP CONSTRAINT id_of_qualification_book;
    
   Sport_Club            postgres    false    223            �           2606    16509    Coach number_of_coach 
   CONSTRAINT     h   ALTER TABLE ONLY "Sport_Club"."Coach"
    ADD CONSTRAINT number_of_coach PRIMARY KEY (number_of_coach);
 G   ALTER TABLE ONLY "Sport_Club"."Coach" DROP CONSTRAINT number_of_coach;
    
   Sport_Club            postgres    false    221            �           2606    16472 !   Competition number_of_competition 
   CONSTRAINT     z   ALTER TABLE ONLY "Sport_Club"."Competition"
    ADD CONSTRAINT number_of_competition PRIMARY KEY (number_of_competition);
 S   ALTER TABLE ONLY "Sport_Club"."Competition" DROP CONSTRAINT number_of_competition;
    
   Sport_Club            postgres    false    218            �           2606    16465    Injury number_of_injury 
   CONSTRAINT     f   ALTER TABLE ONLY "Sport_Club"."Injury"
    ADD CONSTRAINT number_of_injury UNIQUE (number_of_injury);
 I   ALTER TABLE ONLY "Sport_Club"."Injury" DROP CONSTRAINT number_of_injury;
    
   Sport_Club            postgres    false    217            �           2606    16480 %   Medicine_card number_of_medicine_card 
   CONSTRAINT     {   ALTER TABLE ONLY "Sport_Club"."Medicine_card"
    ADD CONSTRAINT number_of_medicine_card UNIQUE (number_of_medicine_card);
 W   ALTER TABLE ONLY "Sport_Club"."Medicine_card" DROP CONSTRAINT number_of_medicine_card;
    
   Sport_Club            postgres    false    220            �           2606    16460    Sport_type number_of_sport_type 
   CONSTRAINT     r   ALTER TABLE ONLY "Sport_Club"."Sport_type"
    ADD CONSTRAINT number_of_sport_type UNIQUE (number_of_sport_type);
 Q   ALTER TABLE ONLY "Sport_Club"."Sport_type" DROP CONSTRAINT number_of_sport_type;
    
   Sport_Club            postgres    false    216            �           2606    16455    Training number_of_training 
   CONSTRAINT     q   ALTER TABLE ONLY "Sport_Club"."Training"
    ADD CONSTRAINT number_of_training PRIMARY KEY (number_of_training);
 M   ALTER TABLE ONLY "Sport_Club"."Training" DROP CONSTRAINT number_of_training;
    
   Sport_Club            postgres    false    215            �           2606    16413    Category score_limit_check1    CHECK CONSTRAINT     o   ALTER TABLE "Sport_Club"."Category"
    ADD CONSTRAINT score_limit_check1 CHECK ((score_limit > 0)) NOT VALID;
 H   ALTER TABLE "Sport_Club"."Category" DROP CONSTRAINT score_limit_check1;
    
   Sport_Club          postgres    false    214    214            �           2606    16414    Category score_limit_check2    CHECK CONSTRAINT     s   ALTER TABLE "Sport_Club"."Category"
    ADD CONSTRAINT score_limit_check2 CHECK ((score_limit <= 1000)) NOT VALID;
 H   ALTER TABLE "Sport_Club"."Category" DROP CONSTRAINT score_limit_check2;
    
   Sport_Club          postgres    false    214    214            �           2606    16487    Coach category_level_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Coach"
    ADD CONSTRAINT category_level_key FOREIGN KEY (category_level) REFERENCES "Sport_Club"."Category"(level_of_category);
 J   ALTER TABLE ONLY "Sport_Club"."Coach" DROP CONSTRAINT category_level_key;
    
   Sport_Club          postgres    false    221    3537    214            �           2606    16515 *   Participation_in_the_training coach_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training"
    ADD CONSTRAINT coach_id_key FOREIGN KEY (coach_id) REFERENCES "Sport_Club"."Coach"(number_of_coach);
 \   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training" DROP CONSTRAINT coach_id_key;
    
   Sport_Club          postgres    false    3559    222    221                       2606    16583    Cooperation coach_number_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Cooperation"
    ADD CONSTRAINT coach_number_key FOREIGN KEY (coach_number) REFERENCES "Sport_Club"."Coach"(number_of_coach);
 N   ALTER TABLE ONLY "Sport_Club"."Cooperation" DROP CONSTRAINT coach_number_key;
    
   Sport_Club          postgres    false    226    221    3559            �           2606    16563 8   Participation_in_the_competition  id_of_comptetition_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_competition "
    ADD CONSTRAINT id_of_comptetition_key FOREIGN KEY (id_of_comptetition) REFERENCES "Sport_Club"."Competition"(number_of_competition);
 j   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_competition " DROP CONSTRAINT id_of_comptetition_key;
    
   Sport_Club          postgres    false    218    3549    225                       2606    16619 (   Medicine_testing id_of_medicine_book_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Medicine_testing"
    ADD CONSTRAINT id_of_medicine_book_key FOREIGN KEY (id_of_medicine_book) REFERENCES "Sport_Club"."Medicine_card"(number_of_medicine_card) NOT VALID;
 Z   ALTER TABLE ONLY "Sport_Club"."Medicine_testing" DROP CONSTRAINT id_of_medicine_book_key;
    
   Sport_Club          postgres    false    227    3557    220                       2606    16588 $   Cooperation id_of_qualification_book    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Cooperation"
    ADD CONSTRAINT id_of_qualification_book FOREIGN KEY (id_of_qualification_book) REFERENCES "Sport_Club"."Sportsmen"(sportsman_id);
 V   ALTER TABLE ONLY "Sport_Club"."Cooperation" DROP CONSTRAINT id_of_qualification_book;
    
   Sport_Club          postgres    false    223    226    3563            �           2606    16547 -   Sportsmen_injury id_of_qualification_book_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Sportsmen_injury"
    ADD CONSTRAINT id_of_qualification_book_key FOREIGN KEY (id_of_qualification_book) REFERENCES "Sport_Club"."Sportsmen"(sportsman_id);
 _   ALTER TABLE ONLY "Sport_Club"."Sportsmen_injury" DROP CONSTRAINT id_of_qualification_book_key;
    
   Sport_Club          postgres    false    223    224    3563            �           2606    16573 >   Participation_in_the_competition  id_of_qualification_book_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_competition "
    ADD CONSTRAINT id_of_qualification_book_key FOREIGN KEY (id_of_qualification_book) REFERENCES "Sport_Club"."Sportsmen"(sportsman_id);
 p   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_competition " DROP CONSTRAINT id_of_qualification_book_key;
    
   Sport_Club          postgres    false    225    3563    223                       2606    16624 '   Medicine_testing number_from_doctor_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Medicine_testing"
    ADD CONSTRAINT number_from_doctor_key FOREIGN KEY (number_from_doctor) REFERENCES "Sport_Club"."Doctor"(doctor_number) NOT VALID;
 Y   ALTER TABLE ONLY "Sport_Club"."Medicine_testing" DROP CONSTRAINT number_from_doctor_key;
    
   Sport_Club          postgres    false    227    219    3551            �           2606    16552 %   Sportsmen_injury number_of_injury_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Sportsmen_injury"
    ADD CONSTRAINT number_of_injury_key FOREIGN KEY (number_of_injury) REFERENCES "Sport_Club"."Injury"(number_of_injury);
 W   ALTER TABLE ONLY "Sport_Club"."Sportsmen_injury" DROP CONSTRAINT number_of_injury_key;
    
   Sport_Club          postgres    false    217    224    3547            �           2606    16520 *   Participation_in_the_training sport_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training"
    ADD CONSTRAINT sport_id_key FOREIGN KEY (sport_id) REFERENCES "Sport_Club"."Sport_type"(number_of_sport_type);
 \   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training" DROP CONSTRAINT sport_id_key;
    
   Sport_Club          postgres    false    3543    222    216                        2606    16568 2   Participation_in_the_competition  sport_number_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_competition "
    ADD CONSTRAINT sport_number_key FOREIGN KEY (sport_number) REFERENCES "Sport_Club"."Sport_type"(number_of_sport_type);
 d   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_competition " DROP CONSTRAINT sport_number_key;
    
   Sport_Club          postgres    false    225    3543    216            �           2606    16685    Medicine_card sportsman_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Medicine_card"
    ADD CONSTRAINT sportsman_id_key FOREIGN KEY (sportsman_id) REFERENCES "Sport_Club"."Sportsmen"(sportsman_id) NOT VALID;
 P   ALTER TABLE ONLY "Sport_Club"."Medicine_card" DROP CONSTRAINT sportsman_id_key;
    
   Sport_Club          postgres    false    220    3563    223            �           2606    16539 .   Participation_in_the_training sportsmen_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training"
    ADD CONSTRAINT sportsmen_id_key FOREIGN KEY (sportsmen_id) REFERENCES "Sport_Club"."Sportsmen"(sportsman_id) NOT VALID;
 `   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training" DROP CONSTRAINT sportsmen_id_key;
    
   Sport_Club          postgres    false    3563    222    223            �           2606    16525 -   Participation_in_the_training training_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training"
    ADD CONSTRAINT training_id_key FOREIGN KEY (training_number) REFERENCES "Sport_Club"."Training"(number_of_training);
 _   ALTER TABLE ONLY "Sport_Club"."Participation_in_the_training" DROP CONSTRAINT training_id_key;
    
   Sport_Club          postgres    false    222    215    3539            �   O   x�5���0kr�@��o��?GhauW��!#�0�Mܱ�]\���*�[]Qƅ�ݎ�,
y�ݢ������C�V{      �   H  x�e�MN�@FמS�(���aJ$ĦR+�BmQ9��4"i!g�܈/��M�.3����a�0$y��X��N��t�Ҹ'�(N�,/ʐb3*?�v�[��V,�pX�Ej9�O9�Y���"�e'醬yq-mpӧwQ@D�I�c��<�W���g�)�� �B�p�GEİH�0�Q�=��K`��[�F~��j��SɈSPv�:#ZM����-A�端���&E�0ɉ30��̼���mܛ($�L
����"����~*�t�Ak���C9�R l��[�˷����ϛ<R�5�I?�-v�h"��|����*��w~���(�ē��1��zf      �   �   x�-���0E��*T�,ΐ���bl2"�2t� s�c����X퐾���Z�#���-3#Kg�����)#ˎp��9�Y�#�B)��*|E[�6�BB����J����Ɠ�f��1�"�
���f&��g��V�i�v"��}�c;�m�pM\ܽ��3� �b�      �   Y   x�eɹ�0D��"� ����:��f0� x*���צ�jյ��f�L�<YG��e �H6m�m%ۈ��9�v�i��W�>��_F/      �   S  x�e�IN�@E�ݧ�@���p�`)�!�Ȗط<;��BՍ�U;m������U=1������"�Q����#PЎ'o���КjN��J��15h�a���6��Zա
)C+�U���0�����ׄ�5���Ey>էBS�ri`���Z)χ�(M��J�#�#(my���JW"�яW	A�S�����a'���P�����J}J�}��DG5Ф򫒞��`~n���<�=Ƿdx*��V�dm�<r���#�{V�\��t/'��`��q/!x��W2����̀�a��P�T�t<���N�f��0�A;��^�Ơ|j���#�      �   �   x�m���0D��U�ľ�B1�D��X0!���ia~G��@�X��h�����Np����:丣����BZ�92�%
\,��l�z���u�3]1��<�i�u�58jB�$=��<R<�-�uQ�p�7ؠB�XT~�d`�&T�B�	.���7_V�]Y��nKs
gi5㵁�]����(^�y��l      �   m  x��Q[N�0�vN��(o.�	z�6<�Q�~�D����m�>�\a�F�n\T$$����wgg�=�gb�Frx�d� �G��A��gAc�j4\��x���پ�+ϥ\`%c��2�����r�ҚK�L7[�xl����k�<px���z�X����k)��Û	�����/�~ث��p�v��%�3�����J9�0劙����i`+�F��+7�3I.2��c�G�����wMr���A",#�$����D�8q��n7y%��hJ��7�Z`̪J9i��������(��u͛2I.������G稾��	4*��ԭ�������pG��#��\�M%9��`��=I*T:�d�]v���Y�}��v      �      x������ � �      �      x������ � �      �   e   x�UϹ�@DQ�;�-4G.$��6)���R}�Q)ߌ���{\ρ	�@�2.,�P�5�A7Vt(�<C�lX�����xe�e�%G���&�?�/N}W�      �   �   x�=�K
�PE��b�j���ʹՑN���V�V�����HHHnrr3�j��<�u"���#�ũp!��xY��p����t����O��`|h�B8Ec{��2:��n������fc��0���HU���_=      �   J  x�e�]N�0��wO��u�sS"!^*�#!D��	��i=��F���Mś�ݙ�<kH�t�V���d�$�W���4ˋ��������ڹ��B�M�C-.=D�<�Q;=���;w�D��PJ�g�k�vz���N����R�&��������y^�K�Y�a�[\�3E��<E&\��C�=�<�Ղ��̹�D�ܧ���KtPm�(Vzts8���m�i$��')�+B Cf�����H�I�3)�k��j���i��-��=G4��_*�����)�~`�!j�{#G4��oja#~�]��ӗAk��[$���S��Ltj����f��zf      �      x������ � �      �   �   x�Uл�P��[�����B3Pm�R��V�o4��x��~>��������{�GqIE�R$5J�t�(M2Уt�Ĉ2$3��K1�(KB�R����}��(s0���
�V��*�f���v��:������p�&��p���p��O_\_Hܮ >J�Ʒ     