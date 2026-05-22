# Agent OS Folder Structure

## Canonical Layout

```
agent-os/
├── 00_LOCAL_CONTEXT/          # Private working files — never shared or tracked
├── 01_STATE/                  # Session continuity and decision history
│   ├── session_summary.md
│   ├── session_review_log.md
│   └── decisions.md
├── 02_STRATEGY/               # Strategic documents (RFC-driven)
├── 03_AGENTS/                 # Agent specifications and governance
├── 04_MISSIONS/               # Time-bound execution workstreams
├── 05_ARTIFACTS/              # Final deliverables and published assets
└── CLAUDE.md                  # Project instructions (scope, constraints, governance)
```

---

## Folder Purposes

### `00_LOCAL_CONTEXT/` — Private Working Files

**Purpose:** Sandbox for unvetted work, confidential information, and decision drafts.

- Never tracked in git — added to `.gitignore`
- Used for: working notes, financial terms, personnel details, contract negotiation drafts, user PII (if any), and early brainstorms
- Patterns: drafting files, sensitivity notes, local configuration
- **Governance rule:** Nothing confidential enters tracked files; if something in LOCAL_CONTEXT needs to become permanent, it must be:
  - Anonymised or generalised
  - Approved by governance stakeholders
  - Explicitly moved to tracked folders (01–05) with decision recorded in `01_STATE/decisions.md`

**Example files:**
- `Exec_Notes_Q1_2026.md` (draft strategy, not yet approved)
- `Sensitive_Partner_Discussion.md` (confidential negotiation)
- `Agent_Budget_2026.csv` (financial data)

---

### `01_STATE/` — Session Continuity & Decision History

**Purpose:** Persistent memory of the agent system — what was decided, what's open, where we are.

Used by agents and humans to understand context and avoid repeating work.

#### `session_summary.md`

Handoff document for starting a new session. Includes:
- **Last session outcome:** What was accomplished, what remains open
- **Current state:** Active agents, running missions, next deadlines
- **Open questions:** Decisions pending governance review
- **Context:** Links to recent RFCs, key constraints, current watch list items
- **Next steps:** What to work on first

**Pattern:** Updated at the end of every session; consulted at the start of the next.

Template:
```markdown
# Session Summary — [Date Range]

## Last Session Outcome
- [What was completed]
- [What succeeded / failed]
- [Why, if notable]

## Current State
### Active Agents
- Agent Name: [Status, last action]

### Active Missions
- Mission Name: [Phase, deadline]

### Open Items
- [Decision pending approval: ...]
- [Risk flagged: ...]
- [Escalation open: ...]

## Context
- **Governing RFCs:** [List relevant strategy docs]
- **Key constraints:** [Hard constraints to respect]
- **Watch list:** [Items requiring monitoring]

## Next Steps
1. [Priority 1]
2. [Priority 2]
3. [Priority 3]
```

#### `session_review_log.md`

A log of open items, blockers, and decisions in flight. Used to track what's waiting on what.

**Pattern:** One entry per open item. Closed items are archived to `decisions.md` with outcome.

Template:
```markdown
# Session Review Log

## Open Items

### Decision: [Name]
- **Status:** Pending [stakeholder] approval
- **Due:** [Date]
- **Description:** [What needs deciding]
- **Options:** [What are the choices?]
- **Proposed:** [What does the initiator recommend?]

### Blocker: [Name]
- **Status:** Blocked on [dependency]
- **Impact:** [What work is waiting?]
- **Unblocks when:** [What condition resolves this?]

### Risk: [Name]
- **Severity:** [High/Medium/Low]
- **Description:** [What could go wrong?]
- **Mitigation:** [What are we doing about it?]
```

#### `decisions.md`

Historical log of all decisions made, with date, stakeholders, rationale, and outcome.

**Pattern:** Append-only. Serves as the audit trail.

Template:
```markdown
# Decision Log

## [Decision Name] — [Date]
- **Decision:** [What was decided?]
- **Stakeholders:** [Who approved?]
- **Rationale:** [Why this choice?]
- **Governing RFC:** [Which strategic doc guided this?]
- **Outcome:** [If already executed, what happened?]
- **Revisit in:** [If time-bound, when to reconsider?]

---
```

---

### `02_STRATEGY/` — RFCs (Requests for Comments)

**Purpose:** Durable strategic constraints that govern all agent work.

An RFC is a written proposal for a strategic decision. It's reviewed, debated, and either accepted (becomes policy) or rejected. Once accepted, it stays in the repo and agents follow it.

**RFC Numbering:** `RFC-1XX.md` (100-series reserved for strategy)
- RFC-101: [First strategic decision]
- RFC-102: [Second strategic decision]
- etc.

**Structure of an RFC:**
```markdown
# RFC-1XX: [Descriptive Title]

## Status
[DRAFT | ACCEPTED | REJECTED | SUPERSEDED]

## Summary
[1–2 sentence problem statement]

## Motivation
[Why does this matter? What problem does it solve?]

## Proposed Solution
[What are we committing to?]

## Constraints & Trade-offs
[What are we *not* doing? What's the cost?]

## Governance
[Who approves? What's the review process?]

## Implementation
[How do agents follow this? What do they do differently?]

## Success Criteria
[How do we know this worked?]

## Approval
- Proposed by: [Name, date]
- Approved by: [Names, date]
- Reviewed by: [Peer names]
```

**Key RFCs for all orgs:**
- RFC-101: Decision Cascade Governance (decisions don't go into tracked files without approval)
- RFC-102: Confidentiality (no confidential data in git; it goes to 00_LOCAL_CONTEXT/)
- RFC-103: Agent Authority (which agents can make what decisions autonomously)
- RFC-104: Audit & Logging (what gets recorded, who reviews it)

Industry-specific RFCs may live here too (e.g., RFC-201 for regulatory compliance, RFC-301 for vendor management).

---

### `03_AGENTS/` — Agent Specifications

**Purpose:** Definitions of every AI agent in the system — their role, authority, constraints, interfaces.

**File naming:** `[Agent_Name]_agent_spec.md`

**Three Agent Types:**

1. **Guardian Agent** (veto power)
   - Can block work; escalates upward
   - Used for: regulatory compliance, safety gates, conflict resolution
   - Example: Compliance Guardian (in financial services)
   - Cannot originate work; only evaluates/approves others' work

2. **Execution Agent** (originates and completes work)
   - Researches, drafts, iterates, delivers
   - Has a decision boundary (autonomous decisions + hard constraints)
   - Example: Revenue Operations Agent (SaaS)
   - Reports to a Guardian or human stakeholder

3. **Operational Agent** (supports decisions)
   - Gathers data, summarizes options, flags trade-offs
   - Does not make final decisions; prepares for human choice
   - Example: Market Research Agent
   - Works on behalf of Guardians and Executors

**Typical layout per agent:**
```
03_AGENTS/
├── Compliance_Guardian_spec.md
├── Revenue_Operations_Agent_spec.md
├── Market_Research_Agent_spec.md
├── Engineering_Quality_Guardian_spec.md
└── README.md [index of all agents, their types, and dependencies]
```

**Key sections of an agent spec:**
- Role & domain
- Decision boundary (what it decides; what it doesn't)
- Required inputs & data sources
- Output format & interface
- Escalation triggers
- Constraints it must respect
- Success metrics
- Interfaces with other agents (who calls it, who it calls)

---

### `04_MISSIONS/` — Time-Bound Execution Work

**Purpose:** Discrete execution projects with defined phases, timelines, and handoff criteria.

A mission is not a standing agent responsibility — it's a time-boxed project with a start, phases, and an end condition.

**File naming:** `[Mission_Name]_mission.md`

**Mission Phasing (5 phases):**

1. **Single-Case Calibration** (1–2 sessions)
   - Prove the mission works on one real example
   - Goal: Demonstrate feasibility and risk surface
   - Output: Case study + refined scope

2. **Rollout Preparation** (2–4 weeks)
   - Build tooling, templates, training materials
   - Prepare stakeholders and agents
   - Output: Runbook, success criteria, go/no-go decision

3. **Pilot** (2–8 weeks, ~10–50 cases)
   - Execute on a small, representative cohort
   - Monitor for edge cases, refine processes
   - Output: Pilot report, lessons learned, scale recommendation

4. **Scale** (ongoing, hundreds of cases)
   - Operate with agent support; reduce manual overhead
   - Monitor SLAs, quality, costs
   - Output: Weekly performance reports

5. **Autonomous Operation** (mature phase)
   - Mission runs with minimal human oversight
   - Agents handle exceptions; escalate upward only
   - Output: Monthly reviews, continuous improvement

**Mission template:**
```markdown
# [Mission Name]

## Overview
- **Objective:** [What are we trying to accomplish?]
- **Scope:** [What's in, what's out?]
- **Timeline:** [Start date, end date, phases]
- **Owner:** [Lead stakeholder]
- **Success criteria:** [How do we know it worked?]

## Phase Details
### Phase 1: Calibration
- Duration: [Dates]
- Deliverable: [Case study]
- Go/no-go decision by: [Date]

### Phase 2: Preparation
- Duration: [Dates]
- Deliverable: [Runbook, training]

### Phase 3: Pilot
- Duration: [Dates]
- Sample size: [N cases]
- Monitoring: [Metrics we track]

### Phase 4: Scale
- Duration: [Dates]
- Rollout plan: [How we expand]
- Runbook: [Operating procedures]

### Phase 5: Autonomous
- Trigger: [What needs to happen to start this]
- SLAs: [Performance targets]

## Agents Assigned
- [Agent name, role]
- [Agent name, role]

## Risks
- [Risk 1, mitigation]
- [Risk 2, mitigation]
```

---

### `05_ARTIFACTS/` — Deliverables & Published Assets

**Purpose:** Final, approved outputs ready for use — reports, frameworks, guidelines, dashboards.

This is where work *exits* the agent system. Everything here is clean, reviewed, and usable.

**Common artifact types:**
- Reports (quarterly reviews, performance audits, risk assessments)
- Frameworks (decision trees, evaluation rubrics, governance models)
- Guidelines (how-to docs, playbooks, style guides)
- Dashboards & datasets (metrics, visualizations)
- Published content (blog posts, whitepapers, public announcements)
- Meeting notes (approved, executive summaries)

**File naming:** Be specific and date clearly
- `Q1_2026_Strategic_Review.md`
- `Revenue_Operations_Playbook.md`
- `Agent_Performance_Dashboard_Jan_2026.csv`

**Governance:** Nothing goes in 05_ARTIFACTS without:
- Sign-off from the responsible Guardian or executive
- Entry in `01_STATE/decisions.md` (decision to publish)
- Removal of all confidential information (names, numbers, internal jargon)

---

### `CLAUDE.md` — Project Instructions

**Purpose:** The master rulebook for the agent OS. Defines scope, constraints, governance, and how agents should interpret ambiguity.

**Required sections:**
- **Purpose:** What is this system for? What are we trying to do?
- **Hard Constraints:** Non-negotiable rules (regulatory, ethical, confidentiality)
- **Project Structure:** This folder layout + how it's used
- **Decision Cascade Governance:** How decisions get made and recorded
- **Current Date:** Updated at the start of each session

**Key governance rule in CLAUDE.md:**
> No agent may write to tracked files (01–05) without explicit approval from a stakeholder. Draft to 00_LOCAL_CONTEXT first, present the decision to the human owner, wait for approval, then move to tracked files with a decision log entry.

**Current Date placeholder:** Agents need to know the current date to contextualize work. This is updated at the start of each session and referenced by agents (especially in mission phasing and RFC review).

---

## Startup Protocol

When starting a new session:

1. **Read `CLAUDE.md`** to understand scope and constraints
2. **Read `01_STATE/session_summary.md`** to learn what's in progress
3. **Scan `01_STATE/session_review_log.md`** for open items and blockers
4. **Check `01_STATE/decisions.md`** for recent decisions (last 5–10)
5. **Review relevant RFCs** from `02_STRATEGY/` (referenced in session summary)
6. **Identify which agents** are active (from `03_AGENTS/` and session summary)
7. **Determine next priority** from session summary and open items
8. **Work autonomously within agent boundaries** until a decision is needed
9. **At session end:** Review and approve Claude's draft updates to `session_summary.md` and `session_review_log.md`

---

## Key Conventions

### File Naming
- Use clear, descriptive names: `Revenue_Operations_Agent_spec.md` not `agent_1.md`
- Include dates in artifacts: `Q1_2026_Strategic_Review.md`
- Use UPPER_CASE_WITH_UNDERSCORES for folder names and file names

### Markdown Structure
- Use ATX headings (# ## ### not underlines) for consistency with git diffs
- Lead with a summary statement or tldr
- Use code blocks for templates and examples
- Link internally to related files: `See 01_STATE/decisions.md`

### Decision Records
- Every decision goes to `01_STATE/decisions.md` with date, stakeholders, rationale
- Every open item goes to `01_STATE/session_review_log.md` until resolved
- Use the same formatting so tools can parse them

### Confidentiality
- No financial data, contract terms, or personnel names in tracked files
- No user PII or sensitive operational metrics in git
- If in doubt, put it in 00_LOCAL_CONTEXT/ and flag it for review

---

## Scaling the System

As the agent OS grows, you may add more RFC series:

- **RFC-1XX:** Core strategy (governance, confidentiality, decision-making)
- **RFC-2XX:** Regulatory & compliance (industry-specific)
- **RFC-3XX:** Operational (vendor management, tooling, escalation)
- **RFC-4XX:** Product/domain-specific (how agents interact with your core business)

Similarly, `04_MISSIONS/` will grow. Completed missions can be archived to `05_ARTIFACTS/` as case studies.

The structure remains stable; the content grows into it.

---

## References

This structure is inspired by:
- RFC processes used in engineering teams (RFC-style decision-making at scale)
- RACI matrices and accountability frameworks (agent types, decision boundaries)
- Agile mission planning (phased rollout, success criteria)
- Change management best practices (session continuity, audit trails)
