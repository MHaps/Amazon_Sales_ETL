PGDMP  	    4        
    
    {            Skytrips    16.0    16.0 :               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16492    Skytrips    DATABASE     �   CREATE DATABASE "Skytrips" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Skytrips";
                postgres    false            �            1259    16537    flightreservation    TABLE     �  CREATE TABLE public.flightreservation (
    id integer NOT NULL,
    trippassengerid integer NOT NULL,
    pnr character varying(50),
    reservationstatusid integer NOT NULL,
    reservationprovidercode character varying(10) NOT NULL,
    airlinecode character varying(20) NOT NULL,
    journeytypeid integer NOT NULL,
    lastdatetoticket timestamp without time zone,
    confirmationlink character varying(250),
    farecategoryid integer NOT NULL,
    formofpaymenttypecode character(2) NOT NULL,
    specialratecode character varying(50),
    originairportcode character(3),
    destinationairportcode character(3),
    departuredate timestamp without time zone,
    returndate timestamp without time zone,
    creationdate timestamp without time zone,
    creationprofileid integer,
    farerestrictioncode character(1) NOT NULL,
    farerestrictiondescription character varying(50) NOT NULL,
    isautomated boolean DEFAULT true NOT NULL,
    arrivaldate timestamp without time zone DEFAULT '1917-01-01 00:00:00'::timestamp without time zone NOT NULL,
    manualticketnumber text,
    pcc character varying(50),
    agentid integer,
    isimported boolean DEFAULT false NOT NULL,
    istransfered boolean DEFAULT false NOT NULL,
    outofpolicymessage text,
    origincitycode character varying(3),
    destinationcitycode character varying(3),
    fareladder text,
    parentreservationid integer DEFAULT 0 NOT NULL,
    flightsearchhistoryid integer DEFAULT 0 NOT NULL,
    faretypeid integer,
    conflictmessage text,
    isrequiredpassport boolean DEFAULT false NOT NULL,
    isbypassedapproval boolean DEFAULT false NOT NULL,
    isexceedspricelimit boolean DEFAULT false NOT NULL,
    queuenumber character varying(50),
    categorynumber character varying(50),
    isawaitingcancellation boolean DEFAULT false NOT NULL,
    manualticketissuedate timestamp without time zone,
    isticketpricechanged boolean DEFAULT false NOT NULL,
    cancellationdate timestamp without time zone,
    isfakebooking boolean DEFAULT false NOT NULL,
    fillalternates boolean DEFAULT false NOT NULL,
    isldtkcancellation boolean DEFAULT false NOT NULL,
    ispricechanged boolean DEFAULT false NOT NULL,
    costcenterlocked boolean,
    tstccbookingref character varying(50),
    bookonhold boolean DEFAULT false NOT NULL,
    outofpolicynote character varying(500),
    isoutofpolicy boolean,
    termsandconditions character varying(2000),
    note character varying(1000),
    supplier character varying(200),
    requireagentconfirmation boolean DEFAULT false NOT NULL,
    agentconfirmationdate timestamp without time zone,
    stoppricesynchronization boolean DEFAULT false NOT NULL,
    requestedbyprofileid integer,
    requesteddate timestamp without time zone,
    stopsynchronization boolean DEFAULT false NOT NULL,
    isaddedtoexistingskyd boolean,
    issidetrip boolean,
    confirmationnumber text,
    isupgradedfare boolean DEFAULT false NOT NULL,
    originalselectionprice numeric(18,2),
    brandedfarename character varying(1000),
    brandedfareid character varying(1000),
    passivepnr character varying(20),
    stopautoticket boolean,
    creditcardid integer,
    isseaman boolean DEFAULT false NOT NULL
);
 %   DROP TABLE public.flightreservation;
       public         heap    postgres    false            �            1259    16536    flightreservation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flightreservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.flightreservation_id_seq;
       public          postgres    false    222                       0    0    flightreservation_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.flightreservation_id_seq OWNED BY public.flightreservation.id;
          public          postgres    false    221            �            1259    16518    flightreservationalternate    TABLE     �  CREATE TABLE public.flightreservationalternate (
    id integer NOT NULL,
    flightreservationalternatehistoryid integer NOT NULL,
    reservationprovidercode character varying(10) NOT NULL,
    pcc character varying(50),
    airlinecode character(2) NOT NULL,
    journeytypeid integer NOT NULL,
    lastdatetoticket timestamp without time zone,
    farecategoryid integer NOT NULL,
    specialratecode character varying(50),
    originairportcode character(3),
    origincitycode character varying(3),
    destinationairportcode character(3),
    destinationcitycode character varying(3),
    departuredate timestamp without time zone,
    returndate timestamp without time zone,
    farerestrictioncode character(1) NOT NULL,
    farerestrictiondescription character varying(50) NOT NULL,
    arrivaldate timestamp without time zone DEFAULT '1917-01-01 00:00:00'::timestamp without time zone NOT NULL,
    isrecommended boolean NOT NULL,
    faretypeid integer,
    ispriceexceeds boolean DEFAULT false NOT NULL,
    isuserselection boolean,
    isneutralsearch boolean DEFAULT true NOT NULL,
    isllf boolean DEFAULT false NOT NULL,
    isoriginalselection boolean,
    isseaman boolean DEFAULT false NOT NULL
);
 .   DROP TABLE public.flightreservationalternate;
       public         heap    postgres    false            �            1259    16517 !   flightreservationalternate_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flightreservationalternate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.flightreservationalternate_id_seq;
       public          postgres    false    218                        0    0 !   flightreservationalternate_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.flightreservationalternate_id_seq OWNED BY public.flightreservationalternate.id;
          public          postgres    false    217            �            1259    16530 !   flightreservationalternatehistory    TABLE     �   CREATE TABLE public.flightreservationalternatehistory (
    id integer NOT NULL,
    flightreservationid integer NOT NULL,
    date timestamp without time zone NOT NULL
);
 5   DROP TABLE public.flightreservationalternatehistory;
       public         heap    postgres    false            �            1259    16529 (   flightreservationalternatehistory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flightreservationalternatehistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.flightreservationalternatehistory_id_seq;
       public          postgres    false    220            !           0    0 (   flightreservationalternatehistory_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.flightreservationalternatehistory_id_seq OWNED BY public.flightreservationalternatehistory.id;
          public          postgres    false    219            �            1259    16506    flightsegmentalternate    TABLE     S  CREATE TABLE public.flightsegmentalternate (
    id integer NOT NULL,
    flightreservationalternateid integer NOT NULL,
    sequencenumber integer NOT NULL,
    originairportcode character(3) NOT NULL,
    origincitycode character varying(3),
    destinationairportcode character(3) NOT NULL,
    destinationcitycode character varying(3),
    departuredate timestamp without time zone NOT NULL,
    arrivaldate timestamp without time zone NOT NULL,
    operatingairlinecode character(2),
    airlinecode character(2) NOT NULL,
    flightnumber character varying(10) NOT NULL,
    cabinclasscode character(1) NOT NULL,
    iseticketeligible boolean NOT NULL,
    cabintypedescription character varying(100) NOT NULL,
    transportationtypecode character varying(2) NOT NULL,
    traveltime character varying(10),
    journeytime character varying(10),
    isoutbound boolean,
    groupedindex integer DEFAULT 0 NOT NULL,
    ispreferred boolean DEFAULT false NOT NULL,
    isavoided boolean DEFAULT false NOT NULL,
    isnegotiated boolean DEFAULT false NOT NULL,
    isgr boolean DEFAULT false NOT NULL
);
 *   DROP TABLE public.flightsegmentalternate;
       public         heap    postgres    false            �            1259    16505    flightsegmentalternate_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flightsegmentalternate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.flightsegmentalternate_id_seq;
       public          postgres    false    216            "           0    0    flightsegmentalternate_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.flightsegmentalternate_id_seq OWNED BY public.flightsegmentalternate.id;
          public          postgres    false    215            �            1259    16592    project    TABLE     �   CREATE TABLE public.project (
    id integer NOT NULL,
    projectcode character varying(50) NOT NULL,
    projectdescription text,
    isactive boolean,
    creationdate timestamp without time zone,
    countrycode character varying(3)
);
    DROP TABLE public.project;
       public         heap    postgres    false            �            1259    16591    project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.project_id_seq;
       public          postgres    false    228            #           0    0    project_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;
          public          postgres    false    227            �            1259    16585    trip    TABLE     }  CREATE TABLE public.trip (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    reason character varying(150),
    creationdate timestamp without time zone,
    creationprofileid integer,
    lastreservationdate timestamp without time zone NOT NULL,
    agentid integer,
    tripreasonid integer,
    referencecode character varying(50),
    projectid integer
);
    DROP TABLE public.trip;
       public         heap    postgres    false            �            1259    16584    trip_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.trip_id_seq;
       public          postgres    false    226            $           0    0    trip_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.trip_id_seq OWNED BY public.trip.id;
          public          postgres    false    225            �            1259    16567    trippassenger    TABLE     ~  CREATE TABLE public.trippassenger (
    id integer NOT NULL,
    tripid integer NOT NULL,
    superpnr character varying(50) NOT NULL,
    hasflightreservations boolean NOT NULL,
    hashotelreservations boolean NOT NULL,
    hascarreservations boolean NOT NULL,
    profileid integer NOT NULL,
    hasmiscreservations boolean DEFAULT false NOT NULL,
    isexpensesubmitted boolean DEFAULT false NOT NULL,
    modefieddate timestamp without time zone,
    hasactivereservation boolean DEFAULT false,
    cashadvanceamount double precision DEFAULT 0 NOT NULL,
    currencycode character varying(3) DEFAULT 'LBP'::character varying NOT NULL,
    isauthorizedpayment boolean DEFAULT false NOT NULL,
    isapprovalsubmitted boolean DEFAULT false NOT NULL,
    istraveling boolean DEFAULT true NOT NULL,
    requestedprofileid integer,
    submitexpenseprofileid integer,
    submitdate timestamp without time zone,
    wasauthorizedpayment boolean DEFAULT false NOT NULL,
    isunlockrequested boolean DEFAULT false NOT NULL,
    egmtosubmitprofileid integer,
    isrequestapprovalagain boolean,
    isitinerarychange boolean,
    costcenterid integer,
    ordernumber character varying(50),
    ispendingapprovalrequest boolean,
    hasadditionalservices boolean DEFAULT false NOT NULL,
    autoreferencenumber integer,
    invoicereferencenumber character varying(50),
    agentrequestedprofileid integer
);
 !   DROP TABLE public.trippassenger;
       public         heap    postgres    false            �            1259    16566    trippassenger_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trippassenger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.trippassenger_id_seq;
       public          postgres    false    224            %           0    0    trippassenger_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.trippassenger_id_seq OWNED BY public.trippassenger.id;
          public          postgres    false    223            E           2604    16540    flightreservation id    DEFAULT     |   ALTER TABLE ONLY public.flightreservation ALTER COLUMN id SET DEFAULT nextval('public.flightreservation_id_seq'::regclass);
 C   ALTER TABLE public.flightreservation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            >           2604    16521    flightreservationalternate id    DEFAULT     �   ALTER TABLE ONLY public.flightreservationalternate ALTER COLUMN id SET DEFAULT nextval('public.flightreservationalternate_id_seq'::regclass);
 L   ALTER TABLE public.flightreservationalternate ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            D           2604    16533 $   flightreservationalternatehistory id    DEFAULT     �   ALTER TABLE ONLY public.flightreservationalternatehistory ALTER COLUMN id SET DEFAULT nextval('public.flightreservationalternatehistory_id_seq'::regclass);
 S   ALTER TABLE public.flightreservationalternatehistory ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            8           2604    16509    flightsegmentalternate id    DEFAULT     �   ALTER TABLE ONLY public.flightsegmentalternate ALTER COLUMN id SET DEFAULT nextval('public.flightsegmentalternate_id_seq'::regclass);
 H   ALTER TABLE public.flightsegmentalternate ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            h           2604    16595 
   project id    DEFAULT     h   ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);
 9   ALTER TABLE public.project ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            g           2604    16588    trip id    DEFAULT     b   ALTER TABLE ONLY public.trip ALTER COLUMN id SET DEFAULT nextval('public.trip_id_seq'::regclass);
 6   ALTER TABLE public.trip ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            [           2604    16570    trippassenger id    DEFAULT     t   ALTER TABLE ONLY public.trippassenger ALTER COLUMN id SET DEFAULT nextval('public.trippassenger_id_seq'::regclass);
 ?   ALTER TABLE public.trippassenger ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224                      0    16537    flightreservation 
   TABLE DATA             COPY public.flightreservation (id, trippassengerid, pnr, reservationstatusid, reservationprovidercode, airlinecode, journeytypeid, lastdatetoticket, confirmationlink, farecategoryid, formofpaymenttypecode, specialratecode, originairportcode, destinationairportcode, departuredate, returndate, creationdate, creationprofileid, farerestrictioncode, farerestrictiondescription, isautomated, arrivaldate, manualticketnumber, pcc, agentid, isimported, istransfered, outofpolicymessage, origincitycode, destinationcitycode, fareladder, parentreservationid, flightsearchhistoryid, faretypeid, conflictmessage, isrequiredpassport, isbypassedapproval, isexceedspricelimit, queuenumber, categorynumber, isawaitingcancellation, manualticketissuedate, isticketpricechanged, cancellationdate, isfakebooking, fillalternates, isldtkcancellation, ispricechanged, costcenterlocked, tstccbookingref, bookonhold, outofpolicynote, isoutofpolicy, termsandconditions, note, supplier, requireagentconfirmation, agentconfirmationdate, stoppricesynchronization, requestedbyprofileid, requesteddate, stopsynchronization, isaddedtoexistingskyd, issidetrip, confirmationnumber, isupgradedfare, originalselectionprice, brandedfarename, brandedfareid, passivepnr, stopautoticket, creditcardid, isseaman) FROM stdin;
    public          postgres    false    222   �k                 0    16518    flightreservationalternate 
   TABLE DATA           �  COPY public.flightreservationalternate (id, flightreservationalternatehistoryid, reservationprovidercode, pcc, airlinecode, journeytypeid, lastdatetoticket, farecategoryid, specialratecode, originairportcode, origincitycode, destinationairportcode, destinationcitycode, departuredate, returndate, farerestrictioncode, farerestrictiondescription, arrivaldate, isrecommended, faretypeid, ispriceexceeds, isuserselection, isneutralsearch, isllf, isoriginalselection, isseaman) FROM stdin;
    public          postgres    false    218   �k                 0    16530 !   flightreservationalternatehistory 
   TABLE DATA           Z   COPY public.flightreservationalternatehistory (id, flightreservationid, date) FROM stdin;
    public          postgres    false    220   �k                 0    16506    flightsegmentalternate 
   TABLE DATA           �  COPY public.flightsegmentalternate (id, flightreservationalternateid, sequencenumber, originairportcode, origincitycode, destinationairportcode, destinationcitycode, departuredate, arrivaldate, operatingairlinecode, airlinecode, flightnumber, cabinclasscode, iseticketeligible, cabintypedescription, transportationtypecode, traveltime, journeytime, isoutbound, groupedindex, ispreferred, isavoided, isnegotiated, isgr) FROM stdin;
    public          postgres    false    216   �k                 0    16592    project 
   TABLE DATA           k   COPY public.project (id, projectcode, projectdescription, isactive, creationdate, countrycode) FROM stdin;
    public          postgres    false    228   �k                 0    16585    trip 
   TABLE DATA           �   COPY public.trip (id, name, reason, creationdate, creationprofileid, lastreservationdate, agentid, tripreasonid, referencecode, projectid) FROM stdin;
    public          postgres    false    226   l                 0    16567    trippassenger 
   TABLE DATA           b  COPY public.trippassenger (id, tripid, superpnr, hasflightreservations, hashotelreservations, hascarreservations, profileid, hasmiscreservations, isexpensesubmitted, modefieddate, hasactivereservation, cashadvanceamount, currencycode, isauthorizedpayment, isapprovalsubmitted, istraveling, requestedprofileid, submitexpenseprofileid, submitdate, wasauthorizedpayment, isunlockrequested, egmtosubmitprofileid, isrequestapprovalagain, isitinerarychange, costcenterid, ordernumber, ispendingapprovalrequest, hasadditionalservices, autoreferencenumber, invoicereferencenumber, agentrequestedprofileid) FROM stdin;
    public          postgres    false    224   5l       &           0    0    flightreservation_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.flightreservation_id_seq', 1, false);
          public          postgres    false    221            '           0    0 !   flightreservationalternate_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.flightreservationalternate_id_seq', 1, false);
          public          postgres    false    217            (           0    0 (   flightreservationalternatehistory_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.flightreservationalternatehistory_id_seq', 1, false);
          public          postgres    false    219            )           0    0    flightsegmentalternate_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.flightsegmentalternate_id_seq', 1, false);
          public          postgres    false    215            *           0    0    project_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.project_id_seq', 1, false);
          public          postgres    false    227            +           0    0    trip_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.trip_id_seq', 1, false);
          public          postgres    false    225            ,           0    0    trippassenger_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.trippassenger_id_seq', 1, false);
          public          postgres    false    223            p           2606    16565 (   flightreservation flightreservation_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.flightreservation
    ADD CONSTRAINT flightreservation_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.flightreservation DROP CONSTRAINT flightreservation_pkey;
       public            postgres    false    222            l           2606    16528 :   flightreservationalternate flightreservationalternate_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.flightreservationalternate
    ADD CONSTRAINT flightreservationalternate_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.flightreservationalternate DROP CONSTRAINT flightreservationalternate_pkey;
       public            postgres    false    218            n           2606    16535 H   flightreservationalternatehistory flightreservationalternatehistory_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.flightreservationalternatehistory
    ADD CONSTRAINT flightreservationalternatehistory_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.flightreservationalternatehistory DROP CONSTRAINT flightreservationalternatehistory_pkey;
       public            postgres    false    220            j           2606    16516 2   flightsegmentalternate flightsegmentalternate_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.flightsegmentalternate
    ADD CONSTRAINT flightsegmentalternate_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.flightsegmentalternate DROP CONSTRAINT flightsegmentalternate_pkey;
       public            postgres    false    216            v           2606    16599    project project_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public            postgres    false    228            t           2606    16590    trip trip_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.trip DROP CONSTRAINT trip_pkey;
       public            postgres    false    226            r           2606    16583     trippassenger trippassenger_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.trippassenger
    ADD CONSTRAINT trippassenger_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.trippassenger DROP CONSTRAINT trippassenger_pkey;
       public            postgres    false    224            z           2606    16630 4   flightreservation fk_flightreservation_trippassenger    FK CONSTRAINT     �   ALTER TABLE ONLY public.flightreservation
    ADD CONSTRAINT fk_flightreservation_trippassenger FOREIGN KEY (trippassengerid) REFERENCES public.trippassenger(id);
 ^   ALTER TABLE ONLY public.flightreservation DROP CONSTRAINT fk_flightreservation_trippassenger;
       public          postgres    false    222    224    4722            x           2606    16620 Z   flightreservationalternate fk_flightreservationalternate_flightreservationalternatehistory    FK CONSTRAINT     �   ALTER TABLE ONLY public.flightreservationalternate
    ADD CONSTRAINT fk_flightreservationalternate_flightreservationalternatehistory FOREIGN KEY (flightreservationalternatehistoryid) REFERENCES public.flightreservationalternatehistory(id);
 �   ALTER TABLE ONLY public.flightreservationalternate DROP CONSTRAINT fk_flightreservationalternate_flightreservationalternatehistory;
       public          postgres    false    218    4718    220            y           2606    16625 X   flightreservationalternatehistory fk_flightreservationalternatehistory_flightreservation    FK CONSTRAINT     �   ALTER TABLE ONLY public.flightreservationalternatehistory
    ADD CONSTRAINT fk_flightreservationalternatehistory_flightreservation FOREIGN KEY (flightreservationid) REFERENCES public.flightreservation(id);
 �   ALTER TABLE ONLY public.flightreservationalternatehistory DROP CONSTRAINT fk_flightreservationalternatehistory_flightreservation;
       public          postgres    false    4720    220    222            w           2606    16615 L   flightsegmentalternate fk_flightsegmentalternate_flightreservationalternate1    FK CONSTRAINT     �   ALTER TABLE ONLY public.flightsegmentalternate
    ADD CONSTRAINT fk_flightsegmentalternate_flightreservationalternate1 FOREIGN KEY (flightreservationalternateid) REFERENCES public.flightreservationalternate(id) ON UPDATE CASCADE ON DELETE CASCADE;
 v   ALTER TABLE ONLY public.flightsegmentalternate DROP CONSTRAINT fk_flightsegmentalternate_flightreservationalternate1;
       public          postgres    false    218    216    4716            {           2606    16635 #   trippassenger fk_trippassenger_trip    FK CONSTRAINT     �   ALTER TABLE ONLY public.trippassenger
    ADD CONSTRAINT fk_trippassenger_trip FOREIGN KEY (tripid) REFERENCES public.trip(id);
 M   ALTER TABLE ONLY public.trippassenger DROP CONSTRAINT fk_trippassenger_trip;
       public          postgres    false    224    226    4724                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     