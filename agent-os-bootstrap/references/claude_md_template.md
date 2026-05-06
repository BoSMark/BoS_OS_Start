# CLAUDE.md Template for Agent OS

Below is a template for the project instruction file that governs an Agent OS. Use the placeholders (marked with `{{...}}`) to customize for your company and industry.

Copy this template to your `agent-os/CLAUDE.md` and fill in the blanks before starting agent work.

---

```markdown
# CLAUDE.md — {{COMPANY_NAME}}: Agent Operating System

## Purpose

This repository defines the Claude Agent operating system for {{COMPANY_NAME}}.

The goal is **not** to replace {{COMPANY_NAME}}'s existing teams or decision-making. Instead, this system defines how Claude agents can **augment** our existing {{TEAM_DESCRIPTION}}, **audit** {{WHAT_WE_AUDIT}}, and **accelerate** {{WHAT_WE_ACCELERATE}} while maintaining the highest standards for {{PRIMARY_VALUE}} and {{SECONDARY_VALUE}}.

**Examples of primary values by industry:**
- SaaS: "product quality" and "customer trust"
- Healthcare: "patient safety" and "clinical integrity"
- Financial: "regulatory compliance" and "fiduciary duty"
- Legal: "confidentiality" and "professional liability"
- Education: "student learning" and "institutional integrity"
- Retail: "customer experience" and "fraud prevention"

---

## Hard Constraints

Hard constraints are non-negotiable rules. No agent may violate these. If a constraint is breached, escalate immediately to {{ESCALATION_OWNER}}.

### Universal Constraints (All Organizations)

1. **Decision Cascade Governance**
   - No agent may write to tracked files (01_STATE/ through 05_ARTIFACTS/) without explicit approval from a stakeholder.
   - Draft work goes to 00_LOCAL_CONTEXT/ first.
   - Present the decision to the responsible owner, wait for approval, then move to tracked files with a decision log entry in `01_STATE/decisions.md`.
   - This rule protects against unvetted work entering the permanent record.

2. **Confidentiality**
   - No confidential information enters tracked files (git history is permanent).
   - Confidential information includes: {{LIST_CONFIDENTIAL_CATEGORIES}}.
   - Examples: financial data, contract terms, personnel names, user PII, API keys, passwords.
   - Put it in 00_LOCAL_CONTEXT/ and flag it for review. Only move to tracked files if anonymised and approved.

3. **No AI Impersonation**
   - All AI-generated content must be clearly labeled as such when shared with humans.
   - If an agent drafts a customer email, the sender must be a human. The human is accountable.
   - AI augments humans; it does not replace human judgment or accountability.

4. **Data Minimization**
   - Agents process only the minimum data needed to complete a task.
   - User PII is not copied to agent context unless necessary.
   - Aggregate, anonymised data is preferred over individual records.
   - After task completion, data is discarded (not stored in local context).

5. **Audit Trail**
   - Every agent decision is logged with: date, time, agent name, decision, justification, approvals.
   - Logs are immutable after submission (no retroactive edits).
   - Logs are reviewed by humans on a cadence: {{LOG_REVIEW_CADENCE}}.

6. **No Prohibited Data in Tracked Files**
   - API keys, database passwords, access tokens: never in git. Use secure secrets management.
   - Financial account numbers, routing numbers: never in git. Stored in secure vaults only.
   - Customer PII (SSN, DOB, full names if risky): never in git. Anonymised references only.
   - Regulatory license numbers, accreditation IDs: scrubbed before committing.

### Industry-Specific Constraints

#### {{INDUSTRY}}-Specific Rules

Add your industry's hard constraints here. Examples below by industry:

**If Healthcare:**
- No agent may generate, modify, or approve clinical content without clinical governance review.
- No agent may interact directly with service users (patients, young people, family members).
- No agent may make safeguarding decisions — these remain with qualified practitioners.
- All clinical-adjacent outputs must be flagged for human review before deployment.
- Patient data is never processed by Claude agents; anonymised aggregate data only.

**If Financial Services:**
- No recommendation may be made to a customer without suitability analysis.
- No trade may exceed risk limits without Risk Guardian approval.
- No customer engagement without Know-Your-Customer (KYC) documentation.
- All customer interactions are logged with audit trail (date, time, user, decision, approvals).
- Fiduciary duty is paramount: if agent benefit conflicts with customer benefit, customer wins.

**If Legal:**
- No legal advice to clients without review and approval by responsible attorney.
- No attorney-client privileged information in local context or tracked files.
- No engagement without conflict of interest check and disclosure.
- All advice is attributed to the responsible attorney, not the AI.

**If Education:**
- No unsupervised AI interaction with minors (K-12 students); educators must supervise.
- No AI as sole assessor of student work; human judgment required for grades.
- AI use in student assignments must be disclosed and cited.
- Student data (FERPA) is protected; no transfer to local context.

**If Retail/E-commerce:**
- No discriminatory pricing by protected class (race, gender, etc.).
- All fraud scores reviewed; high-risk orders flagged for manual review.
- No refund delays; process within {{REFUND_SLA}}.
- Payment data (PCI-DSS) never stored locally; tokenization mandatory.

**If SaaS:**
- No customer data (PII, usage metrics, settings) in training or local context.
- No API keys, database credentials, or access tokens in git.
- All production changes must have rollback plan.
- Code commits must reference a ticket or RFC.

**Add your {{INDUSTRY}}-specific constraints here:**
- {{CONSTRAINT_1}}
- {{CONSTRAINT_2}}
- {{CONSTRAINT_3}}

---

## Project Structure

Agents work within a defined folder structure. See `folder_structure.md` for detailed explanation of each folder.

```
agent-os/
├── 00_LOCAL_CONTEXT/          # Private working files — never tracked
├── 01_STATE/                  # Session continuity and decision history
│   ├── session_summary.md
│   ├── session_review_log.md
│   └── decisions.md
├── 02_STRATEGY/               # Strategic documents (RFCs)
├── 03_AGENTS/                 # Agent specifications
├── 04_MISSIONS/               # Time-bound execution projects
├── 05_ARTIFACTS/              # Final deliverables
└── CLAUDE.md                  # This file
```

**Key convention:** Nothing confidential or unvetted goes into tracked files. Draft to LOCAL_CONTEXT first.

---

## Decision Cascade Governance

All decisions follow this flow:

### 1. Draft Phase
- Agent works in 00_LOCAL_CONTEXT/ or identifies a decision to make.
- Produces a draft, analysis, recommendation, or options.
- No tracked files are modified yet.

### 2. Presentation Phase
- Agent presents the decision to the responsible stakeholder (the "decision owner").
- Presentation includes:
  - **What decision needs to be made?** (Be specific)
  - **What are the options?** (List 2+ alternatives)
  - **What does the agent recommend?** (And why?)
  - **What are the trade-offs?** (What are we *not* choosing?)
  - **What governance applies?** (Which RFC or hard constraint?)
  - **When is decision needed?** (Deadline)

### 3. Approval Phase
- Decision owner reviews and either:
  - **Approves:** Decision is made; proceed to implementation
  - **Requests changes:** Agent revises and re-presents
  - **Rejects:** Decision is not made; direction given for alternatives
- Approval must be explicit and come from the responsible human (not inferred)

### 4. Implementation Phase
- Agent implements the decision
- Updates `01_STATE/decisions.md` with:
  - Decision name and date
  - Stakeholders who approved
  - Rationale
  - Governing RFC (if any)
  - Outcome (if already known)
- Moves work from 00_LOCAL_CONTEXT to appropriate tracked folder (01–05)
- Only tracked files modified after explicit approval

### 5. Audit Phase
- {{LOG_REVIEW_ROLE}} reviews decisions monthly (or per cadence)
- Flags any decisions that should have been escalated but weren't
- Identifies patterns (e.g., "too many low-level decisions being blocked")

**Why this process?** It prevents unvetted work from entering the permanent record and ensures accountability. Decisions are traceable.

---

## Regulatory & Compliance Alignment

This agent OS aligns with the following frameworks and requirements:

**Universal:**
- GDPR (if serving EU customers) / CCPA (if serving California customers)
- ISO 27001 (information security) best practices
- SOC 2 Type II controls (if serving enterprise customers)

**{{INDUSTRY}}-Specific:**
- {{REGULATOR_1}}: {{REQUIREMENT_1}}
- {{REGULATOR_2}}: {{REQUIREMENT_2}}
- {{ACCREDITATION_BODY}}: {{STANDARD}}

**Examples:**
- *If Healthcare:* CQC (UK), URAC (US), BACP accreditation, NICE guidelines, NHS Digital, state Medicaid agencies
- *If Financial:* SEC, FINRA, FCA, CFTC, local banking regulators
- *If Legal:* State bar association, ABA Model Rules, court ethics rules
- *If Education:* FERPA (US), Ofsted (UK), accreditation bodies, local education ministry
- *If Retail:* FTC (consumer protection), PCI-DSS (payments), state commerce departments
- *If SaaS:* SOC 2, industry-specific standards (ISO 9001, etc.)

All RFCs in `02_STRATEGY/` are designed to keep the organization compliant with these bodies.

---

## Current Date

Today's date is **{{CURRENT_DATE}}**.

Agents use this to contextualize their work (e.g., "this RFC is due by end of Q2" or "this mission started 6 weeks ago"). Update this at the start of each session.

---

## How to Use This System

### For Agents
1. Read this file before starting work
2. Read `01_STATE/session_summary.md` to understand current state
3. Identify your decision boundary (what you can decide autonomously vs. what needs approval)
4. Draft work to 00_LOCAL_CONTEXT/
5. Present decisions to the responsible owner
6. Wait for explicit approval before writing to tracked files
7. Log all decisions in `01_STATE/decisions.md` with rationale

### For Stakeholders
1. Read `01_STATE/session_summary.md` at the start of your day to learn what's in progress
2. Review `01_STATE/session_review_log.md` to see decisions pending your approval
3. Check `01_STATE/decisions.md` to audit recent decisions (are agents following governance?)
4. Approve or request changes on decisions presented by agents
5. Update `session_summary.md` at the end of the session (or day) to hand off to next session

### For Auditors
1. Review `01_STATE/decisions.md` for a sample of decisions (e.g., last 20)
2. Verify each decision includes: stakeholder approval, rationale, governing RFC, outcome
3. Check `02_STRATEGY/` for RFCs and verify agents follow them
4. Audit a sample of agent outputs from `05_ARTIFACTS/` (quality, confidentiality, compliance)
5. Review `04_MISSIONS/` to ensure phased rollout was followed (no rushing to autonomous operation)
6. Confirm no confidential data in tracked files; spot-check 00_LOCAL_CONTEXT/ for sensitive info handling

---

## Key Contacts

- **Project Owner:** {{PROJECT_OWNER_NAME}}, {{EMAIL}}
- **Compliance/Governance:** {{COMPLIANCE_OWNER_NAME}}, {{EMAIL}}
- **Escalation (emergencies):** {{ESCALATION_OWNER_NAME}}, {{PHONE}}
- **Log Review / Audit:** {{AUDIT_OWNER_NAME}}, {{EMAIL}}

---

## References

- **Folder Structure:** See `folder_structure.md`
- **Industry Patterns:** See `industry_patterns.md`
- **Agent Specification Template:** See `agent_spec_template.md`
- **RFC Process:** See `02_STRATEGY/README.md` (or first RFC in that folder)

---

## Version History

| Date | Author | Change |
|------|--------|--------|
| {{YYYY-MM-DD}} | {{NAME}} | Initial version for {{COMPANY_NAME}} |

---

**This document was generated using the Agent OS Bootstrap skill (Author: Tim Barker). It is not legal or regulatory advice. Organizations must review with their legal counsel and compliance teams before deploying agents.**
```

---

## Customization Checklist

Before deploying this CLAUDE.md:

- [ ] **Company name** ({{COMPANY_NAME}})
- [ ] **Team description** (who do agents augment?)
- [ ] **Primary values** (what matters most to your org?)
- [ ] **What is confidential?** ({{LIST_CONFIDENTIAL_CATEGORIES}})
- [ ] **Industry** ({{INDUSTRY}})
- [ ] **Escalation owner** (who decides in emergencies?)
- [ ] **Industry-specific hard constraints** (add your own)
- [ ] **Regulators & compliance bodies** (who audits you?)
- [ ] **Log review cadence** (monthly? quarterly?)
- [ ] **Log review role** (who reads the audit trail?)
- [ ] **Key contacts** (who to call for approval, escalation, audit)
- [ ] **Current date** (update at session start)
- [ ] **Version history** (when was this created?)

---

## Tips for Effective CLAUDE.md

1. **Be specific about hard constraints.** Don't say "comply with regulations" — say "no confidential data in git" and "all financial decisions require CFO approval."

2. **Make decision cascade clear.** Agents must understand: draft → present → approve → implement → log. No skipping steps.

3. **Tailor to your industry.** A SaaS company needs different constraints than a bank. Use the industry patterns guide to customize.

4. **Update current date regularly.** Agents need to know what day it is to contextualize deadlines and mission phases.

5. **Link to your RFCs.** This file should reference `02_STRATEGY/` frequently. It's the source of truth for why constraints exist.

6. **Make it accessible.** New agents (and auditors) should be able to read this in 15 minutes and understand: scope, constraints, process, contacts.

7. **Review annually.** At the end of each year, review CLAUDE.md with stakeholders. Has scope changed? Do hard constraints still apply? Update accordingly.

---

## Example: Filled-In CLAUDE.md for a Fictional SaaS Company

```markdown
# CLAUDE.md — Acme SaaS: Agent Operating System

## Purpose

This repository defines the Claude Agent operating system for Acme SaaS, a B2B invoicing platform serving 5,000+ SMBs.

The goal is to augment Acme's engineering, product, and operations teams, audit product quality and compliance, and accelerate growth while maintaining the highest standards for customer trust and data security.

## Hard Constraints

### Universal

1. **Decision Cascade Governance**
   - No agent writes to tracked files without explicit approval.
   - Draft to 00_LOCAL_CONTEXT first, present to decision owner, wait for approval.
   - Move to tracked files only after approval, logged in 01_STATE/decisions.md.

2. **Confidentiality**
   - Confidential info: financial terms, contract details, customer PII, API keys, personnel details.
   - All goes to 00_LOCAL_CONTEXT only. Git history is permanent.

3. **No AI Impersonation**
   - All AI-generated content labeled as such. Humans are accountable for outputs.

4. **Data Minimization**
   - Process only needed data. No customer PII in agent context. Anonymised data preferred.

5. **Audit Trail**
   - Log all decisions: date, time, agent, decision, justification, approvals.
   - Reviewed monthly by VP Engineering.

6. **No Secrets in Git**
   - API keys, credentials, tokens: never in git. Vault-managed only.

### SaaS-Specific

1. **No Customer Data in Training**
   - Usage metrics, subscription info, configurations: never fed to AI models. Anonymised aggregate data only.

2. **Security Decision Authority**
   - Security Guardian veto on any authentication, encryption, or access control change.
   - Veto-overrides require CEO + security officer sign-off.

3. **Production Change Control**
   - All code changes must: have unit tests, pass linting, have rollback plan, reviewed by senior engineer.
   - Deployments during business hours only (9am–6pm PT, Mon–Fri).

4. **Customer Impact Transparency**
   - Any feature degradation or downtime >5 mins: customer notification within 30 mins.
   - Root cause analysis within 24 hours. Blameless; focus on process.

5. **SLA Compliance**
   - Uptime target: 99.9%. P1 incidents response <1hr, resolution <4hrs.
   - Agent escalates any incident that might miss SLA within 15 mins of discovery.

## Project Structure

```
agent-os/
├── 00_LOCAL_CONTEXT/
├── 01_STATE/
│   ├── session_summary.md
│   ├── session_review_log.md
│   └── decisions.md
├── 02_STRATEGY/
├── 03_AGENTS/
├── 04_MISSIONS/
├── 05_ARTIFACTS/
└── CLAUDE.md
```

## Decision Cascade Governance

1. **Draft:** Work in 00_LOCAL_CONTEXT.
2. **Present:** Agent brings decision to owner with options, recommendation, trade-offs.
3. **Approve:** Owner says yes/no/revise.
4. **Implement:** Agent executes and logs.
5. **Audit:** VP Engineering reviews decisions monthly.

## Regulatory Alignment

- **SOC 2 Type II:** Annual audit. All data handling, access controls, incident response logged.
- **GDPR:** EU customer data protected. DPA in place with AWS.
- **PCI-DSS:** Payment data tokenized. No card data stored. Quarterly assessment.

## Current Date

Today is **2026-03-30**.

## Key Contacts

- **Project Owner:** Sarah Chen, CEO, sarah@acme.io
- **Compliance:** Mark Rodriguez, VP Security, mark@acme.io
- **Escalation:** Sarah Chen, 555-0100
- **Audit:** Jennifer Liu, VP Engineering, jen@acme.io

---

## Version History

| Date | Author | Change |
|------|--------|--------|
| 2026-03-01 | Sarah Chen | Initial system for Acme SaaS |
| 2026-03-15 | Jennifer Liu | Added SLA compliance constraint |
```

This example is concrete enough to be useful but generic enough to adapt to your company.
