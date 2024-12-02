alter table "public"."settings" drop constraint "settings_pkey";

drop index if exists "public"."settings_pkey";

alter table "public"."categories" alter column "id" set not null;

alter table "public"."categories" disable row level security;

alter table "public"."orders" drop column "price";

alter table "public"."orders" alter column "id" set not null;

alter table "public"."products" drop column "markup";

alter table "public"."products" drop column "price";

alter table "public"."products" drop column "qty";

alter table "public"."products" drop column "supplier_price";

alter table "public"."products" add column "cost_price" integer not null default 0;

alter table "public"."products" add column "reorder_level" integer not null default 0;

alter table "public"."products" add column "selling_price" integer not null default 0;

alter table "public"."products" add column "stock_qty" integer not null default 0;

alter table "public"."products" alter column "category_id" set not null;

alter table "public"."products" alter column "id" set not null;

alter table "public"."sales" alter column "id" set not null;

alter table "public"."settings" alter column "id" set default gen_random_uuid();

alter table "public"."settings" alter column "id" drop identity;

alter table "public"."settings" alter column "id" drop not null;

alter table "public"."settings" alter column "id" set data type uuid using "id"::uuid;

alter table "public"."transactions" alter column "id" set not null;

CREATE UNIQUE INDEX categories_pkey ON public.categories USING btree (id);

CREATE UNIQUE INDEX orders_pkey ON public.orders USING btree (id);

CREATE UNIQUE INDEX products_pkey ON public.products USING btree (id);

CREATE UNIQUE INDEX sales_pkey ON public.sales USING btree (id);

CREATE UNIQUE INDEX transactions_pkey ON public.transactions USING btree (id);

alter table "public"."categories" add constraint "categories_pkey" PRIMARY KEY using index "categories_pkey";

alter table "public"."orders" add constraint "orders_pkey" PRIMARY KEY using index "orders_pkey";

alter table "public"."products" add constraint "products_pkey" PRIMARY KEY using index "products_pkey";

alter table "public"."sales" add constraint "sales_pkey" PRIMARY KEY using index "sales_pkey";

alter table "public"."transactions" add constraint "transactions_pkey" PRIMARY KEY using index "transactions_pkey";

alter table "public"."orders" add constraint "orders_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE not valid;

alter table "public"."orders" validate constraint "orders_product_id_fkey";

alter table "public"."products" add constraint "products_category_id_fkey" FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE not valid;

alter table "public"."products" validate constraint "products_category_id_fkey";


