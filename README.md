# BoS_OS_Start

An ai-operating-system-for-software-companies

Download the bootstrap agent and workshops skills to start building your very own company OS

Agent OS Toolkit — Installation & Usage Guide
Author: Tim Barker

Two skills that build an AI agent operating system for your company. Skill 1 bootstraps the whole thing from public data. Skill 2 guides each executive through refining it.


What You Need
Claude Desktop app with Cowork mode enabled
Internet access enabled in Claude's settings (Skill 1 needs web search to research your company)


Installing the Skills
The skills are folders, not packaged files. You install them by pointing Claude at them directly.
Step 1 — Download the repo
Click the green Code button on this page → Download ZIP → unzip it somewhere permanent on your computer (not Downloads — you need it to stay there. It will be the location of your OS).
Step 2 — Open Claude Desktop
In the main menu, click Customize → Skills, then add each skill folder — agent-os-bootstrap and agent-os-workshop.
Step 3 — Verify
Start a new Cowork conversation and say "set up an agent operating system for [company]" — Claude should recognise and trigger the bootstrap skill.To install each skill:

Open the Claude desktop app
Go to Settings → Skills
Click Install Skill (or drag the .skill file into the window)
Select the .skill file from your Downloads folder
Repeat for the second skill


Using Skill 1: Agent OS Bootstrap
This is where you start. It builds the entire operating system for your company from scratch.

How to trigger it:

Open a new conversation in Cowork and say something like:

"Set up an agent operating system for [Your Company Name]"

or

"Bootstrap agents for [Your Company Name] — our website is [url]"

What happens:

Claude researches your company using public information — leadership team, products, competitors, regulatory environment, tech stack
It confirms what it found and asks you to correct anything
It creates a complete folder structure with strategy documents (RFCs) populated with real company-specific content
It creates agent specifications mapped to each member of your leadership team
It produces a portfolio map showing who owns what
It generates a CLAUDE.md project instruction file

Time: ~20–30 minutes depending on company complexity.

What you get: A fully populated operating system ready for each executive to refine. Every document is clearly marked where it needs internal enrichment — the skill doesn't pretend public data is the whole picture.


Using Skill 2: Agent OS Workshop
Run this after Skill 1, or if you've already set up the folder structure manually.

How to trigger it:

"Walk me through the workshop"

or

"Help me refine my strategy documents"

or

"What should my agent's first mission be?"

What happens:

The skill runs an interactive workshop with four phases:

Orientation (~10 min) — Establishes who you are, what you own, and where your documents stand
Strategy Deep-Dive (~30 min) — Takes your strategy documents from their current state toward something specific enough that an AI agent can make real decisions from them
Agent Specification (~30 min) — Refines your agent spec with precise decision boundaries, evaluation frameworks, and hard constraints
First Mission (~20 min) — Defines a concrete, bounded first project for your agent with phased validation

Important: The workshop works one executive at a time. Each person runs it for their own domain. The first person to complete it sets the reference standard for everyone else.

Time: ~90 minutes per executive (can span multiple sessions — it picks up where you left off).


Recommended Sequence
Run Skill 1 with your company name → get the bootstrapped operating system
Each executive runs Skill 2 on their own portfolio → refined strategy, agent spec, and first mission
Execute the first mission → prove the agent works on a real task with phased validation


Frequently Asked Questions
Do I need both skills? Skill 1 creates the scaffolding. Skill 2 adds the depth. You can use Skill 2 without Skill 1 if you've already set up the folder structure manually (folders: 00_LOCAL_CONTEXT, 01_STATE, 02_STRATEGY, 03_AGENTS, 04_MISSIONS, 05_ARTIFACTS).

What if my company is private with limited public data? Skill 1 will do its best and clearly flag where it couldn't find information. You'll have more gaps to fill, but the structure and templates still give you a massive head start.

Can I run this for a team within a larger company? Yes. Give Claude the company name but scope the conversation to your division or team. It will adapt.

What's the folder structure for? It's a convention that gives AI agents consistent context. Strategy documents (RFCs) define the rules. Agent specs define what each agent can and can't do. Missions define time-bound projects. State files maintain continuity between sessions.

Is my data safe? The skills only use publicly available information. Your internal data stays in the 00_LOCAL_CONTEXT folder which is local-only. Nothing confidential enters the tracked files.

