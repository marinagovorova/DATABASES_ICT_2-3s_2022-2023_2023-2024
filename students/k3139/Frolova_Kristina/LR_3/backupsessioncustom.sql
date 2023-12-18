PGDMP      9            	    {            Session    16.0    16.0 c    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    Session    DATABASE     k   CREATE DATABASE "Session" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "Session";
                postgres    false                        2615    16399    Session    SCHEMA        CREATE SCHEMA "Session";
    DROP SCHEMA "Session";
                postgres    false            �            1255    16566    hours_trigger()    FUNCTION     �   CREATE FUNCTION "Session".hours_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
  NEW.total_hours := NEW.lecture_hours + NEW.practice_hours + NEW.lab_hours;
  RETURN NEW;
END;
$$;
 )   DROP FUNCTION "Session".hours_trigger();
       Session          postgres    false    6            �            1259    16409    active student    TABLE     �   CREATE TABLE "Session"."active student" (
    student_id integer NOT NULL,
    date1 date NOT NULL,
    date2 date NOT NULL,
    group_id integer NOT NULL,
    record_book_id integer NOT NULL
);
 '   DROP TABLE "Session"."active student";
       Session         heap    postgres    false    6            �            1259    16620    attestation pass    TABLE       CREATE TABLE "Session"."attestation pass" (
    personal_id integer NOT NULL,
    student_id integer NOT NULL,
    discipline_id integer NOT NULL,
    date date NOT NULL,
    mark integer NOT NULL,
    attempt integer,
    attestation_id integer NOT NULL
);
 )   DROP TABLE "Session"."attestation pass";
       Session         heap    postgres    false    6            �            1259    16712 	   classroom    TABLE     E  CREATE TABLE "Session".classroom (
    classroom_id integer NOT NULL,
    department_id integer NOT NULL,
    classroom_type integer NOT NULL,
    capacity integer NOT NULL,
    number character varying(5),
    CONSTRAINT capacity_chk CHECK ((capacity > 0)),
    CONSTRAINT classroom_type_chk CHECK ((classroom_type > 0))
);
     DROP TABLE "Session".classroom;
       Session         heap    postgres    false    6            �            1259    16650 
   department    TABLE     �   CREATE TABLE "Session".department (
    department_id integer NOT NULL,
    department_name character varying(20) NOT NULL,
    platform_id integer NOT NULL
);
 !   DROP TABLE "Session".department;
       Session         heap    postgres    false    6            �            1259    16487 	   direction    TABLE     �   CREATE TABLE "Session".direction (
    direction_id integer NOT NULL,
    direction_name character varying(20) NOT NULL,
    study_level integer NOT NULL,
    CONSTRAINT study_level_chk CHECK ((study_level > 0))
);
     DROP TABLE "Session".direction;
       Session         heap    postgres    false    6            �            1259    16558 
   discipline    TABLE     	  CREATE TABLE "Session".discipline (
    discipline_id integer NOT NULL,
    discipline_name character varying(20) NOT NULL,
    total_hours integer NOT NULL,
    lecture_hours integer NOT NULL,
    practice_hours integer NOT NULL,
    lab_hours integer NOT NULL
);
 !   DROP TABLE "Session".discipline;
       Session         heap    postgres    false    6            �            1259    16493    educational program    TABLE       CREATE TABLE "Session"."educational program" (
    educational_program_id integer NOT NULL,
    educational_program_name character varying(20) NOT NULL,
    education_form integer NOT NULL,
    department_id integer NOT NULL,
    direction_id integer NOT NULL
);
 ,   DROP TABLE "Session"."educational program";
       Session         heap    postgres    false    6            �            1259    16568    educational program discipline    TABLE     �   CREATE TABLE "Session"."educational program discipline" (
    discipline_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    ed_discipline_id integer NOT NULL,
    semesters character varying
);
 7   DROP TABLE "Session"."educational program discipline";
       Session         heap    postgres    false    6            �            1259    16535    group    TABLE     �   CREATE TABLE "Session"."group" (
    group_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    start date DEFAULT '2022-09-01'::date NOT NULL,
    finish date DEFAULT '2026-06-30'::date NOT NULL,
    group_number character varying(10)
);
    DROP TABLE "Session"."group";
       Session         heap    postgres    false    6            �            1259    16655    platform    TABLE     r   CREATE TABLE "Session".platform (
    platform_id integer NOT NULL,
    address character varying(70) NOT NULL
);
    DROP TABLE "Session".platform;
       Session         heap    postgres    false    6            �            1259    16668    schedule    TABLE       CREATE TABLE "Session".schedule (
    platform_id integer NOT NULL,
    personal_id integer NOT NULL,
    group_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    classroom_id integer NOT NULL,
    schedule_id integer NOT NULL,
    ed_prog_disc_id integer
);
    DROP TABLE "Session".schedule;
       Session         heap    postgres    false    6            �            1259    16429    scholarship    TABLE     �   CREATE TABLE "Session".scholarship (
    scholarship_id integer NOT NULL,
    scholarship_size integer NOT NULL,
    scholarship_type character varying(20) NOT NULL
);
 "   DROP TABLE "Session".scholarship;
       Session         heap    postgres    false    6            �            1259    16802    scholarship appointment    TABLE     �   CREATE TABLE "Session"."scholarship appointment" (
    appointment_id integer NOT NULL,
    student_id integer NOT NULL,
    scholarship_id integer NOT NULL,
    date date NOT NULL
);
 0   DROP TABLE "Session"."scholarship appointment";
       Session         heap    postgres    false    6            �            1259    16400    student    TABLE       CREATE TABLE "Session".student (
    record_book_id integer NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    education_form integer DEFAULT 1 NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20)
);
    DROP TABLE "Session".student;
       Session         heap    postgres    false    6            �            1259    16512    syllabus    TABLE     �  CREATE TABLE "Session".syllabus (
    syllabus_id integer NOT NULL,
    edu_program_id integer NOT NULL,
    status integer NOT NULL,
    kcp integer NOT NULL,
    admission_year integer NOT NULL,
    CONSTRAINT admission_year_chk1 CHECK ((admission_year >= 1980)),
    CONSTRAINT admission_year_chk2 CHECK ((admission_year <= 2100)),
    CONSTRAINT kcp_check CHECK ((kcp > 0)),
    CONSTRAINT status_chk CHECK ((status > 0))
);
    DROP TABLE "Session".syllabus;
       Session         heap    postgres    false    6            �            1259    16588    teacher    TABLE     �   CREATE TABLE "Session".teacher (
    personal_id integer NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL
);
    DROP TABLE "Session".teacher;
       Session         heap    postgres    false    6            �          0    16409    active student 
   TABLE DATA                 Session          postgres    false    217   H�       �          0    16620    attestation pass 
   TABLE DATA                 Session          postgres    false    226   ��       �          0    16712 	   classroom 
   TABLE DATA                 Session          postgres    false    230   T�       �          0    16650 
   department 
   TABLE DATA                 Session          postgres    false    227   ��       �          0    16487 	   direction 
   TABLE DATA                 Session          postgres    false    219   ��       �          0    16558 
   discipline 
   TABLE DATA                 Session          postgres    false    223   ��       �          0    16493    educational program 
   TABLE DATA                 Session          postgres    false    220   v�       �          0    16568    educational program discipline 
   TABLE DATA                 Session          postgres    false    224   ݌       �          0    16535    group 
   TABLE DATA                 Session          postgres    false    222   ��       �          0    16655    platform 
   TABLE DATA                 Session          postgres    false    228   Ҏ       �          0    16668    schedule 
   TABLE DATA                 Session          postgres    false    229   ��       �          0    16429    scholarship 
   TABLE DATA                 Session          postgres    false    218   ϓ       �          0    16802    scholarship appointment 
   TABLE DATA                 Session          postgres    false    232   M�       �          0    16400    student 
   TABLE DATA                 Session          postgres    false    216   g�       �          0    16512    syllabus 
   TABLE DATA                 Session          postgres    false    221   ��       �          0    16588    teacher 
   TABLE DATA                 Session          postgres    false    225   H�       �           2606    16413 "   active student active student_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT "active student_pkey" PRIMARY KEY (student_id);
 S   ALTER TABLE ONLY "Session"."active student" DROP CONSTRAINT "active student_pkey";
       Session            postgres    false    217                       2606    16806 '   scholarship appointment appointment_uid 
   CONSTRAINT     v   ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT appointment_uid PRIMARY KEY (appointment_id);
 V   ALTER TABLE ONLY "Session"."scholarship appointment" DROP CONSTRAINT appointment_uid;
       Session            postgres    false    232            �           2606    16748    attestation pass attempt_chk    CHECK CONSTRAINT     j   ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT attempt_chk CHECK ((attempt >= 0)) NOT VALID;
 F   ALTER TABLE "Session"."attestation pass" DROP CONSTRAINT attempt_chk;
       Session          postgres    false    226    226            �           2606    16749    attestation pass attempt_chk1    CHECK CONSTRAINT     k   ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT attempt_chk1 CHECK ((attempt <= 3)) NOT VALID;
 G   ALTER TABLE "Session"."attestation pass" DROP CONSTRAINT attempt_chk1;
       Session          postgres    false    226    226            �           2606    16778 &   attestation pass attestation pass_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT "attestation pass_pkey" PRIMARY KEY (attestation_id);
 W   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT "attestation pass_pkey";
       Session            postgres    false    226            �           2606    16780     attestation pass attestation_uid 
   CONSTRAINT     j   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT attestation_uid UNIQUE (attestation_id);
 O   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT attestation_uid;
       Session            postgres    false    226            �           2606    16818    classroom classroom_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (classroom_id);
 E   ALTER TABLE ONLY "Session".classroom DROP CONSTRAINT classroom_pkey;
       Session            postgres    false    230            �           2606    16720    classroom classroom_uid 
   CONSTRAINT     ]   ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT classroom_uid UNIQUE (classroom_id);
 D   ALTER TABLE ONLY "Session".classroom DROP CONSTRAINT classroom_uid;
       Session            postgres    false    230            �           2606    16752    active student date_chk    CHECK CONSTRAINT     t   ALTER TABLE "Session"."active student"
    ADD CONSTRAINT date_chk CHECK ((date1 >= '1982-01-01'::date)) NOT VALID;
 A   ALTER TABLE "Session"."active student" DROP CONSTRAINT date_chk;
       Session          postgres    false    217    217            �           2606    16751    active student dates_chk    CHECK CONSTRAINT     h   ALTER TABLE "Session"."active student"
    ADD CONSTRAINT dates_chk CHECK ((date1 <= date2)) NOT VALID;
 B   ALTER TABLE "Session"."active student" DROP CONSTRAINT dates_chk;
       Session          postgres    false    217    217    217    217            �           2606    16654    department department_uid 
   CONSTRAINT     e   ALTER TABLE ONLY "Session".department
    ADD CONSTRAINT department_uid PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY "Session".department DROP CONSTRAINT department_uid;
       Session            postgres    false    227            �           2606    16492    direction direction_uid 
   CONSTRAINT     b   ALTER TABLE ONLY "Session".direction
    ADD CONSTRAINT direction_uid PRIMARY KEY (direction_id);
 D   ALTER TABLE ONLY "Session".direction DROP CONSTRAINT direction_uid;
       Session            postgres    false    219            �           2606    16562    discipline discipline_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "Session".discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (discipline_id);
 G   ALTER TABLE ONLY "Session".discipline DROP CONSTRAINT discipline_pkey;
       Session            postgres    false    223            �           2606    16619 -   educational program discipline discipline_uid 
   CONSTRAINT     v   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT discipline_uid UNIQUE (discipline_id);
 \   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT discipline_uid;
       Session            postgres    false    224            �           2606    16769 3   educational program discipline ed_discipline_id_chk    CHECK CONSTRAINT     �   ALTER TABLE "Session"."educational program discipline"
    ADD CONSTRAINT ed_discipline_id_chk CHECK ((ed_discipline_id >= 1)) NOT VALID;
 ]   ALTER TABLE "Session"."educational program discipline" DROP CONSTRAINT ed_discipline_id_chk;
       Session          postgres    false    224    224            �           2606    16767 0   educational program discipline ed_discipline_uid 
   CONSTRAINT     |   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT ed_discipline_uid UNIQUE (ed_discipline_id);
 _   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT ed_discipline_uid;
       Session            postgres    false    224            �           2606    16505 &   educational program education_form.chk    CHECK CONSTRAINT     |   ALTER TABLE "Session"."educational program"
    ADD CONSTRAINT "education_form.chk" CHECK ((education_form > 0)) NOT VALID;
 R   ALTER TABLE "Session"."educational program" DROP CONSTRAINT "education_form.chk";
       Session          postgres    false    220    220            �           2606    16473    student education_form_chk    CHECK CONSTRAINT     l   ALTER TABLE "Session".student
    ADD CONSTRAINT education_form_chk CHECK ((education_form > 0)) NOT VALID;
 B   ALTER TABLE "Session".student DROP CONSTRAINT education_form_chk;
       Session          postgres    false    216    216            �           2606    16782 B   educational program discipline educational_program_discipline_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT educational_program_discipline_pkey PRIMARY KEY (ed_discipline_id);
 q   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT educational_program_discipline_pkey;
       Session            postgres    false    224            �           2606    16497 ,   educational program educational_program_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT educational_program_pkey PRIMARY KEY (educational_program_id);
 [   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT educational_program_pkey;
       Session            postgres    false    220            �           2606    16499 +   educational program educational_program_uid 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT educational_program_uid UNIQUE (educational_program_id) INCLUDE (educational_program_id);
 Z   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT educational_program_uid;
       Session            postgres    false    220            �           2606    16784    group group_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (group_id);
 ?   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT group_pkey;
       Session            postgres    false    222            �           2606    16541    group group_uid 
   CONSTRAINT     S   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT group_uid UNIQUE (group_id);
 >   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT group_uid;
       Session            postgres    false    222            �           2606    16750    attestation pass mark_chk    CHECK CONSTRAINT     d   ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT mark_chk CHECK ((mark >= 0)) NOT VALID;
 C   ALTER TABLE "Session"."attestation pass" DROP CONSTRAINT mark_chk;
       Session          postgres    false    226    226            �           2606    16592    teacher personal_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "Session".teacher
    ADD CONSTRAINT personal_pkey PRIMARY KEY (personal_id);
 B   ALTER TABLE ONLY "Session".teacher DROP CONSTRAINT personal_pkey;
       Session            postgres    false    225            �           2606    16820    teacher personal_uid 
   CONSTRAINT     Y   ALTER TABLE ONLY "Session".teacher
    ADD CONSTRAINT personal_uid UNIQUE (personal_id);
 A   ALTER TABLE ONLY "Session".teacher DROP CONSTRAINT personal_uid;
       Session            postgres    false    225            �           2606    16659    platform platform_uid 
   CONSTRAINT     _   ALTER TABLE ONLY "Session".platform
    ADD CONSTRAINT platform_uid PRIMARY KEY (platform_id);
 B   ALTER TABLE ONLY "Session".platform DROP CONSTRAINT platform_uid;
       Session            postgres    false    228            �           2606    16426    student record_book_uid 
   CONSTRAINT     _   ALTER TABLE ONLY "Session".student
    ADD CONSTRAINT record_book_uid UNIQUE (record_book_id);
 D   ALTER TABLE ONLY "Session".student DROP CONSTRAINT record_book_uid;
       Session            postgres    false    216            �           2606    16791    schedule schedule_id_chk    CHECK CONSTRAINT     g   ALTER TABLE "Session".schedule
    ADD CONSTRAINT schedule_id_chk CHECK ((schedule_id > 0)) NOT VALID;
 @   ALTER TABLE "Session".schedule DROP CONSTRAINT schedule_id_chk;
       Session          postgres    false    229    229            �           2606    16788    schedule schedule_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);
 C   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT schedule_pkey;
       Session            postgres    false    229            �           2606    16790    schedule schedule_uid 
   CONSTRAINT     Z   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT schedule_uid UNIQUE (schedule_id);
 B   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT schedule_uid;
       Session            postgres    false    229            �           2606    16435    scholarship scholarship_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT scholarship_pkey PRIMARY KEY (scholarship_id);
 I   ALTER TABLE ONLY "Session".scholarship DROP CONSTRAINT scholarship_pkey;
       Session            postgres    false    218            �           2606    16452     scholarship scholarship_size_chk    CHECK CONSTRAINT     t   ALTER TABLE "Session".scholarship
    ADD CONSTRAINT scholarship_size_chk CHECK ((scholarship_size > 0)) NOT VALID;
 H   ALTER TABLE "Session".scholarship DROP CONSTRAINT scholarship_size_chk;
       Session          postgres    false    218    218            �           2606    16451    scholarship scholarship_uid 
   CONSTRAINT     c   ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT scholarship_uid UNIQUE (scholarship_id);
 H   ALTER TABLE ONLY "Session".scholarship DROP CONSTRAINT scholarship_uid;
       Session            postgres    false    218            �           2606    16472    student status_chk    CHECK CONSTRAINT     \   ALTER TABLE "Session".student
    ADD CONSTRAINT status_chk CHECK ((status > 0)) NOT VALID;
 :   ALTER TABLE "Session".student DROP CONSTRAINT status_chk;
       Session          postgres    false    216    216            �           2606    16408    student student_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "Session".student
    ADD CONSTRAINT student_pkey PRIMARY KEY (record_book_id);
 A   ALTER TABLE ONLY "Session".student DROP CONSTRAINT student_pkey;
       Session            postgres    false    216            �           2606    16424    active student student_uid 
   CONSTRAINT     s   ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT student_uid UNIQUE NULLS NOT DISTINCT (student_id);
 I   ALTER TABLE ONLY "Session"."active student" DROP CONSTRAINT student_uid;
       Session            postgres    false    217            �           2606    16736    direction study_level_chk1    CHECK CONSTRAINT     i   ALTER TABLE "Session".direction
    ADD CONSTRAINT study_level_chk1 CHECK ((study_level < 5)) NOT VALID;
 B   ALTER TABLE "Session".direction DROP CONSTRAINT study_level_chk1;
       Session          postgres    false    219    219            �           2606    16799    syllabus syllabus_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT syllabus_pkey PRIMARY KEY (syllabus_id);
 C   ALTER TABLE ONLY "Session".syllabus DROP CONSTRAINT syllabus_pkey;
       Session            postgres    false    221            �           2606    16534    syllabus syllabus_uid 
   CONSTRAINT     Z   ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT syllabus_uid UNIQUE (syllabus_id);
 B   ALTER TABLE ONLY "Session".syllabus DROP CONSTRAINT syllabus_uid;
       Session            postgres    false    221                       2620    16567    discipline discipline_trigger    TRIGGER     �   CREATE TRIGGER discipline_trigger BEFORE INSERT OR UPDATE OF total_hours, lecture_hours, practice_hours, lab_hours ON "Session".discipline FOR EACH ROW EXECUTE FUNCTION "Session".hours_trigger();
 9   DROP TRIGGER discipline_trigger ON "Session".discipline;
       Session          postgres    false    223    233    223    223    223    223                       2606    16726    schedule classroom_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT classroom_id FOREIGN KEY (classroom_id) REFERENCES "Session".classroom(classroom_id) NOT VALID;
 B   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT classroom_id;
       Session          postgres    false    230    229    3583                       2606    16721    classroom department_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES "Session".department(department_id);
 D   ALTER TABLE ONLY "Session".classroom DROP CONSTRAINT department_id;
       Session          postgres    false    3573    227    230                       2606    16821 !   educational program department_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES "Session".department(department_id) NOT VALID;
 P   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT department_id;
       Session          postgres    false    227    220    3573                       2606    16500     educational program direction_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT direction_id FOREIGN KEY (direction_id) REFERENCES "Session".direction(direction_id) NOT VALID;
 O   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT direction_id;
       Session          postgres    false    219    3543    220                       2606    16573 ,   educational program discipline discipline_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id) REFERENCES "Session".discipline(discipline_id);
 [   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT discipline_id;
       Session          postgres    false    224    223    3557            
           2606    16645    attestation pass discipline_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id) REFERENCES "Session"."educational program discipline"(discipline_id);
 M   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT discipline_id;
       Session          postgres    false    3559    226    224                       2606    16841    schedule ed_prog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT ed_prog_fkey FOREIGN KEY (ed_prog_disc_id) REFERENCES "Session"."educational program discipline"(ed_discipline_id) NOT VALID;
 B   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT ed_prog_fkey;
       Session          postgres    false    229    224    3561                       2606    16826    syllabus edu_program_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT edu_program_fkey FOREIGN KEY (edu_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 F   ALTER TABLE ONLY "Session".syllabus DROP CONSTRAINT edu_program_fkey;
       Session          postgres    false    221    220    3545                       2606    16692    schedule group_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT group_id FOREIGN KEY (group_id) REFERENCES "Session"."group"(group_id) NOT VALID;
 >   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT group_id;
       Session          postgres    false    229    222    3555                       2606    16831    active student group_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT group_pkey FOREIGN KEY (group_id) REFERENCES "Session"."group"(group_id) NOT VALID;
 H   ALTER TABLE ONLY "Session"."active student" DROP CONSTRAINT group_pkey;
       Session          postgres    false    3555    217    222                       2606    16625    attestation pass personal_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT personal_id FOREIGN KEY (personal_id) REFERENCES "Session".teacher(personal_id);
 K   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT personal_id;
       Session          postgres    false    3565    226    225                       2606    16683    schedule personal_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT personal_id FOREIGN KEY (personal_id) REFERENCES "Session".teacher(personal_id);
 A   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT personal_id;
       Session          postgres    false    3565    225    229                       2606    16663    department platform_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".department
    ADD CONSTRAINT platform_id FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id) NOT VALID;
 C   ALTER TABLE ONLY "Session".department DROP CONSTRAINT platform_id;
       Session          postgres    false    227    228    3575                       2606    16673    schedule platform_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT platform_id FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id);
 A   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT platform_id;
       Session          postgres    false    228    3575    229                       2606    16418    active student record_book_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT record_book_pkey FOREIGN KEY (record_book_id) REFERENCES "Session".student(record_book_id) NOT VALID;
 N   ALTER TABLE ONLY "Session"."active student" DROP CONSTRAINT record_book_pkey;
       Session          postgres    false    217    3533    216                       2606    16812 (   scholarship appointment scholarship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT scholarship_fkey FOREIGN KEY (scholarship_id) REFERENCES "Session".scholarship(scholarship_id);
 W   ALTER TABLE ONLY "Session"."scholarship appointment" DROP CONSTRAINT scholarship_fkey;
       Session          postgres    false    218    232    3539                       2606    16807 $   scholarship appointment student_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT student_fkey FOREIGN KEY (student_id) REFERENCES "Session".student(record_book_id);
 S   ALTER TABLE ONLY "Session"."scholarship appointment" DROP CONSTRAINT student_fkey;
       Session          postgres    false    216    3533    232                       2606    16630    attestation pass student_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES "Session"."active student"(student_id);
 J   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT student_id;
       Session          postgres    false    3535    217    226                       2606    16542    group syllabus_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id);
 @   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT syllabus_id;
       Session          postgres    false    221    222    3551            	           2606    16578 *   educational program discipline syllabus_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id);
 Y   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT syllabus_id;
       Session          postgres    false    224    3551    221            �   Z  x�͖1k�0���
�%	(Ew'�Nt�!PRhҮ!�M1��$N�]:X��N���?޽{��z�|ܚ�z�`�Ms>�ݱ������h̹��ͱ����m��������Z�z�.����9t�z��uoy=7�w�Oˍ�'��):�����J������NV
H 
H��AFT"��8�5!D%$LL�Hx-,pdPB
\�S>C�ZH��+)"q�8�}���Ȣ���8R��n�i)���������T�%�\Y��D(�T���=�Z*qt�~4�	���J�8���<�IK%�s���R�T@
)�JH�!n8Ϻ�R� �����$�+ yO��@�6	���i���%1B�      �   �  x�͗1k�0�����KP�N�,�N2J
M۵�ƃi�H���un)�;[�AF|~�NO������_��84ε���+j��kf����ꛫ�t��=2p���t>����h�S�54�}��\_?ۜ{O�q����_�X��"GB0X
.��F�eX+����b��E���2r��9E��E*,}�)U䔹p�@Ǡ2��U`dPf�i�N��T�cJ��/f�f�B�j~��PY�6�P&Md��:/�TM���&N�uTS���6N����������ic���$�qfFĩ����0|FiD���i��4�8
�ğkH�8������o�c�D�t6��6���A&��fRQ9*�A*��:Z4U�$�b�@ǫr����g�KA����bȥ��O�      �   W  x��V�j�0��)LO-�˒m��=Jk����
�Iv��ON�vO�@69���#�\o�[S���f����x9�^�?U�6����ǯ�!7��Z5ݩ>w�����]k�W�j�n�9����fa>�V����#�"7�Cnln��ܬw���5+�Xg�2{���@�G`9Jq���!8��fb�upAt�?Ļ����4�1� �OB,�Lw�D��8���>� N:�@����E
�]I��Q��l?"Q0a��c09d};�!��y��7�'�?���C�R���� Ҏ�E͐"0��'���g��ю=�	�F%Ҷ�PZO~TB��d��+}CW      �   �  x���Qo�0���+�����l֞��J2�t
��Xy宱vt1�ȯ��tj���@X�t��Ͷ}���f�&W-��2�ꮃ�D;������Eu	��� 	9���18�����}��%7E�EB���4��NH%2v�m����4�����pTV��eF�qˢ��w�1'8�;��P�c׼(�+�_4��sT�Tx�k@�t�9�O��c�3�}�圮�>�F��u��g�Qw淃�c��WԌ9�ޭ�a�Z���Z�,b|����� �1!��=��*���R}/�K�A٣�2�"Z����By�i���ie�w6T&d=iF��켊8��A�r�&d%�Uɀ>����#6$/|t���	Y�ɪ��cS��sZ���=`��s���.�2��B3��fUw�楿�����.���nHV���N�x�$W&ME�CWi�f����ėf"��G��o���+ҝ���f��^mx      �   ?  x���Ok� ����K[c��1�naK�ZX�^�K��M��S�a��� �x��y�ٵ�G��]�G�Vyo&���S��h��<�!G;+O*G~��㨮j\����gݢ��h�I��2Gl��5 ��r0O�?Og� �3B�&s�f} 
�U)�v��4�'�^�3jU  4�����z.c����?ӱ����e?'T֘ 8p������BE��L5���q���� 3Mp|҆� ��	m�����D!xz���B�8�vVgS����qFBv�)r���be���wP���'���6&P�}!K�
      �   q  x���Kn�0�=��	HNE8��*Ѩ-H��%���X8v������q�z�I�f�q�*�-���EնB���A��h�P�~�{q`�稰�t�C�?�iȪ�Φ�>6�N�?g�o��^�^��)�^`K�ύ� S!n��`|;����-ț���gF(bNi�`���3�X���kl��V=ʪ'ij�!UӮ��	��>�����}�	�W`D��. CBo��������ܾK�k�#'����Q�O�UIČx6�Y� �] F�˹Dsb�Au@)�.0'n�i�-5�޻�����;!���%0q'4K4G6N\N)]N+-Q]jZhEA�j�u@1uB�\f�D%}.�v�wG5����p�S�X�`�ޛ-6      �   W  x�͗�n�0D��
�%�T�/�BWq��n�,7EW-�6a�(9������ �~ 7�@A���������[���q����j[m���T��Jv�,��٭��]}8]��k]���F6�Û����U��Q��?��SU�Z����f��DW��4F�W��֚�:�nNH�:��'���1��<�8A�2��>�lڤ�ʵ ^�3��(c�*^G?ڨd��{�lg4l�8����h�$߭Q��g$h��l4����~��b�H<~�&����r�W�Y9u��C��ƨ~c��?�9�,���l�g��5[�X܂j@�R�b������Q��n�\����~��2C1����No��,��rr >g��O�'��ځ�'gϕ��iJz�E��3�Y�9y4�8H�-8NÖΩ��<���A��!'��pI$�>�E�E_��<h�G�a�"h���g�o{4��v��mo�j7փ��1ABˬH�����m��03E&p�v��I��>�ť�LN�2��֝�Tr/]��7C+��x_�g������֌ux�d��Py��yj��f����`�P��X���r4f�c�f�x�f2�����      �   �   x��ҽ
�0�ݧ82)�ⷑN�P�k�J ~`t����B_ ]�;n�q�K�"�����H��CO��KS����ixLu�P���9�;�DKA=������~׼�j擲�zʪ� �1
q�ť�WYf�T�ŧ�bt8�~�j�����%���x���"#v�x�Q��B�-�Ǡ������-,�3��[���:�a� g\��      �   	  x�͕�j�@�{=Ţ�6����?�R�";����9�"o���i�^u\�1;�[���eu�{��;��_�����w	��{������x��"n��&���)`�5L_��קf��`���\�B�X�XI�Z�����$��f�X����g�8��14aX�΁6�X������� �c�5ECͦ0sB��>c4��+n��Ѳ���#D���L�C��n�8c�d��1��#;:�EL���k����빱����E��n�      �     x��V]o;|��8�K[	U�X�>Q )I �}�Lp�V�5�.����c �}g_��Ϝ�9����|	���>-|ӄX���\�+�-|�x�6=p�M�#_a�x-�KQ������¦�5<�����h�ɳoZ���c��m�����C�W!����\p+�n_�x��6��۸o�xf����f��ix)c�X��;<u!�YdT���6��#�0m
~=�4Yd+��a������r��:��i�O���8Eq������2���V��N�>����ҧ���`>����*a�ʆi��Ԇڿ��g�e!�]l��<��B�����ƫ�����&��>�jCnf���-ex�Z� Br
߽k*�yt�����d涾r�q.��%S�z`Q(�����p�W�����	z9V�	T��P����Te�Fi�7����bZ�d�]y���
�2��@_�sL�)��dѺ6���Ќ�c��=3�L�(c:PX[��T���8�������FXz���U:�*��#���m.5�d���׭O�$z0~ �����V��d��p�3��w'q_�.�dP��߭}z��j	JR&;i��*��kKW_��C��g��F����N��O4�dЯ�Kp�a�줏�rIf1]�0Ԯ�{�F��b��![#)��K^`��?�5���m��g��8�TJ�>/s\f�p��.��!�7��#(+�r�,˕���,ݱ��V�m�1/'C��� �䙣��rxF�m��K�}X1CNaFUxwk�/0XbA���	�M��_      �   �  x�͗Ak�0�������R4#i��z�!Rش��{��l���W���i��:��%��fx�\o~=����Q]m�;4���n���ޏ�������M�w{��:�mלv�~��6����ڽ�Z폻�k�f8z�B�����m^�աۧ��r�z~ب��Q+tΒV���Ѡ]�Y *c��燱�ZY�^+�j��Z���-���e6�q��s�rȝV!�h<b�B��F��{v��b�ON�SyNyD�%�U\j���]π6")�l�S+�^&�Ӛ�� �<B���Mq>�G)��eK�T$�ބX
�G�ȼ`,`!1Q䑜墵 y�a$
}hz!@S)	}�~�I2�0�!W)%�t�& M��M���)\�-�`\:
RRt �'��d�)1�O!�D��.&G{�����QJ�r������� #��$��{W�Շ:����<�U<      �   n  x���MK�0���a�nP$�[S<M��&ع��5�@�����������^~<����5��=�w�'2ol�n��x�ބع3Y�zxumN~?G�i����]����eݐE�ͩ�9�>ܐ-og�?3YNx����A��2'�KZu3t��P)x�����Z�s.���GRW���
��68�1�"�+Jӭ�$�ќ(M)�"�.LI*���,)KTwz������%�hrՏ��1�̴���bP�
��e�L�sq�2 .c� k��`}��'T��Ӎ��ahP&�N�ݺcgl��T�*�s������­UA��V��U%S|�H��	g���I�ښݛ���� �[�=���~o�l�@�r      �   
   x���          �   J  x���Qo�0���V_�Jє��I�'�v�0�a}E^rK<�]�N+���kZ�?`	���tι�w�i��d���$W-#���d�ԃ��ZC�t����a'����dR��q뾻{V��OZ�#�$|�p��<EwC���[r=�����NI���kwx�7p��o����ϳe4�"g���LI��0z�E����C�'Q��U92՞D�a�,��g�n�V�I�%kʬah��,Y�F@�F��e�Ur�0*�<+Y���W���:t�Ϡ�y;�#7���X�̳�vI:����O� Z��Z5U]��J�YdzT����<r�ʲ�)&ʻ�r�m��}��w��������y�3L����"r��<�,9�ܷՓ�
�}D��8vʫܷ�L9����p��I�����y�P�����D;�@�!r������������`���B�b�5:�ޒ0��G�*Z�Rk/�ٽP^)�ya(�:g���C��h>�a�1���bW:eMv��gV�*B]���ڵ�1�-�,g�)��.�\]Z�,�Ko�e*Y������06��8"�ZI�YT�zn�"@�2��c���>i�?      �   w  x����jA��>�Г�P&�z���P,ԶW�V)R�����o���4�%{X~�%ߗ��|1}yu��볻[��~�����/�m�q���Z-7+�֫��p�������t���<x׭v�|yYwǉ{|z�.�x9�3{G%z�!���h��으+	���U A'�AF���%p6��Ns�k�*�1
��"4a�d#��`�vEuZ�qZ�q���s�F=����t�TM�U�}�4�`��H���;� l,&lj<�DC���n6=o��U�Q�Z4ҭ�aXk�5��XC��y�I��;��HU#��M�E�/u�ô�f��v��y`���j��p�aр��b�8�]Y2��`so�$�V��t
E��٣�/���      �     x����n�0E��
!'�Q�M]�~�	,7�b"��i��S��ˇ[$^�i6����s���]��z|HnZ�5Jq��P�U��*-�����t���	��b��K���6�%d�ϒ閞QLmq��TW}Cۑ������s�yY�#�2��zbԗ{0�1��JG])��t�@q�/�s�.���?���R��x�"@����<S��\�4A��܍=���<m��]5�c}{g�^"e�Y�r��������;P1&����8�m;i��\OZ�!N��)�vw���sQ�D�:s�0���`�GW/�}������r���9-R�b���,���N]�X�;`�����R�|�ޝM�ipY�$�gi�����.���Nr�s��gZU���#Ұ�*��"�T�W����N�x9a�k_}>:kr��G���i��WGga�E�\4u}u�ld�d;g&9�k۔YaO�^P�W���7��߁׫8����a+��b�f�舓�_5��M     