# Spike Board — Atlassian conventions

The Jira board is the single source of truth for every mentee's path; Confluence is
the home for spike documentation. The skill **reads** both through the `atlassian`
MCP server (per-user OAuth — you act as yourself) and **never writes to either**.
Creating tickets, setting epics and links, moving status, and creating Confluence
pages are the mentee's own acts in the UI — that practice is part of the curriculum,
and the mentor reviews what they file. The skill hands over paste-ready markdown.

## Jira

- **A draft always ships with its filing details.** Every ticket the skill outputs
  ends with a short Filing block the mentee can follow by hand: project `SCRUM`,
  status To Do, the epic to file under (named exactly after the spike's topic —
  tell them to create it if it doesn't exist yet), assignee = the mentee, and any
  `is blocked by` links. A draft without a destination gets misfiled.
- **Proposed queues are board state, never conversation state.** Drafting ends with
  the mentee filing their whole proposed chain: the entry spike at full standard,
  the follow-ons as stubs (title, goal, epic, link — *Stub — drafted when it
  unlocks*), sequenced with `is blocked by` links. There is no separate proposal
  artifact — never park a track proposal in a description, comment, or chat. The
  mentor's review of the filed tickets is the agreement step; refinement happens in
  ticket comments and the mentee revises the description by hand. **Filing doesn't
  schedule:** `is blocked by` means prerequisite and nothing else — never a stand-in
  for "after the current spike" (one-in-flight is a program rule, not a link). A
  chain filed beside an existing path is linked only where a real prerequisite
  exists; every ticket in it carries *Pending refinement* (or its stub line), and a
  pending chain is not next-up until the mentor refines it and, if order matters,
  links it.
- **Site:** `astontechnologies.atlassian.net`
- **Project:** `SCRUM` (board 1)
- **Workflow:** To Do → In Progress → In Review (finished, awaiting presentation) → Done.
  There is **no Backlog status** on this board — the queue lives in To Do, ordered by
  `is blocked by` links. The next-up spike is the mentee's To Do ticket with no
  unresolved blockers; everything behind it is queued.
- **Epics = topic tracks.** Every spike ticket belongs to the epic for its track
  (e.g., the Kafka track, the CI/CD track). Create a new epic only when starting a
  track that has none — name it after the topic. The epic *is* the track: when a
  topic is too big for one spike, its steps are tickets under one epic, sequenced
  with `is blocked by`. No file records tracks — the board does.
- **One ticket per mentee per spike.** Two mentees on the same spike hold two
  tickets; pace is individual. Ticket assignee = the mentee.
- **Prerequisites are `is blocked by` links** between tickets, one hop max.
- **Template:** `TEMPLATE — Spike (clone me)` sits in To Do and holds the canonical
  ticket structure. Skill-drafted tickets follow the same structure (see
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
for the presentation. The mentee creates the page once the ticket has a key; the
skill prints the skeleton.

- **Space:** the Spike Board space.
- **Page location:** each mentee has their own folder in the space, named after
  them; their spike pages go inside it, newest last — the folder reads as a
  chronological record of their journey. (Track grouping lives in Jira via epics;
  don't mirror it in Confluence.) The mentee creates their folder on their first spike.
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
matches them. **The mentee is the current user.** Query their state with
`assignee = currentUser()`, use their name for their Confluence folder, and speak to
them as the owner of the path ("your next spike", not "the mentee's"). Zero tickets
means a first spike, not "probably the mentor." Never ask the user to confirm their
role, and don't summarize other people's boards — load and speak to the current
user's state only.

The one exception: when the request itself names someone else ("this spike is for
Isaiah"), the mentor is drafting on a mentee's behalf. Query that assignee's board
instead and replace *you / your* in every template with their first name / *⟨Name⟩'s*
— nothing else changes.

## Reading a mentee's state

Start by loading this — where they are and where they're going — before asking the
mentee anything, and load it **silently**: the mentee's first visible output is the
skill's opening step, never a narration of the identity resolution or the board
queries. To know where a mentee stands, query the board — never rely on memory or a
side file:

1. Their **Done** tickets → what's been completed (and which exit questions are behind them).
2. Their **In progress / In review** ticket → the spike in flight (there should be at most one).
3. Their remaining **To Do** tickets, ordered by `is blocked by` chains → the planned
   path; the unblocked head of the chain is next up. Tickets still marked *Pending
   refinement* are proposals, not next-up, even when unblocked; tickets marked
   *Stub* get drafted to full standard when they become next-up.
4. Ticket **comments** → refinement history, progress notes, dead ends, review feedback.

**Template mechanics:** the ``` fences around a template in SKILL.md delimit it for
you — never output them; the mentee sees the text, not a code block. Fill every
`⟨slot⟩` and remove the brackets — the characters ⟨ and ⟩ never appear in output.

While reading, flag board hygiene problems rather than planning around them: spike
tickets with no epic parent, and queued tickets with no `is blocked by` links (an
unlinked queue has no next-up signal). Say so in one sentence before the opener and
tell the mentee to fix them in Jira before filing anything new.
