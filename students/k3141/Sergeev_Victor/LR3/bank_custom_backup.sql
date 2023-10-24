PGDMP                  	    {            Bank    16.0    16.0 G               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16397    Bank    DATABASE     z   CREATE DATABASE "Bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Bank";
                postgres    false                       0    0    DATABASE "Bank"    COMMENT     1   COMMENT ON DATABASE "Bank" IS 'DB_itmo2023 lab';
                   postgres    false    4883                        2615    16398    bankDB    SCHEMA        CREATE SCHEMA "bankDB";
    DROP SCHEMA "bankDB";
                postgres    false            �            1259    16409    Client    TABLE     �   CREATE TABLE "bankDB"."Client" (
    "PassportNumber" bigint NOT NULL,
    "FullName" character varying(50) NOT NULL,
    "Address" character varying(150) NOT NULL,
    "Phone" bigint NOT NULL,
    "E-mail" character varying(30) NOT NULL
);
    DROP TABLE "bankDB"."Client";
       bankDB         heap    postgres    false    6            �            1259    16414    Currency    TABLE     �   CREATE TABLE "bankDB"."Currency" (
    "IdCurrency" integer NOT NULL,
    "Name" character varying(25) NOT NULL,
    "Country" character varying(30) NOT NULL
);
     DROP TABLE "bankDB"."Currency";
       bankDB         heap    postgres    false    6            �            1259    16668    Currency_IdCurrency_seq    SEQUENCE     �   ALTER TABLE "bankDB"."Currency" ALTER COLUMN "IdCurrency" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."Currency_IdCurrency_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 10000
    CACHE 1
);
            bankDB          postgres    false    6    219            �            1259    16442    DepositAgreement    TABLE     g  CREATE TABLE "bankDB"."DepositAgreement" (
    "AgreementNumber" integer NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Description" character varying(200) NOT NULL,
    "DepositDate" date NOT NULL,
    "PaymentDay" integer NOT NULL,
    "FactCloseDate" date,
    "PlanCloseDate" date NOT NULL,
    "Status" character varying(10) DEFAULT 'Open'::character varying NOT NULL,
    "DepositRate" integer NOT NULL,
    "StartSum" integer NOT NULL,
    "SummaryPayment" integer DEFAULT 0 NOT NULL,
    "TabelNumber" integer NOT NULL,
    "PassportNumber" integer NOT NULL,
    "IdCurrency" integer NOT NULL
);
 (   DROP TABLE "bankDB"."DepositAgreement";
       bankDB         heap    postgres    false    6            �            1259    16643 $   DepositAgreement_AgreementNumber_seq    SEQUENCE       ALTER TABLE "bankDB"."DepositAgreement" ALTER COLUMN "AgreementNumber" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."DepositAgreement_AgreementNumber_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
    CYCLE
);
            bankDB          postgres    false    221    6            �            1259    16457    DepositPaySchedule    TABLE     �   CREATE TABLE "bankDB"."DepositPaySchedule" (
    "AgreementNumber" integer NOT NULL,
    "PlanPaymentDate" date NOT NULL,
    "Payment" integer NOT NULL,
    "FactPaymentDate" date
);
 *   DROP TABLE "bankDB"."DepositPaySchedule";
       bankDB         heap    postgres    false    6            �            1259    16399    Employee    TABLE     )  CREATE TABLE "bankDB"."Employee" (
    "TabelNumber" integer NOT NULL,
    "FullName" character varying(50) NOT NULL,
    "PassportNumber" bigint NOT NULL,
    "Age" integer NOT NULL,
    "Phone" bigint NOT NULL,
    "Address" character varying(150) NOT NULL,
    "IdCategory" integer NOT NULL
);
     DROP TABLE "bankDB"."Employee";
       bankDB         heap    postgres    false    6            �            1259    16404    EmployeeCategory    TABLE     �   CREATE TABLE "bankDB"."EmployeeCategory" (
    "IdCategory" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Description" character varying(200) NOT NULL,
    "Salary" integer NOT NULL
);
 (   DROP TABLE "bankDB"."EmployeeCategory";
       bankDB         heap    postgres    false    6            �            1259    16684    EmployeeCategory_IdCategory_seq    SEQUENCE     �   ALTER TABLE "bankDB"."EmployeeCategory" ALTER COLUMN "IdCategory" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."EmployeeCategory_IdCategory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000
    CACHE 1
);
            bankDB          postgres    false    217    6            �            1259    16642    Employee_TabelNumber_seq    SEQUENCE     �   ALTER TABLE "bankDB"."Employee" ALTER COLUMN "TabelNumber" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."Employee_TabelNumber_seq"
    START WITH 100000
    INCREMENT BY 1
    MINVALUE 100000
    MAXVALUE 999999
    CACHE 1
);
            bankDB          postgres    false    216    6            �            1259    16424    LoanAgreement    TABLE     N  CREATE TABLE "bankDB"."LoanAgreement" (
    "AgreementNumber" integer NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Description" character varying(200) NOT NULL,
    "LoanDate" date NOT NULL,
    "PaymentDay" integer NOT NULL,
    "FactCloseDate" date,
    "PlanCloseDate" date NOT NULL,
    "Status" character varying(10) DEFAULT 'Open'::character varying NOT NULL,
    "InterestRate" integer NOT NULL,
    "StartSum" integer NOT NULL,
    "Debt" integer NOT NULL,
    "TabelNumber" integer NOT NULL,
    "PassportNumber" integer NOT NULL,
    "IdCurrency" integer NOT NULL
);
 %   DROP TABLE "bankDB"."LoanAgreement";
       bankDB         heap    postgres    false    6            �            1259    16644 "   LoanAgreeement_AgreementNumber_seq    SEQUENCE        ALTER TABLE "bankDB"."LoanAgreement" ALTER COLUMN "AgreementNumber" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."LoanAgreeement_AgreementNumber_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            bankDB          postgres    false    6    220            �            1259    16452    LoanPaySchedule    TABLE     �   CREATE TABLE "bankDB"."LoanPaySchedule" (
    "AgreementNumber" integer NOT NULL,
    "PlanPaymentDate" date NOT NULL,
    "DebtPayment" integer NOT NULL,
    "InterestPayment" integer NOT NULL,
    "FactPaymentDate" date
);
 '   DROP TABLE "bankDB"."LoanPaySchedule";
       bankDB         heap    postgres    false    6                      0    16409    Client 
   TABLE DATA           `   COPY "bankDB"."Client" ("PassportNumber", "FullName", "Address", "Phone", "E-mail") FROM stdin;
    bankDB          postgres    false    218   �e                 0    16414    Currency 
   TABLE DATA           G   COPY "bankDB"."Currency" ("IdCurrency", "Name", "Country") FROM stdin;
    bankDB          postgres    false    219   k                 0    16442    DepositAgreement 
   TABLE DATA           �   COPY "bankDB"."DepositAgreement" ("AgreementNumber", "Name", "Description", "DepositDate", "PaymentDay", "FactCloseDate", "PlanCloseDate", "Status", "DepositRate", "StartSum", "SummaryPayment", "TabelNumber", "PassportNumber", "IdCurrency") FROM stdin;
    bankDB          postgres    false    221   �k                 0    16457    DepositPaySchedule 
   TABLE DATA           t   COPY "bankDB"."DepositPaySchedule" ("AgreementNumber", "PlanPaymentDate", "Payment", "FactPaymentDate") FROM stdin;
    bankDB          postgres    false    223   �m                 0    16399    Employee 
   TABLE DATA           |   COPY "bankDB"."Employee" ("TabelNumber", "FullName", "PassportNumber", "Age", "Phone", "Address", "IdCategory") FROM stdin;
    bankDB          postgres    false    216   Bp                 0    16404    EmployeeCategory 
   TABLE DATA           ]   COPY "bankDB"."EmployeeCategory" ("IdCategory", "Name", "Description", "Salary") FROM stdin;
    bankDB          postgres    false    217   �s                 0    16424    LoanAgreement 
   TABLE DATA           �   COPY "bankDB"."LoanAgreement" ("AgreementNumber", "Name", "Description", "LoanDate", "PaymentDay", "FactCloseDate", "PlanCloseDate", "Status", "InterestRate", "StartSum", "Debt", "TabelNumber", "PassportNumber", "IdCurrency") FROM stdin;
    bankDB          postgres    false    220   v                 0    16452    LoanPaySchedule 
   TABLE DATA           �   COPY "bankDB"."LoanPaySchedule" ("AgreementNumber", "PlanPaymentDate", "DebtPayment", "InterestPayment", "FactPaymentDate") FROM stdin;
    bankDB          postgres    false    222   Ux                  0    0    Currency_IdCurrency_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"bankDB"."Currency_IdCurrency_seq"', 4, true);
          bankDB          postgres    false    227                       0    0 $   DepositAgreement_AgreementNumber_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"bankDB"."DepositAgreement_AgreementNumber_seq"', 20, true);
          bankDB          postgres    false    225                       0    0    EmployeeCategory_IdCategory_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('"bankDB"."EmployeeCategory_IdCategory_seq"', 4, true);
          bankDB          postgres    false    228                       0    0    Employee_TabelNumber_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"bankDB"."Employee_TabelNumber_seq"', 100020, true);
          bankDB          postgres    false    224                       0    0 "   LoanAgreeement_AgreementNumber_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('"bankDB"."LoanAgreeement_AgreementNumber_seq"', 6, true);
          bankDB          postgres    false    226            b           2606    16484     DepositAgreement AgreementNumber 
   CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT "AgreementNumber" UNIQUE ("AgreementNumber") INCLUDE ("AgreementNumber");
 P   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT "AgreementNumber";
       bankDB            postgres    false    221            X           2606    16647    Client Client_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY "bankDB"."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY ("PassportNumber");
 B   ALTER TABLE ONLY "bankDB"."Client" DROP CONSTRAINT "Client_pkey";
       bankDB            postgres    false    218            Z           2606    16418    Currency Currency_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY "bankDB"."Currency"
    ADD CONSTRAINT "Currency_pkey" PRIMARY KEY ("IdCurrency");
 F   ALTER TABLE ONLY "bankDB"."Currency" DROP CONSTRAINT "Currency_pkey";
       bankDB            postgres    false    219            C           2606    16600    LoanAgreement Debt    CHECK CONSTRAINT     `   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "Debt" CHECK (("Debt" >= 0)) NOT VALID;
 =   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "Debt";
       bankDB          postgres    false    220    220            d           2606    16446 &   DepositAgreement DepositAgreement_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT "DepositAgreement_pkey" PRIMARY KEY ("AgreementNumber");
 V   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT "DepositAgreement_pkey";
       bankDB            postgres    false    221            I           2606    16540    DepositAgreement DepositRate    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "DepositRate" CHECK ((("DepositRate" < 101) AND ("DepositRate" > '-1'::integer))) NOT VALID;
 G   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "DepositRate";
       bankDB          postgres    false    221    221            T           2606    16408 &   EmployeeCategory EmployeeCategory_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "bankDB"."EmployeeCategory"
    ADD CONSTRAINT "EmployeeCategory_pkey" PRIMARY KEY ("IdCategory");
 V   ALTER TABLE ONLY "bankDB"."EmployeeCategory" DROP CONSTRAINT "EmployeeCategory_pkey";
       bankDB            postgres    false    217            P           2606    16403    Employee Employee_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY "bankDB"."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("TabelNumber");
 F   ALTER TABLE ONLY "bankDB"."Employee" DROP CONSTRAINT "Employee_pkey";
       bankDB            postgres    false    216            J           2606    16539    DepositAgreement FactCloseDate    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "FactCloseDate" CHECK (("FactCloseDate" > "DepositDate")) NOT VALID;
 I   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "FactCloseDate";
       bankDB          postgres    false    221    221    221    221            D           2606    16596    LoanAgreement FactCloseDate    CHECK CONSTRAINT     z   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "FactCloseDate" CHECK (("FactCloseDate" > "LoanDate")) NOT VALID;
 F   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "FactCloseDate";
       bankDB          postgres    false    220    220    220    220            E           2606    16598    LoanAgreement InterestRate    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "InterestRate" CHECK ((("InterestRate" < 101) AND ("InterestRate" > '-1'::integer))) NOT VALID;
 E   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "InterestRate";
       bankDB          postgres    false    220    220            ^           2606    16428 !   LoanAgreement LoanAgreeement_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT "LoanAgreeement_pkey" PRIMARY KEY ("AgreementNumber");
 Q   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT "LoanAgreeement_pkey";
       bankDB            postgres    false    220            f           2606    16456 #   LoanPaySchedule LoanPayShedule_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanPaySchedule"
    ADD CONSTRAINT "LoanPayShedule_pkey" PRIMARY KEY ("AgreementNumber", "PlanPaymentDate");
 S   ALTER TABLE ONLY "bankDB"."LoanPaySchedule" DROP CONSTRAINT "LoanPayShedule_pkey";
       bankDB            postgres    false    222    222            F           2606    16595    LoanAgreement PaymentDay    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "PaymentDay" CHECK ((("PaymentDay" < 28) AND ("PaymentDay" > 0))) NOT VALID;
 C   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "PaymentDay";
       bankDB          postgres    false    220    220            K           2606    16541    DepositAgreement StartSum    CHECK CONSTRAINT     j   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "StartSum" CHECK (("StartSum" > 0)) NOT VALID;
 D   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "StartSum";
       bankDB          postgres    false    221    221            G           2606    16599    LoanAgreement StartSum    CHECK CONSTRAINT     g   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "StartSum" CHECK (("StartSum" > 0)) NOT VALID;
 A   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "StartSum";
       bankDB          postgres    false    220    220            L           2606    16542    DepositAgreement Status    CHECK CONSTRAINT     y   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "Status" CHECK ((("Status")::text = 'Open'::text)) NOT VALID;
 B   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "Status";
       bankDB          postgres    false    221    221            H           2606    16597    LoanAgreement Status    CHECK CONSTRAINT     v   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "Status" CHECK ((("Status")::text = 'Open'::text)) NOT VALID;
 ?   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "Status";
       bankDB          postgres    false    220    220            M           2606    16543    DepositAgreement SummaryPayment    CHECK CONSTRAINT     w   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "SummaryPayment" CHECK (("SummaryPayment" >= 0)) NOT VALID;
 J   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "SummaryPayment";
       bankDB          postgres    false    221    221            R           2606    16465    Employee TabelNumber 
   CONSTRAINT     ^   ALTER TABLE ONLY "bankDB"."Employee"
    ADD CONSTRAINT "TabelNumber" UNIQUE ("TabelNumber");
 D   ALTER TABLE ONLY "bankDB"."Employee" DROP CONSTRAINT "TabelNumber";
       bankDB            postgres    false    216            `           2606    16579 #   LoanAgreement agreement_loan_number 
   CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT agreement_loan_number UNIQUE ("AgreementNumber") INCLUDE ("AgreementNumber");
 Q   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT agreement_loan_number;
       bankDB            postgres    false    220            V           2606    16479    EmployeeCategory category_id 
   CONSTRAINT     z   ALTER TABLE ONLY "bankDB"."EmployeeCategory"
    ADD CONSTRAINT category_id UNIQUE ("IdCategory") INCLUDE ("IdCategory");
 J   ALTER TABLE ONLY "bankDB"."EmployeeCategory" DROP CONSTRAINT category_id;
       bankDB            postgres    false    217            \           2606    16482    Currency currenct_id 
   CONSTRAINT     r   ALTER TABLE ONLY "bankDB"."Currency"
    ADD CONSTRAINT currenct_id UNIQUE ("IdCurrency") INCLUDE ("IdCurrency");
 B   ALTER TABLE ONLY "bankDB"."Currency" DROP CONSTRAINT currenct_id;
       bankDB            postgres    false    219            h           2606    16697 &   DepositPaySchedule date_agreement_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositPaySchedule"
    ADD CONSTRAINT date_agreement_pkey PRIMARY KEY ("AgreementNumber", "PlanPaymentDate") INCLUDE ("AgreementNumber", "PlanPaymentDate");
 T   ALTER TABLE ONLY "bankDB"."DepositPaySchedule" DROP CONSTRAINT date_agreement_pkey;
       bankDB            postgres    false    223    223            A           2606    16667    Client valid_passport    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."Client"
    ADD CONSTRAINT valid_passport CHECK ((("PassportNumber" < '9999999999'::bigint) AND ("PassportNumber" > (9999999)::bigint))) NOT VALID;
 >   ALTER TABLE "bankDB"."Client" DROP CONSTRAINT valid_passport;
       bankDB          postgres    false    218    218            >           2606    16682    Employee valid_passport    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."Employee"
    ADD CONSTRAINT valid_passport CHECK ((("PassportNumber" < '9999999999'::bigint) AND ("PassportNumber" > (999999)::bigint))) NOT VALID;
 @   ALTER TABLE "bankDB"."Employee" DROP CONSTRAINT valid_passport;
       bankDB          postgres    false    216    216            N           2606    16687    DepositAgreement valid_payment    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT valid_payment CHECK ((("PaymentDay" < 29) AND ("PaymentDay" > 0))) NOT VALID;
 G   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT valid_payment;
       bankDB          postgres    false    221    221            B           2606    16666    Client valid_phone    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."Client"
    ADD CONSTRAINT valid_phone CHECK ((("Phone" < '999999999999'::bigint) AND ("Phone" > (999999999)::bigint))) NOT VALID;
 ;   ALTER TABLE "bankDB"."Client" DROP CONSTRAINT valid_phone;
       bankDB          postgres    false    218    218            ?           2606    16683    Employee valid_phone    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."Employee"
    ADD CONSTRAINT valid_phone CHECK ((("Phone" < '999999999999'::bigint) AND ("Phone" > '9999999999'::bigint))) NOT VALID;
 =   ALTER TABLE "bankDB"."Employee" DROP CONSTRAINT valid_phone;
       bankDB          postgres    false    216    216            @           2606    16480    EmployeeCategory valid_salary    CHECK CONSTRAINT     j   ALTER TABLE "bankDB"."EmployeeCategory"
    ADD CONSTRAINT valid_salary CHECK (("Salary" > 0)) NOT VALID;
 F   ALTER TABLE "bankDB"."EmployeeCategory" DROP CONSTRAINT valid_salary;
       bankDB          postgres    false    217    217            p           2606    16631 #   LoanPaySchedule agreement_number_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanPaySchedule"
    ADD CONSTRAINT agreement_number_fk FOREIGN KEY ("AgreementNumber") REFERENCES "bankDB"."LoanAgreement"("AgreementNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 Q   ALTER TABLE ONLY "bankDB"."LoanPaySchedule" DROP CONSTRAINT agreement_number_fk;
       bankDB          postgres    false    4702    220    222            q           2606    16691 &   DepositPaySchedule agreement_number_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositPaySchedule"
    ADD CONSTRAINT agreement_number_fk FOREIGN KEY ("AgreementNumber") REFERENCES "bankDB"."DepositAgreement"("AgreementNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 T   ALTER TABLE ONLY "bankDB"."DepositPaySchedule" DROP CONSTRAINT agreement_number_fk;
       bankDB          postgres    false    4708    221    223            j           2606    16653     LoanAgreement cliend_passport_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT cliend_passport_fk FOREIGN KEY ("PassportNumber") REFERENCES "bankDB"."Client"("PassportNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT cliend_passport_fk;
       bankDB          postgres    false    4696    218    220            m           2606    16648 #   DepositAgreement client_passport_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT client_passport_fk FOREIGN KEY ("PassportNumber") REFERENCES "bankDB"."Client"("PassportNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 Q   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT client_passport_fk;
       bankDB          postgres    false    4696    221    218            k           2606    16590    LoanAgreement currenct_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT currenct_id_fk FOREIGN KEY ("IdCurrency") REFERENCES "bankDB"."Currency"("IdCurrency") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 J   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT currenct_id_fk;
       bankDB          postgres    false    4698    220    219            n           2606    16533    DepositAgreement currency_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT currency_id_fk FOREIGN KEY ("IdCurrency") REFERENCES "bankDB"."Currency"("IdCurrency") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT currency_id_fk;
       bankDB          postgres    false    219    4698    221            i           2606    16473    Employee employee_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."Employee"
    ADD CONSTRAINT employee_id_fk FOREIGN KEY ("IdCategory") REFERENCES "bankDB"."EmployeeCategory"("IdCategory") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 E   ALTER TABLE ONLY "bankDB"."Employee" DROP CONSTRAINT employee_id_fk;
       bankDB          postgres    false    4692    216    217            o           2606    16523 "   DepositAgreement employee_tabel_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT employee_tabel_fk FOREIGN KEY ("TabelNumber") REFERENCES "bankDB"."Employee"("TabelNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 P   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT employee_tabel_fk;
       bankDB          postgres    false    221    216    4688            l           2606    16580    LoanAgreement employee_tabel_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT employee_tabel_fk FOREIGN KEY ("TabelNumber") REFERENCES "bankDB"."Employee"("TabelNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT employee_tabel_fk;
       bankDB          postgres    false    216    220    4688               4  x�}V�nG}nE?&��k_��!�PO����3J��%�H �8�<ь=ao�P�G9��g<&$�vuMչ�sn[/=w��$��v��P�i8�P��a8e�Ku�z�?��j'��I|{�$LW������p���V^�I�V[�����O��p����TJ��L�����Q�����2�֮w���r��.qm-Z�$���6@���Q��qK;tj��p�kN#�I���s`xVmW;t?n���:�+g��c`�N��s�ͭ�`l$�80"�)�~6�;��]��f��Sv�(�R*/M��c��	(Fa����AU%=�/�����=�B�����_��8V;�7���"%޹ZN�d^��:˙���l�[�73��;Y?/z���h��ҿ��ULZ�t�f]�#>��9��4H�m�x��[�o����~�EMP\�X��JFp��� Q9��^��މdP��N1�hu�v�՜1��}�� ��-N>�� �w��
�C�n�@E��������	�9��t��SƨlJ�J�#H!(�y��0f�RBۤ�wZ��n~�Fk��Ϻ�V��[���$���u[�����y��oY��Ϩ�{WPDIz	��>�A{x��zԈ3�\�˩S�(�X��qL9ɒ|�o}�-�0�N"{�/L��>�^�\�`&��������߄�h��Y�v�����{��p�cĮ��k�uIц>��p�Un�:m�dԉ�o��ó��9�a�KG�S��B��P*�&��HzG��T慙dZ��J��Y)��`�x%+Ŷ�E;������$�2�k.X��O�,#{��Cz|E8�ytPmQ0b_�_@#q���Ɍ|�� �s䂐kƐX�cVi�l�&i������]r-�L
�F+�@����u���F.�qR�(^{<����ZF�q>m�k����9Hg�K�<��[���
� j{�p�[�|�]͍g��/pR$L����k�-`܏�P�b}]9]�_���)V�@�LPN{
�dX���9��(6�ՖsŌB���)�c��8)	f8B�ǳ(8��f��ػ���}��M�GeD�'4�p�5`�Q́D��	�Y���Y_�K�8�̼�P/��H����+�礎أh�Z�{�������l�1V3}ϯ�UZt��`J���{��6� <[���U�\h9�f���ڏM;��?D�KpAza���a3�h��o�y�>j
+/lOg=74���E3���&]fV�(�Z�!=�_7Ө��M��x�HrU=���܊�c�=�)�/�ۯ���i$`y�>6���p��_�@���"߭,--�9�         �   x�M�M
�@���)��?��0m�
���
.\N+�ڡ����TA$���{����l���<�O�Z;Б������&����+w���
������;��q�U��*'���<����a�s8�):^>�W����i�         B  x��Kn�0���)x"��y���v[�����EE7m/�(r-˖|����P��7p #�pf��G͘R����:���&��^�O:�Va������&<谡-۩��54RC5�w��t��HG�����!��\�[��G	Fh/^��~M��E�wTkVD{l�����5�ZqyA�ۘ>�6t��~���H�O�f6O�*���������w�S&�?���ʗ�(l�reS)H=B��z@W�Ý\�����2#��ŷ��M���m�)^a�'��a�x����)�g`������+	�H�_c�b0>θp��; ���h�9��,S�b�	O9��l:󁗱y���W��]�f�����a�c���~r�ۢ����$f�������a�:�so�������e-#=�/�r"�GW�݁&��k�%�F��.=�q]=w�G���{���o���w���L�r�#�c�=Md�S�1�QԌ�L�R��N]���/Еʔ�[���+G���)[�щaFg��]��;�t� ��J�K1��=z1L��:���۪ʁ�HnI���d=         K  x�]�[�� ��d/w
=�M�
���1�-=�S�A-lG�M�������������	烳�(���Ef�����U9�A������A��ۑ�����i�Qgh
�BǥOWK�))jE�Ԡ��$h�%��-�6I;�xg�r�N�U:龕�)�V9����9XNҪ�J�\�9�=��9x�j����B�9����y���^2{#5�d��ڄ5�ƚ�`���V�)��Q�uMh��@#HZ3��.�����Ԡ���A�I���I݊L�����.|�`��E6���7�C��J�UW�s����37_�E�vh��ƙ��ތtBMo]�]��B��y)���iaE��A�ա]I:Y�Cܽ��!�I�CD�"�����C��gn�:}��m�_;��C��V�HR��� E��,v=��<s��|"R�*�B�R�m��VmR�&�C�$�`�G�5���3�ܖ�{}��-5��r��f�3��5�y�4��c�`}�V��E��	)rp1R�����-I��;�9x6R���Y���K߬�N�ƭ+���*P$�U�ƥ8;K��j���,����ho�	����?���^W֚         :  x�e�Mr1���)��*�����p��*T%T�;&N�8v�к����{ƖZ_��ZZ)����2+sZ҆Vt'�_kږmiA��J��rB��Q�?	SR�zፈ/Ay��(��|*�/������g=��5���)k���]y��N��r"�v*sr�MN	{���,G�K7��a?�i�W��ǿ#�0^�����O!)�������rU^R/� f�xӧ8��+��i���kP~"s��*������U9�V���nص�N�G<�^�VHD i��&�h�|�������g��P�b���Ӧ��ӆ�%�[fSi��Jp���JN���VD�[�{C�#A5�J�i��Fג�)E���C���դ9� G��j{;�p�G� ՜��
������s�-38�@@���I�+z��9�l��k��[I�r,9��-r�9��w�i���tW��4B�&2F�}�a��,�ҞL�~Q���{P9��N�sH5��:}C�{���=3�Q}�0a�{22�<��d��N�����=��j�����ur�]�,z�MZ���F�]D7�ȃ�4�f�����x�G�|޳�0B)���J�M6
�k@ҏa��2�R5s����+&!����+�
P0!�x�6s,������;�R�r߻4�"��S)�����M8��1�-���mOa�O*;�b)m��V/뀬���wק�q��|�ܡU�C��j���M��.8��M9���E$��d�)�6H�W��1�]ag����@m��O��;�|���9�#!&h"�S�g��lzpp�g��         �  x�mT�n�P<;_�~�(@��.�k?"NJS�
Kq@P�W'�ǉ�_��G�̾�J��X�������{]ؽ=Z�Vǅ�q>}��zo��!.xlc��[]ط��k��x�-�G;�;��v`�+�c,��_�5��:"�q�\u,��611 /#�GDt<�%$l�KO��� )]�'0����e �D�@�<E	P���Up�y!�
��#9�q�s�x��yL�A�b&*sr(�q-�G^ w���A�T
7��Ż�l6yS�/Z�_c{6BQK������ �?��`q����Ln����-0��|�W���`�wy�g��h�����:��Ԓ ���c��5��;xܹ� �����k�p����//d�!�匥�߃����-�If½Ŀ&� ��x?��o{`�*l��S{U1B[ɒH�������J�}�R{S�!a���ej�������.z٪��NT�^��Z�9f��x���|@4u^i�h��:�H�F���Z�FK�T^�uʰ�с]��zZ\ʰ�f�4b{�U����p0p�F��Q�M�|�^�� �.mNi��xVys|�Tq̕�K��n���%0B�6/a�3o���ƔZ�6~yڎ|M�y�8u]�/�;i�j\��W=_����`�Tq��|�N&����         &  x��Mn�0���)t$EI�%�d�m�#�N�H��]tQ(�0�;��^ax���'(�xa�|�����E?��'|��+=�)^ѣ�[G:�>����x���iK!mi����t?S���<@Ǚ���y|��]�� 䁸�鷨wO!9�~@��z$
q9��h��%�!՞�r&4��GlN�7��=v92]�t�㚺��BYm�B��jժ�W�����wo�*�L��ӂ/S)c�Z����ͬ�o�}��&pS1�Q���R����"p�t�#�&r}\R^7x~�G���x11�����?J�C;����"��-l�l3A�T�z�(�E�4�j�q�vN��<�qj
k�13=�y�i��3z�u�m+S*��3����s�'�@�z�fo�W��ԭ.}�ʬ:sxea���0³��K��s�2�8�1�.����Qb9��B����f7c9���F��@��T���S�k�"���F�y���`NAވ����5��"�ʮO\���r���� 2��_���a2�g�s� �O�PiP�ڦ�Mk���,��0�'X         �  x�U�ۍ�0��L/��T[��_�ڑM^�|�꒖E^,���?�Z��?��TkPB��܉��@��" ��Q.Q��r�����
��W���A��YiBg�����!tV2���x��Y� dŤ�s�BV�f������զ�;Da���DH�H�"���:�q��h�FY(ڒI("��-�� �(��i(D��ĝbt&�SLNw��Fp��kd3
�&�W��Vȍ�P 7ڎ��
�a�Fo�:J�>n׳O�e�,\s%��vG�f.�Ȃ�|�	����4Fj8��a1�\�@�ǣ�΃.5����4 �R��sن�;�7�JV �
vA謘6Bg��2R�X ��Ye���~#Ԛ���׺������"��A��t��5W �A
$>Ȁx��H�� �YF�Yd�Ga�"0�5`�%���u�1�i��t��dV �� FoQwz����c]���k�3��x���+B��-|.<���
m�W"X�ݸW�c�w�JVW}��}.=�c�@�W��п@�С�	Bg�:2�D�����5����C�z���޹Fa�u��YQ&�ˎ�Y�Sջ����_]b��r��V����3|�.���/����s���q�8!	�a���K;�Z⼤�;����D��Fɱ�[~�������U
     