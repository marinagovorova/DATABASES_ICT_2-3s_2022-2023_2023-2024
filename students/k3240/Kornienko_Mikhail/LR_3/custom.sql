PGDMP                  	    {            dbmishakorni #   14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)    16.0 7    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    49483    dbmishakorni    DATABASE     t   CREATE DATABASE dbmishakorni WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE dbmishakorni;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            X           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    4            Y           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    49595    acts    TABLE     �   CREATE TABLE public.acts (
    id integer NOT NULL,
    type character varying(30) NOT NULL,
    date date NOT NULL,
    contract_id integer NOT NULL
);
    DROP TABLE public.acts;
       public         heap    dbmishakorni    false    4            �            1259    49540    cars    TABLE     X  CREATE TABLE public.cars (
    id integer NOT NULL,
    body_number character varying(17) NOT NULL,
    register_number character varying(8) NOT NULL,
    engine_number character varying(17) NOT NULL,
    last_to_date date NOT NULL,
    return_remarks character varying(100),
    model_id integer NOT NULL,
    insurance_id integer NOT NULL
);
    DROP TABLE public.cars;
       public         heap    dbmishakorni    false    4            �            1259    49500    clients    TABLE     /  CREATE TABLE public.clients (
    id integer NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    mobile_phone character varying NOT NULL,
    CONSTRAINT discount CHECK (((discount >= 0) AND (discount <= 100)))
);
    DROP TABLE public.clients;
       public         heap    dbmishakorni    false    4            �            1259    49561 	   contracts    TABLE     n  CREATE TABLE public.contracts (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    state_status character varying(50) NOT NULL,
    paid_status character varying(50) NOT NULL,
    car_id integer NOT NULL,
    client_id integer NOT NULL,
    worker_id integer NOT NULL,
    CONSTRAINT start_date CHECK ((end_date > start_date))
);
    DROP TABLE public.contracts;
       public         heap    dbmishakorni    false    4            �            1259    49582    crashes    TABLE     =  CREATE TABLE public.crashes (
    id integer NOT NULL,
    location character varying(75) NOT NULL,
    guilty character varying(50) NOT NULL,
    date date NOT NULL,
    price integer NOT NULL,
    description character varying NOT NULL,
    contract_id integer NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);
    DROP TABLE public.crashes;
       public         heap    dbmishakorni    false    4            �            1259    49532 
   insurances    TABLE     �   CREATE TABLE public.insurances (
    id integer NOT NULL,
    price integer NOT NULL,
    type character varying NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);
    DROP TABLE public.insurances;
       public         heap    dbmishakorni    false    4            �            1259    49509    models    TABLE     B  CREATE TABLE public.models (
    id integer NOT NULL,
    description character varying(100),
    title character varying(100) NOT NULL,
    year integer NOT NULL,
    price integer NOT NULL,
    brand character varying(100) NOT NULL,
    CONSTRAINT price CHECK ((price > 0)),
    CONSTRAINT year CHECK ((year > 1900))
);
    DROP TABLE public.models;
       public         heap    dbmishakorni    false    4            �            1259    49484 	   positions    TABLE     �   CREATE TABLE public.positions (
    id integer NOT NULL,
    salary integer NOT NULL,
    tasks character varying(100) NOT NULL,
    CONSTRAINT salary CHECK ((salary > 0))
);
    DROP TABLE public.positions;
       public         heap    dbmishakorni    false    4            �            1259    49520    prices    TABLE        CREATE TABLE public.prices (
    id integer NOT NULL,
    model_id integer NOT NULL,
    rent_price integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT end_date CHECK ((end_date > start_date)),
    CONSTRAINT rent_price CHECK ((rent_price >= 0))
);
    DROP TABLE public.prices;
       public         heap    dbmishakorni    false    4            �            1259    49555    traffic_violation    TABLE     �   CREATE TABLE public.traffic_violation (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    price integer NOT NULL,
    CONSTRAINT price CHECK ((price > 0))
);
 %   DROP TABLE public.traffic_violation;
       public         heap    dbmishakorni    false    4            �            1259    49605 
   violations    TABLE       CREATE TABLE public.violations (
    id integer NOT NULL,
    traffic_violation_id integer NOT NULL,
    payer character varying(50) NOT NULL,
    date date NOT NULL,
    location character varying(100) NOT NULL,
    crash_id integer NOT NULL,
    contract_id integer NOT NULL
);
    DROP TABLE public.violations;
       public         heap    dbmishakorni    false    4            �            1259    49490    workers    TABLE     �   CREATE TABLE public.workers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    passport_data character varying(12) NOT NULL,
    position_id integer NOT NULL
);
    DROP TABLE public.workers;
       public         heap    dbmishakorni    false    4            P          0    49595    acts 
   TABLE DATA                 public          dbmishakorni    false    219   @       L          0    49540    cars 
   TABLE DATA                 public          dbmishakorni    false    215   �@       H          0    49500    clients 
   TABLE DATA                 public          dbmishakorni    false    211   zA       N          0    49561 	   contracts 
   TABLE DATA                 public          dbmishakorni    false    217   �B       O          0    49582    crashes 
   TABLE DATA                 public          dbmishakorni    false    218   �C       K          0    49532 
   insurances 
   TABLE DATA                 public          dbmishakorni    false    214   QE       I          0    49509    models 
   TABLE DATA                 public          dbmishakorni    false    212   -F       F          0    49484 	   positions 
   TABLE DATA                 public          dbmishakorni    false    209   .G       J          0    49520    prices 
   TABLE DATA                 public          dbmishakorni    false    213   H       M          0    49555    traffic_violation 
   TABLE DATA                 public          dbmishakorni    false    216   �H       Q          0    49605 
   violations 
   TABLE DATA                 public          dbmishakorni    false    220   �I       G          0    49490    workers 
   TABLE DATA                 public          dbmishakorni    false    210   �J       �           2606    49489    positions Position_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT "Position_pkey" PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.positions DROP CONSTRAINT "Position_pkey";
       public            dbmishakorni    false    209            �           2606    49599    acts acts_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.acts
    ADD CONSTRAINT acts_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.acts DROP CONSTRAINT acts_pkey;
       public            dbmishakorni    false    219            �           2606    49544    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            dbmishakorni    false    215            �           2606    49508    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            dbmishakorni    false    211            �           2606    49566    contracts contracts_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.contracts DROP CONSTRAINT contracts_pkey;
       public            dbmishakorni    false    217            �           2606    49589    crashes crash_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.crashes
    ADD CONSTRAINT crash_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.crashes DROP CONSTRAINT crash_pkey;
       public            dbmishakorni    false    218            �           2606    49539    insurances insurance_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.insurances
    ADD CONSTRAINT insurance_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.insurances DROP CONSTRAINT insurance_pkey;
       public            dbmishakorni    false    214            �           2606    49515    models model_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.models
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.models DROP CONSTRAINT model_pkey;
       public            dbmishakorni    false    212            �           2606    49526    prices price_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.prices
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.prices DROP CONSTRAINT price_pkey;
       public            dbmishakorni    false    213            �           2606    49560 (   traffic_violation traffic_violation_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.traffic_violation
    ADD CONSTRAINT traffic_violation_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.traffic_violation DROP CONSTRAINT traffic_violation_pkey;
       public            dbmishakorni    false    216            �           2606    49609    violations violations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.violations
    ADD CONSTRAINT violations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.violations DROP CONSTRAINT violations_pkey;
       public            dbmishakorni    false    220            �           2606    49494    workers workers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.workers DROP CONSTRAINT workers_pkey;
       public            dbmishakorni    false    210            �           2606    49567    contracts car    FK CONSTRAINT     }   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT car FOREIGN KEY (car_id) REFERENCES public.cars(id) ON DELETE SET NULL;
 7   ALTER TABLE ONLY public.contracts DROP CONSTRAINT car;
       public          dbmishakorni    false    215    3236    217            �           2606    49572    contracts client    FK CONSTRAINT     �   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT client FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE SET NULL;
 :   ALTER TABLE ONLY public.contracts DROP CONSTRAINT client;
       public          dbmishakorni    false    211    217    3228            �           2606    49590    crashes contract    FK CONSTRAINT     �   ALTER TABLE ONLY public.crashes
    ADD CONSTRAINT contract FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE SET NULL;
 :   ALTER TABLE ONLY public.crashes DROP CONSTRAINT contract;
       public          dbmishakorni    false    217    218    3240            �           2606    49600    acts contract    FK CONSTRAINT     �   ALTER TABLE ONLY public.acts
    ADD CONSTRAINT contract FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE CASCADE;
 7   ALTER TABLE ONLY public.acts DROP CONSTRAINT contract;
       public          dbmishakorni    false    219    217    3240            �           2606    49620    violations contract    FK CONSTRAINT     �   ALTER TABLE ONLY public.violations
    ADD CONSTRAINT contract FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE SET NULL;
 =   ALTER TABLE ONLY public.violations DROP CONSTRAINT contract;
       public          dbmishakorni    false    220    3240    217            �           2606    49615    violations crash    FK CONSTRAINT     �   ALTER TABLE ONLY public.violations
    ADD CONSTRAINT crash FOREIGN KEY (crash_id) REFERENCES public.crashes(id) ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.violations DROP CONSTRAINT crash;
       public          dbmishakorni    false    3242    218    220            �           2606    49550    cars insurance    FK CONSTRAINT     �   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT insurance FOREIGN KEY (insurance_id) REFERENCES public.insurances(id) ON DELETE SET NULL;
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT insurance;
       public          dbmishakorni    false    214    3234    215            �           2606    49527    prices model    FK CONSTRAINT        ALTER TABLE ONLY public.prices
    ADD CONSTRAINT model FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;
 6   ALTER TABLE ONLY public.prices DROP CONSTRAINT model;
       public          dbmishakorni    false    212    213    3230            �           2606    49545 
   cars model    FK CONSTRAINT     }   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT model FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;
 4   ALTER TABLE ONLY public.cars DROP CONSTRAINT model;
       public          dbmishakorni    false    215    3230    212            �           2606    49495    workers position    FK CONSTRAINT     �   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT "position" FOREIGN KEY (position_id) REFERENCES public.positions(id) ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.workers DROP CONSTRAINT "position";
       public          dbmishakorni    false    3224    209    210            �           2606    49610    violations traffic_violation    FK CONSTRAINT     �   ALTER TABLE ONLY public.violations
    ADD CONSTRAINT traffic_violation FOREIGN KEY (traffic_violation_id) REFERENCES public.traffic_violation(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.violations DROP CONSTRAINT traffic_violation;
       public          dbmishakorni    false    216    220    3238            �           2606    49577    contracts worker    FK CONSTRAINT     �   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT worker FOREIGN KEY (worker_id) REFERENCES public.workers(id) ON DELETE SET NULL;
 :   ALTER TABLE ONLY public.contracts DROP CONSTRAINT worker;
       public          dbmishakorni    false    3226    210    217            P      x���v
Q���W((M��L�KL.)Vs�	uV�0�QP����/LP����ut�<CMk.O!��b��gD��&�`�a�	�(� y&D`�0`
��@�)� .. NJd$      L   �   x��ͽ
�0�O��
�$7�?89t(�
�u�N��(��? ">Q�[�KMv��=�/͋dQ�4/�lw\o7��^�l9˪�`=�м����C�Tz8O8�����ù����9��7�Ԁ������WY1��i��ѡ��_Kwj��8t�ҥ_����H���젫�����t�F�"gU]�t�׵�;5�5�8�Q�7��p      H   6  x����J�@@����Eq)��&���C�`�`�P("��h/����k��Ʀ��0�G�nc�x���ٝ�y�v�V��ہ��ف㳃~����{�G�'�����l�g0p�G��~��ȥ�`� |ù>_�b��p��=�b��]�t����{������ _1�:]�7u�K��}���1j�
��"�'����)�Tৱ2���;���[�ꁾ�	T/}9��W�K���ciu�wH�1mk�
�@JϪO�x�RA�%[a�o,tB�ˍ�3�1����ê�z����V*��ؠ��<�q      N   �   x���v
Q���W((M��L�K��+)JL.)Vs�	uV�0�QP7202�50"u��H�̻0�®�Mv\�ta���;�b�.쿰����^�{aP��4��<����V#[�6L��h�֋;.N��,6��V��0�6� b�6F���j#K<lA��j�l�	��8=�i�	k�)���(����+�`6� ��\\ /��{      O   �  x����J�@��}���`%M<x��CA*��]���A,��*x��)�ҋ�i��O�+̾��̦z�h!���ٙ��MR�TK5U��������y}�~u�8;m��ݽ�RU�6��(5-�҈�5�_xE�Z,(�����D��p�+E#%0w�M��t(1�)�䛦��� 偷#�c#��REC��gQ��ɕ��wa �S��S�Rdhn�Eϛ0�(���t!�[��]+j�%pE��)%Fo+c��Io�R�j<�!��4��h�i�L����@��/�m���Y�Dk�W<68ń�*�lJ��㮷n�tQ�u'�#��4CХ��1�e{�쉟��	s��;���U�[�
x�T\�̷Fj�ǖ�\3�cA}�)������x�O�=�C_R�;`�m�9�0B���0�r_pM�      K   �   x���v
Q���W((M��L���+.-J�KN-Vs�	uV�0�Q0500�QP�0���.L�0O]Ӛ˓(�F:
�P����I��(�CuO����n �{a��~���T�Ŧ�7���W�_�4m/�ܪ@��Lu��F-��t��V�a�.l �d辋M
@�֋�ہ��@���}�U�b���A�@�lY�� �2��      I   �   x���v
Q���W((M��L���OI�)Vs�	uV�0�QP�����[.l��Wěsa�����=& E��tL@ (���i��I�l#�iK/�^l��~a#��]�O�oh��`3?$�2��H�A�ͺ�pa��Ƌ�@s7]�z�ÖI_ �jh ���7�8;L �����7]��J�!���Q07��I�L�^ �F�7v ��B�S ^ �����Eɩ)�� ��� ��z      F   �   x���v
Q���W((M��L�+�/�,���+Vs�	uV�0�Q05 ��/6\�wa˅6]�z�M]Ӛ˓3�t�`f̹���^ �raЌ��/�p����M6�Q0���h^+��ہ���.츰S��r,����n�d��&��7�Q�����@go��
�aׅ�D�m��`	3{��f��}�`��Y[/�أpa��Ĺ�d0 ���A      J   �   x��ϱ
1��O��
��I����9�;} ��C�����N�K�_J?t�J?�`y��Y��t��p�t�"�7"B�L,����%ѯ����A��P\Qx�F	��v�T�4�JZ�*UT
BmTF��>�+*�V9�sJY�      M   �   x����JQ���g��ĘI�V-\�AZ�0A����i-}�6�+S�&��^�;o�wn� ����\���wn��w.��r7��ģ���p<�G��t2���[�:�^v�Ro6��w}�C�+}�Y �]`���.t��֐v�Q���#!�4��A*�8������҂�\��y���V7�v�JR��i**7�$�T�
?��#̱�߬q²�.�A�.+~����5�ꊶ)^٧��������>Ō[N�e���K������      Q   #  x����J�P��y���T��d��E�`�{u(��e�
R�����1�>��șiEP���!3�7_��;��.%���^�ғ��t�;:O�3:��=huh#����=f��������۴a��
X�+T�ct2����Z$듕�',�9&�gn�2ai��*�E7�ܰ�j�+��]�=7gk�C�Bɼ�J��x'FH��#�
���H��J���
k�#�"	���X}̹s.��G���\����tT��Kč�*^�S�u�R��k�o��~��v�y5�
���S�      G   �   x���v
Q���W((M��L�+�/�N-*Vs�	uV�0�QP�0��v\�W����V s�@���u��������������o�i��I�`#���5]lP�0��n���.6B�d�1�oD��� c�4h�{/lP�0	��;.�؃p7��&@�1q��,� 4v0�^ة �ą}w#�j
�g�)�ةv���� ���s5��f@�)�x.. v���     