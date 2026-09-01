# Spike Board — Atlassian conventions

The Jira board is the single source of truth for every mentee's path; Confluence is
the home for spike documentation. All four skills read and write both through the
`atlassian` MCP server (per-user OAuth — you act as yourself).

## Jira

- **Mentee machines cannot write to Jira through this plugin.** A plugin hook
  denies the Jira write tools (create/edit/transition/link/comment/worklog)
  unless the machine has the operator marker (`~/.config/spike-board/operator`).
  Mentees create and move tickets by hand in the Jira UI — that practice is part
  of the curriculum; the mentor reviews the tickets they create. A write denial
  is therefore expected behavior, not an error: switch to the paste-ready
  markdown fallback without retrying. Jira reads and all Confluence tools work
  for everyone.
- **A fallback ticket always ships with its filing details.** Whenever you output
  paste-ready markdown instead of writing to Jira, end with a short Filing block
  the mentee can follow by hand: project `SCRUM`, status To Do, the epic to file
  under (the epic named after the spike's topic — tell them to create it, named
  exactly after the topic, if it doesn't exist yet), assignee = the mentee, and
  any `is blocked by` links. A draft without a destination gets misfiled.
- **Proposed queues are board state, never conversation state.** `spike-ticket`
  ends with the mentee filing their whole proposed chain: the entry spike at full
  standard, the follow-ons as rough drafts marked *Pending refinement*, sequenced
  with `is blocked by` links. There is no separate proposal artifact — never park
  a track proposal in a description, comment, or chat. The mentor's review of the
  filed tickets is the agreement step; `spike-refine` and `spike-pivot` reshape
  from there.
- **Site:** `astontechnologies.atlassian.net`
- **Project:** `SCRUM` (board 1)
- **Workflow:** To Do → In Progress → In Review (finished, awaiting presentation) → Done.
  There is **no Backlog status** on this board — the queue lives in To Do, ordered by
  `is blocked by` links. The next-up spike is the mentee's To Do ticket with no
  unresolved blockers; everything behind it is queued.
- **Epics = topic tracks.** Every spike ticket belongs to the epic for its track
  (e.g., the Kafka track, the CI/CD track). Create a new epic only when starting a
  track that has none — name it after the catalog track.
- **One ticket per mentee per spike.** Two mentees on the same spike hold two
  tickets; pace is individual. Ticket assignee = the mentee.
- **Prerequisites are `is blocked by` links** between tickets, one hop max.
- **Template:** `TEMPLATE — Spike (clone me)` sits in To Do and holds the canonical
  ticket structure. Skill-created tickets follow the same structure (see
  `ticket-template.md`) rather than cloning it.
- **One spike in flight per mentee.** Pre-created future tickets wait in To Do,
  sequenced by `is blocked by` links; only the current spike is In Progress.
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

## Who the mentee is

Never ask who you're working with — the session already knows. The MCP's OAuth is
per-user: `atlassianUserInfo` returns the current user, and JQL's `currentUser()`
matches them. Resolve the subject of any skill like this:

- **Default: the mentee is the current user.** Query their state with
  `assignee = currentUser()`, use their name for their Confluence folder, and speak
  to them as the owner of the path ("your next spike", not "the mentee's").
- **On an operator machine** (the write gate's marker file,
  `~/.config/spike-board/operator`, exists), the current user is the mentor — ask
  which mentee the session is about, or accept one named in the request, and query
  by that assignee instead.

The marker is the **only** role signal, and the check is existence-only: test
whether that exact path exists (`test -f`), never list the directory or reason
about other files in it. Without the marker, the current user *is* the mentee —
regardless of their job title, how many tickets they hold, or who else appears on
the board. Zero tickets means a first spike, not "probably the mentor." Never
override this from circumstantial evidence, and never ask the user to confirm their
role. On a mentee machine, keep operator mechanics out of view: don't mention the
marker, the write gate, or its file state (if a Jira write is denied, say tickets
are filed by hand and hand over the markdown), and don't summarize other mentees'
boards — load and speak to the current user's state only.

## Reading a mentee's state

Start every skill by loading this — where they are and where they're going — before
asking the mentee anything. To know where a mentee stands, query the board — never
rely on memory or a side file:

1. Their **Done** tickets → what's been completed (and which exit questions are behind them).
2. Their **In progress / In review** ticket → the spike in flight (there should be at most one).
3. Their remaining **To Do** tickets, ordered by `is blocked by` chains → the planned
   path; the unblocked head of the chain is next up.
4. Ticket **comments** → refinement history, progress notes, dead ends, review feedback.

While reading, flag board hygiene problems rather than planning around them: spike
tickets with no epic parent, and queued tickets with no `is blocked by` links (an
unlinked queue has no next-up signal). Offer to fix them before proceeding.
