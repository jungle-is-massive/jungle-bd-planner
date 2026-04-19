-- ═══════════════════════════════════════════════════════════════════════════
-- JUNGLE COMMS PLAN — SCHEMA
-- For the evolved BD Planner + standalone SMI page
-- Run this in the Supabase SQL Editor
-- Safe to re-run (uses IF NOT EXISTS)
-- ═══════════════════════════════════════════════════════════════════════════

-- A. TEAM MEMBERS (owners of things)
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists team_members (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  role_title text,
  team text,
  email text,
  initials text,
  is_active boolean default true,
  sort_order integer default 0,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- B. BRAND HOUSE (proposition, POV, vision — single live row)
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists brand_house (
  id uuid primary key default gen_random_uuid(),
  proposition_line text,
  proposition_status text default 'draft',   -- draft, in_review, approved
  core_pov text,
  vision_statement text,
  mission_statement text,
  boilerplate_short text,
  boilerplate_long text,
  notes text,
  updated_at timestamptz default now()
);

-- C. NARRATIVE PILLARS
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists narrative_pillars (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  description text,
  detail_html text,                          -- Rich detail carried over from existing BDP
  status text default 'under_review',        -- confirmed, under_review, parked
  sort_order integer default 0,
  best_icp_fit text,
  key_question text,
  owner_id uuid references team_members(id) on delete set null,
  is_primary boolean default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- D. PILLAR MESSAGES — talking points, proof points, content angles, objections
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists pillar_messages (
  id uuid primary key default gen_random_uuid(),
  pillar_id uuid references narrative_pillars(id) on delete cascade,
  message_type text not null,                -- talking_point, proof_point, content_angle, objection_handle
  title text not null,
  body text,
  sort_order integer default 0,
  status text default 'draft',               -- draft, approved
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- E. CONTENT SERIES (Buzz, Rumble, Roar, podcast, newsletter)
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists content_series (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  content_tier text,                         -- buzz, rumble, roar
  format_type text,                          -- post, article, newsletter, podcast, video, webinar, event, report, masterclass
  description text,
  cadence_label text,
  cadence_days integer,
  primary_channel text,
  owner_id uuid references team_members(id) on delete set null,
  strategic_purpose text,
  status text default 'planned',             -- planned, active, paused, archived
  decision_required boolean default false,
  decision_note text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- F. STRATEGIC DECISIONS
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists strategic_decisions (
  id uuid primary key default gen_random_uuid(),
  category text not null,                    -- ownership, format, proposition, funnel, event, pillar, distribution
  title text not null,
  question text,
  why_it_matters text,
  impact_level text default 'medium',        -- low, medium, high, critical
  status text default 'open',                -- open, in_review, decided, blocked
  proposed_answer text,
  final_answer text,
  owner_id uuid references team_members(id) on delete set null,
  due_date date,
  related_area text,                         -- free-text: brand_house, comms, nurture, smi, etc
  sort_order integer default 0,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- G. FUNNEL STAGES
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists funnel_stages (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  stage_order integer not null,
  description text,
  is_mql boolean default false,
  is_sql boolean default false,
  created_at timestamptz default now()
);

-- H. FUNNEL DEFINITIONS (e.g. "what qualifies as an MQL")
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists funnel_definitions (
  id uuid primary key default gen_random_uuid(),
  rule_type text not null,                   -- mql_definition, sql_definition, followup_rule, routing_rule
  title text not null,
  body text,
  status text default 'not_defined',         -- not_defined, draft, approved
  owner_id uuid references team_members(id) on delete set null,
  updated_at timestamptz default now()
);

-- I. NURTURE SEQUENCES + STEPS
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists nurture_sequences (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  source_type text,                          -- event, download, newsletter, intermediary, manual
  description text,
  owner_id uuid references team_members(id) on delete set null,
  duration_days integer,
  status text default 'draft',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists nurture_steps (
  id uuid primary key default gen_random_uuid(),
  sequence_id uuid references nurture_sequences(id) on delete cascade,
  step_number integer,
  offset_days integer,
  title text not null,
  channel_type text,                         -- email, linkedin, phone, invite, content_send, internal_task
  goal text,
  owner_id uuid references team_members(id) on delete set null,
  status text default 'draft',
  created_at timestamptz default now()
);

-- J. SMI EVENT WORKSTREAMS + TASKS (Social Maturity Index)
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists smi_workstreams (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  sort_order integer default 0,
  owner_id uuid references team_members(id) on delete set null,
  status text default 'not_started',         -- not_started, in_progress, at_risk, done
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists smi_tasks (
  id uuid primary key default gen_random_uuid(),
  workstream_id uuid references smi_workstreams(id) on delete set null,
  title text not null,
  description text,
  owner_id uuid references team_members(id) on delete set null,
  due_date date,
  start_date date,
  status text default 'not_started',         -- not_started, in_progress, blocked, done
  priority text default 'medium',            -- low, medium, high, critical
  phase text,                                -- Foundation, Build, Promotion, Event, Post-Event
  notes text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- K. SMI SPEAKERS
-- ───────────────────────────────────────────────────────────────────────────
create table if not exists smi_speakers (
  id uuid primary key default gen_random_uuid(),
  team_member_id uuid references team_members(id) on delete set null,
  display_name text not null,
  role_label text,                           -- e.g. Social expertise / credibility
  bio_short text,
  narrative_role text,                       -- What they're saying in the event arc
  session_title text,
  talking_points text,
  slide_owner_note text,
  status text default 'tbd',                 -- confirmed, tentative, tbd
  sort_order integer default 0,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- ═══════════════════════════════════════════════════════════════════════════
-- ROW LEVEL SECURITY — open anon policies (matches existing tables)
-- ═══════════════════════════════════════════════════════════════════════════

do $$
declare
  t text;
begin
  for t in select unnest(array[
    'team_members', 'brand_house', 'narrative_pillars', 'pillar_messages',
    'content_series', 'strategic_decisions', 'funnel_stages', 'funnel_definitions',
    'nurture_sequences', 'nurture_steps', 'smi_workstreams', 'smi_tasks', 'smi_speakers'
  ])
  loop
    execute format('alter table %I enable row level security', t);
    execute format('drop policy if exists "anon all access" on %I', t);
    execute format('create policy "anon all access" on %I for all to anon using (true) with check (true)', t);
  end loop;
end $$;

-- ═══════════════════════════════════════════════════════════════════════════
-- updated_at trigger (reuses function if already created by earlier scripts)
-- ═══════════════════════════════════════════════════════════════════════════

create or replace function set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

do $$
declare
  t text;
begin
  for t in select unnest(array[
    'brand_house', 'narrative_pillars', 'pillar_messages', 'content_series',
    'strategic_decisions', 'funnel_definitions', 'nurture_sequences',
    'smi_workstreams', 'smi_tasks', 'smi_speakers', 'team_members'
  ])
  loop
    execute format('drop trigger if exists %I_updated_at on %I', t, t);
    execute format('create trigger %I_updated_at before update on %I for each row execute function set_updated_at()', t, t);
  end loop;
end $$;
