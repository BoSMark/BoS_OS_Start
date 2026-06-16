# Agent Spec Examples — Run Layer Walkthroughs

**Status:** Final for v2.2.3  
**Purpose:** Three concrete examples of the Run layer agents in action, so new users understand when to use each one

---

## Overview

The Run layer has three agents:
- **Mission Shaper** — coaches a rough idea into a sharp, measurable brief
- **Agent Planner** — staffs the mission and specs the agent team
- **Delivery Manager** — drives each deliverable from goal to running system

This document shows what each one actually does, using real scenarios.

---

## Example 1: Mission Shaper — "We need to fix our onboarding"

### The Setup

You're running a SaaS company. Onboarding is slow — customers are hitting the product confused, and you're losing them in week one. You know this is a problem, but you haven't framed it as a mission yet.

You open your BB BoS OS and say:

> "We need to fix our onboarding. It's taking too long and people are dropping off."

### What Mission Shaper Does

Mission Shaper asks you questions to turn this vague problem into a sharp, measurable brief. It doesn't do the thinking for you — it forces you to do it.

**Mission Shaper's questions:**

1. "What's the outcome you're after? Not 'fix onboarding' — what does success look like? Faster time to first activation? Higher week-one retention? Fewer support tickets?"

   *You answer:* "Week-one activation rate from 40% to 70%."

2. "How long are we giving this? Is this a sprint, a quarter, or ongoing?"

   *You answer:* "8 weeks. I want to see movement by Q3."

3. "Is this a discovery mission (figure out what's wrong) or execution (implement a fix)?"

   *You answer:* "We know what's wrong — the product tutorial is boring. This is execution."

4. "Who's on the team? Do you need product, design, marketing, or just engineering?"

   *You answer:* "Product lead (me), one engineer, design."

5. "What could break this? What's the risk if we get it wrong?"

   *You answer:* "If we make onboarding shorter but less effective, activation goes up but churn gets worse. We need to measure both."

### The Output

Mission Shaper produces a `MISSION_BRIEF.md`:

```markdown
# Mission Brief — Improve Week-One Activation

**Goal:** Increase week-one activation rate from 40% to 70%

**Scope:** Redesign and rebuild the product onboarding experience

**Timeline:** 8 weeks (Q3)

**Team:** Product lead (you), 1 engineer, 1 designer

**Success Criteria:**
- Week-one activation: 40% → 70%
- Week-one churn: maintain or improve
- Time to first meaningful action: reduce from 15 min to < 5 min

**Risks:**
- Faster onboarding could reduce learning, increasing later churn
- Mitigation: track week-2 and week-4 retention alongside week-1 activation

**Voice:** This is a high-priority, time-bound execution mission. Non-negotiable success criteria. Report weekly.
```

**Why this matters:** You went from "we need to fix onboarding" to a mission the entire team understands, with clear success criteria and built-in risk mitigation.

---

## Example 2: Agent Planner — "We're launching a new pricing model"

### The Setup

You have a sharp mission brief: launch a new pricing model that increases annual contract value (ACV) by 25% without losing customers. You have a team of 5 people. Now you need to figure out: who does what, and in what order?

You tell Agent Planner:

> "We're launching new pricing. ACV target is +25%. We have 4 weeks. Team: me (CEO), product lead, two engineers, one customer success person."

### What Agent Planner Does

Agent Planner takes the mission and builds the agent roster — not task lists, but *competency roles*. Each person needs to understand their role, decision boundary, and what success looks like.

**Agent Planner's questions:**

1. "Let's start with the product lead role. What decisions can they make alone? What needs your approval?"

   *You answer:* "They can design the new tiers. They need my approval before they talk to customers about pricing."

2. "The two engineers — are they building the billing system, or are they supporting the product lead's changes?"

   *You answer:* "Billing system. The product lead owns tier design; engineers own implementation."

3. "Customer success person — what's their role here?"

   *You answer:* "Gather feedback from power users before launch. Test the model with 5 customers. Flag any issues."

4. "What's the blockers? What could go wrong?"

   *You answer:* "Legal needs to approve the contract terms. We don't have time to wait."

### The Output

Agent Planner produces `agent_specs/` with three roles:

```markdown
# Agent Spec: Product Lead — Pricing Model Launch

**Role:** Product owner for pricing model design and customer communication

**Decision Boundary:**
- CAN decide: tier structure, feature mapping, naming
- CAN prepare: customer communication, go-live timeline
- MUST ESCALATE: contract terms (legal), pricing numbers (CEO approval), customer conversations (CEO leads)

**Evaluation Criteria:**
- Is the tier structure clear and defensible?
- Did you get customer feedback before finalizing?
- Are contract terms approved by legal?

---

# Agent Spec: Engineers — Billing System Implementation

**Role:** Build the billing system to support the new pricing tiers

**Decision Boundary:**
- CAN decide: technical architecture, implementation timeline
- MUST ESCALATE: changes to pricing logic, contract requirements, go-live date

**Evaluation Criteria:**
- Is the system ready for launch on [date]?
- Does it handle all tier transitions correctly?
- Are refunds and prorations handled correctly?

---

# Agent Spec: Customer Success — Model Validation

**Role:** Test the new pricing model with power users and flag issues

**Decision Boundary:**
- CAN decide: which customers to test with, feedback questions
- MUST ESCALATE: any customer who says "this will make us leave", legal/contract issues

**Evaluation Criteria:**
- Did you get feedback from 5 customers?
- Were any showstoppers identified?
- Is the feedback documented?
```

**Why this matters:** Now each person knows what decisions are theirs, what needs approval, and how you'll know they succeeded. No ambiguity.

---

## Example 3: Delivery Manager — "Ship the Q3 product roadmap"

### The Setup

You have a roadmap: three features, 12 weeks, team of 8. You need something to drive this from start to finish, keep people unblocked, and know when things are actually done.

You tell Delivery Manager:

> "Q3 roadmap: feature A (4 weeks), feature B (6 weeks), feature C (4 weeks), overlap where possible. Team: 8 people. I need weekly status and immediate escalation if we're at risk."

### What Delivery Manager Does

Delivery Manager runs a repeatable cadence: standup, pull work, identify blockers, move things to done, wrap up. Its job is to keep you at decision altitude and out of the weeds.

**Delivery Manager's weekly rhythm:**

**Monday standup:**
> "Status on Q3 roadmap: Feature A is 60% done (on track). Feature B hit a blocker on API design (waiting on your decision). Feature C is scoped but not started. Blockers: 1 (API decision). At risk: none."

**Your decision:** "For Feature B — go with option 2 (simpler, ships faster)."

**Wednesday pull:**
> "Feature A team pulled 3 tasks this week. Feature B unblocked and pulled 2 tasks. Feature C started. Zero blockers. Green across the board."

**Friday wrap:**
> "Weekly summary: 8 tasks completed, 5 in progress, 2 ready to start next week. Feature A tracking to hit the 4-week target. Feature B recovered from blocker, now 1 week behind (will be caught by week 10). Feature C on track."

### The Output

Delivery Manager maintains a simple tracking structure:

```markdown
# Q3 Roadmap — Delivery Status

**Standup Schedule:** Mondays 10am  
**Status Cadence:** Weekly summary Friday  
**Decision SLA:** 24 hours for blockers

## Feature A: [Name]
- **Owner:** [Person]
- **Target:** Week 4
- **Status:** 60% complete
- **Blockers:** None
- **At risk?** No

## Feature B: [Name]
- **Owner:** [Person]
- **Target:** Week 6
- **Status:** 40% complete, was blocked on API decision (resolved)
- **Blockers:** None (resolved Monday)
- **At risk?** Behind by 1 week, recoverable

## Feature C: [Name]
- **Owner:** [Person]
- **Target:** Week 4
- **Status:** Just started
- **Blockers:** None
- **At risk?** No
```

**Weekly log:**

```markdown
## Week 1 (Jun 16-22)
- Completed: 8 tasks (Features A: 5, B: 2, C: 1)
- In progress: 5 tasks
- Blockers flagged: 1 (API decision for Feature B) — RESOLVED Monday
- Decision turnaround: 24 hours

## Week 2 (Jun 23-29)
- Completed: 7 tasks (Features A: 3, B: 3, C: 1)
- In progress: 6 tasks
- Blockers flagged: 0
- Decision turnaround: N/A
```

**Why this matters:** You're not in the weeds asking "where's feature B?" You get a weekly picture, know immediately when something's at risk, and make decisions as they come up. Delivery Manager keeps the whole thing moving.

---

## When to Use Each Agent

| Agent | Use when | Output |
|-------|----------|--------|
| **Mission Shaper** | You have a problem but haven't framed it as a mission | Mission Brief — sharp, measurable goal with success criteria |
| **Agent Planner** | You have a mission and need to staff the team | Agent specs — roles, decision boundaries, evaluation criteria |
| **Delivery Manager** | You have a team working and need to drive to completion | Weekly status, blockers, decisions, task tracking |

**Typical flow:**
1. Run Mission Shaper (1–2 hours, produces brief)
2. Run Agent Planner (1–2 hours, produces agent specs)
3. Run Delivery Manager (ongoing, 30 min per week)

---

## Notes for Using These Examples

- These are realistic scenarios. Adapt them to your actual missions.
- Mission Shaper's value is in forcing you to think clearly, not in the agent doing the thinking.
- Agent Planner's value is in removing ambiguity about who decides what.
- Delivery Manager's value is in consistency — same rhythm every week, so nothing falls through cracks.
