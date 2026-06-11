# Industry-Specific BoS OS Patterns

**Author:** Tim Barker, Mark Littlewood and Business of Software

This guide explains how to tailor the BoS OS folder structure, strategy documents, and agent types for different industries. Each industry has different regulatory pressures, stakeholder accountability requirements, and operational rhythms.

---

## SaaS / Technology (Default Implementation)

This is the baseline pattern. Most organizations start here and specialize from it.

### Primary Strategy Documents
- Decision Cascade Governance
- Confidentiality (protect customer data, financial terms)
- Agent Authority (which agents can commit to APIs, databases, contracts)
- Engineering Change Control (code review gates, deployment approval)
- Pricing and Contract Authority (who can approve discounts, usage terms)

### Regulatory / Compliance Bodies
- **SOC 2 Type II** (if serving enterprise customers)
- **GDPR** (if serving EU customers; privacy strategy documents)
- **Industry standards:** ISO 27001 (information security), ISO 9001 (quality)
- **Customer contracts:** SLAs, indemnification, liability caps

### Guardian Agents Required by Default
- **Security Guardian:** Veto on any change to authentication, data handling, or access control
- **Compliance Guardian:** Audits all customer-facing claims and contracts
- **Engineering Quality Guardian:** Approves production deployments

### Evaluation Frameworks
- **Deployment velocity:** Frequency and size of releases (target: daily or weekly)
- **Customer health:** NPS, churn, support ticket velocity
- **Security posture:** Vulnerability response time, SOC 2 audit outcomes
- **Financial performance:** ARR growth, unit economics, CAC payback

### Common Hard Constraints
1. No customer data (PII, usage metrics, settings) goes into training or local context
2. No API keys, database credentials, or access tokens are stored in git
3. All production changes must have a rollback plan
4. Customer-impacting decisions require approval from product or exec team
5. Price commitments must be approved by legal and finance
6. Code commits must reference a ticket or strategy document
7. Major feature work must have a design doc reviewed by engineering leadership

### Example Agent Spec: Revenue Operations Agent
```
Role: Forecast revenue, manage pricing experiments, optimize expansion motion
Type: Execution Agent (reports to Finance leadership)
Decision boundary:
  - Autonomous: Forecast updates, opportunity scoring, discount analysis
  - Requires approval: Pricing changes >10%, discounts >20%, new packaging
Escalates to: CFO if revenue impact >$100K or customer relationship at risk
Success metric: Revenue forecast accuracy >85%
```

### Example Mission: Customer Expansion Playbook
- **Phase 1:** Work with 3 high-value customers to refine expansion messaging
- **Phase 2:** Build sales playbook, train team, create assets
- **Phase 3:** Pilot with 20 customers, measure expansion rate
- **Phase 4:** Rollout to full sales team, monitor conversion
- **Phase 5:** Autonomous operation with weekly reviews

---

## Healthcare (Strict Governance)

Healthcare is high-stakes and heavily regulated. Patient safety is paramount. The agent OS must be designed to escalate clinical decisions, not make them.

### Primary Strategy Documents
- Decision Cascade Governance
- Confidentiality & Patient Privacy (HIPAA, GDPR, local health regulations)
- Clinical Safety (no agent generates, modifies, or approves clinical content without clinical review)
- Safeguarding and Duty of Care (no agent makes safeguarding decisions)
- Regulatory Alignment (CQC, Care Quality Commission standards; NICE guidelines)
- Audit and Compliance (all clinical decisions logged; regular audit reviews)
- Consent and Transparency (patients know when AI is involved; opt-out available)

### Regulatory / Compliance Bodies
- **National bodies:** CQC (UK), CMS (US), provincial health ministries (Canada)
- **Accreditation:** URAC (US), BACP (UK counseling), state medical boards
- **Patient safety:** Joint Commission, AHRQ Patient Safety Databases
- **Data protection:** HIPAA (US), UK GDPR, local health authority requirements
- **Professional standards:** BMA (UK doctors), AMA (US doctors), nursing boards

### Guardian Agents Required by Default
- **Clinical Safety Guardian:** Veto on any clinical output; escalates all patient-relevant decisions to practitioners
- **Safeguarding Guardian:** Reviews all safety concerns; decides whether to escalate to law enforcement or safeguarding teams
- **Regulatory Compliance Guardian:** Audits alignment with CQC/CMS requirements and accreditation standards
- **Patient Privacy Guardian:** Enforces HIPAA/GDPR compliance; reviews all data handling

### Evaluation Frameworks
- **Patient safety:** Adverse event rate, incident reports, complaint themes
- **Regulatory compliance:** CQC ratings, audit outcomes, accreditation status
- **Clinical effectiveness:** Symptom improvement, treatment completion, readmission rates (if applicable)
- **Patient trust:** NPS, consent rates, privacy incident rate (should be zero)
- **Practitioner confidence:** Feedback from clinicians, adoption rates of agent-assisted workflows

### Common Hard Constraints
1. **No clinical content generation without clinical review:** Agents may draft, but a qualified practitioner must approve before it reaches a patient
2. **No direct patient interaction:** Agents support practitioners; they do not consult patients
3. **No safeguarding decisions:** These remain with qualified staff (doctors, social workers, safeguarding leads)
4. **No patient data in local context:** PHI must stay in secure systems; never extracted to drafts or notes
5. **All patient interactions are logged:** Audit trail of who accessed what, when, and why
6. **Informed consent:** Patients are told if AI is involved in their care
7. **Right to opt out:** Patients can request human-only care; no penalty for opting out
8. **Confidentiality by default:** No disclosure of patient identity, diagnosis, or outcomes except to authorized practitioners
9. **Incident escalation:** Any safety concern, privacy breach, or safeguarding issue escalates immediately to leadership
10. **Professional liability:** All AI-assisted outputs are attributed to the responsible clinician

### Example Agent Spec: Clinical Documentation Assistant
```
Role: Draft clinical notes after practitioner review; flag safety concerns
Type: Operational Agent (supports clinicians)
Decision boundary:
  - Autonomous: Summarize session content, flag word frequency anomalies, suggest follow-up questions
  - Does NOT decide: Diagnosis, treatment plan, risk level, discharge decision, safeguarding action
Escalates to: Supervising clinician if note suggests safety concern (suicidality, abuse disclosure, etc.)
Clinical review: Practitioner must read and approve all AI-drafted notes before they enter medical record
Success metric: Notes approved by clinician 95% of the time; zero safety incidents attributed to AI drafting
```

### Example Hard Constraint: Patient Privacy
> No agent may process, store, or reference patient personal health information (PHI) in 00_LOCAL_CONTEXT/ or any tracked file. Patient names, identifiers, diagnoses, contact information, and clinical notes stay in the secure EHR system only. If a case example is needed, it must be fully anonymised (date of birth stripped, all names replaced with "Patient A", etc.) and approved by the Privacy Guardian before going to tracked files.

---

## Financial Services (Highest Regulation)

Financial services faces constant regulatory scrutiny, market surveillance, and audit. Decisions must be traceable and justified.

### Primary Strategy Documents
- Decision Cascade Governance
- Confidentiality (customer account data, trading information, financial records)
- Regulatory Alignment (SEC, FINRA, FCA, CFTC requirements; anti-money laundering)
- Fiduciary Duty (decisions benefiting clients, not the firm; conflicts of interest disclosed)
- Market Surveillance and Compliance (suspicious activity reporting, trade reporting)
- Audit and Logging (every decision, every trade, every contact logged with timestamp, user, rationale)
- Escalation and Approval (dollar thresholds for manual review, conflict resolution)
- Risk Management (counterparty risk, market risk, operational risk gates)

### Regulatory / Compliance Bodies
- **US:** SEC (securities), FINRA (brokers), OCC (banks), CFTC (derivatives)
- **EU:** FCA (UK), ESMA (EU-wide), BaFin (Germany)
- **Global:** FATF (anti-money laundering), Basel Committee (bank capital requirements)
- **Auditors:** External auditors (annual), Internal Audit, Compliance teams

### Guardian Agents Required by Default
- **Compliance Guardian:** Veto on any customer interaction or trade that violates rules (know-your-customer, suitability, restrictions)
- **Risk Guardian:** Veto on trades exceeding risk limits (counterparty exposure, portfolio concentration, market conditions)
- **Audit Guardian:** Reviews all decisions for proper documentation; flags gaps in audit trail
- **Conflict of Interest Guardian:** Flags when agent or firm benefit conflicts with client benefit
- **Fiduciary Guardian:** Ensures all recommendations serve the client's best interest

### Evaluation Frameworks
- **Compliance metrics:** Incident rate (should be zero), audit findings, regulator feedback
- **Risk metrics:** VAR (Value at Risk), Sharpe ratio, max drawdown, stress test results
- **Fiduciary performance:** Client returns vs. benchmark, client complaints (count and theme)
- **Audit quality:** Audit hours, findings by severity, time to remediate
- **Market surveillance:** Suspicious activity reports filed, false positive rate

### Common Hard Constraints
1. **No recommendation without suitability analysis:** Every customer recommendation must document their profile, objectives, risk tolerance
2. **No conflict without disclosure:** If firm or agent benefits, customer must be informed and consent
3. **Dollar thresholds for approval:** Trades above $X require supervisory approval; above $Y require fiduciary review
4. **Know-Your-Customer (KYC) mandatory:** No trading, lending, or advice without current KYC documentation
5. **No suspicious activity allowed:** Anti-money laundering checks automatic; any red flag escalates immediately
6. **Audit trail immutable:** Every decision logged with timestamp, user, rationale, approval; logs are read-only after submission
7. **Conflicts of interest documented:** Any deviation from standard process must note who benefits and why
8. **Market surveillance real-time:** Trading activity monitored for manipulation, abuse; alerts reviewed within 1 hour
9. **Regulatory reporting on time:** All required filings (daily, monthly, annual) submitted before deadline
10. **Customer funds segregated:** Client money never mixed with firm money; balance verified daily

### Example Agent Spec: Investment Suitability Agent
```
Role: Analyze customer profile and recommend suitable investments
Type: Execution Agent (reports to Chief Compliance Officer)
Decision boundary:
  - Autonomous: Score customer risk profile, filter unsuitable products, identify conflicts
  - Requires approval: Recommend specific security, approve deviation from standard process
Escalates to: Compliance Guardian if customer is politically exposed, has sanctions issues, or no KYC on file
Conflict check: Flags if firm earns higher commission on recommendation
Audit trail: All recommendations logged with customer profile, suitability analysis, alternatives considered
Success metric: 100% of recommendations pass compliance review; zero customer complaints about suitability
```

### Example Hard Constraint: Audit Trail
> Every investment decision, trade, loan approval, or advice recommendation must log: date, time, user, customer ID, transaction, justification, all approvals required, and all approvals given. No edits to the log after submission. Weekly audit by Audit Guardian to ensure compliance. Monthly report to CEO and Board.

---

## Professional Services (Legal, Consulting, Accounting)

Professional services depends on expertise and judgment. Agents augment expert work but do not replace it. Client confidentiality and professional liability are paramount.

### Primary Strategy Documents
- Decision Cascade Governance
- Confidentiality (attorney-client privilege, accountant-client privilege; work product protection)
- Professional Standards (bar association, accounting board, consulting ethics)
- Liability and Malpractice (AI recommendations are attributed to the responsible professional)
- Quality Assurance (peer review of AI-assisted work before client delivery)
- Expert Authority (only experts can approve client-facing work)
- Conflict of Interest (cannot advise multiple clients on same matter without disclosure)

### Regulatory / Compliance Bodies
- **Legal:** State bar associations, ABA Model Rules, court ethics rules
- **Accounting:** AICPA (US), ICAEW (UK), IFAC (international); audit standards (PCAOB, IAASB)
- **Consulting:** Industry-specific (ISO, ACM, IEEE if tech); professional ethics codes
- **Insurance:** Professional liability insurers (E&O) set standards; malpractice claims are defended

### Guardian Agents Required by Default
- **Expert Authority Guardian:** Only licensed professionals approve client-facing advice; AI output is draft, not recommendation
- **Confidentiality Guardian:** Enforces attorney-client privilege, work product protection, accountant-client confidentiality
- **Ethics Guardian:** Flags conflicts of interest, competitor engagements, billing issues
- **Quality Assurance Guardian:** Peer review of all AI-assisted work before delivery to client

### Evaluation Frameworks
- **Client outcomes:** Matter resolution, advice quality (feedback, repeat business)
- **Professional quality:** Peer review pass rate, rework rate, error rate
- **Liability:** Malpractice claims (count, severity, settlement), insurance rating
- **Efficiency:** Billable hours per matter, AI utilization rate, time to completion
- **Confidentiality:** Zero privilege breaches, zero IP leaks, client data incidents

### Common Hard Constraints
1. **No AI-generated advice to clients without expert review:** Draft to AI; expert reviews and approves before sending to client
2. **Privilege protection:** No client information shared outside secure systems; privilege logs maintained
3. **Conflict check before engagement:** Cannot advise Client A if advising Client B on competing matter; disclosure required
4. **Billing transparency:** If AI reduces hours, bill reflects actual work (not inflated); no AI surcharge without disclosure
5. **Work product attribution:** AI output attributed to responsible professional; AI is tool, not author
6. **No confidential data in local context:** Client information stays in secure file systems; notes are anonymised
7. **Malpractice insurance compliance:** Claims reviewed; lessons learned fed back to improve processes
8. **Peer review before delivery:** All significant advice undergoes review by peer expert before client sees it
9. **Engagement scope clear:** Client told if AI is used; no deviation from agreed scope without consent
10. **Regulatory documentation:** Work papers documented, signed, dated; audit trail maintained for regulatory review

### Example Agent Spec: Legal Research Assistant
```
Role: Research case law, statutes, and precedent; draft legal memo sections for attorney review
Type: Operational Agent (supports practicing attorneys)
Decision boundary:
  - Autonomous: Research case databases, summarize holdings, identify applicable statutes, flag case authority
  - Does NOT decide: Legal interpretation, strategic advice, client communication, settlement authority
Escalates to: Responsible attorney if research surfaces conflicting precedent or controlling vs. persuasive authority questions
Privilege: All research logged in attorney work product file; attorney maintains privilege
Deliverable: Research memo with citations; attorney revises, adds analysis, approves before client sees
Success metric: Attorney approval rate 95%; zero research errors caught post-delivery; zero privilege breaches
```

### Example Hard Constraint: Conflict of Interest
> Before advising a new client on a matter, agent runs conflict check: (1) is client already represented by firm on different matter? (2) is opposing party a current or recent client? (3) are we advising multiple parties on same transaction? If any yes, conflict must be disclosed to all parties in writing; all parties must consent. Conflict log maintained; reviewed quarterly by managing partner.

---

## Education (Institutional Accountability)

Education involves institutional reputation, student outcomes, and sometimes safeguarding. Agents support educators but do not replace instruction or mentorship.

### Primary Strategy Documents
- Decision Cascade Governance
- Confidentiality (FERPA student records in US; data minimization for minors)
- Pedagogical Integrity (AI is study tool, not assessment; student learning is human-verified)
- Safeguarding and Duty of Care (no AI unsupervised with minors; escalate welfare concerns)
- Academic Integrity (disclosure of AI use in assignments; plagiarism detection)
- Equity and Accessibility (AI bias monitoring for student subgroups; accessibility for students with disabilities)
- Outcomes Accountability (track student learning gains, graduation rates, employment outcomes)

### Regulatory / Compliance Bodies
- **US:** FERPA (student privacy), ADA (accessibility), Title IX (non-discrimination, harassment), accreditation bodies (SACSCOC, etc.)
- **UK:** GDPR, Data Protection Act, Ofsted (school inspection), student charter
- **International:** UNESCO standards, local education ministries, accreditation bodies
- **Professional:** Faculty unions, student advocacy groups, parent associations

### Guardian Agents Required by Default
- **Pedagogical Integrity Guardian:** Ensures AI does not replace instruction or meaningful assessment; students learn from struggle
- **Safeguarding Guardian:** Veto on any unsupervised AI interaction with minors; escalates welfare concerns
- **Academic Integrity Guardian:** Monitors for plagiarism and undisclosed AI use; enforces institutional honor code
- **Equity Guardian:** Audits AI for bias by student demographics; ensures accessibility; recommends inclusivity improvements
- **Data Privacy Guardian:** Enforces FERPA/GDPR; prevents student data from leaking into training or local context

### Evaluation Frameworks
- **Student learning:** Grade distribution, skill mastery (pre/post), long-term retention
- **Equity:** Learning gains by demographic (race, gender, socioeconomic status); achievement gap trend
- **Retention & graduation:** Enrollment by cohort, on-time graduation rate, time to degree
- **Career outcomes:** Employment rate 6 months post-graduation, salary relative to field, job satisfaction
- **Institution reputation:** Application rates, ranking, employer feedback, community trust

### Common Hard Constraints
1. **No AI as sole assessor:** All grades involve human judgment; AI can draft, but instructor assigns grade
2. **AI use disclosed:** If student uses AI in assignment, they must disclose and cite it; undisclosed use is academic integrity violation
3. **Minors cannot interact unsupervised:** K-12 students using AI tutors must be supervised by educator; parents informed
4. **FERPA compliance:** No student identifiable information in local context; aggregated data only (anonymised)
5. **Equity monitoring:** AI recommendations (e.g., course placement, tutoring) audited for bias; disparate impact investigated
6. **Accessibility required:** Any AI-driven learning tool must support screen readers, captions, alternative input methods
7. **Pedagogical purpose first:** AI used to support learning, not replace instruction; deep learning valued over shortcuts
8. **Academic integrity clear:** Institutional policy on AI use in coursework published; students sign acknowledgment
9. **Parental transparency:** Parents of K-12 students told if child uses AI tutoring; can opt out
10. **Data retention limits:** Student work and interaction data deleted after course/graduation per FERPA guidelines

### Example Agent Spec: Course Content Assistant
```
Role: Draft lecture notes, study guides, practice problems; flag student misconceptions; suggest remediation
Type: Operational Agent (supports instructors)
Decision boundary:
  - Autonomous: Draft content outline, suggest examples, create practice problems, identify concept gaps in student work
  - Does NOT decide: Course grades, remediation referrals (instructor decides), student accommodations
Escalates to: Instructor if pattern of misconception detected across class; recommends reteaching
Student transparency: Course syllabus states "AI assists instructor; student work is human-assessed"
Deliverable: Content draft for instructor review; instructor modifies, approves, delivers to students
Success metric: Instructor adoption rate 80%; student learning gains match or exceed historical baseline
```

### Example Hard Constraint: Equity Auditing
> Quarterly, Equity Guardian audits AI-driven recommendations (tutoring, course placement, office hour scheduling) for disparate impact. Report shows breakdown by race, gender, income level, disability status. If any subgroup has significantly different outcomes, investigation conducted and mitigation plan implemented. Results shared with faculty and student leadership.

---

## Retail / E-commerce (Velocity & Scale)

Retail and e-commerce move fast. Agents automate routine decisions and surface exceptions. Customer trust and unit economics matter most.

### Primary Strategy Documents
- Decision Cascade Governance
- Confidentiality (customer purchase history, payment info; payment card compliance, PCI-DSS)
- Customer Protection (no discriminatory pricing, no predatory recommendations, fraud prevention)
- Financial Controls (refund authority, fraud liability, chargebacks)
- Operational Efficiency (decision automation, inventory management, shipping optimization)
- Customer Experience (personalization bounds, recommendation quality, complaint handling)

### Regulatory / Compliance Bodies
- **Payment:** PCI-DSS (card data), Visa/Mastercard rules, local payment regulations
- **Consumer protection:** FTC (unfair/deceptive practices), state consumer laws, ADA (web accessibility)
- **Tax:** Sales tax compliance by jurisdiction, VAT (international)
- **Data protection:** GDPR (if EU customers), CCPA (California), local privacy laws
- **Return/refund:** State consumer protection laws (right to return, refund timelines)

### Guardian Agents Required by Default
- **Fraud Guardian:** Blocks suspicious transactions; flags unusual patterns; coordinates chargebacks
- **Customer Protection Guardian:** Veto on discriminatory pricing, predatory upselling, deceptive recommendations
- **Financial Controls Guardian:** Approves refunds above threshold, chargebacks, payment exceptions
- **Compliance Guardian:** Ensures PCI-DSS, tax compliance, accessibility, consumer protection rules followed

### Evaluation Frameworks
- **Unit economics:** COGS, fulfillment cost, CAC, LTV, payback period
- **Customer satisfaction:** NPS, repeat purchase rate, churn rate, complaint themes
- **Operational efficiency:** Order cycle time, fulfillment accuracy, return rate, inventory turns
- **Fraud & losses:** Fraud rate, chargeback rate, refund rate, total loss as % of revenue
- **Scale:** Order volume, SKU count, warehouse locations, geographic coverage

### Common Hard Constraints
1. **Pricing authority thresholds:** Discounts below $X auto-approved; above $X requires manager; above $Y requires executive
2. **Fraud checks mandatory:** All orders pass fraud screening; high-risk orders flagged for manual review
3. **PCI-DSS compliance:** No payment card data stored locally; tokenization mandatory; compliance audit annual
4. **No discriminatory pricing:** Price, shipping, recommendations must not vary by protected class (race, gender, etc.); audit quarterly
5. **Refund policy transparent:** Refund terms, timelines, methods clearly posted; honored without question within policy
6. **Inventory accuracy:** AI recommendations do not over-commit inventory; stock checks before confirming
7. **Return processing SLA:** Customer refunds processed within [X days] of return receipt
8. **Recommendation transparency:** Customers can see why product was recommended; can opt out of personalization
9. **Chargeback defense:** All disputed transactions documented; evidence retained for chargeback defense
10. **Tax compliance automatic:** Sales tax calculated correctly per jurisdiction; VAT handled for international orders

### Example Agent Spec: Fraud Detection Agent
```
Role: Score orders for fraud risk; flag suspicious transactions; approve/deny in real-time
Type: Execution Agent (reports to VP Operations)
Decision boundary:
  - Autonomous: Approve low-risk orders (<score 20), deny very high-risk (>score 80), collect review queue for 20-80 range
  - Requires approval: Approve orders >score 80, deny orders where customer has history of chargebacks
Escalates to: Fraud Guardian if suspicious pattern detected (multiple cards, rapid purchases, high-value items)
Payment risk: Reviews IP, card age, billing/shipping mismatch, velocity checks
Customer impact: Flagged orders require phone verification; customer experience (friction) monitored
Success metric: Fraud rate <0.5%, approval rate >99% for legitimate customers, chargeback rate <0.1%
```

### Example Mission: Dynamic Pricing Pilot
- **Phase 1:** Test personalized discounts with 5 products, measure revenue impact and customer perception
- **Phase 2:** Build pricing engine, train team, set authority rules
- **Phase 3:** Pilot with 20% of catalog, A/B test against static pricing
- **Phase 4:** Expand to full catalog, monitor for discrimination (audit by Compliance Guardian)
- **Phase 5:** Autonomous pricing with weekly reviews; customer perception tracked; discrimination audits quarterly

---

## Summary Table: Which Guardian Agents by Industry

| Guardian Type | SaaS | Healthcare | Financial | Legal | Education | Retail |
|---|---|---|---|---|---|---|
| Clinical/Safeguarding | — | **Yes** | — | — | **Yes** | — |
| Compliance | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| Security | **Yes** | **Yes** | **Yes** | **Yes** | — | **Yes** |
| Quality/Expert Authority | — | — | — | **Yes** | **Yes** | — |
| Fiduciary/Ethics | — | — | **Yes** | **Yes** | — | — |
| Customer Protection | — | — | **Yes** | — | — | **Yes** |
| Fraud | — | — | **Yes** | — | — | **Yes** |
| Equity | — | **Yes** | — | — | **Yes** | **Yes** |
| Data Privacy | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| Risk Management | **Yes** | **Yes** | **Yes** | — | — | **Yes** |

Use this table to decide which Guardians to set up for your industry. Start with Compliance, Data Privacy, and your industry's primary regulator. Add others as you grow.

---

## Customizing for Your Industry

1. **Read your regulatory framework:** What do auditors, regulators, and insurers care about?
2. **Talk to compliance / legal:** What's the biggest legal risk? What controls are already in place?
3. **Identify what you can't automate:** What decisions require human judgment or accountability?
4. **Start with one Guardian:** Usually Compliance or your industry's primary risk (Safeguarding in healthcare, Fiduciary in finance)
5. **Add Guardians as agents mature:** Start with one Execution agent under one Guardian; expand only when proven
6. **Write hard constraints first:** Before building agents, document what they can never do
7. **Plan for audit:** How will auditors verify agents followed the rules? Build logging in from the start
