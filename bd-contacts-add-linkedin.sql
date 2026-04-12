-- Run in Supabase SQL editor to add LinkedIn URL column:
alter table public.bd_contacts add column if not exists linkedin_url text;
