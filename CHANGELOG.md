# Changelog

All notable changes to the BoS Agent OS Toolkit are documented here.

---

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
