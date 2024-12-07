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
	('00000000-0000-0000-0000-000000000000', 'f7465130-6dfe-487a-9bb0-add3211c68b7', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-02 09:41:29.976827+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa18390d-affd-4d47-92a6-63faf90a6a11', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-03 17:38:03.675177+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b05ef72f-fd25-42a6-a16d-3455cb7e18e6', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 05:25:36.667369+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6b11977-fbd4-4032-bcff-5c372153d0e1', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 05:43:55.238538+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd59f95ba-6a48-44b5-9548-a4a6982a5952', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"almiraempedrad@gmail.com","user_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","user_phone":""}}', '2024-12-04 05:44:43.438674+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f9a99a2-c3e4-40cc-8a1b-7da3c6368a3b', '{"action":"login","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 05:44:51.366833+00', ''),
	('00000000-0000-0000-0000-000000000000', '0b9060b3-e3f5-43a2-beab-bb691fa3b2f8', '{"action":"logout","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 05:48:41.11654+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f50176da-d33b-4bf9-957d-94e7a7edbb75', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 05:48:47.185005+00', ''),
	('00000000-0000-0000-0000-000000000000', '4d35dd02-c7cb-4a57-94f8-1dfea754da60', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 05:56:24.899576+00', ''),
	('00000000-0000-0000-0000-000000000000', '13b717e8-2281-490d-9304-2d9c15109e74', '{"action":"login","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 05:56:30.760489+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c4ad8e4b-3c15-46a4-9515-68e10abf97b2', '{"action":"logout","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 06:04:36.318636+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4991ec2-6a4d-46d6-b3db-f4609a5b045a', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 06:04:43.608489+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cf3e25a6-ceef-494d-a19c-152ead40ee9f', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 06:04:53.348199+00', ''),
	('00000000-0000-0000-0000-000000000000', '94eddd49-3fb9-4e53-8cc0-03eebbe24aa8', '{"action":"login","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 06:04:58.114458+00', ''),
	('00000000-0000-0000-0000-000000000000', '389daee9-518e-4989-a568-3ec3597e01c7', '{"action":"logout","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 06:07:33.09985+00', ''),
	('00000000-0000-0000-0000-000000000000', '63b64fce-ce68-4cb8-b03b-92c87a10b7a4', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 06:07:37.176977+00', ''),
	('00000000-0000-0000-0000-000000000000', '8e462562-cdfc-4f3b-9fe0-81a9948856c1', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 06:07:42.871836+00', ''),
	('00000000-0000-0000-0000-000000000000', '66fad3f7-1c27-4dab-bf3a-594594785aea', '{"action":"login","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 06:07:47.921888+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a65c339-bbf0-42ee-ad96-3f91057dbb19', '{"action":"logout","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 06:15:04.338177+00', ''),
	('00000000-0000-0000-0000-000000000000', '676f5e83-6d21-4420-9425-90041e1e6ea5', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 06:15:08.543146+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f1f07b3c-571b-48b4-984c-ad90c6bab6dc', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 06:15:22.863318+00', ''),
	('00000000-0000-0000-0000-000000000000', '943cf3e7-63fa-43db-b5cd-f31863310585', '{"action":"login","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 06:15:30.464531+00', ''),
	('00000000-0000-0000-0000-000000000000', '993e2c92-fa49-4ac7-aa78-b7522e884292', '{"action":"logout","actor_id":"89858adb-3f87-47d8-8ec6-d51dd2107431","actor_username":"almiraempedrad@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 06:38:13.962481+00', ''),
	('00000000-0000-0000-0000-000000000000', '6403f6da-5bcc-4701-aa9f-c1b658d2139a', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 06:39:45.995582+00', ''),
	('00000000-0000-0000-0000-000000000000', '1e428e9f-c196-402b-8dc7-75d1e3adb079', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 07:37:46.750383+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b87aaf6-7ee7-417f-bc79-83d05653c33a', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 07:37:46.815785+00', ''),
	('00000000-0000-0000-0000-000000000000', '18e1c497-96a2-48cb-b69b-1af4d1cac11a', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 08:40:34.300426+00', ''),
	('00000000-0000-0000-0000-000000000000', '30c664f4-5443-45a6-9e5c-207599176bce', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 08:40:34.301128+00', ''),
	('00000000-0000-0000-0000-000000000000', '41127ef1-8b1f-4f9e-a9af-9260579b5d35', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 09:38:49.795378+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c37d8d8e-67ec-471a-bb71-14f084defb66', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 09:38:49.796216+00', ''),
	('00000000-0000-0000-0000-000000000000', '56ecdde8-266c-4102-a4ed-13d3609ebde8', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 10:37:08.475784+00', ''),
	('00000000-0000-0000-0000-000000000000', '665daab1-7a06-4c09-8323-91de882a709b', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 10:37:08.476461+00', ''),
	('00000000-0000-0000-0000-000000000000', '80de3f34-acfa-4c02-83b1-247565b83e5e', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 11:35:25.188914+00', ''),
	('00000000-0000-0000-0000-000000000000', '6cec3282-9045-401c-bf22-64055bd0fb9e', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 11:35:25.193581+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd0bbd6d8-f75e-4111-af6d-16a34b3fcca8', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 12:41:33.941293+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd974777-a5b4-40c2-bfb6-a9064f54f640', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 12:41:33.941813+00', ''),
	('00000000-0000-0000-0000-000000000000', '8477a8c5-3405-4e49-a510-132a3fa2fe86', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 13:39:40.714153+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bf0c3e45-d11b-4962-91a5-d59e0650d87b', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 13:39:40.715022+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f67bb765-5006-439e-910b-f33c77ddbec1', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 14:49:54.963405+00', ''),
	('00000000-0000-0000-0000-000000000000', '1188f992-fd9c-4478-9c81-a04ef2f5da3c', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 14:49:54.966732+00', ''),
	('00000000-0000-0000-0000-000000000000', '1222270d-0c32-421f-85d3-2f8d4351a736', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 14:51:29.972544+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c56569f8-b2fb-4b29-96c3-a203373b1875', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 14:53:39.186665+00', ''),
	('00000000-0000-0000-0000-000000000000', '482f704d-c44d-4d5b-a578-b5f10498d252', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 14:53:47.319464+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dfd261fa-a0e4-4855-bcfa-a6a408811ad5', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 14:54:17.011685+00', ''),
	('00000000-0000-0000-0000-000000000000', '9eefce12-b562-464f-85d2-10466d239b52', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 14:54:31.23876+00', ''),
	('00000000-0000-0000-0000-000000000000', '42c29240-4868-42dd-a8ef-b4811f1838a1', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 14:55:22.222454+00', ''),
	('00000000-0000-0000-0000-000000000000', '810fdd38-4741-4981-a964-6249a34e7f60', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 14:59:24.221996+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd2049171-10de-4a8b-8b1a-9358491bf391', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 14:59:27.62544+00', ''),
	('00000000-0000-0000-0000-000000000000', '0de50b30-5ddb-4cc2-8e67-c8a618580874', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 15:50:39.704823+00', ''),
	('00000000-0000-0000-0000-000000000000', '1237354f-c023-4938-8ef6-dee84e98a262', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 15:54:06.93176+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fba04f89-b456-48d0-80b8-5ca6d5a0dcec', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 15:57:35.749908+00', ''),
	('00000000-0000-0000-0000-000000000000', '780f1596-ead6-4f97-be44-10b70c2ecae7', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 15:57:41.145248+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e7dcb312-2d4b-42c7-ab5d-f1c6f3b4a182', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 15:58:35.120788+00', ''),
	('00000000-0000-0000-0000-000000000000', '29378fc3-7df7-4136-861d-4bb8c0c001a9', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 15:58:49.557569+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d9bba00-1696-4819-aa66-17f6a715804a', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-04 16:06:41.842883+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e7796a84-19a3-4477-898c-24a9dfb2eb46', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-04 16:06:47.700845+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd82b8a22-694c-4794-b1d8-41b557c83919', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 17:04:53.427543+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5d1639a-9011-49dd-ae7e-e2ce00e68da3', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 17:04:53.428483+00', ''),
	('00000000-0000-0000-0000-000000000000', '07d5a22e-e5d0-4fe7-a161-127273498585', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 06:58:51.866391+00', ''),
	('00000000-0000-0000-0000-000000000000', '1595b461-8a3e-481d-9382-03cce4878f72', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 06:58:51.867233+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cb2dd7e3-0c86-45e8-a976-8eaa29e362eb', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 06:58:51.882735+00', ''),
	('00000000-0000-0000-0000-000000000000', '3ef17921-4be2-449d-b0d4-410462b0dc96', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-05 07:06:32.774018+00', ''),
	('00000000-0000-0000-0000-000000000000', '91d26d8b-303e-458e-b59e-ef8306eea04a', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-05 07:10:18.069785+00', ''),
	('00000000-0000-0000-0000-000000000000', 'af213f89-f442-4417-b120-f8b7155d5b6a', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 08:08:23.294002+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa075075-c249-4f8a-9550-5ddec420b55c', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 08:08:23.295113+00', ''),
	('00000000-0000-0000-0000-000000000000', '31d4ac3e-deca-469f-ac81-dbaebdcfed0c', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 09:06:31.643269+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d13f108-d473-41bb-a381-03a413a0ae63', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 09:06:31.643857+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6937997-fbca-4bc6-b8d5-12b8d97a6f87', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 10:04:58.262702+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cbe3f8e3-7c21-4e9b-b5c4-0c14c347526d', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 10:04:58.263383+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bb949f8d-9b44-4fe7-9baf-e88d130980d7', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 11:03:19.962942+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed50ce75-3e63-4fe9-a7b0-6fff8e58c5ba', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 11:03:19.964108+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5c69bb1-2dd9-4e9f-8a0c-5a2c4171b918', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 13:07:43.510684+00', ''),
	('00000000-0000-0000-0000-000000000000', '8365d28b-8fa9-4963-838a-4be4638bbbac', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 13:07:43.511566+00', ''),
	('00000000-0000-0000-0000-000000000000', '1ebc4d49-98bc-4c7d-92df-77bf64250ed7', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 13:07:43.519017+00', ''),
	('00000000-0000-0000-0000-000000000000', '94736ec9-bb0d-496b-86ee-b27c669042f5', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 14:05:55.138926+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dee42dc2-4042-47f2-ab2f-459e3bc53bba', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 14:05:55.139414+00', ''),
	('00000000-0000-0000-0000-000000000000', '4d3ce748-ee4d-446b-9086-6dc3956cc2a3', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 15:04:20.8579+00', ''),
	('00000000-0000-0000-0000-000000000000', '60b36339-f727-4f53-8a75-6b14a230a3b4', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 15:04:20.858772+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b9416a2-7a6f-49f5-89dc-fe0474514ef3', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 16:02:25.370157+00', ''),
	('00000000-0000-0000-0000-000000000000', '964a5f74-81f3-45d1-a3e6-0d81d5f216fa', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 16:02:25.37074+00', ''),
	('00000000-0000-0000-0000-000000000000', '6bf1138e-a824-47bf-9a89-d9dfe7e70967', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 17:00:45.657629+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f57fe743-79c4-4330-8aeb-9fb02adbb812', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 17:00:45.658216+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fcb402b4-5d15-40a9-b450-66f07de4749d', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 19:11:43.866335+00', ''),
	('00000000-0000-0000-0000-000000000000', '531c9957-57bb-48b0-b745-c3d4be600759', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 19:11:43.86686+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b787fbc5-f79e-47c7-a866-f708a8c6f49a', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 19:11:43.873971+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bbf85ced-75b8-4929-9ac8-e7640b0fe12f', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-05 21:47:47.034733+00', ''),
	('00000000-0000-0000-0000-000000000000', '136146ee-e39f-4b10-820c-579e0d5c48db', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-05 22:00:54.328126+00', ''),
	('00000000-0000-0000-0000-000000000000', '13acca3e-1f13-419b-a6d3-4f2508a0b0a4', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 10:25:37.601489+00', ''),
	('00000000-0000-0000-0000-000000000000', '9dcc9804-4197-4b9f-88bc-4fc26e4922f9', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 10:25:37.601883+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9514bf5-3685-4eaa-8448-ee78f5881d91', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 11:24:00.424742+00', ''),
	('00000000-0000-0000-0000-000000000000', '7e63cc3b-1205-42fd-8f36-996b50ef6dfe', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 11:24:00.425586+00', ''),
	('00000000-0000-0000-0000-000000000000', '529db8c4-07d9-4aa2-b705-a899948d0714', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-06 12:05:03.619871+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a8dcc03-ff5b-40f1-94a1-3a0e56054e54', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-06 12:05:10.912255+00', ''),
	('00000000-0000-0000-0000-000000000000', '9507e2ec-e38d-49dc-b72c-560ba85e8f35', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-06 12:13:06.343979+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b2e2ffc7-b945-47c9-a10a-c4703d6ec739', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-06 12:13:13.690829+00', ''),
	('00000000-0000-0000-0000-000000000000', '7cf8b91f-039c-497b-97e4-5b5256665254', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-06 12:14:00.365018+00', ''),
	('00000000-0000-0000-0000-000000000000', '62bd6024-eae4-485c-a624-032e5503d566', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-06 12:14:07.571907+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ac44900a-0803-4acb-8370-03fbe3c23634', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-06 12:14:33.399867+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc825d55-774c-4a46-91d4-2769120f04a5', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-06 12:14:45.469722+00', ''),
	('00000000-0000-0000-0000-000000000000', '20bb87ce-16b3-44a7-b7b7-7900b179ed23', '{"action":"logout","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-06 12:17:43.36304+00', ''),
	('00000000-0000-0000-0000-000000000000', 'edffaed4-bb0c-4c00-a33e-6fa325d4df7f', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-06 12:17:48.885332+00', ''),
	('00000000-0000-0000-0000-000000000000', '0dfd38a5-ec07-443c-9992-9e4b9a930da5', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 13:16:36.158039+00', ''),
	('00000000-0000-0000-0000-000000000000', '11fa287d-346f-4c25-b106-233ad54daa7e', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 13:16:36.158944+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f13ba44d-b1c4-46c1-a0c3-f06dbb49fd56', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 15:49:31.334854+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b85f77eb-1407-43e7-b076-bf88b6b473a0', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 15:49:31.335565+00', ''),
	('00000000-0000-0000-0000-000000000000', '659d2dfe-1bd0-4f7b-9515-f2b4ae4e3bec', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 15:49:31.357197+00', ''),
	('00000000-0000-0000-0000-000000000000', '223a2a67-6987-458f-8c9a-215cbe93c4dc', '{"action":"token_refreshed","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 16:47:33.277341+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c5bb437d-6968-4a8e-8740-f3e9b67a34af', '{"action":"token_revoked","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 16:47:33.278235+00', ''),
	('00000000-0000-0000-0000-000000000000', '11fb12ba-5039-4f1f-878a-29edd924fc8d', '{"action":"login","actor_id":"e426bb77-8953-41fd-9897-82eba3698b9c","actor_username":"hergen@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-06 17:41:29.754166+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'authenticated', 'authenticated', 'hergen@gmail.com', '$2a$10$3CrUFO0XFFh7JelqdkOkSuuCh.0Czz4L5/ixSdKPCg.9n6HTTN9Mu', '2024-12-02 09:41:16.09341+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-12-06 17:41:29.754791+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-12-02 09:41:16.090328+00', '2024-12-06 17:41:29.756903+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '89858adb-3f87-47d8-8ec6-d51dd2107431', 'authenticated', 'authenticated', 'almiraempedrad@gmail.com', '$2a$10$0JsszuYCQNs7Y1q6dlj8ne7916Uxr43YZSIskgtuW3B3RUyjkqzWG', '2024-12-04 05:44:43.439091+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-12-04 06:15:30.464838+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-12-04 05:44:43.43615+00', '2024-12-04 06:15:30.465418+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('e426bb77-8953-41fd-9897-82eba3698b9c', 'e426bb77-8953-41fd-9897-82eba3698b9c', '{"sub": "e426bb77-8953-41fd-9897-82eba3698b9c", "email": "hergen@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-12-02 09:41:16.092124+00', '2024-12-02 09:41:16.092158+00', '2024-12-02 09:41:16.092158+00', 'd4ec1110-c454-41cb-bb0a-41939fc3527d'),
	('89858adb-3f87-47d8-8ec6-d51dd2107431', '89858adb-3f87-47d8-8ec6-d51dd2107431', '{"sub": "89858adb-3f87-47d8-8ec6-d51dd2107431", "email": "almiraempedrad@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-12-04 05:44:43.438089+00', '2024-12-04 05:44:43.438117+00', '2024-12-04 05:44:43.438117+00', '98bbc3b8-3948-4ed5-987d-13cc77de2056');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('475ebe74-f9ae-4c19-8eb9-009af547a09b', 'e426bb77-8953-41fd-9897-82eba3698b9c', '2024-12-06 12:17:48.885752+00', '2024-12-06 16:47:33.287228+00', NULL, 'aal1', NULL, '2024-12-06 16:47:33.287161', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '172.20.0.1', NULL),
	('10a45a63-882f-4f85-9057-def3b0294f8d', 'e426bb77-8953-41fd-9897-82eba3698b9c', '2024-12-06 17:41:29.754868+00', '2024-12-06 17:41:29.754868+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '172.20.0.1', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('475ebe74-f9ae-4c19-8eb9-009af547a09b', '2024-12-06 12:17:48.886996+00', '2024-12-06 12:17:48.886996+00', 'password', 'c8f8110c-a3a5-406b-a643-fb04b840cafd'),
	('10a45a63-882f-4f85-9057-def3b0294f8d', '2024-12-06 17:41:29.757141+00', '2024-12-06 17:41:29.757141+00', 'password', 'bb8a584b-1811-45bb-8c5c-a6dd81522cd3');


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
	('00000000-0000-0000-0000-000000000000', 83, 'AV77wk33a0pm4zGi1Xp_aw', 'e426bb77-8953-41fd-9897-82eba3698b9c', true, '2024-12-06 12:17:48.886192+00', '2024-12-06 13:16:36.159248+00', NULL, '475ebe74-f9ae-4c19-8eb9-009af547a09b'),
	('00000000-0000-0000-0000-000000000000', 84, '0SjDrvqcXvaM6HVBTrEolA', 'e426bb77-8953-41fd-9897-82eba3698b9c', true, '2024-12-06 13:16:36.159768+00', '2024-12-06 15:49:31.335719+00', 'AV77wk33a0pm4zGi1Xp_aw', '475ebe74-f9ae-4c19-8eb9-009af547a09b'),
	('00000000-0000-0000-0000-000000000000', 85, 'pWckiQApT6Dz7q5ZGOXBkA', 'e426bb77-8953-41fd-9897-82eba3698b9c', true, '2024-12-06 15:49:31.336172+00', '2024-12-06 16:47:33.278495+00', '0SjDrvqcXvaM6HVBTrEolA', '475ebe74-f9ae-4c19-8eb9-009af547a09b'),
	('00000000-0000-0000-0000-000000000000', 86, 'aENlJLAod_Za6ivjy9BVDw', 'e426bb77-8953-41fd-9897-82eba3698b9c', false, '2024-12-06 16:47:33.281114+00', '2024-12-06 16:47:33.281114+00', 'pWckiQApT6Dz7q5ZGOXBkA', '475ebe74-f9ae-4c19-8eb9-009af547a09b'),
	('00000000-0000-0000-0000-000000000000', 87, '1pI-55ldyPgHrQw8SojN_w', 'e426bb77-8953-41fd-9897-82eba3698b9c', false, '2024-12-06 17:41:29.756047+00', '2024-12-06 17:41:29.756047+00', NULL, '10a45a63-882f-4f85-9057-def3b0294f8d');


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
	('toothpaste', NULL, '2024-12-02 09:42:46.889352+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', '3107c179-a0da-41db-82a0-9aeb694f6317'),
	('junk foods', NULL, '2024-12-02 09:43:02.1379+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', '45880088-47b6-40fe-9bed-142fdd89f068'),
	('de lata', NULL, '2024-12-02 09:42:56.595844+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', '6c05bf6f-ed08-4f17-aabe-f465c653bae3'),
	('fish', NULL, '2024-12-02 09:43:37.838156+00', '89858adb-3f87-47d8-8ec6-d51dd2107431', '48d461c0-9597-48a2-871e-010167831b7b'),
	('meat', NULL, '2024-12-02 09:43:49.194549+00', '89858adb-3f87-47d8-8ec6-d51dd2107431', '67b2f23e-eaa5-4cfb-a7ba-2a87615346ef'),
	('seafoods', NULL, '2024-12-02 09:43:06.990105+00', '89858adb-3f87-47d8-8ec6-d51dd2107431', 'd26436b7-bf89-49ef-9a45-258ed7fc4a39'),
	('drinks', NULL, '2024-12-04 06:28:05.694779+00', '89858adb-3f87-47d8-8ec6-d51dd2107431', 'ef03f474-e7da-44ee-bfb4-d228fdf34488'),
	('test', NULL, '2024-12-04 06:32:45.195506+00', '89858adb-3f87-47d8-8ec6-d51dd2107431', 'bb968f6c-3382-418e-89b1-8df83b338b31'),
	('food', NULL, '2024-12-06 11:04:13.358055+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', '5c652b23-2696-445d-a769-7c2cd5d98944'),
	('test-updated', NULL, '2024-12-06 13:17:16.924917+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', '787242f8-0aa9-4515-9ff1-2249fcf3d361');


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."logs" ("id", "created_at", "user_id", "action", "description") VALUES
	('1bfe22d2-7717-4574-9552-384945f1307d', '2024-12-06 12:17:48.903651+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'sign_in', 'hergen@gmail.com has signed in'),
	('dbb99bd7-179e-4a38-af77-ce20fd1ece88', '2024-12-06 12:18:50.464855+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'create_product', 'hergen@gmail.com created new product'),
	('1c629336-7e59-411d-a2fd-cb3723e255a9', '2024-12-06 12:28:38.192764+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'update_product', 'hergen@gmail.com updated product ''d5b6aee2-7457-4428-8d47-734da8a87038'''),
	('9f92dba9-489c-4f16-ac62-26d3813b55aa', '2024-12-06 12:29:02.131542+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'delete_product', 'hergen@gmail.com removed product d5b6aee2-7457-4428-8d47-734da8a87038'),
	('440a3e77-2518-4951-bee9-07ac4111c496', '2024-12-06 13:05:31.465283+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'search_on_products', 'hergen@gmail.com made a search on products'),
	('57935eea-0bed-4e9a-a8f6-62f57a38b0c8', '2024-12-06 13:10:55.320214+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('35b27946-b60a-4ffd-84c2-ce4eafa5aa1a', '2024-12-06 13:11:07.145831+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('8e1b3011-1b4a-4348-9a9d-3ad1148eecaf', '2024-12-06 13:11:25.284611+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('856a6b4a-81e8-4e98-b10c-92d93a4e3928', '2024-12-06 13:13:11.439554+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('d4533dff-ef04-4717-bcf4-d19114e6fe35', '2024-12-06 13:13:32.887069+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('ac413182-717f-4089-b3c2-40c5365bfe93', '2024-12-06 13:13:41.643797+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('6a6fac28-d68c-441e-b2e6-41f3e5ae20be', '2024-12-06 13:14:01.602408+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('ef419720-a8bb-431d-bdb2-ca69b3a19c3c', '2024-12-06 13:14:07.16738+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('92f274d5-5fed-481c-a4fb-5c7246fdec08', '2024-12-06 13:14:32.964936+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('f48a7845-1e67-43e5-ad46-65231bebbdeb', '2024-12-06 13:14:32.974419+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('23c1933a-cdc9-4887-a6f4-60af90f42dbe', '2024-12-06 13:14:42.049514+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('e069d719-f85c-4f86-a57b-461d89a14b0d', '2024-12-06 13:14:42.051076+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('f423845f-98d4-45f4-8604-ba5d02ca5f2a', '2024-12-06 13:16:33.095585+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('2fcc6fc1-62b0-433a-b1a2-d557ee0fcb03', '2024-12-06 13:17:10.079104+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('5d63f29f-771e-4140-93da-86ef5f1d0326', '2024-12-06 13:17:16.949441+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'create_category', 'hergen@gmail.com created new category'),
	('c70e7517-d5a6-4765-ab25-8d0a42a3a4c0', '2024-12-06 13:17:24.231191+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'update_category', 'hergen@gmail.com updated category ''787242f8-0aa9-4515-9ff1-2249fcf3d361'''),
	('23ce2ee2-07cd-4908-aadc-302b17817ff2', '2024-12-06 13:18:34.973652+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('52301d59-574b-4697-b77a-674b5923b07e', '2024-12-06 13:18:44.922089+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('76464bbc-90bd-4b0a-a862-4d30bc19f909', '2024-12-06 13:18:52.266303+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('2c3131e7-29a2-468b-9fae-464842729520', '2024-12-06 13:22:41.955742+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('da2e0ac9-6e5b-4f2a-ab2a-2eba69999c8d', '2024-12-06 13:22:46.270305+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('33bc8481-67fd-4e99-9379-998dda3500a7', '2024-12-06 13:22:46.277106+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_weekly', 'hergen@gmail.com filtering sales by weekly'),
	('f51f5ca4-7682-44dd-884a-d86103b80518', '2024-12-06 13:22:47.800625+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('ae6e01dc-68b0-4656-8233-3d1520f6cb70', '2024-12-06 13:22:47.806188+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_monthly', 'hergen@gmail.com filtering sales by month'),
	('14a426d4-e21d-4dae-b206-39dbb91038ec', '2024-12-06 13:22:48.673676+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('ae34b742-76ce-4678-970b-8ddd75eccfe7', '2024-12-06 13:22:48.682989+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_yearly', 'hergen@gmail.com filtering sales by yearly'),
	('d66ede4e-58ad-4104-8835-95aa41dda76d', '2024-12-06 13:22:49.58108+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('4e466fcc-df5c-412d-817a-f14dcf3a6f2a', '2024-12-06 13:22:49.589561+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_daily', 'hergen@gmail.com filtering sales by daily'),
	('e5a4e590-8a5a-48f3-baa2-62c7971d2869', '2024-12-06 13:22:52.844574+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_date', 'hergen@gmail.com filtering sales by date'),
	('0cc0a3b5-b1f9-42e7-91f2-3de73a7eac27', '2024-12-06 13:26:52.100478+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('366930a4-fda6-449d-a54d-8d08300eaa16', '2024-12-06 13:26:52.147699+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('dbf60b5e-c509-467c-b8a8-e13c05afbfac', '2024-12-06 13:28:16.195644+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('ba5df24c-60e9-4846-a2ea-672d6d1182e0', '2024-12-06 13:28:16.244791+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('46f0894d-4ed5-485a-855d-354d5c353053', '2024-12-06 13:29:07.141339+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('4eb4ae69-df3f-4fe1-b886-d6ce69c1d3d9', '2024-12-06 13:29:07.188057+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('4e613931-51f5-469f-8024-b72cbacf1f68', '2024-12-06 13:29:31.755252+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('1b1d6c61-2939-4066-b181-10279a02819e', '2024-12-06 13:29:31.794196+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('7dab1ee4-1d3c-4221-8a4a-53f08fcaa5b1', '2024-12-06 13:29:34.00729+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('a0884ebb-91ac-4520-ace7-dfdbbbfeb347', '2024-12-06 13:29:34.04271+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('6af2a24c-1f0f-4b6b-afb0-24042aabccba', '2024-12-06 13:29:42.59291+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('06dc8464-231b-4076-bda3-6e2c05492e1c', '2024-12-06 13:29:42.597172+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('5123b45d-c47e-4d8a-917f-e687ad64dfd1', '2024-12-06 13:29:46.783775+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('4d08d7c9-74cb-41fd-9ed5-92d177c93f65', '2024-12-06 13:29:46.807885+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('5afae6a5-5e3e-4b19-b4b9-2013a32a71b6', '2024-12-06 13:29:50.199283+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_scan_barcode', 'hergen@gmail.com scan the product barcode'),
	('18ab40bb-96be-44d3-b13d-fd8b51b6d179', '2024-12-06 13:30:29.345578+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_delete_order', 'hergen@gmail.com removed pos order 531e9c89-e811-4d5f-aef4-27aec9ff3db4'),
	('0e3f1465-c692-46a4-b19a-9355ac58adae', '2024-12-06 13:30:38.107314+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_sales_completed', 'hergen@gmail.com transaction completed and made sales'),
	('14ca46e1-4e16-450d-8677-f3d3d680e3d5', '2024-12-06 13:30:38.132687+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('36e951d2-8caf-4657-b650-5db1af8a6a2e', '2024-12-06 15:49:32.388745+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('4bb1a2f0-05bb-46d0-a130-beac5328de9d', '2024-12-06 15:49:32.40748+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('2db9ef76-ef06-497e-9e92-c08f33c7cbd9', '2024-12-06 15:50:13.528394+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('27d3ccdb-055f-45fe-a5d5-a347dce6becc', '2024-12-06 15:50:13.545372+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('a071a1de-36e9-4f21-95f5-f9d7456c60f0', '2024-12-06 15:50:17.09019+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('fba5124d-3d0a-4fa0-a194-b9e22f34c7cc', '2024-12-06 15:50:17.105039+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('8b9f8862-5a48-47e1-aa3a-0ffe70525790', '2024-12-06 15:51:43.883483+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('e80406dd-7e00-439b-b079-3685d07a409f', '2024-12-06 15:51:43.922817+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('a1313bd8-d7e2-43ce-8d41-8d32fdcbc49c', '2024-12-06 15:51:45.500023+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_scan_barcode', 'hergen@gmail.com scan the product barcode'),
	('b3ef3e9a-b75d-4538-93e6-92a7bc5848cb', '2024-12-06 15:51:47.634994+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_scan_barcode', 'hergen@gmail.com scan the product barcode'),
	('45413ca1-cb96-44cc-ab69-592a6081d593', '2024-12-06 15:56:29.957428+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('7cecdda1-829e-4e49-be5b-cba01b1f3b2e', '2024-12-06 15:56:29.99364+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('c843c3c8-c47d-4a36-9e18-4e5a528ab205', '2024-12-06 15:57:39.038535+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_scan_barcode', 'hergen@gmail.com scan the product barcode'),
	('42b4a84d-1244-41f4-adc5-06038431e88f', '2024-12-06 15:58:20.249036+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_product_lookup', 'hergen@gmail.com made a product lookup'),
	('d9a08a47-c8a1-4da0-857f-1294a0b45ed4', '2024-12-06 15:58:25.819996+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_product_lookup', 'hergen@gmail.com made a product lookup'),
	('3b86fc22-3751-4e3c-ae96-ae7495a57edd', '2024-12-06 15:58:28.633567+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_product_lookup', 'hergen@gmail.com made a product lookup'),
	('1a96d93e-0bf9-4d74-9e54-abd4cec444c9', '2024-12-06 15:59:52.321157+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('1e3de068-face-498d-8bb6-2eefd3a12f81', '2024-12-06 15:59:52.343534+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('e7d4a42d-8eda-48f7-8e5d-0e0813af7072', '2024-12-06 15:59:54.196574+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('150c9a84-2718-4500-8923-5c6fea08f4b3', '2024-12-06 15:59:54.227896+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('4ac63147-0e70-46c3-8700-581b988845eb', '2024-12-06 16:00:04.679122+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('56c4aa75-7868-4b17-95fb-b11d7f123235', '2024-12-06 16:00:04.703502+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('7520bf6b-c0a5-4c2a-9546-21c7580e8470', '2024-12-06 16:00:17.656226+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('8c8c2c25-d652-4886-b247-e510630bf493', '2024-12-06 16:00:17.702208+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('995e30d1-46b2-4aff-a726-ada0fcb52f2e', '2024-12-06 16:00:50.174395+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('82aa77b6-a4c4-4ca3-b5e2-057cc1d4a5d2', '2024-12-06 16:00:50.210165+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('f39d5da6-114e-414e-b385-3df8132d792b', '2024-12-06 16:00:51.555192+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('f4a66ad6-5005-4fe6-971e-07cdfe58d1bf', '2024-12-06 16:00:51.592591+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('8a89c23a-b3c1-4e63-8372-a6de97c930bb', '2024-12-06 16:01:05.563964+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_scan_barcode', 'hergen@gmail.com scan the product barcode'),
	('a46e46ce-3b11-4d3d-9be3-561ee62ac6d7', '2024-12-06 16:01:47.221133+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('fd8af625-9804-4bee-a554-102fa8b9229e', '2024-12-06 16:01:47.249286+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('3756c66f-3f6e-4729-b0c1-9af63cb3a719', '2024-12-06 16:01:49.265297+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('5321c106-3864-4ada-823a-1ad38bb2fd92', '2024-12-06 16:01:49.312349+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('2eee0894-facd-47f4-a7a9-90387afb8fcb', '2024-12-06 16:01:55.220923+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('cdb009d6-b4e3-4c60-9ebb-b4f5f745dda5', '2024-12-06 16:01:55.24158+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('82a9230a-2f01-4ddb-9162-a5f350854fc2', '2024-12-06 16:01:56.800187+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('3613b228-e436-40f7-8c9e-c7d2eeab21e1', '2024-12-06 16:01:56.836713+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('b9868a57-45d5-4464-b783-01c4bbfff7d8', '2024-12-06 16:03:33.508665+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_product_lookup', 'hergen@gmail.com made a product lookup'),
	('4d0e6ece-6d9d-42f2-8f82-3e85bbac28fe', '2024-12-06 16:05:23.27501+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_init_transaction', 'hergen@gmail.com initializing or getting the transaction'),
	('10ce3b9b-aa6e-4b0e-b8fa-d52e9aa9fb7d', '2024-12-06 16:05:23.312804+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_fetch_orders', 'hergen@gmail.com fetching pos orders'),
	('23dfa8a9-813e-41d2-bcbf-fcaa498fb801', '2024-12-06 16:05:27.523564+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_product_lookup', 'hergen@gmail.com made a product lookup'),
	('b1b24898-e426-4dd9-8a9d-e333f50e7a9e', '2024-12-06 16:05:29.288986+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'pos_product_lookup_add_to_order', 'hergen@gmail.com add the product to the order'),
	('ec492a6b-0b58-4482-9ee9-ee1ed5621bd8', '2024-12-06 16:11:57.847595+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('33aa40ea-7269-42d7-92fa-ccd88e734d00', '2024-12-06 16:11:57.851168+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('b9f0d1f9-75bb-448b-a86a-a3c7e5a05935', '2024-12-06 16:52:09.019243+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'create_product', 'hergen@gmail.com created new product'),
	('38992219-2972-43d4-9304-deb2971b952c', '2024-12-06 16:52:51.71303+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('7ec7d20d-a618-4108-9dad-bff4f8c83f36', '2024-12-06 16:52:59.648784+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_daily', 'hergen@gmail.com filtering sales by daily'),
	('c5bea740-2a95-41dc-9a8c-d6db295108c5', '2024-12-06 16:53:02.240444+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('edbfc184-283d-4291-99f7-e00128567c6c', '2024-12-06 16:53:02.248197+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_weekly', 'hergen@gmail.com filtering sales by weekly'),
	('a2831e50-c418-4897-a9ab-a72f8083b30c', '2024-12-06 16:53:04.057074+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('40a211a9-f7ed-4f72-8047-4f2eecf5b604', '2024-12-06 16:53:04.063523+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_monthly', 'hergen@gmail.com filtering sales by month'),
	('e4e834db-7a1c-43ef-8f48-9016ded59a48', '2024-12-06 16:53:05.40521+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('9c9fd331-73ca-484a-8b71-aeb4d55c2f94', '2024-12-06 16:53:05.413473+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_yearly', 'hergen@gmail.com filtering sales by yearly'),
	('b957f4c7-0050-4db9-99cb-de21b57d664f', '2024-12-06 16:53:07.346251+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_daily', 'hergen@gmail.com filtering sales by daily'),
	('b8be827e-45ec-4530-a978-54dd160e36cd', '2024-12-06 16:53:09.336174+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'filter_sales_by_date', 'hergen@gmail.com filtering sales by date'),
	('83ff056c-4d58-4db7-9ae1-383737cce5e0', '2024-12-06 16:53:09.361794+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_sales', 'hergen@gmail.com fetching sales'),
	('ab787cfc-9e0b-4ad9-9b57-5575365b9490', '2024-12-06 16:54:34.411057+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('3d641848-16fc-4a38-ba61-3dcaa655cc62', '2024-12-06 16:54:34.428763+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('726f3357-8975-48bc-b699-a75e40e490af', '2024-12-06 16:59:01.07075+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('4bf06864-935f-4117-b052-726273b6d94d', '2024-12-06 16:59:01.100885+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('d4d59731-f00a-415a-be15-f5e5fc837ec5', '2024-12-06 16:59:07.663202+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('9e0772c8-5fbc-4b65-9354-fe4a1f888872', '2024-12-06 16:59:07.663691+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('e7d48c24-7ca1-4fb6-b47d-147f7acb7d0a', '2024-12-06 16:59:23.644657+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('321ee511-9ec7-489d-a5b3-c47e4b555311', '2024-12-06 16:59:23.644544+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('95b8ef2c-b2be-432b-bcd4-e86b0b8f233e', '2024-12-06 17:00:46.314143+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('dbf8bcff-580b-48e5-b851-86f7a6e0aadf', '2024-12-06 17:00:46.337815+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('c5049c60-74dc-4e3f-86fa-8bd52fb16a23', '2024-12-06 17:01:53.899231+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('c2fe1bea-072e-4785-becb-09f7a094d93c', '2024-12-06 17:01:53.903058+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('f11f2c6b-eb86-49c8-b2f0-2a00e7327309', '2024-12-06 17:10:03.590997+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('acd01094-a8b2-46e3-9faf-b65a996928e5', '2024-12-06 17:10:03.605909+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('60ac64b0-1616-4004-98c2-cb9f28ac568d', '2024-12-06 17:12:01.930393+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('ffbfcf4b-eaa3-4de9-9bd9-0432d6ba6c0a', '2024-12-06 17:12:01.959184+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('3ac0aa74-7328-45c6-ae27-406c052bfea5', '2024-12-06 17:14:31.074534+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('c3265052-bc06-4857-a7aa-e24fb896b0c8', '2024-12-06 17:14:31.107792+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('b1284d45-f413-45fd-8056-e559ef8dcef1', '2024-12-06 17:20:12.168817+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('a48169c9-6115-4dd9-ae31-15e71dfcfb44', '2024-12-06 17:20:12.180951+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('b97bd1f0-e8ce-4d59-bfe8-3734592e921d', '2024-12-06 17:23:15.808224+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('e3b67226-d03f-4a8b-9e6f-8b5106a4d1d5', '2024-12-06 17:23:15.829645+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('50dae892-486c-409a-8a09-dbb1e0a2c1a5', '2024-12-06 17:26:35.537631+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('64d969c7-4a1e-4eda-aeb8-f1ddf42bc11f', '2024-12-06 17:26:35.554068+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('b8ba362a-2487-4a2b-8c46-fa2328d4b150', '2024-12-06 17:26:56.191195+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('6fd83ad7-5a80-4382-ae26-84bf9590d1de', '2024-12-06 17:26:56.190927+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('5ea686fe-26ac-4b67-87f3-c8f534e4ef9d', '2024-12-06 17:28:22.396616+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('3c070319-01a7-4553-a008-b4879b673b25', '2024-12-06 17:28:22.425301+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('349c0acd-d53b-46b7-87be-e32b6eb87c74', '2024-12-06 17:29:39.701512+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('4e2f93fa-2c24-490b-9b12-1b898f7f7f74', '2024-12-06 17:29:39.714812+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('70e781b8-71dd-4d6f-abe8-a7048f04dc30', '2024-12-06 17:30:15.774643+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('c8be3cf2-5f97-4be6-b71c-dbcec5ada1bd', '2024-12-06 17:30:15.775288+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('d3c927ca-b018-4d88-83fc-603802ac59d2', '2024-12-06 17:35:37.85036+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('bf8820c6-02ae-471e-8030-c0f616b9029f', '2024-12-06 17:35:37.862688+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('5830ecda-e104-4bba-b8ee-dc0ae99f1e58', '2024-12-06 17:36:00.59194+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('6879fbd6-cfe1-4ef8-9a52-c53f43cf6092', '2024-12-06 17:36:00.656894+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('e4f2b27f-21e2-4c73-ad80-2a619bd69c13', '2024-12-06 17:36:54.031723+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('5c3cb119-5dd1-4d57-a283-88fcce5e2e40', '2024-12-06 17:36:54.084035+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('d7600557-a300-4123-bbe1-4adcd1a6e227', '2024-12-06 17:37:44.334051+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('445e5d73-f96f-4564-a368-ac4ab5f5e489', '2024-12-06 17:37:44.406316+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('fd192724-06f5-4c32-b667-0942eef768f1', '2024-12-06 17:40:28.646942+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('c2d62412-b48f-47c6-bfcb-d4d9de4c64c3', '2024-12-06 17:40:28.699314+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('9cf5e0c0-f92e-4d0e-b2db-2e040b85fe75', '2024-12-06 17:41:03.88801+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('ae63313d-18e6-4f2e-9cc6-222ae1b39a77', '2024-12-06 17:41:03.954944+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('957d2d1f-d289-488a-8908-732305e68833', '2024-12-06 17:41:29.797704+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'sign_in', 'hergen@gmail.com has signed in'),
	('8f4e0d23-266f-4cd4-ac9e-acd09658341d', '2024-12-06 17:41:33.788194+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('c8351eaa-590b-486e-8302-7919d6a53bce', '2024-12-06 17:41:33.98214+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('c4b6827b-458d-4bf0-ba0d-0efaee3fd585', '2024-12-06 17:42:23.257277+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('5d75881a-d451-4920-b580-dafcce6129b5', '2024-12-06 17:42:23.308402+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('8c48d4a2-8436-49ba-8839-2427a83f76eb', '2024-12-06 17:42:33.348677+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('e4acede4-4c63-4ed2-85dd-de4adaccb071', '2024-12-06 17:42:33.395649+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('39031ac8-1439-4cdc-94e0-5867dbcaa9f7', '2024-12-06 17:43:02.326915+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('fddbc942-30ee-4fcc-8162-4ad23f8aada9', '2024-12-06 17:43:02.385132+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('04ebac89-7e69-410a-b097-dfae57abad0d', '2024-12-06 17:45:05.000785+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('37e4b8f6-e867-4dde-b122-3632e87e1a9d', '2024-12-06 17:45:05.061425+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('52aa3025-9493-4101-8505-fdf56159ba23', '2024-12-06 17:48:13.589994+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('9ee7b292-31c9-4093-8eae-33896373f6c3', '2024-12-06 17:48:45.793511+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('67c98e9f-460f-40c6-8d63-686fe502e0a8', '2024-12-06 17:49:29.660204+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('32760d7d-4f8e-47db-b835-7d7a901f20f9', '2024-12-06 17:49:29.713473+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('50f73fac-472a-4a6c-bd11-837733999f56', '2024-12-06 17:49:34.640609+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('58eb77f7-6054-479a-a99d-6a19470bbc5b', '2024-12-06 17:49:34.792708+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('93fe076a-6a34-4453-90a3-5adf859ae889', '2024-12-06 17:50:16.563785+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('44b7e8bf-f6d2-4026-83d4-4667d608b04c', '2024-12-06 17:50:16.572385+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('19963067-ba80-48c4-bdba-5bf7c40c5fc1', '2024-12-06 17:52:58.696796+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('c861c93b-afbe-4164-b8b9-9a6fbe8fb993', '2024-12-06 17:52:58.708921+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('9e3f0d87-7f88-441d-a8df-98f0aed8a408', '2024-12-06 17:54:54.46813+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('dd2b9150-4897-48c8-b817-76c966dabb6e', '2024-12-06 17:55:10.93555+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('0eb5127d-973a-4a2c-a17e-30e38081e526', '2024-12-06 17:55:14.020827+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('70183a66-d398-4fd1-92e5-333c2b3ef4bf', '2024-12-06 17:56:19.267946+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('462648a4-a68c-4636-b95b-ccef5c5129b2', '2024-12-06 17:56:44.351863+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('a1d3e1e0-61fc-46c2-a49d-c94c400d128d', '2024-12-06 17:57:23.064271+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('9204eb12-63d3-456b-a7ff-22023e320c1e', '2024-12-06 17:57:31.631726+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('fcd436a5-5cde-4463-b552-a0ddfd51a55a', '2024-12-06 17:57:35.294042+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('ebe34f70-e909-499c-bafa-f06cd6d85bf2', '2024-12-06 18:00:47.178911+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('c6b10adc-67c2-47bd-bb86-357d28cfd33b', '2024-12-06 18:00:49.249803+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('6058a8f3-b376-4d5e-8762-1d19a372185a', '2024-12-06 18:00:56.638182+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('5c88878c-0296-4685-a1c2-298c9ad1ebd2', '2024-12-06 18:01:03.492537+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('f71863fa-e6cf-4946-8ed1-281156c75fbc', '2024-12-06 18:02:03.912876+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('ff835042-26cf-416a-9dc7-019470056936', '2024-12-06 18:02:09.112009+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('11296d97-438f-4c23-b84d-4febd2b27ee2', '2024-12-06 18:02:30.477926+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('4092548f-a458-424e-bacf-c10a348d2191', '2024-12-06 18:02:40.251685+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('1119ca62-fefe-49fb-94bf-d288e147ccce', '2024-12-06 18:02:46.143186+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('7bf5e205-beda-45e4-aa72-ead7213b2ee2', '2024-12-06 18:03:36.940678+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('618cd583-5081-469d-b535-e2f4b7b0ab6a', '2024-12-06 18:03:39.758324+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('9f3ec6f5-bdd0-4745-b3ed-cb456f4be4eb', '2024-12-06 18:04:11.432558+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('d06793e9-5215-4637-a261-122a98df9a7c', '2024-12-06 18:04:33.171039+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('f61676f2-e0d1-4207-9a7a-b1906977a191', '2024-12-06 18:04:33.171863+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('4c3900d2-10b7-4514-9a5e-2307a52e467d', '2024-12-06 18:04:35.810077+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_products', 'hergen@gmail.com fetching products'),
	('9f3a5a79-0d7f-4730-88fb-929a4f352e6a', '2024-12-06 18:04:35.829777+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('45985c59-7d10-4068-941c-d7d5349544da', '2024-12-06 18:07:55.790845+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('137aaa9f-cf93-4f94-8c08-3cb70739bc39', '2024-12-06 18:07:57.828129+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('4c90dce0-f3ae-491d-9fcd-f173c4d90c81', '2024-12-06 18:11:31.099561+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('ac9d48e8-74b6-46dd-ac4b-0404efb906b0', '2024-12-06 18:12:31.036926+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('eb04dc12-3a79-4397-9c02-091f37210940', '2024-12-06 18:15:26.845234+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories'),
	('9a14d40f-7588-407b-a13a-e3f60508748e', '2024-12-06 18:18:15.190188+00', 'e426bb77-8953-41fd-9897-82eba3698b9c', 'fetch_categories', 'hergen@gmail.com fetching categories');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."products" ("name", "description", "created_at", "barcode", "barcode_img", "category_id", "id", "cost_price", "reorder_level", "selling_price", "stock_qty", "user_id", "weight", "volume", "uom") VALUES
	('ginamos', '', '2024-12-04 06:18:54.660475+00', '583914780848', NULL, '48d461c0-9597-48a2-871e-010167831b7b', '66eb38bf-b494-46c3-9d8b-50aa6182e5bb', 10, 5, 10, 20, '89858adb-3f87-47d8-8ec6-d51dd2107431', NULL, NULL, NULL),
	('milo', '', '2024-12-04 06:26:35.101755+00', '766739295204', NULL, '48d461c0-9597-48a2-871e-010167831b7b', '0a10090e-d27c-43fa-a43c-ee365a70ad77', 10, 30, 15, 39, '89858adb-3f87-47d8-8ec6-d51dd2107431', NULL, NULL, NULL),
	('chippy', '', '2024-12-04 05:31:04.493439+00', '119778612540', NULL, '45880088-47b6-40fe-9bed-142fdd89f068', 'a5cbc46d-48ce-4991-81f1-a896f551601e', 10, 50, 15, 97, 'e426bb77-8953-41fd-9897-82eba3698b9c', NULL, NULL, NULL),
	('chichiria', '', '2024-12-05 08:54:19.044613+00', '921391838561', NULL, '45880088-47b6-40fe-9bed-142fdd89f068', '6b12513c-d6be-498f-b46d-a867b53656bf', 15, 20, 20, 23, 'e426bb77-8953-41fd-9897-82eba3698b9c', 0, 0, 'pc'),
	('crispy fry', 'best for fried chicken', '2024-12-04 13:50:08.070258+00', '176630399312', NULL, '45880088-47b6-40fe-9bed-142fdd89f068', 'e58830ce-0575-46fb-856c-d2d617effebd', 40, 50, 45, 104, 'e426bb77-8953-41fd-9897-82eba3698b9c', 0, 0, 'pc'),
	('123', '', '2024-12-06 16:52:08.985474+00', '453081619345', NULL, '787242f8-0aa9-4515-9ff1-2249fcf3d361', '4750808b-43e8-4a50-b02e-ef09e48df33d', 2, 4, 2, 15, 'e426bb77-8953-41fd-9897-82eba3698b9c', 0, 0, 'g');


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."transactions" ("transaction_no", "status", "created_at", "id", "user_id") VALUES
	('RrbKUGRH0ooxou2ppmI33s', 'completed', '2024-12-02 09:54:39.712446+00', 'b01646d6-4a95-4226-9ad5-d6c8e443c751', 'd4698dc1-add0-4b5c-a9b0-572f9b5b986e'),
	('GCC1bBOK1EATCNtML7yGHW', 'pending', '2024-12-02 09:59:36.123581+00', 'af171dfd-31bc-4b56-876a-f654d31265a7', 'ba40d023-7581-4361-8cc1-d4d4f013bed5'),
	('QQTYDMC8R8NBDHFFUU633E', 'completed', '2024-12-03 17:47:51.215739+00', '9fabb180-c6ef-45f1-a411-560a520787ce', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('JL2GS9AXY9HDP8QH605WZ5', 'completed', '2024-12-04 05:39:32.462507+00', '2f1889e4-d071-47ee-a8c7-85760490ec0a', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('VT07KIPCTC3EYP7A4HMGPD', 'completed', '2024-12-04 06:29:13.283668+00', '45614169-df84-4878-a8a2-846281f9cd86', '89858adb-3f87-47d8-8ec6-d51dd2107431'),
	('7T7NU0FX1AX39XJ702I2BD', 'pending', '2024-12-04 06:37:10.285174+00', 'a01cbb7e-4f74-4e03-ae10-e0339d486a0f', '89858adb-3f87-47d8-8ec6-d51dd2107431'),
	('OVLJ69YUQVQ8T3FS4JF1K5', 'completed', '2024-12-04 05:42:38.630679+00', 'f9ac1c2e-cd04-4d78-92db-26b583caa35b', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('YLWOM1407SVSIFNOZ2C3LK', 'completed', '2024-12-04 15:24:21.206366+00', '28c9ded9-cf8c-4d40-a89c-710a51f7124f', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('UKAAEHE33V5TYF2B5DW018', 'completed', '2024-12-05 10:33:10.570969+00', 'd5d7ea87-2529-4e50-a789-464e4816edba', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('E8JXQ0IRKQVEQLFIQGH52S', 'completed', '2024-12-06 11:00:26.078231+00', 'd6826c49-9fad-4b01-89b9-2c15936f9720', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('9JS90S0RVFW6TTP6H1MTIW', 'pending', '2024-12-06 13:30:38.122826+00', '68f89902-4c26-46de-adb0-12006e7cb274', 'e426bb77-8953-41fd-9897-82eba3698b9c');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."orders" ("qty", "subtotal", "transaction_no", "created_at", "id", "product_id", "user_id") VALUES
	(1, 15, 'JL2GS9AXY9HDP8QH605WZ5', '2024-12-04 05:42:35.725439+00', '7eff76b7-aa83-4624-91b0-01e270224ddd', 'a5cbc46d-48ce-4991-81f1-a896f551601e', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 15, 'VT07KIPCTC3EYP7A4HMGPD', '2024-12-04 06:33:09.396716+00', '2a7d973f-da8c-4b8b-927f-548433cf6463', '0a10090e-d27c-43fa-a43c-ee365a70ad77', '89858adb-3f87-47d8-8ec6-d51dd2107431'),
	(1, 15, 'YLWOM1407SVSIFNOZ2C3LK', '2024-12-04 16:26:26.376892+00', 'dcbcbf5f-2491-4da9-9d46-2433bf806d78', 'a5cbc46d-48ce-4991-81f1-a896f551601e', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 20, 'YLWOM1407SVSIFNOZ2C3LK', '2024-12-05 10:11:27.1032+00', 'cc73864f-4c8f-4406-88a1-0b2d781e47fb', '6b12513c-d6be-498f-b46d-a867b53656bf', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 20, 'YLWOM1407SVSIFNOZ2C3LK', '2024-12-05 10:18:12.764315+00', '4d202d22-a7bc-4679-992d-4d427b872976', '6b12513c-d6be-498f-b46d-a867b53656bf', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 20, 'YLWOM1407SVSIFNOZ2C3LK', '2024-12-05 10:23:47.807232+00', '400207c1-00f4-446a-a9e5-f6b3cd078a91', '6b12513c-d6be-498f-b46d-a867b53656bf', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 20, 'YLWOM1407SVSIFNOZ2C3LK', '2024-12-05 10:24:51.260028+00', '32ee9b4b-ec0c-4604-bc8f-190de8f9de88', '6b12513c-d6be-498f-b46d-a867b53656bf', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 20, 'YLWOM1407SVSIFNOZ2C3LK', '2024-12-05 10:28:26.950652+00', 'd7a1b49b-fa55-48b7-9aab-658764dd2a45', '6b12513c-d6be-498f-b46d-a867b53656bf', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 15, 'UKAAEHE33V5TYF2B5DW018', '2024-12-05 10:54:33.735885+00', 'e8783d72-cb50-42c4-a4a3-979a17d11259', 'a5cbc46d-48ce-4991-81f1-a896f551601e', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 20, 'UKAAEHE33V5TYF2B5DW018', '2024-12-06 11:00:17.687614+00', '5094128f-3963-4d5e-b1eb-2fc778b1ef38', '6b12513c-d6be-498f-b46d-a867b53656bf', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 20, 'UKAAEHE33V5TYF2B5DW018', '2024-12-06 11:00:19.126966+00', 'fed83f9e-f95d-4ce4-a4df-c81a9ef3b117', '6b12513c-d6be-498f-b46d-a867b53656bf', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 20, 'E8JXQ0IRKQVEQLFIQGH52S', '2024-12-06 11:01:20.372776+00', '531e9c89-e811-4d5f-aef4-27aec9ff3db4', '6b12513c-d6be-498f-b46d-a867b53656bf', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 45, 'E8JXQ0IRKQVEQLFIQGH52S', '2024-12-06 13:29:50.183951+00', 'b222991e-1811-42ab-8c30-cd00ff3611e4', 'e58830ce-0575-46fb-856c-d2d617effebd', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 45, '9JS90S0RVFW6TTP6H1MTIW', '2024-12-06 15:51:45.469001+00', '3cbe99f1-b3f4-408a-a97b-9d0d48ff9024', 'e58830ce-0575-46fb-856c-d2d617effebd', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 45, '9JS90S0RVFW6TTP6H1MTIW', '2024-12-06 15:51:47.609182+00', 'e0a59239-f073-47b8-adc8-0d5a1ced0ee8', 'e58830ce-0575-46fb-856c-d2d617effebd', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 45, '9JS90S0RVFW6TTP6H1MTIW', '2024-12-06 15:57:39.007724+00', '519bdda5-2eca-4f15-805c-fa47a6e53c69', 'e58830ce-0575-46fb-856c-d2d617effebd', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 45, '9JS90S0RVFW6TTP6H1MTIW', '2024-12-06 16:01:02.460916+00', '4b96bc1b-740d-4af2-b5d5-3a3542db73df', 'e58830ce-0575-46fb-856c-d2d617effebd', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	(1, 15, '9JS90S0RVFW6TTP6H1MTIW', '2024-12-06 16:05:29.2722+00', '3c025bb2-cfb1-4c4c-931f-ee99fc3d49fb', 'a5cbc46d-48ce-4991-81f1-a896f551601e', 'e426bb77-8953-41fd-9897-82eba3698b9c');


--
-- Data for Name: reorder_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."sales" ("transaction_no", "created_at", "amount", "change", "total", "id", "user_id") VALUES
	('RrbKUGRH0ooxou2ppmI33s', '2024-12-02 09:59:36.032169+00', 10, 4, 6, 'faad55df-dc04-4aad-a8bd-be1d5ed0b2bb', '4ad924bf-07a3-45ae-9725-45af890a5f57'),
	('QQTYDMC8R8NBDHFFUU633E', '2024-12-04 05:39:32.353558+00', 500, 348, 152, 'cb7e57ed-a3d1-4956-ac45-ee4eec4db676', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('JL2GS9AXY9HDP8QH605WZ5', '2024-12-04 05:42:38.531989+00', 20, 5, 15, '8ebec945-e18a-47c0-b6d2-5894aee9e332', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('VT07KIPCTC3EYP7A4HMGPD', '2024-12-04 06:37:10.24876+00', 20, 5, 15, 'f7ea3823-50c9-4b40-afa2-1d10f4a95220', '89858adb-3f87-47d8-8ec6-d51dd2107431'),
	('OVLJ69YUQVQ8T3FS4JF1K5', '2024-12-04 15:24:21.173255+00', 30, 7, 23, 'a7c91964-394c-4544-b10d-dc5b0bd7f9e6', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('YLWOM1407SVSIFNOZ2C3LK', '2024-12-05 10:33:10.520481+00', 150, 35, 115, '94ed5e29-8f0d-4e23-83ff-6fe7b81b689b', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('UKAAEHE33V5TYF2B5DW018', '2024-12-06 11:00:26.032749+00', 100, 20, 80, 'c41083d4-1731-4a10-b1f2-046ea641e0a9', 'e426bb77-8953-41fd-9897-82eba3698b9c'),
	('E8JXQ0IRKQVEQLFIQGH52S', '2024-12-06 13:30:38.073343+00', 50, 5, 45, 'baeefbd1-fe0e-49af-8be9-826e4752940a', 'e426bb77-8953-41fd-9897-82eba3698b9c');


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
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

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 87, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: reorder_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."reorder_products_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
