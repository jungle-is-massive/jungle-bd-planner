-- Run in Supabase SQL editor:
-- https://supabase.com/dashboard/project/iehkvlyjumkzccoqqgxl/sql

create table if not exists public.prospects (
  id uuid default gen_random_uuid() primary key,
  first_name text,
  last_name text,
  company text,
  title text,
  linkedin_url text,
  email text,
  manual_email text,
  corporate_email text,
  linkedin_email text,
  company_website text,
  campaign text,
  raw jsonb,
  created_at timestamptz default now()
);

alter table public.prospects enable row level security;

create policy "anon_all" on public.prospects
  for all to anon using (true) with check (true);
