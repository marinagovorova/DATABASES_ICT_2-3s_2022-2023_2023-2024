PGDMP  +    )            	    {            Session    16.0    16.0 b    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    Session    DATABASE     k   CREATE DATABASE "Session" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "Session";
                postgres    false            �            1259    16409    active student    TABLE     ?  CREATE TABLE "Session"."active student" (
    student_id integer NOT NULL,
    education_year integer DEFAULT 1 NOT NULL,
    "from" date NOT NULL,
    "to" date NOT NULL,
    group_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    education_program_id integer NOT NULL,
    record_book_id integer NOT NULL
);
 '   DROP TABLE "Session"."active student";
       Session         heap    postgres    false            �            1259    16620    attestation pass    TABLE     ,  CREATE TABLE "Session"."attestation pass" (
    personal_id integer NOT NULL,
    student_id integer NOT NULL,
    discipline_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    date date NOT NULL,
    mark integer NOT NULL,
    attempt integer
);
 )   DROP TABLE "Session"."attestation pass";
       Session         heap    postgres    false            �            1259    16712 	   classroom    TABLE     $  CREATE TABLE "Session".classroom (
    classroom_id integer NOT NULL,
    department_id integer NOT NULL,
    classroom_type integer NOT NULL,
    capacity integer NOT NULL,
    CONSTRAINT capacity_chk CHECK ((capacity > 0)),
    CONSTRAINT classroom_type_chk CHECK ((classroom_type > 0))
);
     DROP TABLE "Session".classroom;
       Session         heap    postgres    false            �            1259    16650 
   department    TABLE     �   CREATE TABLE "Session".department (
    department_id integer NOT NULL,
    department_name character varying(20) NOT NULL,
    platform_id integer NOT NULL
);
 !   DROP TABLE "Session".department;
       Session         heap    postgres    false            �            1259    16487 	   direction    TABLE     �   CREATE TABLE "Session".direction (
    direction_id integer NOT NULL,
    direction_name character varying(20) NOT NULL,
    study_level integer NOT NULL,
    CONSTRAINT study_level_chk CHECK ((study_level > 0))
);
     DROP TABLE "Session".direction;
       Session         heap    postgres    false            �            1259    16558 
   discipline    TABLE     	  CREATE TABLE "Session".discipline (
    discipline_id integer NOT NULL,
    discipline_name character varying(20) NOT NULL,
    total_hours integer NOT NULL,
    lecture_hours integer NOT NULL,
    practice_hours integer NOT NULL,
    lab_hours integer NOT NULL
);
 !   DROP TABLE "Session".discipline;
       Session         heap    postgres    false            �            1259    16493    educational program    TABLE       CREATE TABLE "Session"."educational program" (
    educational_program_id integer NOT NULL,
    educational_program_name character varying(20) NOT NULL,
    education_form integer NOT NULL,
    department_id integer NOT NULL,
    direction_id integer NOT NULL
);
 ,   DROP TABLE "Session"."educational program";
       Session         heap    postgres    false            �            1259    16568    educational program discipline    TABLE     �   CREATE TABLE "Session"."educational program discipline" (
    discipline_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    educational_program_id integer NOT NULL
);
 7   DROP TABLE "Session"."educational program discipline";
       Session         heap    postgres    false            �            1259    16535    group    TABLE     �   CREATE TABLE "Session"."group" (
    group_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    educational_program_id integer NOT NULL
);
    DROP TABLE "Session"."group";
       Session         heap    postgres    false            �            1259    16655    platform    TABLE     r   CREATE TABLE "Session".platform (
    platform_id integer NOT NULL,
    address character varying(70) NOT NULL
);
    DROP TABLE "Session".platform;
       Session         heap    postgres    false            �            1259    16668    schedule    TABLE     m  CREATE TABLE "Session".schedule (
    platform_id integer NOT NULL,
    department_id integer NOT NULL,
    personal_id integer NOT NULL,
    group_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    date date NOT NULL,
    educational_program_discipline_id integer NOT NULL,
    classroom_id integer NOT NULL
);
    DROP TABLE "Session".schedule;
       Session         heap    postgres    false            �            1259    16429    scholarship    TABLE     �   CREATE TABLE "Session".scholarship (
    scholarship_id integer NOT NULL,
    scholarship_size integer NOT NULL,
    scholarship_type character varying(20) NOT NULL
);
 "   DROP TABLE "Session".scholarship;
       Session         heap    postgres    false            �            1259    16474    scholarship appointment    TABLE     �   CREATE TABLE "Session"."scholarship appointment" (
    student_id integer NOT NULL,
    scholarship_id integer NOT NULL,
    date date NOT NULL
);
 0   DROP TABLE "Session"."scholarship appointment";
       Session         heap    postgres    false            �            1259    16400    student    TABLE       CREATE TABLE "Session".student (
    record_book_id integer NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    education_form integer DEFAULT 1 NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20)
);
    DROP TABLE "Session".student;
       Session         heap    postgres    false            �            1259    16512    syllabus    TABLE     �  CREATE TABLE "Session".syllabus (
    syllabus_id integer NOT NULL,
    direction_id integer NOT NULL,
    status integer NOT NULL,
    kcp integer NOT NULL,
    admission_year integer NOT NULL,
    CONSTRAINT admission_year_chk1 CHECK ((admission_year >= 1980)),
    CONSTRAINT admission_year_chk2 CHECK ((admission_year <= 2100)),
    CONSTRAINT kcp_check CHECK ((kcp > 0)),
    CONSTRAINT status_chk CHECK ((status > 0))
);
    DROP TABLE "Session".syllabus;
       Session         heap    postgres    false            �            1259    16588    teacher    TABLE     �   CREATE TABLE "Session".teacher (
    personal_id integer NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL
);
    DROP TABLE "Session".teacher;
       Session         heap    postgres    false            �          0    16409    active student 
   TABLE DATA           �   COPY "Session"."active student" (student_id, education_year, "from", "to", group_id, syllabus_id, education_program_id, record_book_id) FROM stdin;
    Session          postgres    false    217   |�       �          0    16620    attestation pass 
   TABLE DATA           �   COPY "Session"."attestation pass" (personal_id, student_id, discipline_id, educational_program_id, syllabus_id, date, mark, attempt) FROM stdin;
    Session          postgres    false    227   ��       �          0    16712 	   classroom 
   TABLE DATA           ]   COPY "Session".classroom (classroom_id, department_id, classroom_type, capacity) FROM stdin;
    Session          postgres    false    231   ��       �          0    16650 
   department 
   TABLE DATA           T   COPY "Session".department (department_id, department_name, platform_id) FROM stdin;
    Session          postgres    false    228   ��       �          0    16487 	   direction 
   TABLE DATA           Q   COPY "Session".direction (direction_id, direction_name, study_level) FROM stdin;
    Session          postgres    false    220   )�       �          0    16558 
   discipline 
   TABLE DATA           ~   COPY "Session".discipline (discipline_id, discipline_name, total_hours, lecture_hours, practice_hours, lab_hours) FROM stdin;
    Session          postgres    false    224   �       �          0    16493    educational program 
   TABLE DATA           �   COPY "Session"."educational program" (educational_program_id, educational_program_name, education_form, department_id, direction_id) FROM stdin;
    Session          postgres    false    221   �       �          0    16568    educational program discipline 
   TABLE DATA           q   COPY "Session"."educational program discipline" (discipline_id, syllabus_id, educational_program_id) FROM stdin;
    Session          postgres    false    225   ƕ       �          0    16535    group 
   TABLE DATA           S   COPY "Session"."group" (group_id, syllabus_id, educational_program_id) FROM stdin;
    Session          postgres    false    223   (�       �          0    16655    platform 
   TABLE DATA           ;   COPY "Session".platform (platform_id, address) FROM stdin;
    Session          postgres    false    229   Ė       �          0    16668    schedule 
   TABLE DATA           �   COPY "Session".schedule (platform_id, department_id, personal_id, group_id, educational_program_id, syllabus_id, date, educational_program_discipline_id, classroom_id) FROM stdin;
    Session          postgres    false    230   ��       �          0    16429    scholarship 
   TABLE DATA           \   COPY "Session".scholarship (scholarship_id, scholarship_size, scholarship_type) FROM stdin;
    Session          postgres    false    218   �       �          0    16474    scholarship appointment 
   TABLE DATA           X   COPY "Session"."scholarship appointment" (student_id, scholarship_id, date) FROM stdin;
    Session          postgres    false    219   
�       �          0    16400    student 
   TABLE DATA           g   COPY "Session".student (record_book_id, status, education_form, surname, name, patronymic) FROM stdin;
    Session          postgres    false    216   ��       �          0    16512    syllabus 
   TABLE DATA           ]   COPY "Session".syllabus (syllabus_id, direction_id, status, kcp, admission_year) FROM stdin;
    Session          postgres    false    222   6�       �          0    16588    teacher 
   TABLE DATA           L   COPY "Session".teacher (personal_id, surname, name, patronymic) FROM stdin;
    Session          postgres    false    226   �       �           2606    16413 "   active student active student_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT "active student_pkey" PRIMARY KEY (student_id);
 S   ALTER TABLE ONLY "Session"."active student" DROP CONSTRAINT "active student_pkey";
       Session            postgres    false    217            �           2606    16748    attestation pass attempt_chk    CHECK CONSTRAINT     j   ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT attempt_chk CHECK ((attempt >= 0)) NOT VALID;
 F   ALTER TABLE "Session"."attestation pass" DROP CONSTRAINT attempt_chk;
       Session          postgres    false    227    227            �           2606    16749    attestation pass attempt_chk1    CHECK CONSTRAINT     k   ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT attempt_chk1 CHECK ((attempt <= 3)) NOT VALID;
 G   ALTER TABLE "Session"."attestation pass" DROP CONSTRAINT attempt_chk1;
       Session          postgres    false    227    227            �           2606    16624 &   attestation pass attestation pass_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT "attestation pass_pkey" PRIMARY KEY (personal_id, student_id, discipline_id, educational_program_id, syllabus_id);
 W   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT "attestation pass_pkey";
       Session            postgres    false    227    227    227    227    227            �           2606    16718    classroom classroom_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (classroom_id, department_id);
 E   ALTER TABLE ONLY "Session".classroom DROP CONSTRAINT classroom_pkey;
       Session            postgres    false    231    231            �           2606    16720    classroom classroom_uid 
   CONSTRAINT     ]   ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT classroom_uid UNIQUE (classroom_id);
 D   ALTER TABLE ONLY "Session".classroom DROP CONSTRAINT classroom_uid;
       Session            postgres    false    231            �           2606    16654    department department_uid 
   CONSTRAINT     e   ALTER TABLE ONLY "Session".department
    ADD CONSTRAINT department_uid PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY "Session".department DROP CONSTRAINT department_uid;
       Session            postgres    false    228            �           2606    16492    direction direction_uid 
   CONSTRAINT     b   ALTER TABLE ONLY "Session".direction
    ADD CONSTRAINT direction_uid PRIMARY KEY (direction_id);
 D   ALTER TABLE ONLY "Session".direction DROP CONSTRAINT direction_uid;
       Session            postgres    false    220            �           2606    16562    discipline discipline_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "Session".discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (discipline_id);
 G   ALTER TABLE ONLY "Session".discipline DROP CONSTRAINT discipline_pkey;
       Session            postgres    false    224            �           2606    16619 -   educational program discipline discipline_uid 
   CONSTRAINT     v   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT discipline_uid UNIQUE (discipline_id);
 \   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT discipline_uid;
       Session            postgres    false    225            �           2606    16505 &   educational program education_form.chk    CHECK CONSTRAINT     |   ALTER TABLE "Session"."educational program"
    ADD CONSTRAINT "education_form.chk" CHECK ((education_form > 0)) NOT VALID;
 R   ALTER TABLE "Session"."educational program" DROP CONSTRAINT "education_form.chk";
       Session          postgres    false    221    221            �           2606    16473    student education_form_chk    CHECK CONSTRAINT     l   ALTER TABLE "Session".student
    ADD CONSTRAINT education_form_chk CHECK ((education_form > 0)) NOT VALID;
 B   ALTER TABLE "Session".student DROP CONSTRAINT education_form_chk;
       Session          postgres    false    216    216            �           2606    16427 "   active student education_year_chk1    CHECK CONSTRAINT     w   ALTER TABLE "Session"."active student"
    ADD CONSTRAINT education_year_chk1 CHECK ((education_year <= 5)) NOT VALID;
 L   ALTER TABLE "Session"."active student" DROP CONSTRAINT education_year_chk1;
       Session          postgres    false    217    217            �           2606    16428 "   active student education_year_chk2    CHECK CONSTRAINT     w   ALTER TABLE "Session"."active student"
    ADD CONSTRAINT education_year_chk2 CHECK ((education_year >= 1)) NOT VALID;
 L   ALTER TABLE "Session"."active student" DROP CONSTRAINT education_year_chk2;
       Session          postgres    false    217    217            �           2606    16572 B   educational program discipline educational program discipline_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT "educational program discipline_pkey" PRIMARY KEY (discipline_id, syllabus_id, educational_program_id);
 s   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT "educational program discipline_pkey";
       Session            postgres    false    225    225    225            �           2606    16497 ,   educational program educational_program_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT educational_program_pkey PRIMARY KEY (educational_program_id);
 [   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT educational_program_pkey;
       Session            postgres    false    221            �           2606    16499 +   educational program educational_program_uid 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT educational_program_uid UNIQUE (educational_program_id) INCLUDE (educational_program_id);
 Z   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT educational_program_uid;
       Session            postgres    false    221            �           2606    16539    group group_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (group_id, syllabus_id, educational_program_id);
 ?   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT group_pkey;
       Session            postgres    false    223    223    223            �           2606    16541    group group_uid 
   CONSTRAINT     S   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT group_uid UNIQUE (group_id);
 >   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT group_uid;
       Session            postgres    false    223            �           2606    16750    attestation pass mark_chk    CHECK CONSTRAINT     d   ALTER TABLE "Session"."attestation pass"
    ADD CONSTRAINT mark_chk CHECK ((mark >= 0)) NOT VALID;
 C   ALTER TABLE "Session"."attestation pass" DROP CONSTRAINT mark_chk;
       Session          postgres    false    227    227            �           2606    16592    teacher personal_uid 
   CONSTRAINT     ^   ALTER TABLE ONLY "Session".teacher
    ADD CONSTRAINT personal_uid PRIMARY KEY (personal_id);
 A   ALTER TABLE ONLY "Session".teacher DROP CONSTRAINT personal_uid;
       Session            postgres    false    226            �           2606    16659    platform platform_uid 
   CONSTRAINT     _   ALTER TABLE ONLY "Session".platform
    ADD CONSTRAINT platform_uid PRIMARY KEY (platform_id);
 B   ALTER TABLE ONLY "Session".platform DROP CONSTRAINT platform_uid;
       Session            postgres    false    229            �           2606    16426    student record_book_uid 
   CONSTRAINT     _   ALTER TABLE ONLY "Session".student
    ADD CONSTRAINT record_book_uid UNIQUE (record_book_id);
 D   ALTER TABLE ONLY "Session".student DROP CONSTRAINT record_book_uid;
       Session            postgres    false    216            �           2606    16691    schedule schedule_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (platform_id, department_id, personal_id, group_id, educational_program_id, syllabus_id, educational_program_discipline_id);
 C   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT schedule_pkey;
       Session            postgres    false    230    230    230    230    230    230    230            �           2606    16527 4   scholarship appointment scholarship appointment_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT "scholarship appointment_pkey" PRIMARY KEY (student_id, scholarship_id);
 e   ALTER TABLE ONLY "Session"."scholarship appointment" DROP CONSTRAINT "scholarship appointment_pkey";
       Session            postgres    false    219    219            �           2606    16435    scholarship scholarship_pkey 
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
       Session          postgres    false    220    220            �           2606    16520    syllabus syllabus_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT syllabus_pkey PRIMARY KEY (syllabus_id, direction_id);
 C   ALTER TABLE ONLY "Session".syllabus DROP CONSTRAINT syllabus_pkey;
       Session            postgres    false    222    222            �           2606    16534    syllabus syllabus_uid 
   CONSTRAINT     Z   ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT syllabus_uid UNIQUE (syllabus_id);
 B   ALTER TABLE ONLY "Session".syllabus DROP CONSTRAINT syllabus_uid;
       Session            postgres    false    222                       2620    16567    discipline discipline_trigger    TRIGGER     �   CREATE TRIGGER discipline_trigger BEFORE INSERT OR UPDATE OF total_hours, lecture_hours, practice_hours, lab_hours ON "Session".discipline FOR EACH ROW EXECUTE FUNCTION "Session".hours_trigger();
 9   DROP TRIGGER discipline_trigger ON "Session".discipline;
       Session          postgres    false    224    224    224    224    224            �           2606    16726    schedule classroom_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT classroom_id FOREIGN KEY (classroom_id) REFERENCES "Session".classroom(classroom_id) NOT VALID;
 B   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT classroom_id;
       Session          postgres    false    231    230    3558            �           2606    16678    schedule department_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES "Session".department(department_id);
 C   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT department_id;
       Session          postgres    false    230    3550    228                       2606    16721    classroom department_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".classroom
    ADD CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES "Session".department(department_id);
 D   ALTER TABLE ONLY "Session".classroom DROP CONSTRAINT department_id;
       Session          postgres    false    228    231    3550            �           2606    16500     educational program direction_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT direction_id FOREIGN KEY (direction_id) REFERENCES "Session".direction(direction_id) NOT VALID;
 O   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT direction_id;
       Session          postgres    false    221    3526    220            �           2606    16521    syllabus direction_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT direction_id FOREIGN KEY (direction_id) REFERENCES "Session".direction(direction_id);
 B   ALTER TABLE ONLY "Session".syllabus DROP CONSTRAINT direction_id;
       Session          postgres    false    220    3526    222            �           2606    16573 ,   educational program discipline discipline_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id) REFERENCES "Session".discipline(discipline_id);
 [   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT discipline_id;
       Session          postgres    false    3540    225    224            �           2606    16645    attestation pass discipline_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id) REFERENCES "Session"."educational program discipline"(discipline_id);
 M   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT discipline_id;
       Session          postgres    false    225    227    3542            �           2606    16742 %   active student education_program_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT education_program_pkey FOREIGN KEY (education_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 T   ALTER TABLE ONLY "Session"."active student" DROP CONSTRAINT education_program_pkey;
       Session          postgres    false    217    3528    221            �           2606    16707 *   schedule educational_program_discipline_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT educational_program_discipline_id FOREIGN KEY (educational_program_discipline_id) REFERENCES "Session"."educational program discipline"(discipline_id) NOT VALID;
 W   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT educational_program_discipline_id;
       Session          postgres    false    230    3542    225            �           2606    16547    group educational_program_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id);
 K   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT educational_program_id;
       Session          postgres    false    3528    221    223            �           2606    16583 5   educational program discipline educational_program_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id);
 d   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT educational_program_id;
       Session          postgres    false    3528    221    225            �           2606    16640 '   attestation pass educational_program_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id);
 V   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT educational_program_id;
       Session          postgres    false    227    221    3528            �           2606    16702    schedule educational_program_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 L   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT educational_program_id;
       Session          postgres    false    3528    230    221            �           2606    16692    schedule group_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT group_id FOREIGN KEY (group_id) REFERENCES "Session"."group"(group_id) NOT VALID;
 >   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT group_id;
       Session          postgres    false    230    223    3538            �           2606    16625    attestation pass personal_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT personal_id FOREIGN KEY (personal_id) REFERENCES "Session".teacher(personal_id);
 K   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT personal_id;
       Session          postgres    false    227    226    3546            �           2606    16683    schedule personal_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT personal_id FOREIGN KEY (personal_id) REFERENCES "Session".teacher(personal_id);
 A   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT personal_id;
       Session          postgres    false    230    226    3546            �           2606    16663    department platform_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".department
    ADD CONSTRAINT platform_id FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id) NOT VALID;
 C   ALTER TABLE ONLY "Session".department DROP CONSTRAINT platform_id;
       Session          postgres    false    3552    229    228            �           2606    16673    schedule platform_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT platform_id FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id);
 A   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT platform_id;
       Session          postgres    false    229    230    3552            �           2606    16418    active student record_book_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT record_book_pkey FOREIGN KEY (record_book_id) REFERENCES "Session".student(record_book_id) NOT VALID;
 N   ALTER TABLE ONLY "Session"."active student" DROP CONSTRAINT record_book_pkey;
       Session          postgres    false    3514    217    216            �           2606    16482 &   scholarship appointment scholarship_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT scholarship_id FOREIGN KEY (scholarship_id) REFERENCES "Session".scholarship(scholarship_id);
 U   ALTER TABLE ONLY "Session"."scholarship appointment" DROP CONSTRAINT scholarship_id;
       Session          postgres    false    218    219    3520            �           2606    16477 "   scholarship appointment student_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."scholarship appointment"
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES "Session"."active student"(student_id);
 Q   ALTER TABLE ONLY "Session"."scholarship appointment" DROP CONSTRAINT student_id;
       Session          postgres    false    219    3516    217            �           2606    16630    attestation pass student_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES "Session"."active student"(student_id);
 J   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT student_id;
       Session          postgres    false    3516    217    227            �           2606    16542    group syllabus_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id);
 @   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT syllabus_id;
       Session          postgres    false    3534    222    223            �           2606    16578 *   educational program discipline syllabus_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program discipline"
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id);
 Y   ALTER TABLE ONLY "Session"."educational program discipline" DROP CONSTRAINT syllabus_id;
       Session          postgres    false    222    225    3534            �           2606    16635    attestation pass syllabus_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."attestation pass"
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id);
 K   ALTER TABLE ONLY "Session"."attestation pass" DROP CONSTRAINT syllabus_id;
       Session          postgres    false    222    227    3534                        2606    16697    schedule syllabus_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".schedule
    ADD CONSTRAINT syllabus_id FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;
 A   ALTER TABLE ONLY "Session".schedule DROP CONSTRAINT syllabus_id;
       Session          postgres    false    222    230    3534            �           2606    16737    active student syllabus_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."active student"
    ADD CONSTRAINT syllabus_pkey FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;
 K   ALTER TABLE ONLY "Session"."active student" DROP CONSTRAINT syllabus_pkey;
       Session          postgres    false    217    222    3534            �     x�}��q�@Cc�{x���:�]��'T�cQ� �TB�?L?"ߗ�Š�e�L��)��AZAR��AuF�������SWҬ��9#=f�r�-@<���1���A~���8�!�GlYؔ����DS|l�^풻�y��kL<�̋���}�)8��XKUj\�����M�؞q�x~RU>�oB�����&��$8Ӓ֎]s����3>��u�8�)M��$�e�ӷ�*��D��b��[>�'U`3�Jo�W�y~��	~r9�?E����"�?ך�2      �   <  x�mVk��!��w���Cѻ��ϱ<�n�/�t2=UH��!���B�� ����?����!i��S?��U����ӧh��XZ���K��X�L�Z���;���Q��(�M�L��ό
&���p�|���G��DA�hM!Q��)�GZ�a
G����N��=�T0��%8�0Gujm2G*�ƃ�(Vg-�R�Egǅ�Y��4��|�B7��H�(�4�t��ݬ�6��=�	*R�X5��~֮B�\�DȬ�pEqb;An�i����h��W�p���"a3�<���%��Ԁ�'�ԯ�2��i5����ʘ��ܺ�w�ɸ�Ģ�Դ}�l��a��X�O�����lA�&Í��4Ɋju��EI��uRiͭ,���d��hQA9Y�>�@�cW+(�`4i���M�(�-��/yy�Z�����zd㽵ZN��Ehn���[��q��9�| ���}���H_M�դ��'ʒ�1��%���~����z[N�w�D2�
,u����G�ۄ�ep�����{`o�m|O�~�cy�}!����O�wi�x"-�K������(���5:�)o ��p�C���)jg�c�&q�sf|�Q}���:��f�7���X�g���7��+��vj&��?Aꊠ�>3��|8a���YH+�]m��}��������������˃���
���4������8I�wD��~���e��Fq��>o'2���w!9ڞk�ڽ՚>C��p�XJ���� �{����&�<�����h�Nj��[����v����~����J�o
��L�^(��r9~�Vp~:)�Ͽ�������&      �   �   x�=OɑA{K�l57����X�3�'�z��� pI��`r0�LcBEK��gYX�ܐ�W.��H|��z�N\��zݾ��Rk�[������NX6��{˭�ߴ�����Z1Ph3Cmʹ!�P8������1�����v����B+��G�{u(�*������4      �   k  x�=���� ���S� v�86{HTy�j)����h�jC4��r��G=�?���ʹF;�y"��0N(�e�:�a~���5�W0���k����}���xᧅ"��mˌ�������)�j�ק��/Ҧ8�x]��Z�S��'��2�	o�O~�甞��U
~�לb�>�8�uN����5��⛯T��rgr�{P��K}�|��eZI{�W?�yR�FA����8#�^;��1�QM���P񽧏��zFp�kX�[��)Ŋ��2�i. U�u#-���>�5�n`��gҞ�r˃ˬ�ZxI��f�ܢ����i8^�v�Pe�����V載8�i�XR8&�Vp�B�׬�����߿1���=��      �   �   x�U��J1���ÈI;��u]Q<9x��@�����oo*z��_�?aF�UZn���.���~MZ��������e�p_�6p6�A�j��Y�F�ᴧbY���$m6���D�}�n�w!�Qʟ�"�V�m��v��[���H���Z��wK�ٖ�̣<����5�0�-p�YF'O�}�[�����&g�R� ����7�EL�      �   �   x���J�0E��}E?`*}i�&۩PETPa6nB�2i2�#J�ޗ�$p���;��~�Ɯ~.`e�`:&c1��rM�����ö��H7�8�ů�����q[%���H���k���6%0ے��R
{�s-G<��(��̶���SL�c��NR�sК�C�����|��!TrUX��v2N�`,�yW�f���n�L��3Y��|���)������d{1;�y���z��`�ӣ������K�      �   �  x�5R�j�0�>z
?@4��rii�ֲ����n�T�"����<��e���}�V����yr�4%�[��pP�;�)b��C����#� �d��Xn9��c
t[r� @I���X�|�	E������*���6����R�T�U@��j�-�p�4��KL)T��p�p�6��9����� �� �c�;�k;�#'0 �k� �I�?J<O�Nw�o(��­Z�F?u��,�~ʨ`D�gK���O��W��)֮�
��[�����%c��r�U؆�D9,z�o�5Dg��-����t�4�]����ws��R�rF�k�rE����'D����eX��D�,�.[U�J	�.��>�r�cԆ�3n���%����i���ĔdDp��9����W�#�M[�SJu#���GnA�|!����      �   R   x�-���0��0L�v����h���R
�T!#�z&������rB�̠6�tvC�l�Ȳm�k����J�}�| n��      �   �   x�%�ˍE1Cצ�Q0�^^�u�] �	[+��0��ZqM��2�D���%�1a�ͦ��g���yP��"e����^`Ǘ�n�RL&�N,!ц�c��%\�zc��1�y���+jZ�_�l��W/�avK���ߟ��:�(�      �   �  x�MS�n�0=�_1`ܗ�g�#NЅ�و�B�������l�>��F)��q��]Z�%�]�a�����/��{Y����	�[�SJ%���m�"��]l�eZ��e;���!�{E�d�xf�>���=,�lC��i�qM^�x���׈=n�T;G��f�/R��M��9�_���Y]�A0�E���i���F@M�:�ඦ~(�6־M5N���u�Q#�'�[��:�?a�瑜V��>n�]�:�]܁pN+j�����.���k�����S`�0N���H-|����KX�t뛼�G�͍�RN�qF�m�o���G�7,]��y<\��5�"��0��Ìm��6�WM~ݦ=e���8%�����'g�C��= ��,%�����,��)�#�������n�l~��PR�pc	��WT�Z���-cM>u������[)9��;.=\����׼l�RFT*�\��6��'0�q=&ω���І�bw�=�(.�b��0qF��9L����8������hQ�6)�	Lo�:#5ŪX�f�^�R���_�[��y�o�.s�(�a���a�7��Mi�.�t����R�9#����]����5��������t�b�B̈́��ƥ���U��y�f8n�a�ϻ�Vq��=aZ�|���C�0�      �   o  x�m�Kn�0C��]����]z�s���H2](�R�gP;Oro32S�i�t
�����X���j
�$n)������|��/E�ȵ�rg��Θ��[(�eg��ӳ�E	w)������D�Ę��HE}��w-��_���2/�:�=:�B�C����1^���R*��۫Vf�sa6�����w���)C����Rf�����w;��|�G����n��'g�z��z�D޸b�?��?����"O�s+��z6�����
S������㕻�},�A�~�ُ^��+�u���֯��u�{E�4vjܽ08�QZ��y�h�>�X��kI8i�cLқ���*������.����#S��y\3s���1� ,�y      �   �   x���N1���A���c� Z-'.�l�mVJW���1=��|c�$�'����V���S�v+=�x�q\�N��$|�~�}��E�a��C�<�n��J/�)�pRC�!#:m��;Y��a�����e'��d�C������sx�%�H�
>F��� ��,�G�B,�&��c��S��Ę�y.u!5�q���Aꕭa�y�Q���e�o����x)c'���[�7-�8_OD��,Ou      �   |   x�e���0��^q����_G��L�C�e`'I`�D/�Kd���eGBVX��!���׎B�`�\
�y������2���^�`9���o��ȧ��	���?����.VKE�Z3c6��c�K]AH      �   �  x�=Q�n�0>�SX�-�Ǵ�:��I�S/D��Zi��~�QNZX'��/k[9:�O�,��Øy�'����(�5������vc�`yFe�U2t�g����a��(�yصUg�\C�����RS��a]����$İ��N�2�el��TU�>���&8N��Ǻ������Y��)`�vNC��� �3��b��J7VF��yK��w��D>��UԠ���%�/sta�d���"��">|��Ḑ�b��n�+�_�q�-x��o���F�_�?y#��?M�F�VzGJ$�1�g�Ah�N��X�P��	�%�SF�b��ͣ�3<G)K���2�t�^bs��h�Ԓ3Ɇ254B.N�V�i��GݚFI�B�'���.+1���yq�vWw��4��F      �   �   x�=��m @�PL�Y�^���^���=�A$e�[�fH���4�Ms��'!Y&�1u��fR:�6S�<	%��=mC}.:�Z;j�]\�+�N��n��Ǘc޴����@:(ꘀsI��楳.1�5}ۺ9?�����;A\c����_oup����̹�V��=�z�w������}>�<ŋ %���i�ў�c����=S??T�xv@+      �   {  x�M��r�0����t$���'����؞�zA$4Ĕ�2$�T}��m��J,��.��8ҕ��'��xr�I5���0f��3�8
p�=�2��`���)ɕT�=�#B��a�ɣ��+�{��O������̨lSU�,������H5����c���!MU�T51;Ov�֜ᄅ]鮵�D|�"'����K��mWwp��
G^��o0�g�m��|_]%x�3S���v0F��ē$�Ed'ܖ5�ʴ�>Z��J�t���`a?����<��`|-�o۪�/kv�g�#c )�5F*­09�#�zhzxt�=�|"]
f�d]]���Uzs�zLJ����3F�y��a�s�9���t7�"	O�$-o����o��     