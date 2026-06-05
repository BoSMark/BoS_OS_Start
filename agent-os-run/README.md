# Agent OS — Run

The coordination layer for operating your BoS Agent OS day to day.

Use this after you've run **Bootstrap** and **Workshop**. You have a strategy layer and refined agent roles. This is how you put them to work.

---

## Three agents, one pipeline: *shape* the mission → *staff* it → *deliver* it

### 1. Mission Shaper — *shape the mission*
`/agent-specs/mission-shaper.md` · template: `/mission-templates/mission-brief.md`

An interview agent that coaches a rough idea into a sharp, measurable **Mission Brief** — by making you do the thinking, not by writing it for you (coach, not consultant).

It forces the outcome-vs-activity distinction, sets a real measure, decides whether the work is time-bound or ongoing, surfaces what needs guarding (both risk and voice/messaging), and names the capabilities the work requires.

**Input:** a rough goal, in your own words → **Output:** `MISSION-BRIEF.md`

### 2. Agent Planner — *staff the mission*
`/agent-specs/agent-planner.md`

Takes the Mission Brief and staffs the mission — casts the agent team the way you'd hire one, then specs each role to a runnable standard. Competency roles, not task-bots, so agents compound across missions.

**Input:** `MISSION-BRIEF.md` → **Output:** agent specs + a prioritised `todo.md`

### 3. Delivery Manager — *deliver the mission*
`/agent-specs/delivery-manager.md`

Drives each deliverable from high-level goal to running system, and runs the day-to-day backlog. It is a **challenger**: it keeps you at decision altitude and out of the weeds.

Two modes: **build mode** (decompose → discover → RECOMMEND gate → specify + tests → build → QA gate → operate) and **operate mode** (stand-up → pull → block → complete → wrap-up).

**Input:** agent team + `todo.md` → **Output:** built systems · `blocked.md` (your decisions) · `done.md`

---

## State file templates
`/mission-templates/`

Copy these into any new mission folder.

| File | Purpose |
|------|---------|
| `mission-brief.md` | The Mission Shaper's deliverable — the shaped mission |
| `todo.md` | Prioritised backlog |
| `in-progress.md` | What's being worked now |
| `blocked.md` | Your decision queue |
| `done.md` | Completed work — input to your retro |

---

## How they fit together

```
Mission Shaper     →  MISSION-BRIEF.md
  shape the mission     (outcome · measure · shape · guarding · capabilities · gaps)
        ↓
Agent Planner      →  agent specs + todo.md
  staff the mission     (the team, each role specced)
        ↓
Delivery Manager   →  built systems · blocked.md · done.md
  deliver the mission
     ├─ build mode:    decompose → discover → ▸RECOMMEND → specify(+tests) → build → ▸QA → operate
     └─ operate mode:  stand-up → pull → block → complete → wrap-up
        ↓
Retro (at close)   →  reads done.md
```

Each agent is bounded: the Shaper shapes (it doesn't cast), the Planner casts and specs (it doesn't run), the Delivery Manager delivers and runs (it doesn't re-shape).

---

## How to use

1. **Shape** — load `agent-specs/mission-shaper.md`, describe your idea in your own words → `MISSION-BRIEF.md`
2. **Staff** — load `agent-specs/agent-planner.md`, point it at the brief → agent specs + `todo.md`
3. **Deliver** — copy the templates into your mission folder, load `agent-specs/delivery-manager.md` each session

Each spec is plain markdown — load it in any Claude session, or install as a Cowork skill.

---

## Governance assumptions

- **Silence is not approval.** Agents block and wait; they don't guess past decision boundaries.
- **Draft before tracked.** Agent work goes to a local folder first; you approve before it moves to tracked files.
- **One decision at a time.** Agents surface one decision before moving to the next.
- **Blocks are specific.** A good block names the decision, the options, and a recommendation. Vague blocks are rejected.

Adapt the governing document references in each spec to point to your own system's authority documents.

---

*Part of the [BoS Agent OS](https://github.com/BoSMark/BoS_OS_Start) — built by Tim Barker, Mark Littlewood and [Business of Software](https://businessofsoftware.org).*

*[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — use and adapt freely; credit Business of Software.*
