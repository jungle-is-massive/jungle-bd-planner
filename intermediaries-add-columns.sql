-- Run in Supabase SQL editor:
-- https://supabase.com/dashboard/project/iehkvlyjumkzccoqqgxl/sql

alter table public.intermediaries
  add column if not exists annual_cost_estimate numeric default null,
  add column if not exists avg_pitch_value numeric default null;
