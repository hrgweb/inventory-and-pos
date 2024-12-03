revoke delete on table "public"."users" from "anon";

revoke insert on table "public"."users" from "anon";

revoke references on table "public"."users" from "anon";

revoke select on table "public"."users" from "anon";

revoke trigger on table "public"."users" from "anon";

revoke truncate on table "public"."users" from "anon";

revoke update on table "public"."users" from "anon";

revoke delete on table "public"."users" from "authenticated";

revoke insert on table "public"."users" from "authenticated";

revoke references on table "public"."users" from "authenticated";

revoke select on table "public"."users" from "authenticated";

revoke trigger on table "public"."users" from "authenticated";

revoke truncate on table "public"."users" from "authenticated";

revoke update on table "public"."users" from "authenticated";

revoke delete on table "public"."users" from "service_role";

revoke insert on table "public"."users" from "service_role";

revoke references on table "public"."users" from "service_role";

revoke select on table "public"."users" from "service_role";

revoke trigger on table "public"."users" from "service_role";

revoke truncate on table "public"."users" from "service_role";

revoke update on table "public"."users" from "service_role";

alter table "public"."users" drop constraint "users_email_key";

alter table "public"."users" drop constraint "users_username_key";

alter table "public"."sales" drop constraint "sales_pkey";

alter table "public"."transactions" drop constraint "transactions_pkey";

alter table "public"."users" drop constraint "users_pkey";

drop index if exists "public"."sales_pkey";

drop index if exists "public"."transactions_pkey";

drop index if exists "public"."users_email_key";

drop index if exists "public"."users_pkey";

drop index if exists "public"."users_username_key";

drop table "public"."users";

create table "public"."customers" (
    "first_name" character varying not null,
    "last_name" character varying not null,
    "created_at" timestamp with time zone not null default now(),
    "user_id" uuid default gen_random_uuid(),
    "id" uuid default gen_random_uuid()
);

alter table "public"."categories" add column "user_id" uuid default gen_random_uuid();

alter table "public"."categories" alter column "id" drop identity;

alter table "public"."products" drop constraint "products_category_id_fkey";

alter table "public"."categories" drop column "id";
alter table "public"."categories" add column "id" uuid default gen_random_uuid();

alter table "public"."products" drop column "category_id";
alter table "public"."products" add column "category_id" uuid default gen_random_uuid();

alter table "public"."orders" drop constraint "orders_product_id_fkey";

alter table "public"."products" drop column "id";
alter table "public"."products" add column "id" uuid default gen_random_uuid();

alter table "public"."orders" drop column "id";
alter table "public"."orders" add column "id" uuid default gen_random_uuid();


alter table "public"."orders" drop column "product_id";
alter table "public"."orders" add column "product_id" uuid default gen_random_uuid();


alter table "public"."sales" drop column "id";
alter table "public"."sales" add column "id" uuid default gen_random_uuid();

alter table "public"."transactions" drop column "id";
alter table "public"."transactions" add column "id" uuid default gen_random_uuid();

grant delete on table "public"."customers" to "anon";

grant insert on table "public"."customers" to "anon";

grant references on table "public"."customers" to "anon";

grant select on table "public"."customers" to "anon";

grant trigger on table "public"."customers" to "anon";

grant truncate on table "public"."customers" to "anon";

grant update on table "public"."customers" to "anon";

grant delete on table "public"."customers" to "authenticated";

grant insert on table "public"."customers" to "authenticated";

grant references on table "public"."customers" to "authenticated";

grant select on table "public"."customers" to "authenticated";

grant trigger on table "public"."customers" to "authenticated";

grant truncate on table "public"."customers" to "authenticated";

grant update on table "public"."customers" to "authenticated";

grant delete on table "public"."customers" to "service_role";

grant insert on table "public"."customers" to "service_role";

grant references on table "public"."customers" to "service_role";

grant select on table "public"."customers" to "service_role";

grant trigger on table "public"."customers" to "service_role";

grant truncate on table "public"."customers" to "service_role";

grant update on table "public"."customers" to "service_role";
