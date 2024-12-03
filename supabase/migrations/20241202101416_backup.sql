alter table "public"."settings" alter column "id" set not null;

alter table "public"."settings" alter column "trial_period_days" set not null;

CREATE UNIQUE INDEX settings_pkey ON public.settings USING btree (id);

alter table "public"."settings" add constraint "settings_pkey" PRIMARY KEY using index "settings_pkey";


