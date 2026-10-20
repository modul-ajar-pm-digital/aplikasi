create table public.modul (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text,
  data jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.modul enable row level security;
create policy "milik sendiri" on public.modul for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
create or replace function public.touch() returns trigger as $$
begin new.updated_at = now(); return new; end; $$ language plpgsql;
create trigger modul_touch before update on public.modul
  for each row execute function public.touch();
