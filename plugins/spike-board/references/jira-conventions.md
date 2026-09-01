# Spike Board — Jira conventions

The board is the single source of truth for every mentee's path. All four skills read
and write it through the `atlassian` MCP server (per-user OAuth — you act as yourself).

- **Site:** `astontechnologies.atlassian.net`
- **Project:** `SCRUM` (board 1)
- **Workflow:** Backlog → To do → In progress → In review (finished, awaiting presentation) → Done
- **Epics = topic tracks.** Every spike ticket belongs to the epic for its track
  (e.g., the Kafka track, the CI/CD track). Create a new epic only when starting a
  track that has none — name it after the catalog track.
- **One ticket per mentee per spike.** Two mentees on the same spike hold two
  tickets; pace is individual. Ticket assignee = the mentee.
- **Prerequisites are `is blocked by` links** between tickets, one hop max.
- **Template:** `TEMPLATE — Spike (clone me)` sits in Backlog and holds the canonical
  ticket structure. Skill-created tickets follow the same structure (see
  `ticket-template.md`) rather than cloning it.
- **One spike in flight per mentee.** Pre-created future tickets wait in Backlog /
  To do; only the current spike is In progress.
- **Done means:** presented, passed the question round, artifact linked on the
  ticket. Never hours spent.

## Reading a mentee's state

To know where a mentee stands, query the board — never rely on memory or a side file:

1. Their **Done** tickets → what's been completed (and which exit questions are behind them).
2. Their **In progress / In review** ticket → the spike in flight (there should be at most one).
3. Their **Backlog / To do** tickets, ordered by `is blocked by` chains → the planned path.
4. Ticket **comments** → refinement history, progress notes, dead ends, review feedback.
