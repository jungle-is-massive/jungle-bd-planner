-- Run in Supabase SQL editor:
-- https://supabase.com/dashboard/project/iehkvlyjumkzccoqqgxl/sql

create table if not exists public.bd_contacts (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  title text,
  organisation text,
  current_action text,
  status text default 'Not started yet',
  next_action text,
  sort_order integer default 0,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.bd_contacts enable row level security;

create policy "anon_all" on public.bd_contacts
  for all to anon using (true) with check (true);

-- Seed data from your spreadsheet
insert into public.bd_contacts (name, title, organisation, current_action, status, next_action, sort_order) values
  ('Jill Huber', 'Managing Director', 'Ingenuity+', 'Primary relationship for Ingenuity+ engagement', 'In progress', 'Coris to book solo 1:1 to warm relationship before formal creds session with Mal', 1),
  ('Richard Robinson', 'Executive Director', 'Ingenuity+', 'Secondary relationship at Ingenuity+', 'In progress', 'Introduce via Jill Huber meeting', 2),
  ('Duncan Wood', 'MD Growth', 'Ingenuity Group', 'None', 'Not started yet', 'Engage as part of broader Ingenuity+ engagement', 3),
  ('Chris Kemp', 'Founder & CEO', 'Ingenuity Group', 'Billing dispute in progress - Jade dealing with', 'Not started yet', 'Email with Chris to get data in the diary to go to the office and have a chat', 4),
  ('Victoria Fox', 'CEO', 'AAR', 'Mal visited; Jungle placed in Weetabix pitch with no formal creds session', 'Not started yet', 'To arrange times for the team to meet and organise AR creds to be pulled down, ready for the meeting', 5),
  ('Andrew Bloch', 'Lead Consultant — PR / Social / Content', 'AAR', 'No creds session held; most relevant AAR contact for social/content briefs', 'Not yet met', 'To book 1:1 — highest priority AAR relationship', 6),
  ('Rebecca Nunneley', 'Partner', 'AAR', 'Met briefly; relationship not developed', 'Reached out on LinkedIn to introduce myself', 'Rebecca will turn up to the meet and greet with Jungle', 7),
  ('Emily Peacock', 'Consultant', 'AAR', '', 'Not yet met', 'Connected with Emily', 8),
  ('Rebecca McKinlay', 'Managing Director', 'Oystercatchers', 'Post-MBO owner; no contact established yet', 'Research required', 'Meet Monday 13th at 4.30pm', 9),
  ('Adam Trainis', 'Client Director', 'Oystercatchers', 'No contact established', 'Not started yet', 'Introduce via OC engagement in Q2', 10),
  ('Rebecca Lalonde', 'Independent Consultant (ex-Oystercatchers)', 'Freelance', 'Coris has messaged - coffee being arranged', 'Warm, in progress', 'Waiting to receive an intermediary presentation quote', 11),
  ('Charlie Carpenter', 'CEO', 'Creativebrief', 'No current relationship', 'Not started yet', 'Approach after discovery call with Luke and profile audit completed', 12),
  ('Stephanie Nattu', 'Managing Director', 'Creativebrief', 'Referenced by Jade as the key contact', 'Warm but dormant', 'Discovery call to understand offering and events calendar', 13),
  ('Nicola Kemp', 'Editorial Director', 'Creativebrief', 'No current relationship', 'Not yet met', 'Approach for editorial/content angle once core relationship established', 14),
  ('Lucinda Peniston-Baines', 'Co-Founder & Managing Partner', 'Observatory International', 'Previously met via Jade; relationship lapsed', 'Warm but dormant', 'Jade to provide warm intro; Coris to reconnect with commercial impact framing', 15),
  ('Stuart Pocock', 'Co-Founder & Managing Partner', 'Observatory International', 'No direct contact', 'Not started yet', 'Meet as part of Observatory engagement', 16);
