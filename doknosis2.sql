--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: explanation; Type: TABLE; Schema: public; Owner: doknosis
--

CREATE TABLE explanation (
    id integer NOT NULL,
    name text NOT NULL,
    icd10 text,
    type integer
);



--
-- Name: explanation_id_seq; Type: SEQUENCE; Schema: public; Owner: doknosis
--

CREATE SEQUENCE explanation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: explanation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doknosis
--

ALTER SEQUENCE explanation_id_seq OWNED BY explanation.id;


--
-- Name: explanation_location; Type: TABLE; Schema: public; Owner: doknosis
--

CREATE TABLE explanation_location (
    id integer NOT NULL,
    explanation_id integer NOT NULL,
    location_id integer NOT NULL
);




--
-- Name: explanation_location_id_seq; Type: SEQUENCE; Schema: public; Owner: doknosis
--

CREATE SEQUENCE explanation_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: explanation_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doknosis
--

ALTER SEQUENCE explanation_location_id_seq OWNED BY explanation_location.id;


--
-- Name: explanation_observation; Type: TABLE; Schema: public; Owner: doknosis
--

CREATE TABLE explanation_observation (
    id integer NOT NULL,
    explanation_id integer NOT NULL,
    observation_id integer NOT NULL,
    weight real NOT NULL
);




--
-- Name: explanation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: doknosis
--

CREATE SEQUENCE explanation_observation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: explanation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doknosis
--

ALTER SEQUENCE explanation_observation_id_seq OWNED BY explanation_observation.id;


--
-- Name: explanation_type; Type: TABLE; Schema: public; Owner: doknosis
--

CREATE TABLE explanation_type (
    id integer NOT NULL,
    name text NOT NULL
);




--
-- Name: location; Type: TABLE; Schema: public; Owner: doknosis
--

CREATE TABLE location (
    id integer NOT NULL,
    name text NOT NULL
);



--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: doknosis
--

CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doknosis
--

ALTER SEQUENCE location_id_seq OWNED BY location.id;


--
-- Name: observation; Type: TABLE; Schema: public; Owner: doknosis
--

CREATE TABLE observation (
    id integer NOT NULL,
    name text NOT NULL,
    type integer DEFAULT 1 NOT NULL
);




--
-- Name: observation_id_seq; Type: SEQUENCE; Schema: public; Owner: doknosis
--

CREATE SEQUENCE observation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doknosis
--

ALTER SEQUENCE observation_id_seq OWNED BY observation.id;


--
-- Name: observation_type; Type: TABLE; Schema: public; Owner: doknosis
--

CREATE TABLE observation_type (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: doknosis
--

CREATE TABLE users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    authenticated boolean DEFAULT false NOT NULL
);




--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: doknosis
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doknosis
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: explanation id; Type: DEFAULT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation ALTER COLUMN id SET DEFAULT nextval('explanation_id_seq'::regclass);


--
-- Name: explanation_location id; Type: DEFAULT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_location ALTER COLUMN id SET DEFAULT nextval('explanation_location_id_seq'::regclass);


--
-- Name: explanation_observation id; Type: DEFAULT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_observation ALTER COLUMN id SET DEFAULT nextval('explanation_observation_id_seq'::regclass);


--
-- Name: location id; Type: DEFAULT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);


--
-- Name: observation id; Type: DEFAULT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY observation ALTER COLUMN id SET DEFAULT nextval('observation_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: explanation; Type: TABLE DATA; Schema: public; Owner: doknosis
--

COPY explanation (id, name, icd10, type) FROM stdin;
1	Abdominal aortic aneurysm	\N	1
56	Bronchiolitis (RSV)	\N	\N
112	Acute upper respiratory infection	\N	\N
125	Pyloric stricture	\N	\N
30	Acne	\N	1
144	Alcoholic cirrhosis	\N	\N
192	Anal fissure	\N	\N
198	Obsessive-compulsive personality disorder	\N	\N
218	Aortic aneurysm	\N	\N
247	Aortic dissection	\N	\N
290	Lipoma	\N	\N
311	Botulism - neurologic syndrome	\N	\N
322	Bunyaviridae infections - misc.	\N	\N
397	Decompression sickness	\N	\N
398	Acute gas embolism	\N	\N
403	Calculus of urinary tract	\N	\N
421	Cataract	\N	\N
431	Cephalohematoma	\N	\N
432	Caput succedaneum	\N	\N
453	Chlamydophila pneumoniae infection	\N	\N
467	Chondromalacia patellae	\N	\N
511	Chronic obstructive pulmonary disease with acute exacerbation	\N	\N
622	Coxa plana (AKA Legg-Calve-Perthes Disease)	\N	\N
643	Cutaneous t-cell lymphoma	\N	\N
645	Cutis rhomboidalis nuchae	\N	\N
705	Dislocation of elbow	\N	\N
735	Antisocial personality disorder	\N	\N
745	Duodenal atresia	\N	\N
790	Echinococcosis - extrahepatic	\N	\N
851	Erysipelothrix rhusiopathiae	\N	\N
928	Fracture of distal both ulna and radius	\N	\N
929	Fracture of distal femur	\N	\N
930	Fracture of distal humerus	\N	\N
931	Fracture of distal radius	\N	\N
932	Fracture of distal tibia	\N	\N
934	Fracture of lower limb	\N	\N
942	Scaphoid fracture	\N	\N
946	Fracture of wrist and hand	\N	\N
952	Fracture of cervical vertebra	\N	\N
969	Fracture of shoulder girdle	\N	\N
972	Fracture of spine	\N	\N
982	Fracture of upper limb	\N	\N
984	Fragile x syndrome	\N	\N
994	Gastroesophageal laceration-hemorrhage syndrome	\N	\N
995	Gastroesophageal reflux disease (GERD)	\N	\N
1013	Glucose-6-phosphate dehydrogenase (G6PD) deficiency	\N	\N
1089	Hordeolum (stye)	\N	\N
1098	Hyper IgD syndrome	\N	\N
1099	Hyper Immunoglobulin E (IgE) syndrome	\N	\N
1103	Hyperparathyroidism	\N	\N
1108	Hypervitaminosis D (Vitamin D toxicity)	\N	\N
1146	Infectious mononucleosis or EBV	\N	\N
1190	Klinefelter's syndrome karyotype 47 XXY	\N	\N
1191	Klinefelter's syndrome, male with 46 XX karyotype	\N	\N
1201	Lateral epicondylitis (tennis elbow)	\N	\N
1203	Left bundle-branch block	\N	\N
1215	Leukoplakia of oral epithelium, including tongue	\N	\N
1231	Listeriosis, unspecified	\N	\N
1237	Lyme disease	\N	\N
1267	McLeod syndrome (not MacLeod's)	\N	\N
1279	Meningococcemia	\N	\N
1286	Mitral insufficiency	\N	\N
1287	Mitral prolapse	\N	\N
1290	Meniere's disease	\N	\N
1295	Monoclonal gammopathy of undetermined significance (MGUS)	\N	\N
1304	Mucormycosis	\N	\N
1318	Mycobacterium avium-intracellulare (MAC)	\N	\N
1320	Mycoplasma pneumoniae infection	\N	\N
1327	Naegleriasis	\N	\N
1330	Necrotizing fasciitis	\N	\N
1338	Niacin deficiency (pellagra)	\N	\N
1340	Non-hodgkin lymphoma	\N	\N
1344	Hypertrophic obstructive cardiomyopathy (HOCM)	\N	\N
1345	Esophageal varices	\N	\N
1346	Esophagitis	\N	\N
1347	Esophagostomiasis	\N	\N
1368	Panniculitis	\N	\N
1379	Patau syndrome	\N	\N
1390	Penicilliosis	\N	\N
1422	Pneumocystis jirovecii pneumonia (PCP)	\N	\N
1425	Aspiration pneumonia	\N	\N
1433	Polycystic kidney disease	\N	\N
1434	Polycystic ovarian syndrome (PCOS)	\N	\N
1442	Post-immunization arthropathy	\N	\N
1447	Postinfectious glomerulonephritis	\N	\N
1452	Preeclampsia	\N	\N
1453	Premature rupture of membranes (PROM)	\N	\N
1486	Pyridoxine (B6) deficiency	\N	\N
1495	Raynaud's phenomenon	\N	\N
1496	Reactive arthritis (Reiter's syndrome)	\N	\N
1501	Relapsing fever (Borrelia)	\N	\N
1511	Neonatal respiratory distress syndrome (NRDS)	\N	\N
1516	Respiratory viruses - New Haven coronavirus	\N	\N
1519	Retinal detachment or break	\N	\N
1521	Retinal vascular occlusion	\N	\N
1527	Retropharyngeal or parapharyngeal abscess	\N	\N
1533	Rheumatic heart disease	\N	\N
1544	Riboflavin (B2) deficiency	\N	\N
1554	Roseola (human herpesvirus 6)	\N	\N
1563	Rubella with neurologic complications	\N	\N
1568	Chordae tendinae rupture	\N	\N
1570	Papillary muscle rupture	\N	\N
1571	Ruptured popliteal cyst	\N	\N
1579	Salpingitis or oophoritis	\N	\N
1600	Schizotypal personality disorder	\N	\N
1617	Sepsis due to anaerobes	\N	\N
1618	Sepsis due to haemophilus influenzae	\N	\N
1622	Sepsis due to streptococcus pneumoniae	\N	\N
1626	Sepsis of newborn due to anaerobes	\N	\N
1584	Scabies	\N	3
1744	Strabismus	\N	\N
1750	Streptococcus iniae infection	\N	\N
1751	Streptococcus pneumoniae as the cause of diseases classified to other chapters	\N	\N
1754	striae atrophicae	\N	\N
1775	Subcutaneous phaeomycotic abscess and cyst	\N	\N
1801	Syringomyelia or syringobulbia	\N	\N
2587	test	\N	1
1838	Tinea barbae and tinea capitis	\N	\N
1847	Testicular torsion	\N	\N
1851	Toxic effect: contact with venomous animal	\N	\N
1852	Toxic effect: corrosive substance	\N	\N
1853	Toxic effect: halogen derivatives of aliphatic and aromatic hydrocarbons	\N	\N
1854	Toxic effect: metals	\N	\N
1855	Toxic effect: noxious substances eaten as seafood	\N	\N
1856	Toxic effect: organic solvents	\N	\N
1857	Toxic effect: other gases, fumes and vapours	\N	\N
1858	Toxic effect: of other inorganic substances	\N	\N
1859	Toxic effect: of other noxious substances eaten as food	\N	\N
1860	Toxic effect: isopropanol	\N	\N
2588	MERS	\N	1
1993	Tubulo-interstitial nephritis	\N	\N
2040	Vibrio parahaemolyticus infection	\N	\N
2064	Waterhouse-Friderichsen syndrome	\N	\N
2067	Wernicke-Korsakoff syndrome	\N	\N
2589	MERS2	\N	1
2091	Abilify	\N	2
2088	Abacavir	\N	2
2089	Abatacept	\N	2
2090	Abciximab	\N	2
2092	Acetaldehyde	\N	2
2093	Acetaminophen with Codeine	\N	2
2094	Acetazolamide	\N	2
2095	Aciphex	\N	2
2096	Acyclovir	\N	2
2097	Adderall	\N	2
2098	Advair Diskus	\N	2
2099	Alendron	\N	2
2100	Allopurinol	\N	2
2101	Alphagan P	\N	2
2102	Alprazolam	\N	2
2103	Amikacin	\N	2
2104	Amiloride	\N	2
2105	Amiodarone	\N	2
2106	Amitriptyline	\N	2
2107	Amlodipine	\N	2
2108	Amoxicillin	\N	2
2109	Amoxicillin/Clavulanate	\N	2
2110	Amphetamine	\N	2
2111	Ampicillin	\N	2
2112	Aripiprazole	\N	2
2113	Armour Thyroid	\N	2
2114	Astelin (Nasal)	\N	2
2115	Astelin (Ophthalmic)	\N	2
2116	Atazanavir	\N	2
2117	Atenolol	\N	2
2118	Atenolol/Chlorthalidone	\N	2
2119	Atorvastatin	\N	2
2120	Augmentin XR	\N	2
2121	Avalide	\N	2
2122	Avelox	\N	2
2123	Azosemide	\N	2
2124	Azithromycin	\N	2
2125	Aztreonam	\N	2
2126	Bacitracin	\N	2
2127	Baclofen	\N	2
2128	Balofloxacin	\N	2
2129	Benazepril	\N	2
2130	Bendroflumethiazide	\N	2
2131	Benicar	\N	2
2132	Benicar HCT	\N	2
2133	BenzaClin	\N	2
2134	Benzonatate	\N	2
2135	Benztropine	\N	2
2136	Bepridil	\N	2
2137	Bisoprolol	\N	2
2138	Bisoprolol/HCTZ	\N	2
2139	Bivalirudin	\N	2
2140	Budesonide Inhalation	\N	2
2141	Budesonide Nasal	\N	2
2142	Bumetanide	\N	2
2143	Buspirone	\N	2
2144	Butalbital/Acetaminophen/Caffeine	\N	2
2145	Candesartan	\N	2
2146	Canrenone	\N	2
2147	Capreomycin	\N	2
2148	Captopril	\N	2
2149	Carbamazepine	\N	2
2150	Carbenicillin	\N	2
2151	Carisoprodol	\N	2
2152	Carvedilol	\N	2
2153	Cefacetrile (cephacetrile)	\N	2
2154	Cefaclor	\N	2
2155	Cefadroxil (cefadroxyl)	\N	2
2156	Cefalexin (cephalexin)	\N	2
2157	Cefalotin (cephalothin)	\N	2
2158	Cefamandole	\N	2
2159	Cefapirin (cephapirin)	\N	2
2160	Cefazolin (cephazolin)	\N	2
2161	Cefdinir	\N	2
2162	Cefditoren	\N	2
2163	Cefepime	\N	2
2164	Cefixime	\N	2
2165	Cefmenoxime	\N	2
2166	Cefonicid	\N	2
2167	Cefoperazone	\N	2
2168	Cefotaxime	\N	2
2169	Cefotetan	\N	2
2170	Cefoxitin	\N	2
2171	Cefpodoxime	\N	2
2172	Cefprozil (cefproxil)	\N	2
2173	Cefradine (cephradine)	\N	2
2174	Ceftaroline	\N	2
2175	Ceftazidime	\N	2
2176	Ceftibuten	\N	2
2177	Ceftiofur	\N	2
2178	Ceftizoxime	\N	2
2179	Ceftobiprole	\N	2
2180	Ceftriaxone	\N	2
2181	Cefuroxime	\N	2
2182	Cefzil	\N	2
2183	Celecoxib	\N	2
2184	Cephalexin	\N	2
2185	Cetirizine	\N	2
2186	Chloramphenicol	\N	2
2187	Chlorhexidine Gluconate	\N	2
2188	Chlorothiazide	\N	2
2189	Chlorpromazine	\N	2
2190	Cialis	\N	2
2191	Ciprofloxacin	\N	2
2192	Citalopram	\N	2
2193	Clarinex	\N	2
2194	Clarithromycin	\N	2
2195	Clindamycin	\N	2
2196	Clindamycin (Topical)	\N	2
2197	Clobetasol	\N	2
2198	Clofazamine	\N	2
2199	Clonazepam	\N	2
2200	Clonidine	\N	2
2201	Clopidogrel Bisulfate	\N	2
2202	Chlorthalidone	\N	2
2203	Clotrimazole/Betamethasone	\N	2
2204	Cloxacillin	\N	2
2205	Cocaine	\N	2
2206	Colchicine	\N	2
2207	Combivent	\N	2
2208	Conivaptin	\N	2
2209	Conjugated Estrogens	\N	2
2210	Conjugated Estrogens/Medroxyprogesterone	\N	2
2211	Crestor	\N	2
2212	Cyclobenzaprine HCl	\N	2
2213	Cycloserine	\N	2
2214	Cymbalta	\N	2
2215	Dapsone	\N	2
2216	Darunavir	\N	2
2217	Demeclocycline	\N	2
2218	Desogesterl/Ethinyl Estradiol and Ethinyl Estradiol	\N	2
2219	Diazoxide	\N	2
2220	Dichlorphenamide	\N	2
2221	Diclofenac	\N	2
2222	Dicloxacillin	\N	2
2223	Dicyclomine	\N	2
2224	Didanosine	\N	2
2225	Digoxin	\N	2
2226	Diltiazem CD	\N	2
2227	Diltiazem HCl	\N	2
2228	Diltiazem SR	\N	2
2229	Diphenoxylate/Atropine	\N	2
2230	Ditropan XL	\N	2
2231	Divalproex Sodium	\N	2
2232	Dobutamine	\N	2
2233	Dolutegravir	\N	2
2234	Donepezil HCl	\N	2
2235	Dopamine	\N	2
2236	Doripenem	\N	2
2237	Dorzolamide Hydrochloride-Timolol Maleate Ophthalmic Solution	\N	2
2238	Doxazosin	\N	2
2239	Doxepin	\N	2
2240	Doxycycline	\N	2
2241	Efavirenz	\N	2
2242	Elidel	\N	2
2243	Elvitegravir	\N	2
2244	Emticitabine	\N	2
2245	Enalapril	\N	2
2246	Enalaprilat	\N	2
2247	enfurvitide	\N	2
2248	Ephedrine	\N	2
2249	Epinephrine	\N	2
2250	Eplerenone	\N	2
2251	Eprosartan	\N	2
2252	Ertapenem	\N	2
2253	Erythromycin	\N	2
2254	Esomeprazole	\N	2
2255	Estradiol	\N	2
2256	Estradiol Transdermal	\N	2
2257	Estrostep Fe	\N	2
2258	Ethacrynic acid	\N	2
2259	Ethambutol	\N	2
2260	Etodolac	\N	2
2261	Etravirine	\N	2
2262	Ezetimibe	\N	2
2263	Famotidine	\N	2
2264	Felodipine	\N	2
2265	Fenofibrate	\N	2
2266	Fenoldopam	\N	2
2267	Fentanyl	\N	2
2268	Fexofenadine	\N	2
2269	Fexofenadine and Pseudoephedrine	\N	2
2270	Finasteride	\N	2
2271	Flecainide	\N	2
2272	Flonase	\N	2
2273	Flovent HFA	\N	2
2274	Flucloxacillin	\N	2
2275	Fluconazole	\N	2
2276	Fluocinonide	\N	2
2277	Fluoxetine	\N	2
2278	Fluvastatin Sodium	\N	2
2279	Folic Acid	\N	2
2280	Fortamet	\N	2
2281	Fosamprenavir	\N	2
2282	Foscarnet	\N	2
2283	Fosinopril	\N	2
2284	Furosemide	\N	2
2285	Gabapentin	\N	2
2286	Ganciclovir	\N	2
2287	Gatifloxacin	\N	2
2288	Gemfibrozil	\N	2
2289	Gentamicin	\N	2
2290	Glimepiride	\N	2
2291	Glipizide (ER)	\N	2
2292	Glyburide	\N	2
2293	Glycerin	\N	2
2294	Grepafloxacin	\N	2
2295	Guanabenz	\N	2
2296	Guanadrel	\N	2
2297	Guanfacine	\N	2
2298	Hirudin	\N	2
2299	Humulin 70/30	\N	2
2300	Humulin N	\N	2
2301	Hycotuss Expectorant	\N	2
2302	Hydralazine	\N	2
2303	Hydrochlorothiazide	\N	2
2304	Hydrocodone Polistirex and Chlorpheniramine Polistirex	\N	2
2305	Hydrocodone/Acetaminophen	\N	2
2306	Hydrocortisone	\N	2
2307	Hydroflumethiaxide	\N	2
2308	Hydroxychloroquine	\N	2
2309	Hydroxyzine	\N	2
2310	Hyoscyamine	\N	2
2311	Ibuprofen	\N	2
2312	Imipenem	\N	2
2313	Inamrinone	\N	2
2314	Indapamide	\N	2
2315	Inderal LA	\N	2
2316	Indinavir	\N	2
2317	Indomethacin	\N	2
2318	Insulin Lispro	\N	2
2319	Irbesartan	\N	2
2320	Isoniazid	\N	2
2321	Isoproterenol	\N	2
2322	Isosorbide Dinitrate	\N	2
2323	Isosorbide-5-Mononitrate	\N	2
2324	Isradipine	\N	2
2325	Kanamycin	\N	2
2326	Ketek	\N	2
2327	Ketoconazole	\N	2
2328	Klor-Con	\N	2
2329	Labetalol	\N	2
2330	Lamictal	\N	2
2331	Lamivudine	\N	2
2332	Lansoprazole	\N	2
2333	Lantus	\N	2
2334	Latanoprost Ophthalmic	\N	2
2335	Levalbuterol HCl	\N	2
2336	Levaquin	\N	2
2337	Levitra	\N	2
2338	Levofloxacin	\N	2
2339	Levonorgestrel and Ethinyl Estradiol	\N	2
2340	Levothyroid	\N	2
2341	Levoxyl	\N	2
2342	Lexapro	\N	2
2343	Lidoderm	\N	2
2344	Linezolid	\N	2
2345	Lisinopril	\N	2
2346	Lithium Carbonate	\N	2
2347	Lopinavir	\N	2
2348	Lorazepam	\N	2
2349	Losartan	\N	2
2350	Losartan Hydrochlorothiazide	\N	2
2351	Lotrel	\N	2
2352	Lovastatin	\N	2
2353	Lunesta	\N	2
2354	Mannitol	\N	2
2355	Maraviroc	\N	2
2356	Meclizine	\N	2
2357	Medroxyprogesterone	\N	2
2358	Meropenem	\N	2
2359	Metaxalone	\N	2
2360	Metformin	\N	2
2361	Methadone	\N	2
2362	Methazolamide	\N	2
2363	Methocarbamol	\N	2
2364	Methyclothiazide	\N	2
2365	Methyldopa	\N	2
2366	Methylphenidate	\N	2
2367	Methylprednisolone	\N	2
2368	Metoclopramide	\N	2
2369	Metolazone	\N	2
2370	Metoprolol	\N	2
2371	Metoprolol Succinate	\N	2
2372	Metronidazole	\N	2
2373	Metyrosine	\N	2
2374	Mezlocillin	\N	2
2375	Milrinone	\N	2
2376	Minocycline	\N	2
2377	Minoxidil	\N	2
2378	Mirtazapine	\N	2
2379	Mobic	\N	2
2380	Moexipril	\N	2
2381	Montelukast	\N	2
2382	Morphine	\N	2
2383	Moxifloxacin	\N	2
2384	Mupirocin	\N	2
2385	Nabumetone	\N	2
2386	Nafcillin	\N	2
2387	Namenda	\N	2
2388	Naproxen	\N	2
2389	Nasonex	\N	2
2390	Nelfinavir	\N	2
2391	Neomycin	\N	2
2392	Nesiritide	\N	2
2393	Netilmicin	\N	2
2394	Nevirapine	\N	2
2395	Niaspan	\N	2
2396	Nicardipine	\N	2
2397	Nifedipine 	\N	2
2398	Nitrofurantoin	\N	2
2399	Nitroglycerin	\N	2
2400	Nitroprusside	\N	2
2401	Norepinephrine	\N	2
2402	Norethindrone / Ethinyl Estradiol	\N	2
2403	Norfloxacin	\N	2
2404	Nortriptyline	\N	2
2405	NovoLog	\N	2
2406	NuvaRing	\N	2
2407	Nystatin (Topical)	\N	2
2408	Ofloxacin	\N	2
2409	Olanzapine	\N	2
2410	Olmesartan Medoxomil	\N	2
2411	Olopatadine HCl	\N	2
2412	Omeprazole	\N	2
2413	Ortho Evra	\N	2
2414	Oseltamivir	\N	2
2415	Oxacillin	\N	2
2416	Oxcarbazepine	\N	2
2417	Oxybutynin	\N	2
2418	Oxycodone	\N	2
2419	Oxycodone with Acetaminophen	\N	2
2420	Oxycontin	\N	2
2421	Oxytetracycline	\N	2
2422	Paclitaxel	\N	2
2423	Paromomycin	\N	2
2424	Paroxetine	\N	2
2425	Paxil CR	\N	2
2426	Penicillin G	\N	2
2427	Penicillin V	\N	2
2428	Penicillin VK	\N	2
2429	Perindopril	\N	2
2430	Phenazopyridine	\N	2
2431	Phenobarbital	\N	2
2432	Phenoxybenzamine	\N	2
2433	Phentermine	\N	2
2434	Phentolamine	\N	2
2435	Phenylpropanolamine	\N	2
2436	Phenytoin	\N	2
2437	Phenytoin Sodium	\N	2
2438	Pioglitazone HCl	\N	2
2439	Piperacillin	\N	2
2440	Piretanide	\N	2
2441	Piroxicam	\N	2
2442	Polyethylene Glycol	\N	2
2443	Polymyxin B	\N	2
2444	Polythiazide	\N	2
2445	Potassium canrenoate	\N	2
2446	Potassium Chloride	\N	2
2447	Pravachol	\N	2
2448	Prazosin	\N	2
2449	Prednisolone	\N	2
2450	Prednisone	\N	2
2451	Promethazine	\N	2
2452	Promethazine DM	\N	2
2453	Promethazine/Codeine	\N	2
2454	Prometrium	\N	2
2455	Propafenone	\N	2
2456	Propoxyphene-N/Acetaminophen	\N	2
2457	Propranolol	\N	2
2458	Protonix	\N	2
2459	Pyrazinamide	\N	2
2460	Quetiapine Fumarate	\N	2
2461	Quinapril	\N	2
2462	Quinethazone	\N	2
2463	Quinidine	\N	2
2464	Quinine	\N	2
2465	Quinupristin/dalfopristin	\N	2
2466	Raloxifene HCl	\N	2
2467	Raltegravir	\N	2
2468	Ramipril	\N	2
2469	Ranitidine	\N	2
2470	Reserpine	\N	2
2471	Rifabutin	\N	2
2472	Rifampin	\N	2
2473	Rifapentine	\N	2
2474	Rilpivirine	\N	2
2475	Risedronate Sodium	\N	2
2476	Ritonavir	\N	2
2477	Rosiglitazone Maleate	\N	2
2478	Saquinavir	\N	2
2479	Sertraline HCl	\N	2
2480	Sildenafil	\N	2
2481	Simvastatin	\N	2
2482	Sinemet	\N	2
2483	Sirolimus	\N	2
2484	Spiriva	\N	2
2485	Spironolactone	\N	2
2486	Stavudine	\N	2
2487	Strattera	\N	2
2488	Streptomycin	\N	2
2489	Sulfamethizole	\N	2
2490	Sulfamethoxazole	\N	2
2491	Sulfisoxazole	\N	2
2492	Sumatriptan Succinate	\N	2
2493	Tadalafil	\N	2
2494	Tamoxifen	\N	2
2495	Tamsulosin HCl	\N	2
2496	Teicoplanin	\N	2
2497	Telavancin	\N	2
2498	Telmisartan	\N	2
2499	Temazepam	\N	2
2500	Tenofovir	\N	2
2501	Terazosin	\N	2
2502	Terbinafine	\N	2
2503	Tetracycline	\N	2
2504	Ticarcillin	\N	2
2505	Tigecycline	\N	2
2506	Timolol	\N	2
2507	Tinidazole	\N	2
2508	Tizanidine	\N	2
2509	Tobradex	\N	2
2510	Tobramycin	\N	2
2511	Tolterodine Tartrate	\N	2
2512	Topamax	\N	2
2513	Torsemide	\N	2
2514	Tramadol	\N	2
2515	Tramadol / Acetaminophen	\N	2
2516	Trandolapril	\N	2
2517	Trazodone	\N	2
2518	Triamcinolone	\N	2
2519	Triamterene	\N	2
2520	Trichlormethiazide	\N	2
2521	Trimethoprim / Sulfamethoxazole	\N	2
2522	Tripamide	\N	2
2523	Ultracet	\N	2
2524	Urea	\N	2
2525	Valganciclovir	\N	2
2526	Valium	\N	2
2527	Valsartan	\N	2
2528	Valtrex	\N	2
2529	Vancomycin	\N	2
2530	Vardenafil	\N	2
2531	Vasopressin	\N	2
2532	Venlafaxine HCl	\N	2
2533	Ventolin Inhalation	\N	2
2534	Ventolin Solution	\N	2
2535	Verapamil 	\N	2
2536	Viagra	\N	2
2537	Vicoprofen	\N	2
2538	Vigamox	\N	2
2539	Vistaril	\N	2
2540	Vytorin	\N	2
2541	Warfarin	\N	2
2542	Wellbutrin SR	\N	2
2543	Wellbutrin XL	\N	2
2544	Yasmin	\N	2
2545	Zelnorm	\N	2
2546	Zestoretic	\N	2
6	Abscess of anal and rectal regions	\N	3
7	Abscess of bartholin's gland	\N	3
8	Abscess of breast associated with childbirth	\N	3
9	Abscess of bursa	\N	3
10	Abscess of external ear	\N	3
11	Abscess of intestine	\N	3
13	Abscess of lung and mediastinum	\N	3
14	Abscess of lung with pneumonia	\N	3
15	Abscess of lung without pneumonia	\N	3
16	Abscess of mediastinum	\N	3
17	Abscess of prostate	\N	3
18	Abscess of salivary gland	\N	3
19	Abscess of spleen	\N	3
20	Abscess of tendon sheath	\N	3
21	Abscess of thymus	\N	3
22	Abscess of vulva	\N	3
23	Acanthamoebiasis	\N	3
137	Acquired immune deficiency syndrome (AIDS)	\N	3
45	Actinomycosis - abdominal	\N	3
46	Actinomycosis - oral/cervical	\N	3
47	Actinomycosis - pelvic	\N	3
48	Actinomycosis - periapical	\N	3
49	Actinomycosis - thoracic	\N	3
51	Acute amoebic dysentery	\N	3
53	Acute and subacute hemorrhagic leukoencephalitis [hurst]	\N	3
54	Acute appendicitis	\N	3
55	Acute atopic conjunctivitis	\N	3
57	Acute bronchitis	\N	3
58	Acute chagas' disease with heart involvement	\N	3
59	Acute chagas' disease without heart involvement	\N	3
60	Acute cholecystitis	\N	3
61	Acute conjunctivitis	\N	3
62	Acute cystitis	\N	3
63	Acute delta-superinfection of hepatitis b carrier	\N	3
64	Acute disseminated encephalitis	\N	3
66	Acute epidemic hemorrhagic conjunctivitis (enteroviral)	\N	3
67	Acute epiglottitis	\N	3
69	Acute ethmoidal sinusitis	\N	3
70	Acute frontal sinusitis	\N	3
71	Acute gastroenteropathy due to norwalk agent	\N	3
72	Acute gingivitis	\N	3
73	Acute hematogenous osteomyelitis	\N	3
74	Acute hemorrhagic gastritis	\N	3
75	Acute laryngitis	\N	3
76	Acute leukemia of unspecified cell type	\N	3
77	Acute lymphadenitis	\N	3
78	Acute mastoiditis	\N	3
79	Acute maxillary sinusitis	\N	3
81	Acute meningococcemia	\N	3
88	Acute myocarditis	\N	3
89	Acute myringitis	\N	3
90	Acute nasopharyngitis (common cold)	\N	3
94	Acute pansinusitis	\N	3
95	Acute pericarditis	\N	3
96	Acute periodontitis	\N	3
97	Acute peritonitis	\N	3
98	Acute pharyngitis	\N	3
99	Acute poliomyelitis	\N	3
101	Acute prostatitis	\N	3
102	Acute salpingitis and oophoritis	\N	3
103	Acute serous otitis media	\N	3
104	Acute sinusitis	\N	3
105	Acute sphenoidal sinusitis	\N	3
107	Acute suppurative otitis media	\N	3
109	Acute tonsillitis	\N	3
110	Acute tracheitis	\N	3
113	Acute vaginitis	\N	3
114	Acute vulvitis	\N	3
117	Adenovirus - epidemic keratoconjunctivitis	\N	3
118	Adenovirus - hemorrhagic cystitis	\N	3
119	Adenovirus - infantile adenoviral enteritis	\N	3
120	Adenovirus - pharyngoconjunctival fever	\N	3
129	Aeromonas - endocarditis	\N	3
130	Aeromonas - gastroenteritis	\N	3
131	Aeromonas - meningitis	\N	3
132	Aeromonas - ocular infection	\N	3
133	Aeromonas - peritonitis	\N	3
134	Aeromonas - soft tissue infection	\N	3
135	African tick bite fever	\N	3
136	African trypanosomiasis	\N	3
177	Amoebiasis	\N	3
178	Amoebic abscess	\N	3
179	Amoebic brain abscess	\N	3
180	Amoebic colitis	\N	3
181	Amoebic colitis - fulminant	\N	3
182	Amoebic encephalitis - acanthamoeba	\N	3
183	Amoebic encephalitis - balamuthia	\N	3
184	Amoebic keratitis- acanthamoeba	\N	3
185	Amoebic liver abscess	\N	3
186	Amoebic lung abscess	\N	3
187	Amoebic non-dysenteric colitis	\N	3
191	Anal abscess	\N	3
205	Ancylostomiasis	\N	3
225	Angiostrongyliasis due to parastrongylus cantonensis	\N	3
226	Anisakiasis - allergic	\N	3
227	Anisakiasis - invasive	\N	3
258	Ascariasis	\N	3
261	Aspergillosis	\N	3
272	Australian encephalitis	\N	3
274	Babesiosis	\N	3
275	Bacillary angiomatosis	\N	3
276	Bacillus cereus food poisoning	\N	3
277	Bacillus fragilis [b. fragilis] as the cause of diseases classified to other chapters	\N	3
278	Bacterial vaginosis	\N	3
281	Balantidiasis	\N	3
12	Abscess of liver	\N	3
284	Bartonellosis - cat scratch fever	\N	3
285	Bartonellosis - systemic	\N	3
287	Bcg vaccine	\N	3
293	Benign recurrent meningitis [mollaret]	\N	3
304	Blastocystis hominis infection	\N	3
308	Blepharoconjunctivitis	\N	3
310	Botulism - infant	\N	3
312	Brain abscess	\N	3
315	Brazilian purpuric fever	\N	3
317	Bronchitis and pneumonitis due to chemicals, gases, fumes and vapours	\N	3
318	Brucellosis	\N	3
405	Campylobacteriosis	\N	3
406	Candidal endocarditis	\N	3
407	Candidal meningitis	\N	3
408	Candidal sepsis	\N	3
409	Candidal stomatitis	\N	3
410	Candidiasis	\N	3
411	Cannabinosis	\N	3
420	Cat-scratch disease	\N	3
425	Cellulitis	\N	3
426	Central european tick-borne encephalitis	\N	3
445	Chagas disease	\N	3
447	Chancroid	\N	1
448	Chikungunya	\N	3
451	Chlamydia infection - newborn	\N	3
452	Chlamydial infection of anus and rectum	\N	3
456	Cholangitis	\N	3
457	Cholecystitis	\N	3
458	Cholecystitis, unspecified	\N	3
459	Cholelithiasis	\N	3
460	Cholera	\N	3
474	Chronic adhesive pericarditis	\N	3
477	Chronic atticoantral suppurative otitis media	\N	3
479	Chronic cholecystitis	\N	3
484	Chronic ethmoidal sinusitis	\N	3
485	Chronic frontal sinusitis	\N	3
487	Chronic gingivitis	\N	3
491	Chronic mastoiditis	\N	3
492	Chronic maxillary sinusitis	\N	3
493	Chronic meningococcemia	\N	3
494	Chronic mucoid otitis media	\N	3
495	Chronic multifocal osteomyelitis	\N	3
499	Chronic myringitis	\N	3
500	Chronic nasopharyngitis	\N	3
513	Chronic obstructive pyelonephritis	\N	3
514	Chronic osteomyelitis with draining sinus	\N	3
515	Chronic pansinusitis	\N	3
516	Chronic parametritis and pelvic cellulitis	\N	3
518	Chronic periodontitis	\N	3
520	Chronic pharyngitis	\N	3
523	Chronic prostatitis	\N	3
524	Chronic pulmonary blastomycosis	\N	3
525	Chronic pulmonary coccidioidomycosis	\N	3
526	Chronic pulmonary histoplasmosis capsulati	\N	3
530	Chronic salpingitis and oophoritis	\N	3
531	Chronic serous otitis media	\N	3
532	Chronic sinusitis	\N	3
533	Chronic sphenoidal sinusitis	\N	3
536	Chronic tonsillitis	\N	3
537	Chronic tubotympanic suppurative otitis media	\N	3
544	Clonorchiasis	\N	3
545	Clostridial food poisoning	\N	3
546	Clostridial myonecrosis	\N	3
547	Clostridium difficile colitis	\N	3
551	Coccidioidomycosis	\N	3
552	Coccidioidomycosis meningitis	\N	3
558	Colorado tick fever	\N	3
559	Common cold	\N	3
582	Congenital pneumonia	\N	3
583	Congenital syphilis	\N	3
584	Congenital toxoplasmosis	\N	3
586	Congenital tuberculosis	\N	3
590	Conjunctivitis - viral	\N	3
619	Coronavirus infection, unspecified site	\N	3
629	Creutzfeldt-jakob disease	\N	3
631	Crimean-congo hemorrhagic fever	\N	3
635	Cryptococcosis	\N	3
636	Cryptosporidiosis	\N	3
640	Cutaneous abscess, furuncle and carbuncle	\N	3
641	Cutaneous larva migrans	\N	3
642	Cutaneous leishmaniasis	\N	3
647	Cyclosporiasis	\N	3
651	Cysticercosis	\N	3
652	Cystitis	\N	3
654	Cytomegalovirus - colitis	\N	3
655	Cytomegalovirus - retinitis	\N	3
656	Cytomegalovirus infection	\N	3
657	Dacryoadenitis	\N	3
666	Dengue fever	\N	3
667	Dengue hemorrhagic fever	\N	3
668	Dengue shock syndrome	\N	3
683	Dicrocoeliasis	\N	3
684	Dientamoeba fragilis infection	\N	3
693	Diphtheria	\N	3
694	Diphtheria - cutaneous	\N	3
695	Diphtheria - faucal	\N	3
696	Diphyllobothriasis	\N	3
697	Dipylidiasis	\N	3
698	Dirofilariasis - cutaneous	\N	3
699	Dirofilariasis - pulmonary	\N	3
700	Discitis	\N	3
721	Disseminated aspergillosis	\N	3
722	Disseminated blastomycosis	\N	3
723	Disseminated chorioretinal inflammation	\N	3
724	Disseminated coccidioidomycosis	\N	3
725	Disseminated cryptococcosis	\N	3
726	Disseminated herpesviral disease	\N	3
727	Disseminated histoplasmosis capsulati	\N	3
728	Disseminated intravascular coagulation [defibrination syndrome]	\N	3
729	Disseminated intravascular coagulation of fetus and newborn	\N	3
730	Disseminated mucormycosis	\N	3
731	Disseminated paracoccidioidomycosis	\N	3
732	Disseminated sporotrichosis	\N	3
733	Disseminated strongyloidiasis	\N	3
734	Disseminated zoster	\N	3
746	Dracunculiasis	\N	3
788	Ebola hemorrhagic fever	\N	3
791	Echinococcosis - hepatic	\N	3
792	Echinococcosis - pulmonary cysts	\N	3
800	Ehrlichiosis	\N	3
804	Endemic syphilis (bejel)	\N	3
805	Endocardial fibroelastosis	\N	3
806	Endometriosis	\N	3
808	Endophthalmitis	\N	3
809	Endophthalmitis in diseases classified elsewhere	\N	3
810	Enteritis due to yersinia enterocolitica	\N	3
811	Enteroaggregative e. coli (eaggec)	\N	3
812	Enterobacterial spondylitis	\N	3
813	Enterobiasis	\N	3
814	Enterocolitis due to clostridium difficile	\N	3
816	Enterohemorrhagic e. coli (ehec)	\N	3
815	Enterohemorrhagic escherichia coli infection	\N	3
817	Enteroinvasive e. coli (eiec)	\N	3
818	Enteropathogenic e. coli (epec)	\N	3
819	Enteropathogenic escherichia coli infection	\N	3
820	Enteropathy-type (intestinal) t-cell lymphoma	\N	3
821	Enteroptosis	\N	3
822	Enterotoxic e. coli (etec)	\N	3
823	Enteroviral encephalitis	\N	3
824	Enteroviral exanthematous fever [boston exanthem]	\N	3
825	Enterovirus infection	\N	3
826	Enterovirus infection - hand, foot, and mouth disease	\N	3
827	Entropion and trichiasis of eyelid	\N	3
832	Epidemic louse-borne typhus fever due to rickettsia prowazekii	\N	3
833	Epidemic myalgia	\N	3
834	Epidemic vertigo	\N	3
841	Epidural abscess - intracranial	\N	3
842	Epidural abscess - spinal	\N	3
849	Erysipelas	\N	3
850	Erysipeloid	\N	3
857	Erythema infectiosum [fifth disease]	\N	3
858	Erythema intertrigo	\N	3
859	Erythema marginatum	\N	3
860	Erythema marginatum in acute rheumatic fever	\N	3
864	Escherichia coli [e. coli] as the cause of diseases classified to other chapters	\N	3
882	Far eastern tick-borne encephalitis [russian spring-summer encephalitis]	\N	3
884	Fascioliasis	\N	3
891	Filariasis - bancroftian	\N	3
892	Filariasis due to brugia malayi	\N	3
893	Filariasis due to brugia timori	\N	3
904	Folliculitis	\N	3
905	Folliculitis decalvans	\N	3
906	Folliculitis ulerythematosa reticulata	\N	3
990	Gas gangrene	\N	3
996	Gastroenteritis - viral	\N	3
1000	Geotrichosis	\N	3
1007	Giardiasis	\N	3
1010	Glanders	\N	3
1011	Glanders and melioidosis	\N	3
1015	Gnathostomiasis	\N	3
1017	Gonococcal infection	\N	3
1018	Gonococcal infection of anus and rectum	\N	3
1026	Granuloma and granuloma-like lesions of oral mucosa	\N	3
1027	Granuloma annulare	\N	3
1028	Granuloma faciale [eosinophilic granuloma of skin]	\N	3
1029	Granuloma inguinale	\N	3
1032	Gummata and ulcers of yaws	\N	3
1037	Hairy leukoplakia	\N	3
1040	Hantavirus (cardio-)pulmonary syndrome [hps] [hcps]	\N	3
1049	Hepatitis a	\N	3
1050	Hepatitis b	\N	3
1051	Hepatitis c	\N	3
1052	Hepatitis d	\N	3
1053	Hepatitis e	\N	3
1054	Hepatitis g	\N	3
1072	Herpes b infection	\N	3
1073	Herpes simplex encephalitis	\N	3
1074	Herpes simplex infection	\N	3
1075	Herpes simplex infection - neonatal	\N	3
1076	Herpes zoster	\N	3
1077	Herpesviral meningitis	\N	3
1078	Herpesviral ocular disease	\N	3
1079	Herpesviral vesicular dermatitis	\N	3
1083	Histoplasmosis	\N	3
1084	Histoplasmosis duboisii	\N	3
1088	Hookworm	\N	3
1086	human immunodeficiency virus (hiv) - initial illness (acute)	\N	3
1139	Impetigo	\N	3
1145	Infection of wound, puncture, iv line, etc	\N	3
1147	Infective dermatitis	\N	3
1148	Infective endocarditis	\N	3
1149	Infective myocarditis	\N	3
1150	Infective myositis	\N	3
1151	Infective pericarditis	\N	3
1152	Influenza	\N	3
1153	Influenza - h1n1 (swine)	\N	3
1154	Influenza - h5n1 (avian)	\N	3
1164	Intestinal spirochetosis	\N	3
1165	Intestinal strongyloidiasis	\N	3
1166	Intra-abdominal abscess	\N	3
1173	Isosporiasis	\N	3
1174	Japanese encephalitis	\N	3
1175	Junin hemorrhagic fever	\N	3
1195	Kyasanur forest disease	\N	3
1196	Labyrinthitis	\N	3
1199	Laryngotracheobronchitis	\N	3
1200	Lassa fever	\N	3
1205	Legionellosis	\N	3
1206	Legionnaires' disease	\N	3
1207	Leishmaniasis - cutaneous	\N	3
1208	Leishmaniasis - mucocutaneous	\N	3
1209	Leishmaniasis - visceral	\N	3
1210	Lemierre's syndrome	\N	3
1211	Leprosy	\N	3
1212	Leptospirosis	\N	3
1230	Listeriosis	\N	3
1232	Liver abscess - bacterial	\N	3
1233	Lobomycosis	\N	3
1234	Loiasis	\N	3
1238	Lymphangitis	\N	3
1241	Lymphocytic choriomeningitis	\N	3
1242	Lymphogranuloma venereum	\N	3
1246	Machupo hemorrhagic fever	\N	3
1248	Malaria - p. falciparum	\N	3
1249	Malaria - p. malariae	\N	3
1250	Malaria - p. ovale	\N	3
1251	Malaria - p. vivax	\N	3
1257	Mansonelliasis - m. perstans	\N	3
1262	Marburg hemorrhagic fever	\N	3
1268	Measles	\N	3
1271	Melioidosis	\N	3
1274	Meningitis - aseptic (viral)	\N	3
1275	Meningitis - bacterial	\N	3
1276	Meningitis - enteroviral	\N	3
1277	Meningitis - fungal	\N	3
1278	Meningitis - tb	\N	3
1283	Microsporidiosis	\N	3
1291	Molluscum contagiosum	\N	3
1293	Moniliformis and macracanthorhynchus	\N	3
1294	Monkeypox	\N	3
1300	Mucocutaneous leishmaniasis	\N	3
541	Cicatricial pemphigoid	\N	1
1301	Mucocutaneous lymph node syndrome [kawasaki]	\N	3
1309	Mumps	\N	3
1314	Mycetoma	\N	3
1315	Mycobacteriosis - m. marinum	\N	3
1316	Mycobacteriosis - m. scrofulaceum	\N	3
1317	Mycobacteriosis - m. ulcerans	\N	3
1319	Mycoplasma (miscellaneous) infections	\N	3
1321	Mycosis fungoides	\N	3
1324	Myiasis	\N	3
1325	Myocarditis	\N	3
1326	Myositis	\N	3
1331	Necrotizing ulcerative stomatitis	\N	3
1336	Neutropenic typhlitis	\N	3
1339	Nocardiosis	\N	3
1342	O'nyong nyong fever	\N	3
1349	Omsk hemorrhagic fever	\N	3
1350	Onchocerciasis	\N	3
1351	Opisthorchiasis	\N	3
1354	Oral mucositis (ulcerative)	\N	3
1355	Orbital cellulitis	\N	3
1356	Orchitis and epididymitis	\N	3
1357	Orf	\N	3
1358	Ornithosis (psittacosis)	\N	3
1359	Oropouche virus disease	\N	3
1362	Osteomyelitis	\N	3
1363	Osteomyelitis of vertebra	\N	3
1364	Otitis externa	\N	3
1365	Otitis media	\N	3
1369	Panophthalmitis	\N	3
1370	Papovavirus infection, unspecified site	\N	3
1371	Paracoccidioidomycosis	\N	3
1372	Paragonimiasis	\N	3
1373	Parainfluenza virus infection	\N	3
1374	Paratyphoid fever (enteric fever)	\N	3
1377	Parvovirus b19 infection	\N	3
1378	Pasteurellosis	\N	3
1380	Patellar tendinitis	\N	1
1381	Patellofemoral disorders	\N	1
1382	Pediculosis	\N	3
1383	Peliosis hepatis	\N	3
1393	Pericarditis - bacterial	\N	3
1396	Perinephric abscess	\N	3
1397	Periodontosis	\N	3
1398	Perirectal abscess	\N	3
1399	Peritonitis - bacterial	\N	3
1400	Peritonsillar abscess	\N	3
1402	Pertussis (whooping cough)	\N	3
1404	Petrositis	\N	3
1406	Pharyngeal and cervical space infection	\N	3
1407	Pharyngitis - bacterial	\N	3
1408	Pharyngitis - viral	\N	3
1409	Phlebitis	\N	3
1410	Phthiriasis	\N	3
1411	Pityriasis rosea	\N	3
1412	Pityriasis rubra pilaris	\N	3
1413	Pityriasis versicolor	\N	3
1415	Plague (yersinia pestis)	\N	3
1416	Plague meningitis	\N	3
1419	Plesiomonas infection	\N	3
1421	Pneumoconiosis	\N	3
1423	Pneumonia - bacterial	\N	3
1424	Pneumonia - viral	\N	3
1429	Poliomyelitis	\N	3
1461	Progressive multifocal leukoencephalopathy	\N	3
1465	Prostatitis	\N	3
1466	Protothecosis and chlorellosis	\N	3
1467	Pseudocowpox	\N	3
1469	Psittacosis	\N	3
1481	Pyelonephritis	\N	3
1483	Pyomyositis	\N	3
1484	Pyonephrosis	\N	3
1485	Pyothorax	\N	3
1487	Q-fever	\N	3
1493	Rat bite fever - spirillary	\N	3
1494	Rat bite fever - streptobacillary	\N	3
1500	Reiter's disease	\N	1
1502	Relapsing panniculitis [weber-christian]	\N	1
1504	Renal and perinephric abscess	\N	3
1508	Reovirus infection	\N	3
1512	Respiratory syncytial virus infection	\N	3
1513	Respiratory viruses - coronavirus	\N	3
1514	Respiratory viruses - human bocavirus	\N	3
1515	Respiratory viruses - human metapneumovirus	\N	3
1517	Retained intrauterine contraceptive device in pregnancy	\N	3
1528	Retrovirus infections, not elsewhere classified	\N	3
1532	Rheumatic fever	\N	3
1534	Rheumatoid arthritis	\N	3
1539	Rhinophyma	\N	3
1541	Rhinosporidiosis	\N	3
1542	Rhodesiense trypanosomiasis	\N	3
1543	Rhodococcus equi infection	\N	3
1546	Rickettsialpox	\N	3
1547	Rickettsialpox due to rickettsia akari	\N	3
1548	Rickettsiosis, unspecified	\N	3
1549	Rift valley fever	\N	3
1551	Rocio virus disease	\N	3
1552	Rocky mountain spotted fever	\N	3
1555	Ross river disease	\N	3
1557	Rotaviral enteritis	\N	3
1558	Rotavirus infection	\N	3
1559	Rubella	\N	3
1560	Rubella - congential	\N	3
1561	Rubella (german measles)	\N	3
1562	Rubella arthritis	\N	3
1564	Rubella with other complications	\N	3
1578	Salmonellosis	\N	3
1580	Sandfly fever	\N	3
1585	Scarlet fever	\N	3
1586	Schistosomiasis - haematobium (acute)	\N	3
1587	Schistosomiasis - haematobium (chronic)	\N	3
1588	Schistosomiasis - mansoni (acute)	\N	3
1589	Schistosomiasis - mansoni (chronic)	\N	3
1590	Schistosomiasis [bilharziasis]	\N	3
1591	Schistosomiasis due to schistosoma haematobium [urinary schistosomiasis]	\N	3
1592	Schistosomiasis due to schistosoma japonicum	\N	3
1593	Schistosomiasis due to schistosoma mansoni [intestinal schistosomiasis]	\N	3
1616	Sepsis	\N	3
1619	Sepsis due to other gram-negative organisms	\N	3
1620	Sepsis due to other specified staphylococcus	\N	3
1621	Sepsis due to staphylococcus aureus	\N	3
1623	Sepsis due to streptococcus, group a	\N	3
1624	Sepsis due to streptococcus, group b	\N	3
1625	Sepsis due to streptococcus, group d	\N	3
1627	Sepsis of newborn due to escherichia coli	\N	3
1628	Sepsis of newborn due to other and unspecified staphylococci	\N	3
1629	Sepsis of newborn due to other and unspecified streptococci	\N	3
1630	Sepsis of newborn due to staphylococcus aureus	\N	3
1631	Sepsis of newborn due to streptococcus, group b	\N	3
1632	Septic arthritis	\N	3
1633	Septic shock	\N	3
1634	Septicemia - bacterial	\N	3
1635	Septicemic plague	\N	3
1636	Septo-optic dysplasia	\N	3
1648	Shigellosis	\N	3
1660	Sinusitis	\N	3
1669	Smallpox	\N	3
1675	Sparganosis	\N	3
1698	Sporotrichosis	\N	3
1699	Sporotrichosis - cutaneous	\N	3
1700	Sporotrichosis - osteoarticular	\N	3
1701	Sporotrichosis - pulmonary	\N	3
1702	Spotted fever [tick-borne rickettsioses]	\N	3
1703	Spotted fever due to rickettsia australis	\N	3
1704	Spotted fever due to rickettsia conorii	\N	3
1705	Spotted fever due to rickettsia sibirica	\N	3
1706	Spotted fevers - rickettsial	\N	3
1725	St louis encephalitis	\N	3
1731	Staphylococcal arthritis and polyarthritis	\N	3
1732	Staphylococcal food poisoning	\N	3
1733	Staphylococcal scalded skin syndrome	\N	3
1734	Staphylococcus aureus as the cause of diseases classified to other chapters	\N	3
1745	Streptobacillosis	\N	3
1746	Streptococcal meningitis	\N	3
1747	Streptococcal pharyngitis (strep throat)	\N	3
1748	Streptococcal sepsis	\N	3
1749	Streptococcal tonsillitis	\N	3
1757	Strongyloidiasis	\N	3
1758	Strongyloidiasis - gastrointestinal	\N	3
1759	Strongyloidiasis - generalized	\N	3
1760	Strongyloidiasis - neonatal	\N	3
1761	Strongyloidiasis, unspecified	\N	3
1764	Subacute necrotizing myelitis	\N	3
1765	Subacute osteomyelitis	\N	3
1766	Subacute sclerosing panencephalitis	\N	3
1776	Subdural empyema	\N	3
1788	Suppurative parotitis	\N	3
1791	Sylvatic rabies	\N	3
1792	Sylvatic yellow fever	\N	3
1794	Syngamiasis	\N	3
1797	Syphilis - neuro	\N	3
1798	Syphilis - primary	\N	3
1799	Syphilis - secondary	\N	3
1800	Syphilis - tertiary	\N	3
1805	Teniasis	\N	3
1812	Tetanus - cephalic	\N	3
1813	Tetanus - generalized	\N	3
1814	Tetanus - localized	\N	3
1815	Tetanus - neonatal	\N	3
1821	Thelaziasis	\N	3
1836	Tick-borne relapsing fever	\N	3
1837	Tick-borne viral encephalitis	\N	3
1839	Tinea corporis	\N	3
1840	Tinea cruris	\N	3
1841	Tinea imbricata	\N	3
1842	Tinea manuum	\N	3
1843	Tinea nigra	\N	3
1844	Tinea pedis	\N	3
1845	Tinea unguium	\N	3
1958	Toxocariasis	\N	3
1959	Toxoplasmosis - acquired	\N	3
1960	Toxoplasmosis - cns	\N	3
1961	Toxoplasmosis - congenital	\N	3
1962	Toxoplasmosis - ocular	\N	3
1963	Toxoplasmosis (acute)	\N	3
1964	Toxoplasmosis and aids	\N	3
1965	Trachoma	\N	3
1967	Trench fever	\N	3
1969	Trichinellosis	\N	3
1970	Trichinosis	\N	3
1971	Trichomoniasis	\N	3
1972	Trichorrhexis nodosa	\N	1
1973	Trichostrongyliasis	\N	3
1974	Trichotillomania	\N	1
1975	Trichuriasis	\N	3
1981	Trigonitis	\N	1
1983	Tropical phagedenic ulcer	\N	3
1984	Tropical pulmonary eosinophilia	\N	3
1985	Tropical spastic paraplegia	\N	3
1986	Tropical sprue	\N	3
1987	Trypanosomiasis - african (t. gambiense)	\N	3
1988	Trypanosomiasis - african (t. rhodesiense)	\N	3
1990	Tuberculoid leprosy	\N	3
1991	Tuberculosis	\N	3
1994	Tularemia	\N	3
1996	Tungiasis	\N	3
1999	Typhoid and enteric fever	\N	3
2000	Typhus - endemic	\N	3
2001	Typhus - epidemic	\N	3
2002	Typhus fever	\N	3
2003	Typhus fever due to orientia tsutsugamushi	\N	3
2004	Typhus fever due to rickettsia typhi	\N	3
2009	Ulceroglandular tularemia	\N	3
2013	Urethral abscess	\N	3
2016	Urethritis and urethral syndrome	\N	3
2018	Urinary tract infection	\N	3
2021	Vaginitis, vulvitis and vulvovaginitis in infectious and parasitic diseases classified elsewhere	\N	3
2023	Varicella (chickenpox)	\N	3
2041	Vibrio vulnificus cellulitis	\N	3
2042	Vibrio vulnificus septicemia	\N	3
2043	Viral conjunctivitis	\N	3
2044	Viral intestinal infection, unspecified	\N	3
2045	Viral meningitis	\N	3
2046	Viral myocarditis	\N	3
2047	Viral pharyngoconjunctivitis	\N	3
2048	Visceral larva migrans	\N	3
2049	Visceral leishmaniasis	\N	3
2068	Wesselsbron (flavivirus)	\N	3
2069	West nile fever	\N	3
2070	West nile fever - neuroinvasive	\N	3
2071	Western equine encephalitis	\N	3
2072	Whipple's disease	\N	3
2074	Whooping cough due to bordetella parapertussis	\N	3
2075	Whooping cough due to bordetella pertussis	\N	3
2076	Whooping cough due to other bordetella species	\N	3
2080	Wound myiasis	\N	3
2086	Yaws	\N	3
2087	Yellow fever	\N	3
2	Abdominal aortic aneurysm, ruptured	\N	1
3	Abdominal pregnancy	\N	1
4	Abo incompatibility reaction	\N	1
5	Abrasion of teeth	\N	1
24	Acanthosis nigricans	\N	1
25	Accentuation of personality traits	\N	1
26	Achilles tendinitis	\N	1
27	Achondrogenesis	\N	1
28	Achondroplasia	\N	1
29	Acidosis	\N	1
31	Acne conglobata	\N	1
32	Acne excoriee des jeunes filles	\N	1
33	Acne keloid	\N	1
34	Acne tropica	\N	1
35	Acne varioliformis	\N	1
36	Acne vulgaris	\N	1
37	Acoustic neuritis in infectious and parasitic diseases classified elsewhere	\N	1
38	Acrodermatitis chronica atrophicans	\N	1
39	Acrodermatitis continua	\N	1
40	Acromegaly and pituitary gigantism	\N	1
41	Actinic granuloma	\N	1
42	Actinic keratosis	\N	1
43	Actinic reticuloid	\N	1
44	Actinomycetoma	\N	1
50	Acute abdomen	\N	1
52	Acute anal fissure	\N	1
65	Acute drug-induced interstitial lung disorders	\N	1
68	Acute erythroid leukemia	\N	1
80	Acute megakaryoblastic leukemia	\N	1
82	Acute monoblastic/monocytic leukemia	\N	1
83	Acute myeloblastic leukemia	\N	1
84	Acute myeloid leukemia	\N	1
85	Acute myeloid leukemia with 11q23-abnormality	\N	1
86	Acute myelomonocytic leukemia	\N	1
87	Acute myocardial infarction (heart attack)	\N	1
91	Acute nephritic syndrome	\N	1
92	Acute pancreatitis	\N	1
93	Acute panmyelosis with myelofibrosis	\N	1
100	Acute promyelocytic leukemia (PML)	\N	1
106	Acute stress reaction	\N	1
108	Acute thyroiditis	\N	1
111	Acute tubulo-interstitial nephritis	\N	1
115	Addisonian crisis	\N	1
116	Adenosine deaminase (ADA) deficiency	\N	1
121	Adhesive capsulitis of shoulder	\N	1
122	Adhesive middle ear disease	\N	1
123	Adjustment disorders	\N	1
124	Adult hypertrophic pyloric stenosis	\N	1
126	Adult respiratory distress syndrome	\N	1
127	Adult t-cell lymphoma/leukemia (HTLV1-associated)	\N	1
128	Adult-onset still's disease	\N	1
138	Ainhum	\N	1
139	Air embolism (traumatic)	\N	1
140	Alcohol-induced acute pancreatitis	\N	1
141	Alcohol-induced chronic pancreatitis	\N	1
142	Alcohol-induced pseudo-cushing's syndrome	\N	1
143	Alcoholic cardiomyopathy	\N	1
145	Alcoholic fatty liver	\N	1
146	Alcoholic fibrosis and sclerosis of liver	\N	1
147	Alcoholic gastritis	\N	1
148	Alcoholic hepatic failure	\N	1
149	Alcoholic hepatitis	\N	1
150	Alcoholic liver disease	\N	1
151	Alcoholic myopathy	\N	1
152	Alcoholic polyneuropathy	\N	1
153	Algoneurodystrophy	\N	1
154	Alkalosis	\N	1
155	Allergic purpura	\N	1
156	Allergic rhinitis due to pollen	\N	1
157	Allergic urticaria	\N	1
158	Allergy, unspecified	\N	1
159	Allesheriosis	\N	1
160	Alopecia (capitis) totalis	\N	1
161	Alopecia areata	\N	1
162	Alopecia mucinosa	\N	1
163	Alopecia universalis	\N	1
164	Alpha thalassemia	\N	1
165	Aluminium bone disease	\N	1
166	Aluminosis (of lung)	\N	1
167	Alveolar and parietoalveolar conditions	\N	1
168	Alveolitis of jaws	\N	1
169	Alzheimer's disease	\N	1
170	Alzheimer's disease with early onset	\N	1
171	Alzheimer's disease with late onset	\N	1
172	Amaurosis fugax	\N	1
173	Amblyopia ex anopsia	\N	1
174	Ameboma of intestine	\N	1
175	Amenorrhoea, unspecified	\N	1
176	Amniotic fluid embolism	\N	1
188	Amyelia	\N	1
189	Amyloidosis	\N	1
193	Anal fistula	\N	1
194	Anal polyp	\N	1
195	Anal prolapse	\N	1
196	Analeptics	\N	1
197	Analgesic nephropathy	\N	1
199	Anaphylactic shock due to adverse effect of correct drug or medicament properly administered	\N	1
200	Anaphylactic shock due to adverse food reaction	\N	1
201	Anaphylactic shock due to serum	\N	1
202	Anaphylaxis	\N	1
203	Anaplastic large cell lymphoma, alk-negative	\N	1
204	Anaplastic large cell lymphoma, alk-positive	\N	1
206	Androgen resistance syndrome	\N	1
207	Androgenic alopecia	\N	1
208	Androgens and anabolic congeners	\N	1
190	Anemia	\N	1
209	Anetoderma of jadassohn-pellizzari	\N	1
210	Anetoderma of schweninger-buzzi	\N	1
211	Aneurysm and dissection of artery of lower extremity	\N	1
212	Aneurysm and dissection of artery of upper extremity	\N	1
213	Aneurysm and dissection of carotid artery	\N	1
214	Aneurysm and dissection of iliac artery	\N	1
215	Aneurysm and dissection of other precerebral arteries	\N	1
216	Aneurysm and dissection of other specified arteries	\N	1
217	Aneurysm and dissection of renal artery	\N	1
219	Aneurysm of heart	\N	1
220	Aneurysm of pulmonary artery	\N	1
221	Aneurysmal bone cyst	\N	1
222	Angina pectoris	\N	1
223	Angioimmunoblastic t-cell lymphoma	\N	1
224	Angioneurotic edema	\N	1
228	Ankylosing hyperostosis [forestier]	\N	1
229	Ankylosing spondylitis	\N	1
230	Ankylosis of joint	\N	1
231	Ankylosis of teeth	\N	1
232	Anogenital (venereal) warts	\N	1
233	Anogenital herpesviral [herpes simplex] infection	\N	1
234	Anterior cerebral artery syndrome	\N	1
235	Anterior spinal and vertebral artery compression syndromes	\N	1
236	Anterograde amnesia	\N	1
237	Anthrax - cutaneous	\N	1
238	Anthrax - gastrointestinal	\N	1
239	Anthrax - inhalational	\N	1
240	Anthrax - meningeal	\N	1
241	Anthrax - oropharyngeal	\N	1
242	Anxiety disorder	\N	1
243	Avoidant personality disorder	\N	1
244	Aortic (valve) insufficiency	\N	1
245	Aortic (valve) stenosis	\N	1
246	Aortic (valve) stenosis with insufficiency	\N	1
248	Aortic arch syndrome (Takayasu's arteritis)	\N	1
249	Aortitis in diseases classified elsewhere	\N	1
250	Aplastic anemia, unspecified	\N	1
251	Apocrine miliaria	\N	1
252	Apocrine sweat disorders	\N	1
253	Arenaviral hemorrhagic fever	\N	1
254	Arnold-chiari syndrome	\N	1
255	Arterial fibromuscular dysplasia	\N	1
256	Arteritis, unspecified	\N	1
257	Arthritis mutilans	\N	1
259	Ascorbic acid (Vitamin C) deficiency (scurvy)	\N	1
260	Asperger's syndrome	\N	1
262	Asthma	\N	1
263	Atopic dermatitis	\N	1
264	Atrial fibrillation or flutter	\N	1
265	Atrial septal defect	\N	1
266	Atrioventricular and left bundle-branch block	\N	1
267	Atrioventricular block, complete	\N	1
268	Atrioventricular block, first degree	\N	1
269	Atrioventricular block, second degree	\N	1
270	Atrioventricular septal defect	\N	1
271	Atrophoderma of pasini and pierini	\N	1
273	B-cell lymphoma	\N	1
279	Bagassosis	\N	1
280	Balanoposthitis	\N	1
282	Balkan nephropathy	\N	1
283	Barrett's esophagus	\N	1
286	Bauxite fibrosis (of lung)	\N	1
288	Behcet's disease	\N	1
289	Bell's palsy	\N	1
291	Benign mammary dysplasia	\N	1
292	Benign paroxysmal vertigo	\N	1
294	Beriberi (thiamine (B1) deficiency)	\N	1
295	Berylliosis	\N	1
296	Besnier's prurigo	\N	1
297	Beta thalassemia	\N	1
298	Bicipital tendinitis	\N	1
299	Bifascicular block	\N	1
300	Biliary acute pancreatitis	\N	1
301	Bipolar affective disorder	\N	1
302	Bird fancier's lung	\N	1
303	Blastic nk-cell lymphoma	\N	1
305	Blastomycosis	\N	1
306	Blepharitis	\N	1
307	Blepharochalasis	\N	1
309	Blepharospasm	\N	1
313	Brain stem stroke syndrome	\N	1
314	Brazilian pemphigus [fogo selvagem]	\N	1
316	Bronchiectasis	\N	1
319	Budd-chiari syndrome	\N	1
320	Bulimia nervosa	\N	1
321	Bullous pemphigoid	\N	1
323	Burkitt lymphoma	\N	1
324	Burn and corrosion confined to eye and adnexa	\N	1
325	Burn and corrosion of ankle and foot	\N	1
326	Burn and corrosion of head and neck	\N	1
327	Burn and corrosion of hip and lower limb, except ankle and foot	\N	1
328	Burn and corrosion of other internal organs	\N	1
329	Burn and corrosion of respiratory tract	\N	1
330	Burn and corrosion of shoulder and upper limb, except wrist and hand	\N	1
331	Burn and corrosion of trunk	\N	1
332	Burn and corrosion of wrist and hand	\N	1
333	Burn and corrosion, body region unspecified	\N	1
334	Burn involving larynx and trachea with lung	\N	1
335	Burn of cornea and conjunctival sac	\N	1
336	Burn of esophagus	\N	1
337	Burn of eye and adnexa, part unspecified	\N	1
338	Burn of eyelid and periocular area	\N	1
339	Burn of first degree of ankle and foot	\N	1
340	Burn of first degree of head and neck	\N	1
341	Burn of first degree of hip and lower limb, except ankle and foot	\N	1
342	Burn of first degree of shoulder and upper limb, except wrist and hand	\N	1
343	Burn of first degree of trunk	\N	1
344	Burn of first degree of wrist and hand	\N	1
345	Burn of first degree, body region unspecified	\N	1
346	Burn of internal genitourinary organs	\N	1
347	Burn of larynx and trachea	\N	1
348	Burn of mouth and pharynx	\N	1
349	Burn of other and unspecified internal organs	\N	1
350	Burn of other parts of alimentary tract	\N	1
351	Burn of other parts of eye and adnexa	\N	1
352	Burn of other parts of respiratory tract	\N	1
353	Burn of respiratory tract, part unspecified	\N	1
354	Burn of second degree of ankle and foot	\N	1
355	Burn of second degree of head and neck	\N	1
356	Burn of second degree of hip and lower limb, except ankle and foot	\N	1
357	Burn of second degree of shoulder and upper limb, except wrist and hand	\N	1
358	Burn of second degree of trunk	\N	1
359	Burn of second degree of wrist and hand	\N	1
360	Burn of second degree, body region unspecified	\N	1
361	Burn of third degree of ankle and foot	\N	1
362	Burn of third degree of head and neck	\N	1
363	Burn of third degree of hip and lower limb, except ankle and foot	\N	1
364	Burn of third degree of shoulder and upper limb, except wrist and hand	\N	1
365	Burn of third degree of trunk	\N	1
366	Burn of third degree of wrist and hand	\N	1
367	Burn of third degree, body region unspecified	\N	1
368	Burn of unspecified body region, unspecified degree	\N	1
369	Burn of unspecified degree of ankle and foot	\N	1
370	Burn of unspecified degree of head and neck	\N	1
371	Burn of unspecified degree of hip and lower limb, except ankle and foot	\N	1
372	Burn of unspecified degree of shoulder and upper limb, except wrist and hand	\N	1
373	Burn of unspecified degree of trunk	\N	1
374	Burn of unspecified degree of wrist and hand	\N	1
375	Burn with resulting rupture and destruction of eyeball	\N	1
376	Burnout	\N	1
377	Burns and corrosions of multiple body regions	\N	1
378	Burns classified according to extent of body surface involved	\N	1
379	Burns involving 10-19% of body surface	\N	1
380	Burns involving 20-29% of body surface	\N	1
381	Burns involving 30-39% of body surface	\N	1
382	Burns involving 40-49% of body surface	\N	1
383	Burns involving 50-59% of body surface	\N	1
384	Burns involving 60-69% of body surface	\N	1
385	Burns involving 70-79% of body surface	\N	1
386	Burns involving 80-89% of body surface	\N	1
387	Burns involving 90% or more of body surface	\N	1
388	Burns involving less than 10% of body surface	\N	1
389	Burns of multiple regions, at least one burn of third degree mentioned	\N	1
390	Burns of multiple regions, no more than first-degree burns mentioned	\N	1
391	Burns of multiple regions, no more than second-degree burns mentioned	\N	1
392	Burns of multiple regions, unspecified degree	\N	1
393	Bursitis of hand	\N	1
394	Bursitis of shoulder	\N	1
395	Byssinosis	\N	1
396	Cachexia	\N	1
399	Calcaneal spur	\N	1
400	Calcific tendinitis	\N	1
401	Calcific tendinitis of shoulder	\N	1
402	Calcinosis cutis	\N	1
404	California encephalitis	\N	1
412	Carcinoid syndrome	\N	1
413	Cardiac arrest	\N	1
414	Cardiogenic shock	\N	1
415	Cardiomegaly	\N	1
416	Cardiomyopathy	\N	1
417	Carotid artery stenosis	\N	1
418	Carotid artery syndrome (hemispheric)	\N	1
419	Carpal tunnel syndrome	\N	1
422	Catatonic schizophrenia	\N	1
423	Cauda equina syndrome	\N	1
424	Celiac disease	\N	1
427	Central fever	\N	1
428	Central pontine myelinolysis	\N	1
429	Central retinal artery occlusion	\N	1
430	Centrilobular emphysema	\N	1
433	Cercarial dermatitis	\N	1
434	Cerebellar stroke syndrome	\N	1
435	Cerebral amyloid angiopathy	\N	1
436	Cerebral aneurysm, nonruptured	\N	1
437	Cerebral arteritis, not elsewhere classified	\N	1
438	Cerebral atherosclerosis	\N	1
439	Cerebral infarction	\N	1
440	Cerebral palsy	\N	1
441	Cerebrospinal fluid leak	\N	1
442	Cervical rib	\N	1
443	Cervicobrachial syndrome	\N	1
444	Cervicocranial syndrome	\N	1
446	Chalazion	\N	1
449	Chilblains	\N	1
450	Childhood autism	\N	1
454	Chloasma	\N	1
455	Cholangiocarcinoma	\N	1
461	Cholinergic urticaria	\N	1
462	Chondrocostal junction syndrome [tietze]	\N	1
463	Chondrodysplasia punctata	\N	1
464	Chondroectodermal dysplasia	\N	1
465	Chondrolysis	\N	1
466	Chondromalacia	\N	1
468	Choroidal degeneration	\N	1
469	Choroidal detachment	\N	1
470	Choroidal hemorrhage and rupture	\N	1
471	Chromhidrosis	\N	1
472	Chromium deficiency	\N	1
473	Chromomycosis	\N	1
475	Chronic anal fissure	\N	1
476	Chronic atrophic gastritis	\N	1
478	Chronic bullous disease of childhood	\N	1
480	Chronic congestive splenomegaly	\N	1
481	Chronic conjunctivitis	\N	1
482	Chronic constrictive pericarditis	\N	1
483	Chronic eosinophilic leukemia [hypereosinophilic syndrome]	\N	1
486	Chronic gastritis	\N	1
488	Chronic hepatic failure	\N	1
489	Chronic kidney disease	\N	1
490	Chronic lymphocytic leukemia of b-cell type	\N	1
496	Chronic myeloid leukemia (CML), bcr/abl-positive	\N	1
497	Chronic myelomonocytic leukemia	\N	1
498	Chronic myeloproliferative disease	\N	1
501	Chronic nephritic syndrome	\N	1
502	Chronic nephritic syndrome: dense deposit disease	\N	1
503	Chronic nephritic syndrome: diffuse crescentic glomerulonephritis	\N	1
504	Chronic nephritic syndrome: diffuse endocapillary proliferative glomerulonephritis	\N	1
505	Chronic nephritic syndrome: diffuse membranous glomerulonephritis	\N	1
506	Chronic nephritic syndrome: diffuse mesangial proliferative glomerulonephritis	\N	1
507	Chronic nephritic syndrome: diffuse mesangiocapillary glomerulonephritis	\N	1
508	Chronic nephritic syndrome: focal and segmental glomerular lesions	\N	1
509	Chronic nephritic syndrome: minor glomerular abnormality	\N	1
510	Chronic obstructive pulmonary disease	\N	1
512	Chronic obstructive pulmonary disease with acute lower respiratory infection	\N	1
517	Chronic passive congestion of liver	\N	1
519	Chronic persistent hepatitis, not elsewhere classified	\N	1
521	Chronic post-traumatic headache	\N	1
522	Chronic postrheumatic arthropathy [jaccoud]	\N	1
527	Chronic radiodermatitis	\N	1
528	Chronic rhinitis	\N	1
529	Chronic rhinitis, nasopharyngitis and pharyngitis	\N	1
534	Chronic superficial gastritis	\N	1
535	Chronic thyroiditis with transient thyrotoxicosis	\N	1
538	Chronic tubulo-interstitial nephritis	\N	1
539	Chylous effusion	\N	1
540	Chyluria	\N	1
542	Cirrhosis	\N	1
543	Clonic hemifacial spasm	\N	1
548	Cluster headache	\N	1
549	Coalworker's pneumoconiosis	\N	1
550	Coarctation of aorta	\N	1
553	Cochlear otosclerosis	\N	1
554	Coeliac artery compression syndrome	\N	1
555	Cold injury syndrome	\N	1
556	Coloboma of iris	\N	1
557	Coloboma of lens	\N	1
560	Common variable immunodeficiency	\N	1
561	Communicating hydrocephalus	\N	1
562	Compensatory emphysema	\N	1
563	Complete uterovaginal prolapse	\N	1
564	Complex partial status epilepticus	\N	1
565	Complicated cataract	\N	1
566	Complicated migraine	\N	1
567	Concentric sclerosis	\N	1
568	Concussion	\N	1
569	Concussion and oedema of cervical spinal cord	\N	1
570	Concussion and oedema of lumbar spinal cord	\N	1
571	Concussion and oedema of thoracic spinal cord	\N	1
572	Conduct disorders	\N	1
573	Conductive and sensorineural hearing loss	\N	1
574	Conductive hearing loss, bilateral	\N	1
575	Conductive hearing loss, unilateral with unrestricted hearing on the contralateral side	\N	1
576	Conductive hearing loss, unspecified	\N	1
577	Congenital alopecia	\N	1
578	Congenital bronchiectasis	\N	1
579	Congenital bronchomalacia	\N	1
580	Congenital bullous ichthyosiform erythroderma	\N	1
581	Congenital cataract	\N	1
585	Congenital tracheoesophageal fistula without atresia	\N	1
587	Congestive heart failure	\N	1
588	Conjunctival hemorrhage	\N	1
589	Conjunctivitis - inclusion	\N	1
591	Contact dermatitis	\N	1
592	Contact urticaria	\N	1
593	Contusion of abdominal wall	\N	1
594	Contusion of ankle	\N	1
595	Contusion of breast	\N	1
596	Contusion of elbow	\N	1
597	Contusion of external genital organs	\N	1
598	Contusion of eyeball and orbital tissues	\N	1
599	Contusion of eyelid and periocular area	\N	1
600	Contusion of finger(s) with damage to nail	\N	1
601	Contusion of finger(s) without damage to nail	\N	1
602	Contusion of hip	\N	1
603	Contusion of knee	\N	1
604	Contusion of lower back and pelvis	\N	1
605	Contusion of shoulder and upper arm	\N	1
606	Contusion of thigh	\N	1
607	Contusion of thorax	\N	1
608	Contusion of throat	\N	1
609	Contusion of toe(s) with damage to nail	\N	1
610	Contusion of toe(s) without damage to nail	\N	1
611	Convulsions of newborn	\N	1
612	Copper deficiency	\N	1
613	Cor triatriatum	\N	1
614	Cord compression	\N	1
615	Corneal degeneration	\N	1
616	Corneal ulcer	\N	1
617	Corns and callosities	\N	1
618	Coronary artery aneurysm	\N	1
620	Corpus luteum cyst	\N	1
621	Cow's milk hypoglycemia in newborn	\N	1
623	Coxarthrosis [arthrosis of hip]	\N	1
624	CREST syndrome	\N	1
625	Cracked nipple associated with childbirth	\N	1
626	Craniofacial dysostosis	\N	1
627	Craniorachischisis	\N	1
628	Craniosynostosis	\N	1
630	Crigler-najjar syndrome	\N	1
632	Crohn's disease	\N	1
633	Crushed chest	\N	1
634	Cryoglobulinemia	\N	1
637	Crystal arthropathy	\N	1
638	Crystalline deposits in vitreous body	\N	1
639	Cushing's syndrome	\N	1
644	Cutis laxa senilis	\N	1
646	Cyclic neutropenia	\N	1
648	Cyclothymia	\N	1
649	Cyst of bartholin's gland	\N	1
650	Cystic fibrosis	\N	1
653	Cystocele	\N	1
658	Decubitus ulcer and pressure area	\N	1
659	Delta-beta thalassemia	\N	1
660	Delusional disorder	\N	1
661	Dementia in alzheimer's disease	\N	1
662	Dementia in human immunodeficiency virus [hiv] disease	\N	1
663	Dementia in huntington's disease	\N	1
664	Dementia in parkinson's disease	\N	1
665	Dementia in pick's disease	\N	1
669	Dermatitis due to ingested food	\N	1
670	Dermatitis herpetiformis	\N	1
671	Dermatophytosis	\N	1
672	Deviated nasal septum	\N	1
673	Dextrocardia	\N	1
674	Diabetes insipidus	\N	1
675	Diabetes mellitus	\N	1
676	Diabetes mellitus in pregnancy	\N	1
677	Diabetic arthropathy	\N	1
678	Diabetic cataract	\N	1
679	Diabetic mononeuropathy	\N	1
680	Diabetic polyneuropathy	\N	1
681	Diabetic retinopathy	\N	1
682	Diastematomyelia	\N	1
685	Diffuse (eosinophilic) fasciitis	\N	1
686	Diffuse brain injury	\N	1
687	Diffuse cystic mastopathy	\N	1
688	Diffuse follicle centre lymphoma	\N	1
689	Diffuse large b-cell lymphoma	\N	1
690	Diffuse sclerosis	\N	1
691	Digeorge syndrome	\N	1
692	Dilated cardiomyopathy	\N	1
701	Discoid lupus erythematosus	\N	1
702	Dislocation of acromioclavicular joint	\N	1
703	Dislocation of ankle joint	\N	1
704	Dislocation of cervical vertebra	\N	1
706	Dislocation of finger	\N	1
707	Dislocation of hip	\N	1
708	Dislocation of jaw	\N	1
709	Dislocation of knee	\N	1
710	Dislocation of lens	\N	1
711	Dislocation of lumbar vertebra	\N	1
712	Dislocation of patella	\N	1
713	Dislocation of radial head	\N	1
714	Dislocation of sacroiliac and sacrococcygeal joint	\N	1
715	Dislocation of septal cartilage of nose	\N	1
716	Dislocation of shoulder joint	\N	1
717	Dislocation of sternoclavicular joint	\N	1
718	Dislocation of thoracic vertebra	\N	1
719	Dislocation of toe(s)	\N	1
720	Dislocation of wrist	\N	1
736	Dissociative [conversion] disorders	\N	1
737	Dissociative amnesia	\N	1
738	Dissociative anesthesia and sensory loss	\N	1
739	Dissociative convulsions	\N	1
740	Dissociative fugue	\N	1
741	Dissociative motor disorders	\N	1
742	Dissociative stupor	\N	1
743	Diverticular disease of intestine (diverticulitis)	\N	1
744	Down syndrome	\N	1
747	Dressler's syndrome	\N	1
748	Drug fever	\N	1
749	Drug photoallergic response	\N	1
750	Drug phototoxic response	\N	1
751	Drug rehabilitation	\N	1
752	Drug use	\N	1
753	Drug- and heavy-metal-induced tubulo-interstitial and tubular conditions	\N	1
754	Drug-induced acute pancreatitis	\N	1
755	Drug-induced adrenocortical insufficiency	\N	1
756	Drug-induced androgenic alopecia	\N	1
757	Drug-induced aplastic anemia	\N	1
758	Drug-induced autoimmune hemolytic anemia	\N	1
759	Drug-induced cataract	\N	1
760	Drug-induced chorea	\N	1
761	Drug-induced cushing's syndrome	\N	1
762	Drug-induced dystonia	\N	1
763	Drug-induced fever	\N	1
764	Drug-induced folate deficiency anemia	\N	1
765	Drug-induced gout	\N	1
766	Drug-induced headache, not elsewhere classified	\N	1
767	Drug-induced hypoglycemia without coma	\N	1
768	Drug-induced hypopituitarism	\N	1
769	Drug-induced interstitial lung disorders, unspecified	\N	1
770	Drug-induced myopathy	\N	1
771	Drug-induced non-autoimmune hemolytic anemia	\N	1
772	Drug-induced obesity	\N	1
773	Drug-induced osteoporosis	\N	1
774	Drug-induced osteoporosis with pathological fracture	\N	1
775	Drug-induced pemphigus	\N	1
776	Drug-induced polyneuropathy	\N	1
777	Drug-induced systemic lupus erythematosus	\N	1
778	Drug-induced thyroiditis	\N	1
779	Drug-induced tics and other tics of organic origin	\N	1
780	Drug-induced tremor	\N	1
781	Duodenal ulcer	\N	1
782	Duodenitis	\N	1
783	Dyshidrosis [pompholyx]	\N	1
784	Dyspareunia	\N	1
785	Dyspepsia	\N	1
786	Eastern equine encephalitis	\N	1
787	Eaton-lambert syndrome	\N	1
789	Ebstein's anomaly	\N	1
793	Eclampsia	\N	1
794	Ectopic pregnancy	\N	1
795	Ectropion of eyelid	\N	1
796	Eczema herpeticum	\N	1
797	Edwards' syndrome and patau's syndrome	\N	1
798	Edwardsiella tarda	\N	1
799	Ehlers-danlos syndrome	\N	1
801	Elastosis perforans serpiginosa	\N	1
802	Elective mutism	\N	1
803	Emphysema	\N	1
807	Endomyocardial (eosinophilic) disease	\N	1
828	Environmental hyperthermia of newborn	\N	1
829	Eosinophilia	\N	1
830	Eosinophilic cellulitis [wells]	\N	1
831	Epicranial subaponeurotic hemorrhage due to birth injury	\N	1
835	Epidermal cyst	\N	1
836	Epidermolysis bullosa	\N	1
837	Epidermolysis bullosa dystrophica	\N	1
838	Epidermolysis bullosa letalis	\N	1
839	Epidermolysis bullosa simplex	\N	1
840	Epidermolysis bullosa, unspecified	\N	1
843	Epidural hematoma	\N	1
844	Epilepsy	\N	1
845	Epiphora	\N	1
846	Episcleritis	\N	1
847	Epistaxis	\N	1
848	Erb's paralysis due to birth injury	\N	1
852	Erythema ab igne [dermatitis ab igne]	\N	1
853	Erythema annulare centrifugum	\N	1
854	Erythema elevatum diutinum	\N	1
855	Erythema in diseases classified elsewhere	\N	1
856	Erythema in other diseases classified elsewhere	\N	1
861	Erythema Multiforme (EM)	\N	1
862	Erythema nodosum	\N	1
863	Erythrasma	\N	1
865	Esophageal web	\N	1
866	Essential (hemorrhagic) thrombocythemia	\N	1
867	Essential (primary) hypertension	\N	1
868	Essential fatty acid [efa] deficiency	\N	1
869	Essential tremor	\N	1
870	Eumycetoma	\N	1
871	Eustachian salpingitis	\N	1
872	Exfoliative dermatitis	\N	1
873	Extramedullary plasmacytoma	\N	1
874	Extranodal marginal zone b-cell lymphoma of mucosa-associated lymphoid tissue [malt-lymphoma]	\N	1
875	Extranodal nk/t-cell lymphoma, nasal type	\N	1
876	Factitious fever	\N	1
877	False labour	\N	1
878	Familial chondrocalcinosis	\N	1
879	Familial dysautonomia [riley-day]	\N	1
880	Familial erythrocytosis	\N	1
881	Familial mediterranean fever (fmf)	\N	1
883	Farmer's lung	\N	1
885	Fat embolism (traumatic)	\N	1
886	Febrile convulsions	\N	1
887	Febrile neutrophilic dermatosis [sweet]	\N	1
888	Femoral hernia	\N	1
889	Fever of other and unknown origin	\N	1
890	Fibromyalgia	\N	1
894	Flail chest	\N	1
895	Flail joint	\N	1
896	Flat foot [pes planus] (acquired)	\N	1
897	Flatback syndrome	\N	1
898	Flax-dresser's disease	\N	1
899	Flexion deformity	\N	1
900	Flexor tendon (FT) tenosynovitis	\N	1
901	Fluid overload	\N	1
902	Folate deficiency anemia	\N	1
903	Follicular lymphoma	\N	1
907	Fourth [trochlear] nerve palsy	\N	1
908	Fracture at wrist and hand level	\N	1
909	Fracture of acetabulum	\N	1
910	Fracture of base of skull	\N	1
911	Fracture of bone following insertion of orthopedic implant, joint prosthesis, or bone plate	\N	1
912	Fracture of bone in neoplastic disease	\N	1
913	Fracture of bony thorax	\N	1
914	Fracture of calcaneus	\N	1
915	Fracture of clavicle	\N	1
916	Fracture of clavicle due to birth injury	\N	1
917	Fracture of coccyx	\N	1
918	Fracture of femur	\N	1
919	Fracture of fibula alone	\N	1
920	Fracture of first cervical vertebra	\N	1
921	Fracture of first metacarpal bone	\N	1
922	Fracture of foot, except ankle	\N	1
923	Fracture of foot, unspecified	\N	1
924	Fracture of forearm	\N	1
925	Fracture of great toe	\N	1
926	Fracture of ilium	\N	1
927	Fracture of lateral malleolus	\N	1
933	Fracture of lower leg, including ankle	\N	1
935	Fracture of lumbar spine and pelvis	\N	1
936	Fracture of lumbar vertebra	\N	1
937	Fracture of malar and maxillary bones	\N	1
938	Fracture of mandible	\N	1
939	Fracture of medial malleolus	\N	1
940	Fracture of metatarsal bone	\N	1
941	Fracture of nasal bones	\N	1
943	Fracture of neck	\N	1
944	Fracture of neck of femur	\N	1
945	Fracture of orbital floor	\N	1
947	Fracture of other carpal bone(s)	\N	1
948	Fracture of other finger	\N	1
949	Fracture of other metacarpal bone	\N	1
950	Fracture of other parts of forearm	\N	1
951	Fracture of other parts of neck	\N	1
953	Fracture of other tarsal bone(s)	\N	1
954	Fracture of other toe	\N	1
955	Fracture of patella	\N	1
956	Fracture of pubis	\N	1
957	Fracture of rib	\N	1
958	Fracture of rib(s), sternum and thoracic spine	\N	1
959	Fracture of sacrum	\N	1
960	Fracture of scapula	\N	1
961	Fracture of second cervical vertebra	\N	1
962	Fracture of shaft of femur	\N	1
963	Fracture of shaft of humerus	\N	1
964	Fracture of shaft of radius	\N	1
965	Fracture of shaft of tibia	\N	1
966	Fracture of shaft of ulna	\N	1
967	Fracture of shafts of both ulna and radius	\N	1
968	Fracture of shoulder and upper arm	\N	1
970	Fracture of skull and facial bones	\N	1
971	Fracture of skull due to birth injury	\N	1
973	Fracture of sternum	\N	1
974	Fracture of talus	\N	1
975	Fracture of thoracic vertebra	\N	1
976	Fracture of thumb	\N	1
977	Fracture of tooth	\N	1
978	Fracture of proximal humerus	\N	1
979	Fracture of proximal radius	\N	1
980	Fracture of proximal tibia	\N	1
981	Fracture of proximal ulna	\N	1
983	Fracture of vault of skull	\N	1
985	Frostbite with tissue necrosis	\N	1
986	Functional diarrhoea	\N	1
987	Galactorrhoea	\N	1
988	Gallstone ileus	\N	1
989	Ganglion	\N	1
991	Gastric ulcer	\N	1
992	Gastric varices	\N	1
993	Gastritis	\N	1
997	Gastroschisis	\N	1
998	Generalized anxiety disorder	\N	1
999	Geographic tongue	\N	1
1001	Gestational edema	\N	1
1002	Gestational oedema with proteinuria	\N	1
1003	Gestational proteinuria	\N	1
1004	Gianotti-crosti syndrome	\N	1
1005	Giant cell arteritis with polymyalgia rheumatica	\N	1
1006	Giant cell granuloma, central	\N	1
1008	Gilbert's syndrome	\N	1
1009	Gingivitis and periodontal diseases	\N	1
1012	Glaucoma	\N	1
1014	Gluteal tendinitis	\N	1
1016	Gonarthrosis	\N	1
1019	Gottron's papules	\N	1
1020	Gout	\N	1
1021	Gout due to impairment of renal function	\N	1
1022	Gout, unspecified	\N	1
1023	Gouty arthropathy due to enzyme defects and other inherited disorders	\N	1
1024	Grand mal seizures, unspecified (with or without petit mal)	\N	1
1025	Grand mal status epilepticus	\N	1
1030	Graphite fibrosis (of lung)	\N	1
1031	Guillain-barre syndrome	\N	1
1033	Guttate psoriasis	\N	1
1038	Hairy-cell leukemia	\N	1
1039	Hallervorden-spatz disease	\N	1
1041	Heart failure	\N	1
1042	Heartburn	\N	1
1043	Heat cramp	\N	1
1044	Hebephrenic schizophrenia	\N	1
1045	Hellp syndrome	\N	1
1034	Hemolytic-uremic syndrome	\N	1
1046	Hemoperitoneum	\N	1
1047	Hemophagocytic lymphohistiocytosis	\N	1
1035	Hemorrhagic fever with renal syndrome	\N	1
1036	Hemorrhoids	\N	1
1048	Hemothorax	\N	1
1055	Hepatocellular carcinoma	\N	1
1056	Hepatorenal syndrome	\N	1
1057	Hepatosplenic t-cell lymphoma	\N	1
1058	Hereditary and idiopathic neuropathy	\N	1
1059	Hereditary ataxia	\N	1
1060	Hereditary choroidal dystrophy	\N	1
1061	Hereditary elliptocytosis	\N	1
1062	Hereditary erythropoietic porphyria	\N	1
1063	Hereditary factor ix deficiency (hemophilia b)	\N	1
1064	Hereditary factor viii deficiency (hemophilia a)	\N	1
1065	Hereditary factor xi deficiency	\N	1
1066	Hereditary hemorrhagic telangiectasia	\N	1
1067	Hereditary hypogammaglobulinemia	\N	1
1068	Hereditary lymphoedema	\N	1
1069	Hereditary sideroblastic anemia	\N	1
1070	Hereditary spastic paraplegia	\N	1
1071	Hereditary spherocytosis	\N	1
1080	Hidradenitis suppurativa	\N	1
1081	Hirschsprung's disease	\N	1
1082	Histiocytic sarcoma	\N	1
1085	Histrionic personality disorder	\N	1
1087	Hodgkin lymphoma	\N	1
1090	Horner's syndrome	\N	1
1091	Hostility	\N	1
1092	Human metapneumovirus pneumonia	\N	1
1093	Huntington's disease	\N	1
1094	Hydatidiform mole	\N	1
1095	Hydrocephalus	\N	1
1096	Hymenolepis diminuta infection	\N	1
1097	Hymenolepis nana infection	\N	1
1100	Hyperaldosteronism	\N	1
1101	Hyperkalemia	\N	1
1102	Hypermobility syndrome	\N	1
1104	Hypersplenism	\N	1
1105	Hyperthyroid	\N	1
1106	Hypertrichosis	\N	1
1107	Hypervitaminosis a	\N	1
1109	Hyphema	\N	1
1110	Hypo-osmolality and hyponatremia	\N	1
1111	Hypochondriacal disorder	\N	1
1112	Hypoglycemia, unspecified	\N	1
1113	Hypokalemia	\N	1
1114	Hypomania	\N	1
1115	Hypoparathyroidism	\N	1
1116	Hypothermia	\N	1
1117	Hypothyroidism	\N	1
1118	Hypotony of eye	\N	1
1119	Hypovolemic shock	\N	1
1120	Ichthyosis vulgaris	\N	1
1121	Idiopathic acute pancreatitis	\N	1
1122	Idiopathic aplastic anemia	\N	1
1123	Idiopathic aseptic necrosis of bone	\N	1
1124	Idiopathic familial dystonia	\N	1
1125	Idiopathic gout	\N	1
1126	Idiopathic hypoparathyroidism	\N	1
1127	Idiopathic hypotension	\N	1
1128	Idiopathic non familial dystonia	\N	1
1129	Idiopathic orofacial dystonia	\N	1
1130	Idiopathic osteoporosis	\N	1
1131	Idiopathic osteoporosis with pathological fracture	\N	1
1132	Idiopathic peripheral autonomic neuropathy	\N	1
1133	Idiopathic progressive neuropathy	\N	1
1134	Idiopathic thrombocytopenic purpura (acute)	\N	1
1135	Idiopathic urticaria	\N	1
1136	Iliac crest spur	\N	1
1137	Iliotibial band syndrome	\N	1
1138	Immunodeficiency reconstitution syndrome	\N	1
1140	Incontinentia pigmenti	\N	1
1141	Infantile acne	\N	1
1142	Infantile idiopathic scoliosis	\N	1
1143	Infarction of liver	\N	1
1144	Infarction of spleen	\N	1
1155	Ingrowing nail	\N	1
1156	Inguinal hernia	\N	1
1157	Insulin-dependent diabetes mellitus	\N	1
1158	Intercostal neuropathy	\N	1
1159	Internal hemorrhoids without complication	\N	1
1160	Internal hirudiniasis	\N	1
1161	Internal thrombosed hemorrhoids	\N	1
1162	Internuclear ophthalmoplegia	\N	1
1163	Interstitial cystitis (chronic)	\N	1
1167	Intracranial hemorrhage (stroke)	\N	1
1168	Intracranial venous thrombosis	\N	1
1169	Intussusception	\N	1
1170	Iodine-deficiency-related thyroid disorders and allied conditions	\N	1
1171	Iridocyclitis	\N	1
1172	Irradiation cystitis	\N	1
1176	Juvenile ankylosing spondylitis	\N	1
1177	Juvenile arthritis	\N	1
1178	Juvenile dermatomyositis	\N	1
1179	Juvenile idiopathic scoliosis	\N	1
1180	Juvenile myelomonocytic leukemia	\N	1
1181	Juvenile polyarteritis	\N	1
1182	Juvenile rheumatoid arthritis	\N	1
1183	Kaposi's sarcoma	\N	1
1184	Kawasaki disease	\N	1
1185	Keratitis	\N	1
1186	Kernicterus	\N	1
1187	Kikuchi's disease	\N	1
1188	Kimura disease	\N	1
1189	Kingella infection	\N	1
1192	Klippel-feil syndrome	\N	1
1193	Klumpke's paralysis due to birth injury	\N	1
1194	Kwashiorkor	\N	1
1197	Lactose intolerance	\N	1
1198	Laryngeal spasm	\N	1
1202	Left anterior fascicular block	\N	1
1204	Left posterior fascicular block	\N	1
1213	Leukemia	\N	1
1214	Leukoderma, not elsewhere classified	\N	1
1216	Leukoplakia of cervix uteri	\N	1
1217	Leukoplakia of penis	\N	1
1218	Leukoplakia of vagina	\N	1
1219	Leukoplakia of vulva	\N	1
1220	Lichen nitidus	\N	1
1221	Lichen planopilaris	\N	1
1222	Lichen planus	\N	1
1223	Lichen planus, unspecified	\N	1
1224	Lichen ruber moniliformis	\N	1
1225	Lichen sclerosus et atrophicus	\N	1
1226	Lichen simplex chronicus	\N	1
1227	Lichen striatus	\N	1
1228	Lichenoid drug reaction	\N	1
1229	Linear scleroderma	\N	1
1235	Lumbago with sciatica	\N	1
1236	Lupus erythematosus	\N	1
1239	Lymphoblastic (diffuse) lymphoma	\N	1
1240	Lymphocyte function antigen-1 [lfa-1] defect	\N	1
1243	Lymphoid leukemia	\N	1
1244	Lymphoma	\N	1
1245	Lymphomatoid papulosis	\N	1
1247	Magnesium deficiency	\N	1
1252	Malignant hyperthermia due to anesthesia	\N	1
1253	Malignant melanoma of skin	\N	1
1254	Maltworker's lung	\N	1
1255	Manganese deficiency	\N	1
1256	Manic episode	\N	1
1258	Mantle cell lymphoma	\N	1
1259	Maple-bark-stripper's lung	\N	1
1260	Maple-syrup-urine disease	\N	1
1261	Marasmic kwashiorkor	\N	1
1263	Marfan's syndrome	\N	1
1264	Mast cell leukemia	\N	1
1265	Mastocytosis	\N	1
1266	Mastoiditis	\N	1
1269	Meckel's diverticulum	\N	1
1270	Medial epicondylitis	\N	1
1272	Melkersson's syndrome	\N	1
1273	Mendelson's syndrome	\N	1
1280	Mesothelioma	\N	1
1281	Methemoglobinemia	\N	1
1282	Microscopic polyangiitis	\N	1
1284	Migraine	\N	1
1285	Mitochondrial myopathy, not elsewhere classified	\N	1
1288	Mitral stenosis	\N	1
1289	Mittelschmerz	\N	1
1292	Molybdenum deficiency	\N	1
1296	Monocytic leukemia	\N	1
1297	Mononeuritis multiplex	\N	1
1298	Motion sickness	\N	1
1299	Moyamoya disease	\N	1
1302	Mucopolysaccharidosis, type I	\N	1
1303	Mucopolysaccharidosis, type II	\N	1
1305	Multi-infarct dementia	\N	1
1306	Multifocal and non systemic langerhans-cell histiocytosis	\N	1
1307	Multiple myeloma	\N	1
1308	Multiple sclerosis	\N	1
1310	Muscle strain	\N	1
1311	Muscular dystrophy	\N	1
1312	Mushroom-worker's lung	\N	1
1313	Myasthenia gravis	\N	1
1322	Myelodysplastic syndromes	\N	1
1323	Myeloid sarcoma	\N	1
1328	Narcolepsy and cataplexy	\N	1
1329	Nasal polyp	\N	1
1332	Nelson's syndrome	\N	1
1333	Neonatal adrenal hemorrhage	\N	1
1334	Nephritic syndrome	\N	1
1335	Nephrotic syndrome	\N	1
1337	Nezelof's syndrome	\N	1
1341	Nummular dermatitis	\N	1
1343	Obsessive-compulsive disorder	\N	1
1348	Olecranon bursitis	\N	1
1352	Oppositional defiant disorder	\N	1
1353	Optic neuritis	\N	1
1360	Orthostatic hypotension	\N	1
1361	Osteogenesis imperfecta	\N	1
1366	Paget disease of bone [osteitis deformans]	\N	1
1367	Panic disorder [episodic paroxysmal anxiety]	\N	1
1375	Parkinson's disease	\N	1
1376	Paroxysmal nocturnal hemoglobinuria [marchiafava-micheli]	\N	1
1384	Pemphigoid	\N	1
1385	Pemphigus	\N	1
1386	Pemphigus erythematosus	\N	1
1387	Pemphigus foliaceus	\N	1
1388	Pemphigus vegetans	\N	1
1389	Pemphigus vulgaris	\N	1
1391	Pentastomiasis - linguatula	\N	1
1392	Peptic ulcer	\N	1
1394	Perineal laceration during delivery, second degree	\N	1
1395	Perineal laceration during delivery, third degree	\N	1
1401	Peroneal tendinitis	\N	1
1403	Petit mal status epilepticus	\N	1
1405	Pfapa syndrome	\N	1
1414	Placenta previa	\N	1
1417	Plantar fasciitis	\N	1
1418	Plasma cell leukemia	\N	1
1420	Pleurodynia	\N	1
1426	Pneumothorax	\N	1
1427	Poikiloderma of civatte	\N	1
1428	Poikiloderma vasculare atrophicans	\N	1
1430	Polyarteritis nodosa	\N	1
1431	Polyarteritis nodosa and related conditions	\N	1
1432	Polyclonal hypergammaglobulinemia	\N	1
1435	Polycythemia vera	\N	1
1436	Polymyalgia rheumatica	\N	1
1437	Polymyositis	\N	1
1438	Polyneuropathy, unspecified	\N	1
1439	Porphyria cutanea tarda	\N	1
1440	Portal hypertension	\N	1
1441	Portal vein thrombosis	\N	1
1443	Postcardiotomy syndrome	\N	1
1444	Postcholecystectomy syndrome	\N	1
1445	Post-concussion syndrome	\N	1
1446	Posterior fossa syndrome	\N	1
1448	Postinfectious hypothyroidism	\N	1
1449	Postoperative intestinal obstruction	\N	1
1450	Postpartum thyroiditis	\N	1
1451	Potter syndrome	\N	1
1454	Priapism	\N	1
1455	Primary adrenocortical insufficiency	\N	1
1456	Primary angle-closure glaucoma	\N	1
1457	Primary biliary cirrhosis	\N	1
1458	Primary hyperaldosteronism	\N	1
1459	Primary hyperparathyroidism	\N	1
1460	Progressive external ophthalmoplegia	\N	1
1462	Progressive supranuclear ophthalmoplegia [steele-richardson-olszewski]	\N	1
1463	Progressive systemic sclerosis	\N	1
1464	Progressive vascular leukoencephalopathy	\N	1
1468	Pseudosepsis	\N	1
1470	Psoas tendinitis	\N	1
1471	Psoriasis	\N	1
1472	Psoriasis vulgaris	\N	1
1473	Psoriatic and enteropathic arthropathies	\N	1
1474	Psoriatic spondylitis	\N	1
1475	Pterygium	\N	1
1476	Pulmonary embolism	\N	1
1477	Pulmonary eosinophilia	\N	1
1478	Pulmonary infarction	\N	1
1479	Pulmonary valve insufficiency	\N	1
1480	Pulmonary valve stenosis	\N	1
1482	Pyoderma gangrenosum	\N	1
1488	Rabies	\N	1
1489	Radiation proctitis	\N	1
1490	Radicular cyst	\N	1
1491	Radiculopathy	\N	1
1492	Radiodermatitis	\N	1
1497	Rectal abscess	\N	1
1498	Rectal fistula	\N	1
1499	Refsum's disease	\N	1
1503	Relapsing polychondritis	\N	1
1505	Renal dysplasia	\N	1
1506	Renal osteodystrophy	\N	1
1507	Renovascular hypertension	\N	1
1509	Residual schizophrenia	\N	1
1510	Respiratory arrest	\N	1
1518	Retiform parapsoriasis	\N	1
1520	Retinal hemorrhage	\N	1
1522	Retinopathy of prematurity	\N	1
1523	Retinoschisis and retinal cysts	\N	1
1524	Retracted nipple associated with childbirth	\N	1
1525	Retrobulbar neuritis in diseases classified elsewhere	\N	1
1526	Retrograde amnesia	\N	1
1529	Rett's syndrome	\N	1
1530	Reye's syndrome	\N	1
1531	Rh incompatibility reaction	\N	1
1535	Rheumatoid bursitis	\N	1
1536	Rheumatoid lung disease	\N	1
1537	Rheumatoid vasculitis	\N	1
1538	Rhinocerebral mucormycosis	\N	1
1540	Rhinoscleroma and ozena	\N	1
1545	Rickets, active	\N	1
1550	Right fascicular block	\N	1
1553	Rosacea	\N	1
1556	Rotator cuff syndrome	\N	1
1565	Rupture of artery	\N	1
1566	Rupture of bladder, nontraumatic	\N	1
1567	Rupture of cardiac wall without hemopericardium as current complication following acute myocardial infarction	\N	1
1569	Rupture of ligaments at ankle and foot level	\N	1
1572	Rupture of synovium	\N	1
1573	Rupture of uterus before onset of labor	\N	1
1574	Sacral spina bifida with hydrocephalus	\N	1
1575	Sacral spina bifida without hydrocephalus	\N	1
1576	Sacroiliitis, not elsewhere classified	\N	1
1577	Sadomasochism	\N	1
1581	Sarcocystosis	\N	1
1582	Sarcoidosis	\N	1
1583	Sarcoma of dendritic cells (accessory cells)	\N	1
1594	Schizoaffective disorder, depressive type	\N	1
1595	Schizoaffective disorder, manic type	\N	1
1596	Schizoaffective disorder, mixed type	\N	1
1597	Schizoaffective disorders	\N	1
1598	Schizoid personality disorder	\N	1
1599	Schizophrenia	\N	1
1601	Schmorl's nodes	\N	1
1602	Sciatica	\N	1
1603	Sclerema neonatorum	\N	1
1604	Scleritis	\N	1
1605	Sclerodactyly	\N	1
1606	Scoliosis	\N	1
1607	Scorbutic anemia	\N	1
1608	Scrotal varices	\N	1
1609	Seborrhoea capitis	\N	1
1610	Seborrhoeic dermatitis	\N	1
1611	Seborrhoeic infantile dermatitis	\N	1
1612	Seborrhoeic keratosis	\N	1
1613	Secondary amenorrhoea	\N	1
1614	Senile osteomalacia	\N	1
1615	Senility	\N	1
1637	Seronegative rheumatoid arthritis	\N	1
1638	Seropositive rheumatoid arthritis	\N	1
1639	Serous retinal detachment	\N	1
1640	Serum neuropathy	\N	1
1641	Severe acute respiratory syndrome [SARS]	\N	1
1642	Severe alcohol intoxication	\N	1
1643	Severe combined immunodeficiency [scid] with low or normal b-cell numbers	\N	1
1644	Severe combined immunodeficiency [scid] with low t- and b-cell numbers	\N	1
1645	Severe combined immunodeficiency [scid] with reticular dysgenesis	\N	1
1646	Severe depressive episode with psychotic symptoms	\N	1
1647	Sezary's disease	\N	1
1649	Sialoadenitis	\N	1
1650	Sialolithiasis	\N	1
1651	Sicca syndrome [sjogren]	\N	1
1652	Sick sinus syndrome	\N	1
1653	Sickle-cell crisis	\N	1
1654	Sickle-cell anemia	\N	1
1655	Sickle-cell disorders	\N	1
1656	Sickle-cell trait	\N	1
1657	Sideropenic dysphagia	\N	1
1658	Siderosis	\N	1
1659	Sinus barotrauma	\N	1
1661	Situs inversus	\N	1
1662	Sixth [abducent] nerve palsy	\N	1
1663	Skeletal fluorosis	\N	1
1664	Sleep apnoea	\N	1
1665	Sleep terrors [night terrors]	\N	1
1666	Sleepwalking [somnambulism]	\N	1
1667	Slipped upper femoral epiphysis (nontraumatic)	\N	1
1668	Small cell b-cell lymphoma	\N	1
1670	Social anxiety disorder of childhood	\N	1
1671	Social role conflict, not elsewhere classified	\N	1
1672	Socialized conduct disorder	\N	1
1673	Solar urticaria	\N	1
1674	Somatization disorder	\N	1
1676	Spasmodic torticollis	\N	1
1677	Spermatocele	\N	1
1678	Spherophakia	\N	1
1679	Spina bifida	\N	1
1680	Spina bifida occulta	\N	1
1681	Spinal enthesopathy	\N	1
1682	Spinal osteochondrosis	\N	1
1683	Spinal stenosis	\N	1
1684	Spirillosis	\N	1
1685	Spirochetal infection, unspecified	\N	1
1686	Split foot	\N	1
1687	Spondyloepiphyseal dysplasia	\N	1
1688	Spondylolisthesis	\N	1
1689	Spondylolysis	\N	1
1690	Spondylosis	\N	1
1691	Spontaneous abortion	\N	1
1692	Spontaneous rupture of extensor tendons	\N	1
1693	Spontaneous rupture of flexor tendons	\N	1
1694	Spontaneous rupture of other tendons	\N	1
1695	Spontaneous rupture of synovium and tendon	\N	1
1696	Spontaneous rupture of unspecified tendon	\N	1
1697	Spontaneous tension pneumothorax	\N	1
1707	Sprain and strain involving (anterior)(posterior) cruciate ligament of knee	\N	1
1708	Sprain and strain involving (fibular)(tibial) collateral ligament of knee	\N	1
1709	Sprain and strain of acromioclavicular joint	\N	1
1710	Sprain and strain of ankle	\N	1
1711	Sprain and strain of cervical spine	\N	1
1712	Sprain and strain of elbow	\N	1
1713	Sprain and strain of finger(s)	\N	1
1714	Sprain and strain of hip	\N	1
1715	Sprain and strain of jaw	\N	1
1716	Sprain and strain of lumbar spine	\N	1
1717	Sprain and strain of ribs and sternum	\N	1
1718	Sprain and strain of sacroiliac joint	\N	1
1719	Sprain and strain of shoulder joint	\N	1
1720	Sprain and strain of sternoclavicular joint	\N	1
1721	Sprain and strain of thoracic spine	\N	1
1722	Sprain and strain of thyroid region	\N	1
1723	Sprain and strain of toe(s)	\N	1
1724	Sprain and strain of wrist	\N	1
1726	Decubitus ulcer (stage I)	\N	1
1727	Decubitus ulcer (stage II)	\N	1
1728	Decubitus ulcer (stage III)	\N	1
1729	Decubitus ulcer (stage IV)	\N	1
1730	Stannosis	\N	1
1735	State of emotional shock and stress, unspecified	\N	1
1736	Status asthmaticus	\N	1
1737	Status epilepticus	\N	1
1738	Status migrainosus	\N	1
1739	Steatocystoma multiplex	\N	1
1740	Stenosis and insufficiency of lacrimal passages	\N	1
1741	Stevens johnson syndrome	\N	1
1742	Still's disease	\N	1
1743	Stomatitis and related lesions	\N	1
1752	Streptococcus suis infection	\N	1
1753	Stress incontinence	\N	1
1755	Striatonigral degeneration	\N	1
1756	Stridor	\N	1
1762	Subacute combined degeneration of spinal cord in diseases classified elsewhere	\N	1
1763	Subacute cutaneous lupus erythematosus	\N	1
1767	Subacute thyroiditis	\N	1
1768	Subarachnoid (nontraumatic) hemorrhage of fetus and newborn	\N	1
1769	Subarachnoid hemorrhage	\N	1
1770	Subclinical iodine-deficiency hypothyroidism	\N	1
1771	Subcorneal pustular dermatitis	\N	1
1772	Subcortical vascular dementia	\N	1
1773	Subcutaneous fat necrosis due to birth injury	\N	1
1774	Subcutaneous panniculitis-like t-cell lymphoma	\N	1
1777	Subdural hematoma	\N	1
1778	Suberosis	\N	1
1779	Sublingual varices	\N	1
1780	Subluxation complex (vertebral)	\N	1
1781	Subluxation of symphysis (pubis) in pregnancy, childbirth and the puerperium	\N	1
1782	Subluxation stenosis of neural canal	\N	1
1783	Submucous leiomyoma of uterus	\N	1
1784	Subtrochanteric fracture	\N	1
1785	Sudden infant death syndrome	\N	1
1786	Sunburn	\N	1
1787	Superficial frostbite	\N	1
1789	Supraventricular tachycardia	\N	1
1790	Sweets' syndrome (neutrophilic dermatosis)	\N	1
1793	Syndrome of inappropriate secretion of antidiuretic hormone	\N	1
1795	Synovial cyst of popliteal space [baker]	\N	1
1796	Synovitis	\N	1
1802	Systemic inflammatory response syndrome [SIRS]	\N	1
1803	Systemic lupus erythematosus (sle)	\N	1
1804	Systemic sclerosis	\N	1
1806	Tarsal tunnel syndrome	\N	1
1807	Tear of articular cartilage of knee	\N	1
1808	Tear of meniscus, current	\N	1
1809	Teething syndrome	\N	1
1810	Temporomandibular joint disorder	\N	1
1811	Tension-type headache	\N	1
1816	Tetracyclines	\N	1
1817	Tetralogy of fallot	\N	1
1818	Tetraplegia, unspecified	\N	1
1819	Thalassemia	\N	1
1820	Thalassemia trait	\N	1
1822	Therapeutic gases	\N	1
1823	Third [oculomotor] nerve palsy	\N	1
1824	Thoracic aortic aneurysm, ruptured	\N	1
1825	Threatened abortion	\N	1
1826	Thromboangiitis obliterans [buerger]	\N	1
1827	Thrombophlebitis migrans	\N	1
1828	Thrombosis of atrium, auricular appendage, and ventricle as current complications following acute myocardial infarction	\N	1
1829	Thrombotic microangiopathy	\N	1
1830	Thyroid crisis or storm	\N	1
1831	Thyroiditis	\N	1
1832	Thyrotoxicosis [hyperthyroidism]	\N	1
1833	Thyrotoxicosis factitia	\N	1
1834	Tibial collateral bursitis [pellegrini-stieda]	\N	1
1835	Tic disorders	\N	1
1846	Ovarian torsion	\N	1
1848	Torticollis	\N	1
1849	Total (external) ophthalmoplegia	\N	1
1850	Total anomalous pulmonary venous connection	\N	1
1861	Toxic effect: aflatoxin and other mycotoxin food contaminants	\N	1
1862	Toxic effect: alcohol, unspecified	\N	1
1863	Toxic effect: arsenic and its compounds	\N	1
1864	Toxic effect: benzene	\N	1
1865	Toxic effect: beryllium and its compounds	\N	1
1866	Toxic effect: cadmium and its compounds	\N	1
1867	Toxic effect: carbon dioxide	\N	1
1868	Toxic effect: carbon disulfide	\N	1
1869	Toxic effect: carbon monoxide	\N	1
1870	Toxic effect: carbon tetrachloride	\N	1
1871	Toxic effect: chlorine gas	\N	1
1872	Toxic effect: chlorofluorocarbons	\N	1
1873	Toxic effect: chloroform	\N	1
1874	Toxic effect: chromium and its compounds	\N	1
1875	Toxic effect: ciguatera fish poisoning	\N	1
1876	Toxic effect: copper and its compounds	\N	1
1877	Toxic effect: corrosive acids and acid-like substances	\N	1
1878	Toxic effect: corrosive alkalis and alkali-like substances	\N	1
1879	Toxic effect: corrosive substance, unspecified	\N	1
1880	Toxic effect: cyanides	\N	1
1881	Toxic effect: dichloromethane	\N	1
1882	Toxic effect: ethanol	\N	1
1883	Toxic effect: fluorine gas and hydrogen fluoride	\N	1
1884	Toxic effect: formaldehyde	\N	1
1885	Toxic effect: fusel oil	\N	1
1886	Toxic effect: gases, fumes and vapours, unspecified	\N	1
1887	Toxic effect: glycols	\N	1
1888	Toxic effect: halogen derivative of aliphatic and aromatic hydrocarbons, unspecified	\N	1
1889	Toxic effect: halogenated insecticides	\N	1
1890	Toxic effect: herbicides and fungicides	\N	1
1891	Toxic effect: homologues of benzene	\N	1
1892	Toxic effect: hydrogen cyanide	\N	1
1893	Toxic effect: hydrogen sulfide	\N	1
1894	Toxic effect: ingested berries	\N	1
1895	Toxic effect: ingested mushrooms	\N	1
1896	Toxic effect: inorganic substance, unspecified	\N	1
1897	Toxic effect: ketones	\N	1
1898	Toxic effect: lacrimogenic gas	\N	1
1899	Toxic effect: lead and its compounds	\N	1
1900	Toxic effect: manganese and its compounds	\N	1
1901	Toxic effect: mercury and its compounds	\N	1
1902	Toxic effect: metal, unspecified	\N	1
1903	Toxic effect: methanol	\N	1
1904	Toxic effect: nitroderivatives and aminoderivatives of benzene and its homologues	\N	1
1905	Toxic effect: nitrogen oxides	\N	1
1906	Toxic effect: nitroglycerin and other nitric acids and esters	\N	1
1907	Toxic effect: noxious substance eaten as food, unspecified	\N	1
1908	Toxic effect: organic solvent, unspecified	\N	1
1909	Toxic effect: organophosphate and carbamate insecticides	\N	1
1910	Toxic effect: other alcohols	\N	1
1911	Toxic effect: other corrosive organic compounds	\N	1
1912	Toxic effect: other fish and shellfish poisoning	\N	1
1913	Toxic effect: other halogen derivatives of aliphatic hydrocarbons	\N	1
1914	Toxic effect: other halogen derivatives of aromatic hydrocarbons	\N	1
1915	Toxic effect: other ingested (parts of) plant(s)	\N	1
1916	Toxic effect: other insecticides	\N	1
1917	Toxic effect: other metals	\N	1
1918	Toxic effect: other organic solvents	\N	1
1919	Toxic effect: other pesticides	\N	1
1920	Toxic effect: other specified gases, fumes and vapours	\N	1
1921	Toxic effect: other specified inorganic substances	\N	1
1922	Toxic effect: other specified noxious substances eaten as food	\N	1
1923	Toxic effect: paints and dyes, not elsewhere classified	\N	1
1924	Toxic effect: pesticide, unspecified	\N	1
1925	Toxic effect: pesticides	\N	1
1926	Toxic effect: petroleum products	\N	1
1927	Toxic effect: phenol and phenol homologues	\N	1
1928	Toxic effect: phosphorus and its compounds	\N	1
1929	Toxic effect: rodenticides	\N	1
1930	Toxic effect: scombroid fish poisoning	\N	1
1931	Toxic effect: snake venom	\N	1
1932	Toxic effect: soaps and detergents	\N	1
1933	Toxic effect: strychnine and its salts	\N	1
1934	Toxic effect: sulfur dioxide	\N	1
1935	Toxic effect: tetrachloroethylene	\N	1
1936	Toxic effect: tin and its compounds	\N	1
1937	Toxic effect: tobacco and nicotine	\N	1
1938	Toxic effect: toxic effect of contact with fish	\N	1
1939	Toxic effect: toxic effect of contact with other marine animals	\N	1
1940	Toxic effect: toxic effect of contact with other venomous animals	\N	1
1941	Toxic effect: toxic effect of contact with unspecified venomous animal	\N	1
1942	Toxic effect: toxic effect of other seafoods	\N	1
1943	Toxic effect: toxic effect of other specified substances	\N	1
1944	Toxic effect: toxic effect of unspecified seafood	\N	1
1945	Toxic effect: toxic effect of unspecified substance	\N	1
1946	Toxic effect: trichloroethylene	\N	1
1947	Toxic effect: venom of other arthropods	\N	1
1948	Toxic effect: venom of other reptiles	\N	1
1949	Toxic effect: venom of scorpion	\N	1
1950	Toxic effect: venom of spider	\N	1
1951	Toxic effect: zinc and its compounds	\N	1
1952	Toxic encephalopathy	\N	1
1953	Toxic epidermal necrolysis	\N	1
1954	Toxic erythema	\N	1
1955	Toxic gastroenteritis and colitis	\N	1
1956	Toxic liver disease	\N	1
1957	Toxic shock syndrome	\N	1
1966	Transcobalamin ii deficiency	\N	1
1968	Trichilemmal cyst	\N	1
1976	Tricuspid insufficiency	\N	1
1977	Tricuspid stenosis	\N	1
1978	Trifascicular block	\N	1
1979	Trigeminal neuralgia	\N	1
1980	Trigger finger	\N	1
1982	Trochanteric bursitis	\N	1
1989	Tubal pregnancy	\N	1
1992	Tuberous sclerosis	\N	1
1995	Tumour lysis syndrome	\N	1
1997	Turner's syndrome	\N	1
1998	Tympanosclerosis	\N	1
2005	Ulcerative (chronic) pancolitis	\N	1
2006	Ulcerative (chronic) proctitis	\N	1
2007	Ulcerative (chronic) rectosigmoiditis	\N	1
2008	Ulcerative colitis	\N	1
2010	Umbilical hernia	\N	1
2011	Unstable angina	\N	1
2012	Upper respiratory inflammation due to chemicals, gases, fumes and vapours, not elsewhere classified	\N	1
2014	Urethral fistula	\N	1
2015	Urethral stricture	\N	1
2017	Urinary calculus in schistosomiasis [bilharziasis]	\N	1
2019	Vaginal enterocele	\N	1
2020	Vaginismus	\N	1
2022	Vanadium deficiency	\N	1
2024	Varicose veins of lower extremities	\N	1
2025	Vascular dementia	\N	1
2026	Vascular myelopathies	\N	1
2027	Vascular parkinsonism	\N	1
2028	Vasovagal syncope	\N	1
2029	Ventral hernia	\N	1
2030	Ventricular fibrillation and flutter	\N	1
2031	Ventricular premature depolarization	\N	1
2032	Ventricular septal defect	\N	1
2033	Ventricular tachycardia	\N	1
2034	Vertebrobasilar artery syndrome	\N	1
2035	Vertical strabismus	\N	1
2036	Vesicoureteral-reflux-associated uropathy	\N	1
2037	Vesicovaginal fistula	\N	1
2038	Vestibular neuronitis	\N	1
2039	Vibratory urticaria	\N	1
2050	Vitamin a deficiency	\N	1
2051	Vitamin b deficiency, unspecified	\N	1
2052	Vitamin b12 deficiency anemia	\N	1
2053	Vitamin d deficiency	\N	1
2054	Vitiligo	\N	1
2055	Vitreous hemorrhage	\N	1
2056	Vitreous prolapse	\N	1
2057	Volume depletion	\N	1
2058	Volvulus	\N	1
2059	Von willebrand's disease	\N	1
2060	Voyeurism	\N	1
2061	Vulval varices	\N	1
2062	Vulvar cyst	\N	1
2063	Waldenstrom macroglobulinemia	\N	1
2065	Weber-christian disease	\N	1
2066	Wegener's granulomatosis	\N	1
2073	White piedra	\N	1
2077	Wilson-mikity syndrome	\N	1
2078	Wiskott-aldrich syndrome	\N	1
2079	Withdrawal symptoms from therapeutic use of drugs in newborn	\N	1
2081	Wrist or foot drop (acquired)	\N	1
2082	X-linked ichthyosis	\N	1
2083	Xanthelasma of eyelid	\N	1
2084	Xeroderma pigmentosum	\N	1
2085	Xerosis cutis	\N	1
2591	tetet	\N	1
\.


--
-- Name: explanation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doknosis
--

SELECT pg_catalog.setval('explanation_id_seq', 2591, true);


--
-- Data for Name: explanation_location; Type: TABLE DATA; Schema: public; Owner: doknosis
--

COPY explanation_location (id, explanation_id, location_id) FROM stdin;
1	135	10
2	136	10
3	205	2
4	205	3
5	205	4
6	205	5
7	205	6
8	205	7
9	205	8
10	205	9
11	205	10
12	225	2
13	225	3
14	225	4
15	225	7
16	225	8
17	225	9
18	225	10
19	272	7
20	272	8
21	272	9
22	426	5
23	445	1
24	445	2
25	445	3
26	445	4
27	524	1
28	524	2
29	524	3
30	524	4
31	524	6
32	524	7
33	524	8
34	524	9
35	524	10
36	525	1
37	525	2
38	525	3
39	525	4
40	558	1
41	558	3
42	631	5
43	631	6
44	631	7
45	631	8
46	631	9
47	631	10
48	666	1
49	666	2
50	666	3
51	666	4
52	666	7
53	666	8
54	666	9
55	666	10
56	667	1
57	667	2
58	667	3
59	667	4
60	667	7
61	667	8
62	667	9
63	667	10
64	668	1
65	668	2
66	668	3
67	668	4
68	668	7
69	668	8
70	668	9
71	668	10
72	683	1
73	683	5
74	683	7
75	683	10
76	731	2
77	731	3
78	731	4
79	746	6
80	746	10
81	788	10
82	882	5
83	882	6
84	882	7
85	882	8
86	892	6
87	892	7
88	892	8
89	892	9
90	892	10
91	893	6
92	893	7
93	893	8
94	893	9
95	893	10
96	1010	2
97	1010	3
98	1010	4
99	1010	5
100	1010	6
101	1010	7
102	1010	8
103	1010	9
104	1010	10
105	1011	2
106	1011	3
107	1011	4
108	1011	5
109	1011	6
110	1011	7
111	1011	8
112	1011	9
113	1011	10
114	1032	2
115	1032	3
116	1032	4
117	1032	6
118	1032	7
119	1032	8
120	1032	9
121	1032	10
122	1084	10
123	1174	6
124	1174	7
125	1174	8
126	1174	9
127	1175	2
128	1195	6
129	1195	7
130	1195	8
131	1200	10
132	1208	1
133	1208	2
134	1208	3
135	1208	4
136	1208	6
137	1208	8
138	1208	10
139	1209	2
140	1209	3
141	1209	4
142	1209	5
143	1209	6
144	1209	7
145	1209	8
146	1209	10
147	1233	1
148	1233	2
149	1233	3
150	1233	4
151	1234	10
152	1246	2
153	1246	3
154	1248	2
155	1248	3
156	1248	4
157	1248	5
158	1248	6
159	1248	7
160	1248	8
161	1248	9
162	1248	10
163	1249	2
164	1249	3
165	1249	4
166	1249	5
167	1249	6
168	1249	7
169	1249	8
170	1249	9
171	1249	10
172	1250	2
173	1250	3
174	1250	4
175	1250	5
176	1250	6
177	1250	7
178	1250	8
179	1250	9
180	1250	10
181	1251	2
182	1251	3
183	1251	4
184	1251	5
185	1251	6
186	1251	7
187	1251	8
188	1251	9
189	1251	10
190	1257	1
191	1257	2
192	1257	3
193	1257	4
194	1257	6
195	1257	10
196	1262	10
197	1271	2
198	1271	3
199	1271	4
200	1271	5
201	1271	6
202	1271	7
203	1271	8
204	1271	9
205	1271	10
206	1300	1
207	1300	2
208	1300	3
209	1300	4
210	1300	6
211	1300	7
212	1300	8
213	1300	10
214	1317	8
215	1317	9
216	1317	10
217	1342	10
218	1349	5
219	1349	7
220	1350	2
221	1350	3
222	1350	4
223	1350	6
224	1350	7
225	1350	8
226	1350	9
227	1350	10
228	1351	7
229	1351	8
230	1351	9
231	1359	2
232	1359	3
233	1359	4
234	1371	2
235	1371	3
236	1371	4
237	1415	1
238	1415	2
239	1415	3
240	1415	4
241	1415	5
242	1415	6
243	1415	7
244	1415	8
245	1415	10
246	1542	10
247	1549	6
248	1549	10
249	1551	2
250	1552	1
251	1552	2
252	1555	9
253	1586	6
254	1586	10
255	1587	6
256	1587	10
257	1588	2
258	1588	3
259	1588	4
260	1588	6
261	1588	8
262	1588	10
263	1589	2
264	1589	3
265	1589	4
266	1589	6
267	1589	8
268	1589	10
269	1590	2
270	1590	3
271	1590	4
272	1590	6
273	1590	8
274	1590	10
275	1591	6
276	1591	10
277	1592	6
278	1592	7
279	1592	8
280	1593	2
281	1593	3
282	1593	4
283	1593	6
284	1593	8
285	1593	10
286	1703	9
287	1704	5
288	1704	6
289	1704	7
290	1704	8
291	1704	10
292	1705	5
293	1705	7
294	1725	1
295	1725	2
296	1725	3
297	1725	4
298	1792	2
299	1792	3
300	1792	4
301	1792	7
302	1792	8
303	1792	10
304	1984	2
305	1984	3
306	1984	4
307	1984	6
308	1984	7
309	1984	8
310	1984	10
311	1986	2
312	1986	3
313	1986	4
314	1986	6
315	1986	7
316	1986	8
317	1986	10
318	1987	10
319	1988	10
320	1996	2
321	1996	3
322	1996	4
323	1996	6
324	1996	7
325	1996	8
326	1996	10
327	2049	2
328	2049	3
329	2049	4
330	2049	5
331	2049	6
332	2049	7
333	2049	8
334	2049	10
335	2068	8
336	2068	10
337	2086	2
338	2086	3
339	2086	4
340	2086	10
341	2087	2
342	2087	3
343	2087	4
344	2087	7
345	2087	8
346	2087	10
347	1247	1
348	1247	2
349	1247	3
350	1247	4
351	1247	5
352	1247	6
353	1247	7
354	1247	8
355	1247	9
356	1247	10
498	2588	7
499	2588	8
501	2591	3
500	2589	8
410	1	1
411	1	2
412	1	4
413	1	5
414	1	6
\.


--
-- Name: explanation_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doknosis
--

SELECT pg_catalog.setval('explanation_location_id_seq', 501, true);


--
-- Data for Name: explanation_observation; Type: TABLE DATA; Schema: public; Owner: doknosis
--

COPY explanation_observation (id, explanation_id, observation_id, weight) FROM stdin;
17	2	17	0.5
18	2	1	0.5
19	2	2	0.5
20	2	3	0.5
21	2	4	0.5
22	2	5	0.5
23	2	16	0.5
24	2	6	0.5
25	2	7	0.5
26	2	8	0.5
27	2	9	0.5
28	2	10	0.25
29	2	11	0.5
30	2	12	0.5
31	2	18	0.5
32	2	19	0.5
33	2	20	0.75
34	2	15	0.5
35	2	14	0.899999976
36	2	21	0.5
37	2	22	0.5
38	2	23	0.5
39	2	24	0.5
40	2	25	0.5
41	2	26	0.5
42	2	27	0.5
43	2	28	0.5
44	2	29	0.5
45	2	30	0.5
46	2	24	0.5
47	2	13	0.5
48	3	31	0.5
49	3	1	0.5
50	3	9	0.5
51	3	32	0.5
52	3	10	1
53	3	33	0.5
54	3	34	0.5
55	3	35	0.5
56	3	36	0.5
57	4	37	0.75
58	4	12	0.75
59	4	38	0.5
60	4	39	0.5
61	4	40	0.5
62	4	41	0.5
63	4	42	0.5
64	4	43	0.5
65	4	44	0.5
66	4	45	0.5
67	4	8	0.5
68	4	46	0.5
69	5	47	0.300000012
70	5	48	0.600000024
71	5	49	0.100000001
72	5	50	1
73	5	51	0.800000012
74	6	52	0.800000012
75	6	37	0.75
76	6	53	0.75
77	6	54	0.5
78	6	55	0.75
79	6	9	0.5
80	7	10	1
81	7	56	0.75
82	7	57	0.75
83	7	58	1
84	7	59	0.5
85	7	60	0.5
86	7	9	0.75
87	7	16	0
88	8	10	1
89	8	61	0.75
90	8	37	0.5
91	8	62	0.75
92	8	36	0.5
93	8	63	0.75
94	8	64	0.5
95	8	65	0.25
96	8	66	0.25
97	8	67	0.25
98	8	9	1
99	8	68	0
100	9	69	0.699999988
101	10	70	0.75
102	10	71	0.75
103	10	72	0.75
104	11	73	0.899999976
105	11	14	0.899999976
106	11	74	0.699999988
113	13	37	0.75
114	13	79	0.75
115	13	80	0.75
116	13	81	0.5
117	13	82	0.5
118	13	83	0.5
119	13	84	0.5
120	13	85	0.75
121	14	79	0.99000001
122	14	37	0.899999976
123	14	81	0.899999976
124	14	86	0.699999988
125	14	87	0.600000024
126	15	37	0.899999976
127	15	81	0.899999976
128	16	88	0.899999976
129	16	89	0.899999976
130	16	90	0.699999988
131	16	37	0.949999988
132	16	91	0.449999988
133	16	92	0.200000003
134	17	93	0.75
135	17	37	0.75
136	17	38	0.75
137	17	53	0.75
138	17	94	0.75
139	17	95	0.5
140	17	96	0.5
141	17	97	0.5
142	17	98	0.5
143	17	99	0.75
144	18	100	0.5
145	18	101	0.75
146	18	102	0.75
147	18	37	0.75
148	18	72	0.5
149	19	103	0.100000001
150	19	37	0.75
151	19	104	0.75
152	19	105	0.25
153	19	106	0.100000001
154	19	107	0.5
155	19	108	0.25
156	19	109	0.25
157	19	110	0.25
158	19	111	0.25
159	19	112	0.25
160	19	16	0.5
161	19	10	0.5
162	19	9	0.5
163	20	113	1
164	20	114	0.899999976
165	20	115	0.899999976
166	20	116	0.699999988
167	20	37	0.899999976
168	21	117	0.400000006
169	21	118	0.400000006
170	22	10	1
171	22	16	0
172	22	119	0.75
173	22	120	0.75
174	22	57	0.75
175	22	37	0.25
176	22	64	0.5
177	22	72	0.5
178	22	121	0.5
179	22	122	0.25
180	23	123	0.200000003
181	23	124	0.800000012
182	23	125	0.899999976
183	23	126	0.699999988
184	23	16	0.800000012
185	23	10	0.200000003
186	24	16	0.5
187	24	10	0.5
188	24	9	0.5
189	24	68	0.5
190	24	127	0.5
191	24	128	0.5
192	24	129	1
193	24	130	0.75
194	24	131	0.75
195	24	132	0.75
196	25	133	0.5
197	25	134	0.5
198	25	135	0.5
199	26	1	0.5
200	26	136	0.5
201	26	16	0.5
202	26	10	0.5
203	26	137	0.75
204	26	138	0.75
205	26	139	0.5
206	27	140	0.75
207	27	141	0.75
208	27	142	0.75
209	27	143	0.75
210	27	144	0.75
211	27	9	0
212	27	145	0.25
213	28	146	0.25
214	28	147	0.75
215	28	148	0.5
216	28	149	0.5
217	28	150	0.5
218	28	151	0.5
219	28	152	0.5
220	28	43	0.5
221	28	153	0.5
222	28	154	0.75
223	28	155	1
224	28	156	1
225	28	157	0.75
226	28	158	0.75
227	28	159	0.25
228	29	160	1
229	29	161	0.5
230	29	162	0.25
231	29	8	0.25
232	29	163	0.75
233	29	12	0.75
234	30	164	0.75
235	30	165	0.75
236	30	166	0.75
237	30	167	0.75
238	30	16	0.5
239	30	10	0.5
240	30	168	0.5
241	31	169	0.100000001
242	31	170	0.100000001
243	31	171	0.75
244	31	64	0.5
245	31	172	0.5
246	31	173	0.5
247	31	68	0.5
248	32	174	1
249	33	175	1
250	33	176	0.75
251	33	71	0.75
252	33	177	0.5
253	33	178	0.5
254	33	179	0.5
255	33	180	0.100000001
256	33	181	1
257	34	182	1
258	34	183	1
259	35	184	1
260	35	185	0.899999976
261	35	9	0.75
262	35	186	0.899999976
263	35	16	0.600000024
264	35	187	0.75
265	35	188	0.899999976
266	35	181	0.75
267	36	189	0.75
268	36	190	0.75
269	37	191	0.5
270	38	192	0.5
271	38	193	0.5
272	38	194	0.5
273	38	195	0.25
274	38	196	0.5
275	38	197	0.5
276	38	198	1
277	38	199	0.25
278	38	200	0.25
279	38	68	0.5
280	38	9	0.5
281	38	201	0.75
282	38	202	0.5
283	39	203	1
284	39	204	1
285	39	205	1
286	39	206	0.5
287	39	207	0.5
288	39	208	0.25
289	39	209	0.25
290	39	210	0.75
291	40	211	0.75
292	40	212	0.75
293	40	213	0.5
294	40	214	0.5
295	40	215	0.25
296	40	216	0.25
297	40	217	0.25
298	40	16	0.5
299	40	10	0.5
300	41	218	1
301	41	219	1
302	41	220	1
303	41	181	0.5
304	42	68	0.100000001
305	42	9	0.75
306	42	221	0.75
307	42	222	0.5
308	42	223	0.5
309	42	224	0.5
310	42	16	0.5
311	42	10	0.5
312	43	16	0.75
313	43	225	0.75
314	43	226	0.5
315	43	227	1
316	43	228	1
317	44	229	0.25
318	44	72	0.5
319	44	122	0.5
320	44	230	0.5
321	44	231	0.100000001
322	44	232	0.75
323	44	233	0.5
324	44	234	0.25
325	45	235	0
326	45	14	0.75
327	45	236	0.5
328	45	82	0.75
329	45	237	0.5
330	45	238	0.5
331	45	10	0.5
332	45	239	0.75
333	45	240	0.75
334	45	241	0.75
335	45	242	0.75
336	45	243	0.5
337	45	37	0.75
338	45	244	0.5
339	45	9	0.5
340	45	245	0.5
341	45	68	0.5
342	45	6	0.5
343	45	246	0.75
344	45	247	0.5
345	45	16	0.5
346	46	235	0
347	46	248	0.100000001
348	46	236	0.5
349	46	249	0.100000001
350	46	250	0.75
351	46	237	0.5
352	46	10	0.5
353	46	251	0.75
354	46	252	0.75
355	46	253	0.75
356	46	254	0.75
357	46	255	0.100000001
358	46	256	0.75
359	46	257	0.100000001
360	46	6	0.5
361	46	68	0.5
362	46	258	0.100000001
363	46	259	0.75
364	46	260	0.75
365	46	16	0.5
366	46	261	0.75
367	46	9	0.5
368	47	262	0.75
369	47	235	0
370	47	263	0.75
371	47	14	0.75
372	47	236	0.5
373	47	82	0.75
374	47	264	1
375	47	237	0.5
376	47	6	0.5
377	47	10	0.5
378	47	68	0.5
379	47	265	0.75
380	47	16	0.5
381	47	266	0.75
382	47	267	0.75
383	47	9	0.5
384	48	268	1
385	48	235	0
386	48	269	0.100000001
387	48	253	0.5
388	48	236	0.5
389	48	270	0.100000001
390	48	271	0.100000001
391	48	6	0.5
392	48	255	0.100000001
393	48	272	0.75
394	48	237	0.5
395	48	9	0.5
396	48	10	0.5
397	48	68	0.5
398	48	252	0.100000001
399	48	16	0.5
400	48	258	0.100000001
401	49	235	0
402	49	37	0.75
403	49	273	0.75
404	49	274	0.100000001
405	49	236	0.5
406	49	82	0.75
407	49	275	0.5
408	49	276	0.75
409	49	277	0.75
410	49	237	0.5
411	49	6	0.5
412	49	10	0.5
413	49	68	0.5
414	49	278	0.75
415	49	279	0.75
416	49	280	0.5
417	49	281	0.75
418	49	16	0.5
419	49	9	0.5
420	50	14	1
421	50	282	0.75
422	51	283	0.5
423	51	74	1
424	51	284	0.75
425	51	14	0.75
426	51	285	0.75
427	51	82	0.5
428	51	37	0.25
429	51	16	0.5
430	51	10	0.5
431	51	68	0.5
432	51	9	0.5
433	52	286	0.75
434	52	287	0.5
435	52	288	0.25
436	52	289	0.75
437	52	16	0.5
438	52	10	0.5
439	53	37	0.75
440	53	290	0.5
441	53	291	0.5
442	53	292	0.5
443	53	33	0.5
444	53	36	0.5
445	53	293	0.25
446	53	294	0.75
447	53	16	0.5
448	53	10	0.5
449	54	295	0.5
450	54	68	0.5
451	54	37	0.5
452	54	9	0.5
453	54	14	0.75
454	54	43	0.5
455	54	296	0.5
456	54	16	0.5
457	54	6	0.5
458	54	36	0.5
459	54	297	0.5
460	54	298	0.5
461	54	35	0.5
462	54	10	0.5
463	54	299	0.5
464	54	300	0.5
465	54	301	0.5
466	54	302	0.5
467	54	33	0.5
468	55	303	0.5
469	55	235	0.5
470	55	79	0.5
471	55	304	0.5
472	55	40	0.5
473	55	305	0.5
474	55	68	0.5
475	56	306	0.5
476	56	40	0.5
477	56	9	0.5
478	56	6	0.5
479	56	307	0.5
480	56	40	0.5
481	56	68	0.5
482	56	280	0.5
483	56	235	0.75
484	57	79	0.75
485	57	80	0.5
486	57	37	0.100000001
487	57	304	0.25
488	57	308	0.5
489	57	309	0.25
490	58	310	0.25
491	58	311	0.25
492	58	312	0.25
493	58	313	0.25
494	58	37	0.25
495	58	107	0.5
496	58	314	0.25
497	58	40	0.25
498	58	291	0.25
499	58	315	0.25
500	58	277	0.25
501	58	9	0.5
502	58	68	0.5
503	59	310	0.25
504	59	311	0.25
505	59	37	0.25
506	59	53	0.5
507	59	107	0.5
508	60	37	0.75
509	60	12	0.75
510	60	316	0.75
511	60	317	0.5
512	60	318	0.75
513	60	250	0.5
514	60	319	0.5
515	60	16	0.5
516	60	10	0.5
517	61	320	0.75
518	61	321	0.899999976
519	61	322	0.75
520	61	323	0.100000001
521	61	324	0.100000001
522	61	325	0.100000001
523	61	16	0.5
524	61	10	0.5
525	62	10	0.5
526	62	16	0.25
527	62	94	0.75
528	62	326	0.75
529	62	327	0.75
530	62	328	0.5
531	62	329	0.5
532	62	330	0.100000001
533	63	331	0.5
534	63	332	0.5
535	63	333	1
536	63	334	1
537	63	335	0.75
538	63	336	1
539	63	337	1
540	63	338	0.0500000007
541	63	339	0.850000024
542	63	340	0.5
543	63	341	0.5
544	63	75	0.5
545	63	71	0.5
546	64	37	0.75
547	64	292	0.75
548	64	36	0.5
549	64	290	0.5
550	64	342	0.75
551	65	6	0.5
552	65	68	0.5
553	65	343	0.200000003
554	65	344	0.400000006
555	65	345	0.200000003
556	65	346	0.200000003
557	65	347	0.300000012
558	66	348	0.75
559	66	349	0.75
560	66	350	0.75
561	66	10	0.5
562	66	16	0.5
563	66	351	0.5
564	66	324	0.5
565	66	352	0.5
566	66	353	0.75
567	66	37	0.25
568	66	53	0.25
569	66	292	0.25
570	67	354	0.75
571	67	355	0.5
572	67	356	0.5
573	67	37	0.5
574	67	357	0.5
575	67	358	0.5
576	67	359	0.5
577	67	360	0.75
578	67	12	0.75
579	67	68	0.75
580	67	16	0.5
581	67	10	0.5
582	67	9	0.25
583	68	291	0.75
584	68	53	0.75
585	68	82	0.75
586	68	361	0.5
587	68	37	0.5
588	68	362	0.5
589	68	40	0.5
590	68	363	0.25
591	68	364	0.100000001
592	68	68	0.100000001
593	68	9	0.75
594	68	10	0.5
595	68	16	0.5
596	69	365	0.75
597	69	366	0.75
598	69	367	0.5
599	69	368	0.5
600	69	369	0.5
601	69	370	0.5
602	69	371	0.5
603	69	372	0.5
604	69	16	0.5
605	69	10	0.5
606	70	365	0.5
607	70	366	0.75
608	70	373	0.5
609	70	367	0.5
610	70	374	0.5
611	70	375	0.5
612	70	16	0.5
613	70	10	0.5
614	71	33	0.75
615	71	376	0.75
616	71	377	0.75
617	71	378	0.75
618	71	379	0.5
619	71	380	0.75
620	71	107	0.5
621	71	53	0.5
622	71	16	0.5
623	71	10	0.5
624	71	12	0.5
625	71	381	0.100000001
626	72	382	0.75
627	72	73	0.75
628	72	53	0.5
629	72	383	0.5
630	72	384	0.5
631	72	37	0.5
632	72	385	0.25
633	72	72	0.75
634	72	10	0.5
635	72	16	0.5
636	73	68	0.75
637	73	9	0.25
638	73	386	0.75
639	73	37	0.75
640	73	53	0.75
641	73	387	0.5
642	73	388	0.5
643	73	16	0.5
644	73	10	0.5
645	74	14	0.5
646	74	6	0.5
647	74	389	0.5
648	74	390	0.5
649	74	391	0.5
650	75	37	0.5
651	75	6	0.5
652	75	9	0.5
653	75	10	0.5
654	75	68	0.5
655	75	88	0.5
656	75	392	0.5
657	75	393	0.5
658	75	394	0.5
659	75	16	0.5
660	76	291	0.75
661	76	395	0.75
662	76	396	0.5
663	76	361	0.5
664	76	397	0.5
665	76	398	0.5
666	76	37	0.5
667	76	399	0.5
668	76	400	0.100000001
669	76	401	0.100000001
670	76	9	0.5
671	76	68	0.25
672	77	37	0.5
673	77	402	0.5
674	77	403	0.25
675	77	404	0.5
676	77	405	0.5
677	77	406	0.25
678	77	10	0.5
679	77	16	0.5
680	77	9	0.5
681	77	68	0.5
682	78	68	0.75
683	78	9	0.25
684	78	10	0.5
685	78	16	0.5
686	78	70	0.75
687	78	407	0.75
688	78	408	0.75
689	78	409	0.5
690	79	410	0.75
691	79	411	0.75
692	79	412	0.75
693	79	413	0.5
694	79	414	0.5
695	79	37	0.5
696	79	291	0.5
697	79	79	0.75
698	79	292	0.5
699	79	415	0.5
700	80	291	0.75
701	80	395	0.75
702	80	396	0.5
703	80	361	0.5
704	80	397	0.5
705	80	398	0.5
706	80	37	0.5
707	80	399	0.5
708	80	400	0.100000001
709	80	401	0.100000001
710	80	9	0.5
711	80	68	0.25
712	81	6	0.5
713	81	416	0.5
714	81	10	0.5
715	81	74	0.5
716	81	417	0.5
717	81	35	0.5
718	81	292	0.5
719	81	37	0.5
720	81	38	0.5
721	81	418	0.5
722	81	53	0.5
723	81	9	0.5
724	81	68	0.5
725	81	33	0.5
726	81	8	0.5
727	81	419	0.5
728	81	46	0.5
729	81	107	0.5
730	81	420	0.5
731	81	421	0.5
732	81	16	0.5
733	81	422	0.25
734	81	423	0.5
735	81	424	0.5
736	81	46	0.5
737	81	12	0.5
738	81	425	0.5
739	81	426	0.75
740	82	291	0.75
741	82	395	0.75
742	82	396	0.5
743	82	361	0.5
744	82	397	0.5
745	82	398	0.5
746	82	37	0.5
747	82	399	0.5
748	82	400	0.100000001
749	82	401	0.100000001
750	82	9	0.5
751	82	68	0.25
752	83	291	0.75
753	83	395	0.75
754	83	396	0.5
755	83	361	0.5
756	83	397	0.5
757	83	398	0.5
758	83	37	0.5
759	83	399	0.5
760	83	400	0.100000001
761	83	401	0.100000001
762	83	9	0.5
763	83	68	0.25
764	84	40	0.5
765	84	427	0.5
766	84	37	0.5
767	84	10	0.5
768	84	9	0.5
769	84	428	0.5
770	84	429	0.5
771	84	430	0.5
772	84	82	0.5
773	84	361	0.5
774	84	105	0.5
775	84	431	0.5
776	84	291	0.5
777	84	416	0.5
778	84	401	0.5
779	84	432	0.5
780	84	427	0.5
781	84	16	0.5
782	84	6	0.5
783	84	83	0.5
784	85	291	0.75
785	85	395	0.75
786	85	396	0.5
787	85	361	0.5
788	85	397	0.5
789	85	398	0.5
790	85	37	0.5
791	85	399	0.5
792	85	400	0.100000001
793	85	401	0.100000001
794	85	9	0.5
795	85	68	0.25
796	86	291	0.75
797	86	395	0.75
798	86	396	0.5
799	86	361	0.5
800	86	397	0.5
801	86	398	0.5
802	86	37	0.5
803	86	399	0.5
804	86	400	0.100000001
805	86	401	0.100000001
806	86	9	0.5
807	86	68	0.25
808	86	433	0.25
809	87	277	0.75
810	87	434	0.75
811	87	435	0.75
812	87	436	0.75
813	87	437	0.75
814	87	438	0.75
815	87	439	0.75
816	87	440	0.75
817	87	40	0.75
818	87	40	0.75
819	87	122	0.75
820	87	441	0.75
821	87	442	0.75
822	87	443	0.75
823	87	444	0.75
824	87	33	0.75
825	87	36	0.75
826	87	445	0.75
827	87	446	0.25
828	87	447	0.25
829	87	13	0.5
830	87	448	0.5
831	87	449	0.5
832	87	24	0.5
833	87	450	0.5
834	87	451	0.5
835	87	452	0.5
836	87	453	0.5
837	87	454	0.5
838	87	455	0.5
839	87	456	0.5
840	87	457	0.5
841	87	458	0.5
842	87	459	0.5
843	87	460	1
844	87	21	0.5
845	87	461	0.5
846	87	461	0.25
847	87	462	0.5
848	88	37	0.5
849	88	122	0.5
850	88	6	0.5
851	88	277	0.5
852	88	445	0.5
853	88	9	0.5
854	88	10	0.5
855	88	463	0.5
856	88	40	0.5
857	88	464	0.5
858	88	35	0.5
859	88	235	0.5
860	88	16	0.5
861	89	70	0.75
862	89	465	0.75
863	89	37	0.5
864	89	466	0.5
865	89	467	0.75
866	89	468	0.25
867	89	68	0.5
868	89	9	0.25
869	89	10	0.5
870	89	16	0.5
871	90	107	0.5
872	90	235	0.5
873	90	37	0.25
874	90	292	0.5
875	90	16	0.5
876	90	427	0.5
877	90	6	0.5
878	90	9	0.5
879	90	469	0.5
880	90	291	0.5
881	90	35	0.5
882	90	10	0.5
883	90	68	0.5
884	90	410	0.5
885	90	79	0.5
886	90	88	0.5
887	90	427	0.5
888	91	434	0.5
889	91	9	0.5
890	91	10	0.5
891	91	68	0.5
892	91	42	0.5
893	91	329	0.5
894	91	470	0.5
895	91	471	0.5
896	91	472	0.5
897	91	473	0.5
898	91	474	0.5
899	91	16	0.5
900	91	6	0.5
901	91	475	0.5
902	92	33	0.5
903	92	427	0.5
904	92	37	0.5
905	92	476	0.5
906	92	14	0.5
907	92	477	0.5
908	92	46	0.5
909	92	74	0.5
910	92	478	0.5
911	92	6	0.5
912	92	36	0.5
913	92	16	0.5
914	92	9	0.5
915	92	10	0.5
916	92	12	0.5
917	92	479	0.5
918	92	427	0.5
919	93	480	1
920	93	83	0.75
921	93	398	0.75
922	93	291	0.75
923	93	105	0
924	93	395	0.75
925	93	292	0.5
926	93	481	0.5
927	93	16	0.5
928	93	10	0.5
929	94	261	0.75
930	94	482	0.75
931	94	410	0.5
932	94	79	0.5
933	94	37	0.5
934	94	53	0.5
935	94	483	0.5
936	94	484	0.5
937	94	485	0.25
938	94	486	0.25
939	94	16	0.5
940	94	10	0.5
941	95	37	0.5
942	95	487	0.5
943	95	488	0.5
944	95	6	0.5
945	95	277	0.5
946	95	291	0.5
947	95	9	0.5
948	95	10	0.5
949	95	79	0.5
950	95	489	0.5
951	95	109	0.5
952	95	16	0.5
953	96	490	0.75
954	96	491	0.75
955	96	492	0.5
956	96	415	0.5
957	96	493	0.5
958	96	494	0.25
959	96	16	0.5
960	96	10	0.5
961	97	20	0.5
962	97	495	0.5
963	97	6	0.5
964	97	9	0.5
965	97	10	0.5
966	97	16	0.5
967	98	394	0.5
968	98	9	0.5
969	98	10	0.5
970	98	16	0.5
971	98	88	0.5
972	98	496	0.5
973	98	6	0.5
974	98	497	0.5
975	98	37	0.5
976	98	292	0.5
977	98	53	0.5
978	98	498	0.25
979	98	410	0.5
980	98	79	0.5
981	98	404	0.5
982	99	235	0.5
983	99	37	0.5
984	99	499	0.5
985	99	500	0.5
986	99	291	0.5
987	99	9	0.25
988	99	10	0.5
989	99	68	0.5
990	99	36	0.5
991	99	16	0.5
992	99	292	0.5
993	99	15	0.5
994	100	395	0.75
995	100	291	0.75
996	100	430	0.5
997	100	396	0.5
998	100	361	0.5
999	100	418	0.75
1000	100	501	0.5
1001	100	16	0.5
1002	100	10	0.5
1003	101	502	0.5
1004	101	37	0.5
1005	101	503	0.5
1006	101	6	0.5
1007	101	9	0.5
1008	101	10	0
1009	101	94	0.5
1010	101	16	0.5
1011	101	98	0.5
1012	101	504	1
1013	102	505	0.75
1014	102	506	0.5
1015	102	37	0.5
1016	102	38	0.25
1017	102	507	0.25
1018	102	508	0.25
1019	102	301	0.5
1020	102	75	0.100000001
1021	102	509	0.75
1022	102	10	1
1023	102	16	0
1024	103	510	0.5
1025	103	511	0.75
1026	103	512	0.75
1027	103	68	0.5
1028	103	9	0.25
1029	103	10	0.5
1030	103	16	0.5
1031	104	410	0.75
1032	104	412	0.5
1033	104	413	0.5
1034	104	513	0.5
1035	104	37	0.75
1036	104	79	0.5
1037	104	291	0.5
1038	104	369	0.5
1039	104	292	0.5
1040	104	415	0.5
1041	104	514	0.5
1042	104	16	0.5
1043	104	10	0.5
1044	105	410	0.75
1045	105	412	0.5
1046	105	413	0.5
1047	105	513	0.5
1048	105	37	0.75
1049	105	79	0.5
1050	105	291	0.5
1051	105	369	0.5
1052	105	292	0.5
1053	105	415	0.5
1054	105	514	0.5
1055	105	16	0.5
1056	105	10	0.5
1057	106	515	0.75
1058	106	516	0.5
1059	106	517	0.5
1060	106	518	0.5
1061	106	519	0.5
1062	106	520	0.5
1063	106	521	0.5
1064	107	37	0.5
1065	107	522	0.5
1066	107	292	0.5
1067	107	70	0.75
1068	107	523	0.5
1069	107	511	0.5
1070	107	524	0
1071	107	68	0.75
1072	107	9	0.25
1073	107	10	0.5
1074	107	16	0.5
1075	108	89	0.75
1076	108	525	0.5
1077	108	526	0.5
1078	109	392	0.5
1079	109	70	0.5
1080	109	37	0.5
1081	109	38	0.5
1082	109	292	0.5
1083	109	88	0.75
1084	109	527	0.5
1085	110	528	0.5
1086	110	393	0.5
1087	110	529	0.5
1088	110	359	0.5
1089	110	88	0.5
1090	110	530	0.5
1091	110	16	0.5
1092	110	10	0.5
1093	111	42	0.5
1094	111	329	0.100000001
1095	111	33	0.5
1096	111	36	0.5
1097	111	53	0.5
1098	111	425	0.150000006
1099	111	37	0.270000011
1100	111	531	0.230000004
1101	111	532	0.100000001
1102	111	419	0.5
1103	111	533	0.25
1104	111	534	0.75
1105	111	16	0.5
1106	111	10	0.5
1107	112	535	0.75
1108	112	410	0.75
1109	112	88	0.5
1110	112	79	0.5
1111	112	53	0.5
1112	112	37	0.25
1113	112	536	0.25
1114	112	16	0.5
1115	112	10	0.5
1116	113	537	0.5
1117	113	538	0.5
1118	113	539	0.5
1119	113	540	0.5
1120	113	541	0.5
1121	113	10	1
1122	113	16	0
1123	114	541	0.75
1124	114	538	0.75
1125	114	542	0.75
1126	114	57	0.5
1127	114	330	0.5
1128	114	10	1
1129	114	16	0
1130	115	543	0.5
1131	115	544	0.5
1132	115	545	0.5
1133	115	8	0.5
1134	115	21	0.25
1135	115	546	0.25
1136	115	547	0.25
1137	115	499	0.25
1138	115	548	0.5
1139	115	549	0.5
1140	115	550	0.5
1141	115	551	0.5
1142	115	37	0.25
1143	115	16	0.5
1144	115	10	0.5
1145	116	552	0.899999976
1146	116	553	0.75
1147	116	554	0.75
1148	116	555	0.75
1149	116	556	0.75
1150	116	557	0.5
1151	116	558	0.5
1152	116	400	0.25
1153	116	559	0.25
1154	116	148	0.25
1155	116	10	0.5
1156	116	16	0.5
1157	117	235	0.5
1158	117	10	0.25
1159	117	560	0.75
1160	117	236	0.5
1161	117	6	0.5
1162	117	237	0.5
1163	117	9	0.5
1164	117	561	0.75
1165	117	68	0.5
1166	117	562	0.5
1167	117	16	0.5
1168	117	536	0.75
1169	118	235	0.5
1170	118	236	0.5
1171	118	507	0.75
1172	118	6	0.5
1173	118	237	0.5
1174	118	9	0.5
1175	118	10	0.5
1176	118	68	0.75
1177	118	329	1
1178	118	16	0.75
1179	119	235	0.5
1180	119	37	0.75
1181	119	236	0.5
1182	119	6	0
1183	119	563	0.100000001
1184	119	237	0.5
1185	119	9	0
1186	119	10	0.5
1187	119	68	0
1188	119	564	0.5
1189	119	565	0.5
1190	119	377	0.75
1191	119	16	0.5
1192	119	566	0.5
1193	120	235	0.75
1194	120	37	0.75
1195	120	567	0.75
1196	120	568	0.100000001
1197	120	236	0.5
1198	120	569	0.5
1199	120	88	0.75
1200	120	6	0.25
1201	120	237	0.5
1202	120	9	0.25
1203	120	570	0.75
1204	120	560	0.75
1205	120	68	0.75
1206	120	79	0.75
1207	120	365	0.75
1208	120	16	0.5
1209	120	258	0.75
1210	120	469	0.75
1211	120	536	0.75
1212	120	307	0.75
1213	121	571	0.75
1214	121	572	0.75
1215	121	573	0.5
1216	121	574	0.75
1217	121	16	0.5
1218	121	10	0.600000024
1219	121	9	0.75
1220	121	193	0.75
1221	121	575	0.5
1222	122	576	0.75
1223	122	577	0.75
1224	122	578	0.75
1225	123	579	1
1226	123	580	1
1227	123	581	1
1228	123	582	1
1229	123	583	1
1230	123	16	0.5
1231	123	10	0.5
1232	124	584	0.75
1233	124	585	0.75
1234	124	586	0.75
1235	124	587	0.75
1236	124	83	0.100000001
1237	124	16	0.5
1238	124	10	0.5
1239	125	588	0.800000012
1240	125	589	0.600000024
1241	125	590	0.899999976
1242	125	585	0.699999988
1243	125	33	0.800000012
1244	126	40	0.75
1245	126	421	0.75
1246	126	591	0.75
1247	126	163	0.75
1248	126	12	0.75
1249	126	441	0.75
1250	126	592	0.75
1251	126	10	0.5
1252	126	16	0.5
1253	127	593	0.5
1254	127	37	0.5
1255	127	257	0.5
1256	127	6	0.5
1257	127	81	0.5
1258	127	291	0.5
1259	127	82	0.5
1260	127	427	0.5
1261	127	594	0.5
1262	127	40	0.5
1263	127	71	0.5
1264	127	9	0.5
1265	128	595	0.75
1266	128	596	0.75
1267	128	419	1
1268	128	597	1
1269	128	107	1
1270	128	598	0.25
1271	128	599	0.75
1272	128	498	0.5
1273	128	105	0.25
1274	128	600	0.300000012
1275	128	601	0.300000012
1276	128	602	0.300000012
1277	128	603	0.100000001
1278	128	604	0.100000001
1279	128	9	0.75
1280	128	16	0.5
1281	128	10	0.5
1282	129	235	0.5
1283	129	236	0.5
1284	129	605	0.100000001
1285	129	6	0.5
1286	129	237	0.5
1287	129	10	0.5
1288	129	606	0.75
1289	129	607	0.649999976
1290	129	608	0.649999976
1291	129	609	0.649999976
1292	129	563	0.100000001
1293	129	610	0.649999976
1294	129	611	0.75
1295	129	9	0.5
1296	129	68	0.5
1297	129	478	0.100000001
1298	129	612	0.75
1299	129	613	0.100000001
1300	129	16	0.5
1301	129	614	0.75
1302	129	615	0.75
1303	129	616	0.75
1304	130	617	0.75
1305	130	235	0.5
1306	130	37	0.75
1307	130	618	0.649999976
1308	130	284	0.75
1309	130	14	0.75
1310	130	236	0.5
1311	130	6	0.5
1312	130	36	0.75
1313	130	612	0.75
1314	130	611	0.75
1315	130	9	0.5
1316	130	10	0.5
1317	130	68	0.5
1318	130	237	0.5
1319	130	377	0.75
1320	130	16	0.5
1321	130	614	0.75
1322	130	125	0.75
1323	131	617	0.75
1324	131	235	0.5
1325	131	10	0.5
1326	131	618	0.649999976
1327	131	14	0.75
1328	131	236	0.5
1329	131	609	0.649999976
1330	131	6	0.5
1331	131	237	0.5
1332	131	290	0.75
1333	131	284	0.75
1334	131	606	0.75
1335	131	607	0.649999976
1336	131	610	0.649999976
1337	131	37	0.75
1338	131	619	0.100000001
1339	131	36	0.75
1340	131	608	0.649999976
1341	131	611	0.75
1342	131	9	0.5
1343	131	68	0.5
1344	131	563	0.100000001
1345	131	620	0.649999976
1346	131	615	0.649999976
1347	131	612	0.75
1348	131	377	0.75
1349	131	16	0.5
1350	131	614	0.75
1351	131	125	0.75
1352	132	235	0.5
1353	132	16	0.5
1354	132	606	0.75
1355	132	607	0.649999976
1356	132	620	0.649999976
1357	132	6	0.5
1358	132	478	0.100000001
1359	132	615	0.649999976
1360	132	608	0.649999976
1361	132	612	0.75
1362	132	611	0.75
1363	132	9	0.5
1364	132	10	0.5
1365	132	68	0.5
1366	132	610	0.649999976
1367	132	563	0.100000001
1368	132	609	0.649999976
1369	132	614	0.75
1370	132	125	0.5
1371	133	617	0.75
1372	133	235	0.5
1373	133	618	0.649999976
1374	133	14	0.75
1375	133	236	0.5
1376	133	605	0.100000001
1377	133	6	0.5
1378	133	237	0.5
1379	133	10	0.5
1380	133	284	0.75
1381	133	606	0.75
1382	133	607	0.649999976
1383	133	610	0.649999976
1384	133	609	0.649999976
1385	133	37	0.75
1386	133	36	0.75
1387	133	608	0.649999976
1388	133	616	0.649999976
1389	133	611	0.75
1390	133	9	0.5
1391	133	68	0.5
1392	133	563	0.100000001
1393	133	478	0.100000001
1394	133	615	0.649999976
1395	133	612	0.75
1396	133	613	0.100000001
1397	133	16	0.5
1398	133	614	0.75
1399	133	125	0.5
1400	134	235	0.5
1401	134	621	0.100000001
1402	134	605	0.100000001
1403	134	6	0.5
1404	134	622	0.75
1405	134	237	0.5
1406	134	10	0.5
1407	134	623	0.75
1408	134	611	0.75
1409	134	624	0.100000001
1410	134	625	0.75
1411	134	37	0.75
1412	134	619	0.100000001
1413	134	236	0.5
1414	134	626	0.75
1415	134	563	0.75
1416	134	59	0.75
1417	134	627	0.100000001
1418	134	9	0.5
1419	134	68	0.5
1420	134	628	0.100000001
1421	134	478	0.100000001
1422	134	612	0.75
1423	134	613	0.100000001
1424	134	270	0.100000001
1425	134	16	0.5
1426	134	614	0.75
1427	134	125	0.5
1428	135	235	0.5
1429	135	499	0.75
1430	135	629	0.75
1431	135	630	0.75
1432	135	236	0.5
1433	135	6	0.5
1434	135	631	0.75
1435	135	237	0.5
1436	135	10	0.5
1437	135	427	0.75
1438	135	431	0.5
1439	135	632	0.75
1440	135	60	0.100000001
1441	135	633	0.75
1442	135	634	0.75
1443	135	635	0.75
1444	135	636	0.649999976
1445	135	292	0.75
1446	135	37	1
1447	135	567	0.75
1448	135	597	0.5
1449	135	637	0.100000001
1450	135	9	0.5
1451	135	68	0.5
1452	135	16	0.5
1453	135	638	0.75
1454	135	639	0.100000001
1455	135	107	0.75
1456	135	38	0.75
1457	136	235	0.5
1458	136	640	0.5
1459	136	236	0.5
1460	136	401	0.5
1461	136	594	0.5
1462	136	10	0.5
1463	136	641	0.5
1464	136	642	0.5
1465	136	643	0.5
1466	136	292	0.5
1467	136	37	0.5
1468	136	547	0.5
1469	136	257	0.5
1470	136	644	0.5
1471	136	291	0.5
1472	136	9	0.5
1473	136	68	0.5
1474	136	6	0.5
1475	136	83	0.5
1476	136	419	0.5
1477	136	16	0.5
1478	137	235	0.5
1479	137	645	0.75
1480	137	236	0.5
1481	137	646	0.949999988
1482	137	647	0.949999988
1483	137	10	0.5
1484	137	648	0.949999988
1485	137	649	0.949999988
1486	137	1	0.5
1487	137	650	0.949999988
1488	137	651	0.75
1489	137	652	0.949999988
1490	137	653	0.75
1491	137	654	0.949999988
1492	137	655	0.949999988
1493	137	656	0.949999988
1494	137	657	0.949999988
1495	137	9	0.5
1496	137	68	0.5
1497	137	658	0.949999988
1498	137	659	1
1499	137	660	0.949999988
1500	137	661	0.75
1501	137	662	0.75
1502	137	663	0.949999988
1503	137	664	0.949999988
1504	137	665	0.949999988
1505	137	16	0.5
1506	137	566	0.75
1507	137	6	0.5
1508	137	666	0.949999988
1509	137	37	0.75
1510	137	237	0.5
1511	137	667	0.75
1512	137	431	1
1513	137	668	0.949999988
1514	137	74	0.75
1515	137	669	0.949999988
1516	137	670	0.949999988
1517	137	671	0.949999988
1518	137	257	0.75
1519	137	672	0.75
1520	137	673	0.75
1521	137	674	0.949999988
1522	137	82	0.75
1523	138	675	0.779999971
1524	138	676	0.600000024
1525	138	677	1
1526	138	678	1
1527	139	247	1
1528	139	40	0.899999976
1529	139	679	0.5
1530	139	680	0.5
1531	139	681	0.5
1532	139	163	0.5
1533	139	12	0.5
1534	139	8	0.5
1535	139	304	0.5
1536	139	569	0.5
1537	139	682	0.5
1538	139	683	0.25
1539	139	16	0.5
1540	139	10	0.5
1541	140	684	1
1542	140	685	0.75
1543	140	686	0.5
1544	140	33	0.899999976
1545	140	36	0.899999976
1546	140	8	0.100000001
1547	140	40	0.25
1548	140	687	0.5
1549	140	37	0.5
1550	140	163	0.5
1551	140	688	0.0299999993
1552	140	689	0.0299999993
1553	140	76	0.25
1554	141	14	0.75
1555	141	690	0.75
1556	141	691	0.5
1557	141	692	0.75
1558	141	693	0.5
1559	141	694	0.5
1560	141	10	0.5
1561	141	16	0.5
1562	142	695	1
1563	142	696	1
1564	142	697	0.899999976
1565	142	698	1
1566	142	699	0.899999976
1567	142	700	0.5
1568	142	701	0.5
1569	142	702	0.5
1570	142	703	0.800000012
1571	142	704	0.699999988
1572	143	705	0.5
1573	143	706	0.5
1574	143	707	0.5
1575	143	708	0.5
1576	143	569	0.5
1577	143	709	0.25
1578	143	710	0.25
1579	143	711	0.25
1580	143	712	0.25
1581	143	713	0.25
1582	143	10	0.5
1583	143	16	0.5
1584	144	77	0.5
1585	144	395	0.5
1586	144	714	0.5
1587	144	239	0.5
1588	144	391	0.5
1589	144	390	0.5
1590	144	715	0.5
1591	144	716	0.25
1592	144	717	0.25
1593	144	718	0.25
1594	144	719	0.5
1595	144	720	0.5
1596	144	721	0.5
1597	144	16	0.5
1598	144	10	0.5
1599	145	722	0.75
1600	146	77	0.5
1601	146	395	0.5
1602	146	714	0.5
1603	146	239	0.5
1604	146	391	0.5
1605	146	390	0.5
1606	146	715	0.5
1607	146	716	0.25
1608	146	717	0.25
1609	146	718	0.25
1610	146	719	0.5
1611	146	720	0.5
1612	146	723	0.5
1613	147	724	0.75
1614	147	33	0.5
1615	147	36	0.5
1616	148	77	0.5
1617	148	395	0.5
1618	148	714	0.5
1619	148	239	0.5
1620	148	391	0.5
1621	148	390	0.5
1622	148	715	0.5
1623	148	716	0.25
1624	148	717	0.25
1625	148	718	0.25
1626	148	719	0.5
1627	148	720	0.5
1628	148	723	0.5
1629	149	77	0.75
1630	149	427	0.75
1631	149	37	0.75
1632	149	725	0.75
1633	149	726	0.75
1634	149	727	0.5
1635	149	728	0.349999994
1636	149	75	0.5
1637	149	729	0.5
1638	149	239	0.5
1639	149	730	0.5
1640	150	77	0.5
1641	150	395	0.5
1642	150	714	0.5
1643	150	239	0.5
1644	150	391	0.5
1645	150	390	0.5
1646	150	715	0.5
1647	150	716	0.25
1648	150	717	0.25
1649	150	718	0.25
1650	150	719	0.5
1651	150	720	0.5
1652	150	721	0.5
1653	150	16	0.5
1654	150	10	0.5
1655	150	726	0.75
1656	150	727	0.5
1657	150	728	0.349999994
1658	150	731	0.699999988
1659	150	732	0.300000012
1660	151	733	0.899999976
1661	151	734	0.75
1662	151	735	0.75
1663	151	736	0.75
1664	151	737	0.5
1665	151	729	0.5
1666	151	738	0.5
1667	152	739	1
1668	152	740	0.75
1669	152	741	0.75
1670	152	742	0.5
1671	152	743	0.5
1672	152	744	0.5
1673	152	745	0.25
1674	152	10	0.5
1675	152	16	0.5
1676	153	746	0.75
1677	153	192	0.75
1678	153	747	0.5
1679	153	748	0.5
1680	153	749	0.5
1681	153	750	0.5
1682	153	751	0.5
1683	153	752	0.25
1684	153	753	0.910000026
1685	153	702	0.5
1686	153	754	0.5
1687	153	755	0.899999976
1688	153	10	0.5
1689	153	16	0.5
1690	154	12	0.5
1691	154	163	0.5
1692	154	681	0.5
1693	154	756	0.5
1694	154	422	0.5
1695	154	434	0.5
1696	154	757	0.5
1697	155	68	0.75
1698	155	9	0.25
1699	155	425	0.949999988
1700	155	758	0.5
1701	155	14	0.850000024
1702	155	36	0.850000024
1703	155	759	0.699999988
1704	155	760	0.25
1705	155	284	0.25
1706	155	761	0.75
1707	156	68	0.5
1708	156	9	0.5
1709	156	762	0.5
1710	156	763	0.75
1711	156	365	0.75
1712	157	764	0.899999976
1713	157	71	0.75
1714	157	765	1
1715	157	16	0.5
1716	157	10	0.5
1717	158	766	1
1718	159	767	0.699999988
1719	159	768	0.200000003
1720	159	125	0.200000003
1721	160	769	1
1722	161	770	1
1723	161	771	0.140000001
1724	161	772	0.800000012
1725	161	773	0.125
1726	161	774	0.0769999996
1727	161	16	0.75
1728	161	10	0.25
1729	162	16	0.600000024
1730	162	10	0.400000006
1731	162	9	0.5
1732	162	68	0.5
1733	162	775	0.200000003
1734	162	776	0.899999976
1735	162	72	0.5
1736	162	777	0.5
1737	163	778	1
1738	164	779	0.949999988
1739	164	16	0.5
1740	164	10	0.5
1741	164	780	0.5
1742	164	400	0.25
1743	164	781	0.400000006
1744	164	782	0.75
1745	164	783	0.25
1746	164	784	0.25
1747	164	785	0.100000001
1748	165	68	0.600000024
1749	165	9	0.400000006
1750	165	786	0.25
1751	165	787	0.5
1752	165	788	0.5
1753	165	789	0.5
1754	166	83	0.25
1755	166	790	0.75
1756	167	791	1
1757	168	792	0.899999976
1758	168	793	0.75
1759	168	415	0.5
1760	168	794	0.25
1761	168	795	0.5
1762	168	796	0.25
1763	168	797	0.25
1764	169	798	0.75
1765	169	799	1
1766	169	800	0.75
1767	169	801	0.5
1768	169	802	0.5
1769	169	803	0.5
1770	169	804	0.5
1771	170	805	1
1772	170	806	0.5
1773	171	807	1
1774	172	808	0.899999976
1775	172	809	0.899999976
1776	172	810	0.800000012
1777	172	811	1
1778	172	812	0.800000012
1779	172	813	0.75
1780	172	814	0.25
1781	172	815	0.699999988
1782	172	449	0.699999988
1783	172	816	0.800000012
1784	173	817	1
1785	173	818	0.75
1786	173	819	1
1787	174	820	0.699999988
1788	174	74	0.100000001
1789	174	284	0.100000001
1790	174	82	0.0500000007
1791	174	37	0.0299999993
1792	174	821	0.100000001
1793	174	722	0.899999976
1794	174	822	0.699999988
1795	174	14	0.0700000003
1796	174	20	0.0700000003
1797	175	823	1
1798	176	10	1
1799	176	16	0
1800	176	68	0
1801	177	820	0.699999988
1802	177	74	0.970000029
1803	177	284	0.959999979
1804	177	82	0.5
1805	177	37	0.300000012
1806	177	821	0.970000029
1807	177	478	0.00499999989
1808	177	822	0.699999988
1809	177	14	0.75
1810	177	20	0.699999988
1811	178	235	0.5
1812	178	824	0.649999976
1813	178	273	0.5
1814	178	14	0.5
1815	178	236	0.5
1816	178	82	0.75
1817	178	237	0.5
1818	178	10	0.5
1819	178	40	0.5
1820	178	825	0.25
1821	178	253	1
1822	178	76	0.5
1823	178	74	0.5
1824	178	250	0.649999976
1825	178	108	0.5
1826	178	312	0.5
1827	178	826	0.649999976
1828	178	827	0.100000001
1829	178	37	0.75
1830	178	828	1
1831	178	277	0.5
1832	178	6	0.5
1833	178	68	0.5
1834	178	79	0.5
1835	178	83	0.649999976
1836	178	829	0.649999976
1837	178	830	1
1838	178	531	0.100000001
1839	178	16	0.5
1840	178	9	0.5
1841	179	10	0.5
1842	180	235	0.5
1843	180	618	0.5
1844	180	831	0.75
1845	180	14	0.75
1846	180	68	0.75
1847	180	236	0.5
1848	180	82	0.75
1849	180	237	0.5
1850	180	10	0.5
1851	180	284	0.75
1852	180	832	0.75
1853	180	833	0.100000001
1854	180	37	0.5
1855	180	834	0.75
1856	180	835	0.75
1857	180	6	0.5
1858	180	836	0.649999976
1859	180	837	0.100000001
1860	180	838	0.75
1861	180	16	0.5
1862	180	9	0.5
1863	181	839	0.75
1864	181	235	0.5
1865	181	618	0.5
1866	181	831	0.75
1867	181	14	0.75
1868	181	836	0.649999976
1869	181	236	0.5
1870	181	250	0.649999976
1871	181	237	0.5
1872	181	10	0.5
1873	181	284	0.75
1874	181	832	0.75
1875	181	37	0.75
1876	181	834	0.75
1877	181	840	0.75
1878	181	82	0.75
1879	181	68	0.75
1880	181	6	0.5
1881	181	841	0.75
1882	181	8	0.5
1883	181	837	0.100000001
1884	181	478	0.5
1885	181	842	0.75
1886	181	838	0.75
1887	181	16	0.5
1888	181	9	0.5
1889	182	235	0.5
1890	182	290	0.75
1891	182	843	0.649999976
1892	182	6	0.5
1893	182	237	0.5
1894	182	10	0.5
1895	182	844	0.75
1896	182	422	0.75
1897	182	15	0.75
1898	182	845	0.75
1899	182	846	0.75
1900	182	292	0.75
1901	182	625	1
1902	182	37	0.75
1903	182	619	0.75
1904	182	236	0.5
1905	182	36	0.75
1906	182	9	0.75
1907	182	561	0.75
1908	182	68	0.75
1909	182	847	0.949999988
1910	182	33	0.75
1911	182	848	0.25
1912	182	849	0.25
1913	182	850	0.75
1914	182	16	0.5
1915	183	235	0.5
1916	183	843	0.649999976
1917	183	6	0.5
1918	183	844	0.75
1919	183	237	0.5
1920	183	851	0.75
1921	183	422	0.75
1922	183	852	0.75
1923	183	15	0.75
1924	183	846	0.75
1925	183	292	0.75
1926	183	625	1
1927	183	324	0.75
1928	183	37	0.75
1929	183	619	0.75
1930	183	236	0.5
1931	183	36	0.75
1932	183	853	0.75
1933	183	9	0.75
1934	183	68	0.75
1935	183	847	0.949999988
1936	183	33	0.75
1937	183	848	0.25
1938	183	849	0.25
1939	183	850	0.75
1940	183	16	0.5
1941	184	235	0.5
1942	184	843	0.649999976
1943	184	6	0.5
1944	184	854	0.75
1945	184	855	0.75
1946	184	237	0.5
1947	184	856	0.100000001
1948	184	857	0.75
1949	184	858	0.75
1950	184	536	0.75
1951	184	859	0.75
1952	184	860	0.75
1953	184	324	0.75
1954	184	236	0.5
1955	184	861	0.100000001
1956	184	9	0.75
1957	184	68	0.75
1958	184	862	0.75
1959	184	847	0.949999988
1960	184	863	0.75
1961	184	848	0.25
1962	184	849	0.25
1963	184	864	0.75
1964	184	16	0.5
1965	185	37	0.850000024
1966	185	725	0.5
1967	185	865	0.5
1968	185	82	0.5
1969	185	866	0.5
1970	185	83	0.100000001
1971	185	77	0.100000001
1972	185	843	0.649999976
1973	186	843	0.649999976
1974	187	820	0.699999988
1975	187	74	0.970000029
1976	187	284	0.959999979
1977	187	82	0.5
1978	187	37	0.300000012
1979	187	821	0.970000029
1980	187	478	0.00499999989
1981	187	822	0.699999988
1982	187	14	0.75
1983	187	20	0.699999988
1984	188	867	1
1985	189	16	0.5
1986	189	122	0.5
1987	189	213	0.5
1988	189	40	0.5
1989	189	74	0.5
1990	189	6	0.5
1991	189	36	0.5
1992	189	105	0.5
1993	189	445	0.5
1994	189	9	0.5
1995	189	10	0.5
1996	189	275	0.5
1997	189	391	0.5
1998	189	868	0.5
1999	189	40	0.5
2000	190	235	0.5
2001	190	869	0.5
2002	190	870	0.5
2003	190	6	0.5
2004	190	445	0.5
2005	190	10	0.5
2006	190	40	0.5
2007	190	398	0.5
2008	190	871	0.5
2009	190	314	0.5
2010	190	872	0.5
2011	190	35	0.5
2012	190	12	0.5
2013	190	77	0.5
2014	190	873	0.5
2015	190	53	0.5
2016	190	291	0.5
2017	190	9	0.5
2018	190	68	0.5
2019	190	40	0.5
2020	190	874	0.5
2021	190	16	0.5
2022	190	875	0.5
2023	191	16	0.600000024
2024	191	10	0.400000006
2025	191	9	0.5
2026	191	235	0.5
2027	191	876	0.75
2028	191	877	0.5
2029	191	878	0.899999976
2030	192	16	0.5
2031	192	10	0.5
2032	192	879	0.899999976
2033	192	880	0.699999988
2034	192	881	0.75
2035	192	882	0.25
2036	193	883	0.899999976
2037	193	884	0.75
2038	193	229	0.75
2039	193	885	0.5
2040	193	72	0.5
2041	193	886	0.75
2042	193	37	0.5
2043	194	722	0.75
2044	194	887	0.230000004
2045	194	74	0.100000001
2046	194	291	0.25
2047	194	83	0.25
2048	194	888	0.5
2049	194	889	0.25
2050	195	14	0.5
2051	195	890	0.5
2052	195	891	0.899999976
2053	195	892	0.75
2054	195	893	0.5
2055	195	894	0.200000003
2056	195	895	0.75
2057	195	896	0.5
2058	195	897	0.5
2059	195	10	0.5
2060	196	898	1
2061	197	9	0.5
2062	197	899	0.600000024
2063	197	3	0.25
2064	197	329	0.25
2065	197	900	0.75
2066	197	901	0.5
2067	197	83	0.5
2068	197	434	0.699999988
2069	197	902	0.5
2070	197	903	1
2071	197	68	0.25
2072	197	10	0.5
2073	197	16	0.5
2074	198	904	1
2075	198	905	1
2076	198	906	1
2077	198	907	1
2078	199	235	0.5
2079	199	90	0.5
2080	199	9	0.5
2081	199	680	0.5
2082	199	908	0.5
2083	199	547	0.5
2084	199	16	0.5
2085	199	529	0.5
2086	199	6	0.5
2087	199	36	0.5
2088	199	8	0.5
2089	199	909	0.5
2090	199	10	0.5
2091	199	68	0.5
2092	199	489	0.5
2093	199	79	0.5
2094	199	461	0.5
2095	199	910	0.5
2096	199	911	0.5
2097	199	469	0.5
2098	199	40	0.5
2099	199	97	0.5
2100	199	46	0.5
2101	199	74	0.5
2102	199	425	0.5
2103	199	393	0.5
2104	199	912	0.5
2105	199	913	0.5
2106	199	914	0.5
2107	199	12	0.5
2108	199	915	0.5
2109	199	916	0.5
2110	199	292	0.5
2111	200	235	0.5
2112	200	90	0.5
2113	200	9	0.5
2114	200	680	0.5
2115	200	908	0.5
2116	200	547	0.5
2117	200	16	0.5
2118	200	529	0.5
2119	200	6	0.5
2120	200	36	0.5
2121	200	8	0.5
2122	200	909	0.5
2123	200	10	0.5
2124	200	68	0.5
2125	200	489	0.5
2126	200	79	0.5
2127	200	461	0.5
2128	200	910	0.5
2129	200	911	0.5
2130	200	469	0.5
2131	200	40	0.5
2132	200	97	0.5
2133	200	46	0.5
2134	200	74	0.5
2135	200	425	0.5
2136	200	393	0.5
2137	200	912	0.5
2138	200	913	0.5
2139	200	914	0.5
2140	200	12	0.5
2141	200	915	0.5
2142	200	916	0.5
2143	200	292	0.5
2144	201	235	0.5
2145	201	90	0.5
2146	201	9	0.5
2147	201	680	0.5
2148	201	908	0.5
2149	201	547	0.5
2150	201	16	0.5
2151	201	529	0.5
2152	201	6	0.5
2153	201	36	0.5
2154	201	8	0.5
2155	201	909	0.5
2156	201	10	0.5
2157	201	68	0.5
2158	201	489	0.5
2159	201	79	0.5
2160	201	461	0.5
2161	201	910	0.5
2162	201	911	0.5
2163	201	469	0.5
2164	201	40	0.5
2165	201	97	0.5
2166	201	46	0.5
2167	201	74	0.5
2168	201	425	0.5
2169	201	393	0.5
2170	201	912	0.5
2171	201	913	0.5
2172	201	914	0.5
2173	201	12	0.5
2174	201	915	0.5
2175	201	916	0.5
2176	201	292	0.5
2177	202	235	0.5
2178	202	90	0.5
2179	202	9	0.5
2180	202	680	0.5
2181	202	908	0.5
2182	202	547	0.5
2183	202	16	0.5
2184	202	529	0.5
2185	202	6	0.5
2186	202	36	0.5
2187	202	8	0.5
2188	202	909	0.5
2189	202	10	0.5
2190	202	68	0.5
2191	202	489	0.5
2192	202	79	0.5
2193	202	461	0.5
2194	202	910	0.5
2195	202	911	0.5
2196	202	469	0.5
2197	202	40	0.5
2198	202	97	0.5
2199	202	46	0.5
2200	202	74	0.5
2201	202	425	0.5
2202	202	393	0.5
2203	202	912	0.5
2204	202	913	0.5
2205	202	914	0.5
2206	202	12	0.5
2207	202	915	0.5
2208	202	916	0.5
2209	202	292	0.5
2210	203	917	0.75
2211	203	37	0.75
2212	203	82	0.75
2213	203	81	0.5
2214	203	918	0.209999993
2215	203	919	0.850000024
2216	203	920	0.370000005
2217	203	83	0.270000011
2218	203	431	0.100000001
2219	204	917	0.75
2220	204	37	0.75
2221	204	82	0.75
2222	204	81	0.5
2223	204	918	0.209999993
2224	204	921	0.850000024
2225	204	920	0.370000005
2226	204	83	0.270000011
2227	204	431	0.100000001
2228	205	6	0.5
2229	205	9	0.5
2230	205	10	0.5
2231	205	68	0.5
2232	205	83	0.5
2233	205	14	0.5
2234	205	74	0.5
2235	205	922	0.5
2236	205	390	0.5
2237	205	16	0.5
2238	205	545	0.5
2239	206	923	1
2240	206	924	1
2241	206	925	1
2242	206	926	0.899999976
2243	206	927	1
2244	206	928	0.75
2245	206	929	1
2246	206	930	1
2247	206	931	0.899999976
2248	207	932	0.75
2249	207	933	0.75
2250	207	16	0.75
2251	207	10	0.25
2252	207	934	0.5
2253	207	935	0.5
2254	207	936	0.5
2255	208	937	1
2256	209	938	0.75
2257	209	939	0.5
2258	209	940	0.5
2259	209	941	1
2260	210	938	0.75
2261	210	939	0.5
2262	210	940	0.5
2263	210	942	1
2264	211	943	0.5
2265	211	722	0.300000012
2266	211	944	0.899999976
2267	212	945	0.5
2268	212	946	0.5
2269	213	947	0.75
2270	213	948	0.5
2271	213	949	0.400000006
2272	213	950	0.5
2273	213	951	0.25
2274	213	952	0.25
2275	213	953	0.5
2276	213	954	0.25
2277	213	955	0.25
2278	213	956	0.5
2279	213	851	0.119999997
2280	213	957	0.25
2281	213	958	0.25
2282	214	959	0.300000012
2283	214	960	0.300000012
2284	214	961	0.300000012
2285	214	962	0.25
2286	214	963	0.25
2287	214	964	0.25
2288	215	965	0.5
2289	215	966	0.899999976
2290	215	967	0.5
2291	215	968	0.5
2292	215	969	0.5
2293	215	970	0.5
2294	215	971	0.5
2295	215	33	0.5
2296	215	972	0.5
2297	215	973	0.100000001
2298	215	974	0.100000001
2299	215	975	0.899999976
2300	215	976	0.899999976
2301	215	977	0.75
2302	215	978	0.5
2303	215	979	0.5
2304	215	980	0.5
2305	215	981	0.330000013
2306	215	982	0.25
2307	215	36	0.5
2308	216	946	0.5
2309	216	983	0.5
2310	217	722	0.75
2311	217	434	0.899999976
2312	217	14	0.25
2313	217	329	0.25
2314	217	960	0.0299999993
2315	218	277	0.600000024
2316	218	984	0.5
2317	218	985	0.200000003
2318	218	986	0.200000003
2319	218	987	0.200000003
2320	218	988	0.200000003
2321	218	989	0.400000006
2322	218	43	0.400000006
2323	218	990	0.200000003
2324	218	991	0.200000003
2325	218	722	0.800000012
2326	218	14	0.5
2327	219	992	0.800000012
2328	219	993	0.800000012
2329	219	994	0.800000012
2330	219	995	0.400000006
2331	220	460	0.800000012
2332	220	767	0.5
2333	220	996	0.200000003
2334	220	997	0.400000006
2335	220	998	0.100000001
2336	220	999	0.0500000007
2337	220	1000	0.0500000007
2338	221	1001	0.5
2339	221	229	0.899999976
2340	221	1002	0.800000012
2341	221	1003	0.400000006
2342	222	460	0.5
2343	222	6	0.5
2344	222	277	0.5
2345	222	9	0.5
2346	222	10	0.5
2347	222	1004	0.5
2348	222	16	0.5
2349	222	438	0.5
2350	222	1005	0.5
2351	222	1006	0.5
2352	223	16	0.5
2353	223	10	0.5
2354	223	9	0.75
2355	223	1007	0.800000012
2356	223	76	0.600000024
2357	223	105	0.699999988
2358	223	37	0.75
2359	223	81	0.75
2360	223	82	0.75
2361	223	425	0.400000006
2362	223	1008	0.200000003
2363	223	1009	0.300000012
2364	223	1010	0.300000012
2365	223	1011	0.449999988
2366	223	920	0.699999988
2367	223	1012	0.449999988
2368	223	1013	0.300000012
2369	223	1014	0.400000006
2370	223	634	0.449999988
2371	223	83	0.400000006
2372	223	431	0.25
2373	223	1015	0.349999994
2374	223	1016	0.5
2375	224	235	0.5
2376	224	10	0.5
2377	224	908	0.5
2378	224	529	0.5
2379	224	6	0.5
2380	224	9	0.5
2381	224	1017	0.5
2382	224	68	0.5
2383	224	1018	0.75
2384	224	1019	0.5
2385	224	35	0.5
2386	224	914	0.5
2387	224	16	0.5
2388	225	1020	0.75
2389	225	1021	0.5
2390	225	1022	1
2391	225	1023	0.600000024
2392	225	1024	1
2393	225	1025	0.75
2394	225	1026	0.899999976
2395	225	37	0.75
2396	225	1027	0.75
2397	225	290	0.75
2398	225	1028	0.75
2399	225	324	0.5
2400	225	33	0.5
2401	225	36	0.5
2402	225	291	0.5
2403	225	194	0.5
2404	226	235	0.5
2405	226	9	0.5
2406	226	14	0.5
2407	226	236	0.5
2408	226	1029	1
2409	226	250	0.649999976
2410	226	36	0.5
2411	226	237	0.5
2412	226	6	0.5
2413	226	10	0.5
2414	226	68	0.5
2415	226	1030	0.75
2416	226	531	0.100000001
2417	226	16	0.5
2418	226	1018	0.75
2419	226	33	0.5
2420	227	235	0.5
2421	227	16	0.5
2422	227	1031	0.100000001
2423	227	14	0.75
2424	227	33	0.75
2425	227	236	0.5
2426	227	478	0.75
2427	227	6	0.5
2428	227	36	0.75
2429	227	391	0.75
2430	227	1029	1
2431	227	237	0.5
2432	227	9	0.5
2433	227	68	0.5
2434	227	1032	0.5
2435	227	565	0.100000001
2436	227	1033	0.75
2437	227	1034	0.949999988
2438	228	16	0.600000024
2439	228	10	0.400000006
2440	228	9	0.5
2441	228	1035	0.75
2442	228	1036	0.800000012
2443	228	529	0.25
2444	228	1037	0.75
2445	228	1038	0.75
2446	228	1039	0.5
2447	228	1040	0.5
2448	228	1041	0.25
2449	229	10	0.25
2450	229	1042	0.5
2451	229	1043	0.5
2452	229	1044	0.5
2453	229	1045	0.5
2454	229	35	0.5
2455	229	1046	0.5
2456	229	1047	0.25
2457	229	348	0.5
2458	229	324	0.5
2459	229	1048	0.5
2460	229	291	0.5
2461	229	9	0.5
2462	229	862	0.5
2463	229	1049	0.5
2464	229	1050	0.5
2465	229	1051	0.5
2466	229	1052	0.5
2467	229	1053	0.5
2468	229	16	0.75
2469	229	1054	0.5
2470	230	1055	1
2471	230	1056	1
2472	231	1057	1
2473	231	1058	0.5
2474	231	1059	0.100000001
2475	231	1060	0.25
2476	231	1061	0.5
2477	231	1062	0.5
2478	232	1063	0.5
2479	232	9	0.5
2480	232	35	0.5
2481	232	10	0.5
2482	232	16	0.5
2483	232	1064	0.5
2484	232	6	0.5
2485	232	1065	0.5
2486	233	1066	0.5
2487	233	6	0.5
2488	233	10	0.5
2489	233	94	0.5
2490	233	1067	0.5
2491	233	1068	0.5
2492	233	1069	0.5
2493	233	1070	0.5
2494	233	37	0.25
2495	233	1071	0.5
2496	233	1072	0.5
2497	233	53	0.25
2498	233	9	0.5
2499	233	1073	0.5
2500	233	1074	0.5
2501	233	1075	0.5
2502	233	1076	0.5
2503	233	1077	0.5
2504	233	1078	0.5
2505	233	1079	0.5
2506	233	16	0.5
2507	233	1080	0.100000001
2508	233	181	0.5
2509	234	1081	0.5
2510	234	1082	0.5
2511	234	845	0.5
2512	234	1083	0.5
2513	234	1084	0.5
2514	234	10	0.5
2515	234	6	0.5
2516	234	1085	0.5
2517	234	1086	0.5
2518	234	1087	0.5
2519	234	9	0.5
2520	234	1088	0.5
2521	234	16	0.5
2522	234	1089	0.5
2523	234	1090	0.5
2524	234	1091	0.5
2525	235	1092	1
2526	235	1093	1
2527	235	1094	1
2528	235	1095	1
2529	235	1096	0.600000024
2530	235	8	0.400000006
2531	235	1097	0.400000006
2532	235	1098	0.400000006
2533	235	1099	0.400000006
2534	235	1100	1
2535	235	1101	0.600000024
2536	235	1080	0.600000024
2537	236	1102	1
2538	236	1103	1
2539	237	1104	0.75
2540	237	235	0.5
2541	237	68	0.5
2542	237	236	0.5
2543	237	6	0.5
2544	237	1105	0.75
2545	237	1106	0.25
2546	237	237	0.5
2547	237	10	0.5
2548	237	71	0.75
2549	237	1107	0.949999988
2550	237	292	0.5
2551	237	1108	0.5
2552	237	1109	0.949999988
2553	237	37	0.5
2554	237	1110	0.75
2555	237	257	0.5
2556	237	1111	0.25
2557	237	53	0.5
2558	237	9	0.5
2559	237	1112	0.949999988
2560	237	16	0.5
2561	237	1113	0.949999988
2562	237	781	0.75
2563	237	181	0.5
2564	238	235	0.5
2565	238	1114	0.5
2566	238	10	0.5
2567	238	14	0.75
2568	238	236	0.5
2569	238	6	0.5
2570	238	715	0.5
2571	238	1115	0.949999988
2572	238	237	0.5
2573	238	1116	0.75
2574	238	1117	0.75
2575	238	427	0.75
2576	238	1118	0.5
2577	238	1119	0.5
2578	238	1107	0.949999988
2579	238	37	0.75
2580	238	36	0.75
2581	238	1111	0.25
2582	238	9	0.5
2583	238	68	0.5
2584	238	391	0.5
2585	238	33	0.75
2586	238	1106	0.25
2587	238	1120	0.949999988
2588	238	16	0.5
2589	238	1113	0.949999988
2590	239	1121	0.75
2591	239	235	0.5
2592	239	10	0.5
2593	239	68	0.5
2594	239	236	0.5
2595	239	1122	0.949999988
2596	239	6	0.5
2597	239	107	0.75
2598	239	1106	0.25
2599	239	237	0.5
2600	239	1116	0.75
2601	239	359	0.75
2602	239	40	0.75
2603	239	1107	0.949999988
2604	239	37	0.75
2605	239	567	0.75
2606	239	1123	0.75
2607	239	1124	0.75
2608	239	357	0.75
2609	239	9	0.5
2610	239	1125	0.75
2611	239	79	0.75
2612	239	1111	0.25
2613	239	1126	0.949999988
2614	239	16	0.5
2615	239	1113	0.949999988
2616	240	235	0.5
2617	240	10	0.5
2618	240	236	0.5
2619	240	6	0.5
2620	240	1127	0.75
2621	240	1106	0.25
2622	240	237	0.5
2623	240	290	0.75
2624	240	1107	0.949999988
2625	240	551	0.5
2626	240	37	0.75
2627	240	1128	0.75
2628	240	1111	0.25
2629	240	53	0.75
2630	240	9	0.5
2631	240	68	0.5
2632	240	162	0.75
2633	240	461	0.5
2634	240	1129	0.75
2635	240	1130	0.949999988
2636	240	1131	0.75
2637	240	1132	0.949999988
2638	240	16	0.5
2639	240	1113	0.949999988
2640	241	235	0.5
2641	241	90	0.75
2642	241	236	0.5
2643	241	6	0.5
2644	241	1106	0.25
2645	241	1133	0.75
2646	241	1134	0.949999988
2647	241	237	0.5
2648	241	10	0.5
2649	241	1135	0.75
2650	241	393	0.75
2651	241	1107	0.949999988
2652	241	1136	0.5
2653	241	1109	0.949999988
2654	241	37	0.75
2655	241	1137	0.5
2656	241	1111	0.25
2657	241	9	0.5
2658	241	68	0.5
2659	241	88	0.75
2660	241	1138	0.5
2661	241	498	0.75
2662	241	16	0.5
2663	241	1113	0.949999988
2664	242	6	0.5
2665	242	277	0.5
2666	242	445	0.5
2667	242	9	0.5
2668	242	10	0.5
2669	242	68	0.5
2670	242	1139	0.5
2671	242	1140	0.5
2672	242	489	0.5
2673	242	1141	0.5
2674	242	35	0.5
2675	242	1142	0.5
2676	242	16	0.5
2677	243	1143	1
2678	243	1144	0.899999976
2679	243	1145	0.899999976
2680	243	1146	0.899999976
2681	243	1147	0.899999976
2682	244	40	0.5
2683	244	235	0.5
2684	244	1148	0.5
2685	244	1149	0.5
2686	244	21	0.5
2687	244	314	0.5
2688	244	122	0.5
2689	244	46	0.5
2690	244	1	0.5
2691	244	6	0.5
2692	244	1150	0.5
2693	244	1151	0.5
2694	244	460	0.5
2695	244	9	0.5
2696	244	10	0.5
2697	244	68	0.5
2698	244	437	0.5
2699	244	16	0.5
2700	244	1152	0.5
2701	245	277	0.25
2702	245	437	0.25
2703	245	21	0.25
2704	245	1151	0.75
2705	245	460	0.75
2706	245	40	0.75
2707	246	1153	0.5
2708	246	1151	0.800000012
2709	246	1154	0.800000012
2710	246	1155	0.600000024
2711	246	1156	0.800000012
2712	246	1157	0.400000006
2713	246	1158	0.400000006
2714	246	1159	0.400000006
2715	246	1160	0.600000024
2716	246	1161	0.5
2717	246	1148	0.600000024
2718	246	1162	0.600000024
2719	246	1163	0.600000024
2720	246	1164	0.5
2721	247	1	0.5
2722	247	8	0.5
2723	247	273	0.5
2724	247	21	0.5
2725	247	1165	0.5
2726	247	314	0.100000001
2727	247	6	0.5
2728	247	1166	0.5
2729	247	1151	0.5
2730	247	1167	0.5
2731	247	277	0.5
2732	247	434	0.5
2733	247	9	0.5
2734	247	10	0.5
2735	247	16	0.5
2736	247	461	0.5
2737	248	10	0.850000024
2738	248	16	0.150000006
2739	248	291	0.75
2740	248	82	0.75
2741	248	1168	0.75
2742	248	37	0.75
2743	248	711	0.600000024
2744	248	873	0.600000024
2745	248	21	0.400000006
2746	248	419	0.5
2747	248	107	0.5
2748	248	40	0.349999994
2749	248	277	0.200000003
2750	248	275	0.100000001
2751	248	1169	0.75
2752	248	1170	0.75
2753	248	1171	0.75
2754	248	1172	0.600000024
2755	248	1173	0.600000024
2756	248	434	0.600000024
2757	249	1174	0.899999976
2758	249	1175	0.850000024
2759	249	1176	0.449999988
2760	249	434	0.400000006
2761	249	1177	0.5
2762	249	37	0.300000012
2763	249	1178	0.850000024
2764	249	83	0.600000024
2765	250	16	0.5
2766	250	10	0.5
2767	250	398	0.5
2768	250	12	0.5
2769	250	1179	0.5
2770	250	420	0.5
2771	250	291	0.5
2772	250	292	0.5
2773	250	396	0.5
2774	250	1180	0.5
2775	250	37	0.5
2776	251	1181	0.5
2777	251	1182	0.75
2778	251	1183	0.75
2779	251	1184	0.75
2780	251	1185	0.75
2781	251	1186	0.25
2782	251	181	0.75
2783	252	702	0.5
2784	252	1187	0.5
2785	253	37	0.75
2786	253	53	0.75
2787	253	1188	0.5
2788	253	681	0.5
2789	253	107	0.5
2790	253	1189	0.75
2791	253	1190	0.899999976
2792	253	122	0.5
2793	253	8	0.5
2794	253	46	0.5
2795	253	431	0.5
2796	253	634	0.5
2797	253	1191	0.5
2798	253	1192	0.25
2799	253	1193	0.5
2800	254	1194	0.5
2801	254	1195	0.5
2802	254	844	0.5
2803	254	1196	0.5
2804	254	1197	0.5
2805	254	468	0.5
2806	254	1198	0.75
2807	254	1199	0.25
2808	254	1200	0.25
2809	254	1201	0.25
2810	255	1202	0.5
2811	255	1203	0.5
2812	255	1204	0.5
2813	255	1205	0.5
2814	255	292	0.5
2815	255	951	0.5
2816	255	1206	0.5
2817	255	395	0.5
2818	255	1207	0.5
2819	255	1208	0.5
2820	255	421	0.5
2821	255	1209	0.5
2822	255	1210	0.5
2823	255	1211	0.699999988
2824	255	1212	0.649999976
2825	255	1213	0.660000026
2826	255	10	0.850000024
2827	255	16	0.150000006
2828	256	1214	0.5
2829	256	761	0.5
2830	256	1215	0.5
2831	257	1216	1
2832	257	1217	1
2833	257	1218	0.75
2834	257	1219	0.75
2835	257	1220	0.75
2836	257	1221	0.75
2837	258	235	0.5
2838	258	14	0.5
2839	258	236	0.5
2840	258	1222	0.5
2841	258	6	0.5
2842	258	237	0.5
2843	258	10	0.5
2844	258	1118	0.5
2845	258	74	0.75
2846	258	1223	0.5
2847	258	304	0.75
2848	258	77	0.5
2849	258	1224	0.5
2850	258	692	0.5
2851	258	36	0.5
2852	258	1225	0.75
2853	258	68	0.75
2854	258	79	0.75
2855	258	1226	0.5
2856	258	1227	0.949999988
2857	258	687	0.5
2858	258	531	0.649999976
2859	258	16	0.5
2860	258	9	0.5
2861	259	53	0.5
2862	259	499	0.5
2863	259	1228	0.5
2864	259	1229	0.5
2865	259	74	0.5
2866	259	163	0.5
2867	259	37	0.5
2868	259	40	0.5
2869	259	429	0.5
2870	259	107	0.5
2871	259	361	0.5
2872	259	1230	0.5
2873	259	1231	0.5
2874	259	1232	0.5
2875	259	1233	0.5
2876	259	1234	0.5
2877	259	416	0.5
2878	259	1235	0.5
2879	259	1236	0.5
2880	259	1237	0.75
2881	259	185	0.5
2882	259	1238	0.5
2883	260	1239	0.5
2884	260	1240	0.5
2885	260	35	0.5
2886	260	10	0.5
2887	260	68	0.5
2888	260	1241	0.5
2889	260	16	0.5
2890	260	6	0.5
2891	260	9	0.5
2892	261	235	0.5
2893	261	1242	0.949999988
2894	261	1243	0.75
2895	261	1244	0.75
2896	261	236	0.5
2897	261	6	0.5
2898	261	1245	0.5
2899	261	237	0.5
2900	261	10	0.5
2901	261	1246	0.75
2902	261	1247	0.75
2903	261	1	0.5
2904	261	1248	0.5
2905	261	1249	0.949999988
2906	261	304	0.75
2907	261	619	0.100000001
2908	261	1250	0.25
2909	261	861	0.75
2910	261	277	0.5
2911	261	9	0.5
2912	261	68	0.5
2913	261	79	0.75
2914	261	1251	0.25
2915	261	275	0.5
2916	261	1252	0.25
2917	261	16	0.5
2918	261	1253	0.949999988
2919	262	235	0.5
2920	262	6	0.5
2921	262	9	0.5
2922	262	10	0.5
2923	262	68	0.5
2924	262	305	0.5
2925	262	79	0.5
2926	262	40	0.5
2927	262	40	0.5
2928	262	1254	0.5
2929	262	304	0.5
2930	262	16	0.5
2931	262	35	0.5
2932	263	235	0.5
2933	263	6	0.5
2934	263	1255	0.5
2935	263	9	0.5
2936	263	68	0.5
2937	263	1256	0.5
2938	263	1257	0.5
2939	263	1	0.5
2940	263	1254	0.5
2941	263	35	0.5
2942	263	1258	0.5
2943	263	16	0.5
2944	264	1259	0.5
2945	264	235	0.25
2946	264	16	0.5
2947	264	21	0.5
2948	264	1260	0.5
2949	264	40	0.5
2950	264	6	0.5
2951	264	9	0.5
2952	264	40	0.5
2953	264	1261	0.5
2954	264	277	0.5
2955	264	445	0.5
2956	264	35	0.25
2957	264	10	0.5
2958	264	68	0.25
2959	264	1262	0.5
2960	264	1263	0.5
2961	264	12	0.5
2962	264	1264	0.5
2963	264	461	0.25
2964	265	1265	0.75
2965	265	1266	0.150000006
2966	265	1267	0.100000001
2967	265	10	0.660000026
2968	265	16	0.330000013
2969	265	40	0.75
2970	265	1268	0.75
2971	265	445	0.75
2972	265	1269	0.800000012
2973	265	21	0.5
2974	265	1270	0.5
2975	265	314	0.5
2976	265	1271	0.5
2977	265	1159	0.5
2978	265	1272	0.75
2979	265	1151	0.5
2980	265	1273	0.899999976
2981	265	997	0.25
2982	266	722	0.800000012
2983	266	291	0.600000024
2984	266	681	0.600000024
2985	266	444	0.600000024
2986	266	1274	0.5
2987	266	21	0.5
2988	267	681	0.75
2989	267	1274	0.75
2990	267	21	0.5
2991	267	1275	0.5
2992	267	446	0.100000001
2993	268	1276	1
2994	269	1277	0.899999976
2995	269	680	0.100000001
2996	269	681	0.100000001
2997	269	21	0.100000001
2998	270	806	0.449999988
2999	270	40	0.75
3000	270	421	0.600000024
3001	270	122	0.600000024
3002	270	1278	0.800000012
3003	270	291	0.75
3004	270	304	0.5
3005	270	441	0.5
3006	270	315	0.400000006
3007	271	1279	0.699999988
3008	271	1280	1
3009	271	1281	0.800000012
3010	271	1282	0.800000012
3011	271	1283	0.800000012
3012	271	1284	0.800000012
3013	271	1285	0.800000012
3014	271	1286	0.800000012
3015	271	1287	0.800000012
3016	271	1288	0.899999976
3017	272	235	0.5
3018	272	1289	0.5
3019	272	9	0.5
3020	272	1290	0.5
3021	272	36	0.5
3022	272	16	0.5
3023	272	6	0.5
3024	272	1290	0.5
3025	272	35	0.5
3026	272	37	0.5
3027	272	1291	0.5
3028	272	10	0.5
3029	272	68	0.5
3030	272	162	0.5
3031	272	33	0.5
3032	272	292	0.5
3033	272	15	0.75
3034	273	37	0.5
3035	273	257	0.5
3036	273	82	0.5
3037	273	594	0.5
3038	273	291	0.5
3039	273	6	0.5
3040	273	10	0.5
3041	273	427	0.5
3042	273	1	0.5
3043	273	81	0.5
3044	273	105	0.5
3045	273	16	0.5
3046	273	9	0.5
3047	274	1292	0.5
3048	274	1293	0.5
3049	274	1294	0.5
3050	274	1295	0.5
3051	274	1296	0.5
3052	274	10	0.5
3053	274	1297	0.5
3054	274	74	0.5
3055	274	1298	0.5
3056	274	35	0.5
3057	274	1299	0.75
3058	274	40	0.5
3059	274	1300	0.5
3060	274	1301	0.5
3061	274	37	0.5
3062	274	291	0.5
3063	274	9	0.5
3064	274	68	0.5
3065	274	6	0.5
3066	274	38	0.5
3067	274	40	0.5
3068	274	1302	0.5
3069	274	1303	0.5
3070	274	16	0.5
3071	274	1304	0.5
3072	274	1305	0.5
3073	275	235	0.5
3074	275	1306	0.75
3075	275	236	0.5
3076	275	1307	0.75
3077	275	6	0.5
3078	275	1308	0.75
3079	275	1309	0.25
3080	275	1310	0.5
3081	275	237	0.5
3082	275	10	0.5
3083	275	1311	0.25
3084	275	1312	0.75
3085	275	1313	0.949999988
3086	275	1314	0.949999988
3087	275	1315	0.25
3088	275	1316	0.5
3089	275	1317	0.75
3090	275	1318	0.949999988
3091	275	9	0.5
3092	275	68	0.5
3093	275	781	0.75
3094	275	1319	0.949999988
3095	275	125	0.75
3096	275	231	0.75
3097	275	1320	0.100000001
3098	275	16	0.5
3099	275	126	0.75
3100	275	181	0.75
3101	276	235	0
3102	276	618	0
3103	276	14	0.75
3104	276	236	0.5
3105	276	6	0.5
3106	276	237	0.5
3107	276	9	0.5
3108	276	68	0.5
3109	276	1321	0.75
3110	276	33	0.75
3111	276	377	0.75
3112	276	16	0.5
3113	276	378	0.75
3114	277	1322	1
3115	278	235	0
3116	278	1323	0.949999988
3117	278	71	0.75
3118	278	1324	0.949999988
3119	278	1325	0.75
3120	278	236	0.5
3121	278	1326	0.25
3122	278	6	0.5
3123	278	507	0.5
3124	278	1327	0.75
3125	278	237	0.5
3126	278	9	0.5
3127	278	10	1
3128	278	68	0.5
3129	278	16	0
3130	278	1069	1
3131	279	1328	0.75
3132	279	37	0.75
3133	279	163	0.75
3134	279	1329	0.5
3135	279	79	0.75
3136	279	53	0.75
3137	279	1330	0.5
3138	279	40	0.5
3139	279	292	0.5
3140	279	1331	0.5
3141	279	250	0.5
3142	279	1332	0.5
3143	279	1012	0.5
3144	279	635	0.5
3145	279	1333	0.5
3146	279	1334	0.5
3147	279	1335	0.75
3148	279	1336	0.75
3149	279	16	0.5
3150	279	10	0.5
3151	279	1337	0.75
3152	279	1338	0.75
3153	279	1339	0.5
3154	279	1340	0.5
3155	280	1341	0.899999976
3156	280	16	1
3157	280	72	0.899999976
3158	280	1342	0.75
3159	280	1343	0.5
3160	280	1344	0.75
3161	280	1345	0.5
3162	280	1346	0.5
3163	280	68	0.5
3164	280	9	0.5
3165	281	832	0.5
3166	281	10	0.5
3167	281	1347	0.100000001
3168	281	1348	0.949999988
3169	281	74	0.5
3170	281	82	0.5
3171	281	36	0.75
3172	281	1349	0.25
3173	281	237	0.5
3174	281	6	0.5
3175	281	236	0.5
3176	281	1350	0.75
3177	281	14	0.5
3178	281	16	0.5
3179	281	9	0.5
3180	282	1351	0.800000012
3181	282	1352	1
3182	282	395	0.800000012
3183	282	83	0.699999988
3184	282	1353	0.600000024
3185	282	249	0.699999988
3186	282	1354	0.5
3187	282	1355	0.400000006
3188	283	1356	0.800000012
3189	283	1357	0.800000012
3190	283	16	0.600000024
3191	283	10	0.400000006
3192	283	1358	0.5
3193	283	6	0.5
3194	284	235	0.5
3195	284	37	0.5
3196	284	270	0.5
3197	284	1359	0.75
3198	284	1360	0.25
3199	284	1361	0.5
3200	284	1362	0.5
3201	284	1313	0.949999988
3202	284	1314	0.949999988
3203	284	236	0.5
3204	284	1363	0.100000001
3205	284	1318	0.949999988
3206	284	1309	0.25
3207	284	53	0.5
3208	284	237	0.5
3209	284	6	0.5
3210	284	10	0.5
3211	284	1364	0.100000001
3212	284	1365	0.5
3213	284	1366	0.75
3214	284	597	0.5
3215	284	1311	0.25
3216	284	599	0.5
3217	284	68	0.5
3218	284	431	0.5
3219	284	1367	1
3220	284	82	0.5
3221	284	9	0.5
3222	284	420	0.5
3223	284	555	0.5
3224	284	105	0.5
3225	284	16	0.5
3226	284	1320	0.100000001
3227	284	291	0.5
3228	284	1368	0.949999988
3229	284	1369	0.5
3230	284	292	0.5
3231	285	235	0.5
3232	285	1370	0.75
3233	285	236	0.5
3234	285	6	0.5
3235	285	1309	0.25
3236	285	237	0.5
3237	285	10	0.5
3238	285	1311	0.25
3239	285	1371	0.75
3240	285	1372	0.75
3241	285	1373	0.75
3242	285	536	0.75
3243	285	1374	0.75
3244	285	1368	0.949999988
3245	285	1313	0.949999988
3246	285	292	0.75
3247	285	37	0.75
3248	285	1360	0.25
3249	285	43	0.75
3250	285	1314	0.949999988
3251	285	1318	0.949999988
3252	285	9	0.5
3253	285	68	0.5
3254	285	1375	0.75
3255	285	107	0.75
3256	285	105	0.75
3257	285	1320	0.100000001
3258	285	16	0.5
3259	285	1376	0.75
3260	285	1377	0.75
3261	286	1378	0.949999988
3262	286	1379	0.200000003
3263	286	1380	0.899999976
3264	286	1381	0.5
3265	287	1382	1
3266	287	1383	0.949999988
3267	288	37	0.5
3268	288	10	0.5
3269	288	185	0.5
3270	288	1384	0.5
3271	288	6	0.5
3272	288	53	0.5
3273	288	9	0.5
3274	288	1385	0.5
3275	288	781	0.5
3276	288	1	0.5
3277	288	16	0.5
3278	289	1386	0.5
3279	289	1	0.5
3280	289	9	0.5
3281	289	1387	0.5
3282	289	10	0.5
3283	289	16	0.5
3284	289	1388	0.5
3285	289	6	0.5
3286	290	892	0.899999976
3287	290	1389	0.899999976
3288	290	1390	0.899999976
3289	290	1391	0.899999976
3290	290	1392	0.699999988
3291	290	1393	1
3292	290	1394	0.899999976
3293	291	1395	1
3294	292	1396	0.899999976
3295	292	1397	0.75
3296	292	1398	0.75
3297	292	1399	0.75
3298	292	1400	0.899999976
3299	292	1401	0.5
3300	292	1402	0.75
3301	293	1	0.5
3302	293	16	0.5
3303	293	10	0.5
3304	293	426	0.5
3305	293	1403	0.5
3306	293	1077	0.5
3307	293	1404	0.25
3308	293	6	0.5
3309	293	36	0.5
3310	293	35	0.5
3311	293	324	0.5
3312	293	9	0.5
3313	293	290	0.5
3314	293	33	0.5
3315	293	292	0.5
3316	294	235	0.5
3317	294	1405	0.5
3318	294	122	0.5
3319	294	1406	0.5
3320	294	82	0.5
3321	294	1407	0.5
3322	294	10	0.5
3323	294	40	0.5
3324	294	1	0.5
3325	294	1408	0.5
3326	294	1409	0.5
3327	294	35	0.5
3328	294	12	0.5
3329	294	1410	0.5
3330	294	460	0.5
3331	294	1411	0.5
3332	294	1412	0.5
3333	294	442	0.5
3334	294	68	0.5
3335	294	1413	1
3336	294	1149	0.5
3337	294	1414	0.5
3338	294	16	0.5
3339	294	1415	0.5
3340	294	1416	0.5
3341	294	324	0.5
3342	294	6	0.5
3343	294	1417	0.5
3344	294	445	0.5
3345	294	1418	0.5
3346	294	314	0.5
3347	294	1197	0.5
3348	294	1419	0.5
3349	294	395	0.5
3350	294	1420	0.5
3351	294	547	0.5
3352	294	36	0.5
3353	294	1149	0.5
3354	294	1421	0.5
3355	294	40	0.5
3356	294	1264	0.5
3357	294	9	0.5
3358	294	1422	0.5
3359	295	1423	0.5
3360	295	1	0.5
3361	295	37	0.5
3362	295	40	0.5
3363	295	1424	0.5
3364	295	16	0.5
3365	295	401	0.5
3366	295	1425	0.5
3367	295	277	0.5
3368	295	82	0.5
3369	295	10	0.5
3370	295	1426	0.5
3371	295	1427	0.25
3372	295	79	0.5
3373	295	6	0.5
3374	295	9	0.5
3375	296	1428	0.5
3376	296	181	0.5
3377	296	6	0
3378	296	9	0.5
3379	296	10	1
3380	296	1	0.5
3381	296	1429	0.5
3382	296	1430	1
3383	296	1431	0.5
3384	296	35	0.5
3385	296	1432	0.5
3386	296	16	0
3387	297	235	0.5
3388	297	6	0.5
3389	297	291	0.5
3390	297	9	0.5
3391	297	10	0.5
3392	297	68	0.5
3393	297	1433	0.5
3394	297	83	0.5
3395	297	1	0.5
3396	297	35	0.5
3397	297	12	0.5
3398	297	16	0.5
3399	298	1434	0.75
3400	298	1435	0.75
3401	298	1436	0.75
3402	298	1437	0.685000002
3403	298	1438	0.370000005
3404	298	1439	0.25
3405	298	1440	0.25
3406	299	1441	1
3407	299	1442	0.00999999978
3408	300	724	0.899999976
3409	300	33	0.899999976
3410	300	1443	0.5
3411	300	1444	0.5
3412	300	340	0.5
3413	300	1445	0.0299999993
3414	300	1446	0.829999983
3415	300	1447	0.819999993
3416	300	36	0.899999976
3417	301	1448	1
3418	301	1143	1
3419	301	1449	1
3420	301	1450	1
3421	301	16	0.5
3422	301	10	0.5
3423	302	1451	1
3424	302	37	0.75
3425	302	163	0.75
3426	302	1329	0.5
3427	302	79	0.75
3428	302	53	0.75
3429	302	1330	0.5
3430	302	40	0.5
3431	302	292	0.5
3432	302	1331	0.5
3433	302	250	0.5
3434	302	1332	0.5
3435	302	1012	0.5
3436	302	635	0.5
3437	302	1333	0.5
3438	302	1334	0.5
3439	302	1335	0.75
3440	302	1336	0.75
3441	302	16	0.5
3442	302	10	0.5
3443	302	1452	0.75
3444	302	1338	0.75
3445	302	1339	0.5
3446	302	1340	0.5
3447	303	1453	0.5
3448	304	235	0
3449	304	1454	0.949999988
3450	304	687	0.75
3451	304	10	0.5
3452	304	236	0.5
3453	304	68	0.5
3454	304	74	0.75
3455	304	834	0.75
3456	304	6	0.5
3457	304	1455	0.949999988
3458	304	37	0
3459	304	237	0.5
3460	304	9	0.5
3461	304	618	0.100000001
3462	304	1456	0.100000001
3463	304	14	0.75
3464	304	16	0.5
3465	304	1457	0.25
3466	304	33	0.75
3467	305	235	0.5
3468	305	1458	0.25
3469	305	236	0.5
3470	305	1459	0.75
3471	305	82	0.75
3472	305	237	0.5
3473	305	10	0.5
3474	305	1460	0.75
3475	305	1461	0.949999988
3476	305	40	0.75
3477	305	1462	0.75
3478	305	567	0.75
3479	305	1463	0.75
3480	305	37	0.75
3481	305	619	0.75
3482	305	1464	0.949999988
3483	305	277	0.75
3484	305	291	0.75
3485	305	6	0.5
3486	305	1465	0.75
3487	305	68	0.5
3488	305	79	0.75
3489	305	1466	0.75
3490	305	275	0.75
3491	305	1467	0.100000001
3492	305	1468	0.75
3493	305	1469	0.75
3494	305	270	0.75
3495	305	16	0.5
3496	305	9	0.5
3497	306	1470	0.5
3498	306	1471	0.5
3499	306	235	0.5
3500	306	1472	0.5
3501	306	1473	0.5
3502	306	1474	0.5
3503	306	1475	0.5
3504	306	1476	0.5
3505	306	6	0.5
3506	306	1477	0.5
3507	306	9	0.5
3508	306	10	0.5
3509	306	68	0.5
3510	306	1478	0.5
3511	306	16	0.5
3512	307	501	0.5
3513	307	1479	0.899999976
3514	307	1480	0.899999976
3515	307	1481	0.899999976
3516	307	1482	0.75
3517	307	1483	0.75
3518	307	1484	0.5
3519	307	1485	0.5
3520	307	1486	0.5
3521	307	321	0.5
3522	307	1487	0.5
3523	307	1488	0.5
3524	307	1489	0.25
3525	307	1490	0.25
3526	307	1491	0.25
3527	307	1492	0.25
3528	308	1470	0.5
3529	308	1471	0.5
3530	308	235	0.5
3531	308	1472	0.5
3532	308	1473	0.5
3533	308	1474	0.5
3534	308	1475	0.5
3535	308	1476	0.5
3536	308	6	0.5
3537	308	1477	0.5
3538	308	9	0.5
3539	308	10	0.5
3540	308	68	0.5
3541	308	1478	0.5
3542	308	16	0.5
3543	308	1493	1
3544	309	1494	1
3545	309	1495	0.100000001
3546	309	1496	0.100000001
3547	309	1497	0.25
3548	310	235	0.5
3549	310	499	0.75
3550	310	896	0.75
3551	310	1498	0.75
3552	310	1499	0.949999988
3553	310	6	0
3554	310	1500	0.75
3555	310	237	0.5
3556	310	10	0.5
3557	310	553	0.75
3558	310	1501	0.75
3559	310	1502	0.25
3560	310	1503	0.649999976
3561	310	395	0.75
3562	310	682	0.75
3563	310	1504	0.949999988
3564	310	68	0
3565	310	1505	0.25
3566	310	1506	0.5
3567	310	1507	0.75
3568	310	236	0.5
3569	310	16	0.5
3570	310	1508	0.75
3571	310	9	0
3572	311	235	0
3573	311	90	0.75
3574	311	1509	0.75
3575	311	236	0.5
3576	311	6	0.5
3577	311	237	0.5
3578	311	10	0.5
3579	311	857	0.75
3580	311	1510	0.5
3581	311	1502	0.25
3582	311	1503	0.649999976
3583	311	395	0.75
3584	311	682	0.5
3585	311	36	0.5
3586	311	1504	0.949999988
3587	311	68	0.5
3588	311	1080	0.5
3589	311	33	0.5
3590	311	860	0.75
3591	311	972	0.75
3592	311	1505	0.25
3593	311	1511	0.75
3594	311	1512	0.75
3595	311	16	0.5
3596	311	9	0.5
3597	312	235	0.5
3598	312	290	0.5
3599	312	236	0.5
3600	312	1513	0.75
3601	312	1308	0.949999988
3602	312	237	0.5
3603	312	10	0.5
3604	312	422	0.5
3605	312	1514	0.5
3606	312	15	0.75
3607	312	1515	0.5
3608	312	1516	0.649999976
3609	312	1517	0.75
3610	312	1518	0.75
3611	312	292	0.75
3612	312	37	0.100000001
3613	312	36	0.75
3614	312	6	0.5
3615	312	68	0.5
3616	312	1519	0.75
3617	312	1520	0.75
3618	312	16	0.5
3619	312	9	0.5
3620	312	126	0.649999976
3621	313	946	0.5
3622	313	1521	0.25
3623	314	1522	0.5
3624	314	1523	1
3625	314	235	0.5
3626	314	16	0.5
3627	314	9	0.5
3628	314	10	0.5
3629	314	68	0.5
3630	314	1110	0.5
3631	314	6	0.5
3632	315	235	0.5
3633	315	6	0
3634	315	1295	0.5
3635	315	1289	0.5
3636	315	10	0.5
3637	315	1523	0.5
3638	315	1524	0.5
3639	315	1525	0.5
3640	315	20	0.5
3641	315	1526	0.5
3642	315	35	0.5
3643	315	1527	0.5
3644	315	12	0.5
3645	315	1528	0.5
3646	315	37	0.5
3647	315	36	0.5
3648	315	421	0.5
3649	315	9	0
3650	315	68	0.5
3651	315	1529	0.5
3652	315	33	0.5
3653	315	8	0.5
3654	315	16	0.5
3655	316	68	0.5
3656	316	9	0.5
3657	316	1530	0.899999976
3658	316	1531	0.75
3659	316	1532	0.5
3660	316	275	0.0500000007
3661	316	37	0.5
3662	316	109	0.5
3663	316	40	0.5
3664	316	16	0.400000006
3665	316	10	0.600000024
3666	316	1533	0.5
3667	316	1534	0.730000019
3668	316	275	0.270000011
3669	316	1535	0.200000003
3670	316	569	0.75
3671	316	304	0.219999999
3672	316	716	0.0199999996
3673	316	291	0.430000007
3674	316	1536	0.25
3675	316	1537	0.5
3676	317	40	0.75
3677	317	1538	1
3678	318	235	0.5
3679	318	236	0.5
3680	318	82	0.75
3681	318	1539	0.75
3682	318	473	0.5
3683	318	10	0.5
3684	318	427	0.75
3685	318	1540	0.25
3686	318	425	0.5
3687	318	400	0.5
3688	318	292	0.75
3689	318	1244	0.5
3690	318	1541	0.5
3691	318	619	0.5
3692	318	1542	0.949999988
3693	318	599	0.5
3694	318	1543	0.100000001
3695	318	1544	0.5
3696	318	9	0.5
3697	318	68	0.5
3698	318	568	0.100000001
3699	318	1545	0.75
3700	318	107	0.75
3701	318	1546	0.649999976
3702	318	1547	0.649999976
3703	318	16	0.5
3704	318	1548	0.649999976
3705	318	1549	0.25
3706	318	1550	0.649999976
3707	318	1551	0.100000001
3708	318	6	0.5
3709	318	1552	0.25
3710	318	237	0.5
3711	318	801	0.75
3712	318	1553	0.25
3713	318	536	0.5
3714	318	1554	0.5
3715	318	329	0.5
3716	318	1555	0.949999988
3717	318	37	0.75
3718	318	1556	0.75
3719	318	43	0.75
3720	318	597	0.75
3721	318	257	0.5
3722	318	81	0.75
3723	318	291	0.75
3724	318	1557	0.5
3725	318	480	0.649999976
3726	318	419	0.75
3727	318	1558	0.75
3728	318	1054	0.5
3729	318	270	0.75
3730	318	1559	0.25
3731	319	235	0.5
3732	319	14	0.5
3733	319	6	0.5
3734	319	715	0.5
3735	319	31	0.5
3736	319	9	0.5
3737	319	10	0.5
3738	319	68	0.5
3739	319	1	0.5
3740	319	1560	0.5
3741	319	76	0.5
3742	319	16	0.5
3743	320	1561	1
3744	320	1562	1
3745	320	10	0.75
3746	320	16	0.25
3747	320	1563	0.779999971
3748	320	12	0.5
3749	320	8	0.5
3750	320	1564	0.5
3751	320	1565	0.5
3752	320	1566	0.25
3753	320	1567	0.25
3754	320	1568	0.25
3755	320	1569	0.25
3756	320	1570	0.25
3757	320	1569	0.25
3758	321	235	0.5
3759	321	1571	0.5
3760	321	908	0.5
3761	321	68	0.5
3762	321	6	0.5
3763	321	9	0.5
3764	321	10	0.5
3765	321	1572	0.25
3766	321	1	0.5
3767	321	1573	0.5
3768	321	16	0.5
3769	322	235	0.5
3770	322	10	0.5
3771	322	236	0.5
3772	322	6	0.5
3773	322	1574	0.949999988
3774	322	237	0.5
3775	322	290	0.5
3776	322	1575	0.75
3777	322	1576	0.25
3778	322	74	0.5
3779	322	425	0.5
3780	322	1577	0.100000001
3781	322	292	0.75
3782	322	324	0.5
3783	322	37	0.75
3784	322	36	0.5
3785	322	9	0.5
3786	322	68	0.5
3787	322	79	0.5
3788	322	38	0.75
3789	322	1578	0.949999988
3790	322	419	0.5
3791	322	107	0.5
3792	322	16	0.5
3793	323	1579	0.5
3794	323	235	0.5
3795	323	1580	0.5
3796	323	6	0.5
3797	323	9	0.5
3798	323	10	0.5
3799	323	68	0.5
3800	323	16	0.5
3801	323	1581	0.5
3802	324	113	1
3803	325	113	1
3804	326	113	1
3805	327	113	1
3806	328	113	1
3807	329	113	1
3808	330	113	1
3809	331	113	1
3810	332	113	1
3811	333	113	1
3812	334	40	0.5
3813	334	1582	1
3814	335	348	0.5
3815	336	113	1
3816	337	348	0.5
3817	338	1583	0.5
3818	339	1584	1
3819	340	1584	1
3820	341	1584	1
3821	342	1584	1
3822	343	1584	1
3823	344	1584	1
3824	345	113	1
3825	345	1584	1
3826	346	113	1
3827	347	113	1
3828	348	113	1
3829	349	113	1
3830	350	113	1
3831	351	113	1
3832	352	113	1
3833	353	113	1
3834	354	1585	1
3835	355	1585	1
3836	356	1585	1
3837	357	1585	1
3838	358	1585	1
3839	359	1585	1
3840	360	1585	1
3841	361	1586	1
3842	362	1586	1
3843	363	1586	1
3844	364	1586	1
3845	364	113	1
3846	365	1586	1
3847	365	113	1
3848	366	1586	1
3849	366	113	1
3850	367	1586	1
3851	367	113	1
3852	368	113	1
3853	369	113	1
3854	370	113	1
3855	371	113	1
3856	372	113	1
3857	373	113	1
3858	374	1587	0.5
3859	375	1588	1
3860	376	1589	1
3861	377	113	1
3862	378	113	1
3863	379	113	1
3864	380	113	1
3865	381	113	1
3866	382	113	1
3867	383	113	1
3868	384	113	1
3869	385	113	1
3870	386	113	1
3871	387	113	1
3872	388	113	1
3873	389	113	1
3874	390	113	1
3875	391	113	1
3876	392	113	1
3877	393	229	1
3878	393	1590	1
3879	394	1591	0.75
3880	394	1592	0.75
3881	394	1593	0.5
3882	394	1594	0.5
3883	394	1595	0.5
3884	394	1596	0.5
3885	394	1597	0.100000001
3886	394	1598	0.75
3887	394	16	0.5
3888	394	10	0.5
3889	394	1599	0.100000001
3890	394	1600	0.100000001
3891	395	235	0.5
3892	395	1601	0.5
3893	395	304	0.5
3894	395	1602	0.5
3895	395	1603	0.5
3896	395	1604	0.5
3897	395	68	0.5
3898	395	16	0.5
3899	395	1330	0.5
3900	395	1605	0.5
3901	395	6	0.5
3902	395	10	0.5
3903	395	1606	0.5
3904	395	79	0.5
3905	395	9	0.5
3906	396	1607	1
3907	396	1608	1
3908	396	427	1
3909	396	1609	1
3910	396	1610	0.75
3911	397	1611	0.949999988
3912	397	53	0.5
3913	397	291	0.5
3914	397	292	0.75
3915	397	401	0.899999976
3916	397	71	0.75
3917	397	1612	0.5
3918	397	1613	0.600000024
3919	397	1207	0.5
3920	397	395	0.5
3921	397	844	0.5
3922	397	1614	0.5
3923	397	1615	0.0500000007
3924	397	1616	0.00100000005
3925	397	681	0.0500000007
3926	397	40	0.0160000008
3927	397	461	0.00499999989
3928	397	1617	0.5
3929	397	1618	0.023
3930	398	1611	0.949999988
3931	398	1619	0.949999988
3932	398	461	0.899999976
3933	398	1620	0.0500000007
3934	398	1621	0.800000012
3935	398	971	0.699999988
3936	398	293	0.600000024
3937	398	844	0.600000024
3938	399	1622	0.899999976
3939	399	1623	0.899999976
3940	399	1624	0.75
3941	399	1625	0.75
3942	399	1626	0.5
3943	399	1627	0.75
3944	399	1628	0.5
3945	399	1629	0.317999989
3946	400	1630	0.5
3947	401	1631	0.5
3948	401	1632	0.5
3949	401	1633	0.5
3950	401	1634	0.5
3951	401	1635	0.899999976
3952	402	1636	0.75
3953	402	1637	0.75
3954	402	1638	0.5
3955	402	1639	1
3956	402	181	0.75
3957	403	229	0.899999976
3958	404	235	0.5
3959	404	499	0.5
3960	404	422	0.5
3961	404	1640	0.5
3962	404	6	0.5
3963	404	1295	0.5
3964	404	1641	0.5
3965	404	10	0.5
3966	404	1642	0.25
3967	404	1643	0.5
3968	404	1290	0.5
3969	404	292	0.5
3970	404	37	0.5
3971	404	1644	0.5
3972	404	36	0.5
3973	404	1645	0.5
3974	404	9	0.5
3975	404	68	0.5
3976	404	33	0.5
3977	404	38	0.5
3978	404	802	0.5
3979	404	1618	0.5
3980	404	1646	0.5
3981	404	16	0.5
3982	405	235	0.5
3983	405	14	0.75
3984	405	236	0.5
3985	405	6	0.5
3986	405	1647	0.100000001
3987	405	37	0.75
3988	405	237	0.5
3989	405	10	0.5
3990	405	1117	0.75
3991	405	1648	0.949999988
3992	405	292	0.75
3993	405	618	0.649999976
3994	405	597	0.100000001
3995	405	36	0.100000001
3996	405	53	0.75
3997	405	9	0.5
3998	405	1649	0.949999988
3999	405	68	0.75
4000	405	107	0.75
4001	405	1650	0.25
4002	405	681	0.75
4003	405	16	0.5
4004	406	40	0.75
4005	406	122	0.75
4006	406	277	0.75
4007	406	1651	0.5
4008	406	1652	0.5
4009	406	37	0.75
4010	406	81	0.75
4011	406	53	0.75
4012	406	82	0.5
4013	406	1653	0.25
4014	406	861	0.25
4015	406	1654	0.25
4016	406	619	0.25
4017	406	1655	0.75
4018	406	1656	0.899999976
4019	407	1657	0.5
4020	407	37	0.75
4021	407	290	0.75
4022	407	15	0.5
4023	407	292	0.5
4024	407	1658	0.75
4025	407	1659	0.5
4026	407	1660	0.5
4027	407	1661	0.5
4028	407	1662	0.5
4029	407	861	0.25
4030	407	1554	0.25
4031	407	1663	0.25
4032	407	1664	0.25
4033	407	1665	0.25
4034	407	1666	0.25
4035	407	8	0.25
4036	407	10	0.5
4037	407	16	0.5
4038	408	37	0.899999976
4039	408	1667	0.25
4040	408	1668	0.5
4041	408	1669	0.25
4042	408	417	0.5
4043	408	1670	0.699999988
4044	408	12	0.75
4045	408	163	0.5
4046	408	15	0.5
4047	408	122	0.5
4048	408	161	0.5
4049	408	250	0.5
4050	408	635	0.5
4051	408	1671	0.5
4052	408	8	0.5
4053	408	1672	0.5
4054	408	42	0.5
4055	408	659	0.5
4056	409	235	0.5
4057	409	1673	0.5
4058	409	125	0.5
4059	409	1674	0.75
4060	409	722	0.5
4061	409	1675	0.25
4062	409	1676	0.25
4063	409	1677	0.25
4064	409	1678	0.5
4065	410	1679	0.75
4066	410	235	0.5
4067	410	1680	0.75
4068	410	1681	0.75
4069	410	1250	0.25
4070	410	236	0.5
4071	410	6	0.5
4072	410	1308	0.75
4073	410	1682	0.75
4074	410	1253	0.649999976
4075	410	237	0.5
4076	410	9	0.5
4077	410	10	0.5
4078	410	68	0.5
4079	410	1683	0.75
4080	410	1684	0.75
4081	410	16	0.5
4082	410	1685	0.75
4083	410	13	0.25
4084	410	126	0.75
4085	411	1686	1
4086	411	661	0.899999976
4087	411	40	0.75
4088	411	1687	0.660000026
4089	412	235	0.25
4090	412	122	0.5
4091	412	6	0.5
4092	412	36	0.5
4093	412	9	0.5
4094	412	10	0.5
4095	412	68	0.25
4096	412	33	0.5
4097	412	314	0.5
4098	412	74	0.5
4099	412	304	0.5
4100	412	913	0.5
4101	412	16	0.5
4102	413	1688	1
4103	414	8	1
4104	414	12	0.899999976
4105	414	1689	0.75
4106	414	1690	0.800000012
4107	414	442	0.5
4108	415	434	0.800000012
4109	415	18	0.800000012
4110	415	463	0.400000006
4111	415	1691	0.699999988
4112	415	1692	0.200000003
4113	415	40	0.800000012
4114	415	1693	0.800000012
4115	415	122	0.800000012
4116	415	703	0.600000024
4117	415	291	0.899999976
4118	415	445	0.400000006
4119	415	1694	0.600000024
4120	415	1695	0.600000024
4121	415	681	0.600000024
4122	416	40	0.800000012
4123	416	1693	0.800000012
4124	416	122	0.800000012
4125	416	703	0.600000024
4126	416	291	0.899999976
4127	416	445	0.400000006
4128	416	79	0.699999988
4129	416	1694	0.600000024
4130	416	1695	0.600000024
4131	416	681	0.600000024
4132	417	4	0.5
4133	417	6	0.5
4134	417	1588	0.5
4135	417	9	0.5
4136	417	10	0.5
4137	417	18	0.5
4138	417	21	0.5
4139	417	948	0.5
4140	417	16	0.5
4141	417	292	0.5
4142	418	1696	0.800000012
4143	418	1084	0.800000012
4144	418	1697	0.800000012
4145	418	1698	0.800000012
4146	418	1699	0.800000012
4147	418	1700	0.5
4148	418	1701	0.400000006
4149	418	1702	0.400000006
4150	419	235	0.5
4151	419	10	0.5
4152	419	6	0.5
4153	419	9	0.5
4154	419	1703	0.5
4155	419	68	0.5
4156	419	16	0.5
4157	419	1704	0.5
4158	419	1705	0.5
4159	419	1706	0.5
4160	419	1707	0.5
4161	420	1708	0.5
4162	420	1709	0.75
4163	420	231	0.899999976
4164	420	1366	0.899999976
4165	420	1710	0.5
4166	420	1711	0.150000006
4167	420	1712	0.850000024
4168	420	76	0.5
4169	420	105	0.5
4170	420	1713	0.5
4171	420	14	0.25
4172	420	82	0.25
4173	420	1714	0.5
4174	420	1715	0.00999999978
4175	420	536	0.0799999982
4176	420	107	0.0599999987
4177	420	419	0.0500000007
4178	420	1716	0.769999981
4179	420	1717	0.709999979
4180	420	1364	0.25
4181	420	1718	0.899999976
4182	420	16	0.5
4183	420	10	0.5
4184	421	1719	0.899999976
4185	421	1720	0.800000012
4186	421	1721	0.699999988
4187	421	1722	0.5
4188	422	1723	0.100000001
4189	422	1724	0.800000012
4190	422	1725	0.800000012
4191	422	1726	0.800000012
4192	422	1727	0.899999976
4193	422	1129	0.699999988
4194	422	1728	0.5
4195	422	1729	0.5
4196	422	1730	0.699999988
4197	422	1731	0.600000024
4198	422	1732	0.899999976
4199	422	1733	0.400000006
4200	423	229	0.899999976
4201	423	43	0.899999976
4202	423	1734	0.899999976
4203	423	1735	0.75
4204	423	395	0.75
4205	423	1736	0.600000024
4206	423	1737	0.600000024
4207	423	1738	0.600000024
4208	423	1739	0.75
4209	423	1740	0.600000024
4210	423	1741	0.75
4211	423	1742	0.75
4212	423	1743	0.75
4213	423	1744	0.75
4214	424	14	0.5
4215	424	6	0.5
4216	424	9	0.5
4217	424	10	0.5
4218	424	68	0.5
4219	424	1	0.5
4220	424	16	0.5
4221	424	687	0.5
4222	424	1694	0.5
4223	424	74	0.5
4224	424	1384	0.5
4225	424	1745	0.5
4226	424	1746	0.5
4227	424	378	0.5
4228	425	235	0.5
4229	425	37	0.75
4230	425	1747	0.75
4231	425	236	0.5
4232	425	1748	1
4233	425	6	0.5
4234	425	60	0.75
4235	425	1749	0.75
4236	425	237	0.5
4237	425	9	0.5
4238	425	10	0.5
4239	425	68	0.5
4240	425	1750	0.75
4241	425	1751	0.75
4242	425	1752	0.75
4243	425	16	0.5
4244	425	1753	0.75
4245	425	1754	0.649999976
4246	425	1755	0.75
4247	426	1756	0.5
4248	426	1757	0.5
4249	426	1294	0.75
4250	426	37	0.75
4251	426	291	0.75
4252	426	53	0.75
4253	426	292	0.75
4254	426	419	0.75
4255	426	619	0.5
4256	426	566	0.5
4257	426	1758	0.25
4258	426	1759	0.25
4259	426	1760	0.5
4260	426	1761	0.180000007
4261	426	1762	0.769999981
4262	426	16	0.5
4263	426	10	0.5
4264	426	1763	0.5
4265	427	37	1
4266	427	1764	0.75
4267	427	1765	0.25
4268	428	1766	0.899999976
4269	428	1767	0.75
4270	428	303	0.75
4271	428	1618	0.75
4272	428	90	0.75
4273	428	1768	0.75
4274	429	1769	0.899999976
4275	429	1770	0.899999976
4276	429	1771	0.899999976
4277	429	948	0.400000006
4278	429	1772	0.200000003
4279	429	1554	0.0500000007
4280	429	1773	0.0500000007
4281	429	1774	0.200000003
4282	429	1775	0.899999976
4283	430	24	0.800000012
4284	430	24	0.800000012
4285	430	40	0.899999976
4286	430	79	0.899999976
4287	430	1776	0.800000012
4288	430	1777	0.699999988
4289	430	1778	0.600000024
4290	430	1779	0.5
4291	430	304	0.400000006
4292	431	1780	1
4293	431	1278	1
4294	431	235	1
4295	432	1781	1
4296	432	1278	1
4297	432	235	1
4298	433	235	0.5
4299	433	10	0.5
4300	433	6	0.5
4301	433	181	0.5
4302	433	9	0.5
4303	433	1782	0.5
4304	433	68	0.5
4305	433	1783	0.5
4306	433	1784	1
4307	433	16	0.5
4308	433	181	0.5
4309	434	1785	0.75
4310	434	36	0.75
4311	434	1786	0.75
4312	434	1787	0.75
4313	434	1788	0.75
4314	434	1789	0.75
4315	434	971	0.5
4316	434	1197	0.5
4317	434	1790	0.5
4318	435	1791	0.899999976
4319	435	1084	0.5
4320	435	1792	0.5
4321	435	293	0.5
4322	435	292	0.5
4323	435	1793	0.5
4324	435	1794	0.5
4325	435	1795	0.5
4326	435	1796	0.930000007
4327	436	1797	1
4328	436	10	0.660000026
4329	436	16	0.330000013
4330	436	1798	0.850000024
4331	436	722	0.75
4332	436	292	0.25
4333	436	1799	0.100000001
4334	436	1800	0.100000001
4335	436	1801	0.100000001
4336	437	1802	1
4337	438	1803	0.25
4338	438	434	0.25
4339	438	1804	0.25
4340	438	24	0.25
4341	438	13	0.25
4342	438	1805	0.100000001
4343	439	292	0.5
4344	439	235	0.25
4345	439	6	0.5
4346	439	1270	0.5
4347	439	9	0.5
4348	439	10	0.5
4349	439	68	0.25
4350	439	461	0.5
4351	439	1806	0.5
4352	439	16	0.5
4353	439	1770	0.5
4354	439	1807	0.5
4355	439	1808	0.5
4356	439	21	0.5
4357	440	1809	1
4358	440	1810	0.5
4359	441	379	0.75
4360	441	1811	0.25
4361	441	619	0.0500000007
4362	442	1812	1
4363	442	1813	0.100000001
4364	443	89	0.899999976
4365	443	229	0.99000001
4366	443	1814	0.899999976
4367	443	395	0.899999976
4368	443	115	0.899999976
4369	443	950	0.899999976
4370	443	1815	0.899999976
4371	443	1816	0.899999976
4372	444	971	0.899999976
4373	444	1817	0.899999976
4374	444	191	0.899999976
4375	444	261	0.899999976
4376	444	1818	0.899999976
4377	444	90	0.899999976
4378	444	261	0.899999976
4379	444	1818	0.899999976
4380	444	90	0.899999976
4381	445	235	0.5
4382	445	1819	0.5
4383	445	122	0.5
4384	445	82	0.5
4385	445	594	0.5
4386	445	10	0.5
4387	445	427	0.5
4388	445	1820	0.5
4389	445	425	0.5
4390	445	1821	0.5
4391	445	292	0.5
4392	445	427	0.5
4393	445	387	0.5
4394	445	9	0.5
4395	445	68	0.5
4396	445	1822	0.5
4397	445	568	0.5
4398	445	564	0.5
4399	445	1823	0.5
4400	445	105	0.5
4401	445	922	0.5
4402	445	1824	0.5
4403	445	1825	0.5
4404	445	16	0.5
4405	445	1826	0.5
4406	445	1827	0.5
4407	445	6	0.5
4408	445	1828	0.5
4409	445	1829	0.5
4410	445	1523	0.5
4411	445	314	0.5
4412	445	74	0.5
4413	445	1830	0.5
4414	445	37	0.5
4415	445	547	0.5
4416	445	1831	0.5
4417	445	36	0.5
4418	445	291	0.5
4419	445	1832	0.5
4420	445	1833	0.5
4421	445	1834	0.5
4422	445	1835	0.5
4423	445	15	0.25
4424	446	892	0.899999976
4425	446	1836	1
4426	447	235	0.5
4427	447	236	0.5
4428	447	1837	0.75
4429	447	6	0.5
4430	447	1838	0.25
4431	447	237	0.5
4432	447	9	0.5
4433	447	10	0.5
4434	447	68	0.5
4435	447	1839	0.949999988
4436	447	1840	0.75
4437	447	1841	1
4438	447	16	0.5
4439	448	235	0.5
4440	448	236	0.5
4441	448	6	0.5
4442	448	37	1
4443	448	237	0.5
4444	448	1223	0.5
4445	448	10	0.5
4446	448	1842	0.75
4447	448	425	0.75
4448	448	536	0.75
4449	448	292	0.75
4450	448	324	0.75
4451	448	1843	0.75
4452	448	597	0.75
4453	448	1844	0.75
4454	448	1845	0.649999976
4455	448	9	0.5
4456	448	68	0.5
4457	448	1846	0.949999988
4458	448	419	0.75
4459	448	291	0.75
4460	448	16	0.5
4461	448	1847	0
4462	449	1848	0.800000012
4463	449	71	0.800000012
4464	449	1849	0.75
4465	449	72	0.800000012
4466	449	229	0.899999976
4467	450	1850	0.899999976
4468	450	1851	0.800000012
4469	450	1852	0.699999988
4470	450	1853	0.800000012
4471	450	1854	0.600000024
4472	450	1855	0.800000012
4473	450	1856	0.800000012
4474	450	1857	0.699999988
4475	450	1858	0.699999988
4476	450	1859	0.699999988
4477	450	1860	0.600000024
4478	451	235	0.5
4479	451	236	0.5
4480	451	6	0
4481	451	237	0.5
4482	451	9	0
4483	451	10	0.5
4484	451	68	0
4485	451	1861	1
4486	451	555	0.75
4487	451	536	0.75
4488	451	16	0.5
4489	452	502	0.5
4490	452	16	0.5
4491	452	9	0.5
4492	452	10	0.5
4493	452	504	0.5
4494	452	838	0.5
4495	452	1862	0.5
4496	452	6	0.5
4497	453	1863	0.25
4498	453	235	0.5
4499	453	1864	0.75
4500	453	1865	0.75
4501	453	236	0.5
4502	453	6	0.5
4503	453	107	0.75
4504	453	535	0.5
4505	453	237	0.5
4506	453	10	0.5
4507	453	1866	0.75
4508	453	258	0.5
4509	453	1867	0.75
4510	453	1868	0.100000001
4511	453	37	0.100000001
4512	453	1869	0.649999976
4513	453	1870	0.75
4514	453	599	0.75
4515	453	9	0.5
4516	453	1465	0.75
4517	453	68	0.5
4518	453	79	0.75
4519	453	88	0.5
4520	453	16	0.5
4521	453	1871	0.949999988
4522	453	1520	0.5
4523	453	1872	0.949999988
4524	453	555	1
4525	453	393	0.5
4526	453	1873	0.25
4527	454	1874	0.899999976
4528	454	132	0.899999976
4529	454	249	1
4530	454	1430	0.600000024
4531	455	77	0.75
4532	455	1875	0.75
4533	455	427	0.5
4534	455	1876	0.5
4535	455	1877	0.5
4536	455	82	1
4537	456	235	0
4538	456	68	0.5
4539	456	236	0.5
4540	456	6	0.5
4541	456	1878	0.949999988
4542	456	237	0.5
4543	456	10	0.75
4544	456	76	0.75
4545	456	74	0.75
4546	456	1879	0.75
4547	456	1880	0.5
4548	456	12	0.75
4549	456	77	0.75
4550	456	1881	0.649999976
4551	456	1882	1
4552	456	37	1
4553	456	39	0.75
4554	456	1883	0.75
4555	456	36	0.75
4556	456	9	0.5
4557	456	1884	0.75
4558	456	33	0.75
4559	456	1885	0.949999988
4560	456	8	0.75
4561	456	1545	0.75
4562	456	1886	0.75
4563	456	71	0.75
4564	456	16	0.5
4565	456	15	0.75
4566	457	1882	1
4567	457	235	0
4568	457	37	0.75
4569	457	1885	0.949999988
4570	457	236	0.5
4571	457	33	0.75
4572	457	68	0.5
4573	457	74	0.75
4574	457	6	0.5
4575	457	36	0.75
4576	457	1879	0.75
4577	457	237	0.5
4578	457	9	0.5
4579	457	10	0.75
4580	457	1884	0.75
4581	457	1880	0.5
4582	457	1878	0.949999988
4583	457	1883	0.75
4584	457	16	0.5
4585	457	1881	0.649999976
4586	458	14	0.899999976
4587	458	1882	0.899999976
4588	458	75	0.899999976
4589	458	724	0.600000024
4590	458	37	0.899999976
4591	458	317	0.800000012
4592	458	318	0.800000012
4593	458	250	0.899999976
4594	459	1887	0.200000003
4595	459	722	0.899999976
4596	459	1888	0.200000003
4597	459	33	0.200000003
4598	459	108	0.200000003
4599	459	1878	0.100000001
4600	459	10	0.699999988
4601	459	16	0.300000012
4602	460	235	0.5
4603	460	46	0.75
4604	460	1889	0.75
4605	460	236	0.5
4606	460	1890	0.5
4607	460	6	0.5
4608	460	162	0.5
4609	460	1891	0.75
4610	460	1892	0.5
4611	460	237	0.5
4612	460	10	0.5
4613	460	15	0.75
4614	460	1666	0.75
4615	460	37	0.100000001
4616	460	1893	0.25
4617	460	36	0.75
4618	460	9	0.5
4619	460	68	0.5
4620	460	1894	0.75
4621	460	1895	0.75
4622	460	840	1
4623	460	1896	0.949999988
4624	460	800	0.75
4625	460	1897	0.75
4626	460	377	1
4627	460	16	0.5
4628	460	378	0.5
4629	461	235	0.5
4630	461	908	0.5
4631	461	6	0.5
4632	461	9	0.5
4633	461	10	0.5
4634	461	68	0.5
4635	461	1	0.5
4636	461	1898	0.5
4637	461	425	0.5
4638	461	16	0.5
4639	461	1899	0.5
4640	462	1900	1
4641	462	277	0.99000001
4642	462	1901	0.949999988
4643	462	1902	0.899999976
4644	462	1903	0.899999976
4645	462	1904	0.899999976
4646	462	1905	0.899999976
4647	463	1906	0.949999988
4648	463	1907	0.949999988
4649	464	1908	0.5
4650	464	1909	0.25
4651	464	1910	0.899999976
4652	464	1911	0.899999976
4653	464	1912	0.930000007
4654	464	1913	0.560000002
4655	464	1914	0.400000006
4656	464	1915	0.75
4657	464	1916	0.25
4658	465	1917	1
4659	466	1918	1
4660	467	1919	1
4661	467	353	0.5
4662	467	1920	0.75
4663	467	1921	0.75
4664	467	1922	0.75
4665	467	247	0.25
4666	467	1923	0.25
4667	467	1924	0.389999986
4668	468	1769	0.5
4669	468	1925	0.5
4670	468	1926	0.5
4671	469	247	0.75
4672	469	1927	0.899999976
4673	469	1928	0.5
4674	469	1719	0.75
4675	470	247	0.75
4676	470	1719	0.75
4677	470	1929	0.5
4678	470	1930	0.5
4679	471	1931	1
4680	471	1932	0.75
4681	472	1933	0.75
4682	472	1934	0.5
4683	472	1935	0.5
4684	472	1936	0.5
4685	472	1937	0.5
4686	473	235	0.5
4687	473	1253	0.949999988
4688	473	1250	0.100000001
4689	473	236	0.5
4690	473	6	0.5
4691	473	1938	0.75
4692	473	237	0.5
4693	473	9	0.5
4694	473	10	0.5
4695	473	68	0.5
4696	473	1939	0.5
4697	473	1940	0.75
4698	473	1941	0.75
4699	473	1942	0.75
4700	473	16	0.5
4701	473	1943	0.75
4702	474	1944	1
4703	475	1945	0.899999976
4704	475	1946	0.949999988
4705	475	1947	0.899999976
4706	475	896	0.5
4707	475	1948	0.5
4708	475	1949	0.100000001
4709	476	724	0.949999988
4710	476	1950	0.899999976
4711	476	33	0.899999976
4712	476	36	0.899999976
4713	476	834	0.699999988
4714	476	53	0.800000012
4715	476	37	0.400000006
4716	476	83	0.200000003
4717	476	420	0.0500000007
4718	476	395	0.200000003
4719	477	1951	0.670000017
4720	477	1952	0.330000013
4721	477	1953	1
4722	477	1954	0.879999995
4723	477	1955	0.600000024
4724	477	1956	0.949999988
4725	477	1957	0.699999988
4726	477	1958	0.5
4727	477	1959	0.200000003
4728	477	892	0.800000012
4729	478	1960	0.949999988
4730	478	1961	0.899999976
4731	478	1962	0.899999976
4732	479	1963	0.949999988
4733	479	1964	0.899999976
4734	480	1965	0.899999976
4735	480	1966	0.400000006
4736	480	14	0.899999976
4737	480	1967	0.800000012
4738	481	1968	0.600000024
4739	481	1969	0.200000003
4740	481	1970	0.200000003
4741	481	1971	1
4742	481	1972	1
4743	481	1973	1
4744	481	1974	0.600000024
4745	481	1975	0.699999988
4746	481	1976	0.400000006
4747	481	1977	0.5
4748	481	1978	0.200000003
4749	482	1979	0.949999988
4750	482	40	0.99000001
4751	482	291	0.899999976
4752	482	1150	0.899999976
4753	482	122	0.800000012
4754	482	239	0.800000012
4755	482	16	0.75
4756	482	10	0.25
4757	483	16	0.899999976
4758	483	10	0.100000001
4759	483	531	1
4760	483	425	0.370000005
4761	483	79	0.25
4762	483	40	0.25
4763	484	1081	0.800000012
4764	484	1980	0.899999976
4765	484	1981	0.899999976
4766	484	1982	0.699999988
4767	484	1983	0.699999988
4768	484	410	0.899999976
4769	484	261	0.800000012
4770	484	1984	0.800000012
4771	484	1985	0.800000012
4772	485	1984	0.829999983
4773	485	292	0.829999983
4774	485	1986	0.75
4775	485	1987	0.75
4776	485	1988	0.75
4777	485	1989	1
4778	485	1990	0.75
4779	485	1991	0.5
4780	485	1992	0.5
4781	486	1993	0.5
4782	486	415	0.25
4783	486	1994	0.25
4784	486	1995	0.25
4785	486	722	0.5
4786	486	1996	0.5
4787	486	33	0.25
4788	486	36	0.25
4789	486	1997	0.75
4790	486	1998	0.100000001
4791	486	1999	0.100000001
4792	486	2000	0.100000001
4793	487	2001	0.899999976
4794	487	2002	0.75
4795	487	2003	0.75
4796	487	2004	0.75
4797	487	251	0.5
4798	487	2005	0.25
4799	488	427	0.75
4800	488	717	0.25
4801	488	77	0.5
4802	488	719	0.5
4803	488	71	0.5
4804	488	715	0.5
4805	488	723	0.5
4806	488	105	0.5
4807	488	76	0.25
4808	488	720	0.25
4809	488	716	0.25
4810	488	2006	0.25
4811	488	395	0.5
4812	488	291	0.5
4813	488	2007	0.5
4814	488	2008	0.5
4815	488	2009	0.5
4816	488	2010	0.5
4817	488	2011	0.5
4818	488	2012	0.5
4819	488	2013	0.5
4820	488	548	0.5
4821	488	431	0.5
4822	489	2014	1
4823	489	2015	0.5
4824	489	2016	0.75
4825	489	2017	0.899999976
4826	489	900	0.899999976
4827	489	122	0.25
4828	489	2018	0.25
4829	489	475	0.5
4830	489	291	0.25
4831	489	2019	0.25
4832	489	442	0.25
4833	489	434	0.5
4834	489	2020	0.25
4835	489	2021	0.25
4836	489	2022	0.5
4837	489	2023	0.25
4838	489	549	0.25
4839	489	1666	0.25
4840	490	235	0
4841	490	37	0.5
4842	490	428	0.5
4843	490	83	0.5
4844	490	82	0.5
4845	490	361	0.5
4846	490	431	0.5
4847	490	291	0.5
4848	490	6	0.5
4849	490	10	0.5
4850	490	68	0
4851	490	2024	0.5
4852	490	16	0.5
4853	490	9	0.5
4854	491	2025	0.75
4855	491	68	0.75
4856	491	253	0.5
4857	491	2026	0.5
4858	491	2027	0.25
4859	491	2028	0.25
4860	491	2029	0.25
4861	492	1984	0.829999983
4862	492	292	0.829999983
4863	492	1986	0.75
4864	492	1987	0.75
4865	492	1988	0.75
4866	492	1989	1
4867	492	1990	0.75
4868	492	1991	0.5
4869	492	1992	0.5
4870	492	2030	0.5
4871	493	2031	0.75
4872	493	235	0.5
4873	493	2032	0.25
4874	493	236	0.5
4875	493	2033	0.75
4876	493	2034	0.75
4877	493	6	0.5
4878	493	2035	0.649999976
4879	493	2036	0.75
4880	493	237	0.5
4881	493	9	0.5
4882	493	10	0.5
4883	493	68	0.5
4884	493	2037	0.949999988
4885	493	16	0.5
4886	494	511	0.75
4887	494	523	0.75
4888	494	2038	0.75
4889	494	70	0.100000001
4890	494	2039	0.100000001
4891	494	2040	0.75
4892	494	37	0.25
4893	494	971	0.25
4894	494	2041	0.5
4895	494	2042	0.25
4896	495	2043	0.899999976
4897	495	2044	0.5
4898	495	386	0.5
4899	495	2045	0.75
4900	495	2046	0.75
4901	495	2047	0.0500000007
4902	495	2048	0.25
4903	496	722	0.400000006
4904	496	291	0.340000004
4905	496	53	0.0299999993
4906	496	82	0.200000003
4907	496	702	0.150000006
4908	496	239	0.150000006
4909	496	2049	0.209999993
4910	496	105	0.5
4911	496	2050	0.5
4912	496	2051	0.600000024
4913	496	2052	0.25
4914	496	2053	0.899999976
4915	496	2054	1
4916	496	2055	1
4917	497	1358	0.75
4918	497	2056	0.0850000009
4919	497	2057	0.0799999982
4920	497	16	0.550000012
4921	497	10	0.449999988
4922	497	68	0.99000001
4923	497	291	0.800000012
4924	497	2058	0.800000012
4925	497	37	0.800000012
4926	497	2059	0.800000012
4927	497	869	0.800000012
4928	498	2060	0.699999988
4929	498	427	0.699999988
4930	498	82	0.699999988
4931	498	14	0.699999988
4932	498	105	0.699999988
4933	498	361	0.800000012
4934	498	869	0.800000012
4935	498	2061	0.699999988
4936	498	597	0.699999988
4937	498	2062	0.5
4938	498	191	0.5
4939	499	2063	0.75
4940	499	511	0.400000006
4941	499	1818	0.400000006
4942	499	2064	0.230000004
4943	499	191	0.150000006
4944	499	71	0.100000001
4945	499	722	0.0500000007
4946	499	2065	1
4947	500	1973	1
4948	500	365	0.899999976
4949	500	410	0.899999976
4950	500	2066	0.899999976
4951	500	88	0.699999988
4952	500	79	0.699999988
4953	500	292	0.699999988
4954	501	473	1
4955	501	329	1
4956	501	1016	0.600000024
4957	501	434	0.899999976
4958	501	475	0.899999976
4959	501	2067	0.400000006
4960	501	42	0.400000006
4961	501	2068	0.899999976
4962	501	1973	1
4963	502	2069	0.800000012
4964	502	2070	0.5
4965	502	434	0.699999988
4966	502	2071	0.600000024
4967	502	473	1
4968	502	329	1
4969	502	1016	0.600000024
4970	502	434	0.899999976
4971	502	475	0.899999976
4972	502	2067	0.400000006
4973	502	42	0.400000006
4974	502	2068	0.899999976
4975	502	1973	1
4976	503	473	1
4977	503	329	1
4978	503	1016	0.600000024
4979	503	434	0.899999976
4980	503	475	0.899999976
4981	503	2067	0.400000006
4982	503	42	0.400000006
4983	503	2068	0.899999976
4984	503	1973	1
4985	503	2072	0.699999988
4986	503	2073	0.699999988
4987	503	2074	0.800000012
4988	504	473	1
4989	504	329	1
4990	504	1016	0.600000024
4991	504	434	0.899999976
4992	504	475	0.899999976
4993	504	2067	0.400000006
4994	504	42	0.400000006
4995	504	2068	0.899999976
4996	504	1973	1
4997	504	2072	0.699999988
4998	504	2073	0.699999988
4999	504	2074	0.800000012
5000	505	473	1
5001	505	329	1
5002	505	1016	0.600000024
5003	505	434	0.899999976
5004	505	475	0.899999976
5005	505	2067	0.400000006
5006	505	42	0.400000006
5007	505	2068	0.899999976
5008	505	1973	1
5009	505	1358	0.699999988
5010	506	473	1
5011	506	329	1
5012	506	1016	0.600000024
5013	506	434	0.899999976
5014	506	475	0.899999976
5015	506	2067	0.400000006
5016	506	42	0.400000006
5017	506	2068	0.899999976
5018	506	1973	1
5019	506	2072	0.699999988
5020	506	2073	0.699999988
5021	506	2074	0.800000012
5022	507	2075	0.300000012
5023	507	2076	0.75
5024	507	2077	0.25
5025	507	473	0.5
5026	507	900	0.5
5027	507	2078	0.899999976
5028	507	2079	0.5
5029	507	2080	0.25
5030	507	2081	0.150000006
5031	507	2067	0.25
5032	507	2082	0.5
5033	507	434	0.800000012
5034	508	2079	0.75
5035	508	2083	0.75
5036	508	2084	0.75
5037	508	1016	0.75
5038	508	1804	0.75
5039	508	2085	0.330000013
5040	508	703	0.5
5041	508	434	0.75
5042	509	2076	0.75
5043	509	2077	0.25
5044	509	473	0.5
5045	509	900	0.5
5046	509	2078	0.899999976
5047	509	2079	0.5
5048	509	2080	0.25
5049	509	2081	0.150000006
5050	509	2067	0.25
5051	509	2082	0.5
5052	509	434	0.800000012
5053	510	24	0.5
5054	510	6	0.5
5055	510	280	0.5
5056	510	9	0.5
5057	510	10	0.5
5058	510	79	0.5
5059	510	40	0.5
5060	510	40	0.5
5061	510	80	0.5
5062	510	24	0.5
5063	510	304	0.5
5064	510	16	0.5
5065	511	2086	1
5066	511	2087	0.75
5067	511	2088	0.75
5068	511	163	0.5
5069	511	40	0.75
5070	512	2086	1
5071	512	2087	0.75
5072	512	2088	0.75
5073	512	2089	0.75
5074	512	163	0.5
5075	512	2090	0.5
5076	512	2091	0.5
5077	512	40	0.75
5078	513	68	0.75
5079	513	2092	0.5
5080	513	37	0.5
5081	513	499	0.5
5082	513	33	0.5
5083	513	3	0.5
5084	513	94	0.5
5085	513	434	0.5
5086	513	2093	0.5
5087	513	2094	0.25
5088	513	36	0.5
5089	514	2095	1
5090	514	229	0.899999976
5091	514	2096	0.75
5092	514	2097	0.5
5093	514	2098	0.75
5094	514	2099	0.25
5095	514	2100	0.100000001
5096	515	1984	0.829999983
5097	515	292	0.829999983
5098	515	1986	0.75
5099	515	1987	0.75
5100	515	1988	0.75
5101	515	1989	1
5102	515	1990	0.75
5103	515	1991	0.5
5104	515	1992	0.5
5105	515	2030	0.5
5106	516	2101	0.75
5107	516	2102	0.5
5108	516	2103	0.75
5109	516	2104	0.75
5110	516	2105	0.75
5111	516	2106	0.75
5112	516	1973	1
5113	517	2107	1
5114	518	2108	0.800000012
5115	518	492	0.800000012
5116	518	415	0.600000024
5117	518	2109	0.800000012
5118	518	493	0.699999988
5119	518	494	0.400000006
5120	519	53	0.699999988
5121	519	395	0.699999988
5122	519	722	0.600000024
5123	519	77	0.400000006
5124	519	76	0.400000006
5125	520	1973	1
5126	520	149	0.600000024
5127	520	88	0.699999988
5128	520	79	0.699999988
5129	520	292	0.699999988
5130	520	37	0.699999988
5131	521	247	1
5132	521	2110	1
5133	522	2111	0.600000024
5134	522	2112	0.600000024
5135	522	2113	0.600000024
5136	522	2114	0.5
5137	522	2115	0.5
5138	522	2073	0.800000012
5139	522	2072	0.800000012
5140	523	2116	0.75
5141	523	2117	0.400000006
5142	523	2118	0.400000006
5143	523	2119	0.25
5144	523	2120	0.5
5145	523	505	0.600000024
5146	523	2121	0.600000024
5147	523	2122	0.600000024
5148	523	1973	1
5149	524	82	0.899999976
5150	524	37	0.800000012
5151	524	81	0.800000012
5152	524	79	0.800000012
5153	524	280	0.800000012
5154	524	308	0.800000012
5155	524	2123	0.800000012
5156	525	37	0.75999999
5157	525	1973	1
5158	525	79	0.730000019
5159	525	277	0.439999998
5160	525	291	0.389999986
5161	525	40	0.319999993
5162	525	38	0.289999992
5163	525	1369	0.25999999
5164	525	81	0.600000024
5165	525	82	0.600000024
5166	525	1018	0.400000006
5167	525	419	0.400000006
5168	525	555	0.949999988
5169	526	37	0.800000012
5170	526	2124	0.899999976
5171	526	2125	0.800000012
5172	526	2126	0.800000012
5173	526	107	0.600000024
5174	526	79	0.800000012
5175	526	277	0.5
5176	526	40	0.600000024
5177	526	2127	0.800000012
5178	526	2128	0.800000012
5179	526	2129	0.899999976
5180	526	2130	0.899999976
5181	527	2131	1
5182	527	2132	0.800000012
5183	527	2133	0.600000024
5184	527	1232	0.400000006
5185	528	2066	0.75
5186	528	365	0.75
5187	528	410	0.75
5188	528	2134	0.75
5189	528	2135	0.25
5190	529	2066	0.75
5191	529	365	0.75
5192	529	410	0.75
5193	529	2134	0.75
5194	529	2135	0.25
5195	530	2103	0.75
5196	530	2104	0.75
5197	530	2105	0.75
5198	530	2106	0.75
5199	530	2136	0.5
5200	531	2137	0.75
5201	531	2138	0.75
5202	531	68	0.75
5203	531	2139	0.5
5204	531	70	0.25
5205	531	2140	0.25
5206	531	191	0.25
5207	531	2141	0.25
5208	531	2142	0.75
5209	531	2143	0.300000012
5210	531	2144	0.899999976
5211	531	2145	0.899999976
5212	532	1984	0.829999983
5213	532	292	0.829999983
5214	532	1986	0.75
5215	532	1987	0.75
5216	532	1988	0.75
5217	532	1989	1
5218	532	1990	0.75
5219	532	1991	0.5
5220	532	1992	0.5
5221	533	1984	0.829999983
5222	533	292	0.829999983
5223	533	1986	0.75
5224	533	1987	0.75
5225	533	1988	0.75
5226	533	1989	1
5227	533	1990	0.75
5228	533	1991	0.5
5229	533	1992	0.5
5230	533	2146	0.5
5231	534	1993	0.5
5232	534	415	0.25
5233	534	1994	0.25
5234	534	1995	0.25
5235	534	722	0.5
5236	534	1996	0.5
5237	534	33	0.25
5238	534	36	0.25
5239	534	1997	0.75
5240	534	2000	0.100000001
5241	535	2147	1
5242	535	37	0.5
5243	535	702	0.5
5244	535	2148	0.5
5245	535	359	0.5
5246	535	291	0.5
5247	535	33	0.5
5248	535	74	0.5
5249	535	14	0.5
5250	535	77	0.25
5251	535	489	0.5
5252	535	422	0.25
5253	535	2149	0.5
5254	535	2150	0.25
5255	535	2151	0.5
5256	535	1127	0.25
5257	535	36	0.5
5258	536	2152	1
5259	536	88	0.75
5260	536	415	0.5
5261	536	498	0.5
5262	536	2153	0.25
5263	536	2154	0.5
5264	537	2155	0.75
5265	537	2156	0.75
5266	537	2157	0.5
5267	537	511	0.600000024
5268	537	523	0.5
5269	537	2158	1
5270	537	2039	0.100000001
5271	537	2038	0.5
5272	538	1973	1
5273	538	2159	0.600000024
5274	538	2160	0.600000024
5275	538	2161	0.600000024
5276	538	2162	0.600000024
5277	538	2163	0.5
5278	538	2164	0.5
5279	538	2165	0.5
5280	538	2166	0.300000012
5281	538	722	0.800000012
5282	538	434	0.699999988
5283	538	2167	0.300000012
5284	539	2168	1
5285	539	990	0.200000003
5286	539	767	0.600000024
5287	539	2169	0.5
5288	539	40	0.699999988
5289	539	109	0.699999988
5290	540	2170	0.5
5291	540	35	0.5
5292	540	10	0.5
5293	540	68	0.5
5294	540	16	0.5
5295	540	2171	0.5
5296	540	6	0.5
5297	540	9	0.5
5298	541	2172	0.899999976
5299	541	536	0.699999988
5300	541	1476	0.600000024
5301	541	10	0.660000026
5302	541	16	0.330000013
5303	541	2173	0.400000006
5304	541	2174	0.400000006
5305	541	809	0.400000006
5306	541	397	0.400000006
5307	541	2175	0.5
5308	541	2176	0.5
5309	541	393	0.5
5310	541	90	0.5
5311	541	2177	0.330000013
5312	541	185	0.200000003
5313	541	71	0.200000003
5314	541	2178	0.200000003
5315	542	715	0.75
5316	542	239	0.75
5317	542	632	0.75
5318	542	1875	0.75
5319	542	77	0.75
5320	542	2179	0.5
5321	542	720	0.5
5322	542	2180	0.5
5323	542	391	0.5
5324	542	2181	0.5
5325	542	546	0.5
5326	542	15	0.5
5327	542	2006	0.25
5328	543	2182	1
5329	543	2183	0.600000024
5330	543	2184	0.600000024
5331	543	2185	0.600000024
5332	543	2186	0.5
5333	544	235	0.5
5334	544	14	0.5
5335	544	6	0.5
5336	544	10	0.5
5337	544	2187	0.5
5338	544	2188	0.5
5339	544	427	0.5
5340	544	2189	0.5
5341	544	74	0.5
5342	544	2190	0.5
5343	544	2191	0.5
5344	544	77	0.5
5345	544	427	0.5
5346	544	2192	0.5
5347	544	2193	0.5
5348	544	36	0.5
5349	544	2194	0.5
5350	544	9	0.5
5351	544	68	0.5
5352	544	33	0.5
5353	544	76	0.5
5354	544	2195	0.5
5355	544	16	0.5
5356	545	235	0.5
5357	545	37	0.5
5358	545	618	0
5359	545	236	0.5
5360	545	6	0.5
5361	545	36	0.5
5362	545	237	0.5
5363	545	9	0.5
5364	545	10	0.5
5365	545	68	0.5
5366	545	33	0.5
5367	545	377	1
5368	545	16	0.5
5369	545	378	1
5370	546	235	0.5
5371	546	37	0.75
5372	546	2196	0.75
5373	546	2197	0.949999988
5374	546	2198	0.75
5375	546	2199	0.949999988
5376	546	2200	0.75
5377	546	2201	0.75
5378	546	236	0.5
5379	546	2202	0.75
5380	546	6	0.5
5381	546	2203	0.75
5382	546	2204	0.949999988
5383	546	441	0.75
5384	546	237	0.5
5385	546	9	0.5
5386	546	10	0.5
5387	546	68	0.5
5388	546	2205	0.949999988
5389	546	489	0.75
5390	546	2206	0.75
5391	546	2207	0.75
5392	546	2020	0.75
5393	546	2208	0.75
5394	546	2209	0.75
5395	546	1168	0.75
5396	546	2210	0.25
5397	546	2211	0.25
5398	546	2212	0.75
5399	546	12	0.75
5400	546	16	0.5
5401	546	2213	0.75
5402	546	2214	0.75
5403	546	2215	0.75
5404	547	2216	0.5
5405	547	235	0.5
5406	547	37	0.5
5407	547	2217	0.100000001
5408	547	2218	0.5
5409	547	618	0.949999988
5410	547	14	0.5
5411	547	236	0.5
5412	547	2219	0.75
5413	547	250	0.75
5414	547	2220	0.75
5415	547	237	0.5
5416	547	6	0.5
5417	547	10	0.5
5418	547	68	0.5
5419	547	2221	0.949999988
5420	547	16	0.5
5421	547	1117	0.75
5422	547	2222	0.649999976
5423	547	9	0.5
5424	548	292	1
5425	548	469	0.25
5426	548	913	0.25
5427	548	1050	0.25
5428	548	2223	0.899999976
5429	548	855	0.899999976
5430	548	2224	0.600000024
5431	548	16	0.699999988
5432	548	10	0.300000012
5433	548	2225	0.600000024
5434	548	2226	0.899999976
5435	548	2227	0.99000001
5436	549	2228	0.949999988
5437	549	722	0.800000012
5438	549	79	0.600000024
5439	549	80	0.5
5440	549	79	0.600000024
5441	549	40	0.600000024
5442	549	2229	0.100000001
5443	550	2230	0.899999976
5444	550	2231	0.100000001
5445	550	277	0.25
5446	550	2232	0.300000012
5447	550	873	0.25
5448	550	434	0.5
5449	550	1151	0.25
5450	550	2233	0.100000001
5451	550	292	0.25
5452	550	2234	0.899999976
5453	550	2235	0.800000012
5454	550	2236	0.0500000007
5455	550	8	0.0299999993
5456	550	2237	0.800000012
5457	551	235	0.5
5458	551	37	0.5
5459	551	9	0.5
5460	551	567	0.5
5461	551	2238	0.5
5462	551	16	0.5
5463	551	2239	0.5
5464	551	425	0.5
5465	551	107	0.5
5466	551	1295	0.5
5467	551	2240	0.5
5468	551	1645	0.5
5469	551	6	0.5
5470	551	10	0.5
5471	551	68	0.5
5472	551	2241	0.5
5473	551	79	0.5
5474	551	2242	0.5
5475	551	292	0.5
5476	552	235	0.5
5477	552	37	0.5
5478	552	10	0.5
5479	552	567	0.5
5480	552	2238	0.5
5481	552	426	0.5
5482	552	2239	0.5
5483	552	6	0.5
5484	552	1295	0.5
5485	552	2240	0.5
5486	552	324	0.5
5487	552	9	0.5
5488	552	290	0.5
5489	552	68	0.5
5490	552	1645	0.5
5491	552	2241	0.5
5492	552	16	0.5
5493	552	292	0.5
5494	553	10	0.660000026
5495	553	16	0.330000013
5496	553	1358	0.99000001
5497	553	2243	0.699999988
5498	553	2244	0.699999988
5499	553	511	0.850000024
5500	553	191	0.800000012
5501	553	2245	0.300000012
5502	553	971	0.300000012
5503	554	10	0.75
5504	554	16	0.25
5505	554	14	0.800000012
5506	554	2246	0.699999988
5507	554	82	0.5
5508	554	2247	0.400000006
5509	554	1205	0.349999994
5510	554	25	0.349999994
5511	555	235	0.779999971
5512	555	2248	0.5
5513	555	2249	1
5514	555	2250	0.800000012
5515	555	2251	0.800000012
5516	555	603	0.629999995
5517	555	2252	0.800000012
5518	555	2253	0.660000026
5519	556	2254	1
5520	556	2255	1
5521	556	2256	1
5522	557	2257	0.75
5523	557	193	0.5
5524	557	1286	0.5
5525	557	2258	0.5
5526	557	2259	0.25
5527	558	2260	0.5
5528	558	2261	0.5
5529	558	2262	0.5
5530	558	14	0.5
5531	558	6	0.5
5532	558	2263	0.5
5533	558	1295	0.5
5534	558	10	0.5
5535	558	2242	0.5
5536	558	425	0.5
5537	558	35	0.5
5538	558	292	0.5
5539	558	324	0.5
5540	558	37	0.5
5541	558	36	0.5
5542	558	53	0.5
5543	558	1645	0.5
5544	558	1294	0.5
5545	558	68	0.5
5546	558	33	0.5
5547	558	38	0.5
5548	558	2264	0.5
5549	558	2265	0.5
5550	558	107	0.5
5551	558	2266	0.5
5552	558	16	0.5
5553	558	566	0.5
5554	558	9	0.5
5555	559	2267	0.100000001
5556	559	235	0.5
5557	559	599	0.75
5558	559	567	1
5559	559	411	0.75
5560	559	2268	0.5
5561	559	236	0.5
5562	559	6	0.5
5563	559	393	0.75
5564	559	16	0.5
5565	559	237	0.5
5566	559	9	0.5
5567	559	10	0.5
5568	559	68	0.5
5569	559	79	0.75
5570	559	88	0.75
5571	559	2269	0.5
5572	559	484	0.75
5573	559	1168	0.5
5574	560	235	0.5
5575	560	2270	0.5
5576	560	2271	0.5
5577	560	14	0.5
5578	560	257	0.5
5579	560	82	0.5
5580	560	2272	0.5
5581	560	10	0.5
5582	560	2273	0.5
5583	560	2274	0.5
5584	560	553	0.5
5585	560	74	0.5
5586	560	105	0.5
5587	560	2275	0.5
5588	560	2276	0.5
5589	560	430	0.5
5590	560	257	0.5
5591	560	36	0.5
5592	560	291	0.5
5593	560	401	0.5
5594	560	68	0.5
5595	560	6	0.100000001
5596	560	33	0.5
5597	560	2277	0.5
5598	560	16	0.5
5599	560	378	0.5
5600	560	2278	0.5
5601	560	9	0.5
5602	560	125	0.75
5603	561	522	0.5
5604	561	2279	0.5
5605	561	235	0.5
5606	561	2280	0.5
5607	561	422	0.5
5608	561	2281	0.5
5609	561	2282	0.5
5610	561	6	0.5
5611	561	36	0.5
5612	561	2283	0.5
5613	561	9	0.5
5614	561	10	0.5
5615	561	68	0.5
5616	561	36	0.5
5617	561	2284	0.5
5618	561	16	0.5
5619	562	2285	1
5620	563	2286	1
5621	564	2287	1
5622	564	2288	0.439999998
5623	564	2289	0.860000014
5624	564	162	0.5
5625	564	547	0.5
5626	564	499	0.5
5627	564	2290	0.5
5628	564	2291	0.5
5629	564	1723	0.5
5630	564	2292	0.5
5631	564	2293	0.5
5632	564	2294	0.5
5633	564	2295	1
5634	565	2296	1
5635	565	2297	1
5636	565	2298	0.899999976
5637	566	10	0.5
5638	566	9	0.5
5639	566	35	0.5
5640	566	561	0.5
5641	566	68	0.5
5642	566	16	0.5
5643	566	6	0.5
5644	566	292	1
5645	567	2299	1
5646	567	2300	0.5
5647	567	2301	0.5
5648	567	2302	0.5
5649	567	2303	0.5
5650	567	2304	0.790000021
5651	567	2305	0.75
5652	567	2306	0.75
5653	567	2307	0.5
5654	567	2308	0.5
5655	567	2309	0.25
5656	567	2310	0.140000001
5657	568	2311	1
5658	568	6	0.5
5659	568	36	0.5
5660	568	644	0.5
5661	568	9	0.5
5662	568	10	0.5
5663	568	68	0.5
5664	568	857	0.5
5665	568	33	0.5
5666	568	2312	0.5
5667	568	291	0.5
5668	568	16	0.5
5669	568	461	0.5
5670	568	21	0.25
5671	569	2313	1
5672	570	2314	1
5673	571	2315	1
5674	572	2316	1
5675	572	2317	1
5676	572	2318	1
5677	573	511	1
5678	574	2319	1
5679	574	2320	0.899999976
5680	574	511	1
5681	575	2321	1
5682	575	2322	1
5683	575	511	1
5684	576	2323	0.899999976
5685	576	511	1
5686	577	185	1
5687	577	2255	1
5688	578	2324	0.899999976
5689	578	2325	0.400000006
5690	578	2326	0.600000024
5691	578	2327	0.600000024
5692	578	79	0.899999976
5693	578	304	0.899999976
5694	578	2328	0.899999976
5695	578	2329	0.699999988
5696	579	235	0.899999976
5697	579	2330	0.899999976
5698	579	304	0.899999976
5699	579	2331	0.800000012
5700	579	40	0.5
5701	579	2332	1
5702	580	2333	1
5703	580	2334	1
5704	580	2335	0.800000012
5705	580	2336	1
5706	580	2337	0.899999976
5707	580	2338	0.5
5708	581	809	0.99000001
5709	581	2339	1
5710	581	2340	0.949999988
5711	581	1197	0.699999988
5712	581	2341	0.899999976
5713	582	2342	0.600000024
5714	582	2343	0.400000006
5715	582	2344	0.5
5716	582	163	0.800000012
5717	582	2345	0.699999988
5718	582	2346	0.5
5719	582	12	0.699999988
5720	582	1278	1
5721	583	68	1
5722	583	2347	0.400000006
5723	583	2348	0.400000006
5724	583	2349	0.400000006
5725	583	2350	0.400000006
5726	583	2351	0.75
5727	583	2352	0.699999988
5728	583	2353	0.540000021
5729	583	2354	0.379999995
5730	583	2355	0.560000002
5731	583	2356	0.400000006
5732	583	2357	0.400000006
5733	583	2358	0.400000006
5734	583	2359	0.400000006
5735	583	2360	0.75
5736	583	2361	0.400000006
5737	583	2362	0.400000006
5738	583	2363	0.400000006
5739	584	2364	0.100000001
5740	584	2365	0.75
5741	584	2366	0.400000006
5742	584	2367	0.370000005
5743	584	2355	0.400000006
5744	584	2368	0.400000006
5745	584	2369	0.860000014
5746	584	2370	0.629999995
5747	584	83	0.569999993
5748	584	422	0.409999996
5749	584	77	0.600000024
5750	584	37	0.400000006
5751	584	105	0.409999996
5752	584	257	0.310000002
5753	584	76	0.409999996
5754	584	276	0.270000011
5755	584	1199	0.5
5756	584	36	0.25
5757	584	531	0.0900000036
5758	584	425	0.0799999982
5759	584	2371	0.0700000003
5760	584	2372	0.200000003
5761	584	431	0.400000006
5762	585	145	0.5
5763	585	2373	0.5
5764	585	2374	0.5
5765	585	2375	0.5
5766	585	2376	0.75
5767	585	2377	0.25
5768	586	2378	0.5
5769	586	359	0.5
5770	586	37	0.5
5771	586	76	0.5
5772	586	105	0.5
5773	586	1507	0.5
5774	586	499	0.5
5775	586	522	0.5
5776	586	2379	0.5
5777	587	2380	0.589999974
5778	587	946	0.200000003
5779	587	2381	0.439999998
5780	587	460	0.879999995
5781	587	1150	0.239999995
5782	587	1149	0.389999986
5783	587	122	0.519999981
5784	587	12	0.100000001
5785	587	443	0.0500000007
5786	587	1151	0.49000001
5787	587	569	0.239999995
5788	587	305	0.170000002
5789	587	2382	0.660000026
5790	587	2383	0.889999986
5791	587	2384	0.709999979
5792	587	2385	0.550000012
5793	587	2386	0.860000014
5794	587	2387	0.5
5795	588	2388	0.5
5796	588	2389	0.25
5797	588	2390	0.25
5798	588	434	0.25
5799	588	13	0.25
5800	588	1773	0.25
5801	589	235	0.5
5802	589	1244	0.5
5803	589	236	0.5
5804	589	6	0.5
5805	589	237	0.5
5806	589	10	0.5
5807	589	2391	0.25
5808	589	2392	0.75
5809	589	1	0.5
5810	589	536	0.75
5811	589	859	0.75
5812	589	2393	0.949999988
5813	589	324	0.75
5814	589	2394	0.75
5815	589	2395	0.5
5816	589	9	0.5
5817	589	68	0.5
5818	589	2396	0.949999988
5819	589	2397	0.949999988
5820	589	321	0.75
5821	589	16	0.5
5822	590	235	0.5
5823	590	1244	0.5
5824	590	236	0.5
5825	590	6	0.5
5826	590	2398	0.5
5827	590	237	0.5
5828	590	10	0.5
5829	590	2399	0.75
5830	590	2392	0.75
5831	590	1	0.5
5832	590	2400	0.75
5833	590	2401	0.649999976
5834	590	536	0.75
5835	590	859	0.75
5836	590	324	0.75
5837	590	2402	0.75
5838	590	350	0.75
5839	590	9	0.5
5840	590	68	0.5
5841	590	321	0.75
5842	590	16	0.5
5843	591	2403	1
5844	591	235	0.5
5845	591	6	0.5
5846	591	10	0.5
5847	591	68	0.5
5848	591	16	0.5
5849	591	425	0.5
5850	591	9	0.5
5851	592	235	0.5
5852	592	908	0.5
5853	592	6	0.5
5854	592	2403	1
5855	592	9	0.5
5856	592	10	0.5
5857	592	68	0.5
5858	592	1431	0.5
5859	592	425	0.5
5860	592	16	0.5
5861	593	2404	1
5862	594	2405	0.899999976
5863	595	2406	0.899999976
5864	596	2407	0.899999976
5865	597	2408	0.899999976
5866	598	2409	0.899999976
5867	599	2409	0.899999976
5868	600	2410	0.899999976
5869	601	2411	0.899999976
5870	602	2412	0.899999976
5871	603	2413	0.899999976
5872	604	2414	0.899999976
5873	605	2415	0.899999976
5874	606	2416	0.899999976
5875	607	2417	0.899999976
5876	608	2418	0.899999976
5877	609	2419	0.899999976
5878	610	2420	0.899999976
5879	611	2421	0.75
5880	611	2422	0.100000001
5881	611	2423	0.100000001
5882	611	2424	0.100000001
5883	611	998	0.100000001
5884	611	2425	0.100000001
5885	611	2426	0.100000001
5886	611	2427	0.100000001
5887	611	767	0.100000001
5888	611	2428	0.100000001
5889	611	2429	0.100000001
5890	612	2430	0.5
5891	612	2079	0.5
5892	612	2431	0.5
5893	613	2432	1
5894	613	2433	0.5
5895	613	460	0.5
5896	613	2060	0.5
5897	613	275	0.5
5898	613	1150	0.5
5899	613	1772	0.5
5900	613	2434	0.5
5901	613	2435	0.5
5902	613	715	0.25
5903	613	2009	0.5
5904	614	43	0.5
5905	614	1091	0.5
5906	614	6	0.5
5907	614	1127	0.5
5908	614	9	0.5
5909	614	10	0.5
5910	614	68	0.5
5911	614	2436	0.5
5912	614	895	0.5
5913	614	2437	0.5
5914	614	2438	0.5
5915	614	16	0.5
5916	614	1080	0.5
5917	614	1	0.5
5918	615	2439	1
5919	615	2440	0.100000001
5920	615	501	0.75
5921	615	2441	0.25
5922	615	2442	0.0599999987
5923	616	855	0.75
5924	616	324	0.75
5925	616	1976	0.75
5926	616	2443	0.5
5927	616	2444	0.899999976
5928	617	2445	1
5929	618	2446	0.699999988
5930	618	816	0.5
5931	618	2447	0.400000006
5932	619	410	0.800000012
5933	619	365	0.800000012
5934	619	512	0.5
5935	619	2448	0.200000003
5936	619	722	0.699999988
5937	619	2449	0.400000006
5938	619	2450	0.5
5939	619	555	0.5
5940	620	722	0.800000012
5941	620	14	0.200000003
5942	620	10	1
5943	620	16	0
5944	621	235	0.5
5945	621	35	0
5946	621	10	0.5
5947	621	68	0
5948	621	16	0.5
5949	621	1	0.5
5950	621	6	0
5951	621	9	0
5952	622	2451	0.330000013
5953	622	2452	0.889999986
5954	623	2453	0.899999976
5955	623	2454	0.800000012
5956	623	2455	0.5
5957	623	401	0.899999976
5958	623	2456	0.800000012
5959	624	2457	0.5
5960	624	2458	0.5
5961	624	6	0.5
5962	624	10	0.5
5963	624	2459	0.5
5964	624	1	0.5
5965	624	2460	0.5
5966	624	2133	0.5
5967	624	2461	0.5
5968	624	16	0.5
5969	624	9	0.5
5970	625	2462	0.899999976
5971	625	10	1
5972	625	16	0
5973	626	2338	1
5974	626	2255	1
5975	626	2463	0.899999976
5976	626	2464	1
5977	626	2465	1
5978	626	2466	0.899999976
5979	626	2467	0.899999976
5980	626	2468	0.600000024
5981	626	2469	0.5
5982	626	2470	0.600000024
5983	626	2471	0.600000024
5984	626	511	0.800000012
5985	626	2472	0.899999976
5986	626	2473	0.800000012
5987	627	2474	1
5988	627	2255	1
5989	628	2464	1
5990	628	2475	0.949999988
5991	628	2476	0.699999988
5992	628	2477	0.600000024
5993	628	2478	0.600000024
5994	628	2479	0.550000012
5995	628	2480	0.25
5996	628	2481	0.100000001
5997	628	2482	0.0500000007
5998	629	2483	0.5
5999	629	2484	0.5
6000	629	16	0.5
6001	629	2485	0.5
6002	629	2486	0.5
6003	629	6	0.5
6004	629	2487	0.5
6005	629	1412	0.5
6006	629	10	0.5
6007	629	2283	0.5
6008	629	2488	0.5
6009	629	2489	0.5
6010	629	422	0.5
6011	629	2141	0.5
6012	629	844	0.5
6013	629	799	0.5
6014	629	2490	0.5
6015	629	9	0.5
6016	630	2010	0.5
6017	630	235	0.5
6018	630	6	0.5
6019	630	341	0.5
6020	630	9	0.5
6021	630	10	0.5
6022	630	68	0.5
6023	630	2491	0.5
6024	630	1	0.5
6025	630	16	0.5
6026	630	2010	0.5
6027	630	35	0.5
6028	630	77	0.5
6029	631	235	0.5
6030	631	236	0.5
6031	631	416	0.75
6032	631	10	0.5
6033	631	2492	0.5
6034	631	2493	0.75
6035	631	1576	0.25
6036	631	76	0.5
6037	631	1865	0.5
6038	631	1577	0.100000001
6039	631	12	0.75
6040	631	292	0.75
6041	631	324	0.75
6042	631	1843	0.75
6043	631	2494	0.5
6044	631	599	0.5
6045	631	9	0.5
6046	631	68	0.5
6047	631	88	0.5
6048	631	33	0.5
6049	631	659	0.649999976
6050	631	2495	0.75
6051	631	426	0.75
6052	631	107	0.75
6053	631	16	0.5
6054	631	2496	0.75
6055	631	89	0.75
6056	631	14	0.5
6057	631	2497	0.649999976
6058	631	6	0.5
6059	631	1574	0.949999988
6060	631	237	0.5
6061	631	801	0.75
6062	631	431	0.649999976
6063	631	15	0.5
6064	631	1223	0.5
6065	631	536	0.75
6066	631	1882	0.5
6067	631	37	0.75
6068	631	547	0.5
6069	631	43	0.75
6070	631	1515	0.75
6071	631	257	0.75
6072	631	36	0.5
6073	631	971	0.75
6074	631	1578	0.949999988
6075	631	38	0.75
6076	632	6	0.5
6077	632	10	0.5
6078	632	169	0.5
6079	632	1117	0.5
6080	632	1	0.5
6081	632	74	0.5
6082	632	35	0.5
6083	632	834	0.5
6084	632	2498	0.5
6085	632	348	0.5
6086	632	324	0.5
6087	632	37	0.5
6088	632	2499	0.5
6089	632	597	0.5
6090	632	692	0.5
6091	632	82	0.5
6092	632	401	0.5
6093	632	68	0.5
6094	632	838	0.25
6095	632	1694	0.5
6096	632	2500	0.5
6097	632	1369	0.5
6098	632	2501	0.5
6099	632	16	0.5
6100	632	1054	0.5
6101	632	9	0.5
6102	633	247	1
6103	634	2502	0.899999976
6104	634	2503	0.200000003
6105	634	2504	0.25
6106	634	2505	0.25
6107	634	2506	0.75
6108	634	419	0.5
6109	634	107	0.5
6110	634	2507	0.25
6111	634	2508	0.25
6112	634	2509	0.449999988
6113	634	2510	0.75
6114	634	2511	0.0500000007
6115	634	14	0.100000001
6116	634	2512	0.150000006
6117	634	2513	0.0900000036
6118	634	2514	0.00999999978
6119	634	2515	0.25
6120	634	761	0.5
6121	634	2516	0.100000001
6122	634	40	0.449999988
6123	634	79	0.449999988
6124	634	2517	0.899999976
6125	634	181	0.899999976
6126	635	235	0.5
6127	635	236	0.5
6128	635	1308	0.75
6129	635	10	0.5
6130	635	851	0.5
6131	635	40	0.5
6132	635	1514	0.5
6133	635	2518	0.649999976
6134	635	2519	0.649999976
6135	635	1865	0.100000001
6136	635	292	0.75
6137	635	181	0.5
6138	635	2520	0.5
6139	635	9	0.5
6140	635	68	0.5
6141	635	33	0.75
6142	635	972	0.5
6143	635	426	0.100000001
6144	635	531	0.5
6145	635	681	0.75
6146	635	16	0.5
6147	635	2521	0.75
6148	635	6	0.5
6149	635	1127	0.5
6150	635	1245	0.5
6151	635	237	0.5
6152	635	1719	0.5
6153	635	2522	0.5
6154	635	547	0.75
6155	635	522	0.75
6156	635	37	0.100000001
6157	635	2493	0.75
6158	635	569	0.25
6159	635	1515	0.100000001
6160	635	257	0.5
6161	635	2523	0.5
6162	635	125	0.75
6163	635	2524	0.5
6164	635	2525	0.5
6165	635	2526	0.25
6166	635	59	0.5
6167	635	2355	0.949999988
6168	635	2527	0.5
6169	635	2528	0.5
6170	635	126	0.75
6171	635	324	0.25
6172	635	2529	0.75
6173	636	235	0.5
6174	636	618	0
6175	636	14	0.75
6176	636	236	0.5
6177	636	6	0.5
6178	636	2530	0.25
6179	636	237	0.5
6180	636	10	0.5
6181	636	427	0.100000001
6182	636	1	0.5
6183	636	2531	0.25
6184	636	2532	0.5
6185	636	37	0.100000001
6186	636	36	0.5
6187	636	53	0.75
6188	636	9	0.5
6189	636	68	0.5
6190	636	2533	0.949999988
6191	636	2534	0.949999988
6192	636	377	0.75
6193	636	16	0.5
6194	637	1	0.5
6195	637	2535	0.5
6196	637	9	0.5
6197	637	10	0.5
6198	637	6	0.5
6199	637	2536	0.5
6200	637	16	0.5
6201	637	401	0.5
6202	638	1719	0.5
6203	638	2537	0.5
6204	639	10	0.5
6205	639	161	0.5
6206	639	2538	0.5
6207	639	2539	0.5
6208	639	2540	0.5
6209	639	2541	0.5
6210	639	2542	0.5
6211	639	35	0.5
6212	639	702	0.5
6213	639	2543	0.5
6214	639	1744	0.5
6215	639	2544	0.5
6216	639	1844	0.5
6217	639	9	0.5
6218	639	2545	0.5
6219	639	2546	0.5
6220	639	489	0.5
6221	639	2547	0.5
6222	639	2548	0.5
6223	639	703	0.5
6224	639	16	0.5
6225	639	6	0.5
6226	639	2549	0.5
6227	639	550	0.5
6228	639	700	0.5
6229	639	2550	0.5
6230	639	2551	0.5
6231	639	2552	0.5
6232	639	801	0.5
6233	639	2018	0.5
6234	639	2553	0.5
6235	639	702	0.5
6236	639	2554	0.5
6237	639	1567	0.5
6238	639	430	0.5
6239	639	2555	0.5
6240	639	2556	0.5
6241	639	2557	0.5
6242	639	704	0.5
6243	639	2558	0.5
6244	639	2559	0.5
6245	639	2560	0.5
6246	639	2133	0.5
6247	639	128	0.5
6248	639	32	0.5
6249	639	2561	0.5
6250	639	701	0.5
6251	639	125	0.25
6252	640	72	0.899999976
6253	640	64	0.75
6254	641	2562	0.75
6255	641	235	0.5
6256	641	2563	0.75
6257	641	2564	0.75
6258	641	2565	0.75
6259	641	236	0.5
6260	641	6	0.5
6261	641	237	0.5
6262	641	9	0.5
6263	641	10	0.5
6264	641	68	0.5
6265	641	2566	0.75
6266	641	16	0.5
6267	641	2567	0.75
6268	641	2568	0.75
6269	641	2569	0.75
6270	642	2570	0.5
6271	642	235	0.5
6272	642	2571	0.5
6273	642	236	0.5
6274	642	2572	0.5
6275	642	2573	0.5
6276	642	425	0.5
6277	642	2574	0.5
6278	642	2575	0.5
6279	642	6	0.5
6280	642	10	0.5
6281	642	68	0.5
6282	642	2576	0.5
6283	642	2577	0.5
6284	642	16	0.5
6285	642	2578	0.5
6286	642	9	0.5
6287	643	303	0.600000024
6288	643	1011	0.349999994
6289	643	1007	0.899999976
6290	643	400	0.5
6291	643	2579	0.0700000003
6292	643	2580	0.270000011
6293	643	181	0.189999998
6294	643	2581	0.389999986
6295	643	2582	0.0399999991
6296	643	2583	0.0399999991
6297	643	550	0.5
6298	643	920	0.5
6299	644	2584	1
6300	644	2585	0.899999976
6301	644	2586	0.899999976
6302	644	1381	0.100000001
6303	644	2587	0.100000001
6304	644	2588	0.100000001
6305	645	2589	1
6306	646	68	0.75
6307	646	2590	0.75
6308	646	2591	0.899999976
6309	647	235	0.5
6310	647	14	0.75
6311	647	236	0.5
6312	647	82	0.5
6313	647	237	0.5
6314	647	10	0.5
6315	647	427	0.75
6316	647	37	0.100000001
6317	647	2592	0.949999988
6318	647	597	0.100000001
6319	647	834	0.5
6320	647	291	0.75
6321	647	6	0.5
6322	647	68	0.5
6323	647	2593	0.949999988
6324	647	33	0.75
6325	647	1694	0.5
6326	647	107	0.5
6327	647	377	1
6328	647	16	0.5
6329	647	378	0.5
6330	647	9	0.5
6331	648	2594	1
6332	649	2595	0.75
6333	649	2596	0.75
6334	649	2597	0.75
6335	649	2598	0.5
6336	650	235	0.5
6337	650	9	0.5
6338	650	10	0.5
6339	650	68	0.5
6340	650	2599	0.5
6341	650	553	0.5
6342	650	2600	0.5
6343	650	2272	0.5
6344	650	35	0.5
6345	650	16	0.5
6346	650	2601	0.5
6347	651	860	0.5
6348	651	235	0.5
6349	651	2602	0.5
6350	651	2603	0.5
6351	651	2604	0.25
6352	651	68	0.5
6353	651	236	0.5
6354	651	2605	0.75
6355	651	6	0.5
6356	651	2606	0.75
6357	651	237	0.5
6358	651	9	0.5
6359	651	10	0.5
6360	651	2607	0.5
6361	651	2608	0.75
6362	651	2609	0.949999988
6363	651	422	0.5
6364	651	1514	0.5
6365	651	2610	0.75
6366	651	2611	0.5
6367	651	1197	0.5
6368	651	2612	0.25
6369	651	2613	0.949999988
6370	651	531	0.100000001
6371	651	2614	0.75
6372	651	2615	0.5
6373	651	1484	0.5
6374	651	16	0.5
6375	651	566	0.5
6376	651	15	0.5
6377	651	2616	0.75
6378	652	235	0.5
6379	652	14	0.5
6380	652	236	0.5
6381	652	6	0.5
6382	652	2617	0.5
6383	652	237	0.5
6384	652	10	0.75
6385	652	94	1
6386	652	2618	0.5
6387	652	97	0.25
6388	652	95	1
6389	652	329	0.5
6390	652	2619	1
6391	652	37	0.100000001
6392	652	39	0.100000001
6393	652	2620	0.25
6394	652	36	0.25
6395	652	9	0.5
6396	652	68	0.5
6397	652	33	0.100000001
6398	652	1507	0.75
6399	652	328	0.25
6400	652	16	0.5
6401	653	10	1
6402	653	16	0
6403	653	2621	0.5
6404	653	2622	0.5
6405	653	2623	0.5
6406	653	2624	0.5
6407	653	2625	0.5
6408	653	57	0.5
6409	653	2626	0.200000003
6410	653	2627	0.5
6411	653	2628	0.5
6412	654	126	0.75
6413	654	125	0.75
6414	654	74	0.75
6415	654	2629	0.75
6416	654	2630	0.75
6417	654	1308	0.75
6418	654	2631	0.75
6419	655	126	0.75
6420	655	1308	0.75
6421	655	1044	0.75
6422	655	857	0.75
6423	655	2632	0.75
6424	655	2631	0.75
6425	656	235	0.5
6426	656	37	0.75
6427	656	2633	0.5
6428	656	2634	0.100000001
6429	656	236	0.5
6430	656	1007	0.75
6431	656	6	0.5
6432	656	2635	0.5
6433	656	2636	0.100000001
6434	656	237	0.5
6435	656	9	0.5
6436	656	10	0.5
6437	656	68	0.5
6438	656	2637	0.5
6439	656	2638	0.5
6440	656	2639	0.75
6441	656	2640	0.5
6442	656	2629	0.649999976
6443	656	1347	0.5
6444	656	2641	0.75
6445	656	74	0.5
6446	656	2630	0.649999976
6447	656	2642	0.75
6448	656	400	0.75
6449	656	662	0.5
6450	656	2643	0.5
6451	656	1054	0.5
6452	656	2644	0.5
6453	656	2645	0.100000001
6454	656	16	0.5
6455	656	2646	0.100000001
6456	656	1303	0.5
6457	657	2647	0.899999976
6458	657	2648	0.899999976
6459	657	2649	0.899999976
6460	657	856	0.800000012
6461	657	257	0.699999988
6462	658	72	0.899999976
6463	658	2454	0.800000012
6464	658	2650	0.800000012
6465	658	229	0.5
6466	658	2651	0.5
6467	658	322	0.5
6468	658	2652	0.800000012
6469	658	6	0.699999988
6470	658	2653	0.5
6471	658	2654	0.600000024
6472	659	2655	0.699999988
6473	659	2656	0.400000006
6474	659	2657	0.400000006
6475	659	2658	0.600000024
6476	659	722	0.800000012
6477	660	10	0.600000024
6478	660	16	0.400000006
6479	660	2659	0.699999988
6480	660	2660	0.699999988
6481	660	2661	0.600000024
6482	660	2662	0.400000006
6483	660	2663	0.800000012
6484	660	2664	1
6485	660	2665	1
6486	660	2666	0.899999976
6487	661	547	0.5
6488	661	2667	0.5
6489	661	6	0.5
6490	661	1412	0.5
6491	661	9	0.5
6492	661	10	0.5
6493	661	2490	0.5
6494	661	806	0.5
6495	661	801	0.5
6496	661	489	0.5
6497	661	2547	0.5
6498	661	2668	0.5
6499	661	2669	0.5
6500	661	16	0.5
6501	662	6	0.5
6502	662	1412	0.5
6503	662	9	0.5
6504	662	10	0.5
6505	662	422	0.5
6506	662	2670	0.5
6507	662	2671	0.5
6508	662	126	0.5
6509	662	35	0.5
6510	662	16	0.5
6511	663	2672	0.5
6512	663	2673	0.5
6513	663	800	0.5
6514	663	2674	0.5
6515	663	2675	0.5
6516	663	422	0.5
6517	663	2547	0.5
6518	663	16	0.5
6519	663	2676	0.5
6520	663	6	0.5
6521	663	2677	0.5
6522	663	1412	0.5
6523	663	489	0.5
6524	663	82	0.5
6525	663	10	0.5
6526	663	844	0.5
6527	663	2678	0.5
6528	663	801	0.5
6529	663	1729	0.5
6530	663	522	0.5
6531	663	2484	0.5
6532	663	644	0.5
6533	663	710	0.5
6534	663	392	0.5
6535	663	314	0.5
6536	663	2679	0.5
6537	663	2680	0.5
6538	663	2681	0.5
6539	663	2682	0.5
6540	663	9	0.5
6541	663	2683	0.5
6542	663	2684	0.5
6543	663	2492	0.5
6544	663	2685	0.5
6545	663	2538	0.5
6546	663	2686	0.5
6547	663	2687	0.5
6548	664	1644	0.5
6549	664	2688	0.5
6550	664	2689	0.5
6551	664	2690	0.5
6552	664	1091	0.5
6553	664	1844	0.5
6554	664	6	0.5
6555	664	2691	0.5
6556	664	1412	0.5
6557	664	2692	0.5
6558	664	9	0.5
6559	664	10	0.5
6560	664	2693	0.5
6561	664	844	0.5
6562	664	2694	0.5
6563	664	2695	0.5
6564	664	2696	0.5
6565	664	857	0.5
6566	664	1729	0.5
6567	664	2697	0.5
6568	664	16	0.5
6569	664	2698	0.5
6570	664	2699	0.5
6571	664	2700	0.5
6572	664	2701	0.5
6573	664	2702	0.5
6574	664	2703	0.5
6575	664	2704	0.5
6576	664	702	0.5
6577	664	2705	0.5
6578	664	2706	0.5
6579	665	2707	0.5
6580	665	9	0.5
6581	665	2708	0.5
6582	665	2709	0.5
6583	665	2710	0.5
6584	665	1412	0.5
6585	665	2711	0.5
6586	665	10	0.5
6587	665	2712	0.5
6588	665	2713	0.5
6589	665	2714	0.5
6590	665	16	0.5
6591	665	2715	0.5
6592	665	2716	0.5
6593	665	6	0.5
6594	665	2717	0.5
6595	666	2718	0.25
6596	666	235	0.5
6597	666	2719	0.949999988
6598	666	659	0.649999976
6599	666	2223	0.75
6600	666	257	0.5
6601	666	599	0.5
6602	666	236	0.5
6603	666	6	0.5
6604	666	2720	0.75
6605	666	37	1
6606	666	237	0.5
6607	666	9	0.5
6608	666	10	0.5
6609	666	68	0.5
6610	666	2721	0.949999988
6611	666	801	0.5
6612	666	2722	0.100000001
6613	666	2723	0.100000001
6614	666	2724	0.949999988
6615	666	2725	0.75
6616	666	2726	0.949999988
6617	666	419	0.75
6618	666	1545	0.75
6619	666	2727	0.949999988
6620	666	107	0.75
6621	666	662	0.5
6622	666	2728	0.75
6623	666	16	0.5
6624	666	2729	0.949999988
6625	666	2730	0.949999988
6626	666	2731	0.949999988
6627	666	1299	0.75
6628	666	321	0.5
6629	666	1263	0.75
6630	666	2732	0.25
6631	666	1054	0.5
6632	666	292	0.75
6633	667	2718	0.25
6634	667	235	0.5
6635	667	2719	0.949999988
6636	667	273	0.75
6637	667	236	0.5
6638	667	416	0.75
6639	667	10	0.5
6640	667	2721	0.949999988
6641	667	2724	0.949999988
6642	667	2733	0.75
6643	667	292	0.75
6644	667	659	0.649999976
6645	667	599	0.5
6646	667	2720	0.75
6647	667	9	0.5
6648	667	68	0.5
6649	667	2723	0.100000001
6650	667	2734	0.649999976
6651	667	107	0.75
6652	667	2495	0.75
6653	667	420	0.75
6654	667	662	0.5
6655	667	2729	0.949999988
6656	667	16	0.5
6657	667	1054	0.5
6658	667	2735	0.649999976
6659	667	2223	0.75
6660	667	6	0.5
6661	667	715	0.75
6662	667	237	0.5
6663	667	801	0.5
6664	667	431	0.75
6665	667	2736	0.649999976
6666	667	2737	0.75
6667	667	2727	0.949999988
6668	667	2738	0.75
6669	667	37	1
6670	667	257	0.5
6671	667	2728	0.75
6672	667	391	0.75
6673	667	2722	0.100000001
6674	667	2739	0.25
6675	667	2731	0.949999988
6676	667	2725	0.75
6677	667	2726	0.949999988
6678	667	419	0.75
6679	667	2730	0.949999988
6680	667	2740	0.25
6681	667	321	0.5
6682	667	390	0.75
6683	667	2732	0.25
6684	667	1263	0.75
6685	668	2718	0.25
6686	668	235	0.5
6687	668	2719	0.949999988
6688	668	273	0.75
6689	668	236	0.5
6690	668	416	0.75
6691	668	10	0.5
6692	668	2721	0.949999988
6693	668	2724	0.949999988
6694	668	2741	0.649999976
6695	668	2742	0.75
6696	668	2733	0.75
6697	668	292	0.75
6698	668	659	0.649999976
6699	668	599	0.5
6700	668	2743	0.75
6701	668	2720	0.75
6702	668	9	0.5
6703	668	68	0.5
6704	668	2723	0.100000001
6705	668	2734	0.649999976
6706	668	107	0.75
6707	668	2495	0.75
6708	668	420	0.75
6709	668	662	0.5
6710	668	2729	0.949999988
6711	668	16	0.5
6712	668	1054	0.5
6713	668	2735	0.649999976
6714	668	2223	0.75
6715	668	6	0.5
6716	668	715	0.75
6717	668	237	0.5
6718	668	801	0.5
6719	668	431	0.75
6720	668	15	0.75
6721	668	2736	0.649999976
6722	668	2737	0.75
6723	668	2727	0.949999988
6724	668	2738	0.75
6725	668	2740	0.25
6726	668	37	1
6727	668	257	0.5
6728	668	2728	0.75
6729	668	391	0.75
6730	668	2722	0.100000001
6731	668	2739	0.25
6732	668	2731	0.949999988
6733	668	2725	0.75
6734	668	2726	0.949999988
6735	668	419	0.75
6736	668	2730	0.949999988
6737	668	2744	0.75
6738	668	321	0.5
6739	668	390	0.75
6740	668	2732	0.25
6741	668	1263	0.75
6742	669	235	0.5
6743	669	6	0.5
6744	669	9	0.5
6745	669	10	0.5
6746	669	68	0.5
6747	669	1	0.5
6748	669	425	0.5
6749	669	35	0.5
6750	669	16	0.5
6751	669	2745	0.5
6752	670	235	0.5
6753	670	6	0.5
6754	670	9	0.5
6755	670	10	0.5
6756	670	68	0.5
6757	670	2746	0.5
6758	670	2747	0.5
6759	670	2748	0.5
6760	670	1	0.5
6761	670	1431	0.5
6762	670	425	0.5
6763	670	35	0.5
6764	670	16	0.5
6765	671	2749	0.75
6766	671	235	0.5
6767	671	2750	0.649999976
6768	671	2751	0.25
6769	671	2752	0.25
6770	671	2753	0.75
6771	671	2754	0.75
6772	671	6	0.5
6773	671	2755	0.75
6774	671	2756	0.949999988
6775	671	2757	0.949999988
6776	671	237	0.5
6777	671	9	0.5
6778	671	10	0.5
6779	671	68	0.5
6780	671	2758	0.25
6781	671	2759	0.75
6782	671	2760	0.949999988
6783	671	2761	0.25
6784	671	2762	0.75
6785	671	16	0.5
6786	671	2763	0.949999988
6787	671	231	0.5
6788	671	2764	0.75
6789	671	2765	0.25
6790	671	2766	0.949999988
6791	671	2767	0.100000001
6792	671	2768	0.25
6793	671	2769	0.100000001
6794	671	236	0.5
6795	671	2770	0.75
6796	671	2771	0.75
6797	671	2772	0.25
6798	671	2773	0.949999988
6799	671	2774	0.949999988
6800	672	2775	0.800000012
6801	672	767	0.800000012
6802	672	2776	0.800000012
6803	672	2777	0.800000012
6804	672	2255	0.200000003
6805	672	790	0.200000003
6806	672	2778	0.5
6807	672	2779	0.5
6808	672	2780	0.600000024
6809	672	2781	0.5
6810	672	261	0.400000006
6811	672	1081	0.200000003
6812	673	2782	0.899999976
6813	673	2783	0.899999976
6814	673	722	0.899999976
6815	673	2784	0.800000012
6816	673	2785	0.400000006
6817	674	235	0.5
6818	674	6	0.5
6819	674	1891	0.5
6820	674	10	0.5
6821	674	857	0.25
6822	674	1	0.5
6823	674	2552	0.5
6824	674	2786	0.5
6825	674	2787	0.5
6826	674	74	0.5
6827	674	35	0.5
6828	674	2788	0.5
6829	674	37	0.5
6830	674	36	0.5
6831	674	9	0.5
6832	674	68	0.5
6833	674	2556	0.5
6834	674	2789	0.5
6835	674	2790	0.5
6836	674	2560	0.5
6837	674	2791	0.5
6838	674	16	0.5
6839	675	235	0
6840	675	499	0.5
6841	675	1567	0.5
6842	675	9	0.5
6843	675	95	0.5
6844	675	2792	0.5
6845	675	2793	0.5
6846	675	6	0.5
6847	675	2794	0.5
6848	675	1129	0.5
6849	675	2795	0.5
6850	675	2796	0.5
6851	675	10	0.5
6852	675	68	0.5
6853	675	1666	0.5
6854	675	161	0.5
6855	675	36	0.5
6856	675	2540	0.5
6857	675	323	0.5
6858	675	857	0.5
6859	675	33	0.5
6860	675	1	0.5
6861	675	2797	0.5
6862	675	2552	0.5
6863	675	2798	0.5
6864	675	2799	0.5
6865	675	425	0.5
6866	675	2556	0.5
6867	675	35	0.5
6868	675	14	0.5
6869	675	2018	0.5
6870	675	2800	0.5
6871	675	16	0.5
6872	675	2546	0.5
6873	675	2801	0.5
6874	676	10	1
6875	676	16	0
6876	676	1430	1
6877	676	2802	0.600000024
6878	676	2803	0.400000006
6879	676	2804	0.600000024
6880	676	2805	0.600000024
6881	676	2806	0.600000024
6882	676	2018	0.800000012
6883	677	2807	0.600000024
6884	677	2808	0.600000024
6885	677	2809	0.800000012
6886	677	2810	0.5
6887	677	2811	0.5
6888	677	2812	0.5
6889	677	2813	0.949999988
6890	677	2227	0.5
6891	677	193	0.600000024
6892	677	62	0.600000024
6893	677	72	0.600000024
6894	677	122	0.600000024
6895	677	2814	0.600000024
6896	677	247	0.600000024
6897	677	2453	0.400000006
6898	677	2815	0.699999988
6899	677	2816	0.600000024
6900	677	1286	0.200000003
6901	678	13	1
6902	678	2817	1
6903	678	857	0.899999976
6904	678	2818	0.800000012
6905	679	13	1
6906	680	13	1
6907	680	2048	0.899999976
6908	680	2819	0.75
6909	680	2820	0.899999976
6910	681	1	0.5
6911	681	9	0.5
6912	681	1048	0.5
6913	681	10	0.5
6914	681	13	1
6915	681	16	0.5
6916	681	2821	0.5
6917	681	6	0.5
6918	682	2822	1
6919	683	2823	0.75
6920	683	2635	0.25
6921	683	2824	0.25
6922	683	2825	0.25
6923	684	235	0.5
6924	684	2826	0.949999988
6925	684	14	0.75
6926	684	236	0.5
6927	684	82	0.100000001
6928	684	237	0.5
6929	684	10	0.5
6930	684	427	0.100000001
6931	684	35	0.5
6932	684	2827	0.649999976
6933	684	2219	0.75
6934	684	834	0.5
6935	684	36	0.100000001
6936	684	291	0.5
6937	684	6	0.5
6938	684	68	0.5
6939	684	2828	0.949999988
6940	684	531	0.649999976
6941	684	2829	0.100000001
6942	684	377	0.75
6943	684	16	0.5
6944	684	9	0.5
6945	685	2830	0.75
6946	685	531	0.75
6947	685	2831	0.400000006
6948	685	2242	0.5
6949	685	1012	0.289999992
6950	685	2832	0.5
6951	686	2833	1
6952	686	2834	0.899999976
6953	686	2835	0.75
6954	686	2836	0.75
6955	687	2837	0.899999976
6956	688	917	0.75
6957	688	2838	0.200000003
6958	688	2839	0.200000003
6959	689	2840	1
6960	689	2841	0.899999976
6961	689	2838	0.300000012
6962	689	2842	0.5
6963	689	1011	0.300000012
6964	689	2843	0.400000006
6965	689	2844	1
6966	689	2845	0.800000012
6967	689	2846	0.300000012
6968	690	291	0.75
6969	690	1055	0.74000001
6970	690	395	0.680000007
6971	690	229	0.670000017
6972	690	644	0.660000026
6973	690	249	0.469999999
6974	690	2847	0.899999976
6975	690	2457	0.5
6976	690	2848	0.5
6977	690	2133	0.5
6978	690	2505	0.5
6979	690	2849	0.899999976
6980	690	2850	0.699999988
6981	690	2851	0.5
6982	690	600	0.150000006
6983	691	2852	0.5
6984	691	235	0.5
6985	691	6	0
6986	691	2853	0.5
6987	691	2854	0.5
6988	691	68	0.5
6989	691	553	0.5
6990	691	431	0.5
6991	691	2855	0.5
6992	691	125	0.5
6993	691	2856	0.5
6994	691	35	0.5
6995	691	16	0.5
6996	691	9	0.5
6997	692	277	0.699999988
6998	692	2857	0.699999988
6999	692	435	0.600000024
7000	692	79	0.600000024
7001	692	291	0.699999988
7002	692	395	0.699999988
7003	692	2858	0.600000024
7004	692	40	0.600000024
7005	692	2859	0.400000006
7006	692	2072	0.200000003
7007	692	2860	0.200000003
7008	692	2861	0.200000003
7009	692	2446	0.200000003
7010	692	2862	0.200000003
7011	692	2863	0.200000003
7012	692	2090	0.200000003
7013	693	2864	0.75
7014	693	235	0.5
7015	693	257	0.5
7016	693	599	0.75
7017	693	236	0.5
7018	693	2865	0.5
7019	693	6	0.5
7020	693	2866	0.75
7021	693	2867	0.5
7022	693	237	0.5
7023	693	9	0.5
7024	693	10	0.5
7025	693	68	0.5
7026	693	1740	0.5
7027	693	79	0.5
7028	693	88	0.5
7029	693	258	0.75
7030	693	16	0.5
7031	693	2868	0.25
7032	693	2869	0.5
7033	693	2510	0.5
7034	693	2870	0.25
7035	693	568	0.5
7036	693	2871	0.949999988
7037	693	2872	0.5
7038	693	2873	0.5
7039	693	393	0.5
7040	693	2874	0.649999976
7041	693	277	0.5
7042	693	790	0.5
7043	693	2875	0.5
7044	693	2876	0.75
7045	693	445	0.5
7046	693	2877	0.5
7047	693	292	0.5
7048	693	2878	0.5
7049	693	2879	0.5
7050	693	2880	0.75
7051	693	392	0.75
7052	694	2881	1
7053	694	235	0.5
7054	694	2868	0.25
7055	694	2870	0.25
7056	694	236	0.5
7057	694	2871	0.949999988
7058	694	6	0.5
7059	694	2873	0.5
7060	694	2874	0.649999976
7061	694	237	0.5
7062	694	9	0.5
7063	694	10	0.5
7064	694	68	0.5
7065	694	16	0.5
7066	694	2879	0.5
7067	694	781	1
7068	695	2864	0.75
7069	695	235	0.5
7070	695	90	0.5
7071	695	236	0.5
7072	695	10	0.5
7073	695	2870	0.25
7074	695	2882	0.5
7075	695	304	0.5
7076	695	12	0.5
7077	695	258	0.75
7078	695	2879	0.5
7079	695	292	0.5
7080	695	529	0.5
7081	695	599	0.75
7082	695	53	0.5
7083	695	9	0.5
7084	695	68	0.5
7085	695	88	0.5
7086	695	33	0.5
7087	695	2868	0.25
7088	695	2883	0.5
7089	695	2871	0.949999988
7090	695	2873	0.5
7091	695	16	0.5
7092	695	2866	0.75
7093	695	498	0.5
7094	695	6	0.5
7095	695	237	0.5
7096	695	1418	0.5
7097	695	398	0.5
7098	695	2884	0.5
7099	695	393	0.5
7100	695	2880	0.75
7101	695	365	0.5
7102	695	384	0.5
7103	695	37	0.5
7104	695	2885	0.5
7105	695	257	0.5
7106	695	36	0.5
7107	695	1740	0.5
7108	695	79	0.5
7109	695	258	0.5
7110	695	2510	0.5
7111	695	2874	0.649999976
7112	695	2877	0.5
7113	695	38	0.5
7114	695	2876	0.75
7115	696	235	0.5
7116	696	971	0.75
7117	696	10	0.5
7118	696	68	0.5
7119	696	2886	0.949999988
7120	696	2887	0.949999988
7121	696	1177	0.75
7122	696	74	0.75
7123	696	834	0.75
7124	696	82	0.75
7125	696	237	0.5
7126	696	6	0.5
7127	696	236	0.5
7128	696	14	0.75
7129	696	16	0.5
7130	696	9	0.5
7131	697	235	0.5
7132	697	2888	0.949999988
7133	697	236	0.5
7134	697	6	0.5
7135	697	2889	0.949999988
7136	697	237	0.5
7137	697	10	0.5
7138	697	2890	0.949999988
7139	697	2891	0.949999988
7140	697	2892	0.949999988
7141	697	74	0.75
7142	697	1018	0.5
7143	697	2893	0.949999988
7144	697	2894	0.949999988
7145	697	2895	0.949999988
7146	697	2896	0.949999988
7147	697	37	0.5
7148	697	2886	0.949999988
7149	697	9	0.5
7150	697	68	0.5
7151	697	687	0.75
7152	697	2897	0.949999988
7153	697	2898	0.949999988
7154	697	2899	0.75
7155	697	2900	0.949999988
7156	697	531	0.649999976
7157	697	16	0.5
7158	697	2901	0.949999988
7159	697	2902	0.949999988
7160	698	235	0.5
7161	698	2903	0.25
7162	698	236	0.5
7163	698	6	0.5
7164	698	237	0.5
7165	698	9	0.5
7166	698	10	0.5
7167	698	68	0.5
7168	698	2904	0.75
7169	698	2905	0.949999988
7170	698	2906	0.949999988
7171	698	16	0.5
7172	699	235	0.5
7173	699	37	0.5
7174	699	2905	0.949999988
7175	699	10	0.5
7176	699	2903	0.25
7177	699	236	0.5
7178	699	6	0.5
7179	699	277	0.5
7180	699	237	0.5
7181	699	9	0.5
7182	699	2906	0.949999988
7183	699	68	0.5
7184	699	2907	0.75
7185	699	531	0.649999976
7186	699	79	0.5
7187	699	16	0.5
7188	699	40	0.5
7189	700	16	0.660000026
7190	700	10	0.330000013
7191	700	2453	0.699999988
7192	700	2908	0.899999976
7193	700	43	0.899999976
7194	700	37	0.5
7195	701	2909	0.899999976
7196	701	2910	0.899999976
7197	701	2911	0.600000024
7198	701	2912	0.800000012
7199	701	2913	0.800000012
7200	701	2914	0.600000024
7201	701	2915	0.600000024
7202	701	2916	0.5
7203	701	185	0.5
7204	701	179	0.5
7205	701	1943	0.600000024
7206	702	247	0.899999976
7207	702	2917	0.800000012
7208	702	2918	0.949999988
7209	702	2919	0.949999988
7210	703	16	0.699999988
7211	703	10	0.300000012
7212	703	2920	0.899999976
7213	703	2921	0.800000012
7214	703	2922	0.899999976
7215	703	247	0.899999976
7216	704	2535	0.949999988
7217	704	401	0.949999988
7218	704	2922	0.899999976
7219	704	247	0.899999976
7220	705	2535	0.949999988
7221	705	401	0.949999988
7222	705	2922	0.899999976
7223	705	247	0.899999976
7224	706	2535	0.949999988
7225	706	401	0.949999988
7226	706	2922	0.899999976
7227	706	247	0.899999976
7228	707	2535	0.949999988
7229	707	401	0.949999988
7230	707	2922	0.899999976
7231	707	247	0.899999976
7232	708	2535	0.949999988
7233	708	401	0.949999988
7234	708	2922	0.899999976
7235	708	247	0.899999976
7236	709	2923	1
7237	709	2924	1
7238	710	767	0.5
7239	710	2925	0.25
7240	710	1470	0.75
7241	710	2926	1
7242	711	2927	0.75
7243	711	2928	0.75
7244	712	2929	0.75
7245	712	2930	0.75
7246	713	2931	0.75
7247	713	2932	0.75
7248	713	2933	0.5
7249	714	2934	0.75
7250	714	2935	0.75
7251	714	2936	0.75
7252	714	2937	0.75
7253	715	2938	0.75
7254	715	2939	0.75
7255	716	2940	0.25
7256	716	2941	0.75
7257	716	2942	0.419999987
7258	716	2943	0.75
7259	716	2944	0.5
7260	716	2945	0.5
7261	716	2946	0.25
7262	716	2947	0.75
7263	716	2948	0.899999976
7264	717	2949	0.75
7265	717	2950	0.5
7266	717	2951	0.75
7267	717	2952	0.25
7268	718	2953	0.75
7269	718	2928	0.75
7270	718	2954	0.75
7271	719	2535	0.949999988
7272	719	401	0.949999988
7273	719	2922	0.899999976
7274	719	247	0.899999976
7275	720	2535	0.949999988
7276	720	401	0.949999988
7277	720	2922	0.899999976
7278	720	247	0.899999976
7279	721	37	0.899999976
7280	721	277	0.800000012
7281	721	40	0.800000012
7282	721	79	0.800000012
7283	721	275	0.600000024
7284	721	109	0.699999988
7285	721	125	0.699999988
7286	721	126	0.600000024
7287	721	2955	0.400000006
7288	721	125	0.699999988
7289	722	2956	0.899999976
7290	722	1663	0.600000024
7291	722	2957	0.5
7292	722	270	0.5
7293	723	2958	0.5
7294	723	2959	0.5
7295	723	2372	0.5
7296	723	2817	0.300000012
7297	723	2960	0.400000006
7298	723	270	0.400000006
7299	723	1054	0.400000006
7300	723	400	0.300000012
7301	723	125	0.600000024
7302	724	2961	0.699999988
7303	724	2962	0.5
7304	724	2963	0.5
7305	724	619	0.5
7306	724	79	0.699999988
7307	724	277	0.600000024
7308	724	37	0.800000012
7309	724	38	0.699999988
7310	724	81	0.600000024
7311	724	291	0.699999988
7312	724	425	0.5
7313	724	82	0.800000012
7314	724	1663	0.5
7315	724	2964	0.5
7316	725	79	0.540000021
7317	725	109	0.460000008
7318	725	126	0.5
7319	725	37	0.400000006
7320	725	275	0.300000012
7321	725	1663	0.400000006
7322	726	37	0.800000012
7323	726	88	0.800000012
7324	726	257	0.699999988
7325	726	2965	0.800000012
7326	726	2966	0.400000006
7327	726	1430	0.300000012
7328	726	125	0.600000024
7329	726	2967	0.600000024
7330	726	2968	0.699999988
7331	727	235	0.5
7332	727	2369	0.5
7333	727	6	0.5
7334	727	2969	0.5
7335	727	10	0.5
7336	727	126	0.5
7337	727	425	0.5
7338	727	1663	0.5
7339	727	1369	0.5
7340	727	292	0.5
7341	727	107	0.5
7342	727	37	0.5
7343	727	36	0.5
7344	727	401	0.5
7345	727	68	0.5
7346	727	79	0.5
7347	727	33	0.5
7348	727	38	0.5
7349	727	2970	0.5
7350	727	107	0.5
7351	727	2971	0.5
7352	727	16	0.5
7353	727	9	0.5
7354	727	15	0.25
7355	728	235	0.5
7356	728	2972	0.5
7357	728	428	0.5
7358	728	869	0.5
7359	728	6	0.5
7360	728	361	0.5
7361	728	416	0.5
7362	728	10	0.5
7363	728	68	0.5
7364	728	2495	0.5
7365	728	2973	0.5
7366	728	35	0.5
7367	728	16	0.5
7368	728	9	0.5
7369	729	2974	0.699999988
7370	729	2975	0.600000024
7371	729	12	0.800000012
7372	729	2976	0.600000024
7373	729	37	0.600000024
7374	729	1278	0.699999988
7375	729	9	0
7376	729	869	0.800000012
7377	729	1231	0.699999988
7378	729	2977	0.600000024
7379	729	416	0.600000024
7380	729	420	0.600000024
7381	729	2495	0.600000024
7382	729	2978	0.600000024
7383	729	421	0.300000012
7384	730	125	0.800000012
7385	730	2979	0.400000006
7386	730	2980	0.200000003
7387	730	37	0.600000024
7388	730	2981	0.400000006
7389	730	2982	0.300000012
7390	730	292	0.25
7391	730	275	0.5
7392	730	2983	0.400000006
7393	731	2984	1
7394	731	79	0.75
7395	731	53	0.75
7396	731	37	0.75
7397	731	82	0.5
7398	731	2850	0.330000013
7399	731	2985	0.75
7400	731	2986	0.5
7401	731	2987	0.5
7402	731	2988	0.25
7403	731	2989	0.25
7404	731	257	0.25
7405	731	2990	0.479999989
7406	731	2991	0.150000006
7407	731	564	0.200000003
7408	731	14	0.25
7409	731	2992	0.699999988
7410	731	400	0.0500000007
7411	731	40	0.75
7412	732	125	0.899999976
7413	732	2993	0.75
7414	732	2994	0.899999976
7415	733	2995	0.25
7416	733	724	0.25
7417	733	427	0.25
7418	733	82	0.25
7419	733	33	0.25
7420	733	2996	0.100000001
7421	733	2997	0.5
7422	733	2998	0.25
7423	733	887	0.5
7424	733	280	0.25
7425	733	40	0.25
7426	733	37	0.25
7427	733	276	0.25
7428	733	275	0.25
7429	733	2999	0.5
7430	733	3000	0.25
7431	733	619	0.25
7432	733	3001	0.25
7433	733	36	0.25
7434	734	125	0.899999976
7435	734	3002	0.75
7436	734	3003	0.5
7437	735	3004	0.5
7438	735	3005	0.5
7439	735	3006	0.5
7440	735	3007	0.5
7441	735	3008	0.5
7442	735	3009	0.5
7443	736	3010	1
7444	737	3011	0.75
7445	738	3012	0.75
7446	739	3013	0.5
7447	739	3014	0.75
7448	739	3015	0.5
7449	739	3016	0.25
7450	740	3017	1
7451	741	395	0.99000001
7452	741	3018	0.800000012
7453	741	3019	1
7454	742	3020	0.99000001
7455	742	3021	0.899999976
7456	742	3022	0.899999976
7457	743	3023	0.5
7458	743	1	0.5
7459	743	37	0.5
7460	743	9	0.5
7461	743	10	0.5
7462	743	14	0.5
7463	743	16	0.5
7464	743	284	0.5
7465	743	6	0.5
7466	744	2255	1
7467	744	3024	1
7468	744	3025	0.949999988
7469	744	2463	0.949999988
7470	744	3026	0.949999988
7471	744	3027	0.949999988
7472	744	3028	0.949999988
7473	744	3029	0.949999988
7474	744	3030	0.949999988
7475	744	3031	0.899999976
7476	744	3032	0.600000024
7477	744	3033	0.699999988
7478	744	3034	0.5
7479	744	3035	0.600000024
7480	744	3036	0.600000024
7481	744	3037	0.949999988
7482	744	2779	0.699999988
7483	744	3038	0.100000001
7484	744	3039	0.899999976
7485	744	3040	0.400000006
7486	744	3041	0.699999988
7487	744	3042	0.800000012
7488	744	3043	0.319999993
7489	744	3044	0.119999997
7490	744	3045	0.100000001
7491	744	3046	0.150000006
7492	744	1059	0.600000024
7493	745	1278	1
7494	745	2255	1
7495	745	3047	0.850000024
7496	745	806	0.400000006
7497	745	235	1
7498	745	3048	0.99000001
7499	745	36	1
7500	745	3049	0.150000006
7501	745	3050	0.600000024
7502	745	3051	0.400000006
7503	746	3052	0.75
7504	746	235	0.5
7505	746	236	0.5
7506	746	6	0.5
7507	746	3053	0.75
7508	746	237	0.5
7509	746	10	0.5
7510	746	1018	0.75
7511	746	3054	1
7512	746	3055	1
7513	746	3056	0.949999988
7514	746	37	0.75
7515	746	3057	1
7516	746	597	0.75
7517	746	3058	1
7518	746	36	0.75
7519	746	9	0.5
7520	746	68	0.5
7521	746	3059	1
7522	746	33	0.75
7523	746	3060	0.949999988
7524	746	531	0.649999976
7525	746	3061	1
7526	746	3062	0.75
7527	746	16	0.5
7528	746	1943	1
7529	747	1012	0.5
7530	747	37	0.5
7531	747	6	0.5
7532	747	3063	0.5
7533	747	9	0.5
7534	747	10	0.5
7535	747	3064	0.5
7536	747	312	0.5
7537	747	1	0.5
7538	747	277	0.5
7539	747	1168	0.5
7540	747	109	0.5
7541	747	16	0.5
7542	748	3065	0.100000001
7543	748	250	0.75
7544	748	37	1
7545	748	531	0.5
7546	748	3066	0.75
7547	748	1012	0.75
7548	748	3067	0.75
7549	749	3068	0.899999976
7550	749	1663	0.899999976
7551	749	3069	0.899999976
7552	750	3068	0.899999976
7553	750	1663	0.899999976
7554	750	3069	0.899999976
7555	751	3070	1
7556	752	3071	1
7557	753	2018	0.800000012
7558	753	3072	0.800000012
7559	753	3073	0.699999988
7560	753	3074	0.899999976
7561	753	37	0.699999988
7562	753	425	0.600000024
7563	753	531	0.600000024
7564	753	14	0.400000006
7565	753	82	0.400000006
7566	754	3075	0.600000024
7567	754	3076	0.5
7568	754	3077	0.300000012
7569	754	3078	0.400000006
7570	754	3079	0.200000003
7571	754	3080	0.200000003
7572	754	3081	0.400000006
7573	754	3082	0.400000006
7574	754	14	0.899999976
7575	754	724	0.699999988
7576	754	686	0.5
7577	754	33	0.600000024
7578	754	36	0.600000024
7579	754	427	0.600000024
7580	754	74	0.400000006
7581	754	3083	0.5
7582	755	3084	0.75
7583	755	548	0.25
7584	755	546	0.75
7585	755	395	0.5
7586	755	3085	0.5
7587	755	107	0.5
7588	755	419	0.5
7589	755	3086	0.5
7590	756	3087	1
7591	756	3088	1
7592	757	480	1
7593	757	3089	0.5
7594	758	3090	0.529999971
7595	758	3091	0.170000002
7596	758	3092	0.140000001
7597	758	3093	0.109999999
7598	758	3094	0.0700000003
7599	758	3095	0.899999976
7600	758	3096	0.75
7601	759	3097	0.899999976
7602	759	3098	0.5
7603	760	3099	1
7604	760	3100	0.25
7605	760	3101	0.25
7606	760	3102	0.100000001
7607	760	3103	0.100000001
7608	761	3104	0.75
7609	761	127	0.5
7610	761	434	0.5
7611	761	693	0.5
7612	761	3105	0.25
7613	762	3106	1
7614	762	3101	0.200000003
7615	762	3102	0.200000003
7616	762	3107	0.200000003
7617	762	3108	0.200000003
7618	762	3109	0.200000003
7619	763	3110	1
7620	764	3111	0.200000003
7621	764	3112	0.200000003
7622	764	3113	0.300000012
7623	764	3114	0.200000003
7624	765	3115	0.800000012
7625	765	3116	0.5
7626	765	3117	0.300000012
7627	765	2918	0.800000012
7628	765	3118	0.800000012
7629	765	2919	0.800000012
7630	765	3119	0.800000012
7631	765	291	0.400000006
7632	765	37	0.400000006
7633	765	3120	0.600000024
7634	766	3121	0.600000024
7635	766	3122	0.400000006
7636	766	3123	0.400000006
7637	766	3124	0.300000012
7638	766	3125	0.899999976
7639	766	292	1
7640	766	3126	0.899999976
7641	766	10	0.600000024
7642	766	16	0.400000006
7643	766	3127	0.949999988
7644	766	3128	0.949999988
7645	767	489	0.800000012
7646	767	3129	0.800000012
7647	767	522	0.800000012
7648	767	3130	0.400000006
7649	767	1814	0.600000024
7650	767	445	0.800000012
7651	767	3131	0.600000024
7652	767	441	0.699999988
7653	767	441	0.699999988
7654	767	13	0.899999976
7655	767	3132	0.899999976
7656	768	2544	0.699999988
7657	768	32	0.699999988
7658	768	2559	0.600000024
7659	768	83	0.5
7660	768	3133	0.800000012
7661	768	3134	0.800000012
7662	768	3135	0.699999988
7663	768	704	0.699999988
7664	768	3136	0.600000024
7665	768	3137	0.600000024
7666	768	291	0.5
7667	768	82	0.5
7668	768	3138	0.300000012
7669	768	546	0.5
7670	768	3139	0
7671	768	3140	0.400000006
7672	768	896	0.5
7673	768	703	0.400000006
7674	768	1263	0.400000006
7675	768	8	0.300000012
7676	768	3141	0.400000006
7677	768	2018	0.300000012
7678	768	3142	0.600000024
7679	768	768	0.600000024
7680	768	3143	0.600000024
7681	769	3144	0.400000006
7682	769	3145	0.400000006
7683	769	3146	0.400000006
7684	769	3147	0.400000006
7685	769	40	0.800000012
7686	769	661	0.600000024
7687	769	79	0.600000024
7688	769	304	0.600000024
7689	769	275	0.400000006
7690	769	277	0.400000006
7691	769	716	0.200000003
7692	770	729	0.800000012
7693	770	3148	0.800000012
7694	770	3149	0.5
7695	770	3150	0.5
7696	770	3151	0.5
7697	770	3144	0.5
7698	770	3152	0.300000012
7699	770	3147	0.600000024
7700	770	3153	0.5
7701	770	3154	0.5
7702	770	3155	0.5
7703	770	3156	0.300000012
7704	770	3157	0.5
7705	770	3158	0.5
7706	770	344	0.5
7707	771	3159	0.899999976
7708	771	3160	0.699999988
7709	771	3161	0.600000024
7710	771	3162	0.5
7711	771	3163	0.5
7712	771	3164	0.5
7713	772	703	0.949999988
7714	772	3165	0.600000024
7715	772	3166	0.5
7716	772	3167	0.400000006
7717	772	3168	0.400000006
7718	772	3169	0.600000024
7719	773	3170	0.5
7720	773	3171	0.5
7721	773	3172	0.5
7722	773	3173	0.5
7723	773	3174	0.5
7724	773	3175	0.200000003
7725	773	3176	0.5
7726	773	3177	0.5
7727	773	3165	0.5
7728	773	3166	0.5
7729	773	3178	0.5
7730	773	3179	0.5
7731	773	3180	0.5
7732	773	3181	0.5
7733	773	3182	0.5
7734	774	3170	0.5
7735	774	3171	0.5
7736	774	3173	0.5
7737	774	3174	0.5
7738	774	3175	0.200000003
7739	774	3176	0.5
7740	774	3177	0.5
7741	774	3165	0.5
7742	774	3166	0.5
7743	774	3178	0.5
7744	774	3179	0.5
7745	774	3180	0.5
7746	774	3181	0.5
7747	774	3182	0.5
7748	774	2940	1
7749	774	3183	0.899999976
7750	774	73	0.899999976
7751	775	3184	0.0700000003
7752	775	3185	0.0500000007
7753	775	3186	0.100000001
7754	776	3187	0.100000001
7755	776	3188	0.0500000007
7756	777	3189	0.75
7757	777	16	0.5
7758	777	10	0.5
7759	777	3190	0.00999999978
7760	777	3191	0.5
7761	777	3192	0.949999988
7762	777	3193	0.899999976
7763	777	659	0.150000006
7764	777	3194	0.200000003
7765	777	3195	0.100000001
7766	777	3196	0.00200000009
7767	777	3197	0.000500000024
7768	778	3198	0.100000001
7769	778	3199	0.100000001
7770	778	3200	0.100000001
7771	778	3201	0.100000001
7772	779	3202	0.100000001
7773	780	3203	0.100000001
7774	780	3204	0.100000001
7775	780	3205	0.100000001
7776	780	3206	0.100000001
7777	780	3207	0.100000001
7778	780	3208	0.100000001
7779	780	3108	0.100000001
7780	780	3209	0.100000001
7781	780	3210	0.100000001
7782	781	3211	0.5
7783	781	14	0.5
7784	781	1357	0.5
7785	781	82	0.5
7786	781	3212	0.100000001
7787	781	10	0.5
7788	781	239	0.5
7789	781	1	0.5
7790	781	427	0.5
7791	781	427	0.5
7792	781	3213	0.5
7793	781	6	0.5
7794	781	391	0.5
7795	781	3214	0.5
7796	781	2546	0.5
7797	781	1694	0.5
7798	781	3215	0.5
7799	781	724	0.5
7800	781	3216	0.5
7801	781	390	0.5
7802	781	16	0.5
7803	781	9	0.5
7804	782	14	0.75
7805	782	3217	0.75
7806	783	71	0.75
7807	783	3218	0.899999976
7808	783	3219	0.75
7809	783	3220	0.5
7810	784	3221	1
7811	785	1	0.5
7812	785	9	0.5
7813	785	1694	0.5
7814	785	10	0.5
7815	785	14	0.5
7816	785	3222	0.5
7817	785	16	0.5
7818	785	6	0.5
7819	785	239	0.5
7820	786	235	0.5
7821	786	1290	0.5
7822	786	6	0.5
7823	786	10	0.5
7824	786	2242	0.5
7825	786	422	0.5
7826	786	35	0.5
7827	786	634	0.5
7828	786	292	0.5
7829	786	1528	0.5
7830	786	324	0.5
7831	786	37	0.5
7832	786	1644	0.5
7833	786	3223	0.5
7834	786	9	0.5
7835	786	68	0.5
7836	786	659	0.5
7837	786	3224	0.5
7838	786	426	0.5
7839	786	107	0.5
7840	786	3225	0.5
7841	786	16	0.5
7842	786	15	0.75
7843	787	235	0.5
7844	787	896	0.5
7845	787	6	0.5
7846	787	10	0.5
7847	787	3226	0.5
7848	787	857	0.5
7849	787	3227	0.5
7850	787	1	0.5
7851	787	3228	0.5
7852	787	3229	0.5
7853	787	1262	0.5
7854	787	3230	0.5
7855	787	3231	0.5
7856	787	2691	0.5
7857	787	9	0.5
7858	787	68	0.5
7859	787	2695	0.100000001
7860	787	3232	0.5
7861	787	2109	0.5
7862	787	3233	0.5
7863	787	16	0.5
7864	788	235	0.5
7865	788	122	0.5
7866	788	391	0.100000001
7867	788	416	0.5
7868	788	10	0.5
7869	788	3234	0.5
7870	788	427	0.5
7871	788	422	0.5
7872	788	425	0.5
7873	788	12	0.5
7874	788	292	0.5
7875	788	599	0.5
7876	788	53	0.5
7877	788	9	0.5
7878	788	68	0.5
7879	788	88	0.5
7880	788	33	0.5
7881	788	8	0.5
7882	788	3235	0.100000001
7883	788	3236	0.5
7884	788	107	0.5
7885	788	2495	0.5
7886	788	420	0.5
7887	788	16	0.5
7888	788	3237	0.5
7889	788	970	0.5
7890	788	14	0.5
7891	788	6	0.5
7892	788	3238	0.5
7893	788	3239	0.5
7894	788	3240	0.5
7895	788	275	0.100000001
7896	788	801	0.5
7897	788	74	0.5
7898	788	536	0.5
7899	788	1842	0.5
7900	788	40	0.5
7901	788	37	0.5
7902	788	567	0.5
7903	788	547	0.5
7904	788	36	0.5
7905	788	291	0.5
7906	788	162	0.5
7907	788	79	0.5
7908	788	419	0.5
7909	788	277	0.5
7910	788	390	0.100000001
7911	788	38	0.5
7912	789	421	0.75
7913	789	3241	0.5
7914	789	291	0.75
7915	789	40	0.75
7916	789	3242	0.5
7917	789	2009	0.25
7918	789	715	0.25
7919	789	445	0.5
7920	789	3243	0.100000001
7921	789	3244	0.25
7922	789	716	0.5
7923	789	3245	0.5
7924	789	3246	0.75
7925	789	3247	0.5
7926	790	235	0.5
7927	790	3248	0.5
7928	790	236	0.5
7929	790	6	0.5
7930	790	3249	0.5
7931	790	3250	0.949999988
7932	790	237	0.5
7933	790	10	0.5
7934	790	3251	0.5
7935	790	3252	0.649999976
7936	790	3253	0.5
7937	790	3254	0.5
7938	790	9	0.5
7939	790	68	0.5
7940	790	3255	0.5
7941	790	3256	0.5
7942	790	3257	0.5
7943	790	3258	0.5
7944	790	3259	0.649999976
7945	790	16	0.5
7946	790	3260	0.25
7947	791	3261	0.5
7948	791	235	0.5
7949	791	3262	0.5
7950	791	14	0.75
7951	791	236	0.5
7952	791	6	0.5
7953	791	1018	0.5
7954	791	3263	0.5
7955	791	3250	0.949999988
7956	791	37	0.5
7957	791	237	0.5
7958	791	9	0.5
7959	791	10	0.5
7960	791	68	0.5
7961	791	531	0.649999976
7962	791	16	0.5
7963	791	71	0.5
7964	791	3260	0.25
7965	791	1030	0.5
7966	792	235	0.5
7967	792	16	0.5
7968	792	3258	0.75
7969	792	236	0.5
7970	792	6	0.5
7971	792	275	0.75
7972	792	3250	0.949999988
7973	792	277	0.75
7974	792	237	0.5
7975	792	9	0.5
7976	792	10	0.5
7977	792	68	0.5
7978	792	3264	0.75
7979	792	79	0.75
7980	792	3260	0.25
7981	792	1030	0.5
7982	793	422	0.5
7983	793	1	0.5
7984	793	431	0.5
7985	793	9	0.5
7986	793	1430	1
7987	793	569	0.5
7988	793	442	0.5
7989	793	36	0.5
7990	793	40	0.5
7991	793	434	0.5
7992	793	35	0.5
7993	793	10	0.5
7994	793	809	0.5
7995	793	632	0.5
7996	793	3265	0.5
7997	793	33	0.5
7998	793	3266	0.5
7999	793	16	0
8000	793	292	0.5
8001	794	16	0
8002	794	10	1
8003	794	14	0.99000001
8004	794	32	0.74000001
8005	794	262	0.560000002
8006	794	3267	0.25
8007	794	380	0.100000001
8008	794	2105	0.25
8009	794	2103	0.25
8010	794	3268	0.25
8011	794	3269	0.25
8012	794	3270	0.25
8013	795	3271	0.99000001
8014	795	863	0.800000012
8015	795	1497	0.800000012
8016	795	1050	0.800000012
8017	796	37	0.800000012
8018	796	257	0.800000012
8019	796	3272	0.899999976
8020	796	3273	0.699999988
8021	797	1810	0.899999976
8022	797	2958	0.899999976
8023	797	3274	0.400000006
8024	797	3275	0.300000012
8025	797	1911	0.400000006
8026	797	2463	0.699999988
8027	797	3276	0.699999988
8028	797	3277	0.400000006
8029	797	3043	0.400000006
8030	797	2471	0.800000012
8031	797	3278	0.200000003
8032	797	3279	0.400000006
8033	797	3280	0.5
8034	797	3281	0.800000012
8035	797	3282	0.600000024
8036	797	3283	0.600000024
8037	797	3284	0.800000012
8038	797	2467	0.800000012
8039	797	3285	0.800000012
8040	797	860	0.800000012
8041	797	3286	0.300000012
8042	797	3287	0.400000006
8043	797	2255	1
8044	798	612	0.75
8045	798	611	0.75
8046	798	59	0.75
8047	798	3288	0.75
8048	798	3289	1
8049	798	2975	0.100000001
8050	798	624	0.100000001
8051	798	3290	0.100000001
8052	798	614	0.75
8053	799	3291	0.99000001
8054	799	3292	0.800000012
8055	799	3293	0.400000006
8056	799	2111	0.5
8057	799	3294	0.5
8058	799	3295	0.800000012
8059	799	107	0.800000012
8060	799	419	0.800000012
8061	799	3296	0.300000012
8062	799	2255	1
8063	800	235	0.5
8064	800	14	0.5
8065	800	6	0.5
8066	800	1295	0.5
8067	800	10	0.5
8068	800	3297	0.5
8069	800	427	0.5
8070	800	3298	0.5
8071	800	74	0.5
8072	800	634	0.5
8073	800	292	0.5
8074	800	107	0.5
8075	800	37	1
8076	800	38	0.5
8077	800	547	0.5
8078	800	3299	0.5
8079	800	36	0.5
8080	800	53	0.5
8081	800	291	0.5
8082	800	9	0.5
8083	800	68	0.5
8084	800	1294	0.5
8085	800	79	0.5
8086	800	33	0.5
8087	800	659	0.5
8088	800	16	0.5
8089	800	107	0.5
8090	800	420	0.5
8091	800	3300	0.5
8092	800	40	0.5
8093	801	16	0.800000012
8094	801	10	0.200000003
8095	801	181	1
8096	801	3301	0.800000012
8097	801	3302	0.800000012
8098	801	71	0.300000012
8099	801	2255	0.660000026
8100	801	3303	0.400000006
8101	802	3304	0.899999976
8102	802	3305	0.899999976
8103	802	68	0.899999976
8104	802	3306	1
8105	802	3307	0.699999988
8106	802	3308	0.600000024
8107	802	3309	0.5
8108	802	3310	0.5
8109	803	6	0.5
8110	803	661	0.5
8111	803	421	0.5
8112	803	291	0.5
8113	803	9	0.5
8114	803	40	0.5
8115	803	1	0.5
8116	803	40	0.5
8117	803	3311	0.5
8118	803	24	0.5
8119	804	235	0.5
8120	804	236	0.5
8121	804	1007	0.75
8122	804	6	0.5
8123	804	237	0.5
8124	804	3312	0.5
8125	804	10	0.5
8126	804	3313	0.25
8127	804	3314	0.5
8128	804	3315	0.25
8129	804	3316	0.75
8130	804	3317	0.75
8131	804	3318	0.949999988
8132	804	3319	0.949999988
8133	804	3320	0.649999976
8134	804	9	0.5
8135	804	68	0.5
8136	804	3321	0.75
8137	804	3322	0.649999976
8138	804	3323	0.949999988
8139	804	3324	0.25
8140	804	3325	0.100000001
8141	804	16	0.5
8142	805	68	1
8143	805	3326	0.5
8144	805	3327	0.800000012
8145	805	3328	1
8146	806	2619	0.5
8147	806	1	0.5
8148	806	3329	0.5
8149	806	3330	0.5
8150	806	57	0.5
8151	806	14	0.5
8152	806	97	0.5
8153	806	3331	0.5
8154	806	9	0.5
8155	806	3332	0.5
8156	806	10	1
8157	806	378	0.5
8158	806	35	0.5
8159	806	3333	0.5
8160	806	95	0.5
8161	806	94	0.5
8162	806	16	0
8163	806	3334	0.5
8164	806	3335	0.5
8165	806	896	0.5
8166	807	235	0.5
8167	807	2510	0.5
8168	807	10	0.5
8169	807	236	0.5
8170	807	83	0.5
8171	807	68	0.5
8172	807	3336	0.5
8173	807	425	0.5
8174	807	400	0.5
8175	807	3337	0.5
8176	807	3338	0.5
8177	807	531	0.5
8178	807	6	0.5
8179	807	1663	0.5
8180	807	3339	0.5
8181	807	3340	0.5
8182	807	16	0.5
8183	807	1223	0.5
8184	807	9	0.5
8185	808	3341	0.75
8186	808	235	0.5
8187	808	16	0.5
8188	808	3342	0.75
8189	808	3343	0.75
8190	808	236	0.5
8191	808	1	0.5
8192	808	6	0.5
8193	808	255	0.75
8194	808	237	0.5
8195	808	9	0.5
8196	808	10	0.5
8197	808	68	0.5
8198	808	1484	0.75
8199	808	3344	0.75
8200	809	247	0.600000024
8201	809	3345	0.600000024
8202	809	3346	0.800000012
8203	809	3347	0.800000012
8204	809	292	0.600000024
8205	809	324	0.600000024
8206	809	3348	0.899999976
8207	809	1475	0.899999976
8208	809	857	0.899999976
8209	809	37	0.200000003
8210	810	3349	0.699999988
8211	810	74	0.99000001
8212	810	1117	0.600000024
8213	810	37	0.800000012
8214	811	235	0.5
8215	811	37	0.5
8216	811	3350	0.25
8217	811	236	0.5
8218	811	6	0.5
8219	811	36	0.100000001
8220	811	237	0.5
8221	811	9	0.5
8222	811	10	0.5
8223	811	68	0.5
8224	811	1117	0.5
8225	811	3351	0.949999988
8226	811	377	1
8227	811	16	0.5
8228	812	3352	0.75
8229	812	3353	0.75
8230	812	3354	0.5
8231	812	3355	0.800000012
8232	812	3356	0.100000001
8233	813	3357	0.5
8234	813	235	0.5
8235	813	14	0.5
8236	813	3358	0.949999988
8237	813	236	0.5
8238	813	6	0.5
8239	813	3359	1
8240	813	237	0.5
8241	813	9	0.5
8242	813	10	0.5
8243	813	68	0.5
8244	813	3360	1
8245	813	531	0.100000001
8246	813	16	0.5
8247	814	1	0.5
8248	814	2638	0.5
8249	814	16	0.5
8250	814	3361	0.5
8251	814	3362	0.5
8252	814	74	0.5
8253	814	250	0.5
8254	814	3363	0.5
8255	814	10	0.5
8256	814	68	0.5
8257	814	14	0.5
8258	814	3364	0.5
8259	814	16	0.5
8260	814	3144	0.5
8261	814	6	0.5
8262	814	9	0.5
8263	815	3365	0.5
8264	815	1117	0.75
8265	815	3366	0.910000026
8266	815	3367	0.0900000036
8267	815	3368	0.75
8268	815	3268	0.75
8269	816	235	0.5
8270	816	37	0.75
8271	816	3351	0.949999988
8272	816	236	0.5
8273	816	597	0.5
8274	816	3350	0.25
8275	816	6	0.5
8276	816	237	0.5
8277	816	9	0.5
8278	816	10	0.5
8279	816	68	0.5
8280	816	3367	0.75
8281	816	16	0.5
8282	816	1117	1
8283	816	378	0.75
8284	817	235	0.5
8285	817	3350	0.25
8286	817	236	0.5
8287	817	6	0.5
8288	817	237	0.5
8289	817	9	0.5
8290	817	10	0.5
8291	817	68	0.5
8292	817	832	0.100000001
8293	817	3351	0.949999988
8294	817	377	1
8295	817	16	0.5
8296	818	235	0.75
8297	818	37	0.75
8298	818	3351	0.949999988
8299	818	236	0.5
8300	818	3350	0.25
8301	818	6	0.100000001
8302	818	36	0.75
8303	818	2219	0.100000001
8304	818	237	0.5
8305	818	9	0.100000001
8306	818	10	0.5
8307	818	68	0.75
8308	818	377	1
8309	818	16	0.5
8310	818	1117	0.100000001
8311	819	3369	0.899999976
8312	819	68	0.5
8313	819	3370	0.5
8314	820	14	0.879999995
8315	820	2838	0.629999995
8316	820	291	0.379999995
8317	820	2428	0.230000004
8318	820	3371	0.150000006
8319	820	76	0.0599999987
8320	820	105	0.0599999987
8321	820	71	0.0299999993
8322	821	3372	1
8323	822	235	0.5
8324	822	37	0.100000001
8325	822	3351	0.949999988
8326	822	236	0.5
8327	822	3350	0.25
8328	822	832	0.75
8329	822	6	0.5
8330	822	36	0.100000001
8331	822	2219	0.100000001
8332	822	237	0.5
8333	822	9	0.5
8334	822	10	0.5
8335	822	68	0.5
8336	822	377	1
8337	822	16	0.5
8338	822	1117	0.100000001
8339	823	15	1
8340	823	422	0.75
8341	823	3373	0.5
8342	823	1199	0.0500000007
8343	823	3374	0.25
8344	824	3375	0.75
8345	824	3376	0.75
8346	824	181	0.75
8347	825	235	0.5
8348	825	236	0.5
8349	825	6	0.5
8350	825	237	0.5
8351	825	10	0.5
8352	825	425	0.5
8353	825	536	0.5
8354	825	3377	0.25
8355	825	37	1
8356	825	599	1
8357	825	3378	0.5
8358	825	277	0.5
8359	825	9	0.5
8360	825	68	0.5
8361	825	3379	0.5
8362	825	3380	0.949999988
8363	825	2264	0.5
8364	825	555	0.5
8365	825	3381	0.949999988
8366	825	1759	0.5
8367	825	3382	0.100000001
8368	825	16	0.5
8369	825	566	0.5
8370	826	235	0.75
8371	826	37	1
8372	826	599	1
8373	826	236	0.5
8374	826	6	0.5
8375	826	3383	0.75
8376	826	237	0.5
8377	826	9	0.5
8378	826	10	0.5
8379	826	68	0.75
8380	826	16	0.5
8381	827	3384	1
8382	827	3385	1
8383	828	3386	1
8384	829	235	0.5
8385	829	6	0.5
8386	829	59	0.5
8387	829	9	0.5
8388	829	10	0.5
8389	829	68	0.5
8390	829	1	0.5
8391	829	425	0.5
8392	829	531	0.5
8393	829	16	0.5
8394	829	3387	0.5
8395	830	235	0.5
8396	830	16	0.5
8397	830	3388	0.5
8398	830	3389	0.5
8399	830	10	0.5
8400	830	68	0.5
8401	830	6	0.5
8402	830	9	0.5
8403	831	3390	0.5
8404	832	3391	0.5
8405	832	3392	0.800000012
8406	832	1025	0.899999976
8407	832	37	0.899999976
8408	832	3393	0.800000012
8409	832	79	0.800000012
8410	832	425	0.800000012
8411	832	38	0.800000012
8412	832	8	0.600000024
8413	832	324	0.5
8414	832	1131	0.400000006
8415	832	3394	0.699999988
8416	833	37	0.600000024
8417	833	292	0.600000024
8418	833	277	0.800000012
8419	833	109	0.800000012
8420	833	3395	0.699999988
8421	834	681	0.899999976
8422	834	303	0.899999976
8423	834	33	0.899999976
8424	834	36	0.600000024
8425	834	292	0.600000024
8426	834	37	0.5
8427	834	1197	0.899999976
8428	834	2227	0.949999988
8429	835	892	0.600000024
8430	835	3396	0.600000024
8431	835	3397	0.699999988
8432	835	3398	0.200000003
8433	835	3399	0.99000001
8434	835	1393	1
8435	835	3400	0.600000024
8436	835	3401	0.899999976
8437	836	2255	1
8438	836	3402	1
8439	837	2255	1
8440	837	3402	1
8441	838	2255	1
8442	838	3402	1
8443	839	2255	1
8444	839	2336	1
8445	839	2338	1
8446	839	3402	1
8447	840	2255	1
8448	840	3402	1
8449	841	422	0.75
8450	841	235	0.5
8451	841	16	0.5
8452	841	15	0.75
8453	841	1514	0.75
8454	841	3403	0.75
8455	841	3404	0.949999988
8456	841	236	0.5
8457	841	6	0.5
8458	841	255	0.75
8459	841	1518	0.75
8460	841	3405	0.75
8461	841	237	0.5
8462	841	9	0.5
8463	841	10	0.5
8464	841	68	0.5
8465	841	3406	0.75
8466	841	292	0.75
8467	842	235	0.5
8468	842	16	0.5
8469	842	3403	0.75
8470	842	3407	0.75
8471	842	1618	0.75
8472	842	236	0.5
8473	842	6	0.5
8474	842	3408	0.75
8475	842	3409	0.75
8476	842	237	0.5
8477	842	9	0.5
8478	842	10	0.5
8479	842	68	0.5
8480	842	3410	0.949999988
8481	842	3411	0.75
8482	843	3227	0.5
8483	843	235	0.5
8484	843	3412	0.5
8485	843	10	0.5
8486	843	3413	0.5
8487	843	2311	0.5
8488	843	16	0.5
8489	843	1	0.5
8490	843	6	0.5
8491	843	2677	0.5
8492	843	9	0.5
8493	843	3414	0.5
8494	843	68	0.5
8495	843	3415	0.5
8496	843	3226	0.5
8497	843	3416	0.5
8498	843	21	0.25
8499	844	235	0.5
8500	844	9	0.5
8501	844	10	0.5
8502	844	68	0.5
8503	844	422	0.5
8504	844	16	0.5
8505	844	1	0.5
8506	844	6	0.5
8507	844	461	1
8508	844	21	0.25
8509	845	3417	1
8510	845	3418	0.400000006
8511	845	3419	0.400000006
8512	846	3420	0.75
8513	846	3421	0.75
8514	846	1286	0.5
8515	846	229	0.25
8516	847	3422	1
8517	848	193	0.75
8518	848	3423	0.75
8519	848	3424	0.75
8520	848	3425	0.75
8521	849	235	0.5
8522	849	16	0.5
8523	849	3426	0.75
8524	849	236	0.5
8525	849	3427	0.75
8526	849	3428	1
8527	849	6	0.5
8528	849	237	0.5
8529	849	3429	1
8530	849	10	0.5
8531	849	68	0.5
8532	849	3430	0.75
8533	849	3431	0.75
8534	849	1754	0.649999976
8535	849	9	0.5
8536	850	235	0.5
8537	850	37	0.100000001
8538	850	10	0.5
8539	850	3432	0.75
8540	850	3433	0.75
8541	850	236	0.5
8542	850	6	0.5
8543	850	3434	0.949999988
8544	850	3435	0.75
8545	850	3436	0.25
8546	850	237	0.5
8547	850	9	0.5
8548	850	3437	0.75
8549	850	68	0.5
8550	850	3438	0.75
8551	850	16	0.5
8552	851	3439	1
8553	851	3440	0.75
8554	851	3441	0.100000001
8555	851	425	0.75
8556	851	3288	0
8557	851	1554	0.100000001
8558	852	3442	1
8559	853	3443	0.75
8560	854	3444	1
8561	854	3445	1
8562	855	3446	1
8563	856	3446	1
8564	857	68	0.75
8565	857	37	0.5
8566	857	404	0.5
8567	857	292	0.5
8568	857	33	0.5
8569	857	74	0.5
8570	857	3447	0.75
8571	858	3448	1
8572	859	71	0.0500000007
8573	859	3449	0.800000012
8574	859	3450	0.5
8575	859	568	0.300000012
8576	859	3451	1
8577	859	3452	0.899999976
8578	859	820	0.800000012
8579	859	3301	0.800000012
8580	860	3449	0.800000012
8581	860	3450	0.5
8582	860	568	0.300000012
8583	860	1008	0.800000012
8584	860	2683	0.800000012
8585	860	3453	0.800000012
8586	860	3301	0.800000012
8587	861	303	0.899999976
8588	861	3454	0.949999988
8589	861	3455	0.5
8590	861	3456	0.5
8591	861	3457	0.400000006
8592	861	3458	0.600000024
8593	861	3459	0.600000024
8594	861	181	0.600000024
8595	862	37	0.899999976
8596	862	3460	0.899999976
8597	862	419	0.5
8598	862	1663	1
8599	862	3461	0.99000001
8600	862	3462	0.899999976
8601	862	3463	0.800000012
8602	862	2859	0.699999988
8603	862	3464	0.800000012
8604	862	3465	0.699999988
8605	862	16	0.200000003
8606	862	10	0.800000012
8607	862	501	0.699999988
8608	863	235	0.5
8609	863	236	0.5
8610	863	6	0.5
8611	863	237	0.5
8612	863	9	0.5
8613	863	10	0.5
8614	863	68	0.5
8615	863	3466	0.75
8616	863	3467	0.949999988
8617	863	3468	0.75
8618	863	3469	0.75
8619	863	127	0.75
8620	863	16	0.5
8621	863	3470	1
8622	864	37	0.899999976
8623	864	553	0.800000012
8624	864	77	0.699999988
8625	864	36	0.800000012
8626	864	292	0.5
8627	864	40	0.800000012
8628	864	163	0.600000024
8629	864	569	0.600000024
8630	864	14	0.699999988
8631	864	8	0.200000003
8632	864	74	0.899999976
8633	864	377	0.850000024
8634	864	1117	0.200000003
8635	864	475	0.100000001
8636	864	3471	0.0500000007
8637	864	431	0.0500000007
8638	864	94	0.5
8639	865	3472	0.899999976
8640	865	3473	0.5
8641	865	3474	0.25
8642	866	1	0.5
8643	866	3475	0.5
8644	866	3476	0.5
8645	866	3477	0.5
8646	866	397	0.5
8647	866	3478	0.5
8648	866	6	0.5
8649	866	397	0.5
8650	866	105	0.5
8651	866	3479	0.5
8652	866	3480	0.5
8653	866	10	0.5
8654	866	3481	0.5
8655	866	3482	0.5
8656	866	390	0.5
8657	866	16	0.5
8658	866	3483	0.5
8659	866	9	0.5
8660	867	6	0.5
8661	867	3484	0.5
8662	867	434	0.5
8663	867	9	0.5
8664	867	10	0.5
8665	867	68	0.100000001
8666	867	857	0.5
8667	867	1	0.5
8668	867	40	0.5
8669	867	277	0.5
8670	867	3485	0.5
8671	867	16	0.5
8672	867	292	0.5
8673	868	1849	0.99000001
8674	868	3486	0.800000012
8675	868	291	0.800000012
8676	868	3137	0.600000024
8677	868	1564	0.699999988
8678	868	3487	0.699999988
8679	868	2494	0.5
8680	868	801	0.5
8681	869	3488	0.5
8682	869	3489	0.5
8683	869	9	0.5
8684	869	10	0.5
8685	869	3490	0.5
8686	869	3491	0.5
8687	869	3492	0.5
8688	869	16	0.5
8689	869	6	0.5
8690	870	16	0.800000012
8691	870	10	0.200000003
8692	870	3493	0.899999976
8693	870	247	0.800000012
8694	870	3494	0.800000012
8695	870	3495	0.800000012
8696	870	3496	0.699999988
8697	870	3497	0.699999988
8698	870	3498	0.699999988
8699	870	3499	0.600000024
8700	870	2453	0.899999976
8701	870	1663	1
8702	871	16	0.699999988
8703	871	10	0.300000012
8704	871	3500	0.699999988
8705	871	3501	0.600000024
8706	871	2064	0.899999976
8707	871	70	0.899999976
8708	871	511	0.899999976
8709	871	191	0.800000012
8710	871	468	0.699999988
8711	872	16	0.670000017
8712	872	10	0.330000013
8713	872	3388	0.5
8714	872	3502	0.600000024
8715	872	257	0.5
8716	872	3503	0.5
8717	872	79	0.600000024
8718	872	395	0.600000024
8719	872	53	0.600000024
8720	872	3504	0.800000012
8721	872	71	0.800000012
8722	872	777	0.699999988
8723	872	3505	0.699999988
8724	872	37	0.400000006
8725	872	3506	0.699999988
8726	872	185	0.600000024
8727	872	3507	0.400000006
8728	872	3508	0.400000006
8729	872	76	0.5
8730	872	105	0.300000012
8731	872	3509	0.949999988
8732	873	3510	0.949999988
8733	873	3511	0.600000024
8734	873	43	0.600000024
8735	873	3512	0.300000012
8736	873	115	0.800000012
8737	873	292	0.800000012
8738	873	397	0.800000012
8739	873	411	0.699999988
8740	873	88	0.699999988
8741	873	393	0.600000024
8742	873	90	0.600000024
8743	873	724	0.5
8744	874	1997	0.5
8745	874	14	0.5
8746	874	1238	0.5
8747	874	3513	0.75
8748	875	411	0.5
8749	875	397	0.5
8750	875	1011	0.100000001
8751	875	2838	0.349999994
8752	876	3514	0.5
8753	877	3515	0.5
8754	877	1430	0.5
8755	877	35	0.5
8756	877	10	0.5
8757	877	16	0
8758	877	9	0.5
8759	878	1	0.5
8760	878	3516	0.5
8761	878	3517	0.5
8762	878	419	0.5
8763	878	3518	0.5
8764	878	3519	0.5
8765	878	3520	0.5
8766	878	401	0.5
8767	878	3521	0.5
8768	878	2854	0.5
8769	878	6	0.5
8770	878	10	0.5
8771	878	68	0.5
8772	878	3522	0.5
8773	878	16	0.5
8774	878	9	0.5
8775	879	235	0.5
8776	879	3523	0.5
8777	879	3524	0.5
8778	879	6	0.5
8779	879	3525	0.5
8780	879	3526	0.5
8781	879	10	0.5
8782	879	3527	0.5
8783	879	1	0.5
8784	879	3528	0.5
8785	879	3529	0.5
8786	879	3530	0.5
8787	879	3531	0.5
8788	879	3532	0.5
8789	879	9	0.5
8790	879	1421	0.5
8791	879	68	0.5
8792	879	1433	0.5
8793	879	3533	0.5
8794	879	3534	0.5
8795	879	3535	0.5
8796	879	3536	0.5
8797	879	3537	0.5
8798	879	3538	0.5
8799	879	16	0.5
8800	880	3539	1
8801	881	235	0.5
8802	881	600	0.5
8803	881	14	1
8804	881	250	0.5
8805	881	107	0.100000001
8806	881	10	0.5
8807	881	3540	0.5
8808	881	3541	0.5
8809	881	790	0.5
8810	881	109	0.5
8811	881	635	0.5
8812	881	35	0.5
8813	881	37	0.5
8814	881	3542	0.5
8815	881	277	0.5
8816	881	401	0.5
8817	881	68	0.5
8818	881	6	0.5
8819	881	419	0.5
8820	881	478	0.5
8821	881	3543	0.100000001
8822	881	16	0.5
8823	881	9	0.5
8824	882	3544	0.75
8825	882	37	0.5
8826	882	291	0.5
8827	882	53	0.5
8828	882	292	0.5
8829	882	619	0.5
8830	882	566	0.5
8831	883	3545	0.5
8832	883	3546	0.5
8833	883	6	0.5
8834	883	3547	0.5
8835	883	291	0.5
8836	883	79	0.5
8837	883	1	0.5
8838	883	40	0.5
8839	883	3548	0.5
8840	883	3549	0.5
8841	883	9	0.5
8842	884	235	0.5
8843	884	3262	0.100000001
8844	884	14	0.75
8845	884	236	0.5
8846	884	1222	0.75
8847	884	6	0.5
8848	884	237	0.5
8849	884	3550	0.25
8850	884	10	0.5
8851	884	1018	0.75
8852	884	76	0.5
8853	884	83	0.5
8854	884	3551	0.949999988
8855	884	3552	0.949999988
8856	884	531	0.649999976
8857	884	77	0.5
8858	884	37	0.75
8859	884	9	0.5
8860	884	68	0.5
8861	884	3553	0.25
8862	884	3554	0.5
8863	884	724	0.75
8864	884	16	0.5
8865	885	235	0.5
8866	885	3237	0.5
8867	885	6	0.5
8868	885	10	0.5
8869	885	3555	0.5
8870	885	1	0.5
8871	885	431	0.5
8872	885	425	0.5
8873	885	767	0.5
8874	885	3556	0.5
8875	885	3557	0.5
8876	885	1843	0.5
8877	885	3558	0.5
8878	885	9	0.5
8879	885	68	0.5
8880	885	162	0.5
8881	885	83	0.5
8882	885	40	0.5
8883	885	1336	0.5
8884	885	1131	0.5
8885	885	247	0.5
8886	885	16	0.5
8887	886	235	0.5
8888	886	37	1
8889	886	9	0.25
8890	886	10	0.5
8891	886	68	0.5
8892	886	422	0.5
8893	886	551	0.5
8894	886	16	0.5
8895	886	6	0.5
8896	887	1384	0.5
8897	887	2336	0.5
8898	887	3559	0.5
8899	887	10	0.5
8900	887	1	0.5
8901	887	637	0.5
8902	887	3560	0.5
8903	887	425	0.5
8904	887	536	0.5
8905	887	35	0.5
8906	887	3561	0.5
8907	887	3562	0.5
8908	887	37	0.5
8909	887	1597	0.5
8910	887	597	0.5
8911	887	3563	0.5
8912	887	250	0.5
8913	887	401	0.5
8914	887	68	0.5
8915	887	6	0.5
8916	887	419	0.5
8917	887	3564	0.5
8918	887	3565	0.5
8919	887	16	0.5
8920	887	9	0.5
8921	887	181	0.75
8922	888	10	0.75
8923	888	16	0.25
8924	889	37	1
8925	890	3566	1
8926	890	3567	0.75
8927	890	291	0.75
8928	890	3568	0.75
8929	891	235	0.5
8930	891	3569	0.949999988
8931	891	236	0.5
8932	891	3570	0.75
8933	891	6	0.5
8934	891	3571	0.75
8935	891	237	0.5
8936	891	10	0.5
8937	891	3572	0.5
8938	891	3573	0.5
8939	891	3574	0.949999988
8940	891	3575	0.5
8941	891	3576	0.100000001
8942	891	3577	0.949999988
8943	891	292	0.5
8944	891	3578	0.75
8945	891	3579	0.75
8946	891	43	0.5
8947	891	597	0.75
8948	891	9	0.5
8949	891	68	0.5
8950	891	33	0.5
8951	891	3580	1
8952	891	3581	0.75
8953	891	3582	0.75
8954	891	531	0.649999976
8955	891	3583	0.75
8956	891	16	0.5
8957	891	3584	0.75
8958	891	3585	0.25
8959	892	3586	0.75
8960	892	3587	0.75
8961	892	37	0.75
8962	892	3588	0.75
8963	892	3589	0.5
8964	892	3571	0.25
8965	892	3590	0.25
8966	892	1290	1
8967	893	3591	0.899999976
8968	893	3587	0.75
8969	893	37	0.75
8970	893	3588	0.75
8971	893	3589	0.5
8972	893	3571	0.25
8973	893	3590	0.25
8974	893	1290	1
8975	894	3592	1
8976	894	3593	1
8977	894	3594	0.949999988
8978	894	163	0.800000012
8979	894	3595	0.800000012
8980	894	3596	0.800000012
8981	895	3597	1
8982	895	3598	1
8983	896	3599	0.5
8984	896	3600	0.800000012
8985	897	3601	1
8986	897	2689	0.800000012
8987	897	3602	0.699999988
8988	897	43	0.600000024
8989	897	3603	0.600000024
8990	897	3604	0.600000024
8991	897	3605	0.600000024
8992	897	3606	0.400000006
8993	898	3607	0.899999976
8994	898	3608	1
8995	898	3609	1
8996	898	1330	0.800000012
8997	898	790	0.800000012
8998	898	304	0.899999976
8999	898	79	0.899999976
9000	899	3610	1
9001	899	3611	1
9002	900	16	0.600000024
9003	900	10	0.400000006
9004	900	3612	0.600000024
9005	900	3613	0.600000024
9006	900	3614	0.600000024
9007	900	2535	0.899999976
9008	900	3615	1
9009	900	3616	0.600000024
9010	900	3617	0.899999976
9011	900	13	0.330000013
9012	900	1597	0.5
9013	901	122	0.800000012
9014	901	713	0.5
9015	902	2686	0.699999988
9016	902	3618	0.5
9017	902	3619	0.400000006
9018	902	291	0.899999976
9019	902	292	0.800000012
9020	902	398	0.600000024
9021	902	3620	0.600000024
9022	903	16	0.5
9023	903	10	0.5
9024	903	3621	1
9025	903	917	0.899999976
9026	903	257	0.899999976
9027	903	892	0.899999976
9028	903	37	0.200000003
9029	903	81	0.200000003
9030	903	82	0.200000003
9031	903	395	0.200000003
9032	903	105	0.5
9033	903	400	0.400000006
9034	904	235	0.5
9035	904	236	0.5
9036	904	6	0.5
9037	904	237	0.5
9038	904	9	0.5
9039	904	10	0.5
9040	904	68	0.5
9041	904	3622	0.75
9042	904	2539	0.75
9043	904	3623	0.75
9044	904	16	0.5
9045	905	185	1
9046	905	3624	0.899999976
9047	905	3625	0.899999976
9048	905	3626	0.600000024
9049	905	3627	0.5
9050	906	3628	0.75
9051	907	972	0.75
9052	907	3629	0.5
9053	907	3630	0.899999976
9054	908	3631	0.899999976
9055	909	6	0.5
9056	909	3632	0.5
9057	909	2538	0.5
9058	910	3633	0.899999976
9059	911	3634	1
9060	912	3635	0.75
9061	912	3636	0.899999976
9062	913	229	0.899999976
9063	914	3637	0.5
9064	914	3638	0.899999976
9065	914	3639	0.100000001
9066	914	115	0.75
9067	914	1901	0.75
9068	915	3640	0.689999998
9069	915	3641	0.280000001
9070	915	3642	0.0280000009
9071	915	3643	0.870000005
9072	915	3644	0.0700000003
9073	915	3645	0.75
9074	915	3646	0.899999976
9075	916	3647	0.899999976
9076	916	3183	0.75
9077	916	115	0.75
9078	916	767	0.75
9079	916	229	0.899999976
9080	917	3183	0.75
9081	917	115	0.75
9082	917	767	0.75
9083	917	229	0.899999976
9084	918	3183	0.75
9085	918	115	0.75
9086	918	767	0.75
9087	918	229	0.899999976
9088	919	3183	0.75
9089	919	115	0.75
9090	919	767	0.75
9091	919	229	0.899999976
9092	920	3183	0.75
9093	920	115	0.75
9094	920	767	0.75
9095	920	229	0.899999976
9096	921	3183	0.75
9097	921	115	0.75
9098	921	767	0.75
9099	921	229	0.899999976
9100	922	3183	0.75
9101	922	115	0.75
9102	922	767	0.75
9103	922	229	0.899999976
9104	923	3183	0.75
9105	923	115	0.75
9106	923	767	0.75
9107	923	229	0.899999976
9108	924	3183	0.75
9109	924	115	0.75
9110	924	767	0.75
9111	924	229	0.899999976
9112	925	3183	0.75
9113	925	3648	0.75
9114	926	6	0.75
9115	926	3632	0.5
9116	926	2538	0.5
9117	927	3183	0.75
9118	927	115	0.75
9119	927	767	0.75
9120	928	3649	1
9121	928	767	0.899999976
9122	928	229	0.899999976
9123	929	3183	0.75
9124	929	115	0.75
9125	929	767	0.75
9126	929	229	0.899999976
9127	930	3183	0.75
9128	930	115	0.75
9129	930	767	0.75
9130	930	229	0.899999976
9131	931	3183	0.75
9132	931	115	0.75
9133	931	767	0.75
9134	931	229	0.899999976
9135	932	3183	0.75
9136	932	115	0.75
9137	932	767	0.75
9138	932	229	0.899999976
9139	933	3183	0.75
9140	933	115	0.75
9141	933	767	0.75
9142	933	229	0.899999976
9143	933	3639	0.75
9144	934	3183	0.75
9145	934	115	0.75
9146	934	767	0.75
9147	934	229	0.899999976
9148	935	3183	0.75
9149	935	115	0.75
9150	935	767	0.75
9151	935	229	0.899999976
9152	936	3183	0.75
9153	936	115	0.75
9154	936	767	0.75
9155	936	229	0.899999976
9156	937	3183	0.75
9157	937	115	0.75
9158	937	767	0.75
9159	937	229	0.899999976
9160	938	3183	0.75
9161	938	115	0.75
9162	938	767	0.75
9163	938	229	0.899999976
9164	939	3183	0.75
9165	939	115	0.75
9166	939	767	0.75
9167	939	229	0.899999976
9168	940	3183	0.75
9169	940	115	0.75
9170	940	767	0.75
9171	940	229	0.899999976
9172	941	3183	0.75
9173	941	115	0.75
9174	941	767	0.75
9175	941	229	0.899999976
9176	942	3183	0.75
9177	942	115	0.75
9178	942	767	0.75
9179	942	229	0.899999976
9180	942	3650	0.899999976
9181	943	3183	0.75
9182	943	3651	0.25
9183	943	767	0.75
9184	943	229	0.899999976
9185	944	3183	0.75
9186	944	115	0.75
9187	944	767	0.75
9188	944	229	0.899999976
9189	945	3652	0.75
9190	945	3653	0.100000001
9191	945	3654	0.100000001
9192	945	3655	0.100000001
9193	946	3183	0.75
9194	946	115	0.75
9195	946	767	0.75
9196	946	229	0.899999976
9197	947	3183	0.75
9198	947	115	0.75
9199	947	767	0.75
9200	947	229	0.899999976
9201	948	3183	0.75
9202	948	115	0.75
9203	948	767	0.75
9204	948	229	0.899999976
9205	949	3183	0.75
9206	949	115	0.75
9207	949	767	0.75
9208	949	229	0.899999976
9209	950	3183	0.75
9210	950	115	0.75
9211	950	767	0.75
9212	950	229	0.899999976
9213	951	3183	0.75
9214	951	115	0.75
9215	951	767	0.75
9216	951	229	0.899999976
9217	952	3183	0.75
9218	952	115	0.75
9219	952	767	0.75
9220	952	229	0.899999976
9221	953	3183	0.75
9222	953	115	0.75
9223	953	767	0.75
9224	953	229	0.899999976
9225	954	3183	0.75
9226	954	115	0.75
9227	954	767	0.75
9228	954	229	0.899999976
9229	955	3183	0.75
9230	955	115	0.75
9231	955	767	0.75
9232	955	229	0.899999976
9233	956	3183	0.75
9234	956	115	0.75
9235	956	767	0.75
9236	956	229	0.899999976
9237	957	3183	0.75
9238	957	115	0.75
9239	957	767	0.75
9240	957	229	0.899999976
9241	958	3183	0.75
9242	958	115	0.75
9243	958	767	0.75
9244	958	229	0.899999976
9245	959	6	0.75
9246	959	3632	0.5
9247	959	2538	0.5
9248	960	3656	0.75
9249	960	3657	0.479999989
9250	960	3658	0.300000012
9251	960	3659	0.400000006
9252	961	89	0.75
9253	961	3651	0.100000001
9254	961	3660	0.75
9255	962	3183	0.75
9256	962	115	0.75
9257	962	767	0.75
9258	962	229	0.899999976
9259	963	3183	0.75
9260	963	115	0.75
9261	963	767	0.75
9262	963	229	0.899999976
9263	964	3183	0.75
9264	964	115	0.75
9265	964	767	0.75
9266	964	229	0.899999976
9267	965	3183	0.75
9268	965	115	0.75
9269	965	767	0.75
9270	965	229	0.899999976
9271	966	3183	0.75
9272	966	115	0.75
9273	966	767	0.75
9274	966	229	0.899999976
9275	967	3183	0.75
9276	967	115	0.75
9277	967	767	0.75
9278	967	229	0.899999976
9279	968	3183	0.75
9280	968	115	0.75
9281	968	767	0.75
9282	968	229	0.899999976
9283	969	3183	0.75
9284	969	115	0.75
9285	969	767	0.75
9286	969	229	0.899999976
9287	970	3183	0.75
9288	970	115	0.75
9289	970	767	0.75
9290	970	229	0.899999976
9291	971	3183	0.75
9292	971	115	0.75
9293	971	767	0.75
9294	971	229	0.899999976
9295	972	3183	0.75
9296	972	115	0.75
9297	972	767	0.75
9298	972	229	0.899999976
9299	973	3183	0.75
9300	973	115	0.75
9301	973	767	0.75
9302	973	229	0.899999976
9303	974	3183	0.75
9304	974	115	0.75
9305	974	767	0.75
9306	974	229	0.899999976
9307	975	3183	0.75
9308	975	115	0.75
9309	975	767	0.75
9310	975	229	0.899999976
9311	976	3183	0.75
9312	976	115	0.75
9313	976	767	0.75
9314	976	229	0.899999976
9315	977	3183	0.75
9316	977	115	0.75
9317	977	767	0.75
9318	977	229	0.899999976
9319	978	3183	0.75
9320	978	115	0.75
9321	978	767	0.75
9322	978	229	0.899999976
9323	979	3183	0.75
9324	979	115	0.75
9325	979	767	0.75
9326	979	229	0.899999976
9327	980	3183	0.75
9328	980	115	0.75
9329	980	767	0.75
9330	980	229	0.899999976
9331	981	3183	0.75
9332	981	115	0.75
9333	981	767	0.75
9334	981	229	0.899999976
9335	982	3183	0.75
9336	982	115	0.75
9337	982	767	0.75
9338	982	229	0.899999976
9339	983	3661	1
9340	983	3662	0.75
9341	983	229	0.899999976
9342	984	16	0.75
9343	984	10	0.25
9344	984	3663	0.5
9345	984	3664	0.5
9346	984	3665	0.5
9347	984	3666	0.5
9348	984	3667	0.5
9349	984	3668	0.5
9350	984	3669	0.5
9351	984	3670	0.5
9352	985	3671	1
9353	985	1814	0.75
9354	985	3672	1
9355	985	3673	0.899999976
9356	985	3674	0.75
9357	986	3675	1
9358	987	1	0.5
9359	987	35	0.5
9360	987	10	1
9361	987	3676	0.5
9362	987	16	0
9363	987	6	0.100000001
9364	987	9	0.5
9365	988	896	0.5
9366	988	14	0.5
9367	988	6	0.5
9368	988	36	0.5
9369	988	9	0.5
9370	988	10	0.5
9371	988	3677	0.5
9372	988	427	0.5
9373	988	16	0.5
9374	988	319	0.5
9375	988	35	0.100000001
9376	988	33	0.5
9377	989	3678	1
9378	989	3679	0.699999988
9379	989	3680	0.5
9380	989	3681	0.899999976
9381	990	3682	0.899999976
9382	990	2227	0.899999976
9383	990	247	0.600000024
9384	990	1751	0.600000024
9385	990	13	0.400000006
9386	990	3683	0.800000012
9387	990	3684	0.800000012
9388	990	3685	0.600000024
9389	990	3686	0.899999976
9390	991	3211	0.5
9391	991	14	0.5
9392	991	1357	0.5
9393	991	82	0.5
9394	991	10	0.5
9395	991	239	0.5
9396	991	478	0.5
9397	991	35	0.100000001
9398	991	427	0.5
9399	991	36	0.5
9400	991	3213	0.5
9401	991	6	0.5
9402	991	391	0.5
9403	991	2546	0.5
9404	991	33	0.5
9405	991	1694	0.5
9406	991	3215	0.5
9407	991	3687	0.5
9408	991	3688	0.5
9409	991	3216	0.5
9410	991	390	0.5
9411	991	16	0.5
9412	991	9	0.5
9413	992	3689	0.800000012
9414	992	3690	0.800000012
9415	992	391	0.899999976
9416	992	390	0.800000012
9417	992	3691	0.5
9418	992	8	0.699999988
9419	992	722	0.600000024
9420	992	3692	0.5
9421	992	715	0.600000024
9422	992	105	0.5
9423	992	2179	0.5
9424	993	724	0.899999976
9425	993	33	0.400000006
9426	993	36	0.300000012
9427	993	3693	0.5
9428	993	3216	0.5
9429	993	3694	0.5
9430	993	1993	0.400000006
9431	993	16	0.5
9432	993	10	0.5
9433	994	2686	0.699999988
9434	994	3695	0.400000006
9435	994	3696	0.200000003
9436	994	391	0.899999976
9437	994	36	0.899999976
9438	994	390	0.200000003
9439	995	90	0.5
9440	995	393	0.5
9441	995	6	0.5
9442	995	10	0.5
9443	995	1	0.5
9444	995	3697	0.5
9445	995	255	0.5
9446	995	35	0.5
9447	995	3698	0.5
9448	995	304	0.5
9449	995	3699	0.5
9450	995	599	0.5
9451	995	3700	0.5
9452	995	277	0.100000001
9453	995	3701	0.5
9454	995	3702	0.5
9455	995	68	0.5
9456	995	33	0.100000001
9457	995	661	0.5
9458	995	2876	0.5
9459	995	497	0.100000001
9460	995	3703	0.5
9461	995	16	0.5
9462	995	9	0.5
9463	995	392	0.25
9464	996	235	0.5
9465	996	618	0.100000001
9466	996	236	0.5
9467	996	6	0.5
9468	996	237	0.5
9469	996	10	0.5
9470	996	3704	0.5
9471	996	284	0.100000001
9472	996	3705	0.949999988
9473	996	74	0.75
9474	996	3706	0.949999988
9475	996	3707	0.949999988
9476	996	292	0.5
9477	996	3708	0.75
9478	996	36	0.75
9479	996	53	0.5
9480	996	9	0.5
9481	996	68	0.5
9482	996	3709	0.100000001
9483	996	33	0.5
9484	996	3710	0.25
9485	996	107	0.5
9486	996	3711	0.949999988
9487	996	3712	0.25
9488	996	16	0.5
9489	996	378	0.75
9490	997	3713	1
9491	997	3714	1
9492	997	1278	1
9493	997	3647	1
9494	998	3715	0.600000024
9495	998	518	0.600000024
9496	998	1844	0.600000024
9497	998	291	0.5
9498	998	292	0.5
9499	998	3716	0.400000006
9500	998	107	0.400000006
9501	998	90	0.300000012
9502	998	522	0.400000006
9503	998	441	0.400000006
9504	998	33	0.200000003
9505	998	680	0.200000003
9506	998	40	0.200000003
9507	998	3717	0.5
9508	998	489	1
9509	998	644	0.800000012
9510	999	722	0.699999988
9511	999	3718	0.5
9512	999	3719	0.899999976
9513	999	3720	0.99000001
9514	999	10	0.670000017
9515	999	16	0.330000013
9516	999	3721	0.5
9517	1000	125	0.899999976
9518	1000	3722	0.899999976
9519	1000	1308	0.600000024
9520	1000	3723	0.600000024
9521	1000	40	0.800000012
9522	1000	37	0.800000012
9523	1001	10	1
9524	1001	16	0
9525	1001	1430	1
9526	1001	2009	1
9527	1001	434	0.0500000007
9528	1001	473	0.0500000007
9529	1002	3724	0.5
9530	1003	3724	0.5
9531	1004	3725	1
9532	1004	235	0.5
9533	1004	3726	1
9534	1004	3727	0.75
9535	1004	3728	0.949999988
9536	1004	76	0.75
9537	1004	3729	0.5
9538	1004	68	0.75
9539	1004	236	0.5
9540	1004	6	0.5
9541	1004	72	0.5
9542	1004	3730	0.75
9543	1004	237	0.5
9544	1004	9	0.5
9545	1004	10	0.5
9546	1004	3731	1
9547	1004	65	0.75
9548	1004	16	0.5
9549	1004	71	0.5
9550	1004	3732	0.949999988
9551	1004	181	0.75
9552	1005	6	0.5
9553	1005	10	0.5
9554	1005	857	0.5
9555	1005	3733	0.5
9556	1005	1012	0.5
9557	1005	3734	0.5
9558	1005	3735	0.5
9559	1005	3736	0.5
9560	1005	3482	0.5
9561	1005	292	0.5
9562	1005	37	0.5
9563	1005	635	0.5
9564	1005	191	0.5
9565	1005	3737	0.5
9566	1005	972	0.5
9567	1005	9	0.5
9568	1005	2695	0.5
9569	1005	3738	0.5
9570	1005	3739	0.5
9571	1005	3740	0.5
9572	1005	3741	0.5
9573	1005	16	0.5
9574	1005	1877	0.25
9575	1006	722	0.75
9576	1006	3742	0.75
9577	1006	3743	0.5
9578	1007	235	0.5
9579	1007	10	0.5
9580	1007	14	0.75
9581	1007	236	0.5
9582	1007	82	0.75
9583	1007	3744	0.25
9584	1007	237	0.5
9585	1007	3745	1
9586	1007	3746	0.649999976
9587	1007	427	0.75
9588	1007	3747	1
9589	1007	37	0.75
9590	1007	3748	0.949999988
9591	1007	3749	0.75
9592	1007	1177	0.75
9593	1007	834	0.75
9594	1007	3750	0.649999976
9595	1007	6	0.5
9596	1007	68	0.5
9597	1007	3751	0.100000001
9598	1007	597	0.5
9599	1007	33	0.75
9600	1007	687	0.75
9601	1007	3752	0.649999976
9602	1007	922	0.649999976
9603	1007	377	1
9604	1007	16	0.5
9605	1007	3753	0.949999988
9606	1007	9	0.5
9607	1008	235	0.5
9608	1008	16	0.5
9609	1008	2010	0.5
9610	1008	9	0.5
9611	1008	10	0.5
9612	1008	68	0.5
9613	1008	77	0.5
9614	1008	6	0.5
9615	1009	2001	0.899999976
9616	1009	2002	0.75
9617	1009	2003	0.75
9618	1009	2004	0.75
9619	1009	251	0.5
9620	1010	1301	0
9621	1010	1295	0
9622	1010	1289	0
9623	1010	3754	0.5
9624	1010	3755	0.5
9625	1010	236	0.5
9626	1010	1223	0.5
9627	1010	37	0.5
9628	1010	3756	0.5
9629	1010	3338	0.5
9630	1010	3757	0.5
9631	1010	16	0.5
9632	1010	2574	0.5
9633	1010	10	0.5
9634	1010	3758	0.5
9635	1010	3759	0.5
9636	1010	79	0.5
9637	1010	3760	0.5
9638	1010	484	0.5
9639	1011	3761	0.5
9640	1011	37	0.5
9641	1011	356	0.5
9642	1011	3762	0.5
9643	1011	76	0.5
9644	1011	105	0.5
9645	1011	3763	0.25
9646	1012	1	0.5
9647	1012	16	0.5
9648	1012	3764	0.5
9649	1012	3765	0.5
9650	1012	1475	0.5
9651	1012	3766	0.5
9652	1012	6	0.5
9653	1012	1769	0.5
9654	1012	9	0.5
9655	1012	10	0.5
9656	1012	36	0.5
9657	1012	3767	0.5
9658	1012	3768	0.5
9659	1012	3769	0.5
9660	1012	33	0.5
9661	1013	3159	1
9662	1013	3770	1
9663	1013	3771	0.899999976
9664	1013	722	0.600000024
9665	1013	3772	0.200000003
9666	1013	3773	0.5
9667	1013	83	0.400000006
9668	1013	3774	0.400000006
9669	1013	77	0.400000006
9670	1013	105	0.200000003
9671	1013	16	0.949999988
9672	1013	10	0.0500000007
9673	1014	3775	0.75
9674	1014	3776	0.75
9675	1015	235	0.5
9676	1015	14	0.75
9677	1015	68	0.5
9678	1015	236	0.5
9679	1015	6	0.5
9680	1015	237	0.5
9681	1015	10	0.5
9682	1015	1018	0.75
9683	1015	3777	0.75
9684	1015	3778	0.75
9685	1015	76	0.75
9686	1015	3409	0.100000001
9687	1015	3779	0.75
9688	1015	3780	0.75
9689	1015	3781	0.649999976
9690	1015	3782	0.75
9691	1015	9	0.5
9692	1015	3783	0.75
9693	1015	33	0.75
9694	1015	3784	0.75
9695	1015	3785	0.75
9696	1015	3786	0.75
9697	1015	3787	0.75
9698	1015	1618	0.100000001
9699	1015	531	0.649999976
9700	1015	3788	0.649999976
9701	1015	16	0.5
9702	1016	3789	1
9703	1016	1286	0.5
9704	1017	502	0.5
9705	1017	235	0.5
9706	1017	236	0.5
9707	1017	3790	0.5
9708	1017	3791	0.949999988
9709	1017	10	0.5
9710	1017	94	0.75
9711	1017	1117	0.5
9712	1017	3792	0.75
9713	1017	3793	0.5
9714	1017	3794	0.5
9715	1017	88	0.75
9716	1017	3795	0.5
9717	1017	3796	0.75
9718	1017	401	0.5
9719	1017	68	0.5
9720	1017	3797	0.5
9721	1017	3798	0.75
9722	1017	3799	0.75
9723	1017	3800	0.5
9724	1017	3801	0.5
9725	1017	16	0.5
9726	1017	3802	0.75
9727	1017	3803	0.5
9728	1017	6	0.5
9729	1017	237	0.5
9730	1017	3804	0.75
9731	1017	97	0.75
9732	1017	3805	0.5
9733	1017	3806	0.5
9734	1017	3807	0.100000001
9735	1017	536	0.75
9736	1017	3808	0.5
9737	1017	1882	0.5
9738	1017	3809	0.5
9739	1017	37	0.75
9740	1017	3810	0.75
9741	1017	36	0.75
9742	1017	3811	0.100000001
9743	1017	2121	0.75
9744	1017	838	0.5
9745	1017	3812	0.5
9746	1017	9	0.5
9747	1018	3813	0.5
9748	1018	722	0.75
9749	1018	838	0.25
9750	1018	3814	0.25
9751	1018	3815	0.25
9752	1019	3816	1
9753	1019	3817	1
9754	1020	3818	0.5
9755	1020	1	0.5
9756	1020	2535	0.5
9757	1020	3819	0.5
9758	1020	2831	0.5
9759	1020	3820	0.5
9760	1020	3821	0.5
9761	1020	597	0.5
9762	1020	2202	0.5
9763	1020	6	0.5
9764	1020	3822	0.5
9765	1020	37	0.5
9766	1020	291	0.5
9767	1020	401	0.5
9768	1020	10	0.5
9769	1020	767	0.5
9770	1020	16	0.5
9771	1020	3823	0.5
9772	1020	3824	0.5
9773	1020	9	0.5
9774	1021	3825	0.75
9775	1021	3826	0.800000012
9776	1021	3827	0.899999976
9777	1022	675	0.899999976
9778	1022	3828	0.899999976
9779	1022	122	0.899999976
9780	1022	2769	0.899999976
9781	1022	3829	0.100000001
9782	1022	3830	0.899999976
9783	1022	2922	0.899999976
9784	1022	3831	0.899999976
9785	1022	37	0.5
9786	1022	38	0.5
9787	1022	53	0.5
9788	1022	3824	0.899999976
9789	1022	3832	0.600000024
9790	1022	3833	0.600000024
9791	1022	16	0.75
9792	1022	10	0.25
9793	1023	3834	0.200000003
9794	1023	3835	0.899999976
9795	1023	2255	1
9796	1023	675	0.899999976
9797	1023	3828	0.899999976
9798	1023	122	0.899999976
9799	1023	2769	0.899999976
9800	1023	3829	0.100000001
9801	1023	3830	0.899999976
9802	1023	2922	0.899999976
9803	1023	3831	0.899999976
9804	1023	37	0.5
9805	1023	38	0.5
9806	1023	53	0.5
9807	1023	3824	0.899999976
9808	1023	3832	0.600000024
9809	1023	3833	0.600000024
9810	1023	16	0.75
9811	1023	10	0.25
9812	1024	461	1
9813	1024	3836	0.949999988
9814	1024	551	0.949999988
9815	1024	3837	0.699999988
9816	1024	3838	0.600000024
9817	1024	1741	0.400000006
9818	1024	15	0.949999988
9819	1024	547	0.899999976
9820	1024	2488	0.899999976
9821	1025	461	1
9822	1025	3836	0.949999988
9823	1025	551	0.949999988
9824	1025	3837	0.699999988
9825	1025	3838	0.600000024
9826	1025	1741	0.400000006
9827	1025	15	0.949999988
9828	1025	547	0.899999976
9829	1025	2488	0.899999976
9830	1025	3839	0.899999976
9831	1025	3840	0.899999976
9832	1026	3841	1
9833	1027	1	0.5
9834	1027	16	0.5
9835	1027	6	0.5
9836	1027	9	0.5
9837	1027	10	0.5
9838	1027	68	0.5
9839	1027	425	0.5
9840	1027	3842	0.5
9841	1028	3843	0.899999976
9842	1028	3844	0.899999976
9843	1028	3396	0.0500000007
9844	1028	71	0.0500000007
9845	1028	3845	0.400000006
9846	1029	3846	0.75
9847	1029	235	0.5
9848	1029	3847	0.5
9849	1029	236	0.5
9850	1029	6	0.5
9851	1029	237	0.5
9852	1029	9	0.5
9853	1029	10	0.5
9854	1029	68	0.5
9855	1029	3848	0.75
9856	1029	3849	0.949999988
9857	1029	3850	0.75
9858	1029	3851	0.75
9859	1029	16	0.5
9860	1029	1943	0.75
9861	1030	3852	1
9862	1030	3853	0.949999988
9863	1030	40	0.899999976
9864	1031	235	0.5
9865	1031	354	0.5
9866	1031	6	0.5
9867	1031	3854	0.5
9868	1031	10	0.5
9869	1031	3855	0.5
9870	1031	3856	0.5
9871	1031	359	0.5
9872	1031	3857	0.5
9873	1031	3858	0.5
9874	1031	1096	0.5
9875	1031	1100	0.5
9876	1031	2519	0.5
9877	1031	1099	0.5
9878	1031	3859	0.5
9879	1031	395	0.5
9880	1031	2355	0.5
9881	1031	2691	0.5
9882	1031	3860	0.5
9883	1031	9	0.5
9884	1031	68	0.5
9885	1031	3861	0.5
9886	1031	392	0.5
9887	1031	1814	0.5
9888	1031	3862	0.5
9889	1031	1422	0.5
9890	1031	3863	0.5
9891	1031	16	0.5
9892	1031	3864	0.5
9893	1031	1618	0.75
9894	1031	3865	0.75
9895	1031	3866	0.5
9896	1032	3867	1
9897	1032	3868	0.899999976
9898	1032	37	0.800000012
9899	1032	71	0.800000012
9900	1032	3869	0.899999976
9901	1032	3870	0.949999988
9902	1032	257	0.600000024
9903	1032	3871	0.400000006
9904	1032	3872	0.400000006
9905	1032	3873	0.300000012
9906	1032	1943	0.949999988
9907	1033	3874	0.5
9908	1033	6	0.5
9909	1033	9	0.5
9910	1033	10	0.5
9911	1033	68	0.5
9912	1033	3875	0.5
9913	1033	1	0.5
9914	1033	3876	0.5
9915	1033	3877	0.5
9916	1033	425	0.5
9917	1033	3878	0.5
9918	1033	16	0.5
9919	1034	1117	0.5
9920	1034	3558	0.5
9921	1034	6	0.5
9922	1034	434	0.5
9923	1034	9	0.5
9924	1034	68	0.5
9925	1034	3879	0.5
9926	1034	3880	0.5
9927	1034	431	0.5
9928	1034	472	0.5
9929	1034	1303	0.5
9930	1034	475	0.5
9931	1035	1301	0.5
9932	1035	235	0.5
9933	1035	2192	0.5
9934	1035	3881	0.5
9935	1035	3882	0.5
9936	1035	14	0.5
9937	1035	43	0.5
9938	1035	8	0.5
9939	1035	16	0.5
9940	1035	6	0.5
9941	1035	1295	0.5
9942	1035	37	0.5
9943	1035	2194	0.5
9944	1035	473	0.5
9945	1035	10	0.5
9946	1035	68	0.5
9947	1035	42	0.5
9948	1035	45	0.5
9949	1035	3883	0.5
9950	1035	33	0.5
9951	1035	3884	0.5
9952	1035	38	0.5
9953	1035	3885	0.5
9954	1035	1523	0.5
9955	1035	74	0.5
9956	1035	1223	0.5
9957	1035	9	0.5
9958	1035	79	0.5
9959	1035	3338	0.5
9960	1035	53	0.5
9961	1035	12	0.5
9962	1035	292	0.5
9963	1035	3886	0.5
9964	1035	3887	0.5
9965	1036	502	0.5
9966	1036	1	0.5
9967	1036	9	0.5
9968	1036	10	0.5
9969	1036	3888	0.5
9970	1036	16	0.5
9971	1036	3889	0.5
9972	1036	3890	0.5
9973	1036	6	0.5
9974	1037	3891	0.899999976
9975	1037	3892	0.5
9976	1037	3893	0.5
9977	1037	3894	0.5
9978	1038	395	0.75
9979	1038	291	0.75
9980	1038	3895	0.5
9981	1038	3896	0.5
9982	1038	239	0.25
9983	1038	82	0.25
9984	1038	37	0.00999999978
9985	1038	81	0.00999999978
9986	1038	105	0.850000024
9987	1038	76	0.200000003
9988	1038	257	1
9989	1038	480	0.699999988
9990	1038	83	0.850000024
9991	1038	431	0.800000012
9992	1038	2591	0.800000012
9993	1038	3897	0.800000012
9994	1038	2067	0.300000012
9995	1038	3898	0.200000003
9996	1038	3899	0.200000003
9997	1038	250	0.150000006
9998	1038	3900	0.899999976
9999	1038	3901	0.800000012
10000	1039	422	0.100000001
10001	1039	90	0.5
10002	1039	3902	0.5
10003	1039	1768	0.5
10004	1039	395	0.5
10005	1039	3903	0.5
10006	1039	16	0.5
10007	1039	6	0.5
10008	1039	3836	0.5
10009	1039	9	0.5
10010	1039	10	0.5
10011	1039	68	0.5
10012	1039	3904	0.5
10013	1039	2694	0.5
10014	1039	799	0.5
10015	1039	3905	0.5
10016	1039	1729	0.5
10017	1040	235	0.5
10018	1040	79	0.5
10019	1040	40	0.5
10020	1040	424	0.5
10021	1040	163	0.5
10022	1040	46	0.5
10023	1040	16	0.5
10024	1040	6	0.5
10025	1040	1295	0.5
10026	1040	9	0.5
10027	1040	10	0.5
10028	1040	68	0.5
10029	1040	3906	0.5
10030	1040	12	0.5
10031	1040	40	0.5
10032	1040	3907	0.5
10033	1040	3908	0.5
10034	1041	235	0.5
10035	1041	3909	0.5
10036	1041	443	0.5
10037	1041	3910	0.5
10038	1041	68	0.5
10039	1041	569	0.5
10040	1041	1	0.5
10041	1041	442	0.5
10042	1041	715	0.5
10043	1041	31	0.5
10044	1041	460	0.5
10045	1041	3911	0.5
10046	1041	2083	0.5
10047	1041	9	0.5
10048	1041	10	0.5
10049	1041	3912	0.5
10050	1041	1773	0.5
10051	1041	569	0.5
10052	1041	3913	0.5
10053	1041	40	0.5
10054	1041	3914	0.5
10055	1041	3915	0.5
10056	1041	16	0.5
10057	1041	1149	0.5
10058	1041	40	0.5
10059	1041	76	0.5
10060	1041	122	0.5
10061	1041	3916	0.5
10062	1041	1150	0.5
10063	1041	3072	0.5
10064	1041	304	0.5
10065	1041	421	0.5
10066	1041	77	0.5
10067	1041	163	0.5
10068	1041	2543	0.5
10069	1041	2859	0.5
10070	1042	3917	0.899999976
10071	1042	3918	0.5
10072	1042	3919	0.5
10073	1042	3920	0.5
10074	1042	3921	0.5
10075	1043	1	0.5
10076	1043	6	0.5
10077	1043	9	0.5
10078	1043	10	0.5
10079	1043	68	0.5
10080	1043	16	0.5
10081	1045	10	1
10082	1045	122	0.5
10083	1045	14	0.5
10084	1045	3922	0.5
10085	1045	434	0.5
10086	1045	473	0.5
10087	1045	3471	0.5
10088	1045	3923	0.5
10089	1045	431	0.5
10090	1045	35	0.5
10091	1045	2010	0.5
10092	1045	632	0.75
10093	1045	33	0.5
10094	1045	292	0.5
10095	1045	3924	0.5
10096	1045	36	0.5
10097	1045	53	0.5
10098	1045	474	0.5
10099	1045	83	0.5
10100	1045	77	0.5
10101	1045	1430	1
10102	1045	724	0.5
10103	1045	16	0
10104	1045	3925	0.5
10105	1045	9	0.5
10106	1046	247	0.800000012
10107	1046	14	0.800000012
10108	1046	3926	0.600000024
10109	1046	3927	0.600000024
10110	1046	8	0.5
10111	1047	1	0.5
10112	1047	37	0.5
10113	1047	16	0.5
10114	1047	3928	0.5
10115	1047	425	0.5
10116	1047	400	0.5
10117	1047	480	0.5
10118	1047	2024	0.5
10119	1047	6	0.5
10120	1047	10	0.5
10121	1047	68	0.5
10122	1047	3929	0.5
10123	1047	77	0.5
10124	1047	3930	0.5
10125	1047	9	0.5
10126	1047	257	0.75
10127	1047	3931	0.75
10128	1048	247	0.699999988
10129	1048	3932	0.699999988
10130	1048	277	0.800000012
10131	1048	40	0.800000012
10132	1048	3933	0.699999988
10133	1048	3934	0.800000012
10134	1048	8	0.400000006
10135	1048	12	0.400000006
10136	1049	235	0.5
10137	1049	3935	0.75
10138	1049	236	0.5
10139	1049	6	0.5
10140	1049	341	0.75
10141	1049	237	0.5
10142	1049	3936	0.649999976
10143	1049	10	0.5
10144	1049	1364	0.100000001
10145	1049	427	0.75
10146	1049	3937	0.25
10147	1049	425	0.5
10148	1049	472	0.100000001
10149	1049	632	0.649999976
10150	1049	77	0.75
10151	1049	3938	0.649999976
10152	1049	37	0.75
10153	1049	641	0.5
10154	1049	597	0.5
10155	1049	36	0.75
10156	1049	291	0.75
10157	1049	9	0.5
10158	1049	68	0.5
10159	1049	33	0.75
10160	1049	3939	0.949999988
10161	1049	2010	0.649999976
10162	1049	1886	0.75
10163	1049	3940	0.649999976
10164	1049	16	0.5
10165	1049	303	0.75
10166	1049	74	0.5
10167	1049	14	0.5
10168	1050	235	0.5
10169	1050	3262	0.100000001
10170	1050	68	0.5
10171	1050	3941	0.649999976
10172	1050	3942	0.75
10173	1050	597	0.5
10174	1050	236	0.5
10175	1050	6	0.5
10176	1050	126	0.75
10177	1050	37	0.5
10178	1050	237	0.5
10179	1050	3936	0.649999976
10180	1050	10	0.5
10181	1050	3943	0.949999988
10182	1050	3944	0.949999988
10183	1050	3945	0.75
10184	1050	3946	0.949999988
10185	1050	36	0.75
10186	1050	3947	0.75
10187	1050	3948	0.949999988
10188	1050	3949	0.75
10189	1050	3950	0.949999988
10190	1050	1849	0.5
10191	1050	3951	0.5
10192	1050	77	0.75
10193	1050	3952	0.5
10194	1050	3937	0.25
10195	1050	3953	0.649999976
10196	1050	419	0.5
10197	1050	33	0.5
10198	1050	107	0.5
10199	1050	425	0.5
10200	1050	3954	0.949999988
10201	1050	632	0.649999976
10202	1050	16	0.5
10203	1050	291	0.75
10204	1050	3955	0.949999988
10205	1050	427	0.75
10206	1050	3938	0.649999976
10207	1050	9	0.5
10208	1051	1882	0.5
10209	1051	235	0.5
10210	1051	37	0.5
10211	1051	3956	0.75
10212	1051	3949	0.75
10213	1051	641	0.5
10214	1051	68	0.5
10215	1051	236	0.5
10216	1051	3957	0.949999988
10217	1051	6	0.5
10218	1051	715	0.5
10219	1051	237	0.5
10220	1051	3936	0.649999976
10221	1051	10	0.5
10222	1051	3958	0.949999988
10223	1051	3945	0.75
10224	1051	36	0.5
10225	1051	3947	0.75
10226	1051	3959	0.949999988
10227	1051	427	0.75
10228	1051	3960	0.949999988
10229	1051	3961	0.75
10230	1051	3951	0.5
10231	1051	728	0.649999976
10232	1051	3952	0.75
10233	1051	3941	0.649999976
10234	1051	3962	0.949999988
10235	1051	3953	0.649999976
10236	1051	33	0.5
10237	1051	3937	0.25
10238	1051	1886	0.5
10239	1051	3963	0.649999976
10240	1051	16	0.5
10241	1051	291	0.75
10242	1051	632	0.649999976
10243	1051	77	0.75
10244	1051	3938	0.649999976
10245	1051	3964	0.5
10246	1051	9	0.5
10247	1052	235	0.5
10248	1052	3965	0.949999988
10249	1052	236	0.5
10250	1052	6	0.5
10251	1052	237	0.5
10252	1052	9	0.5
10253	1052	10	0.5
10254	1052	68	0.5
10255	1052	16	0.5
10256	1052	3966	0.649999976
10257	1053	1882	0.75
10258	1053	235	0.5
10259	1053	3967	0.649999976
10260	1053	3935	0.75
10261	1053	3968	0.949999988
10262	1053	597	0.5
10263	1053	236	0.5
10264	1053	6	0.5
10265	1053	341	0.75
10266	1053	3262	0.100000001
10267	1053	237	0.5
10268	1053	3936	0.649999976
10269	1053	10	0.5
10270	1053	1364	0.100000001
10271	1053	36	0.75
10272	1053	427	0.75
10273	1053	68	0.5
10274	1053	1886	0.75
10275	1053	3937	0.25
10276	1053	33	0.75
10277	1053	2010	0.649999976
10278	1053	425	0.5
10279	1053	37	0.75
10280	1053	472	0.100000001
10281	1053	16	0.5
10282	1053	641	0.5
10283	1053	291	0.75
10284	1053	632	0.649999976
10285	1053	77	0.75
10286	1053	3938	0.649999976
10287	1053	9	0.5
10288	1054	235	0.5
10289	1054	3969	0.649999976
10290	1054	236	0.5
10291	1054	6	0.5
10292	1054	3970	0.949999988
10293	1054	237	0.5
10294	1054	9	0.5
10295	1054	10	0.5
10296	1054	68	0.5
10297	1054	3971	1
10298	1054	3947	0.75
10299	1054	3949	0.75
10300	1054	632	0.75
10301	1054	16	0.5
10302	1055	239	0.25
10303	1055	1876	0.25
10304	1055	77	0.5
10305	1055	82	0.5
10306	1055	3972	0.5
10307	1055	15	0.5
10308	1055	3973	0.5
10309	1055	3974	0.5
10310	1055	1875	0.25
10311	1055	427	0.25
10312	1055	632	0.25
10313	1056	235	0.5
10314	1056	16	0.5
10315	1056	3975	0.5
10316	1056	3976	0.5
10317	1056	1	0.5
10318	1056	6	0.5
10319	1056	3690	0.5
10320	1056	472	0.5
10321	1056	9	0.5
10322	1056	10	0.5
10323	1056	68	0.5
10324	1056	42	0.5
10325	1056	77	0.5
10326	1056	3977	0.5
10327	1056	1364	0.5
10328	1056	475	0.5
10329	1057	105	1
10330	1057	76	0.5
10331	1057	3978	0.699999988
10332	1057	431	0.75
10333	1057	83	0.649999976
10334	1057	2591	0.400000006
10335	1057	3979	0.400000006
10336	1057	3065	0.200000003
10337	1057	3371	0.0500000007
10338	1058	3651	1
10339	1059	3980	1
10340	1060	3981	0.400000006
10341	1060	3982	0.600000024
10342	1060	3983	1
10343	1061	3984	1
10344	1061	1303	0.75
10345	1061	2839	0.5
10346	1062	3985	1
10347	1062	3986	0.930000007
10348	1062	83	0.660000026
10349	1062	3987	0.449999988
10350	1062	3988	0.280000001
10351	1062	400	0.209999993
10352	1062	431	0.209999993
10353	1062	3989	1
10354	1063	235	0.5
10355	1063	3990	0.5
10356	1063	869	0.5
10357	1063	3991	0.5
10358	1063	6	0.5
10359	1063	9	0.5
10360	1063	10	0
10361	1063	68	0.5
10362	1063	1235	0.5
10363	1063	3992	0.5
10364	1063	16	1
10365	1063	2978	0.5
10366	1064	235	0.5
10367	1064	3990	0.5
10368	1064	869	0.5
10369	1064	3991	0.5
10370	1064	6	0.5
10371	1064	9	0.5
10372	1064	10	0
10373	1064	68	0.5
10374	1064	1235	0.5
10375	1064	3992	0.5
10376	1064	16	1
10377	1064	2978	0.5
10378	1065	235	0.5
10379	1065	3990	0.5
10380	1065	869	0.5
10381	1065	3991	0.5
10382	1065	6	0.5
10383	1065	9	0.5
10384	1065	10	0.5
10385	1065	68	0.5
10386	1065	1235	0.5
10387	1065	3992	0.5
10388	1065	16	0.5
10389	1065	2978	0.5
10390	1065	3529	0.5
10391	1066	3211	0.5
10392	1066	2180	0.5
10393	1066	235	0.5
10394	1066	6	0
10395	1066	715	0.5
10396	1066	397	0.5
10397	1066	10	0.5
10398	1066	3993	0.5
10399	1066	275	0.5
10400	1066	3994	0.5
10401	1066	314	0.5
10402	1066	397	0.5
10403	1066	2973	0.5
10404	1066	3995	0.5
10405	1066	3213	0.5
10406	1066	9	0.5
10407	1066	68	0.5
10408	1066	199	0.5
10409	1066	83	0.5
10410	1066	3996	0.5
10411	1066	3997	0.5
10412	1066	3998	0.5
10413	1066	421	0.5
10414	1066	390	0.5
10415	1066	16	0.5
10416	1067	3503	0.5
10417	1067	3999	0.400000006
10418	1067	4000	0.400000006
10419	1067	786	0.400000006
10420	1067	4001	0.400000006
10421	1067	425	0.300000012
10422	1067	2504	0.200000003
10423	1067	4002	0.400000006
10424	1067	4003	0.400000006
10425	1067	4004	0.5
10426	1067	304	0.699999988
10427	1067	4005	0.5
10428	1067	2255	1
10429	1068	4006	0.5
10430	1068	122	0.5
10431	1068	6	0.5
10432	1068	9	0.5
10433	1068	10	0.5
10434	1068	16	0.5
10435	1069	16	0.600000024
10436	1069	10	0.400000006
10437	1069	83	1
10438	1069	4007	0.899999976
10439	1069	4008	0.899999976
10440	1069	4009	0.899999976
10441	1069	4010	0.899999976
10442	1069	4011	0.800000012
10443	1069	4012	0.699999988
10444	1069	4013	0.800000012
10445	1069	4014	0.699999988
10446	1069	398	0.800000012
10447	1069	291	0.800000012
10448	1069	681	0.800000012
10449	1069	400	0.600000024
10450	1070	4015	0.899999976
10451	1070	4016	0.800000012
10452	1070	4017	0.0500000007
10453	1070	4018	0.0500000007
10454	1070	844	0.0500000007
10455	1070	4019	0.0500000007
10456	1071	398	0.5
10457	1071	235	0.5
10458	1071	16	0.5
10459	1071	2010	0.5
10460	1071	4020	0.5
10461	1071	6	0.5
10462	1071	1336	0.5
10463	1071	291	0.5
10464	1071	9	0.5
10465	1071	10	0.5
10466	1071	68	0.5
10467	1071	1303	0.5
10468	1071	77	0.5
10469	1071	2491	0.5
10470	1071	83	0.5
10471	1072	235	0.5
10472	1072	14	0.75
10473	1072	236	0.5
10474	1072	6	0.5
10475	1072	237	0.5
10476	1072	10	0.5
10477	1072	4021	0.5
10478	1072	4022	0.25
10479	1072	4023	1
10480	1072	292	0.75
10481	1072	37	0.75
10482	1072	619	0.100000001
10483	1072	257	0.75
10484	1072	53	0.75
10485	1072	9	0.5
10486	1072	68	0.5
10487	1072	33	0.75
10488	1072	4024	0.949999988
10489	1072	4025	1
10490	1072	107	0.75
10491	1072	4026	0.100000001
10492	1072	4027	0.949999988
10493	1072	16	0.5
10494	1073	235	0.5
10495	1073	236	0.5
10496	1073	6	0.5
10497	1073	237	0.5
10498	1073	4028	0.5
10499	1073	10	0.5
10500	1073	844	0.400000006
10501	1073	1514	0.140000001
10502	1073	1510	0.319999993
10503	1073	4029	0.5
10504	1073	4030	0.949999988
10505	1073	845	0.379999995
10506	1073	4031	0.140000001
10507	1073	292	0.810000002
10508	1073	324	0.5
10509	1073	37	0.920000017
10510	1073	547	0.75
10511	1073	4032	0.100000001
10512	1073	2709	0.75
10513	1073	4033	0.5
10514	1073	1412	0.239999995
10515	1073	9	0.5
10516	1073	68	0.5
10517	1073	1643	0.75
10518	1073	953	0.75
10519	1073	16	0.5
10520	1073	293	0.670000017
10521	1073	36	0.460000008
10522	1073	953	0.330000013
10523	1073	1412	0.239999995
10524	1073	53	0.600000024
10525	1073	33	0.600000024
10526	1073	4034	0.970000029
10527	1073	90	0.75999999
10528	1073	290	0.200000003
10529	1074	235	0
10530	1074	68	0.5
10531	1074	236	0.5
10532	1074	6	0.5
10533	1074	237	0.5
10534	1074	10	0.5
10535	1074	427	0.5
10536	1074	4035	0.75
10537	1074	4030	0.949999988
10538	1074	4036	0.5
10539	1074	4037	0.5
10540	1074	37	0.5
10541	1074	4032	0.100000001
10542	1074	53	0.5
10543	1074	9	0.5
10544	1074	4038	1
10545	1074	4039	0.949999988
10546	1074	231	0.75
10547	1074	4040	0.25
10548	1074	4041	0.75
10549	1074	16	0.5
10550	1075	235	0.5
10551	1075	499	0.75
10552	1075	2977	0.75
10553	1075	68	0
10554	1075	236	0.5
10555	1075	6	0
10556	1075	237	0.5
10557	1075	10	0.5
10558	1075	422	0.75
10559	1075	359	0.75
10560	1075	431	0.649999976
10561	1075	4030	0.949999988
10562	1075	2519	0.649999976
10563	1075	400	0.75
10564	1075	4042	0.649999976
10565	1075	4032	0.100000001
10566	1075	9	0
10567	1075	4038	1
10568	1075	4039	0.949999988
10569	1075	4040	0.25
10570	1075	639	0.75
10571	1075	16	0.5
10572	1076	4043	1
10573	1076	235	0.5
10574	1076	16	0.5
10575	1076	10	0.5
10576	1076	4044	0.5
10577	1076	4045	0.949999988
10578	1076	236	0.5
10579	1076	6	0.75
10580	1076	3520	0.5
10581	1076	4046	0.100000001
10582	1076	4047	1
10583	1076	237	0.5
10584	1076	9	0.75
10585	1076	4048	0.5
10586	1076	68	0.5
10587	1076	851	0.5
10588	1076	4049	0.100000001
10589	1076	4050	0.949999988
10590	1077	37	0.800000012
10591	1077	292	0.800000012
10592	1077	522	0.800000012
10593	1077	33	0.699999988
10594	1077	36	0.699999988
10595	1077	4051	0.800000012
10596	1077	1515	0.800000012
10597	1077	425	0.699999988
10598	1077	291	0.699999988
10599	1077	36	0.5
10600	1077	74	0.5
10601	1077	79	0.5
10602	1077	107	0.5
10603	1077	522	0.800000012
10604	1077	15	0.800000012
10605	1077	235	0.899999976
10606	1077	68	0.949999988
10607	1078	1475	0.899999976
10608	1078	1470	0.800000012
10609	1078	4052	0.800000012
10610	1078	2400	0.899999976
10611	1078	863	0.800000012
10612	1078	324	0.800000012
10613	1078	4053	0.949999988
10614	1078	193	0.99000001
10615	1078	255	0.400000006
10616	1078	4054	0.400000006
10617	1078	2173	0.400000006
10618	1079	4055	0.800000012
10619	1079	2968	0.699999988
10620	1079	2967	0.699999988
10621	1079	4056	0.899999976
10622	1079	37	0.699999988
10623	1079	53	0.699999988
10624	1079	107	0.699999988
10625	1079	427	0.699999988
10626	1079	82	0.5
10627	1079	4057	0.800000012
10628	1079	4058	0.600000024
10629	1079	194	0.600000024
10630	1079	1404	0.899999976
10631	1079	4059	0.800000012
10632	1079	3624	0.699999988
10633	1079	4060	0.600000024
10634	1080	4061	0.949999988
10635	1080	4062	0.899999976
10636	1080	4063	0.899999976
10637	1080	4064	0.899999976
10638	1080	1979	0.800000012
10639	1080	72	0.800000012
10640	1080	4065	0.949999988
10641	1080	4066	0.600000024
10642	1080	4067	0.600000024
10643	1080	4068	0.600000024
10644	1081	235	0.5
10645	1081	687	0.5
10646	1081	896	0.5
10647	1081	4069	0.5
10648	1081	68	0
10649	1082	9	0.800000012
10650	1082	16	0.5
10651	1082	10	0.5
10652	1082	4070	0
10653	1082	4071	0.600000024
10654	1082	4072	0.600000024
10655	1082	37	0.5
10656	1082	82	0.600000024
10657	1082	425	0.400000006
10658	1082	4073	0.330000013
10659	1083	1295	0.5
10660	1083	4074	0.5
10661	1083	567	0.5
10662	1083	4075	0.5
10663	1083	6	0.5
10664	1083	257	0.5
10665	1083	236	0.5
10666	1083	3338	0.5
10667	1083	425	0.5
10668	1083	4076	0.5
10669	1083	3996	0.5
10670	1083	1124	0.5
10671	1083	1223	0.5
10672	1083	68	0.5
10673	1083	79	0.5
10674	1083	4077	0.5
10675	1083	1369	0.5
10676	1083	9	0.5
10677	1084	4078	1
10678	1084	4079	0.800000012
10679	1084	4080	0.5
10680	1084	4081	0.800000012
10681	1084	4082	0.800000012
10682	1084	257	0.800000012
10683	1084	4083	0.5
10684	1084	4084	0.5
10685	1084	37	0.600000024
10686	1084	79	0.400000006
10687	1084	4085	0.400000006
10688	1084	14	0.25
10689	1085	4086	1
10690	1085	4087	0.699999988
10691	1085	4088	0.800000012
10692	1085	4089	0.800000012
10693	1085	4090	0.800000012
10694	1085	10	0.800000012
10695	1085	16	0.200000003
10696	1085	4091	0.699999988
10697	1085	4092	0.600000024
10698	1085	801	0.600000024
10699	1085	489	0.600000024
10700	1086	235	0.5
10701	1086	236	0.5
10702	1086	1007	0.75
10703	1086	82	0.75
10704	1086	647	0.949999988
10705	1086	37	0.75
10706	1086	237	0.5
10707	1086	10	0.5
10708	1086	4093	0.949999988
10709	1086	3956	0.75
10710	1086	3403	0.75
10711	1086	74	0.75
10712	1086	425	0.75
10713	1086	4094	0.949999988
10714	1086	292	0.75
10715	1086	3942	0.75
10716	1086	567	0.75
10717	1086	36	0.75
10718	1086	81	0.75
10719	1086	291	0.75
10720	1086	6	0.5
10721	1086	68	0.5
10722	1086	88	0.75
10723	1086	33	0.75
10724	1086	1078	0.75
10725	1086	107	0.75
10726	1086	16	0.5
10727	1086	9	0.5
10728	1086	1067	0.75
10729	1086	1069	0.75
10730	1086	257	0.75
10731	1086	1842	0.75
10732	1086	658	0.75
10733	1086	1384	0.75
10734	1086	14	0.75
10735	1086	1078	0.75
10736	1086	1826	0.5
10737	1087	257	0.5
10738	1087	4095	0.5
10739	1087	82	0.5
10740	1087	416	0.5
10741	1087	10	0.5
10742	1087	431	0.5
10743	1087	4096	0.5
10744	1087	76	0.5
10745	1087	4097	0.5
10746	1087	4098	0.5
10747	1087	37	0.5
10748	1087	43	0.5
10749	1087	257	0.5
10750	1087	1257	0.5
10751	1087	81	0.5
10752	1087	6	0.5
10753	1087	68	0.5
10754	1087	4099	0.5
10755	1087	4100	0.5
10756	1087	105	0.5
10757	1087	16	0.5
10758	1087	9	0.5
10759	1088	235	0.5
10760	1088	14	0.5
10761	1088	236	0.5
10762	1088	4101	0.75
10763	1088	6	0.5
10764	1088	2272	0.5
10765	1088	4102	0.75
10766	1088	237	0.5
10767	1088	10	0.5
10768	1088	40	0.75
10769	1088	4103	0.949999988
10770	1088	71	0.75
10771	1088	82	0.5
10772	1088	74	0.5
10773	1088	714	0.75
10774	1088	304	0.75
10775	1088	4104	0.649999976
10776	1088	4105	0.75
10777	1088	9	0.5
10778	1088	4106	0.100000001
10779	1088	68	0.5
10780	1088	79	0.75
10781	1088	4107	0.75
10782	1088	531	0.649999976
10783	1088	390	0.100000001
10784	1088	16	0.5
10785	1088	4108	0.649999976
10786	1088	1943	0.75
10787	1089	4109	1
10788	1089	4055	1
10789	1089	1836	1
10790	1090	4110	0.5
10791	1090	4111	0.5
10792	1090	4112	0.5
10793	1090	6	0.5
10794	1090	9	0.5
10795	1090	68	0.5
10796	1090	4113	0.5
10797	1090	860	0.5
10798	1090	1187	0.5
10799	1090	4114	0.100000001
10800	1092	79	1
10801	1092	410	0.850000024
10802	1092	365	0.75
10803	1092	40	0.689999998
10804	1092	393	0.670000017
10805	1092	304	0.620000005
10806	1092	37	0.0399999991
10807	1093	4115	0.75
10808	1093	2683	0.899999976
10809	1093	4116	0.5
10810	1093	522	0.5
10811	1093	801	0.5
10812	1093	4117	0.5
10813	1093	800	0.5
10814	1093	4118	0.5
10815	1093	1409	0.5
10816	1093	2490	0.5
10817	1093	4119	0.5
10818	1093	4120	0.75
10819	1093	4121	0.99000001
10820	1094	422	0.5
10821	1094	4122	0.5
10822	1094	14	0.5
10823	1094	4123	0.5
10824	1094	9	0.5
10825	1094	10	1
10826	1094	262	0.5
10827	1094	4124	0.5
10828	1094	1430	1
10829	1094	275	0.5
10830	1094	35	0.5
10831	1094	16	0
10832	1095	4125	0.5
10833	1095	972	0.5
10834	1095	1514	0.5
10835	1095	379	0.75
10836	1095	33	0.25
10837	1095	36	0.25
10838	1096	235	0.5
10839	1096	10	0.5
10840	1096	4103	0.949999988
10841	1096	236	0.5
10842	1096	33	0.75
10843	1096	74	0.75
10844	1096	6	0.5
10845	1096	237	0.5
10846	1096	4126	0.75
10847	1096	4106	0.100000001
10848	1096	68	0.75
10849	1096	14	0.75
10850	1096	531	0.649999976
10851	1096	16	0.5
10852	1096	9	0.5
10853	1097	522	0.75
10854	1097	235	0.5
10855	1097	4127	0.5
10856	1097	10	0.5
10857	1097	4103	0.949999988
10858	1097	236	0.5
10859	1097	33	0.75
10860	1097	68	0.75
10861	1097	74	0.75
10862	1097	82	0.75
10863	1097	644	0.5
10864	1097	237	0.5
10865	1097	6	0.5
10866	1097	4106	0.100000001
10867	1097	4128	0.5
10868	1097	14	0.75
10869	1097	531	0.649999976
10870	1097	16	0.5
10871	1097	9	0.5
10872	1098	68	0.5
10873	1098	16	0.5
10874	1098	10	0.5
10875	1098	1384	0.5
10876	1098	2265	0.5
10877	1098	74	0.5
10878	1098	401	0.5
10879	1098	635	0.5
10880	1098	1012	0.5
10881	1098	425	0.5
10882	1098	1663	0.5
10883	1098	419	0.5
10884	1098	4129	0.5
10885	1098	6	0.5
10886	1098	9	0.5
10887	1099	1849	0.75
10888	1099	4130	0.75
10889	1099	4131	0.5
10890	1099	4132	0.899999976
10891	1099	16	0.5
10892	1099	10	0.5
10893	1100	1567	0.75
10894	1100	2560	0.75
10895	1100	434	0.75
10896	1100	4133	0.75
10897	1101	395	0.75
10898	1101	291	0.75
10899	1101	801	0.5
10900	1101	4134	0.5
10901	1101	163	0.5
10902	1101	500	0.25
10903	1101	4135	0.25
10904	1101	445	0.25
10905	1101	277	0.25
10906	1101	4136	0.75
10907	1101	4137	0.75
10908	1102	4138	1
10909	1102	4139	0.75
10910	1102	4140	0.5
10911	1102	4141	0.600000024
10912	1102	4142	0.5
10913	1102	361	0.5
10914	1102	4143	0.5
10915	1102	4144	0.5
10916	1102	4145	0.5
10917	1102	4146	0.600000024
10918	1102	4147	0.300000012
10919	1102	3335	0.899999976
10920	1102	4148	0.300000012
10921	1103	235	0.5
10922	1103	4149	0.5
10923	1103	896	0.5
10924	1103	429	0.5
10925	1103	6	0.5
10926	1103	550	0.5
10927	1103	10	0.5
10928	1103	2538	0.5
10929	1103	2552	0.5
10930	1103	2540	0.5
10931	1103	4150	0.5
10932	1103	2018	0.5
10933	1103	427	0.5
10934	1103	107	0.5
10935	1103	395	0.5
10936	1103	36	0.5
10937	1103	1228	0.5
10938	1103	291	0.5
10939	1103	9	0.5
10940	1103	68	0.5
10941	1103	2556	0.5
10942	1103	33	0.5
10943	1103	801	0.5
10944	1103	16	0.5
10945	1104	4151	0.899999976
10946	1104	105	1
10947	1105	4152	0.5
10948	1105	4153	0.5
10949	1105	4154	0.5
10950	1105	4155	0.5
10951	1105	4156	0.5
10952	1105	522	0.5
10953	1105	441	0.5
10954	1105	2021	0.5
10955	1105	1259	0.5
10956	1105	489	0.5
10957	1105	1844	0.5
10958	1105	4157	0.5
10959	1105	82	0.5
10960	1105	74	0.100000001
10961	1105	2694	0.25
10962	1105	4158	0.25
10963	1105	427	0.5
10964	1105	445	0.5
10965	1105	1422	0.5
10966	1105	32	0.25
10967	1105	445	0.5
10968	1105	4159	0.100000001
10969	1105	4160	0.5
10970	1105	4161	0.5
10971	1105	4162	0.5
10972	1105	2466	0.5
10973	1106	4163	1
10974	1107	235	0.5
10975	1107	6	0.5
10976	1107	36	0.5
10977	1107	9	0.5
10978	1107	10	0.5
10979	1107	68	0.5
10980	1107	844	0.5
10981	1107	857	0.5
10982	1107	33	0.5
10983	1107	4164	0.5
10984	1107	681	0.5
10985	1107	16	0.5
10986	1107	292	0.5
10987	1108	14	0.899999976
10988	1108	4149	0.5
10989	1108	896	0.899999976
10990	1108	292	0.800000012
10991	1108	2018	0.899999976
10992	1108	1891	0.899999976
10993	1108	550	0.899999976
10994	1108	315	0.200000003
10995	1108	427	0.5
10996	1108	522	0.5
10997	1108	4165	0.5
10998	1108	12	0.5
10999	1108	36	0.5
11000	1108	1228	0.5
11001	1108	291	0.5
11002	1108	546	0.5
11003	1108	4166	1
11004	1108	2021	0.5
11005	1108	2540	0.899999976
11006	1108	4167	0.800000012
11007	1108	4168	0.699999988
11008	1108	434	0.300000012
11009	1109	4169	1
11010	1109	4170	0.899999976
11011	1109	4171	0.5
11012	1109	4172	0.319999993
11013	1109	16	0.75
11014	1109	10	0.25
11015	1110	463	0.400000006
11016	1110	3976	0.400000006
11017	1110	45	0.400000006
11018	1110	555	0.400000006
11019	1110	33	0.800000012
11020	1110	53	0.800000012
11021	1110	499	0.5
11022	1110	4034	0.5
11023	1110	292	0.5
11024	1110	422	0.200000003
11025	1110	162	0.100000001
11026	1111	16	0.5
11027	1111	10	0.5
11028	1111	4173	0.899999976
11029	1111	4174	0.899999976
11030	1111	4175	1
11031	1111	4176	0.699999988
11032	1111	489	0.600000024
11033	1111	4177	0.5
11034	1111	4178	0.5
11035	1111	4179	0.899999976
11036	1111	4180	0.899999976
11037	1111	1409	0.100000001
11038	1111	4181	0.949999988
11039	1112	235	0.5
11040	1112	3129	0.5
11041	1112	4182	0.5
11042	1112	4183	0.5
11043	1112	10	0.5
11044	1112	844	0.5
11045	1112	441	0.5
11046	1112	2695	0.5
11047	1112	2488	0.5
11048	1112	12	0.5
11049	1112	292	0.5
11050	1112	4156	0.5
11051	1112	4184	0.5
11052	1112	395	0.5
11053	1112	4185	0.5
11054	1112	9	0.5
11055	1112	68	0.5
11056	1112	194	0.5
11057	1112	33	0.5
11058	1112	489	0.5
11059	1112	4186	0.5
11060	1112	3131	0.5
11061	1112	1511	0.5
11062	1112	681	0.5
11063	1112	1724	0.5
11064	1112	1618	0.5
11065	1112	499	0.5
11066	1112	14	0.5
11067	1112	6	0.5
11068	1112	445	0.5
11069	1112	522	0.5
11070	1112	398	0.5
11071	1112	4187	0.5
11072	1112	4188	0.5
11073	1112	4189	0.5
11074	1112	422	0.5
11075	1112	4190	0.5
11076	1112	547	0.5
11077	1112	4191	0.5
11078	1112	36	0.5
11079	1112	291	0.5
11080	1112	162	0.5
11081	1112	1730	0.5
11082	1112	1129	0.5
11083	1112	800	0.5
11084	1112	4192	0.5
11085	1112	1131	0.5
11086	1112	16	0.5
11087	1113	235	0.5
11088	1113	896	0.5
11089	1113	4193	0.5
11090	1113	68	0.5
11091	1113	4194	0.5
11092	1113	6	0.5
11093	1113	1422	0.5
11094	1113	434	0.5
11095	1113	4195	0.5
11096	1113	10	0.5
11097	1113	1	0.5
11098	1113	4196	0.5
11099	1113	734	0.5
11100	1113	1567	0.5
11101	1113	4197	0.5
11102	1113	4198	0.5
11103	1113	9	0.5
11104	1113	4199	0.5
11105	1113	16	0.5
11106	1113	107	0.5
11107	1113	2021	0.5
11108	1113	500	0.5
11109	1114	2713	0.899999976
11110	1114	4200	0.800000012
11111	1114	4201	0.5
11112	1114	4088	0.800000012
11113	1114	4202	0.800000012
11114	1114	4203	0.800000012
11115	1114	4204	0.800000012
11116	1114	4205	0.899999976
11117	1114	2547	0
11118	1114	4206	0
11119	1114	4207	0.0500000007
11120	1114	2682	0.400000006
11121	1115	4208	0.5
11122	1115	235	0.5
11123	1115	4149	0.5
11124	1115	4209	0.5
11125	1115	14	0.5
11126	1115	429	0.5
11127	1115	6	0.5
11128	1115	10	0.5
11129	1115	422	0.5
11130	1115	1	0.5
11131	1115	4210	0.5
11132	1115	194	0.5
11133	1115	734	0.5
11134	1115	756	0.5
11135	1115	304	0.5
11136	1115	4211	0.5
11137	1115	4212	0.5
11138	1115	292	0.5
11139	1115	3856	0.5
11140	1115	1844	0.5
11141	1115	4213	0.5
11142	1115	291	0.5
11143	1115	68	0.5
11144	1115	4214	0.5
11145	1115	40	0.5
11146	1115	4215	0.5
11147	1115	16	0.5
11148	1115	916	0.5
11149	1115	9	0.5
11150	1115	1422	0.25
11151	1116	235	0.5
11152	1116	1263	0.5
11153	1116	2977	0.5
11154	1116	4216	0.5
11155	1116	4217	0.5
11156	1116	1772	0.5
11157	1116	4218	0.5
11158	1116	4219	0.5
11159	1116	4220	0.5
11160	1116	6	0.5
11161	1116	3823	0.5
11162	1116	4221	0.5
11163	1116	8	0.5
11164	1116	434	0.5
11165	1116	4222	0.5
11166	1116	10	0.5
11167	1116	68	0.5
11168	1116	161	0.5
11169	1116	398	0.5
11170	1116	1	0.5
11171	1116	1129	0.5
11172	1116	4223	0.5
11173	1116	4224	0.5
11174	1116	4225	0.5
11175	1116	4185	0.5
11176	1116	2684	0.5
11177	1116	2488	0.5
11178	1116	547	0.5
11179	1116	4226	0.5
11180	1116	12	0.5
11181	1116	16	0.5
11182	1116	163	0.5
11183	1116	4227	0.5
11184	1116	9	0.5
11185	1117	235	0.5
11186	1117	9	0.5
11187	1117	4019	0.100000001
11188	1117	4228	0.5
11189	1117	10	0.5
11190	1117	4229	0.5
11191	1117	1	0.5
11192	1117	4230	0.100000001
11193	1117	717	0.100000001
11194	1117	3033	0.5
11195	1117	734	0.5
11196	1117	4231	0.5
11197	1117	83	0.100000001
11198	1117	4161	0.5
11199	1117	185	0.100000001
11200	1117	291	0.5
11201	1117	1564	0.5
11202	1117	6	0.5
11203	1117	68	0.5
11204	1117	4232	0.5
11205	1117	4233	0.5
11206	1117	4234	0.100000001
11207	1117	2547	0.100000001
11208	1117	1564	0.5
11209	1117	703	0.5
11210	1117	16	0.5
11211	1117	4235	0.5
11212	1117	896	0.5
11213	1117	401	0.5
11214	1117	4236	0.5
11215	1117	4237	0.5
11216	1117	4238	0.5
11217	1117	3137	0.100000001
11218	1117	801	0.5
11219	1117	4239	0.100000001
11220	1117	4240	0.5
11221	1117	4241	0.5
11222	1117	4242	0.5
11223	1117	4243	0.5
11224	1117	4244	0.100000001
11225	1117	1257	0.5
11226	1117	3140	0.5
11227	1117	4245	0.5
11228	1117	2559	0.5
11229	1117	4246	0.5
11230	1117	3087	0.100000001
11231	1117	3231	0.5
11232	1117	1263	0.5
11233	1117	392	0.100000001
11234	1117	4152	0.5
11235	1117	4155	0.5
11236	1117	4247	0.5
11237	1117	4248	0.5
11238	1117	522	0.100000001
11239	1118	4249	0.600000024
11240	1118	3345	0.600000024
11241	1118	4250	0.5
11242	1118	4251	0.5
11243	1118	4252	0.300000012
11244	1118	3564	0.400000006
11245	1118	1054	0.400000006
11246	1118	2400	0.600000024
11247	1118	4253	0.400000006
11248	1118	4254	0.400000006
11249	1118	4255	0.400000006
11250	1118	1666	0.200000003
11251	1118	4256	0.949999988
11252	1118	4257	0.699999988
11253	1118	4258	0.699999988
11254	1118	4259	0.600000024
11255	1118	4260	0.600000024
11256	1118	4261	0.699999988
11257	1119	395	0.899999976
11258	1119	499	0.899999976
11259	1119	15	0.899999976
11260	1119	4262	0.899999976
11261	1119	12	0.899999976
11262	1119	163	0.800000012
11263	1119	707	0.800000012
11264	1119	4263	0.800000012
11265	1119	489	0.699999988
11266	1119	42	0.600000024
11267	1119	547	0.600000024
11268	1119	3237	0.600000024
11269	1119	398	0.5
11270	1120	235	0.5
11271	1120	9	0.5
11272	1120	10	0.5
11273	1120	68	0.5
11274	1120	641	0.5
11275	1120	4264	0.5
11276	1120	16	0.5
11277	1120	1	0.5
11278	1120	4265	0.5
11279	1121	4266	0.100000001
11280	1121	4267	1
11281	1121	4268	1
11282	1121	2227	0.949999988
11283	1121	14	0.899999976
11284	1121	686	0.5
11285	1121	4269	0.699999988
11286	1121	4270	0.800000012
11287	1122	480	0.99000001
11288	1122	4271	1
11289	1122	4272	0.600000024
11290	1122	4273	0.400000006
11291	1122	398	0.800000012
11292	1122	292	0.800000012
11293	1122	445	0.800000012
11294	1122	291	0.800000012
11295	1122	40	0.800000012
11296	1122	396	0.600000024
11297	1122	3503	0.5
11298	1122	659	0.99000001
11299	1122	431	0.99000001
11300	1122	83	0.999000013
11301	1122	16	0.5
11302	1122	10	0.5
11303	1123	229	0.899999976
11304	1123	4274	1
11305	1124	4275	1
11306	1124	4276	1
11307	1124	4277	1
11308	1125	3825	0.75
11309	1125	3826	0.800000012
11310	1125	3827	0.899999976
11311	1126	4209	1
11312	1126	4278	1
11313	1127	4279	1
11314	1128	4275	1
11315	1128	4277	1
11316	1129	4280	1
11317	1129	4277	1
11318	1130	4281	1
11319	1130	2940	0.75
11320	1130	4277	1
11321	1131	4281	1
11322	1131	2940	1
11323	1131	4277	1
11324	1132	4282	0.5
11325	1132	2117	0.5
11326	1132	2691	0.5
11327	1132	2173	0.5
11328	1132	4283	0.5
11329	1132	4284	0.5
11330	1132	1512	0.5
11331	1133	4285	1
11332	1134	431	1
11333	1134	68	0.949999988
11334	1134	303	0.99000001
11335	1134	3865	0.899999976
11336	1134	4286	0.899999976
11337	1134	16	0.519999981
11338	1134	10	0.479999989
11339	1134	3189	0.899999976
11340	1134	4287	0.400000006
11341	1134	4288	0.899999976
11342	1134	420	0.800000012
11343	1134	4289	0.5
11344	1134	397	0.800000012
11345	1134	396	0.800000012
11346	1134	2059	0.800000012
11347	1134	4290	0.600000024
11348	1134	4291	0.119999997
11349	1134	4292	0.800000012
11350	1135	4293	1
11351	1135	641	1
11352	1135	4294	1
11353	1135	425	1
11354	1136	4295	1
11355	1137	2923	0.949999988
11356	1137	4296	0.899999976
11357	1137	4297	0.899999976
11358	1137	4298	0.899999976
11359	1137	4299	0.899999976
11360	1137	3183	0.899999976
11361	1137	4300	0.800000012
11362	1137	4301	0.800000012
11363	1138	126	1
11364	1138	4302	0.5
11365	1138	6	0.5
11366	1138	9	0.5
11367	1138	10	0.5
11368	1138	4303	0.5
11369	1138	4304	0.5
11370	1138	4305	0.5
11371	1138	68	0.5
11372	1138	16	0.5
11373	1139	235	0.5
11374	1139	1370	0.75
11375	1139	236	0.5
11376	1139	6	0.5
11377	1139	4306	1
11378	1139	237	0.5
11379	1139	9	0.5
11380	1139	10	0.5
11381	1139	68	0.75
11382	1139	4307	0.75
11383	1139	4308	0.75
11384	1139	16	0.5
11385	1140	4309	1
11386	1140	10	0.949999988
11387	1140	2255	1
11388	1140	4310	0.280000001
11389	1140	4311	0.620000005
11390	1140	4312	0.949999988
11391	1140	4313	0.899999976
11392	1140	4314	0.899999976
11393	1140	4315	0.600000024
11394	1140	185	0.600000024
11395	1140	4316	0.600000024
11396	1140	4317	0.600000024
11397	1140	4318	0.5
11398	1140	4319	0.5
11399	1140	4320	0.800000012
11400	1140	4321	0.800000012
11401	1140	3647	0.949999988
11402	1140	4322	0.800000012
11403	1140	1943	0.800000012
11404	1141	4323	0.899999976
11405	1141	16	0.699999988
11406	1141	10	0.300000012
11407	1141	235	1
11408	1141	189	0.899999976
11409	1141	4324	0.800000012
11410	1141	4325	0.899999976
11411	1141	1943	0.800000012
11412	1142	4326	0.949999988
11413	1142	4327	1
11414	1142	16	0.670000017
11415	1142	10	0.330000013
11416	1142	4328	0.600000024
11417	1142	4329	0.400000006
11418	1142	229	0.100000001
11419	1143	10	0.5
11420	1143	3976	0.5
11421	1143	6	0.5
11422	1143	9	0.5
11423	1143	1773	0.5
11424	1143	68	0.5
11425	1143	1	0.5
11426	1143	77	0.5
11427	1143	20	0.5
11428	1143	546	0.5
11429	1143	16	0.5
11430	1144	1	0.5
11431	1144	9	0.5
11432	1144	10	0.5
11433	1144	68	0.5
11434	1144	16	0.5
11435	1144	4330	0.5
11436	1144	4331	0.5
11437	1144	6	0.5
11438	1144	4332	0.5
11439	1145	235	0.5
11440	1145	37	0.5
11441	1145	4333	1
11442	1145	236	0.5
11443	1145	4334	1
11444	1145	237	0.5
11445	1145	6	0.5
11446	1145	10	0.5
11447	1145	68	0.5
11448	1145	1	0.5
11449	1145	16	0.5
11450	1145	9	0.5
11451	1146	235	0.5
11452	1146	498	1
11453	1146	236	0.5
11454	1146	6	0.5
11455	1146	237	0.5
11456	1146	10	0.5
11457	1146	4335	0.949999988
11458	1146	76	0.5
11459	1146	2154	0.75
11460	1146	4336	0.949999988
11461	1146	4042	0.75
11462	1146	4337	0.100000001
11463	1146	37	0.75
11464	1146	4338	0.75
11465	1146	599	0.75
11466	1146	53	0.75
11467	1146	291	0.75
11468	1146	9	0.5
11469	1146	68	0.5
11470	1146	4339	0.100000001
11471	1146	258	0.5
11472	1146	4340	0.100000001
11473	1146	4341	0.100000001
11474	1146	3065	0.649999976
11475	1146	105	0.75
11476	1146	4342	1
11477	1146	16	0.5
11478	1146	88	0.75
11479	1146	257	0.75
11480	1146	291	0.75
11481	1146	53	0.75
11482	1146	83	0.75
11483	1146	107	0.75
11484	1146	1842	0.75
11485	1147	4343	0.800000012
11486	1147	4344	0.899999976
11487	1147	4345	0.899999976
11488	1147	4346	0.100000001
11489	1147	4347	0.0199999996
11490	1147	4348	0.699999988
11491	1147	4349	0.699999988
11492	1147	4350	0.699999988
11493	1147	4351	0.300000012
11494	1147	4352	0.800000012
11495	1147	4353	0.400000006
11496	1147	4354	0.800000012
11497	1147	4355	0.800000012
11498	1147	4356	0.800000012
11499	1147	4357	0.899999976
11500	1147	1007	0.699999988
11501	1147	83	0.699999988
11502	1148	37	1
11503	1148	39	0.5
11504	1148	3975	0.5
11505	1148	4358	0.5
11506	1148	2427	0.5
11507	1148	4359	0.5
11508	1148	6	0.5
11509	1148	81	0.5
11510	1148	4360	0.5
11511	1148	53	0.5
11512	1148	291	0.5
11513	1148	10	0.5
11514	1148	68	0.5
11515	1148	3952	0.5
11516	1148	4361	0.5
11517	1148	83	0.5
11518	1148	38	0.5
11519	1148	4362	0.5
11520	1148	4363	0.5
11521	1148	472	0.5
11522	1148	4364	0.5
11523	1148	470	0.5
11524	1148	105	0.5
11525	1148	4365	0.5
11526	1148	1151	0.5
11527	1148	417	0.5
11528	1148	4366	0.5
11529	1148	16	0.5
11530	1148	35	0.5
11531	1148	4367	0.5
11532	1148	4368	0.5
11533	1148	9	0.5
11534	1148	4369	0.75
11535	1148	15	0.25
11536	1148	53	0.5
11537	1148	329	0.25
11538	1148	3404	0.25
11539	1148	1516	0.25
11540	1149	451	0.899999976
11541	1149	4370	0.899999976
11542	1149	315	0.800000012
11543	1149	291	0.699999988
11544	1149	277	0.699999988
11545	1149	314	0.5
11546	1149	4371	0.5
11547	1149	12	0.699999988
11548	1149	1411	0.600000024
11549	1149	4372	0.5
11550	1149	163	0.699999988
11551	1149	76	0.5
11552	1149	37	0.600000024
11553	1149	107	0.600000024
11554	1150	37	0.75
11555	1150	4373	0.75
11556	1150	4374	0.25
11557	1150	250	0.75
11558	1151	37	0.75
11559	1151	250	0.75
11560	1151	4375	0.75
11561	1151	3063	0.349999994
11562	1151	4376	0.400000006
11563	1151	277	0.949999988
11564	1151	312	0.600000024
11565	1151	4377	0.0500000007
11566	1151	4378	0.319999993
11567	1152	292	0.75
11568	1152	235	0.5
11569	1152	37	0.5
11570	1152	567	1
11571	1152	4379	0.5
11572	1152	395	0.5
11573	1152	599	0.75
11574	1152	236	0.5
11575	1152	107	0.5
11576	1152	6	0.5
11577	1152	536	0.75
11578	1152	237	0.5
11579	1152	250	0.649999976
11580	1152	10	0.5
11581	1152	68	0.5
11582	1152	365	0.75
11583	1152	79	0.5
11584	1152	4380	0.5
11585	1152	16	0.5
11586	1152	9	0.5
11587	1152	88	0.5
11588	1152	291	0.75
11589	1153	235	0.5
11590	1153	236	0.5
11591	1153	6	0.5
11592	1153	237	0.5
11593	1153	10	0.5
11594	1153	4381	0.949999988
11595	1153	536	0.75
11596	1153	365	0.75
11597	1153	4382	0.75
11598	1153	292	0.75
11599	1153	37	0.5
11600	1153	567	1
11601	1153	395	0.5
11602	1153	599	0.75
11603	1153	250	0.649999976
11604	1153	68	0.5
11605	1153	79	0.5
11606	1153	107	0.5
11607	1153	4383	0.75
11608	1153	16	0.5
11609	1153	4384	0.75
11610	1153	9	0.5
11611	1154	235	0.5
11612	1154	4385	1
11613	1154	236	0.5
11614	1154	6	0.100000001
11615	1154	237	0.5
11616	1154	10	0.5
11617	1154	4386	0.75
11618	1154	40	0.75
11619	1154	536	0.75
11620	1154	365	0.75
11621	1154	292	0.75
11622	1154	37	0.5
11623	1154	395	0.5
11624	1154	599	0.75
11625	1154	9	0.5
11626	1154	68	0.5
11627	1154	79	0.5
11628	1154	4387	0.75
11629	1154	107	0.5
11630	1154	4388	0.75
11631	1154	377	0.75
11632	1154	16	0.5
11633	1154	634	0.5
11634	1154	567	0.75
11635	1154	4389	0.75
11636	1155	4390	0.899999976
11637	1155	72	0.75
11638	1155	115	0.5
11639	1156	4391	0.600000024
11640	1156	4392	0.400000006
11641	1156	4393	0.75
11642	1156	4394	0.5
11643	1156	4395	0.75
11644	1156	4396	0.75
11645	1157	4397	0.899999976
11646	1157	4398	0.75
11647	1157	2018	0.899999976
11648	1157	2540	0.899999976
11649	1157	82	0.5
11650	1157	4399	0.25
11651	1157	1614	0.25
11652	1157	2792	0.300000012
11653	1157	1644	0.25
11654	1157	499	0.25
11655	1157	4400	0.25
11656	1158	4401	1
11657	1159	4402	0.5
11658	1159	4403	0.5
11659	1159	6	0.5
11660	1159	9	0.5
11661	1159	35	0.5
11662	1160	4404	1
11663	1161	1946	0.75
11664	1161	4405	0.5
11665	1161	4406	0.5
11666	1161	4407	0.5
11667	1161	4408	1
11668	1162	4409	0.75
11669	1162	4410	0.75
11670	1162	4411	0.75
11671	1162	4412	0.5
11672	1162	4413	0.5
11673	1162	4414	0.5
11674	1163	3072	0.5
11675	1163	4415	0.5
11676	1163	9	0.5
11677	1163	10	0.5
11678	1163	94	0.5
11679	1163	95	0.5
11680	1163	4416	0.5
11681	1163	16	0.5
11682	1163	4417	0.5
11683	1164	235	0.5
11684	1164	4418	0.100000001
11685	1164	14	1
11686	1164	4419	1
11687	1164	236	0.5
11688	1164	821	0.75
11689	1164	6	0.5
11690	1164	834	0.75
11691	1164	237	0.5
11692	1164	9	0.5
11693	1164	10	0.5
11694	1164	68	0.5
11695	1164	4420	0.949999988
11696	1164	16	0.5
11697	1164	4421	0.949999988
11698	1164	4422	0.75
11699	1165	4423	0.75
11700	1165	2825	0.75
11701	1165	74	0.5
11702	1165	427	0.5
11703	1165	33	0.5
11704	1165	36	0.5
11705	1165	4424	0.25
11706	1165	2272	0.25
11707	1165	531	0.5
11708	1166	235	0.5
11709	1166	37	0.75
11710	1166	499	0.75
11711	1166	1876	0.949999988
11712	1166	83	0.75
11713	1166	236	0.5
11714	1166	4425	0.75
11715	1166	82	0.75
11716	1166	4426	0.75
11717	1166	4427	0.75
11718	1166	237	0.5
11719	1166	6	0.5
11720	1166	10	0.5
11721	1166	68	0.5
11722	1166	38	0.75
11723	1166	16	0.5
11724	1166	9	0.5
11725	1167	1025	0.5
11726	1167	4428	0.5
11727	1167	1412	0.5
11728	1167	4429	0.5
11729	1167	547	0.5
11730	1167	4430	0.5
11731	1167	16	0.5
11732	1167	6	0.5
11733	1167	2282	0.5
11734	1167	4431	0.5
11735	1167	4432	0.5
11736	1167	9	0.5
11737	1167	10	0.5
11738	1167	68	0.100000001
11739	1167	844	0.5
11740	1167	4433	0.5
11741	1167	2695	0.5
11742	1167	4434	0.5
11743	1167	3769	0.5
11744	1167	1806	0.5
11745	1167	971	0.5
11746	1167	4435	0.5
11747	1167	4436	0.5
11748	1167	2283	0.5
11749	1167	4437	0.5
11750	1167	2603	0.5
11751	1167	2021	0.5
11752	1167	1470	0.5
11753	1167	4438	0.5
11754	1167	4439	0.5
11755	1167	4440	0.5
11756	1167	681	0.5
11757	1167	292	0.5
11758	1167	392	0.25
11759	1168	235	0.5
11760	1168	37	0.75
11761	1168	619	0.75
11762	1168	3227	0.5
11763	1168	2615	0.75
11764	1168	236	0.5
11765	1168	1518	0.75
11766	1168	6	0.5
11767	1168	324	0.5
11768	1168	851	0.5
11769	1168	237	0.5
11770	1168	9	0.5
11771	1168	10	0.5
11772	1168	68	0.5
11773	1168	4441	0.5
11774	1168	3226	0.5
11775	1168	4442	0.75
11776	1168	4443	0.5
11777	1168	2466	0.5
11778	1168	422	0.75
11779	1168	1514	0.75
11780	1168	4290	0.5
11781	1168	15	0.75
11782	1168	972	0.5
11783	1168	845	0.5
11784	1168	4444	0.75
11785	1168	4445	0.5
11786	1168	2291	0.5
11787	1168	16	0.5
11788	1168	4446	0.75
11789	1168	292	1
11790	1169	36	0.600000024
11791	1169	14	0.600000024
11792	1169	821	0.600000024
11793	1169	4447	0.600000024
11794	1169	4448	0.600000024
11795	1169	3047	0.5
11796	1169	3049	0.400000006
11797	1169	4449	0.699999988
11798	1169	74	0.699999988
11799	1169	499	0.899999976
11800	1169	16	0.75
11801	1169	10	0.25
11802	1169	4450	0.600000024
11803	1169	4451	0.5
11804	1169	4452	0.5
11805	1169	4453	0.5
11806	1169	37	0.300000012
11807	1169	68	0.99000001
11808	1169	235	0.699999988
11809	1169	4454	0.100000001
11810	1170	235	0.5
11811	1170	4161	0.5
11812	1170	6	0.5
11813	1170	9	0.5
11814	1170	10	0.5
11815	1170	68	0.5
11816	1170	4455	0.5
11817	1170	4152	0.5
11818	1170	1	0.5
11819	1170	4245	0.5
11820	1170	16	0.5
11821	1171	854	1
11822	1171	1475	0.899999976
11823	1171	857	0.899999976
11824	1171	324	0.899999976
11825	1171	348	0.899999976
11826	1171	4456	0.699999988
11827	1171	4457	0.800000012
11828	1171	379	0.800000012
11829	1171	4458	0.400000006
11830	1171	4459	0.600000024
11831	1171	4460	0.600000024
11832	1171	4461	0.600000024
11833	1171	1045	0.5
11834	1172	4462	1
11835	1172	95	0.800000012
11836	1172	2619	0.800000012
11837	1172	94	0.800000012
11838	1172	329	0.699999988
11839	1172	1091	0.800000012
11840	1172	4463	0.5
11841	1172	4464	0.200000003
11842	1172	4465	0.200000003
11843	1173	292	0.75
11844	1173	235	0.5
11845	1173	37	0.5
11846	1173	10	0.5
11847	1173	618	0.100000001
11848	1173	4466	0.949999988
11849	1173	236	0.5
11850	1173	107	0.75
11851	1173	82	0.75
11852	1173	36	0.5
11853	1173	1891	0.75
11854	1173	531	0.649999976
11855	1173	6	0.5
11856	1173	4467	0.100000001
11857	1173	68	0.5
11858	1173	237	0.5
11859	1173	377	0.75
11860	1173	378	0.75
11861	1173	16	0.5
11862	1173	9	0.5
11863	1174	4468	0.5
11864	1174	37	0.800000012
11865	1174	292	0.699999988
11866	1174	53	0.699999988
11867	1174	4469	0.699999988
11868	1174	1515	0.699999988
11869	1174	709	0.600000024
11870	1174	845	0.600000024
11871	1174	551	0.600000024
11872	1174	1223	0.899999976
11873	1174	4470	0.800000012
11874	1174	1290	0.899999976
11875	1174	4471	0.699999988
11876	1175	3883	0.949999988
11877	1175	3420	0.949999988
11878	1175	37	0.899999976
11879	1175	292	0.899999976
11880	1175	395	0.899999976
11881	1175	427	0.899999976
11882	1176	4472	1
11883	1176	291	0.75
11884	1176	499	0.600000024
11885	1176	4473	0.899999976
11886	1176	4474	0.899999976
11887	1176	4475	0.899999976
11888	1176	4146	0.699999988
11889	1176	3567	0.699999988
11890	1176	4476	0.600000024
11891	1176	3420	0.0500000007
11892	1176	4477	0.0500000007
11893	1177	3829	0.400000006
11894	1177	68	0.949999988
11895	1177	4478	0.699999988
11896	1177	4479	0.699999988
11897	1177	4480	0.699999988
11898	1177	4481	0.5
11899	1177	4482	0.300000012
11900	1177	4483	0.200000003
11901	1177	37	0.200000003
11902	1177	425	0.200000003
11903	1177	401	0.899999976
11904	1177	2535	0.899999976
11905	1177	4484	0.800000012
11906	1178	68	1
11907	1178	4485	0.800000012
11908	1178	4486	0.899999976
11909	1178	4487	0.800000012
11910	1178	729	0.800000012
11911	1178	4488	0.699999988
11912	1178	4489	0.899999976
11913	1178	4338	0.800000012
11914	1178	4490	0.800000012
11915	1178	10	0.699999988
11916	1178	16	0.300000012
11917	1178	71	0.379999995
11918	1178	4491	0.300000012
11919	1178	37	0.300000012
11920	1178	90	0.300000012
11921	1178	107	0.400000006
11922	1178	14	0.300000012
11923	1178	419	0.300000012
11924	1178	390	0.200000003
11925	1178	4492	0.0500000007
11926	1178	4493	0.0500000007
11927	1179	4494	1
11928	1179	4327	1
11929	1179	16	0.330000013
11930	1179	10	0.670000017
11931	1179	4329	0.600000024
11932	1179	4328	0.400000006
11933	1179	229	0.100000001
11934	1179	2454	0.699999988
11935	1180	4495	0.200000003
11936	1180	4496	0.25
11937	1180	4497	0.349999994
11938	1180	4498	0.949999988
11939	1180	398	0.800000012
11940	1180	37	0.800000012
11941	1180	2428	0.800000012
11942	1180	869	0.800000012
11943	1180	79	0.699999988
11944	1180	1229	0.699999988
11945	1180	1842	0.600000024
11946	1180	257	0.800000012
11947	1180	76	0.600000024
11948	1180	105	0.800000012
11949	1180	250	0.899999976
11950	1180	4499	0.800000012
11951	1180	83	0.800000012
11952	1180	431	0.800000012
11953	1180	4500	0
11954	1180	4501	0.800000012
11955	1180	4502	0.800000012
11956	1180	4503	0.800000012
11957	1181	4504	1
11958	1181	37	0.75
11959	1181	53	0.75
11960	1181	82	0.75
11961	1181	4505	0.5
11962	1181	107	0.5
11963	1181	434	0.5
11964	1181	4017	0.5
11965	1181	1664	0.5
11966	1182	597	0.5
11967	1182	401	0.5
11968	1182	10	0.5
11969	1182	68	0.5
11970	1182	16	0.5
11971	1183	235	0.5
11972	1183	74	0.5
11973	1183	6	0.5
11974	1183	126	1
11975	1183	10	0.5
11976	1183	1752	0.5
11977	1183	4506	0.5
11978	1183	2272	0.5
11979	1183	4507	0.5
11980	1183	37	0.5
11981	1183	2523	0.5
11982	1183	277	0.5
11983	1183	9	0.5
11984	1183	68	0.5
11985	1183	79	0.5
11986	1183	4508	0.5
11987	1183	16	0.5
11988	1183	275	0.5
11989	1183	4509	0.5
11990	1183	390	0.5
11991	1183	4510	0.5
11992	1184	235	0.5
11993	1184	1865	0.75
11994	1184	236	0.5
11995	1184	1363	0.75
11996	1184	237	0.5
11997	1184	10	0.5
11998	1184	851	0.75
11999	1184	422	0.75
12000	1184	431	0.100000001
12001	1184	4511	0.75
12002	1184	498	1
12003	1184	4512	1
12004	1184	4513	1
12005	1184	3482	0.649999976
12006	1184	632	0.649999976
12007	1184	4514	0.75
12008	1184	37	1
12009	1184	619	0.75
12010	1184	4515	0.75
12011	1184	6	0.5
12012	1184	68	0.75
12013	1184	83	0.649999976
12014	1184	419	0.75
12015	1184	1332	0.649999976
12016	1184	902	0.649999976
12017	1184	511	0.75
12018	1184	4516	0.75
12019	1184	16	0.5
12020	1184	9	0.5
12021	1185	3341	0.75
12022	1185	235	0.5
12023	1185	16	0.5
12024	1185	3342	0.75
12025	1185	3343	0.75
12026	1185	236	0.5
12027	1185	4517	0.949999988
12028	1185	6	0.5
12029	1185	255	0.75
12030	1185	237	0.5
12031	1185	9	0.5
12032	1185	10	0.5
12033	1185	68	0.5
12034	1185	4518	0.949999988
12035	1185	1484	0.75
12036	1185	3344	0.75
12037	1186	235	0.5
12038	1186	499	0.5
12039	1186	4519	0.5
12040	1186	6	0
12041	1186	9	0
12042	1186	10	0.5
12043	1186	68	0
12044	1186	3033	0.5
12045	1186	4520	0.5
12046	1186	16	0.5
12047	1187	659	0.75
12048	1187	235	0.5
12049	1187	236	0.5
12050	1187	10	0.75
12051	1187	2510	0.5
12052	1187	419	0.5
12053	1187	2264	0.5
12054	1187	257	0.5
12055	1187	107	0.5
12056	1187	6	0.5
12057	1187	400	0.5
12058	1187	3065	0.649999976
12059	1187	237	0.5
12060	1187	9	0.5
12061	1187	570	0.75
12062	1187	68	0.5
12063	1187	4521	0.949999988
12064	1187	16	0.5
12065	1187	4514	0.75
12066	1188	498	0.75
12067	1188	235	0.5
12068	1188	4515	0.5
12069	1188	4522	0.649999976
12070	1188	4523	0.75
12071	1188	4524	0.649999976
12072	1188	236	0.5
12073	1188	6	0.5
12074	1188	237	0.5
12075	1188	9	0.5
12076	1188	10	0.5
12077	1188	68	0.5
12078	1188	4521	0.949999988
12079	1188	531	0.649999976
12080	1188	16	0.75
12081	1188	4514	0.75
12082	1189	235	0.5
12083	1189	619	0.100000001
12084	1189	236	0.5
12085	1189	6	0.5
12086	1189	3290	0.100000001
12087	1189	4525	0.949999988
12088	1189	237	0.5
12089	1189	9	0.5
12090	1189	10	0.5
12091	1189	68	0.5
12092	1189	4526	0.100000001
12093	1189	1554	0.100000001
12094	1189	16	0.5
12095	1190	2559	0.899999976
12096	1190	717	0.5
12097	1190	4527	0.75
12098	1190	4528	0.5
12099	1190	4529	0.5
12100	1190	4530	1
12101	1190	2538	0.5
12102	1190	4531	0.25
12103	1190	4532	0.400000006
12104	1190	4533	0.550000012
12105	1190	4534	0.300000012
12106	1191	4535	1
12107	1191	4536	0.75
12108	1191	4527	0.75
12109	1192	4537	0.75
12110	1192	4538	0.899999976
12111	1192	4539	0.5
12112	1192	4540	0.75
12113	1192	4541	0.25
12114	1192	4542	0.25
12115	1192	3651	0.200000003
12116	1192	4543	0.600000024
12117	1192	4544	0.25
12118	1192	4545	0.25
12119	1192	1955	0.330000013
12120	1193	4546	1
12121	1193	4547	0.899999976
12122	1193	2225	0.899999976
12123	1194	235	0.5
12124	1194	6	0.100000001
12125	1194	4548	0.5
12126	1194	4549	0.5
12127	1194	9	0.100000001
12128	1194	68	0.5
12129	1194	4550	0.5
12130	1194	76	0.5
12131	1194	4551	0.5
12132	1194	800	0.5
12133	1194	4552	0.5
12134	1194	1849	0.5
12135	1194	2859	0.5
12136	1194	239	0.5
12137	1195	4553	1
12138	1195	37	0.899999976
12139	1195	292	0.75
12140	1195	1231	0.75
12141	1196	235	0.5
12142	1196	6	0.5
12143	1196	489	0.5
12144	1196	9	0.5
12145	1196	10	0.5
12146	1196	68	0.5
12147	1196	971	0.5
12148	1196	16	0.5
12149	1196	1197	0.5
12150	1196	33	0.5
12151	1197	4554	0.5
12152	1197	4555	0.5
12153	1197	235	0.5
12154	1197	10	0.5
12155	1197	1694	0.5
12156	1197	33	0.5
12157	1197	74	0.5
12158	1197	1	0.5
12159	1197	6	0.5
12160	1197	36	0.5
12161	1197	4556	1
12162	1197	9	0.5
12163	1197	4557	0.5
12164	1197	68	0.5
12165	1197	834	0.5
12166	1197	16	0.5
12167	1198	4558	1
12168	1199	235	0.5
12169	1199	37	0.5
12170	1199	4559	0.75
12171	1199	236	0.5
12172	1199	4560	0.75
12173	1199	4561	0.75
12174	1199	529	0.100000001
12175	1199	6	0.5
12176	1199	393	0.75
12177	1199	237	0.5
12178	1199	9	0.5
12179	1199	10	0.5
12180	1199	4562	1
12181	1199	68	0.5
12182	1199	16	0.5
12183	1200	235	0.5
12184	1200	90	0.5
12185	1200	422	0.5
12186	1200	236	0.5
12187	1200	162	0.5
12188	1200	4563	0.5
12189	1200	4564	0.5
12190	1200	10	0.5
12191	1200	1117	0.5
12192	1200	40	0.5
12193	1200	4565	0.5
12194	1200	12	0.5
12195	1200	4566	0.5
12196	1200	599	0.5
12197	1200	277	0.5
12198	1200	9	0.5
12199	1200	68	0.5
12200	1200	4567	0.5
12201	1200	33	0.5
12202	1200	4568	0.5
12203	1200	8	0.5
12204	1200	426	0.5
12205	1200	4569	0.5
12206	1200	4570	0.5
12207	1200	16	0.5
12208	1200	566	0.5
12209	1200	600	0.5
12210	1200	896	0.5
12211	1200	14	0.5
12212	1200	6	0.5
12213	1200	434	0.5
12214	1200	4571	0.5
12215	1200	4572	0.5
12216	1200	74	0.5
12217	1200	4573	0.5
12218	1200	1191	0.5
12219	1200	619	0.5
12220	1200	4574	0.5
12221	1200	547	0.5
12222	1200	36	0.5
12223	1200	391	0.5
12224	1200	79	0.5
12225	1200	511	0.5
12226	1200	392	0.5
12227	1201	4575	1
12228	1201	4576	0.75
12229	1201	4577	0.75
12230	1201	4578	0.5
12231	1201	4579	0.5
12232	1201	4580	0.5
12233	1202	4581	1
12234	1202	4582	1
12235	1202	4583	1
12236	1202	4584	1
12237	1203	4585	1
12238	1203	4586	1
12239	1203	4587	1
12240	1203	4588	1
12241	1203	4589	1
12242	1204	4590	0.99000001
12243	1204	4591	0.99000001
12244	1204	4592	0.99000001
12245	1204	4593	0.99000001
12246	1204	4594	0.99000001
12247	1204	4595	0.99000001
12248	1204	4596	0.699999988
12249	1205	235	0.5
12250	1205	24	0.75
12251	1205	14	0.75
12252	1205	236	0.5
12253	1205	2202	0.75
12254	1205	6	0.75
12255	1205	237	0.5
12256	1205	10	0.5
12257	1205	4597	0.949999988
12258	1205	74	0.75
12259	1205	4598	0.25
12260	1205	1299	0.75
12261	1205	4599	0.75
12262	1205	4600	0.949999988
12263	1205	3608	0.75
12264	1205	547	0.75
12265	1205	9	0.5
12266	1205	68	0.5
12267	1205	4601	0.100000001
12268	1205	555	1
12269	1205	1131	0.75
12270	1205	16	0.75
12271	1206	37	0.899999976
12272	1206	38	0.899999976
12273	1206	79	0.899999976
12274	1206	107	0.5
12275	1206	292	0.5
12276	1206	291	0.5
12277	1206	427	0.5
12278	1206	844	0.5
12279	1206	74	0.200000003
12280	1206	36	0.200000003
12281	1206	547	0.100000001
12282	1206	4602	0.100000001
12283	1206	548	0.400000006
12284	1206	4603	0.5
12285	1207	235	0.5
12286	1207	236	0.5
12287	1207	6	0.5
12288	1207	237	0.5
12289	1207	10	0.5
12290	1207	4604	0.949999988
12291	1207	4605	0.949999988
12292	1207	4606	0.75
12293	1207	4607	1
12294	1207	4608	1
12295	1207	4609	1
12296	1207	4610	0.75
12297	1207	4611	0.949999988
12298	1207	4612	0.75
12299	1207	9	0.5
12300	1207	68	0.5
12301	1207	4613	0.75
12302	1207	4614	0.949999988
12303	1207	4615	0.75
12304	1207	16	0.5
12305	1207	4616	1
12306	1207	1943	1
12307	1207	4617	1
12308	1208	4618	0.75
12309	1208	235	0.5
12310	1208	236	0.5
12311	1208	4619	1
12312	1208	6	0.5
12313	1208	237	0.5
12314	1208	4620	0.75
12315	1208	10	0.5
12316	1208	4621	0.75
12317	1208	4604	0.949999988
12318	1208	4605	0.949999988
12319	1208	397	0.75
12320	1208	4622	0.75
12321	1208	365	0.75
12322	1208	4623	0.75
12323	1208	4610	0.75
12324	1208	4611	0.949999988
12325	1208	4624	0.75
12326	1208	9	0.5
12327	1208	68	0.5
12328	1208	4614	0.949999988
12329	1208	4625	0.75
12330	1208	410	0.75
12331	1208	16	0.5
12332	1208	4626	0.75
12333	1209	235	0.5
12334	1209	653	0.75
12335	1209	4627	1
12336	1209	236	0.5
12337	1209	416	0.75
12338	1209	10	0.5
12339	1209	4604	0.949999988
12340	1209	427	0.75
12341	1209	4605	0.949999988
12342	1209	4628	0.5
12343	1209	400	0.75
12344	1209	4629	0.949999988
12345	1209	4630	0.649999976
12346	1209	4631	0.649999976
12347	1209	185	0.75
12348	1209	395	0.75
12349	1209	4611	0.949999988
12350	1209	53	0.75
12351	1209	9	0.5
12352	1209	68	0.5
12353	1209	4632	0.75
12354	1209	687	0.75
12355	1209	659	0.649999976
12356	1209	4633	0.649999976
12357	1209	3952	0.75
12358	1209	4634	0.649999976
12359	1209	4635	0.649999976
12360	1209	16	0.5
12361	1209	6	0.5
12362	1209	237	0.5
12363	1209	4636	0.75
12364	1209	3951	0.649999976
12365	1209	4290	0.5
12366	1209	397	0.75
12367	1209	74	0.75
12368	1209	4637	0.949999988
12369	1209	77	0.5
12370	1209	37	0.75
12371	1209	257	0.75
12372	1209	81	0.75
12373	1209	431	0.649999976
12374	1209	4638	0.949999988
12375	1209	4614	0.949999988
12376	1209	480	0.649999976
12377	1209	3899	0.649999976
12378	1209	4639	0.75
12379	1209	3811	0.75
12380	1210	235	0.5
12381	1210	90	0.5
12382	1210	4640	0.949999988
12383	1210	236	0.5
12384	1210	6	0.5
12385	1210	4641	0.5
12386	1210	237	0.5
12387	1210	10	0.5
12388	1210	40	0.5
12389	1210	431	0.649999976
12390	1210	4642	0.75
12391	1210	4643	0.75
12392	1210	4644	0.649999976
12393	1210	37	0.75
12394	1210	4645	0.75
12395	1210	4646	0.949999988
12396	1210	9	0.75
12397	1210	68	0.75
12398	1210	4647	0.75
12399	1210	2010	0.649999976
12400	1210	4648	0.75
12401	1210	16	0.5
12402	1211	4649	0.75
12403	1211	235	0.5
12404	1211	10	0.5
12405	1211	4650	0.75
12406	1211	236	0.5
12407	1211	4651	0.75
12408	1211	6	0.5
12409	1211	4652	0.75
12410	1211	4653	0.949999988
12411	1211	4654	0.75
12412	1211	4655	0.949999988
12413	1211	237	0.5
12414	1211	9	0.5
12415	1211	4656	0.100000001
12416	1211	68	0.5
12417	1211	4017	0.75
12418	1211	16	0.5
12419	1211	4657	0.75
12420	1211	4658	0.75
12421	1211	181	0.75
12422	1212	235	0.5
12423	1212	236	0.5
12424	1212	473	0.649999976
12425	1212	10	0.5
12426	1212	851	0.5
12427	1212	4659	0.75
12428	1212	76	0.5
12429	1212	400	0.5
12430	1212	4660	0.5
12431	1212	292	0.75
12432	1212	2150	0.75
12433	1212	599	0.5
12434	1212	9	0.5
12435	1212	68	0.5
12436	1212	4661	0.949999988
12437	1212	42	0.75
12438	1212	625	0.75
12439	1212	33	0.75
12440	1212	8	0.5
12441	1212	2264	0.5
12442	1212	107	0.75
12443	1212	4662	0.100000001
12444	1212	105	0.5
12445	1212	16	0.5
12446	1212	14	0.5
12447	1212	1551	0.75
12448	1212	6	0.5
12449	1212	237	0.5
12450	1212	431	0.649999976
12451	1212	4663	0.949999988
12452	1212	4126	0.75
12453	1212	74	0.5
12454	1212	4664	0.5
12455	1212	1191	0.75
12456	1212	3975	0.75
12457	1212	536	0.5
12458	1212	77	0.75
12459	1212	37	0.75
12460	1212	39	0.5
12461	1212	257	0.5
12462	1212	36	0.75
12463	1212	79	0.5
12464	1212	419	0.75
12465	1212	4665	0.949999988
12466	1212	4666	0.300000012
12467	1212	94	0.300000012
12468	1213	257	0.5
12469	1213	428	0.5
12470	1213	429	0.5
12471	1213	82	0.5
12472	1213	416	0.5
12473	1213	10	0.5
12474	1213	427	0.5
12475	1213	398	0.5
12476	1213	1	0.5
12477	1213	431	0.5
12478	1213	76	0.5
12479	1213	427	0.5
12480	1213	37	0.5
12481	1213	567	0.5
12482	1213	395	0.5
12483	1213	430	0.5
12484	1213	257	0.5
12485	1213	81	0.5
12486	1213	291	0.5
12487	1213	401	0.5
12488	1213	68	0.5
12489	1213	6	0.5
12490	1213	83	0.5
12491	1213	419	0.5
12492	1213	105	0.5
12493	1213	16	0.5
12494	1213	9	0.5
12495	1213	40	0.25
12496	1214	4667	1
12497	1214	3508	1
12498	1214	4668	0.899999976
12499	1215	4669	0.949999988
12500	1215	4670	0.949999988
12501	1215	24	0.5
12502	1215	4671	0.400000006
12503	1215	4672	1
12504	1215	4673	0.899999976
12505	1216	4674	1
12506	1216	4670	1
12507	1217	4674	1
12508	1217	4670	1
12509	1218	4674	1
12510	1218	4670	1
12511	1219	4674	1
12512	1219	4670	1
12513	1220	4675	0.99000001
12514	1220	722	0.99000001
12515	1220	4676	0.99000001
12516	1220	4677	0.949999988
12517	1220	16	0.5
12518	1220	10	0.5
12519	1220	68	0.800000012
12520	1220	71	0.200000003
12521	1220	4678	0.699999988
12522	1221	4679	0.899999976
12523	1221	4680	0.899999976
12524	1221	3087	0.899999976
12525	1221	185	0.899999976
12526	1221	10	0.800000012
12527	1221	16	0.200000003
12528	1222	1	0.5
12529	1222	16	0.5
12530	1222	6	0.5
12531	1222	10	0.5
12532	1222	4681	0.5
12533	1222	425	0.5
12534	1222	9	0.5
12535	1223	4682	0.75
12536	1223	71	0.75
12537	1223	4683	0.75
12538	1223	4684	0.75
12539	1223	4685	1
12540	1223	4686	0.75
12541	1223	4687	0.75
12542	1224	4688	1
12543	1224	4689	0.75
12544	1224	4690	0.25
12545	1224	1384	0.25
12546	1225	4691	0.75
12547	1225	4692	0.75
12548	1225	4693	0.75
12549	1225	4694	0.5
12550	1225	4695	0.75
12551	1226	4696	1
12552	1227	68	0.75
12553	1227	4697	0.899999976
12554	1227	4698	0.75
12555	1227	4699	0.100000001
12556	1228	3075	0.100000001
12557	1228	4700	0.100000001
12558	1228	4701	0.100000001
12559	1228	4702	0.100000001
12560	1228	4703	0.100000001
12561	1228	4704	0.100000001
12562	1228	4705	0.100000001
12563	1228	3184	0.100000001
12564	1228	4706	0.100000001
12565	1228	4707	0.899999976
12566	1228	4708	0.899999976
12567	1228	71	0.75
12568	1228	4709	0.5
12569	1228	4710	0.75
12570	1228	4711	0.5
12571	1229	4712	1
12572	1229	2045	0.899999976
12573	1229	193	0.899999976
12574	1229	4713	0.5
12575	1229	4714	0.75
12576	1230	235	0.5
12577	1230	4715	0.25
12578	1230	4716	0.75
12579	1230	4717	0.100000001
12580	1230	236	0.5
12581	1230	6	0.75
12582	1230	237	0.5
12583	1230	10	0.5
12584	1230	4718	0.949999988
12585	1230	844	0.5
12586	1230	422	0.5
12587	1230	74	0.75
12588	1230	2489	0.5
12589	1230	292	0.75
12590	1230	37	0.75
12591	1230	1515	0.75
12592	1230	9	0.5
12593	1230	68	0.5
12594	1230	4719	0.949999988
12595	1230	419	0.75
12596	1230	107	0.75
12597	1230	4720	0.75
12598	1230	16	0.5
12599	1231	4721	0.75
12600	1231	4722	0.5
12601	1231	359	0.5
12602	1231	1507	0.5
12603	1231	499	0.5
12604	1231	422	0.5
12605	1231	4723	0.5
12606	1231	4724	0.5
12607	1231	4725	0.5
12608	1231	4726	0.5
12609	1232	235	0.5
12610	1232	68	0.5
12611	1232	236	0.5
12612	1232	725	0.75
12613	1232	6	0.5
12614	1232	237	0.5
12615	1232	10	0.5
12616	1232	4727	0.649999976
12617	1232	4728	0.75
12618	1232	4729	0.5
12619	1232	77	0.25
12620	1232	4730	0.75
12621	1232	1882	0.75
12622	1232	37	0.75
12623	1232	39	0.75
12624	1232	4731	0.75
12625	1232	4732	0.5
12626	1232	9	0.5
12627	1232	4733	0.5
12628	1232	79	0.5
12629	1232	829	0.649999976
12630	1232	4734	0.75
12631	1232	16	0.5
12632	1233	4735	1
12633	1233	4736	0.75
12634	1233	4737	0.5
12635	1233	257	0.330000013
12636	1233	4483	0.100000001
12637	1233	4738	0.75
12638	1234	4739	1
12639	1234	4740	0.5
12640	1234	4741	0.5
12641	1234	531	0.75
12642	1234	3899	0.75
12643	1234	4524	0.5
12644	1234	4742	1
12645	1235	4473	1
12646	1235	4743	1
12647	1236	37	0.5
12648	1236	4744	0.5
12649	1236	597	0.5
12650	1236	419	0.5
12651	1236	401	0.5
12652	1236	4745	0.5
12653	1236	1012	0.5
12654	1236	635	0.5
12655	1236	37	0.5
12656	1236	4744	0.5
12657	1236	597	0.5
12658	1236	419	0.5
12659	1236	401	0.5
12660	1236	4745	0.5
12661	1236	1012	0.5
12662	1236	635	0.5
12663	1237	6	0.5
12664	1237	644	0.5
12665	1237	10	0.5
12666	1237	4746	0.5
12667	1237	4747	0.5
12668	1237	4748	0.5
12669	1237	4749	0.5
12670	1237	868	0.100000001
12671	1237	292	0.5
12672	1237	324	0.5
12673	1237	37	0.5
12674	1237	619	0.5
12675	1237	567	0.5
12676	1237	4750	0.5
12677	1237	4751	0.100000001
12678	1237	1412	0.5
12679	1237	53	0.5
12680	1237	9	0.5
12681	1237	68	0.5
12682	1237	426	0.5
12683	1237	107	0.5
12684	1237	16	0.5
12685	1238	4752	0.800000012
12686	1238	37	0.800000012
12687	1238	38	0.800000012
12688	1238	53	0.800000012
12689	1238	292	0.400000006
12690	1238	427	0.400000006
12691	1238	107	0.400000006
12692	1238	4753	0.899999976
12693	1238	4754	0.600000024
12694	1238	4755	0.600000024
12695	1238	37	0.300000012
12696	1238	12	0.300000012
12697	1238	257	0.800000012
12698	1239	4756	1
12699	1239	501	0.899999976
12700	1239	16	0.670000017
12701	1239	10	0.330000013
12702	1239	917	0.899999976
12703	1239	4757	0.699999988
12704	1239	40	0.5
12705	1239	277	0.5
12706	1239	37	0.699999988
12707	1239	81	0.699999988
12708	1239	82	0.699999988
12709	1239	291	0.600000024
12710	1239	83	0.600000024
12711	1239	431	0.600000024
12712	1240	250	0.899999976
12713	1240	4758	0.899999976
12714	1240	2255	1
12715	1240	4759	0.899999976
12716	1240	4760	0.899999976
12717	1240	16	0.5
12718	1240	10	0.5
12719	1240	4761	0.800000012
12720	1240	4762	0.800000012
12721	1240	4763	0.800000012
12722	1240	4764	0.699999988
12723	1240	4765	0.899999976
12724	1241	235	0.5
12725	1241	236	0.5
12726	1241	6	0.5
12727	1241	237	0.5
12728	1241	10	0.5
12729	1241	1842	0.25
12730	1241	1514	0.5
12731	1241	431	0.649999976
12732	1241	2518	0.25
12733	1241	2519	0.649999976
12734	1241	4766	0.949999988
12735	1241	292	0.75
12736	1241	37	0.75
12737	1241	567	0.5
12738	1241	185	0.5
12739	1241	597	0.5
12740	1241	257	0.5
12741	1241	3582	0.5
12742	1241	9	0.5
12743	1241	68	0.5
12744	1241	33	0.75
12745	1241	659	0.649999976
12746	1241	4767	0.100000001
12747	1241	1618	0.25
12748	1241	2547	0.25
12749	1241	16	0.5
12750	1242	235	0.5
12751	1242	3802	0.5
12752	1242	10	0.5
12753	1242	4768	0.949999988
12754	1242	236	0.5
12755	1242	1007	0.5
12756	1242	6	0.5
12757	1242	237	0.5
12758	1242	4769	0.100000001
12759	1242	4770	0.75
12760	1242	1068	0.5
12761	1242	43	0.5
12762	1242	292	0.5
12763	1242	37	0.5
12764	1242	4771	0.5
12765	1242	4772	0.75
12766	1242	507	0.5
12767	1242	9	0.5
12768	1242	68	0.5
12769	1242	4773	0.5
12770	1242	4774	0.75
12771	1242	498	0.25
12772	1242	107	0.5
12773	1242	505	0.5
12774	1242	4775	0.75
12775	1242	16	0.5
12776	1242	4776	0.75
12777	1244	37	0.5
12778	1244	257	0.5
12779	1244	6	0.5
12780	1244	81	0.5
12781	1244	291	0.5
12782	1244	9	0.5
12783	1244	10	0.5
12784	1244	68	0.5
12785	1244	40	0.5
12786	1244	427	0.5
12787	1244	1	0.5
12788	1244	82	0.5
12789	1244	16	0.5
12790	1244	71	0.5
12791	1245	4777	0.899999976
12792	1245	4778	0.800000012
12793	1245	4779	0.800000012
12794	1245	1973	0.899999976
12795	1245	4780	0.899999976
12796	1245	16	0.600000024
12797	1245	10	0.400000006
12798	1246	235	0.5
12799	1246	37	0.5
12800	1246	4781	0.100000001
12801	1246	9	0.5
12802	1246	53	0.5
12803	1246	16	0.5
12804	1246	107	0.5
12805	1246	6	0.5
12806	1246	4782	0.5
12807	1246	4783	0.5
12808	1246	4784	0.5
12809	1246	432	0.5
12810	1246	416	0.5
12811	1246	10	0.5
12812	1246	68	0.5
12813	1246	4785	0.5
12814	1246	2242	0.5
12815	1246	4786	0.5
12816	1246	292	0.5
12817	1247	235	0.5
12818	1247	1567	0.5
12819	1247	4787	0.5
12820	1247	6	0.5
12821	1247	445	0.5
12822	1247	10	0.5
12823	1247	4788	0.5
12824	1247	427	0.5
12825	1247	1	0.5
12826	1247	3757	0.5
12827	1247	314	0.5
12828	1247	756	0.5
12829	1247	2856	0.5
12830	1247	427	0.5
12831	1247	291	0.5
12832	1247	36	0.5
12833	1247	4789	0.5
12834	1247	2283	0.5
12835	1247	9	0.5
12836	1247	68	0.5
12837	1247	2694	0.5
12838	1247	4209	0.5
12839	1247	33	0.5
12840	1247	2813	0.5
12841	1247	2021	0.5
12842	1247	16	0.5
12843	1247	681	0.25
12844	1247	1422	0.25
12845	1248	4790	0.100000001
12846	1248	235	0.5
12847	1248	4791	0.100000001
12848	1248	4792	0.100000001
12849	1248	442	0.100000001
12850	1248	10	0.5
12851	1248	4793	0.5
12852	1248	4794	0.75
12853	1248	76	0.75
12854	1248	4795	0.949999988
12855	1248	634	0.100000001
12856	1248	12	0.5
12857	1248	292	0.5
12858	1248	4796	0.100000001
12859	1248	236	0.5
12860	1248	4797	0.25
12861	1248	441	0.75
12862	1248	53	0.75
12863	1248	9	0.5
12864	1248	68	0.5
12865	1248	42	0.100000001
12866	1248	33	0.75
12867	1248	8	0.5
12868	1248	3952	0.100000001
12869	1248	1545	0.75
12870	1248	107	0.75
12871	1248	3065	0.5
12872	1248	4798	0.5
12873	1248	105	0.5
12874	1248	4799	0.5
12875	1248	16	0.5
12876	1248	3471	0.100000001
12877	1248	14	0.5
12878	1248	4800	0.100000001
12879	1248	6	0.5
12880	1248	4801	0.100000001
12881	1248	4802	0.949999988
12882	1248	237	0.5
12883	1248	4803	0.100000001
12884	1248	548	0.100000001
12885	1248	4804	0.100000001
12886	1248	3951	0.100000001
12887	1248	431	0.5
12888	1248	4805	0.5
12889	1248	4806	0.949999988
12890	1248	74	0.5
12891	1248	1299	0.75
12892	1248	77	0.5
12893	1248	1300	0.75
12894	1248	37	1
12895	1248	567	0.75
12896	1248	36	0.75
12897	1248	291	0.5
12898	1248	162	0.100000001
12899	1248	45	0.100000001
12900	1248	2020	0.100000001
12901	1248	4807	0.100000001
12902	1248	546	0.100000001
12903	1248	1131	0.5
12904	1248	920	0.5
12905	1249	473	0.100000001
12906	1249	235	0.5
12907	1249	37	1
12908	1249	4808	0.25
12909	1249	567	0.75
12910	1249	14	0.5
12911	1249	920	0.5
12912	1249	4792	0.100000001
12913	1249	6	0.5
12914	1249	36	0.75
12915	1249	4809	0.949999988
12916	1249	441	0.75
12917	1249	53	0.75
12918	1249	237	0.5
12919	1249	9	0.5
12920	1249	10	0.5
12921	1249	68	0.5
12922	1249	4794	0.75
12923	1249	4810	0.949999988
12924	1249	33	0.75
12925	1249	8	0.5
12926	1249	4805	0.5
12927	1249	76	0.75
12928	1249	4806	0.949999988
12929	1249	74	0.5
12930	1249	107	0.75
12931	1249	3065	0.5
12932	1249	4798	0.5
12933	1249	105	0.5
12934	1249	16	0.5
12935	1249	236	0.5
12936	1249	291	0.5
12937	1249	12	0.5
12938	1249	77	0.5
12939	1249	1545	0.75
12940	1249	1300	0.75
12941	1249	292	0.5
12942	1250	235	0.5
12943	1250	37	1
12944	1250	567	0.75
12945	1250	14	0.5
12946	1250	920	0.5
12947	1250	4792	0.100000001
12948	1250	105	0.5
12949	1250	6	0.5
12950	1250	36	0.75
12951	1250	441	0.75
12952	1250	53	0.75
12953	1250	237	0.5
12954	1250	9	0.5
12955	1250	10	0.5
12956	1250	68	0.5
12957	1250	4811	0.949999988
12958	1250	4794	0.75
12959	1250	33	0.75
12960	1250	4812	0.25
12961	1250	8	0.5
12962	1250	4805	0.5
12963	1250	4813	0.949999988
12964	1250	76	0.75
12965	1250	4806	0.949999988
12966	1250	74	0.5
12967	1250	107	0.75
12968	1250	3065	0.5
12969	1250	4798	0.5
12970	1250	3300	0.100000001
12971	1250	16	0.5
12972	1250	236	0.5
12973	1250	1299	0.75
12974	1250	291	0.5
12975	1250	12	0.5
12976	1250	77	0.5
12977	1250	1545	0.75
12978	1250	1300	0.75
12979	1250	292	0.5
12980	1251	235	0.5
12981	1251	37	1
12982	1251	567	0.75
12983	1251	14	0.5
12984	1251	920	0.5
12985	1251	4792	0.100000001
12986	1251	105	0.5
12987	1251	6	0.5
12988	1251	36	0.75
12989	1251	441	0.75
12990	1251	53	0.75
12991	1251	237	0.5
12992	1251	9	0.5
12993	1251	10	0.5
12994	1251	68	0.5
12995	1251	4794	0.75
12996	1251	33	0.75
12997	1251	4812	0.25
12998	1251	4814	0.949999988
12999	1251	8	0.5
13000	1251	4805	0.5
13001	1251	76	0.75
13002	1251	4806	0.949999988
13003	1251	74	0.5
13004	1251	107	0.75
13005	1251	3065	0.5
13006	1251	4798	0.5
13007	1251	3300	0.100000001
13008	1251	4815	0.949999988
13009	1251	16	0.5
13010	1251	236	0.5
13011	1251	1545	0.75
13012	1251	1299	0.75
13013	1251	291	0.5
13014	1251	12	0.5
13015	1251	77	0.5
13016	1251	4816	0.100000001
13017	1251	1300	0.75
13018	1251	292	0.5
13019	1252	4817	0.5
13020	1252	235	0.5
13021	1252	37	0.5
13022	1252	4818	0.5
13023	1252	4819	0.5
13024	1252	68	0.5
13025	1252	1	0.5
13026	1252	6	0.5
13027	1252	4820	0.5
13028	1252	549	0.5
13029	1252	4821	0.5
13030	1252	9	0.5
13031	1252	10	0.5
13032	1252	4822	0.5
13033	1252	1666	0.5
13034	1252	12	0.5
13035	1252	16	0.5
13036	1252	163	0.5
13037	1253	235	0
13038	1253	4823	0.5
13039	1253	4824	0.5
13040	1253	6	0.5
13041	1253	10	0.5
13042	1253	4825	0.5
13043	1253	427	0.5
13044	1253	4826	0.5
13045	1253	4827	0.5
13046	1253	4828	0.5
13047	1253	4829	0.5
13048	1253	35	0.100000001
13049	1253	4830	0.5
13050	1253	4831	0.5
13051	1253	4832	0.5
13052	1253	36	0.100000001
13053	1253	4833	0.5
13054	1253	291	0.100000001
13055	1253	4834	0.5
13056	1253	68	0.100000001
13057	1253	33	0.100000001
13058	1253	4835	0.5
13059	1253	4836	0.5
13060	1253	4837	0.5
13061	1253	16	0.5
13062	1253	9	0.5
13063	1254	3546	1
13064	1254	4838	0.949999988
13065	1254	4839	1
13066	1254	1424	0.899999976
13067	1254	4840	0.949999988
13068	1254	79	0.899999976
13069	1254	303	0.400000006
13070	1254	820	0.400000006
13071	1254	1973	0.400000006
13072	1254	40	0.699999988
13073	1254	163	0.600000024
13074	1255	4841	0.800000012
13075	1255	2555	0.800000012
13076	1255	4842	0.699999988
13077	1255	4843	0.5
13078	1255	425	0.5
13079	1255	550	0.5
13080	1255	4844	0.5
13081	1256	4845	1
13082	1256	4846	1
13083	1256	4847	0.5
13084	1256	4205	0.5
13085	1256	4848	0.5
13086	1256	4849	0.5
13087	1256	4850	0.5
13088	1256	4851	0.5
13089	1256	4852	0.5
13090	1256	4853	1
13091	1256	4854	1
13092	1257	235	0.5
13093	1257	4855	0.5
13094	1257	14	0.5
13095	1257	236	0.5
13096	1257	6	0.5
13097	1257	4856	0.100000001
13098	1257	237	0.5
13099	1257	10	0.5
13100	1257	349	0.100000001
13101	1257	4857	0.949999988
13102	1257	400	0.5
13103	1257	4858	0.75
13104	1257	292	0.5
13105	1257	4859	0.100000001
13106	1257	37	0.5
13107	1257	4860	0.75
13108	1257	4861	0.949999988
13109	1257	9	0.5
13110	1257	68	0.5
13111	1257	419	0.75
13112	1257	277	0.5
13113	1257	531	0.649999976
13114	1257	1484	0.100000001
13115	1257	16	0.5
13116	1258	2838	0.400000006
13117	1258	1007	0.899999976
13118	1258	105	0.600000024
13119	1258	76	0.300000012
13120	1258	291	0.75
13121	1258	4862	0.699999988
13122	1258	4863	0.200000003
13123	1258	4864	0.100000001
13124	1258	920	0.75
13125	1258	4865	0.899999976
13126	1259	4866	1
13127	1260	4867	1
13128	1260	4868	0.75
13129	1260	4869	0.75
13130	1260	3262	0.100000001
13131	1260	4870	0.5
13132	1260	4871	0.75
13133	1261	235	0.5
13134	1261	16	0.5
13135	1261	4872	0.5
13136	1261	1564	0.5
13137	1261	4873	0.5
13138	1261	122	0.5
13139	1261	653	0.5
13140	1261	4874	0.5
13141	1261	6	0.5
13142	1261	4875	0.5
13143	1261	10	0.5
13144	1261	9	0.5
13145	1261	922	0.5
13146	1261	68	0.5
13147	1261	4876	0.5
13148	1261	4877	0.5
13149	1262	235	0.5
13150	1262	122	0.5
13151	1262	422	0.5
13152	1262	391	0.100000001
13153	1262	416	0.5
13154	1262	10	0.5
13155	1262	4878	0.5
13156	1262	427	0.5
13157	1262	425	0.5
13158	1262	4879	0.5
13159	1262	12	0.5
13160	1262	292	0.5
13161	1262	599	0.5
13162	1262	4880	0.5
13163	1262	9	0.5
13164	1262	68	0.5
13165	1262	88	0.5
13166	1262	33	0.5
13167	1262	8	0.5
13168	1262	3235	0.100000001
13169	1262	3236	0.5
13170	1262	107	0.5
13171	1262	2495	0.5
13172	1262	420	0.5
13173	1262	16	0.5
13174	1262	4881	0.5
13175	1262	3237	0.5
13176	1262	970	0.5
13177	1262	14	0.5
13178	1262	6	0.5
13179	1262	3239	0.5
13180	1262	4882	0.5
13181	1262	275	0.100000001
13182	1262	1842	0.5
13183	1262	53	0.5
13184	1262	4883	0.5
13185	1262	3234	0.5
13186	1262	74	0.5
13187	1262	536	0.5
13188	1262	4884	0.5
13189	1262	801	0.5
13190	1262	40	0.5
13191	1262	37	0.5
13192	1262	567	0.5
13193	1262	547	0.5
13194	1262	36	0.5
13195	1262	291	0.5
13196	1262	162	0.5
13197	1262	79	0.5
13198	1262	419	0.5
13199	1262	277	0.5
13200	1262	390	0.100000001
13201	1262	38	0.5
13202	1262	4885	0.5
13203	1263	235	0.5
13204	1263	4886	0.5
13205	1263	1379	0.5
13206	1263	150	0.5
13207	1263	4887	0.5
13208	1263	43	0.5
13209	1263	16	0.5
13210	1263	4888	0.5
13211	1263	4889	0.5
13212	1263	2779	0.5
13213	1263	4890	0.5
13214	1263	4891	0.5
13215	1263	277	0.5
13216	1263	445	0.5
13217	1263	9	0.5
13218	1263	10	0.5
13219	1263	68	0.5
13220	1263	437	0.5
13221	1263	26	0.5
13222	1263	4892	0.5
13223	1263	1	0.5
13224	1263	4893	0.5
13225	1263	4894	0.5
13226	1263	4533	0.5
13227	1263	4895	0.5
13228	1263	4896	0.5
13229	1263	4897	0.5
13230	1263	4898	0.5
13231	1263	4543	0.5
13232	1263	4899	0.5
13233	1263	4900	0.5
13234	1263	421	0.5
13235	1263	4901	0.5
13236	1263	4902	0.5
13237	1263	4903	0.5
13238	1263	4904	0.5
13239	1263	4905	0.5
13240	1263	4906	0.5
13241	1263	292	0.5
13242	1264	913	0.5
13243	1264	12	0.5
13244	1264	74	0.5
13245	1264	291	0.5
13246	1264	21	0.5
13247	1264	4907	0.5
13248	1265	235	0.5
13249	1265	14	0.5
13250	1265	429	0.5
13251	1265	4908	0.5
13252	1265	74	0.5
13253	1265	1030	0.5
13254	1265	10	0.5
13255	1265	2242	0.5
13256	1265	1	0.5
13257	1265	4909	0.5
13258	1265	2272	0.5
13259	1265	425	0.5
13260	1265	4910	0.5
13261	1265	4911	0.5
13262	1265	4912	0.5
13263	1265	641	0.5
13264	1265	430	0.5
13265	1265	36	0.5
13266	1265	4913	0.5
13267	1265	291	0.5
13268	1265	9	0.5
13269	1265	68	0.5
13270	1265	33	0.5
13271	1265	8	0.5
13272	1265	46	0.5
13273	1265	4914	0.5
13274	1265	107	0.5
13275	1265	4915	0.5
13276	1265	16	0.5
13277	1266	70	0.5
13278	1266	522	0.5
13279	1266	235	0.5
13280	1266	4916	0.5
13281	1266	4917	0.5
13282	1266	1818	0.5
13283	1266	4918	0.5
13284	1266	74	0.5
13285	1266	1	0.5
13286	1266	4919	0.5
13287	1266	9	0.5
13288	1266	10	0.5
13289	1266	68	0.5
13290	1266	427	0.5
13291	1266	16	0.5
13292	1267	4920	1
13293	1267	501	0.75
13294	1267	4921	0.699999988
13295	1267	4922	0.800000012
13296	1267	4923	0.800000012
13297	1267	4924	0.800000012
13298	1267	4925	0.99000001
13299	1267	4926	0.600000024
13300	1267	2701	0.0500000007
13301	1267	395	0.5
13302	1267	2683	0.330000013
13303	1267	4927	0.800000012
13304	1267	4928	0.670000017
13305	1267	3340	0.600000024
13306	1267	315	0.600000024
13307	1267	422	0.5
13308	1267	16	0.99000001
13309	1267	10	0.00100000005
13310	1268	235	0.5
13311	1268	236	0.5
13312	1268	6	0.5
13313	1268	237	0.5
13314	1268	4803	0.75
13315	1268	10	0.5
13316	1268	4929	0.75
13317	1268	422	0.100000001
13318	1268	469	0.75
13319	1268	74	0.75
13320	1268	536	0.75
13321	1268	4930	0.949999988
13322	1268	292	0.75
13323	1268	324	0.75
13324	1268	37	0.75
13325	1268	4068	0.25
13326	1268	4931	0.949999988
13327	1268	4932	0.100000001
13328	1268	4933	0.100000001
13329	1268	9	0.5
13330	1268	68	0.5
13331	1268	1520	0.100000001
13332	1268	4934	0.75
13333	1268	4935	0.100000001
13334	1268	4936	0.75
13335	1268	16	0.5
13336	1268	566	0.100000001
13337	1268	3752	0.649999976
13338	1269	4937	0.400000006
13339	1269	4938	0.75
13340	1269	4072	0.25
13341	1269	245	0.150000006
13342	1269	4939	0.100000001
13343	1269	4940	0.0500000007
13344	1269	4941	0.850000024
13345	1269	4942	0.600000024
13346	1270	4943	0.75
13347	1270	4944	0.5
13348	1270	4945	0.75
13349	1270	4946	0.5
13350	1271	4947	0.5
13351	1271	235	0.5
13352	1271	600	0.5
13353	1271	79	0.5
13354	1271	4948	0.5
13355	1271	4949	0.5
13356	1271	429	0.5
13357	1271	2572	0.5
13358	1271	4950	0.5
13359	1271	6	0.5
13360	1271	4951	0.5
13361	1271	3290	0.5
13362	1271	37	0.5
13363	1271	2194	0.5
13364	1271	9	0.5
13365	1271	10	0.5
13366	1271	68	0.5
13367	1271	4952	0.5
13368	1271	2188	0.5
13369	1271	833	0.5
13370	1271	1289	0.5
13371	1271	277	0.5
13372	1271	2123	0.5
13373	1271	4953	0.5
13374	1271	3755	0.100000001
13375	1271	781	0.5
13376	1271	4954	0.5
13377	1271	2128	0.5
13378	1271	3756	0.5
13379	1271	2963	0.5
13380	1271	3338	0.100000001
13381	1271	4955	0.5
13382	1271	4956	0.5
13383	1271	109	0.5
13384	1271	270	0.5
13385	1271	16	0.5
13386	1271	4957	0.5
13387	1271	4958	0.5
13388	1272	4959	0.75
13389	1272	4960	0.75
13390	1272	4961	0.75
13391	1273	4962	1
13392	1273	4963	0.75
13393	1273	37	0.75
13394	1273	4964	0.5
13395	1273	4965	0.75
13396	1274	235	0.5
13397	1274	4966	0.649999976
13398	1274	1025	0.75
13399	1274	14	0.75
13400	1274	1515	0.75
13401	1274	236	0.5
13402	1274	89	0.75
13403	1274	6	0.5
13404	1274	324	0.75
13405	1274	4967	0.649999976
13406	1274	37	1
13407	1274	237	0.5
13408	1274	9	0.5
13409	1274	10	0.5
13410	1274	68	0.5
13411	1274	36	0.75
13412	1274	4968	0.949999988
13413	1274	33	0.75
13414	1274	4969	0.649999976
13415	1274	16	0.5
13416	1274	426	0.75
13417	1274	4970	0.949999988
13418	1274	2634	0.75
13419	1274	4971	0.949999988
13420	1274	4972	0.949999988
13421	1274	2024	0.75
13422	1274	4973	1
13423	1274	4974	0.949999988
13424	1274	4975	0.75
13425	1274	292	0.75
13426	1274	290	0.75
13427	1275	235	0.5
13428	1275	1843	0.5
13429	1275	1025	0.75
13430	1275	10	0.5
13431	1275	4976	0.649999976
13432	1275	1514	0.5
13433	1275	1515	0.75
13434	1275	236	0.5
13435	1275	89	0.75
13436	1275	6	0.5
13437	1275	324	0.75
13438	1275	4977	0.25
13439	1275	37	1
13440	1275	237	0.5
13441	1275	9	0.5
13442	1275	290	0.75
13443	1275	68	0.5
13444	1275	4978	0.649999976
13445	1275	4979	0.949999988
13446	1275	422	0.100000001
13447	1275	1524	0.25
13448	1275	16	0.5
13449	1275	15	0.75
13450	1275	4980	0.649999976
13451	1275	4981	0.5
13452	1275	426	0.75
13453	1275	4982	0.649999976
13454	1275	4983	0.949999988
13455	1275	4984	0.649999976
13456	1275	4985	0.649999976
13457	1275	4986	0.949999988
13458	1275	4987	0.649999976
13459	1275	292	0.75
13460	1275	88	0.100000001
13461	1276	235	0.5
13462	1276	37	0.5
13463	1276	426	0.5
13464	1276	89	0.5
13465	1276	6	0.5
13466	1276	53	0.5
13467	1276	324	0.5
13468	1276	9	0.5
13469	1276	10	0.5
13470	1276	68	0.5
13471	1276	291	0.5
13472	1276	16	0.5
13473	1276	1	0.5
13474	1276	292	0.5
13475	1276	15	0.75
13476	1277	235	0.5
13477	1277	4988	0.949999988
13478	1277	1025	0.75
13479	1277	10	0.5
13480	1277	1514	0.5
13481	1277	1515	0.75
13482	1277	236	0.5
13483	1277	89	0.75
13484	1277	6	0.5
13485	1277	324	0.75
13486	1277	4982	0.649999976
13487	1277	4977	0.25
13488	1277	1843	0.5
13489	1277	237	0.5
13490	1277	9	0.5
13491	1277	290	0.75
13492	1277	68	0.5
13493	1277	4978	0.649999976
13494	1277	4969	0.649999976
13495	1277	4989	0.949999988
13496	1277	422	0.100000001
13497	1277	1524	0.25
13498	1277	15	0.75
13499	1277	426	0.75
13500	1277	4981	0.5
13501	1277	37	1
13502	1277	4972	0.649999976
13503	1277	4990	0.949999988
13504	1277	4991	0.649999976
13505	1277	4985	0.649999976
13506	1277	16	0.5
13507	1277	4987	0.649999976
13508	1277	292	0.75
13509	1278	235	0.5
13510	1278	1843	0.25
13511	1278	1025	0.75
13512	1278	10	0.5
13513	1278	9	0.5
13514	1278	1514	0.5
13515	1278	1515	0.75
13516	1278	236	0.5
13517	1278	89	0.75
13518	1278	6	0.5
13519	1278	324	0.75
13520	1278	4992	0.649999976
13521	1278	37	1
13522	1278	237	0.5
13523	1278	4993	0.949999988
13524	1278	290	0.75
13525	1278	68	0.5
13526	1278	4978	0.649999976
13527	1278	4989	0.949999988
13528	1278	422	0.100000001
13529	1278	1524	0.25
13530	1278	16	0.5
13531	1278	15	0.75
13532	1278	426	0.75
13533	1278	4981	0.5
13534	1278	4977	0.25
13535	1278	4972	0.649999976
13536	1278	4982	0.649999976
13537	1278	4994	0.649999976
13538	1278	4985	0.649999976
13539	1278	4995	0.949999988
13540	1278	4987	0.649999976
13541	1278	292	0.75
13542	1279	4996	0.699999988
13543	1279	1376	0.5
13544	1279	2232	0.349999994
13545	1279	37	0.5
13546	1279	292	0.5
13547	1279	4997	0.5
13548	1279	404	0.5
13549	1280	4998	0.600000024
13550	1280	4729	0.600000024
13551	1280	2060	0.600000024
13552	1280	37	0.600000024
13553	1280	441	0.600000024
13554	1280	82	0.600000024
13555	1280	4999	0.800000012
13556	1280	16	0.75
13557	1280	10	0.25
13558	1280	40	0.699999988
13559	1280	5000	0.699999988
13560	1280	273	0.5
13561	1281	235	0.5
13562	1281	5001	0.5
13563	1281	5002	0.5
13564	1281	422	0.5
13565	1281	16	0.5
13566	1281	6	0.5
13567	1281	5003	0.5
13568	1281	5004	0.5
13569	1281	421	0.5
13570	1281	10	0.5
13571	1281	68	0.5
13572	1281	162	0.5
13573	1281	5005	0.5
13574	1281	5006	0.5
13575	1281	5007	0.5
13576	1281	40	0.5
13577	1281	1	0.5
13578	1281	3757	0.5
13579	1281	5008	0.5
13580	1281	40	0.5
13581	1281	4222	0.5
13582	1281	5009	0.5
13583	1281	5010	0.5
13584	1281	9	0.5
13585	1281	5011	0.5
13586	1281	5012	0.5
13587	1281	681	0.5
13588	1281	5013	0.5
13589	1281	5014	0.5
13590	1281	291	0.5
13591	1281	292	0.5
13592	1281	461	1
13593	1281	21	0.25
13594	1282	16	0.550000012
13595	1282	10	0.449999988
13596	1282	37	0.550000012
13597	1282	53	0.600000024
13598	1282	291	0.600000024
13599	1282	107	0.479999989
13600	1282	82	0.720000029
13601	1282	425	0.5
13602	1282	275	0.109999999
13603	1282	419	0.400000006
13604	1282	2121	0.0199999996
13605	1282	761	0.409999996
13606	1282	2504	0.119999997
13607	1282	434	0.340000004
13608	1282	600	0.100000001
13609	1282	473	0.800000012
13610	1282	329	0.670000017
13611	1282	5015	0.439999998
13612	1282	5016	0.800000012
13613	1283	235	0.5
13614	1283	5017	0.75
13615	1283	1551	0.75
13616	1283	236	0.5
13617	1283	6	0.5
13618	1283	1308	0.75
13619	1283	2635	0.75
13620	1283	237	0.5
13621	1283	10	0.5
13622	1283	4659	0.75
13623	1283	74	1
13624	1283	255	0.75
13625	1283	5018	0.100000001
13626	1283	9	0.5
13627	1283	68	0.5
13628	1283	125	1
13629	1283	5019	0.949999988
13630	1283	3554	0.75
13631	1283	2637	0.75
13632	1283	5020	0.949999988
13633	1283	555	0.75
13634	1283	16	0.5
13635	1283	126	0.949999988
13636	1284	4112	0.5
13637	1284	1025	0.5
13638	1284	896	0.5
13639	1284	191	0.5
13640	1284	5021	0.5
13641	1284	16	0.5
13642	1284	324	0.5
13643	1284	5022	0.5
13644	1284	441	0.5
13645	1284	5023	0.5
13646	1284	5024	0.5
13647	1284	10	0.5
13648	1284	68	0.5
13649	1284	5025	0.5
13650	1284	954	0.5
13651	1284	5026	0.5
13652	1284	6	0.5
13653	1284	398	0.5
13654	1284	1	0.5
13655	1284	971	0.5
13656	1284	2552	0.5
13657	1284	5027	0.5
13658	1284	5028	0.5
13659	1284	860	0.5
13660	1284	74	0.5
13661	1284	3735	0.5
13662	1284	9	0.5
13663	1284	471	0.5
13664	1284	2018	0.5
13665	1284	5029	0.5
13666	1284	5030	0.5
13667	1284	5031	0.5
13668	1284	5032	0.5
13669	1284	5033	0.5
13670	1284	681	0.5
13671	1284	5034	0.5
13672	1284	5035	0.5
13673	1284	5036	0.5
13674	1284	426	0.5
13675	1284	292	0.75
13676	1285	5037	1
13677	1285	1415	0.800000012
13678	1285	1270	0.600000024
13679	1285	511	0.699999988
13680	1285	82	0.699999988
13681	1285	4018	0.5
13682	1286	40	0.5
13683	1286	235	0.5
13684	1286	1149	0.5
13685	1286	314	0.5
13686	1286	122	0.5
13687	1286	5038	0.5
13688	1286	46	0.5
13689	1286	1	0.5
13690	1286	6	0.5
13691	1286	1150	0.5
13692	1286	1151	0.5
13693	1286	445	0.5
13694	1286	9	0.5
13695	1286	10	0.5
13696	1286	68	0.5
13697	1286	5039	0.5
13698	1286	16	0.5
13699	1286	1152	0.5
13700	1286	1772	0.100000001
13701	1287	16	0.5
13702	1287	10	0.5
13703	1287	5040	0.100000001
13704	1287	5041	0.100000001
13705	1287	5042	0.100000001
13706	1287	5043	0.100000001
13707	1287	150	0.100000001
13708	1287	3450	0.5
13709	1287	1151	0.800000012
13710	1287	5044	0.899999976
13711	1287	5045	0.800000012
13712	1287	5046	0.800000012
13713	1287	5047	0.800000012
13714	1287	5048	0.800000012
13715	1287	445	0.5
13716	1287	277	0.5
13717	1287	460	0.5
13718	1287	489	0.5
13719	1287	21	0.5
13720	1287	8	0.5
13721	1288	235	0.5
13722	1288	122	0.5
13723	1288	6	0.5
13724	1288	715	0.5
13725	1288	445	0.5
13726	1288	10	0.5
13727	1288	5039	0.5
13728	1288	1150	0.5
13729	1288	1	0.5
13730	1288	314	0.5
13731	1288	1151	0.5
13732	1288	5049	0.5
13733	1288	1772	0.100000001
13734	1288	5050	0.5
13735	1288	277	0.5
13736	1288	9	0.5
13737	1288	68	0.5
13738	1288	1149	0.5
13739	1288	40	0.5
13740	1288	46	0.5
13741	1288	275	0.5
13742	1288	16	0.5
13743	1288	1152	0.5
13744	1289	10	1
13745	1289	16	0
13746	1289	5051	1
13747	1289	5052	0.99000001
13748	1289	5053	0.99000001
13749	1289	5054	0.899999976
13750	1290	441	0.5
13751	1290	1	0.5
13752	1290	971	0.5
13753	1290	191	0.5
13754	1290	5055	0.5
13755	1290	3126	0.5
13756	1290	33	0.5
13757	1290	6	0.5
13758	1290	36	0.5
13759	1290	511	0.5
13760	1290	9	0.5
13761	1290	10	0.5
13762	1290	68	0.5
13763	1290	681	0.5
13764	1290	16	0.5
13765	1290	5056	0.5
13766	1290	1197	0.5
13767	1290	5057	0.5
13768	1291	3396	0.300000012
13769	1291	71	0.300000012
13770	1291	37	0
13771	1291	33	0
13772	1291	53	0
13773	1291	5058	0.800000012
13774	1291	5059	0.800000012
13775	1291	5060	0.800000012
13776	1291	2967	0.699999988
13777	1291	16	0.670000017
13778	1291	10	0.330000013
13779	1292	5061	0.949999988
13780	1292	12	0.5
13781	1292	163	0.5
13782	1292	292	0.5
13783	1292	2255	0.5
13784	1292	33	0.5
13785	1292	36	0.5
13786	1292	162	0.5
13787	1292	5062	0.5
13788	1292	5063	0.5
13789	1292	5064	0.5
13790	1292	5065	0.5
13791	1292	5066	0.5
13792	1293	235	0.5
13793	1293	236	0.5
13794	1293	6	0.5
13795	1293	237	0.5
13796	1293	9	0.5
13797	1293	10	0.5
13798	1293	68	0.5
13799	1293	5067	0.100000001
13800	1293	5068	0.75
13801	1293	5069	0.949999988
13802	1293	16	0.5
13803	1294	5070	0.800000012
13804	1294	37	0.800000012
13805	1294	425	0.800000012
13806	1294	257	0.800000012
13807	1294	5071	0.600000024
13808	1294	5072	0.800000012
13809	1294	38	0.800000012
13810	1294	441	0.800000012
13811	1294	292	0.800000012
13812	1294	5073	0.800000012
13813	1294	107	0.800000012
13814	1294	53	0.800000012
13815	1294	427	0.800000012
13816	1294	40	0.699999988
13817	1294	79	0.699999988
13818	1294	5074	0.699999988
13819	1294	5075	0.800000012
13820	1294	5076	0.699999988
13821	1294	4056	0.699999988
13822	1294	3624	0.699999988
13823	1294	229	0.100000001
13824	1294	71	0.5
13825	1294	5077	0.200000003
13826	1295	16	0.699999988
13827	1295	10	0.300000012
13828	1295	722	0.949999988
13829	1295	868	0.200000003
13830	1295	5078	1
13831	1295	5079	1
13832	1295	5080	1
13833	1295	5081	0
13834	1295	83	0
13835	1295	550	0.00999999978
13836	1295	5082	0.00999999978
13837	1296	5083	0.899999976
13838	1296	5084	0.100000001
13839	1297	5085	1
13840	1297	5086	0.5
13841	1297	1740	0.5
13842	1297	13	0.75
13843	1297	1597	0.75
13844	1297	5087	0.75
13845	1297	5088	0.75
13846	1297	5089	0.75
13847	1297	5090	0.75
13848	1297	5091	0.75
13849	1298	5092	1
13850	1298	33	0.899999976
13851	1298	36	0.5
13852	1298	53	0.5
13853	1298	5093	0.25
13854	1299	5094	0.5
13855	1299	5095	1
13856	1299	5096	0.119999997
13857	1299	5097	0.5
13858	1299	68	0.5
13859	1299	9	0.5
13860	1300	5098	0.899999976
13861	1300	5099	0.75
13862	1300	5100	0.800000012
13863	1301	5101	0.899999976
13864	1301	5102	0.800000012
13865	1301	498	0.5
13866	1301	37	0.949999988
13867	1301	5103	0.899999976
13868	1301	5104	0.800000012
13869	1301	597	0.100000001
13870	1301	5105	0.75
13871	1301	5106	0.610000014
13872	1301	522	0.5
13873	1301	36	0.439999998
13874	1301	5107	0.349999994
13875	1301	5108	0.370000005
13876	1301	395	0.189999998
13877	1301	401	0.150000006
13878	1301	68	0.899999976
13879	1301	9	0.100000001
13880	1301	5109	0.5
13881	1302	5110	1
13882	1302	5111	0.75
13883	1302	5112	0.75
13884	1302	5113	0.5
13885	1302	400	0.5
13886	1302	5114	0.5
13887	1302	5115	0.5
13888	1302	1810	0.300000012
13889	1302	5116	0.5
13890	1302	5117	0.5
13891	1303	5118	1
13892	1303	5119	0.75
13893	1303	5120	0.75
13894	1303	5121	0.5
13895	1303	400	0.5
13896	1303	5122	0.5
13897	1303	4019	0.5
13898	1303	5123	0.5
13899	1304	13	0.5
13900	1304	5124	0.5
13901	1304	5125	0.5
13902	1304	5126	0.25
13903	1304	5127	0.5
13904	1304	37	0.439999998
13905	1304	5128	0.379999995
13906	1304	5129	0.340000004
13907	1304	1470	0.300000012
13908	1304	5130	0.289999992
13909	1304	255	0.25999999
13910	1304	292	0.25
13911	1304	125	0.75
13912	1305	5131	0.5
13913	1305	5132	0.5
13914	1305	5133	0.5
13915	1305	5134	0.5
13916	1305	5135	0.75
13917	1306	5136	0.769999981
13918	1306	4505	0.389999986
13919	1306	5137	0.189999998
13920	1306	5138	0.159999996
13921	1306	5139	0.129999995
13922	1306	5140	0.129999995
13923	1306	5141	0.100000001
13924	1306	1613	0.0599999987
13925	1306	5142	0.5
13926	1306	5143	0.5
13927	1306	5144	0.5
13928	1306	40	0.5
13929	1306	5145	0.5
13930	1306	429	0.5
13931	1306	257	0.400000006
13932	1306	82	0.400000006
13933	1306	37	0.400000006
13934	1306	5146	0.400000006
13935	1306	844	0.400000006
13936	1306	3137	0.400000006
13937	1306	163	0.5
13938	1307	5147	0.5
13939	1307	429	0.5
13940	1307	6	0.5
13941	1307	5148	0.5
13942	1307	550	0.5
13943	1307	5149	0.5
13944	1307	5150	0.5
13945	1307	1012	0.5
13946	1307	2437	0.5
13947	1307	3408	0.5
13948	1307	5151	0.5
13949	1307	5152	0.5
13950	1307	547	0.5
13951	1307	5153	0.5
13952	1307	292	0.5
13953	1307	3835	0.5
13954	1307	481	0.5
13955	1307	395	0.5
13956	1307	5154	0.5
13957	1307	291	0.5
13958	1307	9	0.5
13959	1307	45	0.5
13960	1307	83	0.5
13961	1307	5155	0.5
13962	1307	5156	0.5
13963	1307	430	0.75
13964	1308	5157	0.5
13965	1308	90	0.5
13966	1308	10	0.5
13967	1308	6	0.5
13968	1308	5158	0.5
13969	1308	4922	0.5
13970	1308	844	0.5
13971	1308	801	0.5
13972	1308	896	0.5
13973	1308	1	0.5
13974	1308	5159	0.5
13975	1308	74	0.5
13976	1308	1197	0.5
13977	1308	5152	0.5
13978	1308	2684	0.5
13979	1308	2437	0.5
13980	1308	4211	0.5
13981	1308	229	0.5
13982	1308	395	0.5
13983	1308	749	0.5
13984	1308	1091	0.5
13985	1308	4789	0.5
13986	1308	291	0.5
13987	1308	9	0.5
13988	1308	2695	0.5
13989	1308	1207	0.5
13990	1308	1768	0.5
13991	1308	972	0.5
13992	1308	16	0.5
13993	1308	392	0.25
13994	1309	235	0.5
13995	1309	236	0.5
13996	1309	5160	0.5
13997	1309	6	0.5
13998	1309	237	0.5
13999	1309	10	0.5
14000	1309	5161	0.25
14001	1309	427	0.75
14002	1309	431	0.649999976
14003	1309	2519	0.649999976
14004	1309	5162	0.5
14005	1309	5163	0.75
14006	1309	292	0.75
14007	1309	37	0.75
14008	1309	619	0.100000001
14009	1309	4515	0.75
14010	1309	597	0.25
14011	1309	36	0.25
14012	1309	53	0.75
14013	1309	9	0.5
14014	1309	68	0.5
14015	1309	2121	0.25
14016	1309	3582	0.25
14017	1309	419	0.25
14018	1309	16	0.5
14019	1309	566	0.100000001
14020	1310	229	0.800000012
14021	1310	5164	0.699999988
14022	1310	5165	0.699999988
14023	1310	115	0.699999988
14024	1310	2059	0.699999988
14025	1310	395	0.800000012
14026	1310	5166	0.899999976
14027	1311	235	0.5
14028	1311	6	0.100000001
14029	1311	4484	0.5
14030	1311	5167	0.5
14031	1311	10	0
14032	1311	844	0.5
14033	1311	5168	0.5
14034	1311	1	0.5
14035	1311	1408	0.5
14036	1311	5169	0.5
14037	1311	5170	0.5
14038	1311	5171	0.5
14039	1311	4713	0.5
14040	1311	5172	0.5
14041	1311	9	0.5
14042	1311	68	0.5
14043	1311	5173	0.5
14044	1311	3340	0.5
14045	1311	2702	0.5
14046	1311	1422	0.5
14047	1311	4543	0.5
14048	1311	16	0.5
14049	1312	3546	1
14050	1312	5174	0.949999988
14051	1312	5175	1
14052	1312	1424	0.899999976
14053	1312	4840	0.949999988
14054	1312	79	0.899999976
14055	1312	303	0.400000006
14056	1312	820	0.400000006
14057	1312	1973	0.400000006
14058	1312	40	0.699999988
14059	1312	163	0.600000024
14060	1313	860	0.5
14061	1313	90	0.5
14062	1313	9	0.5
14063	1313	1768	0.5
14064	1313	972	0.5
14065	1313	40	0.5
14066	1313	1618	0.5
14067	1313	6	0.5
14068	1313	5176	0.5
14069	1313	5024	0.5
14070	1313	2021	0.5
14071	1313	3085	0.5
14072	1313	10	0.5
14073	1313	5177	0.5
14074	1313	16	0.5
14075	1313	5178	0.5
14076	1313	392	0.75
14077	1313	2684	0.75
14078	1314	235	0.5
14079	1314	37	0.100000001
14080	1314	236	0.5
14081	1314	6	0.5
14082	1314	237	0.5
14083	1314	9	0.75
14084	1314	10	0.5
14085	1314	68	0.5
14086	1314	231	0.100000001
14087	1314	5179	0.949999988
14088	1314	5180	0.75
14089	1314	5181	0.75
14090	1314	16	0.75
14091	1315	5182	0.75
14092	1315	235	0.5
14093	1315	5183	0.5
14094	1315	236	0.5
14095	1315	5184	0.949999988
14096	1315	6	0.5
14097	1315	5185	0.75
14098	1315	237	0.5
14099	1315	9	0.5
14100	1315	10	0.5
14101	1315	68	0.5
14102	1315	5186	0.25
14103	1315	5187	0.5
14104	1315	5188	0.75
14105	1315	16	0.5
14106	1315	5189	0.100000001
14107	1316	235	0.5
14108	1316	236	0.5
14109	1316	5184	0.949999988
14110	1316	6	0.5
14111	1316	237	0.5
14112	1316	9	0.5
14113	1316	10	0.5
14114	1316	68	0.75
14115	1316	5186	0.25
14116	1316	16	0.5
14117	1316	5190	0.75
14118	1317	235	0.5
14119	1317	5191	0.75
14120	1317	5192	0.75
14121	1317	236	0.5
14122	1317	257	0.100000001
14123	1317	5184	0.949999988
14124	1317	6	0.5
14125	1317	237	0.5
14126	1317	9	0.5
14127	1317	10	0.5
14128	1317	68	0.5
14129	1317	5193	0.75
14130	1317	16	0.5
14131	1317	5194	0.75
14132	1317	5186	0.25
14133	1318	126	0.75
14134	1318	1308	0.75
14135	1318	74	0.75
14136	1318	655	0.100000001
14137	1318	2631	0.75
14138	1318	257	0.75
14139	1319	3357	0.75
14140	1319	235	0.5
14141	1319	5195	0.949999988
14142	1319	68	0.5
14143	1319	236	0.5
14144	1319	507	0.75
14145	1319	6	0.5
14146	1319	2637	0.75
14147	1319	5196	0.100000001
14148	1319	3571	0.75
14149	1319	37	0.100000001
14150	1319	237	0.5
14151	1319	9	0.5
14152	1319	10	0.5
14153	1319	5197	0.100000001
14154	1319	5198	0.949999988
14155	1319	16	0.5
14156	1319	5199	0.75
14157	1319	5200	0.75
14158	1319	83	0.100000001
14159	1320	235	0.5
14160	1320	501	0.75
14161	1320	5201	0.75
14162	1320	68	0.5
14163	1320	236	0.5
14164	1320	6	0.5
14165	1320	280	0.100000001
14166	1320	237	0.5
14167	1320	10	0.5
14168	1320	469	0.75
14169	1320	425	0.5
14170	1320	4729	0.100000001
14171	1320	5202	0.75
14172	1320	5198	0.949999988
14173	1320	292	0.75
14174	1320	37	0.75
14175	1320	39	0.100000001
14176	1320	5203	0.75
14177	1320	5204	0.649999976
14178	1320	4559	0.75
14179	1320	53	0.75
14180	1320	9	0.5
14181	1320	5197	0.100000001
14182	1320	79	0.75
14183	1320	88	0.75
14184	1320	5195	0.949999988
14185	1320	5205	0.75
14186	1320	16	0.5
14187	1321	5206	0.5
14188	1321	641	0.5
14189	1321	5207	0.5
14190	1321	6	0.5
14191	1321	9	0.5
14192	1321	10	0.5
14193	1321	5208	0.5
14194	1321	1	0.5
14195	1321	425	0.5
14196	1321	5209	0.5
14197	1321	16	0.5
14198	1321	71	0.5
14199	1322	83	0.800000012
14200	1322	68	0.0500000007
14201	1322	9	0.899999976
14202	1322	6	0.949999988
14203	1322	16	0.550000012
14204	1322	10	0.449999988
14205	1322	291	0.800000012
14206	1322	40	0.800000012
14207	1322	2591	0.800000012
14208	1322	431	0.800000012
14209	1322	2059	0.699999988
14210	1322	869	0.699999988
14211	1322	105	0.600000024
14212	1323	5210	1
14213	1323	5211	0.800000012
14214	1323	5212	0.699999988
14215	1323	5213	0.699999988
14216	1323	5214	0.699999988
14217	1323	5146	0.600000024
14218	1323	5215	0.600000024
14219	1324	235	0.5
14220	1324	37	0.5
14221	1324	236	0.5
14222	1324	6	0.5
14223	1324	237	0.5
14224	1324	9	0.5
14225	1324	10	0.5
14226	1324	68	0.5
14227	1324	5216	0.75
14228	1324	531	0.649999976
14229	1324	5217	0.949999988
14230	1324	16	0.5
14231	1324	5218	0.75
14232	1325	5219	0.800000012
14233	1325	277	0.800000012
14234	1325	37	0.800000012
14235	1325	441	0.800000012
14236	1325	38	0.800000012
14237	1325	40	0.800000012
14238	1325	3855	0.699999988
14239	1325	314	0.600000024
14240	1325	445	0.699999988
14241	1325	21	0.600000024
14242	1325	5220	0.899999976
14243	1325	12	0.800000012
14244	1325	16	0.550000012
14245	1325	10	0.449999988
14246	1326	1	0.5
14247	1326	37	0.5
14248	1326	9	0.5
14249	1326	10	0.5
14250	1326	68	0.5
14251	1326	3076	0.5
14252	1326	16	0.5
14253	1326	2242	0.5
14254	1326	5221	0.5
14255	1327	5222	0.800000012
14256	1327	5223	0.800000012
14257	1327	292	0.800000012
14258	1327	37	0.800000012
14259	1327	33	0.800000012
14260	1327	36	0.800000012
14261	1327	4051	0.800000012
14262	1327	547	0.600000024
14263	1327	2490	0.600000024
14264	1327	5224	0.600000024
14265	1327	844	0.600000024
14266	1327	293	0.600000024
14267	1328	5225	0.600000024
14268	1328	5226	0.899999976
14269	1328	5227	0.899999976
14270	1328	5228	0.800000012
14271	1328	5229	0.699999988
14272	1328	5230	0.600000024
14273	1328	395	0.699999988
14274	1328	5231	0.800000012
14275	1328	5232	0.800000012
14276	1328	5233	0.800000012
14277	1328	1844	0.800000012
14278	1328	127	0.699999988
14279	1328	16	0.620000005
14280	1328	10	0.379999995
14281	1329	722	0.5
14282	1329	411	0.400000006
14283	1329	2134	0.400000006
14284	1329	292	0.400000006
14285	1329	2780	0.300000012
14286	1329	365	0.400000006
14287	1329	369	0.300000012
14288	1329	1081	0.300000012
14289	1329	397	0.0500000007
14290	1329	9	0.899999976
14291	1329	16	0.75
14292	1329	10	0.25
14293	1329	5234	0.400000006
14294	1329	5235	0.200000003
14295	1329	3501	0.300000012
14296	1329	5236	0.300000012
14297	1329	5237	0.25
14298	1329	5238	0.5
14299	1329	5239	0.100000001
14300	1329	5240	0.100000001
14301	1330	235	0.5
14302	1330	236	0.5
14303	1330	6	0.5
14304	1330	1748	1
14305	1330	1749	0.75
14306	1330	237	0.5
14307	1330	10	0.5
14308	1330	1752	0.75
14309	1330	1751	0.75
14310	1330	5241	0.949999988
14311	1330	60	0.75
14312	1330	5242	0.75
14313	1330	5243	0.949999988
14314	1330	1753	0.75
14315	1330	37	0.75
14316	1330	9	0.5
14317	1330	68	0.5
14318	1330	1750	0.75
14319	1330	1755	0.75
14320	1330	5244	0.949999988
14321	1330	1747	0.75
14322	1330	2203	0.75
14323	1330	5245	0.75
14324	1330	16	0.5
14325	1331	5246	0.699999988
14326	1331	5247	0.899999976
14327	1331	5248	0.899999976
14328	1331	5249	0.899999976
14329	1331	415	0.600000024
14330	1331	2109	0.600000024
14331	1331	53	0.100000001
14332	1331	37	0.100000001
14333	1331	570	0.100000001
14334	1332	5250	1
14335	1332	5251	0.99000001
14336	1332	2021	0.899999976
14337	1332	3507	0.899999976
14338	1333	5252	0.5
14339	1333	5253	0.25
14340	1334	1	0.5
14341	1334	5254	0.100000001
14342	1334	470	0.5
14343	1334	2067	0.5
14344	1334	6	0.5
14345	1334	434	0.5
14346	1334	9	0.5
14347	1334	10	0.5
14348	1334	68	0.5
14349	1334	474	0.5
14350	1334	329	0.5
14351	1334	473	0.5
14352	1334	42	0.5
14353	1334	16	0.5
14354	1334	475	0.5
14355	1334	2068	0.899999976
14356	1335	45	0.75
14357	1335	473	0.75
14358	1335	434	0.75
14359	1335	449	0.75
14360	1335	474	0.5
14361	1336	235	0.5
14362	1336	37	0.75
14363	1336	10	0.5
14364	1336	14	0.75
14365	1336	74	0.75
14366	1336	5255	0.75
14367	1336	6	0.5
14368	1336	16	0.5
14369	1336	237	0.5
14370	1336	9	0.5
14371	1336	236	0.5
14372	1336	68	0.5
14373	1336	125	0.75
14374	1336	2591	0.949999988
14375	1336	284	0.5
14376	1336	126	0.25
14377	1337	5256	0.899999976
14378	1338	5257	0.75
14379	1338	74	0.75
14380	1338	799	0.75
14381	1338	3757	0.75
14382	1338	5258	0.75
14383	1338	5259	0.5
14384	1338	2275	0.5
14385	1338	2633	0.5
14386	1338	5260	0.5
14387	1338	5261	0.5
14388	1338	5262	0.5
14389	1338	547	0.5
14390	1338	5263	0.5
14391	1338	5264	0.25
14392	1339	235	0.5
14393	1339	16	0.5
14394	1339	5265	0.949999988
14395	1339	236	0.5
14396	1339	6	0.5
14397	1339	555	0.5
14398	1339	237	0.5
14399	1339	9	0.5
14400	1339	10	0.5
14401	1339	68	0.5
14402	1339	5266	0.5
14403	1339	125	0.75
14404	1339	5267	0.25
14405	1339	126	0.75
14406	1339	13	0.100000001
14407	1340	105	0.400000006
14408	1340	5268	0.5
14409	1340	5269	0.400000006
14410	1340	917	0.660000026
14411	1340	5270	0.5
14412	1340	550	0.150000006
14413	1340	3835	0.25
14414	1340	920	0.25
14415	1340	76	0.25
14416	1341	5271	0.899999976
14417	1341	5272	0.5
14418	1341	5273	0.5
14419	1341	5274	0.5
14420	1342	235	0.5
14421	1342	499	0.5
14422	1342	236	0.5
14423	1342	6	0.5
14424	1342	237	0.5
14425	1342	10	0.5
14426	1342	5275	0.5
14427	1342	425	0.75
14428	1342	536	0.75
14429	1342	348	0.5
14430	1342	37	0.75
14431	1342	599	0.5
14432	1342	257	0.75
14433	1342	277	0.5
14434	1342	9	0.5
14435	1342	68	0.5
14436	1342	659	0.649999976
14437	1342	419	0.75
14438	1342	5276	0.75
14439	1342	498	0.75
14440	1342	1845	0.949999988
14441	1342	16	0.5
14442	1342	3584	0.5
14443	1343	904	1
14444	1343	5277	1
14445	1343	906	1
14446	1343	907	1
14447	1344	3243	0.5
14448	1344	21	0.5
14449	1344	40	0.5
14450	1344	680	0.5
14451	1344	314	0.5
14452	1344	6	0.5
14453	1344	277	0.5
14454	1344	445	0.5
14455	1344	9	0.5
14456	1344	10	0.5
14457	1344	68	0.5
14458	1344	437	0.5
14459	1344	291	0.5
14460	1344	1262	0.5
14461	1344	16	0.5
14462	1344	12	0.5
14463	1344	40	0.5
14464	1345	3211	0.5
14465	1345	1	0.5
14466	1345	3213	0.5
14467	1345	9	0.5
14468	1345	68	0.5
14469	1345	390	0.5
14470	1345	391	0.5
14471	1345	3690	0.5
14472	1346	5278	0.5
14473	1346	5279	0.5
14474	1346	5280	0.5
14475	1346	2825	0.5
14476	1347	235	0.5
14477	1347	37	0.75
14478	1347	5281	0.75
14479	1347	2219	0.25
14480	1347	236	0.5
14481	1347	1876	0.75
14482	1347	5282	0.949999988
14483	1347	36	0.25
14484	1347	237	0.5
14485	1347	6	0.5
14486	1347	10	0.5
14487	1347	68	0.5
14488	1347	5283	0.75
14489	1347	478	0.75
14490	1347	16	0.5
14491	1347	9	0.5
14492	1348	5284	0.5
14493	1348	6	0.5
14494	1348	9	0.5
14495	1348	10	0.5
14496	1348	68	0.5
14497	1348	5285	0.5
14498	1348	5286	0.5
14499	1348	5287	0.5
14500	1348	1	0.5
14501	1348	16	0.5
14502	1348	5288	0.5
14503	1349	235	0.5
14504	1349	6	0.5
14505	1349	1891	0.5
14506	1349	5289	0.5
14507	1349	5290	0.5
14508	1349	5291	0.5
14509	1349	74	0.5
14510	1349	425	0.5
14511	1349	5292	0.5
14512	1349	292	0.5
14513	1349	2748	0.5
14514	1349	16	0.5
14515	1349	9	0.5
14516	1349	5293	0.5
14517	1349	68	0.5
14518	1349	5294	1
14519	1349	8	0.5
14520	1349	498	0.5
14521	1349	396	0.5
14522	1349	38	0.5
14523	1349	4666	0.5
14524	1350	1428	0.5
14525	1350	5295	0.5
14526	1350	235	0.5
14527	1350	5296	0.5
14528	1350	5297	0.5
14529	1350	236	0.5
14530	1350	6	0.5
14531	1350	10	0.5
14532	1350	5298	0.5
14533	1350	5299	0.5
14534	1350	5300	0.5
14535	1350	641	0.5
14536	1350	5301	0.5
14537	1350	9	0.5
14538	1350	68	0.5
14539	1350	809	0.5
14540	1350	5302	0.5
14541	1350	5303	0.5
14542	1350	4552	0.5
14543	1350	181	0.5
14544	1350	5304	0.5
14545	1350	16	0.5
14546	1351	2128	0.25
14547	1351	75	0.5
14548	1351	5305	0.5
14549	1351	74	0.5
14550	1351	834	0.5
14551	1351	291	0.5
14552	1351	531	0.75
14553	1351	3554	0.5
14554	1351	5306	1
14555	1352	5307	1
14556	1352	5308	1
14557	1352	5309	0.5
14558	1352	5310	0.5
14559	1352	5311	0.5
14560	1352	5312	0.5
14561	1352	5313	0.5
14562	1352	5314	0.5
14563	1352	5315	0.5
14564	1352	2317	1
14565	1352	5316	1
14566	1352	5317	1
14567	1353	348	1
14568	1353	3769	0.5
14569	1353	9	0.5
14570	1353	10	0.5
14571	1353	68	0.5
14572	1353	5318	0.5
14573	1353	16	0.5
14574	1353	5319	0.5
14575	1353	6	0.5
14576	1354	3364	0.800000012
14577	1354	5320	0.400000006
14578	1354	1384	0.899999976
14579	1354	5321	0.400000006
14580	1354	5322	0.5
14581	1354	5323	0.300000012
14582	1354	5324	0.600000024
14583	1355	3341	0.75
14584	1355	235	0.5
14585	1355	37	0.75
14586	1355	2602	0.75
14587	1355	3342	0.75
14588	1355	3343	0.75
14589	1355	236	0.5
14590	1355	6	0.5
14591	1355	5325	0.75
14592	1355	255	0.75
14593	1355	237	0.5
14594	1355	9	0.5
14595	1355	10	0.5
14596	1355	68	0.5
14597	1355	1484	0.75
14598	1355	3344	0.75
14599	1355	16	0.5
14600	1355	5326	0.75
14601	1356	5327	0.5
14602	1356	6	0.5
14603	1356	9	0.5
14604	1356	10	0
14605	1356	68	0.5
14606	1356	5328	0.5
14607	1356	1	0.5
14608	1356	16	1
14609	1356	470	0.5
14610	1356	5329	0.5
14611	1356	5330	0.5
14612	1356	5331	0.5
14613	1356	329	0.5
14614	1357	5332	1
14615	1357	235	0.5
14616	1357	37	0.75
14617	1357	629	0.75
14618	1357	5333	0.100000001
14619	1357	236	0.5
14620	1357	6	0.5
14621	1357	5334	0.75
14622	1357	5335	0.949999988
14623	1357	237	0.5
14624	1357	9	0.5
14625	1357	10	0.5
14626	1357	68	0.5
14627	1357	5336	0.75
14628	1357	16	0.5
14629	1357	5337	0.75
14630	1357	5338	1
14631	1358	235	0.5
14632	1358	5339	1
14633	1358	5340	0.75
14634	1358	191	0.25
14635	1358	4019	0.25
14636	1358	4768	0.949999988
14637	1358	599	0.75
14638	1358	236	0.5
14639	1358	324	0.25
14640	1358	6	0.5
14641	1358	36	0.25
14642	1358	53	0.75
14643	1358	237	0.5
14644	1358	9	0.5
14645	1358	10	0.5
14646	1358	68	0.5
14647	1358	844	0.25
14648	1358	1263	0.75
14649	1358	427	0.25
14650	1358	257	0.75
14651	1358	569	0.75
14652	1358	76	0.75
14653	1358	397	0.25
14654	1358	74	0.25
14655	1358	107	0.75
14656	1358	275	0.25
14657	1358	896	0.25
14658	1358	555	0.75
14659	1358	5341	0.75
14660	1358	14	0.25
14661	1358	4769	0.100000001
14662	1358	16	0.5
14663	1358	105	0.75
14664	1358	292	0.75
14665	1359	1523	0.5
14666	1359	235	0.5
14667	1359	37	0.5
14668	1359	619	0.5
14669	1359	292	0.5
14670	1359	426	0.5
14671	1359	419	0.5
14672	1359	16	0.5
14673	1359	107	0.5
14674	1359	6	0.5
14675	1359	36	0.5
14676	1359	324	0.5
14677	1359	401	0.5
14678	1359	10	0.5
14679	1359	68	0.5
14680	1359	427	0.5
14681	1359	38	0.5
14682	1359	2242	0.5
14683	1359	9	0.5
14684	1360	9	0.5
14685	1360	5342	0.5
14686	1360	5343	0.5
14687	1360	5344	0.5
14688	1360	33	0.5
14689	1360	21	0.5
14690	1360	5345	1
14691	1360	2541	0.5
14692	1360	4117	0.5
14693	1360	5346	0.5
14694	1360	6	0.5
14695	1360	10	0.5
14696	1360	68	0.5
14697	1360	5347	0.5
14698	1360	1262	0.5
14699	1360	16	0.5
14700	1360	681	0.5
14701	1360	857	0.5
14702	1360	292	0.5
14703	1360	444	1
14704	1360	461	1
14705	1361	5348	0.5
14706	1361	1	0.5
14707	1361	9	0.5
14708	1361	10	0.5
14709	1361	5349	0.5
14710	1361	16	0.5
14711	1361	235	0.5
14712	1361	6	0.5
14713	1362	235	0.5
14714	1362	37	0.25
14715	1362	5350	0.949999988
14716	1362	5351	0.75
14717	1362	5352	0.949999988
14718	1362	5353	0.949999988
14719	1362	236	0.5
14720	1362	6	0.5
14721	1362	81	0.25
14722	1362	53	0.25
14723	1362	237	0.5
14724	1362	9	0.5
14725	1362	10	0.5
14726	1362	68	0.5
14727	1362	5354	0.75
14728	1362	5355	0.949999988
14729	1362	16	0.5
14730	1362	5356	0.75
14731	1363	235	0.5
14732	1363	37	0.5
14733	1363	9	0.5
14734	1363	10	0.5
14735	1363	68	0.5
14736	1363	43	0.5
14737	1363	16	0.5
14738	1363	1	0.5
14739	1363	6	0.5
14740	1364	235	0.5
14741	1364	5357	0.5
14742	1364	5358	0.5
14743	1364	6	0.5
14744	1364	9	0.5
14745	1364	10	0.5
14746	1364	68	0.5
14747	1364	70	0.5
14748	1364	1	0.5
14749	1364	16	0.5
14750	1365	70	0.75
14751	1365	235	0.5
14752	1365	37	0.25
14753	1365	5359	1
14754	1365	5360	0.5
14755	1365	236	0.5
14756	1365	6	0.100000001
14757	1365	5361	1
14758	1365	5362	0.5
14759	1365	237	0.5
14760	1365	9	0.100000001
14761	1365	10	0.5
14762	1365	68	0.5
14763	1365	5363	0.75
14764	1365	16	0.5
14765	1365	5364	0.100000001
14766	1365	5365	0.5
14767	1366	722	0.800000012
14768	1366	429	0.5
14769	1366	5366	0.400000006
14770	1366	5367	0.400000006
14771	1366	5368	0.300000012
14772	1366	5369	0.400000006
14773	1366	16	0.649999976
14774	1366	10	0.349999994
14775	1366	5370	0.699999988
14776	1366	5371	0.5
14777	1366	5372	0.300000012
14778	1366	2934	0.300000012
14779	1366	5373	0.699999988
14780	1367	33	0.5
14781	1367	40	0.5
14782	1367	1330	0.5
14783	1367	277	0.5
14784	1367	441	0.5
14785	1367	441	0.5
14786	1367	445	0.5
14787	1367	4435	0.5
14788	1367	5374	0.25
14789	1367	1139	0.25
14790	1367	5375	0.75
14791	1367	489	0.75
14792	1367	163	0.5
14793	1368	291	0.5
14794	1368	5376	0.5
14795	1368	10	0.5
14796	1368	6	0.5
14797	1368	16	0.5
14798	1368	82	0.5
14799	1368	9	0.5
14800	1369	3341	0.75
14801	1369	235	0.5
14802	1369	16	0.5
14803	1369	3342	0.75
14804	1369	3343	0.75
14805	1369	236	0.5
14806	1369	6	0.5
14807	1369	5377	0.75
14808	1369	255	0.75
14809	1369	237	0.5
14810	1369	9	0.5
14811	1369	10	0.5
14812	1369	68	0.5
14813	1369	1484	0.75
14814	1369	3344	0.75
14815	1370	5378	1
14816	1371	235	0.5
14817	1371	37	0.5
14818	1371	1384	0.5
14819	1371	6	0.5
14820	1371	10	0.5
14821	1371	68	0.5
14822	1371	5290	0.5
14823	1371	1523	0.5
14824	1371	46	0.5
14825	1371	3588	0.5
14826	1371	3338	0.5
14827	1371	16	0.5
14828	1372	531	0.5
14829	1372	235	0.100000001
14830	1372	2128	0.5
14831	1372	236	0.5
14832	1372	6	0.5
14833	1372	4076	0.5
14834	1372	10	0.5
14835	1372	1018	0.5
14836	1372	74	0.600000024
14837	1372	400	0.5
14838	1372	3338	0.5
14839	1372	14	0.5
14840	1372	37	0.5
14841	1372	641	0.5
14842	1372	9	0.5
14843	1372	68	0.5
14844	1372	79	0.5
14845	1372	5379	0.5
14846	1372	3755	0.5
14847	1372	275	0.5
14848	1372	16	0.5
14849	1372	291	0.600000024
14850	1372	40	0.600000024
14851	1372	619	0.300000012
14852	1373	235	0.75
14853	1373	567	0.75
14854	1373	236	0.5
14855	1373	6	0.100000001
14856	1373	237	0.5
14857	1373	9	0.100000001
14858	1373	10	0.5
14859	1373	68	0.75
14860	1373	5380	0.75
14861	1373	1520	0.75
14862	1373	4562	0.75
14863	1373	555	0.100000001
14864	1373	16	0.5
14865	1373	79	0.75
14866	1373	280	0.75
14867	1373	37	0.75
14868	1373	107	0.75
14869	1373	53	0.75
14870	1373	277	0.100000001
14871	1373	38	0.5
14872	1374	422	0.5
14873	1374	14	0.5
14874	1374	6	0.5
14875	1374	10	0.5
14876	1374	427	0.5
14877	1374	1	0.5
14878	1374	400	0.5
14879	1374	5381	0.5
14880	1374	1299	0.5
14881	1374	5382	0.5
14882	1374	292	0.5
14883	1374	37	0.5
14884	1374	547	0.5
14885	1374	53	0.5
14886	1374	9	0.5
14887	1374	68	0.5
14888	1374	79	0.5
14889	1374	88	0.5
14890	1374	38	0.5
14891	1374	5383	0.5
14892	1374	681	0.5
14893	1374	16	0.5
14894	1375	1644	0.5
14895	1375	2688	0.5
14896	1375	2689	0.5
14897	1375	5384	0.5
14898	1375	2690	0.5
14899	1375	1091	0.5
14900	1375	1844	0.5
14901	1375	6	0.5
14902	1375	2691	0.5
14903	1375	3137	0.5
14904	1375	2692	0.5
14905	1375	9	0.5
14906	1375	10	0.5
14907	1375	2693	0.5
14908	1375	844	0.5
14909	1375	2694	0.5
14910	1375	2695	0.5
14911	1375	2696	0.5
14912	1375	857	0.5
14913	1375	1729	0.5
14914	1375	2697	0.5
14915	1375	16	0.5
14916	1375	2698	0.5
14917	1375	2699	0.5
14918	1375	2700	0.5
14919	1375	2701	0.5
14920	1375	2702	0.5
14921	1375	2703	0.5
14922	1375	2704	0.5
14923	1375	702	0.5
14924	1375	2705	0.5
14925	1375	2706	0.5
14926	1376	5385	0.800000012
14927	1376	291	0.800000012
14928	1376	40	0.639999986
14929	1376	44	0.620000005
14930	1376	14	0.439999998
14931	1376	277	0.330000013
14932	1376	5386	0.389999986
14933	1376	16	0.5
14934	1376	10	0.5
14935	1376	68	0.100000001
14936	1376	9	0.899999976
14937	1376	5387	0.949999988
14938	1376	83	0.800000012
14939	1376	400	0.00999999978
14940	1376	5388	0.800000012
14941	1376	5389	0.800000012
14942	1376	5390	0.800000012
14943	1376	398	0.699999988
14944	1377	235	0.5
14945	1377	37	0.75
14946	1377	5391	0.75
14947	1377	597	0.5
14948	1377	236	0.5
14949	1377	6	0.25
14950	1377	5392	0.75
14951	1377	237	0.5
14952	1377	9	0.25
14953	1377	10	0.5
14954	1377	68	0.75
14955	1377	419	0.5
14956	1377	5393	0.75
14957	1377	16	0.5
14958	1377	126	0.25
14959	1378	5394	0.899999976
14960	1378	5395	0.899999976
14961	1378	122	0.600000024
14962	1378	37	0.699999988
14963	1378	229	0.800000012
14964	1378	36	0.400000006
14965	1378	292	0.400000006
14966	1378	74	0.400000006
14967	1378	60	0.699999988
14968	1379	1810	0.899999976
14969	1379	2958	0.899999976
14970	1379	3274	0.400000006
14971	1379	3275	0.300000012
14972	1379	1911	0.400000006
14973	1379	2463	0.699999988
14974	1379	3276	0.699999988
14975	1379	3277	0.400000006
14976	1379	3043	0.400000006
14977	1379	2471	0.800000012
14978	1379	3278	0.200000003
14979	1379	2255	1
14980	1380	5396	0.899999976
14981	1380	5397	0.899999976
14982	1380	5398	0.699999988
14983	1380	5399	0.600000024
14984	1380	2923	0.99000001
14985	1380	5400	0.800000012
14986	1380	5401	0.699999988
14987	1381	2929	1
14988	1381	5402	0.75
14989	1382	235	0.5
14990	1382	1370	0.75
14991	1382	236	0.5
14992	1382	6	0.5
14993	1382	237	0.5
14994	1382	5403	0.75
14995	1382	10	0.5
14996	1382	68	0.5
14997	1382	5404	0.75
14998	1382	71	0.25
14999	1382	16	0.5
15000	1382	9	0.5
15001	1383	5405	1
15002	1383	1308	0.300000012
15003	1383	5406	0.300000012
15004	1383	77	0.200000003
15005	1383	76	0.200000003
15006	1384	1	0.5
15007	1384	9	0.5
15008	1384	10	0.5
15009	1384	68	0.5
15010	1384	16	0.5
15011	1384	5407	0.5
15012	1384	6	0.5
15013	1385	1	0.5
15014	1385	9	0.5
15015	1385	10	0.5
15016	1385	68	0.5
15017	1385	16	0.5
15018	1385	5407	0.5
15019	1385	6	0.5
15020	1386	16	0.5
15021	1386	10	0.5
15022	1386	1979	0.800000012
15023	1386	5408	0.899999976
15024	1386	5409	0.899999976
15025	1386	5410	0.699999988
15026	1387	5411	1
15027	1387	5412	0.75
15028	1387	5413	0.75
15029	1387	5414	0.5
15030	1387	5415	0.75
15031	1387	5416	0.899999976
15032	1387	9	0.75
15033	1387	5417	0.5
15034	1387	5418	1
15035	1388	5419	1
15036	1388	5420	1
15037	1388	5421	0.5
15038	1389	1	0.5
15039	1389	9	0.5
15040	1389	10	0.5
15041	1389	68	0.5
15042	1389	16	0.5
15043	1389	5407	0.5
15044	1389	6	0.5
15045	1390	37	0.5
15046	1390	257	0.5
15047	1390	6	0.5
15048	1390	9	0.5
15049	1390	10	0.5
15050	1390	68	0.5
15051	1390	83	0.5
15052	1390	126	0.5
15053	1390	76	0.5
15054	1390	1663	0.5
15055	1390	16	0.5
15056	1390	2971	0.5
15057	1391	70	0.75
15058	1391	235	0.5
15059	1391	5422	0.75
15060	1391	5423	0.75
15061	1391	236	0.5
15062	1391	6	0.5
15063	1391	275	0.75
15064	1391	5424	0.75
15065	1391	393	0.75
15066	1391	16	0.5
15067	1391	237	0.5
15068	1391	9	0.5
15069	1391	10	0.5
15070	1391	68	0.5
15071	1391	5425	0.949999988
15072	1391	365	0.75
15073	1391	79	0.75
15074	1391	88	0.75
15075	1391	5426	0.75
15076	1392	724	0.899999976
15077	1392	5427	0.75
15078	1392	5428	0.5
15079	1392	5429	0.25
15080	1392	4998	0.25
15081	1392	391	0.25
15082	1392	5430	0.25
15083	1392	24	0.25
15084	1392	390	0.25
15085	1393	235	0.5
15086	1393	37	0.75
15087	1393	5431	0.949999988
15088	1393	568	0.75
15089	1393	5432	0.75
15090	1393	236	0.5
15091	1393	6	0.5
15092	1393	40	0.75
15093	1393	555	0.5
15094	1393	277	0.75
15095	1393	237	0.5
15096	1393	9	0.5
15097	1393	10	0.5
15098	1393	68	0.5
15099	1393	16	0.5
15100	1393	4571	0.75
15101	1393	5433	0.75
15102	1394	5434	1
15103	1395	5435	1
15104	1396	235	0.5
15105	1396	37	0.75
15106	1396	3	0.75
15107	1396	236	0.5
15108	1396	3468	0.75
15109	1396	5436	0.5
15110	1396	250	0.75
15111	1396	237	0.5
15112	1396	6	0.5
15113	1396	10	0.75
15114	1396	68	0.5
15115	1396	5437	0.75
15116	1396	16	0.5
15117	1396	5438	0.5
15118	1396	9	0.75
15119	1397	5439	1
15120	1397	9	0.75
15121	1397	5440	0.5
15122	1397	5441	0.25
15123	1398	235	0.5
15124	1398	37	0.75
15125	1398	236	0.5
15126	1398	6	0.5
15127	1398	5442	0.75
15128	1398	237	0.5
15129	1398	9	0.5
15130	1398	10	0.5
15131	1398	68	0.5
15132	1398	5443	0.75
15133	1398	5444	0.75
15134	1398	16	0.5
15135	1399	235	0.5
15136	1399	14	0.75
15137	1399	236	0.5
15138	1399	6	0.5
15139	1399	715	0.5
15140	1399	237	0.5
15141	1399	10	0.5
15142	1399	5445	0.75
15143	1399	5446	0.949999988
15144	1399	74	0.5
15145	1399	5447	0.5
15146	1399	5448	0.949999988
15147	1399	37	0.75
15148	1399	317	0.5
15149	1399	38	0.75
15150	1399	36	0.75
15151	1399	9	0.5
15152	1399	68	0.5
15153	1399	3677	0.75
15154	1399	1967	0.75
15155	1399	8	0.5
15156	1399	5449	0.75
15157	1399	16	0.5
15158	1400	5450	1
15159	1400	5451	0.75
15160	1400	37	0.75
15161	1400	5452	0.5
15162	1400	5453	0.5
15163	1400	489	0.25
15164	1400	5454	0.25
15165	1400	259	0.660000026
15166	1400	950	0.5
15167	1400	5455	0.5
15168	1400	5456	0.75
15169	1400	5457	0.5
15170	1400	5458	0.100000001
15171	1401	5459	0.899999976
15172	1401	5460	0.5
15173	1402	235	0.75
15174	1402	236	0.5
15175	1402	6	0.5
15176	1402	237	0.5
15177	1402	5461	0.949999988
15178	1402	10	0.5
15179	1402	5462	0.75
15180	1402	469	0.75
15181	1402	397	0.5
15182	1402	5463	0.100000001
15183	1402	5464	0.75
15184	1402	5465	0.949999988
15185	1402	5466	0.100000001
15186	1402	5467	0.75
15187	1402	350	0.5
15188	1402	5468	0.75
15189	1402	68	0.75
15190	1402	79	0.75
15191	1402	555	0.5
15192	1402	2024	0.649999976
15193	1402	16	0.5
15194	1402	9	0.5
15195	1403	5469	1
15196	1404	5470	0.5
15197	1404	5471	0.5
15198	1404	5472	0.25
15199	1404	5473	0.25
15200	1405	1384	0.5
15201	1405	599	0.5
15202	1405	257	0.5
15203	1405	6	0.5
15204	1405	5474	0.5
15205	1405	5475	0.5
15206	1405	10	0.5
15207	1405	356	0.5
15208	1405	4129	0.5
15209	1405	88	0.5
15210	1405	68	0.5
15211	1405	16	0.5
15212	1405	9	0.5
15213	1406	5476	0.949999988
15214	1406	235	0.5
15215	1406	37	0.75
15216	1406	5477	0.949999988
15217	1406	236	0.5
15218	1406	4642	0.75
15219	1406	40	0.5
15220	1406	4641	0.5
15221	1406	237	0.5
15222	1406	6	0.5
15223	1406	10	0.5
15224	1406	68	0.5
15225	1406	4647	0.75
15226	1406	16	0.5
15227	1406	88	0.5
15228	1406	90	0.5
15229	1406	9	0.5
15230	1407	235	0.5
15231	1407	37	0.75
15232	1407	236	0.5
15233	1407	599	0.75
15234	1407	5478	0.75
15235	1407	6	0.5
15236	1407	5479	0.949999988
15237	1407	498	0.75
15238	1407	90	0.75
15239	1407	237	0.5
15240	1407	9	0.5
15241	1407	10	0.5
15242	1407	68	0.5
15243	1407	16	0.5
15244	1407	5480	0.75
15245	1407	88	1
15246	1408	88	1
15247	1408	90	0.75
15248	1408	53	0.5
15249	1408	37	0.25
15250	1408	38	0.25
15251	1408	33	0.25
15252	1408	36	0.25
15253	1408	392	0.75
15254	1408	68	0.75
15255	1408	9	0.75
15256	1408	6	0.75
15257	1408	16	0.75
15258	1408	10	0.75
15259	1408	1	0.75
15260	1409	5481	1
15261	1410	5482	1
15262	1410	5483	0.75
15263	1411	5484	0.75
15264	1411	235	0.5
15265	1411	37	0.100000001
15266	1411	236	0.5
15267	1411	257	0.100000001
15268	1411	5485	0.75
15269	1411	6	0.5
15270	1411	5486	0.75
15271	1411	5487	0.75
15272	1411	237	0.5
15273	1411	9	0.5
15274	1411	10	0.5
15275	1411	68	0.5
15276	1411	1428	0.75
15277	1411	16	0.5
15278	1412	16	0.5
15279	1412	10	0.5
15280	1412	5488	0.800000012
15281	1412	5489	0.699999988
15282	1412	5490	0.800000012
15283	1412	5491	0.200000003
15284	1412	5492	0.400000006
15285	1412	5493	0.5
15286	1412	4680	0.699999988
15287	1412	5494	0.600000024
15288	1412	5495	0.600000024
15289	1412	5496	0.800000012
15290	1413	5497	1
15291	1413	5498	0.899999976
15292	1413	5499	0.800000012
15293	1413	5401	0.699999988
15294	1413	5500	0.899999976
15295	1413	5501	0.899999976
15296	1413	5502	0.899999976
15297	1413	5503	0.800000012
15298	1413	5504	1
15299	1413	5505	1
15300	1414	10	1
15301	1414	16	0
15302	1414	1430	1
15303	1414	262	0.600000024
15304	1414	5506	0.5
15305	1414	4123	0.899999976
15306	1414	5507	0.200000003
15307	1414	5508	0.699999988
15308	1414	5509	0.439999998
15309	1414	5510	0.200000003
15310	1414	8	0.400000006
15311	1414	12	0.400000006
15312	1414	5511	0.600000024
15313	1415	235	0.5
15314	1415	236	0.5
15315	1415	280	0.75
15316	1415	5512	0.75
15317	1415	416	0.5
15318	1415	10	0.5
15319	1415	40	0.5
15320	1415	5513	0.5
15321	1415	4644	0.649999976
15322	1415	292	0.5
15323	1415	5514	0.5
15324	1415	5515	0.100000001
15325	1415	9	0.5
15326	1415	68	0.5
15327	1415	12	0.75
15328	1415	33	0.5
15329	1415	8	0.75
15330	1415	5516	0.949999988
15331	1415	107	0.75
15332	1415	275	0.5
15333	1415	5517	0.100000001
15334	1415	2636	0.75
15335	1415	16	0.5
15336	1415	821	0.5
15337	1415	290	0.5
15338	1415	6	0.5
15339	1415	5518	0.5
15340	1415	37	0.75
15341	1415	237	0.5
15342	1415	431	0.649999976
15343	1415	569	0.75
15344	1415	5519	0.100000001
15345	1415	74	0.5
15346	1415	5520	0.949999988
15347	1415	163	0.75
15348	1415	5521	0.949999988
15349	1415	5522	0.75
15350	1415	36	0.5
15351	1415	391	0.5
15352	1415	79	0.5
15353	1415	231	0.75
15354	1415	5523	0.949999988
15355	1415	5524	0.25
15356	1415	1366	0.75
15357	1415	277	0.75
15358	1415	5525	0.100000001
15359	1415	38	0.75
15360	1415	5526	0.100000001
15361	1416	5527	0.5
15362	1416	555	0.300000012
15363	1416	270	0.300000012
15364	1416	5528	0.800000012
15365	1416	2240	0.800000012
15366	1416	5529	0.200000003
15367	1417	5530	0.899999976
15368	1417	5531	0.600000024
15369	1417	10	0.670000017
15370	1417	16	0.330000013
15371	1417	5532	0.899999976
15372	1417	194	0.0500000007
15373	1417	5533	0.0500000007
15374	1417	5534	0.800000012
15375	1417	5535	0.800000012
15376	1417	3599	0.5
15377	1417	5536	0.899999976
15378	1417	5537	0.899999976
15379	1417	5538	0.200000003
15380	1417	5539	0.00999999978
15381	1418	429	0.699999988
15382	1418	83	0.699999988
15383	1418	5540	0.699999988
15384	1418	900	0.699999988
15385	1418	550	0.699999988
15386	1418	5149	0.699999988
15387	1418	250	0.699999988
15388	1418	431	0.699999988
15389	1418	400	0.5
15390	1418	920	0.600000024
15391	1418	5541	0.699999988
15392	1419	235	0.5
15393	1419	37	0.75
15394	1419	618	0.649999976
15395	1419	236	0.5
15396	1419	74	1
15397	1419	6	0.5
15398	1419	36	0.75
15399	1419	2219	0.75
15400	1419	237	0.5
15401	1419	9	0.5
15402	1419	10	0.5
15403	1419	68	0.5
15404	1419	14	0.75
15405	1419	377	0.75
15406	1419	16	0.5
15407	1419	1117	0.75
15408	1419	5542	0.949999988
15409	1419	5543	0.649999976
15410	1420	235	0.5
15411	1420	6	0.5
15412	1420	14	0.100000001
15413	1420	236	0.5
15414	1420	88	0.75
15415	1420	5544	0.75
15416	1420	5545	0.75
15417	1420	109	0.75
15418	1420	237	0.5
15419	1420	250	0.100000001
15420	1420	10	0.5
15421	1420	68	0.5
15422	1420	5546	0.100000001
15423	1420	5547	0.100000001
15424	1420	16	0.5
15425	1420	5548	0.949999988
15426	1420	5549	0.949999988
15427	1420	9	0.5
15428	1421	5550	0.99000001
15429	1421	5551	0.949999988
15430	1421	5552	0.800000012
15431	1421	1424	0.99000001
15432	1421	40	0.899999976
15433	1421	5553	0.800000012
15434	1421	5554	0.800000012
15435	1422	235	0.5
15436	1422	37	0.75
15437	1422	5555	0.949999988
15438	1422	1865	0.75
15439	1422	236	0.5
15440	1422	5556	0.75
15441	1422	6	0.5
15442	1422	1308	0.75
15443	1422	5557	0.25
15444	1422	357	0.75
15445	1422	237	0.5
15446	1422	9	0.5
15447	1422	10	0.5
15448	1422	68	0.5
15449	1422	79	0.75
15450	1422	5558	0.649999976
15451	1422	40	0.75
15452	1422	5559	0.649999976
15453	1422	277	0.100000001
15454	1422	125	0.75
15455	1422	569	0.25
15456	1422	5560	0.100000001
15457	1422	275	0.100000001
15458	1422	5341	0.75
15459	1422	16	0.5
15460	1422	5561	0.949999988
15461	1422	1469	0.649999976
15462	1422	12	0.75
15463	1422	5562	0.649999976
15464	1422	163	0.75
15465	1422	5563	0.949999988
15466	1422	5381	0.75
15467	1422	291	0.75
15468	1422	126	0.75
15469	1422	655	0.75
15470	1422	2529	0.75
15471	1422	2631	0.75
15472	1422	40	0.75
15473	1422	460	0.5
15474	1422	920	0.200000003
15475	1423	235	0.5
15476	1423	5564	0.5
15477	1423	236	0.5
15478	1423	6	0.5
15479	1423	280	0.75
15480	1423	237	0.5
15481	1423	10	0.5
15482	1423	5565	0.5
15483	1423	40	0.75
15484	1423	5566	0.5
15485	1423	5567	0.5
15486	1423	39	0.75
15487	1423	109	0.75
15488	1423	250	0.649999976
15489	1423	5568	0.5
15490	1423	37	0.5
15491	1423	567	0.75
15492	1423	5569	0.5
15493	1423	569	0.5
15494	1423	9	0.5
15495	1423	1465	0.75
15496	1423	68	0.5
15497	1423	79	0.75
15498	1423	275	0.75
15499	1423	16	0.5
15500	1423	277	0.75
15501	1423	40	0.75
15502	1424	16	0.550000012
15503	1424	10	0.449999988
15504	1424	5570	1
15505	1424	37	0.800000012
15506	1424	38	0.800000012
15507	1424	5341	0.800000012
15508	1424	535	0.800000012
15509	1424	107	0.800000012
15510	1424	292	0.800000012
15511	1424	291	0.800000012
15512	1424	277	0.100000001
15513	1424	39	0.100000001
15514	1424	88	0.899999976
15515	1424	163	0.699999988
15516	1424	40	0.699999988
15517	1424	304	0.699999988
15518	1424	5569	0.699999988
15519	1425	2686	0.5
15520	1425	2324	0.800000012
15521	1425	5571	0.800000012
15522	1425	5572	0.699999988
15523	1425	5573	0.5
15524	1425	5574	0.600000024
15525	1425	5575	0.800000012
15526	1425	5576	0.800000012
15527	1425	5577	0.600000024
15528	1425	6	0.400000006
15529	1425	87	0.800000012
15530	1425	5578	0.800000012
15531	1425	280	0.800000012
15532	1425	5579	0.800000012
15533	1425	37	0.800000012
15534	1425	1336	0.5
15535	1426	277	0.899999976
15536	1426	40	0.899999976
15537	1426	5580	0.800000012
15538	1426	109	0.800000012
15539	1426	163	0.699999988
15540	1426	5581	0.800000012
15541	1426	5582	0.800000012
15542	1426	5583	0.200000003
15543	1426	12	0.899999976
15544	1426	5584	0.699999988
15545	1426	8	0.400000006
15546	1427	722	0.800000012
15547	1427	1973	0.899999976
15548	1427	5585	1
15549	1427	5586	0.899999976
15550	1427	10	0.699999988
15551	1427	16	0.300000012
15552	1428	5587	1
15553	1428	5588	1
15554	1428	2133	1
15555	1428	5296	1
15556	1429	235	0.5
15557	1429	10	0.5
15558	1429	236	0.5
15559	1429	5589	0.949999988
15560	1429	6	0.5
15561	1429	237	0.5
15562	1429	290	0.100000001
15563	1429	5590	0.949999988
15564	1429	5591	0.949999988
15565	1429	5592	0.649999976
15566	1429	292	0.75
15567	1429	5593	0.100000001
15568	1429	5594	0.649999976
15569	1429	567	0.75
15570	1429	1515	0.75
15571	1429	36	0.75
15572	1429	9	0.5
15573	1429	68	0.5
15574	1429	88	0.75
15575	1429	5595	0.100000001
15576	1429	107	0.75
15577	1429	16	0.5
15578	1430	427	0.5
15579	1430	37	0.5
15580	1430	395	0.5
15581	1430	82	0.5
15582	1430	5596	0.5
15583	1430	291	0.5
15584	1430	401	0.5
15585	1430	10	0.5
15586	1430	2242	0.5
15587	1430	5597	0.5
15588	1430	6	0.5
15589	1430	16	0.5
15590	1430	9	0.5
15591	1431	37	0.5
15592	1431	53	0.5
15593	1431	5598	0.5
15594	1431	5599	0.25
15595	1431	4017	0.600000024
15596	1431	5600	0.400000006
15597	1431	1664	0.600000024
15598	1431	5601	0.100000001
15599	1431	4928	0.349999994
15600	1431	291	0.5
15601	1431	419	0.5
15602	1432	5602	0.610000014
15603	1432	5603	0.219999999
15604	1432	5604	0.0599999987
15605	1432	5605	0.0500000007
15606	1432	5606	0.0299999993
15607	1433	5607	0.5
15608	1433	6	0.5
15609	1433	434	0.5
15610	1433	9	0.5
15611	1433	3923	0.5
15612	1434	5608	0.5
15613	1434	2544	0.5
15614	1434	5609	0.5
15615	1434	5610	0.5
15616	1434	9	0.5
15617	1434	10	1
15618	1434	704	0.5
15619	1434	2559	0.5
15620	1434	2539	0.5
15621	1434	5611	0.5
15622	1434	35	0.5
15623	1434	127	0.5
15624	1434	16	0
15625	1434	5612	0.5
15626	1435	5613	0.5
15627	1435	641	0.5
15628	1435	597	0.5
15629	1435	9	0.5
15630	1435	10	0.5
15631	1435	5614	0.5
15632	1435	5615	0.5
15633	1435	5616	0.5
15634	1435	5617	0.5
15635	1435	1997	0.5
15636	1435	6	0.5
15637	1435	16	0.5
15638	1435	71	0.5
15639	1435	292	0.5
15640	1436	5618	0.5
15641	1436	89	0.5
15642	1436	37	0.5
15643	1436	9	0.5
15644	1436	426	0.5
15645	1436	108	0.5
15646	1436	16	0.5
15647	1436	1	0.5
15648	1436	82	0.5
15649	1436	2934	0.5
15650	1436	291	0.5
15651	1436	6	0.5
15652	1436	10	0.5
15653	1436	83	0.5
15654	1436	572	0.5
15655	1436	5619	0.5
15656	1436	427	0.5
15657	1437	5620	0.899999976
15658	1437	107	0.400000006
15659	1437	735	0.400000006
15660	1437	5621	0.100000001
15661	1437	568	0.25
15662	1437	5622	0.300000012
15663	1437	5623	0.899999976
15664	1437	5624	0.800000012
15665	1438	5625	1
15666	1439	3985	0.5
15667	1439	5626	0.5
15668	1439	5627	0.5
15669	1439	3690	0.5
15670	1439	5628	0.899999976
15671	1439	5629	0.800000012
15672	1440	105	0.75
15673	1440	5630	0.5
15674	1440	717	0.5
15675	1440	2179	0.5
15676	1440	715	0.5
15677	1440	5631	0.5
15678	1440	5632	0.5
15679	1440	5633	1
15680	1441	1	0.5
15681	1441	9	0.5
15682	1441	10	0.5
15683	1441	68	0.5
15684	1441	16	0.5
15685	1441	6	0.5
15686	1441	715	0.5
15687	1442	5634	0.75
15688	1442	10	0.75
15689	1443	5635	1
15690	1443	53	0.75
15691	1443	277	0.75
15692	1443	522	0.75
15693	1443	1228	0.5
15694	1443	12	0.75
15695	1443	3063	0.25
15696	1443	2526	0.5
15697	1443	5636	0.25
15698	1444	5637	0.930000007
15699	1444	229	0.75999999
15700	1444	77	0.239999995
15701	1444	37	0.379999995
15702	1444	5638	0.360000014
15703	1444	5639	0.140000001
15704	1444	5640	1
15705	1445	292	0.5
15706	1445	681	0.5
15707	1445	1412	0.5
15708	1445	291	0.5
15709	1445	800	0.5
15710	1445	5641	0.25
15711	1445	5642	0.25
15712	1446	5643	1
15713	1446	5644	1
15714	1446	2291	0.800000012
15715	1446	1723	0.800000012
15716	1446	90	0.800000012
15717	1446	68	0.899999976
15718	1448	3865	0.899999976
15719	1448	291	0.899999976
15720	1448	194	0.800000012
15721	1448	525	0.800000012
15722	1448	2862	1
15723	1449	4171	1
15724	1449	2996	1
15725	1449	33	0.699999988
15726	1449	36	0.699999988
15727	1449	14	0.5
15728	1449	427	0.899999976
15729	1450	5645	1
15730	1450	2863	0.600000024
15731	1450	2862	0.600000024
15732	1450	291	0.800000012
15733	1450	522	0.800000012
15734	1450	4156	0.800000012
15735	1450	10	1
15736	1450	16	0
15737	1450	445	0.800000012
15738	1450	5646	0.800000012
15739	1450	5647	0.600000024
15740	1450	19	0.300000012
15741	1450	13	0.300000012
15742	1451	3647	1
15743	1451	5648	1
15744	1451	16	0.600000024
15745	1451	10	0.400000006
15746	1451	5649	0.5
15747	1451	4463	0.5
15748	1451	3975	0.600000024
15749	1451	359	0.800000012
15750	1451	5650	0.899999976
15751	1451	5651	0.899999976
15752	1451	5652	0.899999976
15753	1451	2463	0.899999976
15754	1451	5653	0.899999976
15755	1451	5654	0.300000012
15756	1451	5655	0.5
15757	1451	5656	0.5
15758	1451	2817	0.5
15759	1451	3043	0.400000006
15760	1451	5657	0.400000006
15761	1451	2471	0.400000006
15762	1451	5658	0.899999976
15763	1452	434	0.5
15764	1452	9	0.5
15765	1452	10	1
15766	1452	3923	0.5
15767	1452	1	0.5
15768	1452	1430	1
15769	1452	35	0.5
15770	1452	474	0.5
15771	1452	16	0
15772	1452	473	0.5
15773	1453	5659	0.5
15774	1453	2661	0.400000006
15775	1453	7	0.400000006
15776	1453	5660	0.300000012
15777	1453	5661	0.400000006
15778	1453	5662	0.100000001
15779	1454	5663	1
15780	1454	5664	1
15781	1454	4330	0.5
15782	1454	3563	0.200000003
15783	1454	5665	0.300000012
15784	1454	5666	0.600000024
15785	1454	5667	0.600000024
15786	1454	5668	0.400000006
15787	1454	5669	0.300000012
15788	1454	5670	0.5
15789	1454	3082	0.200000003
15790	1454	16	1
15791	1454	10	0
15792	1455	1973	1
15793	1455	14	0.800000012
15794	1455	395	0.800000012
15795	1455	291	0.800000012
15796	1455	680	0.800000012
15797	1455	37	0.800000012
15798	1455	82	0.800000012
15799	1455	489	0.800000012
15800	1455	33	0.800000012
15801	1455	36	0.699999988
15802	1455	74	0.800000012
15803	1455	292	0.800000012
15804	1455	441	0.800000012
15805	1455	5671	0.5
15806	1455	3507	0.800000012
15807	1455	8	0.600000024
15808	1455	2691	0.600000024
15809	1455	5672	0.699999988
15810	1455	10	0.699999988
15811	1455	16	0.300000012
15812	1456	6	0.800000012
15813	1456	5673	0.800000012
15814	1456	5674	0.800000012
15815	1456	5675	0.0500000007
15816	1456	5676	0.899999976
15817	1456	5677	0.899999976
15818	1456	5678	0.800000012
15819	1456	857	0.800000012
15820	1456	5679	0.5
15821	1456	5680	0.5
15822	1456	292	0.800000012
15823	1456	36	0.300000012
15824	1456	5681	0.600000024
15825	1456	3765	1
15826	1456	5682	0.99000001
15827	1456	10	0.899999976
15828	1456	16	0.100000001
15829	1457	722	0.25
15830	1457	291	0.649999976
15831	1457	71	0.550000012
15832	1457	5683	0.150000006
15833	1457	76	0.200000003
15834	1457	3507	0.200000003
15835	1457	105	0.150000006
15836	1457	77	0.100000001
15837	1457	5684	0.100000001
15838	1457	5685	0.5
15839	1457	1512	0.5
15840	1457	1238	0.699999988
15841	1457	5686	0.00999999978
15842	1457	5687	0.100000001
15843	1457	720	0.100000001
15844	1457	715	0.100000001
15845	1457	714	0.100000001
15846	1457	1877	1
15847	1457	5688	0.899999976
15848	1457	5689	0.800000012
15849	1457	10	0.870000005
15850	1457	16	0.129999995
15851	1458	434	0.899999976
15852	1458	1567	0.5
15853	1458	5690	0.899999976
15854	1458	5691	0.899999976
15855	1458	5692	0.5
15856	1458	2021	0.25
15857	1458	5693	1
15858	1459	5694	0.200000003
15859	1459	5695	0.5
15860	1459	5696	0.100000001
15861	1459	434	0.25
15862	1459	2018	0.5
15863	1459	2540	0.5
15864	1459	3522	0.5
15865	1459	550	0.899999976
15866	1460	5697	0.75
15867	1460	5698	0.75
15868	1460	972	0.100000001
15869	1460	5699	0.5
15870	1461	1048	0.5
15871	1461	395	0.5
15872	1461	6	0.5
15873	1461	5700	0.5
15874	1461	5701	0.5
15875	1461	9	0.5
15876	1461	68	0.5
15877	1461	1308	0.5
15878	1461	126	0.5
15879	1461	5702	0.5
15880	1461	5703	0.5
15881	1461	1618	0.5
15882	1461	125	0.5
15883	1461	5704	0.5
15884	1462	5705	0.899999976
15885	1462	2705	0.899999976
15886	1462	5706	0.99000001
15887	1462	1768	0.5
15888	1462	90	0.5
15889	1462	5707	0.5
15890	1462	1729	0.5
15891	1462	5708	0.670000017
15892	1462	644	0.5
15893	1462	5709	0.5
15894	1462	5710	0.899999976
15895	1462	801	0.5
15896	1462	489	0.370000005
15897	1462	1127	0.330000013
15898	1462	5711	0.330000013
15899	1463	291	0.75
15900	1463	1055	0.74000001
15901	1463	1807	0.680000007
15902	1463	229	0.670000017
15903	1463	644	0.660000026
15904	1463	249	0.469999999
15905	1463	5712	0.5
15906	1463	2457	0.5
15907	1463	2848	0.5
15908	1463	2133	0.5
15909	1463	4487	0.5
15910	1463	2505	0.5
15911	1463	2849	0.899999976
15912	1463	5621	0.75
15913	1463	5713	0.300000012
15914	1463	2507	0.699999988
15915	1463	600	0.100000001
15916	1463	5714	0.25
15917	1463	2117	0.810000002
15918	1464	5715	1
15919	1464	15	0.5
15920	1464	5716	0.5
15921	1464	5717	0.5
15922	1464	5718	0.5
15923	1464	422	0.180000007
15924	1465	502	0.5
15925	1465	1	0.5
15926	1465	37	0.5
15927	1465	9	0.5
15928	1465	10	0
15929	1465	94	0.5
15930	1465	16	1
15931	1465	98	0.5
15932	1465	6	0.5
15933	1466	235	0.5
15934	1466	181	0.75
15935	1466	236	0.5
15936	1466	6	0.5
15937	1466	181	0.75
15938	1466	237	0.5
15939	1466	5719	0.75
15940	1466	10	0.5
15941	1466	2580	0.75
15942	1466	5720	0.100000001
15943	1466	1462	0.75
15944	1466	5183	0.25
15945	1466	5721	0.949999988
15946	1466	5722	0.75
15947	1466	5723	0.949999988
15948	1466	9	0.5
15949	1466	68	0.5
15950	1466	125	0.75
15951	1466	1253	0.949999988
15952	1466	5724	0.75
15953	1466	16	0.5
15954	1467	235	0.5
15955	1467	5333	0.100000001
15956	1467	257	0.5
15957	1467	236	0.5
15958	1467	6	0.5
15959	1467	5335	0.949999988
15960	1467	237	0.5
15961	1467	9	0.5
15962	1467	10	0.5
15963	1467	68	0.5
15964	1467	5725	0.75
15965	1467	5726	1
15966	1467	5727	1
15967	1467	16	0.5
15968	1468	37	1
15969	1468	5728	0.100000001
15970	1468	5729	0.100000001
15971	1468	5730	0.100000001
15972	1468	4268	0.100000001
15973	1468	5731	0.100000001
15974	1468	5732	0.100000001
15975	1468	250	1
15976	1468	8	1
15977	1469	1299	0.75
15978	1469	37	1
15979	1470	5733	0.899999976
15980	1470	5734	0.75
15981	1470	5735	0.5
15982	1471	1	0.5
15983	1471	16	0.5
15984	1471	9	0.5
15985	1471	10	0.5
15986	1471	68	0.5
15987	1471	5736	0.5
15988	1471	5737	0.5
15989	1471	425	0.5
15990	1472	5738	1
15991	1472	5739	0.899999976
15992	1472	597	0.25
15993	1472	5740	0.75
15994	1472	5741	0.899999976
15995	1472	71	0.25
15996	1472	5742	0.5
15997	1473	5743	0.850000024
15998	1473	5744	0.5
15999	1473	5745	0.5
16000	1473	5746	0.400000006
16001	1473	5747	0.5
16002	1473	5748	0.5
16003	1473	5749	0.5
16004	1473	5183	0.5
16005	1473	5750	0.5
16006	1473	5751	0.800000012
16007	1474	5752	0.75
16008	1474	5753	0.0399999991
16009	1475	5754	0.949999988
16010	1475	5755	0.949999988
16011	1475	16	0.670000017
16012	1475	10	0.330000013
16013	1475	1050	0.600000024
16014	1475	5756	0.600000024
16015	1475	71	0.600000024
16016	1475	5757	0.400000006
16017	1475	5758	0.699999988
16018	1475	5759	0.600000024
16019	1476	5760	0.5
16020	1476	5761	0.5
16021	1476	6	0.5
16022	1476	10	0.5
16023	1476	40	0.5
16024	1476	1	0.5
16025	1476	79	0.5
16026	1476	21	0.5
16027	1476	109	0.5
16028	1476	12	0.5
16029	1476	163	0.5
16030	1476	37	0.5
16031	1476	447	0.5
16032	1476	5762	0.5
16033	1476	277	0.5
16034	1476	9	0.5
16035	1476	68	0.100000001
16036	1476	5763	0.5
16037	1476	5764	0.5
16038	1476	5765	0.5
16039	1476	275	0.5
16040	1476	5766	0.5
16041	1476	421	0.5
16042	1476	5767	0.5
16043	1476	127	0.5
16044	1476	16	0.5
16045	1476	40	0.75
16046	1476	445	0.75
16047	1477	5768	0.949999988
16048	1477	5769	0.5
16049	1477	5770	0.5
16050	1477	5771	0.5
16051	1477	5772	0.5
16052	1477	16	0.699999988
16053	1477	10	0.300000012
16054	1477	5570	1
16055	1477	531	1
16056	1478	16	0.550000012
16057	1478	10	0.449999988
16058	1478	722	0.600000024
16059	1478	109	0.839999974
16060	1478	163	0.600000024
16061	1478	40	0.600000024
16062	1478	79	0.5
16063	1478	275	0.300000012
16064	1478	1683	0.5
16065	1478	5773	0.400000006
16066	1479	997	0.699999988
16067	1479	2255	0.600000024
16068	1479	5657	0.5
16069	1479	5774	0.200000003
16070	1479	5775	0.100000001
16071	1479	3450	0.0500000007
16072	1479	722	0.699999988
16073	1480	16	0.5
16074	1480	10	0.5
16075	1480	2255	0.800000012
16076	1480	5776	0.200000003
16077	1480	3450	0.200000003
16078	1480	722	0.800000012
16079	1480	460	0.200000003
16080	1480	21	0.0500000007
16081	1480	277	0.0500000007
16082	1480	421	0.200000003
16083	1480	5777	0.100000001
16084	1480	5778	0.800000012
16085	1480	5779	0.800000012
16086	1480	5780	0.699999988
16087	1481	235	0.5
16088	1481	3	0.949999988
16089	1481	14	0.5
16090	1481	236	0.5
16091	1481	6	0.5
16092	1481	95	1
16093	1481	2617	0.5
16094	1481	237	0.5
16095	1481	10	0.5
16096	1481	94	1
16097	1481	5290	0.75
16098	1481	2618	0.5
16099	1481	5781	0.75
16100	1481	329	0.649999976
16101	1481	292	0.75
16102	1481	2619	1
16103	1481	37	0.100000001
16104	1481	39	0.75
16105	1481	2620	0.5
16106	1481	36	0.75
16107	1481	441	0.75
16108	1481	53	0.75
16109	1481	9	0.5
16110	1481	68	0.5
16111	1481	33	0.75
16112	1481	1507	0.75
16113	1481	16	0.5
16114	1482	1	0.5
16115	1482	9	0.5
16116	1482	5782	0.5
16117	1482	68	0.5
16118	1482	781	0.5
16119	1482	16	0.5
16120	1482	6	0.5
16121	1482	5783	0.5
16122	1482	5784	0.5
16123	1483	235	0.5
16124	1483	5785	0.75
16125	1483	5786	0.75
16126	1483	236	0.5
16127	1483	250	0.75
16128	1483	5787	0.75
16129	1483	237	0.5
16130	1483	10	0.5
16131	1483	735	0.75
16132	1483	5788	0.75
16133	1483	37	0.75
16134	1483	736	0.75
16135	1483	257	0.100000001
16136	1483	5789	0.75
16137	1483	6	0.5
16138	1483	68	0.5
16139	1483	2009	0.75
16140	1483	247	0.5
16141	1483	16	0.5
16142	1483	3584	0.100000001
16143	1483	9	0.5
16144	1483	126	0.75
16145	1484	722	0.150000006
16146	1484	5790	0.800000012
16147	1484	2975	0.600000024
16148	1484	37	0.800000012
16149	1484	3	0.800000012
16150	1484	5791	0.699999988
16151	1484	42	0.800000012
16152	1484	3975	0.800000012
16153	1484	4463	0.800000012
16154	1484	5792	0.899999976
16155	1485	5793	1
16156	1485	555	0.670000017
16157	1485	5794	0.25
16158	1485	79	0.699999988
16159	1485	277	0.699999988
16160	1485	40	0.699999988
16161	1485	37	0.699999988
16162	1486	235	0.5
16163	1486	1827	0.5
16164	1486	6	0.5
16165	1486	5795	0.5
16166	1486	9	0.5
16167	1486	10	0.5
16168	1486	68	0.5
16169	1486	422	0.5
16170	1486	1	0.5
16171	1486	5796	0.5
16172	1486	536	0.5
16173	1486	16	0.5
16174	1487	235	0.5
16175	1487	600	0.100000001
16176	1487	9	0.5
16177	1487	236	0.5
16178	1487	1539	0.75
16179	1487	5157	0.100000001
16180	1487	250	0.25
16181	1487	107	0.75
16182	1487	1539	0.75
16183	1487	5797	0.75
16184	1487	237	0.5
16185	1487	6	0.5
16186	1487	10	0.5
16187	1487	68	0.5
16188	1487	5798	0.100000001
16189	1487	79	0.75
16190	1487	5797	0.75
16191	1487	16	0.5
16192	1487	568	0.100000001
16193	1487	5799	0.100000001
16194	1487	291	0.75
16195	1487	2635	0.100000001
16196	1487	5800	0.949999988
16197	1487	400	0.5
16198	1487	276	0.5
16199	1487	1299	0.5
16200	1487	3482	0.25
16201	1487	635	0.649999976
16202	1487	5801	0.949999988
16203	1487	1054	0.100000001
16204	1487	292	0.75
16205	1488	235	0.5
16206	1488	3237	0.75
16207	1488	5802	0.75
16208	1488	236	0.5
16209	1488	5803	0.75
16210	1488	6	0.5
16211	1488	237	0.5
16212	1488	10	0.5
16213	1488	5804	0.75
16214	1488	422	0.75
16215	1488	5805	0.100000001
16216	1488	5806	1
16217	1488	5807	0.75
16218	1488	5808	0.75
16219	1488	5809	1
16220	1488	5810	0.949999988
16221	1488	37	0.75
16222	1488	547	0.75
16223	1488	5811	0.949999988
16224	1488	9	0.5
16225	1488	68	0.5
16226	1488	162	0.75
16227	1488	5812	0.949999988
16228	1488	5813	1
16229	1488	5814	0.75
16230	1488	500	0.75
16231	1488	5815	1
16232	1488	5816	0.75
16233	1488	16	0.5
16234	1488	5817	0.75
16235	1489	4462	1
16236	1489	5818	0.800000012
16237	1489	838	0.800000012
16238	1489	33	0.800000012
16239	1489	36	0.800000012
16240	1489	427	0.800000012
16241	1489	74	0.800000012
16242	1489	821	0.699999988
16243	1489	37	0.699999988
16244	1489	5819	0.899999976
16245	1489	5820	0.00999999978
16246	1490	16	0.579999983
16247	1490	10	0.419999987
16248	1490	5821	0.899999976
16249	1490	722	0.5
16250	1490	115	0.5
16251	1490	5822	0.5
16252	1491	5823	1
16253	1492	5824	1
16254	1492	5825	0.5
16255	1492	5826	0.5
16256	1492	5827	0.5
16257	1492	5828	0.5
16258	1493	235	0.5
16259	1493	5829	0.949999988
16260	1493	236	0.5
16261	1493	6	0.5
16262	1493	1127	0.75
16263	1493	237	0.5
16264	1493	10	0.5
16265	1493	5395	1
16266	1493	5830	0.75
16267	1493	5831	0.75
16268	1493	37	0.75
16269	1493	39	0.75
16270	1493	597	0.100000001
16271	1493	9	0.5
16272	1493	68	0.5
16273	1493	5832	0.75
16274	1493	5833	0.75
16275	1493	419	0.100000001
16276	1493	1545	0.75
16277	1493	107	0.75
16278	1493	1366	0.75
16279	1493	5834	1
16280	1493	5835	1
16281	1493	16	0.5
16282	1494	235	0.5
16283	1494	5829	0.949999988
16284	1494	236	0.5
16285	1494	6	0.5
16286	1494	1127	0.75
16287	1494	237	0.5
16288	1494	10	0.5
16289	1494	5395	1
16290	1494	5836	0.75
16291	1494	5830	0.75
16292	1494	5837	0.75
16293	1494	735	0.75
16294	1494	5834	1
16295	1494	5838	0.75
16296	1494	37	0.75
16297	1494	5839	0.75
16298	1494	39	0.75
16299	1494	597	0.75
16300	1494	9	0.5
16301	1494	68	0.5
16302	1494	5832	0.75
16303	1494	5840	0.75
16304	1494	419	0.75
16305	1494	1545	0.75
16306	1494	107	0.75
16307	1494	1366	0.75
16308	1494	5841	0.75
16309	1494	5835	1
16310	1494	16	0.5
16311	1495	1	0.5
16312	1495	16	0.5
16313	1495	35	0.5
16314	1495	10	0.5
16315	1495	5842	0.5
16316	1495	68	0.5
16317	1495	6	0.5
16318	1495	9	0.5
16319	1496	348	0.5
16320	1496	5843	0.5
16321	1496	5844	0.5
16322	1496	5845	0.5
16323	1496	9	0.5
16324	1496	95	0.5
16325	1496	5846	0.5
16326	1496	5847	0.5
16327	1496	507	0.5
16328	1496	5848	0.5
16329	1496	2523	0.5
16330	1496	94	0.5
16331	1496	401	0.5
16332	1496	600	0.100000001
16333	1496	6	0.5
16334	1496	10	0.5
16335	1496	68	0.5
16336	1496	5849	0.5
16337	1496	5850	0.5
16338	1496	5851	0.5
16339	1496	5852	0.5
16340	1496	5853	0.5
16341	1496	1	0.5
16342	1496	2535	0.5
16343	1496	5854	0.5
16344	1496	1054	0.5
16345	1496	425	0.5
16346	1496	536	0.5
16347	1496	277	0.100000001
16348	1496	4906	0.100000001
16349	1496	1384	0.5
16350	1496	1068	0.5
16351	1496	5855	0.5
16352	1496	16	0.5
16353	1496	5856	0.5
16354	1496	5749	0.5
16355	1496	5857	0.5
16356	1497	5858	0.75
16357	1497	37	0.5
16358	1497	53	0.5
16359	1497	5859	0.5
16360	1497	5860	0.5
16361	1498	5861	0.5
16362	1498	5862	0.75
16363	1498	5863	0.5
16364	1498	71	0.5
16365	1499	5864	1
16366	1499	5865	0.75
16367	1499	3905	0.5
16368	1499	5866	0.5
16369	1499	5867	0.5
16370	1499	5868	0.5
16371	1499	5869	0.5
16372	1500	5870	0.899999976
16373	1500	5871	0.75
16374	1500	5872	0.75
16375	1500	5749	0.899999976
16376	1500	5873	0.5
16377	1500	5750	0.25
16378	1500	5874	0.300000012
16379	1501	235	0.5
16380	1501	37	0.75
16381	1501	9	0.5
16382	1501	10	0.5
16383	1501	39	0.75
16384	1501	14	0.75
16385	1501	1515	0.5
16386	1501	236	0.5
16387	1501	324	0.75
16388	1501	6	0.5
16389	1501	851	0.25
16390	1501	237	0.5
16391	1501	416	0.75
16392	1501	290	0.75
16393	1501	68	0.5
16394	1501	162	0.25
16395	1501	5875	0.949999988
16396	1501	561	0.25
16397	1501	619	0.25
16398	1501	422	0.25
16399	1501	79	0.75
16400	1501	862	0.5
16401	1501	569	0.5
16402	1501	107	0.75
16403	1501	76	0.75
16404	1501	3268	0.75
16405	1501	1545	0.75
16406	1501	5876	0.75
16407	1501	257	0.5
16408	1501	536	0.75
16409	1501	1084	0.25
16410	1501	400	0.75
16411	1501	5877	0.949999988
16412	1501	3300	0.5
16413	1501	16	0.5
16414	1501	77	0.5
16415	1501	5878	0.949999988
16416	1501	105	0.75
16417	1501	292	0.75
16418	1501	1422	0.25
16419	1502	37	0.25
16420	1502	53	0.25
16421	1502	33	0.25
16422	1502	14	0.25
16423	1502	82	0.25
16424	1502	429	0.25
16425	1502	107	0.25
16426	1502	419	0.25
16427	1502	5879	0.899999976
16428	1502	5880	0.75
16429	1502	5881	0.75
16430	1502	36	0.25
16431	1503	70	0.5
16432	1503	5882	0.5
16433	1503	1	0.5
16434	1503	971	0.5
16435	1503	5883	0.5
16436	1503	5884	0.5
16437	1503	5885	0.5
16438	1503	597	0.5
16439	1503	6	0.5
16440	1503	9	0.5
16441	1503	5886	0.5
16442	1503	4906	0.5
16443	1503	4019	0.5
16444	1503	5887	0.5
16445	1503	88	0.5
16446	1503	2876	0.5
16447	1503	35	0.5
16448	1504	37	0.75
16449	1504	5888	0.75
16450	1504	398	0.5
16451	1504	291	0.5
16452	1504	441	0.5
16453	1504	427	0.379999995
16454	1504	5889	0.75
16455	1504	1012	0.899999976
16456	1504	5890	0.5
16457	1504	5891	0.5
16458	1504	5892	0.899999976
16459	1505	5893	1
16460	1506	5894	0.75
16461	1506	5895	0.75
16462	1506	5896	0.75
16463	1506	5696	0.289999992
16464	1506	5897	0.409999996
16465	1507	5898	0.75
16466	1507	5899	0.5
16467	1507	5900	0.25
16468	1507	5901	0.25
16469	1507	5902	0.5
16470	1507	5903	0.5
16471	1507	5904	0.5
16472	1508	37	0.699999988
16473	1508	365	0.699999988
16474	1508	79	0.699999988
16475	1508	53	0.699999988
16476	1508	2066	0.600000024
16477	1508	599	0.600000024
16478	1508	74	0.5
16479	1508	1294	0.600000024
16480	1508	5905	0.600000024
16481	1508	5906	0.800000012
16482	1509	2490	0.400000006
16483	1509	1409	0.400000006
16484	1509	5907	0.899999976
16485	1509	5908	0.800000012
16486	1509	5909	0.800000012
16487	1509	5910	0.949999988
16488	1510	2250	1
16489	1511	2342	0.899999976
16490	1511	5911	0.600000024
16491	1511	421	0.600000024
16492	1511	2250	0.600000024
16493	1511	42	0.600000024
16494	1511	5912	0.600000024
16495	1511	1278	1
16496	1511	5913	0.600000024
16497	1511	163	0.600000024
16498	1511	40	0.699999988
16499	1511	357	0.800000012
16500	1511	5914	0.800000012
16501	1511	5915	0.899999976
16502	1512	235	1
16503	1512	236	0.5
16504	1512	6	0.25
16505	1512	4801	0.75
16506	1512	237	0.5
16507	1512	10	0.5
16508	1512	1364	0.25
16509	1512	4386	0.5
16510	1512	40	0.75
16511	1512	422	0.25
16512	1512	5916	0.75
16513	1512	393	0.100000001
16514	1512	3482	0.649999976
16515	1512	163	0.75
16516	1512	37	0.75
16517	1512	567	0.75
16518	1512	421	0.100000001
16519	1512	9	0.100000001
16520	1512	68	0.75
16521	1512	79	0.75
16522	1512	1520	0.75
16523	1512	5917	0.75
16524	1512	661	0.75
16525	1512	1336	0.75
16526	1512	555	0.75
16527	1512	5918	0.5
16528	1512	16	0.5
16529	1512	2876	0.100000001
16530	1512	5468	0.100000001
16531	1513	422	0.75
16532	1513	235	0.5
16533	1513	37	0.75
16534	1513	10	0.5
16535	1513	1520	0.75
16536	1513	1864	0.75
16537	1513	599	0.75
16538	1513	236	0.5
16539	1513	6	0.5
16540	1513	535	0.75
16541	1513	555	0.75
16542	1513	237	0.5
16543	1513	9	0.5
16544	1513	3288	0.75
16545	1513	68	0.5
16546	1513	5919	0.949999988
16547	1513	16	0.5
16548	1513	5920	0.100000001
16549	1513	2876	0.75
16550	1514	235	0.5
16551	1514	37	0.75
16552	1514	304	0.75
16553	1514	1865	0.75
16554	1514	236	0.5
16555	1514	6	0.5
16556	1514	555	0.75
16557	1514	536	0.75
16558	1514	357	0.649999976
16559	1514	237	0.5
16560	1514	9	0.5
16561	1514	10	0.5
16562	1514	68	0.5
16563	1514	1332	0.649999976
16564	1514	365	0.75
16565	1514	79	0.75
16566	1514	16	0.5
16567	1514	40	0.75
16568	1515	235	0.5
16569	1515	37	0.75
16570	1515	5921	0.75
16571	1515	5922	0.75
16572	1515	5467	0.75
16573	1515	236	0.5
16574	1515	5923	0.5
16575	1515	6	0.5
16576	1515	4386	0.75
16577	1515	1520	0.75
16578	1515	237	0.5
16579	1515	9	0.5
16580	1515	10	0.5
16581	1515	68	0.5
16582	1515	5924	0.949999988
16583	1515	5918	0.75
16584	1515	79	0.5
16585	1515	5925	0.100000001
16586	1515	16	0.5
16587	1516	235	0.5
16588	1516	37	0.75
16589	1516	5921	0.5
16590	1516	5919	0.949999988
16591	1516	4562	0.75
16592	1516	5920	0.100000001
16593	1516	236	0.5
16594	1516	6	0.5
16595	1516	357	0.5
16596	1516	237	0.5
16597	1516	9	0.5
16598	1516	10	0.5
16599	1516	68	0.5
16600	1516	365	0.75
16601	1516	79	0.75
16602	1516	163	0.5
16603	1516	16	0.5
16604	1517	5926	1
16605	1517	1430	1
16606	1517	10	1
16607	1517	16	0
16608	1517	5927	0.5
16609	1518	5928	0.899999976
16610	1518	5929	0.899999976
16611	1518	5296	0.800000012
16612	1519	5930	0.899999976
16613	1519	5931	0.699999988
16614	1519	1044	0.899999976
16615	1519	247	0.699999988
16616	1519	5932	0.600000024
16617	1519	3420	0.899999976
16618	1519	5933	0.600000024
16619	1520	235	0.5
16620	1520	16	0.5
16621	1520	9	0.5
16622	1520	1770	0.5
16623	1520	10	0.5
16624	1520	5934	0.5
16625	1520	68	0.5
16626	1520	6	0.5
16627	1521	5935	0.800000012
16628	1521	892	0.899999976
16629	1521	1048	0.899999976
16630	1521	1588	0.899999976
16631	1521	4290	0.800000012
16632	1521	5936	0.800000012
16633	1521	5937	0.899999976
16634	1522	2342	1
16635	1522	5938	0.5
16636	1522	5939	0.300000012
16637	1522	809	0.300000012
16638	1522	2379	0.800000012
16639	1523	16	0.5
16640	1523	10	0.5
16641	1523	9	0.899999976
16642	1523	5940	0.800000012
16643	1523	722	0.600000024
16644	1523	5930	0.600000024
16645	1523	1044	0.600000024
16646	1523	5941	0.5
16647	1524	5942	1
16648	1524	5943	1
16649	1525	5944	0.75
16650	1525	5945	0.75
16651	1525	5946	0.75
16652	1526	5947	1
16653	1527	88	0.839999974
16654	1527	37	0.639999986
16655	1527	426	0.639999986
16656	1527	5948	0.550000012
16657	1527	5949	0.370000005
16658	1527	356	0.25
16659	1527	354	0.25
16660	1527	529	0.25
16661	1527	4541	0.25
16662	1527	259	0.25
16663	1529	5950	1
16664	1529	5951	0.5
16665	1529	4018	0.5
16666	1529	5952	0.5
16667	1529	5953	0.5
16668	1529	10	1
16669	1529	16	0
16670	1529	5954	0.899999976
16671	1529	5955	0.99000001
16672	1529	5956	0.25
16673	1529	5957	1
16674	1529	48	0.970000029
16675	1529	5958	0.629999995
16676	1529	3904	0.589999974
16677	1529	5959	0.340000004
16678	1529	5960	0.75
16679	1529	1729	0.439999998
16680	1529	5961	0.629999995
16681	1529	2693	0.409999996
16682	1529	5962	1
16683	1530	422	0.75
16684	1530	235	0.75
16685	1530	5594	0.75
16686	1530	499	0.75
16687	1530	5711	0.75
16688	1530	68	0.75
16689	1530	236	0.5
16690	1530	6	0.100000001
16691	1530	1127	0.75
16692	1530	4185	0.75
16693	1530	37	0
16694	1530	237	0.5
16695	1530	9	0.100000001
16696	1530	10	0.5
16697	1530	1364	0.75
16698	1530	162	0.75
16699	1530	3224	0.75
16700	1530	36	0.75
16701	1530	522	0.75
16702	1530	5963	0.75
16703	1530	16	0.5
16704	1530	802	0.75
16705	1530	5964	0.75
16706	1530	76	0.5
16707	1530	5965	0.75
16708	1530	5966	0.75
16709	1530	74	0.75
16710	1530	500	0.75
16711	1530	1131	0.75
16712	1530	12	0.75
16713	1530	77	0
16714	1530	163	0.75
16715	1531	5967	0.899999976
16716	1531	1303	1
16717	1531	77	0.5
16718	1531	398	0.5
16719	1531	5968	0.25
16720	1532	235	0.5
16721	1532	5969	0.75
16722	1532	419	0.75
16723	1532	236	0.5
16724	1532	6	0.5
16725	1532	3453	0.75
16726	1532	237	0.5
16727	1532	10	0.5
16728	1532	5970	0.75
16729	1532	2683	0.75
16730	1532	635	0.649999976
16731	1532	1012	0.649999976
16732	1532	5971	0.75
16733	1532	37	0.75
16734	1532	1008	0.75
16735	1532	597	0.75
16736	1532	9	0.5
16737	1532	250	0.649999976
16738	1532	68	0.5
16739	1532	5972	0.75
16740	1532	16	0.5
16741	1534	597	0.75
16742	1534	5973	0.75
16743	1534	2523	0.5
16744	1534	37	0.5
16745	1534	53	0.75
16746	1534	427	0.75
16747	1534	82	0.75
16748	1534	425	0.75
16749	1535	1597	0.899999976
16750	1535	5974	0.5
16751	1535	5975	0.5
16752	1536	5621	0.5
16753	1536	5976	0.5
16754	1536	5977	0.25
16755	1536	5978	0.25
16756	1536	4004	0.100000001
16757	1536	5979	0.319999993
16758	1537	5980	0.899999976
16759	1537	1597	0.899999976
16760	1537	5981	0.75
16761	1537	5982	0.25
16762	1537	5983	0.899999976
16763	1537	5984	0.400000006
16764	1537	5985	0.200000003
16765	1537	5986	0.25
16766	1538	13	0.800000012
16767	1538	125	0.800000012
16768	1538	292	0.800000012
16769	1538	33	0.800000012
16770	1538	37	0.800000012
16771	1538	499	0.800000012
16772	1538	2528	0.800000012
16773	1538	261	0.800000012
16774	1538	5987	0.800000012
16775	1538	365	0.800000012
16776	1538	397	0.800000012
16777	1538	5676	0.800000012
16778	1538	972	0.800000012
16779	1538	809	0.600000024
16780	1538	15	0.600000024
16781	1538	5988	0.800000012
16782	1538	5989	0.800000012
16783	1538	5130	0.800000012
16784	1538	1197	0.800000012
16785	1538	851	0.800000012
16786	1539	5990	0.899999976
16787	1539	5991	1
16788	1539	5992	1
16789	1540	5993	0.5
16790	1540	235	0.5
16791	1540	5994	0.5
16792	1540	5995	0.949999988
16793	1540	236	0.5
16794	1540	5996	0.5
16795	1540	5997	0.75
16796	1540	5998	0.75
16797	1540	5999	0.75
16798	1540	6000	0.75
16799	1540	237	0.5
16800	1540	6	0.5
16801	1540	10	0.5
16802	1540	68	0.5
16803	1540	365	0.75
16804	1540	16	0.5
16805	1540	6001	0.949999988
16806	1540	9	0.5
16807	1541	6002	0.699999988
16808	1541	6003	0.150000006
16809	1541	6004	0.600000024
16810	1541	397	0.600000024
16811	1541	365	0.600000024
16812	1541	404	0.600000024
16813	1541	79	0.600000024
16814	1541	6005	0.5
16815	1541	863	0.100000001
16816	1541	324	0.100000001
16817	1541	6006	0.800000012
16818	1541	6007	0.800000012
16819	1541	6008	0.800000012
16820	1542	6009	0.899999976
16821	1542	6010	0.800000012
16822	1542	6011	0.800000012
16823	1542	6012	0.899999976
16824	1542	303	0.899999976
16825	1542	37	0.800000012
16826	1542	292	0.800000012
16827	1542	401	0.800000012
16828	1542	71	0.800000012
16829	1542	6013	0.699999988
16830	1542	257	0.699999988
16831	1542	640	0.600000024
16832	1542	6014	0.5
16833	1542	83	0.5
16834	1542	644	0.400000006
16835	1542	1844	0.400000006
16836	1542	547	0.400000006
16837	1542	2694	0.400000006
16838	1542	395	0.400000006
16839	1542	845	0.300000012
16840	1543	235	0.5
16841	1543	16	0.5
16842	1543	6015	0.949999988
16843	1543	236	0.5
16844	1543	6	0.5
16845	1543	1308	0.75
16846	1543	1539	0.5
16847	1543	237	0.5
16848	1543	9	0.5
16849	1543	10	0.5
16850	1543	68	0.5
16851	1543	6016	0.75
16852	1543	5797	0.5
16853	1543	125	0.75
16854	1543	6017	0.949999988
16855	1543	126	0.5
16856	1544	6018	0.699999988
16857	1544	6019	0.699999988
16858	1544	6020	0.600000024
16859	1544	6021	0.600000024
16860	1544	6022	0.600000024
16861	1544	6023	0.600000024
16862	1544	6024	0.600000024
16863	1544	6025	0.600000024
16864	1544	6026	0.5
16865	1544	4017	0.5
16866	1544	83	0.5
16867	1544	291	0.5
16868	1544	3618	0.899999976
16869	1544	1430	0.300000012
16870	1544	63	0.300000012
16871	1544	2686	0.5
16872	1545	3033	0.899999976
16873	1545	6027	0.899999976
16874	1545	6028	1
16875	1545	6029	0.699999988
16876	1545	6030	0.5
16877	1546	235	0.5
16878	1546	6031	0.949999988
16879	1546	68	0.5
16880	1546	236	0.5
16881	1546	6	0.5
16882	1546	237	0.5
16883	1546	10	0.5
16884	1546	6032	0.75
16885	1546	6033	0.949999988
16886	1546	6034	0.100000001
16887	1546	6035	0.75
16888	1546	6036	0.75
16889	1546	6037	0.75
16890	1546	292	0.75
16891	1546	324	0.75
16892	1546	37	0.75
16893	1546	43	0.5
16894	1546	6038	0.100000001
16895	1546	9	0.5
16896	1546	6039	0.100000001
16897	1546	79	0.75
16898	1546	3977	0.25
16899	1546	38	0.75
16900	1546	6040	0.949999988
16901	1546	107	0.75
16902	1546	16	0.5
16903	1547	6041	0.949999988
16904	1547	6042	0.800000012
16905	1547	6043	0.800000012
16906	1547	37	0.800000012
16907	1547	38	0.800000012
16908	1547	395	0.800000012
16909	1547	257	0.800000012
16910	1547	6044	0.800000012
16911	1547	1842	0.800000012
16912	1547	6045	0.800000012
16913	1548	425	0.899999976
16914	1548	292	0.600000024
16915	1548	3674	0.699999988
16916	1548	630	0.300000012
16917	1548	6046	0.699999988
16918	1548	1524	0.200000003
16919	1548	6047	0.400000006
16920	1548	6048	0.100000001
16921	1548	6049	0.300000012
16922	1548	37	0.899999976
16923	1548	107	0.899999976
16924	1548	107	0.899999976
16925	1548	1294	0.899999976
16926	1549	1882	0.75
16927	1549	235	0.5
16928	1549	37	0.75
16929	1549	5540	0.5
16930	1549	567	0.75
16931	1549	14	0.75
16932	1549	43	0.75
16933	1549	1515	0.5
16934	1549	236	0.5
16935	1549	324	0.5
16936	1549	6	0.5
16937	1549	1574	0.949999988
16938	1549	4290	0.25
16939	1549	237	0.5
16940	1549	9	0.5
16941	1549	10	0.5
16942	1549	6050	0.100000001
16943	1549	6051	0.949999988
16944	1549	6052	0.25
16945	1549	1131	0.75
16946	1549	68	0.5
16947	1549	6053	0.949999988
16948	1549	1578	0.949999988
16949	1549	107	0.5
16950	1549	6054	0.75
16951	1549	6055	0.100000001
16952	1549	1576	0.100000001
16953	1549	662	0.25
16954	1549	16	0.5
16955	1549	6056	0.25
16956	1549	419	0.5
16957	1549	1577	0.100000001
16958	1549	77	0.75
16959	1549	566	0.100000001
16960	1549	292	0.75
16961	1550	6057	1
16962	1550	6058	1
16963	1550	6059	0.899999976
16964	1550	6060	0.899999976
16965	1550	6061	1
16966	1551	564	0.99000001
16967	1551	6062	0.899999976
16968	1551	37	0.899999976
16969	1551	292	0.899999976
16970	1551	36	0.899999976
16971	1551	536	0.899999976
16972	1551	547	0.800000012
16973	1551	802	0.800000012
16974	1551	395	0.800000012
16975	1551	162	0.330000013
16976	1551	3757	0.330000013
16977	1551	1523	0.899999976
16978	1552	1299	0.75
16979	1552	37	1
16980	1552	425	0.899999976
16981	1552	292	0.800000012
16982	1552	3674	0
16983	1552	630	0
16984	1552	6046	0
16985	1552	1524	0.449999988
16986	1552	547	0.899999976
16987	1552	107	0.899999976
16988	1552	14	0.800000012
16989	1552	74	0.800000012
16990	1552	1025	0.899999976
16991	1552	6063	0.140000001
16992	1552	6064	0.800000012
16993	1552	1843	0.699999988
16994	1552	6065	0.800000012
16995	1552	6066	0.800000012
16996	1553	6067	0.5
16997	1553	6068	0.5
16998	1553	6069	0.5
16999	1553	1564	0.5
17000	1553	6070	0.5
17001	1553	6071	0.5
17002	1553	1027	0.5
17003	1553	6072	0.5
17004	1553	4264	0.5
17005	1554	6073	0.75
17006	1554	235	0.5
17007	1554	6074	0.949999988
17008	1554	236	0.5
17009	1554	6	0.5
17010	1554	237	0.5
17011	1554	10	0.5
17012	1554	1364	0.5
17013	1554	619	0.75
17014	1554	6075	0.100000001
17015	1554	37	0.75
17016	1554	4068	0.100000001
17017	1554	5467	0.25
17018	1554	6076	0.75
17019	1554	9	0.5
17020	1554	6077	0.75
17021	1554	68	0.5
17022	1554	6078	0.649999976
17023	1554	6079	0.100000001
17024	1554	6080	0.75
17025	1554	105	0.75
17026	1554	321	0.75
17027	1554	16	0.5
17028	1554	6081	0.649999976
17029	1554	566	0.5
17030	1554	1054	0.75
17031	1555	5598	0.949999988
17032	1555	6082	0.5
17033	1555	425	0.5
17034	1555	37	0.5
17035	1555	291	0.899999976
17036	1555	427	0.5
17037	1555	292	0.5
17038	1555	6083	0.75
17039	1555	419	0.949999988
17040	1555	1290	1
17041	1556	6084	0.899999976
17042	1556	6085	0.75
17043	1556	6086	0.5
17044	1557	6087	0.5
17045	1557	9	0.5
17046	1557	377	0.899999976
17047	1557	6088	0.330000013
17048	1557	6089	0.75
17049	1557	6090	0.5
17050	1557	6091	0.899999976
17051	1557	6092	0.879999995
17052	1557	6093	0.699999988
17053	1558	6094	0.949999988
17054	1558	235	0.75
17055	1558	618	0.100000001
17056	1558	236	0.5
17057	1558	6	0.100000001
17058	1558	6095	0.100000001
17059	1558	237	0.5
17060	1558	10	0.5
17061	1558	284	0.100000001
17062	1558	74	0.75
17063	1558	6096	0.100000001
17064	1558	36	0.75
17065	1558	9	0.100000001
17066	1558	68	0.75
17067	1558	6097	0.100000001
17068	1558	37	0.75
17069	1558	6098	0.949999988
17070	1558	6099	0.100000001
17071	1558	377	1
17072	1558	16	0.5
17073	1558	6100	0.949999988
17074	1559	235	0.5
17075	1559	236	0.5
17076	1559	6	0.5
17077	1559	237	0.5
17078	1559	10	0.5
17079	1559	1842	1
17080	1559	469	0.75
17081	1559	536	1
17082	1559	6101	0.100000001
17083	1559	6102	0.949999988
17084	1559	292	0.75
17085	1559	6103	0.100000001
17086	1559	597	0.5
17087	1559	431	0.649999976
17088	1559	9	0.5
17089	1559	68	0.5
17090	1559	6104	0.75
17091	1559	6105	0.949999988
17092	1559	419	0.5
17093	1559	16	0.5
17094	1559	566	0.5
17095	1560	235	0.5
17096	1560	236	0.5
17097	1560	6	0
17098	1560	6106	0.5
17099	1560	237	0.5
17100	1560	10	0.5
17101	1560	400	0.25
17102	1560	76	0.25
17103	1560	2471	0.75
17104	1560	6107	0.75
17105	1560	6101	0.100000001
17106	1560	77	0.5
17107	1560	6102	0.949999988
17108	1560	6103	0.100000001
17109	1560	9	0
17110	1560	68	0
17111	1560	2958	0.25
17112	1560	6108	0.75
17113	1560	6025	0.5
17114	1560	6105	0.949999988
17115	1560	6109	0.5
17116	1560	6110	0.5
17117	1560	2379	0.25
17118	1560	420	0.25
17119	1560	511	0.5
17120	1560	105	0.25
17121	1560	3037	0.5
17122	1560	16	0.5
17123	1561	6111	0.5
17124	1561	257	0.5
17125	1561	6112	0.75
17126	1561	419	0.699999988
17127	1561	37	0.5
17128	1561	6113	0.5
17129	1561	6114	0.5
17130	1561	536	0.5
17131	1561	53	0.5
17132	1562	6115	0.699999988
17133	1562	16	0.100000001
17134	1562	6116	0.5
17135	1562	68	0.100000001
17136	1562	597	1
17137	1563	6117	1
17138	1564	6118	0.5
17139	1565	6119	1
17140	1566	247	0
17141	1566	5820	0.899999976
17142	1566	14	0.899999976
17143	1566	282	0.899999976
17144	1566	329	0.980000019
17145	1567	6120	1
17146	1567	993	1
17147	1568	6121	0.899999976
17148	1568	163	0.899999976
17149	1568	12	0.899999976
17150	1568	8	0.899999976
17151	1568	359	0.899999976
17152	1568	591	0.699999988
17153	1568	5882	0.899999976
17154	1568	6122	0.899999976
17155	1568	993	0.99000001
17156	1568	767	0.100000001
17157	1568	4897	0.100000001
17158	1568	6123	0.100000001
17159	1568	1554	0.100000001
17160	1568	6124	0.150000006
17161	1568	6125	0.100000001
17162	1569	6126	1
17163	1570	6121	0.899999976
17164	1570	163	0.899999976
17165	1570	12	0.899999976
17166	1570	8	0.899999976
17167	1570	359	0.899999976
17168	1570	591	0.699999988
17169	1570	5882	0.899999976
17170	1570	6122	0.899999976
17171	1570	993	0.99000001
17172	1570	767	0.100000001
17173	1570	4897	0.100000001
17174	1570	6123	0.100000001
17175	1570	1554	0.100000001
17176	1571	6127	0.899999976
17177	1571	6128	0.899999976
17178	1571	6129	0.800000012
17179	1571	6130	0.600000024
17180	1571	6131	0.600000024
17181	1571	6132	0.600000024
17182	1571	6133	0.600000024
17183	1571	6134	0.899999976
17184	1572	2227	0.899999976
17185	1572	6135	0.899999976
17186	1572	6136	0.899999976
17187	1573	6137	0.800000012
17188	1573	6138	0.100000001
17189	1573	767	0.200000003
17190	1573	6139	0.200000003
17191	1573	6140	0.200000003
17192	1573	6141	0.100000001
17193	1573	10	1
17194	1573	16	0
17195	1574	6142	1
17196	1574	6143	0.899999976
17197	1574	6144	0.970000029
17198	1575	6145	0.100000001
17199	1575	6142	1
17200	1576	6146	0.899999976
17201	1577	6147	1
17202	1578	235	0.5
17203	1578	14	0.75
17204	1578	236	0.5
17205	1578	6	0.5
17206	1578	237	0.5
17207	1578	10	0.5
17208	1578	6148	0.949999988
17209	1578	284	0.100000001
17210	1578	6149	0.100000001
17211	1578	74	0.75
17212	1578	37	0.75
17213	1578	619	0.100000001
17214	1578	597	0.25
17215	1578	36	0.75
17216	1578	53	0.75
17217	1578	9	0.5
17218	1578	68	0.75
17219	1578	4387	0.75
17220	1578	33	0.75
17221	1578	6150	0.949999988
17222	1578	270	0.100000001
17223	1578	838	0.100000001
17224	1578	16	0.5
17225	1578	378	0.75
17226	1579	505	0.899999976
17227	1579	2136	0.75
17228	1579	6151	0.5
17229	1579	6152	0.5
17230	1579	37	0.5
17231	1579	6153	0.5
17232	1579	6154	0.75
17233	1580	37	0.899999976
17234	1580	6155	0.75
17235	1580	6156	0.5
17236	1580	231	0.300000012
17237	1581	235	0.5
17238	1581	6157	0.949999988
17239	1581	6158	0.75
17240	1581	10	0.5
17241	1581	14	0.75
17242	1581	74	0.75
17243	1581	6	0.5
17244	1581	36	0.75
17245	1581	237	0.5
17246	1581	9	0.5
17247	1581	236	0.5
17248	1581	68	0.5
17249	1581	6159	0.75
17250	1581	531	0.5
17251	1581	16	0.5
17252	1581	2242	0.5
17253	1582	6160	0.5
17254	1582	401	0.5
17255	1582	715	0.5
17256	1582	37	0.5
17257	1582	434	0.5
17258	1582	10	0.5
17259	1582	5621	0.5
17260	1582	4017	0.100000001
17261	1582	6161	0.5
17262	1582	6162	0.5
17263	1582	1842	0.5
17264	1582	3689	0.5
17265	1582	1	0.5
17266	1582	45	0.5
17267	1582	6163	0.5
17268	1582	1048	0.5
17269	1582	4559	0.5
17270	1582	6164	0.5
17271	1582	82	0.5
17272	1582	6165	0.5
17273	1582	4243	0.5
17274	1582	425	0.5
17275	1582	185	0.5
17276	1582	5381	0.5
17277	1582	35	0.100000001
17278	1582	1877	0.5
17279	1582	2010	0.5
17280	1582	77	0.5
17281	1582	1369	0.5
17282	1582	632	0.5
17283	1582	107	0.5
17284	1582	6166	0.100000001
17285	1582	65	0.5
17286	1582	4515	0.100000001
17287	1582	1514	0.100000001
17288	1582	3087	0.5
17289	1582	6167	0.100000001
17290	1582	597	0.5
17291	1582	257	0.5
17292	1582	2523	0.5
17293	1582	6168	0.5
17294	1582	291	0.5
17295	1582	9	0.5
17296	1582	6169	0.100000001
17297	1582	6170	0.100000001
17298	1582	809	0.5
17299	1582	550	0.100000001
17300	1582	6171	0.100000001
17301	1582	6172	0.5
17302	1582	6173	0.5
17303	1582	4233	0.5
17304	1582	659	0.100000001
17305	1582	3727	0.100000001
17306	1582	6174	0.5
17307	1582	40	0.5
17308	1582	6	0.5
17309	1582	83	0.100000001
17310	1582	498	0.5
17311	1582	1877	0.5
17312	1582	511	0.100000001
17313	1582	1422	0.5
17314	1582	3453	0.5
17315	1582	6175	0.5
17316	1582	32	0.5
17317	1582	1512	0.5
17318	1582	16	0.5
17319	1582	1275	0.100000001
17320	1582	6176	0.5
17321	1582	1054	0.5
17322	1582	2173	0.5
17323	1583	4071	0.5
17324	1583	6177	0.5
17325	1583	6178	0.330000013
17326	1584	1428	1
17327	1584	235	0.5
17328	1584	16	0.5
17329	1584	6179	0.75
17330	1584	6180	0.75
17331	1584	236	0.5
17332	1584	6181	0.75
17333	1584	68	0.5
17334	1584	6182	0.949999988
17335	1584	6	0.5
17336	1584	6183	0.75
17337	1584	237	0.5
17338	1584	9	0.5
17339	1584	10	0.5
17340	1584	6184	0.75
17341	1584	6185	0.75
17342	1584	6186	0.75
17343	1584	6187	1
17344	1585	6188	1
17345	1585	235	0.5
17346	1585	6189	0.25
17347	1585	6190	0.75
17348	1585	236	0.5
17349	1585	6	0.5
17350	1585	237	0.5
17351	1585	10	0.5
17352	1585	2154	0.75
17353	1585	2634	0.75
17354	1585	6191	1
17355	1585	12	0.75
17356	1585	37	0.75
17357	1585	6192	0.949999988
17358	1585	599	0.75
17359	1585	9	0.5
17360	1585	5876	0.75
17361	1585	68	0.5
17362	1585	6193	0.75
17363	1585	5276	0.5
17364	1585	6194	0.75
17365	1585	1366	0.75
17366	1585	6195	0.75
17367	1585	6196	1
17368	1585	16	0.5
17369	1586	235	0.5
17370	1586	236	0.5
17371	1586	6	0.5
17372	1586	237	0.5
17373	1586	10	0.5
17374	1586	6197	0.75
17375	1586	76	0.75
17376	1586	400	0.5
17377	1586	292	0.75
17378	1586	37	0.75
17379	1586	257	0.75
17380	1586	6198	0.949999988
17381	1586	441	0.75
17382	1586	9	0.5
17383	1586	68	0.75
17384	1586	79	0.75
17385	1586	16	0.5
17386	1586	568	0.100000001
17387	1586	105	0.5
17388	1586	531	0.649999976
17389	1586	38	0.75
17390	1587	235	0.5
17391	1587	236	0.5
17392	1587	6	0.5
17393	1587	844	0.100000001
17394	1587	6199	0.100000001
17395	1587	237	0.5
17396	1587	10	0.5
17397	1587	1364	0.100000001
17398	1587	94	0.75
17399	1587	422	0.100000001
17400	1587	3951	1
17401	1587	962	0.75
17402	1587	329	1
17403	1587	6200	0.75
17404	1587	6201	0.75
17405	1587	6198	0.949999988
17406	1587	9	0.5
17407	1587	68	0.75
17408	1587	162	0.100000001
17409	1587	4773	0.5
17410	1587	16	0.5
17411	1587	5028	0.100000001
17412	1587	1131	0.100000001
17413	1587	6202	0.100000001
17414	1588	235	0.5
17415	1588	6203	0.949999988
17416	1588	236	0.5
17417	1588	6204	0.100000001
17418	1588	6	0.5
17419	1588	237	0.5
17420	1588	10	0.5
17421	1588	6197	0.75
17422	1588	76	0.75
17423	1588	400	0.5
17424	1588	292	0.75
17425	1588	37	0.75
17426	1588	257	0.75
17427	1588	6205	0.949999988
17428	1588	441	0.75
17429	1588	9	0.5
17430	1588	68	0.5
17431	1588	79	0.75
17432	1588	38	0.75
17433	1588	105	0.5
17434	1588	531	0.649999976
17435	1588	16	0.5
17436	1589	235	0.5
17437	1589	14	0.75
17438	1589	6203	0.949999988
17439	1589	236	0.5
17440	1589	6204	0.100000001
17441	1589	6	0.5
17442	1589	715	0.5
17443	1589	237	0.5
17444	1589	10	0.5
17445	1589	1117	0.75
17446	1589	76	0.75
17447	1589	284	0.75
17448	1589	77	0.5
17449	1589	6205	0.949999988
17450	1589	9	0.5
17451	1589	68	0.5
17452	1589	83	0.649999976
17453	1589	400	0.75
17454	1589	105	0.75
17455	1589	531	0.649999976
17456	1589	6206	0.649999976
17457	1589	16	0.5
17458	1590	6207	1
17459	1590	6208	0.5
17460	1590	37	0.5
17461	1590	38	0.5
17462	1590	107	0.5
17463	1590	5381	0.5
17464	1590	74	0.5
17465	1590	292	0.5
17466	1590	257	0.5
17467	1590	400	0.5
17468	1590	531	0.5
17469	1590	1033	0.5
17470	1590	6209	0.25
17471	1590	4463	0.5
17472	1590	6210	0.25
17473	1590	6211	0.25
17474	1591	6212	0.5
17475	1591	94	0.5
17476	1591	95	0.5
17477	1591	6213	0.5
17478	1591	6214	0.5
17479	1591	473	0.25
17480	1591	2079	0.5
17481	1592	6215	0.5
17482	1592	1613	0.5
17483	1593	722	0.600000024
17484	1593	425	0.5
17485	1593	1783	0.5
17486	1593	37	0.5
17487	1593	3460	0.5
17488	1593	79	0.5
17489	1593	74	0.5
17490	1593	6216	0.400000006
17491	1593	715	0.400000006
17492	1593	3689	0.400000006
17493	1593	2180	0.400000006
17494	1593	105	0.300000012
17495	1594	6217	0
17496	1594	6218	1
17497	1594	6219	0
17498	1594	6220	1
17499	1594	6221	1
17500	1594	6222	1
17501	1595	6217	0.899999976
17502	1595	6218	0.5
17503	1595	6220	1
17504	1595	6221	1
17505	1595	6222	1
17506	1596	6220	1
17507	1596	6221	1
17508	1596	6222	1
17509	1597	6220	1
17510	1597	6221	1
17511	1597	6222	1
17512	1598	6223	1
17513	1598	6224	0.899999976
17514	1598	3845	0.899999976
17515	1598	6225	0.899999976
17516	1598	6226	0.899999976
17517	1598	6227	0.899999976
17518	1598	1409	0
17519	1598	2490	0
17520	1598	6228	0
17521	1598	6229	0
17522	1599	6230	0.800000012
17523	1599	6231	0.699999988
17524	1599	6232	0.699999988
17525	1599	6233	0.699999988
17526	1599	5909	0.699999988
17527	1599	6234	0.600000024
17528	1599	6235	0.600000024
17529	1599	6236	0.600000024
17530	1599	801	0.600000024
17531	1599	6237	0.5
17532	1599	6238	0.600000024
17533	1599	6239	0.899999976
17534	1599	16	0.5
17535	1599	10	0.5
17536	1599	501	0.699999988
17537	1599	6240	0.699999988
17538	1599	6241	0.800000012
17539	1600	6242	0.699999988
17540	1600	6229	0.699999988
17541	1600	6243	0.600000024
17542	1600	3305	0.699999988
17543	1600	6244	0.600000024
17544	1600	6245	0.699999988
17545	1600	6246	0.5
17546	1600	6228	0
17547	1601	6247	1
17548	1602	1	0.5
17549	1602	9	0.5
17550	1602	10	0.5
17551	1602	68	0.100000001
17552	1602	16	0.5
17553	1602	1376	0.5
17554	1602	6248	0.5
17555	1602	6	0.5
17556	1603	6249	1
17557	1603	1657	0.899999976
17558	1603	6250	0.899999976
17559	1604	6251	0.75
17560	1604	6252	0.5
17561	1604	292	0.5
17562	1604	324	0.5
17563	1604	6253	1
17564	1605	6254	0.5
17565	1605	6255	1
17566	1606	43	0.230000004
17567	1606	6256	0.899999976
17568	1606	6257	0.5
17569	1607	6258	1
17570	1607	6259	0.899999976
17571	1608	6260	0.100000001
17572	1609	6261	1
17573	1610	6262	1
17574	1611	6263	0.75
17575	1611	6264	0.899999976
17576	1612	6	0.800000012
17577	1612	6265	0.899999976
17578	1612	6266	0.600000024
17579	1612	6267	0.600000024
17580	1613	10	1
17581	1613	16	0
17582	1613	1430	0.899999976
17583	1613	6268	0.600000024
17584	1613	4243	0.400000006
17585	1613	2805	0.200000003
17586	1613	6269	0.400000006
17587	1613	5659	0.5
17588	1613	6270	0.400000006
17589	1614	6271	0.899999976
17590	1614	6028	0.899999976
17591	1614	6	0.899999976
17592	1614	6272	0.800000012
17593	1614	429	0.699999988
17594	1614	4209	0.699999988
17595	1614	6273	0.699999988
17596	1614	132	0.899999976
17597	1614	3230	0.800000012
17598	1614	6274	0.600000024
17599	1614	5171	0.600000024
17600	1614	3335	0.800000012
17601	1614	4844	0
17602	1614	3522	0.800000012
17603	1614	1877	0.699999988
17604	1614	6275	0.699999988
17605	1615	6	1
17606	1615	799	1
17607	1615	2713	0.600000024
17608	1615	801	0.600000024
17609	1615	3137	0.800000012
17610	1615	1973	1
17611	1615	2454	0.899999976
17612	1615	4922	1
17613	1616	37	0.899999976
17614	1616	2977	0.200000003
17615	1616	12	0.899999976
17616	1616	163	0.800000012
17617	1616	250	0.899999976
17618	1616	659	0.200000003
17619	1616	6276	1
17620	1616	6277	0.300000012
17621	1616	6278	0.949999988
17622	1617	6279	1
17623	1618	6279	1
17624	1619	6279	1
17625	1620	6279	1
17626	1621	6279	1
17627	1622	6279	1
17628	1623	6279	1
17629	1624	6279	1
17630	1625	6279	1
17631	1626	6279	1
17632	1627	6279	1
17633	1628	6279	1
17634	1629	6279	1
17635	1630	6279	1
17636	1631	2342	0.600000024
17637	1631	6280	0.699999988
17638	1631	6281	0.699999988
17639	1631	421	0.699999988
17640	1631	3909	0.699999988
17641	1631	12	0.600000024
17642	1631	1263	0.600000024
17643	1631	499	0.600000024
17644	1631	398	0.600000024
17645	1631	1507	0.600000024
17646	1631	37	0.600000024
17647	1632	6282	0.75
17648	1632	235	0.5
17649	1632	37	0.75
17650	1632	6283	0.949999988
17651	1632	6284	0.75
17652	1632	6285	1
17653	1632	236	0.5
17654	1632	6	0.5
17655	1632	6286	0.75
17656	1632	6287	0.75
17657	1632	6288	0.949999988
17658	1632	53	0.75
17659	1632	237	0.5
17660	1632	9	0.5
17661	1632	10	0.5
17662	1632	68	0.5
17663	1632	6289	0.5
17664	1632	16	0.5
17665	1632	6290	0.949999988
17666	1633	37	0.899999976
17667	1633	2977	0.200000003
17668	1633	12	0.899999976
17669	1633	163	0.800000012
17670	1633	250	0.899999976
17671	1633	659	0.200000003
17672	1633	6276	1
17673	1633	6277	0.300000012
17674	1633	6278	0.949999988
17675	1633	8	1
17676	1633	6291	0.899999976
17677	1633	6292	0.800000012
17678	1633	6293	0.699999988
17679	1633	42	0.699999988
17680	1634	235	0.5
17681	1634	37	1
17682	1634	15	0.75
17683	1634	39	0.75
17684	1634	2020	0.75
17685	1634	236	0.5
17686	1634	250	1
17687	1634	8	1
17688	1634	237	0.5
17689	1634	6	0.5
17690	1634	10	0.5
17691	1634	68	0.5
17692	1634	12	0.75
17693	1634	16	0.5
17694	1634	163	0.5
17695	1634	9	0.5
17696	1635	5528	0.800000012
17697	1635	418	0.5
17698	1635	14	0.800000012
17699	1635	869	0.800000012
17700	1635	74	0.800000012
17701	1635	37	0.800000012
17702	1635	38	0.800000012
17703	1635	8	0.800000012
17704	1635	33	0.800000012
17705	1635	6294	0.800000012
17706	1635	36	0.800000012
17707	1635	46	0.800000012
17708	1635	6295	0.800000012
17709	1635	40	0.800000012
17710	1635	40	0.800000012
17711	1635	3588	0.800000012
17712	1635	1384	0.699999988
17713	1635	162	0.600000024
17714	1636	2255	1
17715	1636	1197	0.800000012
17716	1636	546	0.600000024
17717	1636	77	0.600000024
17718	1636	6296	0.400000006
17719	1636	6297	0.600000024
17720	1636	422	0.300000012
17721	1636	6298	0.200000003
17722	1637	597	0.75
17723	1637	5973	0.75
17724	1637	2523	0.5
17725	1637	37	0.5
17726	1637	53	0.75
17727	1637	427	0.75
17728	1637	82	0.75
17729	1637	425	0.75
17730	1638	597	0.75
17731	1638	5973	0.75
17732	1638	2523	0.5
17733	1638	37	0.5
17734	1638	53	0.75
17735	1638	427	0.75
17736	1638	82	0.75
17737	1638	425	0.75
17738	1639	6299	0
17739	1639	6300	0.0500000007
17740	1639	5930	0.800000012
17741	1639	1044	0.800000012
17742	1639	6301	0.699999988
17743	1639	6302	0.699999988
17744	1639	5932	0.800000012
17745	1639	6303	0.699999988
17746	1639	6304	0.699999988
17747	1639	6305	0.699999988
17748	1640	6306	0.99000001
17749	1640	6307	0.99000001
17750	1640	6308	0.800000012
17751	1640	6309	0.300000012
17752	1640	2701	0.25
17753	1640	395	0.899999976
17754	1640	1618	0.899999976
17755	1640	16	0.600000024
17756	1640	10	0.400000006
17757	1640	6310	0.699999988
17758	1641	37	0.800000012
17759	1641	107	0.800000012
17760	1641	499	0.800000012
17761	1641	79	0.800000012
17762	1641	88	0.800000012
17763	1641	6311	1
17764	1641	40	0.5
17765	1641	555	0.300000012
17766	1642	6312	0.99000001
17767	1642	2541	0.899999976
17768	1642	6313	0.800000012
17769	1642	6314	0.800000012
17770	1642	2689	0.600000024
17771	1642	844	0.600000024
17772	1642	33	0.5
17773	1642	36	0.5
17774	1643	481	0.899999976
17775	1643	6315	0.899999976
17776	1643	553	0.899999976
17777	1643	6316	0.75
17778	1643	6317	0.899999976
17779	1643	6318	0.5
17780	1644	481	0.899999976
17781	1644	6315	0.899999976
17782	1644	553	0.899999976
17783	1644	6316	0.75
17784	1644	6317	0.899999976
17785	1644	6318	0.5
17786	1645	481	0.899999976
17787	1645	6315	0.899999976
17788	1645	553	0.899999976
17789	1645	6316	0.75
17790	1645	6317	0.899999976
17791	1645	6318	0.5
17792	1646	1409	0.75
17793	1646	2490	0.75
17794	1646	6319	0.5
17795	1646	6320	0.5
17796	1646	4922	0.5
17797	1646	1844	0.5
17798	1646	6321	0.5
17799	1646	6322	0.5
17800	1646	6323	0.5
17801	1646	6324	0.5
17802	1647	6325	1
17803	1647	257	0.949999988
17804	1647	6326	0.99000001
17805	1647	400	0.800000012
17806	1648	6327	0.100000001
17807	1648	235	0.5
17808	1648	37	0.5
17809	1648	619	0.100000001
17810	1648	618	0.649999976
17811	1648	5017	0.100000001
17812	1648	838	0.5
17813	1648	68	0.5
17814	1648	236	0.5
17815	1648	6	0.5
17816	1648	6328	0.75
17817	1648	237	0.5
17818	1648	9	0.5
17819	1648	10	0.5
17820	1648	1364	0.100000001
17821	1648	548	0.649999976
17822	1648	1117	0.5
17823	1648	6329	0.25
17824	1648	422	0.5
17825	1648	832	0.5
17826	1648	16	0.5
17827	1648	15	0.100000001
17828	1648	6330	0.100000001
17829	1648	74	0.5
17830	1648	555	0.100000001
17831	1648	6331	0.5
17832	1648	6332	0.949999988
17833	1648	2219	0.5
17834	1648	546	0.649999976
17835	1648	6333	0.75
17836	1648	5383	0.100000001
17837	1648	3357	0.100000001
17838	1648	6334	0.100000001
17839	1648	378	0.5
17840	1648	292	0.75
17841	1649	6335	1
17842	1649	229	0.75
17843	1649	115	0.75
17844	1649	72	0.75
17845	1649	6336	0.75
17846	1650	6337	1
17847	1650	6338	0.75
17848	1650	6339	0.75
17849	1650	6340	0.5
17850	1650	6341	0.5
17851	1650	6342	0.99000001
17852	1651	6343	1
17853	1651	3228	1
17854	1651	6344	0.899999976
17855	1652	6345	0.5
17856	1652	6346	0.75
17857	1652	6347	0.5
17858	1652	6348	0.5
17859	1652	680	0.5
17860	1652	21	0.5
17861	1652	460	0.25
17862	1652	6349	0.25
17863	1652	445	0.25
17864	1653	6350	0.800000012
17865	1653	6351	0.899999976
17866	1653	6352	0.239999995
17867	1653	6353	0.730000019
17868	1653	6354	0.5
17869	1653	5782	0.239999995
17870	1653	2062	0.5
17871	1653	6355	0.5
17872	1653	45	0.180000007
17873	1654	6351	0.899999976
17874	1654	6352	0.239999995
17875	1654	6353	0.730000019
17876	1654	6354	0.5
17877	1654	5782	0.239999995
17878	1654	2062	0.5
17879	1654	6355	0.5
17880	1654	45	0.180000007
17881	1655	6356	0.800000012
17882	1655	6357	0.800000012
17883	1655	14	0.5
17884	1655	429	0.5
17885	1655	401	0.5
17886	1655	6358	0.400000006
17887	1655	37	0.400000006
17888	1655	53	0.400000006
17889	1655	250	0.400000006
17890	1655	4146	0.5
17891	1655	83	1
17892	1655	6359	0.600000024
17893	1655	6360	0.600000024
17894	1655	6361	0.200000003
17895	1655	6362	0.600000024
17896	1655	6363	0.600000024
17897	1655	277	0.400000006
17898	1655	79	0.400000006
17899	1655	163	0.400000006
17900	1655	1270	0.300000012
17901	1655	845	0.200000003
17902	1655	6364	0.5
17903	1655	2062	0.449999988
17904	1655	6365	0.300000012
17905	1655	997	0.400000006
17906	1655	340	0.800000012
17907	1655	6366	1
17908	1655	16	0.5
17909	1655	10	0.5
17910	1655	3773	0.699999988
17911	1656	6367	0.899999976
17912	1656	329	0.800000012
17913	1656	6368	0.00100000005
17914	1656	4368	0.00999999978
17915	1656	6369	0.00999999978
17916	1656	6370	0.800000012
17917	1656	94	0.00100000005
17918	1657	90	0.949999988
17919	1657	874	0.899999976
17920	1657	83	0.899999976
17921	1657	6371	0.899999976
17922	1657	6372	0.800000012
17923	1657	10	0.899999976
17924	1657	16	0.100000001
17925	1657	6373	0.899999976
17926	1657	6374	0.800000012
17927	1657	395	0.699999988
17928	1657	291	0.699999988
17929	1657	40	0.800000012
17930	1657	82	0.100000001
17931	1657	398	0.699999988
17932	1657	5260	0.600000024
17933	1658	6375	1
17934	1658	6376	0.699999988
17935	1658	6377	0.200000003
17936	1658	3852	1
17937	1658	40	0.899999976
17938	1658	5554	0.800000012
17939	1659	1611	0.400000006
17940	1659	6378	0.600000024
17941	1659	6379	0.699999988
17942	1659	6380	0.699999988
17943	1659	6381	0.600000024
17944	1659	6382	0.600000024
17945	1659	6383	0.899999976
17946	1659	397	0.200000003
17947	1659	6384	0.899999976
17948	1660	235	0.5
17949	1660	499	0.5
17950	1660	236	0.5
17951	1660	6	0.5
17952	1660	237	0.5
17953	1660	10	0.5
17954	1660	469	0.75
17955	1660	1984	0.75
17956	1660	2066	0.75
17957	1660	6385	0.75
17958	1660	6386	0.949999988
17959	1660	292	0.75
17960	1660	6387	0.100000001
17961	1660	37	0.75
17962	1660	6379	0.75
17963	1660	411	0.75
17964	1660	5989	0.100000001
17965	1660	9	0.5
17966	1660	68	0.5
17967	1660	79	0.5
17968	1660	261	0.75
17969	1660	6388	0.100000001
17970	1660	16	0.5
17971	1660	483	0.5
17972	1661	2255	1
17973	1661	4760	0.899999976
17974	1661	998	0.100000001
17975	1661	6389	0.0500000007
17976	1661	2785	0.25
17977	1661	5236	0.25
17978	1661	1513	0.25
17979	1661	4004	0.25
17980	1661	6390	0.100000001
17981	1661	6391	1
17982	1661	3278	0.949999988
17983	1661	6392	0.949999988
17984	1662	2695	0.99000001
17985	1662	6393	0.899999976
17986	1662	6394	0.600000024
17987	1662	6395	0.300000012
17988	1662	767	0.300000012
17989	1662	6396	0.0500000007
17990	1662	6397	0.300000012
17991	1662	6398	0.800000012
17992	1662	511	0.600000024
17993	1662	6399	1
17994	1662	6400	0.699999988
17995	1663	6401	0.400000006
17996	1663	6402	0.600000024
17997	1663	6403	0.300000012
17998	1663	6404	0.800000012
17999	1663	2572	0.5
18000	1663	2194	0.5
18001	1663	6405	0.600000024
18002	1663	6406	0.5
18003	1663	33	0.699999988
18004	1663	3520	0.5
18005	1663	550	0.5
18006	1663	6407	1
18007	1663	6408	0.699999988
18008	1663	4150	0.699999988
18009	1663	2538	0.699999988
18010	1664	5226	0.5
18011	1664	1	0.5
18012	1664	16	0.5
18013	1664	35	0.5
18014	1664	10	0.5
18015	1664	127	0.5
18016	1664	2780	0.5
18017	1664	6	0.5
18018	1664	9	0.5
18019	1665	6409	0.949999988
18020	1665	6410	0.800000012
18021	1665	1139	0.800000012
18022	1665	6411	0.800000012
18023	1665	6412	0.800000012
18024	1665	3237	0.800000012
18025	1665	6413	0.800000012
18026	1665	12	0.800000012
18027	1665	163	0.800000012
18028	1665	913	0.800000012
18029	1665	441	0.800000012
18030	1665	547	0.699999988
18031	1665	6414	0.699999988
18032	1665	2488	0.699999988
18033	1665	6415	0.600000024
18034	1665	6416	0.99000001
18035	1665	149	0.400000006
18036	1666	68	0.899999976
18037	1666	16	0.5
18038	1666	10	0.5
18039	1666	6417	0.699999988
18040	1666	6418	1
18041	1666	6419	0.600000024
18042	1666	6420	0.600000024
18043	1666	6421	0.600000024
18044	1667	6422	0.5
18045	1667	6423	0.75
18046	1667	229	0.75
18047	1667	6424	0.150000006
18048	1667	6425	0.5
18049	1667	6426	0.150000006
18050	1667	5401	0.899999976
18051	1667	68	0.899999976
18052	1667	127	0.899999976
18053	1668	6427	0.75
18054	1668	6428	0.25
18055	1668	6429	0.200000003
18056	1668	3899	0.400000006
18057	1668	6430	0.5
18058	1669	6431	0.5
18059	1669	36	0.5
18060	1669	74	0.100000001
18061	1669	6432	0.699999988
18062	1669	6433	0.75
18063	1669	6434	0.75
18064	1670	68	1
18065	1670	6435	1
18066	1670	6436	1
18067	1670	6437	1
18068	1670	6438	1
18069	1670	6439	1
18070	1670	6440	1
18071	1670	6441	1
18072	1670	6442	1
18073	1671	6443	1
18074	1672	2316	1
18075	1672	2317	1
18076	1672	2318	1
18077	1673	6444	1
18078	1674	6445	1
18079	1674	6446	1
18080	1674	6447	1
18081	1674	6448	1
18082	1675	235	0.5
18083	1675	6449	0.5
18084	1675	236	0.5
18085	1675	6	0.5
18086	1675	6450	0.75
18087	1675	237	0.5
18088	1675	6451	0.75
18089	1675	10	0.5
18090	1675	6452	0.5
18091	1675	6453	0.949999988
18092	1675	6454	0.75
18093	1675	6455	0.75
18094	1675	6456	0.75
18095	1675	6457	0.5
18096	1675	6458	0.75
18097	1675	6459	0.75
18098	1675	6460	0.5
18099	1675	6461	0.75
18100	1675	9	0.5
18101	1675	68	0.5
18102	1675	6462	0.5
18103	1675	6463	0.5
18104	1675	16	0.5
18105	1676	6464	0.899999976
18106	1677	6465	0.899999976
18107	1677	6466	0.899999976
18108	1678	6467	1
18109	1678	6468	0.800000012
18110	1678	6110	0.300000012
18111	1678	4760	0.899999976
18112	1678	6469	0.899999976
18113	1679	2255	1
18114	1679	3227	0.699999988
18115	1679	6470	0.600000024
18116	1679	6471	0.400000006
18117	1679	6472	0.400000006
18118	1679	4543	0.400000006
18119	1679	1741	0.5
18120	1679	6473	0.600000024
18121	1679	6474	0.5
18122	1679	6475	0.680000007
18123	1679	6476	0.699999988
18124	1679	1199	0.699999988
18125	1679	6477	0.600000024
18126	1680	722	0.949999988
18127	1680	6478	0.800000012
18128	1680	43	0.100000001
18129	1680	2255	1
18130	1681	6479	1
18131	1682	6480	0.800000012
18132	1682	152	0.800000012
18133	1682	1979	0.899999976
18134	1682	2908	0.899999976
18135	1682	43	0.800000012
18136	1682	89	0.800000012
18137	1683	4146	0.800000012
18138	1683	6481	0.600000024
18139	1683	6482	0.400000006
18140	1683	6483	0.300000012
18141	1683	6484	0.300000012
18142	1683	1376	0.400000006
18143	1683	3227	0.400000006
18144	1683	6485	0.400000006
18145	1683	6486	0.600000024
18146	1683	116	0.5
18147	1683	6487	0.400000006
18148	1683	6488	0.5
18149	1683	6489	0.5
18150	1684	6490	1
18151	1685	6491	1
18152	1686	511	0.400000006
18153	1686	2255	1
18154	1687	6492	0.899999976
18155	1687	6493	0.899999976
18156	1687	1955	0.899999976
18157	1687	2255	1
18158	1687	6494	0.899999976
18159	1687	6495	0.899999976
18160	1687	790	0.400000006
18161	1687	6496	0.600000024
18162	1687	6497	0.5
18163	1687	6471	0.600000024
18164	1687	597	0.800000012
18165	1687	3283	0.400000006
18166	1687	6498	0.5
18167	1687	6499	0.300000012
18168	1687	511	0.25
18169	1688	6500	0.5
18170	1688	4473	0.75
18171	1688	6501	0.75
18172	1688	6502	0.75
18173	1688	6503	0.800000012
18174	1689	6504	1
18175	1689	6505	0.899999976
18176	1689	722	0.5
18177	1689	4473	0.5
18178	1690	722	0.75
18179	1690	6506	0.899999976
18180	1691	262	0.75
18181	1691	97	0.75
18182	1691	6507	0.25
18183	1692	229	1
18184	1693	229	1
18185	1694	229	1
18186	1695	229	1
18187	1696	229	1
18188	1697	6508	0.5
18189	1697	6509	0.75
18190	1697	12	0.75
18191	1697	8	0.75
18192	1697	1336	0.5
18193	1697	6510	0.5
18194	1697	6511	0.5
18195	1697	24	0.75
18196	1697	16	0.75
18197	1697	10	0.25
18198	1698	3548	0.5
18199	1698	6512	0.5
18200	1698	6513	0.5
18201	1698	6514	0.400000006
18202	1698	6515	0.699999988
18203	1698	425	0.699999988
18204	1698	79	0.200000003
18205	1698	6516	0.200000003
18206	1698	3756	0.200000003
18207	1698	6517	0.200000003
18208	1698	82	0.100000001
18209	1698	427	0.100000001
18210	1698	6518	0.100000001
18211	1698	1979	0.899999976
18212	1699	6519	0.75
18213	1699	235	0.5
18214	1699	37	0
18215	1699	6520	0.75
18216	1699	236	0.5
18217	1699	6521	0.75
18218	1699	6	0.5
18219	1699	6522	0.5
18220	1699	6523	0.75
18221	1699	6524	0.75
18222	1699	237	0.5
18223	1699	6525	0.75
18224	1699	6526	0.75
18225	1699	9	0.5
18226	1699	10	0.5
18227	1699	68	0.5
18228	1699	6527	0.75
18229	1699	16	0.5
18230	1699	6528	0.949999988
18231	1699	6529	0.75
18232	1699	425	0.75
18233	1699	2523	0.75
18234	1699	181	0.75
18235	1700	6282	0.75
18236	1700	235	0.5
18237	1700	37	0.100000001
18238	1700	6519	0.75
18239	1700	236	0.5
18240	1700	6523	0.75
18241	1700	6	0.5
18242	1700	237	0.5
18243	1700	9	0.5
18244	1700	10	0.5
18245	1700	68	0.5
18246	1700	6287	0.75
18247	1700	6524	0.75
18248	1700	6530	0.5
18249	1700	16	0.5
18250	1700	6284	0.75
18251	1700	6528	0.949999988
18252	1700	6531	0.5
18253	1701	6519	0.75
18254	1701	235	0.5
18255	1701	37	0.75
18256	1701	6532	0.649999976
18257	1701	6533	0.649999976
18258	1701	236	0.5
18259	1701	6	0.5
18260	1701	6523	0.75
18261	1701	237	0.5
18262	1701	9	0.5
18263	1701	10	0.5
18264	1701	68	0.5
18265	1701	6524	0.75
18266	1701	79	0.75
18267	1701	6528	0.949999988
18268	1701	16	0.5
18269	1702	425	0.899999976
18270	1702	292	0.600000024
18271	1702	3674	0.699999988
18272	1702	630	0.300000012
18273	1702	6046	0.699999988
18274	1702	1524	0.200000003
18275	1702	6047	0.400000006
18276	1702	6048	0.100000001
18277	1702	6049	0.300000012
18278	1702	37	0.899999976
18279	1702	107	0.899999976
18280	1702	107	0.899999976
18281	1702	1294	0.899999976
18282	1703	425	1
18283	1703	3674	0.649999976
18284	1703	630	0
18285	1703	6046	0.800000012
18286	1703	639	1
18287	1703	37	0.899999976
18288	1703	107	0.899999976
18289	1703	107	0.899999976
18290	1703	1294	0.899999976
18291	1703	6534	0.899999976
18292	1704	425	0.970000029
18293	1704	292	0.560000002
18294	1704	3674	0.720000029
18295	1704	630	0.0500000007
18296	1704	6046	0.100000001
18297	1704	1524	0.100000001
18298	1704	37	0.899999976
18299	1704	107	0.899999976
18300	1704	107	0.899999976
18301	1704	1294	0.899999976
18302	1704	6535	0.800000012
18303	1704	6047	0.800000012
18304	1704	2574	0.699999988
18305	1705	425	1
18306	1705	292	1
18307	1705	6536	0.769999981
18308	1705	630	0.00999999978
18309	1705	6046	0.899999976
18310	1705	1524	0.00999999978
18311	1705	37	0.899999976
18312	1705	107	0.899999976
18313	1705	107	0.899999976
18314	1705	1294	0.899999976
18315	1705	2194	0.699999988
18316	1705	6537	0.600000024
18317	1705	6538	0.300000012
18318	1706	235	0.5
18319	1706	37	0.75
18320	1706	5876	0.75
18321	1706	567	0.75
18322	1706	185	0.5
18323	1706	6038	0.100000001
18324	1706	236	0.5
18325	1706	6539	0.949999988
18326	1706	6	0.5
18327	1706	6540	0.100000001
18328	1706	1294	0.5
18329	1706	6541	0.949999988
18330	1706	6542	0.75
18331	1706	237	0.5
18332	1706	9	0.5
18333	1706	10	0.5
18334	1706	68	0.5
18335	1706	107	0.75
18336	1706	1842	0.75
18337	1706	6033	0.949999988
18338	1706	5813	0.5
18339	1706	6040	0.949999988
18340	1706	536	0.75
18341	1706	4980	0.25
18342	1706	6543	0.100000001
18343	1706	568	0.25
18344	1706	257	0.75
18345	1706	2519	0.25
18346	1706	566	0.25
18347	1706	4972	0.25
18348	1706	6034	0.100000001
18349	1706	5809	0.5
18350	1706	662	0.25
18351	1706	6544	0.75
18352	1706	16	0.5
18353	1706	1190	0.25
18354	1706	6545	0.5
18355	1706	292	0.75
18356	1707	4390	0.75
18357	1708	4390	0.75
18358	1709	4390	0.75
18359	1710	4390	0.75
18360	1711	4390	0.75
18361	1712	4390	0.75
18362	1713	4390	0.75
18363	1714	4390	0.75
18364	1715	4390	0.75
18365	1716	4390	0.75
18366	1717	4390	0.75
18367	1718	4390	0.75
18368	1719	4390	0.75
18369	1720	4390	0.75
18370	1721	4390	0.75
18371	1722	4390	0.75
18372	1723	4390	0.75
18373	1724	4390	0.75
18374	1725	3420	0.899999976
18375	1725	37	0.899999976
18376	1725	292	0.899999976
18377	1725	681	0.899999976
18378	1725	33	0.899999976
18379	1725	53	0.899999976
18380	1725	4051	0.699999988
18381	1725	547	0.699999988
18382	1725	802	0.699999988
18383	1725	162	0.400000006
18384	1726	72	1
18385	1726	6546	1
18386	1726	6547	0.899999976
18387	1726	6	0.699999988
18388	1727	6547	0.899999976
18389	1727	6	0.699999988
18390	1727	1522	0.699999988
18391	1727	72	0.400000006
18392	1727	6548	0.699999988
18393	1728	6549	1
18394	1728	6547	0.899999976
18395	1728	6	0.699999988
18396	1729	6547	0.899999976
18397	1729	6	0.699999988
18398	1729	6550	1
18399	1729	6549	1
18400	1730	6551	0.949999988
18401	1730	40	0.949999988
18402	1730	5554	0.699999988
18403	1731	6552	0.5
18404	1731	401	0.75
18405	1731	6553	0.850000024
18406	1731	6554	0.779999971
18407	1731	37	0.75
18408	1732	235	0.5
18409	1732	37	0.100000001
18410	1732	618	0.100000001
18411	1732	236	0.5
18412	1732	74	0.75
18413	1732	3747	0.75
18414	1732	6	0.5
18415	1732	36	0.75
18416	1732	237	0.5
18417	1732	9	0.5
18418	1732	10	0.5
18419	1732	68	0.5
18420	1732	377	0.75
18421	1732	16	0.5
18422	1732	1117	0
18423	1732	378	0.75
18424	1732	6555	1
18425	1732	6556	0.75
18426	1733	235	0.75
18427	1733	6557	0.75
18428	1733	6558	0.75
18429	1733	68	0.75
18430	1733	236	0.5
18431	1733	6	0.5
18432	1733	237	0.5
18433	1733	9	0.5
18434	1733	10	0.5
18435	1733	6191	0.75
18436	1733	6559	0.949999988
18437	1733	6560	0.75
18438	1733	16	0.5
18439	1733	6561	0.5
18440	1733	6545	0.5
18441	1734	6562	1
18442	1735	6563	0.75
18443	1735	6564	0.75
18444	1736	163	0.899999976
18445	1736	2346	0.75
18446	1736	6565	0.5
18447	1736	6566	0.5
18448	1736	12	0.5
18449	1736	357	0.899999976
18450	1736	6567	0.5
18451	1737	5469	1
18452	1737	293	1
18453	1738	6568	1
18454	1738	3126	1
18455	1739	6569	1
18456	1739	6570	0.75
18457	1739	6571	1
18458	1740	6572	0.899999976
18459	1740	6573	0.5
18460	1740	324	0.5
18461	1740	6574	0.25
18462	1740	6575	0.25
18463	1741	6576	0.100000001
18464	1741	6577	0.100000001
18465	1741	6578	0.5
18466	1741	6579	0.100000001
18467	1741	3093	0.100000001
18468	1741	6580	0.100000001
18469	1741	6581	0.75
18470	1741	6582	0.100000001
18471	1741	6191	0.75
18472	1741	3388	1
18473	1741	6583	0.100000001
18474	1742	3811	0.75
18475	1743	6584	1
18476	1744	6585	1
18477	1745	6586	0.899999976
18478	1745	5835	0.899999976
18479	1745	1008	0.800000012
18480	1745	37	0.899999976
18481	1745	425	0.899999976
18482	1745	6587	0.699999988
18483	1745	6588	0.0500000007
18484	1746	6589	0.0500000007
18485	1746	6590	0
18486	1746	6591	0.949999988
18487	1746	6592	0.0500000007
18488	1746	6593	0.699999988
18489	1746	6594	0.400000006
18490	1746	3647	0.800000012
18491	1746	37	0.949999988
18492	1746	292	0.899999976
18493	1746	4051	0.899999976
18494	1746	547	0.800000012
18495	1746	1131	0.800000012
18496	1746	4034	0.800000012
18497	1746	422	0.5
18498	1746	6595	0.5
18499	1746	6596	0.5
18500	1747	6597	0.5
18501	1747	1	0.5
18502	1747	599	0.5
18503	1747	6	0.5
18504	1747	36	0.5
18505	1747	6598	0.5
18506	1747	53	0.5
18507	1747	291	0.5
18508	1747	9	0.5
18509	1747	10	0.5
18510	1747	68	0.5
18511	1747	16	0.5
18512	1747	6599	0.5
18513	1747	88	0.5
18514	1747	33	0.5
18515	1748	3647	0.899999976
18516	1748	6600	0.899999976
18517	1748	5645	0.300000012
18518	1748	6601	0.300000012
18519	1748	45	0.300000012
18520	1748	3300	0.300000012
18521	1748	547	0.300000012
18522	1748	37	0.899999976
18523	1748	15	0.699999988
18524	1748	163	0.600000024
18525	1748	6602	0.600000024
18526	1749	37	0.99000001
18527	1749	88	0.800000012
18528	1749	498	0.800000012
18529	1749	6599	0.699999988
18530	1749	292	0.800000012
18531	1749	33	0.699999988
18532	1749	36	0.600000024
18533	1749	14	0.5
18534	1749	107	0.5
18535	1749	2154	0.200000003
18536	1749	6603	0.00999999978
18537	1749	393	0.00999999978
18538	1749	365	0.00999999978
18539	1749	1384	0.00999999978
18540	1749	6604	0.699999988
18541	1749	6605	0.899999976
18542	1749	79	0.0500000007
18543	1749	74	0.0500000007
18544	1750	781	0.75
18545	1750	59	0.75
18546	1750	6606	0.75
18547	1750	619	0.100000001
18548	1750	6607	0.5
18549	1750	3439	1
18550	1750	1554	0.100000001
18551	1750	60	0.75
18552	1751	6608	1
18553	1752	235	0
18554	1752	4019	0.75
18555	1752	236	0.5
18556	1752	6	0.5
18557	1752	237	0.5
18558	1752	4195	0.5
18559	1752	10	0.5
18560	1752	851	0.5
18561	1752	6609	0.75
18562	1752	3441	0.75
18563	1752	1554	0.5
18564	1752	1528	0.75
18565	1752	37	0.75
18566	1752	619	0.100000001
18567	1752	861	0.5
18568	1752	597	0.5
18569	1752	36	0.75
18570	1752	53	0.75
18571	1752	9	0.5
18572	1752	68	0
18573	1752	162	0.100000001
18574	1752	6610	0.75
18575	1752	33	0.75
18576	1752	478	0.5
18577	1752	1190	0.75
18578	1752	511	0.75
18579	1752	16	0.5
18580	1752	6611	0.100000001
18581	1753	6612	0.899999976
18582	1753	6613	0.899999976
18583	1753	6614	0.899999976
18584	1753	6615	0.899999976
18585	1753	5943	0.600000024
18586	1753	6616	0.5
18587	1753	6617	0.400000006
18588	1753	6618	0.300000012
18589	1753	10	0.670000017
18590	1753	16	0.330000013
18591	1753	6619	0.899999976
18592	1753	127	0.5
18593	1753	6620	0.699999988
18594	1754	6621	0.800000012
18595	1754	6622	0.5
18596	1754	3619	0.5
18597	1754	6623	0.300000012
18598	1754	6624	0.99000001
18599	1754	6625	0.949999988
18600	1755	16	0.670000017
18601	1755	10	0.330000013
18602	1755	6626	0.699999988
18603	1755	2693	0.699999988
18604	1755	1729	0.600000024
18605	1755	2694	0.5
18606	1755	2705	0.600000024
18607	1755	6627	0.699999988
18608	1755	6628	0.200000003
18609	1755	2117	0.5
18610	1755	95	0.699999988
18611	1755	2619	0.699999988
18612	1755	1091	0.699999988
18613	1755	6629	0.699999988
18614	1755	21	0.400000006
18615	1755	2780	0.5
18616	1755	2779	0.5
18617	1755	1844	0.5
18618	1755	6630	0.5
18619	1755	844	0.400000006
18620	1755	801	0.5
18621	1755	90	0.400000006
18622	1755	1080	0.699999988
18623	1755	2691	0.600000024
18624	1755	4922	0.600000024
18625	1755	6631	0.00999999978
18626	1755	5710	0.00999999978
18627	1755	5705	0.00999999978
18628	1755	799	0.0500000007
18629	1755	6230	0.00999999978
18630	1756	6632	1
18631	1757	6633	0.75
18632	1757	531	0.75
18633	1757	6634	0.5
18634	1757	6635	0.25
18635	1757	4423	0.5
18636	1757	74	0.25
18637	1757	427	0.25
18638	1757	33	0.25
18639	1757	36	0.25
18640	1757	5381	0.25
18641	1757	40	0.25
18642	1757	304	0.25
18643	1757	275	0.25
18644	1757	6636	0.400000006
18645	1757	6637	0.889999986
18646	1757	6638	1
18647	1758	235	0.5
18648	1758	14	0.75
18649	1758	236	0.5
18650	1758	82	0.5
18651	1758	1308	0.75
18652	1758	237	0.5
18653	1758	10	0.5
18654	1758	6639	0.5
18655	1758	6197	0.75
18656	1758	6640	0.5
18657	1758	6641	0.949999988
18658	1758	6642	0.75
18659	1758	2219	0.75
18660	1758	36	0.5
18661	1758	6	0.5
18662	1758	68	0.5
18663	1758	125	0.75
18664	1758	531	0.649999976
18665	1758	16	0.5
18666	1758	9	0.5
18667	1758	126	0.75
18668	1759	235	0.5
18669	1759	14	0.75
18670	1759	236	0.5
18671	1759	6	0.5
18672	1759	1308	0.75
18673	1759	237	0.5
18674	1759	10	0.5
18675	1759	6641	0.949999988
18676	1759	6643	0.75
18677	1759	6644	0.25
18678	1759	6645	0.25
18679	1759	9	0.5
18680	1759	68	0.5
18681	1759	125	0.75
18682	1759	6646	0.5
18683	1759	6647	0.25
18684	1759	531	0.649999976
18685	1759	16	0.5
18686	1759	6648	0.649999976
18687	1759	126	0.75
18688	1760	359	0.5
18689	1760	235	0.5
18690	1760	16	0.5
18691	1760	687	0.75
18692	1760	236	0.5
18693	1760	68	0
18694	1760	74	0.75
18695	1760	6649	0.5
18696	1760	6	0
18697	1760	1308	0.75
18698	1760	237	0.5
18699	1760	9	0
18700	1760	10	0.5
18701	1760	6641	0.949999988
18702	1760	125	0.75
18703	1760	6639	0.75
18704	1760	126	0.75
18705	1761	6633	0.75
18706	1761	531	0.75
18707	1761	6634	0.5
18708	1761	6635	0.25
18709	1761	4423	0.5
18710	1761	74	0.25
18711	1761	427	0.25
18712	1761	33	0.25
18713	1761	36	0.25
18714	1761	5381	0.25
18715	1761	40	0.25
18716	1761	304	0.25
18717	1761	275	0.25
18718	1761	6636	0.400000006
18719	1761	6637	0.889999986
18720	1761	6638	1
18721	1762	6650	0.75
18722	1762	6651	0.25
18723	1762	6652	0.25
18724	1762	6653	0.75
18725	1762	1207	0.75
18726	1762	3836	0.75
18727	1762	4751	0.75
18728	1762	1741	0.75
18729	1762	83	0.5
18730	1762	6654	0.5
18731	1763	6655	0.5
18732	1763	6656	0.100000001
18733	1763	6657	0.800000012
18734	1763	3985	0.850000024
18735	1763	6658	0.75
18736	1763	6659	0.5
18737	1763	6660	0.75
18738	1763	3449	0.5
18739	1764	16	0.75
18740	1764	10	0.25
18741	1764	6661	0.5
18742	1764	6662	0.75
18743	1764	1091	0.5
18744	1764	895	0.5
18745	1764	3533	0.75
18746	1764	6663	0.5
18747	1764	6664	0.5
18748	1765	1979	0.899999976
18749	1765	229	0.899999976
18750	1765	2096	0.75
18751	1765	2097	0.5
18752	1765	2098	0.75
18753	1766	6665	0.899999976
18754	1766	2283	0.5
18755	1766	499	0.5
18756	1766	2489	0.5
18757	1766	799	0.5
18758	1766	6666	0.75
18759	1766	6667	0.75
18760	1766	6668	0.899999976
18761	1767	6669	0.939999998
18762	1767	37	0.5
18763	1767	291	0.5
18764	1767	53	0.5
18765	1767	6670	0.899999976
18766	1767	6671	0.75
18767	1767	526	0.5
18768	1767	1012	0.75
18769	1767	250	0.5
18770	1768	6672	0.5
18771	1768	2250	0.5
18772	1768	4193	0.5
18773	1768	422	0.5
18774	1769	6673	0.970000029
18775	1769	6674	0.300000012
18776	1769	6675	0.529999971
18777	1769	33	0.769999981
18778	1769	290	0.349999994
18779	1769	6676	0.400000006
18780	1769	36	0.769999981
18781	1770	6677	0.99000001
18782	1770	6678	0.99000001
18783	1770	2559	0.200000003
18784	1770	6679	0.200000003
18785	1770	10	0.600000024
18786	1770	16	0.400000006
18787	1771	6680	1
18788	1771	10	0.800000012
18789	1771	6681	0.800000012
18790	1771	9	0.899999976
18791	1771	16	0.100000001
18792	1771	6682	0.899999976
18793	1771	6683	0.800000012
18794	1771	6684	0.949999988
18795	1771	6685	0.99000001
18796	1771	6686	0.800000012
18797	1772	844	0.800000012
18798	1772	2693	0.600000024
18799	1772	6687	0.600000024
18800	1772	293	0.5
18801	1772	21	0.5
18802	1772	1091	0.5
18803	1772	6688	0.800000012
18804	1772	6689	0.899999976
18805	1773	6690	1
18806	1773	6691	0.99000001
18807	1773	1278	0.899999976
18808	1773	16	0.5
18809	1773	10	0.5
18810	1773	550	0.5
18811	1773	293	0.00999999978
18812	1773	6692	0.699999988
18813	1773	6693	0.699999988
18814	1773	2974	0.600000024
18815	1773	2249	0.5
18816	1773	229	0.200000003
18817	1774	6694	0.899999976
18818	1774	6695	0.709999979
18819	1774	6696	0.620000005
18820	1774	6697	0.560000002
18821	1774	6698	0.25
18822	1774	781	0.0599999987
18823	1774	1283	0.800000012
18824	1774	6699	0.25
18825	1774	5269	0.600000024
18826	1774	37	0.600000024
18827	1774	81	0.600000024
18828	1774	82	0.600000024
18829	1774	6700	0.170000002
18830	1774	83	0.400000006
18831	1774	659	0.400000006
18832	1774	431	0.400000006
18833	1774	632	0.300000012
18834	1774	16	0.330000013
18835	1774	10	0.670000017
18836	1774	6701	0.200000003
18837	1774	2073	0.200000003
18838	1774	2072	0.200000003
18839	1774	6702	0.200000003
18840	1774	6703	0.200000003
18841	1774	6704	0.200000003
18842	1775	16	0.699999988
18843	1775	10	0.200000003
18844	1775	1979	0.899999976
18845	1775	1973	0.99000001
18846	1775	6705	0.899999976
18847	1775	6706	0.600000024
18848	1775	6707	0.5
18849	1776	235	0.5
18850	1776	10	0.5
18851	1776	6708	0.75
18852	1776	236	0.5
18853	1776	1518	0.75
18854	1776	6	0.5
18855	1776	237	0.5
18856	1776	6709	0.5
18857	1776	290	0.75
18858	1776	422	0.5
18859	1776	1514	0.5
18860	1776	6710	0.949999988
18861	1776	15	0.5
18862	1776	845	0.75
18863	1776	255	0.75
18864	1776	292	0.75
18865	1776	324	0.75
18866	1776	619	0.75
18867	1776	6711	0.75
18868	1776	1515	0.75
18869	1776	9	0.5
18870	1776	68	0.5
18871	1776	16	0.5
18872	1777	422	0.5
18873	1777	235	0.5
18874	1777	499	0.5
18875	1777	6712	0.5
18876	1777	395	0.5
18877	1777	6713	0.5
18878	1777	2311	0.5
18879	1777	68	0.5
18880	1777	427	0.5
18881	1777	6	0.5
18882	1777	36	0.5
18883	1777	1414	0.5
18884	1777	9	0.5
18885	1777	10	0.5
18886	1777	5230	0.5
18887	1777	844	0.5
18888	1777	229	0.5
18889	1777	681	0.5
18890	1777	461	0.5
18891	1777	33	0.5
18892	1777	522	0.5
18893	1777	1	0.5
18894	1777	16	0.5
18895	1777	802	0.5
18896	1777	1814	0.5
18897	1777	1511	0.5
18898	1777	6714	0.5
18899	1777	857	0.5
18900	1777	6715	0.5
18901	1777	547	0.5
18902	1777	292	0.5
18903	1777	2488	0.5
18904	1777	21	0.25
18905	1778	6716	0.899999976
18906	1778	3546	0.899999976
18907	1778	40	0.899999976
18908	1778	291	0.899999976
18909	1778	79	0.899999976
18910	1778	82	0.600000024
18911	1779	6717	1
18912	1779	6718	1
18913	1779	6719	0.800000012
18914	1780	6720	1
18915	1781	10	1
18916	1781	16	0
18917	1781	1430	0.699999988
18918	1781	5645	0.699999988
18919	1781	97	0.899999976
18920	1781	6721	0.899999976
18921	1781	6722	0.400000006
18922	1781	5781	0.699999988
18923	1781	2934	0.699999988
18924	1781	1376	0.600000024
18925	1781	505	0.600000024
18926	1781	5171	0.899999976
18927	1782	6723	1
18928	1783	6724	0.5
18929	1783	6725	0.5
18930	1783	6726	0.5
18931	1784	229	0.899999976
18932	1784	767	0.75
18933	1784	3183	0.75
18934	1785	6727	1
18935	1785	235	1
18936	1785	6728	0.800000012
18937	1786	6729	1
18938	1787	6730	1
18939	1788	6731	0.75
18940	1788	235	0.5
18941	1788	37	0.75
18942	1788	15	0.75
18943	1788	6732	0.75
18944	1788	6733	0.949999988
18945	1788	6734	0.75
18946	1788	236	0.5
18947	1788	89	0.75
18948	1788	6	0.5
18949	1788	6735	0.75
18950	1788	1891	0.75
18951	1788	237	0.5
18952	1788	9	0.5
18953	1788	10	0.5
18954	1788	68	0.5
18955	1788	38	0.75
18956	1788	16	0.5
18957	1788	6736	0.949999988
18958	1789	6737	1
18959	1789	445	0.75
18960	1789	21	0.100000001
18961	1789	441	0.5
18962	1789	680	0.5
18963	1789	681	0.25
18964	1790	4288	0.75
18965	1790	37	0.75
18966	1790	419	0.75
18967	1790	2580	0.75
18968	1790	6582	0.75
18969	1790	1332	0.75
18970	1790	107	0.75
18971	1790	425	1
18972	1790	3624	0.75
18973	1790	536	0.75
18974	1790	250	0.75
18975	1790	6738	0.75
18976	1790	6739	0.75
18977	1790	635	0.75
18978	1790	1012	0.75
18979	1791	6740	0.5
18980	1791	6741	0.25
18981	1791	5814	0.5
18982	1791	6742	0.0900000036
18983	1791	6743	0.100000001
18984	1791	6744	0.25
18985	1791	6745	0.5
18986	1791	6746	0.75
18987	1791	1515	0.25
18988	1791	6747	0.75
18989	1792	6748	1
18990	1792	37	0.899999976
18991	1792	6749	0.5
18992	1792	419	0.5
18993	1792	107	0.5
18994	1792	321	0.5
18995	1792	725	0.5
18996	1792	6750	0.75
18997	1792	4660	0.5
18998	1792	632	0.75
18999	1792	472	0.5
19000	1792	6751	0.75
19001	1793	6752	0.899999976
19002	1793	6753	0.899999976
19003	1793	6754	0.5
19004	1793	6755	0.5
19005	1793	6756	0.5
19006	1793	548	1
19007	1794	3338	0.800000012
19008	1794	661	0.899999976
19009	1794	3755	0.800000012
19010	1795	6757	0.600000024
19011	1795	6758	0.5
19012	1795	6759	0.100000001
19013	1795	6165	0.600000024
19014	1795	2923	0.600000024
19015	1795	6760	0.600000024
19016	1795	6761	0.600000024
19017	1796	2922	0.699999988
19018	1796	401	0.899999976
19019	1796	2535	0.800000012
19020	1796	6762	0.699999988
19021	1797	37	0.5
19022	1797	292	0.5
19023	1797	324	0.5
19024	1797	6763	0.5
19025	1797	6764	0.25
19026	1797	426	0.25
19027	1797	191	0.25
19028	1797	6765	0.5
19029	1797	291	0.5
19030	1797	126	0.25
19031	1798	235	0.5
19032	1798	236	0.5
19033	1798	6	0.5
19034	1798	237	0.5
19035	1798	10	0.5
19036	1798	3313	0.100000001
19037	1798	3324	0.100000001
19038	1798	3315	0.100000001
19039	1798	3318	0.949999988
19040	1798	1069	1
19041	1798	3319	0.949999988
19042	1798	3320	0.949999988
19043	1798	9	0.5
19044	1798	68	0.5
19045	1798	231	0.75
19046	1798	3322	0.949999988
19047	1798	3323	0.949999988
19048	1798	3325	0.100000001
19049	1798	6766	0.75
19050	1798	16	0.5
19051	1798	1054	0.5
19052	1798	3727	0.25
19053	1798	257	0.5
19054	1799	290	0.75
19055	1799	236	0.5
19056	1799	6	0.5
19057	1799	237	0.5
19058	1799	10	0.5
19059	1799	3313	0.100000001
19060	1799	3324	0.100000001
19061	1799	6767	1
19062	1799	3315	0.100000001
19063	1799	632	0.5
19064	1799	3318	0.949999988
19065	1799	1069	1
19066	1799	3319	0.949999988
19067	1799	324	0.75
19068	1799	37	0.75
19069	1799	619	0.25
19070	1799	6768	0.75
19071	1799	3320	0.949999988
19072	1799	257	0.75
19073	1799	9	0.5
19074	1799	68	0.5
19075	1799	3322	0.949999988
19076	1799	3323	0.949999988
19077	1799	3314	0.75
19078	1799	3325	0.100000001
19079	1799	16	0.5
19080	1799	1054	0.5
19081	1799	1842	0.75
19082	1799	292	0.5
19083	1800	6769	0.5
19084	1800	235	0.5
19085	1800	6770	0.5
19086	1800	191	0.75
19087	1800	6768	0.75
19088	1800	3320	0.949999988
19089	1800	236	0.5
19090	1800	293	0.5
19091	1800	6771	0.5
19092	1800	6772	0.75
19093	1800	1270	0.5
19094	1800	237	0.5
19095	1800	6	0.5
19096	1800	10	0.5
19097	1800	68	0.5
19098	1800	3313	0.100000001
19099	1800	6763	0.5
19100	1800	3322	0.949999988
19101	1800	6773	0.5
19102	1800	3323	0.949999988
19103	1800	16	0.5
19104	1800	3324	0.100000001
19105	1800	6774	1
19106	1800	3325	0.100000001
19107	1800	6775	0.5
19108	1800	3315	0.100000001
19109	1800	3319	0.949999988
19110	1800	6776	0.25
19111	1800	1511	0.25
19112	1800	3318	0.949999988
19113	1800	1069	1
19114	1800	6777	0.5
19115	1800	1054	0.5
19116	1800	9	0.5
19117	1801	6778	1
19118	1801	2255	0.5
19119	1801	767	0.200000003
19120	1801	6582	0.400000006
19121	1801	851	0.5
19122	1801	6779	0.100000001
19123	1801	6780	0.5
19124	1801	6781	0.400000006
19125	1801	16	0.600000024
19126	1801	10	0.400000006
19127	1801	68	0.00999999978
19128	1801	1979	0.800000012
19129	1801	3420	0.200000003
19130	1801	6782	0.899999976
19131	1801	6783	0.899999976
19132	1801	6784	0.899999976
19133	1801	6785	0.899999976
19134	1801	6786	0.699999988
19135	1801	1094	0.699999988
19136	1801	6787	0.699999988
19137	1801	6788	0.699999988
19138	1801	90	0.400000006
19139	1801	1197	0.400000006
19140	1801	6789	0.699999988
19141	1801	6790	0.600000024
19142	1801	6791	0.699999988
19143	1801	6792	0.699999988
19144	1801	3226	0.699999988
19145	1802	37	0.899999976
19146	1802	2977	0.200000003
19147	1802	12	0.899999976
19148	1802	163	0.800000012
19149	1802	250	0.899999976
19150	1802	659	0.200000003
19151	1802	6276	0
19152	1802	6277	0.300000012
19153	1802	6278	0.949999988
19154	1803	37	0.5
19155	1803	4744	0.5
19156	1803	597	0.5
19157	1803	419	0.5
19158	1803	401	0.5
19159	1803	4745	0.5
19160	1803	1012	0.5
19161	1803	635	0.5
19162	1804	6793	1
19163	1804	6794	0.899999976
19164	1804	6795	0.899999976
19165	1804	1973	1
19166	1804	71	0.600000024
19167	1804	6796	0.800000012
19168	1804	2848	0.600000024
19169	1804	2461	0.699999988
19170	1804	401	0.699999988
19171	1804	4484	0.600000024
19172	1804	2021	0.600000024
19173	1804	997	0.100000001
19174	1804	6797	0.800000012
19175	1804	90	0.699999988
19176	1804	6798	0.699999988
19177	1804	6799	0.400000006
19178	1804	6800	0.899999976
19179	1804	10	0.800000012
19180	1804	16	0.200000003
19181	1805	235	0.5
19182	1805	3262	0.100000001
19183	1805	3051	0.75
19184	1805	236	0.5
19185	1805	82	0.75
19186	1805	2996	0.100000001
19187	1805	237	0.5
19188	1805	10	0.5
19189	1805	6801	0.949999988
19190	1805	74	0.75
19191	1805	6802	0.949999988
19192	1805	241	0.100000001
19193	1805	6803	0.949999988
19194	1805	6804	0.75
19195	1805	36	0.75
19196	1805	6	0.5
19197	1805	68	0.5
19198	1805	33	0.75
19199	1805	3554	0.100000001
19200	1805	531	0.100000001
19201	1805	16	0.5
19202	1805	9	0.5
19203	1806	6805	0.600000024
19204	1806	194	0.600000024
19205	1806	6806	0.600000024
19206	1806	745	0.300000012
19207	1806	6807	0.5
19208	1806	6808	0.5
19209	1806	6809	0.800000012
19210	1806	6810	0.600000024
19211	1807	3632	0.699999988
19212	1807	6811	0.600000024
19213	1807	5761	0.400000006
19214	1807	6812	0.5
19215	1807	6813	0.5
19216	1807	6814	0.5
19217	1807	2923	0.699999988
19218	1807	6165	0.699999988
19219	1807	6815	0.400000006
19220	1807	6816	0.400000006
19221	1808	2923	0.899999976
19222	1808	6165	0.899999976
19223	1808	6817	0.800000012
19224	1808	6818	0.699999988
19225	1808	6819	0.600000024
19226	1808	6820	0.5
19227	1808	6821	0.400000006
19228	1808	247	0.699999988
19229	1808	6822	0.699999988
19230	1808	2922	0.699999988
19231	1808	6823	0.699999988
19232	1808	6824	0.920000017
19233	1808	127	0.300000012
19234	1809	522	0.5
19235	1809	6825	0.5
19236	1809	5960	0.5
19237	1809	427	0.5
19238	1810	229	0.959999979
19239	1810	6826	0.819999993
19240	1810	292	0.790000021
19241	1810	6827	0.75
19242	1810	6828	0.899999976
19243	1810	6829	0.5
19244	1810	6830	0.5
19245	1810	6831	0.25
19246	1810	6832	0.100000001
19247	1811	6833	0.899999976
19248	1811	6834	0.899999976
19249	1811	6835	0.100000001
19250	1812	235	0.5
19251	1812	16	0.5
19252	1812	10	0.5
19253	1812	6836	0.75
19254	1812	3403	0.25
19255	1812	6837	0.75
19256	1812	6838	0.75
19257	1812	6839	0.75
19258	1812	6	0.5
19259	1812	851	0.75
19260	1812	237	0.5
19261	1812	9	0.5
19262	1812	236	0.5
19263	1812	68	0.5
19264	1812	6840	0.25
19265	1812	6841	0.949999988
19266	1812	6842	0.100000001
19267	1813	235	0.5
19268	1813	236	0.5
19269	1813	6	0.5
19270	1813	237	0.5
19271	1813	4195	0.100000001
19272	1813	10	0.5
19273	1813	6841	0.949999988
19274	1813	15	0.100000001
19275	1813	3403	0.25
19276	1813	6843	0.75
19277	1813	6844	0.75
19278	1813	6840	0.25
19279	1813	12	0.75
19280	1813	6845	0.75
19281	1813	6839	0.75
19282	1813	495	0.5
19283	1813	9	0.5
19284	1813	68	0.5
19285	1813	45	0.100000001
19286	1813	461	0
19287	1813	259	0.75
19288	1813	6846	0.75
19289	1813	6847	0.75
19290	1813	6848	0.75
19291	1813	6849	0.75
19292	1813	16	0.5
19293	1813	6842	0.100000001
19294	1814	235	0.5
19295	1814	16	0.5
19296	1814	10	0.5
19297	1814	6850	0.75
19298	1814	236	0.5
19299	1814	43	0.75
19300	1814	68	0.5
19301	1814	6851	0.75
19302	1814	6839	0.75
19303	1814	6	0.5
19304	1814	237	0.5
19305	1814	9	0.5
19306	1814	6852	0.75
19307	1814	3403	0.25
19308	1814	6840	0.25
19309	1814	6853	0.75
19310	1814	6841	0.949999988
19311	1814	6837	0.75
19312	1814	6842	0.100000001
19313	1815	235	0.5
19314	1815	37	0.25
19315	1815	1498	0.75
19316	1815	395	0.75
19317	1815	236	0.5
19318	1815	553	0.75
19319	1815	6	0
19320	1815	237	0.5
19321	1815	9	0
19322	1815	10	0.5
19323	1815	68	0
19324	1815	1507	0.75
19325	1815	6854	1
19326	1815	4211	0.75
19327	1815	16	0.5
19328	1815	1729	0.75
19329	1816	6855	1
19330	1817	421	0.899999976
19331	1817	6856	0.75
19332	1817	6857	0.75
19333	1817	6858	0.75
19334	1817	6859	0.5
19335	1817	6860	0.75
19336	1817	3043	1
19337	1817	6861	1
19338	1817	6862	1
19339	1817	6863	1
19340	1818	6864	1
19341	1819	6865	0.75
19342	1819	211	0.75
19343	1819	6866	0.5
19344	1819	76	0.75
19345	1819	2010	0.899999976
19346	1819	105	0.75
19347	1819	4530	0.400000006
19348	1819	5951	0.330000013
19349	1819	13	0.129999995
19350	1819	2854	0.100000001
19351	1819	6867	0.899999976
19352	1819	6868	1
19353	1819	6869	0.899999976
19354	1819	6870	0.899999976
19355	1819	6871	0.75
19356	1820	6872	0.200000003
19357	1820	6873	0.899999976
19358	1820	6874	0.75
19359	1820	6875	0.75
19360	1821	348	0.75
19361	1821	235	0.5
19362	1821	236	0.5
19363	1821	6	0.5
19364	1821	237	0.5
19365	1821	9	0.5
19366	1821	10	0.5
19367	1821	68	0.5
19368	1821	863	0.75
19369	1821	6573	0.75
19370	1821	5424	0.75
19371	1821	536	0.75
19372	1821	16	0.5
19373	1821	6876	0.949999988
19374	1822	6877	1
19375	1823	6878	0.899999976
19376	1823	860	0.899999976
19377	1823	6879	0.899999976
19378	1823	6880	0.899999976
19379	1823	6881	0.899999976
19380	1824	24	0.600000024
19381	1824	946	0.600000024
19382	1824	449	0.600000024
19383	1824	127	0.600000024
19384	1824	3757	0.699999988
19385	1824	277	0.899999976
19386	1824	275	0.5
19387	1824	8	0.899999976
19388	1824	12	0.699999988
19389	1825	6882	1
19390	1825	1430	1
19391	1825	262	1
19392	1825	10	1
19393	1825	378	0.5
19394	1825	16	0
19395	1826	24	0.800000012
19396	1826	6883	0.899999976
19397	1826	16	0.800000012
19398	1826	10	0.200000003
19399	1826	6884	1
19400	1826	6135	0.899999976
19401	1826	6885	0.899999976
19402	1826	6886	0.899999976
19403	1826	6887	0.899999976
19404	1826	421	0.800000012
19405	1826	6888	0.699999988
19406	1826	781	0.600000024
19407	1826	6295	0.5
19408	1826	13	0
19409	1826	6889	0
19410	1826	816	0
19411	1826	2072	0
19412	1826	6890	0
19413	1827	6891	1
19414	1827	6892	1
19415	1827	6893	1
19416	1827	1901	0.899999976
19417	1827	6894	1
19418	1827	115	0.899999976
19419	1827	6895	0.5
19420	1827	6896	0.800000012
19421	1827	6897	1
19422	1827	6898	0.300000012
19423	1827	1998	0.300000012
19424	1827	6899	1
19425	1827	5760	0.5
19426	1827	6900	0.400000006
19427	1828	6901	1
19428	1828	6902	1
19429	1829	6903	1
19430	1830	6904	0.5
19431	1830	122	0.5
19432	1830	82	0.5
19433	1830	10	0.5
19434	1830	40	0.5
19435	1830	441	0.5
19436	1830	1	0.5
19437	1830	6905	0.5
19438	1830	6906	0.5
19439	1830	4162	0.5
19440	1830	6907	0.5
19441	1830	4156	0.5
19442	1830	107	0.5
19443	1830	3087	0.5
19444	1830	1772	0.5
19445	1830	4160	0.5
19446	1830	6908	0.5
19447	1830	9	0.5
19448	1830	68	0.5
19449	1830	33	0.5
19450	1830	489	0.5
19451	1830	4159	0.100000001
19452	1830	6909	0.5
19453	1830	6910	0.5
19454	1830	445	0.5
19455	1830	16	0.5
19456	1830	6911	0.5
19457	1830	546	0.5
19458	1830	5802	0.5
19459	1830	717	0.5
19460	1830	6	0.5
19461	1830	6912	0.5
19462	1830	6913	0.5
19463	1830	522	0.5
19464	1830	74	0.5
19465	1830	395	0.5
19466	1830	4154	0.5
19467	1830	2538	0.5
19468	1830	4153	0.5
19469	1830	107	0.5
19470	1830	36	0.5
19471	1830	344	0.5
19472	1830	291	0.5
19473	1830	6906	0.5
19474	1830	6914	0.5
19475	1830	2694	0.5
19476	1830	2540	0.5
19477	1830	526	0.5
19478	1830	40	0.5
19479	1830	6915	0.5
19480	1830	800	0.5
19481	1830	1422	0.5
19482	1830	2018	0.5
19483	1830	32	0.5
19484	1830	1131	0.5
19485	1831	6916	0.800000012
19486	1831	344	0.300000012
19487	1831	6917	0.200000003
19488	1831	16	0.200000003
19489	1831	10	0.800000012
19490	1831	37	0.300000012
19491	1831	38	0.300000012
19492	1831	89	0.300000012
19493	1831	88	0.300000012
19494	1831	393	0.300000012
19495	1831	90	0.300000012
19496	1831	6918	0.300000012
19497	1831	6919	0.300000012
19498	1831	950	0.300000012
19499	1831	395	0.300000012
19500	1831	53	0.300000012
19501	1831	291	0.300000012
19502	1831	4161	0.400000006
19503	1831	896	0.5
19504	1831	499	0.5
19505	1831	3140	0.5
19506	1831	5802	0.5
19507	1831	3224	0.5
19508	1831	6911	0.5
19509	1831	4387	0.5
19510	1831	12	0.400000006
19511	1831	82	0.400000006
19512	1831	6920	0.699999988
19513	1831	6921	0.300000012
19514	1832	82	0.800000012
19515	1832	445	0.800000012
19516	1832	277	0.600000024
19517	1832	2547	0.5
19518	1832	6911	0.800000012
19519	1832	2694	0.600000024
19520	1832	489	0.600000024
19521	1832	4091	0.400000006
19522	1832	6922	0.600000024
19523	1832	291	0.699999988
19524	1832	395	0.600000024
19525	1832	6923	0.5
19526	1832	122	0.400000006
19527	1832	40	0.400000006
19528	1832	74	0.5
19529	1832	6924	0.400000006
19530	1832	10	0.600000024
19531	1832	16	0.400000006
19532	1832	37	0.699999988
19533	1832	12	0.699999988
19534	1832	441	0.699999988
19535	1832	1891	0.600000024
19536	1832	6925	0.600000024
19537	1832	6926	0.5
19538	1832	6927	0.600000024
19539	1832	2466	0.300000012
19540	1833	6928	0.99000001
19541	1833	6929	0.600000024
19542	1833	6930	0.600000024
19543	1833	82	0.800000012
19544	1833	445	0.800000012
19545	1833	277	0.600000024
19546	1833	2547	0.5
19547	1833	6911	0.800000012
19548	1833	2694	0.600000024
19549	1833	489	0.600000024
19550	1833	4091	0.400000006
19551	1833	6922	0.600000024
19552	1833	291	0.699999988
19553	1833	395	0.600000024
19554	1833	6923	0.5
19555	1833	122	0.400000006
19556	1833	40	0.400000006
19557	1833	74	0.5
19558	1833	6924	0.400000006
19559	1833	10	0.600000024
19560	1833	16	0.400000006
19561	1833	37	0.699999988
19562	1833	12	0.699999988
19563	1833	441	0.699999988
19564	1833	1891	0.600000024
19565	1833	6925	0.600000024
19566	1833	6926	0.5
19567	1833	6927	0.600000024
19568	1833	2466	0.300000012
19569	1834	6931	0.75
19570	1834	6932	0.25
19571	1834	6933	0.899999976
19572	1835	6934	1
19573	1835	6935	0.25
19574	1836	6936	1
19575	1836	6937	0.5
19576	1836	105	0.5
19577	1836	76	0.100000001
19578	1836	568	0.25
19579	1836	6938	0.5
19580	1836	6939	0.25
19581	1836	6940	0.5
19582	1837	631	0.660000026
19583	1837	6941	0.75
19584	1837	6942	0.899999976
19585	1837	37	0.5
19586	1837	291	0.5
19587	1837	53	0.5
19588	1837	292	0.5
19589	1837	419	0.5
19590	1837	15	1
19591	1837	1758	0.5
19592	1837	1759	0.25
19593	1837	6943	0.899999976
19594	1837	1762	0.769999981
19595	1837	6944	0.180000007
19596	1837	6945	0.75
19597	1838	2156	0.899999976
19598	1838	9	0.100000001
19599	1838	6946	0.800000012
19600	1838	941	0.25
19601	1839	6947	0.75
19602	1839	6948	0.899999976
19603	1840	16	0.75
19604	1840	10	0.25
19605	1840	6949	0.75
19606	1840	6948	0.899999976
19607	1841	6950	1
19608	1841	6951	0.75
19609	1842	6952	1
19610	1843	6953	1
19611	1843	6954	0.899999976
19612	1843	6955	1
19613	1844	16	0.600000024
19614	1844	10	0.400000006
19615	1844	68	0.0500000007
19616	1844	71	0.800000012
19617	1844	3627	0.699999988
19618	1844	6956	0.800000012
19619	1844	6957	0.800000012
19620	1844	6958	0.400000006
19621	1844	6959	0.400000006
19622	1844	6960	0.699999988
19623	1844	6961	0.699999988
19624	1844	72	0.600000024
19625	1844	4480	1
19626	1844	6962	0.800000012
19627	1844	6963	0.699999988
19628	1845	6964	0.800000012
19629	1845	6965	0.200000003
19630	1845	16	0.600000024
19631	1845	10	0.400000006
19632	1845	9	0.949999988
19633	1845	68	0.0500000007
19634	1845	194	0.100000001
19635	1845	229	0.100000001
19636	1845	6966	0.600000024
19637	1845	6967	0.600000024
19638	1845	6968	0.699999988
19639	1845	6969	0.600000024
19640	1845	6970	0.5
19641	1845	6971	0.400000006
19642	1846	16	0
19643	1846	10	1
19644	1846	505	0.949999988
19645	1846	1430	0.200000003
19646	1846	2227	0.949999988
19647	1846	6972	0.699999988
19648	1846	6828	0.800000012
19649	1846	6973	0.600000024
19650	1846	2136	0.25
19651	1846	6974	0.800000012
19652	1846	33	0.699999988
19653	1846	36	0.699999988
19654	1846	6975	0.600000024
19655	1846	6976	0.5
19656	1847	16	1
19657	1847	10	0
19658	1847	5401	0.800000012
19659	1847	6977	0.400000006
19660	1847	2227	0.949999988
19661	1847	193	0.949999988
19662	1847	6978	0.949999988
19663	1847	6979	0.699999988
19664	1847	767	0.100000001
19665	1847	33	0.400000006
19666	1847	36	0.400000006
19667	1847	37	0.400000006
19668	1847	6980	0.899999976
19669	1847	4416	0.00999999978
19670	1847	6981	0.400000006
19671	1847	6982	0.899999976
19672	1847	6983	0
19673	1847	6984	0.600000024
19674	1848	247	0.200000003
19675	1848	6985	0.699999988
19676	1848	6986	0.5
19677	1848	10	0.670000017
19678	1848	16	0.330000013
19679	1848	6987	1
19680	1848	6988	0.949999988
19681	1848	6989	0.99000001
19682	1849	6990	1
19683	1850	2379	0.150000006
19684	1850	2342	0.200000003
19685	1850	2959	0.300000012
19686	1850	16	0.439999998
19687	1850	10	0.560000002
19688	1850	163	0.800000012
19689	1850	235	1
19690	1850	1278	0.899999976
19691	1850	12	0.800000012
19692	1850	421	0.800000012
19693	1850	997	0.699999988
19694	1850	359	0.800000012
19695	1850	76	0.699999988
19696	1851	6991	0.5
19697	1851	229	0.5
19698	1852	229	0.75
19699	1853	37	0.600000024
19700	1853	6992	0.75
19701	1853	292	0.5
19702	1853	844	0.5
19703	1853	357	0.5
19704	1853	6993	0.5
19705	1853	33	0.5
19706	1853	250	0.5
19707	1854	6994	1
19708	1854	6995	1
19709	1855	33	0.5
19710	1855	36	0.5
19711	1855	74	0.5
19712	1856	37	0.600000024
19713	1856	6992	0.75
19714	1856	292	0.5
19715	1856	844	0.5
19716	1856	357	0.5
19717	1856	6993	0.5
19718	1856	33	0.5
19719	1856	250	0.5
19720	1857	6996	1
19721	1858	6997	1
19722	1859	6998	1
19723	1860	913	0.600000024
19724	1860	292	0.600000024
19725	1860	681	0.600000024
19726	1860	33	0.600000024
19727	1860	36	0.600000024
19728	1860	6999	0.600000024
19729	1860	162	0.300000012
19730	1860	7000	0.949999988
19731	1860	7001	0.5
19732	1860	7002	0.600000024
19733	1860	7003	1
19734	1861	7004	1
19735	1861	3690	0.5
19736	1861	869	0.5
19737	1861	122	0.5
19738	1861	15	0.5
19739	1861	7005	0.5
19740	1861	7006	0.200000003
19741	1861	7007	0.200000003
19742	1861	7008	0.200000003
19743	1861	7009	0.200000003
19744	1861	7010	0.200000003
19745	1862	922	0.200000003
19746	1862	7011	0.200000003
19747	1862	7012	0.200000003
19748	1862	1270	0.200000003
19749	1862	547	0.699999988
19750	1862	4439	0.5
19751	1862	3137	0.5
19752	1862	36	0.800000012
19753	1862	422	0.300000012
19754	1862	4193	0.600000024
19755	1863	292	0.800000012
19756	1863	547	0.800000012
19757	1863	74	0.699999988
19758	1863	1644	0.699999988
19759	1863	7013	0.5
19760	1863	36	0.699999988
19761	1863	329	0.600000024
19762	1863	7014	0.600000024
19763	1863	3087	0.699999988
19764	1863	551	0.600000024
19765	1863	6024	0.5
19766	1863	7015	0.699999988
19767	1864	7016	0.899999976
19768	1864	7017	0.699999988
19769	1864	37	0.5
19770	1864	357	0.400000006
19771	1864	292	0.600000024
19772	1864	15	0.600000024
19773	1864	844	0.5
19774	1864	315	0.5
19775	1864	33	0.600000024
19776	1864	163	0.400000006
19777	1865	6900	0.200000003
19778	1865	79	0.800000012
19779	1865	40	0.800000012
19780	1865	40	0.800000012
19781	1865	7018	0.699999988
19782	1865	7019	0.699999988
19783	1865	397	0.600000024
19784	1865	2109	0.5
19785	1865	277	0.699999988
19786	1865	5550	0.800000012
19787	1865	12	0.699999988
19788	1865	7020	0.150000006
19789	1865	82	0.150000006
19790	1866	7021	0.300000012
19791	1866	7022	0.5
19792	1866	5550	0.800000012
19793	1866	38	0.699999988
19794	1866	37	0.699999988
19795	1866	107	0.699999988
19796	1866	442	0.400000006
19797	1866	45	0.400000006
19798	1866	7023	0.300000012
19799	1866	4150	0.5
19800	1866	2538	0.5
19801	1866	419	0.5
19802	1866	43	0.5
19803	1866	7024	0.5
19804	1866	3522	0.600000024
19805	1866	5613	0.5
19806	1866	3835	0.5
19807	1866	1081	0.200000003
19808	1866	7025	0.5
19809	1867	6313	0.699999988
19810	1867	7026	0.699999988
19811	1867	163	0.699999988
19812	1867	40	0.699999988
19813	1867	7027	0.699999988
19814	1867	434	0.400000006
19815	1867	292	0.699999988
19816	1867	547	0.699999988
19817	1867	499	0.800000012
19818	1867	315	0.5
19819	1867	551	0.400000006
19820	1867	1611	0.300000012
19821	1868	5550	0.899999976
19822	1868	33	0.800000012
19823	1868	36	0.699999988
19824	1868	681	0.800000012
19825	1868	291	0.800000012
19826	1868	292	0.800000012
19827	1868	499	0.800000012
19828	1868	857	0.699999988
19829	1868	1131	0.5
19830	1868	551	0.5
19831	1868	7028	0.800000012
19832	1868	7029	0.699999988
19833	1868	277	0.800000012
19834	1868	40	0.800000012
19835	1868	79	0.800000012
19836	1869	7030	0.800000012
19837	1869	7031	0.600000024
19838	1869	292	0.899999976
19839	1869	53	0.699999988
19840	1869	33	0.699999988
19841	1869	681	0.699999988
19842	1869	547	0.600000024
19843	1869	422	0.5
19844	1869	162	0.5
19845	1870	12	0.5
19846	1870	434	0.5
19847	1870	40	0.5
19848	1870	7032	0.5
19849	1870	7033	0.75
19850	1870	7034	0.5
19851	1870	79	0.5
19852	1871	40	0.5
19853	1871	7035	0.5
19854	1871	33	0.5
19855	1871	680	0.5
19856	1871	2021	0.5
19857	1871	14	0.5
19858	1871	7036	0.5
19859	1871	163	0.5
19860	1871	36	0.5
19861	1871	12	0.5
19862	1872	681	0.100000001
19863	1872	7037	0.5
19864	1873	7038	0.75
19865	1873	7039	0.75
19866	1873	2150	0.25
19867	1873	292	0.5
19868	1873	36	0.5
19869	1873	1263	0.5
19870	1873	681	0.5
19871	1874	7040	0.5
19872	1874	781	0.5
19873	1874	7041	0.5
19874	1875	3288	0.800000012
19875	1875	7042	0.5
19876	1875	71	0.5
19877	1875	7043	0.5
19878	1875	7044	0.899999976
19879	1875	1263	0.25
19880	1875	7045	0.25
19881	1875	8	0.25
19882	1876	14	0.75
19883	1876	7046	0.5
19884	1876	7047	0.5
19885	1876	1364	0.5
19886	1877	7048	1
19887	1878	7048	1
19888	1879	7048	1
19889	1880	7049	0.5
19890	1880	7030	0.800000012
19891	1880	292	0.800000012
19892	1880	489	0.800000012
19893	1880	547	0.800000012
19894	1880	971	0.800000012
19895	1880	162	0.400000006
19896	1880	422	0.5
19897	1880	12	0.600000024
19898	1880	434	0.600000024
19899	1880	1263	0.600000024
19900	1880	8	0.600000024
19901	1880	442	0.699999988
19902	1880	36	0.699999988
19903	1880	14	0.699999988
19904	1880	913	0.699999988
19905	1880	421	0.200000003
19906	1880	45	0.600000024
19907	1880	4195	0.600000024
19908	1880	7050	0.600000024
19909	1881	7051	0.800000012
19910	1881	7017	0.699999988
19911	1881	37	0.5
19912	1881	357	0.400000006
19913	1881	292	0.600000024
19914	1881	15	0.600000024
19915	1881	844	0.5
19916	1881	315	0.5
19917	1881	7052	0.800000012
19918	1881	33	0.600000024
19919	1881	163	0.400000006
19920	1882	1511	0.5
19921	1882	1197	0.5
19922	1882	7053	0.5
19923	1882	7054	0.5
19924	1882	3533	0.5
19925	1882	1129	0.5
19926	1882	162	0.5
19927	1882	33	0.5
19928	1882	36	0.5
19929	1882	4193	0.5
19930	1883	315	0.600000024
19931	1883	442	0.600000024
19932	1883	7055	0.699999988
19933	1883	7056	0.5
19934	1883	4209	0.5
19935	1883	1497	0.699999988
19936	1883	7023	0.5
19937	1883	7057	0.5
19938	1883	7058	0.699999988
19939	1884	7059	0.5
19940	1884	24	0.5
19941	1884	1497	0.800000012
19942	1884	79	0.800000012
19943	1884	304	0.800000012
19944	1884	277	0.699999988
19945	1884	1864	0.600000024
19946	1884	1384	0.400000006
19947	1885	7060	0.699999988
19948	1885	7061	0.800000012
19949	1885	1926	0.800000012
19950	1885	809	0.699999988
19951	1885	7062	0.600000024
19952	1885	7063	0.600000024
19953	1885	1775	0.200000003
19954	1885	4184	0.400000006
19955	1885	913	0.600000024
19956	1885	292	0.600000024
19957	1885	681	0.600000024
19958	1885	33	0.600000024
19959	1885	36	0.600000024
19960	1885	6999	0.600000024
19961	1885	162	0.300000012
19962	1885	7001	0.5
19963	1885	7002	0.600000024
19964	1886	7004	1
19965	1887	7064	0.600000024
19966	1887	3	0.699999988
19967	1887	329	0.699999988
19968	1887	42	0.699999988
19969	1887	7062	0.600000024
19970	1887	7063	0.600000024
19971	1887	851	0.300000012
19972	1887	7065	0.300000012
19973	1888	315	0.600000024
19974	1888	499	0.600000024
19975	1888	162	0.300000012
19976	1888	7063	0.600000024
19977	1888	422	0.5
19978	1888	7017	0.899999976
19979	1889	7066	0.400000006
19980	1889	6679	0.400000006
19981	1889	7067	0.800000012
19982	1890	7048	1
19983	1891	292	0.5
19984	1891	551	0.5
19985	1891	461	0.25
19986	1891	681	0.5
19987	1891	7068	0.5
19988	1891	7069	0.5
19989	1892	292	0.75
19990	1892	489	0.75
19991	1892	547	0.75
19992	1892	422	0.5
19993	1892	7070	0.75
19994	1892	7071	0.600000024
19995	1892	2109	0.5
19996	1893	79	0.75
19997	1893	40	0.75
19998	1893	971	0.5
19999	1893	547	0.5
20000	1893	33	0.5
20001	1893	275	0.5
20002	1893	1263	0.5
20003	1893	7072	0.5
20004	1893	421	0.5
20005	1893	3300	0.25
20006	1893	36	0.5
20007	1894	7073	1
20008	1895	7074	1
20009	1896	7048	1
20010	1897	359	0.5
20011	1897	7075	0.5
20012	1897	1773	0.5
20013	1898	7076	1
20014	1898	7077	0.899999976
20015	1898	79	0.75
20016	1898	2066	0.5
20017	1898	40	0.75
20018	1898	7078	0.75
20019	1899	14	0.899999976
20020	1899	896	0.5
20021	1899	401	0.5
20022	1899	292	0.5
20023	1899	427	0.5
20024	1899	518	0.5
20025	1899	291	0.5
20026	1899	83	0.5
20027	1900	522	0.699999988
20028	1900	4747	0.699999988
20029	1900	7079	0.600000024
20030	1900	7080	0.699999988
20031	1900	7081	0.200000003
20032	1900	800	0.699999988
20033	1900	2693	0.699999988
20034	1900	7082	0.300000012
20035	1900	2694	0.699999988
20036	1900	395	0.600000024
20037	1900	90	0.5
20038	1901	4017	0.800000012
20039	1901	194	0.699999988
20040	1901	71	0.699999988
20041	1901	249	0.699999988
20042	1901	115	0.699999988
20043	1901	7083	0.600000024
20044	1901	441	0.600000024
20045	1901	12	0.600000024
20046	1901	7084	0.600000024
20047	1901	434	0.600000024
20048	1901	913	0.5
20049	1901	7085	0.5
20050	1901	7086	0.5
20051	1901	3985	0.5
20052	1901	1844	0.400000006
20053	1901	7087	0.800000012
20054	1901	1814	0.699999988
20055	1901	511	0.699999988
20056	1901	6493	0.699999988
20057	1901	7088	0.600000024
20058	1901	7089	0.800000012
20059	1901	4620	0.800000012
20060	1901	292	0.600000024
20061	1901	5036	0.699999988
20062	1901	844	0.5
20063	1902	7090	1
20064	1903	7091	0.699999988
20065	1903	7064	0.600000024
20066	1903	7061	0.800000012
20067	1903	1926	0.800000012
20068	1903	809	0.699999988
20069	1903	7062	0.600000024
20070	1903	7063	0.600000024
20071	1903	1775	0.200000003
20072	1903	4184	0.400000006
20073	1904	6202	0.699999988
20074	1904	7023	0.5
20075	1904	7092	0.5
20076	1904	83	0.5
20077	1904	291	0.600000024
20078	1904	681	0.600000024
20079	1904	421	0.400000006
20080	1904	395	0.600000024
20081	1904	7093	0.800000012
20082	1904	551	0.5
20083	1904	12	0.699999988
20084	1904	7040	0.699999988
20085	1904	1303	0.5
20086	1905	7094	0.899999976
20087	1905	868	0.699999988
20088	1905	844	0.699999988
20089	1905	2547	0.699999988
20090	1905	6259	0.5
20091	1905	1379	0.5
20092	1906	292	0.800000012
20093	1906	913	0.800000012
20094	1906	8	0.300000012
20095	1906	680	0.400000006
20096	1907	7048	1
20097	1908	7048	1
20098	1909	7095	0.949999988
20099	1909	1263	0.899999976
20100	1909	4112	0.899999976
20101	1909	5424	0.899999976
20102	1909	7084	0.899999976
20103	1909	7096	0.800000012
20104	1909	7097	0.800000012
20105	1909	7098	0.800000012
20106	1909	36	0.800000012
20107	1909	74	0.800000012
20108	1909	441	0.800000012
20109	1909	7027	0.699999988
20110	1909	395	0.699999988
20111	1909	1618	0.699999988
20112	1910	7048	1
20113	1911	7048	1
20114	1912	7048	1
20115	1913	7048	1
20116	1914	7048	1
20117	1915	7048	1
20118	1916	7048	1
20119	1917	7048	1
20120	1918	7048	1
20121	1919	7048	1
20122	1920	7048	1
20123	1921	7048	1
20124	1922	7048	1
20125	1923	7099	1
20126	1924	7099	1
20127	1925	7100	1
20128	1925	7101	0.5
20129	1925	7102	0.5
20130	1926	7103	0.899999976
20131	1926	7104	0.699999988
20132	1926	7105	0.699999988
20133	1926	79	0.699999988
20134	1926	7106	0.699999988
20135	1926	36	0.699999988
20136	1926	163	0.600000024
20137	1926	40	0.600000024
20138	1926	421	0.400000006
20139	1926	304	0.600000024
20140	1926	7107	0.899999976
20141	1927	7040	0.600000024
20142	1927	442	0.600000024
20143	1927	315	0.600000024
20144	1927	293	0.400000006
20145	1927	162	0.200000003
20146	1927	472	0.400000006
20147	1927	7093	0.600000024
20148	1927	7108	0.5
20149	1927	1618	0.5
20150	1927	2977	0.400000006
20151	1928	7109	0.600000024
20152	1928	7110	0.600000024
20153	1928	7111	0.5
20154	1928	24	0.5
20155	1928	7112	0.899999976
20156	1929	1231	0.699999988
20157	1929	83	0.5
20158	1929	3234	0.5
20159	1929	869	0.5
20160	1929	390	0.5
20161	1929	3998	0.400000006
20162	1929	397	0.400000006
20163	1929	275	0.400000006
20164	1929	329	0.400000006
20165	1929	801	0.600000024
20166	1929	427	0.600000024
20167	1929	7113	0.5
20168	1929	4788	0.5
20169	1929	2694	0.5
20170	1929	293	0.5
20171	1929	1127	0.5
20172	1929	7114	0.5
20173	1929	395	0.400000006
20174	1929	1618	0.400000006
20175	1929	844	0.5
20176	1929	442	0.200000003
20177	1929	36	0.300000012
20178	1929	163	0.5
20179	1930	6188	0.899999976
20180	1930	7115	0.899999976
20181	1930	7116	0.899999976
20182	1930	7117	0.949999988
20183	1930	7118	0.899999976
20184	1930	33	0.899999976
20185	1930	36	0.899999976
20186	1930	378	0.800000012
20187	1930	74	0.800000012
20188	1930	292	0.800000012
20189	1930	681	0.699999988
20190	1930	12	0.800000012
20191	1930	445	0.800000012
20192	1930	1330	0.800000012
20193	1930	40	0.800000012
20194	1930	857	0.699999988
20195	1930	8	0.600000024
20196	1930	315	0.100000001
20197	1931	7119	1
20198	1931	7120	1
20199	1932	7121	0.600000024
20200	1932	1048	0.600000024
20201	1932	14	0.800000012
20202	1932	36	0.800000012
20203	1932	391	0.600000024
20204	1932	8	0.699999988
20205	1932	40	0.600000024
20206	1933	7122	0.899999976
20207	1933	4184	0.5
20208	1933	489	0.5
20209	1933	1127	0.5
20210	1933	5159	0.5
20211	1933	12	0.5
20212	1933	7114	0.5
20213	1933	7123	0.5
20214	1934	7124	0.5
20215	1934	7125	0.25
20216	1934	79	0.5
20217	1934	7126	0.25
20218	1935	1497	0.75
20219	1935	442	0.5
20220	1935	33	0.5
20221	1935	36	0.5
20222	1935	74	0.5
20223	1935	7127	0.100000001
20224	1936	33	0.5
20225	1936	36	0.5
20226	1936	74	0.5
20227	1937	33	0.5
20228	1937	36	0.5
20229	1937	7128	0.5
20230	1937	14	0.5
20231	1937	434	0.5
20232	1937	12	0.5
20233	1937	2694	0.5
20234	1937	292	0.5
20235	1937	7129	0.5
20236	1938	7130	1
20237	1939	7131	1
20238	1940	7132	1
20239	1941	7132	1
20240	1942	7133	1
20241	1943	7134	1
20242	1944	7133	1
20243	1945	7134	1
20244	1946	7051	0.800000012
20245	1946	7017	0.699999988
20246	1946	37	0.5
20247	1946	357	0.400000006
20248	1946	292	0.600000024
20249	1946	15	0.600000024
20250	1946	844	0.5
20251	1946	315	0.5
20252	1946	7052	0.800000012
20253	1946	33	0.600000024
20254	1946	163	0.400000006
20255	1947	7135	0.899999976
20256	1947	425	0.800000012
20257	1947	71	0.699999988
20258	1947	229	0.699999988
20259	1947	72	0.5
20260	1947	181	0.5
20261	1947	4056	0.5
20262	1947	7136	1
20263	1948	7137	1
20264	1948	7136	1
20265	1948	1618	0.400000006
20266	1948	1527	0.400000006
20267	1948	1773	0.400000006
20268	1948	1231	0.400000006
20269	1948	8	0.400000006
20270	1948	229	0.699999988
20271	1948	1848	0.400000006
20272	1948	115	0.400000006
20273	1949	7138	0.949999988
20274	1949	73	0.600000024
20275	1949	194	0.5
20276	1949	857	0.200000003
20277	1949	1511	0.100000001
20278	1949	7139	0.100000001
20279	1949	7140	0.100000001
20280	1949	7027	0.200000003
20281	1949	5159	0.200000003
20282	1950	7141	0.899999976
20283	1950	7142	0.800000012
20284	1950	7136	1
20285	1950	7143	0.5
20286	1950	7144	0.5
20287	1950	7145	0.300000012
20288	1950	7146	0.400000006
20289	1950	7084	0.600000024
20290	1950	441	0.600000024
20291	1950	5164	0.600000024
20292	1950	12	0.600000024
20293	1950	434	0.600000024
20294	1950	7027	0.600000024
20295	1950	194	0.600000024
20296	1950	442	0.600000024
20297	1950	7147	0.100000001
20298	1951	7148	0.899999976
20299	1951	7149	0.600000024
20300	1951	33	0.600000024
20301	1951	36	0.600000024
20302	1951	45	0.400000006
20303	1952	15	1
20304	1952	7150	0.5
20305	1952	7151	0.5
20306	1953	3388	1
20307	1954	7152	1
20308	1955	7153	1
20309	1956	7154	1
20310	1957	235	0.5
20311	1957	37	0.75
20312	1957	902	0.649999976
20313	1957	68	0.5
20314	1957	236	0.5
20315	1957	6	0.5
20316	1957	36	0.5
20317	1957	7155	0.75
20318	1957	7156	0.5
20319	1957	8	0.75
20320	1957	237	0.5
20321	1957	9	0.5
20322	1957	10	0.5
20323	1957	7157	0.649999976
20324	1957	900	0.649999976
20325	1957	16	0.5
20326	1957	1551	0.5
20327	1957	7158	0.649999976
20328	1957	431	0.649999976
20329	1957	802	0.75
20330	1957	15	0.75
20331	1957	6034	0.649999976
20332	1957	727	0.649999976
20333	1957	7159	1
20334	1957	74	0.5
20335	1957	7160	0.75
20336	1957	7161	0.5
20337	1957	4935	0.649999976
20338	1957	3300	0.75
20339	1957	7162	0.5
20340	1957	2010	0.649999976
20341	1957	7163	0.949999988
20342	1957	6191	0.75
20343	1957	7164	0.5
20344	1957	6295	0.5
20345	1957	2017	0.649999976
20346	1957	7165	0.649999976
20347	1957	107	0.5
20348	1958	235	0.5
20349	1958	600	0.25
20350	1958	7166	0.5
20351	1958	14	0.75
20352	1958	3346	0.25
20353	1958	7167	0.25
20354	1958	236	0.5
20355	1958	7168	0.25
20356	1958	6	0.5
20357	1958	7169	0.949999988
20358	1958	4072	0.25
20359	1958	37	0.75
20360	1958	237	0.5
20361	1958	1758	0.25
20362	1958	10	0.5
20363	1958	1364	0.25
20364	1958	4659	0.25
20365	1958	79	0.75
20366	1958	1018	0.25
20367	1958	5921	0.25
20368	1958	3666	0.25
20369	1958	422	0.25
20370	1958	7170	0.100000001
20371	1958	68	0.5
20372	1958	7171	0.949999988
20373	1958	568	0.25
20374	1958	76	0.75
20375	1958	7172	0.949999988
20376	1958	6110	0.25
20377	1958	107	0.75
20378	1958	3564	0.25
20379	1958	7173	0.5
20380	1958	555	0.25
20381	1958	3300	0.25
20382	1958	5918	0.75
20383	1958	304	0.75
20384	1958	531	0.649999976
20385	1958	16	0.5
20386	1958	71	0.25
20387	1958	9	0.5
20388	1959	235	0.5
20389	1959	37	0.5
20390	1959	7174	0.100000001
20391	1959	236	0.5
20392	1959	599	0.100000001
20393	1959	257	0.75
20394	1959	7175	0.100000001
20395	1959	6	0.5
20396	1959	7176	0.949999988
20397	1959	7177	0.949999988
20398	1959	237	0.5
20399	1959	9	0.5
20400	1959	10	0.5
20401	1959	68	0.5
20402	1959	498	0.100000001
20403	1959	16	0.5
20404	1960	235	0.5
20405	1960	499	0.75
20406	1960	236	0.5
20407	1960	6	0.5
20408	1960	7177	0.949999988
20409	1960	237	0.5
20410	1960	10	0.5
20411	1960	15	0.75
20412	1960	7176	0.949999988
20413	1960	1518	0.75
20414	1960	7178	0.75
20415	1960	395	0.75
20416	1960	292	0.75
20417	1960	547	0.75
20418	1960	7174	0.100000001
20419	1960	7175	0.100000001
20420	1960	2283	0.75
20421	1960	9	0.5
20422	1960	68	0.5
20423	1960	162	0.75
20424	1960	7179	0.75
20425	1960	16	0.5
20426	1961	422	0.75
20427	1961	235	0.5
20428	1961	10	0.5
20429	1961	68	0.5
20430	1961	236	0.5
20431	1961	7174	0.100000001
20432	1961	1199	0.75
20433	1961	7175	0.100000001
20434	1961	6	0.5
20435	1961	7176	0.949999988
20436	1961	7177	0.949999988
20437	1961	237	0.5
20438	1961	9	0.5
20439	1961	2369	0.75
20440	1961	7180	0.75
20441	1961	16	0.5
20442	1961	7181	1
20443	1962	7182	0.75
20444	1962	235	0.5
20445	1962	7174	0.100000001
20446	1962	236	0.5
20447	1962	7175	0.100000001
20448	1962	6	0.5
20449	1962	7176	0.949999988
20450	1962	7177	0.949999988
20451	1962	662	0.75
20452	1962	237	0.5
20453	1962	9	0.5
20454	1962	10	0.75
20455	1962	68	0.5
20456	1962	7183	0.75
20457	1962	16	0.5
20458	1962	7180	0.75
20459	1962	7181	1
20460	1963	257	0.75
20461	1963	567	0.75
20462	1963	107	0.75
20463	1963	107	0.75
20464	1963	498	0.75
20465	1963	566	0.100000001
20466	1963	7183	0.100000001
20467	1963	65	0.5
20468	1963	1430	0.75
20469	1963	3364	0.75
20470	1963	37	0.75
20471	1963	2523	0.100000001
20472	1963	291	0.75
20473	1963	53	0.75
20474	1963	81	0.75
20475	1963	88	0.75
20476	1963	599	0.75
20477	1963	422	0.25
20478	1963	15	0.5
20479	1963	845	0.100000001
20480	1963	2970	0.25
20481	1963	291	0.75
20482	1963	292	0.75
20483	1963	68	0.5
20484	1963	9	0.5
20485	1963	6	0.5
20486	1963	16	0.5
20487	1963	10	0.5
20488	1963	236	0.5
20489	1963	237	0.5
20490	1963	1	0.5
20491	1963	126	0.5
20492	1963	125	0.5
20493	1964	235	0.5
20494	1964	499	0.75
20495	1964	236	0.5
20496	1964	1518	0.75
20497	1964	82	0.75
20498	1964	1308	0.75
20499	1964	7177	0.949999988
20500	1964	237	0.5
20501	1964	10	0.5
20502	1964	844	0.75
20503	1964	799	0.75
20504	1964	422	0.75
20505	1964	1389	0.100000001
20506	1964	845	0.75
20507	1964	7176	0.949999988
20508	1964	292	0.75
20509	1964	37	0.75
20510	1964	1048	0.75
20511	1964	547	0.75
20512	1964	7174	0.100000001
20513	1964	7175	0.100000001
20514	1964	36	0.75
20515	1964	2291	0.75
20516	1964	6	0.5
20517	1964	68	0.5
20518	1964	1129	0.75
20519	1964	802	0.75
20520	1964	16	0.5
20521	1964	9	0.5
20522	1964	126	0.949999988
20523	1964	2529	0.75
20524	1964	2631	0.75
20525	1965	1863	0.25
20526	1965	235	0.5
20527	1965	7184	0.649999976
20528	1965	7185	0.649999976
20529	1965	1244	0.5
20530	1965	236	0.5
20531	1965	6	0.5
20532	1965	535	0.5
20533	1965	237	0.5
20534	1965	3419	0.649999976
20535	1965	10	0.5
20536	1965	2392	0.75
20537	1965	7186	0.649999976
20538	1965	536	0.75
20539	1965	321	0.75
20540	1965	7187	0.75
20541	1965	1868	0.100000001
20542	1965	7188	0.75
20543	1965	7189	0.5
20544	1965	2394	0.75
20545	1965	9	0.5
20546	1965	68	0.5
20547	1965	809	0.100000001
20548	1965	1871	0.949999988
20549	1965	1872	0.949999988
20550	1965	16	0.5
20551	1966	6259	0.639999986
20552	1966	7190	0.899999976
20553	1966	7191	0.75
20554	1966	7127	0.5
20555	1966	1207	0.5
20556	1966	7192	0.5
20557	1966	5260	0.25
20558	1966	2272	0.25
20559	1967	7193	1
20560	1967	7194	0.899999976
20561	1967	7195	0.5
20562	1967	53	0.5
20563	1967	292	0.5
20564	1967	7196	0.5
20565	1967	429	0.5
20566	1967	105	0.5
20567	1967	1842	0.25
20568	1968	7197	1
20569	1968	7198	0.75
20570	1968	7199	0.75
20571	1968	7200	0.75
20572	1969	7201	0.75
20573	1969	2242	0.899999976
20574	1969	1901	0.75
20575	1969	115	0.75
20576	1969	395	0.5
20577	1969	37	0.5
20578	1969	7202	0.25
20579	1969	4365	0.5
20580	1969	4338	0.5
20581	1969	561	0.5
20582	1969	7203	0.5
20583	1969	401	0.839999974
20584	1969	7204	0.639999986
20585	1969	531	0.899999976
20586	1969	5623	0.75
20587	1969	920	0.75
20588	1970	235	0.5
20589	1970	90	0.5
20590	1970	4209	0.649999976
20591	1970	619	0.100000001
20592	1970	4338	0.75
20593	1970	1551	0.75
20594	1970	236	0.5
20595	1970	6	0.5
20596	1970	36	0.75
20597	1970	350	0.5
20598	1970	7205	0.949999988
20599	1970	1843	0.5
20600	1970	237	0.5
20601	1970	473	0.649999976
20602	1970	10	0.5
20603	1970	68	0.5
20604	1970	3516	0.649999976
20605	1970	7206	0.100000001
20606	1970	7207	0.649999976
20607	1970	7208	0.949999988
20608	1970	40	0.5
20609	1970	79	0.5
20610	1970	566	0.100000001
20611	1970	4290	0.25
20612	1970	7209	0.75
20613	1970	7210	0.75
20614	1970	7211	0.5
20615	1970	74	0.75
20616	1970	107	0.75
20617	1970	9	0.5
20618	1970	393	0.5
20619	1970	2728	0.5
20620	1970	531	0.649999976
20621	1970	16	0.5
20622	1970	291	0.5
20623	1970	329	0.649999976
20624	1970	3938	0.649999976
20625	1970	6545	0.75
20626	1970	292	0.5
20627	1971	7212	0.25
20628	1971	235	0.5
20629	1971	1325	0.649999976
20630	1971	57	0.75
20631	1971	3357	0.75
20632	1971	7213	0.649999976
20633	1971	14	0.100000001
20634	1971	68	0.5
20635	1971	236	0.5
20636	1971	7214	0.949999988
20637	1971	6	0.5
20638	1971	507	0.5
20639	1971	7215	0.649999976
20640	1971	237	0.5
20641	1971	7216	0.949999988
20642	1971	10	0.649999976
20643	1971	7217	0.100000001
20644	1971	94	0.5
20645	1971	7218	0.75
20646	1971	7219	0.100000001
20647	1971	7220	0.75
20648	1971	7221	0.949999988
20649	1971	7222	0.100000001
20650	1971	7223	0.25
20651	1971	7224	0.5
20652	1971	7225	0.949999988
20653	1971	7226	0.649999976
20654	1971	7227	0.100000001
20655	1971	16	0.100000001
20656	1971	7162	0.75
20657	1971	9	0.5
20658	1972	7228	1
20659	1972	7229	0.899999976
20660	1973	7230	0.75
20661	1973	14	0.5
20662	1973	74	0.5
20663	1973	83	0.5
20664	1973	722	0.75
20665	1973	2272	0.25
20666	1973	7231	0.25
20667	1974	7232	1
20668	1974	3087	0.899999976
20669	1974	801	0.699999988
20670	1974	6269	0.800000012
20671	1974	7233	0.899999976
20672	1974	7234	0.899999976
20673	1974	185	0.899999976
20674	1974	68	0.879999995
20675	1974	9	0.119999997
20676	1974	10	0.899999976
20677	1974	16	0.100000001
20678	1975	235	0.5
20679	1975	7235	0.949999988
20680	1975	7236	0.649999976
20681	1975	14	0.75
20682	1975	83	0.649999976
20683	1975	4072	0.5
20684	1975	236	0.5
20685	1975	832	0.5
20686	1975	7237	0.949999988
20687	1975	237	0.5
20688	1975	6	0.5
20689	1975	10	0.5
20690	1975	68	0.75
20691	1975	6329	0.5
20692	1975	716	0.649999976
20693	1975	16	0.5
20694	1975	1117	0.75
20695	1975	9	0.5
20696	1976	460	0.699999988
20697	1976	1150	0.699999988
20698	1976	1149	0.699999988
20699	1976	715	0.5
20700	1976	714	0.600000024
20701	1976	5774	0.5
20702	1976	7238	0.699999988
20703	1976	7239	0.699999988
20704	1976	7240	0.400000006
20705	1977	291	0.600000024
20706	1977	14	0.5
20707	1977	40	0.400000006
20708	1977	7241	0.699999988
20709	1977	714	0.699999988
20710	1977	715	0.699999988
20711	1977	7242	0.5
20712	1977	7243	0.699999988
20713	1977	7244	0.5
20714	1977	10	0.600000024
20715	1977	16	0.400000006
20716	1978	7245	1
20717	1978	7246	1
20718	1978	7247	1
20719	1978	7248	1
20720	1979	7249	1
20721	1979	7250	0.949999988
20722	1979	7251	0.349999994
20723	1979	7252	0.600000024
20724	1979	7253	0.899999976
20725	1979	193	0.899999976
20726	1979	7254	0.600000024
20727	1979	7255	0.600000024
20728	1979	7256	0.600000024
20729	1979	7257	0.600000024
20730	1979	7258	0.600000024
20731	1979	7259	0.600000024
20732	1979	7260	0.300000012
20733	1979	7261	0.0500000007
20734	1979	7262	0.899999976
20735	1979	7263	0.899999976
20736	1979	7264	0.0500000007
20737	1979	7265	0.899999976
20738	1979	7266	0.0199999996
20739	1980	7267	0.800000012
20740	1980	7268	0.800000012
20741	1980	7269	0.800000012
20742	1980	7270	0.800000012
20743	1980	7271	0.800000012
20744	1980	1901	0.800000012
20745	1980	10	0.75
20746	1980	16	0.25
20747	1980	13	0.400000006
20748	1980	1597	0.400000006
20749	1980	247	0.400000006
20750	1980	7272	0.600000024
20751	1981	10	1
20752	1981	16	0
20753	1981	7273	0.99000001
20754	1981	722	0.600000024
20755	1981	95	0.600000024
20756	1981	2619	0.600000024
20757	1981	94	0.600000024
20758	1981	7274	0.5
20759	1981	329	0.5
20760	1981	97	0.5
20761	1982	7275	0.899999976
20762	1982	7276	0.800000012
20763	1982	7277	0.949999988
20764	1982	10	0.800000012
20765	1982	16	0.200000003
20766	1982	7278	0
20767	1982	767	0.600000024
20768	1982	7279	0.5
20769	1982	7280	0.899999976
20770	1983	7281	0.949999988
20771	1983	235	0.5
20772	1983	37	0.75
20773	1983	3224	0.75
20774	1983	7282	0.75
20775	1983	7283	0.949999988
20776	1983	7284	0.949999988
20777	1983	236	0.5
20778	1983	6	0.5
20779	1983	7285	0.949999988
20780	1983	237	0.5
20781	1983	9	0.5
20782	1983	10	0.5
20783	1983	68	0.5
20784	1983	247	0.75
20785	1983	16	0.5
20786	1983	7286	0.75
20787	1984	235	0.5
20788	1984	7287	0.75
20789	1984	236	0.5
20790	1984	82	0.75
20791	1984	237	0.5
20792	1984	10	0.5
20793	1984	4386	0.649999976
20794	1984	427	0.75
20795	1984	7288	0.949999988
20796	1984	5381	0.75
20797	1984	304	0.75
20798	1984	5918	0.649999976
20799	1984	40	0.75
20800	1984	7289	0.649999976
20801	1984	53	0.75
20802	1984	6	0.5
20803	1984	68	0.5
20804	1984	79	0.75
20805	1984	5917	0.75
20806	1984	7290	0.75
20807	1984	531	0.649999976
20808	1984	16	0.5
20809	1984	9	0.5
20810	1985	7291	0.949999988
20811	1985	3312	0.5
20812	1985	236	0.5
20813	1985	7292	0.899999976
20814	1985	1054	0.5
20815	1985	597	0.5
20816	1985	7293	0.5
20817	1985	7294	0.5
20818	1985	7295	0.5
20819	1985	5685	0.5
20820	1985	7296	0.5
20821	1986	7292	0.699999988
20822	1986	7297	0.800000012
20823	1986	74	0.699999988
20824	1986	82	0.699999988
20825	1986	1693	0.699999988
20826	1986	291	0.699999988
20827	1986	37	0.699999988
20828	1986	1891	0.600000024
20829	1986	398	0.600000024
20830	1986	5260	0.5
20831	1986	7298	0.5
20832	1986	7299	0.600000024
20833	1986	1973	0.699999988
20834	1986	871	0.400000006
20835	1986	7300	0.400000006
20836	1986	874	0.400000006
20837	1986	9	0.699999988
20838	1987	235	0.5
20839	1987	640	0.949999988
20840	1987	7301	0.5
20841	1987	236	0.5
20842	1987	82	0.5
20843	1987	10	0.5
20844	1987	844	0.5
20845	1987	7302	0.649999976
20846	1987	427	0.5
20847	1987	422	0.5
20848	1987	1514	0.649999976
20849	1987	76	0.5
20850	1987	7303	0.5
20851	1987	7304	0.25
20852	1987	400	0.5
20853	1987	292	0.5
20854	1987	2494	0.5
20855	1987	7305	0.949999988
20856	1987	1844	0.5
20857	1987	53	0.5
20858	1987	9	0.5
20859	1987	68	0.5
20860	1987	917	1
20861	1987	83	0.649999976
20862	1987	7306	0.5
20863	1987	7307	0.649999976
20864	1987	7308	0.949999988
20865	1987	107	0.5
20866	1987	105	0.5
20867	1987	6206	0.649999976
20868	1987	1511	0.5
20869	1987	16	0.5
20870	1987	7309	0.649999976
20871	1987	7310	0.100000001
20872	1987	6	0.5
20873	1987	237	0.5
20874	1987	6013	1
20875	1987	801	0.5
20876	1987	7311	0.949999988
20877	1987	431	0.649999976
20878	1987	7312	0.5
20879	1987	7313	0.949999988
20880	1987	2683	0.5
20881	1987	498	0.949999988
20882	1987	3938	0.649999976
20883	1987	6545	0.5
20884	1987	1012	0.649999976
20885	1987	37	1
20886	1987	2493	0.5
20887	1987	2709	0.5
20888	1987	3899	0.649999976
20889	1987	7314	0.5
20890	1987	231	1
20891	1987	2354	0.649999976
20892	1987	419	0.5
20893	1987	800	0.5
20894	1987	7315	0.649999976
20895	1987	7316	0.649999976
20896	1987	7027	0.5
20897	1987	7317	0.649999976
20898	1987	7318	0.5
20899	1988	235	0.5
20900	1988	640	0.949999988
20901	1988	7301	0.5
20902	1988	236	0.5
20903	1988	82	0.5
20904	1988	10	0.5
20905	1988	7302	0.649999976
20906	1988	427	0.5
20907	1988	422	0.100000001
20908	1988	1514	0.649999976
20909	1988	76	0.5
20910	1988	7303	0.5
20911	1988	400	0.5
20912	1988	12	0.75
20913	1988	292	0.5
20914	1988	2494	0.100000001
20915	1988	7305	0.5
20916	1988	1844	0.100000001
20917	1988	53	0.5
20918	1988	9	0.5
20919	1988	68	0.5
20920	1988	917	1
20921	1988	83	0.649999976
20922	1988	7306	0.5
20923	1988	7307	0.649999976
20924	1988	7308	0.949999988
20925	1988	107	0.5
20926	1988	105	0.5
20927	1988	6206	0.649999976
20928	1988	16	0.5
20929	1988	7309	0.649999976
20930	1988	600	0.75
20931	1988	7310	0.5
20932	1988	6	0.5
20933	1988	237	0.5
20934	1988	6013	1
20935	1988	801	0.100000001
20936	1988	7311	0.949999988
20937	1988	431	0.649999976
20938	1988	7313	0.949999988
20939	1988	7304	0.100000001
20940	1988	498	0.949999988
20941	1988	3938	0.649999976
20942	1988	6545	0.5
20943	1988	1012	0.649999976
20944	1988	37	1
20945	1988	2493	0.100000001
20946	1988	2709	0.100000001
20947	1988	3899	0.649999976
20948	1988	231	1
20949	1988	2354	0.649999976
20950	1988	419	0.5
20951	1988	7315	0.649999976
20952	1988	7316	0.649999976
20953	1988	7317	0.949999988
20954	1988	3584	0.100000001
20955	1988	7318	0.5
20956	1988	1422	1
20957	1989	7319	0.75
20958	1989	14	0.0700000003
20959	1989	7320	0.75
20960	1990	7321	0.899999976
20961	1990	1207	0.5
20962	1990	7322	0.5
20963	1990	7323	0.25
20964	1990	1740	0.25
20965	1990	7324	0.25
20966	1990	7325	0.5
20967	1990	7326	0.899999976
20968	1991	235	0.5
20969	1991	5596	0.75
20970	1991	79	0.75
20971	1991	7327	0.649999976
20972	1991	7328	0.949999988
20973	1991	236	0.5
20974	1991	7329	0.649999976
20975	1991	82	0.75
20976	1991	1308	0.25
20977	1991	81	0.75
20978	1991	37	0.75
20979	1991	237	0.5
20980	1991	7330	0.75
20981	1991	10	0.5
20982	1991	68	0.5
20983	1991	7331	0.649999976
20984	1991	125	0.75
20985	1991	3811	0.100000001
20986	1991	6	0.5
20987	1991	7332	0.25
20988	1991	498	0.5
20989	1991	7333	0.75
20990	1991	7334	0.649999976
20991	1991	7335	0.949999988
20992	1991	275	0.75
20993	1991	7336	0.949999988
20994	1991	7337	0.949999988
20995	1991	277	0.5
20996	1991	7338	0.949999988
20997	1991	7339	0.949999988
20998	1991	7340	0.649999976
20999	1991	7341	0.949999988
21000	1991	291	0.5
21001	1991	1463	0.949999988
21002	1991	427	0.75
21003	1991	498	0.5
21004	1991	7342	0.649999976
21005	1991	16	0.5
21006	1991	9	0.5
21007	1991	126	0.5
21008	1991	38	0.25
21009	1991	655	0.5
21010	1991	2529	0.5
21011	1991	2631	0.5
21012	1992	7343	1
21013	1992	5211	0.949999988
21014	1992	7344	0.5
21015	1992	7345	0.5
21016	1992	7346	0.5
21017	1992	7347	0.5
21018	1992	7348	0.5
21019	1992	7349	0.899999976
21020	1992	7350	0.5
21021	1992	7351	0.5
21022	1992	7352	1
21023	1992	7353	0.100000001
21024	1992	4018	0.800000012
21025	1992	7354	0.600000024
21026	1992	7355	0.649999976
21027	1992	7356	0.649999976
21028	1992	7357	0.579999983
21029	1992	7358	0.25
21030	1992	7359	0.439999998
21031	1992	7360	0.899999976
21032	1993	42	0.50999999
21033	1993	425	0.150000006
21034	1993	37	0.270000011
21035	1993	531	0.230000004
21036	1993	419	0.449999988
21037	1993	33	0.5
21038	1993	36	0.5
21039	1993	53	0.5
21040	1993	2620	0.0500000007
21041	1993	900	0.899999976
21042	1993	473	0.75
21043	1993	7361	0.5
21044	1993	7362	0.5
21045	1994	7363	0.75
21046	1994	292	0.5
21047	1994	7364	0.75
21048	1994	7365	0.5
21049	1994	7366	0.189999998
21050	1995	3835	1
21051	1995	4844	1
21052	1995	549	1
21053	1995	4209	1
21054	1995	33	0.5
21055	1995	36	0.5
21056	1995	74	0.5
21057	1995	427	0.5
21058	1995	329	0.5
21059	1995	7367	0.5
21060	1995	422	0.5
21061	1995	756	0.5
21062	1996	235	0.5
21063	1996	7368	0.75
21064	1996	236	0.5
21065	1996	7369	0.75
21066	1996	6	0.5
21067	1996	237	0.5
21068	1996	10	0.5
21069	1996	7370	0.75
21070	1996	7371	0.75
21071	1996	7372	0.75
21072	1996	7373	0.5
21073	1996	7374	0.75
21074	1996	7375	0.5
21075	1996	7376	0.5
21076	1996	7377	0.949999988
21077	1996	68	0.5
21078	1996	7378	0.75
21079	1996	7379	0.75
21080	1996	7380	0.25
21081	1996	7381	0.75
21082	1996	1414	0.5
21083	1996	16	0.5
21084	1996	9	0.5
21085	1997	10	1
21086	1997	7382	0.899999976
21087	1997	7383	0.75
21088	1997	7384	0.75
21089	1997	7385	0.75
21090	1997	7386	0.5
21091	1997	7387	0.5
21092	1997	511	0.5
21093	1997	2854	0.5
21094	1997	632	0.400000006
21095	1997	926	0.839999974
21096	1997	7388	0.75
21097	1997	7389	0.100000001
21098	1997	7390	0.340000004
21099	1997	2470	0.189999998
21100	1998	7391	0.319999993
21101	1998	7392	0.899999976
21102	1998	7393	0.5
21103	1998	7394	0.899999976
21104	1999	235	0.5
21105	1999	3262	0.100000001
21106	1999	7395	0.949999988
21107	1999	236	0.5
21108	1999	82	0.25
21109	1999	10	0.5
21110	1999	427	0.5
21111	1999	422	0.100000001
21112	1999	76	0.5
21113	1999	7396	0.100000001
21114	1999	400	0.5
21115	1999	5381	0.5
21116	1999	634	0.649999976
21117	1999	4644	0.649999976
21118	1999	7397	0.100000001
21119	1999	292	0.5
21120	1999	7398	0.949999988
21121	1999	7399	0.649999976
21122	1999	619	0.100000001
21123	1999	7400	0.75
21124	1999	599	0.5
21125	1999	441	0.5
21126	1999	53	0.5
21127	1999	9	0.5
21128	1999	68	0.5
21129	1999	7401	0.649999976
21130	1999	88	0.5
21131	1999	687	0.25
21132	1999	6150	0.949999988
21133	1999	107	0.5
21134	1999	105	0.5
21135	1999	7402	0.5
21136	1999	7403	0.949999988
21137	1999	16	0.5
21138	1999	1222	0.100000001
21139	1999	5596	0.75
21140	1999	896	0.25
21141	1999	6	0.5
21142	1999	7404	0.649999976
21143	1999	237	0.5
21144	1999	7405	0.5
21145	1999	7406	0.25
21146	1999	431	0.649999976
21147	1999	7407	0.649999976
21148	1999	7408	0.5
21149	1999	1299	0.5
21150	1999	77	0.100000001
21151	1999	163	0.25
21152	1999	1012	0.649999976
21153	1999	37	0.75
21154	1999	2010	0.649999976
21155	1999	39	0.5
21156	1999	971	0.5
21157	1999	632	0.649999976
21158	1999	162	0.100000001
21159	1999	7409	0.25
21160	1999	419	0.25
21161	1999	3582	0.25
21162	1999	38	0.5
21163	2000	235	0.5
21164	2000	236	0.5
21165	2000	5157	0.100000001
21166	2000	1363	0.75
21167	2000	237	0.5
21168	2000	10	0.5
21169	2000	1514	0.100000001
21170	2000	4290	0.100000001
21171	2000	6033	0.949999988
21172	2000	6034	0.100000001
21173	2000	1299	0.75
21174	2000	292	0.75
21175	2000	37	0.75
21176	2000	6038	0.100000001
21177	2000	9	0.5
21178	2000	68	0.5
21179	2000	6	0.5
21180	2000	6040	0.949999988
21181	2000	107	0.75
21182	2000	16	0.5
21183	2000	1054	0.100000001
21184	2001	235	0.5
21185	2001	236	0.5
21186	2001	1363	0.75
21187	2001	237	0.5
21188	2001	10	0.5
21189	2001	5290	0.75
21190	2001	74	0.100000001
21191	2001	6033	0.949999988
21192	2001	6034	0.100000001
21193	2001	1299	0.75
21194	2001	292	0.75
21195	2001	7410	0.100000001
21196	2001	37	0.75
21197	2001	619	0.5
21198	2001	39	0.100000001
21199	2001	79	0.75
21200	2001	6038	0.100000001
21201	2001	36	0.75
21202	2001	6	0.5
21203	2001	68	0.5
21204	2001	7411	0.75
21205	2001	6040	0.949999988
21206	2001	568	0.100000001
21207	2001	1375	0.75
21208	2001	107	0.75
21209	2001	105	0.100000001
21210	2001	16	0.5
21211	2001	566	0.5
21212	2001	9	0.5
21213	2002	7412	0.75
21214	2002	7413	0.75
21215	2002	292	0.75
21216	2002	7414	0.5
21217	2002	1007	0.5
21218	2002	105	0.25
21219	2002	76	0.25
21220	2002	7415	0.600000024
21221	2003	37	0.699999988
21222	2003	292	0.699999988
21223	2003	107	0.699999988
21224	2003	79	0.699999988
21225	2003	1231	0.300000012
21226	2003	603	0.200000003
21227	2003	7416	0.699999988
21228	2003	425	0.800000012
21229	2003	3674	0.800000012
21230	2003	105	0.5
21231	2003	257	0.699999988
21232	2003	659	0.600000024
21233	2003	632	0.600000024
21234	2003	7417	0.800000012
21235	2003	7415	0.600000024
21236	2004	7418	0.899999976
21237	2004	7419	0.400000006
21238	2004	7420	0.400000006
21239	2004	7421	0.400000006
21240	2004	425	0.5
21241	2004	292	0.699999988
21242	2004	37	0.699999988
21243	2004	107	0.699999988
21244	2004	419	0.699999988
21245	2004	33	0.699999988
21246	2004	36	0.600000024
21247	2004	15	0.449999988
21248	2004	293	0.300000012
21249	2004	7422	0.699999988
21250	2005	14	0.99000001
21251	2005	7423	0.949999988
21252	2005	291	0.899999976
21253	2005	7424	0.400000006
21254	2005	82	0.800000012
21255	2005	4554	0.899999976
21256	2005	37	0.699999988
21257	2005	81	0.699999988
21258	2006	7425	0.899999976
21259	2006	502	0.600000024
21260	2006	7426	0.5
21261	2006	838	0.5
21262	2007	3691	0.899999976
21263	2007	7426	0.600000024
21264	2007	838	0.600000024
21265	2007	1117	0.400000006
21266	2007	4554	0.400000006
21267	2008	37	0.5
21268	2008	6	0.5
21269	2008	9	0.5
21270	2008	10	0.5
21271	2008	68	0.5
21272	2008	1117	0.5
21273	2008	1	0.5
21274	2008	4403	0.5
21275	2008	7427	0.5
21276	2008	74	0.5
21277	2008	3565	0.5
21278	2008	838	0.5
21279	2008	16	0.5
21280	2008	82	0.100000001
21281	2009	37	0.800000012
21282	2009	3189	0.800000012
21283	2009	7428	0.699999988
21284	2009	38	0.800000012
21285	2009	7429	0.699999988
21286	2009	292	0.699999988
21287	2009	427	0.699999988
21288	2009	53	0.699999988
21289	2009	291	0.699999988
21290	2009	107	0.699999988
21291	2009	79	0.699999988
21292	2009	36	0.600000024
21293	2009	599	0.600000024
21294	2009	14	0.699999988
21295	2009	425	0.200000003
21296	2009	7430	0.699999988
21297	2009	231	0.899999976
21298	2009	7431	0.899999976
21299	2009	3674	0.899999976
21300	2010	127	0.800000012
21301	2010	715	0.400000006
21302	2010	841	0.400000006
21303	2010	7432	0.439999998
21304	2010	33	0.0900000036
21305	2010	36	0.0900000036
21306	2010	7433	0.200000003
21307	2010	7434	0.899999976
21308	2010	7435	1
21309	2010	10	0.699999988
21310	2010	16	0.300000012
21311	2011	277	0.899999976
21312	2011	435	0.899999976
21313	2011	441	0.800000012
21314	2011	40	0.800000012
21315	2011	33	0.800000012
21316	2011	36	0.699999988
21317	2011	681	0.800000012
21318	2011	291	0.800000012
21319	2011	43	0.699999988
21320	2011	7436	0.699999988
21321	2011	108	0.699999988
21322	2011	7437	0.800000012
21323	2011	7438	0.800000012
21324	2011	7439	0.800000012
21325	2011	7440	0.800000012
21326	2011	441	0.800000012
21327	2011	12	0.800000012
21328	2011	1263	0.699999988
21329	2011	8	0.600000024
21330	2011	7441	1
21331	2012	7442	1
21332	2013	7443	0.5
21333	2014	7444	1
21334	2015	7445	0.899999976
21335	2015	1080	0.75
21336	2015	7446	0.5
21337	2016	94	0.75
21338	2016	71	0.5
21339	2016	7447	0.5
21340	2016	7448	0.5
21341	2016	7449	0.75
21342	2016	7450	0.75
21343	2017	6213	0.5
21344	2017	6209	0.5
21345	2017	4463	0.5
21346	2018	235	0.5
21347	2018	3	0.100000001
21348	2018	14	0.5
21349	2018	236	0.5
21350	2018	6	0.5
21351	2018	95	1
21352	2018	2617	0.5
21353	2018	237	0.5
21354	2018	10	0.75
21355	2018	94	1
21356	2018	2618	0.5
21357	2018	5781	0.5
21358	2018	329	0.25
21359	2018	2619	1
21360	2018	37	0.100000001
21361	2018	39	0.100000001
21362	2018	2620	0.100000001
21363	2018	36	0.100000001
21364	2018	9	0.5
21365	2018	68	0.5
21366	2018	33	0.100000001
21367	2018	1507	0.75
21368	2018	16	0.5
21369	2019	7451	1
21370	2019	7452	0.25
21371	2019	7453	0.5
21372	2019	7454	0.5
21373	2019	7455	0.5
21374	2019	1097	0.5
21375	2020	7456	1
21376	2020	57	0.899999976
21377	2021	330	0.75
21378	2021	7457	0.75
21379	2021	71	0.75
21380	2021	229	0.5
21381	2022	693	0.5
21382	2022	449	0.5
21383	2022	2559	0.100000001
21384	2023	7458	0.100000001
21385	2023	235	0.5
21386	2023	3262	0.100000001
21387	2023	236	0.5
21388	2023	5157	0.100000001
21389	2023	6	0.5
21390	2023	237	0.5
21391	2023	7459	0.75
21392	2023	10	0.5
21393	2023	851	0.100000001
21394	2023	7460	0.949999988
21395	2023	7461	0.949999988
21396	2023	1191	0.100000001
21397	2023	7462	0.100000001
21398	2023	7463	0.75
21399	2023	37	0.75
21400	2023	619	0.100000001
21401	2023	597	0.100000001
21402	2023	257	0.75
21403	2023	53	0.75
21404	2023	9	0.5
21405	2023	68	0.75
21406	2023	79	0.75
21407	2023	7464	0.100000001
21408	2023	7465	1
21409	2023	568	0.100000001
21410	2023	555	0.100000001
21411	2023	16	0.5
21412	2023	566	0.100000001
21413	2023	1054	0.100000001
21414	2024	7466	1
21415	2024	7467	0.25
21416	2025	7468	0.899999976
21417	2025	804	0.5
21418	2025	7469	0.5
21419	2025	547	0.5
21420	2025	7470	0.5
21421	2025	7471	0.5
21422	2025	7472	0.5
21423	2025	7473	0.5
21424	2025	7474	0.300000012
21425	2025	7475	0.5
21426	2026	7476	1
21427	2027	7477	0.800000012
21428	2027	2694	0.200000003
21429	2027	7478	0.600000024
21430	2027	3189	0.600000024
21431	2027	7474	0.600000024
21432	2027	6626	0.99000001
21433	2027	7479	0.800000012
21434	2027	2141	0.800000012
21435	2027	6687	0.800000012
21436	2027	2693	0.899999976
21437	2028	21	0.75
21438	2028	461	0.75
21439	2028	681	0.5
21440	2029	7480	1
21441	2030	7481	0.75
21442	2030	7482	0.75
21443	2031	16	0.600000024
21444	2031	10	0.400000006
21445	2031	722	0.800000012
21446	2031	277	0.200000003
21447	2031	291	0.200000003
21448	2031	445	0.100000001
21449	2032	10	0.560000002
21450	2032	16	0.439999998
21451	2032	7483	0.0500000007
21452	2032	1151	0.400000006
21453	2032	441	0.400000006
21454	2032	235	0.800000012
21455	2032	7484	0.600000024
21456	2032	1229	0.699999988
21457	2032	7485	0.5
21458	2032	7486	0.899999976
21459	2032	163	0.600000024
21460	2032	12	0.600000024
21461	2032	76	0.600000024
21462	2032	5777	0.600000024
21463	2032	421	0.100000001
21464	2033	235	0.5
21465	2033	6	0.5
21466	2033	277	0.5
21467	2033	9	0.5
21468	2033	10	0.5
21469	2033	68	0.5
21470	2033	437	0.5
21471	2033	447	0.5
21472	2033	1	0.5
21473	2033	21	0.5
21474	2033	16	0.5
21475	2033	461	0.75
21476	2034	971	0.899999976
21477	2034	972	0.5
21478	2034	857	0.5
21479	2034	7487	0.5
21480	2034	7488	0.400000006
21481	2034	7489	0.400000006
21482	2034	5230	0.400000006
21483	2034	7490	0.400000006
21484	2034	7491	0.899999976
21485	2035	7492	0.75
21486	2035	7493	0.75
21487	2035	7494	0.25
21488	2036	5660	0.99000001
21489	2036	4463	0.5
21490	2036	7495	0.200000003
21491	2036	434	0.400000006
21492	2036	7496	0.899999976
21493	2036	68	0.949999988
21494	2036	235	0.899999976
21495	2036	522	0.899999976
21496	2037	10	1
21497	2037	16	0
21498	2037	7497	0.600000024
21499	2037	7498	0.150000006
21500	2037	7499	0.600000024
21501	2037	7500	0.5
21502	2037	7501	0.99000001
21503	2037	1091	0.99000001
21504	2037	7502	0.600000024
21505	2037	7503	0.5
21506	2038	7504	0.899999976
21507	2038	33	0.75
21508	2038	36	0.75
21509	2038	7505	0.75
21510	2038	7506	0.819999993
21511	2038	7507	0.75
21512	2038	7508	0.899999976
21513	2038	7509	0.899999976
21514	2038	7510	0.75
21515	2039	7511	1
21516	2040	7512	1
21517	2040	235	0.5
21518	2040	37	0.25
21519	2040	14	0.5
21520	2040	236	0.5
21521	2040	832	0.100000001
21522	2040	7513	0.949999988
21523	2040	3747	0.75
21524	2040	7514	0.75
21525	2040	237	0.5
21526	2040	6	0.5
21527	2040	10	0.5
21528	2040	68	0.5
21529	2040	377	0.75
21530	2040	36	0.5
21531	2040	16	0.5
21532	2040	9	0.5
21533	2041	235	0
21534	2041	37	0.75
21535	2041	623	0.75
21536	2041	236	0.5
21537	2041	7515	0.75
21538	2041	7513	0.949999988
21539	2041	7514	0.75
21540	2041	59	0.75
21541	2041	237	0.5
21542	2041	6	0.5
21543	2041	10	0.5
21544	2041	68	0.5
21545	2041	7516	0.75
21546	2041	16	0.5
21547	2041	9	0.5
21548	2042	235	0
21549	2042	59	0.75
21550	2042	236	0.5
21551	2042	7513	0.949999988
21552	2042	7517	1
21553	2042	10	0.5
21554	2042	7518	0.75
21555	2042	7512	1
21556	2042	431	0.75
21557	2042	7519	0.75
21558	2042	7520	0.75
21559	2042	7516	0.75
21560	2042	624	0.100000001
21561	2042	7521	0.100000001
21562	2042	7522	0.75
21563	2042	7523	1
21564	2042	7524	0.75
21565	2042	6	0.5
21566	2042	68	0.5
21567	2042	7514	0.75
21568	2042	8	0.5
21569	2042	237	0.5
21570	2042	16	0.5
21571	2042	9	0.5
21572	2042	125	0.75
21573	2043	7525	0.75
21574	2043	7526	0.5
21575	2043	7527	0.899999976
21576	2043	352	0.75
21577	2043	7528	0.75
21578	2043	7529	0.75
21579	2044	74	0.5
21580	2044	7530	0.5
21581	2045	292	0.5
21582	2045	37	0.5
21583	2045	33	0.5
21584	2045	324	0.5
21585	2045	290	0.5
21586	2045	53	0.5
21587	2045	425	0.25
21588	2045	7531	0.25
21589	2045	74	0.25
21590	2045	4972	0.75
21591	2046	7532	0.75
21592	2046	7533	0.5
21593	2046	314	0.5
21594	2046	4371	0.5
21595	2046	7534	0.400000006
21596	2046	7535	0.5
21597	2047	7536	0.75
21598	2047	599	1
21599	2047	536	1
21600	2047	53	0.75
21601	2047	292	0.5
21602	2047	107	0.5
21603	2047	14	0.5
21604	2047	6599	0.5
21605	2047	356	0.5
21606	2047	68	0.75
21607	2047	7537	0.100000001
21608	2048	2156	0.5
21609	2048	7538	0.5
21610	2048	1191	0.75
21611	2048	276	0.75
21612	2048	531	0.5
21613	2048	569	0.5
21614	2048	5341	0.5
21615	2048	76	0.5
21616	2048	7539	0.25
21617	2048	37	0.5
21618	2048	427	0.5
21619	2048	7540	0.75
21620	2049	7541	0.75
21621	2049	7542	0.899999976
21622	2049	7543	0.75
21623	2049	7544	0.5
21624	2049	83	0.5
21625	2049	1016	0.5
21626	2049	122	0.5
21627	2049	431	0.5
21628	2049	77	0.25
21629	2049	715	0.25
21630	2049	7545	0.959999979
21631	2050	2173	0.75
21632	2050	6024	0.75
21633	2050	5151	0.75
21634	2050	7546	0.75
21635	2050	7547	0.75
21636	2050	1232	0.5
21637	2050	7548	0.5
21638	2050	7549	0.5
21639	2051	7550	1
21640	2052	7551	1
21641	2052	395	0.800000012
21642	2052	291	0.800000012
21643	2052	680	0.800000012
21644	2052	12	0.800000012
21645	2052	163	0.800000012
21646	2052	398	0.699999988
21647	2052	33	0.699999988
21648	2052	7552	0.699999988
21649	2052	82	0.800000012
21650	2052	74	0.600000024
21651	2052	896	0.600000024
21652	2052	194	0.400000006
21653	2052	801	0.400000006
21654	2052	1412	0.400000006
21655	2052	802	0.400000006
21656	2052	799	0.200000003
21657	2052	7553	0.899999976
21658	2052	6259	0.600000024
21659	2052	1100	0.5
21660	2052	293	0.200000003
21661	2052	194	0.400000006
21662	2052	844	0.400000006
21663	2052	7554	0.400000006
21664	2052	7555	0.600000024
21665	2052	2276	0.600000024
21666	2052	7556	0.600000024
21667	2052	2271	0.600000024
21668	2052	2686	0.600000024
21669	2052	922	0.5
21670	2053	7557	0.400000006
21671	2053	6027	0.300000012
21672	2053	4150	0.5
21673	2053	2538	0.600000024
21674	2053	107	0.600000024
21675	2053	395	0.600000024
21676	2053	7027	0.5
21677	2053	680	0.5
21678	2053	7558	0.600000024
21679	2053	922	0.600000024
21680	2054	7559	1
21681	2054	7560	0.949999988
21682	2054	16	0.49000001
21683	2054	10	0.50999999
21684	2055	7561	0.300000012
21685	2055	6299	0.300000012
21686	2055	4330	0.0500000007
21687	2055	7562	0.00999999978
21688	2055	767	0.200000003
21689	2055	7563	0.800000012
21690	2055	1044	0.800000012
21691	2055	7564	0.800000012
21692	2055	324	0.800000012
21693	2055	7565	0.699999988
21694	2055	1470	0.699999988
21695	2055	229	0.100000001
21696	2055	7566	1
21697	2056	7567	0.99000001
21698	2056	7568	0.99000001
21699	2056	5939	0.300000012
21700	2056	7569	0.400000006
21701	2056	1720	0.400000006
21702	2057	8	0.800000012
21703	2057	7570	0.100000001
21704	2057	3267	0.699999988
21705	2057	2560	0.100000001
21706	2057	2691	0.699999988
21707	2057	42	0.699999988
21708	2057	900	0.699999988
21709	2058	7571	0.699999988
21710	2058	5053	0.180000007
21711	2058	7572	0.180000007
21712	2058	36	0.180000007
21713	2058	478	0.100000001
21714	2058	2975	0.100000001
21715	2058	7573	0.200000003
21716	2058	3268	0.800000012
21717	2059	7574	0.99000001
21718	2059	16	0.5
21719	2059	10	0.5
21720	2059	397	0.800000012
21721	2059	397	0.800000012
21722	2059	2978	0.800000012
21723	2059	4289	0.699999988
21724	2059	361	0.899999976
21725	2059	7575	0.899999976
21726	2059	7576	0.699999988
21727	2059	7577	0.800000012
21728	2060	7578	1
21729	2060	7579	1
21730	2061	3619	0.899999976
21731	2061	7580	1
21732	2061	7581	0.25
21733	2061	7582	0.25
21734	2062	72	0.75
21735	2062	7583	0.5
21736	2062	7584	0.5
21737	2063	5706	0.99000001
21738	2063	16	0.600000024
21739	2063	10	0.400000006
21740	2063	1358	0.75
21741	2063	2241	0.0500000007
21742	2063	7585	0.230000004
21743	2063	869	0.230000004
21744	2063	3651	0.219999999
21745	2063	857	0.300000012
21746	2063	971	0.300000012
21747	2063	191	0.300000012
21748	2063	7586	0.300000012
21749	2063	257	0.25
21750	2063	76	0.239999995
21751	2063	105	0.189999998
21752	2063	7587	0.300000012
21753	2063	1514	0.300000012
21754	2063	7588	0.699999988
21755	2063	7589	0.540000021
21756	2063	920	0.109999999
21757	2063	431	0.0199999996
21758	2063	2591	0.0399999991
21759	2063	83	0.379999995
21760	2063	7590	1
21761	2064	7591	1
21762	2064	7592	0.899999976
21763	2064	229	0.800000012
21764	2064	7593	0.800000012
21765	2064	291	0.600000024
21766	2064	427	0.600000024
21767	2064	33	0.600000024
21768	2064	36	0.400000006
21769	2064	53	0.600000024
21770	2064	292	0.600000024
21771	2064	681	0.600000024
21772	2064	79	0.400000006
21773	2064	68	0.800000012
21774	2064	235	0.699999988
21775	2064	9	0.100000001
21776	2064	8	0.600000024
21777	2064	421	0.5
21778	2064	7594	0.5
21779	2064	425	0.5
21780	2064	472	1
21781	2064	90	0.600000024
21782	2064	7595	0.600000024
21783	2064	7596	0.600000024
21784	2065	7597	1
21785	2065	7598	0.75
21786	2065	7599	0.5
21787	2065	7600	0.75
21788	2065	7601	0.5
21789	2065	76	0.25
21790	2065	105	0.25
21791	2066	1358	0.75
21792	2066	7602	0.5
21793	2066	37	0.75
21794	2066	5839	0.5
21795	2066	7603	0.899999976
21796	2066	2850	0.5
21797	2066	5713	0.5
21798	2066	3952	0.850000024
21799	2066	7604	0.5
21800	2066	5016	0.819999993
21801	2067	5130	0.75
21802	2067	844	0.75
21803	2067	1197	0.75
21804	2067	1413	1
21805	2067	1131	0.75
21806	2067	3823	0.75
21807	2067	2686	0.75
21808	2067	922	0.75
21809	2067	15	1
21810	2068	7605	0.75
21811	2068	235	0.5
21812	2068	37	0.75
21813	2068	619	0.5
21814	2068	659	0.649999976
21815	2068	419	0.75
21816	2068	68	0.5
21817	2068	236	0.5
21818	2068	107	0.75
21819	2068	6	0.5
21820	2068	237	0.5
21821	2068	9	0.5
21822	2068	10	0.5
21823	2068	7606	0.100000001
21824	2068	7607	0.949999988
21825	2068	7608	0.949999988
21826	2068	1842	0.75
21827	2068	566	0.5
21828	2068	16	0.5
21829	2068	7609	0.100000001
21830	2069	235	0.5
21831	2069	14	0.5
21832	2069	236	0.5
21833	2069	6	0.5
21834	2069	237	0.100000001
21835	2069	10	0.5
21836	2069	1842	0.5
21837	2069	427	0.5
21838	2069	567	0.75
21839	2069	74	0.5
21840	2069	7610	0.5
21841	2069	7611	0.75
21842	2069	536	0.75
21843	2069	37	0.75
21844	2069	39	0.75
21845	2069	43	0.75
21846	2069	257	0.5
21847	2069	7612	0.949999988
21848	2069	291	0.75
21849	2069	9	0.5
21850	2069	68	0.5
21851	2069	88	0.75
21852	2069	33	0.5
21853	2069	16	0.5
21854	2069	7613	0.100000001
21855	2069	7614	0.949999988
21856	2069	419	0.75
21857	2069	107	0.75
21858	2069	7402	0.75
21859	2069	7615	0.100000001
21860	2070	235	0.25
21861	2070	236	0.5
21862	2070	7616	0.949999988
21863	2070	10	0.5
21864	2070	427	0.5
21865	2070	422	0.100000001
21866	2070	2493	0.100000001
21867	2070	2519	0.649999976
21868	2070	7611	0.75
21869	2070	1758	0.100000001
21870	2070	9	0.75
21871	2070	68	0.25
21872	2070	88	0.75
21873	2070	33	0.5
21874	2070	946	0.75
21875	2070	426	0.100000001
21876	2070	2264	0.100000001
21877	2070	107	0.75
21878	2070	7402	0.75
21879	2070	16	0.75
21880	2070	566	0.100000001
21881	2070	14	0.5
21882	2070	6	0.5
21883	2070	237	0.100000001
21884	2070	1842	0.5
21885	2070	39	0.75
21886	2070	7617	0.100000001
21887	2070	74	0.5
21888	2070	7610	0.5
21889	2070	536	0.75
21890	2070	551	0.100000001
21891	2070	37	0.75
21892	2070	567	0.75
21893	2070	547	0.100000001
21894	2070	43	0.75
21895	2070	1515	0.100000001
21896	2070	257	0.5
21897	2070	36	0.100000001
21898	2070	7612	0.949999988
21899	2070	291	0.75
21900	2070	162	0.100000001
21901	2070	7618	0.100000001
21902	2070	15	0.100000001
21903	2070	7613	0.100000001
21904	2070	7614	0.949999988
21905	2070	419	0.75
21906	2070	3468	0.75
21907	2070	500	0.100000001
21908	2070	2355	0.649999976
21909	2070	7615	0.100000001
21910	2071	7619	1
21911	2071	235	0.5
21912	2071	68	0.5
21913	2071	292	0.75
21914	2071	36	0.75
21915	2071	4051	0.5
21916	2071	5073	0.5
21917	2071	3224	0.5
21918	2071	522	0.75
21919	2071	422	0.75
21920	2071	7620	0.899999976
21921	2072	235	0.5
21922	2072	5596	0.75
21923	2072	7621	0.649999976
21924	2072	7622	0.949999988
21925	2072	7623	0.100000001
21926	2072	14	0.75
21927	2072	1148	0.649999976
21928	2072	236	0.5
21929	2072	82	0.75
21930	2072	40	0.5
21931	2072	401	0.75
21932	2072	37	0.75
21933	2072	237	0.5
21934	2072	7624	0.649999976
21935	2072	10	0.5
21936	2072	7625	0.649999976
21937	2072	79	0.5
21938	2072	6	0.5
21939	2072	7626	0.5
21940	2072	1865	0.649999976
21941	2072	68	0.5
21942	2072	16	0.5
21943	2072	7627	0.949999988
21944	2072	257	0.75
21945	2072	419	0.75
21946	2072	74	0.75
21947	2072	3063	0.649999976
21948	2072	3507	0.75
21949	2072	5921	0.649999976
21950	2072	7628	0.649999976
21951	2072	109	0.5
21952	2072	7629	0.949999988
21953	2072	9	0.5
21954	2073	7630	1
21955	2073	7631	0.75
21956	2073	7632	0.5
21957	2074	7633	0.899999976
21958	2074	321	0.5
21959	2074	5917	0.899999976
21960	2074	7634	0.75
21961	2074	7635	0.5
21962	2074	68	0.75
21963	2074	9	0.25
21964	2074	7636	0.75
21965	2075	7633	0.899999976
21966	2075	321	0.5
21967	2075	5917	0.899999976
21968	2075	7634	0.75
21969	2075	7635	0.5
21970	2075	68	0.75
21971	2075	9	0.25
21972	2075	7636	0.75
21973	2076	79	1
21974	2076	7637	1
21975	2076	7638	1
21976	2076	7639	0.99000001
21977	2076	7640	0.600000024
21978	2076	7641	0.400000006
21979	2077	7642	0.99000001
21980	2077	2379	0.99000001
21981	2077	235	0.99000001
21982	2077	7643	0.99000001
21983	2078	7167	0.899999976
21984	2078	431	0.899999976
21985	2078	125	0.899999976
21986	2078	1117	0.800000012
21987	2078	4920	1
21988	2078	7644	1
21989	2078	16	0.949999988
21990	2078	416	0.949999988
21991	2078	2059	0.949999988
21992	2078	105	0.600000024
21993	2078	6582	0.330000013
21994	2078	7645	0.600000024
21995	2078	7646	0.699999988
21996	2078	7647	0.699999988
21997	2078	4524	0.699999988
21998	2079	7648	1
21999	2080	7649	0.800000012
22000	2080	7650	0.699999988
22001	2080	7651	0.5
22002	2080	7652	0.5
22003	2080	2686	0.5
22004	2080	13	0.5
22005	2080	7653	0.5
22006	2080	7654	0.899999976
22007	2080	7655	0.899999976
22008	2080	781	0.5
22009	2080	7656	0.600000024
22010	2080	7657	0.5
22011	2082	7658	0.899999976
22012	2082	7659	0.899999976
22013	2082	7660	0.699999988
22014	2082	4264	0.600000024
22015	2082	235	0.5
22016	2082	7661	0.699999988
22017	2082	3449	0.600000024
22018	2083	7662	0.949999988
22019	2083	7663	0.600000024
22020	2083	1286	0.699999988
22021	2083	1804	0.5
22022	2083	7664	0.5
22023	2084	2255	1
22024	2084	4760	1
22025	2084	7665	0.899999976
22026	2084	7666	0.899999976
22027	2084	7667	1
22028	2084	7668	1
22029	2084	7669	0.699999988
22030	2084	7670	0.800000012
22031	2084	7671	0.600000024
22032	2085	3487	1
22033	2085	777	0.699999988
22034	2085	641	0.699999988
22035	2085	7672	0.699999988
22036	2085	7673	0.600000024
22037	2085	7674	0.600000024
22038	2085	7675	0.600000024
22039	2085	3752	0.200000003
22040	2085	6028	0.200000003
22041	2085	7668	0.200000003
22042	2086	7676	0.75
22043	2086	235	0.5
22044	2086	7677	0.75
22045	2086	3320	0.949999988
22046	2086	236	0.5
22047	2086	6	0.5
22048	2086	7678	0.75
22049	2086	181	0.75
22050	2086	237	0.5
22051	2086	9	0.5
22052	2086	10	0.5
22053	2086	68	0.5
22054	2086	7679	0.75
22055	2086	3313	0.100000001
22056	2086	231	0.75
22057	2086	3322	0.949999988
22058	2086	3323	0.949999988
22059	2086	16	0.5
22060	2086	3324	0.100000001
22061	2086	7680	0.75
22062	2086	7681	0.75
22063	2086	6581	0.75
22064	2086	7682	0.75
22065	2086	3315	0.100000001
22066	2086	7683	0.75
22067	2086	7684	0.75
22068	2086	3325	0.100000001
22069	2086	7685	0.75
22070	2086	3318	0.949999988
22071	2086	3319	0.949999988
22072	2086	7686	0.75
22073	2087	6188	0.75
22074	2087	235	0.5
22075	2087	37	0.75
22076	2087	2023	0.649999976
22077	2087	7687	0.949999988
22078	2087	567	0.75
22079	2087	7688	0.100000001
22080	2087	14	0.25
22081	2087	43	0.25
22082	2087	7689	0.949999988
22083	2087	236	0.5
22084	2087	6	0.5
22085	2087	36	0.25
22086	2087	237	0.100000001
22087	2087	9	0.5
22088	2087	10	0.5
22089	2087	68	0.5
22090	2087	7690	0.25
22091	2087	5290	0.5
22092	2087	659	0.649999976
22093	2087	42	0.649999976
22094	2087	107	0.75
22095	2088	292	0.129999995
22096	2088	33	0.189999998
22097	2088	801	0.0599999987
22098	2088	489	0.0500000007
22099	2088	425	0.0500000007
22100	2088	7691	0.0599999987
22101	2088	74	0.0700000003
22102	2088	431	0.00999999978
22103	2088	7692	0.0500000007
22104	2088	7693	0.0500000007
22147	2093	681	0.100000001
22148	2093	7702	0.100000001
22149	2093	7062	0.100000001
22150	2093	33	0.100000001
22151	2093	36	0.100000001
22152	2093	40	0.100000001
22153	2093	4117	0.0599999987
22154	2093	2541	0.0599999987
22155	2093	71	0.0599999987
22156	2093	14	0.0599999987
22157	2093	896	0.0599999987
22158	2093	7703	0.0599999987
22159	2095	714	0.0599999987
22160	2095	292	0.0599999987
22161	2095	229	0.0299999993
22162	2095	681	0.0199999996
22163	2095	74	0.0299999993
22164	2095	33	0.0299999993
22165	2095	14	0.0399999991
22166	2095	36	0.0399999991
22167	2095	834	0.0299999993
22168	2095	896	0.0199999996
22169	2095	1512	0.0199999996
22170	2095	723	0.0199999996
22171	2095	1191	0.0199999996
22172	2095	7704	0.0199999996
22173	2095	2428	0.0199999996
22174	2095	419	0.0199999996
22175	2095	107	0.0199999996
22176	2095	599	0.0299999993
22177	2097	1844	0.189999998
22178	2097	292	0.25
22179	2097	1228	0.289999992
22180	2097	14	0.119999997
22181	2097	1512	0.189999998
22182	2097	82	0.0799999982
22183	2097	12	0.0500000007
22184	2097	445	0.0299999993
22185	2097	4091	0.0599999987
22186	2097	3237	0.0700000003
22187	2097	489	0.0799999982
22188	2097	681	0.0500000007
22189	2097	4156	0.0599999987
22190	2097	1644	0.0299999993
22191	2097	852	0.0299999993
22192	2097	441	0.0299999993
22193	2097	7705	0.0299999993
22194	2097	3332	0.0299999993
22195	2097	3133	0.0299999993
22196	2097	33	0.0500000007
22197	2097	36	0.0399999991
22198	2097	74	0.0399999991
22199	2097	896	0.0299999993
22200	2097	5429	0.0299999993
22201	2097	7706	0.0299999993
22202	2097	427	0.0199999996
22203	2097	2428	0.0299999993
22204	2097	7707	0.0299999993
22205	2097	7708	0.0299999993
22206	2097	40	0.0299999993
22207	2097	37	0.0500000007
22208	2098	292	0.170000002
22209	2098	2398	0.209999993
22210	2098	599	0.109999999
22211	2098	681	0.0299999993
22212	2098	7709	0.0399999991
22213	2098	33	0.0500000007
22214	2098	74	0.0299999993
22215	2098	229	0.0299999993
22216	2098	7710	0.0299999993
22217	2098	7711	0.0299999993
22218	2098	107	0.0500000007
22219	2098	2242	0.0299999993
22220	2098	7712	0.0799999982
22221	2098	1864	0.0500000007
22222	2098	7713	0.0599999987
22223	2098	7714	0.0399999991
22224	2098	555	0.0399999991
22225	2098	79	0.0399999991
22226	2098	255	0.0399999991
22227	2098	393	0.0299999993
22228	2098	7715	0.0399999991
22229	2098	3299	0.0199999996
22230	2098	315	0.0199999996
22231	2098	1849	0.0199999996
22232	2098	2854	0.0199999996
22233	2098	419	0.0199999996
22234	2098	536	0.0199999996
22235	2099	4209	0.180000007
22236	2099	292	0.0199999996
22237	2099	3522	0.100000001
22238	2099	14	0.0399999991
22239	2099	7716	0.0299999993
22240	2099	5429	0.0299999993
22241	2099	33	0.0299999993
22242	2099	834	0.0199999996
22243	2099	74	0.0199999996
22244	2099	3922	0.0199999996
22245	2099	896	0.0199999996
22246	2099	7717	0.00999999978
22247	2099	687	0.00999999978
22248	2099	2633	0.00999999978
22249	2099	36	0.00999999978
22250	2099	90	0.00999999978
22251	2099	7718	0.00999999978
22252	2099	390	0.00999999978
22253	2099	7693	0.0500000007
22254	2099	734	0.00999999978
22255	2100	5144	0.0199999996
22256	2100	5613	0.0199999996
22257	2100	74	0.0199999996
22258	2100	33	0.0199999996
22259	2100	7704	0.0199999996
22260	2100	1877	0.0199999996
22261	2101	2493	0.0299999993
22262	2101	7719	0.100000001
22263	2101	7156	0.100000001
22264	2101	7720	0.100000001
22265	2101	434	0.0700000003
22266	2101	8	0.0199999996
22267	2101	681	0.0199999996
22268	2101	291	0.0199999996
22269	2101	292	0.0199999996
22270	2101	1844	0.0199999996
22271	2101	425	0.0199999996
22272	2101	449	0.0199999996
22273	2101	5429	0.0700000003
22274	2101	395	0.0199999996
22275	2101	7721	0.0700000003
22276	2101	561	0.0700000003
22277	2103	7110	0.100000001
22278	2103	7722	0.100000001
22279	2103	7723	0.100000001
22280	2103	40	0.00999999978
22281	2103	531	0.00999999978
22282	2103	7724	0.00999999978
22283	2105	8	0.159999996
22284	2105	844	0.0299999993
22285	2105	681	0.0299999993
22286	2105	291	0.0299999993
22287	2105	291	0.0299999993
22288	2105	292	0.0299999993
22289	2105	53	0.0299999993
22290	2105	3137	0.0299999993
22291	2105	7725	0.0299999993
22292	2105	1844	0.0299999993
22293	2105	4017	0.0299999993
22294	2105	644	0.0299999993
22295	2105	2694	0.0299999993
22296	2105	7705	0.0299999993
22297	2105	7726	0.0299999993
22298	2105	2854	0.0299999993
22299	2105	727	0.150000006
22300	2105	33	0.100000001
22301	2105	896	0.100000001
22302	2105	7727	0.899999976
22303	2105	7728	0.0299999993
22304	2105	1263	0.0299999993
22305	2105	7729	0.0500000007
22306	2105	7730	0.0199999996
22307	2105	526	0.0599999987
22308	2105	3133	0.00999999978
22309	2105	14	0.00999999978
22310	2105	7084	0.00999999978
22311	2105	1191	0.0199999996
22312	2105	7731	0.0399999991
22313	2105	5157	0.00999999978
22314	2105	561	0.0399999991
22315	2105	2850	0.0399999991
22316	2105	3546	0.0399999991
22317	2105	3300	0.0199999996
22318	2105	728	0.0199999996
22319	2106	7732	0.00999999978
22320	2106	434	0.00999999978
22321	2106	21	0.00999999978
22322	2106	6993	0.00999999978
22323	2106	7733	0.00999999978
22324	2106	7734	0.00999999978
22325	2106	7729	0.00999999978
22326	2106	7735	0.00999999978
22327	2106	1270	0.00999999978
22328	2106	422	0.00999999978
22329	2106	7736	0.00999999978
22330	2106	844	0.00999999978
22331	2106	7737	0.00999999978
22332	2106	7738	0.00999999978
22333	2106	7739	0.00999999978
22334	2106	7740	0.00999999978
22335	2106	7741	0.00999999978
22336	2106	659	0.00999999978
22337	2106	431	0.00999999978
22338	2106	2490	0.00999999978
22339	2106	7742	0.00999999978
22340	2106	7743	0.00999999978
22341	2106	7744	0.00999999978
22342	2106	1565	0.00999999978
22343	2106	6640	0.00999999978
22344	2106	1191	0.00999999978
22345	2106	7745	0.00999999978
22346	2106	7746	0.00999999978
22347	2106	7114	0.00999999978
22348	2106	7747	0.00999999978
22349	2106	1644	0.0299999993
22350	2106	1512	0.0299999993
22351	2106	681	0.0299999993
22352	2106	896	0.0299999993
22353	2106	857	0.0299999993
22354	2106	445	0.0299999993
22355	2106	12	0.0299999993
22356	2106	7748	0.0299999993
22357	2106	6912	0.0299999993
22358	2106	33	0.0299999993
22359	2106	441	0.0299999993
22360	2106	395	0.0299999993
22361	2106	802	0.0299999993
22362	2106	547	0.0299999993
22363	2106	3224	0.0299999993
22364	2106	1844	0.0299999993
22365	2106	7749	0.0299999993
22366	2106	1080	0.0299999993
22367	2106	95	0.0299999993
22368	2106	7750	0.0299999993
22369	2106	71	0.0299999993
22370	2106	703	0.0299999993
22371	2106	7751	0.0299999993
22372	2106	1744	0.0299999993
22373	2106	717	0.0299999993
22374	2106	4233	0.0299999993
22375	2106	2694	0.0299999993
22376	2106	7752	0.0299999993
22377	2106	194	0.0299999993
22378	2106	3985	0.0299999993
22379	2106	36	0.0299999993
22380	2107	714	0.0700000003
22381	2107	442	0.0399999991
22382	2107	445	0.0299999993
22383	2107	913	0.0199999996
22384	2107	291	0.0500000007
22385	2107	681	0.0199999996
22386	2107	1097	0.00999999978
22387	2107	1644	0.00999999978
22388	2107	71	0.0199999996
22389	2107	5144	0.0199999996
22390	2107	33	0.0299999993
22391	2107	14	0.0199999996
22392	2107	734	0.0199999996
22393	2107	395	0.0199999996
22394	2107	40	0.0199999996
22395	2108	33	0.0299999993
22396	2108	36	0.0299999993
22397	2108	74	0.0299999993
22398	2108	1018	0.0299999993
22399	2108	425	0.0299999993
22400	2108	531	0.0299999993
22401	2108	7753	0.0299999993
22402	2108	7754	0.0299999993
22403	2108	7755	0.0299999993
22404	2108	1030	0.00999999978
22405	2108	7756	0.00999999978
22406	2108	7757	0.00999999978
22407	2108	7758	0.00999999978
22408	2108	7759	0.00999999978
22409	2108	7760	0.00999999978
22410	2108	7761	0.00999999978
22411	2108	7762	0.00999999978
22412	2108	7763	0.00999999978
22413	2108	7764	0.00999999978
22414	2108	7765	0.00999999978
22415	2108	1303	0.00999999978
22416	2108	659	0.00999999978
22417	2108	431	0.00999999978
22418	2108	7766	0.00999999978
22419	2108	7741	0.00999999978
22420	2108	1191	0.00999999978
22421	2108	7767	0.00999999978
22422	2108	422	0.00999999978
22423	2110	1844	0.200000003
22424	2110	292	0.200000003
22425	2110	1228	0.289999992
22426	2110	14	0.119999997
22427	2110	1512	0.100000001
22428	2110	82	0.0700000003
22429	2110	12	0.0599999987
22430	2110	4091	0.0599999987
22431	2110	3237	0.0599999987
22432	2110	489	0.0799999982
22433	2110	681	0.0399999991
22434	2110	4156	0.0599999987
22435	2110	1644	0.0299999993
22436	2110	852	0.0299999993
22437	2110	441	0.0299999993
22438	2110	7705	0.0299999993
22439	2110	3332	0.0299999993
22440	2110	3133	0.0299999993
22441	2110	33	0.0500000007
22442	2110	36	0.0399999991
22443	2110	74	0.0399999991
22444	2110	896	0.0299999993
22445	2110	5429	0.0299999993
22446	2110	7706	0.0299999993
22447	2110	427	0.0199999996
22448	2110	5660	0.0500000007
22449	2110	1744	0.0299999993
22450	2110	7707	0.0299999993
22451	2110	7708	0.0299999993
22452	2110	40	0.0299999993
22453	2110	37	0.0500000007
22454	2110	7768	0.00999999978
22455	2110	4117	0.00999999978
22456	2110	2541	0.00999999978
22457	2110	7769	0.00999999978
22458	2110	434	0.00999999978
22459	2110	7768	0.00999999978
22460	2110	4184	0.00999999978
22461	2110	2547	0.00999999978
22462	2110	3293	0.00999999978
22463	2110	7770	0.00999999978
22464	2110	445	0.0399999991
22465	2111	7724	0.0500000007
22466	2111	7771	0.00999999978
22467	2111	83	0.100000001
22468	2111	431	0.100000001
22469	2111	531	0.100000001
22470	2111	659	0.100000001
22471	2111	7741	0.00999999978
22472	2111	5260	0.0500000007
22473	2111	74	0.0500000007
22474	2111	33	0.0500000007
22475	2111	36	0.0500000007
22476	2111	7772	0.0500000007
22477	2111	90	0.0500000007
22478	2111	422	0.0500000007
22479	2111	7692	0.0500000007
22480	2111	1030	0.00039999999
22481	2113	185	0.00999999978
22482	2113	2150	0.00999999978
22483	2113	277	0.00999999978
22484	2113	40	0.00999999978
22485	2113	7773	0.00999999978
22486	2113	2694	0.00999999978
22487	2113	107	0.00999999978
22488	2113	445	0.00999999978
22489	2113	12	0.00999999978
22490	2113	2694	0.00999999978
22491	2114	7774	0.0700000003
22492	2114	292	0.0199999996
22493	2114	1644	0.0399999991
22494	2114	7775	0.0700000003
22495	2114	405	0.0199999996
22496	2114	79	0.109999999
22497	2114	7776	0.0299999993
22498	2114	681	0.0199999996
22499	2114	291	0.0199999996
22500	2114	703	0.0199999996
22501	2114	7777	0.0299999993
22502	2114	33	0.0299999993
22503	2114	1512	0.0299999993
22504	2114	107	0.0199999996
22505	2114	536	0.0299999993
22506	2114	397	0.0399999991
22507	2114	255	0.0399999991
22508	2114	3697	0.0399999991
22509	2114	7778	0.0399999991
22510	2114	599	0.0399999991
22511	2114	2066	0.0199999996
22512	2114	7779	0.0299999993
22513	2114	7780	0.0199999996
22514	2114	913	0.0199999996
22515	2114	434	0.0199999996
22516	2114	12	0.0199999996
22517	2114	489	0.0199999996
22518	2114	7781	0.0199999996
22519	2114	801	0.0199999996
22520	2114	7782	0.0199999996
22521	2114	53	0.0199999996
22522	2114	4156	0.0199999996
22523	2114	7783	0.0199999996
22524	2114	971	0.0199999996
22525	2114	7040	0.0199999996
22526	2114	7167	0.0199999996
22527	2114	7784	0.0199999996
22528	2114	7785	0.0199999996
22529	2114	2023	0.0199999996
22530	2114	32	0.0199999996
22531	2114	14	0.0199999996
22532	2114	7786	0.0199999996
22533	2114	5475	0.0199999996
22534	2114	896	0.0199999996
22535	2114	74	0.0199999996
22536	2114	3288	0.0199999996
22537	2114	5260	0.0199999996
22538	2114	6912	0.0199999996
22539	2114	485	0.0199999996
22540	2114	36	0.0199999996
22541	2114	329	0.0199999996
22542	2114	7787	0.0199999996
22543	2114	7788	0.0199999996
22544	2114	2090	0.0199999996
22545	2114	43	0.0199999996
22546	2114	7789	0.0199999996
22547	2114	1597	0.0199999996
22548	2114	348	0.0199999996
22549	2114	7790	0.0199999996
22550	2114	2018	0.0199999996
22551	2114	1864	0.0199999996
22552	2114	7097	0.0199999996
22553	2114	2876	0.0199999996
22554	2114	410	0.0199999996
22555	2114	7791	0.0199999996
22556	2114	1149	0.0199999996
22557	2114	7792	0.0199999996
22558	2114	88	0.0199999996
22559	2114	37	0.0199999996
22560	2114	7793	0.00999999978
22561	2114	7794	0.00999999978
22562	2114	1081	0.00999999978
22563	2114	1772	0.00999999978
22564	2114	277	0.00999999978
22565	2114	547	0.00999999978
22566	2114	7795	0.00999999978
22567	2114	7796	0.00999999978
22568	2114	5164	0.00999999978
22569	2114	1080	0.00999999978
22570	2114	5685	0.00999999978
22571	2115	292	0.150000006
22572	2115	7447	0.0299999993
22573	2115	7797	0.300000012
22574	2115	7774	0.100000001
22575	2115	7774	0.100000001
22576	2115	291	0.0299999993
22577	2115	71	0.0299999993
22578	2115	536	0.0299999993
22579	2115	348	0.0299999993
22580	2115	857	0.0299999993
22581	2115	40	0.0299999993
22582	2115	599	0.0299999993
22583	2115	535	0.0299999993
22584	2115	7798	0.0299999993
22585	2116	425	0.209999993
22586	2116	449	0.25
22587	2116	33	0.140000001
22588	2116	77	0.129999995
22589	2116	453	0.100000001
22590	2116	7799	0.140000001
22591	2116	122	0.0700000003
22592	2116	292	0.0700000003
22593	2116	7691	0.0799999982
22594	2116	7800	0.0500000007
22595	2116	7692	0.100000001
22596	2117	1263	0.0299999993
22597	2117	7801	0.0299999993
22598	2117	277	0.0299999993
22599	2117	2232	0.0299999993
22600	2117	7802	0.0299999993
22601	2117	122	0.0299999993
22602	2117	8	0.0299999993
22603	2117	6796	0.0299999993
22604	2117	7803	0.0299999993
22605	2117	547	0.0299999993
22606	2117	7804	0.0299999993
22607	2117	801	0.0299999993
22608	2117	681	0.0299999993
22609	2117	291	0.0299999993
22610	2117	292	0.0299999993
22611	2117	1844	0.0299999993
22612	2117	499	0.0299999993
22613	2117	3130	0.0299999993
22614	2117	896	0.0299999993
22615	2117	74	0.0299999993
22616	2117	33	0.0299999993
22617	2117	1744	0.0299999993
22618	2117	185	0.00999999978
22619	2117	40	0.00999999978
22620	2117	6230	0.00999999978
22621	2117	7704	0.00999999978
22622	2117	7805	0.00999999978
22623	2117	7806	0.00999999978
22624	2117	7807	0.00999999978
22625	2117	2547	0.00999999978
22626	2117	431	0.00999999978
22627	2117	304	0.00999999978
22628	2119	74	0.100000001
22629	2119	419	0.0799999982
22630	2119	7018	0.0900000036
22631	2119	1844	0.0299999993
22632	2119	33	0.0599999987
22633	2119	5429	0.0399999991
22634	2119	5660	0.0599999987
22635	2119	7808	0.0199999996
22636	2119	5356	0.0599999987
22637	2119	107	0.0500000007
22638	2119	5164	0.0399999991
22639	2119	107	0.0399999991
22640	2119	7701	0.0299999993
22641	2119	7809	0.0199999996
22642	2119	7786	0.0199999996
22643	2119	185	0.0199999996
22644	2119	7793	0.0199999996
22645	2119	2488	0.0199999996
22646	2119	1030	0.0199999996
22647	2119	83	0.0199999996
22648	2119	7745	0.0199999996
22649	2119	427	0.0199999996
22650	2119	844	0.0199999996
22651	2119	5637	0.0199999996
22652	2119	857	0.0199999996
22653	2119	7810	0.0199999996
22654	2119	1543	0.0199999996
22655	2119	7811	0.0199999996
22656	2119	7767	0.0199999996
22657	2119	4922	0.0199999996
22658	2119	2638	0.0199999996
22659	2119	547	0.0199999996
22660	2119	801	0.0199999996
22661	2119	13	0.0199999996
22662	2119	681	0.0199999996
22663	2119	7812	0.0199999996
22664	2119	7777	0.0199999996
22665	2119	90	0.0199999996
22666	2119	7813	0.0199999996
22667	2119	4091	0.0199999996
22668	2119	397	0.0199999996
22669	2119	7814	0.0199999996
22670	2119	7758	0.0199999996
22671	2119	7815	0.0199999996
22672	2119	291	0.0199999996
22673	2119	834	0.0199999996
22674	2119	2633	0.0199999996
22675	2119	3288	0.0199999996
22676	2119	7816	0.0199999996
22677	2119	5260	0.0199999996
22678	2119	329	0.0199999996
22679	2119	7817	0.0199999996
22680	2119	1191	0.0199999996
22681	2119	161	0.0199999996
22682	2119	546	0.0199999996
22683	2119	7818	0.0199999996
22684	2119	1877	0.0199999996
22685	2119	7819	0.0199999996
22686	2119	77	0.0199999996
22687	2119	2535	0.0199999996
22688	2119	7820	0.0199999996
22689	2119	53	0.0199999996
22690	2119	390	0.0199999996
22691	2119	7821	0.0199999996
22692	2119	3126	0.0199999996
22693	2119	3602	0.0199999996
22694	2119	7822	0.0199999996
22695	2119	7823	0.0199999996
22696	2119	1551	0.0199999996
22697	2119	89	0.0199999996
22698	2119	426	0.0199999996
22699	2119	4659	0.0199999996
22700	2119	3130	0.0199999996
22701	2119	3262	0.0199999996
22702	2119	194	0.0199999996
22703	2119	4017	0.0199999996
22704	2119	1179	0.0199999996
22705	2119	71	0.0199999996
22706	2119	7824	0.0199999996
22707	2119	4195	0.0199999996
22708	2119	7825	0.0199999996
22709	2119	7705	0.0199999996
22710	2119	7760	0.0199999996
22711	2119	7298	0.0199999996
22712	2119	21	0.0199999996
22713	2119	7826	0.0199999996
22714	2119	838	0.0199999996
22715	2119	431	0.0199999996
22716	2119	191	0.0199999996
22717	2119	4541	0.0199999996
22718	2119	7761	0.0199999996
22719	2119	1018	0.0199999996
22720	2119	7827	0.0199999996
22721	2119	36	0.0199999996
22722	2119	185	0.00999999978
22723	2119	40	0.00999999978
22724	2119	6230	0.00999999978
22725	2119	7704	0.00999999978
22726	2119	7805	0.00999999978
22727	2119	7806	0.00999999978
22728	2119	7807	0.00999999978
22729	2119	2547	0.00999999978
22730	2119	431	0.00999999978
22731	2119	304	0.00999999978
22732	2119	2495	0.0199999996
22733	2120	7828	0.0399999991
22734	2120	425	0.0199999996
22735	2120	74	0.0799999982
22736	2120	36	0.0199999996
22737	2120	7829	0.0299999993
22738	2120	3357	0.00999999978
22739	2120	3299	0.00999999978
22740	2120	7830	0.00100000005
22741	2120	7761	0.00100000005
22742	2120	7811	0.00100000005
22743	2120	1191	0.00100000005
22744	2120	7109	0.00100000005
22745	2121	107	0.0700000003
22746	2121	681	0.0500000007
22747	2121	292	0.0500000007
22748	2121	291	0.0700000003
22749	2121	1567	0.00100000005
22750	2121	7831	0.00100000005
22751	2121	7832	0.00100000005
22752	2121	7745	0.00100000005
22753	2122	74	0.0599999987
22754	2122	33	0.0700000003
22755	2122	681	0.0299999993
22756	2122	292	0.0399999991
22757	2122	2173	0.0399999991
22758	2122	7833	0.0399999991
22759	2122	7834	0.00100000005
22760	2122	7734	0.00100000005
22761	2122	425	0.00100000005
22762	2122	7830	0.00100000005
22763	2122	7741	0.00100000005
22764	2122	7835	0.00100000005
22765	2122	1303	0.00100000005
22766	2122	480	0.00100000005
22767	2122	431	0.00100000005
22768	2122	7047	0.00100000005
22769	2122	1191	0.00100000005
22770	2122	3976	0.00100000005
22771	2122	7794	0.00100000005
22772	2122	7836	0.00100000005
22773	2122	7837	0.00100000005
22774	2122	7838	0.00100000005
22775	2122	7825	0.00100000005
22776	2122	3612	0.00100000005
22777	2122	4017	0.00100000005
22778	2122	293	0.00100000005
22779	2122	5939	0.00100000005
22780	2122	472	0.00100000005
22781	2122	7839	0.00100000005
22782	2122	7840	0.00100000005
22783	2122	7841	0.00100000005
22784	2124	7697	0.0399999991
22785	2124	14	0.0399999991
22786	2124	74	0.0599999987
22787	2124	834	0.0500000007
22788	2124	33	0.0399999991
22789	2124	36	0.100000001
22790	2124	7704	0.0399999991
22791	2124	292	0.0299999993
22792	2124	7842	0.0500000007
22793	2124	7834	0.00100000005
22794	2124	7734	0.00100000005
22795	2124	7047	0.00100000005
22796	2124	1191	0.00100000005
22797	2124	3976	0.00100000005
22798	2124	7843	0.00100000005
22799	2124	7837	0.00100000005
22800	2124	7844	0.00100000005
22801	2125	88	0.119999997
22802	2125	79	0.540000021
22803	2125	410	0.159999996
22804	2125	304	0.159999996
22805	2125	37	0.129999995
22806	2125	4998	0.0799999982
22807	2125	425	0.0199999996
22808	2125	14	0.0700000003
22809	2125	36	0.0599999987
22810	2125	7097	0.0299999993
22811	2125	2591	0.109999999
22812	2125	7692	0.0599999987
22813	2125	74	0.00999999978
22814	2125	33	0.00999999978
22815	2125	7722	0.0599999987
22816	2127	8	0.0500000007
22817	2127	896	0.0199999996
22818	2127	33	0.0599999987
22819	2127	36	0.0500000007
22820	2127	1500	0.0399999991
22821	2127	1177	0.0799999982
22822	2127	681	0.0299999993
22823	2127	292	0.0299999993
22824	2127	2493	0.200000003
22825	2127	7845	0.0399999991
22826	2127	291	0.0299999993
22827	2127	4218	0.00999999978
22828	2127	7846	0.00100000005
22829	2127	2264	0.00100000005
22830	2127	162	0.00999999978
22831	2127	293	0.00999999978
22832	2127	555	0.00999999978
22833	2127	1732	0.00999999978
22834	2129	681	0.0399999991
22835	2129	292	0.0599999987
22836	2129	79	0.00999999978
22837	2129	291	0.0199999996
22838	2129	1500	0.0399999991
22839	2129	1177	0.0799999982
22840	2129	681	0.0299999993
22841	2129	292	0.0299999993
22842	2129	2493	0.200000003
22843	2129	7845	0.0399999991
22844	2129	291	0.0299999993
22845	2129	4218	0.00999999978
22846	2129	7846	0.00100000005
22847	2129	2264	0.00100000005
22848	2131	8	0.0299999993
22849	2131	681	0.0299999993
22850	2131	292	0.00999999978
22851	2131	7847	0.00100000005
22852	2131	1030	0.00100000005
22853	2131	4195	0.00100000005
22854	2131	7745	0.00100000005
22855	2133	3835	0.0399999991
22856	2133	33	0.0299999993
22857	2133	681	0.0900000036
22858	2133	7847	0.00100000005
22859	2133	7724	0.00100000005
22860	2133	2073	0.00100000005
22861	2133	7831	0.00100000005
22862	2133	7832	0.00100000005
22863	2133	5082	0.00100000005
22864	2133	7745	0.00100000005
22865	2134	3835	0.0399999991
22866	2134	33	0.0299999993
22867	2134	681	0.0900000036
22868	2134	7847	0.00100000005
22869	2134	7724	0.00100000005
22870	2134	2073	0.00100000005
22871	2134	7831	0.00100000005
22872	2140	74	0.0299999993
22873	2140	33	0.0199999996
22874	2140	419	0.0199999996
22875	2140	292	0.0399999991
22876	2140	397	0.0299999993
22877	2140	7848	0.00999999978
22878	2140	7849	0.100000001
22879	2140	255	0.0399999991
22880	2140	21	0.00999999978
22881	2140	7850	0.100000001
22882	2140	7851	0.0399999991
22883	2140	7852	0.0199999996
22884	2140	2538	0.00100000005
22885	2140	2817	0.00100000005
22886	2140	6110	0.00100000005
22887	2140	7745	0.00100000005
22888	2143	33	0.0799999982
22889	2143	681	0.119999997
22890	2143	292	0.0599999987
22891	2143	2493	0.100000001
22892	2143	4156	0.0500000007
22893	2143	7728	0.00100000005
22894	2143	7735	0.00100000005
22895	2143	7853	0.00100000005
22896	2144	14	0.00999999978
22897	2144	33	0.00999999978
22898	2144	36	0.00999999978
22899	2144	681	0.00999999978
22900	2144	7702	0.00999999978
22901	2144	7062	0.00999999978
22902	2144	2493	0.00999999978
22903	2144	40	0.00999999978
22904	2144	7854	0.00100000005
22905	2144	7758	0.00100000005
22906	2144	7830	0.00100000005
22907	2144	7841	0.00100000005
22908	2144	7817	0.00100000005
22909	2145	8	0.189999998
22910	2145	5073	0.0299999993
22911	2145	681	0.0399999991
22912	2145	599	0.0199999996
22913	2145	535	0.0199999996
22914	2145	405	0.0599999987
22915	2148	8	0.00999999978
22916	2148	425	0.00999999978
22917	2148	549	0.109999999
22918	2148	7855	0.00999999978
22919	2148	79	0.00999999978
22920	2148	7830	0.00100000005
22921	2148	7745	0.00100000005
22922	2148	7741	0.00100000005
22923	2148	2591	0.00100000005
22924	2148	7794	0.00100000005
22925	2148	7745	0.00100000005
22926	2149	8	0.00999999978
22927	2149	71	0.0799999982
22928	2149	425	0.0700000003
22929	2149	896	0.100000001
22930	2149	33	0.289999992
22931	2149	36	0.180000007
22932	2149	1512	0.0799999982
22933	2149	1177	0.0500000007
22934	2149	844	0.150000006
22935	2149	681	0.439999998
22936	2149	2493	0.00999999978
22937	2149	857	0.0599999987
22938	2149	1197	0.00999999978
22939	2149	7856	0.00100000005
22940	2149	7857	0.00100000005
22941	2149	463	0.00100000005
22942	2149	7858	0.00100000005
22943	2149	7859	0.00100000005
22944	2149	7760	0.00100000005
22945	2149	7761	0.00100000005
22946	2149	4209	0.00100000005
22947	2149	548	0.00100000005
22948	2149	7860	0.00100000005
22949	2149	3262	0.00100000005
22950	2149	7741	0.00100000005
22951	2149	7835	0.00100000005
22952	2149	7861	0.00100000005
22953	2149	531	0.00100000005
22954	2149	659	0.00100000005
22955	2149	480	0.00100000005
22956	2149	431	0.00100000005
22957	2149	1191	0.00100000005
22958	2149	7109	0.00100000005
22959	2149	3976	0.00100000005
22960	2149	7862	0.00100000005
22961	2149	7863	0.00100000005
22962	2149	2067	0.00100000005
22963	2149	45	0.00100000005
22964	2149	7864	0.00100000005
22965	2149	7745	0.00100000005
22966	2151	681	0.0799999982
22967	2151	292	0.0399999991
22968	2151	2493	0.150000006
22969	2151	293	0.00100000005
22970	2151	7865	0.00100000005
22971	2151	7866	0.00100000005
22972	2151	1732	0.00100000005
22973	2152	7867	0.0599999987
22974	2152	8	0.0799999982
22975	2152	714	0.0399999991
22976	2152	703	0.109999999
22977	2152	161	0.0799999982
22978	2152	74	0.0500000007
22979	2152	681	0.100000001
22980	2152	2117	0.129999995
22981	2152	291	0.239999995
22982	2152	7729	0.0199999996
22983	2152	7758	0.00100000005
22984	2152	7830	0.00100000005
22985	2152	7841	0.00100000005
22986	2152	7835	0.00100000005
22987	2152	3697	0.00100000005
22988	2154	7724	0.00999999978
22989	2154	74	0.0299999993
22990	2154	425	0.0199999996
22991	2154	3357	0.0199999996
22992	2154	7692	0.0500000007
22993	2154	7741	0.00100000005
22994	2154	7835	0.00999999978
22995	2154	431	0.00999999978
22996	2154	531	0.0500000007
22997	2154	659	0.00999999978
22998	2154	2591	0.00999999978
22999	2154	869	0.00999999978
23000	2154	422	0.00999999978
23001	2154	7811	0.00999999978
23002	2154	7868	0.00999999978
23003	2156	33	0.0500000007
23004	2156	36	0.0500000007
23005	2156	74	0.0500000007
23006	2156	1191	0.0700000003
23007	2156	425	0.0299999993
23008	2156	7771	0.00999999978
23009	2156	7869	0.00999999978
23010	2156	531	0.0799999982
23011	2156	659	0.100000001
23012	2156	7741	0.100000001
23013	2156	7835	0.00100000005
23014	2156	869	0.00999999978
23015	2156	422	0.0500000007
23016	2160	7724	0.00999999978
23017	2160	74	0.200000003
23018	2160	83	0.100000001
23019	2160	431	0.0500000007
23020	2160	531	0.0500000007
23021	2160	659	0.100000001
23022	2160	7741	0.00999999978
23023	2160	869	0.00999999978
23024	2160	422	0.0500000007
23025	2160	1191	0.0700000003
23026	2160	425	0.0299999993
23027	2160	5802	0.00999999978
23028	2160	4520	0.00999999978
23029	2161	14	0.00999999978
23030	2161	74	0.100000001
23031	2161	33	0.0199999996
23032	2161	7870	0.0199999996
23033	2161	7830	0.00100000005
23034	2161	7841	0.00100000005
23035	2161	7871	0.00100000005
23036	2161	1191	0.00100000005
23037	2161	7109	0.00100000005
23038	2163	7724	0.0199999996
23039	2163	74	0.0299999993
23040	2163	425	0.0399999991
23041	2163	7692	0.0299999993
23042	2163	681	0.00999999978
23043	2163	1018	0.00999999978
23044	2163	33	0.0199999996
23045	2163	36	0.00999999978
23046	2163	431	0.00999999978
23047	2163	531	0.0199999996
23048	2163	659	0.00999999978
23049	2163	7741	0.00100000005
23050	2163	7722	0.00999999978
23051	2163	37	0.00999999978
23052	2163	3522	0.0199999996
23053	2163	292	0.00999999978
23054	2163	1013	0.0399999991
23055	2164	7724	0.00999999978
23056	2164	74	0.159999996
23057	2164	425	0.00999999978
23058	2164	7692	0.00999999978
23059	2164	681	0.00999999978
23060	2164	1018	0.00999999978
23061	2164	33	0.0199999996
23062	2164	36	0.00999999978
23063	2164	431	0.00999999978
23064	2164	531	0.0500000007
23065	2164	659	0.00999999978
23066	2164	7741	0.00100000005
23067	2164	7722	0.00999999978
23068	2164	37	0.00999999978
23069	2164	7840	0.00999999978
23070	2164	14	0.00999999978
23071	2169	7724	0.00999999978
23072	2169	74	0.00999999978
23073	2169	425	0.00999999978
23074	2169	7692	0.00999999978
23075	2169	1018	0.00999999978
23076	2169	33	0.00999999978
23077	2169	36	0.00999999978
23078	2169	431	0.00999999978
23079	2169	531	0.0500000007
23080	2169	659	0.00999999978
23081	2169	7741	0.00100000005
23082	2169	7722	0.00999999978
23083	2169	37	0.00999999978
23084	2169	14	0.00999999978
23085	2170	7724	0.00999999978
23086	2170	74	0.100000001
23087	2170	425	0.00999999978
23088	2170	7692	0.00999999978
23089	2170	1018	0.00999999978
23090	2170	33	0.00999999978
23091	2170	36	0.00999999978
23092	2170	431	0.00999999978
23093	2170	531	0.0500000007
23094	2170	659	0.00999999978
23095	2170	7741	0.00100000005
23096	2170	7722	0.00999999978
23097	2170	37	0.00999999978
23098	2170	7872	0.00100000005
23099	2170	7745	0.00999999978
23100	2170	14	0.00999999978
23101	2172	7724	0.00999999978
23102	2172	74	0.0299999993
23103	2172	425	0.00999999978
23104	2172	7692	0.0199999996
23105	2172	681	0.00999999978
23106	2172	1018	0.00999999978
23107	2172	33	0.00999999978
23108	2172	36	0.00999999978
23109	2172	431	0.00999999978
23110	2172	531	0.0500000007
23111	2172	659	0.00999999978
23112	2172	7741	0.00100000005
23113	2172	7722	0.00999999978
23114	2172	37	0.00999999978
23115	2172	7840	0.00999999978
23116	2172	14	0.00999999978
23117	2174	1013	0.100000001
23118	2174	292	0.0500000007
23119	2174	1844	0.0500000007
23120	2174	425	0.0299999993
23121	2174	71	0.0399999991
23122	2174	1567	0.0199999996
23123	2174	74	0.0500000007
23124	2174	33	0.0399999991
23125	2174	896	0.0199999996
23126	2174	36	0.0199999996
23127	2174	7692	0.0199999996
23128	2174	431	0.00999999978
23129	2174	531	0.0199999996
23130	2174	659	0.00999999978
23131	2174	83	0.00999999978
23132	2175	7724	0.0199999996
23133	2175	74	0.00999999978
23134	2175	425	0.00999999978
23135	2175	7692	0.0700000003
23136	2175	681	0.00999999978
23137	2175	1018	0.00999999978
23138	2175	33	0.00999999978
23139	2175	36	0.00999999978
23140	2175	431	0.00999999978
23141	2175	531	0.0799999982
23142	2175	659	0.00999999978
23143	2175	7741	0.00100000005
23144	2175	7722	0.00999999978
23145	2175	37	0.00999999978
23146	2175	7840	0.00999999978
23147	2175	14	0.00999999978
23148	2175	920	0.0599999987
23149	2175	731	0.0500000007
23150	2175	1013	0.0399999991
23151	2180	7724	0.00999999978
23152	2180	74	0.0299999993
23153	2180	425	0.0199999996
23154	2180	7692	0.0299999993
23155	2180	681	0.00999999978
23156	2180	1018	0.00999999978
23157	2180	33	0.0199999996
23158	2180	36	0.00999999978
23159	2180	431	0.0500000007
23160	2180	531	0.0599999987
23161	2180	659	0.0199999996
23162	2180	7741	0.00100000005
23163	2180	7722	0.00999999978
23164	2180	37	0.00999999978
23165	2180	7840	0.00999999978
23166	2180	14	0.00999999978
23167	2181	531	0.00999999978
23168	2181	7758	0.00100000005
23169	2181	7830	0.00100000005
23170	2181	7841	0.00100000005
23171	2181	431	0.00100000005
23172	2181	7869	0.00100000005
23173	2182	7828	0.00999999978
23174	2182	74	0.0299999993
23175	2182	33	0.0299999993
23176	2182	7873	0.0199999996
23177	2182	7874	0.0199999996
23178	2182	2428	0.0199999996
23179	2182	7875	0.0199999996
23180	2182	3357	0.0199999996
23181	2182	7830	0.00100000005
23182	2182	7876	0.00100000005
23183	2183	434	0.0299999993
23184	2183	74	0.0599999987
23185	2183	33	0.0399999991
23186	2183	292	0.100000001
23187	2183	7735	0.00999999978
23188	2183	7734	0.00100000005
23189	2183	7877	0.00100000005
23190	2183	7758	0.00100000005
23191	2183	4350	0.00100000005
23192	2183	7830	0.00100000005
23193	2183	7841	0.00100000005
23194	2183	7878	0.00100000005
23195	2183	7879	0.00100000005
23196	2183	7880	0.00100000005
23197	2183	7881	0.00100000005
23198	2183	5616	0.00999999978
23199	2183	7882	0.00100000005
23200	2183	7883	0.00100000005
23201	2183	7794	0.00100000005
23202	2183	7853	0.00100000005
23203	2183	7884	0.00100000005
23204	2183	7885	0.00100000005
23205	2183	7097	0.00999999978
23206	2183	7745	0.00100000005
23207	2184	74	0.00999999978
23208	2184	7830	0.00100000005
23209	2184	7841	0.00100000005
23210	2184	7876	0.00100000005
23211	2184	7885	0.00100000005
23212	2184	45	0.00100000005
23213	2184	7745	0.00100000005
23214	2185	1512	0.00999999978
23215	2185	1177	0.00999999978
23216	2185	292	0.00999999978
23217	2185	7062	0.00999999978
23218	2185	2493	0.00999999978
23219	2185	291	0.00999999978
23220	2185	5958	0.00100000005
23221	2187	7886	0.00999999978
23222	2187	7887	0.300000012
23223	2187	7888	0.00999999978
23224	2187	485	0.400000006
23225	2187	292	0.270000011
23226	2187	405	0.280000001
23227	2190	913	0.0700000003
23228	2190	5305	0.0700000003
23229	2190	33	0.0599999987
23230	2190	5073	0.0500000007
23231	2190	107	0.0599999987
23232	2190	292	0.200000003
23233	2190	7018	0.0500000007
23234	2190	7849	0.0700000003
23235	2190	437	0.00999999978
23236	2190	277	0.00999999978
23237	2190	314	0.00100000005
23238	2190	7735	0.00999999978
23239	2190	12	0.00999999978
23240	2190	7830	0.00100000005
23241	2190	7853	0.00100000005
23242	2190	293	0.00100000005
23243	2190	7889	0.00100000005
23244	2190	7890	0.00100000005
23245	2190	7891	0.00100000005
23246	2190	465	0.00999999978
23247	2191	1844	0.00999999978
23248	2191	425	0.00999999978
23249	2191	74	0.0299999993
23250	2191	33	0.0299999993
23251	2191	36	0.0299999993
23252	2191	292	0.0199999996
23253	2191	7892	0.00100000005
23254	2191	993	0.00100000005
23255	2191	7834	0.00100000005
23256	2191	21	0.00100000005
23257	2191	7734	0.00100000005
23258	2191	3985	0.00100000005
23259	2191	7760	0.00100000005
23260	2191	7761	0.00100000005
23261	2191	7893	0.00100000005
23262	2191	7846	0.00100000005
23263	2191	3262	0.00100000005
23264	2191	7876	0.00100000005
23265	2191	7741	0.00100000005
23266	2191	7835	0.00100000005
23267	2191	7861	0.00100000005
23268	2191	1303	0.00100000005
23269	2191	659	0.00100000005
23270	2191	480	0.00100000005
23271	2191	431	0.00100000005
23272	2191	7047	0.00100000005
23273	2191	1191	0.00100000005
23274	2191	7109	0.00100000005
23275	2191	3976	0.00100000005
23276	2191	7836	0.00100000005
23277	2191	7837	0.00100000005
23278	2191	7838	0.00100000005
23279	2191	7825	0.00100000005
23280	2191	3612	0.00100000005
23281	2191	7894	0.00100000005
23282	2191	293	0.00100000005
23283	2191	5939	0.00100000005
23284	2191	801	0.00100000005
23285	2191	7895	0.00100000005
23286	2191	472	0.00100000005
23287	2191	7896	0.00100000005
23288	2192	441	0.100000001
23289	2192	896	0.129999995
23290	2192	74	0.0799999982
23291	2192	33	0.200000003
23292	2192	36	0.119999997
23293	2192	7897	0.150000006
23294	2192	2493	0.180000007
23295	2192	2694	0.119999997
23296	2192	3237	0.0700000003
23297	2192	7898	0.0599999987
23298	2192	291	0.0500000007
23299	2192	7735	0.00100000005
23300	2192	7834	0.00999999978
23301	2192	7734	0.00100000005
23302	2192	7853	0.00100000005
23303	2192	801	0.00100000005
23304	2192	7899	0.00100000005
23305	2192	7900	0.00100000005
23306	2193	1512	0.0299999993
23307	2193	107	0.0199999996
23308	2193	292	0.140000001
23309	2193	2493	0.0500000007
23310	2193	3332	0.0199999996
23311	2193	599	0.0399999991
23312	2193	291	0.0299999993
23313	2194	14	0.0399999991
23314	2194	74	0.0700000003
23315	2194	7901	0.0700000003
23316	2194	5305	0.0299999993
23317	2194	292	0.0700000003
23318	2194	7834	0.00100000005
23319	2194	7902	0.00100000005
23320	2194	7830	0.00100000005
23321	2194	7841	0.00100000005
23322	2194	7893	0.00100000005
23323	2194	1191	0.00999999978
23324	2194	3976	0.00100000005
23325	2197	7903	0.0199999996
23326	2197	5296	0.0299999993
23327	2197	7904	0.00999999978
23328	2197	7905	0.00999999978
23329	2197	1564	0.0199999996
23330	2197	71	0.0199999996
23331	2197	2133	0.0299999993
23332	2197	7018	0.0500000007
23333	2197	405	0.0799999982
23334	2197	7851	0.150000006
23335	2197	7906	0.00100000005
23336	2198	5429	0.400000006
23337	2198	249	0.800000012
23338	2198	425	0.150000006
23339	2198	71	0.0500000007
23340	2198	1191	0.00999999978
23341	2199	844	0.100000001
23342	2199	7907	0.0599999987
23343	2199	681	0.0799999982
23344	2199	2493	0.400000006
23345	2199	7908	0.25
23346	2199	405	0.0799999982
23347	2199	291	0.0700000003
23348	2199	801	0.0700000003
23349	2199	7899	0.00100000005
23350	2199	4193	0.00100000005
23351	2200	7040	0.100000001
23352	2200	72	0.25999999
23353	2200	71	0.00999999978
23354	2200	1512	0.25
23355	2200	681	0.0199999996
23356	2200	292	0.0500000007
23357	2200	7897	0.0299999993
23358	2200	2493	0.119999997
23359	2200	291	0.0599999987
23360	2200	7856	0.00100000005
23361	2201	7909	1
23362	2201	869	0.0399999991
23363	2201	7910	0.00100000005
23364	2201	2638	0.00100000005
23365	2201	7878	0.0199999996
23366	2201	7741	0.00100000005
23367	2201	7911	0.0199999996
23368	2201	480	0.00100000005
23369	2201	7912	0.00100000005
23370	2201	1191	0.00100000005
23371	2201	7109	0.00100000005
23372	2201	3976	0.00100000005
23373	2201	7913	0.00100000005
23374	2201	2427	0.00100000005
23375	2201	7914	0.00100000005
23376	2203	33	0.00999999978
23377	2203	36	0.00999999978
23378	2206	74	0.230000004
23379	2206	33	0.0399999991
23380	2206	36	0.170000002
23381	2206	7915	0.00100000005
23382	2207	292	0.0500000007
23383	2207	1864	0.119999997
23384	2207	79	0.0399999991
23385	2207	40	0.0399999991
23386	2207	599	0.0199999996
23387	2207	255	0.0199999996
23388	2207	405	0.109999999
23389	2207	1772	0.00100000005
23390	2207	7857	0.00999999978
23391	2207	7735	0.00100000005
23392	2207	7916	0.00100000005
23393	2207	7917	0.00100000005
23394	2207	555	0.00999999978
23395	2207	7745	0.00100000005
23396	2209	122	0.0299999993
23397	2209	7918	0.00999999978
23398	2209	5612	0.00999999978
23399	2209	7697	0.00999999978
23400	2209	71	0.0500000007
23401	2209	7919	0.00999999978
23402	2209	14	0.0599999987
23403	2209	1694	0.00999999978
23404	2209	74	0.0199999996
23405	2209	834	0.0700000003
23406	2209	33	0.0299999993
23407	2209	7920	0.00999999978
23408	2209	36	0.00999999978
23409	2209	5073	0.0399999991
23410	2209	7921	0.00999999978
23411	2209	1177	0.0199999996
23412	2209	292	0.109999999
23413	2209	3126	0.00999999978
23414	2209	801	0.00999999978
23415	2209	7922	0.00999999978
23416	2209	61	0.0599999987
23417	2209	3357	0.0500000007
23418	2209	79	0.00999999978
23419	2209	599	0.0199999996
23420	2209	229	0.0199999996
23421	2209	7923	0.0799999982
23422	2209	7924	0.0399999991
23423	2209	7925	0.00100000005
23424	2209	434	0.00100000005
23425	2209	993	0.00100000005
23426	2209	7926	0.00100000005
23427	2209	7927	0.00100000005
23428	2209	13	0.00100000005
23429	2209	550	0.00100000005
23430	2209	7928	0.00100000005
23431	2209	3262	0.00100000005
23432	2209	5386	0.00100000005
23433	2209	1030	0.00100000005
23434	2209	7769	0.00100000005
23435	2209	799	0.00100000005
23436	2209	4602	0.00100000005
23437	2209	7929	0.00100000005
23438	2209	7930	0.00100000005
23439	2209	7931	0.00100000005
23440	2209	7932	0.00100000005
23441	2209	5731	0.00100000005
23442	2209	7745	0.00100000005
23443	2209	7927	0.00100000005
23444	2209	7930	0.00100000005
23445	2209	7931	0.00100000005
23446	2209	7932	0.00100000005
23447	2210	14	0.100000001
23448	2210	33	0.0599999987
23449	2210	292	0.159999996
23450	2210	801	0.0599999987
23451	2210	3332	0.0799999982
23452	2210	61	0.200000003
23453	2210	599	0.00999999978
23454	2210	434	0.00100000005
23455	2210	7735	0.00100000005
23456	2210	7933	0.00100000005
23457	2210	5386	0.00100000005
23458	2210	7853	0.00100000005
23459	2210	799	0.00100000005
23460	2210	7891	0.00100000005
23461	2210	7927	0.00100000005
23462	2210	7934	0.00100000005
23463	2210	7932	0.00100000005
23464	2210	5731	0.00100000005
23465	2211	14	0.0199999996
23466	2211	33	0.0299999993
23467	2211	419	0.0599999987
23468	2211	107	0.0599999987
23469	2211	1177	0.0299999993
23470	2211	681	0.0399999991
23471	2211	292	0.0599999987
23472	2211	3262	0.00100000005
23473	2211	7935	0.00100000005
23474	2211	3976	0.00100000005
23475	2211	7936	0.00100000005
23476	2211	4195	0.00100000005
23477	2211	7937	0.00100000005
23478	2211	472	0.00100000005
23479	2212	896	0.0199999996
23480	2212	5305	0.0199999996
23481	2212	33	0.0199999996
23482	2212	1512	0.150000006
23483	2212	681	0.0599999987
23484	2212	2493	0.200000003
23485	2212	291	0.0399999991
23486	2212	7857	0.00100000005
23487	2212	7045	0.00100000005
23488	2212	993	0.00100000005
23489	2212	21	0.00100000005
23490	2212	7811	0.00100000005
23491	2212	7938	0.00100000005
23492	2212	7738	0.00100000005
23493	2212	7939	0.00100000005
23494	2212	7861	0.00100000005
23495	2212	431	0.00100000005
23496	2212	7940	0.00100000005
23497	2212	1191	0.00100000005
23498	2212	1030	0.00100000005
23499	2212	7769	0.00100000005
23500	2212	7941	0.00100000005
23501	2212	7895	0.00100000005
23502	2212	7900	0.00100000005
23503	2214	441	0.0700000003
23504	2214	896	0.100000001
23505	2214	1228	0.0799999982
23506	2214	74	0.0900000036
23507	2214	33	0.239999995
23508	2214	1512	0.129999995
23509	2214	291	0.100000001
23510	2214	7942	0.00100000005
23511	2214	7735	0.00100000005
23512	2214	7830	0.00100000005
23513	2214	7878	0.00100000005
23514	2214	869	0.00100000005
23515	2214	3976	0.00100000005
23516	2214	7899	0.00100000005
23517	2214	7900	0.00100000005
23518	2215	3471	0.100000001
23519	2215	659	0.00999999978
23520	2215	425	0.150000006
23521	2215	4017	0.00999999978
23522	2215	45	0.00999999978
23523	2215	292	0.0399999991
23524	2215	77	0.00999999978
23525	2215	7943	0.00100000005
23526	2216	425	0.0599999987
23527	2216	449	0.25
23528	2216	161	0.100000001
23529	2216	36	0.25999999
23530	2216	33	0.0399999991
23531	2216	74	0.140000001
23532	2216	292	0.0900000036
23533	2216	71	0.0799999982
23534	2216	7691	0.100000001
23535	2216	7692	0.0700000003
23536	2221	896	0.0599999987
23537	2221	74	0.0599999987
23538	2221	33	0.0599999987
23539	2221	7944	0.150000006
23540	2221	292	0.0599999987
23541	2221	6201	0.0700000003
23542	2221	7018	0.0599999987
23543	2221	255	0.0399999991
23544	2221	405	0.0799999982
23545	2221	993	0.00100000005
23546	2221	5616	0.00100000005
23547	2221	7758	0.00100000005
23548	2221	4350	0.00100000005
23549	2221	7760	0.00100000005
23550	2221	1527	0.00100000005
23551	2221	7761	0.00100000005
23552	2221	7846	0.00100000005
23553	2221	7945	0.00100000005
23554	2221	7835	0.00100000005
23555	2221	1303	0.00100000005
23556	2221	431	0.00100000005
23557	2221	7704	0.00100000005
23558	2221	77	0.00100000005
23559	2221	3976	0.00100000005
23560	2221	7794	0.00100000005
23561	2221	4195	0.00100000005
23562	2221	7769	0.00100000005
23563	2221	472	0.00100000005
23564	2221	7097	0.00100000005
23565	2222	7724	0.0500000007
23566	2222	83	0.100000001
23567	2222	431	0.100000001
23568	2222	531	0.100000001
23569	2222	659	0.100000001
23570	2222	7741	0.100000001
23571	2222	5260	0.0500000007
23572	2222	74	0.0500000007
23573	2222	33	0.0500000007
23574	2222	36	0.0500000007
23575	2222	7772	0.0500000007
23576	2222	90	0.0500000007
23577	2222	422	0.0500000007
23578	2222	7692	0.0500000007
23579	2222	1030	0.00039999999
23580	2223	33	0.140000001
23581	2223	1512	0.330000013
23582	2223	1177	0.0700000003
23583	2223	681	0.400000006
23584	2223	4156	0.0599999987
23585	2223	2493	0.0900000036
23586	2223	857	0.270000011
23587	2223	21	0.00100000005
23588	2223	7946	0.00100000005
23589	2223	7738	0.00100000005
23590	2223	7947	0.00100000005
23591	2223	7948	0.00100000005
23592	2223	7949	0.00100000005
23593	2223	3363	0.00100000005
23594	2223	1030	0.00100000005
23595	2223	1500	0.00100000005
23596	2223	162	0.00100000005
23597	2223	293	0.00100000005
23598	2223	7895	0.00100000005
23599	2223	2250	0.00100000005
23600	2223	40	0.00100000005
23601	2223	7950	0.00100000005
23602	2223	7745	0.00100000005
23603	2224	74	0.189999998
23604	2224	14	0.100000001
23605	2224	2510	0.200000003
23606	2224	425	0.0700000003
23607	2224	3262	0.0700000003
23608	2224	7692	0.100000001
23609	2225	33	0.00999999978
23610	2225	36	0.00999999978
23611	2225	681	0.00999999978
23612	2225	292	0.00999999978
23613	2225	7951	0.00999999978
23614	2225	7857	0.00100000005
23615	2225	6397	0.00100000005
23616	2225	7952	0.00100000005
23617	2225	7953	0.00100000005
23618	2225	4227	0.00100000005
23619	2225	431	0.00100000005
23620	2225	7954	1
23621	2228	7867	0.0199999996
23622	2228	714	0.0599999987
23623	2228	681	0.0500000007
23624	2228	292	0.0399999991
23625	2228	79	0.0199999996
23626	2228	291	0.0500000007
23627	2228	7728	0.00999999978
23628	2228	7045	0.00100000005
23629	2228	7735	0.00100000005
23630	2228	7109	0.00100000005
23631	2229	14	0.00999999978
23632	2229	33	0.00999999978
23633	2229	36	0.00999999978
23634	2229	681	0.00999999978
23635	2229	7062	0.00999999978
23636	2229	2493	0.00999999978
23637	2229	2541	0.00999999978
23638	2229	53	0.00999999978
23639	2229	3262	0.00999999978
23640	2229	3363	0.00999999978
23641	2230	896	0.100000001
23642	2230	74	0.0700000003
23643	2230	3288	0.0199999996
23644	2230	5305	0.0500000007
23645	2230	33	0.0799999982
23646	2230	1512	0.340000004
23647	2230	681	0.100000001
23648	2230	292	0.699999988
23649	2230	2493	0.0799999982
23650	2230	857	0.0700000003
23651	2230	2173	0.0299999993
23652	2230	547	0.0299999993
23653	2230	293	0.00100000005
23654	2230	3237	0.00100000005
23655	2230	2490	0.00100000005
23656	2230	7895	0.00100000005
23657	2230	7745	0.00999999978
23658	2230	7829	0.00999999978
23659	2231	14	0.140000001
23660	2231	74	0.170000002
23661	2231	5305	0.100000001
23662	2231	7955	0.0799999982
23663	2231	33	0.319999993
23664	2231	36	0.209999993
23665	2231	5073	0.0299999993
23666	2231	1177	0.170000002
23667	2231	681	0.180000007
23668	2231	7956	0.0900000036
23669	2231	292	0.310000002
23670	2231	1844	0.119999997
23671	2231	2493	0.25
23672	2231	2694	0.319999993
23673	2231	7957	0.00999999978
23674	2231	857	0.00999999978
23675	2231	972	0.159999996
23676	2231	7924	0.159999996
23677	2231	3866	0.119999997
23678	2231	445	0.0199999996
23679	2231	12	0.0199999996
23680	2231	7958	0.00100000005
23681	2231	3262	0.00100000005
23682	2231	431	0.0199999996
23683	2231	3976	0.00100000005
23684	2231	7959	0.00100000005
23685	2231	7723	0.00999999978
23686	2231	4019	0.00999999978
23687	2233	1844	0.0700000003
23688	2233	292	0.0199999996
23689	2233	71	0.0199999996
23690	2233	161	0.0500000007
23691	2233	7800	0.0799999982
23692	2233	659	0.0299999993
23693	2233	7692	0.0799999982
23694	2233	1551	0.0199999996
23695	2233	7724	0.00100000005
23696	2234	434	0.0299999993
23697	2234	21	0.0199999996
23698	2234	82	0.0399999991
23699	2234	74	0.100000001
23700	2234	7955	0.0500000007
23701	2234	33	0.100000001
23702	2234	36	0.0599999987
23703	2234	7960	0.0199999996
23704	2234	5514	0.0399999991
23705	2234	7961	0.0500000007
23706	2234	7962	0.0299999993
23707	2234	1177	0.0199999996
23708	2234	681	0.0500000007
23709	2234	292	0.0299999993
23710	2234	1844	0.0799999982
23711	2234	2493	0.00999999978
23712	2234	801	0.0199999996
23713	2234	7963	0.0299999993
23714	2234	1091	0.0199999996
23715	2234	291	0.0399999991
23716	2234	7856	0.00100000005
23717	2234	7734	0.00100000005
23718	2234	7846	0.00999999978
23719	2236	546	0.00999999978
23720	2236	293	0.00999999978
23721	2236	425	0.0299999993
23722	2236	33	0.0199999996
23723	2236	74	0.0399999991
23724	2236	36	0.0199999996
23725	2236	83	0.0599999987
23726	2236	292	0.0799999982
23727	2236	2250	0.00999999978
23728	2237	434	0.0299999993
23729	2237	7888	0.200000003
23730	2237	681	0.0299999993
23731	2237	292	0.0299999993
23732	2237	2694	0.0299999993
23733	2237	1974	0.0299999993
23734	2237	857	0.100000001
23735	2237	7964	0.200000003
23736	2237	7156	0.100000001
23737	2237	7965	0.0299999993
23738	2237	7966	0.100000001
23739	2237	7967	0.100000001
23740	2237	7968	0.100000001
23741	2237	1864	0.0299999993
23742	2237	410	0.0299999993
23743	2237	405	0.0299999993
23744	2237	7853	0.00100000005
23745	2237	7045	0.00100000005
23746	2237	7735	0.00100000005
23747	2237	7830	0.00100000005
23748	2237	7841	0.00100000005
23749	2237	7097	0.00100000005
23750	2237	682	0.00100000005
23751	2238	122	0.0299999993
23752	2238	8	0.0500000007
23753	2238	33	0.0299999993
23754	2238	681	0.119999997
23755	2238	292	0.100000001
23756	2238	2493	0.0299999993
23757	2238	971	0.0399999991
23758	2238	291	0.100000001
23759	2238	1191	0.00999999978
23760	2238	2062	0.00100000005
23761	2238	7745	0.00100000005
23762	2239	896	0.0399999991
23763	2239	33	0.0199999996
23764	2239	1512	0.150000006
23765	2239	681	0.0599999987
23766	2239	2493	0.0700000003
23767	2239	1080	0.00999999978
23768	2239	405	0.0299999993
23769	2239	8	0.00100000005
23770	2239	3243	0.00100000005
23771	2239	7969	0.00100000005
23772	2239	7741	0.00100000005
23773	2239	83	0.00100000005
23774	2239	659	0.00100000005
23775	2239	431	0.00100000005
23776	2239	7899	0.00100000005
23777	2239	7722	0.00100000005
23778	2240	292	0.0199999996
23779	2240	3985	0.00999999978
23780	2240	74	0.0500000007
23781	2240	7018	0.0500000007
23782	2240	7758	0.00100000005
23783	2240	7830	0.00100000005
23784	2240	7841	0.00100000005
23785	2240	7893	0.00100000005
23786	2240	7109	0.00100000005
23787	2240	7970	0.00100000005
23788	2241	681	0.280000001
23789	2241	1844	0.0399999991
23790	2241	425	0.25999999
23791	2241	449	0.200000003
23792	2241	74	0.0700000003
23793	2241	33	0.0399999991
23794	2241	6688	0.0799999982
23795	2241	2493	0.0700000003
23796	2241	71	0.0900000036
23797	2241	161	0.0500000007
23798	2241	2591	0.0500000007
23799	2241	7692	0.0799999982
23800	2241	801	0.0900000036
23801	2242	7971	0.00999999978
23802	2242	2090	0.00999999978
23803	2242	292	0.150000006
23804	2242	37	0.00999999978
23805	2242	7972	0.00100000005
23806	2242	7973	0.00100000005
23807	2242	7666	0.00100000005
23808	2242	7974	0.00100000005
23809	2242	3290	0.00100000005
23810	2243	292	0.0299999993
23811	2243	801	0.0199999996
23812	2243	291	0.0199999996
23813	2243	425	0.0199999996
23814	2243	74	0.0700000003
23815	2243	33	0.0399999991
23816	2244	292	0.300000012
23817	2244	681	0.0250000004
23818	2244	3507	0.319999993
23819	2244	74	0.300000012
23820	2244	36	0.300000012
23821	2244	33	0.129999995
23822	2244	395	0.119999997
23823	2244	7691	0.100000001
23824	2244	5429	0.0799999982
23825	2244	83	0.0700000003
23826	2244	7692	0.0599999987
23827	2244	107	0.0599999987
23828	2245	549	0.0199999996
23829	2245	681	0.0599999987
23830	2245	7975	0.0599999987
23831	2245	7976	0.0599999987
23832	2245	291	0.0299999993
23833	2245	8	0.0399999991
23834	2245	7977	0.00100000005
23835	2245	7741	0.00100000005
23836	2245	7109	0.00100000005
23837	2245	3976	0.00100000005
23838	2245	472	0.00100000005
23839	2245	5082	0.00100000005
23840	2245	7794	0.00100000005
23841	2245	7745	0.00100000005
23842	2247	291	0.200000003
23843	2247	1844	0.109999999
23844	2247	74	0.319999993
23845	2247	33	0.230000004
23846	2247	7697	0.109999999
23847	2247	82	0.0700000003
23848	2247	3262	0.0299999993
23849	2247	453	0.0700000003
23850	2252	122	0.0299999993
23851	2252	15	0.0700000003
23852	2252	293	0.00999999978
23853	2252	425	0.0299999993
23854	2252	33	0.0900000036
23855	2252	74	0.0399999991
23856	2252	36	0.100000001
23857	2252	83	0.0599999987
23858	2252	292	0.0799999982
23859	2252	1844	0.0299999993
23860	2252	681	0.0199999996
23861	2252	7978	0.0199999996
23862	2252	3357	0.0299999993
23863	2252	7979	0.0700000003
23864	2252	2591	0.0599999987
23865	2252	83	0.0299999993
23866	2252	531	0.0199999996
23867	2252	659	0.0199999996
23868	2252	7692	0.100000001
23869	2252	79	0.0399999991
23870	2253	33	0.0500000007
23871	2253	36	0.0500000007
23872	2253	74	0.0500000007
23873	2253	7733	0.100000001
23874	2253	1030	0.00100000005
23875	2253	7760	0.00100000005
23876	2253	511	0.00100000005
23877	2254	14	0.0199999996
23878	2254	896	0.00999999978
23879	2254	74	0.0399999991
23880	2254	834	0.00999999978
23881	2254	33	0.00999999978
23882	2254	1512	0.00999999978
23883	2254	292	0.0500000007
23884	2254	2493	0.0199999996
23885	2254	7758	0.00100000005
23886	2254	7830	0.00100000005
23887	2254	7841	0.00100000005
23888	2254	7980	0.00100000005
23889	2254	7745	0.00100000005
23890	2254	7981	0.00100000005
23891	2254	4195	0.00100000005
23892	2254	7982	0.00100000005
23893	2255	7983	0.0599999987
23894	2255	7984	0.25
23895	2255	7918	0.00999999978
23896	2255	5612	0.00999999978
23897	2255	7985	0.00999999978
23898	2255	7986	0.170000002
23899	2255	71	0.0399999991
23900	2255	703	0.00999999978
23901	2255	14	0.0199999996
23902	2255	7987	0.00999999978
23903	2255	292	0.0500000007
23904	2255	7988	0.0399999991
23905	2255	7922	0.00999999978
23906	2255	7989	0.00999999978
23907	2255	7990	0.00999999978
23908	2255	7991	0.0500000007
23909	2255	7992	0.00999999978
23910	2255	2398	0.0399999991
23911	2255	4390	0.0500000007
23912	2255	7925	0.00100000005
23913	2255	993	0.00100000005
23914	2255	7926	0.00100000005
23915	2255	550	0.00100000005
23916	2255	7928	0.00100000005
23917	2255	5767	0.00100000005
23918	2255	7993	0.00100000005
23919	2255	7769	0.00100000005
23920	2255	799	0.00100000005
23921	2255	7929	0.00100000005
23922	2255	7927	0.00100000005
23923	2255	7931	0.00100000005
23924	2255	7932	0.00100000005
23925	2255	5731	0.00100000005
23926	2255	7745	0.00100000005
23927	2257	122	0.00999999978
23928	2257	2539	0.0399999991
23929	2257	7918	0.00999999978
23930	2257	703	0.0399999991
23931	2257	14	0.00999999978
23932	2257	33	0.0399999991
23933	2257	36	0.0399999991
23934	2257	292	0.0399999991
23935	2257	489	0.0399999991
23936	2257	801	0.0399999991
23937	2257	2494	0.0399999991
23938	2257	6201	0.0399999991
23939	2257	7994	0.0399999991
23940	2257	7995	0.00999999978
23941	2257	32	0.00999999978
23942	2257	7996	0.0399999991
23943	2257	7997	0.00999999978
23944	2257	7988	0.0399999991
23945	2257	7870	0.0399999991
23946	2257	7998	0.00999999978
23947	2257	3332	0.00999999978
23948	2257	7999	0.0399999991
23949	2257	8000	0.0399999991
23950	2257	7990	0.00999999978
23951	2257	434	0.00100000005
23952	2257	993	0.00100000005
23953	2257	2635	0.00100000005
23954	2257	2514	0.00100000005
23955	2257	5767	0.00100000005
23956	2257	8001	0.00100000005
23957	2257	8002	0.00100000005
23958	2257	7005	0.00100000005
23959	2257	8003	0.00100000005
23960	2257	8004	0.00100000005
23961	2257	7929	0.00100000005
23962	2257	8005	0.00100000005
23963	2257	8006	0.00100000005
23964	2257	5731	0.00100000005
23965	2259	5157	0.0500000007
23966	2259	1191	0.00999999978
23967	2259	427	0.00999999978
23968	2259	33	0.00999999978
23969	2259	36	0.00999999978
23970	2259	419	0.00999999978
23971	2259	2510	0.00999999978
23972	2259	659	0.00999999978
23973	2259	547	0.00999999978
23974	2259	425	0.00999999978
23975	2259	7724	0.00999999978
23976	2260	122	0.0500000007
23977	2260	14	0.0599999987
23978	2260	74	0.0599999987
23979	2260	834	0.0599999987
23980	2260	5305	0.100000001
23981	2260	33	0.0599999987
23982	2260	8007	0.100000001
23983	2260	681	0.0599999987
23984	2260	292	0.0299999993
23985	2260	53	0.0599999987
23986	2260	7728	0.00100000005
23987	2260	7735	0.00100000005
23988	2260	434	0.00100000005
23989	2260	5616	0.00100000005
23990	2260	4350	0.00100000005
23991	2260	7830	0.00100000005
23992	2260	7841	0.00100000005
23993	2260	7878	0.00100000005
23994	2260	7879	0.00100000005
23995	2260	7880	0.00100000005
23996	2260	8008	0.00100000005
23997	2260	431	0.00100000005
23998	2260	7047	0.00100000005
23999	2260	1191	0.00999999978
24000	2260	3976	0.00100000005
24001	2260	7853	0.00100000005
24002	2260	7884	0.00100000005
24003	2260	8009	0.00100000005
24004	2260	7097	0.00100000005
24005	2261	425	0.150000006
24006	2261	449	0.0799999982
24007	2261	7691	0.0399999991
24008	2261	74	0.0399999991
24009	2261	7692	0.0599999987
24010	2261	45	0.0599999987
24011	2261	2510	0.0399999991
24012	2262	74	0.0299999993
24013	2262	419	0.0299999993
24014	2262	107	0.0299999993
24015	2262	7018	0.0399999991
24016	2262	255	0.0299999993
24017	2262	405	0.0399999991
24018	2262	1191	0.00100000005
24019	2262	7704	0.0199999996
24020	2262	4195	0.00100000005
24021	2263	896	0.00999999978
24022	2263	74	0.0199999996
24023	2263	681	0.00999999978
24024	2263	292	0.0199999996
24025	2263	7830	0.00100000005
24026	2263	7841	0.00100000005
24027	2263	3707	0.00100000005
24028	2263	1030	0.00100000005
24029	2263	7745	0.00100000005
24030	2263	4195	0.00100000005
24031	2263	293	0.00100000005
24032	2263	555	0.00100000005
24033	2265	14	0.0500000007
24034	2265	33	0.0199999996
24035	2265	7874	0.0299999993
24036	2265	8010	0.0700000003
24037	2265	5073	0.0299999993
24038	2265	535	0.0199999996
24039	2265	3262	0.00100000005
24040	2265	8011	0.00999999978
24041	2265	4195	0.00100000005
24042	2265	7976	0.200000003
24043	2267	8012	0.00999999978
24044	2267	441	0.00999999978
24045	2267	71	0.00999999978
24046	2267	14	0.00999999978
24047	2267	896	0.100000001
24048	2267	74	0.0299999993
24049	2267	5305	0.00999999978
24050	2267	7955	0.00999999978
24051	2267	33	0.100000001
24052	2267	36	0.100000001
24053	2267	1512	0.00999999978
24054	2267	1177	0.0900000036
24055	2267	547	0.00999999978
24056	2267	681	0.0299999993
24057	2267	7956	0.0599999987
24058	2267	292	0.00999999978
24059	2267	1844	0.00999999978
24060	2267	2493	0.100000001
24061	2267	489	0.0500000007
24062	2267	801	0.0599999987
24063	2267	2541	0.0599999987
24064	2267	2490	0.00999999978
24065	2267	1080	0.00999999978
24066	2267	40	0.0399999991
24067	2267	2398	0.0399999991
24068	2267	291	0.00999999978
24069	2267	567	0.0500000007
24070	2267	7867	0.00100000005
24071	2267	7857	0.00999999978
24072	2267	277	0.00999999978
24073	2267	8	0.00100000005
24074	2267	7738	0.00999999978
24075	2267	162	0.00100000005
24076	2267	4193	0.00100000005
24077	2267	7866	0.00100000005
24078	2268	8013	0.0199999996
24079	2268	5073	0.0199999996
24080	2268	681	0.0199999996
24081	2268	292	0.0700000003
24082	2268	2493	0.00999999978
24083	2268	291	0.00999999978
24084	2268	8014	0.0199999996
24085	2269	445	0.00999999978
24086	2269	14	0.00999999978
24087	2269	5305	0.00999999978
24088	2269	33	0.00999999978
24089	2269	292	0.00999999978
24090	2269	1844	0.00999999978
24091	2269	3237	0.00999999978
24092	2269	405	0.00999999978
24093	2270	8015	0.0399999991
24094	2270	7988	0.00499999989
24095	2270	2545	0.0500000007
24096	2270	8016	0.00100000005
24097	2270	8017	0.0199999996
24098	2272	8018	0.0700000003
24099	2272	33	0.0500000007
24100	2272	36	0.0500000007
24101	2272	2538	0.00999999978
24102	2272	292	0.0900000036
24103	2272	79	0.0399999991
24104	2272	397	0.0599999987
24105	2272	599	0.0700000003
24106	2272	255	0.0700000003
24107	2272	7712	0.109999999
24108	2272	405	0.170000002
24109	2272	8019	0.00100000005
24110	2272	6110	0.00100000005
24111	2272	8020	0.00100000005
24112	2272	555	0.140000001
24113	2273	8021	0.0900000036
24114	2273	33	0.0399999991
24115	2273	36	0.0399999991
24116	2273	292	0.0900000036
24117	2273	2538	0.00999999978
24118	2273	79	0.0399999991
24119	2273	397	0.0599999987
24120	2273	599	0.0700000003
24121	2273	255	0.0599999987
24122	2273	7712	0.100000001
24123	2273	405	0.170000002
24124	2273	8019	0.00100000005
24125	2273	6110	0.00100000005
24126	2273	8022	0.00100000005
24127	2273	555	0.100000001
24128	2275	33	0.0500000007
24129	2275	36	0.0199999996
24130	2275	292	0.0700000003
24131	2275	7834	0.00100000005
24132	2275	7734	0.00100000005
24133	2275	7830	0.00100000005
24134	2275	7841	0.00100000005
24135	2275	7741	0.00100000005
24136	2275	293	0.00100000005
24137	2276	8023	0.0199999996
24138	2276	292	0.0299999993
24139	2276	410	0.00999999978
24140	2276	7018	0.00999999978
24141	2276	8024	0.00100000005
24142	2277	74	0.119999997
24143	2277	5305	0.0799999982
24144	2277	7955	0.100000001
24145	2277	33	0.180000007
24146	2277	1177	0.150000006
24147	2277	681	0.0599999987
24148	2277	1844	0.0199999996
24149	2277	2493	0.119999997
24150	2277	2694	0.0700000003
24151	2277	489	0.100000001
24152	2277	7956	0.0900000036
24153	2277	599	0.0799999982
24154	2277	535	0.200000003
24155	2277	567	0.0799999982
24156	2277	7834	0.00100000005
24157	2277	7758	0.00100000005
24158	2277	548	0.00100000005
24159	2277	869	0.00100000005
24160	2277	293	0.00200000009
24161	2277	801	0.00100000005
24162	2277	8025	0.00100000005
24163	2277	7899	0.00100000005
24164	2277	7900	0.00100000005
24165	2278	5305	0.0500000007
24166	2278	33	0.0299999993
24167	2278	292	0.0599999987
24168	2278	2860	0.00100000005
24169	2278	3262	0.00100000005
24170	2278	8026	0.00100000005
24171	2278	3976	0.00100000005
24172	2278	7664	0.00100000005
24173	2278	2073	0.00100000005
24174	2278	7294	0.00100000005
24175	2278	4195	0.00100000005
24176	2278	7825	0.00100000005
24177	2279	8027	0.00999999978
24178	2279	7955	0.00999999978
24179	2279	33	0.00999999978
24180	2279	547	0.00999999978
24181	2279	522	0.00999999978
24182	2279	644	0.00999999978
24183	2280	1994	0.100000001
24184	2280	74	0.100000001
24185	2280	834	0.119999997
24186	2280	5305	0.0700000003
24187	2280	2272	0.100000001
24188	2280	33	0.699999988
24189	2280	36	0.200000003
24190	2280	1177	0.0900000036
24191	2280	292	0.0599999987
24192	2280	1415	0.00100000005
24193	2281	425	0.119999997
24194	2281	7691	0.100000001
24195	2281	74	0.100000001
24196	2281	292	0.0199999996
24197	2281	161	0.0199999996
24198	2281	7692	0.100000001
24199	2281	71	0.0700000003
24200	2282	7722	0.300000012
24201	2282	33	0.469999999
24202	2282	74	0.300000012
24203	2282	36	0.25999999
24204	2282	480	0.100000001
24205	2282	83	0.300000012
24206	2282	2591	0.289999992
24207	2282	659	0.300000012
24208	2282	431	0.0500000007
24209	2282	292	0.25
24210	2282	422	0.25
24211	2282	4209	0.25999999
24212	2282	3522	0.0260000005
24213	2282	3516	0.300000012
24214	2282	1567	0.400000006
24215	2282	455	0.0500000007
24216	2283	8	0.0299999993
24217	2283	549	0.0299999993
24218	2283	33	0.0199999996
24219	2283	36	0.0199999996
24220	2283	681	0.0500000007
24221	2283	79	0.0599999987
24222	2283	7977	0.00100000005
24223	2283	7741	0.00100000005
24224	2283	7794	0.00100000005
24225	2283	7884	0.00999999978
24226	2283	2067	0.00100000005
24227	2283	42	0.00100000005
24228	2283	7745	0.00100000005
24229	2284	3835	0.400000006
24230	2284	3516	0.00999999978
24231	2284	7955	0.00999999978
24232	2284	8028	0.00999999978
24233	2284	2691	0.00999999978
24234	2284	7758	0.00100000005
24235	2284	4350	0.00100000005
24236	2284	7830	0.00100000005
24237	2284	7841	0.00100000005
24238	2284	3262	0.00100000005
24239	2284	7741	0.00100000005
24240	2284	7835	0.00100000005
24241	2284	431	0.00100000005
24242	2284	7794	0.00100000005
24243	2285	714	0.0500000007
24244	2285	33	0.00999999978
24245	2285	36	0.0299999993
24246	2285	8029	0.100000001
24247	2285	844	0.0700000003
24248	2285	681	0.150000006
24249	2285	1197	0.0500000007
24250	2285	2493	0.119999997
24251	2285	8030	0.0500000007
24252	2285	291	0.0599999987
24253	2285	37	0.00999999978
24254	2285	7830	0.00100000005
24255	2285	8031	0.00100000005
24256	2285	162	0.00100000005
24257	2285	293	0.00600000005
24258	2285	7899	0.00100000005
24259	2286	83	0.25999999
24260	2286	2591	0.289999992
24261	2286	659	0.400000006
24262	2286	431	0.5
24263	2286	427	0.150000006
24264	2286	74	0.400000006
24265	2286	36	0.129999995
24266	2286	2510	0.100000001
24267	2286	45	0.100000001
24268	2286	71	0.0500000007
24269	2288	14	0.100000001
24270	2288	8032	0.00999999978
24271	2288	5305	0.200000003
24272	2288	7944	0.00100000005
24273	2288	4195	0.00100000005
24274	2289	7110	0.100000001
24275	2289	7722	0.100000001
24276	2289	7723	0.100000001
24277	2289	40	0.00999999978
24278	2289	531	0.00999999978
24279	2289	7724	0.00999999978
24280	2289	7970	0.00100000005
24281	2290	546	0.100000001
24282	2290	33	0.0500000007
24283	2290	1177	0.00999999978
24284	2290	681	0.0500000007
24285	2290	292	0.0799999982
24286	2290	8033	0.00100000005
24287	2290	8034	0.00100000005
24288	2290	7830	0.00100000005
24289	2291	546	0.0199999996
24290	2291	896	0.0199999996
24291	2291	74	0.0299999993
24292	2291	834	0.0299999993
24293	2291	33	0.0199999996
24294	2291	1177	0.100000001
24295	2291	681	0.0399999991
24296	2291	7956	0.0399999991
24297	2291	292	0.0500000007
24298	2291	2694	0.0399999991
24299	2291	7830	0.00100000005
24300	2291	8035	0.0299999993
24301	2291	1303	0.00100000005
24302	2291	7830	0.00100000005
24303	2292	3051	0.00999999978
24304	2292	3922	0.00999999978
24305	2292	33	0.00999999978
24306	2292	546	0.00100000005
24307	2292	1303	0.00100000005
24308	2292	7767	0.00100000005
24309	2292	1191	0.00100000005
24310	2299	546	0.00999999978
24311	2299	8036	0.00999999978
24312	2299	703	0.00999999978
24313	2299	122	0.00100000005
24314	2299	314	0.00100000005
24315	2299	2792	0.00100000005
24316	2299	546	0.00100000005
24317	2300	546	0.00999999978
24318	2300	2792	0.00100000005
24319	2300	8035	0.00100000005
24320	2301	33	0.00999999978
24321	2301	36	0.00999999978
24322	2303	8	0.00999999978
24323	2303	8037	0.00999999978
24324	2303	971	0.00999999978
24325	2303	7857	0.00100000005
24326	2303	7830	0.00100000005
24327	2303	7841	0.00100000005
24328	2303	548	0.00100000005
24329	2303	550	0.00100000005
24330	2303	161	0.00100000005
24331	2303	1567	0.00100000005
24332	2303	3516	0.00100000005
24333	2303	548	0.00100000005
24334	2303	3522	0.00100000005
24335	2303	2635	0.00100000005
24336	2303	3262	0.00100000005
24337	2303	7767	0.00100000005
24338	2303	8038	0.00100000005
24339	2303	6498	0.00100000005
24340	2303	45	0.00100000005
24341	2303	5082	0.00100000005
24342	2305	33	0.00999999978
24343	2305	36	0.00999999978
24344	2305	681	0.00999999978
24345	2305	7702	0.00999999978
24346	2305	7897	0.00999999978
24347	2305	7854	0.00100000005
24348	2305	7830	0.00100000005
24349	2305	7841	0.00100000005
24350	2305	7741	0.00100000005
24351	2305	3482	0.00100000005
24352	2305	7109	0.00100000005
24353	2305	3976	0.00100000005
24354	2305	4193	0.00100000005
24355	2306	2538	0.00999999978
24356	2306	7895	0.00999999978
24357	2306	7850	0.00100000005
24358	2306	161	0.00100000005
24359	2306	2817	0.00100000005
24360	2306	6110	0.00100000005
24361	2306	8039	0.00100000005
24362	2308	8040	0.00999999978
24363	2308	7734	0.00100000005
24364	2308	7741	0.00100000005
24365	2308	7835	0.00100000005
24366	2308	659	0.00100000005
24367	2308	431	0.00100000005
24368	2308	8041	0.00100000005
24369	2308	7823	0.00100000005
24370	2308	8042	0.00100000005
24371	2308	293	0.00100000005
24372	2308	5151	0.00100000005
24373	2308	511	0.00100000005
24374	2308	7745	0.00100000005
24375	2309	1512	0.00999999978
24376	2309	292	0.00999999978
24377	2309	2493	0.00999999978
24378	2310	7946	0.00999999978
24379	2310	1512	0.00999999978
24380	2310	681	0.00999999978
24381	2310	2493	0.00999999978
24382	2310	857	0.00999999978
24383	2310	4184	0.00999999978
24384	2310	8043	0.00999999978
24385	2310	445	0.00100000005
24386	2310	12	0.00100000005
24387	2310	7895	0.00100000005
24388	2311	425	0.0599999987
24389	2311	3922	0.0599999987
24390	2311	33	0.0299999993
24391	2311	36	0.0199999996
24392	2311	3482	0.0599999987
24393	2311	681	0.0599999987
24394	2311	292	0.0199999996
24395	2311	463	0.00100000005
24396	2311	434	0.00100000005
24397	2311	993	0.00100000005
24398	2311	8044	0.00100000005
24399	2311	7758	0.00100000005
24400	2311	4350	0.00100000005
24401	2311	7760	0.00100000005
24402	2311	7761	0.00100000005
24403	2311	7846	0.00100000005
24404	2311	7945	0.00100000005
24405	2311	8045	0.00100000005
24406	2311	8046	0.00100000005
24407	2311	390	0.00100000005
24408	2311	3262	0.00100000005
24409	2311	7741	0.00100000005
24410	2311	83	0.00100000005
24411	2311	7835	0.00100000005
24412	2311	1303	0.00100000005
24413	2311	2591	0.00100000005
24414	2311	431	0.00100000005
24415	2311	7882	0.00100000005
24416	2311	7047	0.00100000005
24417	2311	1191	0.00100000005
24418	2311	7109	0.00100000005
24419	2311	77	0.00100000005
24420	2311	3976	0.00100000005
24421	2311	7862	0.00100000005
24422	2311	2264	0.00100000005
24423	2311	7769	0.00100000005
24424	2311	7957	0.00100000005
24425	2311	511	0.00100000005
24426	2311	801	0.00100000005
24427	2311	472	0.00100000005
24428	2311	2067	0.00100000005
24429	2311	329	0.00100000005
24430	2311	8047	0.00100000005
24431	2312	12	0.00999999978
24432	2312	293	0.0599999987
24433	2312	425	0.00999999978
24434	2312	33	0.0199999996
24435	2312	74	0.0399999991
24436	2312	36	0.0199999996
24437	2312	42	0.0199999996
24438	2315	74	0.00999999978
24439	2315	36	0.00999999978
24440	2315	681	0.0599999987
24441	2315	7783	0.00999999978
24442	2315	291	0.0599999987
24443	2315	7867	0.00100000005
24444	2315	4371	0.00999999978
24445	2315	7728	0.00100000005
24446	2315	7045	0.00100000005
24447	2315	1276	0.00100000005
24448	2315	8048	0.00100000005
24449	2315	4350	0.00100000005
24450	2315	7830	0.00100000005
24451	2315	7841	0.00100000005
24452	2315	546	0.00100000005
24453	2315	7853	0.00100000005
24454	2315	7097	0.00100000005
24455	2316	14	0.170000002
24456	2316	2010	0.119999997
24457	2316	5694	0.200000003
24458	2316	292	0.0199999996
24459	2316	681	0.0299999993
24460	2316	1644	0.0199999996
24461	2316	36	0.129999995
24462	2316	74	0.0299999993
24463	2316	7692	0.0500000007
24464	2316	77	0.0199999996
24465	2317	14	0.0199999996
24466	2317	896	0.0199999996
24467	2317	74	0.0199999996
24468	2317	5305	0.0500000007
24469	2317	33	0.0599999987
24470	2317	7704	0.100000001
24471	2317	681	0.0599999987
24472	2317	292	0.129999995
24473	2317	2493	0.0199999996
24474	2317	971	0.0199999996
24475	2317	191	0.0199999996
24476	2317	7857	0.00100000005
24477	2317	463	0.00100000005
24478	2317	993	0.00100000005
24479	2317	8049	0.00100000005
24480	2317	8050	0.00100000005
24481	2317	4350	0.00100000005
24482	2317	7760	0.00100000005
24483	2317	7761	0.00100000005
24484	2317	7846	0.00100000005
24485	2317	7945	0.00100000005
24486	2317	8045	0.00100000005
24487	2317	7835	0.00100000005
24488	2317	2591	0.00100000005
24489	2317	7047	0.00100000005
24490	2317	1191	0.00100000005
24491	2317	77	0.00100000005
24492	2317	3976	0.00100000005
24493	2317	7794	0.00100000005
24494	2317	7769	0.00100000005
24495	2317	293	0.00100000005
24496	2317	8051	0.00100000005
24497	2317	8052	0.00100000005
24498	2317	5151	0.00100000005
24499	2317	8053	0.00100000005
24500	2317	511	0.00100000005
24501	2317	45	0.00100000005
24502	2317	7097	0.00100000005
24503	2317	8054	0.00100000005
24504	2318	7697	0.00999999978
24505	2318	546	0.00999999978
24506	2318	1567	0.00999999978
24507	2318	8036	0.00999999978
24508	2318	8035	0.00100000005
24509	2319	74	0.00999999978
24510	2319	3922	0.00999999978
24511	2319	292	0.00999999978
24512	2319	405	0.00999999978
24513	2319	291	0.00999999978
24514	2319	431	0.00100000005
24515	2319	7811	0.00100000005
24516	2319	1191	0.00100000005
24517	2319	4195	0.00100000005
24518	2319	45	0.00100000005
24519	2319	7745	0.00100000005
24520	2320	161	0.0199999996
24521	2320	8055	0.00999999978
24522	2320	33	0.0500000007
24523	2320	36	0.0500000007
24524	2320	1191	0.00999999978
24525	2320	7692	0.200000003
24526	2320	2510	0.439999998
24527	2320	83	0.00999999978
24528	2320	425	0.0199999996
24529	2323	681	0.400000006
24530	2323	292	0.400000006
24531	2323	7867	0.0199999996
24532	2323	314	0.0199999996
24533	2326	74	0.109999999
24534	2326	33	0.100000001
24535	2326	36	0.0299999993
24536	2326	681	0.0399999991
24537	2326	292	0.0399999991
24538	2326	7842	0.00999999978
24539	2326	857	0.00999999978
24540	2326	972	0.00999999978
24541	2326	8056	0.00999999978
24542	2326	7834	0.00100000005
24543	2326	7734	0.00100000005
24544	2326	7109	0.00100000005
24545	2326	7837	0.00100000005
24546	2326	682	0.00100000005
24547	2327	7904	0.0399999991
24548	2327	71	0.00999999978
24549	2327	33	0.00999999978
24550	2327	36	0.00999999978
24551	2327	7857	0.00100000005
24552	2327	7834	0.00100000005
24553	2327	7734	0.00100000005
24554	2327	8057	0.00100000005
24555	2327	7109	0.00100000005
24556	2328	74	0.00999999978
24557	2328	834	0.00999999978
24558	2328	33	0.00999999978
24559	2328	36	0.00999999978
24560	2328	7056	0.00100000005
24561	2328	8058	0.00100000005
24562	2328	549	0.00100000005
24563	2328	14	0.00100000005
24564	2328	8045	0.00100000005
24565	2329	2691	0.00999999978
24566	2329	8059	0.0700000003
24567	2329	33	0.140000001
24568	2329	681	0.0900000036
24569	2329	410	0.0299999993
24570	2329	291	0.109999999
24571	2329	314	0.00100000005
24572	2329	549	0.00100000005
24573	2329	7109	0.00100000005
24574	2329	7097	0.00100000005
24575	2330	425	0.100000001
24576	2330	14	0.0700000003
24577	2330	74	0.0700000003
24578	2330	5305	0.0500000007
24579	2330	33	0.0700000003
24580	2330	36	0.0599999987
24581	2330	1177	0.0500000007
24582	2330	844	0.0700000003
24583	2330	7907	0.0599999987
24584	2330	681	0.140000001
24585	2330	292	0.289999992
24586	2330	1844	0.0700000003
24587	2330	2493	0.129999995
24588	2330	2694	0.0599999987
24589	2330	971	0.0199999996
24590	2330	857	0.0299999993
24591	2330	972	0.0500000007
24592	2330	489	0.0299999993
24593	2330	801	0.0299999993
24594	2330	3332	0.0599999987
24595	2330	535	0.100000001
24596	2330	229	0.0500000007
24597	2330	7758	0.00100000005
24598	2330	7830	0.00100000005
24599	2330	7841	0.00100000005
24600	2330	83	0.00100000005
24601	2330	603	0.00100000005
24602	2330	659	0.00100000005
24603	2330	431	0.00100000005
24604	2330	3976	0.00100000005
24605	2330	8060	0.00100000005
24606	2330	2264	0.00100000005
24607	2330	7745	0.00100000005
24608	2330	7941	0.00100000005
24609	2331	292	0.300000012
24610	2331	291	0.25
24611	2331	1844	0.100000001
24612	2331	33	0.0149999997
24613	2331	74	0.180000007
24614	2331	3262	0.0299999993
24615	2331	14	0.0900000036
24616	2331	2591	0.0799999982
24617	2331	7692	0.0500000007
24618	2331	2510	0.119999997
24619	2331	681	0.100000001
24620	2331	801	0.0900000036
24621	2331	38	0.0700000003
24622	2331	425	0.0900000036
24623	2331	427	0.100000001
24624	2331	107	0.0900000036
24625	2332	14	0.0399999991
24626	2332	896	0.0299999993
24627	2332	74	0.0500000007
24628	2332	292	0.00999999978
24629	2332	33	0.0199999996
24630	2332	7893	0.00100000005
24631	2332	3262	0.00100000005
24632	2332	7758	0.00100000005
24633	2332	7830	0.00100000005
24634	2332	7841	0.00100000005
24635	2332	7981	0.00100000005
24636	2332	4195	0.00100000005
24637	2332	7869	0.00100000005
24638	2333	8061	0.0299999993
24639	2333	8036	0.00999999978
24640	2333	71	0.00999999978
24641	2333	425	0.00999999978
24642	2333	546	0.00999999978
24643	2333	8062	0.200000003
24644	2333	8035	0.0500000007
24645	2334	857	0.100000001
24646	2334	7964	0.100000001
24647	2334	7156	0.100000001
24648	2334	1976	0.100000001
24649	2334	8063	0.100000001
24650	2334	7966	0.100000001
24651	2334	8064	0.100000001
24652	2334	8065	0.00100000005
24653	2335	425	0.0700000003
24654	2335	74	0.0199999996
24655	2335	7956	0.0700000003
24656	2335	2694	0.0199999996
24657	2335	3697	0.0900000036
24658	2335	535	0.0700000003
24659	2335	405	0.0799999982
24660	2335	37	0.0599999987
24661	2335	8066	0.00100000005
24662	2335	434	0.00999999978
24663	2335	21	0.00999999978
24664	2335	12	0.0199999996
24665	2335	7097	0.00100000005
24666	2336	74	0.0500000007
24667	2336	33	0.0700000003
24668	2336	681	0.0299999993
24669	2336	292	0.0599999987
24670	2336	1844	0.0399999991
24671	2336	7056	0.00100000005
24672	2336	7834	0.00100000005
24673	2336	7734	0.00100000005
24674	2336	1275	0.00100000005
24675	2336	7758	0.00100000005
24676	2336	7830	0.00100000005
24677	2336	546	0.00100000005
24678	2336	7835	0.00100000005
24679	2336	480	0.00100000005
24680	2336	7766	0.00100000005
24681	2336	1191	0.00100000005
24682	2336	3976	0.00100000005
24683	2336	7836	0.00100000005
24684	2336	7837	0.00100000005
24685	2336	7825	0.00100000005
24686	2336	3612	0.00100000005
24687	2336	4017	0.00100000005
24688	2336	293	0.00100000005
24689	2336	5939	0.00100000005
24690	2336	45	0.00100000005
24691	2337	913	0.0900000036
24692	2337	681	0.0199999996
24693	2337	292	0.140000001
24694	2337	535	0.0900000036
24695	2337	277	0.00999999978
24696	2337	7735	0.00999999978
24697	2337	7834	0.00100000005
24698	2337	293	0.00100000005
24699	2337	8067	0.00100000005
24700	2337	465	0.00100000005
24701	2337	511	0.00100000005
24702	2337	2062	0.00100000005
24703	2338	292	0.0900000036
24704	2338	1844	0.0700000003
24705	2338	681	0.0500000007
24706	2338	291	0.0299999993
24707	2338	2493	0.0299999993
24708	2338	4156	0.0299999993
24709	2338	425	0.0199999996
24710	2338	74	0.0500000007
24711	2338	33	0.0500000007
24712	2339	2539	0.00999999978
24713	2339	703	0.00999999978
24714	2339	33	0.00999999978
24715	2339	36	0.00999999978
24716	2339	292	0.00999999978
24717	2339	489	0.00999999978
24718	2339	801	0.00999999978
24719	2339	2494	0.00999999978
24720	2339	8068	0.00999999978
24721	2339	7997	0.00999999978
24722	2339	7988	0.00999999978
24723	2339	3332	0.00999999978
24724	2339	7989	0.00999999978
24725	2339	434	0.00100000005
24726	2339	993	0.00100000005
24727	2339	2635	0.00100000005
24728	2339	6364	0.00100000005
24729	2339	7928	0.00100000005
24730	2339	3262	0.00100000005
24731	2339	2514	0.00100000005
24732	2339	5767	0.00100000005
24733	2339	8069	0.00100000005
24734	2339	5616	0.00100000005
24735	2339	7940	0.00100000005
24736	2339	8070	0.00100000005
24737	2339	8071	0.00100000005
24738	2339	8072	0.00100000005
24739	2339	8004	0.00100000005
24740	2339	7929	0.00100000005
24741	2339	8073	0.00100000005
24742	2339	8074	0.00100000005
24743	2339	6679	0.00100000005
24744	2339	5731	0.00100000005
24745	2339	7745	0.00100000005
24746	2339	8071	0.00100000005
24747	2339	3126	0.00999999978
24748	2340	445	0.00999999978
24749	2340	185	0.00999999978
24750	2340	8075	0.00999999978
24751	2340	82	0.00999999978
24752	2340	74	0.00999999978
24753	2340	1844	0.00999999978
24754	2340	489	0.00999999978
24755	2340	7956	0.00999999978
24756	2340	291	0.00999999978
24757	2340	7735	0.00100000005
24758	2340	8076	0.00100000005
24759	2340	8077	0.00100000005
24760	2340	7970	0.00100000005
24761	2340	293	0.00100000005
24762	2341	445	0.00999999978
24763	2341	185	0.00999999978
24764	2341	8075	0.00999999978
24765	2341	82	0.00999999978
24766	2341	74	0.00999999978
24767	2341	1844	0.00999999978
24768	2341	489	0.00999999978
24769	2341	7956	0.00999999978
24770	2341	291	0.00999999978
24771	2341	7735	0.00100000005
24772	2341	8076	0.00100000005
24773	2341	8077	0.00100000005
24774	2341	7970	0.00100000005
24775	2341	293	0.00100000005
24776	2342	441	0.0500000007
24777	2342	14	0.0199999996
24778	2342	896	0.0399999991
24779	2342	74	0.100000001
24780	2342	5305	0.0399999991
24781	2342	33	0.159999996
24782	2342	36	0.0199999996
24783	2342	1512	0.0700000003
24784	2342	681	0.0599999987
24785	2342	292	0.239999995
24786	2342	1844	0.109999999
24787	2342	2493	0.0700000003
24788	2342	7898	0.109999999
24789	2342	2117	0.0299999993
24790	2342	8078	0.0399999991
24791	2342	2545	0.0500000007
24792	2342	291	0.0599999987
24793	2342	801	0.00100000005
24794	2342	7899	0.00100000005
24795	2342	7900	0.00100000005
24796	2343	8	0.0299999993
24797	2343	33	0.00100000005
24798	2343	7056	0.00100000005
24799	2343	7857	0.00100000005
24800	2343	8079	0.00100000005
24801	2344	292	0.0900000036
24802	2344	74	0.0299999993
24803	2344	83	0.100000001
24804	2344	431	0.100000001
24805	2344	659	0.100000001
24806	2344	1844	0.0299999993
24807	2344	425	0.0199999996
24808	2344	681	0.0299999993
24809	2344	33	0.0500000007
24810	2344	3262	0.0299999993
24811	2344	7692	0.100000001
24812	2344	4017	0.0199999996
24813	2344	7900	0.0199999996
24814	2344	8080	0.0199999996
24815	2345	277	0.00999999978
24816	2345	8	0.100000001
24817	2345	21	0.0599999987
24818	2345	681	0.150000006
24819	2345	292	0.00999999978
24820	2345	79	0.00999999978
24821	2345	8081	0.0900000036
24822	2345	7830	0.00999999978
24823	2345	7841	0.00999999978
24824	2345	549	0.0399999991
24825	2345	7977	0.00100000005
24826	2345	7884	0.00100000005
24827	2345	5082	0.0199999996
24828	2345	7745	0.00100000005
24829	2346	2539	0.00999999978
24830	2346	2854	0.00999999978
24831	2346	703	0.00999999978
24832	2346	33	0.00999999978
24833	2346	1512	0.00999999978
24834	2346	250	0.00999999978
24835	2346	8082	0.00999999978
24836	2346	1127	0.00999999978
24837	2346	7722	0.00999999978
24838	2346	2018	0.00999999978
24839	2346	2556	0.00999999978
24840	2346	7867	0.00100000005
24841	2346	8083	0.00100000005
24842	2346	8084	0.00100000005
24843	2346	7758	0.00100000005
24844	2346	844	0.00100000005
24845	2346	162	0.00100000005
24846	2346	7970	0.00100000005
24847	2346	3414	0.00100000005
24848	2346	8085	0.00100000005
24849	2346	293	0.00100000005
24850	2346	857	0.00100000005
24851	2346	8086	0.00100000005
24852	2346	8087	0.00100000005
24853	2347	425	0.119999997
24854	2347	449	0.389999986
24855	2347	7691	0.360000014
24856	2347	74	0.300000012
24857	2347	36	0.200000003
24858	2347	7692	0.100000001
24859	2347	8088	0.0299999993
24860	2347	291	0.0799999982
24861	2348	1177	0.0399999991
24862	2348	681	0.0700000003
24863	2348	7062	0.159999996
24864	2348	8089	0.0299999993
24865	2348	801	0.00999999978
24866	2348	1666	0.00100000005
24867	2348	1131	0.00100000005
24868	2349	277	0.119999997
24869	2349	8	0.0700000003
24870	2349	549	0.0700000003
24871	2349	546	0.140000001
24872	2349	74	0.150000006
24873	2349	83	0.140000001
24874	2349	1177	0.00999999978
24875	2349	681	0.0299999993
24876	2349	79	0.100000001
24877	2349	291	0.00999999978
24878	2349	7109	0.00100000005
24879	2349	4195	0.00100000005
24880	2349	7884	0.00100000005
24881	2349	7745	0.00100000005
24882	2350	8090	0.00999999978
24883	2350	5073	0.0199999996
24884	2350	681	0.0599999987
24885	2350	405	0.0599999987
24886	2350	7917	0.00100000005
24887	2350	6498	0.00100000005
24888	2350	7745	0.00100000005
24889	2351	79	0.0299999993
24890	2351	122	0.0199999996
24891	2351	8	0.00100000005
24892	2351	549	0.00999999978
24893	2351	2591	0.00100000005
24894	2351	472	0.00100000005
24895	2352	14	0.0199999996
24896	2352	896	0.0299999993
24897	2352	419	0.0500000007
24898	2352	2860	0.00100000005
24899	2352	7704	0.0199999996
24900	2352	3976	0.00100000005
24901	2352	8091	0.00100000005
24902	2352	5091	0.00100000005
24903	2352	4195	0.00100000005
24904	2352	7825	0.00100000005
24905	2353	7901	0.200000003
24906	2353	36	0.0299999993
24907	2353	681	0.0500000007
24908	2353	292	0.170000002
24909	2353	3126	0.00999999978
24910	2353	7849	0.0700000003
24911	2353	7745	0.00100000005
24912	2355	37	0.129999995
24913	2355	425	0.109999999
24914	2355	79	0.140000001
24915	2355	434	0.0299999993
24916	2355	681	0.0900000036
24917	2355	1844	0.0799999982
24918	2355	6688	0.0799999982
24919	2355	8036	0.0399999991
24920	2355	7692	0.0399999991
24921	2355	419	0.0700000003
24922	2355	107	0.0299999993
24923	2355	1864	0.0700000003
24924	2356	1512	0.00999999978
24925	2356	7897	0.00999999978
24926	2356	2493	0.00999999978
24927	2356	7794	0.00100000005
24928	2356	857	0.00100000005
24929	2357	7697	0.0500000007
24930	2357	703	0.200000003
24931	2357	14	0.100000001
24932	2357	681	0.0500000007
24933	2357	292	0.119999997
24934	2357	7956	0.100000001
24935	2357	32	0.600000024
24936	2357	7922	0.00999999978
24937	2357	8092	0.0700000003
24938	2357	2545	0.0599999987
24939	2357	291	0.0299999993
24940	2357	8076	0.00100000005
24941	2357	7981	0.00100000005
24942	2358	546	0.00999999978
24943	2358	293	0.00999999978
24944	2358	425	0.0399999991
24945	2358	33	0.0299999993
24946	2358	74	0.0500000007
24947	2358	36	0.0299999993
24948	2358	83	0.0700000003
24949	2358	292	0.0900000036
24950	2358	2250	0.00999999978
24951	2359	8093	0.00999999978
24952	2359	33	0.00999999978
24953	2359	36	0.00999999978
24954	2359	681	0.00999999978
24955	2359	292	0.00999999978
24956	2359	2493	0.00999999978
24957	2359	7956	0.00999999978
24958	2359	1303	0.00100000005
24959	2359	659	0.00100000005
24960	2359	77	0.00100000005
24961	2359	7836	0.00100000005
24962	2360	1994	0.0900000036
24963	2360	74	0.100000001
24964	2360	834	0.119999997
24965	2360	5305	0.0700000003
24966	2360	2272	0.100000001
24967	2360	33	0.0700000003
24968	2360	36	0.200000003
24969	2360	1177	0.0900000036
24970	2360	292	0.0599999987
24971	2360	1415	0.00100000005
24972	2361	8	0.00999999978
24973	2361	441	0.00999999978
24974	2361	896	0.00999999978
24975	2361	33	0.00999999978
24976	2361	36	0.00999999978
24977	2361	1177	0.00999999978
24978	2361	681	0.00999999978
24979	2361	7702	0.00999999978
24980	2361	7897	0.00999999978
24981	2361	7834	0.00100000005
24982	2361	7734	0.00100000005
24983	2361	546	0.00100000005
24984	2361	8094	0.00100000005
24985	2361	7950	0.00100000005
24986	2361	4193	0.00100000005
24987	2361	7866	0.00100000005
24988	2363	681	0.00999999978
24989	2363	292	0.00999999978
24990	2363	7702	0.00999999978
24991	2363	2493	0.00999999978
24992	2363	659	0.00100000005
24993	2363	7794	0.00100000005
24994	2363	293	0.00100000005
24995	2366	12	0.0500000007
24996	2366	441	0.0500000007
24997	2366	82	0.0599999987
24998	2366	14	0.0199999996
24999	2366	1228	0.25
25000	2366	7955	0.0199999996
25001	2366	33	0.129999995
25002	2366	36	0.0199999996
25003	2366	1512	0.140000001
25004	2366	681	0.0700000003
25005	2366	292	0.219999999
25006	2366	1844	0.119999997
25007	2366	489	0.0799999982
25008	2366	801	0.0199999996
25009	2366	522	0.0599999987
25010	2366	7735	0.00100000005
25011	2366	6796	0.00100000005
25012	2366	8095	0.00100000005
25013	2366	8096	0.00100000005
25014	2366	8097	0.00100000005
25015	2366	7940	0.00100000005
25016	2366	8098	0.00100000005
25017	2366	8003	0.00100000005
25018	2366	7853	0.00100000005
25019	2366	293	0.00100000005
25020	2366	857	0.0199999996
25021	2366	8099	0.00200000009
25022	2366	8025	0.00100000005
25023	2366	7895	0.00100000005
25024	2366	2062	0.00100000005
25025	2367	434	0.00999999978
25026	2367	8100	0.00999999978
25027	2367	2555	0.00999999978
25028	2367	8101	0.00999999978
25029	2367	7850	0.00999999978
25030	2367	8096	0.00999999978
25031	2367	2560	0.00999999978
25032	2367	8102	0.00999999978
25033	2367	1997	0.00999999978
25034	2367	2428	0.00999999978
25035	2367	2021	0.00999999978
25036	2367	2817	0.00999999978
25037	2367	801	0.00999999978
25038	2367	2541	0.00999999978
25039	2367	7728	0.00100000005
25040	2367	7953	0.00100000005
25041	2367	161	0.00100000005
25042	2367	8103	0.00100000005
25043	2367	2538	0.00100000005
25044	2367	7894	0.00100000005
25045	2367	293	0.00100000005
25046	2367	6110	0.00100000005
25047	2367	8039	0.00100000005
25048	2368	8101	0.00999999978
25049	2368	33	0.0399999991
25050	2368	36	0.0199999996
25051	2368	1177	0.100000001
25052	2368	292	0.0399999991
25053	2368	2493	0.0399999991
25054	2368	291	0.0399999991
25055	2368	8104	0.00100000005
25056	2368	7737	0.00100000005
25057	2371	7867	0.0299999993
25058	2371	2232	0.00999999978
25059	2371	314	0.00999999978
25060	2371	8	0.00999999978
25061	2371	71	0.0500000007
25062	2371	896	0.00999999978
25063	2371	74	0.0500000007
25064	2371	5305	0.00999999978
25065	2371	33	0.00999999978
25066	2371	681	0.100000001
25067	2371	291	0.100000001
25068	2371	292	0.00999999978
25069	2371	801	0.0500000007
25070	2371	40	0.0299999993
25071	2371	304	0.00999999978
25072	2371	7097	0.00999999978
25073	2372	14	0.0500000007
25074	2372	8105	0.0399999991
25075	2372	74	0.0299999993
25076	2372	33	0.0700000003
25077	2372	8106	0.00999999978
25078	2372	681	0.0299999993
25079	2372	292	0.0500000007
25080	2372	8107	0.100000001
25081	2372	330	0.119999997
25082	2372	8108	0.0900000036
25083	2372	3357	0.119999997
25084	2372	7830	0.00100000005
25085	2372	7841	0.00100000005
25086	2372	659	0.00100000005
25087	2372	2264	0.00100000005
25088	2372	1364	0.00100000005
25089	2372	4017	0.00100000005
25090	2372	293	0.00100000005
25091	2372	8109	0.00100000005
25092	2372	7723	0.00100000005
25093	2372	617	0.00100000005
25094	2376	427	0.300000012
25095	2376	36	0.0500000007
25096	2376	33	0.300000012
25097	2376	5429	0.0399999991
25098	2376	7298	0.0599999987
25099	2376	7815	0.0199999996
25100	2376	7109	0.0399999991
25101	2376	419	0.00999999978
25102	2376	597	0.00999999978
25103	2376	8110	0.0199999996
25104	2376	3985	0.0199999996
25105	2376	8111	0.0399999991
25106	2376	681	0.0900000036
25107	2376	291	0.0900000036
25108	2376	1644	0.0900000036
25109	2376	971	0.00999999978
25110	2376	292	0.200000003
25111	2376	8112	0.00999999978
25112	2376	681	0.0900000036
25113	2376	292	0.230000004
25114	2376	291	0.0900000036
25115	2376	7758	0.00100000005
25116	2376	7830	0.00100000005
25117	2376	7871	0.00100000005
25118	2376	7817	0.00100000005
25119	2376	1191	0.00100000005
25120	2376	2073	0.00100000005
25121	2376	7840	0.00100000005
25122	2376	7970	0.00100000005
25123	2377	8113	0.0599999987
25124	2377	8114	0.0599999987
25125	2378	6912	0.170000002
25126	2378	8115	0.0599999987
25127	2378	703	0.0700000003
25128	2378	896	0.129999995
25129	2378	8116	0.0199999996
25130	2378	1177	0.0799999982
25131	2378	681	0.0700000003
25132	2378	2493	0.540000021
25133	2378	8117	0.0299999993
25134	2378	7741	0.00100000005
25135	2378	2591	0.00100000005
25136	2378	8118	0.00100000005
25137	2378	8119	0.00100000005
25138	2378	8120	0.00100000005
25139	2378	801	0.00100000005
25140	2378	7899	0.00100000005
25141	2378	8104	0.00100000005
25142	2378	7900	0.00100000005
25143	2379	122	0.0199999996
25144	2379	14	0.0299999993
25145	2379	896	0.0199999996
25146	2379	74	0.0399999991
25147	2379	834	0.0299999993
25148	2379	5305	0.0599999987
25149	2379	33	0.0500000007
25150	2379	36	0.00999999978
25151	2379	681	0.0199999996
25152	2379	292	0.0500000007
25153	2379	405	0.0799999982
25154	2379	405	0.0799999982
25155	2379	37	0.00999999978
25156	2379	437	0.0199999996
25157	2379	7728	0.00999999978
25158	2379	434	0.00999999978
25159	2379	7735	0.00999999978
25160	2379	5616	0.00100000005
25161	2379	7758	0.00100000005
25162	2379	7830	0.00100000005
25163	2379	7841	0.00100000005
25164	2379	7878	0.00999999978
25165	2379	7879	0.00100000005
25166	2379	7880	0.00999999978
25167	2379	8046	0.00999999978
25168	2379	83	0.0199999996
25169	2379	8121	0.00100000005
25170	2379	8122	0.00999999978
25171	2379	1191	0.00999999978
25172	2379	77	0.00999999978
25173	2379	3976	0.00100000005
25174	2379	7853	0.00100000005
25175	2379	7869	0.00100000005
25176	2379	45	0.00100000005
25177	2379	3697	0.00999999978
25178	2379	7097	0.00999999978
25179	2379	40	0.00999999978
25180	2379	7745	0.00999999978
25181	2381	292	0.180000007
25182	2381	8123	0.00100000005
25183	2381	7830	0.00999999978
25184	2381	7841	0.00100000005
25185	2381	8099	0.00100000005
25186	2381	8124	0.00100000005
25187	2381	7899	0.00100000005
25188	2381	329	0.00100000005
25189	2382	71	0.5
25190	2382	896	0.100000001
25191	2382	33	0.0799999982
25192	2382	36	0.100000001
25193	2382	681	0.0599999987
25194	2382	292	0.0500000007
25195	2382	7702	0.00999999978
25196	2382	2493	0.0299999993
25197	2382	4112	0.00999999978
25198	2382	1080	0.0500000007
25199	2382	7056	0.00100000005
25200	2382	8125	0.00100000005
25201	2382	2691	0.00100000005
25202	2382	46	0.00100000005
25203	2382	21	0.00100000005
25204	2382	2489	0.00100000005
25205	2382	162	0.00999999978
25206	2382	7894	0.00100000005
25207	2382	293	0.00100000005
25208	2382	40	0.0500000007
25209	2382	4193	0.00999999978
25210	2382	8126	0.00100000005
25211	2383	292	0.0399999991
25212	2383	1844	0.0199999996
25213	2383	681	0.0299999993
25214	2383	546	0.0199999996
25215	2383	550	0.0199999996
25216	2383	33	0.0299999993
25217	2383	74	0.0500000007
25218	2383	2010	0.0199999996
25219	2384	8127	0.0149999997
25220	2384	8023	0.0149999997
25221	2384	8128	0.0149999997
25222	2384	8129	0.00100000005
25223	2384	7893	0.00100000005
25224	2385	122	0.0599999987
25225	2385	71	0.0599999987
25226	2385	425	0.0599999987
25227	2385	14	0.119999997
25228	2385	896	0.0599999987
25229	2385	74	0.140000001
25230	2385	834	0.0599999987
25231	2385	5305	0.129999995
25232	2385	33	0.0599999987
25233	2385	8130	0.0599999987
25234	2385	7944	0.100000001
25235	2385	681	0.0599999987
25236	2385	7956	0.0199999996
25237	2385	292	0.0599999987
25238	2385	1844	0.0199999996
25239	2385	2493	0.0199999996
25240	2385	191	0.0599999987
25241	2385	434	0.00100000005
25242	2385	7735	0.00100000005
25243	2385	8044	0.00100000005
25244	2385	7758	0.00100000005
25245	2385	4350	0.00100000005
25246	2385	7830	0.00100000005
25247	2385	7841	0.00100000005
25248	2385	7878	0.00100000005
25249	2385	7879	0.00100000005
25250	2385	7880	0.00100000005
25251	2385	431	0.00100000005
25252	2385	7882	0.00100000005
25253	2385	7047	0.00100000005
25254	2385	7109	0.00100000005
25255	2385	77	0.00100000005
25256	2385	3976	0.00100000005
25257	2385	7853	0.00100000005
25258	2385	7869	0.00100000005
25259	2385	7722	0.00100000005
25260	2385	8009	0.00100000005
25261	2385	45	0.00100000005
25262	2385	7097	0.00100000005
25263	2385	7745	0.00100000005
25264	2386	7724	0.0500000007
25265	2386	83	0.100000001
25266	2386	431	0.100000001
25267	2386	531	0.100000001
25268	2386	659	0.100000001
25269	2386	7741	0.100000001
25270	2386	5260	0.0500000007
25271	2386	74	0.0500000007
25272	2386	33	0.0500000007
25273	2386	36	0.0500000007
25274	2386	7772	0.0500000007
25275	2386	90	0.0500000007
25276	2386	422	0.0500000007
25277	2386	7869	0.0500000007
25278	2386	1030	0.00039999999
25279	2386	8131	0.0399999991
25280	2387	896	0.0399999991
25281	2387	74	0.0500000007
25282	2387	36	0.0199999996
25283	2387	547	0.0599999987
25284	2387	681	0.0599999987
25285	2387	292	0.0599999987
25286	2387	7853	0.00200000009
25287	2387	45	0.00100000005
25288	2388	122	0.0599999987
25289	2388	5514	0.0599999987
25290	2388	71	0.0599999987
25291	2388	425	0.0599999987
25292	2388	14	0.0599999987
25293	2388	896	0.0599999987
25294	2388	3922	0.0599999987
25295	2388	33	0.0599999987
25296	2388	681	0.0599999987
25297	2388	292	0.0599999987
25298	2388	2493	0.0599999987
25299	2388	7723	0.0599999987
25300	2388	191	0.0599999987
25301	2388	40	0.0599999987
25302	2388	7728	0.00100000005
25303	2388	5883	0.00100000005
25304	2388	7758	0.00100000005
25305	2388	8132	0.00100000005
25306	2388	7760	0.00100000005
25307	2388	7761	0.00100000005
25308	2388	7846	0.00100000005
25309	2388	7945	0.00100000005
25310	2388	8045	0.00100000005
25311	2388	391	0.00100000005
25312	2388	3565	0.00100000005
25313	2388	3262	0.00100000005
25314	2388	7741	0.00100000005
25315	2388	7835	0.00100000005
25316	2388	8133	0.00100000005
25317	2388	1303	0.00100000005
25318	2388	431	0.00100000005
25319	2388	5616	0.00100000005
25320	2388	7047	0.00100000005
25321	2388	1191	0.00100000005
25322	2388	7944	0.00100000005
25323	2388	77	0.00100000005
25324	2388	3976	0.00100000005
25325	2388	2264	0.00100000005
25326	2388	293	0.00100000005
25327	2388	472	0.00100000005
25328	2388	4659	0.00100000005
25329	2388	2079	0.00100000005
25330	2388	8009	0.00100000005
25331	2388	45	0.00100000005
25332	2388	7097	0.00100000005
25333	2388	442	0.00100000005
25334	2388	7745	0.00100000005
25335	2389	14	0.0199999996
25336	2389	7710	0.0399999991
25337	2389	5305	0.0199999996
25338	2389	33	0.0199999996
25339	2389	5073	0.00999999978
25340	2389	107	0.0399999991
25341	2389	107	0.0299999993
25342	2389	292	0.100000001
25343	2389	3332	0.0500000007
25344	2389	3501	0.119999997
25345	2389	397	0.0199999996
25346	2389	599	0.119999997
25347	2389	405	0.0599999987
25348	2389	7850	0.00100000005
25349	2389	8134	0.159999996
25350	2389	8135	0.00600000005
25351	2389	8076	0.00100000005
25352	2389	7097	0.00100000005
25353	2389	7745	0.00100000005
25354	2390	425	0.0299999993
25355	2390	33	0.0299999993
25356	2390	659	0.0599999987
25357	2390	2591	0.0500000007
25358	2394	425	0.0700000003
25359	2394	449	0.25
25360	2394	2591	0.129999995
25361	2394	7692	0.100000001
25362	2394	291	0.0500000007
25363	2394	33	0.0399999991
25364	2395	913	0.879999995
25365	2395	33	0.0599999987
25366	2395	36	0.0599999987
25367	2395	7047	0.00100000005
25368	2395	7109	0.00100000005
25369	2395	4195	0.00100000005
25370	2397	8	0.0399999991
25371	2397	445	0.0599999987
25372	2397	714	0.100000001
25373	2397	913	0.100000001
25374	2397	33	0.0900000036
25375	2397	681	0.0700000003
25376	2397	292	0.209999993
25377	2397	7956	0.00999999978
25378	2397	79	0.00999999978
25379	2397	40	0.00999999978
25380	2397	7735	0.00999999978
25381	2397	7969	0.00100000005
25382	2397	8097	0.00100000005
25383	2397	7880	0.00100000005
25384	2397	7835	0.00100000005
25385	2398	1225	0.0500000007
25386	2398	7745	0.00999999978
25387	2398	425	0.0399999991
25388	2398	2510	0.0500000007
25389	2398	1177	0.0299999993
25390	2398	1303	0.0500000007
25391	2398	7109	0.0399999991
25392	2398	5429	0.0199999996
25393	2398	74	0.0500000007
25394	2398	427	0.0199999996
25395	2398	7970	0.00100000005
25396	2399	8	0.0399999991
25397	2399	913	0.00999999978
25398	2399	681	0.0500000007
25399	2399	292	0.629999995
25400	2399	7702	0.0599999987
25401	2399	8079	0.00100000005
25402	2399	7894	0.00100000005
25403	2402	378	0.00999999978
25404	2402	14	0.0500000007
25405	2402	1694	0.00999999978
25406	2402	33	0.00999999978
25407	2402	292	0.0599999987
25408	2402	7997	0.00999999978
25409	2402	7989	0.0799999982
25410	2402	434	0.00100000005
25411	2402	7735	0.00100000005
25412	2402	7927	0.00100000005
25413	2402	7928	0.00100000005
25414	2402	7993	0.00100000005
25415	2402	8070	0.00100000005
25416	2402	7853	0.00100000005
25417	2402	7929	0.00100000005
25418	2402	7932	0.00100000005
25419	2402	5731	0.00100000005
25420	2402	7927	0.00100000005
25421	2402	7932	0.00100000005
25422	2403	681	0.300000012
25423	2403	292	0.0299999993
25424	2403	531	0.0199999996
25425	2403	7692	0.0199999996
25426	2403	1644	0.00999999978
25427	2403	425	0.00999999978
25428	2403	659	0.00999999978
25429	2403	473	0.00999999978
25430	2403	431	0.00999999978
25431	2404	896	0.00999999978
25432	2404	7857	0.00100000005
25433	2404	7045	0.00100000005
25434	2404	993	0.00100000005
25435	2404	7834	0.00100000005
25436	2404	3243	0.00100000005
25437	2404	8136	0.00100000005
25438	2404	7738	0.00100000005
25439	2404	7861	0.00100000005
25440	2404	8041	0.00100000005
25441	2404	77	0.00100000005
25442	2404	7769	0.00100000005
25443	2404	2489	0.00100000005
25444	2404	293	0.00100000005
25445	2404	801	0.00100000005
25446	2404	8025	0.00100000005
25447	2404	7895	0.00100000005
25448	2404	7899	0.00100000005
25449	2404	7745	0.00100000005
25450	2405	7697	0.00999999978
25451	2405	546	0.5
25452	2405	8036	0.00999999978
25453	2405	8137	0.00100000005
25454	2405	1567	0.00100000005
25455	2406	8138	0.0599999987
25456	2406	330	0.0599999987
25457	2406	3357	0.140000001
25458	2406	434	0.00100000005
25459	2406	4843	0.00100000005
25460	2406	7928	0.00100000005
25461	2406	2514	0.00100000005
25462	2406	7929	0.00100000005
25463	2406	7993	0.00100000005
25464	2406	8002	0.00999999978
25465	2406	8139	0.00100000005
25466	2406	7005	0.00100000005
25467	2406	292	0.109999999
25468	2406	8140	0.00100000005
25469	2407	8141	0.00999999978
25470	2407	7836	0.00999999978
25471	2407	7830	0.00100000005
25472	2408	292	0.0900000036
25473	2408	1844	0.0700000003
25474	2408	681	0.0500000007
25475	2408	291	0.0299999993
25476	2408	2493	0.0299999993
25477	2408	4156	0.0299999993
25478	2408	425	0.0199999996
25479	2408	74	0.0500000007
25480	2408	33	0.0500000007
25481	2408	1614	0.0299999993
25482	2408	599	0.0299999993
25483	2409	2691	0.0299999993
25484	2409	714	0.0399999991
25485	2409	449	0.200000003
25486	2409	161	0.100000001
25487	2409	6912	0.100000001
25488	2409	8142	0.400000006
25489	2409	8115	0.200000003
25490	2409	703	0.5
25491	2409	896	0.0599999987
25492	2409	1512	0.200000003
25493	2409	7695	0.150000006
25494	2409	1177	0.100000001
25495	2409	681	0.100000001
25496	2409	2493	0.200000003
25497	2409	2694	0.100000001
25498	2409	8143	0.0799999982
25499	2409	8144	0.0799999982
25500	2409	3243	0.00100000005
25501	2409	2792	0.00100000005
25502	2409	8145	0.00100000005
25503	2409	8146	0.00100000005
25504	2409	8147	0.00100000005
25505	2409	7993	0.00100000005
25506	2409	7853	0.00100000005
25507	2409	293	0.00999999978
25508	2409	8120	0.00100000005
25509	2409	7899	0.00100000005
25510	2409	5731	0.00100000005
25511	2411	8148	0.0399999991
25512	2411	8149	0.0500000007
25513	2411	292	0.0399999991
25514	2411	7964	0.0399999991
25515	2411	1244	0.0399999991
25516	2411	8150	0.0399999991
25517	2411	599	0.0399999991
25518	2411	397	0.0399999991
25519	2411	1384	0.0126999998
25520	2412	14	0.0500000007
25521	2412	74	0.0399999991
25522	2412	834	0.0299999993
25523	2412	33	0.0399999991
25524	2412	36	0.0299999993
25525	2412	292	0.0700000003
25526	2412	7758	0.00100000005
25527	2412	7830	0.00100000005
25528	2412	7841	0.00100000005
25529	2412	7893	0.00100000005
25530	2412	3262	0.00100000005
25531	2412	7741	0.00100000005
25532	2412	1303	0.00100000005
25533	2412	723	0.00100000005
25534	2412	7047	0.00100000005
25535	2412	3976	0.00100000005
25536	2412	7981	0.00100000005
25537	2412	8077	0.00100000005
25538	2412	4195	0.00100000005
25539	2412	7869	0.00100000005
25540	2413	8012	0.00999999978
25541	2413	14	0.00999999978
25542	2413	33	0.00999999978
25543	2413	292	0.00999999978
25544	2413	2494	0.00999999978
25545	2413	3332	0.00999999978
25546	2413	8151	0.00999999978
25547	2413	8152	0.00100000005
25548	2413	434	0.00100000005
25549	2413	7735	0.00100000005
25550	2413	8001	0.00100000005
25551	2413	5386	0.00100000005
25552	2413	7928	0.00100000005
25553	2413	8070	0.00100000005
25554	2413	8071	0.00100000005
25555	2413	8003	0.00100000005
25556	2413	8153	0.00100000005
25557	2413	5731	0.00100000005
25558	2414	14	0.0399999991
25559	2414	33	0.0700000003
25560	2414	36	0.100000001
25561	2414	7857	0.00100000005
25562	2414	7758	0.00100000005
25563	2414	2982	0.00100000005
25564	2414	7830	0.00100000005
25565	2414	7841	0.00100000005
25566	2414	7878	0.00100000005
25567	2414	3366	0.00100000005
25568	2414	1191	0.00100000005
25569	2414	293	0.00100000005
25570	2414	1131	0.00100000005
25571	2416	14	0.0599999987
25572	2416	5305	0.0500000007
25573	2416	33	0.100000001
25574	2416	36	0.100000001
25575	2416	8154	0.100000001
25576	2416	36	1
25577	2416	8154	0.100000001
25578	2416	844	0.100000001
25579	2416	681	0.100000001
25580	2416	292	0.100000001
25581	2416	8155	0.0599999987
25582	2416	2493	0.100000001
25583	2416	2694	0.100000001
25584	2416	7842	0.0700000003
25585	2416	972	0.100000001
25586	2416	1197	0.100000001
25587	2416	291	0.100000001
25588	2416	7758	0.00100000005
25589	2416	7830	0.00100000005
25590	2416	7841	0.00100000005
25591	2416	548	0.0299999993
25592	2416	7741	0.00100000005
25593	2416	659	0.00100000005
25594	2416	480	0.00100000005
25595	2416	8120	0.00100000005
25596	2416	7745	0.00100000005
25597	2416	7899	0.00100000005
25598	2417	8156	0.00999999978
25599	2417	8157	0.00999999978
25600	2417	71	0.00999999978
25601	2417	896	0.0299999993
25602	2417	74	0.0299999993
25603	2417	1512	0.0670000017
25604	2417	6201	0.0500000007
25605	2417	7018	0.0500000007
25606	2417	7745	0.00100000005
25607	2418	71	0.0299999993
25608	2418	8075	0.0299999993
25609	2418	14	0.0399999991
25610	2418	896	0.0299999993
25611	2418	33	0.0299999993
25612	2418	36	0.0299999993
25613	2418	1512	0.0299999993
25614	2418	1177	0.0299999993
25615	2418	681	0.0299999993
25616	2418	292	0.0299999993
25617	2418	2493	0.0299999993
25618	2418	277	0.00100000005
25619	2418	314	0.00100000005
25620	2418	8	0.00100000005
25621	2418	46	0.00100000005
25622	2418	8158	0.00100000005
25623	2418	21	0.00100000005
25624	2418	3329	0.00100000005
25625	2418	245	0.00100000005
25626	2418	4193	0.00100000005
25627	2418	8159	0.00100000005
25628	2419	896	0.0399999991
25629	2419	33	0.200000003
25630	2419	36	0.0900000036
25631	2419	681	0.100000001
25632	2419	292	0.100000001
25633	2419	7702	0.00999999978
25634	2419	7897	0.00999999978
25635	2419	2493	0.0399999991
25636	2419	8160	0.00100000005
25637	2419	8	0.00100000005
25638	2419	46	0.00100000005
25639	2419	7762	0.00100000005
25640	2419	7830	0.00100000005
25641	2419	7841	0.00100000005
25642	2419	7741	0.00100000005
25643	2419	2591	0.00100000005
25644	2419	7047	0.00100000005
25645	2419	7109	0.00100000005
25646	2419	3976	0.00100000005
25647	2419	2250	0.00100000005
25648	2419	7950	0.00100000005
25649	2419	4193	0.00100000005
25650	2424	445	0.0199999996
25651	2424	8088	0.0299999993
25652	2424	441	0.100000001
25653	2424	896	0.100000001
25654	2424	74	0.100000001
25655	2424	7955	0.0700000003
25656	2424	33	0.200000003
25657	2424	1512	0.150000006
25658	2424	1177	0.150000006
25659	2424	681	0.119999997
25660	2424	292	0.200000003
25661	2424	1844	0.200000003
25662	2424	2493	0.200000003
25663	2424	2694	0.0700000003
25664	2424	857	0.0399999991
25665	2424	8015	0.200000003
25666	2424	2117	0.0599999987
25667	2424	8161	0.0700000003
25668	2424	3133	0.0700000003
25669	2424	8162	0.0399999991
25670	2424	7830	0.00100000005
25671	2424	7841	0.00100000005
25672	2424	3977	0.00100000005
25673	2424	293	0.00100000005
25674	2424	801	0.00100000005
25675	2424	7899	0.00100000005
25676	2424	8163	0.00100000005
25677	2424	7900	0.00100000005
25678	2426	7724	0.0500000007
25679	2426	7771	0.00999999978
25680	2426	83	0.100000001
25681	2426	431	0.100000001
25682	2426	531	0.100000001
25683	2426	659	0.100000001
25684	2426	7741	0.100000001
25685	2426	5260	0.0500000007
25686	2426	74	0.0500000007
25687	2426	33	0.0500000007
25688	2426	36	0.0500000007
25689	2426	7772	0.0500000007
25690	2426	90	0.0500000007
25691	2426	422	0.0500000007
25692	2426	7692	0.0500000007
25693	2426	1030	0.00039999999
25694	2426	463	0.0500000007
25695	2430	292	0.00999999978
25696	2430	1303	0.00100000005
25697	2430	7109	0.00100000005
25698	2430	7794	0.00100000005
25699	2430	7722	0.00100000005
25700	2431	2493	0.0199999996
25701	2431	21	0.00100000005
25702	2431	4350	0.00100000005
25703	2431	6259	0.00100000005
25704	2431	8164	0.00100000005
25705	2431	2490	0.00100000005
25706	2431	8165	0.00100000005
25707	2437	8166	0.0500000007
25708	2437	896	0.00999999978
25709	2437	8167	0.00999999978
25710	2437	33	0.00999999978
25711	2437	36	0.00999999978
25712	2437	844	0.00999999978
25713	2437	1197	0.00999999978
25714	2437	1511	0.00999999978
25715	2437	547	0.00999999978
25716	2437	7956	0.00999999978
25717	2437	8168	0.00100000005
25718	2437	4350	0.00100000005
25719	2437	8169	0.00100000005
25720	2437	1524	0.00100000005
25721	2437	7760	0.00100000005
25722	2437	7761	0.00100000005
25723	2437	7741	0.00100000005
25724	2437	7835	0.00100000005
25725	2437	8133	0.00100000005
25726	2437	659	0.00100000005
25727	2437	7915	0.00100000005
25728	2437	480	0.00100000005
25729	2437	431	0.00100000005
25730	2437	7109	0.00100000005
25731	2437	8164	0.00100000005
25732	2437	8170	0.00100000005
25733	2437	1030	0.00100000005
25734	2437	8171	0.00100000005
25735	2437	5091	0.00100000005
25736	2437	7899	0.00100000005
25737	2437	7722	0.00100000005
25738	2437	8172	0.00100000005
25739	2438	122	0.0799999982
25740	2438	703	0.00999999978
25741	2438	83	0.00999999978
25742	2438	7981	0.0500000007
25743	2438	107	0.0500000007
25744	2438	292	0.0900000036
25745	2438	599	0.0500000007
25746	2438	255	0.0599999987
25747	2438	405	0.129999995
25748	2438	463	0.00100000005
25749	2438	8173	0.00300000003
25750	2438	3976	0.00100000005
25751	2438	8174	0.00100000005
25752	2438	8175	0.00400000019
25753	2438	555	0.00100000005
25754	2439	7724	0.0500000007
25755	2439	7771	0.00999999978
25756	2439	83	0.100000001
25757	2439	431	0.100000001
25758	2439	531	0.100000001
25759	2439	659	0.100000001
25760	2439	7741	0.100000001
25761	2439	5260	0.0500000007
25762	2439	74	0.0500000007
25763	2439	33	0.0500000007
25764	2439	36	0.0500000007
25765	2439	7772	0.0500000007
25766	2439	90	0.0500000007
25767	2439	422	0.0500000007
25768	2439	7692	0.0500000007
25769	2439	1030	0.00039999999
25770	2439	463	0.0500000007
25771	2439	1567	0.0500000007
25772	2439	7869	0.00999999978
25773	2442	74	0.00999999978
25774	2442	834	0.00999999978
25775	2442	33	0.00999999978
25776	2442	7920	0.00999999978
25777	2442	8176	0.00999999978
25778	2446	74	0.00999999978
25779	2446	834	0.00999999978
25780	2446	33	0.00999999978
25781	2446	36	0.00999999978
25782	2446	7056	0.00100000005
25783	2446	8058	0.00100000005
25784	2446	549	0.00100000005
25785	2446	14	0.00100000005
25786	2446	8045	0.00100000005
25787	2447	425	0.0399999991
25788	2447	74	0.0599999987
25789	2447	33	0.0599999987
25790	2447	36	0.0599999987
25791	2447	107	0.100000001
25792	2447	292	0.0500000007
25793	2447	79	0.0399999991
25794	2447	535	0.0500000007
25795	2447	405	0.100000001
25796	2447	3262	0.00100000005
25797	2447	7704	0.00999999978
25798	2447	8177	0.00100000005
25799	2447	4195	0.00100000005
25800	2447	7825	0.00100000005
25801	2449	7926	0.00999999978
25802	2449	434	0.00999999978
25803	2449	2539	0.00999999978
25804	2449	5514	0.00999999978
25805	2449	8178	0.00999999978
25806	2449	8096	0.00999999978
25807	2449	161	0.00999999978
25808	2449	8179	0.00999999978
25809	2449	8180	0.00999999978
25810	2449	2021	0.00999999978
25811	2449	2538	0.00999999978
25812	2449	292	0.00999999978
25813	2449	6025	0.00999999978
25814	2449	6110	0.00999999978
25815	2449	8022	0.00999999978
25816	2449	2541	0.00999999978
25817	2449	7895	0.00999999978
25818	2449	8181	0.00999999978
25819	2449	463	0.00100000005
25820	2449	8182	0.00100000005
25821	2449	13	0.00100000005
25822	2449	2792	0.00100000005
25823	2449	8183	0.00100000005
25824	2449	8134	0.00100000005
25825	2449	7945	0.00100000005
25826	2449	3262	0.00100000005
25827	2449	7823	0.00100000005
25828	2449	7970	0.00100000005
25829	2449	293	0.00100000005
25830	2449	8039	0.00100000005
25831	2450	434	0.00999999978
25832	2450	7926	0.00999999978
25833	2450	4843	0.00999999978
25834	2450	6912	0.00999999978
25835	2450	703	0.00999999978
25836	2450	2538	0.00999999978
25837	2450	8184	0.00999999978
25838	2450	7056	0.00100000005
25839	2450	463	0.00100000005
25840	2450	8185	0.00100000005
25841	2450	46	0.00100000005
25842	2450	21	0.00100000005
25843	2450	2555	0.00100000005
25844	2450	7850	0.00100000005
25845	2450	8096	0.00100000005
25846	2450	4209	0.00100000005
25847	2450	1567	0.00100000005
25848	2450	8134	0.00100000005
25849	2450	7945	0.00100000005
25850	2450	3262	0.00100000005
25851	2450	8186	0.00100000005
25852	2450	7745	0.00100000005
25853	2450	8187	0.00100000005
25854	2450	8177	0.00100000005
25855	2450	7981	0.00100000005
25856	2450	7825	0.00100000005
25857	2450	8188	0.00100000005
25858	2450	7970	0.00100000005
25859	2450	293	0.00100000005
25860	2450	8189	0.00100000005
25861	2450	6110	0.00100000005
25862	2450	8190	0.00100000005
25863	2450	7895	0.00100000005
25864	2450	442	0.00100000005
25865	2450	8039	0.00100000005
25866	2450	2428	0.00100000005
25867	2450	8182	0.00100000005
25868	2452	1849	0.00999999978
25869	2452	8037	0.00999999978
25870	2452	1018	0.00999999978
25871	2452	33	0.00999999978
25872	2452	36	0.00999999978
25873	2452	1512	0.00999999978
25874	2452	8191	0.00999999978
25875	2452	681	0.00999999978
25876	2452	8192	0.00999999978
25877	2452	293	0.00999999978
25878	2452	7897	0.00999999978
25879	2452	2493	0.00999999978
25880	2452	7834	0.00100000005
25881	2452	7697	0.00100000005
25882	2452	8193	0.00100000005
25883	2452	7741	0.00100000005
25884	2452	659	0.00100000005
25885	2452	431	0.00100000005
25886	2452	77	0.00100000005
25887	2452	7941	0.00100000005
25888	2452	2250	0.00100000005
25889	2452	4193	0.00100000005
25890	2454	14	0.150000006
25891	2454	896	0.0299999993
25892	2454	33	0.0700000003
25893	2454	8176	0.0500000007
25894	2454	8029	0.100000001
25895	2454	7961	0.150000006
25896	2454	107	0.119999997
25897	2454	681	0.150000006
25898	2454	292	0.0399999991
25899	2454	7783	0.150000006
25900	2454	2493	0.270000011
25901	2454	801	0.150000006
25902	2454	2494	0.0799999982
25903	2454	3072	0.129999995
25904	2454	7988	0.100000001
25905	2454	8194	0.300000012
25906	2454	7989	0.129999995
25907	2454	2120	0.170000002
25908	2454	330	0.100000001
25909	2454	291	0.0599999987
25910	2454	46	0.00100000005
25911	2454	7927	0.00100000005
25912	2454	8195	0.0199999996
25913	2454	4268	0.00100000005
25914	2454	5767	0.00100000005
25915	2454	7993	0.00100000005
25916	2454	7811	0.00100000005
25917	2454	8011	0.00100000005
25918	2454	7767	0.00100000005
25919	2454	7047	0.00100000005
25920	2454	1191	0.00100000005
25921	2454	77	0.00100000005
25922	2454	3976	0.00100000005
25923	2454	7853	0.00100000005
25924	2454	8196	0.00100000005
25925	2454	8197	0.00100000005
25926	2454	8198	0.00100000005
25927	2454	799	0.00100000005
25928	2454	7899	0.00100000005
25929	2454	7934	0.00100000005
25930	2454	5731	0.00100000005
25931	2454	7927	0.00100000005
25932	2454	7934	0.00100000005
25933	2457	74	0.00999999978
25934	2457	36	0.00999999978
25935	2457	681	0.0599999987
25936	2457	7783	0.00999999978
25937	2457	291	0.0599999987
25938	2457	7867	0.00100000005
25939	2457	4371	0.00100000005
25940	2457	7728	0.00100000005
25941	2457	7045	0.00100000005
25942	2457	314	0.00100000005
25943	2457	8	0.00100000005
25944	2457	1276	0.00100000005
25945	2457	8048	0.00100000005
25946	2457	4350	0.00100000005
25947	2457	7830	0.00100000005
25948	2457	7841	0.00100000005
25949	2457	546	0.00100000005
25950	2457	1030	0.00100000005
25951	2457	7853	0.00100000005
25952	2457	7097	0.00100000005
25953	2457	1732	0.00100000005
25954	2458	14	0.0299999993
25955	2458	74	0.0399999991
25956	2458	834	0.0399999991
25957	2458	292	0.0500000007
25958	2458	2271	0.00100000005
25959	2458	7893	0.00100000005
25960	2458	431	0.00100000005
25961	2458	7830	0.00100000005
25962	2458	7841	0.00100000005
25963	2458	8177	0.00100000005
25964	2458	7981	0.00100000005
25965	2458	2538	0.00100000005
25966	2458	4195	0.00100000005
25967	2458	7869	0.00100000005
25968	2459	419	0.0199999996
25969	2459	597	0.0199999996
25970	2459	431	0.00999999978
25971	2459	8199	0.00999999978
25972	2459	1191	0.00999999978
25973	2459	83	0.00999999978
25974	2459	7724	0.00999999978
25975	2460	2691	0.0700000003
25976	2460	12	0.0599999987
25977	2460	8200	0.119999997
25978	2460	8115	0.180000007
25979	2460	703	0.100000001
25980	2460	14	0.0399999991
25981	2460	896	0.0599999987
25982	2460	6912	0.0599999987
25983	2460	5305	0.0500000007
25984	2460	33	0.100000001
25985	2460	36	0.0700000003
25986	2460	1512	0.200000003
25987	2460	7704	0.0399999991
25988	2460	5073	0.0399999991
25989	2460	1177	0.100000001
25990	2460	681	0.119999997
25991	2460	8192	0.0700000003
25992	2460	292	0.200000003
25993	2460	1844	0.0900000036
25994	2460	499	0.0299999993
25995	2460	2493	0.300000012
25996	2460	2694	0.0599999987
25997	2460	3237	0.119999997
25998	2460	410	0.0399999991
25999	2460	599	0.0500000007
26000	2460	291	0.0700000003
26001	2460	229	0.0700000003
26002	2460	7834	0.00100000005
26003	2460	3243	0.00100000005
26004	2460	21	0.00300000003
26005	2460	2792	0.00100000005
26006	2460	3262	0.00100000005
26007	2460	7741	0.00100000005
26008	2460	659	0.00100000005
26009	2460	2591	0.00300000003
26010	2460	293	0.00100000005
26011	2460	7737	0.00100000005
26012	2460	7899	0.00100000005
26013	2460	2062	0.00100000005
26014	2460	7941	0.00100000005
26015	2461	277	0.0199999996
26016	2461	8	0.0299999993
26017	2461	33	0.0199999996
26018	2461	36	0.0199999996
26019	2461	681	0.0500000007
26020	2461	292	0.0399999991
26021	2461	79	0.0299999993
26022	2461	291	0.0199999996
26023	2461	7977	0.00100000005
26024	2461	7741	0.00100000005
26025	2461	7794	0.00100000005
26026	2461	8201	0.0500000007
26027	2461	7976	0.0599999987
26028	2461	7745	0.00100000005
26029	2464	8202	0.00999999978
26030	2464	1276	0.00100000005
26031	2464	7834	0.00100000005
26032	2464	7734	0.00100000005
26033	2464	8203	0.00100000005
26034	2464	7741	0.00100000005
26035	2464	418	0.00100000005
26036	2464	3471	0.00100000005
26037	2464	8204	0.00100000005
26038	2464	2591	0.00100000005
26039	2464	431	0.00100000005
26040	2464	7912	0.00100000005
26041	2464	7109	0.00100000005
26042	2464	7723	0.00100000005
26043	2464	7869	0.00100000005
26044	2464	45	0.00100000005
26045	2467	7692	0.100000001
26046	2467	1844	0.0399999991
26047	2467	292	0.0399999991
26048	2467	681	0.0199999996
26049	2467	161	0.100000001
26050	2467	7799	0.0399999991
26051	2467	7800	0.0399999991
26052	2467	431	0.0299999993
26053	2468	8	0.109999999
26054	2468	1177	0.00999999978
26055	2468	681	0.0299999993
26056	2468	292	0.0500000007
26057	2468	79	0.100000001
26058	2468	291	0.00999999978
26059	2468	7830	0.00100000005
26060	2468	7977	0.00100000005
26061	2468	3262	0.00100000005
26062	2468	7047	0.00100000005
26063	2468	7109	0.00100000005
26064	2468	7794	0.00999999978
26065	2468	7745	0.00100000005
26066	2469	14	0.00999999978
26067	2469	896	0.00999999978
26068	2469	74	0.00999999978
26069	2469	292	0.00999999978
26070	2469	7867	0.00100000005
26071	2469	7830	0.00100000005
26072	2469	7841	0.00100000005
26073	2469	3262	0.00100000005
26074	2469	7741	0.00100000005
26075	2469	7835	0.00100000005
26076	2469	480	0.00100000005
26077	2469	431	0.00100000005
26078	2469	8011	0.00100000005
26079	2469	1191	0.00100000005
26080	2469	3976	0.00100000005
26081	2469	8205	0.00100000005
26082	2471	425	0.109999999
26083	2471	8206	0.300000012
26084	2471	2591	0.25
26085	2471	659	0.170000002
26086	2471	292	0.0299999993
26087	2471	37	0.0199999996
26088	2471	33	0.0199999996
26089	2471	5429	0.0199999996
26090	2471	431	0.0500000007
26091	2471	107	0.0199999996
26092	2472	425	0.0500000007
26093	2472	427	0.0199999996
26094	2472	7692	0.140000001
26095	2472	844	0.00999999978
26096	2472	547	0.00999999978
26097	2472	681	0.00999999978
26098	2472	292	0.00999999978
26099	2472	8207	0.00999999978
26100	2472	531	0.0299999993
26101	2472	83	0.0299999993
26102	2472	431	0.0299999993
26103	2472	1191	0.0399999991
26104	2472	536	0.0299999993
26105	2472	8206	0.300000012
26106	2474	425	0.0299999993
26107	2474	449	0.0799999982
26108	2474	801	0.0900000036
26109	2474	1844	0.0299999993
26110	2474	7692	0.0599999987
26111	2474	7691	0.0199999996
26112	2474	2010	0.0299999993
26113	2474	45	0.0599999987
26114	2475	425	0.00999999978
26115	2475	14	0.100000001
26116	2475	896	0.0599999987
26117	2475	74	0.100000001
26118	2475	5305	0.0399999991
26119	2475	33	0.0399999991
26120	2475	5073	0.100000001
26121	2475	6201	0.109999999
26122	2475	567	0.0900000036
26123	2475	7857	0.0199999996
26124	2475	714	0.0799999982
26125	2475	7836	0.00100000005
26126	2475	419	0.0599999987
26127	2475	8208	0.0500000007
26128	2475	107	0.0399999991
26129	2475	862	0.00100000005
26130	2475	1054	0.00100000005
26131	2475	5694	0.0299999993
26132	2475	8209	0.0500000007
26133	2476	913	0.129999995
26134	2476	194	0.5
26135	2476	291	0.0500000007
26136	2476	681	0.159999996
26137	2476	425	0.180000007
26138	2476	7691	0.0599999987
26139	2476	449	0.0189999994
26140	2476	74	0.150000006
26141	2476	33	0.25999999
26142	2476	36	0.140000001
26143	2476	229	0.0599999987
26144	2476	7692	0.0500000007
26145	2476	107	0.189999998
26146	2476	4017	0.100000001
26147	2476	292	0.0599999987
26148	2476	547	0.0299999993
26149	2476	2591	0.0900000036
26150	2476	7724	0.0799999982
26151	2477	122	0.0700000003
26152	2477	703	0.00999999978
26153	2477	292	0.0500000007
26154	2477	437	0.0500000007
26155	2477	7728	0.0199999996
26156	2477	7735	0.0500000007
26157	2477	8011	0.00200000009
26158	2477	8174	0.00100000005
26159	2477	273	0.00100000005
26160	2477	555	0.00100000005
26161	2477	442	0.00100000005
26162	2479	896	0.0500000007
26163	2479	74	0.200000003
26164	2479	5305	0.100000001
26165	2479	33	0.200000003
26166	2479	36	0.200000003
26167	2479	681	0.119999997
26168	2479	292	0.25
26169	2479	1844	0.200000003
26170	2479	2493	0.100000001
26171	2479	2694	0.0799999982
26172	2479	8015	0.119999997
26173	2479	2545	0.0799999982
26174	2479	291	0.119999997
26175	2479	7830	0.00100000005
26176	2479	548	0.00100000005
26177	2479	7846	0.00100000005
26178	2479	4195	0.00100000005
26179	2479	293	0.00100000005
26180	2479	801	0.00100000005
26181	2479	8025	0.00100000005
26182	2479	7899	0.00100000005
26183	2479	7900	0.00100000005
26184	2481	14	0.0700000003
26185	2481	896	0.0599999987
26186	2481	33	0.0500000007
26187	2481	292	0.0500000007
26188	2481	405	0.0900000036
26189	2481	8011	0.00100000005
26190	2481	7704	0.00100000005
26191	2481	77	0.00100000005
26192	2481	3976	0.00100000005
26193	2481	8210	0.00100000005
26194	2481	4195	0.00100000005
26195	2481	7825	0.00100000005
26196	2482	33	0.0500000007
26197	2482	547	0.0199999996
26198	2482	681	0.0199999996
26199	2482	292	0.0199999996
26200	2482	7735	0.00100000005
26201	2482	7973	0.00100000005
26202	2482	8211	0.140000001
26203	2482	801	0.0199999996
26204	2482	2490	0.0299999993
26205	2482	7899	0.00100000005
26206	2482	7941	0.00100000005
26207	2484	896	0.0199999996
26208	2484	1512	0.0399999991
26209	2484	6201	0.0199999996
26210	2484	79	0.0599999987
26211	2484	599	0.0799999982
26212	2484	255	0.0500000007
26213	2484	405	0.400000006
26214	2484	3329	0.00100000005
26215	2484	7917	0.00100000005
26216	2484	1080	0.00100000005
26217	2484	8212	0.00100000005
26218	2485	717	0.00999999978
26219	2485	74	0.00999999978
26220	2485	33	0.00999999978
26221	2485	36	0.00999999978
26222	2485	2493	0.00999999978
26223	2485	7922	0.00999999978
26224	2485	2117	0.00999999978
26225	2485	7830	0.00100000005
26226	2485	7841	0.00100000005
26227	2485	7927	0.00100000005
26228	2485	8213	0.00100000005
26229	2485	549	0.00100000005
26230	2485	2020	0.00100000005
26231	2485	8214	0.00100000005
26232	2485	2633	0.00100000005
26233	2485	7741	0.00100000005
26234	2485	2073	0.00100000005
26235	2486	292	0.300000012
26236	2486	425	0.300000012
26237	2486	33	0.5
26238	2486	74	0.300000012
26239	2486	36	0.300000012
26240	2486	7692	0.200000003
26241	2486	2510	0.200000003
26242	2486	3262	0.200000003
26243	2487	8215	0.0700000003
26244	2487	8216	0.0700000003
26245	2487	12	0.100000001
26246	2487	82	0.0199999996
26247	2487	14	0.0700000003
26248	2487	896	0.0799999982
26249	2487	1228	0.159999996
26250	2487	33	0.25999999
26251	2487	36	0.0399999991
26252	2487	1512	0.200000003
26253	2487	292	0.100000001
26254	2487	1844	0.150000006
26255	2487	2493	0.0799999982
26256	2487	8217	0.0599999987
26257	2487	3332	0.0299999993
26258	2487	2117	0.0799999982
26259	2487	8218	0.0299999993
26260	2487	7735	0.00100000005
26261	2487	7834	0.00100000005
26262	2487	3243	0.00100000005
26263	2487	8219	0.00100000005
26264	2487	3976	0.00100000005
26265	2487	7853	0.00100000005
26266	2487	8211	0.00100000005
26267	2487	293	0.00100000005
26268	2487	8025	0.00100000005
26269	2487	7895	0.00100000005
26270	2487	7899	0.00100000005
26271	2487	2062	0.00100000005
26272	2487	7745	0.00100000005
26273	2488	7110	0.100000001
26274	2488	7722	0.100000001
26275	2488	7723	0.100000001
26276	2488	40	0.00999999978
26277	2488	531	0.00999999978
26278	2488	7724	0.00999999978
26279	2488	659	0.00999999978
26280	2488	431	0.00999999978
26281	2488	480	0.00999999978
26282	2492	794	0.180000007
26283	2492	33	0.00999999978
26284	2492	36	0.00999999978
26285	2492	681	0.00999999978
26286	2492	8220	0.0299999993
26287	2492	8221	0.0199999996
26288	2492	8222	0.00100000005
26289	2492	7942	0.00100000005
26290	2492	7735	0.00100000005
26291	2492	8223	0.00100000005
26292	2492	446	0.00100000005
26293	2492	1275	0.00100000005
26294	2492	8224	0.00100000005
26295	2492	8003	0.00100000005
26296	2492	7853	0.00100000005
26297	2492	293	0.00100000005
26298	2492	1765	0.00100000005
26299	2492	6493	0.00100000005
26300	2492	7900	0.00100000005
26301	2494	8218	0.0599999987
26302	2494	8225	0.200000003
26303	2494	330	0.200000003
26304	2494	8226	0.00100000005
26305	2494	7830	0.00100000005
26306	2494	7927	0.00100000005
26307	2494	5767	0.00700000022
26308	2494	8186	0.0170000009
26309	2494	2817	0.0700000003
26310	2494	8227	0.00100000005
26311	2494	8228	0.00100000005
26312	2494	5731	0.00100000005
26313	2494	7927	0.00100000005
26314	2494	8227	0.00100000005
26315	2495	2428	0.0900000036
26316	2495	5073	0.0799999982
26317	2495	1177	0.0799999982
26318	2495	681	0.150000006
26319	2495	292	0.200000003
26320	2495	1844	0.0199999996
26321	2495	2493	0.0299999993
26322	2495	8015	0.119999997
26323	2495	535	0.150000006
26324	2495	5939	0.00100000005
26325	2495	2062	0.00100000005
26326	2499	8	0.00999999978
26327	2499	2493	0.0900000036
26328	2499	857	0.0130000003
26329	2499	8229	0.00100000005
26330	2499	7745	0.00100000005
26331	2499	7866	0.00100000005
26332	2500	1844	0.180000007
26333	2500	292	0.0140000004
26334	2500	681	0.129999995
26335	2500	801	0.109999999
26336	2500	425	0.180000007
26337	2500	71	0.159999996
26338	2500	449	0.0189999994
26339	2500	14	0.219999999
26340	2500	74	0.0900000036
26341	2500	8230	0.280000001
26342	2500	291	0.899999976
26343	2500	7692	0.0500000007
26344	2500	2591	0.0199999996
26345	2500	45	0.0700000003
26346	2501	2691	0.0399999991
26347	2501	445	0.0199999996
26348	2501	714	0.0299999993
26349	2501	33	0.0199999996
26350	2501	1177	0.0900000036
26351	2501	681	0.150000006
26352	2501	292	0.100000001
26353	2501	2493	0.0399999991
26354	2501	410	0.100000001
26355	2501	21	0.00999999978
26356	2501	2062	0.00100000005
26357	2502	425	0.0399999991
26358	2502	74	0.0399999991
26359	2502	7901	0.0299999993
26360	2502	5305	0.0399999991
26361	2502	33	0.0199999996
26362	2502	36	0.0500000007
26363	2502	7704	0.0299999993
26364	2502	292	0.0700000003
26365	2502	79	0.0599999987
26366	2502	7018	0.100000001
26367	2502	405	0.0500000007
26368	2502	37	0.0700000003
26369	2502	8231	0.00100000005
26370	2502	8232	0.00100000005
26371	2502	7758	0.00100000005
26372	2502	7830	0.00100000005
26373	2502	7841	0.00100000005
26374	2502	8233	0.00100000005
26375	2502	3976	0.00100000005
26376	2502	2073	0.00100000005
26377	2502	511	0.00100000005
26378	2503	600	0.00999999978
26379	2503	8112	0.00999999978
26380	2503	8037	0.00100000005
26381	2503	1666	0.00100000005
26382	2503	2067	0.00100000005
26383	2503	8201	0.00100000005
26384	2503	6077	0.00100000005
26385	2503	7970	0.00100000005
26386	2503	8234	0.00100000005
26387	2505	33	0.25
26388	2505	36	0.180000007
26389	2505	14	0.0599999987
26390	2505	5429	0.0399999991
26391	2505	74	0.129999995
26392	2505	292	0.0599999987
26393	2505	681	0.0299999993
26394	2505	7692	0.0500000007
26395	2505	425	0.0299999993
26396	2505	3262	0.0299999993
26397	2505	1177	0.0299999993
26398	2508	8	0.200000003
26399	2508	1512	0.600000024
26400	2508	1177	0.5
26401	2508	681	0.300000012
26402	2508	2493	0.600000024
26403	2508	7109	0.00100000005
26404	2509	8235	0.00999999978
26405	2509	8236	0.00999999978
26406	2509	321	0.00999999978
26407	2509	6110	0.00100000005
26408	2509	8022	0.00100000005
26409	2509	6706	0.00100000005
26410	2510	7110	0.100000001
26411	2510	7722	0.100000001
26412	2510	7723	0.100000001
26413	2510	425	0.00999999978
26414	2510	531	0.00999999978
26415	2510	7724	0.00999999978
26416	2510	659	0.00999999978
26417	2510	431	0.00999999978
26418	2510	480	0.00999999978
26419	2510	7692	0.00999999978
26420	2511	14	0.0399999991
26421	2511	896	0.0599999987
26422	2511	1512	0.300000012
26423	2511	292	0.0599999987
26424	2511	7745	0.00100000005
26425	2512	913	0.0500000007
26426	2512	8237	0.400000006
26427	2512	7955	0.180000007
26428	2512	82	0.150000006
26429	2512	7924	0.0500000007
26430	2512	547	0.0599999987
26431	2512	681	0.150000006
26432	2512	4602	0.0500000007
26433	2512	8238	0.0599999987
26434	2512	7821	0.0799999982
26435	2512	194	0.200000003
26436	2512	8239	0.0599999987
26437	2512	2493	0.150000006
26438	2512	7956	0.100000001
26439	2512	8138	0.0799999982
26440	2512	291	0.100000001
26441	2512	37	0.0799999982
26442	2512	7758	0.00100000005
26443	2512	7830	0.00100000005
26444	2512	7841	0.00100000005
26445	2512	7958	0.25999999
26446	2512	3231	0.00100000005
26447	2512	8240	0.00100000005
26448	2512	2020	0.00100000005
26449	2512	3976	0.00100000005
26450	2512	1364	0.00100000005
26451	2512	6110	0.00100000005
26452	2512	6498	0.00100000005
26453	2512	5931	0.00100000005
26454	2512	7899	0.00100000005
26455	2512	5694	0.00999999978
26456	2514	913	0.100000001
26457	2514	71	0.0799999982
26458	2514	896	0.200000003
26459	2514	33	0.200000003
26460	2514	36	0.119999997
26461	2514	1512	0.0599999987
26462	2514	681	0.200000003
26463	2514	292	0.200000003
26464	2514	1844	0.0500000007
26465	2514	2493	0.119999997
26466	2514	993	0.00499999989
26467	2514	3262	0.00499999989
26468	2514	8241	0.00100000005
26469	2514	293	0.00100000005
26470	2514	40	0.0399999991
26471	2514	4193	0.00100000005
26472	2514	7900	0.00100000005
26473	2515	441	0.0199999996
26474	2515	71	0.0199999996
26475	2515	896	0.0299999993
26476	2515	74	0.0199999996
26477	2515	7955	0.0199999996
26478	2515	33	0.0199999996
26479	2515	1512	0.0199999996
26480	2515	681	0.0199999996
26481	2515	1844	0.0199999996
26482	2515	2493	0.0299999993
26483	2515	7762	0.00100000005
26484	2515	7830	0.00100000005
26485	2515	7841	0.00100000005
26486	2515	7109	0.00100000005
26487	2515	7794	0.00100000005
26488	2515	293	0.00100000005
26489	2515	7900	0.00100000005
26490	2517	896	0.0700000003
26491	2517	74	0.0599999987
26492	2517	33	0.209999993
26493	2517	36	0.0199999996
26494	2517	1512	0.200000003
26495	2517	5073	0.0500000007
26496	2517	547	0.0500000007
26497	2517	681	0.200000003
26498	2517	292	0.200000003
26499	2517	1844	0.0700000003
26500	2517	2493	0.300000012
26501	2517	857	0.100000001
26502	2517	7963	0.0399999991
26503	2517	7956	0.100000001
26504	2517	291	0.100000001
26505	2517	7857	0.00100000005
26506	2517	8	0.0500000007
26507	2517	7834	0.00100000005
26508	2517	7734	0.00100000005
26509	2517	7836	0.00100000005
26510	2517	293	0.00100000005
26511	2517	7900	0.00100000005
26512	2517	7899	0.00100000005
26513	2517	8163	0.00100000005
26514	2517	2062	0.00100000005
26515	2518	434	0.00999999978
26516	2518	8100	0.00999999978
26517	2518	8242	0.00999999978
26518	2518	7850	0.00999999978
26519	2518	8096	0.00999999978
26520	2518	8102	0.00999999978
26521	2518	7955	0.00999999978
26522	2518	2538	0.00999999978
26523	2518	801	0.00999999978
26524	2518	2541	0.00999999978
26525	2518	161	0.00100000005
26526	2518	8103	0.00100000005
26527	2518	2817	0.00100000005
26528	2518	6110	0.00100000005
26529	2518	8039	0.00100000005
26530	2521	425	0.00999999978
26531	2521	1018	0.00999999978
26532	2521	7955	0.00999999978
26533	2521	33	0.00999999978
26534	2521	36	0.00999999978
26535	2521	7758	0.00100000005
26536	2521	7830	0.00100000005
26537	2521	7841	0.00100000005
26538	2521	548	0.00100000005
26539	2521	7893	0.00100000005
26540	2521	7741	0.00100000005
26541	2521	7835	0.00100000005
26542	2521	8243	0.00100000005
26543	2521	2591	0.00100000005
26544	2521	431	0.00100000005
26545	2521	8244	0.00100000005
26546	2521	4195	0.00100000005
26547	2521	292	0.0500000007
26548	2521	568	0.00999999978
26549	2521	549	0.0500000007
26550	2521	546	0.0199999996
26551	2521	548	0.0199999996
26552	2521	3262	0.00999999978
26553	2521	33	0.00999999978
26554	2521	8245	0.00999999978
26555	2521	7741	0.00999999978
26556	2521	3471	0.0199999996
26557	2521	8079	0.00999999978
26558	2521	77	0.0199999996
26559	2521	7109	0.00999999978
26560	2521	2010	0.00999999978
26561	2521	425	0.0299999993
26562	2521	45	0.0299999993
26563	2525	83	0.25999999
26564	2525	2591	0.289999992
26565	2525	659	0.400000006
26566	2525	431	0.5
26567	2525	427	0.150000006
26568	2525	74	0.400000006
26569	2525	36	0.129999995
26570	2525	2510	0.100000001
26571	2525	45	0.100000001
26572	2525	71	0.0500000007
26573	2526	8	0.00999999978
26574	2526	74	0.0399999991
26575	2526	2021	0.00999999978
26576	2526	844	0.00999999978
26577	2526	7054	0.0299999993
26578	2526	2493	0.00999999978
26579	2526	2541	0.0299999993
26580	2526	4193	0.00999999978
26581	2526	291	0.00999999978
26582	2526	2591	0.00100000005
26583	2527	8	0.0500000007
26584	2527	681	0.100000001
26585	2527	292	0.00999999978
26586	2527	8201	0.159999996
26587	2527	7976	0.00999999978
26588	2527	79	0.00999999978
26589	2527	472	0.00100000005
26590	2527	7745	0.00100000005
26591	2528	425	0.0799999982
26592	2528	14	0.0599999987
26593	2528	33	0.00999999978
26594	2528	36	0.0399999991
26595	2528	292	0.200000003
26596	2528	291	0.0799999982
26597	2528	7912	0.00100000005
26598	2528	2264	0.00100000005
26599	2528	1364	0.00100000005
26600	2528	293	0.00100000005
26601	2528	617	0.00100000005
26602	2529	7723	0.00999999978
26603	2529	7722	0.100000001
26604	2529	913	0.0500000007
26605	2529	2591	0.100000001
26606	2529	431	0.0500000007
26607	2529	8168	0.00999999978
26608	2529	425	0.0199999996
26609	2529	14	0.159999996
26610	2529	33	0.170000002
26611	2529	74	0.0900000036
26612	2532	434	0.100000001
26613	2532	8075	0.150000006
26614	2532	82	0.200000003
26615	2532	896	0.119999997
26616	2532	7955	0.150000006
26617	2532	33	0.300000012
26618	2532	1512	0.150000006
26619	2532	1177	0.119999997
26620	2532	681	0.150000006
26621	2532	7963	0.0500000007
26622	2532	292	0.300000012
26623	2532	1844	0.200000003
26624	2532	2493	0.200000003
26625	2532	2694	0.0599999987
26626	2532	857	0.0500000007
26627	2532	7956	0.100000001
26628	2532	8015	0.00999999978
26629	2532	2117	0.0399999991
26630	2532	8161	0.0399999991
26631	2532	548	0.00100000005
26632	2532	7878	0.00100000005
26633	2532	2371	0.00100000005
26634	2532	1191	0.00100000005
26635	2532	293	0.00300000003
26636	2532	801	0.00100000005
26637	2532	8246	0.00100000005
26638	2532	7899	0.00100000005
26639	2532	7941	0.00100000005
26640	2532	7900	0.00100000005
26641	2533	8247	0.00999999978
26642	2533	1567	0.00999999978
26643	2533	33	0.100000001
26644	2533	599	0.140000001
26645	2533	7712	0.100000001
26646	2533	7956	0.0700000003
26647	2533	292	0.0700000003
26648	2533	2694	0.0700000003
26649	2533	79	0.0500000007
26650	2533	535	0.100000001
26651	2533	405	0.209999993
26652	2533	8248	0.0700000003
26653	2533	1772	0.00100000005
26654	2533	993	0.00100000005
26655	2533	2792	0.00100000005
26656	2533	442	0.00100000005
26657	2535	122	0.0299999993
26658	2535	8	0.0199999996
26659	2535	896	0.100000001
26660	2535	681	0.0399999991
26661	2535	292	0.0799999982
26662	2535	599	0.0299999993
26663	2535	255	0.0299999993
26664	2535	567	0.0399999991
26665	2535	7856	0.00100000005
26666	2535	993	0.00100000005
26667	2535	442	0.00100000005
26668	2536	72	0.00999999978
26669	2536	913	0.150000006
26670	2536	5305	0.100000001
26671	2536	292	0.200000003
26672	2536	1844	0.00999999978
26673	2536	561	0.0500000007
26674	2536	397	0.0399999991
26675	2536	410	0.0500000007
26676	2536	535	0.0399999991
26677	2536	993	0.00100000005
26678	2536	8249	0.00100000005
26679	2536	8067	0.00100000005
26680	2536	4290	0.0170000009
26681	2536	465	0.0199999996
26682	2536	2062	0.00100000005
26683	2536	8250	0.00100000005
26684	2537	896	0.219999999
26685	2537	5305	0.119999997
26686	2537	33	0.209999993
26687	2537	8007	0.00999999978
26688	2537	681	0.140000001
26689	2537	292	0.270000011
26690	2537	2493	0.219999999
26691	2537	7728	0.0599999987
26692	2537	434	0.00100000005
26693	2537	993	0.00100000005
26694	2537	8044	0.00100000005
26695	2537	8251	0.00100000005
26696	2537	7830	0.00100000005
26697	2537	7841	0.00100000005
26698	2537	7878	0.00100000005
26699	2537	7879	0.00100000005
26700	2537	7880	0.00100000005
26701	2537	8046	0.00100000005
26702	2537	1191	0.00100000005
26703	2537	77	0.00100000005
26704	2537	3976	0.00100000005
26705	2537	7794	0.00100000005
26706	2537	7853	0.00100000005
26707	2537	8022	0.00100000005
26708	2537	472	0.00100000005
26709	2537	7097	0.00100000005
26710	2537	4193	0.00100000005
26711	2538	74	0.0599999987
26712	2538	33	0.0700000003
26713	2538	681	0.0299999993
26714	2538	292	0.0399999991
26715	2538	2173	0.0399999991
26716	2538	7833	0.0399999991
26717	2538	7834	0.00100000005
26718	2538	7734	0.00100000005
26719	2538	425	0.00100000005
26720	2538	8252	0.00100000005
26721	2538	7741	0.00100000005
26722	2538	7835	0.00100000005
26723	2538	1303	0.00100000005
26724	2538	480	0.00100000005
26725	2538	431	0.00100000005
26726	2538	7047	0.00100000005
26727	2538	1191	0.00100000005
26728	2538	3976	0.00100000005
26729	2538	7794	0.00100000005
26730	2538	7836	0.00100000005
26731	2538	7837	0.00100000005
26732	2538	7838	0.00100000005
26733	2538	7825	0.00100000005
26734	2538	3612	0.00100000005
26735	2538	4017	0.00100000005
26736	2538	293	0.00100000005
26737	2538	5939	0.00100000005
26738	2538	472	0.00100000005
26739	2538	7839	0.00100000005
26740	2538	7840	0.00100000005
26741	2539	1512	0.00999999978
26742	2539	292	0.00999999978
26743	2539	2493	0.00999999978
26744	2540	74	0.0199999996
26745	2540	2021	0.00999999978
26746	2540	107	0.0299999993
26747	2540	292	0.0599999987
26748	2540	405	0.0299999993
26749	2540	2860	0.00100000005
26750	2540	8253	0.00100000005
26751	2540	1191	0.00100000005
26752	2540	7704	0.00999999978
26753	2540	77	0.00100000005
26754	2540	3976	0.00100000005
26755	2540	8091	0.00100000005
26756	2540	8177	0.00200000009
26757	2540	4195	0.00100000005
26758	2540	397	0.00100000005
26759	2541	185	0.00100000005
26760	2541	8254	0.00100000005
26761	2541	8255	0.00100000005
26762	2541	1527	0.00100000005
26763	2541	1231	0.00100000005
26764	2541	7836	0.00100000005
26765	2541	8256	0.00100000005
26766	2541	2427	0.00100000005
26767	2541	7914	0.00100000005
26768	2542	434	0.0299999993
26769	2542	8247	0.100000001
26770	2542	71	0.0299999993
26771	2542	425	0.0399999991
26772	2542	1018	0.0199999996
26773	2542	896	0.150000006
26774	2542	33	0.150000006
26775	2542	419	0.0299999993
26776	2542	107	0.0399999991
26777	2542	547	0.0799999982
26778	2542	681	0.119999997
26779	2542	292	0.25
26780	2542	1844	0.200000003
26781	2542	2694	0.100000001
26782	2542	191	0.0299999993
26783	2542	3237	0.150000006
26784	2542	489	0.0599999987
26785	2542	8030	0.0599999987
26786	2542	7922	0.0500000007
26787	2542	599	0.0599999987
26788	2542	1512	0.200000003
26789	2542	7857	0.0500000007
26790	2542	8203	0.00100000005
26791	2542	7830	0.00100000005
26792	2542	1030	0.00100000005
26793	2542	293	0.00100000005
26794	2542	801	0.00100000005
26795	2542	8025	0.00100000005
26796	2542	7895	0.00100000005
26797	2542	7899	0.00100000005
26798	2544	703	0.00999999978
26799	2544	82	0.00999999978
26800	2544	1694	0.00999999978
26801	2544	33	0.00999999978
26802	2544	7920	0.00999999978
26803	2544	36	0.00999999978
26804	2544	3126	0.00999999978
26805	2544	801	0.00999999978
26806	2544	32	0.00999999978
26807	2544	7997	0.00999999978
26808	2544	7988	0.00999999978
26809	2544	7998	0.00999999978
26810	2544	7922	0.00999999978
26811	2544	7990	0.00999999978
26812	2544	8152	0.00100000005
26813	2544	434	0.00100000005
26814	2544	993	0.00100000005
26815	2544	7928	0.00100000005
26816	2544	8186	0.00100000005
26817	2544	8001	0.00100000005
26818	2544	7993	0.00100000005
26819	2544	8071	0.00100000005
26820	2544	8003	0.00100000005
26821	2544	8153	0.00100000005
26822	2544	8004	0.00100000005
26823	2544	5731	0.00100000005
26824	2545	14	0.0900000036
26825	2545	74	0.0599999987
26826	2545	834	0.0599999987
26827	2545	33	0.0599999987
26828	2545	292	0.150000006
26829	2545	7853	0.00100000005
26830	2545	277	0.00100000005
26831	2545	8	0.00100000005
26832	2545	3236	0.00100000005
26833	2545	993	0.00100000005
26834	2545	21	0.00100000005
26835	2545	74	0.00100000005
26836	2545	8257	0.00100000005
26837	2545	7836	0.00100000005
26838	2546	2691	0.0299999993
26839	2546	7961	0.0199999996
26840	2546	681	0.0700000003
26841	2546	292	0.0500000007
26842	2546	79	0.0399999991
26843	2546	291	0.0399999991
26844	2546	7977	0.00100000005
26845	2546	3262	0.00100000005
26846	2546	7741	0.00100000005
26847	2546	2591	0.00100000005
26848	2546	3976	0.00100000005
26849	2546	2073	0.00100000005
26850	2546	7917	0.00100000005
26851	2546	6498	0.00100000005
26852	2546	7745	0.00100000005
22107	2091	7695	0.119999997
22108	2091	195	0.109999999
22109	2091	1644	0.109999999
22110	2091	7062	0.0799999982
22111	2091	291	0.0700000003
22112	2091	3237	0.189999998
22113	2091	1844	0.129999995
22114	2091	489	0.109999999
22115	2091	3224	0.0700000003
22116	2091	33	0.109999999
22117	2091	36	0.0900000036
22118	2091	896	0.0799999982
22119	2091	277	0.0500000007
22120	2091	12	0.0199999996
22121	2091	434	0.00999999978
22122	2091	714	0.00999999978
22123	2091	681	0.0700000003
22124	2091	4156	0.0299999993
22125	2091	229	0.0299999993
22126	2091	844	0.00999999978
22127	2091	3904	0.00999999978
22128	2091	7696	0.0299999993
22129	2091	7697	0.00999999978
22130	2091	7698	0.0500000007
22131	2091	2694	0.0700000003
22132	2091	395	0.0599999987
22133	2091	419	0.0399999991
22134	2091	5356	0.0399999991
22135	2091	3567	0.0399999991
22136	2091	107	0.0199999996
22137	2091	734	0.0199999996
22138	2091	5164	0.0199999996
22105	2091	292	0.270000011
22106	2091	7694	0.180000007
22139	2091	857	0.0500000007
22140	2091	7699	0.0299999993
22141	2091	7700	0.0599999987
22142	2091	40	0.0599999987
22143	2091	410	0.0599999987
22144	2091	405	0.0599999987
22145	2091	79	0.0299999993
22146	2091	7701	0.0299999993
26903	1	4	0.5
26904	1	5	0.5
26905	1	6	0.5
26906	1	7	0.5
26907	1	8	0.5
26908	1	9	0.5
26909	1	10	0.25
26910	1	11	0.5
26911	1	12	0.5
26912	1	13	0.5
26913	1	14	0.5
26914	1	15	0.25
26915	1	16	0.5
26916	1	1	0.5
26917	1	2	0.5
26918	1	3	0.5
26968	12	37	0.899999976
26969	12	14	0.699999988
26970	12	75	0.75
26971	12	76	0.5
26972	12	77	0.5
26973	12	78	0.5
26975	2588	37	1
26976	2589	37	1
26977	2591	12	1
\.


--
-- Name: explanation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doknosis
--

SELECT pg_catalog.setval('explanation_observation_id_seq', 26977, true);


--
-- Data for Name: explanation_type; Type: TABLE DATA; Schema: public; Owner: doknosis
--

COPY explanation_type (id, name) FROM stdin;
1	sporadic disease
2	drug
3	infectious disease
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: doknosis
--

COPY location (id, name) FROM stdin;
1	North America
2	South America
3	Central America
4	Carribean
5	Europe
6	Middle East
7	East Asia
8	South Asia
9	Australia
10	Africa
\.


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doknosis
--

SELECT pg_catalog.setval('location_id_seq', 10, true);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: doknosis
--

COPY observation (id, name, type) FROM stdin;
2	shock - hypovolemic	1
3	flank pain	1
4	peripheral artery disease	1
5	pulsatile abdominal mass	1
6	elderly	4
7	tobacco use	1
8	hypotension	1
9	adult	4
10	female	2
11	lower back pain - severe	1
12	tachycardia	1
13	diabetes mellitus	1
14	abdominal pain	1
15	altered mental status	1
16	male	2
17	diabetes mellitus - type 2	1
18	coronary artery disease	1
19	diabetes mellitus - type 1	1
20	severe abdominal pain	1
21	syncope	1
22	flank ecchymosis	1
23	grey turner's sign	1
24	smoking history	1
25	abdominal bruit	1
26	aortic aneurysm	1
27	pulsating mass in the abdomen	1
28	pulsating sensation in the abdomen	1
29	pulsating sensation in the scrotum	1
30	pulsating sensation in the lower back	1
31	increasing abdominal girth	1
32	amenorrhea	1
33	nausea	1
34	delayed menses	1
35	teenager	4
36	vomiting	1
37	fever	1
38	chills	1
39	rigors	1
40	dyspnea	1
41	pain at infusion site	1
42	oliguria	1
43	back pain	1
44	hemoglobinuria	1
45	renal failure	1
46	shock	1
47	tongue jewellery	1
48	bruxism	1
49	high-fiber diet	1
50	loss of tooth structure	1
51	overzealous brushing	1
52	severe anal pain	1
53	malaise	1
54	draining fistula	1
55	palpable perirectal mass	1
56	severe genital pain	1
57	dyspareunia	1
58	mass in lower medial labia majora	1
59	cellulitis	1
60	lymphangitis	1
61	breast pain	1
62	warmth	1
63	lactating	1
64	fluctuance	1
65	axillary lymphadenopathy	1
66	nipple discharge	1
67	nipple inversion	1
68	child	4
69	prepatellar bursa	1
70	ear pain	1
71	pruritus	1
72	erythema	1
73	local pain	1
74	diarrhea	1
75	right upper quadrant abdominal pain	1
76	hepatomegaly	1
77	jaundice	1
78	biliary tract disease	1
79	cough	1
80	sputum production	1
81	night sweats	1
82	weight loss	1
83	anemia	1
84	putrid tasting sputum	1
85	pulmonary infiltrate with a cavity on chest x-ray	1
86	aspiration	1
87	putrid sputum	1
88	sore throat	1
89	neck pain	1
90	dysphagia	1
91	perioperative	1
92	boerhaave syndrome	1
93	fluctuance of prostate on digital rectal exam	1
94	dysuria	1
95	urinary frequency	1
96	increased urinary urgency	1
97	pelvic pain	1
98	cloudy urine	1
99	prostate tender to palpation	1
100	foul tasting saliva	1
101	pain to palpation	1
102	purulent saliva expressed on palpation	1
103	history of endocarditis	1
104	left upper quadrant abdominal pain	1
105	splenomegaly	1
106	left sided pleural effusion	1
107	myalgia	1
108	shoulder pain	1
109	pleuritic chest pain	1
110	costovertebral tenderness	1
111	left basilar crackles	1
112	dullness to percussion at the left lung base	1
113	pain in involved areas	1
114	impaired range of motion	1
115	swelling	1
116	relief with flexion	1
117	congenital syphilis	1
118	mediastinal cyst	1
119	painful mass	1
120	pain with walking	1
121	induration	1
122	edema	1
123	acute meningoencephalitis	1
124	culture negative	1
125	immunocompromised	1
126	human immunodeficiency virus (hiv) positive	1
127	obesity	1
128	insulin resistance	1
129	thickened hyperpigmented plaques on skin	1
130	involvement of posterior or lateral neck or axille	1
131	accentuated dermatoglyphics	1
132	symmetrical	1
133	impatience	1
134	competitiveness	1
135	ambition	1
136	heel pain	1
137	history of athletic training	1
138	pain worse with activity	1
139	crepitus with palpated motion	1
140	severe micromelia	1
141	small thoracic circumference	1
142	macrocrania	1
143	short trunk length	1
144	decreased mineralization	1
145	maternal polyhydramnios	1
146	delayed speech acquisition	1
147	standing height below third percentile	1
148	recurrent otitis media	1
149	tonsillar enlargement	1
150	pectus excavatum	1
151	lower extremity radiculopathy	1
152	kyphosis	1
153	tibial bowing	1
154	macrocephaly	1
155	short limbs dwarfing	1
156	enlarged neurocranium	1
157	flattened nasal bridge	1
158	prominent mandible	1
159	loss of 15-30 degrees of elbow flexion	1
160	ph < 7.35	1
161	hyperglycemia	1
162	coma	1
163	tachypnea	1
164	area affected has large amount of hormonally responsive sebaceous glands	1
165	open comedones	1
166	closed comedones	1
167	inflammatory lesions	1
168	adolescents	1
169	pyoderma gangrenosum	1
170	immunoglobulin a gammopathy	1
171	coalescence of lesions	1
172	dome shaped	1
173	blackheads in groups on neck or trunk	1
174	acne exacerbated by habitual picking	1
175	firm, dome shaped follicular based papules 2-4mm in diameter	1
176	occurrence on posterior neck	1
177	coalescence to form plaques	1
178	bandlike distribution below hairline	1
179	scarring alopecia	1
180	abscesses	1
181	papules	1
182	hot tropical environment	1
183	acne lesions	1
184	inflammatory pruritic follicular papules which rupture and scar that involve the scalp	1
185	alopecia	1
186	forehead involvement	1
187	painful follicular papules	1
188	chronic, relapsing course	1
189	comedones	1
190	facial involvement	1
191	tinnitus	1
192	allodynia	1
193	unilateral	1
194	paresthesia	1
195	cognitive dysfunction	1
196	distal location	1
197	fibrotic nodules	1
198	history of borrelia burgdorferi infection	1
199	telangiectasias	1
200	focal hyperpigmentation	1
201	loss of subcutaneous fat	1
202	sensory polyneuropathy	1
203	chronic, pustular, localized form of psoriasis involving digits	1
204	sterile pustules of the hands and feet	1
205	relapsing course	1
206	sclerosis	1
207	osteolysis	1
208	onychodystrophy	1
209	anonychia	1
210	no response to first line antipsoriatic medications	1
211	frontal bossing	1
212	thickening of nose	1
213	macroglossia	1
214	prognathism	1
215	multinodular goiter	1
216	sausage shaped fingers	1
217	skin tags	1
218	flesh colored or pink papules which coalesce into annular plaques	1
219	elastic stain of lesion showing damaged elastic fibers engulfed by giant cells	1
220	association with the sun and/or heat	1
221	area of long term sun exposure	1
222	sandpaper texture	1
223	enlargement with time	1
224	hyperpigmented	1
225	middle age or older	1
226	history of other kinds of dermatitis	1
227	severely pruritic, erythematous rash in areas exposed to sunlight or artificial light	1
228	positive photosensitivity test	1
229	pain	1
230	formation of sinus tracts	1
231	regional lymphadenopathy	1
232	painless subcutaneous swelling	1
233	painless subcutaneous nodule	1
234	deep itching sensation	1
235	infant	4
236	africa	3
237	mozambique	3
238	history of bowel surgery	1
239	abdominal distension	1
240	history of typhoid fever	1
241	appendicitis	1
242	mass lesion on abdominal exam	1
243	history of pancreatitis	1
244	history of dysentery	1
245	diverticulitis	1
246	change in bowel habits	1
247	history of trauma	1
248	draining cutaneous fistula in facial region	1
249	skin discoloration	1
250	leukocytosis	1
251	poor oral hygiene	1
252	mass lesion	1
253	abscess	1
254	periodontal disease	1
255	sinusitis	1
256	recent dental work	1
257	lymphadenopathy	1
258	tonsillitis	1
259	trismus	1
260	soft tissue swelling	1
261	facial pain	1
262	vaginal bleeding	1
263	chronic fever	1
264	current or prior longstanding iud	1
265	endometritis	1
266	frozen pelvis	1
267	mass on abdominal exam	1
268	infection at angle of jaw	1
269	mandibular periostitis	1
270	osteomyelitis	1
271	draining cutaneous fistula from sinus	1
272	discoloration of overlying skin	1
273	pleural effusion	1
274	mediastinal involvement	1
275	hemoptysis	1
276	pneumonitis	1
277	chest pain	1
278	pleural thickening	1
279	pleural empyema	1
280	productive cough	1
281	mass lesion on x ray	1
282	guarding	1
283	subacute onset	1
284	bloody stool	1
285	mucous in stool	1
286	pain with bowel movement	1
287	bright rectal bleeding	1
288	perianal pruritus	1
289	superficial tear in anal sphincter	1
290	meningismus	1
291	fatigue	1
292	headache	1
293	seizure	1
294	recent viral infection	1
295	rovsing's sign	1
296	abdominal pain - right lower	1
297	sitkovsky sign	1
298	dunphy's sign	1
299	psoas sign	1
300	obturator sign	1
301	rebound tenderness	1
302	kocher's sign	1
303	acute	1
304	wheezing	1
305	wheeze	1
306	prolonged expiration	1
307	rhonchi	1
308	purulent sputum	1
309	reduced fev1	1
310	chagoma	1
311	unilateral eyelid swelling	1
312	pericardial effusion	1
313	acute myocarditis	1
314	heart failure	1
315	arrhythmia	1
316	severe steady right upper quadrant or epigastric pain	1
317	abdominal guarding	1
318	positive murphy's sign	1
319	history of gallstones	1
320	morning crusting	1
321	conjunctival erythema (injection)	1
322	discharge	1
323	vision changes	1
324	photophobia	1
325	corneal opacity	1
326	increased frequency	1
327	increased urgency	1
328	suprapubic pain	1
329	hematuria	1
330	vaginal discharge	1
331	severe acute hepatitis in previously unrecognized hbv carrier	1
332	exacerbation of preexisting chronic hepatitis b	1
333	presence of hbsag	1
334	anti-hbc, igm is negative	1
335	serum hdv rna (by hybridization) is early and persistent	1
336	liver hdag positive	1
337	anti-hdv, igm is shows rapidly increasing and persistent titers	1
338	fulminant liver failure	1
339	development of chronic hepatitis d infection	1
340	scleral icterus	1
341	dark urine	1
342	neurologic deficits	1
343	chemotherapeutic	1
344	amiodarone	1
345	statin	1
346	nitrofurantoin	1
347	methotrexate	1
348	eye pain	1
349	lid edema	1
350	subconjunctival hemorrhage	1
351	sensation of foreign body	1
352	watery discharge	1
353	bilateral involvement	1
354	drooling	1
355	muffled voice	1
356	cervical adenopathy	1
357	hypoxia	1
358	tripod position	1
359	respiratory distress	1
360	severe pain on palpation over larynx or hyoid bone	1
361	easy bruising	1
362	bone or abdominal pain	1
363	diffuse joint pain	1
364	meningeal signs and symptoms	1
365	rhinorrhea	1
366	postnasal discharge	1
367	persistent cough	1
368	pain with bending down	1
369	hyposmia	1
370	erythema of nose	1
371	uri lasting more than 10 days	1
372	mucosal edema	1
373	pain on palpation of frontal sinus	1
374	pain with bending over	1
375	uri lasting over 10 days	1
376	vomiting (profuse, nonbloody, nonbilious)	1
377	watery diarrhea	1
378	abdominal cramps	1
379	headaches	1
380	low grade fever	1
381	focal abdominal tenderness	1
382	bleeding in response to very minimal local trauma	1
383	alterations in taste	1
384	foul breath	1
385	grey pseudomembrane	1
386	long bone involvement	1
387	local swelling	1
388	decreased movement of the affected area	1
389	coffee ground emesis	1
390	melena	1
391	hematemesis	1
392	difficulty swallowing	1
393	hoarse voice voice	1
394	loss of voice	1
395	weakness	1
396	gingival bleeding	1
397	epistaxis	1
398	pallor	1
399	hemorrhage in ocular fundus	1
400	hepatosplenomegaly	1
401	joint pain	1
402	poor dental hygiene	1
403	recent contact with animals	1
404	coryza	1
405	uri	1
406	impetigo	1
407	postauricular tenderness	1
408	postauricular erythema	1
409	displacement of the auricle	1
410	nasal congestion	1
411	nasal obstruction	1
412	purulent nasal discharge	1
413	maxillary tooth discomfort	1
414	facial pain worse when bending forward	1
415	halitosis	1
416	petechiae	1
417	positive blood culture	1
418	disseminated intravascular coagulation	1
419	arthralgia	1
420	purpura	1
421	cyanosis	1
422	seizures	1
423	multiple organ dysfunction syndrome	1
424	acute respiratory distress syndrome	1
425	rash	1
426	neck stiffness	1
427	anorexia	1
428	easy bleeding	1
429	bone pain	1
430	frequent infections	1
431	thrombocytopenia	1
432	gum bleeding	1
433	gingival hyperplasia	1
434	hypertension	1
435	chest pressure	1
436	chest squeezing	1
437	angina	1
438	chest pain radiating to the left arm or jaw	1
439	clenched fist held over the chest to describe the chest pain (levine's sign)	1
440	chest pain radiating to the lower back or abdomen	1
441	diaphoresis	1
442	pulmonary edema	1
443	jugular venous distension	1
444	light-headedness	1
445	palpitations	1
446	ventricular fibrillation	1
447	sudden death	1
448	dyslipidemia	1
449	hypercholesterolemia	1
450	family history of ischemic heart disease	1
451	elevated cardiac markers	1
452	elevated troponin	1
453	 elevated creatinine phosphokinase (cpk)	1
454	elevated myoglobin	1
455	ecg changes	1
456	q waves on ecg	1
457	st depression on ecg	1
458	st elevation on ecg	1
459	t wave inversion on ecg	1
460	dyspnea on exertion	1
461	loss of consciousness	1
462	t wave flattening on ecg	1
463	congestive heart failure	1
464	stabbing chest pain	1
465	decreased hearing	1
466	unilateral infection	1
467	erythematous tympanic membrane	1
468	dysequilibrium	1
469	runny nose	1
470	bloody urine	1
471	decreased urination	1
472	acute renal failure	1
473	proteinuria	1
474	frothy urine	1
475	uremia	1
476	severe abdominal pain radiating to the back	1
477	hemorrhagic discoloration of the umbilicus	1
478	peritonitis	1
479	ecchymotic discoloration of the flank	1
480	pancytopenia	1
481	recurrent infections	1
482	pressure sensation in sinus	1
483	decreased sense of smell	1
484	nasal discharge	1
485	toothache	1
486	bad breath	1
487	chest pain relieved by sitting	1
488	pleuritic chest pain radiating to the back	1
489	anxiety	1
490	erythema of gums	1
491	easy bleeding of gums	1
492	gum swelling	1
493	gingival recession	1
494	loose teeth	1
495	abdominal rigidity	1
496	throat pain	1
497	pain with swallowing	1
498	cervical lymphadenopathy	1
499	lethargy	1
500	flaccid paralysis	1
501	adolescent or young adult	4
502	rectal pain	1
503	pain with urination	1
504	pain on defecation	1
505	lower abdominal pain	1
506	abnormal uterine bleeding	1
507	urethritis	1
508	new vaginal discharge	1
509	acute cervical motion tenderness	1
510	recent episode of acute otitis media	1
511	hearing loss	1
512	middle ear effusion	1
513	facial pain or pressure worse when bending over	1
514	ear pain, pressure, or fullness	1
515	severe anxiety	1
516	dissociative symptoms	1
517	decreased emotional responsiveness	1
518	difficulty concentrating	1
519	dissociative amnesia	1
520	response to an event involved intense fear, helplessness, or horror	1
521	derealization	1
522	irritability	1
523	ear discharge	1
524	bulging tympanic membrane	1
525	enlarged thyroid	1
526	hyperthyroidism	1
527	tenderness of jaw and throat	1
528	barklike or brassy cough	1
529	stridor	1
530	dysphonia	1
531	eosinophilia	1
532	triad of rash, fever, and eosinophilia	1
533	recent antibiotic use	1
534	recent drug use	1
535	rhinitis	1
536	conjunctivitis	1
537	white discharge	1
538	vulvar pruritus	1
539	fishy smell when koh added to discharge	1
540	clue cells on wet mount	1
541	erythema of vulva	1
542	vulvar burning	1
793	pain in area of socket	1
543	sudden leg, lower back, or abdominal pain	1
544	severe vomiting	1
545	severe diarrhea	1
546	hypoglycemia	1
547	confusion	1
548	hyponatremia	1
549	hyperkalemia	1
550	hypercalcemia	1
551	convulsions	1
552	severe combined immunodeficiency phenotype presenting in first months of life	1
553	failure to thrive	1
554	chronic persistent diarrhea	1
555	pneumonia	1
556	skin infections	1
557	absence lymphadenopathy	1
558	small tonsils	1
559	prominence of costochondral junction	1
560	periauricular adenopathy	1
561	visual disturbance	1
562	similar symptoms in household	1
563	leech use	1
564	meningoencephalitis	1
565	intussusception	1
566	encephalitis	1
567	influenza-like symptoms	1
568	myocarditis	1
569	crackles	1
570	cervical lymphadenitis	1
571	initial diffuse, severe shoulder pain worse at night	1
572	shoulder stiffness	1
573	decreased shoulder range of motion	1
574	decreased active and passive range of motion	1
575	history of recent shoulder injury	1
576	opaque, retracted, immobile tympanic membrane	1
577	complete hearing loss	1
578	history of otitis media	1
579	emotional or behavioral symptoms in response to an identifiable stressor(s) occurring within 3 months of the onset of the stressor(s)	1
580	marked distress in excess of what would be expected from stressor or significant impairment in social or occupational functioning	1
581	once stressor has terminated, symptoms do not persist for more than an additional 6 months	1
582	symptoms do not represent bereavement	1
583	the disturbance does not meet the criteria for another axis 1 disorder	1
584	projectile vomiting	1
585	succussion splash at epigastrium	1
586	visible gastric peristalsis	1
587	gastric residue of 500ml or more	1
588	vomiting of partially digested food	1
589	history of acid ingestion	1
590	early satiety	1
591	diffuse crackles	1
592	use of accessory muscles of respiration	1
593	htlv-1	1
594	swollen glands	1
595	spiking fever	1
596	salmon colored macular rash involving the trunk and extremities	1
597	arthritis	1
598	fusion of wrist joints	1
599	pharyngitis	1
600	pericarditis	1
601	pleural effusions	1
602	transient pulmonary infiltrates	1
603	dic	1
604	ttp-hus	1
605	peritoneal dialysis	1
606	response to quinolone	1
607	growth on cefsulodin-irgasan-novobiocin media	1
608	nonsporulating facultative anaerobe	1
609	lactose fermenter	1
610	beta hemolytic	1
611	contact with pool water	1
612	contact with freshwater	1
613	bowel perforation	1
614	contact with brackish water	1
615	oxidase positive bacteria	1
616	gram negative bacilli with single polar flagellum present	1
617	hemolytic uremic syndrome	1
618	fecal leukocytes	1
619	meningitis	1
620	gram negative bacilli with sige polar flagellum present	1
621	gas gangrene	1
622	suppuration	1
623	soft tissue necrosis	1
624	necrotizing soft tissue infection	1
625	fresh water exposure	1
626	burn	1
627	pyomyositis	1
628	recent medical procedure	1
629	regional lymphadenitis	1
630	multiple eschars	1
631	 exposure to ticks	1
632	elevated ast and alt	1
633	hunt in bush	1
634	lymphopenia	1
635	elevated c-reactive protein (crp)	1
636	positive immunohistochemical test	1
637	aphthous ulcers	1
638	travel in bush	1
639	vesicular rash	1
640	winterbottom's sign	1
641	itching	1
642	daytime slumber	1
643	reduced coordination	1
644	sleep disturbance	1
645	born to mother with aids	1
646	disseminated cryptococcosis	1
647	positive hiv elisa	1
648	cmv infection	1
649	disseminated histoplasmosis	1
650	kaposis sarcoma	1
651	drug abuse history	1
652	hiv with lymphoma	1
653	wasting	1
654	human immunodeficiency virus (hiv) positive with cervical cancer	1
655	cd4+ <200	1
656	disseminated coccidioidomycosis	1
657	pneumocystis pneumonia	1
658	oral candidiasis (thrush)	1
659	leukopenia	1
660	disseminated mai	1
661	chronic cough	1
662	retinitis	1
663	cd4+ <14%	1
664	cmv retinitis	1
665	human immunodeficiency virus (hiv) positive with recurrent pna	1
666	adherent white coat on lateral tongue (leukoplakia)	1
667	blood transfusion recipient	1
668	human immunodeficiency virus (hiv) positive western blot	1
669	isosporiasis	1
670	human immunodeficiency virus (hiv) positive with pulmonary tb	1
671	positive human immunodeficiency virus (hiv) positive pcr	1
672	history of std	1
673	hemophilia	1
674	human immunodeficiency virus (hiv) positive with encephalopathy	1
675	toe pain	1
676	spontaneous autoamputation	1
677	fifth toe	1
678	constriction	1
679	substernal chest pain	1
680	lightheaded	1
681	dizziness	1
682	respiratory failure	1
683	elevated jugular venous pressure	1
684	history of heavy alcohol use	1
685	acute onset of epigastric pain	1
686	pain radiating to back	1
687	abdominal distention	1
688	ecchymotic discoloration in periumbilical region	1
689	ecchymotic discoloration along the flank	1
690	pancreatic insufficiency	1
691	abdominal pain worsened after eating	1
692	steatorrhea	1
693	glucose intolerance	1
694	pancreatic calcifications	1
695	corticosteroid hypersecretion	1
696	history of alcohol intake	1
697	alcohol intoxication	1
698	resolution with withdrawal	1
699	cushingoid	1
700	moon facies	1
701	buffalo hump	1
702	hyperhidrosis	1
703	weight gain	1
704	central obesity	1
705	decreased systolic blood pressure	1
706	laterally displaced pmi	1
707	decreased pulse pressure	1
708	mitral regurgitation or tricuspid regurgitation	1
709	cachexia	1
710	muscle atrophy	1
711	cool extremities	1
712	weak peripheral pulses	1
713	elevated jvp	1
714	peripheral edema	1
715	ascites	1
716	digital clubbing	1
717	gynecomastia	1
718	cutaneous telangiectasias	1
719	spider angiomata	1
720	palmar erythema	1
721	decreased liver size	1
722	asymptomatic	1
723	hepatic encephalopathy	1
724	epigastric pain	1
725	tender hepatomegaly	1
726	ast/alt ratio >2	1
727	elevated ast	1
728	elevated alt	1
729	proximal muscle weakness	1
730	bruit over liver	1
731	elevated ggt	1
732	high mcv	1
733	increased ck	1
734	muscle cramps	1
735	muscle tenderness	1
736	muscle swelling	1
737	calf muscle involvement	1
738	diffuse muscle atrophy	1
739	history of chronic alcohol consumption	1
740	diminished sensation to vibration or pinprick stimulation greatest in the distal extremities	1
741	temperature and proprioceptive sensation abnormalities	1
742	weakness of ankle/toe dorsiflexion or ankle plantar flexion strength	1
743	gait ataxia with wide base	1
744	decreased patellar deep tendon reflexes	1
745	atrophy of intrinsic foot muscles	1
746	spontaneous pain	1
747	hyperalgesia	1
748	hyperpathia	1
749	hypoesthesias	1
750	hypothermesthesia (impaired temperature sensation)	1
751	proprioception and anesthesia dolorosa	1
752	dissociated sensory pattern	1
753	discoloration of the skin	1
754	changes in the growth pattern of hair or nails on the affected limb	1
755	single extremity involvement	1
756	tetany	1
757	hypoventilation	1
758	subcutaneous edema	1
759	joint pain, especially of knees and ankles	1
760	scrotal edema	1
761	palpable purpura	1
762	swollen turbinates	1
763	erythermal of the nasal mucosa	1
764	blanching, raised, palpable wheals	1
765	recent exposure to allergen	1
766	adverse reaction to allergen	1
767	trauma	1
768	corticosteroid	1
769	complete loss of hair on scalp	1
770	non-scarring hair loss	1
771	burning sensation or pruritus in affected area	1
772	single patch	1
773	two patches	1
774	multiple patches	1
775	presence of mycosis fungoides	1
776	grouped follicular papules and alopecia	1
777	scaling	1
778	complete loss of hair on entire body	1
779	asian, indian, or middle eastern descent	1
780	hypochromic, microcytic red blood cells with target cells	1
781	ulcers	1
782	history of aplastic or hypoplastic crises	1
783	prominent frontal bossing	1
784	overgrowth of maxille	1
785	compression fracture of spine	1
786	growth retardation	1
787	involvement of epiphyseal plates	1
788	lumbar scoliosis in adults	1
789	kyphosis in adults	1
790	difficulty breathing	1
791	symptoms dependent on specific condition	1
792	history of recent tooth extraction or loss	1
794	bad taste in mouth	1
795	empty tooth socket	1
796	exposed bone in socket	1
797	edema of socket	1
798	progressive memory loss	1
799	dementia	1
800	apathy	1
801	depression	1
802	disorientation	1
803	confusion with time or place	1
804	executive dysfunction	1
805	alzheimer's disease diagnosed before age 65	1
806	down syndrome	1
807	alzheimer's disease diagnosed after age 65	1
808	transient blindness	1
809	blindness	1
810	unilateral blindness	1
811	transient vision loss	1
812	carotid artery disease	1
813	carotid stenosis	1
814	"shade" descending over vision	1
815	high cholesterol	1
816	atherosclerosis	1
817	amblyopia resulting from opacification of ocular media	1
818	only one eye involved	1
819	impaired vision out of proportion to perceived defect in eye	1
820	subacute	1
821	hematochezia	1
822	developing country	1
823	absence of a menstrual period in a woman of reproductive age	1
824	positive entamoeba serology	1
825	negative entamoeba serology	1
826	positive entamoeba naat	1
827	negative entamoeba naat	1
828	single liver abscess	1
829	elevated alp	1
830	right hepatic lobe abscess	1
831	mucous	1
832	dysentery	1
833	liver abscess	1
834	flatulence	1
835	intermittent diarrhea	1
836	charcot-leyden crystals in stool	1
837	fecal pus	1
838	tenesmus	1
839	history of corticosteroid use	1
840	profuse diarrhea	1
841	history of pregnancy	1
842	history of malnourishment	1
843	positive amoeba serology	1
844	ataxia	1
845	hemiparesis	1
846	history of abnormal sensation of taste	1
847	wet prep positive for amoeba	1
848	negative amoeba serology	1
849	wet prep negative for amoeba	1
850	history of abnormal sensation of smell	1
851	cranial nerve palsy	1
852	speech disturbance	1
853	cerebellar nystagmus	1
854	anterior uveitis	1
855	severe eye pain	1
856	ocular discharge	1
857	blurred vision	1
858	dendriform keratitis	1
859	foreign-body sensation in eye	1
860	ptosis	1
861	endophthalmitis	1
862	iritis	1
863	tearing	1
864	blepharospasm	1
865	lower intercostal tenderness	1
866	diminished breath sounds at the right lung base	1
867	congenital absence of the spinal cord	1
868	polyneuropathy	1
869	bleeding	1
870	pale skin	1
871	folate deficiency	1
872	b12 deficiency	1
873	claudication	1
874	iron deficiency	1
875	bounding pulse	1
876	dull perianal discomfort and pruritus	1
877	pain increased with defecation	1
878	erythematous, fluctuant subcutaneous mass near anal orifice	1
879	severe pain during bowel movement	1
880	bright red blood on toilet paper or on stool	1
881	posterior midline location	1
882	anterior midline position	1
883	history of anorectal abscess	1
884	bloody or purulent discharge	1
885	pruritic anus	1
886	anoscopy revealing fistula	1
887	blood in stool	1
888	polyp felt during digital rectal exam	1
889	history of familial adenomatous polyposis, gardner syndrome, juvenile polyposis, lynch syndrome, or peutz-jeghers syndrome	1
890	incomplete bowel evacuation	1
891	mass prolapsed through anus	1
892	painless	1
893	straining to initiate or complete defecation	1
894	concomitant pelvic floor disorder	1
895	fecal incontinence	1
896	constipation	1
897	age over 40	1
898	a central nervous system stimulant medication	1
899	history of repeated urinary tract infections	1
900	elevated serum creatinine	1
901	mild proteinuria	1
902	sterile pyuria	1
903	history of recent use of analgesics	1
904	presence of obsessions, compulsions, or both	1
905	the obsessions or compulsions are time consuming or cause clinically significant distress or impairment in social, occupational, or other important areas of functioning	1
906	the obsessive-compulsive symptoms are not attributable to the physiological effects of a substance (eg, a drug of abuse, a medication) or another medical condition	1
907	the disturbance is not better explained by the symptoms of another mental disorder	1
908	hives	1
909	swelling of the lips	1
910	wheezes	1
911	swelling of the conjunctiva	1
912	itchiness	1
913	flushing	1
914	swelling of the tongue	1
915	swelling of the throat	1
916	crampy abdominal pain	1
917	painless lymphadenopathy	1
918	bulky lymphadenopathy >10cm	1
919	age younger than 85	1
920	elevated lactate dehydrogenase (ldh)	1
921	age younger than 60	1
922	malnutrition	1
923	x linked recessive inheritance	1
924	xy karyotype	1
925	normal female external genitalia	1
926	primary amenorrhea	1
927	phenotypical woman	1
928	decreased axillary and pubic hair	1
929	absent uterus	1
930	serum testosterone levels in adult male range	1
931	testes located in abdomen or inguinal region	1
932	gradual onset hair loss	1
933	gradual transition from large, thick, pigmented hairs to thinner, shorter hairs	1
934	follicular miniaturization	1
935	family history of hair loss	1
936	anagen to telogen hair follicles reduced to less than 5 to 1	1
937	substance that acts as natural androgen	1
938	multiple, circumscribed, skin colored macules or patches that bulge and herniate into the skin upon palpation	1
939	scalp, palms, soles spared	1
940	sensation of hernial orifice	1
941	inflammatory lesion	1
942	non-inflammatory lesion	1
943	pain of one or more lower extremity muscle groups related to activity	1
944	ankle-brachial index <0.9	1
945	upper extremity pain	1
946	history of hypertension	1
947	severe, usually unilateral headache	1
948	amaurosis fugax	1
949	ptosis with miosis (partial horner syndrome)	1
950	neck swelling	1
951	pulsatile tinnitus	1
952	hypogeusia	1
953	focal weakness	1
954	scintillating scotoma	1
955	isolated ipsilateral neck pain	1
956	history of high energy/impact trauma	1
957	cervical bruit	1
958	neck hematoma or ecchymosis	1
959	painful pulsatile mass	1
960	rupture	1
961	peripheral emboli	1
962	ureteral obstruction	1
963	rectal compression	1
964	lumbosacral pain	1
965	patient younger than 45 years	1
966	ipsilateral facial dysesthesia	1
967	dysarthria or hoarse voice	1
968	contralateral loss of pain and temperature sensation in trunk and limbs	1
969	ipsilateral loss of taste	1
970	hiccups	1
971	vertigo	1
972	diplopia	1
973	contralateral weakness or paralysis	1
974	contralateral numbness	1
975	severe occipital headache	1
976	posterior nuchal pain	1
977	history of head or neck injury (can be minor)	1
978	latent period of up to 3 days between injury and symptoms	1
979	unilateral hearing loss	1
980	disequilibrium	1
981	ipsilateral horner syndrome	1
982	internuclear ophthalmoplegia	1
983	symptoms related to location of aneurysm	1
984	risk factors for atherosclerosis	1
985	marfan syndrome	1
986	ehlers-danlos syndrome	1
987	turner syndrome	1
988	loeys-dietz syndrome	1
989	aortic valve disease	1
990	superior vena cava syndrome	1
991	d-dimer	1
992	history of myocardial infarction	1
993	myocardial infarction	1
994	ventricular aneurysm	1
995	st elevation	1
996	tuberculosis	1
997	pulmonary hypertension	1
998	congenital heart disease	1
999	behcet disease	1
1000	hughes-stovin syndrome	1
1001	warm skin	1
1002	subacute pain	1
1003	bony swelling	1
1004	nausea with exertion	1
1005	chest pain relieved by rest	1
1006	chest pain with exercise	1
1007	generalized lymphadenopathy	1
1008	polyarthritis	1
1009	ascites/effusions	1
1010	anemic symptoms	1
1011	bone marrow involvement	1
1012	elevated erythrocyte sedimentation rate (esr)	1
1013	positive coombs test	1
1014	elevated beta-2 microglobulin	1
1015	hypereosinophilia	1
1016	hypoalbuminemia	1
1017	swelling of the hands	1
1018	urticaria	1
1019	swelling of the face	1
1020	pleocytosis of csf with eosinophil count ranging from 26% to 75%	1
1021	peripheral eosinophilia ranging from 5% to 63%	1
1022	identification of a. cantonensis larvae or young adults in csf of patient	1
1023	immunodot antigen detection test	1
1024	positive elisa with 31-kda antigen	1
1025	severe headache	1
1026	eosinophilic meningitis	1
1027	ocular involvement	1
1028	location in asia and the pacific basin	1
1029	consumption of undercooked fish	1
1030	anaphylaxis	1
1031	anisakis larvae not seen on endoscopy	1
1032	tickling in throat	1
1033	chronic abdominal pain	1
1034	anisakis larvae seen on endoscopy	1
1035	neck, thoracic spine, low back, or extremity pain	1
1036	spinal morning stiffness	1
1037	decreased range of spinal motion	1
1038	loss of lateral thoracic flexion	1
1039	tenderness over entheses	1
1040	palpable nodules at entheses	1
1041	presence of heberden's nodes	1
1042	apical lung fibrosis	1
1043	spine pain referred to the buttock	1
1044	floaters	1
1045	hla-b27	1
1046	chronic back pain	1
1047	aortitis	1
1048	vision loss	1
1049	back pain relieved by exercise	1
1050	eye redness	1
1051	bamboo pattern on x-ray	1
1052	ectasia of the sacral nerve root sheaths	1
1053	pain and stiffness in the middle part of the spine	1
1054	uveitis	1
1055	stiff joints	1
1056	joint immobility	1
1057	fusion of tooth to bone	1
1058	in child, tooth appearing to 'submerge'	1
1059	fifth finger clinodactyly	1
1060	family history of dental ankylosis	1
1061	recent trauma to ankylosed tooth	1
1062	involvement of primary first molars	1
1063	cluster of flesh colored growths on the genitals	1
1064	hpv	1
1065	flesh colored growth on the genitals	1
1066	teenage	1
1067	sexual exposure	1
1068	cervicitis	1
1069	sexually active	1
1070	genital itching	1
1071	genital burning	1
1072	genital papules	1
1073	genital vesicles	1
1074	genital sore	1
1075	genital pain	1
1076	genital discharge	1
1077	hsv-1	1
1078	unprotected sex	1
1079	hsv-2	1
1080	urinary retention	1
1081	anosmia	1
1082	apraxia	1
1083	grasp reflex	1
1084	hemiplegia	1
1085	disconnection syndrome	1
1086	loss of sensation in the legs	1
1087	loss of smell	1
1088	sucking reflex	1
1089	loss of strength in the legs	1
1090	contralateral sensory deficits	1
1091	urinary incontinence	1
1092	motor paralysis below the level of lesion	1
1093	loss of pain and temperature sensation below the level of the lesion	1
1094	intact proprioception	1
1095	intact vibratory sensation	1
1096	autonomic dysfunction	1
1097	sexual dysfunction	1
1098	bowel dysfunction	1
1099	bladder dysfunction	1
1100	areflexia	1
1101	loss of anal sphincter tone	1
1102	loss of ability to create new memories after the inciting event	1
1103	intact long term memory	1
1104	small painless papule	1
1105	ulcer with black eschar	1
1106	negative b. anthracis culture	1
1107	positive b. anthracis serology	1
1108	edema around ulcer	1
1109	b. anthracis visualized in smear	1
1110	vesicle	1
1111	negative b. anthracis serology	1
1112	isolation of b. anthracis from lesion	1
1113	positive b. anthracis culture	1
1114	gastric ulcers	1
1115	b. anthracis visualized in stool smear	1
1116	pharyngeal pain	1
1117	bloody diarrhea	1
1118	signs of obstruction	1
1119	esophageal ulcers	1
1120	isolation of b. anthracis from stool	1
1121	widened mediastinum on cxr	1
1122	b. anthracis visualized in sputum smear	1
1123	cervical edema	1
1124	mediastinitis	1
1125	venous engorgement	1
1126	isolation of b. anthracis from sputum	1
1127	hyperreflexia	1
1128	cerebral edema	1
1129	stupor	1
1130	b. anthracis in csf gram stain	1
1131	delirium	1
1132	isolation of b. anthracis from csf	1
1133	painful neck swelling	1
1134	isolation of b. anthracis from lesions	1
1135	oropharyngeal edema	1
1136	lesions on tonsils	1
1137	lesions on palate	1
1138	lesions on posterior pharyngeal wall	1
1139	fear	1
1140	agoraphobia	1
1141	sweats	1
1142	fear of public speaking	1
1143	symptoms cause social and or occupational distress or impairment	1
1144	hypersensitivity to criticism	1
1145	social inhibition	1
1146	feelings of inadequact	1
1147	fear of embarrassment	1
1148	systolic murmur	1
1149	paroxysmal nocturnal dyspnea	1
1150	orthopnea	1
1151	murmur	1
1152	decreased exercise tolerance	1
1153	early diastolic decrescendo murmur	1
1154	pulsus bisferiens	1
1155	slow upstroke of arterial pulse	1
1156	pulsus parvus et tardus	1
1157	apical-carotid delay	1
1158	ejection click	1
1159	split s1	1
1160	ejection click does not vary with respiration	1
1161	systolic crescendo-decrescendo murmur	1
1162	murmur radiates to carotid arteries	1
1163	murmur increases with squatting	1
1164	murmur decreases with valsalva	1
1165	tearing chest pain	1
1166	severe back pain	1
1167	aortic insufficiency	1
1168	low-grade fever	1
1169	reduced blood pressure in one arm	1
1170	arms with different blood pressure	1
1171	diminished distal pulses	1
1172	asymmetrical pulses	1
1173	bruit	1
1174	arterial bruit	1
1175	decreased or absent pulse	1
1176	claudication of extremities	1
1177	asthenia	1
1178	erythrocyte sedimentation rate (esr)>30mm/hr	1
1179	petechia	1
1180	history of recurrent or frequent infections	1
1181	history of patient living in hot and humid conditions	1
1182	flesh-colored to reddish, smooth, dome-shaped, discrete, and follicular or perifollicular papule in bilateral axillae	1
1183	pruritus of affected area	1
1184	decreased or absent sweating in affected areas	1
1185	presence of multiple papules in affected areas	1
1186	periareolar, inframammary, or pubic area involvement	1
1187	anhidrosis	1
1188	latin american location/travel	1
1189	petechiae, ecchymoses, conjunctivitis	1
1190	bleeding diatheses	1
1191	hepatitis	1
1192	elevated sgot	1
1193	increased hematocrit	1
1194	myelopathy	1
1195	lower cranial nerve dysfunction	1
1196	dysmetria	1
1197	nystagmus	1
1198	headache and neck pain	1
1199	hydrocephalus	1
1200	syringomyelia formation	1
1201	central cord symptoms such as hand weakness and dissociated sensory loss	1
1202	severe or resistant hypertension	1
1203	onset of hypertension before age 35	1
1204	significant increase in serum creatinine concentration after starting an ace inhibitor or arb without a large reduction in blood pressure	1
1205	epigastric bruit	1
1206	intermittent claudication	1
1207	paresthesias	1
1208	diminished pulses	1
1209	string of beads appearance on angiography	1
1210	concentric smooth, band like focal stenosis on angiography	1
1211	involvement of renal arteries	1
1212	involvement of carotid arteries	1
1213	multiple arteries involved	1
1214	mononeuritis multiplex	1
1215	pulmonary-renal involvement	1
1216	a subset of psoriatic or rheumatoid arthritis	1
1217	severe deformation of digits	1
1218	involvement of dip joints	1
1219	sausage digits	1
1220	new bone formation on radiographs	1
1221	cutaneous findings on involved digits	1
1222	colicky ruq pain	1
1223	asia	1
1224	poor sanitation	1
1225	pulmonary infiltrates	1
1226	cramping	1
1227	ascaris on stool microscopy	1
1228	decreased appetite	1
1229	poor weight gain	1
1230	gum disease	1
1231	hemorrhage	1
1232	hyperkeratosis	1
1233	poor wound healing	1
1234	loosening of teeth	1
1235	hemarthrosis	1
1236	painful joints	1
1237	normocytic and normochromic anemia	1
1238	sicca syndrome	1
1239	difficulty forming relationships	1
1240	asocial	1
1241	perseveration	1
1242	fungus visualized on biopsy	1
1243	adult-onset asthma	1
1244	keratitis	1
1245	bloody sputum	1
1246	cerebral infarction in immunocompromised	1
1247	mycetoma of sinuses	1
1248	consolidation on cxr in immunocompromised	1
1249	positive fungal serologies	1
1250	negative fungal culture	1
1251	negative fungal serologies	1
1252	fungus not visualized on biopsy	1
1253	positive fungal culture	1
1254	allergies	1
1255	rash in the inner surface of joint	1
1256	reactive skin	1
1257	itchy skin	1
1258	flaky skin	1
1259	heart flutter	1
1260	rapid pulse	1
1261	slow pulse	1
1262	fainting	1
1263	bradycardia	1
1264	irregular pulse	1
1265	ostium secundum	1
1266	ostium primum	1
1267	sinus venosus	1
1268	increased fatigability	1
1269	atrial arrhythmias	1
1270	stroke	1
1271	palpable pulsation of the pulmonary artery and an ejection click	1
1272	fixed and split s2	1
1273	normal oxygen saturation	1
1274	presyncope	1
1275	ventricular tachycardia	1
1276	prolonged pr interval	1
1277	regularly irregular arrhythmia	1
1278	newborn	1
1279	adolescence or early adulthood	1
1280	erythematous lesion	1
1281	trunk lesion	1
1282	back lesion	1
1283	multiple lesions	1
1284	hyperpigmented lesions	1
1285	symmetric	1
1286	bilateral	1
1287	depressed lesion	1
1288	"cliff-drop" border	1
1289	australia	3
1290	mosquito exposure	1
1291	papua new guinea	1
1292	midwestern united states	1
1293	north eastern united states	1
1294	exposure to ticks	1
1295	united states	1
1296	long island	1
1297	martha's vineyard	1
1298	fire island	1
1299	relative bradycardia	1
1300	shaking chills	1
1301	europe	3
1302	nantucket island	1
1303	hemolytic anemia	1
1304	adult respiratory distress syndrome	1
1305	maltese cross formations on blood smear	1
1306	hemangiomatous papules	1
1307	hemangiomatous nodules	1
1308	aids	1
1309	negative bartonella culture	1
1310	serosanguinous discharge from skin ulcers	1
1311	negative bartonella serology	1
1312	mobile skin nodules	1
1313	positive bartonella culture	1
1314	positive bartonella serology	1
1315	negative bartonella histology	1
1316	multiple osteolytic lesions	1
1317	fixed skin nodules	1
1318	positive bartonella naat	1
1319	positive bartonella histology	1
1320	negative bartonella naat	1
1321	rice ingestion	1
1322	infection with bacillus fragilis	1
1323	clue cells present	1
1324	positive whiff test	1
1325	thin vaginal discharge	1
1326	clue cells absent	1
1327	white vaginal discharge	1
1328	exposure to molasses or a sugar factory	1
1329	diffuse bibasilar crackles on auscultation	1
1330	chest tightness	1
1331	chronic exposure leading to weight loss and anorexia	1
1332	neutrophilia	1
1333	reduced fvc and tlc for acute and subacute disease	1
1334	mixed obstructive and restrictive pattern for chronic disease	1
1335	decreased diffusing capacity of carbon monoxide	1
1336	hypoxemia	1
1337	recurrent episodes of symptoms after reexposure to offending antigen	1
1338	symptoms occurring within 4 to 8 hours of exposure	1
1339	presence of serum precipitins	1
1340	absence of serum precipitins	1
1341	uncircumsized	1
1342	macular lesion	1
1343	phimosis	1
1344	pain of the glans	1
1345	edema of glans	1
1346	thick foul-smelling purulent exudate	1
1347	pneumonia in immunocompromised	1
1348	trophozoites present on stool microscopy	1
1349	trophozoites absent on stool microscopy	1
1350	pt works with pigs	1
1351	age 30-60	1
1352	living in the balkans at least 15 years	1
1353	coppery skin discoloration	1
1354	chronic exposure to dietary aristolochic acid	1
1355	erythrocyte sedimentation rate (esr)d	1
1356	reflux	1
1357	history of gastroesophageal reflux (gerd)	1
1358	caucasian	1
1359	single small skin lesion	1
1360	bartonella absent on warthin starry stain	1
1361	synovitis	1
1362	conjunctival granuloma	1
1363	maculopapular rash on trunk	1
1364	encephalopathy	1
1365	preauricular lymphadenitis	1
1366	tender lymphadenopathy	1
1367	history of cat scratch	1
1368	bartonella present on warthin starry stain	1
1369	erythema nodosum	1
1370	poor hygiene	1
1371	colonization by louse	1
1372	crowded living space	1
1373	postorbital pain	1
1374	erythematous maculopapular rash on trunk	1
1375	shin pain	1
1376	leg pain	1
1377	flea bites	1
1378	exposure to bauxite	1
1379	pneumothorax	1
1380	alveolitis	1
1381	emphysema	1
1382	vaccine for mycobacterium tuberculosis	1
1383	positive ppd	1
1384	oral ulcers	1
1385	genital ulcers	1
1386	inability to blink	1
1387	inability to smile	1
1388	facial droop	1
1389	subcutaneous mass	1
1390	rubbery	1
1391	soft nodule	1
1392	irregular mass	1
1393	nodule	1
1394	skin growth	1
1395	nonproliferative, proliferative, proliferative without atypia, or atypical hyperplasia lesions	1
1396	recurrent episodes of vertigo lasting one minute or less	1
1397	sudden onset of vertigo	1
1398	onset of vertigo associated with changing of head position	1
1399	when symptomatic, feeling of toppling toward side of affected ear	1
1400	rotary nystagmus with latency brought on by the dix-hallpike maneuver	1
1401	negative dix-hallpike maneuver	1
1402	resolution of symptoms with the epley maneuver	1
1403	recent herpes outbreak	1
1404	cold sore	1
1405	changes in gait	1
1406	wernicke's encephalopathy	1
1407	pain in the limbs	1
1408	drooping eyelids	1
1409	delusions	1
1410	loss of vibratory sense	1
1411	cardiomegaly	1
1412	memory loss	1
1413	thiamine (b1) deficiency	1
1414	difficulty walking	1
1415	lactic acidosis	1
1416	impaired sensory perception	1
1417	vitamin b1 deficiency	1
1418	speech difficulties	1
1419	tingling in the hands and feet	1
1420	crying without tears	1
1421	decreased deep tendon reflexes	1
1422	arrhythmias	1
1423	nodules on chest x-ray	1
1424	restrictive lung disease	1
1425	granulomas on chest x-ray	1
1426	exposure to beryllium	1
1427	liver granulomas	1
1428	pruritic papules	1
1429	papular rash	1
1430	pregnant	1
1431	itchy rash	1
1432	rash on the limbs and trunk	1
1433	poor growth	1
1434	anterior shoulder pain exacerbated by lifting or elevated pushing or pulling of objects	1
1435	localized tenderness over bicipital groove	1
1436	flexion of elbow against resistance aggravates pain	1
1437	anterior shoulder pain with speed's test	1
1438	pain and tenderness over bicipital groove with yergason's test	1
1439	pain worse at night	1
1440	complaint of a 'click' when arm is moved in a circular arc	1
1441	conduction disturbance of the right bundle branch and one of the two fascicles of the left bundle branch	1
1442	progression to complete heart block	1
1443	pain radiating to the back	1
1444	epigastrium tender to palpation	1
1445	ecchymosis in the periumbilical region (cullen's sign)	1
1446	elevated serum amylase	1
1447	elevated serum lipase	1
1448	criteria met for at least one manic, hypomanic, or mixed episode	1
1449	symptoms not better accounted for by schizoaffective disorder, and are not superimposed on schizophrenia, schizophreniform disorder, delusional disorder, or psychotic disorder not otherwise specified	1
1450	patient meets criteria for major depressive episode	1
1451	exposure to birds	1
1452	recurrent episodes of symptoms after reexpsure to offending antigen	1
1453	cd3-/cd4+/cd56+	1
1454	positive blastocystis naat	1
1455	blastocystis present on stool microscopy	1
1456	negative blastocystis naat	1
1457	blastocystis absent on stool microscopy	1
1458	fungus absent on microscopy	1
1459	interstitial disease on cxr	1
1460	miliary disease on cxr	1
1461	positive blastomycosis naat	1
1462	ulcerated skin lesions	1
1463	cavitary lesions in upper lobes on cxr	1
1464	fungus present on microscopy	1
1465	consolidation on cxr	1
1466	verrucous skin lesions	1
1467	negative blastomycosis naat	1
1468	focal masses on cxr	1
1469	nodules on cxr	1
1470	impaired vision	1
1471	sensation of foreign body in the eye	1
1472	redness of the eyelids	1
1473	flaking of eyelid skin	1
1474	itchy eye	1
1475	red eye	1
1476	gritty sensation in eye	1
1477	cyst at eyelid margin	1
1478	burning eye	1
1479	repeated episodes of painless swelling of one or both eyelids	1
1480	thinning of eyelid skin	1
1481	edema of superior eyelids	1
1482	bilateral eye involvement	1
1483	nonerythematous edema of eyelids	1
1484	proptosis	1
1485	blepharoptosis	1
1486	blepharophimosis	1
1487	eyelid malposition	1
1488	subcutaneous telangiectasia	1
1489	bronze deposits of eyelid	1
1490	medial fat pad atrophy with pseudoepicanthal folds	1
1491	orbital fat prolapse	1
1492	lacrimal gland prolapse	1
1493	injected conjunctiva	1
1494	involuntary spasms of eyelid closure	1
1495	meige syndrome	1
1496	brueghel syndrome	1
1497	eye irritation	1
1498	weak cry	1
1499	infant fed honey	1
1500	poor muscle tone	1
1501	previously healthy	1
1502	c. botulinum not isolated from food	1
1503	positive mouse toxin assay	1
1504	c. botulinum isolated from food	1
1505	negative mouse toxin assay	1
1506	acute abdomen	1
1507	poor feeding	1
1508	flaccid (floppy) baby	1
1509	symmetric paralysis	1
1510	cranial nerve deficit	1
1511	slurred speech	1
1512	xerostomia	1
1513	chronic sinusitis	1
1514	papilledema	1
1515	nuchal rigidity	1
1516	ring enhancing lesion on imaging	1
1517	heart valve infection	1
1518	focal neurologic signs	1
1519	pleural infection	1
1520	otitis media	1
1521	history of atrial fibrillation	1
1522	blister	1
1523	brazil	3
1524	purpuric rash	1
1525	septic shock	1
1526	history of conjunctivitis within 30 days	1
1527	tissue necrosis	1
1528	high fever	1
1529	h. egyptius	1
1530	persistent productive cough	1
1531	purulent sputum production	1
1532	diagnosis of cystic fibrosis	1
1533	coexistence of rheumatic disease	1
1534	rhinosinusitis	1
1535	recurrent pleurisy	1
1536	reduced sense of smell (hyposmia)	1
1537	linear atelectasis, dilated and thickened airways, and irregular peripheral opacities on cxr	1
1538	history of exposure to noxious stimuli	1
1539	proximity to farm animals	1
1540	negative complement fixation test	1
1541	pyuria	1
1542	brucella present on isolate	1
1543	bursitis	1
1544	epididymoorchitis	1
1545	relapsing fever	1
1546	positive complement fixation test	1
1547	positive rose bengal test	1
1548	brucella agglutination titer >160	1
1549	negative brucella elisa	1
1550	positive coombs	1
1551	myositis	1
1552	negative coombs	1
1553	brucella absent on isolate	1
1554	endocarditis	1
1555	positive brucella elisa	1
1556	contact with meat processing	1
1557	cniii palsy	1
1558	ingestion of unpasteurized dairy products	1
1559	negative rose bengal test	1
1560	hepatic vein occlusion	1
1561	binge eating	1
1562	body dysmorphic disorders	1
1563	psychosocial impairment	1
1564	dry skin	1
1565	suicidality	1
1566	metabolic alkalosis	1
1567	hypokalemia	1
1568	hypochloremia	1
1569	alkalosis	1
1570	high serum bicarbonate	1
1571	tense bullae	1
1572	ibuprofen	1
1573	bullae on the thighs or upper arms	1
1574	positive bunyavirus serology	1
1575	forest exposure	1
1576	negative bunyavirus serology	1
1577	negative bunyavirus naat	1
1578	positive bunyavirus naat	1
1579	growth on the neck	1
1580	enlarged lymph node	1
1581	growth on the jaw	1
1582	inhalation injury	1
1583	pain, erythema to involved area	1
1584	superficial burn	1
1585	partial thickness burn	1
1586	full thickness burn	1
1587	pain to involved area	1
1588	loss of vision in one eye	1
1589	physical or mental collapse caused by overwork or stress	1
1590	hand pain	1
1591	pain present at rest	1
1592	pain accentuated by use	1
1593	pain referred to the insertion of the deltoid muscle approx 10cm distal to shoulder joint	1
1594	history of repetitive movement with elevated arm	1
1595	reduced active range of motion with preserved passive range of motion	1
1596	association with supraspinatus tendinitis	1
1597	history of rheumatoid arthritis	1
1598	tenderness to palpation over greater tuberosity	1
1599	history of gout	1
1600	history of tuberculosis	1
1601	breathing difficulties	1
1602	fabric worker	1
1603	cotton dust	1
1604	monday fever	1
1605	occupational lung disease	1
1606	yarn worker	1
1607	depleted energy stores	1
1608	decreased muscle mass and strength	1
1609	catabolic drivers	1
1610	temporal wasting	1
1611	history of scuba diving	1
1612	localized erythema	1
1613	cns involvement	1
1614	visual disturbances	1
1615	pulmonary venous gas emboli formation	1
1616	spacewalk or extravehicular activity in space	1
1617	onset > 30 min after dive	1
1618	paralysis	1
1619	breath-holding during ascent from scuba dive	1
1620	onset > 30 mins after dive	1
1621	onset < 10 mins after dive	1
1622	history of intense sharp heel pain with the first few steps in the morning or after another long periods without weight bearing	1
1623	pain on the plantar surface of foot	1
1624	history of increased physical activity before the onset of pain	1
1625	pain relieved by rest	1
1626	pain worsened by walking up stairs	1
1627	pain reproducible by palpating the plantar medial calcaneal tubercle at the site of plantar fascia insertion to the calcaneus	1
1628	tight achilles tendon	1
1629	pain reproduced by passive dorsiflexion of the toes while patient bears weight(windlass test)	1
1630	calcifications present on msk x-ray	1
1631	loss of range of motion	1
1632	painful arc of motion from 70-110 degrees of forward elevation	1
1633	impingement signs	1
1634	severe pain with motion	1
1635	joint x-ray showing calcific deposits	1
1636	history of gradual formation of asymptomatic calcific deposit on skin	1
1637	multiple firm, whitish dermal papules, plaques, nodules present	1
1638	lesions ulcerate producing chalky white substance	1
1639	localization of lesion dependent on type and cause of the calcium deposits	1
1640	3-7 day incubation	1
1641	focal motor abnormalities	1
1642	abnormal reflexes	1
1643	focal neurologic findings	1
1644	drowsiness	1
1645	california	1
1646	bunyavirus	1
1647	negative campylobacter naat	1
1648	positive campylobacter naat	1
1649	positive campylobacter stool culture	1
1650	negative campylobacter stool culture	1
1651	murmurs on auscultation	1
1652	embolic phenomena	1
1653	osler nodes, roth's spots, janeway's lesions	1
1654	vertebral osteomyelitis	1
1655	valvular vegetations on cardiac echo	1
1656	persistent candidemia	1
1657	premature neonate	1
1658	isolation of candida from csf	1
1659	mononuclear or neutrophilic pleocytosis of csf	1
1660	elevated protein concentration of csf	1
1661	reduced glucose concentration of csf	1
1662	lack of response to antibacterial or anti mycobacterial therapy	1
1663	skin lesions	1
1664	renal involvement	1
1665	respiratory decompensation	1
1666	acidosis	1
1667	chorioretinitis with or without vitritis	1
1668	clusters of painless pustules on an erythematous base on any area of body	1
1669	muscle abscess	1
1670	positive beta-d-glucan assay	1
1671	elevated plasma procalcitonin	1
1672	acute oliguria	1
1673	older adult	1
1674	white plaques in oropharynx (pseudomembranes)	1
1675	cottony feeling in mouth	1
1676	loss of taste	1
1677	pain during eating and swallowing	1
1678	erythema under upper dentures without plaques	1
1679	oral thrush	1
1680	skin erythema with satellite pustules	1
1681	denture use	1
1682	thick white mucosal discharge	1
1683	oral contraceptive use	1
1684	lesions at corner of mouth (perleche)	1
1685	inhaled steroid use	1
1686	history of working in the hemp industry	1
1687	fev1 less than 80 percent of expected value	1
1688	lack of cardiac output with no ventricular depolarization	1
1689	cool skin	1
1690	jvd	1
1691	dilated cardiomyopathy	1
1692	hypertrophic cardiomyopathy	1
1693	leg swelling	1
1694	bloating	1
1695	ankle swelling	1
1696	contralateral hemiplegia	1
1697	hemianesthesia	1
1698	hemihyperesthesia	1
1699	homonymous hemianopia	1
1700	receptive aphasia	1
1701	amorphosynthesis	1
1702	hemineglect	1
1703	history repeated hand movement	1
1704	wrist pain	1
1705	burning in the thumb and fingers	1
1706	loss of grip strength	1
1707	tingling in the thumb and fingers	1
1708	age less than 21	1
1709	vesicular, erythematous lesion at site of inoculation	1
1710	erythema overlying lymphadenopathy	1
1711	suppurate lymph nodes	1
1712	solitary lymphadenopathy	1
1713	fever of unknown origin	1
1714	hypoechoic areas of liver and or spleen on ultrasound	1
1715	neuroretinitis	1
1716	lymphadenitis in elderly	1
1717	general malaise in elderly	1
1718	cat or flea contact	1
1719	decreased visual acuity	1
1720	glare	1
1721	myopic shift	1
1722	monocular diplopia	1
1723	mutism	1
1724	negativism	1
1725	echopraxia	1
1726	echolalia	1
1727	immobility	1
1728	posturing	1
1729	rigidity	1
1730	staring	1
1731	grimacing	1
1732	withdrawal	1
1733	waxy flexibility	1
1734	severe local back pain	1
1735	back pain worse with recumbency	1
1736	depressed dtr in le	1
1737	decreased reflexes in legs	1
1738	hyporeflexia of le	1
1739	saddle sensory loss	1
1740	foot drop	1
1741	incontinence	1
1742	incontinence of bowel	1
1743	incontinence of bladder	1
1744	impotence	1
1745	malodorous diarrhea	1
1746	pale stool	1
1747	history of needle insertion	1
1748	local pain in skin area	1
1749	swollen patch of skin	1
1750	erythematous patch of skin	1
1751	history of surgery	1
1752	lymphedema	1
1753	history of trauma to skin	1
1754	gram positive bacteria on aspirate of lesion	1
1755	history of insect bite	1
1756	mediterranean location	1
1757	seasonal to spring, summer, fall	1
1758	myelitis	1
1759	acute flaccid paralysis	1
1760	pleocytosis of csf	1
1761	cranial mri abnormalities	1
1762	abnormal eeg	1
1763	central european location	1
1764	neurologic injury	1
1765	subarachnoid hemorrhage	1
1766	rapid correction of hyponatremia	1
1767	acute paralysis	1
1768	dysarthria	1
1769	painless loss of vision	1
1770	loss of vision	1
1771	persistent loss of vision	1
1772	atrial fibrillation	1
1773	coagulopathy	1
1774	atherosclerotic disease	1
1775	afferent pupillary defect	1
1776	mucus production	1
1777	fifth decade	1
1778	worse in the morning	1
1779	decreased fev1	1
1780	scalp swelling that does not cross cranial suture	1
1781	scalp swelling that crosses cranial suture	1
1782	itchy papules	1
1783	swimmer's itch	1
1784	water exposure	1
1785	headache in the occiput on ipsilateral side	1
1786	gait ataxia	1
1787	truncal lateropulsion	1
1788	limb incoordination	1
1789	hypotonia of involved limbs	1
1790	body sway toward side of lesion	1
1791	spontaneous lobar hemorrhage	1
1792	depressed consciousness	1
1793	other focal defects	1
1794	age greater than 60	1
1795	history of multiple lobar hemorrhages in absence of an obvious cause	1
1796	presence of two or more hemorrhages restricted to gray-white junction in the cortex on gradient-echo mri	1
1797	mean age 50 years	1
1798	anterior circulation	1
1799	cranial neuropathies	1
1800	visual acuity loss	1
1801	pyramidal tract dysfunction	1
1802	vasculitis affecting cerebral arteries	1
1803	older age	1
1804	hyperlipidemia	1
1805	stroke in involved area	1
1806	worst headache of life	1
1807	loss of strength	1
1808	loss of sensation	1
1809	non-progressive motor dysfunction	1
1810	intellectual disability	1
1811	clear fluid draining from nose or ears	1
1812	supernumerary rib arising from c7	1
1813	association with thoracic outlet syndrome	1
1814	numbness	1
1815	neck numbness	1
1816	neck weakness	1
1817	cephalea	1
1818	otalgia	1
1819	megacolon	1
1820	organ transplantation	1
1821	peru	1
1822	romana's sign	1
1823	triatomine bug	1
1824	transplacental	1
1825	body myalgia	1
1826	blood transfusion	1
1827	neuritis	1
1828	bug bite	1
1829	swelling of the eyelids	1
1830	venezuela	1
1831	megaesophagus	1
1832	t. cruzi	1
1833	achalasia	1
1834	breast feeding	1
1835	loss of swallowing	1
1836	eyelid lesion	1
1837	unilateral painful inguinal lymphadenopathy	1
1838	negative haemophilus culture	1
1839	positive haemophilus culture	1
1840	multiple painful genital ulcers	1
1841	single painful genital ulcer	1
1842	maculopapular rash	1
1843	petechial rash	1
1844	insomnia	1
1845	positive elisa (chikungunya)	1
1846	positive chikungunya virus pcr	1
1847	negative chikungunya virus pcr	1
1848	blistering	1
1849	dermatitis	1
1850	impaired social communication	1
1851	lack of reciprocity	1
1852	lack of seeking to share enjoyment	1
1853	impaired nonverbal interaction	1
1854	failure to develop age-appropriate peer relationships	1
1855	repetitive behaviors	1
1856	restricted behaviors	1
1857	stereotyped movements	1
1858	inflexible routine	1
1859	inflexible ritual	1
1860	sensitivity to sensory input	1
1861	birth to mother with chlamydia infection	1
1862	anal intercourse	1
1863	negative chlamydia culture	1
1864	bronchitis	1
1865	pleural effusion on cxr	1
1866	interstitial infiltrates on cxr	1
1867	hilar adenopathy on cxr	1
1868	negative chlamydia naat	1
1869	positive sputum direct fluorescence	1
1870	single patchy infiltrate on cxr	1
1871	positive chlamydia naat	1
1872	positive chlamydia culture	1
1873	negative sputum direct fluorescence	1
1874	large brown patches on face	1
1875	icterus	1
1876	abdominal mass on palpation	1
1877	elevated alkaline phosphatase	1
1878	murphy's sign	1
1879	pain worse with eating fatty food	1
1880	belching	1
1881	stones in gallbladder on us	1
1882	ruq pain	1
1883	overweight	1
1884	premenopausal	1
1885	thickened gallbladder on us	1
1886	pale stools	1
1887	gallstone attack	1
1888	intense pain	1
1889	sunken fontanelle in infant	1
1890	sunken eyes	1
1891	dehydration	1
1892	thready pulse	1
1893	negative vibrio cholerae stool culture	1
1894	painless diarrhea	1
1895	rice water diarrhea	1
1896	positive vibrio cholerae stool culture	1
1897	electrolyte imbalance	1
1898	rash induced by heat	1
1899	hives induced by heat	1
1900	swelling of costal cartilages	1
1901	tenderness	1
1902	acute chest pain	1
1903	pain with respiration	1
1904	pain radiates to arms	1
1905	pain radiates to shoulders	1
1906	stippled epiphyses	1
1907	skeletal changes	1
1908	intrauterine growth restriction, skeletal malformations,and cardiac defects on fetal ultrasound	1
1909	natal teeth present at birth	1
1910	chondrodystrophy manifesting as disproportionate dwarfism	1
1911	polydactyly	1
1912	hidrotic ectodermal dysplasia	1
1913	congenital cardiac anomalies	1
1914	presence of a common atrium	1
1915	hypoplastic, dystrophic, and friable nails	1
1916	decreased amount and distribution of hair	1
1917	undefined damage to cartilage	1
1918	degeneration of cartilage	1
1919	insidious or acute onset	1
1920	pain worsens with flexion and extension of knee	1
1921	pain worsens when ascending or descending stairs	1
1922	pain poorly localized around or under the patella	1
1923	pain with patellofemoral compression test	1
1924	positive patellar apprehension test	1
1925	metamorphopsia	1
1926	central scotoma	1
1927	choroidal detachment evident on fundus examination	1
1928	history of valsalva maneuver, straining, coughing, or sneezing	1
1929	development of positive pressure	1
1930	visualization of an enlarging mass obscuring the fundus reflex	1
1931	secretion of colored sweat by apocrine glands	1
1932	black to yellow colored sweat	1
1933	hospitalized patient	1
1934	impaired glucose intolerance	1
1935	short bowel syndrome	1
1936	abnormal lipid profile	1
1937	increased insulin requirements in diabetics on tpn	1
1938	verrucous nodule on lower extremity	1
1939	pruritic papule	1
1940	verrucous papules on lower extremity	1
1941	pink scaly papule on lower extremity	1
1942	painless papule	1
1943	papule	1
1944	pericarditis lasting longer than 6 months	1
1945	burning with bowel movements	1
1946	pain with defecation	1
1947	spasm of anus	1
1948	hard stools	1
1949	blood with wiping	1
1950	fullness	1
1951	attic perforation	1
1952	marginal perforation	1
1953	perforated tympanic membrane	1
1954	malodorous aural discharge	1
1955	hearing impairment	1
1956	draining ear	1
1957	recurrent acute otitis media	1
1958	traumatic perforation	1
1959	ventilation tubes	1
1960	clusters of blisters	1
1961	pruritic blisters	1
1962	discomfort	1
1963	history of recurrent acute cholecystitis	1
1964	gallbladder wall thickening	1
1965	mild abdominal plain	1
1966	left shoulder pain	1
1967	history of liver disease	1
1968	contact lens use	1
1969	concurrent asymptomatic urogenital infection	1
1970	chlamydial infection	1
1971	conjunctival inflammation	1
1972	chronic conjunctival inflammation	1
1973	chronic	1
1974	blepharitis	1
1975	eye burning	1
1976	foreign body sensation	1
1977	meibomitis	1
1978	acne rosacea	1
1979	insidious onset	1
1980	purulent mucus	1
1981	nasal polyps	1
1982	anterior nasal mucopurulent drainage	1
1983	posterior nasal mucopurulent drainage	1
1984	facial pressure	1
1985	facial fullness	1
1986	nasal obstruction and/or congestion	1
1987	reduced or lost sense of smell	1
1988	anterior or posterior nasal mucopurulent drainage	1
1989	symptoms present for 12 weeks or longer	1
1990	radiographic imaging showing mucosal thickening	1
1991	polyps in the nasal cavity or middle meatus	1
1992	edema or erythema of middle meatus on nasal endoscopy	1
1993	epigastric tenderness	1
1994	cobalamin deficiency	1
1995	pale and icteric skin	1
1996	chronic h. pylori infection	1
1997	peptic ulcer disease	1
1998	gastric cancer	1
1999	malt lymphoma	1
2000	iron deficiency anemia	1
2001	bleeding gums, especially with flossing and brushing	1
2002	large gingival pockets detected with periodontal probe	1
2003	local findings at dental-gingival margins	1
2004	erythematous gums	1
2005	patient taking phenytoin, calcium channel blockers, or cyclosporine	1
2006	asterixis	1
2007	signs of upper gi bleeding	1
2008	easy bruisability	1
2009	lower extremity edema	1
2010	hyperbilirubinemia	1
2011	decreased serum albumin	1
2012	elevated alkaline phosphatase/ggt	1
2013	elevated inr	1
2014	gfr <60	1
2015	ckd stage 1-3 being asymptomatic	1
2016	normochromic normocytic anemia	1
2017	elevated bun	1
2018	polyuria	1
2019	new onset heart failure	1
2020	metabolic acidosis	1
2021	muscle weakness	1
2022	fractional excretion of sodium (fena) increased	1
2023	albuminuria	1
2024	lymphocytosis	1
2025	history of acute otitis media or chronic suppurative otitis media	1
2026	erythema over mastoid	1
2027	edema of pinna	1
2028	downward displaced auricle	1
2029	ct demonstrating characteristic loss of the trabecular bone	1
2030	pain with palpation of maxillary sinusitis	1
2031	recurrent arthralgia	1
2032	negative neisseria culture	1
2033	recurrent arthritis	1
2034	recurrent distal rash	1
2035	complement component deficiency	1
2036	recurrent low-grade fever	1
2037	positive neisseria culture	1
2038	persistent or intermittent otorrhea	1
2039	cholesteatoma	1
2040	perforation of tympanic membrane	1
2041	edematous external auditory canal	1
2042	granulation tissue seen in the middle ear space	1
2043	insidious onset of pain with swelling over affected area	1
2044	clavicular involvement	1
2045	child or adolescent	1
2046	mri showing bone oedema, lytic areas, or periosteal reaction	1
2047	positive culture	1
2048	symmetric involvement	1
2049	bleeding episodes	1
2050	normochromic, normocytic anemia	1
2051	white blood cell count above 100,000/microl	1
2052	platelet count above 600,000	1
2053	bone marrow biopsy demonstrating granulocytic hyperplasia	1
2054	absolute basophilia on blood smear	1
2055	evidence of the philadelphia chromosome by cytogenetic analysis	1
2056	hispanic	1
2057	black	1
2058	systemic infection	1
2059	bruising	1
2060	easy fatigability	1
2061	swollen joints	1
2062	priapism	1
2063	otorrhea	1
2064	aural fullness	1
2065	tympanic membrane inflammation	1
2066	sneezing	1
2067	azotemia	1
2068	rbc casts	1
2069	drusen	1
2070	deterioration of vision	1
2071	severe hypertension	1
2072	lupus	1
2073	sle	1
2074	systemic disease	1
2075	asymptomatic proteinuria and hematuria on routine urinalysis	1
2076	dysmorphic red cells in urine	1
2077	red cell casts in urine	1
2078	decreased c3 and c4 levels	1
2079	nephrotic syndrome	1
2080	acute nephritic syndrome	1
2081	recurrent episodes of gross hematuria	1
2082	periorbital or dependent edema	1
2083	anasarca	1
2084	massive proteinuria	1
2085	non-nephrotic proteinuria with microscopic hematuria and hematuria	1
2086	history of copd	1
2087	increasing dyspnea over baseline	1
2088	increase in cough	1
2089	increase in sputum volume or changes in character	1
2090	viral infection	1
2091	bacterial infection	1
2092	presence of vesicoureteral reflux	1
2093	failure to thrive in young children	1
2094	flank tenderness on physical	1
2095	purulent drainage from fistula	1
2096	night pain	1
2097	localized tenderness	1
2098	abnormalities on x-ray	1
2099	ulcerations failing to heal	1
2100	non healing fracture	1
2101	erythema and swelling of pelvis	1
2102	increased warmth of skin of pelvis	1
2103	cervical motion tenderness	1
2104	uterine tenderness	1
2105	adnexal tenderness	1
2106	pelvic or lower abdominal pain	1
2107	liver and biliary tract dysfunction	1
2108	bleeding gums	1
2109	metallic taste	1
2110	chronic headache	1
2111	swan neck deformity	1
2112	thumb subluxation	1
2113	ulnar deviation	1
2114	boutonniere	1
2115	hallux valgus	1
2116	bladder irritation	1
2117	erectile dysfunction	1
2118	ejaculatory pain	1
2119	blood in semen	1
2120	perineal pain	1
2121	testicular pain	1
2122	penile pain	1
2123	chronic pneumonia	1
2124	exposure to soil	1
2125	exposure to bat excrement	1
2126	exposure to bird excrement	1
2127	tropics	3
2128	southeast asia	3
2129	preexisting copd	1
2130	preexisting emphysema	1
2131	exposure to radiation	1
2132	atrophic indurated plaques	1
2133	telangiectasia	1
2134	postnasal drainage	1
2135	boggy and edematous nasal turbinates	1
2136	bilateral pain	1
2137	history of acute otitis media	1
2138	mild and fluctuating hearing loss	1
2139	persistent middle ear effusion after episode of acute otitis media and resolution of acute symptoms	1
2140	feeling of fullness in the ear	1
2141	balance problems	1
2142	impaired mobility of the tympanic membrane with positive pressure during otoscopy	1
2143	air-fluid level on otoscopy	1
2144	opacification of the tympanic membrane	1
2145	tympanic membrane in a neutral or retracted position	1
2146	pain or feeling of pressure with palpation of sphenoid sinus	1
2147	history of thyroiditis	1
2148	poor appetite and weight loss	1
2149	hypertension with wide pulse pressure	1
2150	cardiac arrhythmia	1
2151	tachycardia disproportionate to fever	1
2152	infection and or inflammation of the oropharynx or tonsils for at least 3 months	1
2153	peritonsillar abscess	1
2154	palatal petechiae	1
2155	patient from a developing country	1
2156	young child	1
2157	history of multiple acute otitis media infections	1
2158	perforation of the tympanic membrane	1
2159	chronic analgesic use	1
2160	chronic cyclosporine use	1
2161	chronic cisplatin use	1
2162	chronic lithium use	1
2163	exposure to lead	1
2164	chronic hypercalcemia	1
2165	chronic hypokalemia	1
2166	chronic hyperoxaluria	1
2167	balkan endemic nephropathy	1
2168	milky pleural effusion	1
2169	neoplasm of thoracic duct	1
2170	milky urine	1
2171	white urine	1
2172	painful erosions of mucous membranes	1
2173	dry eyes	1
2174	opacification	1
2175	gingival erosion	1
2176	oropharyngeal erosions	1
2177	tense vesicles	1
2178	brunsting-perry variant	1
2179	caput medusae	1
2180	esophageal varices	1
2181	clay colored stools	1
2182	involuntary facial movement	1
2183	history of bell palsy	1
2184	history of fatigue	1
2185	history of anxiety	1
2186	precipitated by reading	1
2187	japan	1
2188	taiwan	3
2189	pickled fish	1
2190	undercooked fish	1
2191	salted fish	1
2192	korea	1
2193	freshwater fish	1
2194	china	1
2195	smoked fish	1
2196	recent trauma	1
2197	positive clostridium wound culture	1
2198	hemorrhagic skin bullae	1
2199	positive clostridium blood culture	1
2200	thin, brown serosanguineous skin discharge	1
2201	recent burn	1
2202	recent surgery	1
2203	foul-smelling skin discharge	1
2204	soft-tissue gas on x-ray	1
2205	gram positive organisms on gram stain of exudate	1
2206	localized skin edema	1
2207	severe local pressure	1
2208	crepitus in skin	1
2209	severe local heaviness	1
2210	negative clostridium wound culture	1
2211	negative clostridium blood culture	1
2212	localized skin pallor	1
2213	localized skin tenderness	1
2214	severe local pain	1
2215	subcutaneous emphysema	1
2216	negative fecal occult blood	1
2217	negative c. diff toxin assay x2	1
2218	negative c. diff toxin assay x1	1
2219	mucoid diarrhea	1
2220	prior antibiotic therapy	1
2221	positive c. diff toxin assay	1
2222	positive fecal occult blood	1
2223	retroorbital pain	1
2224	awoken by pain	1
2225	horner's syndrome	1
2226	unilateral headache	1
2227	sudden onset	1
2228	exposure to coal mining	1
2229	cor pulmonale	1
2230	absent or delayed femoral pulse	1
2231	differential cyanosis	1
2232	cold extremities	1
2233	heart failure in neonate	1
2234	lower bp in legs	1
2235	hypertension in both arms	1
2236	diminished pulse in left arm	1
2237	delayed femoral pulse	1
2238	valley fever	1
2239	filipino	1
2240	new mexico	3
2241	african american	1
2242	muscle pain	1
2243	family history of otosclerosis	1
2244	bilateral hearing loss	1
2245	osteogenesis imperfecta	1
2246	postprandial abdominal pain	1
2247	delayed gastric emptying	1
2248	preterm	1
2249	history of hypothermia	1
2250	apnea	1
2251	fixed pupils	1
2252	exposure to hypothermia as a newborn	1
2253	signs of neurodevelopmental dysfunction	1
2254	hole in iris	1
2255	congenital	1
2256	abnormal iris	1
2257	sharply defined, white excavation of the optic disk	1
2258	presence of other ocular malformations	1
2259	association with papillorenal syndrome, charge syndrome, walker-warburg syndrome, focal dermal hypoplasia, aicardi syndrome, goldenhar syndrome, linear sebaceous nevus syndrome, or noonan syndrome	1
2260	pimply rash	1
2261	light sensitivity	1
2262	colorado	1
2263	pain behind the eyes	1
2264	aseptic meningitis	1
2265	recurrent fever	1
2266	flat rash	1
2267	exudate in oropharynx	1
2268	mildly edematous oropharynx	1
2269	mildly erythematous oropharynx	1
2270	cryptosporidiosis	1
2271	atrophic gastritis	1
2272	malabsorption	1
2273	candida	1
2274	hypogammaglobulinemia	1
2275	achlorhydria	1
2276	pernicious anemia	1
2277	giardiasis	1
2278	h. pyloria	1
2279	difficulty feeding	1
2280	muscle spasticity	1
2281	fixed downward gaze	1
2282	sleepiness	1
2283	personality changes	1
2284	separated sutures	1
2285	an increase in the air capacity of one portion of a lung when another portion is consolidated or unable to perform its respiratory function	1
2286	uterus completely prolapsed out of vagina on inspection	1
2287	impairment of consciousness	1
2288	automatisms	1
2289	ocular movement abnormalities	1
2290	history of epilepsy	1
2291	aphasia	1
2388	significant blunt trauma to eye	1
2292	focal or generalized spikes, sharp waves, or sharp-and-slow complexes at frequencies >3 hz on eeg in patient without known epileptic encephalopathy	1
2293	focal or generalized spikes, sharp waves, or sharp-and-slow complexes at frequencies <3 hz or rhythmic activity >0.5hz with clinical ictal phenomena or clinical improvement after an iv ed	1
2294	frequent or continuous generalized spike wave discharges, which show significant changes in intensity or frequency (usually a faster frequency) when compared to baseline eeg in a patient which chronic epilepsy	1
2295	ictal eeg activity greater than 5 minutes	1
2296	cataract associated with ocular disease	1
2297	development of an opacity in the cortex of the eye that is progressive	1
2298	visual acuity affected	1
2299	patient with multiple sclerosis that develops acute, large lesions in the cns	1
2300	motor symptoms	1
2301	cognitive symptoms	1
2302	sensory symptoms	1
2303	cerebellar symptoms	1
2304	diagnoses of multiple sclerosis	1
2305	lesions may cause mass effect due to large edematous region surrounding them	1
2306	t2 enhancement on mri	1
2307	gadolinium enhancement on brain mri	1
2308	relapse-remitting course	1
2309	monophasic course	1
2310	isolated demyelinating syndrome	1
2311	head trauma	1
2312	personality change	1
2313	transient neurologic lesion and dysfunction from cervical cord and below	1
2314	transient neurologic lesion and dysfunction from lumbar spinal cord and below	1
2315	transient neurologic lesion and dysfunction from thoracic spinal cord and below	1
2316	a repetitive and persistent pattern of behavior in which the basic rights of others or major age-appropriate societal norms or rules are violated, as manifested by the presence of three (or more) of the following criteria in the past 12 months, with at least one criterion present in the past 6 months: aggression to people and animals, destruction of property, deceitfulness or theft, serious violations of the rules	1
2317	the disturbance in behavior causes clinically significant impairment in social, academic, or occupational functioning	1
2318	if the individual is 18 years or older, criteria are not met for antisocial personality disorder	1
2319	rinne both ears bc>ac	1
2320	weber negative	1
2321	rinne on affected side bc>ac	1
2322	weber lateralizes to affected side	1
2323	rinne bone conduction > air conduction	1
2324	recurrent pneumonia	1
2325	williams-campbell syndrome	1
2326	congenital tracheobronchomegaly	1
2327	mounier-kuhn syndrome	1
2328	recurrent febrile illness	1
2329	less than three years at presentation	1
2330	noisy breathing	1
2331	recurrent lower airway infection	1
2332	deficiency in cartilaginous rings	1
2333	congential	1
2334	red skin	1
2335	thickening of skin over joints	1
2336	blisters	1
2337	generalized redness	1
2338	autosomal dominant	1
2339	present at birth	1
2340	cloudy pupil	1
2341	missing "red eye" in photos	1
2342	premature	1
2343	maternal chorioamnionitis	1
2344	meconium in amniotic fluid	1
2345	expiratory grunting	1
2346	accessory muscle use	1
2347	in a child <2 years, hepatomegaly	1
2348	in a child <2 years, nasal discharge	1
2349	in a child <2 years,maculopapular rash occurring on back, buttocks, posterior thighs, and soles	1
2350	in a child <2 years, generalized lymphadenopathy	1
2351	in a child <2 years, palpable epitrochlear lymphadenopathy	1
2352	abnormal long bone radiographs in a child <2 years	1
2353	reactive csf vdrl	1
2354	elevated csf wbc count	1
2355	elevated csf protein	1
2356	in a child older than 2 years, frontal bossing, saddle nose, protuberant mandible	1
2357	in a child older than 2 years, bilateral interstitial keratitis (usually occurs around puberty)	1
2358	sensorineural hearing loss developing around 8-10 years of age	1
2359	hutchinson teeth	1
2360	in a child older than 2 years, perforation of the hard palate	1
2361	anterior bowing of the shins	1
2362	mulberry molars	1
2363	painless arthritis of the knees (clutton joints)	1
2364	triad of chorioretinitis, hydrocephalus, and intracranial calcifications	1
2365	asymptomatic newborn	1
2366	unilateral macular retinal scars	1
2367	small, focal, cerebral calcifications	1
2368	mononuclear csf pleocytosis	1
2369	chorioretinitis	1
2370	abnormal csf fluid	1
2371	abnormal bleeding	1
2372	microphthalmia	1
2373	absence of stomach gas on prenatal ultrasound	1
2374	copious, fine white frothy mucus bubbles in the mouth and nose in neonates	1
2375	episodes of coughing and choking associated with cyanosis	1
2376	symptoms worsen during feeding	1
2377	abdominal distension secondary to air collecting in stomach	1
2378	association with maternal human immunodeficiency virus (hiv) positive, tuberculous endometritis, and miliary tuberculosis	1
2379	low birth weight	1
2380	 smoking history	1
2381	history of angina	1
2382	displaced cardiac apex	1
2383	past mi and displaced apex	1
2384	past mi and gallop or crackles	1
2385	past mi and any signs	1
2386	crackles and apex displaced	1
2387	s3	1
2389	minor trauma or contact lens use	1
2390	history of elevated venous pressure	1
2391	negative chlamydia culture from exudate	1
2392	watery eye discharge	1
2393	bulbar follicles on lower eyelid	1
2394	purulent eye discharge	1
2395	conjunctival follicles	1
2396	chlamydia on direct fluorescence of exudate	1
2397	positive chlamydia culture from exudate	1
2398	upper respiratory infection	1
2399	swollen eye	1
2400	painful eye	1
2401	palpebral follicles	1
2402	pruritic eye	1
2403	contact with foreign substance	1
2404	blunt force injury to abdominal wall	1
2405	history of impact to ankle	1
2406	history of impact to breast	1
2407	history of impact to elbow	1
2408	history of impact to genitalia	1
2409	history of impact to eye	1
2410	history of impact to finger and nail	1
2411	history of impact to finger	1
2412	history of impact to hip	1
2413	history of impact to knee	1
2414	history of impact to lower back and pelvis	1
2415	history of impact to shoulder and upper arm	1
2416	history of impact to thigh	1
2417	history of impact to thorax	1
2418	history of impact to throat	1
2419	history of impact to toe and nail	1
2420	history of impact to toe	1
2421	acute onset of convulsions	1
2422	acute neonatal encephalopathy	1
2423	arterial ischemic stroke	1
2424	sinovenous thrombosis	1
2425	giant arteriovenous malformation	1
2426	hypertensive encephalopathy	1
2427	intracranial hemorrhage	1
2428	infection	1
2429	inborn errors of metabolism	1
2430	malabsorption secondary to duodenal pathology	1
2431	history of menkes disease	1
2432	congenital anomaly where the heart has three atria	1
2433	asymptomatic when young transitioning to symptomatic as an adult	1
2434	systemic thromboemboli	1
2435	recurrent supraventricular arrhythmias	1
2436	limb paralysis	1
2437	loss of bowel control	1
2438	back trauma	1
2439	non-inflammatory, progressive thinning of cornea	1
2440	progressive visual impairment	1
2441	history of inherited systemic disorder	1
2442	family history of keratoconus	1
2443	trouble opening the eye	1
2444	defect present on fluorescein staining	1
2445	thickening of skin due to intermittent pressure and frictional forces	1
2446	kawasaki disease	1
2447	history of coronary catheterization	1
2448	acute otitis media	1
2449	asthma attack	1
2450	chronic bronchitis exacerbation	1
2451	adhd	1
2452	delayed bone age	1
2453	insidious	1
2454	progressive	1
2455	antalgic gait	1
2456	joint stiffness	1
2457	sclerodactyly	1
2458	systemic scleroderma	1
2459	esophageal dysmotility	1
2460	raynaud's syndrome	1
2461	calcinosis	1
2462	nipple pain	1
2463	low-set ears	1
2464	premature fusion of sutures	1
2465	craniosynostosis	1
2466	exophthalmos	1
2467	hypertelorism	1
2468	psittichorhina	1
2469	external strabismus	1
2470	aortic coarctation	1
2471	patent ductus arteriosus	1
2472	brachycephaly	1
2473	hypoplastic maxilla	1
2474	neural tube defect	1
2475	craniofacial abnormalities	1
2476	neurodevelopmental delay	1
2477	scaphocephaly	1
2478	cranial elongation	1
2479	sagittal	1
2480	coronal	1
2481	metopic	1
2482	lambdoid	1
2483	rapidly progressive dementia	1
2484	jerky movements	1
2485	speech impairment	1
2486	gait changes	1
2487	rigid posture	1
2488	amnesia	1
2489	myoclonus	1
2490	hallucinations	1
2491	kernicterus	1
2492	aggression	1
2493	somnolence	1
2494	mood swings	1
2495	ecchymoses	1
2496	lassitude	1
2497	increased ferritin	1
2498	porridge-like stool	1
2499	fistule	1
2500	painful ulcerating nodule	1
2501	seronegative spondyloarthropathy	1
2502	erythematous macules	1
2503	ulcerations	1
2504	livedo reticularis	1
2505	raynaud phenomenon	1
2506	musculoskeletal complaints	1
2507	renal disease	1
2508	membranoproliferative glomerulonephritis	1
2509	 pleuritic pain	1
2510	neuropathy	1
2511	pure motor neuropathy	1
2512	sicca symptoms	1
2513	acrocyanosis	1
2514	arterial thrombosis	1
2515	meltzer triad of purpura, arthralgia, and weakness	1
2516	cold induced urticaria	1
2517	purpuric papules	1
2518	decreased csf glucose	1
2519	csf pleocytosis	1
2520	parotid gland swelling	1
2521	obtundation	1
2522	choreoathetoid movements	1
2523	skin nodules	1
2524	mild productive cough	1
2525	myoclonic jerks	1
2526	pleural friction rub	1
2527	skin pustules	1
2528	facial weakness	1
2529	cd4+ <100	1
2530	negative cryptosporidium direct fluorescence stain of stool	1
2531	negative cryptosporidium naat of stool	1
2532	pulmonary infection in immunocompromised	1
2533	positive cryptosporidium naat of stool	1
2534	positive cryptosporidium direct fluorescence stain of stool	1
2535	joint swelling	1
2536	crystals in synovial fluid	1
2537	crystals visible under ophthalmologic examination	1
2538	osteoporosis	1
2539	acne	1
2540	polydipsia	1
2541	euphoria	1
2542	reduced sex drive	1
2543	rapid weight gain	1
2544	oligomenorrhea	1
2545	reduced libido	1
2546	steroid use	1
2547	psychosis	1
2548	round face	1
2549	hydrocortisone	1
2550	baldness	1
2551	prednisone	1
2552	increased urination	1
2553	prednisolone	1
2554	purple striae	1
2555	impaired wound healing	1
2556	increased thirst	1
2557	dexamethasone	1
2558	thinning of the skin	1
2559	infertility	1
2560	hypernatremia	1
2561	fat pad on the neck	1
2562	contact with moist sand	1
2563	linear lesion on foot	1
2564	erythematous linear lesion	1
2565	vesicular lesion on foot	1
2566	pruritic linear lesion	1
2567	erythematous vesicular lesion	1
2568	contact with beach sand	1
2569	pruritic vesicular lesion	1
2570	pakistan	1
2571	sudan	1
2572	india	1
2573	facial erythema	1
2574	middle east	3
2575	l. donovani	1
2576	hypopigmented macule	1
2577	hypopigmented nodule	1
2578	painless ulcer	1
2579	patches	1
2580	plaques	1
2581	tumors	1
2582	erythrodermic lesions	1
2583	purpuric lesions	1
2584	autosomal dominant, autosomal recessive, x-linked recessive, or acquired	1
2585	loose, inelastic skin	1
2586	involvement of face and neck	1
2587	cardiomegaly, chf, murmurs, cor pulmonale	1
2588	skeletal abnormalities	1
2589	deep furrowing of the skin of the neck due to chronic sun exposure	1
2590	recurring fevers every 14 to 35 days	1
2591	neutropenia	1
2592	cyclospora in stool smear	1
2593	cyclospora in cold acid-fast stained stool smear	1
2594	alternating periods of hypomanic symptoms with mild and moderate depression	1
2595	acute, painless labial swelling	1
2596	no signs of surrounding cellulitis	1
2597	discharge is non-purulent	1
2598	if cyst is very large, it may be tender	1
2599	thick secretions	1
2600	frequent respiratory infections	1
2601	positive sweat test	1
2602	limited eye movement	1
2603	focal neurologic deficits	1
2604	negative cysticercosis serology	1
2605	pork ingestion	1
2606	ocular mass	1
2607	pupil abnormalities	1
2608	painless rubbery skin nodules	1
2609	cysticercosis noted in biopsy	1
2610	painless rubbery soft tissue nodules	1
2611	spinal mass	1
2612	cysticercosis absent in biopsy	1
2613	positive cysticercosis serology	1
2614	tinea infection	1
2615	increased icp	1
2616	calcifications on x-ray	1
2617	foul-smelling urine	1
2618	turbid urine	1
2619	urinary urgency	1
2620	gross hematuria	1
2621	feeling of fullness	1
2622	discomfort with straining	1
2623	discomfort with coughing	1
2624	discomfort when bearing down	1
2625	repeated uti	1
2626	incontinence with intercourse	1
2627	sensation of incomplete bladder emptying	1
2628	bulge into vagina	1
2629	positive cmv naat	1
2630	positive cmv serology	1
2631	cd4+ <50	1
2632	blind spots	1
2633	gastritis	1
2634	pharyngitis with exudate	1
2635	cholecystitis	1
2636	pharyngitis without exudate	1
2637	prostatitis	1
2638	colitis	1
2639	wheezing in infant	1
2640	mesenteric vein thrombosis	1
2641	heterophile-negative "mononucleosis"	1
2642	retinitis in immunocompromised	1
2643	sensorineural hearing loss in infant	1
2644	portal vein thrombosis	1
2645	negative cmv naat	1
2646	negative cmv serology	1
2647	upper lid swelling	1
2648	pain in affected area	1
2649	excess tearing	1
2650	bulla	1
2651	foul odor	1
2652	hospitalized	1
2653	neurologic impairment	1
2654	history of paralysis	1
2655	normal hemoglobin a2	1
2656	greek heritage	1
2657	italian heritage	1
2658	mild microcytosis	1
2659	married	1
2660	employed	1
2661	low socioeconomic status	1
2662	recent immigration	1
2663	lack of hallucinations	1
2664	nonbizarre delusions	1
2665	longer than one month	1
2666	never schizophrenic	1
2667	apo-e allele	1
2668	mild cognitive impairment	1
2669	poor planning	1
2670	high viral load	1
2671	low cd4 count	1
2672	writhing motions	1
2673	loss of concentration	1
2674	depressed mood	1
2675	obsessions	1
2676	addictions	1
2677	abnormal posturing	1
2678	slowed saccadic eye movements	1
2679	uncontrollable movements	1
2680	compulsions	1
2681	egocentrism	1
2682	hypersexuality	1
2683	chorea	1
2684	difficulty speaking	1
2685	gambling	1
2686	alcoholism	1
2687	testicular atrophy	1
2688	slowness of movement	1
2689	impaired balance	1
2690	small handwriting	1
2691	orthostatic hypotension	1
2692	increased muscle tone	1
2693	bradykinesia	1
2694	tremor	1
2695	double vision	1
2696	oily skin	1
2697	decreased blinking	1
2698	forward-flexed posture when walking	1
2699	festinating gait	1
2700	cogwheel rigidity	1
2701	impaired sensation	1
2702	frequent falls	1
2703	change of gait	1
2704	masked facies	1
2705	postural instability	1
2706	loss of facial expression	1
2707	frontotemporal dementia	1
2708	impaired social conduct	1
2709	behavioral changes	1
2710	pacing	1
2711	tactlessness	1
2712	breaches of etiquette	1
2713	disinhibition	1
2714	over-activity	1
2715	wandering	1
2716	inertia	1
2717	passivity	1
2718	negative dengue serology	1
2719	isolation of dengue from blood	1
2720	hemorrhagic manifestations	1
2721	isolation of dengue from leukocytes	1
2722	negative dengue naat	1
2723	negative dengue pcr	1
2724	isolation of dengue from serum	1
2725	centrifugal rash	1
2726	positive dengue elisa	1
2727	>4-fold change in reciprocal igg or igm antibody titers to dengue virus antigen	1
2728	macular rash	1
2729	positive dengue pcr	1
2730	positive dengue serology	1
2731	positive dengue naat	1
2732	negative dengue elisa	1
2733	mucosal bleeding	1
2734	>20% drop in hct after volume replacement treatment	1
2735	>20% rise in hct for age and sex	1
2736	decreased total protein	1
2737	gi bleed	1
2738	injection site bleeding	1
2739	<20% rise in hct for age and sex	1
2740	<20% drop in hct after volume replacement treatment	1
2741	pulse pressure <=20 mmhg	1
2742	cold, clammy skin	1
2743	rapid and weak pulse	1
2744	hypotension for age	1
2745	history of ingestion	1
2746	chronic papulovesicular eruptions on extensor surfaces	1
2747	intensely itchy rash	1
2748	papulovesicular rash	1
2749	pruritic lesions of hair	1
2750	high ambient humidity	1
2751	negative fungal culture of hair	1
2752	negative fungal microscopy of nails	1
2753	scaling lesions of skin	1
2754	scaling lesions of hair	1
2755	discolored lesions of skin	1
2756	positive fungal culture of hair	1
2757	positive fungal microscopy of hair	1
2758	negative fungal culture of skin	1
2759	discolored lesions of hair	1
2760	positive fungal microscopy of nails	1
2761	negative fungal microscopy of hair	1
2762	pruritic lesions of nails	1
2763	positive fungal microscopy of skin	1
2764	scaling lesions of nails	1
2765	low ambient humidity	1
2766	positive fungal culture of nails	1
2767	negative fungal naat	1
2768	negative fungal culture of nails	1
2769	inflammation	1
2770	pruritic lesions of skin	1
2771	discolored lesions of nails	1
2772	negative fungal microscopy of skin	1
2773	positive fungal naat	1
2774	positive fungal culture of skin	1
2775	impact trauma	1
2776	facial trauma	1
2777	nasal trauma	1
2778	sinus infections	1
2779	obstructive sleep apnea	1
2780	snoring	1
2781	repetitive sneezing	1
2782	ventricular apex at right midclavicular line	1
2783	negative p waves	1
2784	situs inversus	1
2785	kartagener syndrome	1
2786	primary polydipsia	1
2787	low urine osmolarity	1
2788	dilute urine	1
2789	extreme thirst	1
2790	response to desmopressin	1
2791	positive fluid deprivation test	1
2792	diabetic ketoacidosis	1
2793	fruity breath	1
2794	kussmaul breathing	1
2795	elevated blood sugar	1
2796	increased hunger	1
2797	polyphagia	1
2798	hyperosmolar nonketotic state	1
2799	smell of acetone on breath	1
2800	glycosuria	1
2801	response to insulin	1
2802	severe obesity	1
2803	history of gestational diabetes	1
2804	pcos	1
2805	polycystic ovarian syndrome	1
2806	family history of dm ii	1
2807	involves joints of foot	1
2808	involves ankle joint	1
2809	involves feet or ankles	1
2810	tarsus	1
2811	tarsometatarsal involvement	1
2812	metatarsophalangeal involvement	1
2813	 diabetes mellitus	1
2814	history of minor trauma	1
2815	collapse of arch of midfoot	1
2816	peculiar bony prominences	1
2817	cataract	1
2818	glared vision	1
2819	onset begins distally and spreads proximally	1
2820	stocking and glove distribution of sensory neuropathy	1
2821	blurry vision	1
2822	two spinal cords in two separate spinal canals	1
2823	ingestion of raw liver of grazing mammals	1
2824	liver abscesses	1
2825	upper abdominal pain	1
2826	trophozoites in stool	1
2827	enterobiasis infection	1
2828	positive dientamoeba naat	1
2829	negative dientamoeba naat	1
2830	acute symmetrical induration of the skin	1
2831	inflammatory arthritis	1
2832	orange peel like texture of the skin	1
2833	history of severe trauma with a shearing mechanism	1
2834	multiple small lesions within white matter tracts on imaging	1
2835	profound coma without elevated intracranial pressure	1
2836	injury involving gray-white junction	1
2837	multiple cystic masses in breasts	1
2838	fever, weight loss, night sweats	1
2839	increased ldh	1
2840	median age at presentation of 64	1
2841	rapidly enlarging symptomatic mass	1
2842	serum ldh elevation	1
2843	extranodal extramedullary disease	1
2844	aids defining malignancy	1
2845	nodal enlargement in the neck or abdomen	1
2846	stomach, gi tract involvement	1
2847	skin thickening and hardening	1
2848	digital ulcers	1
2849	gastrointestinal involvement	1
2850	pulmonary fibrosis	1
2851	microalbuminuria	1
2852	absent thymus	1
2853	increased infections	1
2854	hypothyroidism	1
2855	learning disability	1
2856	low parathyroid hormone	1
2857	pain with exercise	1
2858	faintness	1
2859	pedal edema	1
2860	dermatomyositis	1
2861	sarcoidosis	1
2862	hypothyroid	1
2863	hyperthyroid	1
2864	adherent membranes on pharynx	1
2865	unvaccinated	1
2866	adherent membranes on nose	1
2867	foul-smelling blood stained nasal discharge	1
2868	<4-fold rise in diphtheria antibody (prior to diphtheria toxoid or antitoxin administration)	1
2869	nerve palsies	1
2870	negative diphtheria culture	1
2871	positive diphtheria culture	1
2872	painful swallowing	1
2873	>4-fold rise in diphtheria antibody (after diphtheria toxoid or antitoxin administration)	1
2874	>4-fold rise in diphtheria antibody (prior to diphtheria toxoid or antitoxin administration)	1
2875	bluish skin coloration	1
2876	laryngitis	1
2877	wrist drop	1
2878	rapid breathy	1
2879	<4-fold rise in diphtheria antibody (after diphtheria toxoid or antitoxin administration)	1
2880	adherent membranes on tonsils	1
2881	punched-out skin ulcer with dirty gray membrane at margins	1
2882	petechial hemorrhages	1
2883	cervical (neck) edema	1
2884	bull neck	1
2885	uvular edema	1
2886	positive proglottids in feces	1
2887	positive ova in feces	1
2888	maggots in diapers	1
2889	maggots on perianal region	1
2890	larvae in feces	1
2891	larvae in diapers	1
2892	maggots in feces	1
2893	maggots on furniture	1
2894	proglottids on furniture	1
2895	proglottids in diapers	1
2896	larvae on perianal region	1
2897	proglottids on perianal region	1
2898	maggots on floor covering	1
2899	restless child	1
2900	larvae on furniture	1
2901	proglottids on floor covering	1
2902	larvae on floor covering	1
2903	negative dirofilaria serology	1
2904	0.5-1.5cm skin nodule	1
2905	parasite visualized in lung biopsy	1
2906	positive dirofilaria serology	1
2907	solitary pulmonary coin lesion on cxr	1
2908	spinal pain	1
2909	erythematous papule	1
2910	erythematous plaque	1
2911	scale	1
2912	hypopigmented center	1
2913	hyperpigmented border	1
2914	scarring	1
2915	scalp lesion	1
2916	conchal bowl lesion	1
2917	fall on outstretched hand	1
2918	tender joint	1
2919	swollen joint	1
2920	ankle edema	1
2921	ankle joint deformity	1
2922	joint tenderness	1
2923	knee pain	1
2924	pain with flexion/extension	1
2925	history of marfan syndrome, homocystinuria, sulfite oxidase deficiency, or weill-marchesani syndrome	1
2926	visible with slit lamp examination	1
2927	acute low back pain	1
2928	neurologic signs and symptoms	1
2929	anterior knee pain	1
2930	pain with flexion	1
2931	pain in the elbow	1
2932	pain with arm flexion/extension	1
2933	injury mechanism involves pulling on the arm	1
2934	hip pain	1
2935	pelvic trauma	1
2936	pain with ambulation	1
2937	pain with palpation over joint	1
2938	deformation of nose	1
2939	nose pain	1
2940	fracture	1
2941	traumatic mechanism	1
2942	axillary nerve dysfunction in anterior dislocation	1
2943	blow to abducted, externally rotated, and extended arm	1
2944	seizure causing posterior dislocation	1
2945	blow to anterior shoulder	1
2946	holding arm in adduction and internal rotation with inability to externally rotate	1
2947	holding arm slightly abducted and externally rotated in anterior dislocation	1
2948	pain with movement	1
2949	direct, high velocity blow to medial clavicle	1
2950	medial compression of shoulder girdle	1
2951	anterior dislocation	1
2952	posterior dislocation	1
2953	acute back pain	1
2954	pain to palpation of vertebral body	1
2955	history of transplant	1
2956	chronic illness	1
2957	indolent, verrucous or ulcerated dermal lesion	1
2958	microcephaly	1
2959	intrauterine growth restriction	1
2960	hearing deficit	1
2961	history of travel to southwestern united states	1
2962	history of travel to central or south america	1
2963	contact with soil	1
2964	painful and swollen joints	1
2965	painful vesicles	1
2966	herpes whitlow	1
2967	genital lesions	1
2968	oral lesions	1
2969	positive histoplasma urine antigen	1
2970	visual changes	1
2971	response to antifungals	1
2972	easy clotting	1
2973	blood clots	1
2974	asphyxia	1
2975	sepsis	1
2976	respiratory distress syndrome	1
2977	hypothermia	1
2978	hematoma	1
2979	history of burn	1
2980	history of deferoxamine	1
2981	nasal ulceration	1
2982	facial swelling	1
2983	history of transplantation	1
2984	south and central america	1
2985	emphysematous changes	1
2986	mucous membrane involvement	1
2987	dysphagia, dysphonia, stridor	1
2988	nasal and pharyngeal ulcers	1
2989	crusted papules, ulcers, nodules, plaques, and verrucous lesions on skin	1
2990	adrenal gland involvement	1
2991	adrenal insufficiency	1
2992	ulcerative mucous lesions with small, hemorrhagic crusts involving gingiva, palate, buccal mucosa, and tongue	1
2993	exposure to fungus	1
2994	potential involvement of the pericardium, eye, perirectal tissues, larynx, breast, epididymis, spleen, liver, bone marrow, or lymph nodes	1
2995	recent travel to southeast asia or latin america	1
2996	small bowel obstruction	1
2997	profuse, watery, and mucoid diarrhea	1
2998	malabsorption of fat and protein	1
2999	larva currens	1
3000	purpuric periumbilical skin lesions	1
3001	granulomatous hepatitis	1
3002	multiple vesicular skin lesions in generalized distribution that does not follow one dermatome	1
3003	visceral involvement	1
3004	a callous unconcern for the feelings of others	1
3005	a gross and persistent attitude of irresponsibility and disregard for social norms, rules and obligations	1
3006	an incapacity to maintain enduring relationships, though having no difficulty in establishing them	1
3007	a very low tolerance to frustration and a low threshold for discharge of aggression, including violence	1
3008	an incapacity to experience guilt or to profit from experience, particularly punishment	1
3009	a marked proneness to blame others, or to offer plausible rationalizations, for the behavior that has brought the patient into conflict with society	1
3010	individual with a functional neurologic symptom disorder that are inconsistent with a known neurologic disease but causes distress and or impairment to the individual	1
3011	a large group of memories become unavailable, usually relating to autobiographical information	1
3012	loss of some sort of sensation in all or part of the body	1
3013	usually occur in front of a witness	1
3014	do not occur during sleep	1
3015	absent postictal confusion	1
3016	long duration of episode	1
3017	sudden unexpected travel or wandering in a dissociated state with subsequent amnesia of the episode	1
3018	hoover's sign	1
3019	absence of neurologic deficit	1
3020	nonresponsive	1
3021	history of stress	1
3022	impairment of voluntary movement	1
3023	left lower quadrant pain	1
3024	trisomy 21	1
3025	flattened face	1
3026	small nose	1
3027	depressed nasal bridge	1
3028	prominent tongue	1
3029	high-arched palate	1
3030	broad neck	1
3031	broad hands	1
3032	simian palmar crease	1
3033	hypotonia	1
3034	congenital heart defects	1
3035	short limbs	1
3036	short fifth middle phalanx	1
3037	mental retardation	1
3038	seizure disorder	1
3039	sloping forehead	1
3040	absent sinuses	1
3041	up-slanting palpebral fissure	1
3042	internipple distance decreased	1
3043	ventricular septal defect	1
3044	duodenal atresia	1
3045	hirschsprung	1
3046	celiac disease	1
3047	bilious vomiting	1
3048	double-bubble sign	1
3049	nonbilious vomiting	1
3050	scaphoid abdomen	1
3051	epigastric fullness	1
3052	papule on lower leg	1
3053	pain and burning of lower leg	1
3054	calcified worm on x-ray of lower leg	1
3055	bulla on lower leg	1
3056	rupture of blister on placement in water	1
3057	ulcer on lower leg	1
3058	ruptured bulla on lower leg	1
3059	blister on lower leg	1
3060	worm in discharge from lower leg blister	1
3061	ruptured papule on lower leg	1
3062	swelling of lower leg	1
3063	pericardial friction rub	1
3064	recent acute myocardial infarction	1
3065	atypical lymphocytes	1
3066	elevated transaminases	1
3067	well appearing	1
3068	intolerance of sunlight	1
3069	history of photosensitizing medication	1
3070	history of substance abuse	1
3071	history of drug use	1
3072	nocturia	1
3073	delay of days to weeks	1
3074	history of drug exposure	1
3075	ace inhibitors	1
3076	statins	1
3077	oral contraceptive	1
3078	diuretics	1
3079	furosemide	1
3080	thiazide	1
3081	haart	1
3082	valproic acid	1
3083	improvement with supine position	1
3084	sudden withdrawal of exogenous steroids	1
3085	fatigability	1
3086	psychiatric symptoms	1
3087	hair loss	1
3088	exogenous androgen use	1
3089	use of chloramphenicol, carbamazepine, felbamate, phenytoin, quinine, or phenylbutazone	1
3090	cefotetan	1
3091	ceftriaxone	1
3092	piperacillin	1
3093	nsaids	1
3094	quinine	1
3095	positive direct antiglobulin (coombs) test	1
3096	spherocytes on rbc smear	1
3097	painless, progressive decrease in visual acuity	1
3098	myopic shift occurring before general decrease in visual acuity	1
3099	rhythmic, dancing like motions due to adverse effect of medication	1
3100	dopamine manipulating medication	1
3101	anticonvulsants	1
3102	calcium channel blockers	1
3103	cns stimulants	1
3104	history of exogenous glucocorticoid intake	1
3105	menstrual irregularity	1
3106	sustained or intermittent muscle contractions causing abnormal movements or postures	1
3107	dopamine agonists	1
3108	levodopa	1
3109	neuroleptics	1
3110	fever associated with start of drug, ending with discontinuation of drug	1
3111	proton pump inhibitors	1
3112	histamine 2 receptor antagonists	1
3113	metformin	1
3114	nitrous oxide exposure	1
3115	alcohol	1
3116	diuretic	1
3117	salicylates	1
3118	warm joint	1
3119	metatarsal-phalangeal involvement	1
3120	overnight onset	1
3121	opiate	1
3122	triptan	1
3123	ergotamine	1
3124	nsaid	1
3125	chronic use of headache medication	1
3126	migraine	1
3127	painkiller use	1
3128	daily headache	1
3129	hunger	1
3130	nightmares	1
3131	shakiness	1
3132	antihyperglycemic use	1
3133	decreased libido	1
3134	loss of sexual function	1
3135	decreased muscle mass	1
3136	impaired attention	1
3137	impaired memory	1
3138	delayed puberty	1
3139	hyperpigmentation of skin	1
3140	cold intolerance	1
3141	inability to breastfeed	1
3142	interferon	1
3143	antineoplastic drug	1
3144	antibiotic use	1
3145	chemotherapeutic use	1
3146	antiarrhythmic use	1
3147	statin use	1
3148	increased muscle enzyme levels	1
3149	corticosteroid use	1
3150	d-penicillamine use	1
3151	beta-blocker use	1
3152	clofibrate use	1
3153	cyclosporine use	1
3154	cimetidine use	1
3155	zidovudine use	1
3156	l-tryptophan use	1
3157	colchicine use	1
3158	chloroquine use	1
3159	enzyme deficiency	1
3160	g6pd deficiency	1
3161	antimalarial exposure	1
3162	dapsone exposure	1
3163	sulfasalazine exposure	1
3164	primaquine exposure	1
3165	tricyclic antidepressant use	1
3166	antipsychotic use	1
3167	lithium use	1
3168	valproate use	1
3169	glucocorticoid use	1
3170	aromatase inhibitor use	1
3171	gnrh agonist use	1
3172	depot medroxyprogesterone acetate contraceptive use	1
3173	thyroid replacement therapy	1
3174	chemotherapy history	1
3175	history of breast cancer	1
3176	anticonvulsant use	1
3177	ssri use	1
3178	ppi use	1
3179	h2 antagonist use	1
3180	thiazolidinedione use	1
3181	rosiglitazone use	1
3182	pioglitazone use	1
3183	point tenderness	1
3184	penicillamine	1
3185	captopril	1
3186	other known associations include penicillins, cephalosporins, enalapril, rifampin, nsaids	1
3187	chemotherapeutic agents including taxol, cisplatin, and vincristine	1
3188	amitriptyline, chloramphenicol, colchicine, ethambutol, nitrous oxide, perhexiline maleate, sodium cyanate, thalidomide, or l-tryptophan	1
3189	abrupt onset	1
3190	discoid rash rare	1
3191	anti-dsdna negative	1
3192	anti-smith negative	1
3193	anti-histone antibodies positive	1
3194	procainamide	1
3195	hydralazine	1
3196	anti-tnf	1
3197	minocycline	1
3198	interferon-alpha	1
3199	interleukin-2	1
3200	lithium	1
3201	tyrosine kinase inhibitors	1
3202	use of stimulant medications	1
3203	terbutaline	1
3204	isoproterenol	1
3205	epinephrine	1
3206	amphetamines	1
3207	ssris	1
3208	tricyclic antidepressants	1
3209	nicotine	1
3210	xanthines	1
3211	tarry stool	1
3212	acute peritonitis	1
3213	black stool	1
3214	abdominal pain relieved by food	1
3215	waterbrash	1
3216	nsaid use	1
3217	h. pylori infection	1
3218	vesicular eruption on palms or soles	1
3219	history of recurrence	1
3220	deep seated vesicles	1
3221	pain with sexual intercourse	1
3222	abdominal tenderness to palpation	1
3223	hyperacusis	1
3224	restlessness	1
3225	excitement	1
3226	arm weakness	1
3227	leg weakness	1
3228	xerostomia (dry mouth)	1
3229	difficulty standing up	1
3230	difficulty climbing stairs	1
3231	hypohidrosis	1
3232	blackouts	1
3233	sluggish pupils	1
3234	hematomas	1
3235	bleeding from mucous membranes	1
3236	hypovolemia	1
3237	agitation	1
3238	equatorial africa	1
3239	uganda	1
3240	zaire	1
3241	worsening of cyanosis in adult life	1
3242	right heart failure	1
3243	sudden cardiac death	1
3244	maternal ingestion of lithium in first trimester, maternal benzodiazepine use, maternal exposure to varnishing substances	1
3245	precordial asymmetry	1
3246	first heart sound widely split with enhanced tricuspid component	1
3247	s3 or s4	1
3248	cyst in spleen	1
3249	cyst in brain	1
3250	positive echinococcus serology	1
3251	cyst in bone	1
3252	non-calcified cyst on x-ray	1
3253	cyst in parapharyngeal space	1
3254	cyst in thyroid	1
3255	cyst in joint	1
3256	cyst in paranasal sinus	1
3257	cyst in muscle	1
3258	cyst in lung	1
3259	non-calcified cyst on us	1
3260	negative echinococcus serology	1
3261	calcified hepatic cyst on x-ray	1
3262	pancreatitis	1
3263	palpable mass in ruq	1
3264	cyst on cxr	1
3265	placental abruption	1
3266	fetal distress	1
3267	orthostatic changes	1
3268	abdominal tenderness	1
3269	mild uterine enlargement	1
3270	adnexal mass	1
3271	eyelid laxity	1
3272	numerous umbilicated vesicles superimposed on healing atopic dermatitis	1
3273	history of skin damage	1
3274	holoprosencephaly	1
3275	meningomyelocele	1
3276	rocker-bottom feet	1
3277	omphalocele	1
3278	dextrocardia	1
3279	atrial septal defect	1
3280	esophageal atresia	1
3281	micrognathia	1
3282	cleft lip	1
3283	cleft palate	1
3284	narrowed palpebral fissures	1
3285	widely-splace eyes	1
3286	absent radius	1
3287	webbed toes	1
3288	gastroenteritis	1
3289	gram negative bacillus	1
3290	septic arthritis	1
3291	hypermobile joints	1
3292	skin hyperelasticity	1
3293	raynaud's	1
3294	boutonniere deformity	1
3295	unstable joints	1
3296	hiatal hernia	1
3297	opportunistic infections	1
3298	7 day incubation period	1
3299	candidiasis	1
3300	ards	1
3301	serpiginous	1
3302	confined area	1
3303	d-penicillamine	1
3304	shyness	1
3305	social anxiety	1
3306	capable of speech	1
3307	poor eye contact	1
3308	blank expression	1
3309	difficulty expressing feelings	1
3310	sensitivity to noise and crowds	1
3311	increased respiratory infections	1
3312	caribbean	1
3313	negative rpr	1
3314	condyloma lata	1
3315	negative direct fluorescent antibody testing	1
3316	painless ulcer on oral mucosa	1
3317	oral mucous patches	1
3318	spirochetes on darkfield microscopy	1
3319	positive fta-abs	1
3320	positive vdrl	1
3321	shared utensils	1
3322	positive rpr	1
3323	positive direct fluorescent antibody testing	1
3324	negative vdrl	1
3325	negative fta-abs	1
3326	hec syndrome	1
3327	restrictive cardiomyopathy	1
3328	thickening of endocardium	1
3329	bowel obstruction	1
3330	recurring pelvic pain	1
3331	pelvic cramping	1
3332	dysmenorrhea	1
3333	painful menses	1
3334	painful sex	1
3335	chronic fatigue	1
3336	pulmonary disease	1
3337	reduced ventricular size	1
3338	south america	1
3339	thromboembolic disease	1
3340	cardiomyopathy	1
3341	extraocular palsy	1
3342	eye trauma	1
3343	pus in eye	1
3344	swollen conjunctiva	1
3345	history of ocular surgery	1
3346	visual loss	1
3347	eye pain and irritation	1
3348	injected eye	1
3349	pork exposure (undercooked)	1
3350	negative e. coli stool culture	1
3351	positive e. coli stool culture	1
3352	pruritus of hands and/or feet with sudden onset of vesicles	1
3353	increased perspiration of palms and soles	1
3354	symmetric and deep seated vesicles present on lateral aspects of the fingers	1
3355	hand involvement only	1
3356	hand and foot involvement	1
3357	vaginitis	1
3358	positive scotch tape test	1
3359	anal "tingling"	1
3360	nocturnal anal pruritus	1
3361	hospitalization	1
3362	recent hospitalization	1
3363	toxic megacolon	1
3364	chemotherapy	1
3365	onset within 3 to 4 days of exposure	1
3366	hemorrhagic colitis	1
3367	hemolytic-uremic syndrome	1
3368	absence of fever	1
3369	watery, non-bloody diarrhea	1
3370	association with diarrhea outbreaks	1
3371	adenopathy	1
3372	abnormal downward displacement of the abdominal contents	1
3373	focal neurologic abnormalities	1
3374	altered personality	1
3375	fever lasting 24 to 36 hours	1
3376	salmon pink macules and papules developing on face and upper chest	1
3377	negative enterovirus serology	1
3378	blisters in mouth	1
3379	herpangina	1
3380	positive enterovirus serology	1
3381	positive enterovirus naat	1
3382	negative enterovirus naat	1
3383	complete nail shedding	1
3384	inward rolling of the eyelid	1
3385	ingrown eyelashes	1
3386	fever in newborn not due to intrinsic pathologic condition	1
3387	skin plaques	1
3388	new medication	1
3389	parasitic infection	1
3390	traumatic birth	1
3391	natural disaster	1
3392	louse bite	1
3393	sustained high fever	1
3394	chest rash spreads to extremities	1
3395	coxsackie b	1
3396	tender	1
3397	labial cyst	1
3398	trigeminal neuralgia	1
3399	skin mass	1
3400	central punctum	1
3401	firm nodule	1
3402	skin blisters	1
3403	history of iv drug use	1
3404	ring-enhancing lesion on brain imaging	1
3405	focal seizures	1
3406	rapid neurologic deterioration	1
3407	focal vertebral pain	1
3408	radicular pain	1
3409	radiculopathy	1
3410	ring-enhancing lesion on spinal imaging	1
3411	flaccid hyporeflexia	1
3412	brain shift	1
3413	asymmetric pupil	1
3414	increased intracranial pressure	1
3415	abnormal pupillary reflex	1
3416	fixed dilated pupil	1
3417	excessive tearing	1
3418	trichiasis	1
3419	entropion	1
3420	acute onset	1
3421	eye watering	1
3422	hemorrhage from nose	1
3423	weakness of deltoid and infraspinatus muscle	1
3424	upper arm adduction and internally rotated	1
3425	forearm extension	1
3426	flaccid bullae	1
3427	lesion with well-defined area of induration	1
3428	fiery-red superficial facial swelling	1
3429	fiery-red superficial extremity swelling	1
3430	desquamation of lesion	1
3431	intense pain around indurated lesion	1
3432	contact with raw animal products	1
3433	contact with raw fish products	1
3434	positive erysipelothrix culture	1
3435	pain and swelling in hands or fingers	1
3436	negative erysipelothrix culture	1
3437	annular erythema on hands or fingers	1
3438	target lesion on hands or fingers	1
3439	gram positive coccus	1
3440	erysipeloid rash	1
3441	butcher	1
3442	erythematous dermatitis resulting from exposure to heat	1
3443	trailing scale	1
3444	violaceous papules and nodules over the dorsal hands or extensor surfaces	1
3445	small vessel vasculitis	1
3446	abnormal flushing/ red color of tissue	1
3447	slapped cheek rash with circumoral pallor	1
3448	inflammatory condition of intertriginous areas	1
3449	facial sparing	1
3450	rheumatic fever	1
3451	ringed rash	1
3452	rash on trunks and inner surface of limbs	1
3453	subcutaneous nodules	1
3454	target lesions	1
3455	herpes simplex	1
3456	epstein-barr virus (ebv)	1
3457	histoplasmosis	1
3458	raised edematous papules	1
3459	acral distribution	1
3460	aching	1
3461	red, tender nodules	1
3462	tense, hard painful lesions	1
3463	fluctuant lesions	1
3464	anterior leg	1
3465	lesion color change from red to blue	1
3466	pruritic patch in groin	1
3467	red fluorescence on wood's lamp examination	1
3468	diabetic	1
3469	pruritic patch in axilla	1
3470	slowly spreading red-brown pruritic patches	1
3471	hemolysis	1
3472	solid food dysphagia	1
3473	location in anterior postcricoid area of proximal esophagus	1
3474	association with plummer-vinson syndrome	1
3475	no evidence of chronic myeloid leukemia	1
3476	bleeding from gums	1
3477	normal hematocrit	1
3478	no evidence of myelofibrosis	1
3479	no evidence of myelodysplastic syndrome	1
3480	no evidence of polycythemia vera	1
3481	throbbing and burning of the hands and feet	1
3482	thrombocytosis	1
3483	acquired v617f jak2 mutation present	1
3484	tingling in the hands	1
3485	elevated blood pressure	1
3486	low-fat diet	1
3487	xeroderma	1
3488	shaky hands	1
3489	lack of tremor at rest	1
3490	tremor worsened by stress	1
3491	rhythmic tremor (4-12 hz)	1
3492	tremor with use	1
3493	international travel	1
3494	walking barefoot	1
3495	agricultural work	1
3496	tumefaction	1
3497	draining sinuses	1
3498	granules	1
3499	painless swelling	1
3500	history of uri	1
3501	allergic rhinitis	1
3502	underlying systemic illness	1
3503	recurrent infection	1
3504	skin erythema	1
3505	skin tightness	1
3506	dermatopathic lymphadenitis	1
3507	hyperpigmentation	1
3508	hypopigmentation	1
3509	widespread rash	1
3510	pain at site of involvement	1
3511	compression fracture	1
3512	nerve compression	1
3513	stomach involvement	1
3514	psychiatric history	1
3515	contractions	1
3516	hypomagnesemia	1
3517	renal osteodystrophy	1
3518	calcific masses on bone imaging	1
3519	hemochromatosis	1
3520	hyperparathyroidism	1
3521	calcium pyrophosphate dihydrate disease	1
3522	hypophosphatemia	1
3523	delayed walking	1
3524	breech presentation	1
3525	absence of overflow tears with emotional crying after age 7 months	1
3526	no fungiform papillae on tongue	1
3527	corneal abrasion	1
3528	red blotching of skin	1
3529	ashkenazi jewish descent	1
3530	red puffy hands	1
3531	bilateral eye irritation	1
3532	delayed speech	1
3533	unsteady gait	1
3534	misdirected swallowing	1
3535	erratic blood pressure	1
3536	dysautonomia crisis	1
3537	weak or absent sucking and poor tone	1
3538	spinal curvature	1
3539	elevated hemoglobin and hematocrit	1
3540	positive metaraminol provocative test	1
3541	mefv gene mutation	1
3542	history of laparotomy	1
3543	scrotal pain	1
3544	reported exposure to ticks	1
3545	hay exposure	1
3546	hypersensitivity pneumonitis	1
3547	mold exposure	1
3548	farmer	1
3549	type iii hypersensitivity	1
3550	negative fasciola serology	1
3551	positive fasciola serology	1
3552	positive fasciola ova in stool	1
3553	negative fasciola ova in stool	1
3554	cholangitis	1
3555	closed fracture	1
3556	fat embolism syndrome	1
3557	distal necrosis	1
3558	low platelets	1
3559	tender papules	1
3560	tender plaques	1
3561	erythematous papules	1
3562	neutrophilic infiltrate on pathology	1
3563	leukemia	1
3564	iridocyclitis	1
3565	inflammatory bowel disease	1
3566	persistent widespread pain, on both sides of the body, above and below the waist, including the axial spine	1
3567	stiffness	1
3568	cognitive difficulties	1
3569	positive microfilaria naat	1
3570	progressive edema	1
3571	epididymitis	1
3572	persistent lymphadenopathy	1
3573	episodic fever	1
3574	microfilaria in nocturnal blood sample	1
3575	pretibial pitting edema	1
3576	negative microfilaria naat	1
3577	positive microfilaria serology	1
3578	episodic lymphangitis	1
3579	microscopic hematuria	1
3580	nonpitting edema involving entire leg	1
3581	funiculitis	1
3582	orchitis	1
3583	hydrocoele	1
3584	lymphadenitis	1
3585	negative microfilaria serology	1
3586	history of travel to china, india, malaysia, the philippines, indonesia, or various pacific islands	1
3587	acute adenolymphangitis	1
3588	painful lymphadenopathy	1
3589	retrograde lymphangitis	1
3590	nocturnal wheezing	1
3591	history of traveling to the timor island of indonesia	1
3592	severe blunt trauma to chest	1
3593	paradoxical segment of chest wall motion	1
3594	3 broken ribs in 2 or more places	1
3595	decreased tidal volume	1
3596	respiratory insufficiency	1
3597	unstable joint	1
3598	hypermobile joint	1
3599	prior foot trauma	1
3600	metabolic syndrome	1
3601	loss of lumbar lordosis	1
3602	muscle fatigue	1
3603	degenerative disc disease	1
3604	lumbar post laminectomy syndrome	1
3605	compression fractures	1
3606	ankylosing spondylitis	1
3607	history of flax inhalation	1
3608	copd	1
3609	byssinosis	1
3610	flexion contracture	1
3611	inability to fully extend joint	1
3612	tendinitis	1
3613	trigger finger	1
3614	stenosing tenosynovitis	1
3615	hand affected	1
3616	"stuck" finger	1
3617	pain with passive extension of digit	1
3618	poor diet	1
3619	pregnancy	1
3620	sore mouth and tongue	1
3621	non-hodgkin lymphoma (subtype)	1
3622	cysts in axille	1
3623	sebaceous cysts	1
3624	pustules	1
3625	erosions	1
3626	crusts	1
3627	scales	1
3628	atrophic macules appearing on the face	1
3629	compensatory head tilt	1
3630	failure to abduct affected eye	1
3631	pain in wrist/hand	1
3632	history of fall	1
3633	pain at base of skull	1
3634	intraoperative event	1
3635	fracture associated with less significant mechanism of injury than expected in a healthy patient	1
3636	signs/symptoms/diagnosis of neoplastic disorder	1
3637	history of a fall or a jump from height	1
3638	severe pain	1
3639	pain with weight bearing	1
3640	middle third of bone	1
3641	distal third of bone	1
3642	proximal third of bone	1
3643	history of falling onto the shoulder	1
3644	direct blow to clavicle	1
3645	pain exacerbated by movement of arm	1
3646	point tenderness to site	1
3647	neonate	1
3648	pain with flexion and extension	1
3649	unstable wrist	1
3650	fall onto outstretched hand (foosh)	1
3651	neurologic symptoms	1
3652	history of traumatic impact to eye	1
3653	enophthalmos	1
3654	orbital dystopia	1
3655	injury to infraorbital nerve	1
3656	history of severe trauma	1
3657	associated rib fracture	1
3658	associated pulmonary contusion	1
3659	associated head injury	1
3660	hyperextension injury	1
3661	direct trauma to head	1
3662	associated laceration to scalp	1
3663	long narrow face with prognathism	1
3664	large ears	1
3665	testicular enlargement	1
3666	strabismus	1
3667	arched palate	1
3668	joint hyperlaxity	1
3669	developmental delay	1
3670	adhd like behavior	1
3671	exposure to severe cold	1
3672	insensate area	1
3673	discoloration	1
3674	eschar	1
3675	recurrent passage of loose stools without abdominal pain or discomfort	1
3676	breast milk production without pregnancy	1
3677	decreased bowel sounds	1
3678	hand cyst	1
3679	hand involvement	1
3680	wrist involvement	1
3681	pliable cyst	1
3682	pain out of proportion	1
3683	edema bule	1
3684	extreme tenderness	1
3685	profuse serous drainage	1
3686	crepitant tissue	1
3687	abdominal pain worsened by eating	1
3688	vomiting of blood	1
3689	portal hypertension	1
3690	cirrhosis	1
3691	rectal bleeding	1
3692	splenic vein thrombosis	1
3693	pain changes with eating	1
3694	aspirin use	1
3695	eating disorder	1
3696	nsaid abuse	1
3697	asthma	1
3698	dentine hypersensitivity	1
3699	burping	1
3700	throat clearing	1
3701	regurgitation	1
3702	erosion of dental enamel	1
3703	barrett's esophagus	1
3704	febrile seizure	1
3705	positive norwalk serology	1
3706	positive norwalk naat	1
3707	necrotizing enterocolitis in newborn	1
3708	watery stools	1
3709	negative norwalk naat	1
3710	negative norwalk antigen in stool	1
3711	positive norwalk antigen in stool	1
3712	negative norwalk serology	1
3713	intestines outside of abdomen	1
3714	uncovered intestines	1
3715	startle easily	1
3716	muscle tension	1
3717	awareness of inappropriate anxiety	1
3718	waxing and waning lesions	1
3719	tongue erythema	1
3720	serpiginous border of tongue	1
3721	sensitivity to hot or spicy foods	1
3722	pulmonary infection	1
3723	organ transplant	1
3724	preeclampsia	1
3725	discrete flat-topped papules on buttocks	1
3726	discrete flat-topped papules on face	1
3727	inguinal lymphadenopathy	1
3728	spongiosis of upper epidermis and upper dermis on skin biopsy	1
3729	skin-colored	1
3730	anicteric hepatitis	1
3731	discrete flat-topped papules on extensor surfaces	1
3732	perivascular lymphocytic and histiocytic infiltrates on skin biopsy	1
3733	sudden loss of vision	1
3734	sudden onset of pain and stiffness in pelvic or shoulder muscles	1
3735	scalp tenderness	1
3736	tongue claudication	1
3737	jaw claudication	1
3738	tenderness over temporal artery	1
3739	jaw pain when chewing	1
3740	bruits	1
3741	positive temporal artery biopsy	1
3742	erythematous, annular or arciform plaque with central clearing	1
3743	growth in a centrifugal pattern	1
3744	negative giardia on stool microscopy	1
3745	foul-smelling diarrhea	1
3746	positive string test	1
3747	explosive diarrhea	1
3748	positive giardia naat	1
3749	bulky diarrhea	1
3750	iga deficiency	1
3751	negative giardia naat	1
3752	vitamin a deficiency	1
3753	positive giardia on stool microscopy	1
3754	septicemia	1
3755	central america	1
3756	lung nodules	1
3757	death	1
3758	mucosal ulcers	1
3759	exposure to animals	1
3760	burkholderia mallei	1
3761	history of travel to southeast asia and australia, or middle east, india, or china	1
3762	papular or pustular skin lesions	1
3763	disseminated pustular eruption in septicemia	1
3764	gradually progressive visual field loss	1
3765	increased intraocular pressure	1
3766	fixed, mid-dilated pupil	1
3767	acute angle closure crises	1
3768	visual halos	1
3769	sudden vision loss	1
3770	x-linked recessive	1
3771	heinz bodies (rbc inclusions on crystal violet)	1
3772	neonatal jaundice	1
3773	african american (in us)	1
3774	fava beans	1
3775	pain with palpation of gluteal tendon	1
3776	pain with extension of thigh	1
3777	erythematous tissue swelling	1
3778	pruritic tissue swelling	1
3779	ingestion of raw meat	1
3780	ingestion of raw fish	1
3781	csf eosinophilia	1
3782	painful tissue swelling	1
3783	migratory nodules in skin	1
3784	ingestion of raw poultry	1
3785	migratory nodules in eye	1
3786	ingestion of raw frog	1
3787	migratory nodules in soft tissues	1
3788	pleural fluid eosinophilia	1
3789	arthritis of the knee	1
3790	positive eia (female endocervical)	1
3791	chandeliers sign (cervical motion tenderness)	1
3792	conjunctivitis in infant	1
3793	gram negative diplococci absent (female endocervical)	1
3794	negative eia (male urethra)	1
3795	positive eia (male urethra)	1
3796	suppurative arthritis	1
3797	negative urine le	1
3798	painful genital pustules	1
3799	penile discharge	1
3800	positive urine le	1
3801	negative eia (female endocervical)	1
3802	urethral pain	1
3803	negative dna probe	1
3804	unilateral testicular swelling	1
3805	positive dna probe	1
3806	gram negative diplococci absent (male urethra)	1
3807	right sided endocarditis	1
3808	rectal discharge	1
3809	gram negative diplococci present (female endocervical)	1
3810	purulent and mildly odorous penile discharge	1
3811	double quotidian fever	1
3812	gram negative diplococci present (male urethra)	1
3813	men who have sex with men	1
3814	anorectal pain	1
3815	anorectal bleeding	1
3816	pathognomonic cutaneous feature of dermatomyositis	1
3817	raised, violaceous, scaly eruption on the knuckles	1
3818	painful big toe	1
3819	elevated uric acid	1
3820	fructose sweetened drinks	1
3821	meat ingestion	1
3822	red, tender, hot, swollen joint	1
3823	alcohol use	1
3824	tophi	1
3825	acute, severe pain and erythema of a joint	1
3826	single joint involvement	1
3827	negatively birefringent needle shaped crystals in synovial fluid	1
3828	spontaneous toe pain	1
3829	polyarticular arthritis	1
3830	gout attacks	1
3831	hot joint	1
3832	elbow lesion	1
3833	ear lesion	1
3834	lesch-nyhan	1
3835	hyperuricemia	1
3836	spasticity	1
3837	eyes roll back or close	1
3838	tongue lacerations	1
3839	lasting longer than 30 minutes	1
3840	more than one seizure within 30 minutes without returning to normal	1
3841	involving oral mucosa	1
3842	rash with reddish bumps arranged in a circle or ring	1
3843	cutaneous facial nodules	1
3844	sun-exposed skin distribution	1
3845	solitary	1
3846	painless ulcerating skin nodule on perineum or genitals	1
3847	lymphedema in perineum or genitals	1
3848	painless slowly expanding skin nodule on perineum or genitals	1
3849	gram negative bacillus on gram stain of scraping	1
3850	small painless papule on perineum or genitals	1
3851	small painless nodule on perineum or genitals	1
3852	pneumoconiosis	1
3853	exposure to graphite	1
3854	ascending paralysis	1
3855	recent illness	1
3856	tingling	1
3857	rubbery legs	1
3858	loss of proprioception	1
3859	albuminocytological dissociation	1
3860	acute polyneuropathy	1
3861	loss of position sense	1
3862	dysesthesias	1
3863	recent influenza infection	1
3864	progressive weakness	1
3865	recent infection	1
3866	influenza	1
3867	treponema pertenue infection	1
3868	raspberry-like pruritic skin eruption	1
3869	tropical infection	1
3870	red papule	1
3871	destruction of nose	1
3872	tibial periostitis	1
3873	mutilating facial ulcers	1
3874	recent bacterial infection	1
3875	eruptive psoriasis	1
3876	recent strep throat	1
3877	recent upper respiratory infection	1
3878	small lesions over upper trunk and extremities	1
3879	recent diarrheal infection	1
3880	microangiopathic hemolytic anemia	1
3881	chile	1
3882	sweaty palms	1
3883	argentina	1
3884	canada	1
3885	panama	1
3886	russia	1
3887	diuresis	1
3888	anal itching	1
3889	blood streaked stool	1
3890	blood on toilet paper	1
3891	nonpainful white plaque along lateral tongue borders	1
3892	unilateral or bilateral	1
3893	adherent lesions, with only superficial layer removed by scraping	1
3894	no associated erythema or edema of surrounding tissue	1
3895	infections	1
3896	hemorrhagic findings (gingival bleeding, ecchymoses, epistaxis)	1
3897	monocytopenia	1
3898	abnormal lfts	1
3899	hypergammaglobulinemia	1
3900	circulating hairy cells on peripheral blood films	1
3901	mutation in braf gene	1
3902	writhing movements	1
3903	toe walking	1
3904	dystonia	1
3905	retinitis pigmentosa	1
3906	four-corners region	1
3907	exposure to rodents	1
3908	southwest	1
3909	increased work of breathing	1
3910	gallop	1
3911	laterally displaced apex beat	1
3912	parasternal heave	1
3913	tibial edema	1
3914	crackles at the lung bases	1
3915	pulmonary effusion	1
3916	need to sleep on pillows	1
3917	postprandial retrosternal burning	1
3918	radiation to back, neck, jaw or arms	1
3919	pain lasting from minutes to hours	1
3920	spontaneous resolution	1
3921	relief with antacids	1
3922	gastroesophageal reflux (gerd)	1
3923	high blood pressure	1
3924	pre-eclampsia	1
3925	low platelet count	1
3926	blunt trauma	1
3927	penetrating trauma	1
3928	abnormal liver function tests	1
3929	hemophagocytosis	1
3930	elevated ferritin	1
3931	histiocytosis	1
3932	history of recent surgery	1
3933	diminished breath sounds unilaterally	1
3934	unilateral dull percussion	1
3935	oral-anal contact	1
3936	alt:ldh >9:1	1
3937	alt:ldh <9:1	1
3938	decreased albumin	1
3939	positive anti-hav igm	1
3940	positive anti-hav igg	1
3941	increased pt	1
3942	homosexual	1
3943	positive anti-hbc igg	1
3944	birth to hbv+ mother	1
3945	health worker	1
3946	positive hbsag	1
3947	needle-stick injury	1
3948	positive anti-hbc igm	1
3949	iv drug use	1
3950	sexual exposure to hbv+ person	1
3951	blood in ua	1
3952	glomerulonephritis	1
3953	alt>ast	1
3954	positive hbeag	1
3955	exposure to hb+ blood	1
3956	transfusion recipient	1
3957	birth to hcv+ mother	1
3958	sexual exposure to hcv+ person	1
3959	positive hcv riba (recombinant immunoblot assay)	1
3960	positive anti-hcv elisa	1
3961	tattoo	1
3962	positive hcv rna	1
3963	blistering rash on sun-exposed skin	1
3964	hemorrhoids	1
3965	positive anti-hdv	1
3966	hepatitis b infection	1
3967	positive anti-hev igg	1
3968	positive anti-hev igm	1
3969	positive anti-hgv igg	1
3970	positive anti-hgv igm	1
3971	anicteric	1
3972	elevated alpha fetoprotein (afp)	1
3973	history of hepatitis b	1
3974	history of hepatitis c	1
3975	anuria	1
3976	liver failure	1
3977	acute hepatitis	1
3978	systemic b symptoms (fever, night sweats, or weight loss)	1
3979	abnormal lft	1
3980	motor incoordination	1
3981	caused by inborn errors of metabolism	1
3982	progressive degenerative ataxia not due to inborn errors of metabolism	1
3983	motor incoordination due to cerebellar pathology	1
3984	presence of 15 to 100 percent elliptical rbc on peripheral smear	1
3985	photosensitivity	1
3986	red urine	1
3987	photo mutilation	1
3988	hypertrichosis	1
3989	onset varies from birth to age 40	1
3990	spontaneous bleeding	1
3991	postoperative bleeding	1
3992	recurrent hemorrhage	1
3993	increased cardiac output	1
3994	arteriovenous malformations	1
3995	humming noise on lung exam	1
3996	brain abscesses	1
3997	mouth bleeds	1
3998	hemothorax	1
3999	recurrent streptococcus pneumoniae infection	1
4000	recurrent haemophilus influenzae infection	1
4001	absent tonsils	1
4002	loud pulmonic heart sound	1
4003	tricuspid regurgitation murmur	1
4004	bronchiectasis	1
4005	tympanic membrane perforation	1
4006	family history of edema	1
4007	ringed sideroblasts in bone marrow	1
4008	anisocytosis	1
4009	poikilocytosis	1
4010	basophilic stippling	1
4011	target cells	1
4012	pappenheimer bodies	1
4013	microcytic anemia	1
4014	increased rdw	1
4015	gradual weakening of lower extremities	1
4016	urinary bladder disturbance	1
4017	peripheral neuropathy	1
4018	epilepsy	1
4019	deafness	1
4020	spherocytosis	1
4021	dermal vesicles	1
4022	negative herpes b culture	1
4023	monkey bite	1
4024	positive herpes b culture	1
4025	contact with monkey	1
4026	negative herpes b naat	1
4027	positive herpes b naat	1
4028	choreoathetosis	1
4029	negative csf viral culture	1
4030	positive herpes simplex naat	1
4031	loss of visual fields	1
4032	negative herpes simplex naat	1
4033	changes in sense of smell	1
4034	altered level of consciousness	1
4035	tender bilateral lymphadenopathy	1
4036	hyperesthesia preceding development of vesicles	1
4037	neuropathy preceding development of vesicles	1
4038	recurrent localized painful vesicles on an erythematous base	1
4039	positive herpes simplex culture	1
4040	negative herpes simplex culture	1
4041	ulcerative lesions on an erythematous base	1
4042	hepatic dysfunction	1
4043	vesicular lesions in a dermatomal distribution	1
4044	mild pruritus in dermatomal distribution	1
4045	positive varicella culture of vesicles	1
4046	negative varicella naat of vesicles	1
4047	pain in dermatomal distribution	1
4048	radiculitis	1
4049	negative varicella culture of vesicles	1
4050	positive varicella naat of vesicles	1
4051	stiff neck	1
4052	positive fluorescein stain	1
4053	dendritic ulcer	1
4054	corneal anesthesia	1
4055	painful	1
4056	vesicles	1
4057	triggered by stress, fever, or sunburn	1
4058	localized burning	1
4059	fever blister	1
4060	ulcerative lesions	1
4061	comedone-like follicular occlusion	1
4062	chronic relapsing inflammation	1
4063	mucopurulent discharge	1
4064	progressive scarring	1
4065	affects regions of apocrine glands	1
4066	axillary rash	1
4067	groin rash	1
4068	arthropathy	1
4069	delayed passage of meconium	1
4070	aml	1
4071	palpable mass lesion	1
4072	intestinal obstruction	1
4073	cytopenia	1
4074	mid-western united states	1
4075	3-17 day incubation period	1
4076	north america	1
4077	adrenal enlargement	1
4078	african histoplasmosis	1
4079	central or west africa or madagascar	3
4080	papular, nodular, ulcerative, eczematoid or psoriasiform skin lesions	1
4081	hyperpigmented halo around lesions	1
4082	multiple bone lesions	1
4083	miliary hepatic lesions	1
4084	miliary splenic lesions	1
4085	hilar opacities	1
4086	attention-seeking behavior	1
4087	inappropriately seductive behavior	1
4088	energetic	1
4089	dramatic	1
4090	flirtatious	1
4091	emotional lability	1
4092	suggestible	1
4093	positive hiv western blot	1
4094	positive hiv pcr	1
4095	rubber swollen lymph nodes	1
4096	pel-ebstein fever	1
4097	red patches on skin	1
4098	cyclical fever	1
4099	pain following alcohol consumption	1
4100	reed sternberg cells	1
4101	diffuse opacities on cxr	1
4102	transient cough	1
4103	ova present in stool	1
4104	iron-deficiency anemia	1
4105	pruritic papules on feet	1
4106	ova absent in stool	1
4107	vesicular rash on feet	1
4108	eosinophilia in sputum	1
4109	nodular lesion of the eyelid caused by infection	1
4110	apparent enophthalmos	1
4111	loss of ciliospinal reflex	1
4112	miosis	1
4113	bloodshot conjunctiva	1
4114	heterochromia	1
4115	age of onset usually in mid life	1
4116	bradykinesia, akinesia	1
4117	dysphoria	1
4118	paranoia	1
4119	dementia with executive dysfunction	1
4120	caudate atrophy on mri	1
4121	genetic testing positive for cag repeat expansion in the htt gene	1
4122	elevated human chorionic gonadotropin	1
4123	painless vaginal bleeding	1
4124	hyperthyroid symptoms	1
4125	bradycardia with systemic hypertension	1
4126	rodent infestation in environment	1
4127	behavioral disturbance in child	1
4128	pruritic anal area	1
4129	periodic fever	1
4130	recurrent bacterial infection	1
4131	recurrent sinopulmonary infections	1
4132	elevated serum ige	1
4133	low plasma renin activity and concentration	1
4134	skeletal muscle weakness	1
4135	severe bradycardia	1
4136	tall peaked t waves with short qt interval	1
4137	pr and qrs duration lengthening	1
4138	recurrent acute joint pain from sprains and ligament injuries	1
4139	recurrent joint subluxations or dislocations	1
4140	injuries secondary to poor proprioception	1
4141	marfanoid body habitus	1
4142	hyperextensible skin	1
4143	multiple stretch marks	1
4144	hernias	1
4145	bowel symptoms suggestive of irritable bowel syndrome	1
4146	chronic pain	1
4147	cardiovascular autonomic dysfunction	1
4148	orthostatic symptoms	1
4149	kidney stones	1
4150	osteomalacia	1
4151	increased platelet mass sequestered in spleen	1
4152	elevated tsh	1
4153	elevated t3	1
4154	elevated t4	1
4155	low tsh	1
4156	nervousness	1
4157	fine brittle hair	1
4158	low cholesterol	1
4159	periodic paralysis	1
4160	grave's disease	1
4161	goiter	1
4162	hashimoto's thyroiditis	1
4163	abnormal amount of hair growth over the body	1
4164	elevated vitamin a	1
4165	low blood sugar	1
4166	elevated vitamin d	1
4167	over 4000 iu daily vitamin d	1
4168	multiple daily vitamins	1
4169	blood in the anterior chamber	1
4170	blunt trauma to the eye	1
4171	postoperative	1
4172	elevated intraocular pressure	1
4173	preoccupying fear of serious disease	1
4174	preoccupation persists despite medical evaluation and reassurance	1
4175	lasting at least 6 months	1
4176	well-groomed	1
4177	intense eye contact	1
4178	abrupt changes in topic	1
4179	preoccupation with being ill	1
4180	inflexibility	1
4181	negative workup	1
4182	automatism	1
4183	dilated pupils	1
4184	mydriasis	1
4185	combativeness	1
4186	rage	1
4187	clamminess	1
4188	belligerence	1
4189	pins and needles	1
4190	abnormal mentation	1
4191	abnormal breathing	1
4192	coldness	1
4193	respiratory depression	1
4194	hyporeflexia	1
4195	rhabdomyolysis	1
4196	wide pr interval on ecg	1
4197	u wave on ecg	1
4198	st segment depression on ecg	1
4199	flattened or inverted t waves on ecg	1
4200	elevated mood	1
4201	irritable	1
4202	talkative	1
4203	confident	1
4204	flight of ideas	1
4205	decreased need for sleep	1
4206	grandiosity	1
4207	impaired functioning	1
4208	tingling of the mouth	1
4209	hypocalcemia	1
4210	hypoparathyroid	1
4211	spasms	1
4212	chvostek's sign	1
4213	chronic kidney disease	1
4214	trousseau's sign	1
4215	airway spasm	1
4216	terminal burrowing	1
4217	exposure to cold	1
4218	shivering	1
4219	cold diuresis	1
4220	osborne waves on ecg	1
4221	j waves on ecg	1
4222	blue skin	1
4223	coldwater exposure	1
4224	near drowning	1
4225	stumbling	1
4226	paradoxical undressing	1
4227	vasoconstriction	1
4228	sign of hertoghe	1
4229	rapid thoughts	1
4230	enlarged tongue	1
4231	hoarse voice, breaking voice	1
4232	water retention	1
4233	galactorrhea	1
4234	sluggish reflexes	1
4235	abnormal menstrual cycles	1
4236	low triiodothyronine	1
4237	elevated thyrotropin	1
4238	slow heart rate	1
4239	reactive hypoglycemia	1
4240	elevated cholesterol	1
4241	think, brittle fingernails	1
4242	elevated thyroid-stimulating hormone	1
4243	hyperprolactinemia	1
4244	brain fog	1
4245	low thyroxine	1
4246	slowed speech	1
4247	low t3	1
4248	low t4	1
4249	history of ocular trauma	1
4250	history of glaucoma surgery	1
4251	sutureless incision	1
4252	remote history of ocular trauma	1
4253	choroidal detachment	1
4254	exposure to anesthesia	1
4255	severe dehydration	1
4256	low intraocular pressure (< 5 mmhg)	1
4257	shallow anterior chamber	1
4258	synechiae formation	1
4259	corneal astigmatism	1
4260	seidel-positive leak	1
4261	hyphema	1
4262	delayed capillary refill	1
4263	cool clammy skin	1
4264	scaly skin	1
4265	mosaic lines	1
4266	recurrent pancreatitis	1
4267	no underlying cause	1
4268	acute pancreatitis	1
4269	pain relieved by leaning forward	1
4270	elevated pancreatic enzymes	1
4271	marrow hypoplasia	1
4272	normocytic	1
4273	elevated fetal hemoglobin	1
4274	lack of infectious signs and symptoms	1
4275	involuntary, sustained muscle contractions	1
4276	family history of dystonia	1
4277	unknown origin	1
4278	low serum pth	1
4279	low blood pressure	1
4280	involuntary, sustained muscle contractions of the face	1
4281	low bone density by dexa scan	1
4282	hyper or hyporhidrosis	1
4283	neurogenic bladder	1
4284	pupils slow to react to light	1
4285	progressive neuropathy	1
4286	resolution within 2 months	1
4287	recent live virus immunization	1
4288	recent viral illness	1
4289	menorrhagia	1
4290	retinal hemorrhage	1
4291	palpable spleen	1
4292	nonpalpable petechiae	1
4293	wheal	1
4294	urticaria for longer than 6 weeks	1
4295	bone spur	1
4296	lateral knee pain with activity	1
4297	pain over lateral femoral epicondyle	1
4298	pain with climbing stairs	1
4299	pain with running downhill	1
4300	pain with varus stress at 30 degrees flexion	1
4301	positive ober test	1
4302	decrease in hiv viral load	1
4303	rise in cd4 count	1
4304	recent initiation of antiretroviral therapy	1
4305	worsening opportunistic infection symptoms	1
4306	skin lesions with honey-colored crust	1
4307	tense, clear skin bullae	1
4308	punched-out ulcers on lower extremities	1
4309	x-linked dominant	1
4310	family history of ip in mother	1
4311	negative family history	1
4312	neonatal vesicular rash with eosinophilia	1
4433	changes in hearing	1
4313	blaschkoid hyperpigmentation of trunk (fading in adolescence)	1
4314	linear, atrophic, hairless lesions	1
4315	dental anomalies	1
4316	wooly hair	1
4317	abnormal nails	1
4318	retinal disease	1
4319	multiple male miscarriages	1
4320	papules and vesicles on an erythematous base	1
4321	follows blaschko lines	1
4322	hyperpigmented linear steaks	1
4323	3-4 months of age	1
4324	inflammatory papules, pustules or nodules	1
4325	facial rash	1
4326	infant onset	1
4327	lateral curvature of spine > 10 degrees	1
4328	spine curves to left	1
4329	spine curves to right	1
4330	sickle cell disease	1
4331	recent mononucleosis infection	1
4332	abdominal trauma	1
4333	indwelling catheter	1
4334	indwelling iv line	1
4335	positive ebv serology	1
4336	positive ebv naat	1
4337	papular erythematous rash of upper extremities	1
4338	periorbital edema	1
4339	negative ebv naat	1
4340	papular erythematous rash of trunk	1
4341	negative ebv serology	1
4342	exudative pharyngitis	1
4343	human t-cell lymphotropic-1 virus	1
4344	recurrent eczematous skin change	1
4345	contact with infected blood	1
4346	adult t-cell leukemia/lymphoma (atll)	1
4347	tropical spastic paraparesis	1
4348	erythematous papular eruptions	1
4349	erythematous nodules	1
4350	erythroderma	1
4351	ulceration	1
4352	severe exudative dermatitis	1
4353	generalized fine papular rash	1
4354	chronic watery discharge	1
4355	chronic relapsing dermatitis responding to antibiotic therapy	1
4356	early childhood onset	1
4357	htlv-1 seropositive	1
4358	renal infarct	1
4359	splinter hemorrhages	1
4360	painful subcutaneous lesions in the distal fingers	1
4361	new murmur	1
4362	roth's spots	1
4363	changing heart murmur	1
4364	osler's nodes	1
4365	conjunctival hemorrhage	1
4366	clubbing	1
4367	positive rheumatoid factor	1
4368	splenic infarct	1
4369	persistently positive blood cultures	1
4370	change in ecg suggestive of acute myocardial injury	1
4371	cardiogenic shock	1
4372	acute pericarditis	1
4373	pain with cramping localized to single muscle group	1
4374	multifocal infection	1
4375	improved by sitting up and leaning forward	1
4376	new onset widespread st elevation or pr depression	1
4377	cardiac tamponade	1
4378	elevated troponin i	1
4379	rapid test positive	1
4380	rapid test negative	1
4381	positive for influenza a and negative for h1 and h3 by rt-pcr	1
4382	area of confirmed h1n1 infections	3
4383	close contact with confirmed h1n1 (swine) flu case	1
4384	residence in area of confirmed h1n1 infections	1
4385	diffuse infiltrates on cxr	1
4386	crackles on lung exam	1
4387	loose stools	1
4388	segmental or lobar consolidation on air bronchograms	1
4389	patchy infiltrates on cxr	1
4390	localized pain	1
4391	indirect inguinal hernia	1
4392	direct inguinal hernia	1
4393	heaviness or dull discomfort in the groin	1
4394	visible bulge in the groin	1
4395	groin discomfort increased with maneuvers that increase intra abdominal pressure	1
4396	painful to palpation if strangulated or incarcerated	1
4397	onset in child or adolescent	1
4398	hyperglycemia without acidosis	1
4399	perianal candidiasis	1
4400	fruity smelling breath	1
4401	neuropathic pain in distribution of intercostal nerve	1
4402	painless rectal bleeding	1
4403	blood in the stool	1
4404	leech bite in internal organ/tissue	1
4405	painless bleeding with defecation	1
4406	sensation of fullness in perianal area	1
4407	itching or irritation of perianal skin	1
4408	visualization of hemorrhoids on anoscopy	1
4409	impaired adduction on lateral gaze	1
4410	nystagmus in contralateral, abducting eye	1
4411	abnormal vertical eye movements	1
4412	suppressed vor	1
4413	vertical gaze evoked nystagmus	1
4414	diminished vertical gaze holding	1
4415	negative urine culture	1
4416	painful urination	1
4417	negative urinalysis	1
4418	negative brachyspira pcr	1
4419	chronic diarrhea > several weeks	1
4420	positive brachyspira pcr	1
4421	spirochetes on bowel biopsy	1
4422	intermittent constipation	1
4423	duodenitis	1
4424	chronic enterocolitis	1
4425	limited diaphragmatic motion	1
4426	subdiaphragmatic gas	1
4427	localizing pain	1
4428	loss of coordination	1
4429	trouble walking	1
4430	difficulty writing or reading	1
4431	headache waking from sleep	1
4432	clumsiness	1
4434	changes in taste	1
4435	sudden onset of symptoms	1
4436	changes in touch and the ability to feel pain or pressure	1
4437	loss of balance	1
4438	numbness or tingling on one side of the body	1
4439	unconsciousness	1
4440	changes in alertness	1
4441	orbital edema	1
4442	ear infection	1
4443	fixed pupil	1
4444	facial infection	1
4445	decreased consciousness	1
4446	sinus infection	1
4447	hip flexion	1
4448	drawing legs to abdomen and kicking the air	1
4449	currant jelly stool	1
4450	crying spells	1
4451	ruq sausage mass	1
4452	rlq emptiness	1
4453	dance sign	1
4454	peutz-jeghers syndrome	1
4455	iodine deficiency	1
4456	irregular pupil	1
4457	floater	1
4458	hypopyon	1
4459	keratic precipitates	1
4460	dilated ciliary vessels	1
4461	synechia	1
4462	history of radiation therapy	1
4463	hydronephrosis	1
4464	pneumaturia	1
4465	fecaluria	1
4466	positive isospora on stool microscopy	1
4467	negative isospora on stool microscopy	1
4468	severe rigors	1
4469	neck rigidity	1
4470	rural asia	1
4471	exposure to pigs	1
4472	onset before 16	1
4473	low back pain	1
4474	symptoms worse in morning or with inactivity	1
4475	improvement with exercise	1
4476	alternating buttock pain	1
4477	radicular radiation	1
4478	small joints	1
4479	hands	1
4480	feet	1
4481	oligoarticular	1
4482	eye inflammation	1
4483	systemic symptoms	1
4484	limited range of motion	1
4485	gottron papules	1
4486	heliotrope rash	1
4487	calcinosis cutis	1
4488	"v-neck" rash	1
4489	violaceous eyelid rash	1
4490	elevated muscle enzymes	1
4491	photosensitive rash	1
4492	pneumatosis	1
4493	colonic perforation	1
4494	onset age 3 to 9	1
4495	neurofibromatosis 1	1
4496	ras mutation	1
4497	ptpn11 mutation	1
4498	childhood onset	1
4499	absolute monocytosis	1
4500	bcr/abl fusion gene	1
4501	increased fetal hemoglobin	1
4502	immature granulocytes	1
4503	nucleated rbcs	1
4504	systemic necrotizing vasculitis with aneurysm formation	1
4505	skin involvement	1
4506	hhv-8	1
4507	mouth lesion	1
4508	gum lesion	1
4509	palpable purple skin lesion	1
4510	red purple or black skin blotches	1
4511	desquamation on hands or feet	1
4512	erythematous oral mucosa	1
4513	strawberry tongue	1
4514	asian descent	1
4515	parotitis	1
4516	erythematous hands or feet	1
4517	positive acanthamoeba on microscopy of eye discharge	1
4518	positive pseudomonas culture of eye discharge	1
4519	arching of the back	1
4520	hypertonia	1
4521	paracortical hyperplasia on biopsy	1
4522	nephrotic proteinuria	1
4523	painless subcutaneous cervical masses	1
4524	elevated ige	1
4525	positive kingella culture	1
4526	negative kingella culture	1
4527	lack of secondary sexual characteristics	1
4528	reduction in gross and fine motor skills	1
4529	deficits in language and executive functions	1
4530	hypogonadism	1
4531	clinodactyly	1
4532	taurodontism (enlargement of the molar teeth by an extension of the pulp)	1
4533	mitral valve prolapse	1
4534	varicose veins	1
4535	sterility	1
4536	small testis	1
4537	short neck	1
4538	decreased cervical range of motion	1
4539	low hairline	1
4540	loss of rotational ability in cervical spine	1
4541	torticollis	1
4542	facial asymmetry	1
4543	scoliosis	1
4544	sprengel anomaly	1
4545	renal anomalies	1
4546	palsy of lower roots of the brachial plexus	1
4547	isolated hand paralysis	1
4548	loss of teach	1
4549	thinning hair	1
4550	malnourishment	1
4551	protein deficiency	1
4552	skin depigmentation	1
4553	tick borne hemorrhagic fever endemic to south asia	1
4554	cramps	1
4555	rumbling stomach	1
4556	milk or lactose ingestion	1
4557	borborygmi	1
4558	contraction of vocal cords causing stridor or dysphonia	1
4559	hacking cough	1
4560	itching' sensation in airways	1
4561	foreign body sensation in airways	1
4562	barking cough	1
4563	senegal	1
4564	congo	1
4565	west africa	1
4566	sierra leone	1
4567	nigeria	1
4568	liberia	1
4569	borno state, nigeria	1
4570	mali	1
4571	pleuritis	1
4572	guinea	1
4573	central african republic	1
4574	yedseram river valley	1
4575	pain over lateral elbow	1
4576	pain improves with rest, worsens with activity	1
4577	use of screwdriver or backhand tennis stroke aggravates pain	1
4578	maximal tenderness to palpation approx 1-2 cm distal to the origin of the ecrb at the lateral epicondyle	1
4579	resisted extension of the middle finger is painful	1
4580	pain with resisted supination	1
4581	frontal plane axis between -45 and -90 degrees	1
4582	qr pattern in lead avl	1
4583	r-peak time in lead avl of 45 msec or more	1
4584	qrs duration less than 120 msec	1
4585	qrs duration greater than or equal to 120ms	1
4586	broad notched or slurred r wave in leads i, avl, v5, and v6 and an occasional rs pattern in v5 and v6 attributed to displaced transition of qrs complex	1
4587	absent q waves in leads i, v5, and v6, but in the lead avl, a narrow q wave may be present in the absence of myocardial pathology	1
4588	r peak time greater than 60 ms in leads v5 and v6 but normal in leads v1, v2, and v3, when small initial r waves can be discerned in the above leads	1
4589	st and t waves usually opposite in direction to qrs complex	1
4590	right axis deviation	1
4591	small r waves with deep s waves "rs complexes" in leads i and avl	1
4592	small q waves and tall r waves "qr complexes" in leads ii, iii and avf	1
4593	qrs duration normal or slightly prolonged	1
4594	prolonged r wave peak time in avf	1
4595	increased qrs voltage in limb leads	1
4596	concurrent rbbb	1
4597	positive legionella antigen in sputum or urine	1
4598	< 4 fold rise in legionella antibody titer	1
4599	non-productive cough	1
4600	> 4 fold rise in legionella antibody titer	1
4601	negative legionella antigen in sputum or urine	1
4602	impaired cognition	1
4603	positive urine legionella antigen	1
4604	positive leishmania cultures	1
4605	positive brown-hopps stained sample	1
4606	absence of systemic symptoms	1
4607	sandfly bite	1
4608	erythematous papule or plaque	1
4609	erythematous ulcer	1
4610	normal lab values	1
4611	positive leishmania pcr	1
4612	subcutaneous nodules near lesion	1
4613	plaques over body	1
4614	montenegro skin test >5mm induration	1
4615	palpable cords near lesion	1
4616	satellite lesions near plaque or ulcer	1
4617	plaque	1
4618	inflammation of oropharynx	1
4619	history of cutaneous leishmaniasis	1
4620	gingivitis	1
4621	periodontitis	1
4622	localized lymphadenopathy	1
4623	inflammation of nose	1
4624	airway obstruction	1
4625	inflammation of mouth	1
4626	inflammation of trachea	1
4627	recurrent fevers (high)	1
4628	laryngeal lesions	1
4629	positive leishmania elisa	1
4630	normocytic normochromic anemia	1
4631	decreased pmns	1
4632	abdominal pain (intermittent)	1
4633	normal ptt	1
4634	mild elevation in lfts	1
4635	normal pt	1
4636	patchy darkening of face	1
4637	positive leishmania immunofluorescence assay	1
4638	positive leishmania direct agglutination test	1
4639	patchy darkening of trunk	1
4640	positive fusobacterium smear of oral drainage	1
4641	jugular phlebitis	1
4642	displacement of tongue	1
4643	tenderness over sternocleidomastoid	1
4644	elevated fibrin split products	1
4645	submandibular edema	1
4646	positive fusobacterium culture	1
4647	painful swelling of tongue	1
4648	abscesses in multiple sites	1
4649	anesthetic circular hypopigmented skin lesions	1
4650	anesthetic diffuse papulonodular skin lesions	1
4651	anesthetic thickened peripheral nerves	1
4652	diffuse papules	1
4653	positive afb on skin smear	1
4654	anesthetic red skin lesions	1
4655	positive mycobacterium leprae pcr	1
4656	negative mycobacterium leprae pcr	1
4657	diffuse nodules	1
4658	anesthetic hypopigmented skin lesions	1
4659	nephritis	1
4660	hemorrhagic diathesis	1
4661	spirochete on dark field microscopy of urine	1
4662	pretibial rash	1
4663	positive leptospira microscopic agglutination test (mat)	1
4664	calf tenderness	1
4665	spirochete on dark field microscopy of csf	1
4666	conjunctival suffusion	1
4667	localized loss of pigmentation	1
4668	vitiligo	1
4669	white oral lesion	1
4670	white patch	1
4671	chewing tobacco	1
4672	oral white patch	1
4673	keratosis	1
4674	white lesion	1
4675	chronic skin eruption	1
4676	flat-topped micropapules	1
4677	skin colored micropapules	1
4678	affecting trunk, ue flexor regions, dorsal hands, genitals	1
4679	perifollicular erythema	1
4680	follicular hyperkeratosis	1
4681	well defined pruritic,planar,purple,polygonal papules	1
4682	purple	1
4683	polygonal	1
4684	papules or plaques	1
4685	skin, mucuous membranes, scalp, nails, or genetalia involvement	1
4686	hyperkeratosis without parakeratosis	1
4687	vacuolization of the basal layer	1
4688	variant of lichen planus	1
4689	red papulonodules with adherent hyperkeratosis, often in linear or reticulated pattern	1
4690	nail dystrophy	1
4691	white papules that coalesce into plaques	1
4692	white, porcelain appearance to lesions	1
4693	genital mucosal disease	1
4694	back and shoulder involvement	1
4695	vulvar or glans penis involvement	1
4696	thickening of skin that arises due to repetitive rubbing or scratching	1
4697	continuous or interrupted linear band of small lichenoid papules	1
4698	unilateral, involving lines of blaschko	1
4699	nail involvement	1
4700	beta blocker	1
4701	methyldopa	1
4702	quinidine	1
4703	chloroquine	1
4704	thiazide diuretics	1
4705	gold salts	1
4706	quinacrine	1
4707	eruption of flat-topped papules	1
4708	lesions erythematous or violaceous	1
4709	symmetrical distribution	1
4710	nails spared	1
4711	involvement of extensor aspects of extremities	1
4712	linear streaks and induration involving dermis and/or deeper tissues	1
4713	joint contractures	1
4714	involvement of an extremity	1
4715	negative listeria csf culture	1
4716	sepsis in immunocompromised	1
4717	negative listeria blood culture	1
4718	positive listeria csf culture	1
4719	positive listeria blood culture	1
4720	meningitis in immunocompromised	1
4721	newborn, elderly, or immunocompromised	1
4722	neonatal meningitis	1
4723	granulomatosis infantiseptica	1
4724	temperature instability	1
4725	in adult, ingestion of contaminated food products	1
4726	in newborn, transplacental infection or infection via vaginal delivery	1
4727	positive bacterial blood culture	1
4728	history of cholecystitis	1
4729	pleuritic pain	1
4730	history of appendicitis	1
4731	history of diverticulitis	1
4732	negative bacterial blood culture	1
4733	pleural rub	1
4734	history of diverticulosis	1
4735	chronic fungal infection endemic to central and south america	1
4736	slow growing papules or pustules	1
4737	pruritic or burning lesions	1
4738	well defined, mobile, keloidal lesions	1
4739	endemic to west and central africa	1
4740	transient localized subcutaneous swelling (calabar swellings)	1
4741	transient inflammation and edema of the eye as the worm migrates across the subconjunctival	1
4742	infection with the filarial nematode loa loa, transmitted by the bite of the chrysops fly	1
4743	sciatica	1
4744	malar rash	1
4745	discoid rash	1
4746	bullseye rash	1
4747	mood changes	1
4748	erythema migrans	1
4749	facial palsy	1
4750	muscle soreness	1
4751	paraplegia	1
4752	history of minor trauma to distal areas	1
4753	erythematous streaks	1
4754	tender erythema	1
4755	warm	1
4756	non-hodgkin lymphoma	1
4757	mediastinal mass	1
4758	impaired inflammation	1
4759	localized bacterial infections	1
4760	autosomal recessive	1
4761	delayed umbilical cord separation	1
4762	omphalitis	1
4763	perirectal cellulitis	1
4764	otitis media with minimal inflammation	1
4765	absence of pus	1
4766	positive arenavirus naat	1
4767	negative arenavirus naat	1
4768	positive chlamydia serology	1
4769	negative chlamydia serology	1
4770	genital nodule or vesicle	1
4771	draining inguinal fistula	1
4772	rectal stricture	1
4773	proctitis	1
4774	perianal abscess	1
4775	suppurative regional lymphadenopathy	1
4776	genital edema	1
4777	recurrent pruritic papules	1
4778	trunk and limbs affected	1
4779	slightly depressed oval scars	1
4780	papulonecrotic or papulonodular lesions	1
4781	contact with patient infected with machupo fever	1
4782	nose bleeds	1
4783	blood spots	1
4784	calomys callosus	1
4785	bolivia	1
4786	vesper mouse	1
4787	sodium retention	1
4788	hyperexcitability	1
4789	muscle spasms	1
4790	severe anemia	1
4791	deafness in child	1
4792	cold sensation or rigors, followed by fever, followed by sweating	1
4793	alar flaring	1
4794	birth to malaria-infected mother	1
4795	positive malaria falciparum in peripheral blood smear	1
4796	ataxia in child	1
4797	fevers every 36-48h	1
4798	increased retic count	1
4799	abnormally deep breathing	1
4800	speech difficulty in child	1
4801	intercostal retraction	1
4802	positive malaria falciparum pcr	1
4803	blindness in child	1
4804	cranial nerve palsy in child	1
4805	mild anemia	1
4806	positive malaria immunofluorescent-ab	1
4807	bilirubin in ua	1
4808	fevers every 72h	1
4809	positive malaria malariae pcr	1
4810	positive malaria malariae in peripheral blood smear	1
4811	positive malaria ovale pcr	1
4812	fevers every 48h	1
4813	positive malaria ovale in peripheral blood smear	1
4814	positive malaria vivax pcr	1
4815	positive malaria vivax in peripheral blood smear	1
4816	splenic rupture	1
4817	general anesthesia	1
4818	muscle rigidity	1
4819	halothane	1
4820	succinylcholine	1
4821	sevoflurane	1
4822	desflurane	1
4823	brain metastases	1
4824	change in color of existing mole	1
4825	multicolored skin lesion	1
4826	new skin lesion	1
4827	elevated skin surface	1
4828	change in shape of existing mole	1
4829	skin lesion evolving over time	1
4830	history of long term sun exposure	1
4831	growing skin growth	1
4832	firm skin growth	1
4833	asymmetric skin lesion	1
4834	skin lesion with irregular borders	1
4835	itchy mole	1
4836	skin lesion > 6mm	1
4837	ulcerated mole	1
4838	exposure to moldy barley	1
4839	aspergillus clavatus	1
4840	industrial exposure	1
4841	skeletal deformation	1
4842	poor dietary intake	1
4843	impaired glucose tolerance	1
4844	hyperphosphatemia	1
4845	a distinct period of abnormally and persistently elevated, expansive, or irritable mood and abnormally and persistently increased activity or energy, lasting at least one week and present most of the day, nearly every day (or any duration if hospitalization is necessary)	1
4846	during the period of mood disturbance and increased energy or activity, three (or more) of the following symptoms (four if the mood is only irritable) are present to a significant degree and represent a noticeable change from usual behavior	1
4847	inflated self-esteem or grandiosity	1
4848	more talkative than usual	1
4849	flight of ideas or racing thoughts	1
4850	distractibility	1
4851	increase in goal-directed activity or psychomotor agitation	1
4852	excessive involvement in activities that have a high potential for painful consequences	1
4853	the mood disturbance is sufficiently severe to cause marked impairment in social or occupational functioning or to necessitate hospitalization to prevent harm to self or others, or there are psychotic features	1
4854	the episode is not attributable to the physiological effects of a substance (eg, a drug of abuse, a medication, other treatment) or to another medical condition	1
4855	intraocular lesion	1
4856	yellow nodules on bulbar conjunctivae	1
4857	positive microfilariae naat	1
4858	pruritic subcutaneous lesions	1
4859	negative microfilariae naat	1
4860	recurrent pruritic subcutaneous lesions	1
4861	positive microfilariae in blood	1
4862	stage 4 disease	1
4863	poor performance status	1
4864	palpable masses in skin, breast, and salivary glands	1
4865	on histology of lymph node, expansion of the mantle zone by small to medium sized atypical lymphocytes	1
4866	type of hypersensitivity pneumonitis	1
4867	aminoacidopathy due to defect in decarboxylation of the branched chain amino acids of leucine, isoleucine, and valine	1
4868	symptoms develop at age 4-7 days	1
4869	alternating muscular hypotonia and hypertonia, dystonia, seizures, encephalopathy	1
4870	ketosis	1
4871	maple syrup odor of the urine	1
4872	muscle wasting	1
4873	loss of fat	1
4874	protein-energy malfunction	1
4875	severe protein deficiency	1
4876	starvation	1
4877	loose skin folds	1
4878	democratic republic of congo	1
4879	marburg, germany	1
4880	zimbabwe	1
4881	angola	1
4882	kenya	1
4883	south africa	1
4884	netherlands	1
4885	frankfurt	1
4886	dislocated lenses	1
4887	astigmatism	1
4888	abnormal indentation of the sternum	1
4889	dural ectasia	1
4890	aortic root dilation	1
4891	pectus carinatum	1
4892	malocclusions	1
4893	abnormal joint flexibility	1
4894	flat feet	1
4895	long limbs	1
4896	stooped shoulders	1
4897	aortic dissection	1
4898	idiopathic obstructive lung disease	1
4899	nearsightedness	1
4900	high palate	1
4901	arachnodactyly	1
4902	hammertoes	1
4903	above average height	1
4904	ectopia lentis	1
4905	dolichostenomelia	1
4906	aortic regurgitation	1
4907	history of recurrent anaphylaxis	1
4908	ear inflammation	1
4909	urticaria pigmentosa	1
4910	eye discomfort	1
4911	decreased bone density	1
4912	throat inflammation	1
4913	nose inflammation	1
4914	food and drug intolerance	1
4915	olfactive intolerance	1
4916	mastoid erythema	1
4917	mastoid pain	1
4918	ear drainage	1
4919	mastoid tenderness	1
4920	x-linked	1
4921	choreiform movements	1
4922	cognitive impairment	1
4923	acanthocytosis	1
4924	slowly progressive	1
4925	absent ankle tendon reflex	1
4926	generalized areflexia	1
4927	psychopathology	1
4928	cardiac disease	1
4929	koplik's spots	1
4930	positive measles serology	1
4931	positive measles naat	1
4932	negative measles naat	1
4933	viral pneumonia	1
4934	maculopapular rash starting at hairline moving down	1
4935	negative measles serology	1
4936	blue-gray lesions on buccal mucosa	1
4937	age younger than 10	1
4938	painless bright red blood on the stool	1
4939	umbilical anomalies	1
4940	neoplasm	1
4941	positive meckel's scan in pediatric patient	1
4942	positive meckel scan in adult patient	1
4943	localized tenderness over the medial epicondyle	1
4944	tenderness over proximal wrist flexor muscle mass	1
4945	pain with resisted wrist flexion with elbow in full extension	1
4946	pain with passive terminal wrist extension with the elbow in full extension	1
4947	burma	1
4948	brunei	1
4949	parotid abscess	1
4950	prostatic abscess	1
4951	burkholderia pseudomallei	1
4952	thailand	1
4953	malaysia	1
4954	singapore	1
4955	splenic abscess	1
4956	laos	1
4957	hong kong	1
4958	vietnam	1
4959	recurrent facial paralysis	1
4960	recurrent swelling of the face and lips	1
4961	development of abnormal folds and furrows of the tongue	1
4962	chemical pneumonitis from aspiration of gastric acid	1
4963	abrupt onset of symptoms with dyspnea	1
4964	cyanosis and crackles on lung auscultation	1
4965	severe hypoxemia and infiltrates on chest x-ray involving dependent pulmonary segments	1
4966	csf opening pressure 9-18	1
4967	clear csf	1
4968	normal csf protein (50-100)	1
4969	csf wbc <300	1
4970	normal csf glucose	1
4971	moderate csf pleocytosis	1
4972	csf lymphocytosis	1
4973	bulging fontanelle in a child	1
4974	positive viral pcr of csf	1
4975	irritability in a child	1
4976	csf wbc >2k	1
4977	focal neurologic deficit	1
4978	cloudy csf	1
4979	csf glucose <20	1
4980	csf neutrophilia	1
4981	positive csf antigen assay	1
4982	positive brudzinski's sign	1
4983	positive bacterial csf culture	1
4984	csf tp >200	1
4985	csf opening pressure 18-30	1
4986	positive bacterial csf microscopy	1
4987	positive kernig's sign	1
4988	positive fungal csf culture	1
4989	csf glucose <45	1
4990	positive fungal csf microscopy	1
4991	csf tp 40-300	1
4992	csf tp 100-200	1
4993	positive afb csf culture	1
4994	csf wbc <500	1
4995	positive afb csf microscopy	1
4996	lower extremity or trunk petechial rash	1
4997	nausea, vomiting, anorexia	1
4998	chest discomfort	1
4999	asbestos exposure	1
5000	chest wall pain	1
5001	nitrates	1
5002	metoclopramide	1
5003	articaine	1
5004	exercise intolerance	1
5005	benzocaine	1
5006	prilocaine	1
5007	chlorates	1
5008	bismuth nitrate	1
5009	sulfonamides	1
5010	trimethoprim	1
5011	chocolate brown skin	1
5012	dapsone	1
5013	bromates	1
5014	methemoglobin >1%	1
5015	leukocyturia	1
5016	anca positive	1
5017	keratoconjunctivitis	1
5018	negative microsporidia naat	1
5019	positive microsporidia naat	1
5020	positive protozoa stool microscopy	1
5021	hemianopsia	1
5022	visual aura	1
5023	temporal artery tenderness	1
5024	drooping eyelid	1
5025	edema of the scalp	1
5026	hot ears	1
5027	headache with preceding yawning	1
5028	dysphasia	1
5029	horners syndrome	1
5030	headache with prodrome	1
5031	osmophobia	1
5032	phonophobia	1
5033	headache with preceding euphoria	1
5034	headache with preceding depression	1
5035	headache with preceding fatigue	1
5036	tunnel vision	1
5037	ragged red muscle fibers	1
5038	holosystolic murmur at the apex	1
5039	pulmonary	1
5040	ehlers danlos	1
5041	marfan	1
5042	polycystic kidney disease	1
5043	graves disease	1
5044	mid-systolic click	1
5045	late-systolic murmur heard best at apex	1
5046	murmur worsened by standing and valsalva	1
5047	murmur diminished by squatting	1
5048	murmur worsened by hand grip maneuver	1
5049	thromboembolisms	1
5050	diastolic murmur	1
5051	mid-menstrual pain	1
5052	sudden pelvic pain	1
5053	acute abdominal pain	1
5054	normal pelvic exam	1
5055	rotational vertigo	1
5056	sensation of fullness in the ears	1
5057	low frequency hearing loss	1
5058	flesh-colored lesions	1
5059	dome-shaped papules	1
5060	central umbilication	1
5061	parenteral nutrition	1
5062	high sulfite levels	1
5063	high xanthine levels	1
5064	low sulfate levels	1
5065	hypouricemia	1
5066	hypouricosuria	1
5067	no worm in stool	1
5068	periumbilical discomfort	1
5069	worm in stool	1
5070	exposure to ill prairie dogs	1
5071	western africa	3
5072	exposure to animals from western africa	1
5073	backache	1
5074	rash spreads from face	1
5075	macular lesions	1
5076	papular lesions	1
5077	septicemic rash of monkeypox	1
5078	plasma cell dyscrasia	1
5079	m-complement <3g/dl	1
5080	bone marrow plasma cells <10%	1
5081	osteolytic lesions	1
5082	renal impairment	1
5083	acute monocytic leukemia	1
5084	chronic monocytic leukemia	1
5085	painful, asymmetric, asynchronous motor and sensory neuropathy involving damage to at least 2 separate nerve areas	1
5086	numbness, tingling, abnormal sensation, dysesthesia, or localized paralysis	1
5087	history of vasculitis	1
5088	history of amyloidosis	1
5089	paraneoplastic syndrome	1
5090	polyarteritis nodosa	1
5091	systemic lupus erythematosus	1
5092	symptoms result from exposure to real or perceived motion	1
5093	yawning or belching before conscious nausea or vomiting develop	1
5094	japanese or asian heritage	1
5095	chronic, progressive cerebrovascular diseases characterised by occlusion of the arteries around the circle of willis	1
5096	family history of the disease	1
5097	tia, stroke	1
5098	mucosal destruction	1
5099	erosion of mucosal surface	1
5100	infection by protozoa transmitted by sand flies native to north and south america	1
5101	mucous membrane findings	1
5102	polymorphous rash	1
5103	bilateral nonexudative conjunctivitis	1
5104	cracked, red lips with a strawberry tongue	1
5105	indurated edema of dorsal hands and feet with erythema of palms and soles	1
5106	diarrhea, vomiting, or abdominal pain	1
5107	cough or rhinorrhea	1
5108	decreased po intake	1
5109	periungual desquamation	1
5110	autosomal recessive disorder caused by deficiency of the lysosomal enzyme idua	1
5111	diagnoses as child or adolescent	1
5112	joint stiffness and pain	1
5113	corneal clouding	1
5114	spondylolisthesis and kyphoscoliosis	1
5115	cardiac valve disease	1
5116	multiple hernias	1
5117	recurrent ear, sinus, and pulmonary infections	1
5118	x-linked disorder of deficiency of ids enzyme	1
5119	late onset (age one to 2 years)	1
5120	absence of corneal clouding	1
5121	abnormal facial appearance	1
5122	dysostosis with dwarfism	1
5123	neurocognitive decline	1
5124	rhino-orbital-cerebral infection	1
5125	acute sinusitis with fever	1
5126	black eschar visible in the nasal mucosa or palat	1
5127	facial numbness	1
5128	nasal ulceration or necrosis	1
5129	periorbital or facial swelling	1
5130	ophthalmoplegia	1
5131	cortical syndrome	1
5132	subcortical syndrome	1
5133	executive dysfunction, aphasia, hemineglect, anterograde amnesia	1
5134	focal motor signs, ataxia, urinary symptoms, personality changes	1
5135	stepwise decline in cognition	1
5136	bone involvement	1
5137	lymph node involvement	1
5138	liver involvement	1
5139	spleen involvement	1
5140	oral mucosal involvement	1
5141	lung involvement	1
5142	multifocal disease most commonly seen in child less than 3 years	1
5143	single system disease usually in older children or adult	1
5144	skin rash	1
5145	polydipsia and polyuria	1
5146	gingival hypertrophy	1
5147	bence jones proteinuria	1
5148	hyperviscosity	1
5149	lytic bone lesions	1
5150	paraproteinemia	1
5151	retinopathy	1
5152	loss of bladder control	1
5153	normocytic anemia	1
5154	spine pain	1
5155	amyloid	1
5156	rib pain	1
5157	optic neuritis	1
5158	unstable mood	1
5159	clonus	1
5160	earache	1
5161	oophoritis	1
5162	pain on chewing	1
5163	tenderness over parotid gland	1
5164	muscle spasm	1
5165	muscle tightness	1
5166	history of exercise	1
5167	inability to walk	1
5168	calf deformation	1
5169	progressive muscle wasting	1
5170	respiratory difficulty	1
5171	waddling gait	1
5172	poor balance	1
5173	atrophy	1
5174	exposure to mushroom compost	1
5175	thermophilic actinomycetes	1
5176	muscle weakness with use	1
5177	positive edrophonium test	1
5178	antibodies to acetylcholine receptor	1
5179	positive culture from lesion	1
5180	draining fistula on foot or lower extremity	1
5181	painless foot or lower extremity nodule	1
5182	aquarium exposure	1
5183	tenosynovitis	1
5184	positive mycobacterial culture	1
5185	painful violaceous papules	1
5186	negative mycobacterial culture	1
5187	painful ulcerated papule	1
5188	swimming pool exposure	1
5189	rash with lymphatic distribution	1
5190	painless unilateral submandibular lymphadenopathy	1
5191	painless ulcerating nodule on face	1
5192	painless ulcerating nodule on leg	1
5193	painless ulcerating nodule on trunk	1
5194	nontender firm subcutaneous nodules	1
5195	positive mycoplasma naat	1
5196	hemolytic jaundice	1
5197	negative mycoplasma naat	1
5198	positive mycoplasma culture	1
5199	urethral discharge	1
5200	neonatal pneumonia	1
5201	erythematous tympanic membranes	1
5202	normal lung exam	1
5203	bullous otitis media	1
5204	subsegmental infiltrate on cxr	1
5205	erythematous oropharynx	1
5206	skin patch	1
5207	skin plaque	1
5208	skin tumors	1
5209	cutaneous t-cell lymphoma	1
5210	extramedullary manifestation of acute myeloid leukemia	1
5211	skin lesion	1
5212	violaceous skin lesion	1
5213	raised skin lesion	1
5214	nontender plaque or nodule	1
5215	swollen gums	1
5216	pruritic draining nodule	1
5217	presence of maggot under skin	1
5218	painful draining nodule	1
5219	rapidly progressive	1
5220	acute decompensation	1
5221	muscle inflammation	1
5222	change in taste	1
5223	change in smell	1
5224	inattention	1
5225	hypnagogic hallucinations	1
5226	daytime sleepiness	1
5227	cataplexy	1
5228	sleep paralysis	1
5229	involuntary somnolence	1
5230	fall	1
5231	emotional trigger	1
5232	weakness with laughter	1
5233	frequent naps	1
5234	bronchial asthma	1
5235	cystic fibrosis	1
5236	primary ciliary dyskinesia	1
5237	aspirin intolerance	1
5238	alcohol intolerance	1
5239	churg-strauss	1
5240	young syndrome	1
5241	positive gram positive bacteria on gram stain	1
5242	subcutaneous crepitus	1
5243	positive mixed anaerobic cultures	1
5244	positive gram negative bacilli on gram stain	1
5245	local skin discoloration	1
5246	feeling of tightness around teeth	1
5247	severe gingival pain	1
5248	profuse gingival bleeding	1
5249	interdental papillary necrosis	1
5250	history of bilateral adrenalectomy	1
5251	rapid enlargement of pituitary adenoma	1
5252	injury during delivery to the subscapular vascular plexus	1
5253	bacterial infection causing bilateral adrenal hemorrhage	1
5254	positive anti-streptolysin o antibody	1
5255	rlq pain in neutropenic pt	1
5256	autosomal recessive immunodeficiency due to underdevelopment of the thymus	1
5257	photosensitivity dermatitis	1
5258	lesion resembling a sunburn that develops blisters with burning and pruritus, characteristically involving the dorsum of the hands	1
5259	exacerbation of dermatitis with exposure to sunlight	1
5260	glossitis	1
5261	headache and irritability	1
5262	poor concentration	1
5263	history of dietary deficiency	1
5264	history of prolonged diarrhea, alcoholism, chronic colitis, cirrhosis, malignant carcinoid tumor, or hartnup syndrome	1
5265	positive nocardia culture	1
5266	lung abscess	1
5267	brain abscess	1
5268	extranodal disease	1
5269	systemic b symptoms	1
5270	gi involvement	1
5271	intensely pruritic patches of eczematous dermatitis	1
5272	circular lesions	1
5273	sparing of the head	1
5274	scaling, crusting, with possible serious oozing from lesion	1
5275	periocular erythema	1
5276	pruritic rash	1
5277	significant distress or functional impairment	1
5278	dysphagia to solid foods	1
5279	food impaction	1
5280	centrally located chest pain unresponsive to ant-acids	1
5281	rlq tenderness	1
5282	positive nematode in tissue biopsy	1
5283	rlq pain	1
5284	student's elbow	1
5285	elbow pain	1
5286	olecranon swelling and erythema	1
5287	swollen elbow	1
5288	baker's elbow	1
5289	swollen neck glands	1
5290	prostration	1
5291	flavivirus	1
5292	rash on the soft palate	1
5293	omsk	1
5294	siberia	1
5295	sclerosing keratitis	1
5296	skin atrophy	1
5297	skin inflammation	1
5298	response to ivermectin	1
5299	river blindness	1
5300	skin swelling	1
5301	hyperpigmented plaques	1
5302	hyperpigmented papules	1
5303	leopard skin	1
5304	mazzotti reaction	1
5305	indigestion	1
5306	diagnosis by identifying eggs in stool, duodenal aspirates, or bile specimens	1
5307	a pattern of negativistic hostile and defiant behavior lasting at least 6 months during which four or more of the following are present	1
5308	often loses temper	1
5309	often argues with adults	1
5310	often actively defies with adults' requests or rules	1
5311	often deliberately annoys people	1
5312	often blames others for his or her mistakes	1
5313	is often touchy or easily annoyed by others	1
5314	is often angry and resentful	1
5315	is often spiteful or vindictive	1
5316	the behaviors do not occur exclusively during the course of a psychotic or mood disorder	1
5317	criteria are not met for conduct disorder, and if the the individual is 18 years or older, not met for antisocial personality disorder	1
5318	sudden blurred vision	1
5319	sudden foggy vision	1
5320	radiotherapy	1
5321	dysgeusia (change in taste)	1
5322	5-fluorouracil	1
5323	irinotecan	1
5324	bone marrow transplantation	1
5325	eyelid edema	1
5326	orbital pain	1
5327	severe testicular pain	1
5328	testicular swelling	1
5329	ejaculation of blood	1
5330	mumps	1
5331	gonorrhea	1
5332	pustules on hands	1
5333	negative poxvirus naat	1
5334	goat handler	1
5335	positive poxvirus naat	1
5336	sheep handler	1
5337	shepherd	1
5338	vesicles on hands	1
5339	exposure to bird droppings	1
5340	infiltrates on cxr	1
5341	nonproductive cough	1
5342	bodily dissociation	1
5343	vasovagal syncope	1
5344	coat hanger pain	1
5345	symptoms when standing	1
5346	dimmed vision	1
5347	distortions of hearing	1
5348	frequent fractures	1
5349	brittle bone syndrome	1
5350	lytic lesions on bone films	1
5351	gait disturbance	1
5352	osteomyelitis on mri	1
5353	positive cultures from bone	1
5354	history of cellulitis	1
5355	erythrocyte sedimentation rate (esr) >70	1
5356	limb pain	1
5357	ear swelling	1
5358	pain when pushing on tragus	1
5359	cloudy effusion behind tm	1
5360	abnormal tympanometry (cooperative child)	1
5361	bulging tm	1
5362	decreased movement with pneumatic otoscopy	1
5363	night restlessness	1
5364	ear pain worse with movement of outer ear	1
5365	abnormal tympanometry (uncooperative child)	1
5366	osteoarthritis	1
5367	bony deformity	1
5368	excessive warmth	1
5369	positive family history	1
5370	lumbar spine affected	1
5371	sacral involvement	1
5372	skull involvement	1
5373	pain persists or worsens overnight	1
5374	sensation of impending doom	1
5375	panic	1
5376	tender skin nodules	1
5377	pain on eye movement	1
5378	viral infection that can include hpv or jc virus	1
5379	response to praziquantel	1
5380	croup	1
5381	dry cough	1
5382	sustained fever	1
5383	rose spots	1
5384	dementia in parkinson's disease	1
5385	dark urine at night	1
5386	venous thrombosis	1
5387	hemosiderin in urine	1
5388	elevated reticulocytes	1
5389	elevated serum lactic acid	1
5390	low serum haptoglobin	1
5391	rash on extremities	1
5392	lacy rash on extremities	1
5393	red cheeks	1
5394	septic phlegmon	1
5395	cat bite	1
5396	inferior patellar pain	1
5397	athlete	1
5398	basketball	1
5399	volleyball	1
5400	patellar ache	1
5401	adolescent	1
5402	pain worsens with squatting, running, or going up and down stairs	1
5403	nits on skin or clothes	1
5404	lice on skin or clothes	1
5405	random blood-filled cavities in liver	1
5406	anabolic steroid use	1
5407	skin blister	1
5408	small, flaccid bullae with scaling and crusting	1
5409	affects the scalp, face, upper chest or back	1
5410	malar distribution	1
5411	superficial variant of pemphigus sparing mucous membranes	1
5412	seborrheic distribution	1
5413	positive nikolsky sign	1
5414	pain and burning sensation of lesions	1
5415	systemic symptoms usually absent	1
5416	small, scattered superficial blisters evolving into crusted, scaly erosions	1
5417	subcorneal acantholytic blisters	1
5418	autoantibodies against desmoglein 1	1
5419	variant of pemphigus vulgaris	1
5420	vegetating plaques composed of excessive granulation tissue with crusting	1
5421	intertriginous areas, scalp, and face involvement	1
5422	ingestion of liver	1
5423	itchy throat	1
5424	lacrimation	1
5425	positive worm larvae in nasal discharge	1
5426	itchy ear	1
5427	postprandial pain	1
5428	pain awaking patient at night	1
5429	dyspepsia	1
5430	frequent use of nsaids	1
5431	pericardial effusion on echo	1
5432	venous distention	1
5433	enlarged cardiac shadow on cxr	1
5434	laceration extends to perineal muscles, but not anal sphincter	1
5435	laceration of anal sphincter, but not rectal mucosa	1
5436	current uti	1
5437	cva tenderness	1
5438	history of uti	1
5439	gingival inflammation	1
5440	abundant plaque and calculi	1
5441	frank pus in periodontal pockets	1
5442	edema in rectal area	1
5443	fluctuance in rectal area	1
5444	pain in rectal area	1
5445	absent bowel sounds	1
5446	positive culture of peritoneal fluid	1
5447	rebound tenderness on abdominal exam	1
5448	elevated cell count in ascitic fluid	1
5449	tenderness on abdominal exam	1
5450	collection of pus located between capsule of the palatine tonsil and the pharyngeal muscles	1
5451	unilateral severe sore throat	1
5452	"hot potato" or muffled voice	1
5453	drooling of saliva	1
5454	tripod posturing	1
5455	ipsilateral ear pain	1
5456	extremely swollen and fluctuant tonsil with deviation of the uvula to the opposite side on physical exam	1
5457	fullness or bulging of posterior soft palate	1
5458	bilateral abscesses	1
5459	pain distal and posterior to lateral malleolus with use	1
5460	swelling with localized tenderness	1
5461	positive bordetella pcr	1
5462	coughing fits	1
5463	negative bordetella pcr	1
5464	vomiting after coughing	1
5465	positive bordetella nasal culture	1
5466	negative bordetella nasal culture	1
5467	seizure in infant	1
5468	inspiratory whooping	1
5469	single, unremitting seizure with duration longer than 5 to 10 minutes, or frequent separate seizures without a return to baseline clinical state	1
5470	association with otitis media	1
5471	association with mastoiditis	1
5472	gradenigo syndrome (lateral rectus palsy, retro-orbital pain, and otorrhea)	1
5473	pseudomonas aeruginosa	1
5474	adenitis	1
5475	aphthous stomatitis	1
5476	positive smear of oral drainage	1
5477	positive culture of oral drainage	1
5478	pharyngitis with purulent exudate	1
5479	positive group a strep throat swab	1
5480	erythema in oropharynx	1
5481	inflammation of a vein	1
5482	eyelid infestation by pubic lice	1
5483	itching of the eyelid	1
5484	round macules or papules	1
5485	pruritic macules	1
5486	fine desquamation	1
5487	oval macules or papules	1
5488	redness and scales on face and scalp	1
5489	craniocaudal spread	1
5490	redness and thickening of palms and soles	1
5491	ectropion	1
5492	nail discoloration	1
5493	splinter hemorrhage	1
5494	islands of sparing	1
5495	nutmeg grater papules	1
5496	palmoplantar keratoderma	1
5497	fungal infection	1
5498	eruption on trunk and proximal extremities	1
5499	warm and humid climate	1
5500	sharp border	1
5501	fine scaling of skin	1
5502	pale or pink color sharply contrasting surrounding skin	1
5503	color change with heat	1
5504	positive koh prep	1
5505	copper-orange fluorescence under wood's lamp	1
5506	history of cesarean delivery	1
5507	uterine irritability	1
5508	recurrence during labor	1
5509	preterm delivery	1
5510	concurrent contractions	1
5511	normal fetal heart tones	1
5512	inguinal buboes	1
5513	acral cyanosis	1
5514	ecchymosis	1
5515	negative yersinia dfa of pus	1
5516	positive yersinia culture	1
5517	negative yersinia culture	1
5518	digital gangrene	1
5519	epitrochlear buboes	1
5520	positive yersinia pcr	1
5521	positive yersinia dfa of pus	1
5522	dullness to percussion on lung exam	1
5523	> 4 fold change in passive hemagglutination test	1
5524	axillary buboes	1
5525	negative yersinia pcr	1
5526	cervical buboes	1
5527	buboes	1
5528	flea bite	1
5529	arizona	1
5530	sharp foot pain	1
5531	heel spur (exostosis)	1
5532	plantar heel pain	1
5533	nocturnal pain	1
5534	recently increased activity	1
5535	recently changed footwear	1
5536	pain worst with first few steps	1
5537	tenderness to palpation of heel	1
5538	pain with passive dorsiflexion of toes	1
5539	posterior heel pain	1
5540	renal dysfunction	1
5541	elevated beta-2-microglobulin	1
5542	positive plesiomonas stool culture	1
5543	ingestion of shellfish	1
5544	chest pain reproducible on palpation	1
5545	chest pain in waves	1
5546	negative coxsackievirus serology	1
5547	negative coxsackievirus naat	1
5548	positive coxsackievirus serology	1
5549	positive coxsackievirus naat	1
5550	occupational exposure	1
5551	inhalation of dust	1
5552	exposure to mines	1
5553	bibasilar interstitial infiltrates	1
5554	honeycombing on cxr	1
5555	positive p. jiroveci serology	1
5556	cavitary lesions on cxr	1
5557	negative p. jiroveci serology	1
5558	bilateral diffuse infiltrates on cxr	1
5559	hilar lymphadenopathy on cxr	1
5560	negative p. jiroveci naat	1
5561	positive p. jiroveci in induced sputum	1
5562	unilateral infiltrates on cxr	1
5563	positive p. jiroveci naat	1
5564	egophony	1
5565	pneumonia rule 4-5	1
5566	decreased breath sounds	1
5567	pneumonia rule 0-1	1
5568	bronchial breath sounds	1
5569	dullness to percussion	1
5570	symptoms vary by causative agent	1
5571	right lower-lobe pneumonia	1
5572	crackles at right lung base	1
5573	right lower lobe consolidation on ct	1
5574	right lower-lobe infiltrate on cxr	1
5575	lobar consolidation	1
5576	lobar infiltrate	1
5577	history of dysphagia	1
5578	foul-smelling sputum	1
5579	lobar pneumonia	1
5580	chest pain radiates to shoulder	1
5581	tracheal shift	1
5582	distant or absent breath sounds unilaterally	1
5583	hyperresonance on percussion	1
5584	pulsus paradoxus	1
5585	red-brown discoloration of lateral cheeks and neck	1
5586	neck erythema	1
5587	hyperpigmented skin lesions	1
5588	hypopigmented skin lesions	1
5589	positive polio viral culture	1
5590	positive polio stool viral culture	1
5591	positive polio naat	1
5592	decreased tendon reflexes	1
5593	asymmetric flaccid paralysis	1
5594	absent tendon reflexes	1
5595	negative polio naat	1
5596	morning fever	1
5597	anyoloc	1
5598	 myalgia	1
5599	transient ischemic attacks	1
5600	cutaneous involvement including rash, purpura, livedo reticularis, or raynaud phenomenon most frequently occuring on the legs	1
5601	unilateral testicular pain	1
5602	liver disease	1
5603	connective tissue disease	1
5604	chronic infection	1
5605	hematologic disorder	1
5606	non-hematologic malignancy	1
5607	polycystic kidney	1
5608	anovulation	1
5609	polycystic ovaries	1
5610	ovarian cysts	1
5611	few menstrual periods	1
5612	hirsutism	1
5613	gout	1
5614	erythromelalgia	1
5615	itching with exposure to warm water	1
5616	thrombosis	1
5617	polycythemia	1
5618	temporal arteritis	1
5619	hip stiffness	1
5620	symmetric proximal muscle weakness	1
5621	interstitial lung disease	1
5622	antisynthetase syndrome	1
5623	elevated creatinine kinase	1
5624	antinuclear antibodies	1
5625	neurologic symptoms affecting multiple nerves	1
5626	skin blisters with sun exposure	1
5627	hepatic fibrosis	1
5628	hepatitis c	1
5629	vesicles and erosions on the dorsum of both hands	1
5630	spider angiomas	1
5631	paraumbilical hernia	1
5632	esophageal variceal hemorrhage	1
5633	hepatic venous pressure gradient >6	1
5634	recent hepatitis b vaccination	1
5635	history of cardiotomy	1
5636	signs of pneumonitis	1
5637	biliary colic	1
5638	diarrhea or nausea	1
5639	bloating or excessive flatulence	1
5640	history of cholecystectomy	1
5641	anxiety disorder	1
5642	functional impairment such as unemployment or relationship dysfunction	1
5643	history of surgical excision of brain stem mass	1
5644	postsurgical	1
5645	postpartum	1
5646	low energy	1
5647	hyperthyroid followed by hypothyroid	1
5648	oligohydramnios	1
5649	renal agenesis	1
5650	flattened nose	1
5651	recessed chin	1
5652	prominent epicanthal folds	1
5653	pulmonary hypoplasia	1
5654	eagle-barrett (prune belly)	1
5655	hemivertebrae	1
5656	sacral agenesis	1
5657	tetralogy of fallot	1
5658	potter facies	1
5659	low bmi	1
5660	urinary tract infection	1
5661	vaginal bleeding during pregnancy	1
5662	amniocentesis	1
5663	prolonged tumescence	1
5664	erection lasting longer than four hours	1
5665	thalassemia	1
5666	medication reaction	1
5667	intracavernous injection	1
5668	antihypertensive	1
5669	antipsychotics	1
5670	trazodone	1
5671	salt craving	1
5672	darkening of palmar creases	1
5673	hyperopia	1
5674	farsighted	1
5675	history of glaucoma	1
5676	periorbital pain	1
5677	visual deficits	1
5678	seeing halos	1
5679	anticholinergic use	1
5680	sympathomimetic use	1
5681	corneal edema	1
5682	firm globe	1
5683	right upper quadrant discomfort	1
5684	xanthelasmata	1
5685	xerophthalmia	1
5686	kayser-fleischer rings	1
5687	spider nevi	1
5688	elevated ggtp	1
5689	elevated alt and ast	1
5690	hypervolemia	1
5691	low plasma renin activity and decreased plasma renin concentration	1
5692	mild hypernatremia	1
5693	elevated plasma aldosterone to renin ratio (pac/pra)	1
5694	nephrolithiasis	1
5695	weakness and fatigue	1
5696	osteitis fibrosa cystica	1
5697	paresis of extraocular muscles	1
5698	bilateral ptosis	1
5699	association with mitochondrial myopathies	1
5700	positive csf jc virus pcr	1
5701	cognitive deterioration	1
5702	alien hand syndrome	1
5703	jv virus	1
5704	impaired speech	1
5705	vertical supranuclear gaze palsy	1
5706	age greater than 40	1
5707	pseudobulbar palsy	1
5708	frontal cognitive abnormalities	1
5709	stiff and broad-based gait	1
5710	slowing of vertical saccades	1
5711	positive babinski sign	1
5712	pruritus and edema in early stages	1
5713	pulmonary arterial hypertension	1
5714	patchy myocardial fibrosis	1
5715	subacute neurologic deficits	1
5716	motor deficits	1
5717	limb and gait ataxia	1
5718	visual symptoms	1
5719	eczematous lesions	1
5720	negative algal naat	1
5721	visualization of fungus on skin biopsy	1
5722	olecranon bursitis	1
5723	positive algal naat	1
5724	skin trauma	1
5725	contact with cattle	1
5726	red-to-blue dermal nodule on hand	1
5727	umbilicated nodule on hand	1
5728	acute myocardial infarction	1
5729	rectus sheath hematoma	1
5730	over diuresis	1
5731	pulmonary embolism	1
5732	relative adrenal insufficiency	1
5733	anterior hip or groin pain	1
5734	pain worsens with activity	1
5735	tenderness over the iliopsoas tendon's insertion	1
5736	red-scaly skin plaques	1
5737	salmon colored skin rash	1
5738	scaling erythematous macules, papules, and plaques	1
5739	involvement of the scalp, extensor surfaces, genitals, umbilicus, and lumbosacral and retroauricular regions	1
5740	symmetric distribution of lesions	1
5741	thick silvery scale present on lesions	1
5742	pitting of nails	1
5743	coincidental skin involvement	1
5744	morning stiffness lasting greater than 30 minutes	1
5745	asymmetric distribution	1
5746	distal interphalangeal joint involvement	1
5747	spine involvement	1
5748	joint line tenderness and effusions in affected joints	1
5749	enthesitis	1
5750	dactylitis	1
5751	nail pitting	1
5752	pain and stiffness of back	1
5753	axial involvement alone	1
5754	external ocular mass	1
5755	extends onto corneal surface	1
5756	eye swelling	1
5757	blurring of vision	1
5758	increased exposure to ultraviolet light	1
5759	occupation requiring outdoor activities	1
5760	cancer	1
5761	prolonged immobilization	1
5762	rapid breathing	1
5763	recent travel	1
5764	contraceptive use	1
5765	sudden onset of dyspnea	1
5766	alterations in blood flow	1
5767	deep venous thrombosis	1
5768	extrinsic	1
5769	l-tryptophan	1
5770	contaminated food	1
5771	abpa	1
5772	coccidioidomycosis	1
5773	recent pregnancy	1
5774	infective endocarditis	1
5775	carcinoid syndrome	1
5776	acquired	1
5777	precordial thrill	1
5778	ejection systolic click	1
5779	widely split second heart sound	1
5780	systolic ejection murmur at left upper sternal border	1
5781	lower back pain	1
5782	leg ulcers	1
5783	chronic wound	1
5784	papule progressing to ulcer	1
5785	truncal pain	1
5786	truncal edema	1
5787	woody induration of lower limb	1
5788	woody induration of trunk	1
5789	lower limb pain	1
5790	bacteriuria	1
5791	urinary obstruction	1
5792	crp greater than 28 mg/l	1
5793	symptoms vary by causative organism	1
5794	history of trauma or surgery	1
5795	cheilitis	1
5796	isoniazid	1
5797	proximity to farm	1
5798	negative coxiella naat	1
5799	negative coxiella serology	1
5800	positive coxiella serology	1
5801	positive coxiella naat	1
5802	hyperactivity	1
5803	bizarre behavior	1
5804	inspiratory spasms	1
5805	negative rabies pcr	1
5806	dog scratch	1
5807	progressive paralysis	1
5808	painful spasms of respiratory muscles	1
5809	animal bite	1
5810	positive rabies direct fluorescent antigen on skin or corneal smear	1
5811	rabies-neutralizing antibody detected in csf (unvaccinated person)	1
5812	positive rabies pcr	1
5813	dog bite	1
5814	hydrophobia	1
5815	animal scratch	1
5816	erophobia	1
5817	fasciculation	1
5818	cramping abdominal pain	1
5819	generalized abdominal tenderness	1
5820	peritoneal signs	1
5821	shooting pain with tapping	1
5822	tooth pain	1
5823	neuropathy originating at nerve root	1
5824	recent exposure to radiation	1
5825	erythema within days to weeks of exposure, usually with doses less than 10gy	1
5826	dry desquamation at doses of 12 to 20 gy	1
5827	moist desquamation at doses greater than 20 gy	1
5828	full thickness skin necrosis and infection at doses greater than 35 gy	1
5829	positive spirochete on darkfield microscopy	1
5830	hyperesthesia	1
5831	chancre at bite site	1
5832	maculopapular rash on chest and arms	1
5833	regular relapsing fever	1
5834	mouse bite	1
5835	rat bite	1
5836	macular rash on hands and feet	1
5837	pustular rash on hands and feet	1
5838	intermittent relapsing fever	1
5839	migratory arthralgia	1
5840	prompt healing of bite site	1
5841	petechial rash on hands and feet	1
5842	pain and discoloration of the extremities following cold exposure	1
5843	circinate balanitis	1
5844	recent enteritis	1
5845	tendinopathy	1
5846	recent shigella infection	1
5847	recent gonorrhea infection	1
5848	recent chlamydial infection	1
5849	burning on urination	1
5850	inflammatory arthritis of the large joints	1
5851	migratory stomatitis	1
5852	keratoderma blennorrhagica	1
5853	geographic tongue	1
5854	recent campylobacter infection	1
5855	recurrent aphthous stomatitis	1
5856	recent sexual transmitted disease	1
5857	recent salmonella infection	1
5858	severe pain in rectal area	1
5859	development of chronic fistula	1
5860	fluctuance or erythema over abscess	1
5861	history of non-healing anorectal abscess	1
5862	intermittent rectal pain worsened with defecation	1
5863	intermittent and malodorous perineal drainage	1
5864	autosomal recessive disorder that causes the accumulation of phytanic acid in plasma and tissues	1
5865	symptom onset by age 20	1
5866	peripheral polyneuropathy	1
5867	cerebellar ataxia	1
5868	elevated csf protein concentration without an increase in cellularity	1
5869	slowed conduction velocity on nerve conduction studies	1
5870	history of preceding infection between a few weeks and a few days before arthritis symptom onset	1
5871	asymmetric oligoarthritis	1
5872	history of diarrhea or urethritis	1
5873	arthritic involvement of lower extremities	1
5874	hla-b27 positive	1
5875	positive borrelia spirochetes on thin blood smear	1
5876	rash on trunk	1
5877	positive borrelia culture	1
5878	positive borrelia spirochetes on thick blood smear	1
5879	erythematous, edematous, tender subcutaneous nodules usually in a symmetric distribution	1
5880	involvement of thighs and lower legs	1
5881	relapsing and recurrent course	1
5882	mitral regurgitation	1
5883	vasculitis	1
5884	nasal chondritis	1
5885	auricular chondritis	1
5886	red painful area of skin overlying cartilaginous area (eg. ear)laryngotracheal symptoms	1
5887	reduced hearing	1
5888	lumbo-abdominal pain	1
5889	costovertebral angle tenderness	1
5890	pyuria and proteinuria	1
5891	previously diagnosed pyelonephritis who are unresponsive to antimicrobial therapy	1
5892	elevated crp	1
5893	malformation of kidney tissue	1
5894	phosphate retention	1
5895	decreased free ionized calcium	1
5896	decreased calcitriol concentration	1
5897	adynamic bone disease	1
5898	severe or resistant to treatment hypertension	1
5899	acute elevation in serum creatinine greater than 30 percent of baseline after administration of ace inhibitor or arb	1
5900	moderate to severe hypertension in patients with recurrent flash pulmonary edema	1
5901	systolic or diastolic abdominal bruit	1
5902	history of diffuse atherosclerosis	1
5903	unilateral small kidney	1
5904	asymmetric kidney size	1
5905	colorado tick fever	1
5906	rotavirus	1
5907	prominent negative symptoms	1
5908	psychomotor slowing	1
5909	blunted affect	1
5910	history of schizophrenia	1
5911	maternal diabetes	1
5912	grunting	1
5913	nasal flaring	1
5914	acidemia	1
5915	ground glass cxr	1
5916	history of fever	1
5917	paroxysmal cough	1
5918	wheezing on lung exam	1
5919	positive coronavirus naat	1
5920	negative coronavirus naat	1
5921	pulmonary infiltrates on cxr	1
5922	rhonchi on lung exam	1
5923	apnea in infant	1
5924	positive metapneumovirus naat	1
5925	negative metapneumovirus naat	1
5926	presence of iud	1
5927	ectopic	1
5928	widespread large-plaque parapsoriasis	1
5929	net-like or zebra-striped pattern	1
5930	photopsia	1
5931	visual field defect	1
5932	shadow	1
5933	shafer sign	1
5934	blood in the retina	1
5935	sudden	1
5936	retinal edema	1
5937	"blood and thunder"	1
5938	neovascularization	1
5939	retinal detachment	1
5940	older than 40	1
5941	visual field loss	1
5942	retracted nipple	1
5943	history of childbirth	1
5944	papillitis with hyperemia and swelling of the disk	1
5945	blurring of disk margins	1
5946	distended veins in disk	1
5947	loss of memory of events that happened before the inciting event or injury	1
5948	odynophagia	1
5949	posterior pharyngeal edema	1
5950	normal development followed by a loss of acquired motor and intellectual abilities around age 12-18 months	1
5951	growth failure	1
5952	disorganized breathing pattern while awake	1
5953	inappropriate peripheral vasoconstriction	1
5954	mutation in mecp2 gene	1
5955	sporadic inheritance	1
5956	deceleration of head growth around age 2 to 3 months	1
5957	stereotypic hand movements with extrapyramidal motor dysfunction	1
5958	oculogyric crisis	1
5959	proximal myoclonus	1
5960	excessive drooling	1
5961	hypomimia	1
5962	regression in milestones	1
5963	fixed and dilated pupils	1
5964	aspirin ingestion in child	1
5965	sluggish pupillary reflex	1
5966	decorticate posturing	1
5967	rh negative mother with rh positive fetus	1
5968	hydrops fetalis	1
5969	carditis	1
5970	prolonged pr interval on ecg	1
5971	recent history of pharyngitis	1
5972	erythema marginatum	1
5973	morning stiffness	1
5974	increased swelling of bursa out of proportion to the minimal pain experienced	1
5975	involvement of the olecranon bursa	1
5976	subclinical pleural disease	1
5977	upper airway obstruction due to cricoarytenoid arthritis	1
5978	small airway obstruction	1
5979	rheumatoid lung nodules	1
5980	medium and small vessel involvement	1
5981	skin, digits, peripheral nerves, heart, and/or eye involvement	1
5982	similarity to polyarteritis nodosa	1
5983	cutaneous vasculitis causing deep cutaneous ulcers on the lower extremities	1
5984	sensory neuropathy	1
5985	mixed motor and sensory neuropathy	1
5986	episcleritis or peripheral ulcerative keratitis	1
5987	purulent drainage	1
5988	grey or erythematous nasal and palatal mucosa	1
5989	orbital cellulitis	1
5990	untreated rosacea	1
5991	large bulbous ruddy nose	1
5992	fibrous thickening of nose	1
5993	painless sinus mass	1
5994	fetid pharyngeal discharge	1
5995	gram negative bacilli on gram stain of nasal discharge	1
5996	painless ear mass	1
5997	crusting granulomatous mass in nose	1
5998	foul-smelling thick dry nasal crusts	1
5999	painless intranasal mass	1
6000	fetid nasal discharge	1
6001	positive klebsiella culture of nasal discharge	1
6002	nasal infection	1
6003	palpebral conjunctival infection	1
6004	unilateral nasal obstruction	1
6005	exposure to contaminant water	1
6006	polyps	1
6007	strawberry polyps	1
6008	bleeding polyps	1
6009	southern and eastern africa	1
6010	contact with game animals and livestock	1
6011	fast onset	1
6012	tsetse fly	1
6013	intermittent fever	1
6014	chancre	1
6015	gram positive coccobacillus on gram stain	1
6016	pleuropulmonary infection	1
6017	positive rhodococcus culture	1
6018	cheilosis	1
6019	chapped lips	1
6020	sore, red tongue	1
6021	oily, scaly skin rashes	1
6022	genital rashes	1
6023	red, itchy eyes	1
6024	night blindness	1
6025	cataracts	1
6026	migraines	1
6027	craniotabes	1
6028	vitamin d deficiency	1
6029	bowed legs	1
6030	harrison groove	1
6031	negative weil felix reaction	1
6032	nontender lymphadenopathy	1
6033	positive rickettsia naat	1
6034	negative rickettsia serology	1
6035	painless papular rash	1
6036	painless vesicular rash	1
6037	dermal eschar	1
6038	negative rickettsia naat	1
6039	positive weil felix reaction	1
6040	positive rickettsia serology	1
6041	mite bite	1
6042	bump	1
6043	black, crusty scab	1
6044	exposure to rats or mice	1
6045	diffuse rash	1
6046	local lymphadenopathy	1
6047	mediterranean sea	3
6048	flinders island	3
6049	southwest japan	3
6050	negative phlebovirus naat	1
6051	positive phlebovirus serology	1
6052	ocular edema	1
6053	positive phlebovirus naat	1
6054	large-joint arthralgia	1
6055	negative phlebovirus serology	1
6056	optic atrophy	1
6057	sinus rhythm	1
6058	qrs duration > 100 ms	1
6059	terminal r wave in v1	1
6060	slurred s wave in leads i and v6	1
6061	widened qrs	1
6062	rapid progression	1
6063	rash on presentation	1
6064	blanching erythematous rash with macules that become petechial over time	1
6065	rash spreads centrally	1
6066	rash on palms and soles	1
6067	chronic redness of nose and cheeks	1
6068	intermittent facial flushing	1
6069	centrally located facial telangiectasias	1
6070	erythema congestive	1
6071	stinging and burning sensation in affected areas	1
6072	exacerbation of symptoms and lesions by sun, extremes of temperature, hot beverages, alcohol, or topical product exposure	1
6073	erythematous papules on soft palate and uvula	1
6074	positive hhv6 naat	1
6075	negative hhv6 naat	1
6076	nonpruritic skin lesions	1
6077	bulging fontanelle	1
6078	erythematous rash on trunk spreading to neck and extremities	1
6079	pruritic lesions	1
6080	pink rash	1
6081	maculopapular rash on trunk spreading to neck and extremities	1
6082	symmetric arthralgia	1
6083	australia, papua new guinea, solomon islands, or the western south pacific	3
6084	shoulder pain with overhead activity	1
6085	pain at night, especially when lying on affected shoulder	1
6086	pain localized to deltoid by patients	1
6087	children	1
6088	 fecal leukocytes	1
6089	peripheral blood leukocyte counts within normal limits	1
6090	association with gastroenteritis outbreaks in colleges and nursing homes	1
6091	detection of viral shedding via elisa	1
6092	vomiting in children	1
6093	fever in children	1
6094	positive rotavirus stool assay	1
6095	mucous stools	1
6096	negative rotavirus serology	1
6097	negative rotavirus stool assay	1
6098	positive rotavirus serology	1
6099	negative rotavirus naat	1
6100	positive rotavirus naat	1
6101	negative rubella serology	1
6102	positive rubella naat	1
6103	negative rubella naat	1
6104	post auricular lymphadenopathy	1
6105	positive rubella serology	1
6106	pigmentary retinopathy	1
6107	pulmonary artery stenosis	1
6108	congential heart disease	1
6109	duodenal stenosis	1
6110	glaucoma	1
6111	low fever	1
6112	pinpoint, pink maculopapular that first appear on the face and spread caudally to the trunk and extremities	1
6113	systemic complaints in adults	1
6114	eye pain on lateral and upward movement	1
6115	teenager or adult women	1
6116	knees, wrist, and finger involvement	1
6117	postinfectious encephalitis in 1 in 6000	1
6118	conginetal rubella syndrome of sensorineural hearing loss, ocular abnormalities, and congenital heart disease	1
6119	pulsatile bleeding	1
6120	prior open heart surgery with obliterative fibrous pericardial adhesions preventing egress of blood	1
6121	acute pulmonary edema	1
6122	inferior myocardial infarction	1
6123	recent cardiac surgery	1
6124	myxomatous degeneration	1
6125	rheumatic heart disease	1
6126	symptoms depend on which ligaments involved	1
6127	acute knee pain	1
6128	pain behind the knee	1
6129	calf swelling	1
6130	history of popliteal cyst	1
6131	prior swelling behind the knee	1
6132	history of knee trauma	1
6133	history of knee arthritis	1
6134	disappearance of palpable mass behind knee	1
6135	pain in affected areas	1
6136	swelling around affected joint	1
6137	prior cesarean section	1
6138	prior uterine rupture	1
6139	prior surgical abortion	1
6140	history of uterine perforation	1
6141	alkaloidal cocaine abuse	1
6493	vision impairment	1
6142	defect in the vertebral column and overlying tissue so that the meninges and spinal cord are exposed	1
6143	correlation of spina bifida with hydrocephalus	1
6144	bladder and bowel dysfunction	1
6145	spina bifida without hydrocephalus	1
6146	pain in the buttocks or posterior thigh worsened when sitting for long periods	1
6147	sexual pleasure from causing or feeling pain	1
6148	gram negative bacillus on stool gram stain	1
6149	negative salmonella stool culture	1
6150	positive salmonella stool culture	1
6151	pain worsened with coitus or cervical manipulation	1
6152	onset of pain during or shortly after menses	1
6153	rebound tenderness on physical exam	1
6154	adnexal tenderness on pelvic exam	1
6155	localized pink colored papule leading to painless ulceration	1
6156	spread of lesions along lymphatic drainage routes	1
6157	positive sarcocystis cysts in stool	1
6158	ingestion of beef	1
6159	ingestion of pork	1
6160	cranial nerve vii palsy	1
6161	uveoparotid fever	1
6162	skin bumps	1
6163	abnormal chest x-ray	1
6164	lupus pernio	1
6165	knee swelling	1
6166	hypercalciuria	1
6167	parotid enlargement	1
6168	uveoparotitis	1
6169	palate dysfunction	1
6170	chronic meningitis	1
6171	epitrochlear lymphadenopathy	1
6172	lack of energy	1
6173	monocytosis	1
6174	nonpuerperal mastitis	1
6175	lofgren syndrome	1
6176	bilateral hilar adenopathy	1
6177	systemic complaints such as fever and weight loss	1
6178	cytopenias	1
6179	pruritus in axille	1
6180	pruritus on wrists	1
6181	pruritus worse at night	1
6182	mites present in skin scrapings	1
6183	pruritus on elbows	1
6184	pruritus in interdigital webs	1
6185	pruritus on penis	1
6186	pruritus in perineal region	1
6187	pruritic vesicles	1
6188	facial flushing	1
6189	negative strep a swab	1
6190	white strawberry tongue	1
6191	desquamation	1
6192	positive strep a swab	1
6193	rash along skin folds	1
6194	red strawberry tongue	1
6195	sandpaper-like rash	1
6196	pallor around the mouth	1
6197	pruritic papular rash	1
6198	schistosomiasis ova in urine	1
6199	signs and symptoms of right ventricular congestion	1
6200	sandy patches in genital mucosa	1
6201	uti	1
6202	visual impairment	1
6203	schistosomiasis ova in stool	1
6204	negative schistosoma immunoblot test	1
6205	positive schistosoma immunoblot test	1
6206	normal lfts	1
6207	endemic to africa, the middle east, south america, and the caribbean	1
6208	tingling and itching at site of entry within one day of water exposure	1
6209	hydroureter	1
6210	acute or subacute myelopathy	1
6211	focal cns impairment	1
6212	microscopic or macroscopic hematuria	1
6213	terminal hematuria	1
6214	fibrosis and calcification of bladder and ureters	1
6215	acute "swimmer's itch" at site of entry	1
6216	colonic obstruction	1
6217	manic episodes	1
6218	major depressive episodes	1
6219	hypomanic episodes	1
6220	psychotic episode lasting longer than two weeks without mood symptoms	1
6221	two episodes of psychosis	1
6222	overlap of mood and psychotic symptoms	1
6223	cluster a	1
6224	little desire for close relationships	1
6225	low sexual interest	1
6226	aloof	1
6227	socially detached	1
6228	magical thinking	1
6229	odd magical beliefs	1
6230	hallucination	1
6231	auditory hallucination	1
6232	delusion	1
6233	disorganized speech	1
6234	poverty of speech	1
6235	loss if interest	1
6236	cognitive deficits	1
6237	inappropriate mood	1
6238	disorganized or catatonic behavior	1
6239	symptoms lasting at least 6 months	1
6240	flat affect	1
6241	poor insight (anosognosia)	1
6242	ideas of reference	1
6243	vague, circumstantial, or stereotyped speech	1
6244	bodily illusions	1
6245	odd use of language	1
6246	eccentric behavior	1
6247	herniation of the nucleus pulposus	1
6248	shooting pain down the back of the leg	1
6249	diffuse, rapidly progressive hardening of the skin	1
6250	pathology finding of needle-shaped clefts radially arranged	1
6251	constant, severe pain worse at night	1
6252	movement of eye exacerbates pain	1
6253	scleral edema	1
6254	association with systemic sclerosis	1
6255	localized thickening of the skin of the fingers or toes	1
6256	shoulder unleveling	1
6257	right thoracic curve pattern	1
6258	scurvy	1
6259	megaloblastic anemia	1
6260	association with filariasis	1
6494	kyphoscoliosis	1
6261	fine, white, diffuse scaliness without underlying erythema involving the scalp	1
6262	well demarcated, erythematous plaques in areas with significant amounts of sebaceous glands	1
6263	"cradle cap" distribution	1
6264	asymptomatic accumulation of greasy, yellow scales	1
6265	pasted-on appearance	1
6266	dark lesions	1
6267	raised lesions	1
6268	thyroid disease	1
6269	stress	1
6270	excessive exercise	1
6271	soft bones	1
6272	nursing home resident	1
6273	easy fracturing	1
6274	triradiate pelvis	1
6275	elevated pth	1
6276	apparent source of infection	1
6277	bacteremia	1
6278	positive sirs criteria	1
6279	source of infection plus sirs criteria	1
6280	maternal fever	1
6281	premature rupture of membranes	1
6282	single joint edema	1
6283	> 5 leukocytes per cu mm in joint fluid	1
6284	single joint tenderness	1
6285	positive bacterial culture of joint fluid	1
6286	decreased joint range of motion	1
6287	single joint erythema	1
6288	low viscosity joint fluid	1
6289	bacteria on gram stain of joint fluid	1
6290	turbid joint fluid	1
6291	persistent hypotension refractory to fluids	1
6292	end-organ damage	1
6293	elevated lactate	1
6294	organ failure	1
6295	gangrene	1
6296	micropenis	1
6297	conjugated hyperbilirubinemia	1
6298	maternal valproate use	1
6299	retinal tear	1
6300	chondrial melanoma	1
6301	temporal floater ring	1
6302	slight feeling of heaviness in eye	1
6303	veil or curtain across vision	1
6304	curved distortions of vision	1
6305	central vision loss	1
6306	history of serum injection	1
6307	peripheral neuritis	1
6308	brachial plexus neuritis	1
6309	cranial nerve neuritis	1
6310	pain across shoulder girdle	1
6311	fever above 38c	1
6312	consumption of alcohol	1
6313	flushed skin	1
6314	decreased social inhibition	1
6315	chronic diarrhea	1
6316	absence of a thymic shadow on chest radiography	1
6317	unexplained lymphopenia	1
6318	family history of scid	1
6319	suicidal ideation	1
6320	hopelessness	1
6321	guilt	1
6322	somatic complaints	1
6323	psychomotor agitation or retardation	1
6324	impulsivity	1
6325	generalized erythroderma	1
6326	sezary cells	1
6327	negative shigella stool culture	1
6328	hemorrhagic lesions in distal colon on endoscopy	1
6329	rectal prolapse	1
6330	dilated colon	1
6331	transient fever	1
6332	positive shigella stool culture	1
6333	focal ulcers in colon on endoscopy	1
6334	perforated colon	1
6335	inflammation of a salivary duct	1
6336	purulent drainage from involved duct	1
6337	salivary gland stones	1
6338	pain and swelling of involved gland	1
6339	pain aggravated with salivation	1
6340	intermittent symptoms	1
6341	failure of saliva to flow from gland when gland is compressed	1
6342	stones visible on noncontrast ct scan	1
6343	keratoconjunctivitis sicca (dry eyes)	1
6344	association with sjogren's syndrome	1
6345	old age	1
6346	frequent periods of inappropriate bradycardia	1
6347	alternating bradycardia and atrial tachyarrhythmias	1
6348	sinus pauses on ecg	1
6349	worsening angina	1
6350	acute pain	1
6351	5 to 50 percent of red cells are sickled on peripheral blood smear	1
6352	stroke by age 45	1
6353	reduced or absent splenic function	1
6354	bone infarction or dactylitis	1
6355	acute chest syndrome	1
6356	pain crisis	1
6357	sudden pain	1
6358	urine hypoosmolarity	1
6359	poor exercise tolerance	1
6360	decreased stamina	1
6361	aplastic crisis	1
6362	functional asplenia	1
6363	infection by encapsulated bacteria	1
6364	cholelithiasis	1
6365	avascular necrosis	1
6366	autosomal codominant	1
6367	resistance to malaria	1
6368	renal medullary carcinoma	1
6369	urinary tract infections	1
6370	painless hematuria	1
6371	esophageal webs	1
6372	postmenopausal	1
6373	intermittent dysphagia	1
6374	dysphagia to solids	1
6375	deposition of iron in tissue	1
6376	exposure to iron oxide	1
6377	exposure to egyptian tombs	1
6378	plane travel	1
6379	recent uri	1
6380	allergy	1
6381	sudden sharp facial pain on aircraft descent	1
6382	onset with aircraft descent	1
6383	frontal facial pain	1
6384	rapid pressure change	1
6385	sinus tenderness	1
6386	positive bacterial culture of nasal discharge	1
6387	orbital abscess	1
6388	negative bacterial culture of nasal discharge	1
6389	transposition of great vessels	1
6390	male infertility	1
6391	mirrored anatomy	1
6392	right-sided pmi	1
6393	binocular horizontal diplopia	1
6394	esotropia (crossed eyes)	1
6395	idiopathic	1
6396	aneurysm	1
6397	ischemia	1
6398	head-turn	1
6399	ocular abduction deficit	1
6400	slowed ipsilateral saccades	1
6401	inhalation of fluoride dust	1
6402	burning of coal indoors	1
6403	consumption of brick tea	1
6404	consumption of water from deep-bore wells	1
6405	increased fracture risk	1
6406	impaired joint mobility	1
6407	fluoride toxicity	1
6408	osteosclerosis	1
6409	sudden awakening	1
6410	scream	1
6411	crying	1
6412	inconsolability	1
6413	autonomic hyperactivity	1
6414	disoriented	1
6415	violence	1
6416	occurs during nrem sleep	1
6417	amnesia of event	1
6418	episodes of activity while asleep	1
6419	attempts to escape	1
6420	open, glassy eyes	1
6421	slow or absent response to questions	1
6422	obese adolescent with non-radiating, dull, aching pain in the hip, groin, thigh or knee	1
6423	altered gait	1
6424	presentation with isolated knee or thigh pain	1
6425	chronic presentation	1
6426	acute presentation	1
6427	painless generalized lymphadenopathy	1
6428	b symptoms	1
6429	serum paraprotein	1
6430	abnormal karyotype	1
6431	pre-eruptive phase lasting 2-4 days with acute onset of high fever, backache, malaise, and headache	1
6432	confluent, semi confluent or discrete rash of macules and papules evolving to papules and pustules spreading in a centrifugal pattern	1
6433	intraoral papules and vesicles on tongue and palate	1
6434	lesions described as firm, well circumscribed, deep seated vesicles or nodules that formed crusts by week 2	1
6435	marked fear or anxiety about one or more social situations in which the individual is exposed to possible scrutiny by others	1
6436	the individual fears that he or she will act in a way or show anxiety symptoms that will be negatively evaluated	1
6437	the social situations almost always provoke fear or anxiety	1
6438	the social situations are avoided or endured with intense fear or anxiety	1
6439	the fear or anxiety is out of proportion to the actual threat posed by the social situation and to the sociocultural context	1
6440	the fear, anxiety, or avoidance is persistent, typically lasting for six months or more	1
6441	the fear, anxiety, or avoidance causes clinically significant distress or impairment in social, occupational, or other important areas of functioning	1
6442	the fear, anxiety, or avoidance is not attributable to the physiological effects of a substance, another medical condition, or another mental disorder	1
6443	incompatible role expectations in social situations	1
6444	rash in areas exposed to sunlight	1
6445	a history of many physical complaints beginning before age 30 years that occur over a period of several years and result in treatment being sought or significant impairment of functioning	1
6446	each of the following criteria must have been met at some time during the disturbance, 4 pain symptoms, 2 gastrointestinal symptoms, 1 sexual symptom, 1 pseudoneurological symptom	1
6447	each of the symptoms cannot be fully explained by a known general medical condition or substance	1
6448	the symptoms are not intentionally produced or feigned	1
6449	lumbar radiculopathy	1
6450	pruritic nodules in scrotum	1
6451	painful nodules in extremities	1
6452	ingestion of reptile meat	1
6453	identification of spirometra parasite in tissue sample	1
6454	pruritic nodules in abdominal wall	1
6455	painful nodules in scrotum	1
6456	pruritic nodules in chest	1
6457	bleeding from nodules	1
6458	pruritic nodules in extremities	1
6459	painful nodules in chest	1
6460	painful nodules around orbit	1
6461	painful nodules in abdominal wall	1
6462	ingestion of amphibian meat	1
6463	pruritic nodules around orbit	1
6464	restricted range of motion of neck	1
6465	smooth, spherical mass superior to the testicle	1
6466	transilluminate	1
6467	small, spherical lenses	1
6468	lenticular myopia	1
6469	parental consanguinity	1
6470	orthopedic abnormalities	1
6471	clubfoot	1
6472	hip dislocation	1
6473	pressure sores	1
6474	abnormal eye movement	1
6475	latex allergy	1
6476	arnold chiari ii malformation	1
6477	corpus callosum abnormalities	1
6478	incidental discovery	1
6479	disorder of muscle or tendinous attachments of the spine	1
6480	hunchback	1
6481	cervical spondylotic myelopathy	1
6482	loss of hand dexterity	1
6483	hoffman sign	1
6484	arm pain	1
6485	leg numbness	1
6486	onset with activity	1
6487	bilateral neurogenic claudication (nc)	1
6488	leg paresthesia	1
6489	pain radiates downward	1
6490	infection with spirilla	1
6491	infection with spirochete	1
6492	dwarfism	1
6495	lordosis	1
6496	flattened vertebrae	1
6497	coxa vara (hip deformity)	1
6498	myopia	1
6499	detached retina	1
6500	onset in late childhood or early adolescence	1
6501	pain exacerbated by lumbar extension and twisting	1
6502	paraspinal muscle spasm and tenderness	1
6503	hamstring tightness	1
6504	defect in the pars interarticularis of the vertebral arch	1
6505	l5 involvement	1
6506	degenerative changes to vertebrae similar to osteoarthritis	1
6507	noticeable passage of fetal tissue	1
6508	age between 20 and 40	1
6509	sudden onset of dyspnea and pleuritic chest pain	1
6510	diminished breath sounds over affected side	1
6511	hyperresonance to percussion over affected side	1
6512	gardener	1
6513	agricultural worker	1
6514	exposure to cats	1
6515	nodular lesions	1
6516	lung cavitations	1
6517	hilar lymphadenopathy	1
6518	bony lesions	1
6519	contact with thorns	1
6520	draining nodule	1
6521	painless erythematous papule	1
6522	multiple papules along lymphatic channels	1
6523	contact with flowers	1
6524	contact with plants	1
6525	suppurative nodule	1
6526	draining papule	1
6527	suppurative papule	1
6528	positive sporothrix culture	1
6529	painless erythematous nodule	1
6530	tenosynovitis of ankle	1
6531	tenosynovitis of wrist	1
6532	upper lobe cavitary lesions on cxr	1
6533	single upper lobe cavitary lesion on cxr	1
6534	eastern australia	3
6535	north africa	3
6536	escha	1
6537	sub-saharan africa	3
6538	france	3
6539	positive rickettsia immunofluorescence	1
6540	negative rickettsia culture	1
6541	positive rickettsia culture	1
6542	rash with eschar	1
6543	negative rickettsia immunofluorescence	1
6544	rash on lower extremities	1
6545	facial edema	1
6546	nonblanching	1
6547	immobile	1
6548	open sore	1
6549	crater	1
6550	underlying damage	1
6551	exposure to stannous oxide or stannic oxide	1
6552	knee involvement	1
6553	joint swelling and warmth	1
6554	restricted movement	1
6555	recent ingestion of questionable food (1-6h prior to symptom)	1
6556	similar illness in others who ate same food	1
6557	staph in wound drainage	1
6558	generalized erythema	1
6559	staph in skin biopsy	1
6560	generalized bullae formation	1
6561	perioral crusting	1
6562	staph aureus infection	1
6563	traumatic event	1
6564	subjective high stress levels	1
6565	wheezing in early stages, disappearing in late stages indicating a severe airflow obstruction	1
6566	pulsus paradoxus >20mm hg	1
6567	altered mental status due to hypoxia	1
6568	migraine attack lasting for longer than 72 hours	1
6569	multiple sebum-filled cysts on the trunk, upper arms, and chest	1
6570	yellow or flesh colored lesions	1
6571	genetic	1
6572	decreased or absence of lacrimation	1
6573	foreign body sensation in eye	1
6574	chronic blepharoconjunctivitis	1
6575	hyperemia or keratinization of conjunctiva	1
6576	aminopenicillin	1
6577	anticonvulsant	1
6578	full thickness epidermal necrosis	1
6579	allopurinol	1
6580	herpes simplex virus	1
6581	macules	1
6582	malignancy	1
6583	sulfa	1
6584	inflammatory reaction of oral mucosa	1
6585	misalignment of the eyes	1
6586	maculopapular rash on extremities	1
6587	rash including palms and sole	1
6588	ulceroglandular syndrome	1
6589	chronic symptoms	1
6590	parotiditis	1
6591	group b strep	1
6592	group a strep	1
6593	early onset	1
6594	late onset	1
6595	dormitory housing	1
6596	inmate	1
6597	positive group a strep throat culture	1
6598	positive rapid strep test	1
6599	tonsillar exudates	1
6600	maternal transmission	1
6601	recent skin lesion	1
6602	respiratory alkalosis	1
6603	red eyes	1
6604	rapid strep test positive	1
6605	positive throat culture	1
6606	exposure to farm raised fish	1
6607	exposure to farm raised tilapia	1
6608	infection with streptococcus pneumoniae	1
6609	contact with pig products	1
6610	contact with pigs	1
6611	positive streptococcus suis culture	1
6612	incontinence with coughing	1
6613	incontinence with sneezing	1
6614	incontinence with laughing	1
6615	incontinence with exercise	1
6616	history of urethral trauma	1
6617	history of prostate surgery	1
6618	history of pelvic prolapse	1
6619	incontinence with physical activity	1
6620	urethral hypermobility with cotton swab test	1
6621	hormonal changes	1
6622	puberty	1
6623	hormone therapy	1
6624	parallel linear scars	1
6625	red or pale smooth scars	1
6626	parkinsonism	1
6627	symmetric presentation	1
6628	resting tremor	1
6629	postural hypotension	1
6630	restless leg syndrome	1
6631	pill-rolling tremor	1
6632	high-pitched breath sound	1
6633	chronic intermittent gastrointestinal, pulmonary, or cutaneous symptoms	1
6634	serpiginous, raised, erythematous track in the dermis visible to observers due to larvae migration (larva currens)	1
6635	periumbilical purpura	1
6636	stool examination to detect larvae	1
6637	detection by elisa	1
6638	endemic to tropical and subtropical regions	1
6639	protein-losing enteropathy	1
6640	siadh	1
6641	strongyloides larvae or ova in stool	1
6642	linear rash	1
6643	ileus	1
6644	urticarial rash over abdomen	1
6645	urticarial rash over thighs	1
6646	gram negative bacillary septicemia	1
6647	urticarial rash over buttocks	1
6648	bilateral diffuse pulmonary infiltrates on cxr	1
6649	high-pitched cry	1
6650	vitamin b12 deficiency	1
6651	nitrous oxide abuse	1
6652	copper deficiency	1
6653	progressive weakness and sensory ataxia	1
6654	macrocytosis	1
6655	association with sle	1
6656	proportion of patients with sle who have scle	1
6657	positive anti-ro/ssa antibody screen	1
6658	small, scaly papules that evolve into annular or psoriasiform lesions	1
6659	erythematous margins of lesions	1
6660	shoulder, forearm, neck, and upper torso involvement	1
6661	age greater than 50	1
6662	unilateral or bilateral weakness	1
6663	upper motor neuron signs	1
6664	lower motor neuron signs	1
6665	history of measles infection 7 to 10 years prior	1
6666	motor and sensory findings	1
6667	myoclonus with large jerks occurring every 5 to 10 seconds	1
6668	characteristic eeg complexes	1
6669	pain of the thyroid	1
6670	thyroid gland tender on exam	1
6671	diffuse enlargement of the thyroid gland	1
6672	operative vaginal delivery	1
6673	sudden, severe headache	1
6674	lateralized headache	1
6675	brief loss of consciousness	1
6676	history of a recent sudden and severe headache	1
6677	normal thyroxine level	1
6678	elevated tsh level	1
6679	miscarriage	1
6680	benign	1
6681	negative immunofluorescence	1
6682	relapsing pustular eruption	1
6683	flexural areas of trunk and proximal extremities	1
6684	"half-half" blister	1
6685	fragile blisters	1
6686	blisters coalesce	1
6687	falls	1
6688	impaired concentration	1
6689	impaired executive function	1
6690	firm erythematous nodules and plaques	1
6691	full-term	1
6692	obstetric trauma	1
6693	meconium aspiration	1
6694	painless subcutaneous nodules	1
6695	legs involved	1
6696	arms involved	1
6697	trunk involved	1
6698	face involved	1
6699	bone marrow abnormalities	1
6700	hemophagocytic lymphohistiocytosis	1
6701	existing autoimmune disease	1
6702	jia	1
6703	sjogrens	1
6704	dm1	1
6705	verrucous nodule or plaque	1
6706	secondary infection	1
6707	lower extremity affected	1
6708	hemisensory deficit	1
6709	history of head trauma	1
6710	increased csf opening pressure	1
6711	otitis	1
6712	deviated gaze	1
6713	crescent-shape hematoma on brain imaging	1
6714	head injury	1
6715	gradually increasing headache and confusion	1
6716	exposure to cork dust	1
6717	normal	1
6718	purple venous ectasias under tongue	1
6719	over 50	1
6720	chiropractic term	1
6721	pelvic discomfort	1
6722	sacroiliac joint popping or clicking with walking	1
6723	neurologic symptoms attributable to level of stenosis	1
6724	heavy or prolonged menstrual bleeding	1
6725	reproductive dysfunction	1
6726	pelvic pressure and pain	1
6727	sudden death of an infant under one year of age without medical explanation	1
6728	sleeping prone	1
6729	erythema and tenderness of sun exposed areas	1
6730	central area of pallor and anesthesia of the skin surrounded by edema	1
6731	history of malnutrition	1
6732	painful, erythematous swelling of postauricular area	1
6733	positive staph aureus culture of salivary discharge	1
6734	painful, erythematous swelling of preauricular area	1
6735	neck edema	1
6736	purulent drainage from salivary duct	1
6737	narrow qrs complex	1
6738	painful papules	1
6739	nonpruritic papules	1
6971	periungual nail inflammation	1
6740	prodromal phase with non-specific features like fevers, malaise, myalgia lasting up to one week	1
6741	paresthesias radiating from bite (if present)	1
6742	elurophobia (fear of cats)	1
6743	opisthotonos	1
6744	autonomic instability	1
6745	agitation and combativeness	1
6746	increased muscular tone and deep tendon reflexes	1
6747	flaccid paralysis with generalized areflexia	1
6748	endemic to sub-saharan african or south america	1
6749	malaise and headache	1
6750	erythema of the distal tip of the tongue with white coating in the center	1
6751	upper and lower gi hemorrhage	1
6752	low serum osmolality	1
6753	inappropriately elevated urine osmolality	1
6754	urine sodium concentration above 40 meq/l	1
6755	normal acid-base status	1
6756	normal adrenal and thyroid function	1
6757	knee arthritis	1
6758	cartilage tear	1
6759	lyme disease	1
6760	swelling behind the knee	1
6761	knee stiffness	1
6762	palpable nodules	1
6763	argyll-robertson pupils	1
6764	tabes dorsalis	1
6765	positive csf vdrl	1
6766	painless chancre	1
6767	maculopapular rash on palms and soles	1
6768	history of painless chancre	1
6769	wide gait	1
6770	diminished temperature sensation	1
6771	shooting pains	1
6772	eroding (gummatous) lesions on skin	1
6773	diminished proprioception	1
6774	history of untreated syphilis	1
6775	positive romberg sign	1
6776	dementia with confabulation	1
6777	diminished vibration sensation	1
6778	syrinx of spinal cord or brainstem	1
6779	fourth ventricle communication	1
6780	csf obstruction	1
6781	arnold-chiari malformation	1
6782	dissociated sensory loss	1
6783	decreased pain	1
6784	decreased temperature sensation	1
6785	preserved light touch sensation	1
6786	preserved vibratory sensation	1
6787	shawl-like distribution	1
6788	upper extremity atrophy	1
6789	painless ulcers of hands	1
6790	hyporeflexia of arms	1
6791	upper extremity weakness	1
6792	lower extremeties spared	1
6793	thickened skin	1
6794	hardened skin	1
6795	tight skin	1
6796	raynaud's phenomenon	1
6797	reflux esophagitis	1
6798	decreased motility	1
6799	watermelon stomach (gave syndrome)	1
6800	ana positive	1
6801	tenia proglottids in stool	1
6802	tenia ova in stool	1
6803	passage of tape-like segments	1
6804	ingestion of pig products	1
6805	foot pain	1
6806	foot numbness	1
6807	provocation with eversion or dorsiflexion	1
6808	tinel sign	1
6809	radiates from medial ankle distally	1
6810	history of trauma to ankle	1
6811	history of trauma to knee	1
6812	ligamentous injury	1
6813	meniscal injury	1
6814	history of knee surgery	1
6815	locking	1
6816	sensation of "giving way"	1
6817	worse with activity	1
6818	joint locking	1
6819	limited range of motion of knee	1
6820	clicking sensation	1
6821	sensation of knee "giving way"	1
6822	pain with getting out of a car	1
6823	positive mcmurray test	1
6824	cooper's sign	1
6825	chewing of objects	1
6826	ear discomfort or dysfunction	1
6827	tmj discomfort or dysfunction	1
6828	unilateral pain	1
6829	decreased mandibular range of motion with or without clicking noises on jaw closure	1
6830	involuntary jaw clenching	1
6831	jaw deviation to the affected side	1
6832	shoulder pain radiating down the arm	1
6833	moderate intensity, bilateral, non throbbing headache	1
6834	lack of other associated symptoms	1
6835	unilateral head pain	1
6836	facial nerve weakness	1
6837	trauma with metal	1
6838	extraocular movement palsy	1
6839	trauma with rusted metal	1
6840	history of fracture	1
6841	positive tetanus serology (taken prior to giving antitoxin)	1
6842	negative tetanus serology (taken prior to giving antitoxin)	1
6843	risus sardonicus	1
6844	painful whole-body spasms	1
6845	flexion of arms and extension of legs	1
6846	lockjaw	1
6847	increased orbicularis oris tone	1
6848	opisthotonic posturing	1
6849	facial spasm	1
6850	diminished muscle tone near local trauma	1
6851	weakness near local trauma	1
6852	spasms near site of local trauma	1
6853	rigidity near local trauma	1
6854	birth to non-tetanus-immunodeficiency mother	1
6855	30s ribosome inhibitor leading to bacteriostatic action	1
6856	hypercyanotic spells during periods of increased activity	1
6857	single second heart sound	1
6858	harsh systolic ejection murmur with crescendo-decrescendo sound best heard along the left upper sternal border	1
6859	prominent right ventricular impulse	1
6860	improval of cyanosis with squatting	1
6861	right ventricular outflow obstruction	1
6862	overriding aorta	1
6863	right ventricular hypertrophy	1
6864	paralysis of bilateral arms and legs	1
6865	chipmunk facies	1
6866	prominent maxillae	1
6867	cardiac malfunction	1
6868	hypochromic, microcytic anemia with dramatically abnormal red cell morphology	1
6869	presence of tear drop, target cells, and heinz bodies on peripheral smear	1
6870	elevated serum iron	1
6871	elevated transferrin saturation	1
6872	palpable splenomegaly	1
6873	hypochromic, microchromic red blood cells	1
6874	normal red cell distribution width	1
6875	large number of target cells and teardrop-shaped cells	1
6876	worm in conjunctival sac	1
6877	gases with medical benefit	1
6878	binocular vertical, horizontal or oblique diplopia	1
6879	unreactive pupil	1
6880	paralysis of adduction, elevation, and depression of the eye	1
6881	eye rests in a "down and out" position	1
6882	bleeding during the first 20 weeks of pregnancy	1
6883	history of tobacco use	1
6884	recurrent inflammation and thrombosis of vessels of hands and feet	1
6885	pain with rest and walking	1
6886	sensitivity to cold	1
6887	diminished peripheral pulses	1
6888	decreased hair growth	1
6889	hypercoagulability	1
6890	scleroderma	1
6891	vessel inflammation	1
6892	recurrent	1
6893	separated by time and space	1
6894	palpable nodule	1
6895	erythema and inflammation	1
6896	palpable veins	1
6897	superficial vein thrombosis	1
6898	pancreatic carcinoma	1
6899	recurrent superficial thrombophlebitis	1
6900	lung cancer	1
6901	recent myocardial infarction	1
6902	symptoms dependent on size, location, and behavior of thrombus	1
6903	category including hus and ttp	1
6904	loss of libido	1
6905	feminization	1
6906	pretibial myxedema	1
6907	toxic multinodular goitre	1
6908	thyroiditis	1
6909	pituitary adenoma	1
6910	toxic thyroid adenoma	1
6911	heat intolerance	1
6912	increased appetite	1
6913	subacute thyroiditis	1
6914	elevated thyroid stimulating hormone	1
6915	postpartum thyroiditis	1
6916	chronic thyroiditis	1
6917	history of interferon-alpha use	1
6918	unilateral neck pain	1
6919	neck tenderness	1
6920	nontender enlarged thyroid	1
6921	tender enlarged thyroid	1
6922	perspiration	1
6923	proximal weakness	1
6924	frequent bowel movement	1
6925	warm, moist skin	1
6926	widened pulse pressure	1
6927	thyromegaly	1
6928	levothyroxine ingestion	1
6929	munchausen syndrome	1
6930	factitious disorder	1
6931	tenderness over medial knee joint	1
6932	effusion	1
6933	relief of symptoms with injection of local anesthetic and steroid	1
6934	repeated, individually recognizable, intermittent movements that are almost always briefly suppressible and are usually associated with awareness of an urge to perform the movement	1
6935	normal child	1
6936	sudden onset of fever followed by at least two intervening afebrile periods	1
6937	first fever episode ends with rigors followed by diffuse diaphoresis and hypotension	1
6938	polyarthralgia	1
6939	unilateral or bilateral bell's palsy	1
6940	recent travel to the mountainous west or southwest/south central region of the usa	1
6941	recent travel to the mediterranean	1
6942	biphasic illness, with viremic phase followed by neurologic phase	1
6943	demonstration of igm antibody in csf	1
6944	mri abnormalities	1
6945	csf examination showing pleocytosis	1
6946	slowly enlarging erythematous scaling patch on the scalp that cause areas of alopecia within the lesion	1
6947	centrifugally spreading erythematous scaling patch or plaque with central clearing resulting in an annular form	1
6948	koh preparation shows segmented hyphae and arthrospores	1
6949	erythematous patch on the inner aspect of one or both thighs that spreads centrifugally, sparing the scrotum in men	1
6950	superficial mycosis endemic to the south pacific islands and south asia	1
6951	concentric, lamellar (tiled, ring like scaly plaques	1
6952	tinea pedis infection involving the palms and flexor aspects of the fingers	1
6953	superficial fungal infection of the palms and soles	1
6954	large brown macule on palm and sole	1
6955	koh scraping showing branching hyphae	1
6956	painful fissures	1
6957	skin lesion of toes	1
6958	vesicular lesion	1
6959	ulcerative lesion	1
6960	scaled feet	1
6961	interdigital	1
6962	maceration	1
6963	between 4th and 5th toes	1
6964	toenail	1
6965	fingernail	1
6966	subungual hyperkeratosis	1
6967	onycholysis	1
6968	yellow nail	1
6969	milky white nail	1
6970	rough, crumbling nail	1
6972	onset during activity	1
6973	pain radiates to back, pelvis or thigh	1
6974	sharp or stabbing pain	1
6975	unilateral, tender adnexal mass	1
6976	tenderness to palpation	1
6977	testicular malignancy	1
6978	severe scrotal pain	1
6979	inguinal or scrotal swelling	1
6980	absent cremasteric reflex	1
6981	prior episode of recurrent acute scrotal pain	1
6982	firm scrotal mass	1
6983	transillumination	1
6984	high position of testis	1
6985	activity induced	1
6986	gestes antagonistiques	1
6987	head and neck dystonia	1
6988	head tilt	1
6989	cervical dystonia	1
6990	paralysis of ocular movements	1
6991	reported bite, or sting	1
6992	coughing, choking if aspirating	1
6993	ventricular arrhythmias	1
6994	ingestion or exposure to metal	1
6995	variable symptoms depending on which metal is exposed	1
6996	variable symptoms depending on which gas, fume, or vapour	1
6997	variable symptoms depending on what substance	1
6998	variable symptoms depending on which substance consumed	1
6999	anesthesia	1
7000	exposure to isopropyl alcohol	1
7001	osmolar gap	1
7002	fruity odor of breath	1
7003	behavior in which the basic rights of others or major age-appropriate societal norms or rules are violated, as manifested by the presence of three (or more) of the following criteria in the past 12 months, with at least one criterion present in the past 6 months: aggression to people and animals, destruction of property, deceitfulness or theft, serious violations of the rules	1
7004	symptoms depend on specific toxin	1
7005	liver carcinoma	1
7006	consumption of peanuts	1
7007	consumption of tree nuts such as pecans	1
7008	consumption of corn	1
7009	consumption of wheat	1
7010	consumption of oil seeds	1
7011	chronic pancreatitis	1
7012	peripheral arterial disease	1
7013	changes in fingernail pigmentation (leukonychia striata)	1
7014	muscle cramping	1
7015	exposure to well water	1
7016	exposure to nail polish, paint remover, solvent or glue	1
7017	sweet solvent odor	1
7018	nasopharyngitis	1
7019	tracheobronchitis	1
7020	chronic beryllium disease	1
7021	exposure to chalk pastels	1
7022	history of smelting	1
7023	liver toxicity	1
7024	increased risk of fracture	1
7025	hyperchloremia	1
7026	decreased respiratory drive	1
7027	fasciculations	1
7028	manufacturing of rayon, cellophane, or carbon tetrachloride	1
7029	manufacturing of rubber and pesticides	1
7030	exposure to smoke	1
7031	improper ventilation	1
7032	erythema of skin and mucous membranes	1
7033	pain, tearing, and irritation of the eyes	1
7034	burning sensation of mouth	1
7035	violent cough	1
7036	lacrimation, salivation, and blepharospasm	1
7037	cns depression at extremely high concentrations (greater than 11%)	1
7038	cns depression	1
7039	increased respiratory rate	1
7040	contact dermatitis	1
7041	bronchogenic cancers	1
7042	perioral paresthesias	1
7043	painful dentition	1
7044	temperature dysesthesias	1
7045	heart block	1
7046	cardiac and renal failure	1
7047	hepatic necrosis	1
7048	variable symptoms depending on which toxin	1
7049	exposure to burning plastics, industrial exposure	1
7050	bitter, almond odor	1
7051	ingestion of hydrocarbon	1
7052	exposure to solvents	1
7053	disinhibited behavior	1
7054	incoordination	1
7055	chemical burns	1
7056	cardiac arrest	1
7057	kidney toxicity	1
7058	respiratory irritation	1
7059	mobile home	1
7060	exposure to fermentation byproducts	1
7061	visual blurring	1
7062	sedation	1
7063	inebriation	1
7064	ingestion of solvents or cleaners	1
7065	cranial nerve tetany	1
7066	endocrine disruptions	1
7067	exposure to ddt	1
7068	eye and respiratory tract irritation	1
7069	increased incidence of leukemia in those occupationally exposed	1
7070	tachycardia and hypertension followed by bradycardia and hypotension	1
7071	bitter, almond odor of gas	1
7072	tremulousness	1
7073	variable symptoms depending on which berries	1
7074	variable symptoms depending on which mushrooms	1
7075	gastric and esophageal burns if ingested	1
7076	increased lacrimation	1
7077	upper respiratory tract irritation	1
7078	temporary blindness	1
7079	parkinsonian symptoms	1
7080	employment as welder	1
7081	illicit methcathinone manufacturing	1
7082	exposure to contaminated illicit drugs	1
7083	skin peeling	1
7084	salivation	1
7085	loss of hair, teeth and nails	1
7086	rashes	1
7087	consumption of contaminated seafood	1
7088	mood disturbances	1
7089	tremors	1
7090	symptoms dependent on what type of metal	1
7091	ingestion of antifreeze	1
7092	renal toxicity	1
7093	topical exposure	1
7094	inhalant abuse	1
7095	exposure to insecticide	1
7096	bronchorrhea	1
7097	bronchospasm	1
7098	urination	1
7099	symptoms dependent on what type of toxin	1
7100	symptoms vary by specific agent	1
7101	organochlorine exposure	1
7102	organophosphate exposure	1
7103	exposure to kerosene, gasoline, liquid furniture polish	1
7104	aspiration pneumonitis	1
7105	choking	1
7106	gagging	1
7107	inhalation of fumes	1
7108	local chemical burn	1
7109	hepatotoxicity	1
7110	neurotoxicity	1
7111	necrosis of jaw ("phossy jaw")	1
7112	toxic exposure	1
7113	convulsion	1
7114	hyperthermia	1
7115	erythematous rash	1
7116	urticarial rash	1
7117	exposure to improperly stored fish	1
7118	perioral burning, itching, or edema	1
7119	variable symptoms depending on which snake venom	1
7120	history of snake bite	1
7121	ph imbalance	1
7122	"awake seizure", in which patient has tonic clonic movements but remains fully alert	1
7123	respiratory paralysis	1
7124	burning and lacrimation of the eyes	1
7125	laryngeal edema	1
7126	bronchoconstriction	1
7127	positive romberg test	1
7128	excess salivation	1
7129	secondary effects of depressant effects including hypotension, cns depression, respiratory depression	1
7130	variable symptoms depending on which fish	1
7131	variable symptoms depending on which marine life	1
7132	variable symptoms depending on which animal contacted	1
7133	variable symptoms depending on which toxin ingested	1
7134	variable symptoms depending on which toxin involved	1
7135	exposure to arthropod	1
7136	symptoms vary by species	1
7137	exposure to reptiles	1
7138	exposure to scorpion	1
7139	hypersalivation	1
7140	abnormal eye movements	1
7141	exposure to spider	1
7142	spider bite	1
7143	widow spider	1
7144	funnel web spider	1
7145	recluse spider	1
7146	localized diaphoresis	1
7147	necrotic lesion	1
7148	ingestion of very high doses of zinc	1
7149	chronic copper deficiency	1
7150	disturbed sleep-wake cycle	1
7151	disorganized thought process	1
7152	erythema in response to external substance	1
7153	nausea, vomiting, diarrhea in response to external substance	1
7154	liver dysfunction/disease in response to external substance	1
7155	macular erythema	1
7156	conjunctival hyperemia	1
7157	positive staph aureus culture	1
7158	negative leptospirosis serology	1
7159	use of super-absorbent tampons	1
7160	dermal erythema	1
7161	fasciitis	1
7162	vaginal erythema	1
7163	elevated creatine phosphokinase	1
7164	oropharyngeal hyperemia	1
7165	negative cultures	1
7166	tender nodular rash on legs	1
7167	eczema	1
7168	papillitis	1
7169	toxocara larvae in tissue	1
7170	negative toxocara serology	1
7171	ascaris larvae in tissue	1
7172	positive toxocara serology	1
7173	tender nodular rash on trunk	1
7174	negative toxoplasma naat	1
7175	negative toxoplasma serology	1
7176	positive toxoplasma naat	1
7177	positive toxoplasma serology	1
7178	extrapyramidal symptoms	1
7179	symmetrical neurologic signs	1
7180	intracranial calcifications	1
7181	birth to mother infected with toxoplasma	1
7182	retinochoroiditis	1
7183	necrotizing retinitis	1
7184	follicular hypertrophy	1
7185	conjunctival scarring	1
7186	deviated eyelashes	1
7187	ulcerated conjunctive	1
7188	conjunctival edema	1
7189	preauricular lymphadenopathy	1
7190	neurologic changes	1
7191	loss of vibration sense	1
7192	hypersegmented neutrophils	1
7193	infection with bartonella quintana	1
7194	incubation period of 5 to 20 days	1
7195	episodic fevers lasting 4 to 5 days with four to five days afebrile in between	1
7196	painful shins	1
7197	firm, slow growing subcutaneous nodules derived from a hair follicle	1
7198	located on the scalp	1
7199	family history of lesions	1
7200	presents after puberty	1
7201	recent consumption of undercooked pork	1
7202	subungual splinter hemorrhages	1
7203	ocular pain	1
7204	diminished joint mobility	1
7205	positive trichinella serology	1
7206	negative trichinella serology	1
7207	decreased erythrocyte sedimentation rate (esr)	1
7208	trichinella larvae in tissue	1
7209	ingestion of undercooked pork	1
7210	ingestion of undercooked meat	1
7211	chemosis	1
7212	yellow vaginal discharge	1
7213	frothy vaginal discharge	1
7214	positive trichomonas elisa	1
7215	gas-filled blebs in vaginal wall	1
7216	positive trichomonas antigen detection test	1
7217	vulvar ulceration	1
7218	foul-smelling vaginal discharge	1
7219	negative trichomonas elisa	1
7220	vaginal pruritus	1
7221	trichomonas on microscopy of vaginal discharge	1
7222	negative trichomonas naat	1
7223	green vaginal discharge	1
7224	strawberry cervix	1
7225	positive trichomonas naat	1
7226	vaginal discharge ph >4.5	1
7227	negative trichomonas antigen detection test	1
7228	acquired structural hair abnormality resulting in fragile and brittle hair	1
7229	fraying of the hair shaft	1
7230	consumption of unwashed vegetables fertilized with contaminated manure	1
7231	peripheral eosinophilia	1
7232	compulsive urge to pull out one's hair	1
7233	tension before pulling hair	1
7234	relief after pulling hair	1
7235	trichuris on stool microscopy	1
7236	hypoproteinemia	1
7237	visualization of adult trichuris worms	1
7238	s3 gallop	1
7239	jvd with prominent v wave	1
7240	pansystolic murmur	1
7241	jvd with prominent a wave	1
7242	tricuspid opening snap	1
7243	diastolic murmur at left sternal border, increasing with inspiration	1
7244	widely split s1	1
7245	prolongation of pr interval	1
7246	first degree av block	1
7247	right bundle branch block	1
7248	left anterior or posterior fascicular block	1
7249	unilateral facial pain	1
7250	pain along cranial nerve v	1
7251	pain radiating to maxillary or mandibular area	1
7252	facial spasm or tic	1
7253	stabbing facial pain	1
7254	right side	1
7255	triggered by chewing, talking or smiling	1
7256	triggered by drinking hot or cold fluids	1
7257	triggered by touching, shaving, brushing teeth, blowing nose	1
7258	triggered by cold air while driving	1
7259	pain shoots from corner of mouth to angle of jaw	1
7260	pain shoots from upper lip to eye and eyebrow	1
7261	pain involves ophthalmic branch of facial nerve	1
7262	paroxysmal	1
7263	sensation of electric shocks	1
7264	occurs during sleep	1
7265	onset after age 40	1
7266	multiple sclerosis	1
7267	locking or catching with flexion-extension activity	1
7268	stiff digit	1
7269	pain over distal palm	1
7270	pain radiating along digit	1
7271	pain with extension	1
7272	tender nodule over mcp joint	1
7273	woman of childbearing age	1
7274	recurrent uti	1
7275	lateral hip pain	1
7276	pain radiates down lateral thigh	1
7277	point tenderness over greater trochanter	1
7278	pain radiates to foot	1
7279	bursal swelling	1
7280	provocation with passive external rotation but not internal rotation	1
7281	fusobacterium on wound culture	1
7282	deep, painful, foul-smelling ulcer	1
7283	borrelia on wound culture	1
7284	fusobacterium on wound smear	1
7285	borrelia on wound smear	1
7286	deep, painful, foul-smelling ulcer of leg	1
7287	recurrent dry cough	1
7288	positive filaria antibodies	1
7289	reticulonodular opacities on cxr	1
7290	symptoms worse at night	1
7291	weakness of legs	1
7292	tropical regions	3
7293	pulmonary lymphocytic alveolitis	1
7294	polymyositis	1
7295	keratoconjunctivitis sicca	1
7296	infectious dermatitis	1
7297	tropical regions in past 10 years	3
7298	stomatitis	1
7299	mucosal malabsorption	1
7300	b-12 deficiency	1
7301	persistent headaches	1
7302	decreased complement levels	1
7303	transient rashes	1
7304	negative trypanosome immunofluorescent assay	1
7305	positive card agglutination test for trypanosomiasis (catt)	1
7306	erythematous macules on trunk	1
7307	elevated icp	1
7308	trypanosomes in blood smear	1
7309	elevated csf igm	1
7310	negative card agglutination test for trypanosomiasis (catt)	1
7311	trypanosomes in lymph node aspirate	1
7312	tremors of tongue	1
7313	trypanosomes in csf	1
7314	tremors of fingers	1
7315	increased csf protein	1
7316	elevated blood igm	1
7317	positive trypanosome immunofluorescent assay	1
7318	history of painless skin chancre	1
7319	first trimester vaginal bleeding	1
7320	appearance of symptoms 6 to 8 weeks after last normal menstrual period	1
7321	skin lesion +/- an enlarged nerve accompanied by sensory loss	1
7322	painless wounds or burns on hands or feet	1
7323	hand weakness	1
7324	lack of eyebrows and eyelashes	1
7325	sudden eruption of numerous, painful nodules	1
7326	acid fast bacilli found in peripheral lesion skin biopsies	1
7447	burning	1
7327	nodular infiltrate in upper lobes on cxr	1
7328	ppd > 10mm in immunocompetent pt	1
7329	bronchial breath sounds in upper lobes	1
7330	prolonged fever	1
7331	patchy infiltrate in upper lobes on cxr	1
7332	negative afb sputum	1
7333	supraclavicular lymphadenopathy	1
7334	exposure to person with tb	1
7335	positive afb sputum	1
7336	positive tuberculosis elispot	1
7337	positive tb cultures	1
7338	positive tuberculosis interferon gamma release assay	1
7339	positive tuberculosis elisa	1
7340	history of positive ppd	1
7341	ppd > 5mm in immunocompromised	1
7342	crackles in upper lobes	1
7343	development of benign tumors in multiple organs	1
7344	ash-leaf spots	1
7345	angiofibromas involving the malar region of the face	1
7346	shagreen patches	1
7347	brown fibrous plaque on the forehead visible on affected infant and neonates	1
7348	longitudinal nail grooves in fingernails and toenails	1
7349	cortical tubers (glioneuronal hamartomas) visible on mri	1
7350	white matter heterotopia	1
7351	subependymal nodules	1
7352	autosomal dominant mutation in the tsc1 or tsc2 gene, with de novo mutations accounting for 80% of cases	1
7353	subependymal giant cell tumors (sgct)	1
7354	seizures beginning in the first year of life	1
7355	cognitive disability	1
7356	behavioral problems	1
7357	rhabdomyoma	1
7358	angiomyolipomas of the kidney	1
7359	retinal hamartomas	1
7360	18 fold increased relative risk of invasive malignancy versus unaffected population	1
7361	white blood cells in urine	1
7362	white cell casts in urine	1
7363	acute onset of fever and malaise	1
7364	single ulcerative lesion with central eschar at the site of a tick bite	1
7365	painful regional lymphadenopathy	1
7366	suppurative lymphadenopathy	1
7367	cardiac dysrhythmias	1
7368	pruritic ulcer on foot	1
7369	pain and issues in foot	1
7370	edematous ulcer on foot	1
7371	history of walking on dry soil	1
7372	painful nodule	1
7373	abscess on foot	1
7374	painful papule on foot	1
7375	pain on walking	1
7376	toenail loss	1
7377	tunga parasite on biopsy of lesion	1
7378	painful nodule on foot	1
7379	painful papule	1
7380	foot digit deformation	1
7381	painful ulcer on foot	1
7382	short stature	1
7383	widely spaced nipples	1
7384	webbed neck	1
7385	cubitus valgus	1
7386	madelung deformity of the forearm	1
7387	newborns with lymphedema of the hands and feet	1
7388	"streak" ovaries	1
7389	horseshoe kidney	1
7390	bicuspid aortic valve	1
7391	history of tympanostomy tubes	1
7392	whitish plaques on the tympanic membrane observed via otoscopy	1
7393	pneumatic otoscopy demonstrating decreased mobility	1
7394	hearing impairment of less than 0.5db	1
7395	positive salmonella blood cultures	1
7396	alt:ldh > 9:1	1
7397	delerium	1
7398	positive salmonella pcr	1
7399	alt:ldh < 9:1	1
7400	fever (increasing)	1
7401	elevated aptt	1
7402	frontal headache	1
7403	positive salmonella bone marrow aspiration culture	1
7404	moderate anemia	1
7405	foul-smelling diarrhea (pea soup)	1
7406	crackles in lung bases	1
7407	elevated pt	1
7408	rose spots (2-3mm macules on abdomen after 1wk)	1
7409	diffuse abdominal pain	1
7410	peripheral gangrene	1
7411	necrotic rash	1
7412	history of arthropod bite	1
7413	abrupt onset of rash, headache, and fever	1
7414	maculopapular/petechial rash that begins in the axilla and spreads peripherally	1
7415	eschar at site of arthropod bite	1
7416	morbilliform rash	1
7417	exposure to mites	1
7418	exposure to fleas	1
7419	southern california	3
7420	texas	3
7421	hawaii	3
7422	exposure to rats	1
7423	recurrent bloody diarrhea	1
7424	colon cancer	1
7425	mild intermittent rectal bleeding	1
7426	bowel urgency	1
7427	mucous-like stool	1
7428	abrupt onset fever and chills that remit and recur	1
7429	pulse-temperature disassociation	1
7430	lymphatic spread	1
7431	ulcerated skin lesion	1
7432	pain at umbilicus	1
7433	pressure	1
7434	protrusion at umbilicus	1
7435	fascial defect	1
7436	jaw pain	1
7437	symptoms occur at rest	1
7438	symptoms becoming more frequent	1
7439	symptoms becoming more severe	1
7440	symptoms so not respond to rest or ntg	1
7441	normal cardiac markers	1
7442	symptoms dependent on toxin	1
7443	history of urethral infection	1
7444	abnormal connection between urethra and surrounding anatomy	1
7445	obstructive voiding symptoms	1
7446	recurrent urinary tract infections	1
7448	discharge at the urethral meatus	1
7449	polymorphonuclear cells visible on microscopy of urethral swab	1
7450	positive leukocyte esterase on urine sample	1
7451	protrusion of the small bowel through the vagina	1
7452	history of vaginal delivery	1
7453	difficulty with defecation	1
7454	sensation of pelvic pressure	1
7455	feeling of something protruding from the vagina	1
7456	involuntary contraction of the muscles surrounding the vaginal orifice	1
7457	increased vaginal odor	1
7458	negative varicella serology	1
7459	vesicles on erythematous base	1
7460	positive varicella naat	1
7461	positive varicella serology	1
7462	empyema	1
7463	rash moving from head to trunk	1
7464	negative varicella naat	1
7465	generalized pruritic vesicular rash	1
7466	dilated, tortuous veins greater than 3mm in diameter	1
7467	family history of varicose veins	1
7468	sudden onset of dementia	1
7469	aphasia, apraxia, or agnosia	1
7470	anterograde amnesia	1
7471	focal motor signs	1
7472	gait disturbances	1
7473	urinary symptoms unrelated to urologic disease	1
7474	stepwise deterioration	1
7475	personality or mood changes	1
7476	symptoms dependent on what vascular involved	1
7477	gait difficulty	1
7478	symptoms worse in lower extremities	1
7479	lower body parkinsonism	1
7480	hernia on anterior side of body	1
7481	association with acute myocardial infarction	1
7482	cause of sudden cardiac death	1
7483	chromosomal abnormality	1
7484	fatigue with feeding	1
7485	frequent respiratory infection	1
7486	holosystolic murmur loudest at left sternal border	1
7487	loss of color vision	1
7488	weakness of quadriceps	1
7489	"drop attack"	1
7490	knee weakness	1
7491	brief	1
7492	trochlear nerve palsy	1
7493	cranial nerve four palsy	1
7494	oculomotor nerve palsy	1
7495	renal dysplasia	1
7496	febrile uti	1
7497	prolonged obstructed labor	1
7498	ureteric injury	1
7499	history of gynecologic surgery	1
7500	history of hysterectomy	1
7501	uncontrolled leakage of urine into vagina	1
7502	recurrent cystitis	1
7503	recurrent pyelonephritis	1
7504	rapid onset of vertigo	1
7505	gait instability	1
7506	positive head thrust test	1
7507	patient falls towards the side of the lesion	1
7508	fast phase of nystagmus beats away from affected side	1
7509	absence of other neurologic signs	1
7510	auditory function preserved	1
7511	urticaria in response to vibrations	1
7512	ingestion of seafood	1
7513	positive vibrio stool culture	1
7514	response to doxycycline	1
7515	myonecrosis	1
7516	brackish or salt water exposure	1
7517	ingestion of raw seafood	1
7518	history of chronic liver disease	1
7519	bullous skin lesions	1
7520	history of immunosuppression	1
7521	hemorrhagic bullae	1
7522	history of hemochromatosis	1
7523	gram negative rod	1
7524	history of alcohol abuse	1
7525	caused by adenovirus in majority of cases	1
7526	viral prodrome	1
7527	conjunctival erythema (injection) and erythema	1
7528	sandy, dry feeling in the affected eye	1
7529	unilateral eye involvement initially, followed by second eye involvement in 24 to 48 hours	1
7530	subacute to acute presentation	1
7531	upper respiratory system infection symptoms	1
7532	acute to subacute presentation	1
7533	s3 heart sound	1
7534	history of viral illness or rash	1
7535	lv systolic dysfunction	1
7536	adenovirus infection	1
7537	history of child going to summer camp with a pool or lake	1
7538	exposure to soil or food contaminated by dog or cat feces	1
7539	nodular lesions on liver	1
7540	pruritic, urticarial like skin lesions	1
7541	asymptomatic infection	1
7542	kala-azar syndrome	1
7543	subacute presentation of fever, weight loss, malaise, and splenomegaly over months	1
7544	left upper quadrant discomfort	1
7545	confirmation of infection by histopathology of biopsy of affected organs	1
7546	poor bone grown	1
7547	dermatological problems	1
7548	impaired immune system functioning	1
7549	fat malabsorption syndromes	1
7550	symptoms dependent on which specific b vitamin deficiency is present	1
7551	hypocobalaminemia	1
7552	sore tongue	1
7553	elevated methylmalonic acid (mma)	1
7554	positive babinski	1
7555	veganism	1
7556	intrinsic factor deficiency	1
7557	rickets	1
7558	decreased exposure to daylight	1
7559	hypopigmented lesions	1
7560	well-demarcated lesions	1
7561	diabetic retinopathy	1
7562	terson syndrome	1
7563	visual haze	1
7564	cloudy vision	1
7565	visual shadows	1
7566	blood in vitreous gel and/or anterohyaloid or retrohyaloid spaces on ophthalmoscopic evaluation	1
7567	complication of cataract surgery	1
7568	rupture of anterior vitreous face	1
7569	pupil distortion	1
7570	hypertonicity	1
7571	progressive abdominal pain	1
7572	obstipation	1
7573	recurrent abdominal pain	1
7574	inherited	1
7575	prolonged bleeding	1
7576	improvement of symptoms with oral contraceptives	1
7577	family history of bleeding disorder	1
7578	the act of looking at unsuspecting individuals, usually strangers, who are naked, in the process of disrobing, or engaging in sexual activity	1
7579	the sexual urges or fantasies cause marked distress or interpersonal difficulty	1
7580	varicose veins of the vulva	1
7581	feeling of fullness or pressure in the vulvar area	1
7582	vulvar swelling	1
7583	tenderness over lesion	1
7584	fluctuant on palpation	1
7585	"b" symptoms	1
7586	other symptoms related to hyperviscosity of blood	1
7587	dilated, segmented retinal vein s	1
7588	bence jones protein in urine	1
7589	elevated beta-2 microglobulin level	1
7590	detection of monoclonal igm protein on serum protein electrophoresis	1
7591	adrenal failure due to hemorrhage	1
7592	meningococcemia	1
7593	nonspecific pain	1
7594	cyanotic extremities	1
7595	tongue atrophy	1
7596	angular cheilitis (cracks in the corners of the mouth)	1
7597	inflammation of the subcutaneous fat	1
7598	deep inflammatory nodules or plaques	1
7599	tenderness to palpation of the nodules	1
7600	symmetric nodules	1
7601	nodules resolve over 2 weeks, leaving a depressed scar	1
7602	saddle nose deformity	1
7603	ear, nose, and throat complaints	1
7604	lower extremity palpable purpura	1
7605	dermal hyperesthesia	1
7606	negative flavivirus / wesselsbron virus serology	1
7607	positive flavivirus / wesselsbron virus naat	1
7608	positive flavivirus / wesselsbron virus serology	1
7609	negative flavivirus / wesselsbron virus naat	1
7610	rash moving from trunk to head	1
7611	retrobulbar pain	1
7612	positive flavivirus / west nile virus naat	1
7613	negative flavivirus / west nile virus naat	1
7614	positive flavivirus / west nile virus serology	1
7615	negative flavivirus / west nile virus serology	1
7616	csf plasmacytosis	1
7617	paresis	1
7618	tremor of extremities	1
7619	endemic to north and south america	1
7620	igm antibody in csf	1
7621	gram positive bacteria on gram stain	1
7622	positive t. whipplei culture	1
7623	negative t. whipplei naat	1
7624	thickened mitral valve on echo	1
7625	thickened aortic valve on echo	1
7626	chronic nonproductive cough	1
7627	positive t. whipplei naat	1
7628	nonspecific ecg changes	1
7629	pas-positive macrophages in intestinal biopsy	1
7630	infection of hair shaft by trichosporonosis	1
7631	hair shaft breaks at base	1
7632	soft, ivory colored nodules involving the genital and facial hair more frequently than the scalp and torso	1
7633	one to weeks of cold symptoms	1
7634	whooping sound on inspiration after coughing fit	1
7635	posttussive emesis	1
7636	prolonged cough without characteristic "whooping" classic for adult infection	1
7637	whooping	1
7638	paroxysms	1
7639	post-tussive vomiting	1
7640	bordetella holmesii	1
7641	bordetella bronchiseptica	1
7642	sga	1
7643	no history of mechanical ventilation	1
7644	recessive	1
7645	autoimmune disorder	1
7646	decreased igm	1
7647	elevated iga	1
7648	symptoms dependent on which drug used	1
7649	tropical area	1
7650	poor socioeconomic conditions	1
7651	mental disability	1
7652	psychiatric illness	1
7653	vascular occlusive disease	1
7654	open wound	1
7655	painful skin lesions	1
7656	furuncles	1
7657	prolonged	1
7658	generalized peeling	1
7659	neonatal	1
7660	fine scaling	1
7661	axillary involvement	1
7662	soft yellow plaque	1
7663	medial aspect of eyelid	1
7664	primary biliary cirrhosis	1
7665	melanoma	1
7666	squamous cell carcinoma	1
7667	sensitivity to uv damage	1
7668	severe sunburn	1
7669	solar keratoses	1
7670	skin cancer	1
7671	corneal ulceration	1
7672	skin cracking	1
7673	winter	1
7674	frequent bathing	1
7675	frequent hand washing	1
7676	necrotic lesions of skin	1
7677	necrotic lesions of bone	1
7678	soft tissue suppuration	1
7679	gummatous lesions of bone	1
7680	hyperkeratotic plaque	1
7681	necrotic lesions of nasopharynx	1
7682	gummatous lesions of nasopharynx	1
7683	gummatous lesions of skin	1
7684	ulcerating lesions	1
7685	periostitis	1
7686	dermal papillomata	1
7687	positive flavivirus / yellow fever virus naat	1
7688	negative flavivirus / yellow fever virus naat	1
7689	positive flavivirus / yellow fever virus serology	1
7690	bleeding diathesis	1
7691	hypertriglyceridemia	1
7692	elevated hepatic enzymes	1
7693	musculoskeletal pain	1
7694	extrapyramidal reaction	1
7695	akathisia	1
7696	gastric distress	1
7697	injection site reaction	1
7698	increased creatinine phosphokinase	1
7699	accommodation disturbance	1
7700	aspiration pneumonia	1
7701	pharyngolaryngeal pain	1
7702	lightheadedness	1
7703	histamine release	1
7704	increased liver enzymes	1
7705	skin photosensitivity	1
7706	teeth clenching	1
7707	tooth infection	1
7708	twitching	1
7709	menstruation symptoms	1
7710	oral candidiasis	1
7711	gastrointestinal infection	1
7712	throat irritation	1
7713	upper respiratory inflammation	1
7714	lower respiratory tract infection	1
7715	viral upper respiratory infection	1
7716	acid regurgitation	1
7717	esophageal ulcer	1
7718	gastric ulcer	1
7719	allergic conjunctivitis	1
7720	eye pruritus	1
7721	ocular allergic reaction	1
7722	nephrotoxicity	1
7723	ototoxicity	1
7724	hypersensitivity	1
7725	involuntary movement	1
7726	blue skin discoloration	1
7727	corneal microdeposits	1
7728	chf	1
7729	av block	1
7730	sa node dysfunction	1
7731	halo vision	1
7732	hypotension, orthostatic	1
7733	qt prolongation	1
7734	torsades de pointes	1
7735	mi	1
7736	extrapyramidal sx	1
7737	tardive dyskinesia	1
7738	paralytic ileus	1
7739	glaucoma, angle-closure	1
7740	iop increase	1
7741	agranulocytosis	1
7742	psychosis exacerbation	1
7743	hypomania/mania	1
7744	depression exacerbation	1
7745	angioedema	1
7746	psychosis, anticholinergic	1
7747	heat stroke	1
7748	impaired coordination	1
7749	anxiety/agitation	1
7750	rash/urticaria	1
7751	libido changes	1
7752	hypo/hyperglycemia	1
7753	black hairy tongue	1
7754	candidiasis, oral or vulvovaginal	1
7755	alt, ast elevated	1
7756	hypersensitivity rxn, immediate or delayed	1
7757	serum sickness-like rxn	1
7758	erythema multiforme (em)	1
7759	exfoliative dermatitis	1
7760	stevens-johnson syndrome	1
7761	toxic epidermal necrolysis (tens)	1
7762	acute generalized exanthematous pustulosis	1
7763	hypersensitivity vasculitis	1
7764	superinfection	1
7765	c. difficile-assoc. diarrhea	1
7766	thrombocytopenic purpura	1
7767	cholestatic jaundice	1
7768	motor tics	1
7769	cerebrovascular accident	1
7770	vocal tics	1
7771	pustular rash	1
7772	mouth sore	1
7773	bone	1
7774	bitter taste	1
7775	cold symptoms	1
7776	dysesthesia	1
7777	dysgeusia	1
7778	burning in nose	1
7779	nasal discomfort	1
7780	nasal ulcer	1
7781	depersonalization	1
7782	hypoesthesia	1
7783	sleep disorder	1
7784	folliculitis	1
7785	furunculosis	1
7786	ageusia	1
7787	mastalgia	1
7788	increased serum alt	1
7789	hyperkinesia	1
7790	watery eyes	1
7791	paranasal sinus hypersecretion	1
7792	postnasal drip	1
7793	altered sense of smell	1
7794	anaphylactoid reaction	1
7795	drug tolerance	1
7796	increased transaminases	1
7797	stinging	1
7798	flu-like syndrome	1
7799	elevated amylase	1
7800	elevated lipase	1
7801	cardiac failure	1
7802	complete atrioventricular block	1
7803	second degree atrioventricular block	1
7804	decreased mental acuity	1
7805	peyronie's disease	1
7806	positive ana titer	1
7807	psoriasiform eruption	1
7808	increased serum transaminases	1
7809	uterine bleeding	1
7810	bullous rash	1
7811	cholestasis	1
7812	duodenal ulcer	1
7813	elevated hb a1c	1
7814	eructation	1
7815	esophagitis	1
7816	gingival hemorrhage	1
7817	hepatic failure	1
7818	increased creatine phosphokinase	1
7819	increased serum glucose	1
7820	leg cramps	1
7821	memory impairment	1
7822	myasthenia	1
7823	myopathy	1
7824	rectal hemorrhage	1
7825	rupture of tendon	1
7826	tendinous contracture	1
7827	vaginal hemorrhage	1
7828	diaper rash	1
7829	mycosis	1
7830	stevens-johnson syndrome (sjs)	1
7831	acute angle closure glaucoma	1
7832	acute myopia	1
7833	reduced visual acuity	1
7834	prolonged qt interval	1
7835	aplastic anemia	1
7836	hypersensitivity reaction	1
7837	myasthenia gravis	1
7838	exacerbation	1
7839	extrinsic allergic alveolitis	1
7840	serum sickness	1
7841	toxic epidermal necrolysis (ten)	1
7842	abnormal vision	1
7843	eaton-lambert syndrome	1
7844	corneal erosion	1
7845	urinary complication	1
7846	gastrointestinal hemorrhage	1
7847	sprue-like	1
7848	nasal stinging	1
7849	respiratory tract infection	1
7850	cushing's syndrome	1
7851	secondary hypercortisolism	1
7852	bone fracture	1
7853	cva	1
7854	exanthematous pustulosis	1
7855	taste disorder	1
7856	atrioventricular block	1
7857	cardiac dysrhythmia	1
7858	eosinophilic myocarditis	1
7859	hypersensitivity, syncope	1
7860	water intoxication syndrome	1
7861	bone marrow depression	1
7862	vanishing bile duct syndrome	1
7863	acute intermittent porphyria	1
7864	pulmonary hypersensitivity	1
7865	drug abuse	1
7866	drug dependence	1
7867	bradyarrhythmia	1
7868	cns irritability	1
7869	interstitial nephritis	1
7870	candida vaginitis	1
7871	clostridium difficile colitis	1
7872	myasthenia gravis exacerbation	1
7873	alt raised	1
7874	elevated aspartate aminotransferase (ast)	1
7875	genital pruritus	1
7876	pseudomembranous enterocolitis	1
7877	ventricular hypertrophy	1
7878	gi hemorrhage	1
7879	gi perforation	1
7880	gi ulcer	1
7881	gi inflammation	1
7882	fulminant hepatitis	1
7883	increased lft	1
7884	arf	1
7885	ain	1
7886	dental calculus	1
7887	tooth staining	1
7888	altered taste	1
7889	anterior ischemic optic neuropathy	1
7890	retinal artery occlusion	1
7891	retinal vein thrombosis	1
7892	cardiorespiratory arrest	1
7893	clostridium difficile diarrhea	1
7894	raised intracranial pressure	1
7895	psychotic disorder	1
7896	hemorrhagic cystitis	1
7897	sedated	1
7898	disorder of ejaculation	1
7899	suicidal thoughts	1
7900	serotonin syndrome	1
7901	disorder of taste	1
7902	hsp	1
7903	asteatotic eczema	1
7904	burning sensation	1
7905	skin discomfort	1
7906	intracranial hypertension	1
7907	coordination problem	1
7908	behavioral problem	1
7909	plavix	1
7910	drug eruption	1
7911	major bleeding	1
7912	thrombotic thrombocytopenic purpura	1
7913	epidural hematoma	1
7914	intraocular hemorrhage	1
7915	myelosuppression	1
7916	svt	1
7917	angle-closure glaucoma	1
7918	chloasma	1
7919	weight change	1
7920	stomach cramps	1
7921	leg cramp	1
7922	disorder of menstruation	1
7923	skin disorder	1
7924	infectious disease	1
7925	heart disease	1
7926	body fluid retention	1
7927	breast cancer	1
7928	disorder of gallbladder	1
7929	thrombosis of retinal vein	1
7930	cervical cancer	1
7931	malignant neoplasm of endometrium of corpus uteri	1
7932	ovarian cancer	1
7933	gallbladder disorder	1
7934	endometrial carcinoma	1
7935	liver enzyme abnormality	1
7936	muscle disorder	1
7937	tendon rupture	1
7938	edema of the tongue	1
7939	parotid swelling	1
7940	abnormal liver function	1
7941	neuroleptic malignant syndrome	1
7942	hypertensive crisis	1
7943	drug induced lupus	1
7944	increased liver function test	1
7945	gastrointestinal perforation	1
7946	diminished sweating	1
7947	perforation of intestine	1
7948	primary chronic pseudo-obstruction of colon	1
7949	toxic dilatation of intestine	1
7950	respiratory arrest	1
7951	mental disorder	1
7952	sinoatrial block	1
7953	sinus bradycardia	1
7954	digoxin	1
7955	loss of appetite	1
7956	feeling nervous	1
7957	amblyopia	1
7958	hyperammonemia	1
7959	hyperammonemic encephalopathy	1
7960	contusion	1
7961	cramp	1
7962	increased creatine kinase level	1
7963	dream disorder	1
7964	burning sensation in eye	1
7965	excessive tear production	1
7966	itching of eye	1
7967	pain in eye	1
7968	punctate keratitis	1
7969	ventricular arrhythmia	1
7970	pseudotumor cerebri	1
7971	skin burning	1
7972	basal cell carcinoma	1
7973	malignant melanoma	1
7974	malignant lymphoma	1
7975	serum bun raised	1
7976	serum creatinine raised	1
7977	intestinal angioedema	1
7978	erythrocyturia	1
7979	thrombocythemia	1
7980	cdd	1
7981	fracture of bone	1
7982	intestinal nephritis	1
7983	localized edema	1
7984	site irritation	1
7985	loss of scalp hair	1
7986	persistent erythema of skin	1
7987	bloating symptom	1
7988	breast tenderness	1
7989	pain of breast	1
7990	swelling of breast	1
7991	vaginal discomfort	1
7992	withdrawal bleeding	1
7993	venous thromboembolism	1
7994	abnormal cervical smear	1
7995	abnormal vaginal bleeding	1
7996	bacterial vaginosis	1
7997	breakthrough bleeding	1
7998	discharge from nipple	1
7999	intermenstrual bleeding	1
8000	menstrual cramp	1
8001	thrombophlebitis	1
8002	adenoma of liver	1
8003	cerebral hemorrhage	1
8004	thrombotic stroke	1
8005	carcinoma of breast	1
8006	carcinoma of cervix	1
8007	increased liver function tests	1
8008	inflammatory disorder of gi tract	1
8009	papillary necrosis	1
8010	liver function tests abnormal	1
8011	cholestatic hepatitis	1
8012	application site reaction	1
8013	stomach ache	1
8014	pain in limb	1
8015	abnormal ejaculation	1
8016	neoplasm of male breast	1
8017	prostate cancer	1
8018	candidiasis of mouth	1
8019	hypocortisolism	1
8020	intraocular pressure	1
8021	mouth candidiasis	1
8022	raised intraocular pressure	1
8023	sensation of burning skin	1
8024	hypothalamic-pituitary-adrenal axis suppression	1
8025	mania	1
8026	autoimmune hepatitis	1
8027	bad taste	1
8028	spasm of bladder	1
8029	viral disease	1
8030	hostile behavior	1
8031	drug hypersensitivity syndrome	1
8032	acute appendicitis	1
8033	cutaneous hypersensitivity	1
8034	lichenoid drug eruption	1
8035	hypoglycemia (severe)	1
8036	lipodystrophy	1
8037	phototoxicity	1
8038	angle closure glaucoma	1
8039	pulmonary tuberculosis	1
8040	disorder of cornea	1
8041	fulminant hepatic failure	1
8042	neuromyopathy	1
8043	delayed passing of urine	1
8044	thrombotic tendency	1
8045	gastrointestinal ulcer	1
8046	inflammatory disorder of digestive tract	1
8047	reye's syndrome	1
8048	shortened qt interval	1
8049	neonatal cardiovascular disorder	1
8050	thrombotic tendency observations	1
8051	ventricular hemorrhage	1
8052	retinal disorder	1
8053	retinopathy of prematurity	1
8054	pulmonary hemorrhage	1
8055	pellagra	1
8056	problem of visual accommodation	1
8057	ventricular dysrhythmia	1
8058	electrocardiogram abnormal	1
8059	tingling sensation	1
8060	drug hypersensitivity	1
8061	injection site pain	1
8062	nocturnal hypoglycemia	1
8063	iris color change	1
8064	punctate keratopathy	1
8065	macular retinal edema	1
8066	abnormal electrocardiogram	1
8067	ischemic optic neuropathy	1
8068	panic attack	1
8069	pulmonary thrombosis	1
8070	benign neoplasm of liver	1
8071	neoplasm of liver	1
8072	hemorrhagic cerebral infarction	1
8073	suicidal behavior	1
8074	ectopic pregnancy	1
8075	sweating	1
8076	decreased bone mineral density	1
8077	hip fracture	1
8078	orgasm incapacity	1
8079	methemoglobinemia	1
8080	optic neuropathy	1
8081	hypotension (severe)	1
8082	fine tremor	1
8083	brugada syndrome	1
8084	sinus node dysfunction	1
8085	increased papilledema	1
8086	giddiness	1
8087	renal interstitial fibrosis	1
8088	vasodilation	1
8089	unsteadiness	1
8090	electrolytes abnormal	1
8091	autoimmune disease	1
8092	menstrual spotting	1
8093	gi disturbance	1
8094	respiratory acidosis	1
8095	sudden cardiac arrest	1
8096	decreased body growth	1
8097	gi obstruction	1
8098	cerebral artery occlusion	1
8099	aggressive behavior	1
8100	atrophic condition of skin	1
8101	fluid retention	1
8102	disorder of gi tract	1
8103	primary adrenocortical insufficiency	1
8104	nms	1
8105	abnormal taste	1
8106	jarisch herxheimer reaction	1
8107	candida infection of genital region	1
8108	vaginal irritation	1
8109	disorder of optic nerve	1
8110	skin pigmentation	1
8111	tooth discoloration	1
8112	tooth discolored	1
8113	local erythema	1
8114	localized pruritus	1
8115	serum triglycerides raised	1
8116	alt level raised	1
8117	disturbance in thinking	1
8118	cirrhosis of liver	1
8119	grand mal seizure	1
8120	status epilepticus	1
8121	decreased platelet aggregation	1
8122	purpuric disorder	1
8123	allergic granulomatosis angitis	1
8124	altered behavior	1
8125	circulatory depression	1
8126	dependence	1
8127	application site pain	1
8128	stinging of skin	1
8129	application site irritation	1
8130	occult blood in stools	1
8131	phlebitis	1
8132	generalized exfoliative dermatitis	1
8133	granulocytopenic disorder	1
8134	secondary hypocortisolism	1
8135	oropharyngeal candidiasis	1
8136	syndrome of inappropriate antidiuretic hormone secretion	1
8137	hypoglycemia(severe)	1
8138	mood disorder	1
8139	decreased liver function	1
8140	vaginal ulcer	1
8141	skin irritation	1
8142	increased prolactin level	1
8143	personality disorder	1
8144	accidental injury	1
8145	diabetic coma	1
8146	hyperglycemia hyperosmolar state	1
8147	acute hemorrhagic pancreatitis	1
8148	taste sense altered	1
8149	unpleasant taste in mouth	1
8150	common cold	1
8151	breast finding	1
8152	arterial thromboembolism	1
8153	cerebral thrombosis	1
8154	abnormal gait	1
8155	impairment of balance	1
8156	application site erythema	1
8157	application site rash	1
8158	st segment depression	1
8159	opioid withdrawal	1
8160	disorder of pulmonary circulation	1
8161	orgasm disorder	1
8162	yawning	1
8163	suicide	1
8164	liver damage	1
8165	barbiturate withdrawal	1
8166	morbilliform eruption	1
8167	gingival enlargement	1
8168	bullous dermatosis	1
8169	lupus erythematosus	1
8170	toxic hepatitis	1
8171	anticonvulsant hypersensitivity syndrome	1
8172	drug withdrawal seizure	1
8173	liver enzymes raised	1
8174	diabetic macular edema	1
8175	malignant tumor of urinary bladder	1
8176	swollen abdomen	1
8177	disorder of muscle	1
8178	skin superinfection	1
8179	lipids abnormal	1
8180	gastrointestinal superinfection	1
8181	general superinfection	1
8182	kaposi's sarcoma	1
8183	cushing's disease	1
8184	disturbance in mood	1
8185	fat embolism	1
8186	thromboembolic disorder	1
8187	aseptic necrosis of bone	1
8188	paralytic syndrome	1
8189	central serous chorioretinopathy	1
8190	posterior subcapsular cataract	1
8191	central nervous system depression	1
8192	extrapyramidal disease	1
8193	soft tissue injury	1
8194	large breast	1
8195	cholecystectomy	1
8196	ischemic necrosis	1
8197	tia	1
8198	thrombosis of retinal artery	1
8199	porphyria	1
8200	serum cholesterol raised	1
8201	serum blood urea nitrogen raised	1
8202	cinchonism	1
8203	wide qrs complex	1
8204	idiopathic thrombocytopenic purpura	1
8205	liver tests abnormal	1
8206	discoloration of urine	1
8207	pemphigoid reaction	1
8208	aseptic necrosis of bone of jaw	1
8209	benign prostate hyperplasia	1
8210	compartment syndrome of lower leg	1
8211	dyskinesia	1
8212	paradoxical bronchospasm	1
8213	disorder of electrolytes	1
8214	gastric hemorrhage	1
8215	increased diastolic arterial pressure	1
8216	increased systolic arterial pressure	1
8217	delay when starting to pass urine	1
8218	menopausal flushing	1
8219	injury of liver	1
8220	nasal irritation	1
8221	pain in throat	1
8222	coronary artery spasm	1
8223	peripheral ischemia	1
8224	acute vascular insufficiency of intestine	1
8225	irregular periods	1
8226	erythroderma multiforme	1
8227	uterine cancer	1
8228	interstitial pneumonia	1
8229	complex mannerisms	1
8230	osteopenia	1
8231	generalized exanthematous pustulosis	1
8232	cutaneous lupus erythematosus	1
8233	neutropenic disorder	1
8234	raised intracerebral pressure	1
8235	lid itching	1
8236	lid swelling	1
8237	serum bicarbonate level abnormal	1
8238	impaired psychomotor performance	1
8239	reduced concentration span	1
8240	increased body temperature	1
8241	anaphylactoid	1
8242	impaired skin healing	1
8243	disorder of hematopoietic structure	1
8244	fulminant hepatic necrosis	1
8245	crystalluria	1
8246	hypomania	1
8247	tachyarrhythmia	1
8248	viral lower respiratory infection	1
8249	sickle cell disease anemia vasoocclusive crisis	1
8250	prolonged erection of the penis	1
8251	scaling eczema	1
8252	stevens-johnson syndrome, toxic epidermal necrolysis (tens)	1
8253	subacute cutaneous lupus erythematosus	1
8254	cholesterol embolus syndrome	1
8255	gangrenous disorder	1
8256	compartment syndrome	1
8257	ischemic colitis	1
8258	allergic reaction	1
8259	drugged state	1
1	anyloc	1
8262	testob	1
\.


--
-- Name: observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doknosis
--

SELECT pg_catalog.setval('observation_id_seq', 8262, true);


--
-- Data for Name: observation_type; Type: TABLE DATA; Schema: public; Owner: doknosis
--

COPY observation_type (id, name) FROM stdin;
1	symptom
2	gender
3	region
4	age group
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: doknosis
--

COPY users (id, username, password, email, name, authenticated) FROM stdin;
1	test	$2b$12$S0gtpbs8hATO10dehsLsEu2dZXBcb4WpuAs8Hga/tPHoiVTNN8LDW	test@ucsd.edu	test	t
2	lamueller	$2b$12$/YWN9fgwYFnc3r.RgYpO/OAz985PBdvHAICtb.8VaNkAiqFcyFuny	lamueller@ucsd.edu	Lars	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doknosis
--

SELECT pg_catalog.setval('users_id_seq', 8, true);


--
-- Name: explanation_location explanation_location_pkey; Type: CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_location
    ADD CONSTRAINT explanation_location_pkey PRIMARY KEY (id);


--
-- Name: explanation_observation explanation_observation_pkey; Type: CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_observation
    ADD CONSTRAINT explanation_observation_pkey PRIMARY KEY (id);


--
-- Name: explanation explanation_pkey; Type: CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation
    ADD CONSTRAINT explanation_pkey PRIMARY KEY (id);


--
-- Name: explanation_type explanation_type_pkey; Type: CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_type
    ADD CONSTRAINT explanation_type_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (id);


--
-- Name: observation_type observation_type_pkey; Type: CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY observation_type
    ADD CONSTRAINT observation_type_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: explanation_id_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX explanation_id_uindex ON explanation USING btree (id);


--
-- Name: explanation_location_id_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX explanation_location_id_uindex ON explanation_location USING btree (id);


--
-- Name: explanation_name_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX explanation_name_uindex ON explanation USING btree (name);


--
-- Name: explanation_observation_id_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX explanation_observation_id_uindex ON explanation_observation USING btree (id);


--
-- Name: explanation_type_id_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX explanation_type_id_uindex ON explanation_type USING btree (id);


--
-- Name: location_id_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX location_id_uindex ON location USING btree (id);


--
-- Name: observation_id_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX observation_id_uindex ON observation USING btree (id);


--
-- Name: observation_name_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX observation_name_uindex ON observation USING btree (name);


--
-- Name: users_email_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX users_email_uindex ON users USING btree (email);


--
-- Name: users_id_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX users_id_uindex ON users USING btree (id);


--
-- Name: users_username_uindex; Type: INDEX; Schema: public; Owner: doknosis
--

CREATE UNIQUE INDEX users_username_uindex ON users USING btree (username);


--
-- Name: explanation explanation_explanation_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation
    ADD CONSTRAINT explanation_explanation_type_id_fk FOREIGN KEY (type) REFERENCES explanation_type(id);


--
-- Name: explanation_location explanation_location_explanation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_location
    ADD CONSTRAINT explanation_location_explanation_id_fk FOREIGN KEY (explanation_id) REFERENCES explanation(id);


--
-- Name: explanation_location explanation_location_location_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_location
    ADD CONSTRAINT explanation_location_location_id_fk FOREIGN KEY (location_id) REFERENCES location(id);


--
-- Name: explanation_observation explanation_observation_explanation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_observation
    ADD CONSTRAINT explanation_observation_explanation_id_fk FOREIGN KEY (explanation_id) REFERENCES explanation(id);


--
-- Name: explanation_observation explanation_observation_observation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY explanation_observation
    ADD CONSTRAINT explanation_observation_observation_id_fk FOREIGN KEY (observation_id) REFERENCES observation(id);


--
-- Name: observation observation_observation_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doknosis
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_observation_type_id_fk FOREIGN KEY (type) REFERENCES observation_type(id);


--
-- PostgreSQL database dump complete
--

