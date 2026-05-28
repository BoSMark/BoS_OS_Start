# Agent OS Upgrade Guide

**What this covers:** What happens when you run new versions of the Bootstrap or Workshop skill on an existing Agent OS. What changes, what doesn't, and what needs your explicit permission.

---

## Scenario Summary

| Scenario | Verdict | Why |
|----------|---------|-----|
| New bootstrap → new workshop, no existing OS | **Go ahead** | Clean slate, full benefit |
| New workshop on existing old OS (no re-bootstrap) | **Go ahead** | Workshop detects old naming, surfaces differences, asks permission — safe |
| New bootstrap on existing OS → new workshop | **Take care — limited value** | Bootstrap will propose changes to your existing files for your approval. If your OS is already well-enriched with internal content, the value of re-bootstrapping is low and the risk of approving the wrong change is real. Workshop will then run cleanly on whatever the bootstrap produced. |
| Old workshop on existing old OS | **Continue as normal** | Nothing changes — old skill still works on old OS |

---

## The Golden Rule

**No change is made to your existing files without your explicit permission.**

The Workshop and Bootstrap skills will detect differences between your current OS and the new version, present them to you clearly, and wait for your decision before touching anything. Silence is not permission. "Sounds good" is not permission. A clear yes to a specific proposed change is permission.

---

## Before You Do Anything: Back Up Your Entire System

**This applies to every scenario below, no exceptions.**

Before running any new version of the Bootstrap or Workshop skill on an existing OS:

1. Make a complete copy of your Agent OS folder
2. Name it clearly: `[company]-agent-os-BACKUP-[date]`
3. Store it somewhere you can find it (a folder outside the active OS, a cloud backup, a zip)

This takes two minutes. If anything goes wrong — a file gets overwritten, a change turns out to be wrong — you have a clean restore point.

**Do not skip this step.** Skills can read and write files. Even with explicit-permission controls, having a backup means you can always recover.

---

## Scenario 1: Running the new Workshop (v2.0) on an existing OS built with the original Bootstrap

**Your situation:** You ran the original Bootstrap. Your strategy documents are named `RFC-100_Values_and_Culture.md`, `RFC-102_Growth_and_Commercial_Logic.md` etc. Your agent map is called `portfolio_map.md`.

### What the Workshop will do at startup

The Workshop detects your file naming convention and surfaces the difference before doing anything else. It will show you something like:

> **OS version detected: Original Bootstrap**
>
> Your strategy documents use RFC numbering (`RFC-100`, `RFC-101` etc.). The new Workshop uses plain English naming (`Our_Values.md`, `How_We_Grow.md` etc.).
>
> This workshop will refer to your files by their actual names throughout. No files will be renamed or changed without your explicit permission.
>
> I've identified the following differences between your current OS and the new Workshop conventions:
>
> | What | Your current OS | New convention | Impact |
> |------|----------------|----------------|--------|
> | Strategy document names | `RFC-100_Values_and_Culture.md` etc. | `Our_Values.md` etc. | Terminology only — content is unaffected |
> | Agent map | `portfolio_map.md` | `agent_map.md` | Terminology only — content is unaffected |
> | Opening questions (personal goal, North Star) | Not in your state files | Expected in `session_summary.md` | Workshop will ask these in Phase 0 if missing |
>
> **No changes have been made.** Do you want to:
> - (A) Continue the workshop with your existing file names — I'll reference your files correctly throughout
> - (B) Rename your strategy documents to the plain English convention now, before we start — I'll show you the proposed changes and wait for your approval on each one
> - (C) Ask me to explain the implications before you decide

The user chooses. The Workshop does exactly what they chose, nothing more.

### If the user chooses A (keep existing names)

The Workshop runs all four phases with your existing file names. Every reference to a strategy document uses the RFC name. At the end of Phase 4, the Workshop adds one open item to `session_review_log.md`:

> **Open item:** Consider renaming strategy documents to plain English convention (Bootstrap v2.1 style). Not urgent. Run the Workshop again and choose option B when ready. Owner: [exec].

This is the only change to your state files without a separate approval — and it's an addition to a log, not an edit to any strategy document or agent spec.

### If the user chooses B (rename now)

The Workshop presents the full proposed rename list before touching anything:

> **Proposed renames — please confirm each one:**
>
> | Current name | Proposed new name | Your decision |
> |--------------|------------------|---------------|
> | `02_STRATEGY/RFC-100_Values_and_Culture.md` | `02_STRATEGY/Our_Values.md` | Yes / No / Rename to something else |
> | `02_STRATEGY/RFC-101_Brand_and_Messaging.md` | `02_STRATEGY/How_We_Talk_to_the_Market.md` | Yes / No / Rename to something else |
> | ... | ... | ... |
> | `03_AGENTS/portfolio_map.md` | `03_AGENTS/agent_map.md` | Yes / No |
>
> **Before I rename anything, I also need to update all cross-references.** These files reference the old names and will need updating:
> - `CLAUDE.md`
> - `01_STATE/decisions.md` (any entries that reference RFC file names)
> - Any agent specs that link to strategy documents
>
> I'll show you each proposed cross-reference update before making it. Confirm the renames above first, then we'll work through the cross-references.

Each rename is confirmed individually. Cross-reference updates are shown and confirmed individually. Nothing happens silently.

### What the Workshop will NOT do

- Silently rename files
- Edit strategy document content without going through the Phase 1 quality process with your approval
- Edit agent specs without going through the Phase 2 process with your approval
- Add entries to `decisions.md` without naming the decision and getting your sign-off
- Change your CLAUDE.md without showing you the diff and getting explicit approval

---

## Scenario 2: Re-running the new Bootstrap on an existing OS

**Your situation:** You want to run the new Bootstrap skill on an OS you've already built. Maybe you want the new file naming, or the improved CLAUDE.md, or updated strategy document templates.

**This requires care.** The Bootstrap was designed to create files from scratch. Running it on an existing OS means it will find files that already exist — some of which contain internal content you've added. The Bootstrap will propose changes to those files and ask for your approval before touching anything, but you need to read those proposals carefully.

### What the new Bootstrap will do

It will not immediately change anything. Instead, at the point where it would normally create each file, it will:

1. Detect that the file already exists
2. Compare the proposed new content against your existing content
3. Summarise the differences
4. Ask for your explicit permission before writing anything

For each file, you'll see something like:

> **File already exists: `02_STRATEGY/RFC-102_Growth_and_Commercial_Logic.md`**
>
> I've compared your existing file against what I would create for this company now. Here's what I found:
>
> **Sections that would change:**
> - Section 2 (Governing Framework): Your current version has `[INTERNAL: needs enrichment]`. My new version has more specific content based on updated research.
> - Section 5 (Success Criteria): Your current version has internal data you've added. My new version would replace this with research-based content.
>
> **Sections that would stay the same or improve:**
> - Section 1 (Context): Similar content, minor updates
>
> **Note: Section 5 contains internal data you've added.** If you approve option B, that content would be replaced. Make sure you have a backup before approving any changes to this section.
>
> What would you like to do?
> - (A) Keep your existing file as-is — skip this file entirely
> - (B) Replace with the new version — I'll do this only after you confirm you have a backup
> - (C) Show me the full diff so I can decide section by section
> - (D) Create the new version alongside your existing one as `RFC-102_Growth_v2_DRAFT.md` so you can compare and merge manually

This applies to every file that already exists. The Bootstrap will not change a single file without showing you the proposed changes and getting your explicit yes.

### The safer alternative: manual upgrade

For most users, re-running the Bootstrap is more disruptive than it's worth. The safer path:

1. Back up your entire OS (see top of this guide)
2. Read the new Bootstrap's SKILL.md to understand what changed
3. Apply only the specific changes you want — new CLAUDE.md format, new file naming, updated templates — manually
4. Run the new Workshop to deepen your strategy documents and agent specs through the phase process

This gives you the benefit of the improvements without the risk of accepting the wrong change.

### What the Bootstrap will NOT do

- Change any existing file without showing you the proposed differences first
- Create new files without telling you what they are and what they'll contain
- Modify `01_STATE/decisions.md`
- Activate any agent (agents remain in whatever status they're in)

---

## Scenario 3: Fresh start — new Bootstrap then new Workshop, no existing OS

**Your situation:** First time. No existing files. Nothing to protect.

The Bootstrap runs as designed: asks personal goal and North Star metric, researches the company, creates all files with plain English naming, hands off clearly to the Workshop.

The Workshop picks up the personal goal and North Star from the bootstrap output and uses them throughout.

No compatibility concerns. No permission prompts for existing files because there are none. This is the cleanest path.

---

## What the Skills Do NOT Do (All Scenarios)

These are hard limits regardless of version:

- **No external communications.** No emails, no social posts, no messages to anyone.
- **No modifying `decisions.md`.** Append-only. Existing entries are never changed.
- **No silent file changes.** Every write to a tracked file is shown to you first.
- **No agent activation.** Neither skill changes any agent's status from DRAFT to ACTIVE.
- **No confidential data in tracked files.** Anything sensitive goes to `00_LOCAL_CONTEXT/` only.

---

## Changes in Workshop v2.0 vs Original

| What | Original Workshop | Workshop v2.0 |
|------|------------------|---------------|
| Opening questions | Not asked | Pulls personal goal + North Star from bootstrap; asks in Phase 0 if missing |
| Terminology | "RFC" throughout | "Strategy document" throughout; detects and surfaces your actual file names |
| Agent map reference | `portfolio_map.md` | `agent_map.md` (detects `portfolio_map.md` for original bootstrap users) |
| North Star connection | Not referenced | Anchors Phase 1 quality work and Phase 3 mission definition |
| Upgrade detection | None | Detects old vs new bootstrap; surfaces differences; asks permission |
| Quality checklist file | `rfc_quality_checklist.md` | `strategy_doc_quality_checklist.md` (same content, updated terminology) |
| File change model | Not explicit | No change to any file without explicit user permission |

---

## Summary: What Should I Do?

**I have an existing OS and want to run the new Workshop.**
→ Back up your OS first. Then run the Workshop. It will detect your setup, surface any differences, and ask what you want before changing anything.

**I want to adopt plain English file naming.**
→ Back up first. Then run the Workshop and choose option B when it surfaces the naming difference. It will show you each proposed rename and ask for your confirmation before touching anything.

**I want to re-run the Bootstrap to get updated content.**
→ Back up first. The Bootstrap will detect existing files, show you the proposed changes, and ask for your explicit approval before touching anything. Read each proposal carefully — if you've enriched sections with internal data, approving a replacement would overwrite that content.

**I'm starting from scratch.**
→ Run Bootstrap then Workshop in sequence. Full benefit, no compatibility concerns.

**When in doubt.**
→ Back up first. Then ask the Workshop to run a "status check" — it will tell you what it finds and what it would recommend, without changing anything.
