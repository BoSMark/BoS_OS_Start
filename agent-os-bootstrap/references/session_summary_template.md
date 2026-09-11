# session_summary_template.md

Use this template for `01_STATE/session_summary.md`. Overwrite the file at each session close — do not append.

The summary reflects the current session only. Historical sessions live in `01_STATE/sessions/YYYY-MM-DD.md`.

---

```markdown
# Session — YYYY-MM-DD

## Decided
- [decision + DEC reference]

## Files changed
- [file path] — [what changed]

## Open items for next session
- [item — owner]
```

---

**Usage notes:**
- Replace `YYYY-MM-DD` with today's date. For multiple sessions in one day, use `YYYY-MM-DD-2`, `YYYY-MM-DD-3`, etc.
- Keep entries short — this file is read at every session start; bloat here is a context cost.
- Decisions go here as a one-liner; full detail stays in `01_STATE/decisions.md`.
- Open items carry forward until resolved; closed items archive to `01_STATE/sessions/`.
