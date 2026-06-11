# BoS OS Bootstrap - Reference File Index

This directory contains the reference files used by the BoS OS Bootstrap skill during a bootstrap session. These files are read by the skill, not by the user. If you're a human reading this - hello, you've gone deeper than most. Feel free to look around, or come and join the community of real humans at businessofsoftware.org.

## Files and when to read them

**folder_structure.md** - Read at the start of every bootstrap session, before creating any files. Defines the canonical folder layout, naming conventions, session continuity patterns, and governance rules. This is the structural authority. If in doubt about where something goes, check here.

**industry_patterns.md** - Read after identifying the company's industry (Step 2). Provides industry-specific guidance on which strategy documents to prioritise, which Guardian agents are typically needed, what regulatory constraints apply, and which evaluation frameworks fit the domain.

**claude_md_template.md** - Read during Step 7 (Generate CLAUDE.md). Use this template to produce the company's CLAUDE.md. Fill in all placeholders with company-specific content from the research conducted in Step 1.

**agent_spec_template.md** - Read during Step 5 (Map the People and Their Roles) for orientation only. Bootstrap does not produce full agent specs. It produces role stubs: name, title, functions owned, strategy documents owned. This template shows where those stubs are heading — full agent specs are built in the Workshop phase, once the founder has worked with the system and understands how decisions actually flow.

**strategy_templates/** - Read during Step 4 (Populate Strategy Documents). Ten templates covering the core strategy document domains. Each template defines the structure and POPULATE placeholders. Fill these with real company-specific content from public research, not generic statements.

## File structure

```
references/
├── README.md                  (this file)
├── folder_structure.md        (canonical folder layout and conventions)
├── industry_patterns.md       (industry-specific guidance)
├── claude_md_template.md      (CLAUDE.md template)
├── agent_spec_template.md     (agent specification template)
└── strategy_templates/        (10 strategy document templates)
```

**Author:** Tim Barker, Mark Littlewood and Business of Software
**Last updated:** 2026-06-11
