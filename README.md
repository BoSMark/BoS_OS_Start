# BoS OS Start

The BoS Agent OS helps you understand and manage your company operating system.

Most companies add AI tools on top of an operating system nobody has written down. Strategy lives in the founder's head. Roles blur. Decisions don't stick. AI amplifies whatever's already there — clarity becomes velocity; muddle becomes noise.

These two skills fix the foundation first.

**Current version: v2.0** — [What's new](CHANGELOG.md)

---

## What's here

This repo contains two skills that activate your company Agent OS:

**Bootstrap** — models your company OS from public information in under an hour. It produces a first draft of your strategy layer, agent roles, and decision governance — plus a seeded first mission so your agents have a real job from day one. Think of it as the AI doing its homework on your company before you meet.

**Workshop** — helps you refine what Bootstrap produced. It works with your insider knowledge, challenging assumptions, sharpening priorities, and turning the skeleton into something that reflects how you actually run the business. As you work through it, the AI starts to understand your strategic goals, identify gaps, and surface opportunities and threats specific to your business.

Use them in sequence. Bootstrap first, Workshop second.

> **In plain English:** Bootstrap creates; Workshop refines. If Bootstrap gives you the map, Workshop helps you navigate it.

---

## What v2.0 adds

v2.0 turns the toolkit from a one-time setup into a system that compounds:

- **Memory layer** — agents get smarter over time instead of starting from scratch each session
- **Quality gates** — work is checked before it reaches you, not after
- **Hardened decision cascade** — confidential content stays out of git; every decision names what it affects
- **Bootstrap summary** — you finish with a clear "here's what to do next", not a folder full of documents

See the full [CHANGELOG](CHANGELOG.md) for detail and upgrade instructions.

---

## How it works

Every company already has an operating system. Most just don't know what's in it.

![Every Company OS Ever](images/Every_Company_OS.png)

The BoS Agent OS maps that structure — then gives AI a governed place inside it.

![The same structure with AI inside](images/Company_OS_With_AI.png)

Your folder structure is your system. The files are the memory.

---

## Getting started

**Prerequisites:** Claude Pro subscription · Cowork mode enabled

**Step 1 — Download the skills**

Go to the [latest release](https://github.com/BoSMark/BoS_OS_Start/releases/latest) and download:
- `agent-os-bootstrap.skill`
- `agent-os-workshop.skill`

**Step 2 — Set up your Cowork project**

Before installing the skills, create your project:
1. Open Claude in Cowork mode
2. Go to Projects → New Project → select a folder on your computer

This is not optional. Without a project, nothing saves and you will need to start over.

> **Project setup check:**
> - Are you inside a Cowork project? (Check the top of the Cowork window — you should see a project name, not just "Claude")
> - Have you selected a folder? (You should see your folder name below the project name)
> - Is that folder inside a cloud-synced location (Dropbox, Google Drive, etc.)?
>
> If you can't answer yes to all three, stop and sort setup first.

**File storage:** Your OS files live in whatever folder you selected. Put that folder inside Dropbox, Google Drive, or another cloud sync service — your files will be backed up and accessible from any machine.

**Step 3 — Install the skills**

In Cowork, click **Customize** → **Skills** → **Add skill** → select `agent-os-bootstrap.skill`. Repeat for `agent-os-workshop.skill`.

> **Note:** You can also reach this via Settings → Connectors, but that will redirect you to Customize — so go there directly and save yourself a step.

**Step 4 — Run Bootstrap**

Start a Cowork session and say "Bootstrap my company OS". It will ask for your company name and build your OS draft from there.

---

## A note on RFCs

Your OS is built around documents called **RFCs** (short for Request for Comments — a term borrowed from internet standards, where it means a living document open to refinement). RFCs are your strategy documents. Each one covers a distinct area of your business. They're called RFCs because they're meant to evolve, not be set in stone. You'll refine them as you learn more about what the system can do.

---

## Your first 90 minutes after Bootstrap

Bootstrap produces a lot. Don't try to process it all at once. Check your `BOOTSTRAP_SUMMARY.md` first — it tells you exactly what to do next. Then:

1. Read your CLAUDE.md and correct anything that's wrong — pay particular attention to tone and terminology
2. Read your Values RFC and adjust it to sound like you, not like a consultant wrote it
3. Pick one RFC that covers your biggest current challenge and spend 20 minutes with Workshop on that alone
4. Ignore everything else for now — the rest will still be there

The system is designed to be lived in gradually, not consumed in one sitting.

---

## Upgrading from v1.0

If you installed the toolkit at Business of Software conference, v2.0 is a significant upgrade. Your existing files are safe — the migration is additive.

See [CHANGELOG.md](CHANGELOG.md) for the upgrade steps.

---

## Want just one skill?

- Bootstrap only → [BoSOS-Bootstrap](https://github.com/BoSMark/BoSOS-Bootstrap)
- Workshop only → [BoSOS-Workshop](https://github.com/BoSMark/BoSOS-Workshop)

---

## More skills, tasks, and agents

Further skills, scheduled tasks, and agent specs are released on an ongoing basis.

**Follow or watch this repo** to get notified when new ones ship.

All BoSMark repos → [github.com/BoSMark](https://github.com/BoSMark)

---

## Stay in the loop

Workshops, user groups, and community support:

**[businessofsoftware.org/updates](https://www.businessofsoftware.org/updates)**

Subscribe for workshop announcements, guided cohorts, and peer community access.

---

*Built by Tim Barker and [Business of Software](https://businessofsoftware.org) — helping software founders build profitable, enduring companies since 2007.*
