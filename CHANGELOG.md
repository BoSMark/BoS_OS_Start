# Changelog

All notable changes to the BoS OS Agent Toolkit are documented here.

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

**What's preserved:** All your existing RFCs, agent specs, decisions, and customisations. The migration touches none of them.

**What you'll do manually:** Merge the CLAUDE.md additions — a small diff with three new sections. Worth doing; they're the load-bearing governance rules.

---

## v1.0 — 2025

Initial release distributed at Business of Software conference.

Included:
- Bootstrap skill — models a company OS from public information in under an hour; produces folder structure, RFCs, agent specs, and CLAUDE.md
- Workshop skill — interactive facilitation to refine the bootstrap output using insider knowledge; covers RFC deep-dive, agent spec hardening, and first mission definition
- Supporting reference files for both skills (RFC templates, evaluation frameworks, ground truth examples, industry patterns)
