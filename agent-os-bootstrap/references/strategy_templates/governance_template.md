# Domain Governance Framework

**Reference:** Strategy Doc 105
**Author:** Tim Barker, Mark Littlewood and Business of Software
**Status:** Template (populate with company data)
**Last Updated:** [CURRENT_DATE]

## Context

[POPULATE: What is the company's core domain and its governance requirements? This document is highly variable by industry.]

**For SaaS/Technology:** Focus on product quality, data governance, customer trust, and responsible AI.
**For Healthcare:** Focus on clinical governance, patient safety, regulated content, and qualified practitioner oversight.
**For Finance:** Focus on fiduciary responsibilities, audit, regulatory compliance, and risk management.

Example: "Slack operates in a trust-critical domain (enterprise communication). Their governance emphasises: data classification, access controls, security review of features, and responsible disclosure of vulnerabilities."

## Governing Framework

[POPULATE: What are the non-negotiable governance principles for this company's domain?]

- **Primary Domain:** [POPULATE: What is the core business area?]
- **Critical Governance Areas:** [POPULATE: 3–4 areas where governance is non-negotiable]
- **Decision Framework:** [POPULATE: How are conflicts between speed and safety resolved?]

## Scope & Boundaries

This document governs:
- Quality gates and approval workflows for [DOMAIN]
- What decisions require expert oversight vs can be delegated
- Escalation paths when issues arise
- Audit and compliance requirements
- Third-party vendor evaluation in this domain

Out of scope:
- Operational execution (see specific strategy documents for each domain)
- Day-to-day quality monitoring (see ops team)
- Individual vendor contracts

## Domain-Specific Governance Areas

[POPULATE: Customise these based on company domain. Examples below for different industries:]

### For SaaS/Tech:
- **Data Governance:** Classification, access controls, retention, deletion
- **Product Quality:** Code review, testing, launch readiness criteria
- **Security:** Vulnerability disclosure, third-party assessment, incident response
- **AI/ML (if applicable):** Bias monitoring, model validation, explainability requirements

### For Healthcare:
- **Clinical Governance:** Qualified practitioner oversight, clinical evidence review, safety escalation
- **Patient Safety:** Incident reporting, serious adverse event handling, regulatory notification
- **Data Protection:** Patient consent, anonymisation, secure handling

### For Finance:
- **Audit & Control:** Segregation of duties, transaction approval, reconciliation
- **Risk Management:** Counterparty risk, market risk, operational risk
- **Regulatory Compliance:** Reporting, audit trails, suspicious activity detection

## Decision Rights Matrix

[POPULATE: Who decides what? When is escalation required?]

| Decision Type | Authority | Escalation Trigger | Final Authority |
|--------------|-----------|-------------------|-----------------|
| [DECISION_1] | [ROLE] | [Trigger] | [ROLE] |
| [DECISION_2] | [ROLE] | [Trigger] | [ROLE] |
| [DECISION_3] | [ROLE] | [Trigger] | [ROLE] |

## Quality Gates & Approval Workflows

[POPULATE: What must be reviewed before a feature/change ships?]

| What Needs Review | Who Reviews | Frequency | Escalation Path |
|-------------------|------------|-----------|-----------------|
| [REVIEW_TYPE] | [TEAM/ROLE] | [When] | [ESCALATION] |
| [REVIEW_TYPE] | [TEAM/ROLE] | [When] | [ESCALATION] |

## Vendor and Third-Party Governance

[POPULATE: How does the company ensure vendors meet governance standards?]

- Assessment criteria: [POPULATE: e.g., "SOC2 Type II", "Third-party security audit"]
- Approval authority: [POPULATE: e.g., "Chief Information Officer"]
- Ongoing monitoring: [POPULATE: e.g., "Annual attestation", "Incident reporting requirements"]

## Success Criteria

- [ ] Zero unplanned incidents in [DOMAIN] within [TIMEFRAME]
- [ ] Audit findings remediated within [THRESHOLD] days
- [ ] Stakeholder confidence in governance ≥ [THRESHOLD]% (measured via survey)
- [ ] Time-to-market not materially impacted by governance requirements

## Current State Assessment

[POPULATE: How mature is the current governance? What are the gaps? Where are the bottlenecks?]

## Regulatory/Compliance Anchors

[POPULATE: Governance requirements from external regulators or standards bodies]

- [REGULATORY_BODY]: [REQUIREMENT]
- [STANDARDS_BODY]: [REQUIREMENT]
- [ACCREDITATION]: [REQUIREMENT]

## Cross-References

- **Platform Strategy:** Technical controls support governance
- **Security and Compliance:** Overlaps with governance
- **Values:** Governance reflects company values and commitments

## Changelog

| Version | Date | Change |
|---------|------|--------|
| 1.0 | [DATE] | Initial template created |
