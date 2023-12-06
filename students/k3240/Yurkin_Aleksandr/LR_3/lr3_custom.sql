PGDMP  "    +            	    {         
   dbalexyrkn #   14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)    16.0 B    h           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            i           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            j           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            k           1262    41289 
   dbalexyrkn    DATABASE     r   CREATE DATABASE dbalexyrkn WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE dbalexyrkn;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            l           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    41574    act    TABLE     �   CREATE TABLE public.act (
    id integer NOT NULL,
    contract integer NOT NULL,
    data character varying(50) NOT NULL,
    act_date date NOT NULL,
    act_type character varying(25) NOT NULL
);
    DROP TABLE public.act;
       public         heap 
   dbalexyrkn    false    4            �            1259    41308    car    TABLE     ^  CREATE TABLE public.car (
    id integer NOT NULL,
    deposit integer NOT NULL,
    registration_number character varying(25) NOT NULL,
    plate_number character varying(9) NOT NULL,
    engine_number character varying(17) NOT NULL,
    body_number character varying(17) NOT NULL,
    car_year integer NOT NULL,
    mileage integer DEFAULT 0 NOT NULL,
    car_price integer NOT NULL,
    rent_price integer NOT NULL,
    inspection_date date NOT NULL,
    remarks character varying(50),
    return_receipt character varying(25),
    time_in_rent integer DEFAULT 0 NOT NULL,
    model integer NOT NULL
);
    DROP TABLE public.car;
       public         heap 
   dbalexyrkn    false    4            �            1259    41511    client    TABLE     �  CREATE TABLE public.client (
    id integer NOT NULL,
    phone character varying(11) NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    country character varying(35) NOT NULL,
    remarks character varying(100),
    sale integer DEFAULT 0 NOT NULL,
    time_in_rent integer DEFAULT 0 NOT NULL,
    passport character varying(10) NOT NULL,
    CONSTRAINT sale CHECK (((sale >= 0) AND (sale <= 100)))
);
    DROP TABLE public.client;
       public         heap 
   dbalexyrkn    false    4            �            1259    41521    contract    TABLE     �  CREATE TABLE public.contract (
    id integer NOT NULL,
    price integer NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    status character varying(25) NOT NULL,
    payment_status character varying(25) NOT NULL,
    client integer NOT NULL,
    employee integer NOT NULL,
    car integer NOT NULL,
    insurance integer NOT NULL,
    CONSTRAINT "start < end" CHECK ((startdate < enddate)),
    CONSTRAINT startdate CHECK ((startdate > '2023-10-20'::date))
);
    DROP TABLE public.contract;
       public         heap 
   dbalexyrkn    false    4            �            1259    41595    crash    TABLE     :  CREATE TABLE public.crash (
    id integer NOT NULL,
    contract integer NOT NULL,
    place character varying(50) NOT NULL,
    date date NOT NULL,
    guilty character varying(35) NOT NULL,
    price integer NOT NULL,
    description character varying(100) NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);
    DROP TABLE public.crash;
       public         heap 
   dbalexyrkn    false    4            �            1259    41489    employee    TABLE     �   CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying NOT NULL,
    job integer NOT NULL,
    passport character varying NOT NULL
);
    DROP TABLE public.employee;
       public         heap 
   dbalexyrkn    false    4            �            1259    41477 	   insurance    TABLE     �   CREATE TABLE public.insurance (
    id integer NOT NULL,
    price integer NOT NULL,
    type character varying(50) NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);
    DROP TABLE public.insurance;
       public         heap 
   dbalexyrkn    false    4            �            1259    41483    job    TABLE     �   CREATE TABLE public.job (
    id integer NOT NULL,
    salary integer NOT NULL,
    duties character varying(200) NOT NULL,
    name character varying(25) NOT NULL,
    CONSTRAINT salary CHECK ((salary > 0))
);
    DROP TABLE public.job;
       public         heap 
   dbalexyrkn    false    4            �            1259    41290    model    TABLE     �   CREATE TABLE public.model (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    techs character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    "time" integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.model;
       public         heap 
   dbalexyrkn    false    4            �            1259    41584    prolongation    TABLE     �   CREATE TABLE public.prolongation (
    id integer NOT NULL,
    contract integer NOT NULL,
    date date NOT NULL,
    hours integer NOT NULL,
    CONSTRAINT hours CHECK ((hours > 0))
);
     DROP TABLE public.prolongation;
       public         heap 
   dbalexyrkn    false    4            �            1259    41612 	   violation    TABLE     �   CREATE TABLE public.violation (
    id integer NOT NULL,
    contract integer NOT NULL,
    type integer NOT NULL,
    crash integer NOT NULL,
    payer character varying(35) NOT NULL,
    date date NOT NULL,
    place character varying(50) NOT NULL
);
    DROP TABLE public.violation;
       public         heap 
   dbalexyrkn    false    4            �            1259    41606    violation_type    TABLE     �   CREATE TABLE public.violation_type (
    id integer NOT NULL,
    description character varying(100) NOT NULL,
    price integer NOT NULL,
    type character varying(50) NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);
 "   DROP TABLE public.violation_type;
       public         heap 
   dbalexyrkn    false    4            a          0    41574    act 
   TABLE DATA                 public       
   dbalexyrkn    false    216   �N       [          0    41308    car 
   TABLE DATA                 public       
   dbalexyrkn    false    210   )O       _          0    41511    client 
   TABLE DATA                 public       
   dbalexyrkn    false    214   5P       `          0    41521    contract 
   TABLE DATA                 public       
   dbalexyrkn    false    215   .Q       c          0    41595    crash 
   TABLE DATA                 public       
   dbalexyrkn    false    218   �Q       ^          0    41489    employee 
   TABLE DATA                 public       
   dbalexyrkn    false    213   �R       \          0    41477 	   insurance 
   TABLE DATA                 public       
   dbalexyrkn    false    211   7S       ]          0    41483    job 
   TABLE DATA                 public       
   dbalexyrkn    false    212   �S       Z          0    41290    model 
   TABLE DATA                 public       
   dbalexyrkn    false    209   hT       b          0    41584    prolongation 
   TABLE DATA                 public       
   dbalexyrkn    false    217   1U       e          0    41612 	   violation 
   TABLE DATA                 public       
   dbalexyrkn    false    220   �U       d          0    41606    violation_type 
   TABLE DATA                 public       
   dbalexyrkn    false    219   ;V       �           2606    41578    act Act_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.act
    ADD CONSTRAINT "Act_pkey" PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.act DROP CONSTRAINT "Act_pkey";
       public         
   dbalexyrkn    false    216            �           2606    41465    car Body number 
   CONSTRAINT     S   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Body number" UNIQUE (body_number);
 ;   ALTER TABLE ONLY public.car DROP CONSTRAINT "Body number";
       public         
   dbalexyrkn    false    210            �           2606    41314    car Car_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT "Car_pkey";
       public         
   dbalexyrkn    false    210            �           2606    41518    client Client_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.client
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.client DROP CONSTRAINT "Client_pkey";
       public         
   dbalexyrkn    false    214            �           2606    41527    contract Contract_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT "Contract_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.contract DROP CONSTRAINT "Contract_pkey";
       public         
   dbalexyrkn    false    215            �           2606    41600    crash Crash_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.crash
    ADD CONSTRAINT "Crash_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.crash DROP CONSTRAINT "Crash_pkey";
       public         
   dbalexyrkn    false    218            �           2606    41495    employee Employee_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employee DROP CONSTRAINT "Employee_pkey";
       public         
   dbalexyrkn    false    213            �           2606    41463    car Engine number 
   CONSTRAINT     W   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Engine number" UNIQUE (engine_number);
 =   ALTER TABLE ONLY public.car DROP CONSTRAINT "Engine number";
       public         
   dbalexyrkn    false    210            �           2606    41482    insurance Insurance_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.insurance
    ADD CONSTRAINT "Insurance_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.insurance DROP CONSTRAINT "Insurance_pkey";
       public         
   dbalexyrkn    false    211            �           2606    41488    job Job_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.job
    ADD CONSTRAINT "Job_pkey" PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.job DROP CONSTRAINT "Job_pkey";
       public         
   dbalexyrkn    false    212            �           2606    41295    model Model_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.model
    ADD CONSTRAINT "Model_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.model DROP CONSTRAINT "Model_pkey";
       public         
   dbalexyrkn    false    209            �           2606    41461    car Plate number 
   CONSTRAINT     U   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Plate number" UNIQUE (plate_number);
 <   ALTER TABLE ONLY public.car DROP CONSTRAINT "Plate number";
       public         
   dbalexyrkn    false    210            �           2606    41589    prolongation Prolongation_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.prolongation
    ADD CONSTRAINT "Prolongation_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.prolongation DROP CONSTRAINT "Prolongation_pkey";
       public         
   dbalexyrkn    false    217            �           2606    41459    car Registration number 
   CONSTRAINT     c   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Registration number" UNIQUE (registration_number);
 C   ALTER TABLE ONLY public.car DROP CONSTRAINT "Registration number";
       public         
   dbalexyrkn    false    210            �           2606    41616    violation Violation_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.violation
    ADD CONSTRAINT "Violation_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.violation DROP CONSTRAINT "Violation_pkey";
       public         
   dbalexyrkn    false    220            �           2606    41611 "   violation_type Violation_type_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.violation_type
    ADD CONSTRAINT "Violation_type_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.violation_type DROP CONSTRAINT "Violation_type_pkey";
       public         
   dbalexyrkn    false    219            �           2606    41475    car car_price    CHECK CONSTRAINT     X   ALTER TABLE public.car
    ADD CONSTRAINT car_price CHECK ((car_price >= 0)) NOT VALID;
 2   ALTER TABLE public.car DROP CONSTRAINT car_price;
       public       
   dbalexyrkn    false    210    210            �           2606    41472    car car_year    CHECK CONSTRAINT     Y   ALTER TABLE public.car
    ADD CONSTRAINT car_year CHECK ((car_year >= 1950)) NOT VALID;
 1   ALTER TABLE public.car DROP CONSTRAINT car_year;
       public       
   dbalexyrkn    false    210    210            �           2606    41473    car mileage    CHECK CONSTRAINT     T   ALTER TABLE public.car
    ADD CONSTRAINT mileage CHECK ((mileage >= 0)) NOT VALID;
 0   ALTER TABLE public.car DROP CONSTRAINT mileage;
       public       
   dbalexyrkn    false    210    210            �           2606    41633    employee passport 
   CONSTRAINT     P   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT passport UNIQUE (passport);
 ;   ALTER TABLE ONLY public.employee DROP CONSTRAINT passport;
       public         
   dbalexyrkn    false    213            �           2606    41520    client phone 
   CONSTRAINT     H   ALTER TABLE ONLY public.client
    ADD CONSTRAINT phone UNIQUE (phone);
 6   ALTER TABLE ONLY public.client DROP CONSTRAINT phone;
       public         
   dbalexyrkn    false    214            �           2606    41548    contract price    CHECK CONSTRAINT     T   ALTER TABLE public.contract
    ADD CONSTRAINT price CHECK ((price > 0)) NOT VALID;
 3   ALTER TABLE public.contract DROP CONSTRAINT price;
       public       
   dbalexyrkn    false    215    215            �           2606    41474    car rent_price    CHECK CONSTRAINT     Z   ALTER TABLE public.car
    ADD CONSTRAINT rent_price CHECK ((rent_price >= 0)) NOT VALID;
 3   ALTER TABLE public.car DROP CONSTRAINT rent_price;
       public       
   dbalexyrkn    false    210    210            �           2606    41476    car time_in_rent    CHECK CONSTRAINT     ^   ALTER TABLE public.car
    ADD CONSTRAINT time_in_rent CHECK ((time_in_rent >= 0)) NOT VALID;
 5   ALTER TABLE public.car DROP CONSTRAINT time_in_rent;
       public       
   dbalexyrkn    false    210    210            �           2606    41466 	   car Model    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Model" FOREIGN KEY (model) REFERENCES public.model(id) ON DELETE CASCADE NOT VALID;
 5   ALTER TABLE ONLY public.car DROP CONSTRAINT "Model";
       public       
   dbalexyrkn    false    3232    209    210            �           2606    41564    contract car    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT car FOREIGN KEY (car) REFERENCES public.car(id) ON DELETE SET NULL NOT VALID;
 6   ALTER TABLE ONLY public.contract DROP CONSTRAINT car;
       public       
   dbalexyrkn    false    215    210    3236            �           2606    41554    contract client    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT client FOREIGN KEY (client) REFERENCES public.client(id) ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.contract DROP CONSTRAINT client;
       public       
   dbalexyrkn    false    3252    214    215            �           2606    41579    act contract    FK CONSTRAINT     �   ALTER TABLE ONLY public.act
    ADD CONSTRAINT contract FOREIGN KEY (contract) REFERENCES public.contract(id) ON DELETE CASCADE;
 6   ALTER TABLE ONLY public.act DROP CONSTRAINT contract;
       public       
   dbalexyrkn    false    216    215    3256            �           2606    41590    prolongation contract    FK CONSTRAINT     �   ALTER TABLE ONLY public.prolongation
    ADD CONSTRAINT contract FOREIGN KEY (contract) REFERENCES public.contract(id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.prolongation DROP CONSTRAINT contract;
       public       
   dbalexyrkn    false    217    215    3256            �           2606    41601    crash contract    FK CONSTRAINT     �   ALTER TABLE ONLY public.crash
    ADD CONSTRAINT contract FOREIGN KEY (contract) REFERENCES public.contract(id) ON DELETE SET NULL;
 8   ALTER TABLE ONLY public.crash DROP CONSTRAINT contract;
       public       
   dbalexyrkn    false    218    215    3256            �           2606    41617    violation contract    FK CONSTRAINT     �   ALTER TABLE ONLY public.violation
    ADD CONSTRAINT contract FOREIGN KEY (contract) REFERENCES public.contract(id) ON DELETE SET NULL;
 <   ALTER TABLE ONLY public.violation DROP CONSTRAINT contract;
       public       
   dbalexyrkn    false    220    3256    215            �           2606    41627    violation crash    FK CONSTRAINT     ~   ALTER TABLE ONLY public.violation
    ADD CONSTRAINT crash FOREIGN KEY (crash) REFERENCES public.crash(id) ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.violation DROP CONSTRAINT crash;
       public       
   dbalexyrkn    false    218    220    3262            �           2606    41559    contract employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT employee FOREIGN KEY (employee) REFERENCES public.employee(id) ON DELETE SET NULL NOT VALID;
 ;   ALTER TABLE ONLY public.contract DROP CONSTRAINT employee;
       public       
   dbalexyrkn    false    3248    213    215            �           2606    41569    contract insurance    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT insurance FOREIGN KEY (insurance) REFERENCES public.insurance(id) ON DELETE SET NULL NOT VALID;
 <   ALTER TABLE ONLY public.contract DROP CONSTRAINT insurance;
       public       
   dbalexyrkn    false    3244    211    215            �           2606    41549    employee job    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT job FOREIGN KEY (job) REFERENCES public.job(id) ON DELETE CASCADE NOT VALID;
 6   ALTER TABLE ONLY public.employee DROP CONSTRAINT job;
       public       
   dbalexyrkn    false    213    3246    212            �           2606    41622    violation type    FK CONSTRAINT     �   ALTER TABLE ONLY public.violation
    ADD CONSTRAINT type FOREIGN KEY (type) REFERENCES public.violation_type(id) ON DELETE SET NULL;
 8   ALTER TABLE ONLY public.violation DROP CONSTRAINT type;
       public       
   dbalexyrkn    false    3264    219    220            a   �   x���v
Q���W((M��L�KL.Qs�	uV�0�Q "����T��ĒD�����Լu������������RY��ਮi���H# Rw��/�H-�i���T'"L5�Q "����D&X�Mv��� ��H      [   �   x����N�0D����Hq�G�b��"�	�Qv�"���)�����l����e��7;(�]�_/�N�d��q�zȷp��(��?3.B�����2�
J�E��;�)0�6n�fcv��0J��R�ۏF�xzm�Ck����ʿ�x ��\��(NRLX�7$���OX|ĊB�	�؄E3�):
� U�N������h����w�sU�ے$i6��	M84,�Z����_h	a��땆A��$���	��y�!�l~      _   �   x���Qo� ���+�[gl��j�Թ�Tk5�n�Lq%Ah:������qKH��ܜ�p��������뛒����B[x)�dp��������"�ݸ6��'#��)P�0� ����R���ZV��i�:�&�N����CT�IǞ�.���f#o[�5����~tn��!�V���F��-��'>������W@�e��n	^;iC��R�X��K�`3�����<<�� �d�      `   �   x���v
Q���W((M��L�K��+)JL.Qs�	uV�0�Q025�QP7202�54�52TG時x��%�e� V@bf
�6�#Mk.O"�1Zc�b������(!�1�50UG�Y�x���9�%�)H6��&.. �NL�      c   �   x���AK1���+�-
ےl)=x���]�m�'�S�M�iB��	"(������k�~�v@�^1'3�a9��Z�o���w�F�؅��yD�٬J.亴�ɑ�ySR���|`����-�I3L���Kq�P�!�9�O&�q�;R��:SA��Ù<nΏW�hq�p�Fd"�~��#�j���Ku�CuS�}����Ҝ�1��)YU�
cD      ^      x���v
Q���W((M��L�K�-�ɯLMUs�	uV�0�QP�J�KU��,�P�Q 	XZ�����kZsya�P�kY��{Qjj�? f���u��&'�I���b	2�� ��:�      \   q   x���v
Q���W((M��L���+.-J�KNUs�	uV�0�Q045�QPwJ,�LVp�/K-JLOU״��$F����X@Qjnfi.�&M0 ���W�Z�����X��b ��=�      ]   �   x���A�@�ỿbn,QY�N�2P�>n�M��A�>��}���'I�8+ I�#�]Y���L	����0Y(X��)(Xh��� ��>�o��t$�������J�,�E�\�R�lG����f� ����!�C5z6�F�4��R��HS;\������M�      Z   �   x����
�0D���٩��c�J�`Alu�&�ܐ��ަԵ���s�쐧�١8��e���Ŋ*\��s�c8c���A��w鴊���2�wq��Ϯ ����6Ӷ<���iюn���{�O+��i�hx���e<�p�π��?�e<w��%[M��Hy{Ks�����R�yhC_A�| �c      b   h   x���v
Q���W((M��L�+(����KO,���Ss�	uV�0�Q "u##c]C]su#Mk.O"0�G2��h��	�(#` 4��h  ��4�      e   �   x���v
Q���W((M��L�+���I,���Ss�	uV�0�Q�#u��Լu ����X��@���s�/�+buMk.ObL5�Q�#,���x��剕Dj�� G؜j��&f�)������� ��G	      d   �   x���v
Q���W((M��L�+���I,��ϋ/�,HUs�	uV�0�QPH,���KW�+Q�Q05@H�kZsym�PcpAjj
���HR�j��������Q�b��А�Ĵ��d�4�d.. �5RP     