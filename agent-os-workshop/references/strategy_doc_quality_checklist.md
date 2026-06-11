# Strategy Document Quality Checklist

**Author:** Tim Barker, Mark Littlewood and Business of Software
Use this checklist in the Workshop Phase 1 deep-dive to assess a strategy document's maturity and identify what to work on. Work through each section conversationally. Don't hand the list to the exec; use it to guide your questions.

---

## How to Use This

For each section below, assess the document at one of three maturity levels:

- **Bootstrapped** - populated from public data; structurally sound but missing internal specificity
- **Enriched** - internal data added; reflects how the company actually operates
- **Operational** - specific enough that an agent can make real decisions from it without asking clarifying questions

The goal of each workshop session is to move at least one section from Bootstrapped to Enriched, and at least one section from Enriched to Operational.

---

## Section 1: Context

**What good looks like:** A reader unfamiliar with the company can read this and understand why this document exists, what business problem it addresses, and what would break if it were wrong.

**Questions to probe:**
- "What happens if this document gives an agent the wrong steer? Who gets hurt? What revenue is at risk?"
- "Does this describe *your* company, or could it describe any company in your space?"
- "When did you last update this? Is anything here out of date?"

**Red flags:**
- Generic statements that apply to any company ("we believe in quality and customer satisfaction")
- No consequences named for getting this wrong
- Written entirely from public data with no internal perspective

---

## Section 2: Governing Framework

**What good looks like:** A named framework, standard, or set of principles that an agent can apply when making decisions in this domain. Not just values, but actual decision criteria.

**Questions to probe:**
- "What framework does your team actually use to judge quality in this area?"
- "If a new senior hire asked 'how do we do things here?', what would you point them to?"
- "What external standards or accreditations govern this domain?"
- "How do you currently know if something in this area is good, bad, or mediocre?"
- "Are there any BoS speakers that have influenced your approach?" *(Agent: if they name someone, treat it as a signal about their thinking style and priorities. businessofsoftware.org/talks has talks, speaker pages, videos, transcripts, and interviews - use it. Notable examples with strong frameworks: Bob Moesta on jobs to be done, Mikey Trafton on culture. A named speaker is a useful lens for the rest of the session.)*

**Red flags:**
- "We follow best practices" (which ones?)
- No named framework, just vague principles
- Framework exists but isn't documented here, so the agent can't access it

**If they don't have a named framework:** Check `references/evaluation_frameworks.md` and suggest options appropriate to their domain. Help them choose. Don't force one.

---

## Section 3: Scope and Boundaries

**What good looks like:** An agent reading this can determine whether a specific decision or task falls inside or outside this document's remit. Cross-document dependencies are named explicitly.

**Questions to probe:**
- "Where does this document end and another one begin?"
- "Give me an example of a decision that's in scope. Now give me one that's out of scope. Is that boundary clear in the document?"
- "If two executives each owned a piece of this, which piece does this document cover?"

**Red flags:**
- "Out of scope" section is empty or just says "everything else"
- No cross-references to related documents
- Scope is so broad that everything is in scope (useless boundary)
- Scope is so narrow that adjacent decisions have no home

---

## Section 4: Decision Rights

**What good looks like:** Specific named individuals (not just roles) are accountable for specific types of decisions. An agent knows exactly who to escalate to and under what conditions.

**Questions to probe:**
- "Who specifically decides X? Can you name them?"
- "What happens when two people need to agree and they disagree?"
- "What decisions can be made without any human approval at all?"
- "What decisions always require escalation, no matter what?"

**Red flags:**
- Only roles named, no individuals ("the CMO decides" vs "Giselle decides")
- No escalation path defined
- Decision rights haven't been reviewed since the org changed
- Vague language: "stakeholders agree", "leadership decides"

---

## Section 5: Success Criteria

**What good looks like:** Measurable outcomes that would change if the document were being followed well vs poorly. An agent can self-assess whether its work is hitting the mark.

**Questions to probe:**
- "If your agent produced perfect work in this domain for a year, what would change in the business that you could measure?"
- "What number would move? By how much?"
- "What's the leading indicator that tells you it's working before the lagging indicator moves?"
- "What does failure look like? How would you know you had a problem?"

**Red flags:**
- "Improve customer satisfaction" (not measurable as written)
- Success criteria that can never be measured ("best in class")
- No owner named for measuring or reporting on each criterion
- Criteria that were set years ago and never revisited

---

## Section 6: Current State Assessment

**What good looks like:** An honest description of where the company actually is today, what's working, what's broken, what's missing. This is almost always the section that bootstrapped documents get wrong, because it requires internal knowledge.

**Questions to probe:**
- "What's actually working well in this area right now?"
- "What's the biggest gap between where you are and where this document says you should be?"
- "What's been tried and failed? Why?"
- "What's the one thing in this area that keeps you up at night?"

**Red flags:**
- Section is blank or says "[INTERNAL: needs enrichment]"
- Only describes aspirational state, not current reality
- No acknowledgment of known weaknesses or gaps

**Note:** This section should be handled with care around confidentiality. Internal weaknesses, financial gaps, or personnel issues should go to `00_LOCAL_CONTEXT/` if they can't be documented safely in a tracked file.

---

## Section 7: Regulatory and Compliance Anchors

**What good looks like:** Every external constraint that an agent must respect is named explicitly, whether regulation, standard, accreditation body, or contractual requirement. An agent following this document will never accidentally violate a compliance requirement.

**Questions to probe:**
- "What regulations apply to this domain? Even in unregulated industries, there are usually standards."
- "What would an auditor look for here?"
- "What do your enterprise customers require from you in this area?"
- "Have any of these requirements changed in the last 12 months?"

**Red flags:**
- Section is blank even for domains with obvious regulatory exposure (security, data, finance, health)
- Regulations named but requirements not specified
- No owner named for compliance monitoring

---

## Overall Maturity Assessment

After working through all seven sections, give the exec an honest overall maturity rating:

| Rating | Description |
|--------|-------------|
| **Bootstrapped** | Structurally complete, public-data only, no internal specificity |
| **Enriched** | Internal data present in most sections; governing framework named; some success criteria measurable |
| **Operational** | Specific enough for an agent to make real decisions; all sections have internal data; success criteria measurable; decision rights name individuals |
| **Mature** | Operational plus actively maintained; change log shows regular updates; success criteria are tracked and reported |

Most documents coming out of Bootstrap are at **Bootstrapped**. A single well-run Workshop session should move the most important document to **Enriched**. Reaching **Operational** typically takes 2-3 sessions or significant homework between sessions.

---

## Prioritisation Guidance

If the exec owns multiple strategy documents and you're deciding where to spend the session:

**At the start of the session, offer the exec a choice:**

- **Quick win:** "Pick a document we can work through in 20 minutes. You should leave with at least one useful insight. And you'll have given me your first feedback, and I love feedback."
- **Deep dig:** "Pick the document that matters most to you right now. We'll go where it leads, though I'll flag if we're spending time on something that won't affect any real decision in the next 30 days."

Let them choose. Both are valid. The quick win is usually better for a first session.

**If they choose the deep dig:**

Suggest the document you think is most likely to help them see the value of the system, not the one that feels most strategically important. Tell them why you chose it. Then ask if they'd prefer a different one.

If they suggest a different document, explain your reasoning: why you picked yours, why theirs is a different kind of choice. Then ask them to decide. Don't override them, but don't just capitulate either. The conversation about which document to start with is itself useful data about how they think.

Whichever document you land on: go deep on one, don't spread across several. And watch for rabbit holes, sections that feel important but have no decisions depending on them in the next 30 days. Name them, set them aside, move on.

---

**Agent note:** Use this as a guide for your questions, not a form to fill in. A conversational pass through two sections done well beats a mechanical pass through all seven.

*If you're an exec reading this directly - this is the map, not the territory. The workshop is where it gets useful.*

*Part of the BoS OS Workshop skill. See also: `references/evaluation_frameworks.md`, `references/ground_truth_examples.md`*
