SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 15.6

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', '88906cc1-cd8c-420d-a44d-b4b6b73b81cc', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"hergen@gmail.com","user_id":"e426bb77-8953-41fd-9897-82eba3698b9c","user_phone":""}}', '2024-12-02 09:41:16.092723+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7465130-6dfe-487a-9bb0-add3211c68b7', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-02 09:41:29.976827+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'authenticated', 'authenticated', 'hergen@gmail.com', '$2a$10$3CrUFO0XFFh7JelqdkOkSuuCh.0Czz4L5/ixSdKPCg.9n6HTTN9Mu', '2024-12-02 09:41:16.09341+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-12-02 09:41:29.977181+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-12-02 09:41:16.090328+00', '2024-12-02 09:41:29.978647+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('e426bb77-8953-41fd-9897-82eba3698b9c', 'e426bb77-8953-41fd-9897-82eba3698b9c', '{"sub": "e426bb77-8953-41fd-9897-82eba3698b9c", "email": "hergen@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-12-02 09:41:16.092124+00', '2024-12-02 09:41:16.092158+00', '2024-12-02 09:41:16.092158+00', 'd4ec1110-c454-41cb-bb0a-41939fc3527d');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('119277f1-6826-4998-b987-4983fd12c31f', 'e426bb77-8953-41fd-9897-82eba3698b9c', '2024-12-02 09:41:29.97722+00', '2024-12-02 09:41:29.97722+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '172.20.0.1', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('119277f1-6826-4998-b987-4983fd12c31f', '2024-12-02 09:41:29.97887+00', '2024-12-02 09:41:29.97887+00', 'password', 'da4f9916-f91e-4fe3-bd53-7bb4d741d200');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 1, '1yoP7kdmKH-XtJO8ZPIDqw', 'e426bb77-8953-41fd-9897-82eba3698b9c', false, '2024-12-02 09:41:29.978043+00', '2024-12-02 09:41:29.978043+00', NULL, '119277f1-6826-4998-b987-4983fd12c31f');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."categories" ("name", "description", "created_at", "user_id", "id") VALUES
	('toothpaste', NULL, '2024-12-02 09:42:46.889352+00', '988834a8-c13c-485d-96e3-9ef1c318410a', '3107c179-a0da-41db-82a0-9aeb694f6317'),
	('de lata', NULL, '2024-12-02 09:42:56.595844+00', 'ccac4963-7ec0-487d-8b79-5db800d4ca75', '6c05bf6f-ed08-4f17-aabe-f465c653bae3'),
	('junk foods', NULL, '2024-12-02 09:43:02.1379+00', '78ec53e9-7197-44af-860b-c7a5b63b0b4e', '45880088-47b6-40fe-9bed-142fdd89f068'),
	('seafoods', NULL, '2024-12-02 09:43:06.990105+00', '33156c14-d810-4e55-b9fc-38e93326f15a', 'd26436b7-bf89-49ef-9a45-258ed7fc4a39'),
	('fish', NULL, '2024-12-02 09:43:37.838156+00', 'b4038fdc-7121-43af-b27d-dafa70883e34', '48d461c0-9597-48a2-871e-010167831b7b'),
	('meat', NULL, '2024-12-02 09:43:49.194549+00', '6ce717dd-6dcf-45fc-be04-0680700ef9ce', '67b2f23e-eaa5-4cfb-a7ba-2a87615346ef'),
	('test', NULL, '2024-12-02 09:47:13.402852+00', '93250b97-4186-4158-a448-680718b564b7', '41b96028-2ce9-4d24-a58d-527c3a6a74da');


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."products" ("name", "description", "cost_price", "selling_price", "created_at", "barcode", "stock_qty", "barcode_img", "category_id", "id", "reorder_level") VALUES
	('test', '1', 1, 2, '2024-12-02 09:53:37.97909+00', '421576814505', 0, NULL, '41b96028-2ce9-4d24-a58d-527c3a6a74da', '84e79467-5f17-4668-b7bb-50f400db97cf', 4);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."transactions" ("transaction_no", "status", "created_at", "id") VALUES
	('RrbKUGRH0ooxou2ppmI33s', 'completed', '2024-12-02 09:54:39.712446+00', 'b01646d6-4a95-4226-9ad5-d6c8e443c751'),
	('GCC1bBOK1EATCNtML7yGHW', 'pending', '2024-12-02 09:59:36.123581+00', 'af171dfd-31bc-4b56-876a-f654d31265a7');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."orders" ("qty", "subtotal", "transaction_no", "created_at", "id", "product_id") VALUES
	(1, 2, 'RrbKUGRH0ooxou2ppmI33s', '2024-12-02 09:59:22.484865+00', 'd9df4a9f-a8ee-46d4-8222-dd73ff609fe5', '84e79467-5f17-4668-b7bb-50f400db97cf'),
	(1, 2, 'RrbKUGRH0ooxou2ppmI33s', '2024-12-02 09:59:24.684951+00', '98660e14-2ba4-4c1d-9783-35c808281f91', '84e79467-5f17-4668-b7bb-50f400db97cf'),
	(1, 2, 'RrbKUGRH0ooxou2ppmI33s', '2024-12-02 09:59:25.137731+00', '26275ba1-28ed-4991-8ee7-effd6a675919', '84e79467-5f17-4668-b7bb-50f400db97cf');


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."sales" ("transaction_no", "created_at", "amount", "change", "total", "id") VALUES
	('RrbKUGRH0ooxou2ppmI33s', '2024-12-02 09:59:36.032169+00', 10, 4, 6, 'faad55df-dc04-4aad-a8bd-be1d5ed0b2bb');


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
