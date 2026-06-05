# Mission Brief — [Mission Name]

> The deliverable from the **Mission Shaper**. It captures one of two things: a **committed mission** or a framed **exploration**. Written in the owner's own words, read back, and owned by them.
> It feeds the **Agent Planner**, which casts and specs the agents that will run it. Fill the section that applies; delete the other.
> Save to: `04_MISSIONS/[MISSION-NNN_name]/MISSION-BRIEF.md`

**Type:** [ committed | exploration ]
**Owner:**
**Escalation owner:** *(who handles a block if the owner is unavailable)*
**Created:**
**Governing documents:** CLAUDE.md + [values RFC]

---

## If COMMITTED

**Shape:** [ time-bound | ongoing ]

**Outcome** *(the change in the world — a result, not a task list; for ongoing, the condition you maintain or steadily improve)*
-

**Measure** *(the named metric. No measure = not a committed mission. A measure implies a measurement agent at the next stage.)*

*Time-bound:*

| Metric | Current | Target | How measured |
|--------|---------|--------|--------------|
|        |         |        |              |

*Ongoing:*

| Metric | Hold at / direction | Acceptable band | How measured | Checked how often |
|--------|---------------------|-----------------|--------------|-------------------|
|        |                     |                 |              |                   |

**Time frame**
- *Time-bound* — **Horizon** (when the outcome lands and the mission closes):
- *Ongoing* — **Review cadence** + **review/retire trigger** (when you re-examine whether it should still run):

**Feedback loop** *(how the measure is checked, what signal says it's drifting, who acts)*
-

**Approach** *(incremental or step-change — stated, with the reasoning)*
-

**Work the outcome requires** *(the distinct capabilities the running mission needs — what must happen, e.g. gather data / classify / score / detect signals / draft outreach. Name them at capability level; the Agent Planner casts an agent per capability and designs the how + the infrastructure.)*
-

**Release condition** *(only if a guardian is staged — e.g. "no autonomous outbound until…": what must be true to lift the guardrail and move from operator-in-the-loop to automated)*
-

**Build on / depends on** *(what this reuses — data, tools, prior work, a manual version already running — and what must be stable or decided first)*
- Builds on:
- Depends on:

**Success announcement** *(the two-sentence internal note you'd send if this worked — it must describe something that changed)*
>

**What needs guarding** *(each entry is a candidate guardian for the Agent Planner to cast — a guardian holds the work to a standard: it reviews, flags, stops the line. Two kinds, and people miss the second.)*

| What's being guarded | Kind | The standard to enforce |
|----------------------|------|-------------------------|
|  | **protect** — spend / data / claims / irreversible | |
|  | **align** — messaging / founder's voice / brand / values | |

**Classified gaps** *(everything left underspecified, labelled by the work that closes it — this is the handoff to the Agent Planner)*

| Gap | Type | What closes it |
|-----|------|----------------|
|     | decision-boundary / knowledge / RFC-judgment |  |

**Coherence with strategy** *(which RFC / objective this serves; any tension flagged)*
-

---

## If EXPLORATION

**Hypothesis** *(what you suspect is true)*
-

**Validation condition** *(what you'd need to observe to believe it)*
-

**Kill condition** *(what would convince you it's not there)*
-

**Decide-by** *(the date you commit or kill — so it can't run forever)*
-

**Cheapest next test** *(the smallest thing that moves the hypothesis forward)*
-

---

*Next step: hand this brief to the Agent Planner. It reads the **Outcome + gaps** (→ execution agents), the **Measure + feedback loop** (→ a measurement agent), and **What needs guarding** (→ guardian agents, protect and align), specs each one, and produces the prioritised `todo.md` the Delivery Manager runs.*
