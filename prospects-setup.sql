-- Run in Supabase SQL editor:
-- https://supabase.com/dashboard/project/iehkvlyjumkzccoqqgxl/sql

create table if not exists public.prospects (
  id uuid default gen_random_uuid() primary key,
  first_name text,
  last_name text,
  full_name text,
  title text,
  company text,
  linkedin_url text,
  email text,
  connected_at timestamptz,
  campaign text,
  status text default 'connected',
  notes text,
  raw jsonb,  -- stores the full payload from Dripify/Make so nothing is lost
  created_at timestamptz default now()
);

alter table public.prospects enable row level security;

create policy "anon_all" on public.prospects
  for all to anon using (true) with check (true);
