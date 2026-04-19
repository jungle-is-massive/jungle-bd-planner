"""
Seed all data for the Comms Plan evolution.
Run AFTER comms_schema.sql has been executed in the Supabase SQL Editor.
Safe to run once; guards against duplicates via title/slug lookups where possible.
"""
import json, urllib.request

SUPA_URL = "https://iehkvlyjumkzccoqqgxl.supabase.co"
SUPA_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImllaGt2bHlqdW1remNjb3FxZ3hsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzU4MTMwNzYsImV4cCI6MjA5MTM4OTA3Nn0.pF9K9aBwWN10JRT_ODTLPzsdPKH3X0CW30WrPMn9lGs"

HEADERS = {
    "apikey": SUPA_KEY,
    "Authorization": f"Bearer {SUPA_KEY}",
    "Content-Type": "application/json",
    "Prefer": "return=representation",
}

def post(table, rows):
    data = json.dumps(rows).encode()
    req = urllib.request.Request(
        f"{SUPA_URL}/rest/v1/{table}",
        data=data, method='POST',
        headers=HEADERS,
    )
    try:
        resp = urllib.request.urlopen(req)
        return json.loads(resp.read())
    except urllib.error.HTTPError as e:
        print(f"  ✗ {table}: {e.code} {e.read().decode()[:200]}")
        return None

def get(table, params=""):
    req = urllib.request.Request(
        f"{SUPA_URL}/rest/v1/{table}?{params}",
        headers=HEADERS,
    )
    return json.loads(urllib.request.urlopen(req).read())

def count(table):
    return len(get(table, "select=id"))

# ────────────────────────────────────────────────────────────────
# 1. TEAM MEMBERS
# ────────────────────────────────────────────────────────────────
print("Seeding team_members…")
if count("team_members") == 0:
    team = post("team_members", [
        {"full_name": "Coris Leachman", "role_title": "Growth Director", "team": "Growth", "initials": "CL", "sort_order": 1},
        {"full_name": "Jade",           "role_title": "Chief Growth Officer", "team": "Exec", "initials": "J",  "sort_order": 2},
        {"full_name": "Mal",            "role_title": "CEO",                  "team": "Exec", "initials": "M",  "sort_order": 3},
        {"full_name": "Oscar",          "role_title": "Director of Social and Influencer", "team": "Social", "initials": "O", "sort_order": 4},
        {"full_name": "Molly",          "role_title": "Creative Director",    "team": "Creative", "initials": "Mo", "sort_order": 5},
        {"full_name": "Ro",             "role_title": "Content & Strategy",   "team": "Growth", "initials": "R", "sort_order": 6},
        {"full_name": "Strategy Director (TBD)", "role_title": "Strategy Director", "team": "Strategy", "initials": "?", "is_active": False, "sort_order": 99},
    ])
    print(f"  ✓ {len(team) if team else 0} team members")
else:
    print(f"  ⊙ already seeded ({count('team_members')})")

team_by_name = {m['full_name']: m['id'] for m in get('team_members')}
def uid(name): return team_by_name.get(name)

# ────────────────────────────────────────────────────────────────
# 2. BRAND HOUSE — single row, draft
# ────────────────────────────────────────────────────────────────
print("Seeding brand_house…")
if count("brand_house") == 0:
    post("brand_house", [{
        "proposition_line": "The agency that builds social into a growth engine.",
        "proposition_status": "draft",
        "core_pov": "Social has been stuck as a visibility game. It is now a growth channel, but most brands are measuring, resourcing, and buying it the wrong way. Jungle designs influence, builds distribution into the idea, and engineers outcomes — so social becomes a growth engine, not a cost centre.",
        "vision_statement": None,
        "mission_statement": None,
        "boilerplate_short": None,
        "boilerplate_long": None,
        "notes": "Proposition direction agreed. Boilerplate, vision and mission still TBD — flagged as open decisions.",
    }])
    print("  ✓ brand house seeded")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# 3. NARRATIVE PILLARS
# ────────────────────────────────────────────────────────────────
print("Seeding narrative_pillars…")
if count("narrative_pillars") == 0:
    pillars = post("narrative_pillars", [
        {
            "slug": "social-maturity",
            "title": "Social Maturity",
            "description": "Where is a brand on the social maturity curve — and what does moving up actually look like in practice?",
            "detail_html": "<p>Most brands know they should be doing more with social. Very few know what \"more\" looks like. Social Maturity is the framework for that conversation.</p><p>It gives Jungle a diagnostic entry point and eventually a proprietary index that can generate PR, data, and pipeline.</p><ul><li>Strong IP potential — could become the Social Maturity Index</li><li>Works as a pitch tool and thought leadership engine</li><li>Best serves CMOs mid-transformation</li></ul>",
            "status": "confirmed",
            "sort_order": 1,
            "best_icp_fit": "CMOs, Brand Directors, in-house social leads",
            "is_primary": True,
            "owner_id": uid("Coris Leachman"),
        },
        {
            "slug": "death-of-vanity",
            "title": "Death of Vanity",
            "description": "Likes, reach and impressions have had their day. The only metric that matters now is commercial impact.",
            "detail_html": "<p>This is a provocation — and provocations travel. The era of social as a brand awareness play is over. Brands that still measure success in follower counts are measuring the wrong thing.</p><ul><li>Highly shareable, conference-talk-ready framing</li><li>Resonates with CFOs and commercially-minded CMOs</li><li>Needs rigorous proof points to avoid sounding like a bumper sticker</li></ul>",
            "status": "confirmed",
            "sort_order": 2,
            "best_icp_fit": "CFOs, commercially-minded CMOs, procurement",
            "owner_id": uid("Coris Leachman"),
        },
        {
            "slug": "commercial-impact",
            "title": "Commercial Impact",
            "description": "Social as a direct revenue driver — not a cost centre. Building the case for social in the boardroom.",
            "detail_html": "<p>Closely related to Death of Vanity but more constructive. This pillar is about building the business case language Jungle can use in pitches and intermediary conversations.</p><p>The question is whether this is a standalone pillar or the evidence layer beneath Death of Vanity.</p><ul><li>Strong in pitch context — boardroom-ready language</li><li>Needs case study backbone to land credibly</li></ul>",
            "status": "under_review",
            "sort_order": 3,
            "best_icp_fit": "Finance-influenced buying committees, MD/CEO level",
            "key_question": "Is this a standalone pillar or evidence under Death of Vanity?",
        },
        {
            "slug": "social-as-growth-driver",
            "title": "Social as Growth Driver",
            "description": "The reframe: social is not marketing support. It is a primary growth channel — when you build it right.",
            "detail_html": "<p>This reframes what social is for, repositioning Jungle from \"social agency\" to \"growth partner who happens to operate in social.\"</p><ul><li>Strong for new business conversations</li><li>Needs sharper language to avoid sounding like every other agency</li><li>Pressure-test: what is the Jungle-specific proof?</li></ul>",
            "status": "under_review",
            "sort_order": 4,
            "best_icp_fit": "Growth and performance-focused marketers, scale-up brands",
            "key_question": "What's the Jungle-specific proof that differentiates this from every other agency claiming the same?",
        },
    ])
    print(f"  ✓ {len(pillars) if pillars else 0} pillars")
else:
    print(f"  ⊙ already seeded")

pillar_by_slug = {p['slug']: p['id'] for p in get('narrative_pillars')}

# ────────────────────────────────────────────────────────────────
# 4. PILLAR MESSAGES — seed structure with TBDs so the gap is visible
# ────────────────────────────────────────────────────────────────
print("Seeding pillar_messages (TBD scaffolding)…")
if count("pillar_messages") == 0:
    msgs = []
    for slug, pid in pillar_by_slug.items():
        for mt, count_needed in [("talking_point", 3), ("proof_point", 3), ("content_angle", 3)]:
            for n in range(count_needed):
                msgs.append({
                    "pillar_id": pid,
                    "message_type": mt,
                    "title": f"TBD — {mt.replace('_', ' ')} #{n+1}",
                    "body": None,
                    "sort_order": n,
                    "status": "draft",
                })
    post("pillar_messages", msgs)
    print(f"  ✓ {len(msgs)} TBD message slots created")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# 5. CONTENT SERIES (Buzz / Rumble / Roar spine)
# ────────────────────────────────────────────────────────────────
print("Seeding content_series…")
if count("content_series") == 0:
    post("content_series", [
        {"title": "Buzz — LinkedIn Team Cadence", "content_tier": "buzz", "format_type": "post",
         "description": "Always-on LinkedIn posting from team personal profiles + Jungle brand page. Consistency, visibility, familiarity.",
         "cadence_label": "3–5 posts per week across team", "cadence_days": 2,
         "primary_channel": "LinkedIn (personal + brand)",
         "strategic_purpose": "Keep Jungle visible to intermediaries and prospects. Feed higher tiers.",
         "status": "planned", "decision_required": True,
         "decision_note": "Who owns Buzz — which team members post, and how often?"},
        {"title": "Newsletter", "content_tier": "buzz", "format_type": "newsletter",
         "description": "Biweekly newsletter surfacing best of Buzz + upcoming Rumble.",
         "cadence_label": "Every 2 weeks", "cadence_days": 14,
         "primary_channel": "Newsletter",
         "status": "planned", "decision_required": True,
         "decision_note": "Owner unassigned. Distribution list not yet defined."},
        {"title": "Rumble — Monthly Thought Piece", "content_tier": "rumble", "format_type": "article",
         "description": "1–2 deeper thought pieces per month. Depth, credibility, conversion.",
         "cadence_label": "1–2 per month", "cadence_days": 15,
         "primary_channel": "Website Insights + LinkedIn",
         "status": "planned", "decision_required": True,
         "decision_note": "Owner unassigned."},
        {"title": "Podcast / Video Series", "content_tier": "rumble", "format_type": "podcast",
         "description": "Monthly or biweekly podcast or video series. Undecided format.",
         "cadence_label": "TBD", "cadence_days": None,
         "primary_channel": "TBD",
         "status": "paused", "decision_required": True,
         "decision_note": "Critical open decision: committing to podcast/video or dropping the format entirely? Don't sit in the middle."},
        {"title": "Roar — Social Maturity Index", "content_tier": "roar", "format_type": "event",
         "description": "The flagship — owned event in October anchored to the Social Maturity Index framework, report and diagnostic tool.",
         "cadence_label": "Annual flagship", "cadence_days": None,
         "primary_channel": "Event + Website + Nurture",
         "strategic_purpose": "Generate MQLs, establish Jungle's thought-leadership position, create nurture content feeding 6 months of conversations.",
         "status": "active", "decision_required": True,
         "decision_note": "Owner not yet assigned for event + build."},
    ])
    print("  ✓ 5 content series")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# 6. STRATEGIC DECISIONS — the open questions
# ────────────────────────────────────────────────────────────────
print("Seeding strategic_decisions…")
if count("strategic_decisions") == 0:
    post("strategic_decisions", [
        {
            "category": "ownership", "title": "Who owns Buzz?",
            "question": "Which team members are responsible for always-on LinkedIn content? What's the weekly cadence per person?",
            "why_it_matters": "Without named owners and a cadence, Buzz drifts. The engine needs a driver.",
            "impact_level": "high", "status": "open", "related_area": "comms", "sort_order": 1,
        },
        {
            "category": "ownership", "title": "Who owns Rumble?",
            "question": "Who is accountable for the monthly thought piece and its distribution?",
            "why_it_matters": "Rumble is how Jungle earns credibility at depth. Without an owner, nothing ships on time or to quality.",
            "impact_level": "high", "status": "open", "related_area": "comms", "sort_order": 2,
        },
        {
            "category": "event", "title": "Who owns the Social Maturity Index event + build?",
            "question": "Who is the single accountable owner for SMI — framework, report, event, promotion, and follow-up?",
            "why_it_matters": "SMI is the flagship. Without a clear owner with authority across workstreams, it fragments.",
            "impact_level": "critical", "status": "open", "related_area": "smi", "sort_order": 3,
        },
        {
            "category": "format", "title": "Are we committing to a podcast / video format?",
            "question": "Do we commit to a monthly podcast or video series owned by Liv + team, or drop it entirely?",
            "why_it_matters": "Half-in is worse than out. Every month spent undecided is a month of potential content unmade.",
            "impact_level": "medium", "status": "open", "related_area": "comms", "sort_order": 4,
        },
        {
            "category": "funnel", "title": "What is our MQL definition + follow-up rule?",
            "question": "What behaviours, roles or signals qualify a contact as an MQL? Who follows up, on what timeline, and with what?",
            "why_it_matters": "Without this, the funnel has no teeth. Leads come in, sit, and rot.",
            "impact_level": "critical", "status": "open", "related_area": "nurture", "sort_order": 5,
        },
        {
            "category": "pillar", "title": "Is Commercial Impact a pillar, or evidence beneath Death of Vanity?",
            "question": "Do we run Commercial Impact as a standalone fourth pillar, or collapse it as the proof layer for Death of Vanity?",
            "why_it_matters": "Affects how we structure messaging and content planning. Four pillars vs three.",
            "impact_level": "medium", "status": "open", "related_area": "brand_house", "sort_order": 6,
        },
        {
            "category": "proposition", "title": "Approve core proposition line",
            "question": "\"The agency that builds social into a growth engine.\" — lock it, evolve it, or replace it?",
            "why_it_matters": "Every asset downstream depends on proposition stability.",
            "impact_level": "high", "status": "in_review", "related_area": "brand_house",
            "proposed_answer": "The agency that builds social into a growth engine.", "sort_order": 7,
        },
    ])
    print("  ✓ 7 strategic decisions")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# 7. FUNNEL STAGES
# ────────────────────────────────────────────────────────────────
print("Seeding funnel_stages…")
if count("funnel_stages") == 0:
    post("funnel_stages", [
        {"name": "New",         "stage_order": 1, "description": "Contact captured, not yet qualified."},
        {"name": "Engaged",     "stage_order": 2, "description": "Has opened or interacted with at least one touchpoint."},
        {"name": "MQL",         "stage_order": 3, "description": "Matches MQL criteria (definition TBD).", "is_mql": True},
        {"name": "Nurturing",   "stage_order": 4, "description": "In active nurture sequence."},
        {"name": "SQL",         "stage_order": 5, "description": "Sales-qualified. Ready for direct outreach.", "is_sql": True},
        {"name": "Opportunity", "stage_order": 6, "description": "Active opportunity with a scoped brief or expression of interest."},
        {"name": "Pitch",       "stage_order": 7, "description": "In pitch process."},
        {"name": "Won",         "stage_order": 8, "description": "Closed-won."},
        {"name": "Lost",        "stage_order": 9, "description": "Closed-lost."},
    ])
    print("  ✓ 9 funnel stages")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# 8. FUNNEL DEFINITIONS — seed the "not defined" states
# ────────────────────────────────────────────────────────────────
print("Seeding funnel_definitions…")
if count("funnel_definitions") == 0:
    post("funnel_definitions", [
        {"rule_type": "mql_definition",    "title": "MQL Definition",      "status": "not_defined"},
        {"rule_type": "sql_definition",    "title": "SQL Definition",      "status": "not_defined"},
        {"rule_type": "followup_rule",     "title": "Follow-Up Rule",      "status": "not_defined"},
        {"rule_type": "routing_rule",      "title": "Lead Routing Rule",   "status": "not_defined"},
    ])
    print("  ✓ 4 funnel definition slots")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# 9. NURTURE SEQUENCE — SMI post-event
# ────────────────────────────────────────────────────────────────
print("Seeding nurture_sequences…")
if count("nurture_sequences") == 0:
    seqs = post("nurture_sequences", [{
        "title": "Social Maturity Index — Post-Event 6-Month Nurture",
        "source_type": "event",
        "description": "The structured cadence that follows every SMI event attendee. Re-engagement, authority reinforcement, gradual conversion.",
        "duration_days": 180,
        "status": "draft",
    }])
    if seqs:
        sid = seqs[0]['id']
        steps = [
            {"sequence_id": sid, "step_number": 1, "offset_days": 1,   "title": "Thank-you email + event recap", "channel_type": "email",   "goal": "Reinforce attendance, key moments."},
            {"sequence_id": sid, "step_number": 2, "offset_days": 7,   "title": "Key insight article",          "channel_type": "content_send", "goal": "Establish authority on SMI framework."},
            {"sequence_id": sid, "step_number": 3, "offset_days": 14,  "title": "SMI score follow-up",          "channel_type": "email",   "goal": "Personalised touch — their result."},
            {"sequence_id": sid, "step_number": 4, "offset_days": 28,  "title": "Case study send",              "channel_type": "content_send", "goal": "Proof. Commercial impact."},
            {"sequence_id": sid, "step_number": 5, "offset_days": 42,  "title": "POV piece — Death of Vanity",  "channel_type": "content_send", "goal": "Extend narrative, broaden pillar."},
            {"sequence_id": sid, "step_number": 6, "offset_days": 56,  "title": "Invite to next session",       "channel_type": "invite",  "goal": "Re-engage. Keep the relationship warm."},
            {"sequence_id": sid, "step_number": 7, "offset_days": 90,  "title": "Month 3 — Death of Vanity angle", "channel_type": "content_send", "goal": "Extend the narrative into new territory."},
            {"sequence_id": sid, "step_number": 8, "offset_days": 120, "title": "Month 4 — Continued drip",     "channel_type": "content_send", "goal": "Stay relevant."},
            {"sequence_id": sid, "step_number": 9, "offset_days": 150, "title": "Month 5 — Continued drip",     "channel_type": "content_send", "goal": "Stay relevant."},
            {"sequence_id": sid, "step_number": 10,"offset_days": 180, "title": "Month 6 — Re-engagement check-in", "channel_type": "email",   "goal": "Check for movement, re-qualify."},
        ]
        post("nurture_steps", steps)
        print(f"  ✓ 1 sequence, {len(steps)} steps")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# 10. SMI WORKSTREAMS + TASKS
# ────────────────────────────────────────────────────────────────
print("Seeding smi_workstreams + smi_tasks…")
if count("smi_workstreams") == 0:
    ws = post("smi_workstreams", [
        {"title": "Strategy & Narrative",   "description": "Lock proposition, pillars, SMI framework.",   "sort_order": 1, "status": "in_progress"},
        {"title": "Event Build",            "description": "Report, event concept, format.",             "sort_order": 2, "status": "not_started"},
        {"title": "Audience & Outreach",    "description": "Invite list, ICP definitions, outreach.",    "sort_order": 3, "status": "not_started"},
        {"title": "Content Promotion",      "description": "Landing page, social, Buzz integration.",    "sort_order": 4, "status": "not_started"},
        {"title": "Speakers",               "description": "Line-up, talking points, briefings.",        "sort_order": 5, "status": "in_progress"},
        {"title": "Post-Event Nurture",     "description": "6-month cadence build-out and content mapping.", "sort_order": 6, "status": "not_started"},
    ])
    ws_by_title = {w['title']: w['id'] for w in (ws or [])}

    tasks = [
        # Phase 1: Foundation (Now → July)
        {"title": "Lock proposition + pillars",     "workstream_id": ws_by_title.get("Strategy & Narrative"), "phase": "Foundation", "due_date": "2026-07-31", "priority": "critical", "status": "in_progress"},
        {"title": "Define SMI framework",           "workstream_id": ws_by_title.get("Strategy & Narrative"), "phase": "Foundation", "due_date": "2026-07-31", "priority": "critical", "status": "not_started"},
        {"title": "Assign workstream owners",       "workstream_id": ws_by_title.get("Strategy & Narrative"), "phase": "Foundation", "due_date": "2026-06-30", "priority": "critical", "status": "not_started"},

        # Phase 2: Build (July → Sept)
        {"title": "Create SMI report",              "workstream_id": ws_by_title.get("Event Build"),     "phase": "Build", "due_date": "2026-09-15", "priority": "high", "status": "not_started"},
        {"title": "Finalise event concept + format","workstream_id": ws_by_title.get("Event Build"),     "phase": "Build", "due_date": "2026-08-15", "priority": "high", "status": "not_started"},
        {"title": "Secure speakers (confirm lineup)","workstream_id": ws_by_title.get("Speakers"),       "phase": "Build", "due_date": "2026-08-31", "priority": "high", "status": "in_progress"},
        {"title": "Build landing page",             "workstream_id": ws_by_title.get("Content Promotion"), "phase": "Build", "due_date": "2026-09-01", "priority": "high", "status": "not_started"},
        {"title": "Finalise venue + logistics",     "workstream_id": ws_by_title.get("Event Build"),     "phase": "Build", "due_date": "2026-09-01", "priority": "high", "status": "not_started"},

        # Phase 3: Promotion (Sept → Oct)
        {"title": "Build invite list",              "workstream_id": ws_by_title.get("Audience & Outreach"), "phase": "Promotion", "due_date": "2026-09-15", "priority": "high", "status": "not_started"},
        {"title": "Intermediary outreach",          "workstream_id": ws_by_title.get("Audience & Outreach"), "phase": "Promotion", "due_date": "2026-09-30", "priority": "high", "status": "not_started"},
        {"title": "LinkedIn outreach campaign",     "workstream_id": ws_by_title.get("Audience & Outreach"), "phase": "Promotion", "due_date": "2026-10-07", "priority": "high", "status": "not_started"},
        {"title": "Email nurture to warm list",     "workstream_id": ws_by_title.get("Audience & Outreach"), "phase": "Promotion", "due_date": "2026-10-07", "priority": "medium", "status": "not_started"},
        {"title": "Speaker briefs delivered",       "workstream_id": ws_by_title.get("Speakers"),       "phase": "Promotion", "due_date": "2026-10-01", "priority": "high", "status": "not_started"},

        # Phase 4: Event (Mid October)
        {"title": "Run SMI Event",                  "workstream_id": ws_by_title.get("Event Build"),    "phase": "Event", "due_date": "2026-10-15", "priority": "critical", "status": "not_started"},

        # Post-Event
        {"title": "Week 0–2: Thank you + recap",    "workstream_id": ws_by_title.get("Post-Event Nurture"), "phase": "Post-Event", "due_date": "2026-10-29", "priority": "high", "status": "not_started"},
        {"title": "Key insights article",           "workstream_id": ws_by_title.get("Post-Event Nurture"), "phase": "Post-Event", "due_date": "2026-11-05", "priority": "high", "status": "not_started"},
        {"title": "\"Your SMI score\" follow-up",   "workstream_id": ws_by_title.get("Post-Event Nurture"), "phase": "Post-Event", "due_date": "2026-11-12", "priority": "medium", "status": "not_started"},
    ]
    post("smi_tasks", tasks)
    print(f"  ✓ {len(ws) if ws else 0} workstreams, {len(tasks)} tasks")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# 11. SMI SPEAKERS
# ────────────────────────────────────────────────────────────────
print("Seeding smi_speakers…")
if count("smi_speakers") == 0:
    post("smi_speakers", [
        {"display_name": "Oscar", "team_member_id": uid("Oscar"),
         "role_label": "Social expertise / credibility", "status": "tbd", "sort_order": 1,
         "narrative_role": None, "talking_points": None},
        {"display_name": "Jade",  "team_member_id": uid("Jade"),
         "role_label": "Commercial + growth narrative",  "status": "tbd", "sort_order": 2,
         "narrative_role": None, "talking_points": None},
        {"display_name": "Mal",   "team_member_id": uid("Mal"),
         "role_label": "Vision / leadership POV",        "status": "tbd", "sort_order": 3,
         "narrative_role": None, "talking_points": None},
        {"display_name": "Molly", "team_member_id": uid("Molly"),
         "role_label": "Creative / execution",           "status": "tbd", "sort_order": 4,
         "narrative_role": None, "talking_points": None},
        {"display_name": "Strategy Director (TBD)", "team_member_id": uid("Strategy Director (TBD)"),
         "role_label": "Framework + structure",          "status": "tbd", "sort_order": 5,
         "narrative_role": "TBD — role vacant",
         "talking_points": None},
    ])
    print("  ✓ 5 speakers (all TBD status)")
else:
    print(f"  ⊙ already seeded")

# ────────────────────────────────────────────────────────────────
# SUMMARY
# ────────────────────────────────────────────────────────────────
print("\n═══ Summary ═══")
for t in ['team_members','brand_house','narrative_pillars','pillar_messages',
          'content_series','strategic_decisions','funnel_stages','funnel_definitions',
          'nurture_sequences','nurture_steps','smi_workstreams','smi_tasks','smi_speakers']:
    print(f"  {t:25s} {count(t):>4} rows")
