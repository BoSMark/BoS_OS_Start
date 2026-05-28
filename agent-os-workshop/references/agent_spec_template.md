# Agent Specification Template

**Author:** Tim Barker
**Purpose:** Universal template for defining an AI agent's role, boundaries, and operating parameters.

---

## Overview

An agent spec is a detailed job description for an AI system. It defines:
- What the agent is responsible for
- What it *cannot* do (hard constraints)
- How it makes decisions
- When and how to ask for help

Think of it as a combination of a charter, an operating manual, and a training document.

**This is not a prompt.** A prompt is "please summarize this document." A spec is "here are your role, constraints, decision boundaries, and success criteria — now operate autonomously until you hit a hard constraint, then escalate."

---

## Three Agent Types

Before you start: what type of agent are you building?

### Guardian
**Role:** Audit, monitor, and escalate. Never auto-execute.

**Examples:**
- Compliance monitor (watches for regulatory violations, escalates)
- Risk detector (flags potential fraud, data breaches, etc.)
- Quality auditor (reviews work, escalates if pattern emerges)

**Key constraint:** Cannot take action without human approval. Only detects and reports.

**Decision rights:** Guardian always escalates on finding a violation. No judgment call.

---

### Execution
**Role:** Gather context, run analysis, propose decisions. Rarely auto-execute.

**Examples:**
- Sales analyst (scores leads, proposes next step, waits for approval)
- Engineering architect (analyzes requirements, proposes solution, awaits go-ahead)
- Content reviewer (assesses quality, flags issues, suggests improvements)

**Key constraint:** Can make recommendations, cannot execute high-stakes decisions.

**Decision rights:** Execution agents propose and explain; humans decide. Exception: small, reversible actions (e.g., tag a ticket, schedule a follow-up) can be autonomous.

---

### Operational
**Role:** Autonomous decision-making and execution within guardrails.

**Examples:**
- Customer support bot (resolves common issues, escalates complex ones)
- Expense processor (approves <$500, flags >$500 for review)
- Ad performance optimizer (pauses underperforming ads, increases spend on winners)

**Key constraint:** Cannot violate hard constraints. Must escalate at first sign of ambiguity.

**Decision rights:** Operational agents decide and act, but only within their constraints. If they hit a boundary, they stop and escalate immediately.

**Higher bar for success:** Must have calibration data, proven measurement, and clear escalation triggers.

---

## Spec Template

Copy the sections below. Fill in each one. Aim for 2–4 pages.

---

### Header

```
Agent Name: [Name]
Type: [Guardian | Execution | Operational]
Owner: [Person name and role, e.g., "Sarah Chen, VP Engineering"]
Version: 1.0
Created: [Date]
Last Updated: [Date]
Review Date: [Date you'll re-assess this spec]
Slack Channel: [Where this agent posts]
Escalation Email: [Where urgent issues go]
```

---

### Change Log

**Purpose:** Track what's changed and why. Helps you understand which parts of the spec are stable vs. evolving.

```
| Version | Date | Change | Reason |
|---------|------|--------|--------|
| 1.0 | Feb 2025 | Initial spec | Agent kickoff |
| 1.1 | Mar 2025 | Widened decision boundary for routine tickets | 90% of escalations were low-risk |
| ... | ... | ... | ... |
```

---

### Startup Protocol

**Purpose:** When the agent wakes up or a new shift starts, what does it do first?

**Examples:**

*For an Execution agent (Sales Lead Scorer):*
```
1. Read 01_STATE/sales_watch_list.md (which accounts are under review?)
2. Check for new leads in the past 24 hours
3. Answer: "What should the sales team focus on today?"
4. Post summary to #sales-agent-daily
5. Wait for manual input or proceed with routine scoring
```

*For a Guardian agent (Compliance Monitor):*
```
1. Read 02_STRATEGY/compliance_strategy_docs/ for current constraints
2. Check logs for the past 24 hours
3. Compare against ruleset
4. If violations found: escalate immediately
5. If all clear: post daily summary to #compliance-ops
```

*For an Operational agent (Expense Processor):*
```
1. Read 01_STATE/expense_policy_version.md
2. Check queue for new submissions
3. Categorize by risk level
4. Process <$100 autonomous
5. Queue $100–$500 for manager review
6. Escalate >$500 to CFO
7. Post daily metrics to #finance-ops
```

**Guidance:**
- Make startup deterministic (same steps every time)
- Include a question the agent should answer ("What should the team focus on?")
- Include a communication step (where does output go?)
- Never start with "ask the user what to do" — agents should have agency

---

### Role Statement

**What:** One paragraph describing the agent's job in business terms.

**Example:**
```
The Engineering Architect Agent accelerates architecture decisions by analyzing
requirements, assessing technical trade-offs, and proposing solutions with clear
pros/cons. It reduces architecture decision latency from 2 weeks to 2 days by doing
initial analysis while waiting for engineer input. It does NOT decide alone — it
proposes and explains, and humans decide. It escalates technical risks to the CTO.
```

**Guidance:**
- Start with a verb: "accelerates", "reduces", "detects", "routes"
- Quantify the impact if possible ("2 weeks to 2 days")
- Make clear what it does and what it *doesn't* do
- Mention escalation

---

### Decision Boundary

**What:** What can the agent decide autonomously? What requires escalation? What is explicitly off-limits?

**Format:**

```
AUTONOMOUS DECISIONS (Operational agent only)
- [ ] Decision type: X
  Constraint: Only if Y and Z
  Example: [concrete example]
  Escalation trigger: [when to stop and ask for help]

- [ ] Decision type: B
  Constraint: Only if conditions hold
  Example: [example]
  Escalation trigger: [example]

REQUIRES APPROVAL (Execution or Guardian agents)
- [ ] Decision type: X
  Propose, but require human sign-off
  Example: [example of what you'd recommend + why]

EXPLICIT NON-DECISIONS (All agents)
- [ ] You do NOT decide [what]
- [ ] You do NOT [action]
- [ ] You do NOT access [resource]
```

**Concrete example (Operational Agent: Expense Processor):**

```
AUTONOMOUS DECISIONS
- Approve expense <$100 if receipt is clear and matches policy
  Constraint: Only if category is pre-approved (no new categories)
  Example: $45 office supplies with receipt → approve immediately
  Escalation trigger: Receipt is unclear, category is ambiguous, or request feels off

- Deny expense if clearly outside policy (e.g., personal item)
  Constraint: Only if policy is unambiguous (no judgment calls)
  Example: $200 personal gym membership → deny with reason
  Escalation trigger: Denial might be wrong (policy changed, exception request, etc.)

REQUIRES APPROVAL
- Any expense $100–$500: propose approval/denial with reasoning
  Example: "Recommend APPROVE $350 conference ticket because [reasons], but this
  goes to your manager for final sign-off"

- New expense categories (e.g., pet relocation): flag for policy review
  Example: Catch new category early, route to finance team

EXPLICIT NON-DECISIONS
- You do NOT decide compensation or bonus disputes
- You do NOT approve confidential/sensitive expenses without CFO review
- You do NOT access personal financial data beyond what's in the expense form
```

**Guidance:**
- Be specific. "Sometimes escalate" is not a decision boundary; "escalate if budget >$500" is.
- For Operational agents: at least 2 autonomous decision types
- For Execution agents: focus on REQUIRES APPROVAL and NON-DECISIONS
- For Guardian agents: focus on NON-DECISIONS and escalation criteria

---

### Governing Strategy Documents

**What:** Which strategy documents constrain this agent's decisions?

> **Note for original bootstrap users:** Your strategy documents may be named using RFC numbering (e.g., `RFC-102_Growth_and_Commercial_Logic.md`). This section applies equally — "strategy document" and "RFC" refer to the same thing.

**Example:**

```
- Strategy document: 02_STRATEGY/sales_qualification.md
  Impact: Defines what makes a "qualified lead" (this agent scores against these criteria)
  Conflict: None identified

- Strategy document: 02_STRATEGY/expense_policy_v3.md
  Impact: Defines approval thresholds and categories
  Conflict: None identified

- Strategy document: 02_STRATEGY/data_governance.md
  Impact: Defines what customer data this agent can access
  Conflict: Expense agent needs employee names (covered by policy)
```

**Guidance:**
- Link to actual strategy document files (or paste file names if not yet tracked)
- Explain how each document impacts this agent's decisions
- Flag conflicts early (if two documents pull in different directions, that's a spec problem)

---

### Required Inputs

**What:** What data, context, or signals does this agent need to operate?

**Format:**

```
Input: [Name]
Source: [Where it comes from: database, file, API, human input]
Frequency: [When it updates: real-time, daily, weekly, on-request]
Quality bar: [What's good enough?]
Escalation if missing: [What does the agent do if the input is unavailable?]

Input: [Name]
...
```

**Example (Sales Lead Scorer):**

```
Input: New leads from marketing
Source: Salesforce API
Frequency: Real-time (webhook on new lead)
Quality bar: Name, company, email, and one qualify field (pain point / budget / timeline)
Escalation if missing: Queue lead as "incomplete" and flag to marketing

Input: Sales playbook
Source: 02_STRATEGY/sales_qualification.md
Frequency: Daily read at startup
Quality bar: Clear criteria for scoring (not fuzzy)
Escalation if missing: Do not process leads; alert sales ops that playbook is out of sync

Input: Historical lead data (for calibration)
Source: Salesforce (past 6 months)
Frequency: Monthly refresh
Quality bar: At least 100 leads with outcomes (won/lost/stalled)
Escalation if missing: Fall back to template scoring; accuracy may be lower
```

**Guidance:**
- Include both operational inputs (data) and governance inputs (strategy documents, playbooks)
- For each input, define what "good" looks like
- Plan for graceful degradation (what if an input is unavailable?)

---

### Output Format

**What:** What does this agent produce? How should it be formatted?

**Example (Sales Lead Scorer):**

```
Daily summary report:
- Posted to #sales-agent-daily at 9 AM
- Format: Slack message with thread
  - Top 3 leads to pursue today (with scores 0–100)
  - Leads that need attention (stalled, unclear qualification)
  - Count of leads processed
  - Any flagged issues (incomplete data, policy violations, etc.)

Individual lead score (produced on-demand):
- Posted as reply in #sales-dev channel
- Format: JSON with fields:
  {
    "lead_id": "...",
    "name": "...",
    "score": 0–100,
    "reasoning": "Why this score",
    "recommended_action": "Contact now / nurture / queue",
    "risk_flags": "[list]",
    "confidence": "High / Medium / Low"
  }
- If score is <40 or >90: include explanation of outlier status
```

**Guidance:**
- Be specific about format (Slack, email, JSON, document?)
- Include frequency (daily, on-demand, real-time?)
- For scored decisions: always explain the score
- For guardian agents: output is usually escalation + context

---

### Evaluation Framework

**What:** How do you measure if this agent is working?

**Format:**

```
Success Metric: [What you're measuring]
Baseline: [Current state before agent]
Target: [Where you want to be]
Measurement method: [How you get the data]
Owner: [Who tracks this]
Cadence: [How often you measure]

---

Success Metric: [Next metric]
...
```

**Example (Sales Lead Scorer):**

```
Success Metric: Reduction in time-to-contact for high-value leads
Baseline: 3.2 days from lead arrival to first sales outreach
Target: <1 day for leads scored >75
Measurement: Query Salesforce for lead creation date vs. first activity date
Owner: Sales ops manager
Cadence: Weekly

---

Success Metric: Accuracy of lead scoring (calibration against human judgment)
Baseline: N/A (new agent)
Target: >85% agreement with sales reps on lead quality (within ±10 points)
Measurement: Every Friday, sales team scores 10 random leads independently; compare to agent
Owner: Sales manager + agent owner
Cadence: Weekly for first month, then monthly

---

Success Metric: Reduced noise in lead queue (fewer low-quality leads reaching reps)
Baseline: 40% of leads are "cold" (no engagement after 1 week)
Target: <20% of <50-score leads are cold
Measurement: Segment leads by agent score; track engagement by cohort
Owner: Sales ops
Cadence: Monthly

---

Success Metric: Agent uptime and reliability
Baseline: N/A
Target: 99.5% uptime; escalations resolved <30 min
Measurement: Monitor agent logs and error rates
Owner: Engineering
Cadence: Daily
```

**Guidance:**
- At least 3 metrics: one on speed/efficiency, one on accuracy, one on user satisfaction or outcome
- Include a baseline (measure the current state before deploying the agent)
- Be realistic about targets (85% accuracy is great; 100% probably means you're not measuring the right thing)
- Assign clear ownership

---

### Escalation Triggers

**What:** Specific conditions that cause the agent to stop and ask for help.

**Format:**

```
Trigger: [Condition]
Severity: [Critical / High / Medium / Low]
Action: [What the agent does]
Recipient: [Person or channel to escalate to]
Context: [What information to include in the escalation]

---

Trigger: [Next trigger]
...
```

**Example (Operational Agent: Customer Support):**

```
Trigger: Customer mentions safety concern or threatens self-harm
Severity: Critical
Action: Stop immediately; escalate to on-call manager
Recipient: #urgent-escalations + SMS to current manager
Context: Full transcript, customer name/contact, quote of safety concern

---

Trigger: Same issue has been escalated 3+ times in past 30 days
Severity: High
Action: Pause resolution attempts; escalate to product team
Recipient: #product-escalations + ticket to product manager
Context: List of all related tickets, pattern identified, customer impact

---

Trigger: Policy contradicts known customer agreement (e.g., customer has special SLA)
Severity: High
Action: Propose workaround; require manager approval before proceeding
Recipient: Manager via ticket comment (not urgent)
Context: Policy conflict, special agreement reference, proposed resolution

---

Trigger: Issue requires access to customer data outside agent's authorization
Severity: Medium
Action: Escalate to data governance team
Recipient: #data-access-requests
Context: Reason for access, data type, customer ID

---

Trigger: Agent confidence drops below 60% (using internal model score)
Severity: Medium
Action: Route to human instead of proposing solution
Recipient: Support queue (not escalation)
Context: Issue summary, confidence score, attempted analysis
```

**Guidance:**
- Critical triggers are always "escalate"; don't try to be clever
- Include at least one trigger for "agent is confused" or "confidence too low"
- Include at least one trigger for "pattern detected" (same issue repeatedly)
- Specify *who* receives the escalation (not just "notify someone")

---

### Decision Filter

**What:** When the agent is uncertain, how does it decide whether to act or escalate?

**This is your "break glass in emergency" logic.**

**Example:**

```
When uncertain about a decision:
1. Can I find precedent in prior tickets/decisions?
   → If yes and precedent is clear: follow precedent, document reasoning
   → If no or unclear: escalate

2. Does this fall within my governing strategy documents and constraints?
   → If yes, clearly: decide autonomously
   → If no or fuzzy: escalate

3. Is this a reversible decision (can the human undo it easily)?
   → If yes: decide autonomously, document reasoning, be ready to revert
   → If no (irreversible or hard to undo): escalate

4. What's the cost of being wrong?
   → Low risk (tags, requeues, routine categorization): decide
   → Medium risk (approval <$500, customer communication that's easy to correct): escalate to manager
   → High risk (approval >$500, customer data access, commitment to customer): escalate to senior person

5. Time pressure: how urgent is this?
   → If customer is waiting and decision is routine: decide (document + flag for review later)
   → If no time pressure: escalate when uncertain
```

**Guidance:**
- Make this deterministic (not "I have a gut feeling")
- Anchor to concrete factors: reversibility, cost of being wrong, time pressure
- Default to escalate when truly uncertain

---

### Interfaces with Other Agents

**What:** Does this agent hand off to other agents? Receive from them? Conflict with them?

**Example:**

```
Upstream agents (who feed into me):
- Sales Lead Qualifier: provides "qualified lead" flag that I use for scoring
  Handoff method: Salesforce field update (real-time)
  Conflict: None (I trust their qualification)

Downstream agents (who I feed):
- Customer Success Onboarding Agent: receives high-scoring leads that closed
  Handoff method: Message to #onboarding-agent channel
  Conflict: None (onboarding team manages the handoff)

Parallel agents (work in the same domain):
- Marketing Campaign Agent: creates new lead sources
  Coordination: I read their campaign labels to segment scoring
  Conflict: None (we both read same strategy documents about qualification)
```

**Guidance:**
- Map the full workflow (not just your part)
- Call out data dependencies and conflicts
- If there's ambiguity (who decides this?), escalate that to your owner

---

### Constraints

**What:** The hard guardrails. Things the agent absolutely cannot do.

**Format:**

```
Constraint: [What the agent cannot do]
Why: [Reason: regulatory, ethical, operational]
Consequence: [What happens if this boundary is violated]
Who enforces: [Who checks for violations]

---

Constraint: [Next constraint]
...
```

**Example (Operational Agent: Expense Processor):**

```
Constraint: Cannot approve expenses without an itemized receipt
Why: Audit trail requirement (SOX, financial controls)
Consequence: Expense is denied; flagged for manual review + receipt request
Who enforces: System automatically rejects; finance team audits monthly

---

Constraint: Cannot access or process sensitive expense categories (executive compensation, legal settlements, M&A-related)
Why: Confidentiality and conflict of interest
Consequence: Sensitive categories are removed from agent queue; routed directly to CFO
Who enforces: Admin team pre-filters queue; agent logs checked weekly

---

Constraint: Cannot modify expense after approval (can only deny or request correction)
Why: Audit trail integrity
Consequence: Design prevents modification; escalate to manager if correction is needed
Who enforces: System control (button is disabled)

---

Constraint: Cannot approve >$500 without secondary approval
Why: Risk and fraud control
Consequence: All >$500 expenses are queued for manager + CFO review regardless of other factors
Who enforces: System enforces double-approval before payment
```

**Guidance:**
- Include at least 3 constraints
- Label the *why* (regulatory, ethical, operational, etc.)
- Make enforcement explicit (system enforces? team audits? policy check?)

---

### Success Criteria

**What:** How do you know the agent is ready to go autonomous? When does it graduate?

**Example (Operational Agent: Expense Processor):**

```
Phase 1: Calibration (1–2 weeks)
- Agent processes 50 random expenses
- Finance team reviews 100% of agent decisions
- Accuracy bar: >90% agreement with human approvals/denials
- Go/no-go decision: Can we trust the agent on routine expenses?

Phase 2: Shadow mode (2 weeks)
- Agent processes real queue but doesn't auto-approve
- Human reviews 100% but agent action is pre-cleared
- Accuracy bar: >95% agreement
- Escalation triggers are tested (did agent escalate correctly?)
- Go/no-go decision: Ready to auto-approve routine <$100?

Phase 3: Gradual autonomy (4 weeks)
- Agent auto-approves <$100; manager reviews >$100
- Daily spot-checks of agent decisions
- Accuracy bar: >95% on approvals + appropriate escalation on <5% of total volume
- Go/no-go decision: Reduce review to 10% spot-check?

Phase 4: Autonomous operation (ongoing)
- Agent auto-approves <$500 without human review (pre-approval)
- Weekly audit of agent decisions
- Monthly accuracy check against sample
- Go/no-go decision: Can we widen autonomous boundary to <$750?
```

**Guidance:**
- Be concrete about graduation criteria (not "ready when it feels right")
- Include accuracy targets for each phase
- Plan for gradual widening of autonomy (not just "on/off")

---

## Common Pitfalls

**Pitfall 1: The spec is too vague**
- Bad: "Make good decisions"
- Good: "Approve expense <$100 if receipt is clear and category is pre-approved"
- Fix: Use the decision boundary section to get specific

**Pitfall 2: Escalation triggers are missing or too loose**
- Bad: "Escalate if something feels off"
- Good: "Escalate if confidence <60% OR if employee grade is Director+ OR if category is new"
- Fix: List 5+ concrete triggers

**Pitfall 3: No baseline data**
- Bad: "We'll measure accuracy after we launch"
- Good: "Current state: manual review takes 2 days; 15% error rate; we need <1 day and 5% error"
- Fix: Measure the current state before the agent exists

**Pitfall 4: Success criteria are unmeasurable**
- Bad: "Users are happy"
- Good: "Time-to-resolution: 2 days → <1 day; accuracy: 15% error → <5%; escalation rate <10%"
- Fix: Pick metrics you can actually measure today

**Pitfall 5: Agent scope is too wide**
- Bad: "This agent handles all financial decisions"
- Good: "This agent approves routine expenses <$500 with clear policy categorization; escalates ambiguous or high-risk items"
- Fix: Define boundaries; narrow the scope

**Pitfall 6: No plan for change**
- Bad: "This spec is final"
- Good: "We'll review this spec every 90 days; it will change based on what we learn"
- Fix: Build in a review date; plan for version 2.0

---

## Using This Template

1. **Start small.** Don't try to fill every section at once. Do Header → Role Statement → Decision Boundary first.

2. **Iterate with stakeholders.** Share your draft with the person the agent reports to + one key user. Get feedback on decision boundaries and escalation triggers.

3. **Run a spike.** Before building the full agent, run a small pilot (human does the agent's job for 1 week). Use that to refine the spec.

4. **Measure the baseline.** Before the agent goes live, measure the current state on your success metrics.

5. **Deploy in phases.** Don't go from "no agent" to "fully autonomous" overnight. Use calibration → shadow → gradual autonomy → autonomous operation.

6. **Review regularly.** Set a 90-day review date. Update the spec based on what you learned.

---

## Quick Checklist Before Launching

- [ ] All sections filled in (no TBD placeholders)
- [ ] Role statement is clear and honest about what the agent can/cannot do
- [ ] At least 5 escalation triggers defined
- [ ] Success metrics have baseline + target
- [ ] Evaluation owner is named
- [ ] Governing strategy documents are linked (no orphaned agents)
- [ ] Decision boundary is specific enough that someone could code it
- [ ] Startup protocol is deterministic (same steps every time)
- [ ] Constraints are enforceable (system or human checks them)
- [ ] Review date is set (suggest 90 days)
