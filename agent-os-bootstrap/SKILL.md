---
name: agent-os-bootstrap
description: |
  Bootstrap an AI agent operating system for any company from public information. Provide a company name and this skill researches it, creates the folder structure, populates strategy documents (RFCs) with company-specific content, creates agent specs mapped to leadership, and generates a CLAUDE.md. Use when someone wants to set up agents for their company, build an AI strategy framework, create agent specs, or bootstrap AI governance. Triggers: "set up agents for my company", "create an operating system for AI at [company]", "help me organise my AI strategy", "build an agent framework", "I want to do what that talk described", "agent OS", "operating model", "folder structure for agents", "RFC structure", "bootstrap my company". MANDATORY TRIGGERS: agent operating system, bootstrap, company setup, agent framework, AI strategy, RFC, agent spec, operating model, folder structure.
metadata:
  author: Tim Barker
---

# Agent OS: Company Bootstrap

You are building an AI agent operating system for a company. Your job is to research the company from public information and create a complete, populated folder structure that any executive can immediately start working with.

Think of this as preparing for a genius hire's first day at the company. You're creating everything they'd need to understand the business, know their role, and start their first project — except the hire is an AI agent, and there will be one for every function.

## Before You Begin

1. Read `references/folder_structure.md` to understand the canonical structure
2. Read `references/industry_patterns.md` to understand how to adapt by industry
3. Have the user's company name (and optionally: URL, industry, brief description)

If the user hasn't provided a company name, ask for one. You need at minimum a company name to proceed. A URL or brief description helps but isn't required — you'll research the rest.

**Web search is required.** This skill relies on researching the company from public data. If web search is not available in the current environment, tell the user: "This skill needs internet access to research your company. Please ensure web search is enabled in your settings, then try again."

## The Bootstrap Process

Work through these steps in order. Summarise what you found after each step and confirm with the user before moving on.

### Step 1: Research the Company (5-10 minutes)

Search for and gather:

**Company basics:**
- What the company does (products, services, market)
- Industry and sub-industry
- Company size (employees, revenue if public)
- Geography (HQ, markets served)
- Founded date, funding stage or public listing

**Leadership team:**
- C-suite and senior leadership names and titles
- Functional areas each leader owns
- Any public information about their priorities or focus areas

**Strategic context:**
- Recent news, product launches, strategic announcements
- Competitive landscape (who they compete with)
- Business model (SaaS, marketplace, services, hybrid)
- Key metrics if publicly reported (ARR, users, growth rate)

**Regulatory and compliance:**
- Industry regulations that apply
- Certifications held or required (SOC2, ISO 27001, GDPR, HIPAA, etc.)
- Any regulatory bodies that govern their space

**Product and technology:**
- Product portfolio (what they sell)
- Tech stack if publicly known (job postings are a good source)
- Platform architecture signals (cloud provider, mobile/web/API)

After researching, present a brief summary to the user: "Here's what I found about [Company]. Does this look right? Anything important I'm missing?" This is the user's chance to correct or add context before you build.

### Step 2: Detect Industry and Adapt

Read `references/industry_patterns.md` and match the company to its primary industry. This determines:
- Which RFCs get the most depth
- Whether guardian agents are needed by default
- What regulatory/compliance anchors to include
- Which evaluation frameworks to suggest

Tell the user: "Based on my research, I'm treating [Company] as a [industry] company. This means I'll emphasise [X, Y, Z] in the strategy documents. Does that feel right?"

### Step 3: Create the Folder Structure

Create the canonical folder structure in the user's workspace:

```
[company-name]-agent-os/
├── 00_LOCAL_CONTEXT/
├── 01_STATE/
│   ├── session_summary.md
│   ├── session_review_log.md
│   └── decisions.md
├── 02_STRATEGY/
├── 03_AGENTS/
├── 04_MISSIONS/
├── 05_ARTIFACTS/
└── CLAUDE.md
```

**Initialise the state files:**

`session_summary.md` — Write an initial entry: "Agent operating system bootstrapped from public data on [date]. All strategy documents and agent specs require internal enrichment by their respective owners. See session_review_log.md for the list of items that need attention."

`session_review_log.md` — Create with a section for open items. Add one item per RFC and agent spec: "[RFC/Agent name] — bootstrapped from public data, requires internal review and enrichment by [owner name]."

`decisions.md` — Create empty with a header: "Decision log for [Company] agent operating system."

### Step 4: Populate Strategy Documents (RFCs)

Read the RFC templates from `references/rfc_templates/`. For each RFC:

1. Read the template to understand the structure
2. Populate it with real content from your research — not placeholders, not generic statements, but specific information about this company
3. Mark sections where you couldn't find public data with `[INTERNAL: This section needs enrichment from internal data. Suggested source: ...]`
4. Add a change log entry: "Bootstrapped from public data by Agent OS skill."
5. Save to `02_STRATEGY/`

**RFC naming convention:** `RFC-1XX_[topic].md` where the number follows the template numbering (100 = values, 101 = brand, etc.).

**Adapt RFC topics to the company.** Not every company needs exactly 10 RFCs with these exact topics. If the company has a dominant domain that doesn't map to the templates (e.g., a logistics company might need a "Supply Chain Operations" RFC), create it. If a template doesn't apply (e.g., a pre-revenue startup doesn't need a detailed financial model RFC), create a lighter version or skip it. Use judgment.

**Quality standard:** Each RFC should read like a knowledgeable analyst wrote it after researching the company for a day. It won't have internal data, but it should demonstrate real understanding of the company's market, competitive position, regulatory environment, and strategic context. The user should read it and think "this is a solid starting point" not "this is generic filler."

### Step 5: Create Agent Specifications

Read `references/agent_spec_template.md` for the structure.

**Map agents to leaders.** For each identified C-suite or senior leader, create an agent specification:

1. Determine the agent type:
   - **Guardian** — for roles with veto or compliance authority (legal, security, governance, regulatory). These have veto power over other agents' decisions.
   - **Execution** — for roles that will originate substantive work (audit, analysis, content creation). These produce outputs that didn't exist before.
   - **Operational** — for most other roles (product, marketing, sales, engineering, finance). These support and inform decisions.

2. Populate from public data:
   - Role statement based on the leader's public responsibilities
   - Decision boundaries appropriate to the function
   - Governing RFCs (link to the RFCs created in Step 4)
   - Placeholder evaluation framework with suggested approaches from `references/industry_patterns.md`
   - Hard constraints appropriate to the domain

3. Flag what needs human input: `[OWNER ACTION: Define your evaluation framework — see Skill 2 workshop for guidance]`

**Agent naming convention:** `[function]_[type]_agent.md` — e.g., `engineering_quality_agent.md`, `data_privacy_guardian.md`, `revenue_operations_agent.md`.

**Don't over-create agents.** A 50-person company doesn't need 10 agents. Match the number of agents to the company's actual leadership structure. If one person owns multiple functions, they might have one agent that covers both, or two agents — use judgment based on how distinct the domains are.

### Step 6: Create the Portfolio Map

Create `03_AGENTS/portfolio_map.md` — a table mapping every exec to their RFCs and agents:

```markdown
| Executive | Title | RFCs Owned | Agents Governed | Agent Type | Maturity |
|-----------|-------|-----------|----------------|------------|----------|
```

Set all maturity levels to "Bootstrapped — requires internal enrichment" except note which ones are likely strongest based on available public data.

### Step 7: Generate CLAUDE.md

Read `references/claude_md_template.md` and populate it for this specific company. Include:
- Company name and description
- Industry-appropriate hard constraints
- The folder structure
- Decision cascade governance rules
- Current date

Save to the workspace root.

### Step 8: Summary Report

Present a summary to the user:

1. **What was created** — list of all files with brief descriptions
2. **What's strong** — which RFCs and agents had the most public data to draw from
3. **What needs enrichment** — which documents most need internal data (ordered by priority)
4. **Recommended next step** — "Use the Agent OS: Executive Workshop skill to guide each executive through refining their strategy documents, agent specs, and creating their first mission."

## Tone and Quality

Be direct and specific. Generic filler like "the company aims to be a leader in its space" is useless. If you found that the company raised a Series C at $200M valuation and is expanding into APAC, say that. If their job postings reveal they use Kubernetes on GCP with a React frontend, put that in the platform architecture RFC.

When you can't find information, say so explicitly: `[INTERNAL: No public data found for this section. The [role] should provide: ...]`. This is more useful than filling in generic content that the exec will have to delete.

## Multi-Session Support

If the bootstrap takes more than one session (unlikely but possible for very large companies), use the state folder:
- Update `session_summary.md` with what was completed
- Add open items to `session_review_log.md`
- Next session, read the state folder and resume where you left off
