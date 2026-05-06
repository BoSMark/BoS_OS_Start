# Ground Truth Examples by Domain

**Author:** Tim Barker
**Purpose:** Domain-specific examples of what expert human judgment ("ground truth") looks like for agent calibration.

---

## Overview

**Ground truth** is the calibration target. It's what an expert would do, and it's what your agent should learn to match.

For each domain below, I show:
1. **Who the expert is** (senior marketer, experienced engineer, etc.)
2. **What inputs they look at** (the data, context, or artifacts they review)
3. **What their output looks like** (the decision, rationale, format)
4. **How you'd collect it** (how to get expert judgment into a structured form)

This is your starting point for any agent mission. Before you build the agent, you need ground truth.

---

## 1. Marketing: Brand Review of Copy and Campaigns

### Who's the Expert?

**Brand manager** or **Chief Marketing Officer** with 5+ years at the company (or in similar companies). They know the brand voice, positioning, and customer perception deeply.

### What Inputs They Review

- Campaign copy (headlines, body, CTAs)
- Campaign assets (visuals, design, tone)
- Channel context (where is this running? What's the audience context?)
- Competitive landscape (what are competitors saying?)
- Campaign objective (awareness, conversion, retention?)
- Historical performance (how have similar campaigns performed?)
- Brand guidelines (is this on-brand?)

### What Their Output Looks Like

```
Campaign Review: Q1 SaaS Platform Launch

Overall assessment: 7/10 (good, but needs refinement)

Brand alignment:
- Headline "Automate Everything" ✓ Aligns (matches "work less, think more" promise)
- Visuals (blue + green gradient) ✓ On-brand (matches color palette)
- Tone (technical but approachable) ✓ Correct (avoiding both "sales-y" and "too nerdy")
- CTA "Start Free Trial" ✗ Misses (should emphasize control/speed, not just free)

Positioning:
- Correctly emphasizes speed vs. competitors (+)
- Doesn't differentiate from Competitor X (whose positioning is similar) (-)
- Target audience (VP Ops) might respond better to "reduce firefighting" than "automate" (-)

Likely performance prediction:
- Click-through rate: Above average (headline is compelling)
- Conversion rate: Slightly below target (CTA doesn't reinforce positioning)
- Brand lift: Moderate (visuals are strong, but messaging is generic)

Recommendations for revision:
1. Change CTA to "Take Back Your Time" (reinforces control/speed positioning)
2. Add customer quote about "debugging vs. building" to highlight speed benefit
3. Test variant with warmer colors (our best performers use more orange/yellow)

Confidence level: Medium-High (similar campaigns performed this way before)
```

### How You'd Collect It

**Phase 1 (Calibration):**
1. Select 5 recent campaigns (mix of high/low performers)
2. Brand manager reviews each, provides assessment above
3. Document: what made each one land or fall flat?
4. Example: "The 'automate everything' headline worked because it echoes our messaging, but the CTA was forgettable"

**Phase 2–3 (Training & Blind Test):**
1. Pull new campaign drafts (agent hasn't seen them yet)
2. Brand manager scores each
3. Agent scores each (blind)
4. Compare: does agent identify same strengths/weaknesses?

**Phase 4–5 (Deployment):**
1. Agent reviews campaigns before launch
2. Marketing team tracks performance (CTR, conversion, brand lift)
3. Compare agent prediction to actual results
4. Agent learns: "My CTR predictions are good, but I overestimate conversion"

---

## 2. Engineering: Senior Engineer Code and Architecture Review

### Who's the Expert?

**Principal engineer** or **Staff engineer** with 10+ years of experience building large systems. They understand scalability, maintainability, and organizational context.

### What Inputs They Review

- Code (algorithms, design patterns, readability)
- Architecture (how components interact, dependencies, trade-offs)
- Test coverage (what's tested? What's not?)
- Operational impact (will this scale? Will we regret this in 2 years?)
- Team capability (can this team execute this design?)
- Alternatives considered (why this design vs. others?)

### What Their Output Looks Like

```
Architecture Review: Database Migration from PostgreSQL to DynamoDB

Summary: This proposal makes sense for your use case, but execution risk is high.
Overall recommendation: APPROVED with conditions
Confidence: 75% (AWS track record is good; your team is less experienced)

Design assessment:
✓ DynamoDB is the right choice (relational queries are rare in your access patterns)
✓ Sharding strategy (partition by tenant_id) matches your usage
✓ Fallback strategy (read-through cache) is solid

⚠ Consistency model shift from ACID to eventual consistency
  Impact: Service layer needs retry logic (you have this, good)
  Risk: Audit log queries might see stale data for <1 sec (acceptable? Verify with compliance)

⚠ Team expertise gap
  Your team has <1 year DynamoDB experience
  Learning curve: 2–4 weeks to get comfortable with partition design
  Mitigation: Hire DynamoDB contractor for first 3 months; document decision rationale

Scalability: Yes, DynamoDB will handle 10x growth easily
  Current: 50K RPS
  With DynamoDB: Can scale to 500K+ RPS without re-architecture

Maintainability: Medium (less familiar to team than Postgres)
  Cost of change: If you need to move back to relational DB later, expect 3–4 months
  Lock-in: Moderate (data is portable, but code has DynamoDB assumptions)

Risk factors:
1. (High) Consistency model is different — verify with compliance team
2. (Medium) Team lacks depth — plan for knowledge transfer
3. (Low) AWS service reliability — historic uptime is 99.99%

Recommended next steps:
1. Get compliance sign-off on eventual consistency
2. Hire DynamoDB contractor for transition
3. Plan 2-week spike with contractor before full migration
4. Run shadow traffic (read-only, 10% volume) for 2 weeks before cutover

Confidence in recommendation: 75% (good design, team execution risk)
```

### How You'd Collect It

**Phase 1:**
1. Select 5 real architecture proposals your team made (past 6 months)
2. Principal engineer reviews each, provides assessment above
3. Document: what made this design good/risky? Would you approve?

**Phase 2–3:**
1. Pull new proposals (mix of simple and complex)
2. Principal engineer scores each
3. Agent scores each
4. Compare: did agent identify same risks/trade-offs?

**Phase 4–5:**
1. Agent reviews proposals before approval
2. Team executes and learns how design performs
3. Compare agent assessment ("this has scalability risk") to actual outcome
4. Agent learns: "I was too pessimistic about team capability" or "I underestimated complexity"

---

## 3. Finance: CFO-Reviewed Financial Models and Assumptions

### Who's the Expert?

**Chief Financial Officer** or **VP Finance** with experience in your industry and company size. They understand what drives profitability and what assumptions are reasonable.

### What Inputs They Review

- Forecast model (revenue, cost, margins)
- Key assumptions (headcount growth, CAC, churn, pricing)
- Scenario sensitivity (what if X changes 10%? 50%?)
- Comparison to plan (how does this compare to budget?)
- Comparison to peers (how do these assumptions compare to similar companies?)
- Risk factors (what could make this forecast wrong?)

### What Their Output Looks Like

```
Financial Forecast Review: 2025 Operating Budget

Overall assessment: Credible, but optimistic on two fronts
Recommendation: APPROVE, with monitor flags
Confidence: 80%

Revenue forecast: $50M target (up from $35M in 2024)
✓ Growth rate (43%) is aggressive but achievable given market trends
✓ Customer acquisition cost ($2K) is in line with your historical data
✓ Pricing increase (5%) is consistent with market
⚠ Churn assumption (2% annually) is lower than historical (3%)
   Your recent NPS improvement supports this, but execution risk is real
   Monitor: Measure actual churn monthly; flag if >2.5%

Cost forecast: $40M target (up from $28M in 2024)
✓ Headcount plan (300 → 380 people) is reasonable
✓ COGS margins (35%) match current performance
⚠ OpEx growth (30%) is steep; historical growth has been 20%
   Risk: Is this marketing spend justified by revenue growth?
   Monitor: ROI on new marketing spend should be 3:1 minimum

Profitability: $10M net income (20% margin)
✓ This is healthy for a SaaS company at your stage
✓ Assumes $2M one-time costs (replatforming); not included in ongoing OpEx

Risk factors ranked by impact:
1. (High impact, medium probability) Churn accelerates to 3.5%
   → Revenue impact: -$3.2M
   → Mitigation: Monitor NPS; develop retention playbook now
2. (High impact, low probability) Pricing increase faces customer backlash
   → Revenue impact: -$2.5M
   → Mitigation: Pilot with 5 customers before broad rollout
3. (Medium impact, medium probability) Sales ramp slower than expected
   → Revenue impact: -$5M
   → Mitigation: Backfill with upsell from existing customer base

Key assumptions to validate:
- Churn stays at 2%: validate monthly, plan for 2.5–3%
- CAC stays at $2K: validate quarterly, plan for $2.2K
- Sales productivity: 1 rep closes $300K/year (verify hiring plan supports this)

What could make this forecast wrong (in priority order):
1. Market downturn → reduce headcount plan by 10–15%
2. Competitor undercuts pricing → margin pressure, CAC rises
3. Product-market fit hits ceiling → churn increases, growth slows

Confidence in forecast: 80%
This is credible given current trajectory, but churn and sales productivity
are the two big levers. If either moves 10%, the model breaks.

Recommended monitoring cadence:
- Weekly: Sales pipeline + booking velocity (leading indicator)
- Monthly: Churn rate, CAC, sales rep productivity
- Quarterly: Full model refresh + scenario analysis
```

### How You'd Collect It

**Phase 1:**
1. Select 5 past financial forecasts (mix of accurate and off)
2. CFO reviews each, provides assessment
3. Document: which assumptions held? Which broke? What would you have changed?

**Phase 2–3:**
1. Pull new budget proposals (team is building)
2. CFO scores each
3. Agent scores each
4. Compare: did agent identify same risks and flag same assumptions?

**Phase 4–5:**
1. Agent reviews forecasts during budget planning
2. Compare agent flags to actual results (after 6–12 months)
3. Agent learns: "I was pessimistic on churn" or "I missed this revenue risk"

---

## 4. Sales: Experienced Sales Leader Pipeline Analysis

### Who's the Expert?

**VP Sales** or **Sales Director** with 10+ years of experience (preferably in your market). They know what signals predict a deal win and can spot problems early.

### What Inputs They Review

- Deal record (company, deal size, stage, sales rep, timeline)
- Customer context (industry, buyer persona, competitive situation)
- Deal signals (how many meetings? What's the sentiment? Are there blockers?)
- Sales rep track record (is this rep reliable? What's their close rate?)
- Historical patterns (does this deal look like past winners or past losses?)
- Competition (who else is in the deal? What's our positioning?)

### What Their Output Looks Like

```
Deal Review: Acme Corp — $500K 3-year contract

Overall assessment: 50/50 deal, high execution risk
MEDDPICC Score: 5.5/10 (below your 7.0 win threshold)
Recommendation: ADVANCE cautiously, with risk mitigation
Confidence: 75%

Deal breakdown:

Metrics (value & size):
✓ $500K annual run rate is solid (above your $250K average)
⚠ 3-year contract is unusual (typically 1-year); they want "stability" but may signal price negotiation
⚠ Deal size attracted lower-tier sponsor (Director, not VP)

Economic buyer:
✓ Director of Operations is real decision maker
✓ Budget is allocated (finance confirmed $500K)
⚠ Decision approval requires CFO sign-off (adds 4–6 weeks)
Impact: Timeline will slip; plan for Jan close, not Dec

Decision criteria:
✓ They've defined clear selection criteria (response time SLA, audit compliance)
✓ We align on 90% of their criteria
⚠ Missing: They want "local support" (we're remote); risk of objection late in cycle

Decision process:
✓ Clear: 3-stage evaluation (product demo, reference calls, final approval)
⚠ Ambiguous: No stated timeline (when do they want to decide?)
Action: Clarify timeline in next meeting; press for Jan target

Identified pain:
✓ Operationally broken (using 3 tools, lots of manual workaround)
✓ Clear ROI (40% efficiency gain = $200K/year savings)
⚠ Pain is real for Operations team, but CFO (economic buyer) cares more about risk/compliance
Risk: If CFO's priorities are different, deal could stall

Champion/Promoter:
✓ Director of Operations is solid promoter (feels problem acutely)
⚠ No connection to CFO yet (economic buyer is unknown territory)
Action: Next meeting should introduce CFO connection or risk losing deal in final stage

Competition:
⚠ Vendor X is also in deal
   Their pricing is 20% lower; our advantage is support/UX
   Risk: Might lose on price if we don't lock in value early

Issues/concerns/objections:
✓ "Local support" — we should proactively address (offer remote + quarterly on-site)
✓ "Enterprise SLA" — we meet their requirements; emphasize early
⚠ "Price" — likely to surface in negotiations; prep for value-based discussion

Risk factors ranked by likelihood:
1. (High prob, medium impact) Timeline slips by 4–6 weeks due to CFO approval
2. (Medium prob, high impact) Price objection kills deal in final stage (lose to Vendor X)
3. (Medium prob, medium impact) Local support requirement becomes a blocker

Probability of close: 40–60% (down from initial 70% if we address timeline risk)

Recommended next steps:
1. Next call: confirm timeline with Director + start CFO introduction
2. Schedule reference call with similar customer (emphasize support value)
3. Prepare pricing justification (ROI story, not per-user comparison)
4. Develop "local support" alternative (quarterly on-site + dedicated Slack channel)

Sales rep assessment:
✓ Rep (Sarah) is solid; has closed similar deals before
✓ She's sensitive to CFO approval delays (learned the hard way)
⚠ She tends to over-promise support SLA; calibrate before customer conversations

Confidence in assessment: 75%
This is a winnable deal, but CFO approval and price are the two biggest risks.
We need to move on CFO introduction by end of month to keep Jan close alive.
```

### How You'd Collect It

**Phase 1:**
1. Select 5 deals from past 6 months (mix: 3 won, 2 lost)
2. Sales VP reviews each deal record and history
3. Assesses: what signals predicted the outcome? What did we miss?

**Phase 2–3:**
1. Pull active deals (agent hasn't seen them)
2. VP scores each (probability of close, key risks, next steps)
3. Agent scores each
4. Compare: did agent spot same risks? Same probability estimate?

**Phase 4–5:**
1. Agent reviews deals weekly during sales forecast
2. Compare agent assessment (50% probability) to actual result (closed or lost)
3. Agent learns: "I was optimistic on deals with no CFO connection" or "I missed this pattern"

---

## 5. Product: Senior PM Feature Prioritization Decisions

### Who's the Expert?

**Chief Product Officer** or **Senior Product Manager** with 5+ years at the company (or in similar category). They understand customer needs, competitive dynamics, and company strategy.

### What Inputs They Review

- Feature request (what problem does it solve? How often is it requested?)
- Customer impact (how many customers want this? How valuable to them?)
- Strategic alignment (does this move us toward our vision?)
- Competitive positioning (are competitors doing this? Would we gain/lose?)
- Resource requirement (what's the engineering effort? Design effort?)
- Dependencies (does this require other features first?)
- Risk factors (what could go wrong if we build this?)

### What Their Output Looks Like

```
Feature Prioritization Review: Dark Mode Support

Strategic alignment: Moderate
Customer demand: High (40% of customers request)
Competitive necessity: High (all competitors have it)
Engineering effort: Medium (3 weeks for core + mobile)
Overall recommendation: BUILD, but as lower-priority item
Confidence: 85%

Customer impact analysis:
✓ 40% of customers request it (real demand signal)
✓ Particularly requested by teams working evenings/nights (>20% of base)
✓ Net impact: Likely to improve retention by 2–3% in these segments
⚠ Not a primary pain point (ranked #7 in feature request, not #1)
⚠ Churn risk if we don't have it: Low (competitors have it, but not a deal-breaker)

Business impact:
✓ Retention improvement: 2–3% = $500K–$750K ARR impact
✓ No new revenue (doesn't help with new customer acquisition)
⚠ Conversion impact: Minimal (prospects evaluate on core functionality, not dark mode)

Competitive assessment:
✓ Competitors have dark mode (standard feature category)
✗ Not a differentiator anymore (was 2 years ago; now table stakes)
Impact: Need to build eventually, but not urgent

Technical assessment:
✓ Straightforward engineering (toggle theme, CSS variables, etc.)
✓ No architectural changes required
⚠ Mobile implementation is trickier than web (iOS/Android complications)
✓ Design team ready (already scoped design work)

Resource trade-offs:
- 3 weeks of engineering time
- Opportunity cost: This 3 weeks could build [Feature X], which has higher retention impact (4%)

Strategic fit:
✓ Aligns with "improve developer experience" OKR
✗ Lower priority than other DX improvements (code intelligence, faster feedback loops)

Risk factors:
- Low risk overall (well-understood feature, low complexity)
- Quality risk: Need to test across many themes (dark mode might have subtle contrast issues)
- Maintenance burden: Low (CSS maintenance over time)

Probability recommendation:
Build: 70% confidence
Defer: 20% confidence (if engineering is constrained)
Skip: 10% confidence (only if resource crisis)

Recommended sequencing:
Phase 1 (Q2): Design completion + high-level implementation plan
Phase 2 (Q3): Web dark mode (2 weeks), basic mobile (1 week)
Phase 3 (Q4): Polish + testing across all themes

Wait-and-see factors:
- Monitor: Are prospects bringing this up during sales calls? (signals changing importance)
- Monitor: Are we losing deals because competitors have it? (signals competitive necessity)

Confidence in assessment: 85%
This is clearly worth building, but sequencing matters. If we're resource-constrained,
defer behind features with higher retention impact. Otherwise, queue for Q3.

---

Comparison to other pending features (for context):
- Dark mode: 2–3% retention impact, 3 weeks effort → 0.67–1% ROI
- Code intelligence: 4% retention impact, 6 weeks effort → 0.67% ROI
- Faster feedback loops: 3% retention impact, 4 weeks effort → 0.75% ROI

Recommendation: Build dark mode after code intelligence (higher ROI).
```

### How You'd Collect It

**Phase 1:**
1. Select 5 features from your backlog (mix: shipped, rejected, in-progress)
2. Senior PM assesses each: what was the decision rationale? How did it turn out?
3. Document: which signals mattered most? Which did we get wrong?

**Phase 2–3:**
1. Pull new feature requests (agent hasn't seen them)
2. PM scores each (priority, resource requirement, impact)
3. Agent scores each
4. Compare: did agent estimate effort? Impact? Strategic fit?

**Phase 4–5:**
1. Agent reviews incoming feature requests during planning
2. Compare agent recommendation to PM's decision (build/defer/reject)
3. Agent learns: "I overestimated competitive pressure" or "I underestimated effort"

---

## 6. Legal: Senior Counsel Contract Review

### Who's the Expert?

**General Counsel** or **Senior Contract Attorney** with 10+ years of commercial contract experience. They understand risk, precedent, and negotiation strategy.

### What Inputs They Review

- Contract type (SaaS agreement, vendor agreement, employment, etc.)
- Key terms (payment terms, liability limits, IP ownership, termination, SLAs)
- Industry norms (what do similar companies do?)
- Company risk tolerance (what are we willing to accept?)
- Negotiation history (what have we negotiated with this party before?)
- Precedent (what did we approve for similar contracts?)
- Red flags (what do we always push back on?)

### What Their Output Looks Like

```
Contract Review: SaaS Vendor Agreement — Datadog

Summary: Acceptable with minor changes
Recommendation: APPROVE with requested revisions
Confidence: 90%

Contract type: Standard SaaS agreement (vendor as service provider)

Key terms assessment:

Pricing:
✓ $2,500/month is market rate for your usage
✓ Annual discount (10%) is reasonable
✓ Price increase limited to 5% annually (acceptable)

Service levels (SLA):
✓ 99.9% uptime is industry standard for observability tools
✓ Penalty (service credit) is 5% for downtime (acceptable)
⚠ Credit caps at 30 days worth (limits liability); market standard is 90 days
Action: Request increase to 60 days; moderate priority

Liability:
⚠ Liability cap: 12 months of fees ($30K)
   Industry standard: 24 months of fees (~$60K)
   Risk: If they have a major outage, our recovery cost might exceed $30K
Action: Request increase to $60K; high priority

⚠ Vendor liability for indirect damages: Excluded (vendor's liability doesn't cover our lost revenue if they're down)
   Industry standard: Both parties exclude indirect damage
   Our risk: If they're down, we lose revenue, but can't claim it
Action: Accept (this is standard and mutual)

Data & security:
✓ Data encryption (at rest and in transit) required
✓ DPA (Data Processing Agreement) included
✓ SOC2 certification required (vendor maintains; we reviewed)
⚠ Data location: Data stored in US regions only (we operate globally)
Action: Request EU region option; low priority (accept if they can't do it)

Intellectual property:
✓ We retain IP for our data/code; vendor retains IP for their software
✓ License is perpetual (for our data)
⚠ License scope: Restricted to our company (can't share with subsidiaries)
Action: Request broader license (e.g., "company and subsidiaries"); low priority

Term & termination:
✓ 1-year term with auto-renewal (industry standard)
✓ 60-day termination notice (gives us time)
⚠ Early termination penalty: 3 months of fees if we terminate early
   Impact: $7,500 exit cost (acceptable given 1-year commitment)

Confidentiality:
✓ Standard NDA terms
✓ Excludes publicly disclosed information (reasonable)

Risk ranking:
1. (High) Liability cap is too low → Request increase to $60K
2. (Medium) SLA credit cap is too low → Request increase to 60 days
3. (Low) Data location limitation → Accept unless we have compliance need
4. (Low) License scope → Request subsidiary inclusion; accept if they decline

Precedent check:
✓ Aligns with our Slack and Figma agreements (similar terms)
✗ Different from AWS agreement (higher liability cap due to criticality)
   Action: Not applicable (AWS is more critical; accept lower cap for Datadog)

Negotiation strategy:
1. Lead with high-priority issue (liability cap)
   → "We need $60K cap given our criticality on observability; industry standard"
2. Bundle medium-priority (SLA credit)
   → "If you increase cap to $60K, we'll accept 30-day SLA penalty"
3. Accept low-priority items
   → "US-only data is fine for now; subsidiary license scope we can live with"

Confidence in assessment: 90%
This is a straightforward vendor agreement. The liability cap is the only real risk.
Everything else is standard. Recommend accepting their revision on liability cap,
then closing.

Timeline:
- Estimated negotiation: 1 round (2–3 days)
- Approval path: General Counsel → CFO (signature authority)
- Go-live: Can be immediate after execution
```

### How You'd Collect It

**Phase 1:**
1. Select 5 past contracts (mix: approved quickly, negotiated hard, had issues post-signature)
2. General Counsel reviews each: what was the assessment? What did we negotiate? What went wrong?
3. Document: which clauses mattered most? What's the red line?

**Phase 2–3:**
1. Pull new contracts (vendor agreements, customer agreements, partnerships)
2. GC scores each (risk assessment, priority changes, negotiation strategy)
3. Agent scores each
4. Compare: did agent identify same risks? Same priority?

**Phase 4–5:**
1. Agent reviews incoming contracts during deal process
2. Compare agent assessment to GC's decision (approve/negotiate/reject)
3. Agent learns: "I was too conservative on liability caps" or "I missed this precedent"

---

## 7. HR: Experienced Hiring Manager Candidate Evaluation

### Who's the Expert?

**VP People** or **Hiring Manager** with 10+ years of experience building and scaling teams. They understand culture fit, team dynamics, and what predicts job performance.

### What Inputs They Review

- Resume (background, experience, fit for role)
- Interview feedback (technical assessment, communication, problem-solving)
- Reference calls (prior managers' assessment, specific strengths/weaknesses)
- Cultural/team fit (personality, collaboration style, values alignment)
- Compensation expectations (are we in range?)
- Motivation (why do they want this job? Will they stay?)
- Red flags (job-hopping, gaps, misalignment)

### What Their Output Looks Like

```
Candidate Evaluation: Sarah Chen for Senior Product Manager

Overall recommendation: STRONG PASS (extend offer)
Confidence: 85%
Offer guidance: $160K base + $35K bonus + 0.25% equity

Assessment breakdown:

Background fit:
✓ 6 years PM experience (meets 5+ year requirement)
✓ 3 years at B2B SaaS companies (our domain)
✓ Experience with product-led growth (aligns with our strategy)
⚠ No mobile product experience (we're expanding mobile; she's web-only)
   Impact: Learning curve 4–6 weeks; manageable with mentorship

Technical assessment:
✓ Strong product thinking (can break down complex problems)
✓ Data literacy (understands metrics, can read SQL)
⚠ Limited data science background (most candidates at this level have some)
   Impact: Won't be self-sufficient on advanced analytics; okay for this role

Communication & collaboration:
✓ Clear communicator (interview was structured, easy to follow)
✓ Team player (references consistently mentioned "collaborative approach")
✓ Handles disagreement well (gave thoughtful pushback during case study)

Problem-solving:
✓ Case study assessment: Strong (ranked in top 25% of our candidates)
✓ Technical deep-dive: Good (understood tradeoffs, asked good questions)
✓ Prioritization exercise: Excellent (used data + customer input to defend choices)

Cultural / team fit:
✓ Values alignment: Mentioned company mission multiple times (genuine interest)
✓ Curiosity: Asked smart questions about roadmap and vision
✓ Team dynamic: References mentioned "brings out best in others"
⚠ Potential concern: Former team was very distributed (we're hybrid)
   Risk: May struggle with in-office collaboration (low probability)

Motivation:
✓ Clear reason for move (current company's strategy shift away from PMM)
✓ Excited about our product category
✓ Interested in mentorship opportunity (good for her growth and ours)
✓ Stability (not job-hopping; 3 years at last two companies)

Red flags analysis:
✓ No red flags identified
⚠ Minor: Small gap between jobs in 2019 (explained as sabbatical; reasonable)

Compensation expectations:
✓ Asked for $150K + bonus (we budgeted $160K)
✓ Reasonable expectations (aligned with market)
✓ Equity: Happy with 0.25% (no negotiation expected)

Comparison to other candidates:
- Candidate A: Slightly more experience, but poor cultural fit (rated 6/10)
- Candidate B: Stronger technical background, but less proven PMM experience (rated 7/10)
- Sarah: Best overall fit (rated 8.5/10)

Risk factors:
- Low risk: No obvious performance red flags
- Medium risk: Mobile product learning curve (but manageable)
- Low risk: Potential hybrid collaboration adjustment (unlikely to be real problem)

Recommended offer:
- Base: $160K (top of our range; justified by candidate quality)
- Bonus: $35K (strong incentive for performance)
- Equity: 0.25% (standard for this level)
- Start date: 4 weeks (allows for transition)

Onboarding:
- Assign: Herself as manager + 2 peer PMs for collaboration mentors
- Focus: Ramp on mobile product, customer research with top accounts
- Timeline: Productive contribution by week 6

Long-term assessment:
This is a high-probability strong performer. High retention likelihood (stable
career trajectory, genuine excitement about our direction). Could potentially
grow to Director level in 2–3 years.

Confidence in assessment: 85%
Recommend extending offer immediately. This candidate will impact product quality
and team velocity positively.
```

### How You'd Collect It

**Phase 1:**
1. Select 5 past hires (mix: high performers, medium, struggled)
2. Hiring manager assesses each looking back: what signals predicted success?
3. Document: which interview signals mattered? What did we misjudge?

**Phase 2–3:**
1. Pull new candidates (in pipeline, before final decision)
2. Hiring manager scores each (overall assessment, risks, prediction of success)
3. Agent scores each
4. Compare: did agent assess same strengths/risks?

**Phase 4–5:**
1. Agent screens candidates and provides assessments
2. Compare agent recommendation to hire/no-hire decision
3. At 6-month mark: did agent predict success correctly?
4. Agent learns: "I was too optimistic on technical skills" or "I missed culture fit issues"

---

## 8. Customer Success: Senior CS Manager Account Health Assessment

### Who's the Expert?

**VP Customer Success** or **Senior CS Manager** with 10+ years managing customer relationships. They understand account trajectory, risk signals, and expansion opportunities.

### What Inputs They Review

- Account health data (usage trends, feature adoption, support tickets)
- Relationship signals (engagement from customer champion, executive responsiveness)
- Business factors (contract renewal timing, expansion budget, competitive threats)
- Product fit assessment (is product solving the customer's main problem?)
- Team stability at customer (are key contacts changing? Is there turnover?)
- Market context (is customer's industry healthy? Are they growing?)

### What Their Output Looks Like

```
Account Health Review: Acme Corp — $120K ARR

Overall health: AT RISK (was Green 6 months ago)
Recommendation: IMMEDIATE INTERVENTION REQUIRED
Confidence: 80%

Health score: 45/100 (was 75/100 at last review)
Churn risk: 60% probability of non-renewal (was 5%)
Expansion risk: Unlikely in next 6 months

Health breakdown:

Usage trends:
✗ Feature adoption dropped 40% in past 2 months (was steady 70%)
✗ Monthly active users down from 80 to 45
✗ Usage is concentrated on 1 feature (not using 70% of platform)
  Risk signal: Product isn't delivering value across their use cases

⚠ Last login by admin: 45 days ago
  Signal: Disengagement at leadership level

Support tickets:
⚠ 12 tickets opened in past month (vs. historical 2–3/month)
✓ Resolution rate is still high (no quality issues)
  But: Spike in tickets suggests frustration or troubleshooting problems

Relationship:
✗ Champion (VP Operations) who championed the deal left the company (2 months ago)
   Impact: Lost internal advocate; new director (Tom) is untested
⚠ Tom has been responsive but seems less enthusiastic
   Risk: May not have same investment in our success

Executive engagement:
✗ QBR attendance: Last exec gave apologies; didn't attend last meeting
   Signal: We're not a priority

Competitive threat:
⚠ Heard through sales channel that Competitor X just won a pilot (different division)
   Risk: Competitor testing with them; could expand if we don't re-engage

Product fit:
⚠ Their original use case (workflow automation) is working okay
✗ But they wanted to expand to reporting (our reporting is weak)
   Unmet need: They shifted to Competitor X for reporting; now questioning overall platform fit
   Critical: If they move reporting to Competitor X, switching costs drop; easier to leave entirely

Expansion opportunities:
✗ Minimal (they're rethinking platform strategy)
⚠ If we can improve reporting, there's a $30K upsell opportunity
   But: Only viable if we re-engage and prove value

Business context:
✓ Company is growing (industry is healthy)
⚠ IT budget was reduced 15% YoY (cost pressure)
   Risk: Price increases would be rejected; they're looking to reduce spend

Risk ranking:
1. (Critical) Lost champion + new director disengagement
   → Action: Executive outreach from VP Customer Success (my direct call to new champion)
2. (Critical) Product-fit gap on reporting
   → Action: Product assessment; if we can deliver, offer it as re-engagement
3. (High) Competitor pilot in other division
   → Action: Intelligence gathering; prepare counter-pitch if they expand
4. (High) Usage drop + support spike
   → Action: Diagnostics call; understand what broke for them
5. (Medium) Cost pressure
   → Action: Prepare value justification for renewal

Intervention plan:

Immediate (this week):
1. I call new VP of Operations (Tom) directly
   Message: "We've noticed usage shift; want to understand if we're meeting your needs"
   Goal: Reconnect, understand pain, signal our commitment
2. Diagnostics call with operations team
   Goal: Understand why usage dropped; identify product gaps

Short-term (next 2 weeks):
1. Product assessment: Can we address their reporting need?
   If yes: Offer roadmap commitment (signals our investment)
   If no: Acknowledge gap; offer workaround or partnership
2. Competitive response: Understand Competitor X pilot
   If threat: Prepare executive briefing
3. Value justification: Rebuild case for renewal
   Goal: Offset cost pressure with ROI story

Medium-term (next 6–8 weeks):
1. If reporting is fixable: Pilot with them (shows progress)
2. QBR with executive team (reset relationship at leadership level)
3. Renewal discussion: Begin 90 days before contract end (plan early exit or renewal)

Success metrics for intervention:
- Usage returns to 60%+ adoption (indicates re-engagement)
- Tom signals satisfaction (qualitative, but key)
- Commitment to renewal by 45 days before contract end
- Ideally: Reporting feature commitment (sets up expansion conversation)

Risk of losing account:
- Current risk: 60% (serious, but recoverable with intervention)
- Post-intervention success: 25% (would still have residual risk)
- If we do nothing: 85% (likely to lose at renewal)

Confidence in assessment: 80%
This account is salvageable, but we need to move fast. The champion transition
and product-gap are fixable with urgency. If we don't move in the next 2 weeks,
churn probability will increase to 75%+.

This should be my (VP CS) personal priority for the next 30 days.
```

### How You'd Collect It

**Phase 1:**
1. Select 5 past accounts (mix: healthy, at-risk, churned)
2. CS VP assesses each: what were the health signals? What predicted the outcome?
3. Document: which signals mattered most? What did we miss?

**Phase 2–3:**
1. Pull current active accounts (agent hasn't evaluated them)
2. CS VP scores each (health score, churn risk, intervention needed)
3. Agent scores each
4. Compare: did agent identify same warning signals?

**Phase 4–5:**
1. Agent evaluates accounts monthly for health/risk
2. Compare agent assessment (60% churn risk) to actual outcome
3. Agent learns: "I was too pessimistic on accounts with new champions" or "I missed this usage pattern"

---

## Collecting Ground Truth: Summary Process

For any domain, follow this pattern:

### Step 1: Select Expert
- 10+ years experience (preferably in your company)
- Has made the decision 100+ times (not theoretical)
- Willing to explain their thinking

### Step 2: Collect Judgments
- Phase 1: 5 cases (mix of outcomes)
- Phase 2: 20–30 cases (more variety)
- Phase 3: 10–15 blind cases (real conditions)

### Step 3: Document Reasoning
Expert provides:
- Their recommendation (yes/no/maybe)
- Key factors that drove the decision
- Confidence level
- What they'd do differently with more information

### Step 4: Build Measurement
- Compare agent to expert judgment
- Measure accuracy (did agent match expert?)
- Measure confidence calibration (is agent confident when right?)
- Identify patterns (when does agent diverge from expert?)

### Step 5: Plan for Real World
- Phase 4–5: Measure outcomes (not just expert agreement)
- Example: Agent predicted "will close," deal actually closed → success
- Example: Agent predicted "will churn," account stayed → learning opportunity

---

## Pitfalls When Collecting Ground Truth

**Pitfall 1: Expert is too theoretical**
- Bad: "I'll tell you how I'd evaluate this"
- Good: "Here's a deal I actually evaluated; here's my assessment and why"
- Fix: Use real past cases; have expert reference their actual decision notes

**Pitfall 2: Not enough variety**
- Bad: "We'll use 3 cases" (too small to calibrate)
- Good: "We'll use 5 for Phase 1, 30 for Phase 2, 15 for Phase 3"
- Fix: Plan for enough cases to see patterns

**Pitfall 3: Ground truth is vague**
- Bad: "We'll know good vs. bad when we see it"
- Good: "Accuracy means >90% agreement with expert; confidence score >75%"
- Fix: Define what you're measuring upfront

**Pitfall 4: Expert changes their mind**
- Bad: "Let's not use ground truth; it's subjective"
- Good: "Let's lock in ground truth at Phase 1; evolve it based on real outcomes"
- Fix: Ground truth is your starting point, not your truth forever

---

## Using This Guide

When building an agent in any domain:
1. **Find your expert** (use this guide to understand what expertise you need)
2. **Collect ground truth** (5–10 real cases; document expert reasoning)
3. **Build Phase 1** (agent scores the 5 calibration cases)
4. **Measure accuracy** (compare agent to expert; aim for >90%)
5. **Iterate** (adjust agent based on mismatches)
6. **Move to Phase 2** (expand to 20–30 cases; aim for >85%)

The 8 domains above cover most business functions. If you're building an agent in a different area, follow the same pattern: find an expert, collect their judgment, measure agent accuracy against it.
