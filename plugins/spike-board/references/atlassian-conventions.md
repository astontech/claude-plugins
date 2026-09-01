# Spike Board — Atlassian conventions

The Jira board is the single source of truth for every mentee's path; Confluence is
the home for spike documentation. All four skills read and write both through the
`atlassian` MCP server (per-user OAuth — you act as yourself).

## Jira

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

## Confluence — spike documentation

Every spike gets a Confluence page: the written record of what was learned. For
write-up or diagram spikes the page *is* the supporting artifact; for hands-on spikes
it's a short companion to the demo repo (link to the repo, key findings, the
surprises). Writing it is part of the spike, not extra credit — it's also rehearsal
for the presentation.

- **Space:** the Spike Board space. Search Confluence for it before creating pages;
  if it doesn't exist yet, ask the mentor rather than creating a space yourself.
- **Page location:** each mentee has their own folder in the space, named after
  them; their spike pages go inside it, newest last — the folder reads as a
  chronological record of their journey. (Track grouping lives in Jira via epics;
  don't mirror it in Confluence.) Create the mentee's folder on their first spike
  if it doesn't exist yet.
- **Page title:** the ticket key plus the spike title, e.g.
  `SCRUM-42 — Kafka: produce and consume messages from a Spring Boot app`.
- **Link both ways:** the ticket's artifact comment links the page; the page opens
  with a link to the ticket (and the demo repo, when there is one).
- **Suggested skeleton** (a starting shape, not a form to fill): the gap, the exit
  questions answered in the mentee's own words, how the demo works, what surprised
  them, what's still fuzzy, links.

## Reading a mentee's state

To know where a mentee stands, query the board — never rely on memory or a side file:

1. Their **Done** tickets → what's been completed (and which exit questions are behind them).
2. Their **In progress / In review** ticket → the spike in flight (there should be at most one).
3. Their **Backlog / To do** tickets, ordered by `is blocked by` chains → the planned path.
4. Ticket **comments** → refinement history, progress notes, dead ends, review feedback.
