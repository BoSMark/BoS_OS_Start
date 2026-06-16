# Changelog

All notable changes to the BoS OS Toolkit are documented here.

---

## v2.2.3 — 2026-06-16

### Bootstrap personalization — new

**Two-question personalization flow (new)**
Bootstrap now opens with two personalization questions before research:
1. "What would you like me to call you?" — captures the founder's name for use throughout the session
2. "I'm called the Business of Software Operating System. Maybe I need a better name. Think of two letters that mean something to you. The more you talk to me, the more you'll appreciate this." — captures a two-letter shorthand (e.g., "BB", "DF", "M") that the founder chooses

The shorthand reinforces "BoS OS" in daily conversation while giving the founder personal ownership through their chosen abbreviation. All downstream output personalizes using `{{FOUNDER_NAME}}` and `{{OS_SHORTHAND}}`.

**Workshop shorthand detection (new)**
Workshop now checks for the OS shorthand in CLAUDE.md on session start. If present, it uses the shorthand throughout the session (e.g., "The BB BoS OS will use this to..."). If missing, it asks the founder to provide one and updates CLAUDE.md.

**Run shorthand detection (new)**
Run now checks for the OS shorthand at session start. If present, all agent prompts and output use the shorthand. If missing, it asks the founder to provide one at the beginning of the session.

**Agent Spec Builder examples (new)**
Three concrete walkthroughs of the Run layer agents in action: Mission Shaper ("We need to fix our onboarding"), Agent Planner ("We're launching a new pricing model"), Delivery Manager ("Ship the Q3 product roadmap"). Each example walks through the agent's questions, decision-making process, and output. Provides new users with realistic scenarios instead of abstract descriptions.

**Version metadata: all three skills bumped to v2.2.3**
All three skills (Bootstrap, Workshop, Run) now at v2.2.3. Consistent versioning across the toolkit.

### Upgrade path

Download the three .skill files from the v2.2.3 release and reinstall via **Customize → Skills** in Cowork. The personalization feature is automatic on next session — no configuration needed.

---

## v2.2.1 — 2026-06-12

### Bug fixes and improvements (patch)

**agent-os-run: self-contained SKILL.md (critical fix)**
The v2.2 `agent-os-run` skill referenced three sub-spec files (`agent-specs/mission-shaper.md`, `agent-specs/agent-planner.md`, `agent-specs/delivery-manager.md`) that were not accessible at runtime. Root cause: Cowork's skill installer extracts only `SKILL.md` from the `.skill` package; all subdirectories are silently dropped on install. Fix: all sub-spec content is consolidated directly into `SKILL.md`. The skill is now fully self-contained with no external file dependencies. The repo retains the modular structure for readability; `SKILL.md` is the compiled distribution artifact.

**agent-os-run: "Where am I?" session opener (new)**
A standard session opener is added to the beginning of `agent-os-run/SKILL.md`. On starting any Run session, the skill reads `01_STATE/session_summary.md`, `01_STATE/decisions.md`, and any active `MISSION-BRIEF.md` files to determine which pipeline stage the user is in (pre-mission / brief shaped / staffed and in delivery / mission complete). It reports the current state and confirms the next action with the user before proceeding. Fixes: no documented "resume from Staff" entry point when returning to a partially-built mission.

**agent-os-run: scheduling timing note (new)**
A note is added to the "Where am I?" section flagging that `create_scheduled_task` applies an approximately 6-minute deterministic delay. Users asking for "noon" will get 12:06. The skill surfaces this at scheduling time rather than leaving users to discover it.

**Agent Spec Builder: progress markers (new)**
Each element now displays its position — "Element 1 of 5" through "Element 5 of 5" — so users entering mid-interview know where they are and how much is left. Addresses a real friction point from the GoodFreight road test.

**Agent Spec Builder: type consequences (new)**
A one-line explanation of what changes based on the agent type is now shown alongside each option. Execution: tightest boundary, because it acts. Measurement: wider boundary, because it only observes. Guardian: stopping criteria must be specific, not a vibe. Removes the abstraction from a question that previously felt arbitrary to first-time users.

**Agent Spec Builder: "non-exception exceptions" bucket (new)**
The boundary conversation now explicitly surfaces the pattern of logging near-boundary cases separately for periodic review rather than escalating each one individually. Offered as a standard option for early-phase execution agents where the right boundary isn't fully known yet. Emerged from the GoodFreight road test; generalisable to any execution agent operating near a decision boundary.

**Agent Spec Builder: "log now, reason later" (new)**
The boundary conversation now explicitly surfaces the pattern of capturing structured data in real time and filling in reasoning in periodic calibration sessions rather than in-the-moment. Offered as a standard option for agents that need to learn from decisions over time. Keeps the agent lightweight; puts reasoning where there's actually space to think.

**agent-os-workshop: mission folder scaffolding at Phase 3 close (new)**
The Workshop now scaffolds the full mission folder when the Phase 3 mission plan is confirmed — creating `04_MISSIONS/MISSION-NNN_slug/`, writing `MISSION-BRIEF.md`, and creating the five state files (`todo.md`, `in-progress.md`, `blocked.md`, `done.md`). Previously the Workshop only produced `MISSION.md` and left folder creation to the Delivery Manager on first Run session. The Run skill's "Where am I?" opener now finds a clean starting state rather than doing setup overhead on first session.

**Version metadata: all three skills bumped to v2.2**
Internal `version:` metadata in `agent-os-bootstrap/SKILL.md` and `agent-os-workshop/SKILL.md` updated from `2.1` to `2.2` — now consistent with the README declaration. `agent-os-run/SKILL.md` is `2.2.1` per this patch.

### Upgrade path

Download `agent-os-run.skill` from the v2.2.1 release and reinstall via **Customize → Skills** in Cowork. Bootstrap and Workshop users can optionally reinstall those skills to pick up the version metadata correction — no functional change.

---

## v2.2 — 2026-06-11

### Run layer — new

The coordination layer for operating your BoS OS day to day. Three agents, one pipeline:

**Mission Shaper** (`agent-os-run/agent-specs/mission-shaper.md`)
Coaches a rough idea into a sharp, measurable Mission Brief — by making you do the thinking, not by doing it for you. Forces the outcome-vs-activity distinction, handles committed vs exploration, time-bound vs ongoing, and surfaces what needs guarding (risk and voice/messaging). Output: `MISSION-BRIEF.md`.

**Agent Planner** (`agent-os-run/agent-specs/agent-planner.md`)
Takes the Mission Brief and staffs the mission — casts the agent team the way you'd hire one, then specs each role to a runnable standard. Competency roles, not task-bots. Output: agent specs + prioritised `todo.md`.

**Delivery Manager** (`agent-os-run/agent-specs/delivery-manager.md`)
Drives each deliverable from high-level goal to running system. Two modes: build mode (decompose → discover → recommend gate → specify + tests → build → QA gate → operate) and operate mode (stand-up → pull → block → complete → wrap-up). Its job is to keep you at decision altitude and out of the weeds.

**Mission state templates** (`agent-os-run/mission-templates/`)
Five templates: `mission-brief.md`, `todo.md`, `in-progress.md`, `blocked.md`, `done.md`. Copy into any mission folder.

**Mission Shaper — mission definition and coaching additions**
The Mission Shaper now opens with a plain-language definition of what a mission is and why each element matters — outcome, measure, shape, approach, what needs guarding, gaps. A new "symptom-to-system" move is added to the interrogation phase: when someone describes a recurring problem, the Shaper asks whether they're fixing the symptom or the system that keeps producing it. The point of the BoS OS is to fix the system, not clear the queue.

**Mission Planner retired**
The earlier `mission-planner.md` (v1 combined agent) is superseded by Mission Shaper + Agent Planner. Not included in this release.

**Terminology**
All RFC references replaced with "strategy document" throughout the Run layer. Consistent with v2.1 Bootstrap and Workshop.

**Author credits**
All Run layer specs credit Tim Barker, Mark Littlewood and Business of Software.

### Upgrade path

Download `agent-os-run.skill` from the [v2.2 release](https://github.com/BoSMark/BoS_OS_Start/releases/tag/v2.2) and install via **Customize → Skills** in Cowork. Bootstrap and Workshop are unchanged — install Run alongside them when you're ready to operate missions.

---

## v2.1 — 2026-06-11

### Bootstrap skill — v2.1

**Terminology: RFC → strategy documents throughout**
All references to "RFC" replaced with "strategy document" across Bootstrap, its reference files, and templates. The RFC numbering system is retired. Strategy documents use plain English names that reflect how each company actually talks about its work.

**rfc_templates/ retired**
The `rfc_templates/` folder has been removed and replaced by `strategy_templates/` — ten templates covering values, brand, growth, product, financial, governance, measurement, security, platform, and competitive positioning. Each template now includes an AI and Automation Footprint section to capture existing AI usage in the company's tech stack.

**Bootstrap/Workshop distinction clarified**
Bootstrap produces role stubs, not agent specs. This is now explicit in the SKILL.md, the agent spec template, and the references README. A role stub captures a person's name, title, functions, and strategy documents owned. Full agent specs — with decision boundaries, escalation triggers, and evaluation criteria — are Workshop territory.

**Author credits updated**
All reference files now credit Tim Barker, Mark Littlewood and Business of Software.

**Easter eggs added**
Human-readable sarcastic notes added to some agent-read reference files. Don't get your hopes up.

### Workshop skill — reference files completed

Three files missing from the previous push added: `evaluation_frameworks.md`, `ground_truth_examples.md`, `mission_template.md`. All workshop reference files now present and consistent.

**Agent spec template clarified**
Workshop `agent_spec_template.md` now has an explicit callout at the top: this is an AI agent specification, not a human role description.

---

## v2.0.2 — 2026-05-28

### Workshop skill — major update

**OS version detection**
The Workshop now checks which bootstrap version was used before doing anything else. If it finds the original bootstrap (RFC-numbered files, `portfolio_map.md`), it surfaces the differences explicitly and gives the user three options: keep existing names, rename now, or explain first. No changes are made without explicit user approval.

**North Star anchoring throughout**
The Workshop pulls personal goal and North Star metric from the bootstrap state files and uses them as anchors in every phase. Phase 1 frames all strategy document work against the North Star. Phase 3 starts mission definition from it: "what one task, done well, would move that number fastest?" If the bootstrap didn't capture these (older installs), Phase 0 asks them before proceeding.

**Explicit-permission model formalised**
Hard rule added: no silent changes. Every proposed file change is shown individually. The user approves each one. Silence is not approval. Applies to renames, cross-reference updates, and state file changes.

**Terminology updated throughout**
"RFC" replaced with "strategy document" throughout the skill. This makes the Workshop accessible to users who didn't run the original bootstrap and removes jargon that caused confusion in practice. Where original-bootstrap users still have RFC-named files, the Workshop references them by their actual names with clarification.

**New reference files**
- `references/strategy_doc_quality_checklist.md` — replaces `rfc_quality_checklist.md` (same content, updated terminology)
- `references/upgrade_guide.md` — new file covering all upgrade scenarios with explicit guidance on what's safe, what requires care, and the backup-first requirement

**Agent map reference updated**
Workshop now reads `agent_map.md` as the primary agent portfolio reference (Bootstrap v2.1+). Detects and falls back to `portfolio_map.md` for original bootstrap users.

### Upgrade path

Download `agent-os-workshop.skill` from the [v2.0.2 release](https://github.com/BoSMark/BoS_OS_Start/releases/tag/v2.0.2) and reinstall via **Customize → Skills** in Cowork. Your existing OS is unaffected — the Workshop detects your setup and asks before changing anything.

---

## v2.0.1 — 2026-05-26

### Maintenance

**Skill files re-synced with installed versions**
`agent-os-workshop/SKILL.md` and `agent-os-bootstrap/SKILL.md` updated to match the versions distributed via the Cowork plugin. The workshop skill in particular had diverged significantly (24 lines vs 224 lines) — anyone who downloaded the repo directly would have received an incomplete workshop skill missing all phase instructions. Both skills now reflect the full, current implementation.

## v2.0 — May 2026

### What's new

**Memory system (`01_STATE/memory/`)**
Domain-organised feedback files where agent observations compound into rules over time. Without this, every session starts from scratch plus the audit trail. v2.0 includes a self-check at bootstrap that produces sharp, validatable hypotheses rather than generic stubs — so the memory layer is useful from day one, not just after months of use.

**Quality gates (`01_STATE/quality_gates.md`)**
Pre-delivery checklists per deliverable type. Agents run the relevant gate before presenting work — failed criteria are caught and fixed before review, not after. This removes the most common friction in the review cycle.

**Hardened decision cascade**
Three rules that close the most common failure modes in v1: one decision at a time when processing meetings or transcripts; confidential content never enters git regardless of approval status; every decision explicitly names which other documents it affects. These rules are now in CLAUDE.md by default.

**Bootstrap summary (`BOOTSTRAP_SUMMARY.md`)**
v2 produces a summary at the workspace root with your top-3 next steps, what blocks agents from operating in your specific context, and a seeded first mission. Removes the "I installed it, now what?" problem that tripped up most v1 users.

**Seeded first mission**
Bootstrapped agents get a concrete first job — validating the hypotheses the bootstrap seeded for them — so the system feels operational from day one rather than theoretical.

**Context-window discipline**
New guidance in CLAUDE.md and agent specs to prevent context bloat as the OS grows. Agents load only what the current task needs. Status files reflect current state only; decision log handles history. Keeps the OS working reliably in month six, not just month one.

### Upgrade path

Existing v1 deployments don't need to migrate — they continue working. Most users will want to upgrade once they see what the new layers add.

**To upgrade:**
1. Go to the [v2.0 release page](https://github.com/BoSMark/BoS_OS_Start/releases/tag/v2.0) and download `agent-os-bootstrap.skill` and `agent-os-workshop.skill` from the Assets section
2. In Cowork, click **Customize** → **Skills** → reinstall by selecting the downloaded file (replaces v1)
3. Open Cowork in your existing workspace and say "Upgrade my agent OS to v2" — or run Bootstrap normally; it auto-detects your v1 deployment
4. The skill adds new scaffolding additively — nothing existing is overwritten. CLAUDE.md changes land as a diff in `UPGRADE_NOTES.md` for you to merge manually

**Time estimate:** ~10–15 minutes for the bootstrap upgrade. ~30 minutes per agent if you re-run the Workshop in upgrade mode (adds memory domains, quality gates, and the new session-prompt boilerplate to each existing agent spec). The workshop upgrade is optional — your agents work without it, just with less of the v2 benefit.

**What's preserved:** All your existing strategy documents, agent specs, decisions, and customisations. The migration touches none of them.

**What you'll do manually:** Merge the CLAUDE.md additions — a small diff with three new sections. Worth doing; they're the load-bearing governance rules.

---

## v1.0 — 2025

Initial release distributed at Business of Software conference.

Included:
- Bootstrap skill — models a company OS from public information in under an hour; produces folder structure, RFCs, agent specs, and CLAUDE.md
- Workshop skill — interactive facilitation to refine the bootstrap output using insider knowledge; covers RFC deep-dive, agent spec hardening, and first mission definition
- Supporting reference files for both skills (RFC templates, evaluation frameworks, ground truth examples, industry patterns)
