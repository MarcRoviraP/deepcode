--
-- PostgreSQL database dump
--

\restrict NzRP9Dz6C9zpGvozyY4gXkCqfeaLxGZDRPw8CBKbJIgxNidOh8juN8IwrkBBCs5

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.documents (
    id bigint NOT NULL,
    topic_id bigint NOT NULL,
    title text NOT NULL,
    file_path text NOT NULL,
    file_type character varying(20) NOT NULL,
    level character varying(50),
    checksum text,
    processed boolean DEFAULT false NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.documents OWNER TO postgresql;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documents_id_seq OWNER TO postgresql;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public.documents (id, topic_id, title, file_path, file_type, level, checksum, processed, metadata, created_at, updated_at) FROM stdin;
4	6	Python Apuntes	/home/deepcode/srv/rag-data/pdf/python-apuntes.pdf	pdf	Principiante	\N	t	{}	2026-05-08 20:35:14.26452	2026-05-08 20:35:14.26452
5	11	r-introduccion.pdf	/home/deepcode/srv/rag-data/pdf/r-introduccion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:26:47.673763	2026-05-09 11:26:47.673763
6	12	java-apuntes-basicos.pdf	/home/deepcode/srv/rag-data/pdf/java-apuntes-basicos.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:27:20.052994	2026-05-09 11:27:20.052994
7	13	react-stackoverflow-docs.pdf	/home/deepcode/srv/rag-data/pdf/react-stackoverflow-docs.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:27:36.578387	2026-05-09 11:27:36.578387
8	14	php-programacion-ejemplos.pdf	/home/deepcode/srv/rag-data/pdf/php-programacion-ejemplos.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:27:52.004226	2026-05-09 11:27:52.004226
9	15	sistemas-operativos-wolf.pdf	/home/deepcode/srv/rag-data/pdf/sistemas-operativos-wolf.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:27:57.417839	2026-05-09 11:27:57.417839
10	16	c-introduccion-programacion.pdf	/home/deepcode/srv/rag-data/pdf/c-introduccion-programacion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:29:20.509384	2026-05-09 11:29:20.509384
11	17	javascript-asincronismo.pdf	/home/deepcode/srv/rag-data/pdf/javascript-asincronismo.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:31:32.875238	2026-05-09 11:31:32.875238
12	18	git-pro.pdf	/home/deepcode/srv/rag-data/pdf/git-pro.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:31:36.050941	2026-05-09 11:31:36.050941
13	19	python-inmersion.pdf	/home/deepcode/srv/rag-data/pdf/python-inmersion.pdf	pdf	Avanzado	\N	t	{}	2026-05-09 11:33:02.229515	2026-05-09 11:33:02.229515
14	20	typescript-para-principiantes-envato-tuts.pdf	/home/deepcode/srv/rag-data/pdf/typescript-para-principiantes-envato-tuts.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:34:16.707573	2026-05-09 11:34:16.707573
15	21	problemas-y-algoritmos.pdf	/home/deepcode/srv/rag-data/pdf/problemas-y-algoritmos.pdf	pdf	Intermedio	\N	t	{}	2026-05-09 11:34:23.373734	2026-05-09 11:34:23.373734
16	12	java-ejercicios-programacion.pdf	/home/deepcode/srv/rag-data/pdf/java-ejercicios-programacion.pdf	pdf	Intermedio	\N	t	{}	2026-05-09 11:35:17.061775	2026-05-09 11:35:17.061775
17	22	css3-javascript-avanzado.pdf	/home/deepcode/srv/rag-data/pdf/css3-javascript-avanzado.pdf	pdf	Avanzado	\N	t	{}	2026-05-09 11:35:32.734348	2026-05-09 11:35:32.734348
18	17	javascript-introduccion-eguiluz.pdf	/home/deepcode/srv/rag-data/pdf/javascript-introduccion-eguiluz.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:35:44.496214	2026-05-09 11:35:44.496214
19	13	react-aprendiz-maestro.pdf	/home/deepcode/srv/rag-data/pdf/react-aprendiz-maestro.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:36:09.200454	2026-05-09 11:36:09.200454
20	23	scrum-y-xp-desde-las-trincheras.pdf	/home/deepcode/srv/rag-data/pdf/scrum-y-xp-desde-las-trincheras.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:36:33.929301	2026-05-09 11:36:33.929301
21	24	97-cosas-que-todo-programador-deberia-saber.pdf	/home/deepcode/srv/rag-data/pdf/97-cosas-que-todo-programador-deberia-saber.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:36:55.390797	2026-05-09 11:36:55.390797
22	25	algoritmos-pseudocodigo-ordinogramas.pdf	/home/deepcode/srv/rag-data/pdf/algoritmos-pseudocodigo-ordinogramas.pdf	pdf	Intermedio	\N	t	{}	2026-05-09 11:37:30.51626	2026-05-09 11:37:30.51626
23	26	sql-apuntes-basicos.pdf	/home/deepcode/srv/rag-data/pdf/sql-apuntes-basicos.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:37:52.07273	2026-05-09 11:37:52.07273
24	19	python-manual-basico.pdf	/home/deepcode/srv/rag-data/pdf/python-manual-basico.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:37:57.017589	2026-05-09 11:37:57.017589
25	12	java-introduccion-poo.pdf	/home/deepcode/srv/rag-data/pdf/java-introduccion-poo.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:38:00.529421	2026-05-09 11:38:00.529421
26	27	jquery-fundamentos.pdf	/home/deepcode/srv/rag-data/pdf/jquery-fundamentos.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:38:43.487371	2026-05-09 11:38:43.487371
27	28	apuntes-estructuras-datos-algoritmos.pdf	/home/deepcode/srv/rag-data/pdf/apuntes-estructuras-datos-algoritmos.pdf	pdf	Intermedio	\N	t	{}	2026-05-09 11:39:03.740789	2026-05-09 11:39:03.740789
28	29	haskell-piensa.pdf	/home/deepcode/srv/rag-data/pdf/haskell-piensa.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:39:56.003303	2026-05-09 11:39:56.003303
29	19	python-pensar-programador.pdf	/home/deepcode/srv/rag-data/pdf/python-pensar-programador.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:40:54.913762	2026-05-09 11:40:54.913762
30	12	java-basico-aprendices.pdf	/home/deepcode/srv/rag-data/pdf/java-basico-aprendices.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:41:41.220495	2026-05-09 11:41:41.220495
31	19	python-ejercicios-basicos.pdf	/home/deepcode/srv/rag-data/pdf/python-ejercicios-basicos.pdf	pdf	Intermedio	\N	t	{}	2026-05-09 11:41:56.093719	2026-05-09 11:41:56.093719
32	17	javascript-uoc.pdf	/home/deepcode/srv/rag-data/pdf/javascript-uoc.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:42:11.131882	2026-05-09 11:42:11.131882
33	30	introduccion-poo.pdf	/home/deepcode/srv/rag-data/pdf/introduccion-poo.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:42:19.166933	2026-05-09 11:42:19.166933
34	31	bases-conceptuales-programacion.pdf	/home/deepcode/srv/rag-data/pdf/bases-conceptuales-programacion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:42:28.821999	2026-05-09 11:42:28.821999
35	20	typescript-aprendizaje.pdf	/home/deepcode/srv/rag-data/pdf/typescript-aprendizaje.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:43:33.85665	2026-05-09 11:43:33.85665
36	32	aspnet-core-pequeno-libro.pdf	/home/deepcode/srv/rag-data/pdf/aspnet-core-pequeno-libro.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:43:47.132955	2026-05-09 11:43:47.132955
37	19	python-introduccion-programacion-3.pdf	/home/deepcode/srv/rag-data/pdf/python-introduccion-programacion-3.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:44:02.136656	2026-05-09 11:44:02.136656
38	19	python-aprende-sergio-delgado-quintero.pdf	/home/deepcode/srv/rag-data/pdf/python-aprende-sergio-delgado-quintero.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:45:37.078283	2026-05-09 11:45:37.078283
39	33	go-pequeno-libro.pdf	/home/deepcode/srv/rag-data/pdf/go-pequeno-libro.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:46:29.039076	2026-05-09 11:46:29.039076
40	34	csharp-introduccion-programacion.pdf	/home/deepcode/srv/rag-data/pdf/csharp-introduccion-programacion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:46:37.600604	2026-05-09 11:46:37.600604
41	31	bases-datos-diseno-introduccion.pdf	/home/deepcode/srv/rag-data/pdf/bases-datos-diseno-introduccion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:47:29.240665	2026-05-09 11:47:29.240665
42	19	python-explorando-informacion.pdf	/home/deepcode/srv/rag-data/pdf/python-explorando-informacion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:47:33.148529	2026-05-09 11:47:33.148529
43	35	guia-scrum-european.pdf	/home/deepcode/srv/rag-data/pdf/guia-scrum-european.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:48:17.971685	2026-05-09 11:48:17.971685
44	19	python-calculo-cientifico.pdf	/home/deepcode/srv/rag-data/pdf/python-calculo-cientifico.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:48:23.062251	2026-05-09 11:48:23.062251
45	36	rust-aprendizaje.pdf	/home/deepcode/srv/rag-data/pdf/rust-aprendizaje.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:48:32.253671	2026-05-09 11:48:32.253671
46	37	docker-introduccion.pdf	/home/deepcode/srv/rag-data/pdf/docker-introduccion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:48:55.399636	2026-05-09 11:48:55.399636
47	38	logica-de-programacion.pdf	/home/deepcode/srv/rag-data/pdf/logica-de-programacion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:48:57.092836	2026-05-09 11:48:57.092836
48	12	java-iniciando-programacion.pdf	/home/deepcode/srv/rag-data/pdf/java-iniciando-programacion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:49:59.854887	2026-05-09 11:49:59.854887
49	19	python-intermedio.pdf	/home/deepcode/srv/rag-data/pdf/python-intermedio.pdf	pdf	Intermedio	\N	t	{}	2026-05-09 11:50:01.040021	2026-05-09 11:50:01.040021
50	39	cpp-fundamentos-basicos.pdf	/home/deepcode/srv/rag-data/pdf/cpp-fundamentos-basicos.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:50:12.697944	2026-05-09 11:50:12.697944
51	19	python-inventa-juegos.pdf	/home/deepcode/srv/rag-data/pdf/python-inventa-juegos.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:50:57.518114	2026-05-09 11:50:57.518114
52	14	php-poo-mvc.pdf	/home/deepcode/srv/rag-data/pdf/php-poo-mvc.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:51:59.385788	2026-05-09 11:51:59.385788
53	17	javascript-elocuente-cuarta-edicion.pdf	/home/deepcode/srv/rag-data/pdf/javascript-elocuente-cuarta-edicion.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:52:08.429651	2026-05-09 11:52:08.429651
54	41	estructuras-de-datos.pdf	/home/deepcode/srv/rag-data/pdf/estructuras-de-datos.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:53:26.988285	2026-05-09 11:53:26.988285
55	42	kotlin-stackoverflow-docs.pdf	/home/deepcode/srv/rag-data/pdf/kotlin-stackoverflow-docs.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:53:33.034266	2026-05-09 11:53:33.034266
56	19	python-para-todos.pdf	/home/deepcode/srv/rag-data/pdf/python-para-todos.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:53:45.223006	2026-05-09 11:53:45.223006
57	20	typescript-introduccion-adictos-trabajo.pdf	/home/deepcode/srv/rag-data/pdf/typescript-introduccion-adictos-trabajo.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:54:05.471028	2026-05-09 11:54:05.471028
58	29	haskell-python-ejercicios.pdf	/home/deepcode/srv/rag-data/pdf/haskell-python-ejercicios.pdf	pdf	Intermedio	\N	t	{}	2026-05-09 11:54:06.649244	2026-05-09 11:54:06.649244
59	39	cpp-estandar.pdf	/home/deepcode/srv/rag-data/pdf/cpp-estandar.pdf	pdf	Principiante	\N	t	{}	2026-05-09 11:56:50.359487	2026-05-09 11:56:50.359487
60	39	cpp-poo-ejercicios.pdf	/home/deepcode/srv/rag-data/pdf/cpp-poo-ejercicios.pdf	pdf	Intermedio	\N	t	{}	2026-05-09 11:57:53.161129	2026-05-09 11:57:53.161129
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresql
--

SELECT pg_catalog.setval('public.documents_id_seq', 60, true);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: idx_documents_checksum; Type: INDEX; Schema: public; Owner: postgresql
--

CREATE UNIQUE INDEX idx_documents_checksum ON public.documents USING btree (checksum);


--
-- Name: idx_documents_level; Type: INDEX; Schema: public; Owner: postgresql
--

CREATE INDEX idx_documents_level ON public.documents USING btree (level);


--
-- Name: idx_documents_processed; Type: INDEX; Schema: public; Owner: postgresql
--

CREATE INDEX idx_documents_processed ON public.documents USING btree (processed);


--
-- Name: idx_documents_topic_id; Type: INDEX; Schema: public; Owner: postgresql
--

CREATE INDEX idx_documents_topic_id ON public.documents USING btree (topic_id);


--
-- Name: documents fk_documents_topic; Type: FK CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_documents_topic FOREIGN KEY (topic_id) REFERENCES public.topics(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict NzRP9Dz6C9zpGvozyY4gXkCqfeaLxGZDRPw8CBKbJIgxNidOh8juN8IwrkBBCs5

