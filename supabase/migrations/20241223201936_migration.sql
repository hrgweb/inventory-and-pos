alter table "public"."categories" add column "is_deleted" boolean not null default false;

alter table "public"."products" add column "is_deleted" boolean not null default false;


