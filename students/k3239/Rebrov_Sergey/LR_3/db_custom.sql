PGDMP      0            	    {            session    16.0    16.0 N               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16397    session    DATABASE     {   CREATE DATABASE session WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE session;
                postgres    false                       0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   pg_database_owner    false    5                       0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   pg_database_owner    false    5                        2615    2200    session    SCHEMA        CREATE SCHEMA session;
    DROP SCHEMA session;
                postgres    false                        0    0    SCHEMA session    ACL     �   REVOKE ALL ON SCHEMA session FROM pg_database_owner;
REVOKE USAGE ON SCHEMA session FROM PUBLIC;
GRANT ALL ON SCHEMA session TO postgres;
                   postgres    false    6            �            1259    16434    assessments    TABLE     ^  CREATE TABLE session.assessments (
    assessment_id integer NOT NULL,
    type character(8) NOT NULL,
    date timestamp without time zone NOT NULL,
    attempt integer NOT NULL,
    discipline_id integer NOT NULL,
    teacher_id integer NOT NULL,
    group_id integer NOT NULL,
    place_id integer NOT NULL,
    classroom character(8) NOT NULL
);
     DROP TABLE session.assessments;
       session         heap    postgres    false    6            �            1259    16539    assessments_assessment_id_seq    SEQUENCE     �   ALTER TABLE session.assessments ALTER COLUMN assessment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.assessments_assessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    6    224            �            1259    16444    departments    TABLE     k   CREATE TABLE session.departments (
    department_id integer NOT NULL,
    name character(128) NOT NULL
);
     DROP TABLE session.departments;
       session         heap    postgres    false    6            �            1259    16449 
   directions    TABLE     �   CREATE TABLE session.directions (
    direction_id integer NOT NULL,
    name character(128) NOT NULL,
    department_ids character(128)[] NOT NULL
);
    DROP TABLE session.directions;
       session         heap    postgres    false    6            �            1259    16417    disciplines    TABLE     �   CREATE TABLE session.disciplines (
    discipline_id integer NOT NULL,
    name character(128) NOT NULL,
    program_ids character(1)[] NOT NULL
);
     DROP TABLE session.disciplines;
       session         heap    postgres    false    6            �            1259    16540    disciplines_discipline_id_seq    SEQUENCE     �   ALTER TABLE session.disciplines ALTER COLUMN discipline_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.disciplines_discipline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    6    221            �            1259    16439    grades    TABLE     �   CREATE TABLE session.grades (
    grade_id integer NOT NULL,
    number character(8) NOT NULL,
    assessment_id integer NOT NULL,
    student_id integer NOT NULL
);
    DROP TABLE session.grades;
       session         heap    postgres    false    6            �            1259    16541    grades_grade_id_seq    SEQUENCE     �   ALTER TABLE session.grades ALTER COLUMN grade_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.grades_grade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    225    6            �            1259    16412    groups    TABLE     �   CREATE TABLE session.groups (
    group_id integer NOT NULL,
    course integer NOT NULL,
    semester integer NOT NULL,
    program_id integer NOT NULL
);
    DROP TABLE session.groups;
       session         heap    postgres    false    6            �            1259    16429    lessons    TABLE     r  CREATE TABLE session.lessons (
    lesson_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    type character(16) NOT NULL,
    discipline_id integer NOT NULL,
    teacher_id integer NOT NULL,
    group_id integer NOT NULL,
    place_id integer NOT NULL,
    classroom character(8) NOT NULL
);
    DROP TABLE session.lessons;
       session         heap    postgres    false    6            �            1259    16542    lessons_lesson_id_seq    SEQUENCE     �   ALTER TABLE session.lessons ALTER COLUMN lesson_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.lessons_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    223    6            �            1259    16424    places    TABLE     �   CREATE TABLE session.places (
    place_id integer NOT NULL,
    name character(128) NOT NULL,
    city character(32) NOT NULL,
    address character(256) NOT NULL
);
    DROP TABLE session.places;
       session         heap    postgres    false    6            �            1259    16543    places_place_id_seq    SEQUENCE     �   ALTER TABLE session.places ALTER COLUMN place_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.places_place_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    222    6            �            1259    16456    programs    TABLE     �   CREATE TABLE session.programs (
    program_id integer NOT NULL,
    name character(128) NOT NULL,
    year integer NOT NULL,
    direction_id integer NOT NULL
);
    DROP TABLE session.programs;
       session         heap    postgres    false    6            �            1259    16544    programs_program_id_seq    SEQUENCE     �   ALTER TABLE session.programs ALTER COLUMN program_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.programs_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    6    228            �            1259    16399    students    TABLE     �   CREATE TABLE session.students (
    student_id integer NOT NULL,
    name character(128) NOT NULL,
    scholarship integer DEFAULT 0 NOT NULL,
    group_id integer NOT NULL
);
    DROP TABLE session.students;
       session         heap    postgres    false    6            �            1259    16405    students_student_id_seq    SEQUENCE     �   ALTER TABLE session.students ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    6    216            �            1259    16407    teachers    TABLE     �   CREATE TABLE session.teachers (
    teacher_id integer NOT NULL,
    name character(128) NOT NULL,
    "position" character(32) NOT NULL,
    department_id integer NOT NULL
);
    DROP TABLE session.teachers;
       session         heap    postgres    false    6            �            1259    16406    teachers_teacher_id_seq    SEQUENCE     �   ALTER TABLE session.teachers ALTER COLUMN teacher_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.teachers_teacher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    6    219                      0    16434    assessments 
   TABLE DATA           �   COPY session.assessments (assessment_id, type, date, attempt, discipline_id, teacher_id, group_id, place_id, classroom) FROM stdin;
    session          postgres    false    224   �`                 0    16444    departments 
   TABLE DATA           ;   COPY session.departments (department_id, name) FROM stdin;
    session          postgres    false    226   ma                 0    16449 
   directions 
   TABLE DATA           I   COPY session.directions (direction_id, name, department_ids) FROM stdin;
    session          postgres    false    227   'b       
          0    16417    disciplines 
   TABLE DATA           H   COPY session.disciplines (discipline_id, name, program_ids) FROM stdin;
    session          postgres    false    221   �b                 0    16439    grades 
   TABLE DATA           N   COPY session.grades (grade_id, number, assessment_id, student_id) FROM stdin;
    session          postgres    false    225   _c       	          0    16412    groups 
   TABLE DATA           I   COPY session.groups (group_id, course, semester, program_id) FROM stdin;
    session          postgres    false    220   �c                 0    16429    lessons 
   TABLE DATA           �   COPY session.lessons (lesson_id, start_time, end_time, type, discipline_id, teacher_id, group_id, place_id, classroom) FROM stdin;
    session          postgres    false    223   �c                 0    16424    places 
   TABLE DATA           @   COPY session.places (place_id, name, city, address) FROM stdin;
    session          postgres    false    222   Ld                 0    16456    programs 
   TABLE DATA           I   COPY session.programs (program_id, name, year, direction_id) FROM stdin;
    session          postgres    false    228   e                 0    16399    students 
   TABLE DATA           L   COPY session.students (student_id, name, scholarship, group_id) FROM stdin;
    session          postgres    false    216   qe                 0    16407    teachers 
   TABLE DATA           P   COPY session.teachers (teacher_id, name, "position", department_id) FROM stdin;
    session          postgres    false    219   �e       !           0    0    assessments_assessment_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('session.assessments_assessment_id_seq', 6, true);
          session          postgres    false    229            "           0    0    disciplines_discipline_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('session.disciplines_discipline_id_seq', 3, true);
          session          postgres    false    230            #           0    0    grades_grade_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('session.grades_grade_id_seq', 3, true);
          session          postgres    false    231            $           0    0    lessons_lesson_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('session.lessons_lesson_id_seq', 4, true);
          session          postgres    false    232            %           0    0    places_place_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('session.places_place_id_seq', 3, true);
          session          postgres    false    233            &           0    0    programs_program_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('session.programs_program_id_seq', 3, true);
          session          postgres    false    234            '           0    0    students_student_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('session.students_student_id_seq', 6, true);
          session          postgres    false    217            (           0    0    teachers_teacher_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('session.teachers_teacher_id_seq', 2, true);
          session          postgres    false    218            _           2606    16438    assessments assessments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT assessments_pkey PRIMARY KEY (assessment_id);
 G   ALTER TABLE ONLY session.assessments DROP CONSTRAINT assessments_pkey;
       session            postgres    false    224            O           2606    16462    assessments ch_attempt    CHECK CONSTRAINT     u   ALTER TABLE session.assessments
    ADD CONSTRAINT ch_attempt CHECK (((attempt >= 1) AND (attempt <= 3))) NOT VALID;
 <   ALTER TABLE session.assessments DROP CONSTRAINT ch_attempt;
       session          postgres    false    224    224            K           2606    16496    groups ch_course    CHECK CONSTRAINT     m   ALTER TABLE session.groups
    ADD CONSTRAINT ch_course CHECK (((course >= 1) AND (course <= 6))) NOT VALID;
 6   ALTER TABLE session.groups DROP CONSTRAINT ch_course;
       session          postgres    false    220    220            M           2606    16502    lessons ch_end_time    CHECK CONSTRAINT     f   ALTER TABLE session.lessons
    ADD CONSTRAINT ch_end_time CHECK ((end_time > start_time)) NOT VALID;
 9   ALTER TABLE session.lessons DROP CONSTRAINT ch_end_time;
       session          postgres    false    223    223    223    223            Q           2606    16483    grades ch_number    CHECK CONSTRAINT     �   ALTER TABLE session.grades
    ADD CONSTRAINT ch_number CHECK ((number = ANY (ARRAY['A'::bpchar, 'B'::bpchar, 'C'::bpchar, 'D'::bpchar, 'E'::bpchar, 'F'::bpchar]))) NOT VALID;
 6   ALTER TABLE session.grades DROP CONSTRAINT ch_number;
       session          postgres    false    225    225            L           2606    16495    groups ch_semester    CHECK CONSTRAINT     t   ALTER TABLE session.groups
    ADD CONSTRAINT ch_semester CHECK (((semester >= 1) AND (semester <= 12))) NOT VALID;
 8   ALTER TABLE session.groups DROP CONSTRAINT ch_semester;
       session          postgres    false    220    220            P           2606    16461    assessments ch_type    CHECK CONSTRAINT     �   ALTER TABLE session.assessments
    ADD CONSTRAINT ch_type CHECK ((type = ANY (ARRAY['exam'::bpchar, 'test'::bpchar, 'difftest'::bpchar]))) NOT VALID;
 9   ALTER TABLE session.assessments DROP CONSTRAINT ch_type;
       session          postgres    false    224    224            N           2606    16503    lessons ch_type    CHECK CONSTRAINT     �   ALTER TABLE session.lessons
    ADD CONSTRAINT ch_type CHECK ((type = ANY (ARRAY['practice'::bpchar, 'laboratory'::bpchar, 'lecture'::bpchar]))) NOT VALID;
 5   ALTER TABLE session.lessons DROP CONSTRAINT ch_type;
       session          postgres    false    223    223            c           2606    16448    departments departments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY session.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 G   ALTER TABLE ONLY session.departments DROP CONSTRAINT departments_pkey;
       session            postgres    false    226            e           2606    16455    directions directions_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY session.directions
    ADD CONSTRAINT directions_pkey PRIMARY KEY (direction_id);
 E   ALTER TABLE ONLY session.directions DROP CONSTRAINT directions_pkey;
       session            postgres    false    227            Y           2606    16423    disciplines disciplines_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY session.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (discipline_id);
 G   ALTER TABLE ONLY session.disciplines DROP CONSTRAINT disciplines_pkey;
       session            postgres    false    221            a           2606    16443    grades grades_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY session.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (grade_id);
 =   ALTER TABLE ONLY session.grades DROP CONSTRAINT grades_pkey;
       session            postgres    false    225            W           2606    16416    groups groups_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY session.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);
 =   ALTER TABLE ONLY session.groups DROP CONSTRAINT groups_pkey;
       session            postgres    false    220            ]           2606    16433    lessons lessons_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (lesson_id);
 ?   ALTER TABLE ONLY session.lessons DROP CONSTRAINT lessons_pkey;
       session            postgres    false    223            [           2606    16428    places places_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY session.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (place_id);
 =   ALTER TABLE ONLY session.places DROP CONSTRAINT places_pkey;
       session            postgres    false    222            g           2606    16460    programs programs_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY session.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (program_id);
 A   ALTER TABLE ONLY session.programs DROP CONSTRAINT programs_pkey;
       session            postgres    false    228            S           2606    16404    students students_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY session.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);
 A   ALTER TABLE ONLY session.students DROP CONSTRAINT students_pkey;
       session            postgres    false    216            U           2606    16411    teachers teachers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY session.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id);
 A   ALTER TABLE ONLY session.teachers DROP CONSTRAINT teachers_pkey;
       session            postgres    false    219            s           2606    16484    grades fk_assessment    FK CONSTRAINT     �   ALTER TABLE ONLY session.grades
    ADD CONSTRAINT fk_assessment FOREIGN KEY (assessment_id) REFERENCES session.assessments(assessment_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 ?   ALTER TABLE ONLY session.grades DROP CONSTRAINT fk_assessment;
       session          postgres    false    4703    225    224            i           2606    16534    teachers fk_department    FK CONSTRAINT     �   ALTER TABLE ONLY session.teachers
    ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES session.departments(department_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 A   ALTER TABLE ONLY session.teachers DROP CONSTRAINT fk_department;
       session          postgres    false    4707    226    219            u           2606    16524    programs fk_direction    FK CONSTRAINT     �   ALTER TABLE ONLY session.programs
    ADD CONSTRAINT fk_direction FOREIGN KEY (direction_id) REFERENCES session.directions(direction_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 @   ALTER TABLE ONLY session.programs DROP CONSTRAINT fk_direction;
       session          postgres    false    228    4709    227            o           2606    16463    assessments fk_discipline    FK CONSTRAINT     �   ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT fk_discipline FOREIGN KEY (discipline_id) REFERENCES session.disciplines(discipline_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 D   ALTER TABLE ONLY session.assessments DROP CONSTRAINT fk_discipline;
       session          postgres    false    221    4697    224            k           2606    16504    lessons fk_discipline    FK CONSTRAINT     �   ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT fk_discipline FOREIGN KEY (discipline_id) REFERENCES session.disciplines(discipline_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 @   ALTER TABLE ONLY session.lessons DROP CONSTRAINT fk_discipline;
       session          postgres    false    221    223    4697            p           2606    16473    assessments fk_group    FK CONSTRAINT     �   ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES session.groups(group_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 ?   ALTER TABLE ONLY session.assessments DROP CONSTRAINT fk_group;
       session          postgres    false    224    220    4695            l           2606    16514    lessons fk_group    FK CONSTRAINT     �   ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES session.groups(group_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 ;   ALTER TABLE ONLY session.lessons DROP CONSTRAINT fk_group;
       session          postgres    false    223    4695    220            h           2606    16529    students fk_group    FK CONSTRAINT     �   ALTER TABLE ONLY session.students
    ADD CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES session.groups(group_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 <   ALTER TABLE ONLY session.students DROP CONSTRAINT fk_group;
       session          postgres    false    216    4695    220            q           2606    16478    assessments fk_place    FK CONSTRAINT     �   ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT fk_place FOREIGN KEY (place_id) REFERENCES session.places(place_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 ?   ALTER TABLE ONLY session.assessments DROP CONSTRAINT fk_place;
       session          postgres    false    222    224    4699            m           2606    16519    lessons fk_place    FK CONSTRAINT     �   ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT fk_place FOREIGN KEY (place_id) REFERENCES session.places(place_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 ;   ALTER TABLE ONLY session.lessons DROP CONSTRAINT fk_place;
       session          postgres    false    222    4699    223            j           2606    16497    groups fk_program    FK CONSTRAINT     �   ALTER TABLE ONLY session.groups
    ADD CONSTRAINT fk_program FOREIGN KEY (program_id) REFERENCES session.programs(program_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 <   ALTER TABLE ONLY session.groups DROP CONSTRAINT fk_program;
       session          postgres    false    228    220    4711            t           2606    16489    grades fk_student    FK CONSTRAINT     �   ALTER TABLE ONLY session.grades
    ADD CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES session.students(student_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 <   ALTER TABLE ONLY session.grades DROP CONSTRAINT fk_student;
       session          postgres    false    225    216    4691            r           2606    16468    assessments fk_teacher    FK CONSTRAINT     �   ALTER TABLE ONLY session.assessments
    ADD CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES session.teachers(teacher_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 A   ALTER TABLE ONLY session.assessments DROP CONSTRAINT fk_teacher;
       session          postgres    false    4693    224    219            n           2606    16509    lessons fk_teacher    FK CONSTRAINT     �   ALTER TABLE ONLY session.lessons
    ADD CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES session.teachers(teacher_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 =   ALTER TABLE ONLY session.lessons DROP CONSTRAINT fk_teacher;
       session          postgres    false    223    4693    219               w   x�3�,I-.Q N##c]C#]#SCK+ �4B#NC#c ���.��U�2�L�LK�E�gae�g��g�idh�dʙZ����� ��a��*Nc#cK ebdb����� �!R         �   x�����0Dϸ
W����. ���H!�M31�"�䚕V����ͤI���4x��Kt,-zxV�N��n@Ëޠ������Zc��~I|�uʤ��pY�g1pVʇ'ݴB�&n�e�j�D�Y�aO���p�|�?,�*CV���S��^��nz�,��ǭ1����E         �   x�͑M
1���S��E���7AEW
^@�
��P;gx����ƍ���|Ӻ�pD�3"Z�#�A#jY!��>�C�"���]�uqUsck�%ˏ�$30�5���+,��Q�d������F^�L��s�g���l���{��2�^E�|���RO$R�1      
   u   x��α�@����S� ��c61$
1�{K��e��m�i�����Ab!�ʬ3+Q�gU�S�Zu:��s�PT��=cZf^ߦnW�)�*ǍȢ�3峱���O��X]����g�            x�3�tT� NSN.cNgה+F��� Rio      	   !   x�362��4�4�4�2426�4r��b���� 8A�         ~   x�3�4202�54�52V04�22�20@3�2��$&�%��U*��1�!����%�abd�2F�jԇn���1�ƙ�h5�2�0���,VP��\���� @Ì8��M���/l��bb� ?^2
         �   x�哱�0E�� ,Ұ�8� �6�L (q�Y��F\H��(���N�ϖ����&�����%�
��w�ANrYkF�'Xy�q���g!4�|^��R/�Zmb��]�
�d?&S��t��ӊ���S�7:�ݢ��f�#��!�{�2���|<��H?��wf˻�d��e��h���	�6S         P   x�3⼰�b���v_�pa������-v_�W�0�/,R�#�9�������m>�u3��6C�ˌ�b���� �H�         w   x�3�0��֋M.컰I�Q@���b������	�	��^�s�B��.l
�T�0���[�ܭ@H_rZ� ����%��@�7 v"���,J���)$c���� o��         �   x�3�0���_�wa�	��M@��;.�l�o�Mv\lW��۹䔋x�pq^XV�t/�'��4I�?�_�z�	h�>��B���~�G@��������za�����=... ���     