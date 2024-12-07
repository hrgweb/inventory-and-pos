alter table "public"."customers" alter column "id" set not null;

alter table "public"."suppliers" alter column "id" set not null;

CREATE UNIQUE INDEX customers_pkey ON public.customers USING btree (id);

CREATE UNIQUE INDEX suppliers_pkey ON public.suppliers USING btree (id);

alter table "public"."customers" add constraint "customers_pkey" PRIMARY KEY using index "customers_pkey";

alter table "public"."suppliers" add constraint "suppliers_pkey" PRIMARY KEY using index "suppliers_pkey";


