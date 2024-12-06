drop policy "get all categories of user " on "public"."categories";

drop policy "user create category" on "public"."categories";

drop policy "user delete category" on "public"."categories";

drop policy "user update category" on "public"."categories";

drop policy "get all orders of user" on "public"."orders";

drop policy "user create order" on "public"."orders";

drop policy "get all products of user" on "public"."products";

drop policy "user create product" on "public"."products";

drop policy "user delete product" on "public"."products";

drop policy "user update product" on "public"."products";

drop policy "get all sales of user" on "public"."sales";

drop policy "user create sales" on "public"."sales";

drop policy "get all transactions of user" on "public"."transactions";

drop policy "user create transaction" on "public"."transactions";

drop policy "user update transaction" on "public"."transactions";

create policy "get all categories of user "
on "public"."categories"
as permissive
for select
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "user create category"
on "public"."categories"
as permissive
for insert
to authenticated
with check ((( SELECT auth.uid() AS uid) = user_id));


create policy "user delete category"
on "public"."categories"
as permissive
for delete
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "user update category"
on "public"."categories"
as permissive
for update
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "get all orders of user"
on "public"."orders"
as permissive
for select
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "user create order"
on "public"."orders"
as permissive
for insert
to authenticated
with check ((( SELECT auth.uid() AS uid) = user_id));


create policy "get all products of user"
on "public"."products"
as permissive
for select
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "user create product"
on "public"."products"
as permissive
for insert
to authenticated
with check ((( SELECT auth.uid() AS uid) = user_id));


create policy "user delete product"
on "public"."products"
as permissive
for delete
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "user update product"
on "public"."products"
as permissive
for update
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id))
with check ((( SELECT auth.uid() AS uid) = user_id));


create policy "get all sales of user"
on "public"."sales"
as permissive
for select
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "user create sales"
on "public"."sales"
as permissive
for insert
to authenticated
with check ((( SELECT auth.uid() AS uid) = user_id));


create policy "get all transactions of user"
on "public"."transactions"
as permissive
for select
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "user create transaction"
on "public"."transactions"
as permissive
for insert
to authenticated
with check ((( SELECT auth.uid() AS uid) = user_id));


create policy "user update transaction"
on "public"."transactions"
as permissive
for update
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id))
with check ((( SELECT auth.uid() AS uid) = user_id));



