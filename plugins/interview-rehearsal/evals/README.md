# interview-rehearsal evals — template-drift regression

Runs the skill headlessly against the **working tree** (`--plugin-dir`, no install
needed) and asserts the fixed templates appear and setup narration doesn't. A failing
case means the skill drifted from its ladder.

## Preconditions

- `claude` CLI signed in.
- Runs from `~/interview-sim`, a directory outside `~/Projects`, so no CLAUDE.md or
  auto-memory loads; the runner creates it and drops/removes the `talk-track.md`
  fixture per case (`NEEDS=talk-track`).

## Run

```bash
plugins/interview-rehearsal/evals/run.sh                # all cases
plugins/interview-rehearsal/evals/run.sh drill-opener   # one case
```

Each case is `cases/<name>.env`: the prompt and newline-separated `MUST` / `MUST_NOT`
regexes (extended, case-sensitive). Outputs land in `evals/out/` (git-ignored).

## Adding a case

Copy an existing `.env`. Assert on template text that should be stable across runs —
a template's fixed sentence — never on free-text slots. Add a `MUST_NOT` for every kind
of leak seen (setup narration, bracket characters, a later step's template).
