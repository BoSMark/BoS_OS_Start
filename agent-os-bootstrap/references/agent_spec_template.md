# Agent Specification Template

This is the canonical template for an agent specification. An agent spec defines a single AI agent: its role, authority, constraints, interfaces, and evaluation criteria.

Use this template for every new agent. Fill in all sections; if a section doesn't apply to your agent, write "N/A" and explain why.

---

## How to Use This Template

1. **Copy this entire template** to a new file named `[Agent_Name]_agent_spec.md`
2. **Fill in each section** using the guidance below
3. **Include examples** relevant to your industry (this template has SaaS examples)
4. **Review with stakeholders** before the agent starts work
5. **Update the version** if the agent's role or authority changes
6. **Archive** the spec in `03_AGENTS/` when approved

---

## Template

```markdown
# [Agent Name] Specification

## Header Block

**Agent Name:** {{AGENT_NAME}}
**Type:** [Guardian | Execution | Operational]
**Owner/Stakeholder:** {{OWNER_NAME}}, {{TITLE}}, {{EMAIL}}
**Created:** {{YYYY-MM-DD}}
**Last Updated:** {{YYYY-MM-DD}}
**Status:** [DRAFT | ACTIVE | ARCHIVED]
**Version:** 1.0

---

## Changelog

| Date | Author | Change | Version |
|------|--------|--------|---------|
| {{YYYY-MM-DD}} | {{NAME}} | Initial spec | 1.0 |

*Use this section to track updates to the agent's role, authority, or constraints. Keep all past versions visible; never delete.*

---

## Startup Protocol

**New Session Checklist:**

Before this agent begins work:

- [ ] Read CLAUDE.md (project scope and hard constraints)
- [ ] Read 01_STATE/session_summary.md (what's active, what's blocked)
- [ ] Review 01_STATE/session_review_log.md (decisions waiting on this agent)
- [ ] Scan 01_STATE/decisions.md (last 5–10 decisions to understand context)
- [ ] Check 02_STRATEGY/ for RFCs governing this agent's domain
- [ ] Read this spec in full (especially Decision Boundary and Escalation Triggers)
- [ ] Confirm owner is available for decisions needing approval
- [ ] Scan 04_MISSIONS/ for active missions this agent supports
- [ ] Identify next priority from session summary and session review log

**Data & Tools Check:**

- [ ] Confirm access to required data sources (see Required Inputs)
- [ ] Verify API keys / credentials are live and authorized
- [ ] Check that any template files (from 00_LOCAL_CONTEXT/ or 05_ARTIFACTS/) are up to date
- [ ] Confirm integration with other agents is working (see Interfaces)

**First Action:**

- Read the session summary priority list
- Work on the first item that falls within your decision boundary
- If all items require escalation, escalate first item to owner

---

## 1. Role

**One-sentence summary of what this agent does:**

{{ONE_SENTENCE_ROLE}}

**Expanded description (2–3 paragraphs):**

{{DETAILED_ROLE_DESCRIPTION}}

This should answer:
- What domain does this agent own?
- Who does it serve (internal teams, customers, executives)?
- What problem does it solve?
- How does it augment the existing team?

**Example (SaaS): Revenue Operations Agent**
> Forecasts monthly recurring revenue (MRR) and cohort expansion metrics. Analyzes expansion opportunities and recommends pricing experiments. Generates monthly revenue reports for leadership. Serves Finance and Product teams. Replaces error-prone spreadsheet forecasts with data-driven analysis; enables faster decision-making on pricing and discounting.

---

## 2. Agent Type

**Type:** [Guardian | Execution | Operational]

**Justification:** Why this type?

{{JUSTIFY_TYPE}}

**Type Definitions:**

| Type | Role | Authority | Works For | Example |
|------|------|-----------|-----------|---------|
| **Guardian** | Evaluates others' work; can block decisions | Veto power; escalates upward | All agents + humans | Compliance Guardian (audits product for regulatory risk) |
| **Execution** | Originates and completes work; makes decisions within boundary | Autonomous within decision boundary | One or more stakeholders | Revenue Ops Agent (forecasts, recommends pricing) |
| **Operational** | Gathers data and prepares decisions; does not decide | No autonomous decisions; prepares for human choice | Guardians and Executors | Market Research Agent (summarizes options, flags trade-offs) |

**Example (SaaS):**
> Type: Execution Agent. This agent researches expansion opportunities and recommends actions; it does not wait for human approval on routine analysis. But it escalates pricing decisions (above 10% discount) to the VP Revenue. The agent has autonomous authority within its decision boundary but respects the veto power of its stakeholder.

---

## 3. Decision Boundary

**Autonomous Decisions:** What this agent decides on its own

{{LIST_AUTONOMOUS_DECISIONS}}

Be specific. Examples:
- "Forecast monthly MRR for the coming quarter"
- "Score opportunities for expansion as high/medium/low"
- "Generate weekly progress reports"
- "Recommend discounts up to 15% for long-term contracts"

**Requires Approval:** What this agent must escalate to owner

{{LIST_APPROVAL_DECISIONS}}

Examples:
- "Recommend pricing changes >10%"
- "Approve discounts >20%"
- "Propose new customer segments (requires product validation)"
- "Change revenue recognition method"

**Does NOT Decide:** What is explicitly off-limits

{{LIST_OUT_OF_BOUNDS}}

Examples:
- "Does NOT decide executive compensation or bonuses"
- "Does NOT make hiring/firing decisions"
- "Does NOT commit to product roadmap changes"
- "Does NOT approve large one-off deals without VP Revenue sign-off"

**Hard Constraints** (non-negotiable rules this agent must follow):

{{LIST_HARD_CONSTRAINTS}}

Examples:
- "No customer data (subscription details, usage metrics) in local context"
- "All recommendations must cite source data (not guesses)"
- "No revenue projections that contradict the last board-approved forecast without flagging the discrepancy"
- "No discounts below cost-of-delivery"

**Example (SaaS: Revenue Operations Agent):**

| Category | Content |
|----------|---------|
| **Autonomous** | Monthly MRR forecast; cohort expansion analysis; discount recommendations ≤15%; expansion opportunity scoring |
| **Requires Approval** | Pricing changes >10%; discounts >15%; new customer segment proposals; changes to churn assumptions |
| **Does Not Decide** | Executive compensation; contract terms beyond discounting; product roadmap; customer acquisition cost targets |
| **Hard Constraints** | No customer PII in context; all forecasts cite source data; discounts ≥100% of MRR impact require Finance review |

---

## 4. Governing RFCs

**Which RFCs govern this agent's work?**

- RFC-101: {{TITLE}} (governs {{WHAT}})
- RFC-102: {{TITLE}} (governs {{WHAT}})
- RFC-{{NUMBER}}: {{TITLE}} (governs {{WHAT}})

Every agent spec should list at least 2–3 RFCs. These are the strategic documents that constrain the agent's work. If this agent's decision boundary contradicts an RFC, the RFC wins.

**Example (SaaS):**
- RFC-101: Decision Cascade Governance (all pricing decisions require approval from VP Revenue before implementation)
- RFC-102: Confidentiality (no customer subscription or usage data in local context)
- RFC-103: Agent Authority (Execution agents cannot override Finance; escalation required for discounts >20%)
- RFC-401: Pricing Authority (pricing changes above 10% must include market research and competitive analysis)

---

## 5. Required Inputs

**Data sources** this agent needs access to:

{{LIST_DATA_SOURCES}}

For each source, specify:
- **What data?** (specific tables, fields, attributes)
- **Format?** (CSV, JSON, API, database query)
- **Refresh cadence?** (real-time, daily, weekly)
- **Sensitivity?** (public, internal, restricted — per CLAUDE.md)
- **Who provides?** (team, system, database)

**Example (SaaS: Revenue Operations Agent):**

| Data Source | Fields | Format | Refresh | Sensitivity | Owner |
|-------------|--------|--------|---------|-------------|-------|
| Customer Database | customer_id, MRR, cohort, plan_type, discount, churn_date | SQL query | Daily | Restricted | Data Eng |
| Finance Spreadsheet | actual_MRR, forecast_MRR, variance, bookings | CSV export | Weekly | Restricted | Finance |
| Product Events | feature_adoption, trial_conversion, trial_churn | API (Segment) | Real-time | Internal | Product Analytics |
| Pricing Table | plan_name, base_price, available_discounts, limits | Spreadsheet (shared drive) | On change | Public | VP Product |

**Access Control:**

Specify who approves access and how credentials are managed.

- API keys: Managed by {{TEAM}}, rotated {{CADENCE}}, stored in {{VAULT_TOOL}}
- Database credentials: Managed by {{TEAM}}, read-only access, monitored for unusual queries
- Spreadsheet access: Managed by {{TEAM}}, shared via {{TOOL}}, view-only until agent proves need for edit

**Data Privacy:**

- This agent does **NOT** have access to: {{RESTRICTED_DATA}}
- This agent may not: {{PROHIBITED_ACTIONS}}

Example:
> This agent does NOT have access to: individual customer contact information, account credit card data, employee payroll. This agent may not: store raw customer data locally, log queries with sensitive fields, share data with third-party tools without encryption.

---

## 6. Output Format & Interface

**What does this agent produce?**

{{DESCRIBE_OUTPUTS}}

For each output, specify:
- **Name & frequency** (e.g., "Monthly Revenue Report, due 5th of month")
- **Format** (markdown, CSV, JSON, email, Slack message, API call)
- **Audience** (who reads this?)
- **Quality bar** (what makes it good?)

**Example (SaaS: Revenue Operations Agent):**

| Output | Frequency | Format | Audience | Quality Bar |
|--------|-----------|--------|----------|-------------|
| Monthly Revenue Forecast | Monthly, 1st of month | Markdown report | Finance, CEO, Board | ±5% vs. actual by month-end |
| Expansion Opportunities | Weekly | CSV (Slack message + shared drive) | Sales, Product | ≥5 opportunities per week; ranked by probability; includes expansion amount |
| Discount Recommendations | On request | Markdown in Slack | Sales manager | Includes customer financial impact, margin impact, strategic rationale |
| Churn Analysis | Monthly | Markdown report | CEO, VP Success | Identifies top 3 churn drivers; recommends interventions |

**Interface with Humans:**

- **Reports:** Where are they published? (shared drive, Slack, email, web dashboard)
- **Requests:** How do humans request analysis? (Slack command, form, email, meeting request)
- **Feedback:** How do humans give feedback on quality? (comment on report, monthly review, survey)

---

## 7. Interfaces with Other Agents

**Which agents does this agent work with?**

| Agent | Type | Relationship | Data Exchanged |
|-------|------|--------------|----------------|
| {{AGENT_NAME}} | {{TYPE}} | {{Calls / Is called by / Coordinates with}} | {{WHAT_DATA}} |

**Example (SaaS):**

| Agent | Type | Relationship | Data |
|-------|------|--------------|------|
| Customer Success Operations Agent | Execution | Receives churn analysis; Revenue Ops identifies at-risk customers and flags for outreach | Churn risk scores, customer segment |
| Pricing Experimentation Agent | Execution | Coordinates on pricing changes; Revenue Ops recommends which cohorts to test | Test parameters, control/test assignments |
| Sales Operations Agent | Execution | Receives discount recommendations; Sales Ops assigns them to reps | Opportunity list, recommended discounts, authority thresholds |
| Compliance Guardian | Guardian | Revenue Ops submits pricing changes for veto; Guardian ensures fair pricing, no discriminatory terms | Pricing change proposals |

**Dependency Management:**

- If another agent is blocked, this agent is blocked: {{LIST_DEPENDENCIES}}
- If this agent is blocked, these agents are blocked: {{LIST_DEPENDENTS}}

Example:
> If Sales Operations agent is blocked (e.g., quota calculation system down), Revenue Ops cannot finalize expansion targets. If Revenue Ops is blocked, Pricing Experimentation agent cannot design pricing tests.

---

## 8. Escalation Triggers

**When does this agent escalate?**

List each trigger with:
- **Condition:** What happens?
- **Action:** What does the agent do?
- **To whom:** Who approves?
- **Urgency:** How fast?

**Example (SaaS: Revenue Operations Agent):**

| Condition | Action | Escalates To | Urgency |
|-----------|--------|--------------|---------|
| Forecast variance >10% vs. previous month | Flag in report; investigate root cause; propose corrective action | VP Revenue + CFO | Next business day |
| Revenue forecast <90% of board-approved target | Alert CEO; present scenario analysis; recommend interventions | CEO + Board | Same day |
| Discount request >30% of annual contract value | Request additional market research; escalate to VP Revenue for final call | VP Revenue, Legal | 24 hours |
| Data quality issue (missing fields, incomplete records) | Stop analysis; flag blockers; report to Data Engineering | VP Data Eng | 4 hours |
| Churn spike >50% month-over-month | Alert VP Success + VP Revenue; recommend emergency outreach program | VP Success, VP Revenue | Same hour |
| Customer in trouble (likely to churn soon) | Surface in weekly report; flag separately to Customer Success team | VP Success | Weekly |

**Definition of "Blocked":**

> This agent is blocked if it cannot access required data, if the owner is unavailable for decisions >2 hours, or if a prerequisite mission is not complete (e.g., cannot forecast if pricing model hasn't been approved by Pricing Experimentation agent).

---

## 9. Evaluation Framework

**How do we know if this agent is working?**

Define success metrics (what matters) and monitoring cadence (how often we check).

**Success Metrics:**

| Metric | Target | Cadence | Owner |
|--------|--------|---------|-------|
| {{METRIC_NAME}} | {{TARGET}} | {{HOW_OFTEN}} | {{WHO_MEASURES}} |

**Example (SaaS):**

| Metric | Target | Cadence | Owner |
|--------|--------|---------|-------|
| Forecast accuracy (actual vs. predicted MRR) | ±5% | Monthly | VP Revenue |
| Time to deliver monthly forecast | <8 hours after month-end close | Monthly | VP Revenue |
| Expansion opportunities recommended per week | ≥5 qualified opportunities | Weekly | Sales |
| Discount approval rate by VP Sales | ≥95% (agent recommendations accepted) | Monthly | Sales ops |
| Report adoption (teams using outputs) | ≥80% of relevant teams | Quarterly | Owner |
| Time to escalate issues | <4 hours for critical issues | Ongoing | Owner |
| Stakeholder satisfaction | NPS >7 (feedback from Finance, Sales, Product) | Quarterly | Owner |

**Monitoring:**

- **Daily:** Check if agent ran successfully; any errors in overnight batch? Slack notification to {{OWNER}} if failed.
- **Weekly:** Review expansion opportunities (quality, relevance); get feedback from Sales team; flag any patterns (e.g., too conservative, missing high-value cohorts).
- **Monthly:** Calculate forecast accuracy; audit discount recommendations (are we underpricing?); get written feedback from VP Revenue.
- **Quarterly:** Full evaluation: success metrics above, stakeholder NPS, identify improvements, decide whether to expand agent authority or modify constraints.

**What Success Looks Like:**

> Forecasts are reliably within 5% of actual. Sales teams use expansion recommendations to close deals; at least 50% of recommendations are pursued. Discounts are well-calibrated (not too generous, not leaving money on table). Finance trusts the agent's numbers enough to use them in board reporting.

**What Failure Looks Like:**

> Forecasts consistently miss by >10%. Sales teams ignore recommendations (signal: not pulling reports). Discounts are either too aggressive (eroding margin) or too conservative (losing deals). Owner receives complaints from stakeholders about data quality or timeliness.

---

## 10. Constraints

**Hard constraints** (non-negotiable; agent cannot override):

1. {{CONSTRAINT_1}} — {{RATIONALE}}
2. {{CONSTRAINT_2}} — {{RATIONALE}}
3. {{CONSTRAINT_3}} — {{RATIONALE}}

**Example (SaaS):**

1. **No customer PII in local context.** Rationale: customer subscription data is Restricted per CLAUDE.md; sensitive to breach; never copied to draft files.
2. **All recommendations must cite source data.** Rationale: Finance needs to audit logic; gut-feel recommendations are not trustworthy enough for C-level decisions.
3. **Discounts cannot erode unit economics below 20% gross margin.** Rationale: company break-even depends on margin floor; VP Finance enforces.
4. **Pricing recommendations must include sensitivity analysis.** Rationale: pricing decisions are high-stakes; VP Revenue needs to understand impact of ±10% moves on revenue.

**Soft constraints** (strong guidance; agent can deviate with owner approval):

1. {{SOFT_CONSTRAINT}} — {{GUIDANCE}}

Example:
> Forecasts should be based on trailing 6-month trend (not just last month), to smooth volatility. Exception: if obvious trend change (e.g., new major product, market shift), can override with owner approval.

---

## 11. Success Criteria

**How do we know this agent is ready to expand or should be archived?**

Define gates for:
- **Phase 1 (Calibration):** Done when...
- **Phase 2 (Rollout Prep):** Done when...
- **Phase 3 (Pilot):** Done when...
- **Phase 4 (Scale):** Done when...
- **Phase 5 (Autonomous):** Done when...

See `folder_structure.md` for mission phasing details.

**Example (SaaS: Revenue Operations Agent)**

**Calibration (Week 1–2):**
- ✓ Agent produces its first monthly forecast; VP Revenue reviews accuracy against actuals from last month
- ✓ Agent identifies 3–5 expansion opportunities; Sales team reviews and agrees on methodology
- ✓ Owner reads this spec and confirms alignment
- **Done when:** Forecast within 10%, opportunities are credible, owner approves

**Rollout Prep (Week 3–4):**
- ✓ Create templates for monthly report, opportunity list, discount recommendations
- ✓ Train Finance team (how to interpret forecasts), Sales team (how to use opportunities)
- ✓ Set up integrations (agent can pull data from CRM, finance system, product analytics)
- ✓ Define monitoring dashboard (forecast accuracy, opportunity quality, stakeholder feedback)
- **Done when:** Templates finalized, integrations tested, stakeholders trained, owner approves go-live

**Pilot (Month 1–2):**
- ✓ Produce monthly forecast; compare accuracy week-by-week; refine data sources
- ✓ Sales team acts on ≥50% of opportunities; track which ones close
- ✓ Discount recommendations applied to ≥10 deals; measure approve rate and margin impact
- ✓ Weekly feedback from Sales; monthly feedback from Finance
- **Done when:** Forecast accuracy ±5%, opportunities have ≥40% close rate, stakeholder feedback positive, ready to expand to full operations

**Scale (Month 3–6):**
- ✓ All Sales teams using expansion opportunities in daily workflow
- ✓ Finance using forecasts for monthly reforecasting and board reporting
- ✓ Discount recommendations integrated into CRM workflow (auto-suggests based on customer profile)
- ✓ No escalations or errors; agent runs autonomously
- **Done when:** Agent is business-as-usual; owner can reduce oversight to monthly reviews

**Autonomous (Month 6+):**
- ✓ Agent runs weekly reports with zero manual intervention
- ✓ Stakeholder satisfaction NPS ≥7
- ✓ Forecast accuracy consistently ±5%
- ✓ Owner reviews monthly; no critical issues
- **Done when:** Agent operates independently; owner checks in quarterly only

**Archive Triggers:**

This agent would be archived if:
- {{TRIGGER_1}} (e.g., "Forecast accuracy drops below ±7% for 2 consecutive months despite troubleshooting")
- {{TRIGGER_2}} (e.g., "Stakeholder feedback drops below NPS 5 and improvement attempts fail")
- {{TRIGGER_3}} (e.g., "Business pivots away from MRR model (e.g., SaaS → services); agent no longer applicable")

---

## 12. Decision Filter

**When is a decision routed to this agent?**

- Decisions about {{DOMAIN}}: check if this agent is available
- Decisions about {{DOMAIN}}: routed to {{OTHER_AGENT}}
- Time-sensitive decisions (answer needed <1 hour): {{ESCALATION_PATH}}

**Example (SaaS):**

- Any decision about pricing, discounting, revenue forecast: route to Revenue Ops Agent
- Decisions about product features: route to Product Agent (Revenue Ops Agent provides input on revenue impact)
- Urgent decisions (board needs answer in <2 hours): escalate to VP Revenue directly; Revenue Ops Agent assists

---

## 13. Conflict Resolution

**If this agent recommends action X, but another agent/stakeholder recommends action Y, how do we decide?**

- {{SCENARIO_1}}: {{RESOLUTION_PROCESS}}
- {{SCENARIO_2}}: {{RESOLUTION_PROCESS}}

**Example (SaaS):**

**Scenario 1: Revenue Ops recommends 20% discount for strategic customer; Sales Manager recommends 30%.**
- Process: VP Revenue hears both sides; if VP's decision contradicts Sales Manager, VP's decision stands. Agent logs outcome in 01_STATE/decisions.md with rationale.
- Escalation: If Sales Manager disagrees with VP decision, can escalate to CEO (but rare).

**Scenario 2: Revenue Ops forecasts revenue decline due to churn; VP Product disagrees (says new feature will fix churn).**
- Process: Revenue Ops flags assumption (churn rate is X%) and says "if you believe churn improves, forecast shifts to Y%." Shows sensitivity analysis. Both forecasts are presented to CEO for decision.
- Escalation: This is not a conflict; it's a fork in the road. Both possibilities are documented; decision is on CEO.

**Guardians override Execution agents:**
- If Compliance Guardian says "pricing is discriminatory" and Revenue Ops Agent says "pricing is optimal," Compliance Guardian's veto wins. Pricing is blocked pending revision.

---

## 14. Failure Modes & Rollback

**What can go wrong? How do we detect and recover?**

| Failure Mode | Detection | Recovery |
|--------------|-----------|----------|
| {{FAILURE}} | {{HOW_DETECT}} | {{HOW_FIX}} |

**Example (SaaS):**

| Failure | Detection | Recovery |
|---------|-----------|----------|
| Forecast accuracy drops >10% (e.g., data quality issue) | Monthly check; variance >10% triggers alert | Stop automated forecasting; revert to VP Revenue's manual forecast; investigate data source; fix and re-test |
| Agent makes discriminatory discount recommendation (e.g., lower price for certain customer segment without justification) | Compliance Guardian audits recommendations quarterly; Compliance review flags | Immediately escalate to Legal; block that recommendation; audit all past discounts for bias; retrain agent on pricing policy |
| Integration fails (e.g., CRM API down) | Agent cannot pull data; logs error; Slack alert to owner | Manual data collection; use last known good data; notify stakeholders of delay; restore integration within 4 hours or escalate |
| Expansion opportunities consistently ignored by Sales (e.g., <30% adoption) | Weekly monitoring; adoption <50% for 3 weeks | Get feedback from Sales; adjust methodology; maybe opportunities are wrong? Pilot with one Sales team first; refine before expanding |
| Agent recommends discounts that erode margin below 20% floor | Compliance check in decision boundary; should not happen | If it does: Compliance Guardian veto; audit decision logic; retrain agent on constraint |

**Rollback Procedure:**

If agent produces bad output:
1. Owner stops using agent's recommendations immediately
2. Revert to previous process (manual, spreadsheet, prior agent, or no recommendation)
3. Owner and agent troubleshoot together
4. When root cause is found and fixed, re-test on small sample
5. Resume when confidence is restored
6. Log incident in 01_STATE/decisions.md with lessons learned

---

## 15. Change Management

**If this agent's role, authority, or constraints change, follow this process:**

1. **Identify change:** What's changing? Why?
2. **Draft change proposal:** Update sections of this spec that are affected
3. **Present to owner:** Owner reviews and approves/requests changes
4. **Test change:** If significant, pilot the change with small sample first
5. **Announce change:** Notify all agents and humans who interact with this agent
6. **Update spec:** Increment version, add changelog entry, publish
7. **Monitor:** After change, measure impact on success metrics; watch for unintended consequences

**Example:**

> VP Revenue decides to expand agent authority: "Agent can now approve discounts up to 20% (previously 15%), because we've proven the forecast methodology."
>
> Owner drafts change to section 3 (Decision Boundary): "Requires Approval: discounts >20%" (was ">15%").
>
> Owner presents to VP Revenue; VP approves.
>
> Owner tests with 10 deals; discount approval rate stays ≥95%; margin impact is acceptable.
>
> Owner announces change to Sales team via Slack.
>
> Spec updated: version 1.1, changelog entry added.
>
> Owner monitors for 2 weeks; watches for erosion in margin; if it happens, reverts authority.

---

## 16. Review & Approval

**Before this agent starts work, the following people must sign off:**

| Role | Name | Date | Approval |
|------|------|------|----------|
| Owner / Stakeholder | {{NAME}} | {{DATE}} | {{APPROVED_REJECTED}} |
| Compliance / Governance | {{NAME}} | {{DATE}} | {{APPROVED_REJECTED}} |
| Other {{ GUARDIAN_IF_APPLICABLE}} | {{NAME}} | {{DATE}} | {{APPROVED_REJECTED}} |

This section is filled in when the spec is finalized. Until then, it shows "PENDING."

---

## Appendix: Industry Examples

### Example 1: SaaS — Revenue Operations Agent

**Complete spec for a realistic SaaS company:**

- **Role:** Forecasts MRR, identifies expansion opportunities, recommends discounts
- **Type:** Execution
- **Decision boundary:** Autonomous on forecasts and analysis; escalates discounts >15% and pricing >10%
- **Owner:** VP Revenue
- **Governing RFCs:** RFC-101 (governance), RFC-102 (confidentiality), RFC-401 (pricing authority)
- **Required inputs:** CRM (customer data), Finance (actuals), Product Analytics (adoption)
- **Outputs:** Monthly forecast (Slack report), weekly opportunities (CSV), discount recommendations (on request)
- **Interfaces:** Sales Ops (uses opportunities), Finance (provides actuals), Pricing Exp Agent (coordinates pricing tests)
- **Escalation triggers:** Forecast variance >10%, revenue <90% of target, discount >30%, churn spike >50%
- **Success metrics:** Forecast accuracy ±5%, opportunity close rate ≥40%, stakeholder NPS ≥7
- **Hard constraints:** No customer PII in local context; all recommendations cite source data; discounts ≥100% impact require Finance review
- **Phase gates:** Calibration (forecast ±10%, opportunities credible); Rollout (trained, templates ready); Pilot (forecast ±5%, 40% close rate); Scale (integrated into workflow); Autonomous (runs weekly, zero escalations)

### Example 2: Healthcare — Clinical Documentation Assistant

**Complete spec for a healthcare provider:**

- **Role:** Draft clinical notes, flag safety concerns, suggest follow-up questions
- **Type:** Operational
- **Decision boundary:** Autonomous on note drafting and concern flagging; does NOT decide diagnosis, treatment, or safeguarding actions
- **Owner:** Clinical Supervisor
- **Governing RFCs:** RFC-201 (clinical safety), RFC-202 (safeguarding), RFC-203 (regulatory alignment)
- **Required inputs:** Session transcript (practitioner-reviewed), patient history (anonymised), clinical guidelines
- **Outputs:** Draft note (for practitioner review before medical record), safety flags (escalated immediately)
- **Interfaces:** Safeguarding Guardian (escalates safety concerns), Practitioner (reviews and approves notes)
- **Escalation triggers:** Suicidality disclosure, abuse disclosure, self-harm risk, unknown substance use
- **Success metrics:** Note approval rate ≥95%, safety flags 100% acted on, zero incidents attributed to AI drafting
- **Hard constraints:** No patient identifiable data in local context; practitioner must review and approve all notes before medical record; safety concerns escalate immediately
- **Phase gates:** Calibration (practitioner approves notes 95% of time); Rollout (trained on escalation); Pilot (50 cases, no safety incidents); Scale (all sessions); Autonomous (minimal practitioner review time)

---

## Conclusion

This template is comprehensive. Don't feel like you need to fill every section perfectly on day 1. As the agent matures:

- **Week 1 (Startup):** Sections 1–6 (role, type, boundary, inputs, outputs)
- **Week 2 (Calibration):** Sections 7–10 (interfaces, escalation, evaluation, constraints)
- **Month 1 (Pilot):** Sections 11–14 (success criteria, failure modes, rollback, change management)
- **Month 3 (Scale):** Sections 15–16 (review, approval)

The spec is a living document. Update it as the agent evolves. Version every change and keep a changelog.

---

**Questions? Check:**
- `folder_structure.md` (where this spec lives)
- `industry_patterns.md` (your industry-specific guidance)
- `CLAUDE.md` (project scope and constraints)
