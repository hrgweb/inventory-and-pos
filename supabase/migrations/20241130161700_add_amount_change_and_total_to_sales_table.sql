alter table "public"."categories" enable row level security;

alter table "public"."sales" add column "amount" integer;

alter table "public"."sales" add column "change" integer;

alter table "public"."sales" add column "total" integer;


