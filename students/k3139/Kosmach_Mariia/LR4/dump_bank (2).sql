PGDMP  )    #                {            Bank    16.1    16.0 F    '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    17271    Bank    DATABASE     z   CREATE DATABASE "Bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Bank";
                postgres    false                        2615    17272    Bank    SCHEMA        CREATE SCHEMA "Bank";
    DROP SCHEMA "Bank";
                postgres    false            �            1259    17273    accruals    TABLE       CREATE TABLE "Bank".accruals (
    payments integer NOT NULL,
    id_accruals integer NOT NULL,
    actual_date_payments date,
    planned_date_payments date NOT NULL,
    contract_number integer NOT NULL,
    CONSTRAINT paymentscheck1 CHECK ((payments > 0))
);
    DROP TABLE "Bank".accruals;
       Bank         heap    postgres    false    6            �            1259    17277    client    TABLE     j  CREATE TABLE "Bank".client (
    passport_number character varying(10) NOT NULL,
    address character varying(250) NOT NULL,
    phone_number character varying(20) NOT NULL,
    full_name character varying(250) NOT NULL,
    email character varying(250),
    id_client integer NOT NULL,
    age smallint NOT NULL,
    CONSTRAINT age_check CHECK ((age > 17))
);
    DROP TABLE "Bank".client;
       Bank         heap    postgres    false    6            �            1259    17283    credit    TABLE     �  CREATE TABLE "Bank".credit (
    contract_number integer NOT NULL,
    loan_date date NOT NULL,
    actual_loan_closing_date date,
    planned_loan_closing_date date NOT NULL,
    initial_loan_amount integer NOT NULL,
    current_debt integer NOT NULL,
    id_employee integer NOT NULL,
    id_client integer NOT NULL,
    currency_code integer NOT NULL,
    credit_code integer NOT NULL,
    status character varying NOT NULL,
    CONSTRAINT closing_date CHECK ((actual_loan_closing_date > loan_date))
);
    DROP TABLE "Bank".credit;
       Bank         heap    postgres    false    6            �            1259    17432    clients_debts    VIEW     U  CREATE VIEW "Bank".clients_debts AS
 SELECT client.passport_number,
    client.address,
    client.phone_number,
    client.full_name,
    client.email,
    client.id_client,
    client.age,
    credit.current_debt
   FROM ("Bank".credit
     JOIN "Bank".client ON ((credit.id_client = client.id_client)))
  WHERE (credit.current_debt > 0);
     DROP VIEW "Bank".clients_debts;
       Bank          postgres    false    217    217    217    217    218    218    217    217    217    6            �            1259    17310    credit_directory    TABLE     �   CREATE TABLE "Bank".credit_directory (
    credit_code integer NOT NULL,
    percent integer NOT NULL,
    desription character varying NOT NULL,
    type character varying NOT NULL,
    min_amount_credit integer NOT NULL
);
 $   DROP TABLE "Bank".credit_directory;
       Bank         heap    postgres    false    6            �            1259    17289    currency    TABLE     �   CREATE TABLE "Bank".currency (
    currency_code integer NOT NULL,
    country character varying(30) NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE "Bank".currency;
       Bank         heap    postgres    false    6            �            1259    17292    deposit    TABLE     �  CREATE TABLE "Bank".deposit (
    contract_number integer NOT NULL,
    loan_date date NOT NULL,
    actual_date_of_closing_deposit date,
    planned_date_of_closing_deposit date NOT NULL,
    initial_deposit_amount integer NOT NULL,
    deposit_amount integer NOT NULL,
    currency_code integer NOT NULL,
    id_client integer NOT NULL,
    deposit_code integer NOT NULL,
    data_deposit_accrual integer NOT NULL,
    id_employee integer NOT NULL,
    id_accruals integer NOT NULL,
    status text
);
    DROP TABLE "Bank".deposit;
       Bank         heap    postgres    false    6            �            1259    17295    deposit_directory    TABLE       CREATE TABLE "Bank".deposit_directory (
    deposit_code integer NOT NULL,
    description character varying NOT NULL,
    type character varying NOT NULL,
    percent integer NOT NULL,
    min_amount_deposit_ integer NOT NULL,
    min_deposit_period integer NOT NULL,
    CONSTRAINT min_amount_deposit_check1 CHECK ((min_amount_deposit_ > 0)),
    CONSTRAINT min_deposit_period CHECK ((min_deposit_period > 0)),
    CONSTRAINT "percent check1" CHECK ((percent > 0)),
    CONSTRAINT "percent check12" CHECK ((percent < 100))
);
 %   DROP TABLE "Bank".deposit_directory;
       Bank         heap    postgres    false    6            �            1259    17304    employee    TABLE     =  CREATE TABLE "Bank".employee (
    id_employee integer NOT NULL,
    age smallint NOT NULL,
    code_job integer NOT NULL,
    paasport_number character varying(10) NOT NULL,
    phone_nimber character varying(20) NOT NULL,
    full_name character varying(50) NOT NULL,
    address character varying(100) NOT NULL
);
    DROP TABLE "Bank".employee;
       Bank         heap    postgres    false    6            �            1259    17427    employee_info    VIEW     j  CREATE VIEW "Bank".employee_info AS
SELECT
    NULL::integer AS id_employee,
    NULL::smallint AS age,
    NULL::integer AS code_job,
    NULL::character varying(10) AS paasport_number,
    NULL::character varying(20) AS phone_nimber,
    NULL::character varying(50) AS full_name,
    NULL::character varying(100) AS address,
    NULL::bigint AS num_contracts;
     DROP VIEW "Bank".employee_info;
       Bank          postgres    false    6            �            1259    17307    job_directory    TABLE     �   CREATE TABLE "Bank".job_directory (
    code_job integer NOT NULL,
    salary integer,
    name character varying(250) NOT NULL
);
 !   DROP TABLE "Bank".job_directory;
       Bank         heap    postgres    false    6            �            1259    17315    payments_timetable    TABLE     �   CREATE TABLE "Bank".payments_timetable (
    "ID_payments_timetable" integer NOT NULL,
    payment_amount integer NOT NULL,
    actual_date_payments date NOT NULL,
    planned_data_payment date NOT NULL,
    contract_number integer NOT NULL
);
 &   DROP TABLE "Bank".payments_timetable;
       Bank         heap    postgres    false    6            �            1259    17422    employee_info    VIEW     j  CREATE VIEW public.employee_info AS
SELECT
    NULL::integer AS id_employee,
    NULL::smallint AS age,
    NULL::integer AS code_job,
    NULL::character varying(10) AS paasport_number,
    NULL::character varying(20) AS phone_nimber,
    NULL::character varying(50) AS full_name,
    NULL::character varying(100) AS address,
    NULL::bigint AS num_contracts;
     DROP VIEW public.employee_info;
       public          postgres    false                      0    17273    accruals 
   TABLE DATA                 Bank          postgres    false    216   b                 0    17277    client 
   TABLE DATA                 Bank          postgres    false    217   Wc                 0    17283    credit 
   TABLE DATA                 Bank          postgres    false    218   �e       #          0    17310    credit_directory 
   TABLE DATA                 Bank          postgres    false    224   g                 0    17289    currency 
   TABLE DATA                 Bank          postgres    false    219   h                 0    17292    deposit 
   TABLE DATA                 Bank          postgres    false    220   i                  0    17295    deposit_directory 
   TABLE DATA                 Bank          postgres    false    221   hk       !          0    17304    employee 
   TABLE DATA                 Bank          postgres    false    222   {l       "          0    17307    job_directory 
   TABLE DATA                 Bank          postgres    false    223   �m       $          0    17315    payments_timetable 
   TABLE DATA                 Bank          postgres    false    225   o       X           2606    17318    employee AGE_CHECK    CHECK CONSTRAINT     Y   ALTER TABLE "Bank".employee
    ADD CONSTRAINT "AGE_CHECK" CHECK ((age > 17)) NOT VALID;
 9   ALTER TABLE "Bank".employee DROP CONSTRAINT "AGE_CHECK";
       Bank          postgres    false    222    222            ^           2606    17320    client Client_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "Bank".client
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (passport_number);
 >   ALTER TABLE ONLY "Bank".client DROP CONSTRAINT "Client_pkey";
       Bank            postgres    false    217            h           2606    17322    currency Currency_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "Bank".currency
    ADD CONSTRAINT "Currency_pkey" PRIMARY KEY (currency_code);
 B   ALTER TABLE ONLY "Bank".currency DROP CONSTRAINT "Currency_pkey";
       Bank            postgres    false    219            m           2606    17324    deposit Deposit_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "Bank".deposit
    ADD CONSTRAINT "Deposit_pkey" PRIMARY KEY (contract_number);
 @   ALTER TABLE ONLY "Bank".deposit DROP CONSTRAINT "Deposit_pkey";
       Bank            postgres    false    220            q           2606    17326 )   deposit_directory Deposits_directory_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY "Bank".deposit_directory
    ADD CONSTRAINT "Deposits_directory_pkey" PRIMARY KEY (deposit_code);
 U   ALTER TABLE ONLY "Bank".deposit_directory DROP CONSTRAINT "Deposits_directory_pkey";
       Bank            postgres    false    221            s           2606    17328    employee Employee_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "Bank".employee
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id_employee);
 B   ALTER TABLE ONLY "Bank".employee DROP CONSTRAINT "Employee_pkey";
       Bank            postgres    false    222            \           2606    17330    accruals U_ID_accruals 
   CONSTRAINT     _   ALTER TABLE ONLY "Bank".accruals
    ADD CONSTRAINT "U_ID_accruals" PRIMARY KEY (id_accruals);
 B   ALTER TABLE ONLY "Bank".accruals DROP CONSTRAINT "U_ID_accruals";
       Bank            postgres    false    216            `           2606    17332    client U_ID_client 
   CONSTRAINT     T   ALTER TABLE ONLY "Bank".client
    ADD CONSTRAINT "U_ID_client" UNIQUE (id_client);
 >   ALTER TABLE ONLY "Bank".client DROP CONSTRAINT "U_ID_client";
       Bank            postgres    false    217            u           2606    17334    employee U_ID_emp 
   CONSTRAINT     U   ALTER TABLE ONLY "Bank".employee
    ADD CONSTRAINT "U_ID_emp" UNIQUE (id_employee);
 =   ALTER TABLE ONLY "Bank".employee DROP CONSTRAINT "U_ID_emp";
       Bank            postgres    false    222            j           2606    17336    currency U_code_currency 
   CONSTRAINT     ^   ALTER TABLE ONLY "Bank".currency
    ADD CONSTRAINT "U_code_currency" UNIQUE (currency_code);
 D   ALTER TABLE ONLY "Bank".currency DROP CONSTRAINT "U_code_currency";
       Bank            postgres    false    219            w           2606    17338    job_directory U_code_job 
   CONSTRAINT     Y   ALTER TABLE ONLY "Bank".job_directory
    ADD CONSTRAINT "U_code_job" UNIQUE (code_job);
 D   ALTER TABLE ONLY "Bank".job_directory DROP CONSTRAINT "U_code_job";
       Bank            postgres    false    223            b           2606    17340    credit U_contact_number 
   CONSTRAINT     _   ALTER TABLE ONLY "Bank".credit
    ADD CONSTRAINT "U_contact_number" UNIQUE (contract_number);
 C   ALTER TABLE ONLY "Bank".credit DROP CONSTRAINT "U_contact_number";
       Bank            postgres    false    218            o           2606    17342    deposit U_contrant_number 
   CONSTRAINT     a   ALTER TABLE ONLY "Bank".deposit
    ADD CONSTRAINT "U_contrant_number" UNIQUE (contract_number);
 E   ALTER TABLE ONLY "Bank".deposit DROP CONSTRAINT "U_contrant_number";
       Bank            postgres    false    220            Z           2606    17343 -   payments_timetable actual_date_payments_check    CHECK CONSTRAINT     �   ALTER TABLE "Bank".payments_timetable
    ADD CONSTRAINT actual_date_payments_check CHECK ((actual_date_payments >= planned_data_payment)) NOT VALID;
 R   ALTER TABLE "Bank".payments_timetable DROP CONSTRAINT actual_date_payments_check;
       Bank          postgres    false    225    225    225    225            Y           2606    17344    job_directory check_salary    CHECK CONSTRAINT     m   ALTER TABLE "Bank".job_directory
    ADD CONSTRAINT check_salary CHECK ((salary > '-1'::integer)) NOT VALID;
 ?   ALTER TABLE "Bank".job_directory DROP CONSTRAINT check_salary;
       Bank          postgres    false    223    223            d           2606    17346    credit contract_number 
   CONSTRAINT     a   ALTER TABLE ONLY "Bank".credit
    ADD CONSTRAINT contract_number PRIMARY KEY (contract_number);
 @   ALTER TABLE ONLY "Bank".credit DROP CONSTRAINT contract_number;
       Bank            postgres    false    218            {           2606    17348 &   credit_directory credit_directory_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "Bank".credit_directory
    ADD CONSTRAINT credit_directory_pkey PRIMARY KEY (credit_code);
 P   ALTER TABLE ONLY "Bank".credit_directory DROP CONSTRAINT credit_directory_pkey;
       Bank            postgres    false    224            M           2606    17349    credit current_debtcheck    CHECK CONSTRAINT     f   ALTER TABLE "Bank".credit
    ADD CONSTRAINT current_debtcheck CHECK ((current_debt >= 0)) NOT VALID;
 =   ALTER TABLE "Bank".credit DROP CONSTRAINT current_debtcheck;
       Bank          postgres    false    218    218            P           2606    17350 #   deposit data_deposit_accrual_check1    CHECK CONSTRAINT     x   ALTER TABLE "Bank".deposit
    ADD CONSTRAINT data_deposit_accrual_check1 CHECK ((data_deposit_accrual > 0)) NOT VALID;
 H   ALTER TABLE "Bank".deposit DROP CONSTRAINT data_deposit_accrual_check1;
       Bank          postgres    false    220    220            Q           2606    17351 #   deposit data_deposit_accrual_check2    CHECK CONSTRAINT     y   ALTER TABLE "Bank".deposit
    ADD CONSTRAINT data_deposit_accrual_check2 CHECK ((data_deposit_accrual < 29)) NOT VALID;
 H   ALTER TABLE "Bank".deposit DROP CONSTRAINT data_deposit_accrual_check2;
       Bank          postgres    false    220    220            R           2606    17352    deposit deposit_amount_check    CHECK CONSTRAINT     l   ALTER TABLE "Bank".deposit
    ADD CONSTRAINT deposit_amount_check CHECK ((deposit_amount >= 0)) NOT VALID;
 A   ALTER TABLE "Bank".deposit DROP CONSTRAINT deposit_amount_check;
       Bank          postgres    false    220    220            S           2606    17353    deposit initial_ammount_check    CHECK CONSTRAINT     t   ALTER TABLE "Bank".deposit
    ADD CONSTRAINT initial_ammount_check CHECK ((initial_deposit_amount > 0)) NOT VALID;
 B   ALTER TABLE "Bank".deposit DROP CONSTRAINT initial_ammount_check;
       Bank          postgres    false    220    220            N           2606    17354     credit initial_loan_amountcheck1    CHECK CONSTRAINT     t   ALTER TABLE "Bank".credit
    ADD CONSTRAINT initial_loan_amountcheck1 CHECK ((initial_loan_amount > 0)) NOT VALID;
 E   ALTER TABLE "Bank".credit DROP CONSTRAINT initial_loan_amountcheck1;
       Bank          postgres    false    218    218            y           2606    17356     job_directory job_directory_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY "Bank".job_directory
    ADD CONSTRAINT job_directory_pkey PRIMARY KEY (code_job);
 J   ALTER TABLE ONLY "Bank".job_directory DROP CONSTRAINT job_directory_pkey;
       Bank            postgres    false    223            }           2606    17358 *   payments_timetable payments_timetable_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "Bank".payments_timetable
    ADD CONSTRAINT payments_timetable_pkey PRIMARY KEY ("ID_payments_timetable");
 T   ALTER TABLE ONLY "Bank".payments_timetable DROP CONSTRAINT payments_timetable_pkey;
       Bank            postgres    false    225            O           2606    17362    credit statuscheck1    CHECK CONSTRAINT     �   ALTER TABLE "Bank".credit
    ADD CONSTRAINT statuscheck1 CHECK (((status)::text = ANY (ARRAY[('Active'::character varying)::text, ('Finished'::character varying)::text]))) NOT VALID;
 8   ALTER TABLE "Bank".credit DROP CONSTRAINT statuscheck1;
       Bank          postgres    false    218    218            e           1259    17439    credit_end_dates    INDEX     c   CREATE INDEX credit_end_dates ON "Bank".credit USING btree (loan_date, planned_loan_closing_date);
 $   DROP INDEX "Bank".credit_end_dates;
       Bank            postgres    false    218    218            k           1259    17437    currency_name_idx    INDEX     F   CREATE INDEX currency_name_idx ON "Bank".currency USING btree (name);
 %   DROP INDEX "Bank".currency_name_idx;
       Bank            postgres    false    219            f           1259    17438    loan_date_idx    INDEX     E   CREATE INDEX loan_date_idx ON "Bank".credit USING btree (loan_date);
 !   DROP INDEX "Bank".loan_date_idx;
       Bank            postgres    false    218                       2618    17430    employee_info _RETURN    RULE     �  CREATE OR REPLACE VIEW "Bank".employee_info AS
 SELECT employee.id_employee,
    employee.age,
    employee.code_job,
    employee.paasport_number,
    employee.phone_nimber,
    employee.full_name,
    employee.address,
    count(credit.contract_number) AS num_contracts
   FROM ("Bank".employee
     LEFT JOIN "Bank".credit ON (((employee.id_employee = credit.id_employee) AND (credit.loan_date >= (CURRENT_DATE - '1 mon'::interval)))))
  GROUP BY employee.id_employee;
 u  CREATE OR REPLACE VIEW "Bank".employee_info AS
SELECT
    NULL::integer AS id_employee,
    NULL::smallint AS age,
    NULL::integer AS code_job,
    NULL::character varying(10) AS paasport_number,
    NULL::character varying(20) AS phone_nimber,
    NULL::character varying(50) AS full_name,
    NULL::character varying(100) AS address,
    NULL::bigint AS num_contracts;
       Bank          postgres    false    218    218    4723    222    218    222    222    222    222    222    222    227                       2618    17425    employee_info _RETURN    RULE     �  CREATE OR REPLACE VIEW public.employee_info AS
 SELECT employee.id_employee,
    employee.age,
    employee.code_job,
    employee.paasport_number,
    employee.phone_nimber,
    employee.full_name,
    employee.address,
    count(credit.contract_number) AS num_contracts
   FROM ("Bank".employee
     LEFT JOIN "Bank".credit ON (((employee.id_employee = credit.id_employee) AND (credit.loan_date >= (CURRENT_DATE - '1 mon'::interval)))))
  GROUP BY employee.id_employee;
 u  CREATE OR REPLACE VIEW public.employee_info AS
SELECT
    NULL::integer AS id_employee,
    NULL::smallint AS age,
    NULL::integer AS code_job,
    NULL::character varying(10) AS paasport_number,
    NULL::character varying(20) AS phone_nimber,
    NULL::character varying(50) AS full_name,
    NULL::character varying(100) AS address,
    NULL::bigint AS num_contracts;
       public          postgres    false    222    222    4723    222    222    218    218    218    222    222    222    226            �           2606    17363    employee Employee_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".employee
    ADD CONSTRAINT "Employee_fkey" FOREIGN KEY (code_job) REFERENCES "Bank".job_directory(code_job) NOT VALID;
 B   ALTER TABLE ONLY "Bank".employee DROP CONSTRAINT "Employee_fkey";
       Bank          postgres    false    223    4727    222            �           2606    17368    deposit ID_client_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".deposit
    ADD CONSTRAINT "ID_client_fkey" FOREIGN KEY (id_client) REFERENCES "Bank".client(id_client) NOT VALID;
 B   ALTER TABLE ONLY "Bank".deposit DROP CONSTRAINT "ID_client_fkey";
       Bank          postgres    false    220    217    4704                       2606    17373    credit ID_client_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".credit
    ADD CONSTRAINT "ID_client_fkey" FOREIGN KEY (id_client) REFERENCES "Bank".client(id_client) NOT VALID;
 A   ALTER TABLE ONLY "Bank".credit DROP CONSTRAINT "ID_client_fkey";
       Bank          postgres    false    217    4704    218            �           2606    17378    deposit ID_employee    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".deposit
    ADD CONSTRAINT "ID_employee" FOREIGN KEY (id_employee) REFERENCES "Bank".employee(id_employee) NOT VALID;
 ?   ALTER TABLE ONLY "Bank".deposit DROP CONSTRAINT "ID_employee";
       Bank          postgres    false    222    4723    220            �           2606    17383    credit ID_employee    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".credit
    ADD CONSTRAINT "ID_employee" FOREIGN KEY (id_employee) REFERENCES "Bank".employee(id_employee) NOT VALID;
 >   ALTER TABLE ONLY "Bank".credit DROP CONSTRAINT "ID_employee";
       Bank          postgres    false    4723    222    218            ~           2606    17388    accruals contarct_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".accruals
    ADD CONSTRAINT contarct_number_fkey FOREIGN KEY (contract_number) REFERENCES "Bank".deposit(contract_number) NOT VALID;
 G   ALTER TABLE ONLY "Bank".accruals DROP CONSTRAINT contarct_number_fkey;
       Bank          postgres    false    216    4717    220            �           2606    17393 '   payments_timetable contract_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".payments_timetable
    ADD CONSTRAINT contract_number_fkey FOREIGN KEY (contract_number) REFERENCES "Bank".credit(contract_number) NOT VALID;
 Q   ALTER TABLE ONLY "Bank".payments_timetable DROP CONSTRAINT contract_number_fkey;
       Bank          postgres    false    225    4706    218            �           2606    17398    credit credit_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".credit
    ADD CONSTRAINT credit_code_fkey FOREIGN KEY (credit_code) REFERENCES "Bank".credit_directory(credit_code) NOT VALID;
 A   ALTER TABLE ONLY "Bank".credit DROP CONSTRAINT credit_code_fkey;
       Bank          postgres    false    218    224    4731            �           2606    17403    credit currence_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".credit
    ADD CONSTRAINT currence_code_fkey FOREIGN KEY (currency_code) REFERENCES "Bank".currency(currency_code) NOT VALID;
 C   ALTER TABLE ONLY "Bank".credit DROP CONSTRAINT currence_code_fkey;
       Bank          postgres    false    218    219    4712            �           2606    17408    deposit currency_codefkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".deposit
    ADD CONSTRAINT currency_codefkey FOREIGN KEY (currency_code) REFERENCES "Bank".currency(currency_code) NOT VALID;
 C   ALTER TABLE ONLY "Bank".deposit DROP CONSTRAINT currency_codefkey;
       Bank          postgres    false    219    220    4712            �           2606    17413    deposit deposit_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Bank".deposit
    ADD CONSTRAINT deposit_code_fkey FOREIGN KEY (deposit_code) REFERENCES "Bank".deposit_directory(deposit_code) NOT VALID;
 C   ALTER TABLE ONLY "Bank".deposit DROP CONSTRAINT deposit_code_fkey;
       Bank          postgres    false    220    221    4721               (  x����k�0�ţ����%�f���6A"�vWI��X�k���i�î��><^^�۾��<�Ń���(��*�X��ש��ņ���me�^�J�uq��|R��|���m��(��t���ݧ����cU�0d̡�A��E��d6J�M��,I����=�����*9%��L�GZ�U�����ӏ�5Qjyhߧ�Pk�{&�-�b�׬G&�}-�+NN$|"=-�f�F�k�j�;chp?3-f�5�̎���A��fn�&#��{K�~��AC2J�����ne         D  x�͖�n�0E���A6I ���t��v[�T�n�4X��萢@�qܯ]@P�,h����9�3/���q�x���-^�I*8+j�-iU�J׻� 0� �2ͪʁ2W��?B�
*�LR.�ٮ�|�����շ�no<?��x2uo0�)/`��S���ѣ(zgN�����un�=F�2��Fe)I���?��$�Y\-g[�''���������t���(
�39#0,��4Wa!i�`��E�5�� ��P ����d�vBB_� ��k�`�Ӝ2��J�m�Hd�H� ���y��V-F�a}U���Y/$'��W^����d&�p���֦3ϝ��0c�}�A�C1�'.ZWcF�6�F�:K���W�5�\�yo�F#[��i���-leB[��;B��8ۖ/�+xM1�>��x��$�"O)ls%�x�h�n�����#k:OT��wLM]�ڳ\�Ve�4�����֝��y0&�+:,W��֧>b���`N��A�8�~IY��V�O�x0_���"�`��_J��{5kZ�9;£�4>4ز�>��.�?������,         `  x��_k�0���).}�3�{�vDa�{�4�-�Ƣq�o?�-̇=O�\8��B�q?�m^c��8��#ן�;Q�T��\�����x��Y�u�r#]��g�uD��J�_&��k-Ӿ��ʨv��JDUR�$��Z�4��S�Ki�Ȕ��߉��z�\�"J�MUN�m�7;�x.8S�F�8��}�`�]���b��׷�U��:S�BXG�6��1<EF�>?���n���KD����aܢ�������c�"�-�E<K����-g%����BG:t�3�p�����z�	ۢwS�DF;ds��&Ϯ�6��҆mֈ�t���]�b�w�H���0o����m4��Mc      #   �   x����j�0 �{�B��LY�evj�l5d�X�^��E1[�`;����ц^v�I�-��.?࢑0�(�5[�Ʀ��u���sF{�:]b`0�%��t�詵�Z�;��[�����,k���w�;��W.�JP���� )`+�Kŷ<K��q������2�#�ηo>��:� ���iH��H�u��8��2̲�����6}�c���e���v�6�So�x����jhq^п�Y�6V[         �   x����j1��<���(�֟.��Q����)���$��z#1���7��nJv���8�e����J@o���{i:k557�?ӡ1JgИ���e@x���7u)���AZS����K
9K 8��7��`&��j���#a�W�~�uK_ʜ��n�C���5wC:�e���<��3R�V�}\m�	��#�8�H�]��c��:���ym�]�#�z�\��0�����         P  x���Mo�0�{>���D'����e݆����"
lB#��o?��vI�2�;�6/I~��~��O?�(��	���5n>�=T=��ۦﲼO�a�Zv6�۬I��/mć�������5����gm����)��7TM�W�` �v�����|躲��Ҽ-��VUUN�������y����������g元�}��;��q���n]Y����qy��G.�\�lD��=i֚�۲��P�u�D�-���8�~��o�Ȱ;��h��Fs�1ܮ�ƪ�������re���ip��# �5��G>�jpz%g{"Xd��<U������Lówj|��#xyMe�3��1_�8c~����+K����F4��}q���f�${p��b=ωtf|`�}�x���3��Q�L�R�㡘��^T�;:ĝSp5F'�9,��� �#�H\n�x]H>�{:ѥ8I��Y��|8��y�/�c�B\�	��쇖��)8;�ܛd��f�t�ܛ3�],�G6���šـ.�ܽ.+B_a�P��|9�C���Dm�	l<��|q�K�:��ie[h���W�W��Z�            x�͓=k�0@w��#����ҩu�V$�ݮ�X7m$������\'%^��Zt���{�$U�~�A�Z�쩱�;��;P����O0���`��z�9+ �:F�m�'�k���r��h���o�3xܾ�+�'�*4�4��j�_1�3�=/��h�V��,kXiP�~���!��m�r�:�H�p�(�4��Cַ��G9�L���~xВ�PR�o����0)X���pq�q�|�|�Z�r��?
�d7�(�~ ��Jq      !   \  x�͒Oo�@��~�/h4=��b�J�#Ye[�.�F��o���^{�2��$��L�l���$K�;e��}��Q���E�kL`_�����zg���O�\]�?�A�ϕh��E�\��~,���>�O�o�z�	���FaL����~`�Ai�����&�ҥ�m%�e{&��l�!M`�&�u<� L!I�e�,�;�?�&x60�,�8�(3J��NC��Ps�H
);<����ǔ�Q0���L�X6vA~#�%���Z+:�k�d�xT؍w�6e,�v�R��,�!���B�H���;J�+0*$�\�
0h�j��R����|Ȯ��5�o_���-�YS��c�6�      "     x���OO�0��|�7\��1C`<�	�d�	�^I�VGk�?ɾ��z�b��Ф}��޷-v�-�[�?�W���X)+Ek쀩0�<�=��������I��+0�GA]�I"��t�u;��Q����,-q�@Y�����Q��9��#����]�5��&�߂`�JY����.A���`�������C��R�T`����g�vMk�Ң��w�8�O+�۪^~��u�{��Z(^#�z����`�ɗ�/պ!���o��}��v4�ס\P      $   �   x�Փ=O�0����S���l�TL��T��ֵ��H\T���A���Ln{^��N�ҫ�SJW�;�o��;~6·^p];�jn/��oh�ٵ>P�Mh��[�p�j��m�c�b
���x`}۬�~/����
F
�C�H.3��S�'9�af��R�*�ЦzT��&Q�Ѫ�P��dB2Y�>��I�
~�U�L^�>����'�+>e� }�f%�z��q�Ց��+q�+>9�UG�*I� �V�n     