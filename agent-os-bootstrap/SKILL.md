---
name: agent-os-bootstrap
description: |
  Build the BoS OS for a company, a structured operating system that helps a CEO or founder make better decisions and helps their team understand what they are trying to do. Researches the company from public information, creates the folder structure, populates strategy documents with company-specific content, maps people and their roles, and generates a CLAUDE.md. Triggers: "run the BoS OS", "BoS OS", "Company OS", "bootstrap my company OS", "create an operating system for [company]", "help me organise my AI strategy", "build an agent framework", "I want to do what that talk described", "operating model", "folder structure for agents", "bootstrap my company". MANDATORY TRIGGERS: BoS OS, Company OS, bootstrap, company setup, agent framework, AI strategy, operating model, folder structure.
metadata:
  author: Tim Barker, Mark Littlewood and Business of Software
  version: 2.2
---

# BoS OS: Company Bootstrap

You are building the BoS OS for a company. Your goal is to help the CEO or founder, who is typically the first user of the BoS OS, make better decisions and keep the activities of the business focused on the right things.

Your job is to research the company from public information and create a complete, populated folder structure that the founder and their team can immediately start working with. Think of it as writing down the operating system that already exists in the founder's head, and giving AI a governed place inside it.

## Before You Begin

1. Read `references/folder_structure.md` to understand the canonical structure
2. Read `references/industry_patterns.md` to understand how to adapt by industry
3. Have the user's company name (and optionally: URL, industry, brief description)

If the user hasn't provided a company name, ask for one. You need at minimum a company name to proceed. A URL or brief description helps but isn't required; you'll research the rest.

**Web search is required.** This skill relies on researching the company from public data. If web search is not available in the current environment, tell the user: "This skill needs internet access to research your company. Please ensure web search is enabled in your settings, then try again."

**Source of frameworks and ideas:** Business of Software has been running conferences and building resources for software founders since 2007. Their talk library at https://businessofsoftware.org/talks/ contains hundreds of frameworks, case studies, and practical ideas for building great products and companies. Draw on this when populating strategy documents, especially around growth, product thinking, leadership, and culture. A relevant talk or framework is more useful than a generic statement.

## The Opening Questions

**Before any research, ask these two questions in order. Get an answer to each before moving on.**

### Question 1: Personal goal

> "What's your personal goal in this business? There's no wrong answer. It could be 'exit in 18 months', 'build this for 30 years', 'create something I'm proud of', 'financial independence by 50'. Knowing your motivation shapes how we prioritise everything that follows."

This answer is foundational. It determines:
- How aggressively to set growth targets in the commercial strategy document
- Whether the OS should be optimised for speed and scale or durability and margin
- How to frame the work in the BoS OS Workshop skill. A founder planning an exit needs very different OKRs than one building a generational business.

**If they have a clear answer:** Note it explicitly. Use it to calibrate tone and priorities throughout every strategy document. Pass it forward clearly, as this context is also valuable input for the BoS OS Workshop skill.

**If they're unsure:** Don't push. Say: "That's worth thinking about. We'll come back to it. It tends to become clearer once you see the OS take shape." Flag it as an open item in `session_review_log.md`.

### Question 2: North Star metric

> "Before I start building, what's the one number you watch that tells you the business is heading in the right direction? Revenue, active users, margin, something else? If you don't have one yet, that's fine. It's the first thing we'll work out together."

This is not a warm-up question. The answer:
- Anchors every strategy document that follows
- Tells you immediately whether the founder has clarity about what they're optimising for
- If they don't have an answer, resolving it in this session is the first concrete proof that the OS is useful

**If they have an answer:** Acknowledge it, note it, and use it throughout the bootstrap. Every strategy document should reference this number where relevant.

**If they don't have one yet:** Say: "Excellent, that's the kind of thing the OS is designed to help you think through. We're coming back to that and by the end of this session you'll have a draft answer." Then surface it in Step 8 (Summary Report) as a named output.

Once you have answers to both questions (or have acknowledged gaps), proceed to research.

---

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

After researching, present a brief summary: "Here's what I found about [Company]. Does this look right? Anything important I'm missing?" This is the user's chance to correct or add context before you build.

---

### Step 2: Detect Industry and Adapt

Read `references/industry_patterns.md` and match the company to its primary industry. This determines:
- Which strategy documents get the most depth
- Whether guardian agents are needed by default
- What regulatory/compliance anchors to include
- Which evaluation frameworks to suggest

Tell the user: "Based on my research, I'm treating [Company] as a [industry] company. This means I'll emphasise [X, Y, Z] in the strategy documents. Does that feel right?"

---

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

**What this folder structure is:** This is where your BoS OS lives. It sits on your machine, synced to Dropbox, Google Drive, or wherever you chose when setting up your Cowork project. Everything the OS produces, remembers, and decides goes here. The files are the memory.

**Sharing and privacy - keep it simple for now:** Everything in your BoS OS sits within one folder, and you can isolate that from anything else on your network. As you are getting started, the most important thing is to get the OS up and running, so for now, set it up as-is for yourself.

When you are ready to involve your team, you will want to give more thought to who gets access to what. Different people and different teams will need access to different parts of the OS, and some information you will want to keep private. The BoS OS has a structure for that, but it is not something you need to configure during bootstrap. Get it working first, then bring your team in.

**Initialise the state files:**

`session_summary.md` - Write an initial entry: "BoS OS bootstrapped from public data on [date]. All strategy documents require internal enrichment by their respective owners. See session_review_log.md for the list of items that need attention."

`session_review_log.md` - Create with a section for open items. Add one item per strategy document: "[Document name] - bootstrapped from public data, requires internal review and enrichment by [owner name]."

`decisions.md` - Create empty with a header: "Decision log for [Company] BoS OS."

---

### Step 4: Populate Strategy Documents

Read the templates from `references/strategy_templates/`. For each document:

1. Read the template to understand the structure
2. Populate it with real content from your research. Not placeholders, not generic statements, but specific information about this company.
3. Mark sections where you couldn't find public data with `[INTERNAL: This section needs enrichment from internal data. Suggested source: ...]`
4. Add a change log entry: "Bootstrapped from public data by BoS OS Bootstrap skill."
5. Save to `02_STRATEGY/`

**Naming convention:** Use plain English names that describe what the document is, not technical labels. Name files as a founder would naturally refer to them. Examples:

| Document type | File name |
|---------------|-----------|
| Values and culture | `Our_Values.md` |
| Brand and messaging | `How_We_Talk_to_the_Market.md` |
| Growth and commercial logic | `How_We_Grow.md` |
| Community and events | `How_We_Run_Events.md` |
| Content and speakers | `How_We_Create_Content.md` |
| Decision governance | `How_We_Make_Decisions.md` |
| Competitive differentiation | `Where_We_Win.md` |

Adapt names to match the company's actual language and domain. A logistics company should have `How_We_Move_Freight.md`, not `Operations_Strategy.md`. **Use the words they use.**

Inside each document, include a reference number in the header block (e.g., `Strategy Doc 101`) for cross-referencing in agent specs. But the file name and document title are plain English.

**Adapt documents to the company.** Not every company needs exactly the same set of strategy documents. If the company has a dominant domain not covered by the templates, create a document for it. If a template doesn't apply, create a lighter version or skip it. Use judgment.

**Quality standard:** Each document should read like a knowledgeable analyst wrote it after researching the company for a day. It won't have internal data, but it should demonstrate real understanding of the company's market, competitive position, regulatory environment, and strategic context. The user should read it and think "this is a solid starting point", not "this is generic filler."

---

### Step 5: Map the People and Their Roles

> **Bootstrap produces role stubs, not agent specs.** A role stub captures a person's name, title, functions, and which strategy documents they own. That is all you need at this stage. Full agent specs — with decision boundaries, escalation triggers, and evaluation criteria — are Workshop territory. Do not attempt them here.

Before thinking about agents, map the people. This step is about identifying who is actually running this company, their names, their roles, and what each of them is responsible for. Agents come later. Right now, you are mapping the human operating system.

For each identified leader (C-suite, senior leadership, or key function owner):

1. **Name them explicitly.** Not "the CMO" but the actual person's name if publicly known. This matters because the strategy documents created in Step 4 need a named owner. An un-owned document is an ignored document.

2. **Describe what they are responsible for** in plain language, not org-chart language. What does this person actually decide? What do they own? What would break if they left?

3. **Note which strategy documents they own.** Each document from Step 4 should map to one primary owner. If two people share ownership, note that explicitly. It is a signal worth surfacing.

4. **Note any obvious gaps.** If the company has a function with no clear leader (common in early-stage companies), flag it: `[GAP: No identified owner for [function] - founder may be covering this directly]`.

Read `references/agent_spec_template.md` to understand what comes next, but do not build full agent specs at this stage. Create lightweight role stubs in `03_AGENTS/` that capture: name, title, functions owned, strategy documents owned. These become the foundation for proper agent specs in the Workshop phase.

**Keep it proportionate.** A 10-person company might have 3 people covering 7 functions. A 200-person company might have 8 leaders. Map what's actually there. Don't invent a leadership structure that doesn't exist.

---

### Step 6: Create the Agent Map

Create `03_AGENTS/agent_map.md`, a table mapping every exec to their strategy documents and agents:

```markdown
| Executive | Title | Strategy Docs | Agents | Agent Type | Maturity |
|-----------|-------|--------------|--------|------------|----------|
```

Set all maturity levels to "Bootstrapped - requires internal enrichment" except note which ones are likely strongest based on available public data.

---

### Step 7: Generate CLAUDE.md

Read `references/claude_md_template.md` and populate it for this specific company. Include:
- Company name and description
- Industry-appropriate hard constraints
- The folder structure
- Decision cascade governance rules
- Current date

In the CLAUDE.md, refer to `02_STRATEGY/` documents by their plain English names. For example: "Agents must follow the decisions framework in `02_STRATEGY/How_We_Make_Decisions.md`."

Save to the workspace root.

---

### Step 8: Summary Report

Present a summary to the user:

1. **What was created** - list of all files with brief descriptions
2. **Where the public picture is clear** - which strategy documents had enough public information to produce a solid first draft. This is not a judgement of how good the company is in these areas. It is a reflection of how much was findable. A company with a clear public presence will score well here regardless of whether the underlying reality matches.
3. **Where the OS needs your input** - which documents are thin because the information simply isn't public. These are not weaknesses in your business. They are gaps in what the outside world can see. Only you can fill them in. Ordered by priority: which ones matter most for how the OS will support your decisions.
4. **Personal goal and North Star metric** - confirm both answers from the opening questions and note where they're reflected in the documents. If either is unresolved, surface your suggested answer now: "Based on everything I've built, here's what I'd suggest, and here's why: [your suggestion]. Does that feel right, or is there something you'd push back on?"
5. **What to do next** - see below

**Recommended next step - start with yourself, not your team:**

The founder or CEO is the first and most important user of this OS. Before involving anyone else, work through it yourself. That process is how you learn how the system works, and you cannot explain it to your team until you understand it yourself.

**Make this feel like a moment of discovery.** When you present the summary, don't just hand them a list of files. Show them what you found. Pick two or three genuinely interesting things the research surfaced: a competitive position they haven't articulated, a pattern in how they talk about their customers, a gap in their leadership map that's worth naming. Make them feel that the OS already knows something real about their company. That's what pulls them in.

Tell the user something like:

> "To be clear about where we are: what you have is a first draft built entirely from public information and two questions. Some of it will be wrong. Some of it will be focused on the wrong things. That's expected. The system has never spoken to you before.
>
> The next step is to give it feedback. Open the documents, read them, and start shaping what's there so it reflects what you actually know your company to be. Correct what's wrong. Add what's missing. Remove what doesn't apply. This is the process of making the OS yours.
>
> Here's one thing I noticed while building it that might be worth looking at first: [one specific, genuine observation from the research, something concrete, not generic]."

Then present the "next 90 minutes" guidance:

```
## Your next 90 minutes

What you have is a first draft from public information and two questions.
Some of it will be wrong. Some of it will be focused on the wrong things.
That's fine. This step is about giving the OS feedback and starting to 
shape it into something that reflects what you know your company to be.

1. Start with your Values document. Correct anything that doesn't sound like you,
   add what's missing, remove what doesn't apply.
2. Open the strategy document most relevant to your biggest current challenge.
   Add the two or three things only you know that aren't in there yet.
3. Check the people map. Correct any names, titles, or responsibilities that are wrong.
4. Ignore everything else for now.

Use the Workshop skill to guide you through each of these.

You can do this in chunks. It doesn't have to be one sitting.
That said, most people find that once they start, they cancel the next meeting.
```

---

## Tone and Quality

Be direct and specific. Generic filler like "the company aims to be a leader in its space" is useless. If you found that the company raised a Series C at $200M valuation and is expanding into APAC, say that. If their job postings reveal they use Kubernetes on GCP with a React frontend, put that in the platform architecture document.

When you can't find information, say so explicitly: `[INTERNAL: No public data found for this section. The [role] should provide: ...]`. This is more useful than filling in generic content that the exec will have to delete.

Use the language this company actually uses. If their website says "clients" not "customers," use clients. If they call their product a "platform" not a "tool," use platform. One wrong term and the whole OS feels like it was written for someone else.

---

## Multi-Session Support

If the bootstrap takes more than one session (unlikely but possible for very large companies), use the state folder:
- Update `session_summary.md` with what was completed
- Add open items to `session_review_log.md`
- Next session, read the state folder and resume where you left off
