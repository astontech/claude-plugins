---
name: spike-plan
description: Re-plan a Spike Board queue with the mentor — negotiate a path change and materialize or reshape the next few spike tickets in Jira, bucketed under the right epics and sequenced with blocked-by links. Use when the user wants to plan or re-plan a sprint or a mentee's path, set up a queue where none exists, or turn an agreed track into real tickets.
---

# Spike sprint planning

You are negotiating and materializing a mentee's near-term path as real Jira tickets. Mentees file their own proposed queue at drafting time (`spike-ticket` ends by filing the whole chain), so this session is usually **re-planning** — agreeing or reshaping a path with the mentor in the room — or standing up a queue where none exists. If you're talking to a mentee alone, proceed, but say plainly that the plan is a proposal until the mentor has seen it.

Read `${CLAUDE_PLUGIN_ROOT}/references/atlassian-conventions.md` and `${CLAUDE_PLUGIN_ROOT}/references/topic-catalog.md` before doing anything.

## Ground rules

- **Plan a week or two, not a career.** Materialize 2–4 tickets — roughly the next one to two weeks at the default time-boxes. The rest of the track stays a conversation. Pre-created tickets are drafts that will be refined (or reworked by `spike-pivot`) as presentations reveal shape; the further out a ticket sits, the rougher it is allowed to be.
- **The board is the source of truth.** Before planning, read the mentee's current state from Jira: Done tickets, the spike in flight, and anything already queued. Never plan from memory of a previous conversation, and never create a ticket that duplicates one already on the board.
- **One spike in flight.** Planned tickets land in **To Do** — the board has no Backlog status; the queue order lives entirely in `is blocked by` links, and the next-up ticket is simply the unblocked head of the chain. Nothing you create goes to In Progress.
- **The ladder never forks.** Exit questions come verbatim from the catalog. Entry point and ticket size personalize; question wording never does.
- **Prerequisites are links, one hop max.** Sequence the planned tickets with `is blocked by` links. If the plan needs two or more prerequisite detours to reach its goal, the mentee is entering the track too early — stop and say so instead of planning around it. Judge prerequisites against the mentee's *actual state*, not only their Done tickets: a skill the mentor attests to, or a quick spot-check in the session confirms, counts as met (same standard as entry-point personalization — claims get stress-tested publicly at presentations anyway). The two-detour halt counts detour *tickets the plan would have to create*, not prerequisites the catalog lists.

## The session

1. **Load state.** Query the board for the mentee's tickets in every status. Summarize what you find in two or three sentences and confirm it matches their understanding — a mismatch here means the board needs fixing before planning does.
2. **Agree the path.** Start from the mentee's filed queue — their To Do chain is the standing proposal; fall back to the catalog track only when no queue exists. Check each proposed spike's exit questions against what the mentee's Done tickets already covered — skip anything already behind them. Adjust order for prerequisites and preference; where the catalog and the mentee disagree, surface the tradeoff and recommend, don't just comply.
3. **Draft each ticket.** Use the structure in `${CLAUDE_PLUGIN_ROOT}/references/ticket-template.md` — same standard as a `spike-ticket` draft: one-sentence goal, verbatim catalog exit questions, out-of-scope fences, scripted demo, real starting resources, day-based time-box. For tickets more than one hop out, a rougher scripted demo and resource list is acceptable; note in the ticket that it's pending refinement.
4. **Show the plan before filing.** Present the full set — titles, time-boxes, sequence, which epic each lands under — and get an explicit go-ahead.
5. **File.** Create the tickets in project `SCRUM` via the `atlassian` MCP tools: assignee = the mentee, status To Do, each under its track's epic (create the epic if the track has none), `is blocked by` links expressing the sequence — the links are what mark everything behind the next-up ticket as queued, so never skip them. Stub a Confluence page only for the next-up ticket (per the conventions — the mentee fills it during the spike); further-out tickets get their page when they unlock, since a pivot may rework them first. If MCP tools are unavailable, output all tickets as paste-ready markdown and list the epic/link/status placements as a manual checklist.
6. **Close.** Restate the plan in one short paragraph: what's queued, what unlocks what, and when to revisit (next presentation, or when something surprises).
