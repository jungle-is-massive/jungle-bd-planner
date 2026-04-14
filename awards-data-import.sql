-- ============================================
-- AWARD BODIES INSERT STATEMENTS
-- ============================================

INSERT INTO award_bodies (name, status, final_deadline, shortlist, ceremony, location, entry_fee, award_notes, attendance_notes)
VALUES ('European Agency Awards', 'Open', '2026-06-04', '2026-06-26', '2026-09-22', 'Ibiza', '~£300', 'Super early bird deadline this week.', NULL);

INSERT INTO award_bodies (name, status, final_deadline, shortlist, ceremony, location, entry_fee, award_notes, attendance_notes)
VALUES ('UK Agency Awards', 'Open', '2026-06-11', '2026-07-17', '2026-10-01', 'London', '~£300', NULL, NULL);

INSERT INTO award_bodies (name, status, final_deadline, shortlist, ceremony, location, entry_fee, award_notes, attendance_notes)
VALUES ('UK Social Media Awards', 'Open', '2026-06-25', '2026-07-30', '2026-10-22', 'London', '~£300', NULL, NULL);

INSERT INTO award_bodies (name, status, final_deadline, shortlist, ceremony, location, entry_fee, award_notes, attendance_notes)
VALUES ('Global Digital Excellence', 'Open', '2026-08-13', '2026-09-18', '2026-10-22', 'Virtual', '~£300', NULL, NULL);

INSERT INTO award_bodies (name, status, final_deadline, shortlist, ceremony, location, entry_fee, award_notes, attendance_notes)
VALUES ('GIMA: Global Influencer Marketing Awards', NULL, '2026-05-14', '2026-06-18', '2026-09-03', 'The Londoner, London', '£495 (regular)', 'Early bird closed. Late entry £595, last chance £695.', NULL);

INSERT INTO award_bodies (name, status, final_deadline, shortlist, ceremony, location, entry_fee, award_notes, attendance_notes)
VALUES ('Drum B2B Awards', 'Open', NULL, '2026-08-27', NULL, 'Miami', '~£300+', 'Check Drum site for exact fee — likely higher than £300.', NULL);

INSERT INTO award_bodies (name, status, final_deadline, shortlist, ceremony, location, entry_fee, award_notes, attendance_notes)
VALUES ('Prolific North Marketing Awards', 'Open', '2026-09-12', '2026-09-25', '2026-10-23', NULL, '~£300', NULL, NULL);

-- ============================================
-- AWARD ENTRIES INSERT STATEMENTS
-- ============================================

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Brand Awareness Campaign', 'Campaign', 'Strong', 'publisher reach at scale', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Integrated Influencer Campaign', 'Campaign', 'Strong', 'multi-channel campaigns', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Audience Engagement Campaign', 'Campaign', 'Strong', 'engagement metrics', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Most Creative Influencer Campaign (NEW)', 'Campaign', 'Good', 'creative production strength', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Full-Funnel Influencer Strategy', 'Campaign', 'Good', 'awareness to conversion', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Retail & eCommerce Influencer Strategy', 'Campaign', 'Possible', 'DFS, client work', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Influencer-Led Commerce Campaign (NEW)', 'Campaign', 'Possible', 'social commerce', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Most Effective Campaign for ROI', 'Campaign', 'Strong', 'if ROI data available', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Long-Term Creator Partnership (NEW)', 'Format', 'Strong', 'sustained brand partnerships', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Use of Micro, Nano or Niche Creators', 'Format', 'Possible', 'depends on campaign', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Use of UGC', 'Format', 'Possible', 'UGC-led work', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Influencer-Led Content Series or Franchise', 'Format', 'Strong', 'Twisted, Up Your Street etc', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Fashion, Beauty & Luxury Campaign', 'Vertical', 'Strong', 'Refy, Jo Malone, Michael Kors', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Consumer Goods Campaign', 'Vertical', 'Possible', 'FMCG clients', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Finance, Travel or Services Campaign', 'Vertical', 'Possible', 'Love Holidays', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Boutique Influencer Marketing Agency of the Year', 'People & Teams', 'Possible', 'check size criteria', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: GIMA
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Influencer Marketing Team of the Year', 'People & Teams', 'Strong', 'team entry', '£495'
FROM award_bodies
WHERE name = 'GIMA: Global Influencer Marketing Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Social Media Campaign', 'Campaign', 'Strong', 'core service', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Marketing Campaign', 'Campaign', 'Strong', 'broad campaign work', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Integrated Campaign', 'Campaign', 'Strong', 'multi-channel', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Pan European Campaign', 'Campaign', 'Possible', 'if pan-EU client work', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Event', 'Campaign', 'Good', 'Twisted Open Kitchen', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Campaign Effectiveness Award', 'Campaign', 'Strong', 'ROI focus', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Social Media Agency of the Year', 'Agency', 'Strong', 'core positioning', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Marketing Agency of the Year', 'Agency', 'Strong', 'broad agency category', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Innovative Agency of the Year', 'Agency', 'Good', 'publisher-powered model', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Integrated Agency of the Year', 'Agency', 'Good', 'social, influencer, production', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Large Agency of the Year (26+ employees)', 'Agency', 'Strong', 'size fits', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Agency Growth & Transformation Award (NEW)', 'Agency', 'Good', 'Mallory appointment, growth story', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: European Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Agency Leader of the Year (NEW)', 'Individual', 'Good', 'Mallory Simmonds', '~£300'
FROM award_bodies
WHERE name = 'European Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Social Media Campaign', 'Campaign', 'Strong', 'core service', '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Marketing Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Integrated Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Campaign Effectiveness Award', 'Campaign', 'Strong', 'ROI focus', '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Event', 'Campaign', 'Good', 'Twisted Open Kitchen', '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Social Media Agency of the Year', 'Agency', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Marketing Agency of the Year', 'Agency', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Innovative Agency of the Year (large)', 'Agency', 'Good', 'publisher-powered model', '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Integrated Agency of the Year', 'Agency', 'Good', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Large Agency of the Year (26+)', 'Agency', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Agency Growth & Transformation Award (NEW)', 'Agency', 'Good', 'growth story', '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Agency Leader of the Year (NEW)', 'Individual', 'Good', 'Mallory Simmonds', '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Agency Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Events Agency of the Year (NEW)', 'Agency', 'Possible', 'events offer growing', '~£300'
FROM award_bodies
WHERE name = 'UK Agency Awards';

-- Award Body: UK Social Media Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Use of Social Media for FMCG', 'Campaign', 'Strong', 'Ben & Jerry''s, Itsu etc', '~£300'
FROM award_bodies
WHERE name = 'UK Social Media Awards';

-- Award Body: UK Social Media Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Use of Social Media for Fashion', 'Campaign', 'Strong', 'fashion clients', '~£300'
FROM award_bodies
WHERE name = 'UK Social Media Awards';

-- Award Body: UK Social Media Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Long-Term Strategic Use of Social Media', 'Campaign', 'Strong', 'retained client work', '~£300'
FROM award_bodies
WHERE name = 'UK Social Media Awards';

-- Award Body: UK Social Media Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Social Media Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Social Media Awards';

-- Award Body: UK Social Media Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Influencer Marketing Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Social Media Awards';

-- Award Body: UK Social Media Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Use of TikTok', 'Campaign', 'Strong', 'Disney Store TikTok', '~£300'
FROM award_bodies
WHERE name = 'UK Social Media Awards';

-- Award Body: UK Social Media Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Social Media Agency of the Year (large)', 'Agency', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'UK Social Media Awards';

-- Award Body: UK Social Media Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best In-Agency Social Media Team', 'Team', 'Strong', 'team entry', '~£300'
FROM award_bodies
WHERE name = 'UK Social Media Awards';

-- Award Body: Drum B2B Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best B2B Campaign', 'Campaign', 'Possible', 'B2B client work', 'TBC'
FROM award_bodies
WHERE name = 'Drum B2B Awards';

-- Award Body: Drum B2B Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Use of Content in B2B', 'Campaign', 'Possible', 'content-led B2B', 'TBC'
FROM award_bodies
WHERE name = 'Drum B2B Awards';

-- Award Body: Drum B2B Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Use of Social in B2B', 'Campaign', 'Good', 'social-first B2B', 'TBC'
FROM award_bodies
WHERE name = 'Drum B2B Awards';

-- Award Body: Drum B2B Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'B2B Agency of the Year', 'Agency', 'Possible', 'if B2B client mix strong', 'TBC'
FROM award_bodies
WHERE name = 'Drum B2B Awards';

-- Award Body: Global Digital Excellence
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Social Media Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'Global Digital Excellence';

-- Award Body: Global Digital Excellence
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Digital Marketing Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'Global Digital Excellence';

-- Award Body: Global Digital Excellence
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Influencer Marketing Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'Global Digital Excellence';

-- Award Body: Global Digital Excellence
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Digital Agency of the Year', 'Agency', 'Good', NULL, '~£300'
FROM award_bodies
WHERE name = 'Global Digital Excellence';

-- Award Body: Prolific North Marketing Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Social Media Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'Prolific North Marketing Awards';

-- Award Body: Prolific North Marketing Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Integrated Campaign', 'Campaign', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'Prolific North Marketing Awards';

-- Award Body: Prolific North Marketing Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Marketing Agency of the Year', 'Agency', 'Strong', NULL, '~£300'
FROM award_bodies
WHERE name = 'Prolific North Marketing Awards';

-- Award Body: Prolific North Marketing Awards
INSERT INTO award_entries (award_body_id, category, category_type, jungle_fit, entry_reason, est_fee)
SELECT id, 'Best Content Campaign', 'Campaign', 'Strong', 'Twisted/content brands', '~£300'
FROM award_bodies
WHERE name = 'Prolific North Marketing Awards';
