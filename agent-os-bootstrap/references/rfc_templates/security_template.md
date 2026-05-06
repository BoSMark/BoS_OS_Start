# RFC-107: Information Security, Data Governance, and Regulatory Framework

**Author:** Agent OS: Company Bootstrap
**Status:** Template (populate with company data)
**Last Updated:** [CURRENT_DATE]

## Context

[POPULATE: Company's security posture, data classification approach, and regulatory environment. Source: security certifications, privacy policies, customer contracts, regulatory filings.]

Example: "Stripe maintains SOC2 Type II, handles payment card data (PCI-DSS), and processes GDPR/CCPA-subject data. Their framework emphasizes: data minimization, encryption in transit/at rest, regular penetration testing, and incident response procedures."

## Governing Framework

- **Security Baseline:** [POPULATE: Required controls and standards. E.g., "SOC2 Type II", "ISO 27001", "NIST Cybersecurity Framework"]
- **Data Classification:** [POPULATE: How is data classified? E.g., "Public", "Internal", "Restricted", "PII/PHI"]
- **Regulatory Environment:** [POPULATE: What regulations apply? E.g., "GDPR (EU)", "CCPA (CA)", "HIPAA (healthcare)", "PCI-DSS (payment)"]

## Scope & Boundaries

This RFC governs:
- Data classification and handling procedures
- Access controls and identity management
- Encryption and cryptographic standards
- Incident response and breach notification
- Third-party security assessments and vendor management
- Regulatory compliance obligations

Out of scope:
- Detailed security architecture (see CISO team)
- Incident response execution (see security ops)
- Individual access request decisions (see IAM team)

## Data Classification & Handling

[POPULATE: How is data classified? What are the handling rules?]

| Classification | Definition | Handling Requirements | Retention |
|----------------|-----------|----------------------|-----------|
| Public | [e.g., Published marketing materials] | [e.g., No restriction] | [DURATION] |
| Internal | [e.g., Internal communications, strategic docs] | [e.g., Employee-only, encrypted in transit] | [DURATION] |
| Restricted | [e.g., Customer data, financial data] | [e.g., Encrypted at rest, audit logging, access restrictions] | [DURATION] |
| PII/PHI | [e.g., Personal data, health records] | [e.g., Highest protection, regulated handling] | [REGULATED] |

## Security Certifications & Standards

[POPULATE: What certifications does the company maintain or aspire to?]

| Certification | Scope | Audit Frequency | Current Status |
|---------------|-------|-----------------|-----------------|
| SOC2 Type II | [SCOPE] | Annual | [e.g., Current as of DATE] |
| ISO 27001 | [SCOPE] | Annual | [e.g., In progress] |
| [CERTIFICATION_3] | [SCOPE] | [FREQUENCY] | [STATUS] |

## Regulatory Compliance Obligations

[POPULATE: What regulations apply to the company's data and business?]

| Regulation | Applies To | Key Requirements | Compliance Responsibility |
|-----------|-----------|-----------------|--------------------------|
| GDPR | EU personal data | Right to access, erasure, data portability, breach notification (72hr) | [TEAM] |
| CCPA | California residents | Privacy disclosure, opt-out, breach notification | [TEAM] |
| HIPAA | Health information (if applicable) | Encryption, audit logging, business associate agreements | [TEAM] |
| PCI-DSS | Payment card data (if applicable) | Encryption, network segmentation, regular assessment | [TEAM] |

## Access Control Framework

[POPULATE: How does the company manage who can access what?]

- **Identity Provider:** [POPULATE: e.g., "Okta", "Azure AD"]
- **MFA Requirement:** [POPULATE: e.g., "Required for all employees and contractors"]
- **Privilege Access:** [POPULATE: e.g., "Just-in-time access", "Regular recertification quarterly"]
- **Contractor/Vendor Access:** [POPULATE: e.g., "Requires NDA and background check", "Time-limited tokens"]

## Incident Response & Breach Notification

[POPULATE: What is the process for security incidents?]

- **Detection & Reporting:** [POPULATE: How are incidents reported?]
- **Escalation Path:** [POPULATE: Who gets notified and when?]
- **Breach Notification:** [POPULATE: Timeline for notifying affected parties, regulators. E.g., "72 hours for GDPR"]
- **Post-Incident:** [POPULATE: Post-mortem, root cause analysis, remediation tracking]

## Decision Rights

| Decision | Authority | Review |
|----------|-----------|--------|
| Data classification | [POPULATE: e.g., Chief Information Security Officer] | Annual |
| Security exception (e.g., disable MFA) | [POPULATE: e.g., CISO] | Per request |
| Vendor security assessment | [POPULATE: e.g., Security team] | Pre-engagement |
| Breach notification | [POPULATE: e.g., General Counsel + CISO] | Real-time |

## Success Criteria

- [ ] Zero material security breaches within 12 months
- [ ] All mandatory certifications current and unqualified
- [ ] Breach detection time < [X hours]
- [ ] Regulatory non-compliance issues: 0
- [ ] Third-party security assessment findings resolved in [DAYS]

## Current State Assessment

[POPULATE: What is the current security maturity level? What are the biggest risks? Where are the gaps?]

## Regulatory/Compliance Anchors

[POPULATE: External requirements and audit standards]

- [REGULATION]: [KEY_REQUIREMENT]
- Customer contracts: [e.g., "Require SOC2 Type II attestation"]
- Insurance requirements: [e.g., "Cyber liability policy requirements"]

## Cross-References

- **RFC-105:** Governance framework (security governance structure)
- **RFC-108:** Platform architecture (technical controls)
- **RFC-109:** Competitive positioning (security as differentiator)

## Changelog

| Version | Date | Change |
|---------|------|--------|
| 1.0 | [DATE] | Initial template created |
