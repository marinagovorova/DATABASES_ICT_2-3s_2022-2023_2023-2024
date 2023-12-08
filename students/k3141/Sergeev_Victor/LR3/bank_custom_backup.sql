PGDMP                  	    {            Bank    16.0    16.0 [    .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    16397    Bank    DATABASE     z   CREATE DATABASE "Bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Bank";
                postgres    false            2           0    0    DATABASE "Bank"    COMMENT     1   COMMENT ON DATABASE "Bank" IS 'DB_itmo2023 lab';
                   postgres    false    4913                        2615    16398    bankDB    SCHEMA        CREATE SCHEMA "bankDB";
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
            bankDB          postgres    false    6    219            �            1259    16820    DepositPaySchedule    TABLE     �   CREATE TABLE "bankDB"."DepositPaySchedule" (
    "Id" bigint NOT NULL,
    "AgreementNumber" integer NOT NULL,
    "PlanPaymentDate" date NOT NULL,
    "Payment" real NOT NULL,
    "FactPaymentDate" date
);
 *   DROP TABLE "bankDB"."DepositPaySchedule";
       bankDB         heap    postgres    false    6            �            1259    16830    DeposinPaySchedule_Id_seq    SEQUENCE     �   ALTER TABLE "bankDB"."DepositPaySchedule" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."DeposinPaySchedule_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999
    CACHE 1
);
            bankDB          postgres    false    227    6            �            1259    16442    DepositAgreement    TABLE       CREATE TABLE "bankDB"."DepositAgreement" (
    "AgreementNumber" integer NOT NULL,
    "DepositDate" date NOT NULL,
    "PaymentDay" integer NOT NULL,
    "FactCloseDate" date,
    "PlanCloseDate" date NOT NULL,
    "Status" character varying(10) DEFAULT 'Open'::character varying NOT NULL,
    "StartSum" real NOT NULL,
    "SummaryPayment" real DEFAULT 0 NOT NULL,
    "TabelNumber" integer NOT NULL,
    "PassportNumber" integer NOT NULL,
    "IdCurrency" integer NOT NULL,
    "IdType" integer DEFAULT 0 NOT NULL
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
            bankDB          postgres    false    221    6            �            1259    16856    DepositType    TABLE       CREATE TABLE "bankDB"."DepositType" (
    "Id" integer NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Description" character varying(200) NOT NULL,
    "Rate" real NOT NULL,
    "MinStartSum" real NOT NULL,
    "MaxStartSum" real NOT NULL,
    "Term" integer NOT NULL
);
 #   DROP TABLE "bankDB"."DepositType";
       bankDB         heap    postgres    false    6            �            1259    16910    DepositType_Id_seq    SEQUENCE     �   ALTER TABLE "bankDB"."DepositType" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."DepositType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1
);
            bankDB          postgres    false    6    232            �            1259    16399    Employee    TABLE     )  CREATE TABLE "bankDB"."Employee" (
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
            bankDB          postgres    false    6    217            �            1259    16642    Employee_TabelNumber_seq    SEQUENCE     �   ALTER TABLE "bankDB"."Employee" ALTER COLUMN "TabelNumber" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."Employee_TabelNumber_seq"
    START WITH 100000
    INCREMENT BY 1
    MINVALUE 100000
    MAXVALUE 999999
    CACHE 1
);
            bankDB          postgres    false    216    6            �            1259    16424    LoanAgreement    TABLE     �  CREATE TABLE "bankDB"."LoanAgreement" (
    "AgreementNumber" integer NOT NULL,
    "LoanDate" date NOT NULL,
    "PaymentDay" integer NOT NULL,
    "FactCloseDate" date,
    "PlanCloseDate" date NOT NULL,
    "Status" character varying(10) DEFAULT 'Open'::character varying NOT NULL,
    "StartSum" real NOT NULL,
    "Debt" real NOT NULL,
    "TabelNumber" integer NOT NULL,
    "PassportNumber" integer NOT NULL,
    "IdCurrency" integer NOT NULL,
    "TypeId" integer DEFAULT 0 NOT NULL
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
            bankDB          postgres    false    220    6            �            1259    16834    LoanPaySchedule    TABLE     �   CREATE TABLE "bankDB"."LoanPaySchedule" (
    "Id" bigint NOT NULL,
    "AgreementNumber" integer NOT NULL,
    "PlanPaymentDate" date NOT NULL,
    "DebtPayment" real NOT NULL,
    "InterestPayment" real NOT NULL,
    "FactPaymentDay" date
);
 '   DROP TABLE "bankDB"."LoanPaySchedule";
       bankDB         heap    postgres    false    6            �            1259    16844    LoanPaySchedule_Id_seq    SEQUENCE     �   ALTER TABLE "bankDB"."LoanPaySchedule" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."LoanPaySchedule_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1
);
            bankDB          postgres    false    6    229            �            1259    16845    LoanType    TABLE       CREATE TABLE "bankDB"."LoanType" (
    "Id" integer NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Description" character varying(200) NOT NULL,
    "Rate" real NOT NULL,
    "MinStartSum" real NOT NULL,
    "MaxStartSum" real NOT NULL,
    "Term" integer NOT NULL
);
     DROP TABLE "bankDB"."LoanType";
       bankDB         heap    postgres    false    6            �            1259    16911    LoanType_Id_seq    SEQUENCE     �   ALTER TABLE "bankDB"."LoanType" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "bankDB"."LoanType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1
);
            bankDB          postgres    false    231    6                      0    16409    Client 
   TABLE DATA                 bankDB          postgres    false    218   �y                 0    16414    Currency 
   TABLE DATA                 bankDB          postgres    false    219   P                 0    16442    DepositAgreement 
   TABLE DATA                 bankDB          postgres    false    221   7�       $          0    16820    DepositPaySchedule 
   TABLE DATA                 bankDB          postgres    false    227   f�       )          0    16856    DepositType 
   TABLE DATA                 bankDB          postgres    false    232   ��                 0    16399    Employee 
   TABLE DATA                 bankDB          postgres    false    216   ��                 0    16404    EmployeeCategory 
   TABLE DATA                 bankDB          postgres    false    217   ��                 0    16424    LoanAgreement 
   TABLE DATA                 bankDB          postgres    false    220   ��       &          0    16834    LoanPaySchedule 
   TABLE DATA                 bankDB          postgres    false    229   ��       (          0    16845    LoanType 
   TABLE DATA                 bankDB          postgres    false    231   B�       3           0    0    Currency_IdCurrency_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"bankDB"."Currency_IdCurrency_seq"', 4, true);
          bankDB          postgres    false    225            4           0    0    DeposinPaySchedule_Id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"bankDB"."DeposinPaySchedule_Id_seq"', 482, true);
          bankDB          postgres    false    228            5           0    0 $   DepositAgreement_AgreementNumber_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"bankDB"."DepositAgreement_AgreementNumber_seq"', 26, true);
          bankDB          postgres    false    223            6           0    0    DepositType_Id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"bankDB"."DepositType_Id_seq"', 3, true);
          bankDB          postgres    false    233            7           0    0    EmployeeCategory_IdCategory_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('"bankDB"."EmployeeCategory_IdCategory_seq"', 4, true);
          bankDB          postgres    false    226            8           0    0    Employee_TabelNumber_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"bankDB"."Employee_TabelNumber_seq"', 100020, true);
          bankDB          postgres    false    222            9           0    0 "   LoanAgreeement_AgreementNumber_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"bankDB"."LoanAgreeement_AgreementNumber_seq"', 12, true);
          bankDB          postgres    false    224            :           0    0    LoanPaySchedule_Id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"bankDB"."LoanPaySchedule_Id_seq"', 396, true);
          bankDB          postgres    false    230            ;           0    0    LoanType_Id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"bankDB"."LoanType_Id_seq"', 6, true);
          bankDB          postgres    false    234            t           2606    16484     DepositAgreement AgreementNumber 
   CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT "AgreementNumber" UNIQUE ("AgreementNumber") INCLUDE ("AgreementNumber");
 P   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT "AgreementNumber";
       bankDB            postgres    false    221            j           2606    16647    Client Client_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY "bankDB"."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY ("PassportNumber");
 B   ALTER TABLE ONLY "bankDB"."Client" DROP CONSTRAINT "Client_pkey";
       bankDB            postgres    false    218            l           2606    16418    Currency Currency_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY "bankDB"."Currency"
    ADD CONSTRAINT "Currency_pkey" PRIMARY KEY ("IdCurrency");
 F   ALTER TABLE ONLY "bankDB"."Currency" DROP CONSTRAINT "Currency_pkey";
       bankDB            postgres    false    219            Q           2606    16867    LoanAgreement Debt    CHECK CONSTRAINT     t   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "Debt" CHECK (("Debt" >= (0)::double precision)) NOT VALID;
 =   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "Debt";
       bankDB          postgres    false    220    220            v           2606    16446 &   DepositAgreement DepositAgreement_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT "DepositAgreement_pkey" PRIMARY KEY ("AgreementNumber");
 V   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT "DepositAgreement_pkey";
       bankDB            postgres    false    221            f           2606    16408 &   EmployeeCategory EmployeeCategory_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "bankDB"."EmployeeCategory"
    ADD CONSTRAINT "EmployeeCategory_pkey" PRIMARY KEY ("IdCategory");
 V   ALTER TABLE ONLY "bankDB"."EmployeeCategory" DROP CONSTRAINT "EmployeeCategory_pkey";
       bankDB            postgres    false    217            b           2606    16403    Employee Employee_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY "bankDB"."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("TabelNumber");
 F   ALTER TABLE ONLY "bankDB"."Employee" DROP CONSTRAINT "Employee_pkey";
       bankDB            postgres    false    216            V           2606    16539    DepositAgreement FactCloseDate    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "FactCloseDate" CHECK (("FactCloseDate" > "DepositDate")) NOT VALID;
 I   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "FactCloseDate";
       bankDB          postgres    false    221    221    221    221            R           2606    16596    LoanAgreement FactCloseDate    CHECK CONSTRAINT     z   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "FactCloseDate" CHECK (("FactCloseDate" > "LoanDate")) NOT VALID;
 F   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "FactCloseDate";
       bankDB          postgres    false    220    220    220    220            p           2606    16428 !   LoanAgreement LoanAgreeement_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT "LoanAgreeement_pkey" PRIMARY KEY ("AgreementNumber");
 Q   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT "LoanAgreeement_pkey";
       bankDB            postgres    false    220            S           2606    16595    LoanAgreement PaymentDay    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "PaymentDay" CHECK ((("PaymentDay" < 28) AND ("PaymentDay" > 0))) NOT VALID;
 C   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "PaymentDay";
       bankDB          postgres    false    220    220            T           2606    16873    LoanAgreement StartSum    CHECK CONSTRAINT     {   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "StartSum" CHECK (("StartSum" > (0)::double precision)) NOT VALID;
 A   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "StartSum";
       bankDB          postgres    false    220    220            W           2606    16887    DepositAgreement StartSum    CHECK CONSTRAINT     ~   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "StartSum" CHECK (("StartSum" > (0)::double precision)) NOT VALID;
 D   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "StartSum";
       bankDB          postgres    false    221    221            X           2606    16542    DepositAgreement Status    CHECK CONSTRAINT     y   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "Status" CHECK ((("Status")::text = 'Open'::text)) NOT VALID;
 B   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "Status";
       bankDB          postgres    false    221    221            U           2606    16597    LoanAgreement Status    CHECK CONSTRAINT     v   ALTER TABLE "bankDB"."LoanAgreement"
    ADD CONSTRAINT "Status" CHECK ((("Status")::text = 'Open'::text)) NOT VALID;
 ?   ALTER TABLE "bankDB"."LoanAgreement" DROP CONSTRAINT "Status";
       bankDB          postgres    false    220    220            Y           2606    16894    DepositAgreement SummaryPayment    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT "SummaryPayment" CHECK (("SummaryPayment" >= (0)::double precision)) NOT VALID;
 J   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT "SummaryPayment";
       bankDB          postgres    false    221    221            d           2606    16465    Employee TabelNumber 
   CONSTRAINT     ^   ALTER TABLE ONLY "bankDB"."Employee"
    ADD CONSTRAINT "TabelNumber" UNIQUE ("TabelNumber");
 D   ALTER TABLE ONLY "bankDB"."Employee" DROP CONSTRAINT "TabelNumber";
       bankDB            postgres    false    216            r           2606    16579 #   LoanAgreement agreement_loan_number 
   CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT agreement_loan_number UNIQUE ("AgreementNumber") INCLUDE ("AgreementNumber");
 Q   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT agreement_loan_number;
       bankDB            postgres    false    220            h           2606    16479    EmployeeCategory category_id 
   CONSTRAINT     z   ALTER TABLE ONLY "bankDB"."EmployeeCategory"
    ADD CONSTRAINT category_id UNIQUE ("IdCategory") INCLUDE ("IdCategory");
 J   ALTER TABLE ONLY "bankDB"."EmployeeCategory" DROP CONSTRAINT category_id;
       bankDB            postgres    false    217            n           2606    16482    Currency currenct_id 
   CONSTRAINT     r   ALTER TABLE ONLY "bankDB"."Currency"
    ADD CONSTRAINT currenct_id UNIQUE ("IdCurrency") INCLUDE ("IdCurrency");
 B   ALTER TABLE ONLY "bankDB"."Currency" DROP CONSTRAINT currenct_id;
       bankDB            postgres    false    219            ~           2606    16860     DepositType deposit_type_id_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY "bankDB"."DepositType"
    ADD CONSTRAINT deposit_type_id_pkey PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY "bankDB"."DepositType" DROP CONSTRAINT deposit_type_id_pkey;
       bankDB            postgres    false    232            |           2606    16849    LoanType id_loan_type_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "bankDB"."LoanType"
    ADD CONSTRAINT id_loan_type_pkey PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY "bankDB"."LoanType" DROP CONSTRAINT id_loan_type_pkey;
       bankDB            postgres    false    231            x           2606    16824    DepositPaySchedule id_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "bankDB"."DepositPaySchedule"
    ADD CONSTRAINT id_pkey PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY "bankDB"."DepositPaySchedule" DROP CONSTRAINT id_pkey;
       bankDB            postgres    false    227            z           2606    16838 $   LoanPaySchedule loanSchedule_id_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY "bankDB"."LoanPaySchedule"
    ADD CONSTRAINT "loanSchedule_id_pkey" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY "bankDB"."LoanPaySchedule" DROP CONSTRAINT "loanSchedule_id_pkey";
       bankDB            postgres    false    229            ^           2606    16905    DepositType valid_min    CHECK CONSTRAINT     {   ALTER TABLE "bankDB"."DepositType"
    ADD CONSTRAINT valid_min CHECK (("MinStartSum" > (0)::double precision)) NOT VALID;
 >   ALTER TABLE "bankDB"."DepositType" DROP CONSTRAINT valid_min;
       bankDB          postgres    false    232    232            [           2606    16908    LoanType valid_min    CHECK CONSTRAINT     x   ALTER TABLE "bankDB"."LoanType"
    ADD CONSTRAINT valid_min CHECK (("MinStartSum" > (0)::double precision)) NOT VALID;
 ;   ALTER TABLE "bankDB"."LoanType" DROP CONSTRAINT valid_min;
       bankDB          postgres    false    231    231            O           2606    16667    Client valid_passport    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."Client"
    ADD CONSTRAINT valid_passport CHECK ((("PassportNumber" < '9999999999'::bigint) AND ("PassportNumber" > (9999999)::bigint))) NOT VALID;
 >   ALTER TABLE "bankDB"."Client" DROP CONSTRAINT valid_passport;
       bankDB          postgres    false    218    218            L           2606    16682    Employee valid_passport    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."Employee"
    ADD CONSTRAINT valid_passport CHECK ((("PassportNumber" < '9999999999'::bigint) AND ("PassportNumber" > (999999)::bigint))) NOT VALID;
 @   ALTER TABLE "bankDB"."Employee" DROP CONSTRAINT valid_passport;
       bankDB          postgres    false    216    216            Z           2606    16687    DepositAgreement valid_payment    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."DepositAgreement"
    ADD CONSTRAINT valid_payment CHECK ((("PaymentDay" < 29) AND ("PaymentDay" > 0))) NOT VALID;
 G   ALTER TABLE "bankDB"."DepositAgreement" DROP CONSTRAINT valid_payment;
       bankDB          postgres    false    221    221            P           2606    16666    Client valid_phone    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."Client"
    ADD CONSTRAINT valid_phone CHECK ((("Phone" < '999999999999'::bigint) AND ("Phone" > (999999999)::bigint))) NOT VALID;
 ;   ALTER TABLE "bankDB"."Client" DROP CONSTRAINT valid_phone;
       bankDB          postgres    false    218    218            M           2606    16683    Employee valid_phone    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."Employee"
    ADD CONSTRAINT valid_phone CHECK ((("Phone" < '999999999999'::bigint) AND ("Phone" > '9999999999'::bigint))) NOT VALID;
 =   ALTER TABLE "bankDB"."Employee" DROP CONSTRAINT valid_phone;
       bankDB          postgres    false    216    216            _           2606    16904    DepositType valid_rate    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."DepositType"
    ADD CONSTRAINT valid_rate CHECK ((("Rate" > (0)::double precision) AND ("Rate" < (100)::double precision))) NOT VALID;
 ?   ALTER TABLE "bankDB"."DepositType" DROP CONSTRAINT valid_rate;
       bankDB          postgres    false    232    232            \           2606    16907    LoanType valid_rate    CHECK CONSTRAINT     �   ALTER TABLE "bankDB"."LoanType"
    ADD CONSTRAINT valid_rate CHECK ((("Rate" > (0)::double precision) AND ("Rate" < (100)::double precision))) NOT VALID;
 <   ALTER TABLE "bankDB"."LoanType" DROP CONSTRAINT valid_rate;
       bankDB          postgres    false    231    231            N           2606    16480    EmployeeCategory valid_salary    CHECK CONSTRAINT     j   ALTER TABLE "bankDB"."EmployeeCategory"
    ADD CONSTRAINT valid_salary CHECK (("Salary" > 0)) NOT VALID;
 F   ALTER TABLE "bankDB"."EmployeeCategory" DROP CONSTRAINT valid_salary;
       bankDB          postgres    false    217    217            `           2606    16906    DepositType valid_term    CHECK CONSTRAINT     a   ALTER TABLE "bankDB"."DepositType"
    ADD CONSTRAINT valid_term CHECK (("Term" > 0)) NOT VALID;
 ?   ALTER TABLE "bankDB"."DepositType" DROP CONSTRAINT valid_term;
       bankDB          postgres    false    232    232            ]           2606    16909    LoanType valid_term    CHECK CONSTRAINT     ^   ALTER TABLE "bankDB"."LoanType"
    ADD CONSTRAINT valid_term CHECK (("Term" > 0)) NOT VALID;
 <   ALTER TABLE "bankDB"."LoanType" DROP CONSTRAINT valid_term;
       bankDB          postgres    false    231    231            �           2606    16825    DepositPaySchedule agreement_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositPaySchedule"
    ADD CONSTRAINT agreement_fk FOREIGN KEY ("AgreementNumber") REFERENCES "bankDB"."DepositAgreement"("AgreementNumber") ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY "bankDB"."DepositPaySchedule" DROP CONSTRAINT agreement_fk;
       bankDB          postgres    false    4726    221    227            �           2606    16839    LoanPaySchedule agreement_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanPaySchedule"
    ADD CONSTRAINT agreement_fk FOREIGN KEY ("AgreementNumber") REFERENCES "bankDB"."LoanAgreement"("AgreementNumber") ON UPDATE RESTRICT ON DELETE RESTRICT;
 J   ALTER TABLE ONLY "bankDB"."LoanPaySchedule" DROP CONSTRAINT agreement_fk;
       bankDB          postgres    false    4720    229    220            �           2606    16653     LoanAgreement cliend_passport_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT cliend_passport_fk FOREIGN KEY ("PassportNumber") REFERENCES "bankDB"."Client"("PassportNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT cliend_passport_fk;
       bankDB          postgres    false    220    218    4714            �           2606    16648 #   DepositAgreement client_passport_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT client_passport_fk FOREIGN KEY ("PassportNumber") REFERENCES "bankDB"."Client"("PassportNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 Q   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT client_passport_fk;
       bankDB          postgres    false    218    221    4714            �           2606    16590    LoanAgreement currenct_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT currenct_id_fk FOREIGN KEY ("IdCurrency") REFERENCES "bankDB"."Currency"("IdCurrency") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 J   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT currenct_id_fk;
       bankDB          postgres    false    4716    220    219            �           2606    16533    DepositAgreement currency_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT currency_id_fk FOREIGN KEY ("IdCurrency") REFERENCES "bankDB"."Currency"("IdCurrency") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT currency_id_fk;
       bankDB          postgres    false    219    221    4716            �           2606    16862     DepositAgreement deposit_type_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT deposit_type_fk FOREIGN KEY ("IdType") REFERENCES "bankDB"."DepositType"("Id") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT deposit_type_fk;
       bankDB          postgres    false    221    4734    232                       2606    16473    Employee employee_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."Employee"
    ADD CONSTRAINT employee_id_fk FOREIGN KEY ("IdCategory") REFERENCES "bankDB"."EmployeeCategory"("IdCategory") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 E   ALTER TABLE ONLY "bankDB"."Employee" DROP CONSTRAINT employee_id_fk;
       bankDB          postgres    false    217    216    4710            �           2606    16523 "   DepositAgreement employee_tabel_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."DepositAgreement"
    ADD CONSTRAINT employee_tabel_fk FOREIGN KEY ("TabelNumber") REFERENCES "bankDB"."Employee"("TabelNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 P   ALTER TABLE ONLY "bankDB"."DepositAgreement" DROP CONSTRAINT employee_tabel_fk;
       bankDB          postgres    false    221    216    4706            �           2606    16580    LoanAgreement employee_tabel_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT employee_tabel_fk FOREIGN KEY ("TabelNumber") REFERENCES "bankDB"."Employee"("TabelNumber") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT employee_tabel_fk;
       bankDB          postgres    false    220    216    4706            �           2606    16851    LoanAgreement type_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "bankDB"."LoanAgreement"
    ADD CONSTRAINT type_id_fk FOREIGN KEY ("TypeId") REFERENCES "bankDB"."LoanType"("Id") ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 F   ALTER TABLE ONLY "bankDB"."LoanAgreement" DROP CONSTRAINT type_id_fk;
       bankDB          postgres    false    220    4732    231               �  x��VKoW��+F� Rp�{�U7�RE�B�E����Tcc�]�ѐJ ^�҂PWN\��8��?�9gƏZ/�L��7�;��s�/���bp���o����Y�ꋹ�ܗ���l����wg/�B'�a�'��|=_������,�w����_�[��#_��|��ӧ>;��T�:_�{�M�?��y��~���!�d�=|�`>�@�RjJ���ZXõ2
n���f���F�+����ӟ�8�I(�C.�X���7��M���W��ְ��߃_;~�: �|�pBՏ��|+�ZߖH��͐.��[� ��/���#��&"c��"4��Z��z3�%�(�-�]M��R9i��?������=���������胒��hJ��^����::�~���E]����I� �5L2�`hC�4N0���V��"�ף4N����\���^�t�΅��P� @4S��?�1`cH���0N�
�?��+�
e�+��>u����$�	�04)Kx���gQ8���ԓ�r�/�"B�M�9c�lA�D�_B!��3�,t���0jc�9�_e�@�?cz�7�xQ�1@���K !L��W���)%4�׫��F|�j���F��z5=I\�PY�K���J�_nA��)����"��:�3��N��1ܵ	�o�w
��)��V�8r��X��D-ƭx9I��)<��@b����I ~�u�(��iN�k���A��81N�7І�|�rz��c�aH��
u1q�
]ȸ|.Oj೥��7� ��0����ˠ�$e5$�5�#��Gш�Uȓά@�V�7�W(�u{3��Z	�'�4��3N�'�&�U;�I-n$��$�[������z�����2��{_��F#`z�mcCH��B4q"T=}N �G���c�U3� �d��f� �]�1�qм$�"1y,'r��c�`�$��b�=��ːUth��ܛ����#{X:�26cX���u\B�!���V+��'��L:��S�ǳ0��qLZ�2������ea����h�#��tO)�S���d���i�󴁸D��TV;�R�����R!���W���C�3�&�3ȂU�]F����(6�) f�r�.�(J��۸�����Jt�q�!E�
���b�,&�V8�ЈjQ*�l�8x�9�h+y�'r�#?����G�.`a�M8
 � A8wGn/�@n�� �8��Uu(��N(���pթ���%E����B�`�t4Dޅ�b���I�|40w�5?�p+��{e7�ID"���qeB+�q�i��_,(��洠���������r����Y�'��ʇ�
M���x���h�(مFI@��
vY_��j�W�U (�G��'�����         �   x���v
Q���WPJJ��vqR�Sr.-*J�K�TR�s
�t��sW�q�Us�	u���
�:
�\�w��b�v�] Z���6^�}�GE��~uMk.O
�5�9�¾��p���/��0l�EK�A�M���bÅ}�H��/l���& 3� �i��&`�4]�
4~70��^��f��I���vE6�w �m ���$ ̸�           x���Ok�0��ŋ$#y���S�2�����2ʘ+[�?K�e�]�!	��xB��͛���!~}޳��!�����������~��P�)��z���v�3��!���H���LSd	M�:���'���ʙش咀U(%*#�K�wQ���.�\����T�y.�����fVZ=�pK�<N��+ޜ���Y�����[�1O���z�\��<�gĂ�ܪ���<�%O�����Պ7�=�<���˷���3��<\}�9�k�����'��E?E2��      $   >  x����n%5�}��*�)S��϶X�&B���dFb9@$��o��������M�$�O��~x|��|zx|~w��������n߼���߿������~�����=��x���Û��oOO?<=�w������ϧ��rw�zwzŅ�ui����;Y����o�~����g�4y=<��ϒ7.�(T������k���5*�'�w�K!3�7���.5<��ZI�1�F� ^M�\�Z�2���ixJۛx�<�c��&�/W�o�^����/����p�hZ3[Z�jx^0i�z�8�^i{� p\�s��`-L�D{I`���P���&PT���	� ݨA�a�Z���`F�	��ecޡ%�(�z{�6�ȶ�[#F�9��
Iʣ���0%��2w�y�#%͑���|ǒ4v��Y2�C��#L�4CY�Չ!���F����R�K`d��RÀ���R������R�0��=���&s���ilI#GI:��L���(I���Ih�"F��&Ow���|��[�xO2Z$��P�l�Z{��b6{ݎBp\�Z�*bg��Vp�.vP�2Zzk��d�e�B�r�[�y�uə�S���0��֚���#*D��@	P�j�F����2i�&0��g��4���R���@�3Z=���2~��-���bN�y�=�����#Ŭñ�G��}��4G�*Ϥ�<RNIsd��\�������k��oH����\k��{H�nҢ�ІЀ�[��:W=f�zG��$�G�Vp[�;h�f��� [�t���, ���G*�
���	4i�&0F8��9R�J�s�(�DE��I�)�Dh&ŀ��R�I9�R�F��(U�,m	�,53b����R���a���G���oڪ)i�,�
:��4G��V2H��K��5J݅�9�$�a7�-UM`Di+sO@�Qڤ����Q�LH1�t[K�.��"�,zk�젾b;�[@P�:�r��f�a�S�J"���QÌ�(z�\P�-0Pl�AF��\@p� �y��@��R
U�=�-����d��� Q�~�zG��=�4�6V��RQ�2����R٪D����Rq���4v�RisAA]x��%V]Y�e�CH��%0�T+�j�F�*�ؽ%0�tvq����=�����!�7�Q:� s�K[I`D�6�����%�z5�Gz�|G�<�2I�W�}-�wP�<���Zx��vRa�/�Zx���e0�*���}-�wpk�!Qz��kὃuu��kὃ�A_��7�}-�wp0A���`_���
���^�n�!����x&�u�����	�4      )   �  x����JQ��>���"i�U��@�-ZDPBmک�?
�-�M��4��茯p���s�2hW����s����|�T�Z��jc��;����l![�m�7N��YZ߬�jN٩�P}�ި�����F���i���?����!{�{9�=��2�>:�L��shn	�s��x���� ߾�H���6���)G�\�Qi�w@^���ߵ��.�(�aۮ!w��#�5�=Om{��qڢљC,��-���y*N�'Os�X�\�8�Z����W���!s�Z�H�	��`$g��C�����CZl�� R�H�!�f&�R�2�0� �em�O ����A���#Ձ��(60�>�	B����d�P K���gi�N�'�fh�@$��,� ����%�c)j~3W�K�>f�j�����;�h�Sw�6%�ǹ#k�U����(~��=�+W:A�/bZ;��uA�kE��%��.`.X���l3�O��6R         �  x���MO[W����#6�2��C]��UYj�4R���U�����P�HD"%YD��v�]������/��G}�܋q��ƾ�g�w渻�����͝�b����t����j��/??��ѣUq�Agk�{�����~����N<������u[�))�R-q�^�^�ӈ�4�KA�x��,�hFC��>�}:�U�՝�P!F��k	�["8|��)�.�󳶠��!���ONZ"��O��5AN1��p5D��Z�.�"E�^�h%R���V��@Ռz�w�N�A\�yM}��+�:�Fn��M!Ip�䢏��$9V��r�8?�J�lƨ�u��8�p5�~�uP"\�.Ƴ��3\����N��7y�]6��4����.��-�P/F�g��Oth��z��Fp�M�A>���`�s����ItIi�L�,�S��c���s����I����U-|m��τ��&�f��Gň}$�j{ژ�4��o�90'�4l�e�:�����v��=�u�Q׈��+V���]U��{��NY�Hk��$�	v���q�>h��7������,Ƣ�5�}b��dY���vi~Q�-�'��P���)�h5�c����t��J�6N]��L�<�A�|XD�̻?�����I9�LC٭�΀���bի[���7��ީ�zi���Q�	�ـ0v����0}/Y��%�7B�"�n-�҂E78�M^.U�Ȁ'5Q}4����U�C�2�}|�;�V�u�hZ_Ώ$=����� z[�� �5/�2��P��|џ��@<��^*�����@ԂB��A��u����Y^{p��2A:��b��Dc��7F=.+j�`�Ys6�4��ȣ�#�n���A,�1�%��R���؟�G���*�����h.��R�4���W@�ԇ���9"_C2��pV|�� �aa��˅�7����.5�]Y�)��,         �  x��TMkQ��W\�����U
��	hM-��R\X�����Q�J��Ů�N��d2I���9��ׂt�E�̛�q�9���Z���)���u���~�v�qe�R{�awog�����7{�+��U�ب��מJ�ec��\�={Q�gCnܹ%��ԝ��7]�ۮ�My���{����}����.qsW�d�	��1NrK�'��tS��c7�+2J�b��*.E	�p9#���Bj���R�|����K�6�k�qC�R`�’�ܷ�'A�o�,H�u��E��=�̝��b��^�xNd�����Dq &��&��{ Y�B�4���%��|�Z��|�P�&E�R�_��ԍ��b�����٥��cC�Ϡ�#�*���2��j��:&�8 �g�M�U�'U����=�D+�9�&��?V��Ƣ137C[�	/U�@�ܴB@���9$�VE �&�� `e�m0�)*3�{�7���p�d&��b��Wj�R�^���3bP�R��1�����H!�T&r��b/�p���{N3�k�p�ftAiw��0��T5�0�3�9C��3zfh�{��{�v�t�ùu-�,.��kkG**�'��ЧrB� FB\��W�t�`d��D������Z1��3����i�wѺyX"8�t�g/.�(��i�.�w����"��ng L���Ib�>�#�-�3��rq�f�_�j#����;�U�^�¶[ܒ�ᅾ`2n=�Y1u�?���         *  x����j�0�O�؂�{o��j�H����r
�E�-��O�d��
�$'I�t�gUӷ,}������!�?/���{>��'e��<�}�<�����;��c9���9��@A�3���X�s,c��_��&J ��V�nW`�U9����Ǥڂg"�d���W��_}dhr]��s�H�(@	�3�m�ѧ"��|!��gB描�Pd%rm�B��/V���
4��Щ$*ܸ��[�0�xA��.0��Gj��9�������逷Ң@�7P�<f`�=�jk���HL�_��@      &   u  x���AkG��?�×��.#i4��%�\��I�ǴZ�S���y��I�G!$!��������������������/����������O_~���˯����??ߞ�}�~~x���������?�>~��������+|w���lHߴ����;�c�_C���><>~����*ux�'Ք6���x�3�aX��GGB�t#Z��G%����4�jF7��(x�*�ߴZD'B�"ʆ�%�BB�����h�(ft�_
� ��Y�W���RP�W�<*� ��\^�(��Gsx���2�Gsx�~��A�GsxIy�^�ե�eP�h�.�U�Aɣ���%3�v�P23���!� %3���X23�5G|�������K&��H�=�Qv@�]~[Z� $p��������&�����������}����y3^��m�>C�=I�����{�R6,X�ÓIڟd�Sk��Hђi�ԓI��%�I��+ۗ�$Ԛ'-�4��<����)���-_��|}Re�t�呥��"��6^�z�]�ù���m��d�J��w@jÓ1�s��剥&���ݟ2�����z2&{�dyb��'cb�x��%h����>6]� xR�P���{Ћ�J�������2��0'g��1	�+��ݫvP[��&;u�D�Fū	��(dK�7�Usc{DU*6J�=��	���j�h�R�����͋��^��G�e����V�%D�K���#���"H��j��QI(��f�Gsz��3���\ޮ[%���Cx;U����K�~CߢCu�+����9�cu�y���W��dh �h/B��@���}2�(u��������Ւ���7sw{��@��n��6�ll����'���s�.���D����boA�(-�*^����
Db�F.X9��HQ�+g&ԉ=�T�r8�E�X9#�#�+G�(Q����A�(���cA�]����̓)�Z�n8'UU��नJ��a��M��{ �rŢ� Ƣ��E3��+�0��*�0�+�P�98Z 5���p�Zq���zp�[�����Ǳ��^3�
��,iɋ�聕%�[�c5�Xr���Ai�Zf��������>����G�	�l�dOd��v,�V�u)��^^�k%�kI ��bUJ���JY���w���K�Gd҃�c<�dOZ8��ţ�-�jN1��{�"���OTD��+ܩdS̫�������C���-iӡ�X�	�.L|�0h�(���K&	�A�%s�<>=G\Ǘ�Ɉ���|_�J*<OP_��hWj>�R	.d��L��s������F튺�W�kfbk�=^��"VQ�y�ڹtpa�yXrnϮI�Co��v,gVj����Վ�咣��ϕ+��o��`���O0|/nn��XHK      (   �  x����JBa��^����4��U��SPZ�
�m���B�j�"��+8����滣ޙsD�*���y���3�Y�R���u�$go*����U���L�`���)/���������H;�(E�ʹx�م5���˅oF�&��#�0��<1u�&\��!�S�x�`�q��1�o��;��%�'��g�簆[���%�5���Q��H!�����ԧ�ߓ��;��=
Y��0�,zj�^xD���я��&M��T���0B��/v�k1�yZ5��&�ڷuM�5��dM�-EPU��z����!�6�s� {U l1?�8��a<���~�0�����S��)�W����iǺ_�(퀕h��-��óg��Y��W�A�	@8u����e��+3�#�m��G[1A��5�O�7l����W4:2���G'���!^>���j�B?�h%     