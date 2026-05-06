# RFC Quality Checklist

**Author:** Tim Barker
**Purpose:** Universal checklist for assessing RFC (Request for Comments) maturity across any business domain.

---

## Overview

An RFC is your durable constraint document. It answers: "What problem are we solving? Who decides? What's the governing framework? When are we done?"

This checklist helps you move an RFC from rough draft (Skeletal) to production-ready (Operational). The goal is **Operational at minimum** — a document that survives contact with reality and can guide agent decision-making.

---

## Mandatory Sections (7)

Every RFC must contain these sections. If a section is genuinely not applicable, document *why* explicitly.

### 1. Context
**What:** The business situation, problem, or opportunity that triggered this decision.

**Good looks like:**
- Specific, fact-based description of what changed or what's broken
- Quantified if possible (revenue impact, volume of errors, customer complaints, time spent)
- Links to related decisions, incidents, or strategy
- One or two paragraphs max

**Red flags:**
- Vague ("we need to improve things")
- Assumes reader knows the situation
- Mixes problem statement with proposed solution
- No evidence or data

**Quality indicators (good → great):**
- States the problem clearly enough that someone unfamiliar with your org understands it
- Quantifies impact (e.g., "3 deals lost last quarter due to X")
- References prior discussions or incidents
- Explains *why now* (what changed?)

---

### 2. Governing Framework
**What:** The principles, standards, or constraints that shape your decision.

**Examples:**
- Regulatory: SOC2, GDPR, HIPAA equivalents, industry-specific rules
- Ethical: diversity and inclusion standards, environmental commitments, customer privacy principles
- Financial: margin targets, growth rate constraints, budget caps
- Operational: uptime SLAs, response time targets, accessibility standards

**Good looks like:**
- Explicit list of rules that *constrain* the solution
- For each rule, explain the consequence if violated
- Some constraints inherited (legal), some chosen (values)

**Red flags:**
- No constraints mentioned (everything is a trade-off)
- Constraints that can't be measured
- Governing framework conflicts with stated problem

**Quality indicators:**
- At least 3 constraints that genuinely eliminate some options
- Constraints can be measured or audited
- Clear hierarchy (legal > ethical > operational)

---

### 3. Scope & Boundaries
**What:** Exactly what this RFC covers — and equally important, what it explicitly does NOT cover.

**Good looks like:**
- "This RFC covers X, Y, Z"
- "Explicitly out of scope: A, B, C"
- Clear boundaries that prevent scope creep
- If there are dependencies (another team's work), name them

**Red flags:**
- No boundaries stated
- Scope creep over 3+ revisions
- Depends on decisions not yet made

**Quality indicators:**
- Someone could read this and clearly know what falls in/out
- Dependencies explicitly listed
- Phasing plan if multi-phase

---

### 4. Decision Rights
**What:** Who decides? Under what conditions? What level of disagreement is acceptable?

**Models:**
- **Ownership:** Single person owns the call (and consequences)
- **Consensus:** Must agree (usually small groups; risky for large orgs)
- **Consultative:** One person decides, but must gather input first
- **Voting:** Majority or supermajority rules
- **Delegated:** Decentralized — multiple people decide in their domain

**Good looks like:**
- Names a person/role who has final say
- Explains their authority (why them?)
- Outlines consultation process (who must be asked?)
- States what happens if stakeholders disagree ("I'll listen, then decide")

**Red flags:**
- No clear owner
- Owner lacks authority to execute
- No process for resolving disagreement
- "Let's discuss and see" (not a decision right)

**Quality indicators:**
- Decision owner is named, not by role (actually Tim, not "the VP of Engineering")
- Process for gathering input is explicit
- Escalation path if decision fails

---

### 5. Success Criteria
**What:** How will we know the decision worked?

**Good looks like:**
- 3–5 measurable outcomes
- Baseline + target (e.g., "reduce order latency from 2.3s to <1.5s within 6 months")
- Lead and lag indicators (e.g., "code coverage >80%" is a lead indicator; "customer escalations <5/week" is lag)
- Timeline for measurement
- Who measures it

**Red flags:**
- Unmeasurable ("team is happier")
- No baseline (how do we know we improved?)
- Timeline is vague
- Depends on external factors you can't control

**Quality indicators:**
- Distinct lead and lag indicators
- Both quantitative and qualitative (e.g., "NPS +5 points AND zero escalations about X")
- Clear ownership of measurement
- Realistic timeline

---

### 6. Current State Assessment
**What:** Where are you today? What have you already tried?

**Good looks like:**
- Honest assessment of what's working and what isn't
- Prior decisions or experiments that inform this RFC
- Constraints or debts from legacy decisions
- Stakeholder positions (who wants what)

**Red flags:**
- Pretends current state is worse than it is
- Ignores successful adjacent work
- Assumes you're starting from zero
- Doesn't acknowledge political/organizational friction

**Quality indicators:**
- References specific incidents, data, or prior decisions
- Acknowledges what's working (don't build on failed assumptions)
- Explains why prior approaches didn't work
- Names key stakeholders and their concerns

---

### 7. Regulatory/Compliance Anchors
**What:** Which laws, standards, accreditations, or certifications constrain this decision?

**Good looks like:**
- Specific: cite the actual rule or standard (e.g., "SOC2 CC6.1 requires encryption of data at rest")
- Impact: what does compliance mean for the technical choice?
- Gaps: if compliance is incomplete, say so
- Review date: when should this be re-assessed?

**Red flags:**
- "We need to be compliant" (with what?)
- Compliance is mentioned but not detailed
- No linkage between compliance and the actual decision
- Ignores conflicting standards (GDPR vs. US law, etc.)

**Quality indicators:**
- At least one regulator/standard mentioned
- Clear linkage to specific clauses or requirements
- Explains the business consequence of non-compliance
- Identifies who is accountable for ongoing compliance

---

## Maturity Levels

Use this scale to assess where an RFC sits, and what work remains.

### Level 1: Skeletal
*A rough draft. Useful for internal brainstorm, not ready for decision.*

**Characteristics:**
- Problem is stated but not quantified
- No clear decision owner
- Success criteria are vague
- Constraints are implied, not explicit
- Regulatory/compliance impact unknown or unmapped

**Time to upgrade:** 2–4 days of focused work

**Next steps:**
1. Get specific: replace "improve X" with "reduce X from Y to Z by [date]"
2. Name an owner
3. List constraints (what can't we do?)
4. Check regulatory box (even if "no applicable constraints")

---

### Level 2: Functional
*Enough information to make a decision. The RFC won't survive all friction, but it's decision-ready.*

**Characteristics:**
- Problem is clear and quantified
- Decision owner is named
- Success criteria are measurable
- Constraints are listed (even if not exhaustive)
- Current state is honestly assessed
- Someone has mapped regulatory impact

**Time to upgrade:** 1–2 weeks of stakeholder alignment and testing

**Next steps:**
1. Pressure-test with key stakeholders (do they genuinely buy this?)
2. Run a small-scale pilot or spike if decision is reversible
3. Harden success criteria with measurement owners
4. Document any decisions you make *during* alignment (those become precedent)

---

### Level 3: Operational
*Production-ready. This RFC can guide autonomous agents and survive real-world execution.*

**Characteristics:**
- All 7 mandatory sections are present and substantive
- Constraints are explicit and measurable
- Success criteria have baseline data and owner accountability
- Current state assessment includes stakeholder perspectives
- Regulatory/compliance mapping is complete
- Decision rights are clear (consultative process documented)
- Scope boundaries prevent creep

**How to know you're here:**
- An agent could read it and understand the bounds of its decision-making
- A new team member could read it and explain the decision to a customer
- You could measure success 6 months later without renegotiating the criteria

**Time to achieve:** 2–4 weeks typically (depends on complexity)

**How to get here:**
1. Gather feedback on the Functional version from 3+ stakeholders
2. Update constraints based on what you learn
3. Run a pilot with measurement (even small)
4. Document what changed and why
5. Get explicit sign-off from decision owner and key stakeholders

---

### Level 4: Calibrated
*Mature and evolved. The RFC has been tested in practice and refined based on real outcomes.*

**Characteristics:**
- All of Level 3, plus:
- Actual measurement data from earlier phases (not just projections)
- Constraints have been pressure-tested and either held or were updated
- Stakeholder consensus includes those who initially disagreed
- Lessons learned from implementation are documented
- Success criteria were either met or renegotiated (with documented reasoning)

**When to aim here:**
- Only for high-stakes or long-running decisions (org structure, major platforms, compliance frameworks)
- For agent RFCs that will drive autonomous decisions at scale

**Time to achieve:** 6+ months in operation, with continuous feedback loops

---

## Red Flags by Section

A quick mental checklist while drafting or reviewing:

| Section | Red Flag | Fix |
|---------|----------|-----|
| **Context** | "Everyone knows this problem" | Write it down. Quantify it. |
| **Governing Framework** | No constraints listed | Every decision has trade-offs. Name at least 3. |
| **Scope** | "We'll figure it out as we go" | Define boundaries now. Out-of-scope items go on a watch list. |
| **Decision Rights** | "Let's talk and decide together" | Name one owner. Define consultation. |
| **Success Criteria** | "We'll know it when we see it" | Measure baseline today. Set target. Name accountable party. |
| **Current State** | Only lists problems, not what's working | Call out what's already good. Build on it. |
| **Regulatory/Compliance** | Not mentioned at all | Explicitly state if not applicable. Don't assume. |

---

## Quality Indicators Checklist

Before publishing an RFC, ask:

**Clarity:**
- [ ] Someone from another department could understand this
- [ ] No jargon without explanation
- [ ] Links between sections make sense (decision rights align with owner, constraints inform success criteria)

**Completeness:**
- [ ] All 7 sections present
- [ ] Constraints and success criteria are measurable
- [ ] Owner is named, not by title
- [ ] Timeline is explicit

**Pressure-tested:**
- [ ] At least one key stakeholder who might disagree has reviewed it
- [ ] Current state includes perspectives other than the decision owner
- [ ] Regulatory constraints have been checked (even if "none")
- [ ] You can explain the trade-offs you made

**Governance:**
- [ ] Signed off by decision owner
- [ ] Stakeholders know where this RFC lives and when to revisit it
- [ ] Review date is set (suggest 6–12 months for operational RFCs)

---

## Upgrading an Existing RFC

Start with a table:

| Section | Current Level | Gap | Work Needed |
|---------|---------------|-----|-------------|
| Context | Functional | No data | Add 3 quantified examples |
| Decision Rights | Skeletal | No owner | Name person + consultation process |
| Success Criteria | Functional | Vague targets | Get baseline data today |
| ... | ... | ... | ... |

Pick the 2–3 highest-impact gaps and fix those first. You don't need perfection to move to Operational; you need *good enough to decide and measure*.

---

## Using This Checklist in Practice

**For individuals:**
1. Draft the RFC in whatever format feels natural
2. Run it through this checklist (which sections are weakest?)
3. Spend 80% of your editing time on those sections
4. Share with decision owner + 2–3 key stakeholders
5. Iterate based on feedback

**For teams:**
1. Establish a standard review cadence (weekly, bi-weekly)
2. Use this checklist as your shared language
3. Track RFCs by maturity level (what's at Skeletal? What's ready to move to Operational?)
4. Celebrate moving RFCs to Operational (it means the decision is locked in and can be measured)

**For agents:**
- Agents should read only Operational+ RFCs
- Agents use RFCs to understand constraints, success criteria, and decision boundaries
- If an agent encounters a situation that violates an RFC's constraints, it escalates immediately
