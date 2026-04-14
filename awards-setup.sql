-- ── AWARD BODIES TABLE ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS award_bodies (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  status TEXT,
  final_deadline DATE,
  shortlist DATE,
  ceremony DATE,
  location TEXT,
  entry_fee TEXT,
  award_notes TEXT,
  should_attend TEXT,
  cost_per_seat NUMERIC,
  no_of_seats INTEGER,
  attendance_notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ── AWARD ENTRIES TABLE ────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS award_entries (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  award_body_id BIGINT NOT NULL REFERENCES award_bodies(id) ON DELETE CASCADE,
  category TEXT NOT NULL,
  category_type TEXT,
  jungle_fit TEXT,
  entry_reason TEXT,
  should_enter TEXT,
  est_fee TEXT,
  status TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ── RLS POLICIES ───────────────────────────────────────────────────
ALTER TABLE award_bodies ENABLE ROW LEVEL SECURITY;
ALTER TABLE award_entries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "award_bodies_anon_read" ON award_bodies FOR SELECT USING (true);
CREATE POLICY "award_bodies_anon_insert" ON award_bodies FOR INSERT WITH CHECK (true);
CREATE POLICY "award_bodies_anon_update" ON award_bodies FOR UPDATE USING (true);
CREATE POLICY "award_bodies_anon_delete" ON award_bodies FOR DELETE USING (true);

CREATE POLICY "award_entries_anon_read" ON award_entries FOR SELECT USING (true);
CREATE POLICY "award_entries_anon_insert" ON award_entries FOR INSERT WITH CHECK (true);
CREATE POLICY "award_entries_anon_update" ON award_entries FOR UPDATE USING (true);
CREATE POLICY "award_entries_anon_delete" ON award_entries FOR DELETE USING (true);

-- ── INDEXES ────────────────────────────────────────────────────────
CREATE INDEX idx_award_entries_body ON award_entries(award_body_id);
