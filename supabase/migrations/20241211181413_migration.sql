drop policy "get all categories of user " on "public"."categories";

drop policy "user create category" on "public"."categories";

drop policy "user delete category" on "public"."categories";

drop policy "user update category" on "public"."categories";

drop policy "get all products of user" on "public"."products";

drop policy "user create product" on "public"."products";

drop policy "user delete product" on "public"."products";

drop policy "user update product" on "public"."products";

create policy "user_delete_order"
on "public"."orders"
as permissive
for delete
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "get all categories of user "
on "public"."categories"
as permissive
for select
to authenticated
using (true);


create policy "user create category"
on "public"."categories"
as permissive
for insert
to authenticated
with check (true);


create policy "user delete category"
on "public"."categories"
as permissive
for delete
to authenticated
using (true);


create policy "user update category"
on "public"."categories"
as permissive
for update
to authenticated
using (true);


create policy "get all products of user"
on "public"."products"
as permissive
for select
to authenticated
using (true);


create policy "user create product"
on "public"."products"
as permissive
for insert
to authenticated
with check (true);


create policy "user delete product"
on "public"."products"
as permissive
for delete
to authenticated
using (true);


create policy "user update product"
on "public"."products"
as permissive
for update
to authenticated
using (true)
with check (true);



