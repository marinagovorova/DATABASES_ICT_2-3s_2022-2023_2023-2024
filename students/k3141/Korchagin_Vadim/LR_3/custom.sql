PGDMP  6    *             	    {         
   Sport_club    16.0    16.0 M    x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            {           1262    16561 
   Sport_club    DATABASE     �   CREATE DATABASE "Sport_club" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Sport_club";
                postgres    false                        2615    24580    coach    SCHEMA        CREATE SCHEMA coach;
    DROP SCHEMA coach;
                postgres    false            	            2615    24582    competition    SCHEMA        CREATE SCHEMA competition;
    DROP SCHEMA competition;
                postgres    false                        2615    24579 	   sportsman    SCHEMA        CREATE SCHEMA sportsman;
    DROP SCHEMA sportsman;
                postgres    false                        2615    24581    training_information    SCHEMA     $   CREATE SCHEMA training_information;
 "   DROP SCHEMA training_information;
                postgres    false            �            1259    16635    coach    TABLE     s  CREATE TABLE coach.coach (
    salary numeric NOT NULL,
    coach_code integer NOT NULL,
    passport_number character varying(30) NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    phone_number integer NOT NULL,
    CONSTRAINT check_salary CHECK ((salary > (0)::numeric))
);
    DROP TABLE coach.coach;
       coach         heap    postgres    false    7            �            1259    16716    coach_category    TABLE     Z  CREATE TABLE coach.coach_category (
    category_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    category_name character varying(20) NOT NULL,
    coach_code integer NOT NULL,
    CONSTRAINT category_from_date_check CHECK ((from_date > '1930-01-01'::date)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);
 !   DROP TABLE coach.coach_category;
       coach         heap    postgres    false    7            �            1259    16728    coach_rating    TABLE     C  CREATE TABLE coach.coach_rating (
    rating_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    coach_code integer NOT NULL,
    rating_number integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);
    DROP TABLE coach.coach_rating;
       coach         heap    postgres    false    7            �            1259    16780    competition    TABLE       CREATE TABLE competition.competition (
    competition_code integer NOT NULL,
    name_competition character varying(100) NOT NULL,
    date_time timestamp without time zone NOT NULL,
    venue character varying(60) NOT NULL,
    category character varying(20) NOT NULL,
    type_competition character varying(20) NOT NULL,
    status character varying(10) NOT NULL,
    prize_place numeric NOT NULL,
    CONSTRAINT " check_date_time" CHECK ((date_time >= CURRENT_TIMESTAMP)),
    CONSTRAINT check_prize_place CHECK (((prize_place >= (1)::numeric) AND ((3)::numeric >= prize_place))),
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);
 $   DROP TABLE competition.competition;
       competition         heap    postgres    false    9            �            1259    16816    competition_conducting    TABLE     �  CREATE TABLE competition.competition_conducting (
    competition_conducting_code integer NOT NULL,
    competition_code integer NOT NULL,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    status character varying(10) NOT NULL,
    coachs_points integer NOT NULL,
    sportsmans_points integer NOT NULL,
    CONSTRAINT check_coachs_points CHECK ((coachs_points >= 0)),
    CONSTRAINT check_sportsmans_points CHECK ((sportsmans_points >= 0)),
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);
 /   DROP TABLE competition.competition_conducting;
       competition         heap    postgres    false    9            �            1259    16790 
   qualifying    TABLE     �  CREATE TABLE competition.qualifying (
    qualifying_code integer NOT NULL,
    sportsman_code integer NOT NULL,
    competition_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    status character varying(10) NOT NULL,
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);
 #   DROP TABLE competition.qualifying;
       competition         heap    postgres    false    9            �            1259    16667    medical_life    TABLE     (  CREATE TABLE sportsman.medical_life (
    medical_life_code integer NOT NULL,
    date_of_injury date NOT NULL,
    date_of_discharge date,
    sportsman_code integer NOT NULL,
    injury_code integer NOT NULL,
    CONSTRAINT check_date_of_injury CHECK ((date_of_injury > '1930-01-01'::date))
);
 #   DROP TABLE sportsman.medical_life;
    	   sportsman         heap    postgres    false    6            �            1259    16647 	   sportsman    TABLE     �  CREATE TABLE sportsman.sportsman (
    sportsman_code integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    date_of_birth date NOT NULL,
    sport_code integer NOT NULL,
    passport_number character varying(30) NOT NULL,
    CONSTRAINT check_date_of_birth CHECK ((date_of_birth >= '1930-01-01'::date))
);
     DROP TABLE sportsman.sportsman;
    	   sportsman         heap    postgres    false    6            �            1259    16685    sportsman_qualification    TABLE     �  CREATE TABLE sportsman.sportsman_qualification (
    qualification_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    category character varying(20) NOT NULL,
    weight integer NOT NULL,
    sportsman_code integer NOT NULL,
    sport_code integer NOT NULL,
    CONSTRAINT chech_from_date CHECK ((from_date > '1930-01-01'::date)),
    CONSTRAINT check_weight CHECK ((weight >= 30))
);
 .   DROP TABLE sportsman.sportsman_qualification;
    	   sportsman         heap    postgres    false    6            �            1259    16702    sportsman_rating    TABLE     +  CREATE TABLE sportsman.sportsman_rating (
    rating_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    sportsman_code integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);
 '   DROP TABLE sportsman.sportsman_rating;
    	   sportsman         heap    postgres    false    6            �            1259    16660    type_of_injury    TABLE     �   CREATE TABLE sportsman.type_of_injury (
    type_of_injury character varying(60) NOT NULL,
    injury_code integer NOT NULL,
    treatment text NOT NULL,
    description text NOT NULL,
    first_aid text NOT NULL
);
 %   DROP TABLE sportsman.type_of_injury;
    	   sportsman         heap    postgres    false    6            �            1259    16742 
   leadership    TABLE       CREATE TABLE training_information.leadership (
    leadership_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE))
);
 ,   DROP TABLE training_information.leadership;
       training_information         heap    postgres    false    8            �            1259    16628 
   sport_type    TABLE     �   CREATE TABLE training_information.sport_type (
    type_of_sport_code integer NOT NULL,
    sport_code integer NOT NULL,
    rules text NOT NULL
);
 ,   DROP TABLE training_information.sport_type;
       training_information         heap    postgres    false    8            �            1259    16758    training    TABLE       CREATE TABLE training_information.training (
    training_code integer NOT NULL,
    time_date timestamp without time zone NOT NULL,
    status character varying(10) NOT NULL,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text]))),
    CONSTRAINT check_time_date CHECK ((time_date > CURRENT_TIMESTAMP))
);
 *   DROP TABLE training_information.training;
       training_information         heap    postgres    false    8            i          0    16635    coach 
   TABLE DATA           l   COPY coach.coach (salary, coach_code, passport_number, name, surname, patronymic, phone_number) FROM stdin;
    coach          postgres    false    220   Us       o          0    16716    coach_category 
   TABLE DATA           e   COPY coach.coach_category (category_code, from_date, to_date, category_name, coach_code) FROM stdin;
    coach          postgres    false    226   v       p          0    16728    coach_rating 
   TABLE DATA           a   COPY coach.coach_rating (rating_code, from_date, to_date, coach_code, rating_number) FROM stdin;
    coach          postgres    false    227   �w       s          0    16780    competition 
   TABLE DATA           �   COPY competition.competition (competition_code, name_competition, date_time, venue, category, type_competition, status, prize_place) FROM stdin;
    competition          postgres    false    230   Gy       u          0    16816    competition_conducting 
   TABLE DATA           �   COPY competition.competition_conducting (competition_conducting_code, competition_code, sportsman_code, coach_code, sport_code, status, coachs_points, sportsmans_points) FROM stdin;
    competition          postgres    false    232   �{       t          0    16790 
   qualifying 
   TABLE DATA           |   COPY competition.qualifying (qualifying_code, sportsman_code, competition_code, coach_code, sport_code, status) FROM stdin;
    competition          postgres    false    231   ~       l          0    16667    medical_life 
   TABLE DATA           |   COPY sportsman.medical_life (medical_life_code, date_of_injury, date_of_discharge, sportsman_code, injury_code) FROM stdin;
 	   sportsman          postgres    false    223   �       j          0    16647 	   sportsman 
   TABLE DATA           }   COPY sportsman.sportsman (sportsman_code, name, surname, patronymic, date_of_birth, sport_code, passport_number) FROM stdin;
 	   sportsman          postgres    false    221   �       m          0    16685    sportsman_qualification 
   TABLE DATA           �   COPY sportsman.sportsman_qualification (qualification_code, from_date, to_date, category, weight, sportsman_code, sport_code) FROM stdin;
 	   sportsman          postgres    false    224   ׃       n          0    16702    sportsman_rating 
   TABLE DATA           ^   COPY sportsman.sportsman_rating (rating_code, from_date, to_date, sportsman_code) FROM stdin;
 	   sportsman          postgres    false    225   +�       k          0    16660    type_of_injury 
   TABLE DATA           k   COPY sportsman.type_of_injury (type_of_injury, injury_code, treatment, description, first_aid) FROM stdin;
 	   sportsman          postgres    false    222   O�       q          0    16742 
   leadership 
   TABLE DATA           s   COPY training_information.leadership (leadership_code, from_date, to_date, sportsman_code, coach_code) FROM stdin;
    training_information          postgres    false    228   B�       h          0    16628 
   sport_type 
   TABLE DATA           Y   COPY training_information.sport_type (type_of_sport_code, sport_code, rules) FROM stdin;
    training_information          postgres    false    219   ��       r          0    16758    training 
   TABLE DATA           z   COPY training_information.training (training_code, time_date, status, sportsman_code, coach_code, sport_code) FROM stdin;
    training_information          postgres    false    229   8�       �           2606    16722    coach_category category_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY coach.coach_category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_code);
 E   ALTER TABLE ONLY coach.coach_category DROP CONSTRAINT category_pkey;
       coach            postgres    false    226            �           2606    16734    coach_rating coach_rating_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT coach_rating_pkey PRIMARY KEY (rating_code);
 G   ALTER TABLE ONLY coach.coach_rating DROP CONSTRAINT coach_rating_pkey;
       coach            postgres    false    227            �           2606    16642    coach pk_coach_code 
   CONSTRAINT     X   ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT pk_coach_code PRIMARY KEY (coach_code);
 <   ALTER TABLE ONLY coach.coach DROP CONSTRAINT pk_coach_code;
       coach            postgres    false    220            �           2606    16736    coach_rating unique_coach_code 
   CONSTRAINT     ^   ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT unique_coach_code UNIQUE (coach_code);
 G   ALTER TABLE ONLY coach.coach_rating DROP CONSTRAINT unique_coach_code;
       coach            postgres    false    227            �           2606    16644 $   coach unique_coaches_passport_number 
   CONSTRAINT     i   ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT unique_coaches_passport_number UNIQUE (passport_number);
 M   ALTER TABLE ONLY coach.coach DROP CONSTRAINT unique_coaches_passport_number;
       coach            postgres    false    220            �           2606    16646 !   coach unique_coaches_phone_number 
   CONSTRAINT     c   ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT unique_coaches_phone_number UNIQUE (phone_number);
 J   ALTER TABLE ONLY coach.coach DROP CONSTRAINT unique_coaches_phone_number;
       coach            postgres    false    220            �           2606    16823 2   competition_conducting competition_conducting_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT competition_conducting_pkey PRIMARY KEY (competition_conducting_code);
 a   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT competition_conducting_pkey;
       competition            postgres    false    232            �           2606    16789    competition competition_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY competition.competition
    ADD CONSTRAINT competition_pkey PRIMARY KEY (competition_code);
 K   ALTER TABLE ONLY competition.competition DROP CONSTRAINT competition_pkey;
       competition            postgres    false    230            �           2606    16795    qualifying qualifying_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT qualifying_pkey PRIMARY KEY (qualifying_code);
 I   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT qualifying_pkey;
       competition            postgres    false    231            �           2606    16672    medical_life medical_life_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT medical_life_pkey PRIMARY KEY (medical_life_code);
 K   ALTER TABLE ONLY sportsman.medical_life DROP CONSTRAINT medical_life_pkey;
    	   sportsman            postgres    false    223            �           2606    16666    type_of_injury pk_injury_code 
   CONSTRAINT     g   ALTER TABLE ONLY sportsman.type_of_injury
    ADD CONSTRAINT pk_injury_code PRIMARY KEY (injury_code);
 J   ALTER TABLE ONLY sportsman.type_of_injury DROP CONSTRAINT pk_injury_code;
    	   sportsman            postgres    false    222            �           2606    16652    sportsman sportsman_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT sportsman_pkey PRIMARY KEY (sportsman_code);
 E   ALTER TABLE ONLY sportsman.sportsman DROP CONSTRAINT sportsman_pkey;
    	   sportsman            postgres    false    221            �           2606    16691 4   sportsman_qualification sportsman_qualification_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT sportsman_qualification_pkey PRIMARY KEY (qualification_code);
 a   ALTER TABLE ONLY sportsman.sportsman_qualification DROP CONSTRAINT sportsman_qualification_pkey;
    	   sportsman            postgres    false    224            �           2606    16708 &   sportsman_rating sportsman_rating_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT sportsman_rating_pkey PRIMARY KEY (rating_code);
 S   ALTER TABLE ONLY sportsman.sportsman_rating DROP CONSTRAINT sportsman_rating_pkey;
    	   sportsman            postgres    false    225            �           2606    16710 &   sportsman_rating unique_sportsman_code 
   CONSTRAINT     n   ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT unique_sportsman_code UNIQUE (sportsman_code);
 S   ALTER TABLE ONLY sportsman.sportsman_rating DROP CONSTRAINT unique_sportsman_code;
    	   sportsman            postgres    false    225            �           2606    16674 *   medical_life unique_sportsman_code_medical 
   CONSTRAINT     r   ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT unique_sportsman_code_medical UNIQUE (sportsman_code);
 W   ALTER TABLE ONLY sportsman.medical_life DROP CONSTRAINT unique_sportsman_code_medical;
    	   sportsman            postgres    false    223            �           2606    16654 +   sportsman unique_sportsmans_passport_number 
   CONSTRAINT     t   ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT unique_sportsmans_passport_number UNIQUE (passport_number);
 X   ALTER TABLE ONLY sportsman.sportsman DROP CONSTRAINT unique_sportsmans_passport_number;
    	   sportsman            postgres    false    221            �           2606    16747    leadership leadership_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT leadership_pkey PRIMARY KEY (leadership_code);
 R   ALTER TABLE ONLY training_information.leadership DROP CONSTRAINT leadership_pkey;
       training_information            postgres    false    228            �           2606    16634    sport_type pk_sport_code 
   CONSTRAINT     l   ALTER TABLE ONLY training_information.sport_type
    ADD CONSTRAINT pk_sport_code PRIMARY KEY (sport_code);
 P   ALTER TABLE ONLY training_information.sport_type DROP CONSTRAINT pk_sport_code;
       training_information            postgres    false    219            �           2606    16764    training training_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT training_pkey PRIMARY KEY (training_code);
 N   ALTER TABLE ONLY training_information.training DROP CONSTRAINT training_pkey;
       training_information            postgres    false    229            �           2606    16723    coach_category fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY coach.coach_category
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 E   ALTER TABLE ONLY coach.coach_category DROP CONSTRAINT fk_coach_code;
       coach          postgres    false    226    4767    220            �           2606    16737    coach_rating fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 C   ALTER TABLE ONLY coach.coach_rating DROP CONSTRAINT fk_coach_code;
       coach          postgres    false    220    4767    227            �           2606    16796    qualifying fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 G   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT fk_coach_code;
       competition          postgres    false    220    4767    231            �           2606    16824 $   competition_conducting fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 S   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT fk_coach_code;
       competition          postgres    false    220    232    4767            �           2606    16801    qualifying fk_competition_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_competition_code FOREIGN KEY (competition_code) REFERENCES competition.competition(competition_code);
 M   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT fk_competition_code;
       competition          postgres    false    230    231    4799            �           2606    16829 *   competition_conducting fk_competition_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_competition_code FOREIGN KEY (competition_code) REFERENCES competition.competition(competition_code);
 Y   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT fk_competition_code;
       competition          postgres    false    230    232    4799            �           2606    16806    qualifying fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 G   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT fk_sport_code;
       competition          postgres    false    4765    219    231            �           2606    16834 $   competition_conducting fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 S   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT fk_sport_code;
       competition          postgres    false    232    4765    219            �           2606    16811    qualifying fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 K   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT fk_sportsman_code;
       competition          postgres    false    221    4773    231            �           2606    16839 (   competition_conducting fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 W   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT fk_sportsman_code;
       competition          postgres    false    4773    232    221            �           2606    16675    medical_life fk_injury_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT fk_injury_code FOREIGN KEY (injury_code) REFERENCES sportsman.type_of_injury(injury_code);
 H   ALTER TABLE ONLY sportsman.medical_life DROP CONSTRAINT fk_injury_code;
    	   sportsman          postgres    false    223    4777    222            �           2606    16655    sportsman fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 D   ALTER TABLE ONLY sportsman.sportsman DROP CONSTRAINT fk_sport_code;
    	   sportsman          postgres    false    221    219    4765            �           2606    16692 %   sportsman_qualification fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 R   ALTER TABLE ONLY sportsman.sportsman_qualification DROP CONSTRAINT fk_sport_code;
    	   sportsman          postgres    false    224    219    4765            �           2606    16680    medical_life fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 K   ALTER TABLE ONLY sportsman.medical_life DROP CONSTRAINT fk_sportsman_code;
    	   sportsman          postgres    false    221    223    4773            �           2606    16697 )   sportsman_qualification fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 V   ALTER TABLE ONLY sportsman.sportsman_qualification DROP CONSTRAINT fk_sportsman_code;
    	   sportsman          postgres    false    4773    224    221            �           2606    16711 "   sportsman_rating fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 O   ALTER TABLE ONLY sportsman.sportsman_rating DROP CONSTRAINT fk_sportsman_code;
    	   sportsman          postgres    false    221    225    4773            �           2606    16748    leadership fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 P   ALTER TABLE ONLY training_information.leadership DROP CONSTRAINT fk_coach_code;
       training_information          postgres    false    4767    220    228            �           2606    16765    training fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 N   ALTER TABLE ONLY training_information.training DROP CONSTRAINT fk_coach_code;
       training_information          postgres    false    4767    229    220            �           2606    16770    training fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 N   ALTER TABLE ONLY training_information.training DROP CONSTRAINT fk_sport_code;
       training_information          postgres    false    229    219    4765            �           2606    16753    leadership fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 T   ALTER TABLE ONLY training_information.leadership DROP CONSTRAINT fk_sportsman_code;
       training_information          postgres    false    4773    221    228            �           2606    16775    training fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 R   ALTER TABLE ONLY training_information.training DROP CONSTRAINT fk_sportsman_code;
       training_information          postgres    false    221    4773    229            i   �  x�E�Ko1��ԏ)DI��cE�<�"���E7���i����$|X�93���D�����4��v�ۙj߿nt�vk�G�`,�͔)yK�DS���s�+=�Qv��u!�fq�J%�$���L7�=���'��~�]=[���2�q�>Q�"B1x6�t�n�瑮�2��끸�D���LP �T�3]վ�t1�?u9�NW�k?-0�Q�w"��$�(�d1zh�*]���k=�i?U*�krA%��Sa�J4���t߶yj�E̢�Y�^Ҥ�#��9
�T8��}�`�qĢbh[,�QV6��"���R��ҷ^��\Ģ��K�AT)����}�N#��ޖ�{F!B��PHE�P�])���e�?�]��+&=CN��	2W�&!Q͚��������M�g�R� ���@E-c����z*<�����6�1 QGc���s$Г4E4���c=���᝹��%��A� �1���L_��<O?���}� v�i(�I!ǒA�a�օ>��ߺk�A��h4��,P`�NfY�]�� L�2V�ˠ2�*S/��.{ жm$�Tw}�/���dA�B
����h<��H��uC��(�%`&#�* �����V�f>;�����$����nZ��Դ_k?H����>ᐴ�������q�ai9��+��8� �y͒��r4����!����9�v��      o   �  x�eRˊ1<��e���V>�}@`��(k�L@�<��ц�h��T���*�D@�|�<E\G������O��Q��4E۾P����$��`9�|8n_��c-�sm��Ђ0ƴ!q0ƼnfV�����f�+<��}������=���R���w��LA�\���L�}wku4K1P�:��7`���#�b0������7���sN<�����.�kI��Iy��l��ᱴ �)usH��vwX���,��~3{�&������t�ۥ� '��\w"���p�]��8(��>�����Km�[1+��yKD����AA�=t$�.2�>�� a���8�X�#�O���� [T�.�R����we��kP��Q�u4���r����I88��pg����Z@S�NP�2̡4D:�S���(�]TM#���E�f"�������      p   c  x�mRI�A<�iֿ���05�IJ_ZtA��QV���a�H~�x��#��:n�q�X���Q����}�OԩR��0�I��w�v�?,���s��FՂ-d���p�Sl�dV�T� ��[X#�&��I���ؔs��e�b�mo��� )�>b����Y�9;�t�A�@.ק�����)����tF�?�xZC��߷Ut���S����%[�o��"�ǽ�����6i�3�)_�zsr���Y��r�u�
�f���jb�رMְD�h��������5�4��5������o�0P��e4�����c��؛����M�F�������}2t��L5�|��9�����      s   v  x�e�Mn�0���)z�"EYRwv�4���6P��f$�(9�nߡ��S0����̼�F����Y0��w��e�K�}?��W[���Q���O��Au,�q!P����Z$�aT/=X���g{h{e>�b�%�;�n�>'�{�'�v����aK��ll��x]��U��e2X�_+�'|��&���(�^5�m!i��]�'�u�`�ɨ4u�	>g��mΓ���5��݀��Q[�l��<i�$-_{�Y����}��,��ԠuWDV}Tީ'��iɋ:�Gi����1N��C鴼���衝�ϒ�|�Rٿp�VAoH��*���Ă ��؅���p1��˺b�P%�ō���5tdqEY�m`D�4r�0���h|�zT���u���p -��0篰mЈH�</Ve�N��	qK�4xln���d�R慼����m<��|q��C�s�u����}h��JF���<m�+�O:zu��ʝ���92}U`p�[4uɀ �����N�9�+_Yg�-;��w��)V���}���%�G����_�)GA�S�u={̔���m��)QK�[tH��li�����4G-*>��k�!p�l8��؂m	���f�����      u   (  x�E�K�$I�׎�~�q�������_�PY����C��6����{Gz���y����?���v�Z�>a�-OO��ҖT媺}�ή����RK,-K|gTvxoշ�zX���"���ƈkl���i��ӐQI���I)�N[�^��HI��>��:<�Y��fP�"j!��.��eP^hƞ�:��וJ3��VP�S��,�ʎ�W/�:S�].��о��x� z'�O�KeZ]�0_�����է7����D?�N��N�d׃Jc���
 �N�3h��e�sB|_��[%�>H�&pWV�8�-O��|=�_kW'��̣z�õ�=Q]/�-��s��C�)�[c#M���u[8�����4LS���Q�g�|!�S L�@ZY=�M@��y������1n&�ą�$�����Yf��R�y��8�`�P�@؁ϡ@H������z�<Z�הc�&��~mt���Ӈ{��J�`�d�:	����{l�;�h���E
�b_R5��՗���9�=� *�����$��kTl���9��e"�R������$ ϯ�9.��      t   �  x�ERIj�P[�&�<�%�@zߐ�C�5��^[%�T��l�6�իU��߯��?�/��lJA�B8�1}@k��n��Fbڔ�%rA)���J��3�L�>�J�D�6�k�x l7�#rPF���P��1�o���B����B���;Ů��`*��n�F������쥌� 4Wѥ[�ˮ���Դ+}F���*>�B���$ʐ��T���5ԭ�qM��2�M�T�{��#���p�@V�ʷ�-z���P+�h�s����p�sV���'9f�Wn��Z9:��Heh��rbc�K���<
�4����u�b�f�	o�S&��DO�̧'i��sۚ�wE���\$�+s�*�*����<>�T��c������T�B�6��μM����wj�P�ֆ2�V2y9��B>?^��?%��      l   b  x�uSɱ1<C.�ž����p��Y�M%!z���22���l������l�eG���)?e�4�Rda��Z�G���:M�����-T߷*�V+I�u}5��Ds��j� jd]vq���Ӻ�p�z�ns�9e(�FerN�%t%��T��%�H�R��M͸*����5`dqaӐ������؆P��8����:�F�1@C�^;E���Ñq��u��U�,MO'wx^���?�:g�ԑ�ŧ��k尰Z��>r���W3+�KG?�k_� �(G6yw��$��h�Ev�̛KW^���E�� ����z�8�.�'vj3J���{5�B������(����by~�b�?sk�E      j   �  x�U�OS�@�����j�J�:Pz�N{�eI�؃cS;��o��8p��H��{?E�h���\��i;�4u������Y�����b��b3#m�e�T�vU�g�um��]}*�.�pBj�c
�\2Nr�t��*ݕ�nk���!��%k1JU���)�He,��u��徛�'�'U)Ko�I�*�(Y�q���m��aa#���2G1l����w��)(������s$^c&��z�
�׾VZn���]=������D���v#)����~=ֿ�
�HT�fN�G��3~�^��0��X��qO�J�ڟ[<|r���]4I2����2}���}��S �[/��?쟌��n��E��l�ͬ��IJ�G#�s5�:��fS��c]���H����"^�	���{sSV^�N_?f�L-��b��,�d
�P�k�g��|x*SР�BL��E-]�Ŷ{�nn��\�ɲ&vƫK�@�ծv��.��}s<X�X�	�4�7]�ö��tO��yOǐ#�g���t �:�����(�<��	3"�h�� ��� ��c��fi��D���:on!�H[nJ�.�y,뮞��[q�<�6D���������S9�����RƉ&��?`���T�����t�����3�͛�$�ö���������h=�(���1�յ$�      m   D  x�mTMk�P<���-�~ұ$!��r�'1İ�-��B��+��v���Fo43rW� F��?J�1���t�L�3R#;�i��ｲ��^���_�D�t�4tHD�F�+�ܼL�7�d�����VD������x�޻��In34�����郚�����y��Z�;&(gZc���Nނ���y�yyB�Y�&Ɇ�r�:�o����a�<��v�D R��EЪw_����z�"�\ڥ[��f2{uw<�?��#k���ν���:8�{]퇷��P�xt�ZI[��F������x�@/���f���gK��m������VB�����Y6���,"�^�(3���ŕʚ���8r.���>MMo�uI���s{�^�C�Hg�ڒQ��˭x���t� .���Y�Ԧ��m��E�tP�uR�s�ɴ[#K�8��r��a�sj\鎢�H�u��Z|���e<�p
H�ʇ�a�W�@��e��/��i �T-.�Z�r#�܀h%܏���0_]�s}�Z��0YU�U��O�Keh��B^�H��m�ƾ����U���JsR���P�ڏO��?
��      n     x�eRIn1<��t�b�K����01n�VB%j�rIY`��x$����M��~��`�?�+�9����-��L%Z8��;Z�$���c���"�H-��`�����+�lhCn"$����}e8hǝ}� )��Z+C��U��<)��aK�v�w�(s��d'o+W����L�j:*9}kw�7!{p��ڞ�dUn�����j��Tu��#q �m�v3���E�mfl\G�*aN2|���y(�Qt��ݎ����>�Jg��d���n����CD�劎      k      x�UZ�r۸|��_���8v{�d7NR��ڪ�@$(""	.HJ����=P��nlY�e.�=3���o���7��������	qg{�?;����1������o���^|ic�3���q2��}���g��&T�)�!�h�����M�w�ь�+=���w�o��l�e"|rn2G?6f���E3�t�]��pֹr�d��v�.f���x���������E�z�~��M�WZ�����oNQ9S۩�6�Lp�.t\޶��m̧������G�CV�r�v�q��Z6�g;ɇ�ӄ#���̏�7�ϰ�5,l�7�����=n<�9��q��e���^ah��s�a�g��i16N�w0�t�wغ8Wo�n_�֏�;��wp=�Op3X���&G��K�yjL�a�h{�x��_����q��;���:�>�u��ؽ3;�MM;�e	��s�)i{������8�T6�f���|�X�<n���&zX�s���w�1���<��oq�>G\�<��3N��==�6��λF,.35�:�~>�6������?��7�6yu�ۖ4�����&3E:mk+�%��c٘��0U@�g'1j�)��-f�u�X$x�q���G7m.��忳k}wW7�w8
ώS(���;p��G�qk�x����<��x��a@�������#�O76{熍��+#��S�52@q����ݦ����3�5s�q���jc����itm��b�m����)�	���L_u�BԗV�4�^2fgZɏ�s��E�������C���6�L���-4ˑ�PԈ���r������^�F�J�Gc'|���3�cBb�0#�p⯑�;�<���`>���PFz��������wȴ��O��R\^^���)p�u��Kr�����1�9�K# �#3&�m�ptČ�7��\��<��7�E�A*��B��lBh�`�{�:mc��9d�=��E��Ț��.�f�\�y��">qN�Az�W0d�	iˈ3/�vBpEʍ��܍N����"�H�``f�s݃��#��Hy��SٶG����*��s}@&���,�i[W��|��������^tz���7;�G~�i4��I��bL��
ۏ��p\��y}�����Nq=Ņl5Xߋ<�E�N)rp��	�$
��I�ctL���@�j�=L�*X������'�E%�P�m�3����`��pq���*\U����M�|�;KRX�>����>H����9p���G#1ѕA}�5�kHJ���%C{��S2�s�rs �Cb:#�D�lxu�Zp�ą�
��ԏ~���jh����Y@��N��rh
�Y63�wG����{� Ŏ�;���|A��:�Y _����fs�Q�x�����h=�
v�g-P����cBbܛ�?�і���0���n�����qI�0���3|I�#��ĭ$K��{r-�h�0,�+�^�Ԑ�:�����	�#ja�ć)�[�)��<.�s�*��[M&�@�mǠFM�'�غ6�wF4I�9�)> ���}��nN<����r���	ҿ ���'�;K�xt�|l<Q?�8w	���?R��D��u��w�c� �/��ֵP:o���GG"݉���w�:��®���lׅA O0���Q�eG� �0�A��%D06�l�0���:�wc&��������YG�t\�z�Ҥ�%d;z�.E.-�,�-�^�),�f� P����ü(��im�[�tD���_�p1G	���d
jjl;è?pI�k%]2���m�Ч�o'x�|V� <o��fFxP�$��*��#i��+�@_U�KJ��t�	�8$�Sw�L�\<�h��˛��⽆+�[#Ite��%�Eq�
H}*����&�f��N�!������vQ8j
G�jU����)������Q7�R�S�q��*��N,>������H�G�(8�j{-���M�g9���g�Җ�Y�9������Ȱ�$*D+Vv�ԔqN�p{��h�qa��и�Y��R�$\0�t�����^�޾��,~��td� ��lA`�"��Mo��$�#{���:�#�#�e�m��m!����rq5ʾ�VH�(Șt��B�M�HO%���,F�;;���@��(^j?��%c�U.��  ��7)E:f@b1J^�С�JR�I��#J4Z�9{��I�"k��els7�> tNfb�o	�*�{>��(<2�%ČH+3-�b��§���F0�I, ��<7@.Ņ��J������d�
�)�-�'jo�{���GB,����+L�D*;��Y��~������A���rȮ�I��MM� ��ʬ��ɣ�����U��D�t�����=�V4%$C$��Ynd�:�+D�OQ_t��(��KJ��l��a�a�?Y���gA��S�x��������O��Y��P��D!"kU��/�0��=�q��v�1�**.mL��*@rCaUn�6b�R2�X�htlR�}�]�CX�W�"�ys�;�����T��n���1�c�^�Z7��o�����	¿�\[���M��`d���+�ß��ʻ?������ÿ́�P)۶n�����:�e�Դ���"��lQ&�=���^b]��.��>�|྄�ܤ�ǹ�� ?�49YwA&QSH�)�2\#�<�퉳���O��kk�g�'UW���`���"�&�S�Hs&Rc�n�	`	�c�j��{\��zyU|�]7��oOXs��v��ג��\/eU&j����%!��s�D��D�%gE^bBb�L^HX�2�֦�-c���Aa��ӎE�FT���`��|j���Q�t�rQ�NjvN���5���U�=J��HE0J߱�����T@;C��X���L�#!{6�5`:����ZD��U&`�P-��Ź�dH®u5��Ce����i�� �j�Ua4>+��X��uyd�R���ؖ�
IL/���\�PE�~I�qA7W�=K�x�?�k0��̤�ȏ�-��n���j��'����s'g2�,���^��_�P��F�o�;������-[�`�߉����wQ!�����sJSRj��xI�w�&j�)��Z�������j�߶e��M��R8�x��.N��DC���Jd!�{��(��#��I���/	LȩRRhH�߸��,��t�� �6�}�F;��,6�qb��������(�X���s�o� '�*���Dj�,��8�N�&�MA��W0��������&;�ň���R���H�R�����X��J���
���!ʢ$�#>��Tm�%�5/��q�����O� ������T�%Y�ʉRr�����*�=�[����#)J�����˩&�����a�>���Ϭ�5�xv�ݴ��lieIO��!��<��[��N90λ�4�H_96�! ���^��d���c�/._�z�1�R�E�획�����e2��^J��ʹA+V��&OR�wlh�ȅ*`j5s�Ez��`$��j�d$Su׈��\-)Y�b-v&���'MP�I[��]��t`���|���2�6o��1"�M�F����=-?J\���rL9�܅�*q�S�s!$Fj!�0�-��0S�j�3sP� �?�k��I��q��@ �?o�%��z����A�D#��[D��ȝ�Bae͆�Z�6P<�����,"λ��C8�g����oo.�;���}�B`�P�'+����,��l(<�Rd1@�9J]�f�I�ԥ�
�E��J<�@�R��*-�<ec���lS|T���V�T$�|�ku�i�杌\���ZC4󸵹�^���w��-p����~��H��z��q>
�<;�XS"Ho@�*@=����Ҩ�l\����Y)�.K��S�bm��p<a��'"_��Қ0��R�A(�����6�d���)O"�5�����g���۪����Jc����	c&#i$B���l��ű��2�!���D�"�sRmS'�%�g#س�7@1�-�yq�B���o_�!
S�,`����|��vY�e�^$ˊ���!���t�K���ˊ~~aٳ
R�8���1�
B�b���a!K�,��k�ќ7 �  θ����#�8�%q&���Q9_��u9�H���	T���yLJK�<�9մŧ	q���೮�P9��D8R����V��M�)��:\��-�dC������?-�?l}q��o)v���X�����n<q��I�䙼De��-QFo�e�b&�V�N��4[5D���j)�K���p;/����8d�h����r�6R�"�.8��\i�5%����Ȭ�(�HӐu��)`�,,��V��+!�V2����MĔ��A��Y�^�����d0t�"ܵ�۫���3ء�.Wb�z��]h�؃�-9��}Uz��n����5����E�a��H�F&#>��3LC�4�]D�'�a�
���筅t9V��s#�S^:�k-�zDH�RLL����@֑T*L`6T�N�!��2eY�����D�Z�~뼫�/f�Q�/���{��D��]逦Қ���}�\�{C�'��ꦧJ15�O-1č�+��?���b{JU+\E�9���<���Bt���U��|5K�'\O�瀔��2%;n!��Ι�T�^[��y̕����},m�� p%�u��]��X�e����:�ɴ2�A�rO���"�:fպi�*����!X�+�����J�+Bds����,����������N��sVjR��4�� � ��5�$��2�8��`�j���Z0I�g�w@�|i�,&M ��왊��Q�,�[�f�|�2b�k��H`jH�\e'��/^};î"�Yq�bK�O"��|kf-�KH�u�	��Kj�����,�}�n����9)a\��|uy��H����$:�2�TY�����;JD�/niգ��4s�/wt�E�����Ȭ0��i����J�B�Ǐk���.ԭ��!A\��3KJ�}�ŭ�&����HD'��Ò�-n]�8J�?ˌ<5Yb���l���aq���:W�i�[���]�.���}����' %l��N������������_��      q   ^  x�eSI�A<�_�b_�����TO+��/)$ � H.�!�������C[uBd�!7�7'������4n���{��$�N,k�;��XiUwG�N�xzZ� �l&�������X��J�%����4�1ga���V���HBv��v3Z�����,����R,������oG�:�*�ˮ��CB�N����-z'�f"�C*f_�����D���d�衡���S��U>:ړ���φ��s7r%�\_8��� �1��E�����P36@�\��8nR7�f{bT'�p�[g[Q(M5{��MY*���L��1��~�c��aίx�d<p��W���A�Ԩq¿��{�`      h   x  x�UW�r�8|��_��(R��$�Z{6o��V�"!p ���$�ٗ�,^pN��>��C^���E��j�R�{i��l�D-���)������/JB�0���cԷш�,��ڍA�~��U��W/����9/�B�Q�^�d����w��̪�!?f/�W��d�#n�vs>����^����F�NF���Pu�ѭ������M��(|f�2����|j+ʫQ����NYᆈ����f�{ox
�I#��a�]��`$��_%=*繃��M�B�F�Ft:D�g�s>��,?��k7<m���g�@H��Joh}F�!zU;�"�o���ݺi/�I�>g%;��#�蕊����0Ƅɠ|D���¸0$`���?�,Z�qm���*���CUs܊c�zU~ƝF��UGѻW��� �^|�)���<K�F�V�:�7 +&" ���A�ʿۯ&d�@~�?�ګ3�8šZN=�;�'J!���?�U�ލ6��ñ:dE^Ue��Bp�@r`v�@�C=��	I6�,��=����2�Z��1]k��&��(�ɹ;�j�M+ӈ։�S�Cc�lB� N\��(�x(��r�ʇ4aF�$���I���SmF?����+�T���?i&9��,����W<$G�q�X��E���-�~^�,~G]����Uj��4C��6�� $��r���	�Ͼ趃"e�^�qxдX#Ƕc��U��#��o��w6v���^���D`g	 :��C�-����Sq�.Uu.��#���%$ki���Wh@ƈ�'q�� �䃚�~�H�� \�����%��K%dP5ފ'AH���~��Fr��e�ӣ��m���RT�m����b�oE�j��	�jd}GQ�3]a(xp�:���sP�F�ZS���-dܚt�ȹ~��J�D���~I��<D�+
w<�.��E��S�If^��p�JXHC� _�^�f���;��Rt�pu=�E������@?��z֨O�^-I=�p�p���'_��i)�
j�����|���H�;����!v�~WVPMv*.�*�',g�����p�b��n*�G����W�4/�A/fސ��0$q`�Jܔ2Tԇ��Y�Lq�lPh��ؕ�Sy�N�sQd8��u6�El�����/�~R����8��>�0\�:�������d"�f��F�����E��5f(�'Ďb�i���8�.?��O�,�g>�>ȕ��6��%����[�,Nn/�M��`�����,�VY�MH���.y�HPTEu�>�~���t~�D[�j�%aA cx4߳!���`'��A04e�!C�c]�!
�EcW�A��z�R�hZ��Q(�F�iG�x��R��s~~(��ά�Q�d��	��}մ�����we6�MĠ!m�{SG��םY�J0ܴ^s9v4�4�N���1�䁻�ڌ����6x���9 Ǉ��!�pq���b��L ׿�`���k���^<o��@c�j���lN,��Ѻew�B&� "�!$�$�J�W��Xdǲx(��n:��3[��ų��UfӥUӾBAu�H�z(�,�m�lf2A��Y�9R��@�$c���k���=�哰�{��Z�$P�C�s�}���������dEO�	
�a#��?2���P�|��j5�o��o?�9�����R� | r���T���Ã��^�6�OH	:\�C|��$�!�gr�R��W0��M�_i��m�A��+�$�%|�	0��Iib4)�s(�t7����_8�	Y%����Ek$��jo��CpL���u�!e���c�|˹��~0N�1���<{\�8��R���m�r��F�c�s������Z���l&������l�`hbSKK�k��7�lzmu�_����v�+�|4�Xi7������8�~"�k�ߝ.yy���� ������ma�4�4�v�꧔�����fl�ޢ���M���G�6Y?(nn�.�X��"H+��#�t��C���m���ԶK����3�Q��\=���|D0{���O�r>��L�/��bKآt��m�/�p�ϫ������h�oH,���4F��v����V�`UyYe��/֯�c��e��"�7�]�ፄ�[~Y>i�1tah�Ҿ����߂(�I�~��v��Y]�      r   �  x�m�;�AD��S�+���Y�$_�����j��1ژו/�M*���C�C��ȏ�O����?��T")���<�5v�W��P֬)�����h��d3	?D�C�bj�L�>��6��=�B"�V���ğ�}�R�9+8eR��:ث�qJ_� )�t
�
�z�5�`��,� _<{���B�hF��d��T.$C����˱s����lS�j��epZ���oį�S�.9h��8���&-шkc��&N\z��My�괅p���V?⊶, ���BN�z�W��#M��]���z�/ARYh1���!���v%�{���g4��Q��ZL�+�Z�E�_���q?0ƴi�>�(c�=��wɨ�^�."ޖ��v�_ a�̤,��>���<�_�F+�D������2��     