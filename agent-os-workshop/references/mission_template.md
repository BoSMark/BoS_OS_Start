# Mission Plan Template

**Author:** Tim Barker, Mark Littlewood and Business of Software
**Purpose:** Universal template for defining a time-bound execution mission (deployment of an agent into production).

---

## Overview

A **mission** is a time-bound execution plan. It answers: "How do we deploy this agent safely and confirm it works?"

A mission takes an agent from spec to production through five phases:
1. **Single-case calibration** — Does the agent understand the job?
2. **Small batch training** — Can it handle variety?
3. **Blind test** — Is it right when we don't know the answer?
4. **Batch deployment** — Does it scale?
5. **Autonomous operation** — Can it run without us?

Each phase produces evidence. You don't proceed to the next phase until you have that evidence.

---

## Why This Matters

Deploying an agent without a mission plan is like shipping code without tests. You *might* get lucky. You probably won't.

A mission plan forces you to:
- **Define "good"** before you start (ground truth)
- **Measure baseline** (where are we today?)
- **Test in small batches** (catch problems early)
- **Plan escalation** (what goes wrong?)
- **Celebrate graduation** (agent is ready for production)

---

## Mission Template

---

### Mission Statement

**What:** One paragraph describing the mission objective in business terms.

**Format:**
```
Objective: [What you're trying to accomplish]
Agent: [Agent name]
Timeline: [When do you want this done?]
Success means: [How you'll know it worked]
```

**Example:**
```
Objective: Deploy the Engineering Architecture Agent to accelerate architecture
decisions and reduce decision latency from 2 weeks to 2 days.

Agent: Engineering Architecture Agent (v1.0)

Timeline: 8 weeks (calibration through autonomous operation)

Success means: Agent proposes architectures with >85% alignment to senior engineer
judgment; proposals are made within 48 hours of requirement receipt; escalations
happen correctly (agent defers on novel/risky decisions).
```

**Guidance:**
- Keep it to one paragraph
- Include the agent version
- Quantify the goal if possible ("2 weeks to 2 days")

---

### Hard Constraints (Mission-Level)

**What:** Constraints specific to this mission, beyond what the agent spec already defines.

**These are often project constraints, not agent constraints.**

**Example:**

```
- Must complete calibration by end of Q1 (regulatory audit in April)
- Cannot access production customer data until SOC2 audit is complete
- All outputs must be reviewed by at least one engineer before publication
- Escalations must be acknowledged by on-call engineer within 30 minutes
```

**Guidance:**
- List 3–5 constraints
- These should be harder/more specific than the agent spec
- These are often organizational (timeline, compliance, review burden)

---

### Phase Structure

**What:** The five-phase rollout plan with entry/exit criteria.

Use this structure for each phase:

```
## Phase [N]: [Phase Name]

**Duration:** [weeks]
**Start criteria:** [What needs to be true to start]
**End criteria:** [What needs to be true to proceed to next phase]

### Setup
[What you do to prepare]

### Execution
[What happens during the phase]

### Measurement
[How you evaluate success]

### Decision Point
[Proceed / iterate / abort?]

---
```

#### Phase 1: Single-Case Calibration

**Purpose:** Confirm the agent understands the job (accuracy on a handful of known examples).

**Example Mission: Engineering Architecture Agent**

```
## Phase 1: Single-Case Calibration

Duration: 1 week

Start criteria:
- Agent spec is approved by VP Engineering
- 5 sample requirements are selected (mix of simple and complex)
- Ground truth decisions are captured from senior architect (Priya)

End criteria:
- Agent has scored all 5 cases
- Accuracy is >90% (agent's recommendation matches ground truth in 5/5 cases)
- OR we've identified specific misalignment and can adjust agent behavior

### Setup
1. VP Engineering selects 5 representative requirements (mix: 3 simple, 2 complex)
2. Senior architect (Priya) scores each case: "What architecture would I recommend? Why?"
3. Document Priya's reasoning as "ground truth"
4. Agent receives the same requirements (without seeing Priya's answer)

### Execution
Agent processes 5 requirements independently. For each case, produces:
- Proposed architecture (high-level design)
- Key trade-offs (what would we gain/lose with this approach?)
- Risk assessment (what could go wrong?)
- Confidence level (0–100%)

### Measurement
Compare agent output to Priya's ground truth:
- Does agent propose the same architecture? (Exact match = yes/no)
- Does agent identify the same trade-offs? (Similarity score: 0–100%)
- Does agent flag the same risks? (Count of matching risk categories)

Success target: >90% alignment on all three dimensions for all 5 cases.

### Evaluation Rubric
```
Aspect          | Excellent (100)   | Good (75)         | Fair (50)         | Poor (<50)
Alignment       | Exact match       | Same direction,   | Same approach,    | Different approach
                | on architecture   | different details | wrong tradeoffs   | entirely
Trade-off ID    | All key trade-offs| 80% of key        | 50% of key        | <50% identified
                | identified + ranked| tradeoffs found   | tradeoffs found   |
Risk flagging   | All major risks   | 80% coverage      | 50% coverage      | <50% or major miss
                | flagged + assessed|                   |                   |
Reasoning       | Clear, specific   | Mostly clear      | Somewhat vague    | Unclear/confusing
```

### Decision Point
```
If accuracy is >90%: Proceed to Phase 2
If accuracy is 70–90%: Run 5 more cases (retrain on feedback, then re-test)
If accuracy is <70%: STOP; redesign agent spec or reconsider feasibility
```

---
```

**Guidance for Phase 1:**
- Keep the sample size small (3–10 cases)
- Use known cases where you have expert judgment
- Document the expert's reasoning (this is your ground truth)
- If you pass: move to Phase 2
- If you fail: take 1 week to understand why, then restart Phase 1

---

#### Phase 2: Small Batch Training

**Purpose:** Confirm the agent can handle variety without overfitting to the Phase 1 cases.

**Example:**

```
## Phase 2: Small Batch Training

Duration: 2 weeks

Start criteria:
- Phase 1 accuracy is >90%
- 20–30 new test cases are prepared (more variety: new requirement types, edge cases)
- Expert (Priya) has scored all cases in advance

End criteria:
- Agent accuracy on new batch is >85%
- Escalation triggers work (agent correctly defers on novel/risky cases)
- Feedback loop works (can we improve agent based on mismatches?)

### Setup
1. Team identifies 20–30 representative requirements (more variety than Phase 1)
2. Priya scores all 20–30 cases and documents reasoning
3. Agent doesn't see Priya's answers
4. Agent is run on all cases with real-time feedback (scores on each case, then learns)

### Execution
Daily cycle:
- Agent processes 5–10 cases
- Team compares to ground truth and provides feedback
- Agent adjusts prompting/weighting based on feedback
- Repeat until batch is complete or accuracy plateau is reached

### Measurement
Success metrics:
- Accuracy on new batch (>85% alignment)
- Consistency (does agent score similar cases consistently?)
- Escalation rate (what % defer to human? Target: 10–15%)
- Time-to-decision (how long per case? Target: <10 min)

### Decision Point
```
If accuracy is >85% AND escalation triggers work: Proceed to Phase 3
If accuracy is 70–85%: Run another batch of 10 cases; tighten feedback loop
If accuracy is <70%: STOP; redesign or halt mission
```

---
```

**Guidance for Phase 2:**
- Increase sample size and variety
- Use real feedback to improve the agent (this is where you calibrate)
- Track escalation triggers (did agent defer when it should?)
- If you hit a plateau, stop and reassess rather than forcing it

---

#### Phase 3: Blind Test

**Purpose:** Confirm the agent is right when neither the team nor the agent knows the answer in advance.

**Example:**

```
## Phase 3: Blind Test

Duration: 2 weeks

Start criteria:
- Phase 2 accuracy is >85%
- 10–15 blind test cases are prepared
- These cases have been decided by expert in advance, but agent hasn't seen them

End criteria:
- Agent accuracy on blind cases is >80%
- No systematic bias (agent isn't overconfident on easy cases, overly deferring on hard ones)
- Agent is ready for production deployment

### Setup
1. Team/Priya prepares 10–15 test cases
2. Cases are marked "blind test" — agent doesn't know they're test cases
3. Cases are injected into the workflow randomly (not batched)
4. Agent processes them as if they're real (no special handling)
5. After agent finishes, we compare to expert judgment

### Execution
- Agent processes blind cases over 2 weeks alongside normal work
- No feedback given during Phase 3 (agent doesn't know it's being tested)
- Weekly check-in: are cases flowing? Any issues?

### Measurement
Success metrics:
- Accuracy: >80% alignment with expert judgment
- Confidence calibration: agent's confidence score correlates with accuracy
  (i.e., high-confidence cases are more accurate than low-confidence cases)
- No systematic errors (e.g., agent isn't always favoring one architecture type)

### Decision Point
```
If accuracy is >80% AND confidence is well-calibrated: Proceed to Phase 4
If accuracy is 65–80%: Run another blind batch of 10 cases; investigate bias
If accuracy is <65%: STOP; go back to Phase 2 or redesign
```

---
```

**Guidance for Phase 3:**
- This is where you catch calibration issues
- Watch for confidence calibration (does the agent know when it's guessing?)
- Look for systematic bias (does it always pick the same solution?)
- If it passes: you're ready for production

---

#### Phase 4: Batch Deployment

**Purpose:** Run the agent on real workflow at scale and monitor for problems.

**Example:**

```
## Phase 4: Batch Deployment

Duration: 4 weeks

Start criteria:
- Phase 3 blind test accuracy is >80%
- Production infrastructure is ready
- Escalation process is live (who handles escalations?)
- Monitoring dashboard is set up

End criteria:
- Agent has processed 50+ real cases
- Accuracy on real cases is >80% (compared to follow-up human review)
- Escalation rate is 10–15%
- No unhandled errors or system crashes
- Team is confident in daily operation

### Setup
1. Agent is deployed to staging environment
2. Real requirements start flowing to agent
3. Human team continues doing the work in parallel (shadow mode)
4. Agent's output is reviewed before publication (not autonomous yet)
5. Monitoring is live (logs, errors, escalations tracked)

### Execution
Daily:
- Agent processes cases and produces recommendations
- Human team reviews recommendations (yes/no/modify)
- Accuracy is measured (comparison to what human would have done)
- Any errors are logged and investigated

Weekly:
- Team meets to review escalations (did agent escalate correctly?)
- Performance metrics are reviewed (accuracy, speed, error rate)
- Feedback is given to agent owner (what's working? what needs adjustment?)

### Measurement
Success metrics:
- Real-case accuracy: >80% (human agrees with agent recommendation)
- Escalation appropriateness: >90% of escalations are legitimate
  (agent didn't defer unnecessarily)
- Coverage: agent handles 80%+ of incoming cases
- Latency: agent produces recommendations within SLA (e.g., within 2 hours)
- Reliability: <0.1% unhandled errors per case

### Decision Point
```
If metrics are green: Proceed to Phase 5 (autonomous operation)
If metrics are mixed (e.g., accuracy is good but escalation rate too high):
  Tune escalation triggers; run Phase 4 for additional 2 weeks
If metrics are poor: STOP; investigate root cause; may need Phase 3 revisit
```

---
```

**Guidance for Phase 4:**
- This is your first exposure to real data at scale
- Expect to find edge cases you didn't anticipate
- Watch escalation triggers (are they firing when they should?)
- Don't rush to Phase 5; run Phase 4 until you're confident

---

#### Phase 5: Autonomous Operation

**Purpose:** Agent runs without human review; human spot-checks for quality and drift.

**Example:**

```
## Phase 5: Autonomous Operation

Duration: Ongoing

Start criteria:
- Phase 4 metrics are all green
- Escalation process is proven reliable
- On-call coverage is in place (who handles escalations?)
- Monitoring is live and alerting works

Ongoing criteria:
- Accuracy remains >80% (weekly audit)
- Escalation rate stays within bounds
- Agent is available 99.5% of the time
- No critical bugs or unhandled edge cases

### Setup
1. Agent is deployed to production (fully autonomous)
2. Human escalations are handled by on-call engineer
3. Weekly spot-check of 5 random cases (compare to expert judgment)
4. Monthly accuracy measurement (sample 50 cases)
5. Dashboard shows real-time metrics

### Execution
- Agent runs without human pre-approval
- Cases that hit escalation triggers are routed to on-call
- Weekly/monthly measurements track accuracy and health

### Monitoring
Key metrics tracked daily:
- Cases processed (volume)
- Escalation rate (%)
- Error rate (<0.1%)
- Escalation resolution time (<30 min)
- Weekly accuracy spot-check

### Decision Points
Weekly:
- All metrics green: Continue operation
- Escalation rate >20%: Investigate
- Accuracy drops below 75%: Investigate
- Error rate >0.5%: Alert to on-call

Monthly:
- Review accuracy against baseline
- Assess if escalation triggers need adjustment
- Identify patterns (cases agent struggles with)
- Decide: continue as-is / tune / expand autonomy / contract autonomy

### Expansion Opportunities
Once agent is stable in Phase 5:
- Can we widen the autonomous decision boundary?
  (e.g., approve more complex cases without human review?)
- Can we increase autonomy to other teams/workflows?
- Can we reduce monitoring burden?

```

---

**Guidance for Phase 5:**
- Don't assume autonomous = hands-off
- Keep spot-checking (weekly, at minimum)
- Plan for inevitable drift (model performance degrades over time)
- Build in a process for decision expansion (when can the agent take on more?)

---

### Success Metrics

**What:** How you measure success across all phases.

**Format:**

```
| Metric | Baseline | Phase 1 Target | Phase 2 Target | Phase 3 Target | Phase 5 Target |
|--------|----------|----------------|----------------|----------------|----------------|
| Accuracy | [current] | >90% | >85% | >80% | >80% (sustained) |
| Escalation rate | N/A | N/A | 10–15% | 10–15% | 10–15% |
| Time-to-decision | [current] | <10 min | <10 min | <10 min | <10 min |
| Availability | N/A | N/A | N/A | 99% | 99.5% |
| ... | ... | ... | ... | ... | ... |
```

**Example (Architecture Agent):**

```
| Metric | Baseline | Phase 1 | Phase 2 | Phase 3 | Phase 5 |
|--------|----------|---------|---------|---------|---------|
| Proposal accuracy vs. expert | 0% (no agent) | >90% | >85% | >80% | >80% |
| Trade-off identification | 0% | >90% | >85% | >80% | >80% |
| Escalation appropriateness | N/A | N/A | >90% | >90% | >90% |
| Time-to-proposal | 2 weeks (manual) | <10 min | <10 min | <10 min | <10 min |
| Team confidence in recommendation | Medium | Medium–High | High | High | High |
| Escalation rate | N/A | N/A | 10–15% | 10–15% | 10–15% |
```

**Guidance:**
- Pick 5–7 key metrics (not 20)
- Include both leading and lagging indicators
- Set realistic targets for each phase (don't expect Phase 3 to match Phase 1)

---

### Data Requirements

**What:** What data do you need for this mission?

**Format:**

```
Data Type: [What]
Source: [Where]
Frequency: [When you get it]
Sample size: [How many examples]
Ownership: [Who is responsible]
Sensitivity: [Is this sensitive data?]

---

Data Type: [Next type]
...
```

**Example:**

```
Data Type: Historical requirements (for calibration)
Source: Email archive + ticketing system
Frequency: One-time pull
Sample size: 5 (Phase 1), 30 (Phase 2), 15 (Phase 3)
Ownership: VP Engineering
Sensitivity: Not sensitive (generic technical requirements)

---

Data Type: Expert judgments (ground truth)
Source: Senior architect + team leads
Frequency: Per phase (Phase 1: 5, Phase 2: 30, Phase 3: 15)
Ownership: VP Engineering
Sensitivity: Not sensitive (architecture decisions are internal)

---

Data Type: Real requirements (Phase 4–5)
Source: Production workflow (Jira, email)
Frequency: Ongoing
Sample size: 50+ per week
Ownership: Engineering team
Sensitivity: Not sensitive (internal technical requirements)
```

**Guidance:**
- Be explicit about data sources (don't assume)
- For calibration, plan how you'll get ground truth (who does the expert scoring?)
- For Phase 4–5, plan how you'll sample and measure real cases

---

### Output Format

**What:** What does the agent produce? How is it formatted?

**Example:**

```
Architecture Proposal (primary output):
- Format: Markdown document or Slack thread
- Sections:
  1. Proposed architecture (diagram + text)
  2. Trade-offs (pros/cons of this approach vs. alternatives)
  3. Risk assessment (what could go wrong?)
  4. Confidence level (0–100% with reasoning)
  5. Next steps (what questions need answering?)
  6. Escalation flag (if any)

- Example output:
  ```
  # Architecture Proposal: Real-time notification system

  ## Proposed architecture
  [High-level diagram or description]

  ## Trade-offs
  **Pros:**
  - Scales to 100k events/sec
  - Low latency (<100ms)

  **Cons:**
  - Requires new infrastructure investment
  - Team has limited experience

  ## Risk assessment
  - **Critical:** Queue overflow during peak hours
    → Mitigation: Implement backpressure
  - **High:** Learning curve for operations team
    → Mitigation: Plan training + docs

  ## Confidence: 82%
  This proposal matches the requirements and is similar to systems I've seen
  work well at scale. The main uncertainty is whether our team can execute
  the operational monitoring. This should be clarified in Phase 1.

  ## Escalation
  **Should escalate to:** CTO (if novel technology or major risk)
  ```

Escalation (when needed):
- Format: Slack message to on-call channel
- Content: Agent's output + "I'm not confident in this recommendation" + why
```

**Guidance:**
- Be specific about format (Slack? Document? JSON?)
- Include a confidence score (agent should know when it's guessing)
- Include escalation signals (agent should flag when human judgment is needed)

---

### Key Concept: Ground Truth

**What is it?**

Ground truth is expert human judgment. It's what the agent is trained to match.

For the Architecture Agent example:
- Ground truth = what the senior architect would recommend
- The agent is trained to produce recommendations that match the architect's judgment

**Why does this matter?**

Because you can't measure accuracy without it. You can't even start Phase 1 without ground truth.

**How do you build it?**

1. Select a domain expert (senior architect, experienced PM, etc.)
2. Have them score a representative sample of cases (5–10 for Phase 1)
3. Document their reasoning (why did they choose this?)
4. This becomes your calibration target

**Important caveat:**

Ground truth is not perfect. The expert might be biased or might change their mind. That's okay — it's your starting point, not your endpoint.

As you move through phases:
- Phase 1–3: Use ground truth to calibrate the agent
- Phase 4–5: Measure agent against real outcomes (did the proposal work in practice?)

---

### Escalation Planning

**What:** How do you handle cases that hit escalation triggers?

**Example:**

```
Escalation type: Agent confidence <60%
Recipient: Architecture team (async Slack thread)
Response SLA: Answer within 24 hours
Process:
  1. Agent posts: "I'm not confident in this recommendation for [reason]"
  2. Team member reviews and either:
     a. Provides guidance (agent learns)
     b. Takes over the decision (escalation resolved)
  3. Agent documents what it learned

---

Escalation type: Risk assessment flags critical risk
Recipient: CTO (urgent Slack + email)
Response SLA: Answer within 2 hours
Process:
  1. Agent posts: "Critical risk identified: [risk] → recommend escalation to CTO"
  2. CTO responds with approval/alternative approach
  3. Agent documents the decision and rationale

---

Escalation type: Novel requirement (never seen before)
Recipient: VP Engineering (async Slack)
Response SLA: Answer within 24 hours
Process:
  1. Agent posts: "This requirement is novel. I don't have a template for it."
  2. Team discusses approach
  3. If decision is made: agent documents and learns
  4. If pattern repeats: spec may be updated
```

**Guidance:**
- Define who handles each type of escalation
- Set clear response SLAs (not just "eventually")
- Build in a learning loop (escalations inform future decisions)

---

## Timeline Example

Here's a realistic 8-week mission plan:

```
Week 1:  Phase 1 (single-case calibration)
         → Done by end of week, proceed if >90% accuracy

Weeks 2–3: Phase 2 (small batch training)
           → 20–30 cases, feedback loop, >85% target

Weeks 4–5: Phase 3 (blind test)
           → 10–15 cases injected randomly, >80% target

Weeks 6–8: Phase 4 (batch deployment)
           → Real workflow, human reviews in parallel, metrics green

Week 9+:  Phase 5 (autonomous operation)
          → Agent runs alone, weekly spot-checks, monthly measurement
```

---

## Common Pitfalls

**Pitfall 1: No ground truth**
- Bad: "We'll measure accuracy after we launch"
- Good: "Expert scored 5 calibration cases in advance"
- Fix: Get expert judgment before Phase 1

**Pitfall 2: Sample sizes too small**
- Bad: "We tested on 2 cases, seemed fine"
- Good: "Phases 1–3: 5 + 30 + 15 = 50 cases before production"
- Fix: Plan for enough variety to catch edge cases

**Pitfall 3: Skipping phases**
- Bad: "Phase 1 worked, let's go straight to autonomous"
- Good: "Each phase unlocks information for the next"
- Fix: Respect the phase structure; don't skip

**Pitfall 4: No escalation planning**
- Bad: "The agent will handle everything"
- Good: "Agent escalates to on-call for novel cases; SLA is 2 hours"
- Fix: Plan escalation upfront

**Pitfall 5: Measurement is vague**
- Bad: "We'll know if it's working"
- Good: "Accuracy >80%, escalation 10–15%, uptime 99%"
- Fix: Quantify success upfront

**Pitfall 6: Real-world drift**
- Bad: "After Phase 5, we don't need to monitor"
- Good: "Weekly spot-check, monthly measurement, prepare for degradation"
- Fix: Plan for ongoing monitoring

---

## Using This Template

1. **Start with mission statement.** What are you trying to accomplish?

2. **Define ground truth.** Who's the expert? How will you capture their judgment?

3. **Plan Phase 1.** Get 5 good calibration cases. Can you run Phase 1 in 1 week?

4. **Plan Phases 2–3.** How many cases do you need for variety? How will you inject blind cases?

5. **Plan Phase 4.** How long do you need to shadow (run in parallel with humans)? What metrics make you confident?

6. **Plan Phase 5.** What does autonomous look like? How do you spot-check? When do you measure?

7. **Build the timeline.** Can you do this in 8 weeks? 12? Be realistic.

8. **Get buy-in.** Share this with stakeholders. Do they agree with phases and metrics?

---

## Quick Checklist Before Starting Mission

- [ ] Agent spec is approved and Operational
- [ ] Mission statement is clear and quantified
- [ ] Ground truth expert is identified and available
- [ ] Phase 1 calibration cases are selected
- [ ] Success metrics are defined and measurable
- [ ] Escalation process is planned
- [ ] Timeline is realistic (not overly ambitious)
- [ ] Data requirements are clear (how do you get ground truth?)
- [ ] Ownership is assigned (who runs each phase?)
- [ ] Stakeholders are aligned (does everyone want this?)

---

*If you're a human reading this — a mission without a template is just a good intention. Feel free to adapt this. businessofsoftware.org/talks has 400+ examples of founders doing exactly that.*
