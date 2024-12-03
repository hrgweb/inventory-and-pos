alter table "public"."categories" enable row level security;

alter table "public"."orders" add column "user_id" uuid default gen_random_uuid();

alter table "public"."orders" enable row level security;

alter table "public"."products" add column "user_id" uuid default gen_random_uuid();

alter table "public"."products" enable row level security;

alter table "public"."sales" add column "user_id" uuid default gen_random_uuid();

alter table "public"."sales" enable row level security;

alter table "public"."settings" add column "user_id" uuid default gen_random_uuid();

alter table "public"."transactions" add column "user_id" uuid default gen_random_uuid();

alter table "public"."transactions" enable row level security;

alter table "public"."categories" add constraint "categories_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."categories" validate constraint "categories_user_id_fkey";

alter table "public"."customers" add constraint "customers_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."customers" validate constraint "customers_user_id_fkey";

alter table "public"."orders" add constraint "orders_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."orders" validate constraint "orders_user_id_fkey";

alter table "public"."products" add constraint "products_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."products" validate constraint "products_user_id_fkey";

alter table "public"."sales" add constraint "sales_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."sales" validate constraint "sales_user_id_fkey";

alter table "public"."settings" add constraint "settings_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."settings" validate constraint "settings_user_id_fkey";

alter table "public"."transactions" add constraint "transactions_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."transactions" validate constraint "transactions_user_id_fkey";

create policy "get all categories of user "
on "public"."categories"
as permissive
for select
to authenticated
using ((user_id = auth.uid()));


create policy "user create category"
on "public"."categories"
as permissive
for insert
to authenticated
with check ((user_id = auth.uid()));


create policy "user delete category"
on "public"."categories"
as permissive
for delete
to authenticated
using ((user_id = auth.uid()));


create policy "user update category"
on "public"."categories"
as permissive
for update
to authenticated
using ((user_id = auth.uid()));


create policy "get all orders of user"
on "public"."orders"
as permissive
for select
to authenticated
using ((user_id = auth.uid()));


create policy "user create order"
on "public"."orders"
as permissive
for insert
to authenticated
with check ((user_id = auth.uid()));


create policy "get all products of user"
on "public"."products"
as permissive
for select
to authenticated
using ((user_id = auth.uid()));


create policy "user create product"
on "public"."products"
as permissive
for insert
to authenticated
with check ((user_id = auth.uid()));


create policy "user delete product"
on "public"."products"
as permissive
for delete
to authenticated
using ((user_id = auth.uid()));


create policy "user update product"
on "public"."products"
as permissive
for update
to authenticated
using ((user_id = auth.uid()))
with check ((user_id = auth.uid()));


create policy "get all sales of user"
on "public"."sales"
as permissive
for select
to authenticated
using ((user_id = auth.uid()));


create policy "user create sales"
on "public"."sales"
as permissive
for insert
to authenticated
with check ((user_id = auth.uid()));


create policy "get all transactions of user"
on "public"."transactions"
as permissive
for select
to authenticated
using ((user_id = auth.uid()));


create policy "user create transaction"
on "public"."transactions"
as permissive
for insert
to authenticated
with check ((user_id = auth.uid()));


create policy "user update transaction"
on "public"."transactions"
as permissive
for update
to authenticated
using ((user_id = auth.uid()))
with check ((user_id = auth.uid()));



