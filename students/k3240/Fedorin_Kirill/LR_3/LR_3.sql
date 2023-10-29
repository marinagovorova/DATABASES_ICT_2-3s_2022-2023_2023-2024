PGDMP     /    2            	    {            LR_3(TaskManager)    11.21    11.21 :    i           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            j           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            k           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            l           1262    16600    LR_3(TaskManager)    DATABASE     �   CREATE DATABASE "LR_3(TaskManager)" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United Kingdom.1252' LC_CTYPE = 'English_United Kingdom.1252';
 #   DROP DATABASE "LR_3(TaskManager)";
             postgres    false            �            1259    16636 	    Position    TABLE     �   CREATE TABLE public." Position" (
    "PositionID" integer NOT NULL,
    "PositionName" character varying NOT NULL,
    "Category" character varying NOT NULL,
    "Salary" integer NOT NULL,
    CONSTRAINT "checkSalary" CHECK (("Salary" > 0))
);
    DROP TABLE public." Position";
       public         postgres    false            �            1259    16675    Bills    TABLE     �   CREATE TABLE public."Bills" (
    "BillNumber" integer NOT NULL,
    "Date" date NOT NULL,
    "Status" character varying NOT NULL,
    "Balance" integer NOT NULL,
    CONSTRAINT "checkBalance" CHECK (("Balance" > 0))
);
    DROP TABLE public."Bills";
       public         postgres    false            �            1259    16607    CompanyContract    TABLE     /  CREATE TABLE public."CompanyContract" (
    "ContractID" integer NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date,
    "PaymentStatus" character varying NOT NULL,
    "ProcessingStatus" character varying NOT NULL,
    "ManagerID" integer NOT NULL,
    "CustomerCompanyID" integer NOT NULL
);
 %   DROP TABLE public."CompanyContract";
       public         postgres    false            �            1259    16601    CustomerCompany    TABLE     '  CREATE TABLE public."CustomerCompany" (
    "CustomerCompanyID" integer NOT NULL,
    "CompanyName" character varying(100) NOT NULL,
    "Address" character varying(100) NOT NULL,
    "ContactName" character varying(100) NOT NULL,
    "ContactNamePhoneNumber" character varying(100) NOT NULL
);
 %   DROP TABLE public."CustomerCompany";
       public         postgres    false            �            1259    16645 
   Department    TABLE     �   CREATE TABLE public."Department" (
    "DepartmentID" integer NOT NULL,
    "DepartmentName" character varying NOT NULL,
    "PhoneNumber" character varying NOT NULL,
    "DepartmentNumber" integer NOT NULL
);
     DROP TABLE public."Department";
       public         postgres    false            �            1259    16685    Project    TABLE     �  CREATE TABLE public."Project" (
    "ProjectID" integer NOT NULL,
    "ProjectName" character varying NOT NULL,
    "CompletionStatus" character varying NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date,
    "PaymentStatus" character varying NOT NULL,
    "PrepaymentBillNumber" integer NOT NULL,
    "BalanceBillNumber" integer NOT NULL,
    "TeamleaderID" integer NOT NULL
);
    DROP TABLE public."Project";
       public         postgres    false            �            1259    16718    Task    TABLE     �  CREATE TABLE public."Task" (
    "TaskID" integer NOT NULL,
    "TaskName" character varying NOT NULL,
    "TaskDescription" character varying NOT NULL,
    "Cost" integer NOT NULL,
    "Status" character varying NOT NULL,
    "ProjectID" integer NOT NULL,
    CONSTRAINT "checkCost" CHECK (("Cost" >= 0)),
    CONSTRAINT "checkStatus" CHECK ((("Status")::text = ANY ((ARRAY['в работе'::character varying, 'не начат'::character varying, 'закончен'::character varying])::text[])))
);
    DROP TABLE public."Task";
       public         postgres    false            �            1259    16765    TaskAssignment    TABLE     �   CREATE TABLE public."TaskAssignment" (
    "ContractID" integer NOT NULL,
    "TaskID" integer NOT NULL,
    "ProjectID" integer NOT NULL
);
 $   DROP TABLE public."TaskAssignment";
       public         postgres    false            �            1259    16736    TaskCompletionControl    TABLE     �  CREATE TABLE public."TaskCompletionControl" (
    "DeadlineID" integer NOT NULL,
    "DeadlineDate" date NOT NULL,
    "DeadlineCompletion" integer NOT NULL,
    "CheckDate" date NOT NULL,
    "CompletionCommentary" character varying NOT NULL,
    "ContractID" integer NOT NULL,
    "TaskID" integer NOT NULL,
    CONSTRAINT "checkDeadlineCompletion" CHECK ((("DeadlineCompletion" >= 0) AND ("DeadlineCompletion" <= 100)))
);
 +   DROP TABLE public."TaskCompletionControl";
       public         postgres    false            �            1259    16622    Worker    TABLE     �   CREATE TABLE public."Worker" (
    "WorkerID" integer NOT NULL,
    "PhoneNumber" character varying NOT NULL,
    "FIO" character varying
);
    DROP TABLE public."Worker";
       public         postgres    false            �            1259    16708    WorkerAssignment    TABLE     �  CREATE TABLE public."WorkerAssignment" (
    "ContractID" integer NOT NULL,
    "ProjectID" integer NOT NULL,
    "CashAward" integer NOT NULL,
    "CashAwardType" character varying NOT NULL,
    CONSTRAINT checkcash CHECK (("CashAward" >= 0)),
    CONSTRAINT checkcashtype CHECK ((("CashAwardType")::text = ANY ((ARRAY['понедельно'::character varying, 'посуточно'::character varying, 'раз в год'::character varying])::text[])))
);
 &   DROP TABLE public."WorkerAssignment";
       public         postgres    false            �            1259    16654    WorkerOnContract    TABLE     �   CREATE TABLE public."WorkerOnContract" (
    "ContractID" integer NOT NULL,
    "SalaryPercentrage" integer DEFAULT 100 NOT NULL,
    "WorkerID" integer NOT NULL,
    "PositionID" integer NOT NULL,
    "DepartmentID" integer NOT NULL
);
 &   DROP TABLE public."WorkerOnContract";
       public         postgres    false            ^          0    16636 	    Position 
   TABLE DATA               Y   COPY public." Position" ("PositionID", "PositionName", "Category", "Salary") FROM stdin;
    public       postgres    false    199   R       a          0    16675    Bills 
   TABLE DATA               L   COPY public."Bills" ("BillNumber", "Date", "Status", "Balance") FROM stdin;
    public       postgres    false    202   LR       \          0    16607    CompanyContract 
   TABLE DATA               �   COPY public."CompanyContract" ("ContractID", "StartDate", "EndDate", "PaymentStatus", "ProcessingStatus", "ManagerID", "CustomerCompanyID") FROM stdin;
    public       postgres    false    197   �R       [          0    16601    CustomerCompany 
   TABLE DATA               �   COPY public."CustomerCompany" ("CustomerCompanyID", "CompanyName", "Address", "ContactName", "ContactNamePhoneNumber") FROM stdin;
    public       postgres    false    196   �R       _          0    16645 
   Department 
   TABLE DATA               k   COPY public."Department" ("DepartmentID", "DepartmentName", "PhoneNumber", "DepartmentNumber") FROM stdin;
    public       postgres    false    200   S       b          0    16685    Project 
   TABLE DATA               �   COPY public."Project" ("ProjectID", "ProjectName", "CompletionStatus", "StartDate", "EndDate", "PaymentStatus", "PrepaymentBillNumber", "BalanceBillNumber", "TeamleaderID") FROM stdin;
    public       postgres    false    203   US       d          0    16718    Task 
   TABLE DATA               h   COPY public."Task" ("TaskID", "TaskName", "TaskDescription", "Cost", "Status", "ProjectID") FROM stdin;
    public       postgres    false    205   �S       f          0    16765    TaskAssignment 
   TABLE DATA               O   COPY public."TaskAssignment" ("ContractID", "TaskID", "ProjectID") FROM stdin;
    public       postgres    false    207   jT       e          0    16736    TaskCompletionControl 
   TABLE DATA               �   COPY public."TaskCompletionControl" ("DeadlineID", "DeadlineDate", "DeadlineCompletion", "CheckDate", "CompletionCommentary", "ContractID", "TaskID") FROM stdin;
    public       postgres    false    206   �T       ]          0    16622    Worker 
   TABLE DATA               D   COPY public."Worker" ("WorkerID", "PhoneNumber", "FIO") FROM stdin;
    public       postgres    false    198   �T       c          0    16708    WorkerAssignment 
   TABLE DATA               e   COPY public."WorkerAssignment" ("ContractID", "ProjectID", "CashAward", "CashAwardType") FROM stdin;
    public       postgres    false    204   FU       `          0    16654    WorkerOnContract 
   TABLE DATA               y   COPY public."WorkerOnContract" ("ContractID", "SalaryPercentrage", "WorkerID", "PositionID", "DepartmentID") FROM stdin;
    public       postgres    false    201   �U       �
           2606    16644     Position  Positions_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public." Position"
    ADD CONSTRAINT " Positions_pkey" PRIMARY KEY ("PositionID");
 G   ALTER TABLE ONLY public." Position" DROP CONSTRAINT " Positions_pkey";
       public         postgres    false    199            �
           2606    16683    Bills Bills_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Bills"
    ADD CONSTRAINT "Bills_pkey" PRIMARY KEY ("BillNumber");
 >   ALTER TABLE ONLY public."Bills" DROP CONSTRAINT "Bills_pkey";
       public         postgres    false    202            �
           2606    16621 "   CompanyContract CheckPaymentStatus    CHECK CONSTRAINT       ALTER TABLE public."CompanyContract"
    ADD CONSTRAINT "CheckPaymentStatus" CHECK ((("PaymentStatus")::text = ANY ((ARRAY['не оплачен'::character varying, 'не оплачен'::character varying, 'частично оплачен'::character varying])::text[]))) NOT VALID;
 K   ALTER TABLE public."CompanyContract" DROP CONSTRAINT "CheckPaymentStatus";
       public       postgres    false    197    197            �
           2606    16620 %   CompanyContract CheckProcessingStatus    CHECK CONSTRAINT       ALTER TABLE public."CompanyContract"
    ADD CONSTRAINT "CheckProcessingStatus" CHECK ((("ProcessingStatus")::text = ANY ((ARRAY['в работе'::character varying, 'не начат'::character varying, 'закончен'::character varying])::text[]))) NOT VALID;
 N   ALTER TABLE public."CompanyContract" DROP CONSTRAINT "CheckProcessingStatus";
       public       postgres    false    197    197            �
           2606    16614 $   CompanyContract CompanyContract_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."CompanyContract"
    ADD CONSTRAINT "CompanyContract_pkey" PRIMARY KEY ("ContractID");
 R   ALTER TABLE ONLY public."CompanyContract" DROP CONSTRAINT "CompanyContract_pkey";
       public         postgres    false    197            �
           2606    16605 $   CustomerCompany CustomerCompany_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."CustomerCompany"
    ADD CONSTRAINT "CustomerCompany_pkey" PRIMARY KEY ("CustomerCompanyID");
 R   ALTER TABLE ONLY public."CustomerCompany" DROP CONSTRAINT "CustomerCompany_pkey";
       public         postgres    false    196            �
           2606    16653    Department Department_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY ("DepartmentID");
 H   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_pkey";
       public         postgres    false    200            �
           2606    16692    Project Project_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY ("ProjectID");
 B   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "Project_pkey";
       public         postgres    false    203            �
           2606    16769 "   TaskAssignment TaskAssignment_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."TaskAssignment"
    ADD CONSTRAINT "TaskAssignment_pkey" PRIMARY KEY ("ContractID", "TaskID", "ProjectID");
 P   ALTER TABLE ONLY public."TaskAssignment" DROP CONSTRAINT "TaskAssignment_pkey";
       public         postgres    false    207    207    207            �
           2606    16744 0   TaskCompletionControl TaskCompletionControl_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."TaskCompletionControl"
    ADD CONSTRAINT "TaskCompletionControl_pkey" PRIMARY KEY ("DeadlineID");
 ^   ALTER TABLE ONLY public."TaskCompletionControl" DROP CONSTRAINT "TaskCompletionControl_pkey";
       public         postgres    false    206            �
           2606    16727    Task Task_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_pkey" PRIMARY KEY ("TaskID");
 <   ALTER TABLE ONLY public."Task" DROP CONSTRAINT "Task_pkey";
       public         postgres    false    205            �
           2606    16717 &   WorkerAssignment WorkerAssignment_pkey 
   CONSTRAINT        ALTER TABLE ONLY public."WorkerAssignment"
    ADD CONSTRAINT "WorkerAssignment_pkey" PRIMARY KEY ("ContractID", "ProjectID");
 T   ALTER TABLE ONLY public."WorkerAssignment" DROP CONSTRAINT "WorkerAssignment_pkey";
       public         postgres    false    204    204            �
           2606    16659 &   WorkerOnContract WorkerOnContract_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."WorkerOnContract"
    ADD CONSTRAINT "WorkerOnContract_pkey" PRIMARY KEY ("ContractID");
 T   ALTER TABLE ONLY public."WorkerOnContract" DROP CONSTRAINT "WorkerOnContract_pkey";
       public         postgres    false    201            �
           2606    16630    Worker Worker_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Worker"
    ADD CONSTRAINT "Worker_pkey" PRIMARY KEY ("WorkerID");
 @   ALTER TABLE ONLY public."Worker" DROP CONSTRAINT "Worker_pkey";
       public         postgres    false    198            �
           2606    16684    WorkerOnContract checkSalary    CHECK CONSTRAINT     �   ALTER TABLE public."WorkerOnContract"
    ADD CONSTRAINT "checkSalary" CHECK ((("SalaryPercentrage" >= 0) AND ("SalaryPercentrage" <= 100))) NOT VALID;
 E   ALTER TABLE public."WorkerOnContract" DROP CONSTRAINT "checkSalary";
       public       postgres    false    201    201            �
           2606    16693    Project BalanceBillNumber    FK CONSTRAINT     �   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "BalanceBillNumber" FOREIGN KEY ("BalanceBillNumber") REFERENCES public."Bills"("BillNumber");
 G   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "BalanceBillNumber";
       public       postgres    false    203    2760    202            �
           2606    16750     TaskCompletionControl ContractID    FK CONSTRAINT     �   ALTER TABLE ONLY public."TaskCompletionControl"
    ADD CONSTRAINT "ContractID" FOREIGN KEY ("ContractID") REFERENCES public."WorkerOnContract"("ContractID");
 N   ALTER TABLE ONLY public."TaskCompletionControl" DROP CONSTRAINT "ContractID";
       public       postgres    false    206    201    2758            �
           2606    16755    WorkerAssignment ContractID    FK CONSTRAINT     �   ALTER TABLE ONLY public."WorkerAssignment"
    ADD CONSTRAINT "ContractID" FOREIGN KEY ("ContractID") REFERENCES public."WorkerOnContract"("ContractID") NOT VALID;
 I   ALTER TABLE ONLY public."WorkerAssignment" DROP CONSTRAINT "ContractID";
       public       postgres    false    201    2758    204            �
           2606    16770    TaskAssignment ContractID    FK CONSTRAINT     �   ALTER TABLE ONLY public."TaskAssignment"
    ADD CONSTRAINT "ContractID" FOREIGN KEY ("ContractID", "ProjectID") REFERENCES public."WorkerAssignment"("ContractID", "ProjectID");
 G   ALTER TABLE ONLY public."TaskAssignment" DROP CONSTRAINT "ContractID";
       public       postgres    false    204    2764    207    207    204            �
           2606    16615 !   CompanyContract CustomerCompanyID    FK CONSTRAINT     �   ALTER TABLE ONLY public."CompanyContract"
    ADD CONSTRAINT "CustomerCompanyID" FOREIGN KEY ("CustomerCompanyID") REFERENCES public."CustomerCompany"("CustomerCompanyID");
 O   ALTER TABLE ONLY public."CompanyContract" DROP CONSTRAINT "CustomerCompanyID";
       public       postgres    false    2748    196    197            �
           2606    16670    WorkerOnContract DepartmentID    FK CONSTRAINT     �   ALTER TABLE ONLY public."WorkerOnContract"
    ADD CONSTRAINT "DepartmentID" FOREIGN KEY ("DepartmentID") REFERENCES public."Department"("DepartmentID");
 K   ALTER TABLE ONLY public."WorkerOnContract" DROP CONSTRAINT "DepartmentID";
       public       postgres    false    201    2756    200            �
           2606    16631    CompanyContract ManagerID    FK CONSTRAINT     �   ALTER TABLE ONLY public."CompanyContract"
    ADD CONSTRAINT "ManagerID" FOREIGN KEY ("ManagerID") REFERENCES public."Worker"("WorkerID") NOT VALID;
 G   ALTER TABLE ONLY public."CompanyContract" DROP CONSTRAINT "ManagerID";
       public       postgres    false    2752    197    198            �
           2606    16665    WorkerOnContract PositionID    FK CONSTRAINT     �   ALTER TABLE ONLY public."WorkerOnContract"
    ADD CONSTRAINT "PositionID" FOREIGN KEY ("PositionID") REFERENCES public." Position"("PositionID");
 I   ALTER TABLE ONLY public."WorkerOnContract" DROP CONSTRAINT "PositionID";
       public       postgres    false    2754    199    201            �
           2606    16698    Project PrepaymentBillNumber    FK CONSTRAINT     �   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "PrepaymentBillNumber" FOREIGN KEY ("PrepaymentBillNumber") REFERENCES public."Bills"("BillNumber");
 J   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "PrepaymentBillNumber";
       public       postgres    false    202    2760    203            �
           2606    16728    Task ProjectID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "ProjectID" FOREIGN KEY ("ProjectID") REFERENCES public."Project"("ProjectID");
 <   ALTER TABLE ONLY public."Task" DROP CONSTRAINT "ProjectID";
       public       postgres    false    2762    205    203            �
           2606    16760    WorkerAssignment ProjectID    FK CONSTRAINT     �   ALTER TABLE ONLY public."WorkerAssignment"
    ADD CONSTRAINT "ProjectID" FOREIGN KEY ("ProjectID") REFERENCES public."Project"("ProjectID") NOT VALID;
 H   ALTER TABLE ONLY public."WorkerAssignment" DROP CONSTRAINT "ProjectID";
       public       postgres    false    204    2762    203            �
           2606    16745    TaskCompletionControl TaskID    FK CONSTRAINT     �   ALTER TABLE ONLY public."TaskCompletionControl"
    ADD CONSTRAINT "TaskID" FOREIGN KEY ("TaskID") REFERENCES public."Task"("TaskID");
 J   ALTER TABLE ONLY public."TaskCompletionControl" DROP CONSTRAINT "TaskID";
       public       postgres    false    205    206    2766            �
           2606    16775    TaskAssignment TaskID    FK CONSTRAINT     �   ALTER TABLE ONLY public."TaskAssignment"
    ADD CONSTRAINT "TaskID" FOREIGN KEY ("TaskID") REFERENCES public."Task"("TaskID");
 C   ALTER TABLE ONLY public."TaskAssignment" DROP CONSTRAINT "TaskID";
       public       postgres    false    205    2766    207            �
           2606    16703    Project TeamleaderID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "TeamleaderID" FOREIGN KEY ("TeamleaderID") REFERENCES public."Worker"("WorkerID");
 B   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "TeamleaderID";
       public       postgres    false    203    198    2752            �
           2606    16660    WorkerOnContract WorkerID    FK CONSTRAINT     �   ALTER TABLE ONLY public."WorkerOnContract"
    ADD CONSTRAINT "WorkerID" FOREIGN KEY ("WorkerID") REFERENCES public."Worker"("WorkerID");
 G   ALTER TABLE ONLY public."WorkerOnContract" DROP CONSTRAINT "WorkerID";
       public       postgres    false    198    201    2752            ^   8   x�34266��,���SpJL�N�K���46 .C��1�Kj�@0\Ԁ+F��� �u�      a   0   x�342642�4202�54�54�LL.�,K�44 .C��!N�=... ��      \      x������ � �      [   S   x�342642�L�KI����/N�/�t��,)ʬT���㴰4034442�2�5�t�M�����K-W��/��PVl����� �      _   9   x�342642�L�KI�ര4034442�4�2�r:�&V��d�F��\1z\\\ v�      b   �   x�3426�L�KI�P�M,༰I�bÅ6^�w���VN#c]C#]�*#(�¾�/쾰�b����r12�PƜ��\@ʈ�17�*?O!<5����[�HÆ�M����LK6��d���O�5&\1z\\\ �L�      d   j   x�3�tI-K��/HUp+��+I�KA��&&� č�����[�Ć��@��ihdl�e��䔘�RZ����������ya��ņ.l���bӅ� }F\1z\\\ ��2v      f      x�34�4�4426�24�4���b���� 0��      e   I   x�3�4206�54�56�4�,�<���NCcNC.#��)T�� �3��|+�R���$���Єӈ+F��� ��o      ]   E   x�34洰403626653�K,��ɬT�,K��/�R��\�&PuF&�f��Pi���\��=... ���      c   6   x�34�4426�44 ��/컰���[�x�� {��	H��)N1z\\\ ޥ#w      `   *   x�34�440�4RF�Ɔ ��M �&`ac��!W� ��     