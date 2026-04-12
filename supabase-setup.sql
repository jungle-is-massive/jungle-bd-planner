-- Run this in your Supabase SQL editor to set up the BD Planner tables
-- https://supabase.com/dashboard/project/iehkvlyjumkzccoqqgxl/sql

-- EVENTS TABLE
create table if not exists public.events (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  category text not null default 'attendance',
  start_date date not null,
  end_date date,
  location text,
  description text,
  row_key text not null default 'event-attendance',
  created_at timestamptz default now()
);

alter table public.events enable row level security;

create policy "anon_all" on public.events
  for all to anon using (true) with check (true);

-- QUESTIONS TABLE
create table if not exists public.questions (
  id uuid default gen_random_uuid() primary key,
  context text,
  question text not null,
  submitted_at timestamptz default now(),
  answered boolean default false
);

alter table public.questions enable row level security;

create policy "anon_all" on public.questions
  for all to anon using (true) with check (true);

-- ASSETS TABLE
create table if not exists public.assets (
  id uuid default gen_random_uuid() primary key,
  icon text default '📄',
  name text not null,
  description text,
  status text not null default 'needed',
  doc_url text default '',
  created_at timestamptz default now()
);

alter table public.assets enable row level security;

create policy "anon_all" on public.assets
  for all to anon using (true) with check (true);

-- SEED ASSETS
insert into public.assets (icon, name, description, status) values
  ('📊', 'Intermediary Deck', 'Tailored creds for intermediary conversations — social maturity framing, category expertise, case studies.', 'in-progress'),
  ('📝', 'Pillar Half-Pagers', 'One-page write-ups of each confirmed theme — what it means, proof points, ICP alignment.', 'needed'),
  ('🎯', 'Case Studies (x3)', 'Commercial impact case studies — one per priority ICP. Problem → approach → result.', 'needed'),
  ('🖥️', 'Event One-Pager', 'Invite and overview asset for the Oct owned event. Speaker bios, format, audience rationale.', 'needed'),
  ('📦', 'Slim Creds Update', 'Refresh the existing slim creds to reflect new pillar language and most recent work.', 'in-progress'),
  ('📈', 'Social Maturity Index', 'Proprietary diagnostic tool — the IP asset that can drive PR, lead gen, and event hooks.', 'needed'),
  ('✉️', 'Nurture Email Sequence', 'Post-event and always-on nurture comms. Pillar-themed, fortnightly → monthly cadence.', 'needed'),
  ('🎤', 'Speaking Abstract', 'Reusable abstract for conference speaking applications — pillar-led, commercially framed.', 'needed');


insert into public.events (name, category, start_date, end_date, location, description, row_key) values
  ('MAD Meets', 'intermediary', '2026-05-14', '2026-05-14', 'London', 'Ingenuity+ quarterly event for brand marketers and senior agency contacts.', 'intermediary-ingenuity'),
  ('MAD Meets', 'intermediary', '2026-08-13', '2026-08-13', 'London', 'Ingenuity+ quarterly event.', 'intermediary-ingenuity'),
  ('MAD Meets', 'intermediary', '2026-11-12', '2026-11-12', 'London', 'Ingenuity+ quarterly event.', 'intermediary-ingenuity'),
  ('MAD Meets', 'intermediary', '2027-02-11', '2027-02-11', 'London', 'Ingenuity+ quarterly event.', 'intermediary-ingenuity'),
  ('Masterclassing Social', 'speaking', '2026-06-04', '2026-06-04', 'London', 'Quarterly social marketing masterclass — speaking slot.', 'event-speaking'),
  ('Masterclassing Social', 'speaking', '2026-09-03', '2026-09-03', 'London', 'Quarterly social marketing masterclass — speaking slot.', 'event-speaking'),
  ('Masterclassing Social', 'speaking', '2026-12-03', '2026-12-03', 'London', 'Quarterly social marketing masterclass — speaking slot.', 'event-speaking'),
  ('Oystercatchers Event', 'intermediary', '2026-07-09', '2026-07-09', 'London', 'Oystercatchers quarterly event (assumed). Confirm sign-up with Jade.', 'intermediary-oystercatchers'),
  ('Oystercatchers Event', 'intermediary', '2026-10-08', '2026-10-08', 'London', 'Oystercatchers quarterly event (assumed).', 'intermediary-oystercatchers'),
  ('Oystercatchers Event', 'intermediary', '2027-01-08', '2027-01-08', 'London', 'Oystercatchers quarterly event (assumed).', 'intermediary-oystercatchers'),
  ('Jungle Brand Event', 'owned', '2026-10-01', '2026-10-01', 'London', 'Jungle Creations hosted brand event. Panel format, invite-only. Target audience: brand-side CMOs and senior marketers.', 'owned-events'),
  ('Video Marketing World', 'attendance', '2026-04-14', '2026-04-14', 'London', 'Video marketing industry conference.', 'event-attendance'),
  ('Social Media Marketing', 'attendance', '2026-05-20', '2026-05-20', 'London', 'Social marketing conference.', 'event-attendance'),
  ('Cannes Lions', 'attendance', '2026-06-22', '2026-06-26', 'Cannes, France', 'Cannes Lions International Festival of Creativity.', 'event-attendance');
