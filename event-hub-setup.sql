-- Run in Supabase SQL editor:
-- https://supabase.com/dashboard/project/iehkvlyjumkzccoqqgxl/sql

create table if not exists public.event_hub (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz default now()
);

alter table public.event_hub enable row level security;

create policy "anon_all" on public.event_hub
  for all to anon using (true) with check (true);
