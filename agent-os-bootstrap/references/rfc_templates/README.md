# RFC Template Library

Agent OS: Company Bootstrap uses these 10 RFC templates as structural guides to populate strategy documents for any company based on publicly available data.

## Templates Overview

Each template follows the same structure to ensure consistency and maintainability:

- **Mandatory Sections:** Context, Governing Framework, Scope & Boundaries, Decision Rights, Success Criteria, Current State Assessment, Regulatory/Compliance Anchors
- **Cross-References:** Links to related RFCs to show how strategies interconnect
- **Changelog:** Version tracking for the RFC
- **POPULATE placeholders:** Guide the bootstrap skill on what data to gather and where to source it
- **Examples:** Concrete SaaS/technology company examples throughout

## The 10 RFCs

| RFC # | Template | Purpose | Example RFC |
|-------|----------|---------|------------|
| RFC-100 | `values_template.md` | Company values and ethical foundations | What the company stands for, ethical AI principles, stakeholder prioritization |
| RFC-101 | `brand_template.md` | Brand and messaging principles | Tone, audience segmentation, evidence-backed claims, positioning |
| RFC-102 | `growth_template.md` | Growth and commercial logic | Go-to-market model, buyer personas, pricing philosophy, channels |
| RFC-103 | `product_template.md` | Product north star and vision | North star metric, user journey, product principles, multi-product strategy |
| RFC-104 | `financial_template.md` | Financial model and commercial framework | Revenue model, unit economics, pricing structure, contract terms |
| RFC-105 | `governance_template.md` | Domain governance framework | Quality gates, decision rights, domain-specific controls (highly variable by industry) |
| RFC-106 | `measurement_template.md` | Measurement and outcomes framework | KPIs, OKR structure, reporting cadence, data quality standards |
| RFC-107 | `security_template.md` | Information security and data governance | Certifications, data classification, regulatory compliance, incident response |
| RFC-108 | `platform_template.md` | Platform and product architecture | Tech stack, deployment strategy, scalability, API design, code quality |
| RFC-109 | `competitive_template.md` | Competitive landscape and positioning | Direct/adjacent competitors, differentiation, competitive moats, win/loss analysis |

## How to Use These Templates

### For the Bootstrap Skill

1. **Select the relevant RFCs** for the target company (typically all 10 for a SaaS company; may subset for specialized companies)
2. **Gather public data** from:
   - Company website and blog
   - Investor presentations and investor.relations pages
   - Earnings calls and public SEC filings
   - Press releases and news articles
   - Job postings (reveals priorities and hiring focus)
   - Public GitHub repos and documentation
   - Competitor research and analyst reports
   - Customer testimonials and case studies
   - Patent filings (if applicable)
3. **Populate the templates** with the gathered data, using the [POPULATE: ...] guidance in each section
4. **Fill in examples** from the company's actual market positioning and strategy
5. **Cross-reference** between RFCs to show interconnections (already provided in templates)
6. **Publish** as formal strategy documents for the company

### For Implementation Teams

When using these RFCs to guide decisions:

1. **Reference the Scope & Boundaries** to understand what decisions fall under this RFC
2. **Follow Decision Rights** to know who has authority for specific choices
3. **Track against Success Criteria** to measure if the RFC is achieving its intent
4. **Check Cross-References** to understand how this RFC constrains or enables other areas
5. **Review Regulatory/Compliance Anchors** to ensure decisions comply with applicable standards

## Template Design Principles

- **Concise:** Each template is 60-100 lines (structural guide, not a full document)
- **Adaptable:** Guidance in [POPULATE: ...] blocks can be adapted for different industries
- **Interconnected:** Cross-references show how RFCs constrain each other
- **Example-driven:** SaaS/technology company examples throughout (Slack, Figma, Stripe, HubSpot, Notion, Datadog)
- **Public-ready:** No references to specific companies, confidential terms, or proprietary data
- **Decision-focused:** Each RFC emphasizes Decision Rights and Success Criteria

## Key Design Decisions

1. **RFC Numbers (100-109)** allow for future extension (RFC-110+) without breaking existing structures
2. **Author: Agent OS: Company Bootstrap** appears in every template (credit goes to the skill, not a specific person)
3. **Status: Template** indicates these are structural guides, not completed RFCs
4. **Governance Framework always comes early** in each template to establish the strategic context before details
5. **Scope & Boundaries and Decision Rights** appear consistently to clarify governance structures
6. **Regulatory/Compliance Anchors always appear** because modern companies cannot ignore compliance
7. **Success Criteria use checkboxes** to show they are implementation-ready

## Customization for Different Industries

### For SaaS/Technology Companies
Use all 10 RFCs. The templates are pre-designed for this category.

### For Healthcare Companies
- Extend **RFC-105 (Governance)** to emphasize clinical governance and patient safety
- Extend **RFC-107 (Security)** to include HIPAA, clinical data handling, and regulated documentation
- Extend **RFC-103 (Product)** to include evidence-based medicine requirements

### For Finance Companies
- Extend **RFC-105 (Governance)** to include audit, risk management, and fiduciary responsibilities
- Extend **RFC-107 (Security)** to include fraud detection and regulatory reporting
- Extend **RFC-104 (Financial)** to include capital requirements and stress testing

### For Marketplace Companies
- Extend **RFC-102 (Growth)** to emphasize supply-side and demand-side dynamics
- Extend **RFC-109 (Competitive)** to include platform lock-in and network effects
- Extend **RFC-103 (Product)** to include trust and safety mechanisms

## Maintenance & Version Control

- **Changelog section** in each RFC tracks version history
- **Initial version 1.0** is the template version; populated versions become RFC-100v1.0 (company-specific)
- **Do NOT commit** sensitive financial data, personnel information, or contract terms to tracked files
- **Use 00_LOCAL_CONTEXT/** for confidential notes; RFCs in 02_STRATEGY/ are intended for internal strategic use

## Related Documentation

- **Agent OS: Company Bootstrap Skill** — The implementation that populates these templates
- **Decision Log** (01_STATE/) — Records which RFCs have been reviewed and approved
- **Strategic Plan** — High-level summary referencing these RFCs

---

**Author:** Agent OS: Company Bootstrap
**Last Updated:** 2026-03-30
**License:** Public (Creative Commons or equivalent for open use)
