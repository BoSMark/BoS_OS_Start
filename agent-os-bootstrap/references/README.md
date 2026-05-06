# Agent OS Bootstrap Reference Files

This directory contains the core reference materials for the Agent OS Bootstrap skill. Use these files to build a Claude agent operating system for any company.

## Files

### 1. **folder_structure.md**
The canonical folder structure for an Agent OS. Explains:
- What goes in each folder (00_LOCAL_CONTEXT through 05_ARTIFACTS)
- RFC numbering and strategy document conventions
- The three agent types (Guardian, Execution, Operational)
- Mission phasing (5 phases from calibration to autonomous operation)
- Session continuity patterns (session_summary.md, session_review_log.md, decisions.md)
- Key conventions (file naming, markdown structure, decision records, confidentiality)

**When to use:** First step for any new Agent OS. Read this to understand the entire structure.

**Time to read:** 20–30 minutes

---

### 2. **industry_patterns.md**
Industry-specific guidance for tailoring the Agent OS. Covers:
- **6 industries:** SaaS (default), Healthcare, Financial Services, Professional Services, Education, Retail/E-commerce
- **For each industry:** Primary RFCs, regulatory bodies, required Guardians, evaluation frameworks, hard constraints, example agent specs, example hard constraints
- **Summary table:** Which Guardian agents are needed by industry

**When to use:** After choosing your company's industry. Use this to decide which RFCs and Guardians to set up first.

**Time to read:** 30–40 minutes (or 5 minutes if just scanning for your industry)

---

### 3. **claude_md_template.md**
A template for the CLAUDE.md project instruction file that governs an entire Agent OS. Includes:
- Purpose section (what is this system for?)
- Hard constraints (universal + industry-specific)
- Project structure reference
- Decision cascade governance rules (draft → present → approve → implement → log)
- Regulatory & compliance alignment
- Current date placeholder
- A complete, filled-in example for a fictional SaaS company

**When to use:** Before your first agent starts work. Copy this template, fill in placeholders, and commit to your agent-os/ repo.

**Time to read:** 30 minutes. Time to customize: 1–2 hours

---

### 4. **agent_spec_template.md**
A universal template for agent specifications. Every agent gets one. Includes:
- 16 sections (role, type, decision boundary, escalation triggers, evaluation, constraints, etc.)
- Detailed guidance for each section
- Examples from SaaS context
- Industry-neutral; adaptable to any domain
- Startup protocol checklist
- Change management process
- Two complete example specs (Revenue Operations Agent in SaaS, Clinical Documentation Assistant in Healthcare)

**When to use:** When you're ready to define a new agent. Copy this template and fill it in with your agent's specifics.

**Time to read:** 30–40 minutes. Time to complete for one agent: 2–4 hours

---

## How to Get Started

### For New Organizations (No Agent OS Yet)

1. **Read folder_structure.md** (20 min)
   - Understand the folder layout and governance model
   - Get a feel for the system

2. **Read industry_patterns.md** (15 min, your industry only)
   - Identify which RFCs and Guardians you need
   - Understand regulatory constraints

3. **Customize CLAUDE.md** (1–2 hours)
   - Copy claude_md_template.md
   - Fill in {{PLACEHOLDERS}} for your company
   - Work with legal/compliance to finalize hard constraints
   - Commit to your agent-os/ repo

4. **Define Your First Agent** (2–4 hours)
   - Copy agent_spec_template.md
   - Fill in all 16 sections
   - Get stakeholder approval
   - Save to 03_AGENTS/

5. **Run Session 1** (varies)
   - Create 01_STATE/session_summary.md and session_review_log.md
   - Start agent work

### For Scaling Existing Agent OS

- **Use agent_spec_template.md** to onboard new agents
- **Reference industry_patterns.md** to add new RFCs as business grows
- **Update CLAUDE.md** annually (or when hard constraints change)
- **Refer to folder_structure.md** when establishing new patterns (e.g., new mission type)

---

## Quick Reference

| Task | File | Time |
|------|------|------|
| Understand the system | folder_structure.md | 20 min |
| Learn your industry | industry_patterns.md | 15 min |
| Set up project instructions | claude_md_template.md | 1–2 hrs |
| Define an agent | agent_spec_template.md | 2–4 hrs |
| Review an agent | agent_spec_template.md (section-by-section) | 30 min |
| Audit for compliance | CLAUDE.md + agent_spec_template.md (sections 5, 10, 16) | 1 hr |

---

## Key Concepts

### Decision Cascade Governance
Decisions don't go into tracked files without approval. Draft → Present → Approve → Implement → Log.

### Three Agent Types
- **Guardian:** Evaluates others' work; can veto (e.g., Compliance Guardian)
- **Execution:** Originates and completes work (e.g., Revenue Operations Agent)
- **Operational:** Gathers data and prepares decisions (e.g., Market Research Agent)

### Hard Constraints
Non-negotiable rules agents must follow. Usually defined in CLAUDE.md and agent specs.

### RFC-Driven Strategy
Strategic decisions documented as RFCs (Requests for Comments). RFC-1XX series are universal; other series are industry-specific.

### Mission Phasing
Five phases: Calibration → Rollout Prep → Pilot → Scale → Autonomous. Each phase has gates.

### Session Continuity
Session summary, review log, and decision records ensure continuity between sessions and support audit.

---

## Author

Tim Barker

---

## License & Attribution

These materials are provided as a public skill for the Claude agent system. Use and adapt freely for your organization. If you build on these materials, credit is appreciated but not required.

---

## Questions?

Refer to the **"How to Use This System"** section in CLAUDE.md or contact your project owner.

The system is designed to grow with your organization. Start simple (one Guardian, one Execution agent) and expand as you mature.

---

## File Structure Within References/

```
references/
├── README.md                    (this file)
├── folder_structure.md          (canonical folder layout)
├── industry_patterns.md         (industry-specific guidance)
├── claude_md_template.md        (project instructions template)
├── agent_spec_template.md       (agent specification template)
└── rfc_templates/               (optional: RFC templates if needed)
```

All files in this directory are standalone; you can read them in any order. However, the recommended reading sequence is:

1. folder_structure.md
2. industry_patterns.md (your industry)
3. claude_md_template.md
4. agent_spec_template.md

---

**Last updated:** March 30, 2026
