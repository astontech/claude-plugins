# spike-board evals — template-drift regression

Mentor-only tooling. Runs the skill headlessly and asserts the fixed templates appear
(and setup narration doesn't). A failing case means the skill drifted from its ladder
— or a reference it drafts from changed.

## Preconditions

- The installed plugin (`claude plugin update spike-board@astontech`) at the version
  under test — cases run against the install, not the working tree.
- Atlassian MCP OAuth valid for the current user.
- Board fixtures: the current user holds a chain — one **In Review** ticket whose
  successor is still a **stub**, then more queued To Do tickets linked `is blocked by`
  (as of 2026-09-02: SCRUM-22 In Review → SCRUM-23 stub → SCRUM-24, label
  `test-fixture`). Cases marked `needs: chain` and `needs: chain-inreview` depend on
  it; `ticket-overdue` asserts the overdue-draft preface that this state triggers. Set
  `SPIKE_EVAL_NEXT_KEY` to the queue head (default `SCRUM-23`).
- Confluence fixture: the current user has **no folder** in the Spike Board space
  (`needs: no-folder`; `ticket-folder-missing` asserts the create-a-folder handover).
  Once the mentor's own folder exists this case needs a different current user or a
  sibling case for the folder-present variant.
- Run from a directory **outside** `~/Projects` so no CLAUDE.md or auto-memory loads;
  the runner does this for you (`~/mentee-sim`).

## Run

```bash
plugins/spike-board/evals/run.sh                 # all cases
plugins/spike-board/evals/run.sh ticket-midtrack # one case
```

Each case is `cases/<name>.env`: the prompt and newline-separated `MUST` / `MUST_NOT`
regexes (extended, case-sensitive). The runner runs `claude -p`, greps the output,
and prints PASS/FAIL with the missed assertions. Outputs land in `evals/out/`
(git-ignored).

## Adding a case

Copy an existing `.env`. Assert on template text that should be stable across runs —
a template's fixed sentence, a table header — never on free-text slots. Add a
`MUST_NOT` for every kind of leak you've seen (setup narration, other mentees' names,
tool mechanics).
