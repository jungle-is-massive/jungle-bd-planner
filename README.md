# Jungle BD Planner 26/27

New business planning dashboard for Jungle Creations — Apr 2026 → Mar 2027.

## Live site
Deploy via Vercel or GitHub Pages. Single HTML file — no build step.

## Setup

### 1. Supabase tables
Run `supabase-setup.sql` in the [Supabase SQL editor](https://supabase.com/dashboard/project/iehkvlyjumkzccoqqgxl/sql).

### 2. Make webhook
The question submission flow POSTs to:
`https://hook.eu1.make.com/51utov3l9v9h5rj5x74dtts0cq61awk8`

Payload: `{ context, question, submitted_at }`

Wire up in Make: Webhook → Claude API (answer the question) → Slack (send question + answer).

### 3. Deploy
Push `index.html` to Vercel or enable GitHub Pages on this repo.

## Rows / categories

| Category | Colour | Row key prefix |
|---|---|---|
| Intermediary | Purple | `intermediary-` |
| Owned Event | Neon green | `owned-events` |
| Speaking | Coral | `event-speaking` |
| Attendance | Blue | `event-attendance` |

## Adding events
Use the **+ Add Event** button in the top bar. Events without Supabase tables fall back to `localStorage`.
