# Awards Feature — Setup & Usage Guide

## Overview
The Awards feature allows you to manage two interconnected data sets:
1. **Award Bodies** — Award organizations, deadlines, ceremony dates, fees, attendance tracking
2. **Award Entries** — Award categories you're considering entering, linked to Award Bodies

Both have full CRUD capabilities (Create, Read, Update, Delete).

---

## Step 1: Database Setup (Supabase)

### Run the SQL
Copy the contents of `awards-setup.sql` and run it in your Supabase SQL editor:

```bash
# Tables created:
- award_bodies (award organization data)
- award_entries (individual award category entries)
```

This will:
- Create both tables with proper schema
- Add `created_at` and `updated_at` timestamps
- Set up foreign key relationship (award_entries → award_bodies)
- Enable RLS (Row Level Security) with open policies for anon access

---

## Step 2: Access the Feature

### In the App
1. Go to https://jungle-is-massive.github.io/jungle-bd-planner/
2. Click the **Awards** tab in the top navigation
3. You'll land on the **Award Bodies** view by default

---

## Award Bodies Management

### View
The Award Bodies view shows a table with:
- Award Body Name
- Status (Open, Closed, etc.)
- Final Deadline
- Ceremony Date
- Location
- Entry Fee
- Should Attend? (Yes/No)
- Edit action button

### Add Award Body
1. Click **"+ Add Award Body"** button
2. Fill in the form:
   - **Award Body Name** (required) — e.g. "GIMA", "European Agency Awards"
   - **Status** — "Open", "Closed", or blank
   - **Final Deadline** — date picker
   - **Shortlist Date** — date picker
   - **Ceremony Date** — date picker
   - **Location** — text field
   - **Entry Fee** — text field (e.g. "£495", "~£300")
   - **Should Attend?** — Yes/No dropdown
   - **Cost per Seat** — numeric field (£)
   - **Number of Seats** — numeric field
   - **Award Notes** — textarea for general notes
   - **Attendance Notes** — textarea (3-line minimum height) for attendance-specific details
3. Click **Save**

### Edit Award Body
1. Click on any row in the table or click the **Edit** button
2. Modal opens with all fields pre-populated
3. Make changes and click **Save**

### Delete Award Body
1. Click on any row or Edit button
2. Click the **Delete** button (appears only when editing)
3. Confirm deletion

---

## Award Entries Management

### View
Switch to **Entries** tab. The view shows:
- Award Body Name (linked)
- Category
- Category Type
- Jungle Fit (Strong/Good/Possible/No)
- Status (with color-coded pill)
- Est. Fee
- Edit action button

### Search/Filter
Use the search box to filter by:
- Award Body name
- Category
- Status

### Add Award Entry
1. Click **"+ Add Entry"** button
2. Fill in the form:
   - **Award Body** — dropdown (auto-populated from award_bodies table)
     - If the award body doesn't exist, click **"+ New"** to create it inline
   - **Category** (required) — text field (e.g. "Best Brand Awareness Campaign")
   - **Category Type** — dropdown:
     - Campaign
     - Format
     - Vertical
     - People & Teams
     - Agency
     - Individual
     - Team
   - **Jungle Fit** — dropdown:
     - Strong
     - Good
     - Possible
     - No
   - **Entry Reason** — textarea explaining why you're entering
   - **Should Enter?** — Yes/No dropdown
   - **Est. Fee** — text field (e.g. "£495")
   - **Status** — dropdown with 11 options:
     - Assessing
     - Not Started
     - In Progress
     - With Client
     - Submitted
     - Shortlisted
     - Commended
     - Win - Gold
     - Win - Silver
     - Win - Bronze
     - Loss
3. Click **Save**

### Edit Award Entry
1. Click on any row or the **Edit** button
2. Modal opens with all fields pre-populated
3. Make changes and click **Save**

### Delete Award Entry
1. Click on any row or Edit button
2. Click the **Delete** button (appears only when editing)
3. Confirm deletion

---

## Field Definitions

### Award Bodies Table

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| id | Integer (PK) | Auto | Primary key |
| name | Text | Yes | Award body name (e.g. "GIMA") |
| status | Text | No | "Open", "Closed", or blank |
| final_deadline | Date | No | Entry deadline |
| shortlist | Date | No | Shortlist announcement date |
| ceremony | Date | No | Awards ceremony date |
| location | Text | No | City/venue |
| entry_fee | Text | No | Fee amount (e.g. "£495") |
| should_attend | Text | No | "Yes" or "No" |
| cost_per_seat | Numeric | No | Cost per attendee (£) |
| no_of_seats | Integer | No | Number of seats to book |
| award_notes | Text | No | General notes |
| attendance_notes | Text | No | Attendance-specific notes |
| created_at | Timestamp | Auto | Created date |
| updated_at | Timestamp | Auto | Last modified date |

### Award Entries Table

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| id | Integer (PK) | Auto | Primary key |
| award_body_id | Integer (FK) | Yes | Links to award_bodies.id |
| category | Text | Yes | Award category name |
| category_type | Text | No | Campaign/Format/Vertical/People & Teams/Agency/Individual/Team |
| jungle_fit | Text | No | Strong/Good/Possible/No |
| entry_reason | Text | No | Why we're entering |
| should_enter | Text | No | "Yes" or "No" |
| est_fee | Text | No | Fee amount (e.g. "£495") |
| status | Text | No | Current progress status (11 options) |
| created_at | Timestamp | Auto | Created date |
| updated_at | Timestamp | Auto | Last modified date |

---

## Data Flow

1. **Award Bodies** are the master list — all award organizations
2. **Award Entries** reference Award Bodies via dropdown
3. If an Award Body doesn't exist, create it via the **"+ New"** button in the Award Entry modal
4. Deleting an Award Body will cascade delete all associated Award Entries
5. Deleting an Award Entry does not affect the Award Body

---

## Status Pill Colors

Each status in Award Entries has a distinct color for quick visual scanning:

- **Assessing** — Blue
- **Not Started** — Grey
- **In Progress** — Yellow
- **With Client** — Pink
- **Submitted** — Orange
- **Shortlisted** — Purple
- **Commended** — Teal
- **Win - Gold** — Gold
- **Win - Silver** — Silver
- **Win - Bronze** — Bronze
- **Loss** — Red

---

## Technical Details

### Architecture
- Built following the same pattern as Intermediaries and Prospects sections
- Uses Supabase REST API via `sbFetch()` function
- localStorage fallback for offline functionality
- RLS policies allow anonymous read/write (same as other tables)

### API Endpoints
```javascript
// Award Bodies
GET /rest/v1/award_bodies
POST /rest/v1/award_bodies
PATCH /rest/v1/award_bodies?id=eq.{id}
DELETE /rest/v1/award_bodies?id=eq.{id}

// Award Entries
GET /rest/v1/award_entries?select=*,award_bodies(name)
POST /rest/v1/award_entries
PATCH /rest/v1/award_entries?id=eq.{id}
DELETE /rest/v1/award_entries?id=eq.{id}
```

### Key Functions
```javascript
// Loading
loadAwardBodies(force) — Fetch all award bodies from Supabase
loadAwardEntries(force) — Fetch all award entries with linked award body names

// Rendering
renderAwardBodies() — Render award bodies table
renderAwardEntries(entries) — Render award entries table
populateAwardBodiesDropdown() — Populate dropdown in entry modal

// View switching
switchAwardsView(view, btn) — Switch between Bodies and Entries views

// Modals
openAwardBodiesModal(id) — Open add/edit award body modal
openAwardEntriesModal(id) — Open add/edit award entry modal
openAddAwardBodyQuick() — Create award body inline from entry modal

// CRUD
saveAwardBody() — Save new or updated award body
saveAwardEntry() — Save new or updated award entry
deleteAwardBody() — Delete award body (with confirmation)
deleteAwardEntry() — Delete award entry (with confirmation)

// Filtering
filterAwardEntries() — Search/filter entries
```

---

## Troubleshooting

### Tables not appearing
1. Check that SQL has been run in Supabase
2. Verify RLS policies are enabled
3. Check browser console for API errors

### Dropdown empty
1. Make sure you've added at least one Award Body before adding entries
2. Refresh the page if Award Bodies were just added

### Changes not saving
1. Check browser console for error messages
2. Verify Supabase connection is active
3. Try again — localStorage fallback will eventually sync

### Modal won't close
1. Click the X button or click outside the modal
2. Press Escape key

---

## Bulk Data Import

To import your existing CSV data:

1. Add award bodies via the UI or via direct SQL INSERT
2. Add award entries via the UI, selecting the appropriate award body from the dropdown

(Bulk import scripts can be created if needed for large datasets)

---

## Questions or Issues?

Contact Coris or refer to the inline JavaScript functions in `index.html` for detailed implementation details.
