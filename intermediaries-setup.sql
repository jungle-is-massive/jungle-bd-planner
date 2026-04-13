-- Run in Supabase SQL editor:
-- https://supabase.com/dashboard/project/iehkvlyjumkzccoqqgxl/sql

create table if not exists public.intermediaries (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  status text default 'Not started yet',
  stage text,
  pitch_target text,
  goal text,
  cost_to_jungle text,
  commercial_model text,
  sort_order integer default 0,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.intermediaries enable row level security;

create policy "anon_all" on public.intermediaries
  for all to anon using (true) with check (true);
