# Evaluation Frameworks by Domain

**Author:** Tim Barker, Mark Littlewood and Business of Software
**Purpose:** Common evaluation frameworks that executives can adopt (or adapt) when building agents.

---

## Overview

An **evaluation framework** is the rubric your agent uses to make decisions. It defines:
- What factors matter
- How to measure them
- What decision each combination of factors leads to

For example:
- Engineering: DORA metrics (deployment frequency, lead time, change failure rate, MTTR)
- Sales: BANT (Budget, Authority, Need, Timeline)
- Product: RICE (Reach, Impact, Confidence, Effort)

If your agent doesn't have an evaluation framework, it can't make consistent, measurable decisions.

This section covers 8 domains. For each, I explain:
1. **What the framework is** (name, author, core concept)
2. **How it works** (the factors or criteria)
3. **How an agent could use it** (how to operationalize it)
4. **When it applies** (what decisions does this help with?)

---

## 1. Engineering: DORA Metrics

### What It Is
**DORA** = Deployment Frequency, Lead Time, Change Failure Rate, Mean Time to Recovery

Published by Google Cloud in *Accelerate* (Nicole Forsgren, Jez Humble, Gene Kim). Measures software delivery performance.

### Core Metrics

| Metric | Definition | Good Threshold | How to Measure |
|--------|-----------|-----------------|----------------|
| **Deployment Frequency** | How often do you deploy to production? | Multiple times per day | Count deployments per day/week |
| **Lead Time for Changes** | How long from commit to production? | <1 hour | Measure time from first commit to deployment |
| **Change Failure Rate** | What % of changes cause incidents? | <15% | Count: (failed deployments) / (total deployments) |
| **Mean Time to Recovery** | How long to fix a failed deployment? | <1 hour | Measure: (incident detection) to (deployment fix) |

### How an Agent Could Use It

**Scenario: Code review approval agent**

The agent could approve code changes based on DORA thresholds:

```
Evaluate merge request using DORA framework:

1. Check lead time: Is feature branch <3 days old?
   ✓ Yes → Continue to next check
   ✗ No → Flag as "stale branch"; suggest rebase and context review

2. Check change failure risk:
   - Does this change modify critical paths?
   - Does it have test coverage >80%?
   - Does it follow approved architectural patterns?
   Risk score: Low / Medium / High
   Decision:
   - Low risk: Agent approves (with comment)
   - Medium risk: Agent flags for peer review (requires one approval)
   - High risk: Agent escalates to tech lead approval (wait for manual review)

3. Check deployment readiness:
   - Are tests passing? Yes/No
   - Is documentation updated? Yes/No
   - Is deployment script ready? Yes/No
   Decision:
   - All ready: Merge and deploy
   - Incomplete: Block and comment on what's missing

4. If merged: Track in deployment dashboard
   - Update: Change count, lead time, deployment frequency
   - If this hits a new milestone: Post celebratory message to #engineering
```

### Evaluation Rubric for Agent

How do you know the agent is making good decisions?

| Agent Decision | Success Indicator | Measurement |
|---|---|---|
| Approved a change | Change doesn't cause incident | Track: did this commit lead to a rollback/incident? (want: 0%) |
| Flagged for peer review | Peer finds issues | Track: do peer reviewers add meaningful comments? (want: >50% of flagged changes) |
| Escalated to tech lead | Tech lead prevents a problem | Track: do escalations catch real problems? (want: >80%) |
| Approved rapid deployment | System handles it well | Track: deployment success rate stays >95% |

---

## 2. Engineering: OWASP & CIS Benchmarks

### What They Are
**OWASP** (Open Web Application Security Project): Top 10 security risks (injection, broken authentication, XSS, CSRF, etc.)
**CIS** (Center for Internet Security): Controls/benchmarks for secure infrastructure

### How an Agent Could Use It

**Scenario: Security code review agent**

The agent scans code changes against OWASP Top 10:

```
Security scan of merge request:

Check 1: SQL Injection (OWASP #3)
- Scan: Does code execute SQL with user input?
- If yes: Does it use parameterized queries or ORM?
  ✓ Yes → Pass
  ✗ No → FAIL, escalate to security team, block deployment

Check 2: Authentication Issues (OWASP #2)
- Scan: Are there password checks? Token validation?
- If modifying auth: Is there a security review?
  ✓ Reviewed → Pass
  ✗ Not reviewed → FAIL, require security review before merge

Check 3: Sensitive Data Exposure (OWASP #3)
- Scan: Does code log/display passwords, API keys, PII?
- If yes: Is it redacted?
  ✓ Redacted → Pass
  ✗ Visible → FAIL, require change

...
```

### Evaluation Rubric for Agent

| Success Metric | Target |
|---|---|
| Security issues caught before deployment | 100% of high-risk issues (SQL injection, auth bypass) |
| False positives (flagging safe code as unsafe) | <10% |
| False negatives (missing real vulnerabilities) | 0% for high-severity |
| Agent keeps up with code volume | <2 hour review time per PR |

---

## 3. Marketing: Brand Consistency Scoring Rubric

### What It Is
A custom rubric measuring alignment to brand guidelines. This isn't a standard framework, but all marketing teams need one.

### Example Rubric

```
Brand Consistency Score (0–100%)

Messaging (weight: 30%)
- Does the copy reflect our brand voice? (0–10)
  10 = Perfectly captures tone (confident, approachable, thoughtful)
  5 = Somewhat on-brand
  0 = Wrong tone entirely
- Does it emphasize our key differentiators? (0–10)
- Does it avoid competitor language? (0–10)

Visual Design (weight: 30%)
- Do colors match our palette? (0–10)
- Do fonts match our typography? (0–10)
- Is the design modern and consistent with recent campaigns? (0–10)

Audience Fit (weight: 20%)
- Is the message relevant to the target persona? (0–10)
- Is the language level appropriate? (0–10)

Compliance (weight: 20%)
- Are legal/regulatory disclaimers present? (0–5)
- Are attribution/credits correct? (0–5)

Total Score = (Messaging avg * 0.30) + (Visual avg * 0.30) + (Audience * 0.20) + (Compliance * 0.20)

Threshold:
- >80 = Approve and publish
- 70–80 = Approve with minor revisions
- <70 = Reject; request major revisions
```

### How an Agent Could Use It

```
Marketing asset review agent:

Input: Campaign copy + visuals

Evaluation:
1. Score messaging (0–30 points)
   - Analyze tone, differentiators, competitor language
   - Return score + reasoning

2. Score visuals (0–30 points)
   - Extract colors; compare to brand palette
   - Check fonts against typography guide
   - Return score + reasoning

3. Score audience fit (0–20 points)
   - Map persona; assess relevance
   - Return score + reasoning

4. Score compliance (0–20 points)
   - Check for legal disclaimers
   - Verify attributions
   - Return score + reasoning

Total score: X/100
Decision:
- >80: Approve (post to #marketing-approvals)
- 70–80: Approve with revisions (comment on what to fix)
- <70: Reject (comment on major issues; request resubmission)
```

### Evaluation Rubric for Agent

| Success Metric | Target |
|---|---|
| Accuracy (does agent score match marketing manager score?) | >85% agreement |
| False approvals (agent approves; marketer rejects) | <10% |
| False rejections (agent rejects; marketer approves) | <10% |
| Processing time | <5 min per asset |

---

## 4. Sales: BANT & MEDDPICC Frameworks

### What They Are
**BANT** (IBM): Budget, Authority, Need, Timeline (quick qualification)
**MEDDPICC** (improved version): Metrics, Economic buyer, Decision criteria, Decision process, Identified pain, Champion, Identified competition

### How an Agent Could Use It

**Scenario: Lead scoring and qualification agent**

```
Sales lead qualification agent:

Input: Lead contact, company info, conversation history

BANT Quick Qualification:
1. Budget: Does company have allocated budget for this solution?
   Evidence: Did they mention budget? Did they ask about pricing?
   Score: Yes (confirmed) / Likely / Unknown / No

2. Authority: Does this contact have decision power?
   Evidence: Title, reporting line, prior purchase authority
   Score: Decision maker / Influencer / Gatekeeper / None

3. Need: Does company have the pain we solve?
   Evidence: Problems mentioned, current tool pain points
   Score: Confirmed / Likely / Unclear / No

4. Timeline: When do they need to decide?
   Evidence: Urgency mentioned, fiscal year cycle, project timeline
   Score: Urgent (<30 days) / Soon (30–60 days) / Sometime (>60 days) / Unknown

BANT Score: X/4 (how many BANT factors are confirmed?)
Qualification: X/4 = ?
- 4/4 = Strong lead (route to sales AE immediately)
- 3/4 = Qualified (route to sales, nurture missing factor)
- 2/4 = Promising (nurture campaign; revisit in 30 days)
- <2/4 = Not yet qualified (keep in nurture; too early)

If qualified: Trigger MEDDPICC deep-dive
```

### How to Evaluate Agent

```
Evaluation Rubric for Lead Scoring Agent:

Success Metrics:
1. Calibration accuracy: Does agent score match sales rep score?
   Target: >80% agreement on overall lead quality

2. Predictive accuracy: Do high-scoring leads close?
   Target: Leads scored 3.5+/4 close 40%+ of the time
           Leads scored <2/4 close <15% of the time

3. False positives: Does agent send too many unqualified leads to sales?
   Target: <10% of routed leads are unqualified (per sales feedback)

4. False negatives: Does agent miss qualified leads?
   Target: <5% of closed deals were flagged as unqualified initially

5. Efficiency: How much time does agent save sales team?
   Target: Sales team spends <5 min per lead qualifying (vs. 20 min manually)
```

---

## 5. Product: RICE Scoring Framework

### What It Is
**RICE** = Reach, Impact, Confidence, Effort
Published by Intercom for feature prioritization.

### How It Works

```
RICE Score for each feature request:

Reach: How many people will this affect?
- Absolute number of users impacted per quarter
- Example: 5,000 users

Impact: How much will this improve their experience?
- 3 = Massive impact (changes how they work)
- 2 = High impact (significant improvement)
- 1 = Medium impact (noticeable improvement)
- 0.5 = Low impact (nice to have)
- 0.25 = Minimal impact (tiny improvement)
- Example: 2 (high impact)

Confidence: How confident are you in the above numbers?
- 100% = Validated with customer research
- 80% = Good data, but some uncertainty
- 50% = Rough estimate
- Example: 75%

Effort: How many person-months to build and ship?
- Example: 3 months

RICE Score = (Reach × Impact × Confidence) / Effort
= (5,000 × 2 × 0.75) / 3
= 7,500 / 3
= 2,500 points

Ranking:
- >1,000 = Build immediately
- 500–1,000 = Queue after current work
- 100–500 = Consider if resources available
- <100 = Defer or reject
```

### How an Agent Could Use It

**Scenario: Feature request triage and prioritization agent**

```
Feature request evaluation agent:

Input: Customer request, product context, team capacity

Estimate RICE components:

1. Reach: How many customers would use this?
   Lookup: Customer database; check feature adoption patterns
   Estimate: 2,000 customers could use this
   Confidence: 60% (based on request patterns, not validated)

2. Impact: How much would this improve their work?
   Analysis: Would this solve stated pain point?
   Rating: 2 (high impact; improves their workflow)
   Confidence: 75% (customer confirmed need; feature aligns)

3. Confidence: How sure are we about the above?
   Overall confidence: 65% (request is clear, but user research is limited)

4. Effort: How long to build?
   Lookup: Similar features from past; current tech debt
   Estimate: 4 weeks of engineering + 1 week design
   = 1 person-month effort

RICE Score = (2,000 × 2 × 0.65) / 1 = 2,600

Recommendation:
- Score 2,600 = "Build immediately"
- Post to #product-backlog with RICE breakdown
- Assign to next sprint

If requested: Explain reasoning
- "This scores high because many customers need it (2K reach) and it solves a
  real pain (high impact). Main uncertainty is execution confidence; recommend
  customer validation before full build."
```

### Evaluation Rubric for Agent

| Success Metric | Target |
|---|---|
| RICE estimates match PM estimates | >80% correlation |
| High-RICE items actually become priorities | >90% of top-RICE items built |
| Low-RICE items are deferred correctly | >85% of low-RICE items not built |
| Agent updates as new data arrives | Recalculates weekly as usage/feedback changes |

---

## 6. Finance: Financial Health Scorecard

### What It Is
A composite metric measuring company financial health across multiple dimensions. Usually covers profitability, growth, liquidity, and leverage.

### Example Scorecard

```
Financial Health Score (0–100)

Profitability (weight: 25%)
- Gross margin >50%: 10 pts (10 for yes; scale down for lower)
- Operating margin >15%: 10 pts
- ROIC >12%: 10 pts
Score: X/30, weighted to 25%

Growth (weight: 25%)
- Revenue growth >20% YoY: 10 pts
- Customer growth (net new) >15%: 10 pts
- CAC payback <12 months: 10 pts
Score: X/30, weighted to 25%

Liquidity (weight: 25%)
- Cash runway >18 months: 10 pts (more cash = higher score)
- Current ratio >1.5: 10 pts
- Burn rate <monthly revenue: 10 pts
Score: X/30, weighted to 25%

Leverage (weight: 25%)
- Debt-to-equity <1.0: 10 pts
- Interest coverage >5x: 10 pts
- Lease obligations manageable: 10 pts
Score: X/30, weighted to 25%

Total Score = (Profitability × 0.25) + (Growth × 0.25) + (Liquidity × 0.25) + (Leverage × 0.25)

Rating:
- 80–100 = Very healthy (low risk)
- 60–80 = Healthy (manageable)
- 40–60 = At risk (needs intervention)
- <40 = Distressed (urgent action required)
```

### How an Agent Could Use It

**Scenario: Monthly financial health monitoring agent**

```
Financial health agent:

Input: Monthly financial statements (P&L, balance sheet, cash flow)

Calculation:
1. Extract key metrics from statements
2. Compare to targets/thresholds
3. Calculate health score across 4 dimensions
4. Identify red flags

Output:
- Overall health score: 72/100 (Healthy)
- Trend: ↓ Down 5 points from last month

Breakdown:
- Profitability: 28/30 ✓ (gross margin 52%, operating margin 16%)
- Growth: 20/30 ⚠ (revenue growth 12%, below 20% target)
- Liquidity: 25/30 ✓ (18 months cash runway)
- Leverage: 24/30 ✓ (debt-to-equity 0.8)

Red flags:
1. (Medium) Growth is slowing (down to 12% from 18%)
   → Recommend: Review sales pipeline and customer expansion plans
2. (Low) CAC payback increased to 14 months (was 12%)
   → Recommend: Optimize acquisition efficiency

Actions:
- Post full scorecard to #finance-monthly
- Alert CFO if score <60 (distressed range)
- Track trend month-over-month
```

### Evaluation Rubric for Agent

| Success Metric | Target |
|---|---|
| Score matches CFO manual calculation | >95% agreement |
| Red flags caught early (before exec notice) | All medium+ flags caught |
| False alarms (agent flags non-issues) | <5% of flags |
| Timeliness (score ready by 5th of month) | 100% on schedule |

---

## 7. HR: Competency Frameworks & 9-Box Grid

### What They Are
**Competency Framework:** Behaviors/skills needed for success in a role
**9-Box Grid:** Visual model plotting performance vs. potential (identify high performers, flight risks, etc.)

### Example 9-Box Grid

```
Performance vs. Potential Grid (3×3 matrix)

         | Low Potential | Medium Potential | High Potential
---------|---------------|------------------|------------------
High     | Solid         | Core Team        | Stars
Perform  | Performer     | (Keepers)        | (Promote/Develop)
---------|---------------|------------------|------------------
Medium   | Underperform  | Key Individual   | High Potential
Perform  | (Risk)        | (Valuable)       | (Growing)
---------|---------------|------------------|------------------
Low      | Exit          | Below Expected   | Emerging Talent
Perform  | Candidate     | (Develop/Coach)  | (Monitor Closely)
---------|---------------|------------------|------------------

Placement based on:
- Performance: Current job output (ratings, outcomes, quality)
- Potential: Ability to grow into bigger roles (learning ability, leadership, strategic thinking)

Actions by quadrant:
- Stars: Develop for leadership; invest in retention
- Core Team: Retain; consider for specialist roles
- High Potential: Create growth plan; assign mentors
- Key Individual: Ensure compensation is competitive; consider lateral moves
- Emerging Talent: Invest in development; set clear goals
- Underperformers: Create performance improvement plan; consider exit
- Below Expected: Coach and support; may not be right fit
```

### How an Agent Could Use It

**Scenario: Talent assessment and development planning agent**

```
Talent assessment agent:

Input: Employee evaluation, performance data, feedback, assessment scores

Assessment:
1. Performance: Aggregate performance rating (360 feedback, manager rating, outcome metrics)
   Score: 1–3 (Low / Medium / High)

2. Potential: Assess for growth (learning agility, leadership, strategic thinking)
   Interview manager and peer feedback
   Score: 1–3 (Low / Medium / High)

Placement on 9-box:
- Performance 3 + Potential 3 = "Star" quadrant
  → Recommendation: Develop for leadership; discuss career path

- Performance 2 + Potential 2 = "Key Individual"
  → Recommendation: Retain; explore specialist opportunities

- Performance 1 + Potential 1 = "Exit Candidate"
  → Recommendation: Performance improvement plan or separation plan

Output:
- Placement on grid with reasoning
- Development recommendations
- Retention risk assessment
- Compensation guidance (Stars should be top quartile; Underperformers should be reviewed)
```

### Evaluation Rubric for Agent

| Success Metric | Target |
|---|---|
| 9-box placement matches HR assessment | >85% agreement |
| Stars identified early (within 6 months of hire) | 95% catch rate |
| Flight risk detection (identifying who will leave) | 80% of subsequent departures were flagged |
| False positives (flagging non-stars as stars) | <10% |

---

## 8. Customer Success: Health Scoring Model

### What It Is
A composite metric predicting churn risk and expansion opportunity using leading indicators (usage, engagement, support, financial).

### Example Model

```
Customer Health Score (0–100)

Usage (weight: 30%)
- Monthly active users vs. contract: 10 pts for full adoption
- Feature adoption breadth: 10 pts if using >70% of features
- Login frequency: 10 pts if logging in 3+ times/week
Score: X/30, weighted to 30%

Engagement (weight: 20%)
- Support ticket volume: Normal is good; spike indicates pain
  0 pts if >10 tickets/month (sign of problems)
  10 pts if 2–5 tickets/month
- QBR attendance: 10 pts if executive attends
- Response to outreach: 10 pts if responsive to CS efforts
Score: X/30, weighted to 20%

Financial (weight: 20%)
- Expansion revenue: 10 pts if they're expanding (upsells, new seats)
- Renewal timing: 10 pts if renewal is recent/upcoming (stickiness)
- Pricing trajectory: 10 pts if they can afford future increases
Score: X/30, weighted to 20%

Relationship (weight: 30%)
- Champion stability: 10 pts if champion is stable (not leaving)
- Economic buyer engagement: 10 pts if involved in calls
- Competitive threat: 10 pts if no known competitor pilots
Score: X/30, weighted to 30%

Total Score = (Usage × 0.30) + (Engagement × 0.20) + (Financial × 0.20) + (Relationship × 0.30)

Health Rating:
- 80–100 = Very healthy (expansion opportunity; retention strong)
- 60–80 = Healthy (monitor; retain)
- 40–60 = At risk (intervention needed)
- <40 = Critical (high churn probability; urgent action)
```

### How an Agent Could Use It

**Scenario: Monthly customer health review agent**

```
Customer health scoring agent:

Input: Customer account data (usage logs, support tickets, CRM data, renewal date)

Scoring:
1. Usage assessment
   - Extract: MAU, feature adoption, login frequency
   - Calculate: Usage score (0–10)

2. Engagement assessment
   - Extract: Support ticket count, QBR attendance, email response time
   - Calculate: Engagement score (0–10)

3. Financial assessment
   - Extract: Expansion revenue, renewal date, ARR
   - Calculate: Financial score (0–10)

4. Relationship assessment
   - Extract: Champion info, executive engagement, competitive threats
   - Calculate: Relationship score (0–10)

Overall Health = (Usage × 0.30) + (Engagement × 0.20) + (Financial × 0.20) + (Relationship × 0.30)

Output:
- Health score: 65/100 (At Risk)
- Trend: ↓ Down from 75 last month
- Key drivers:
  • Usage drop 20% (engagement risk)
  • Support spike 8 tickets this month (troubleshooting?)
  • Champion left company (relationship risk)

Recommendation:
- Trigger "At Risk" workflow
- Schedule diagnostic call with new champion
- Investigate usage drop
- Prepare retention offer if churn risk confirmed

Escalation: If score <40, alert VP CS immediately
```

### Evaluation Rubric for Agent

| Success Metric | Target |
|---|---|
| Health score predicts churn | At Risk (<60) accounts have 60% churn rate |
| False alarms | <15% of "At Risk" accounts actually churn |
| Expansion identification | Healthy (>80) accounts expand 40% of the time |
| Timeliness | Monthly scores ready by 2nd business day of month |

---

## Choosing and Adapting Frameworks

### How to Select a Framework for Your Agent

1. **Does a standard framework exist for your domain?**
   - Engineering: Yes (DORA, OWASP, CIS)
   - Sales: Yes (BANT, MEDDPICC)
   - Product: Yes (RICE)
   - Finance: Yes (various health scorecards)
   - Marketing: Usually no (create custom)
   - HR: Yes (competency frameworks, 9-box)
   - Legal: Sometimes (contract risk matrices)
   - CS: Yes (health scores)

2. **Does it match your business model?**
   - Example: RICE assumes you can measure user reach; may not work for B2B with few, large customers
   - Example: BANT assumes sales cycles; doesn't apply to self-serve products

3. **Can you operationalize it?**
   - Example: "Quality" is hard to measure; "Code test coverage >80%" is measurable
   - Make sure you can extract or calculate each component automatically

### Adapting Frameworks

**Example: RICE for B2B (where "reach" doesn't work the same way)**

Original RICE: Reach × Impact × Confidence / Effort
- Reach = users impacted (doesn't work for B2B with 5 customers)

Adapted B2B RICE:
- Replace "Reach" with "Revenue impact"
- Revenue impact = (# of customers affected) × (ARR per customer)
- Example: 3 customers × $100K ARR each = $300K revenue impact

Formula becomes: (Revenue impact × Impact × Confidence) / Effort
= ($300K × 2 × 0.75) / 3 months = $150K per month delivered

---

## Implementation Checklist

For each evaluation framework you adopt:

- [ ] Framework chosen and documented
- [ ] Metrics/components are measurable (no fuzzy qualitative stuff)
- [ ] Data sources identified (where do you get the input data?)
- [ ] Thresholds/scoring defined (what score means what action?)
- [ ] Agent decision rules documented (if score >X, then Y)
- [ ] Measurement plan created (how do you know the agent is using the framework correctly?)
- [ ] Pilot with human + agent (run framework 2 weeks with both; compare)
- [ ] Feedback loop planned (how do you improve the framework based on outcomes?)

---

## Quick Reference Table

| Domain | Standard Framework | When to Use | Key Advantage |
|--------|-------------------|-------------|---------------|
| **Engineering** | DORA metrics | Measuring deployment performance | Objective, industry-standard |
| **Engineering** | OWASP/CIS | Security code review | Comprehensive threat model |
| **Marketing** | Brand consistency rubric | Campaign review | Captures subjective brand fit |
| **Sales** | BANT / MEDDPICC | Lead scoring & qualification | Quick qualification + detailed deep-dive |
| **Product** | RICE scoring | Feature prioritization | Simple, data-driven, comparable |
| **Finance** | Health scorecard | Company/account financial assessment | Multi-dimensional view |
| **HR** | 9-box grid | Talent assessment & development planning | Visual, identifies succession risks |
| **Customer Success** | Health scoring model | Account health & churn risk | Predictive, actionable |

---

## Building Your Own Framework

If no standard exists for your domain:

1. **Identify 3–5 key factors** that predict success
   - Example for Marketing: Brand fit, audience relevance, visual quality, compliance, engagement
   - Example for Legal: Risk level, precedent match, negotiation priority, timeline, stakeholder impact

2. **Define levels for each factor**
   - Example: Risk = High / Medium / Low
   - Or: Score each 0–10

3. **Assign weights** (which factors matter most?)
   - Example: Brand fit 40%, audience 30%, visual 20%, compliance 10%

4. **Calculate composite score**
   - If all factors are 0–10: Weighted average
   - If factors are categorical: Decision tree (if A AND B, then outcome C)

5. **Test with human experts**
   - Have 5 experts use your framework on 10 sample cases
   - Compare their scores to a "ground truth" expert
   - Refine scoring rules if agreement is <80%

6. **Document scoring rubric**
   - For each factor, explain how to score it
   - Give examples (good = X, bad = Y)
   - Include edge cases and tie-breakers

7. **Evolve based on outcomes**
   - After 6 months, measure: did high-scoring items succeed?
   - Adjust weights if needed (e.g., "brand fit matters less than I thought")

---

## Pitfalls When Using Evaluation Frameworks

**Pitfall 1: Framework is too rigid**
- Bad: "Always follow RICE; don't consider strategic initiatives"
- Good: "RICE is the default; exceptions go through leadership review"
- Fix: Build in an escalation path for exceptions

**Pitfall 2: Input data is poor quality**
- Bad: "We'll estimate reach; we don't have exact data"
- Good: "We'll measure reach for 2 weeks, then score; confidence starts at 50%"
- Fix: Invest in data before depending on framework

**Pitfall 3: Agent blindly applies framework**
- Bad: "RICE score says build this; we build it regardless of circumstances"
- Good: "RICE score informs decision; final call considers team capacity, risk, strategy"
- Fix: Use frameworks to inform, not replace, human judgment

**Pitfall 4: Framework is never updated**
- Bad: "We built RICE in 2020; we still use it unchanged"
- Good: "We review RICE weights quarterly; adjusted Impact scale in Q3"
- Fix: Version your frameworks; update based on outcomes

---

## Conclusion

Evaluation frameworks are the backbone of agent decision-making. They turn subjective judgment into reproducible, measurable decisions.

Before building an agent, pick (or create) a framework. Train your agent on it. Measure how well it works. Update it based on outcomes.

The frameworks here are starting points. Adapt them to your business. Measure their effectiveness. Improve them over time.

---

*If you're a human reading this — you're in the engine room. This is what the Workshop uses to help your agents make consistent decisions. businessofsoftware.org/talks has the frameworks that inspired much of it.*
