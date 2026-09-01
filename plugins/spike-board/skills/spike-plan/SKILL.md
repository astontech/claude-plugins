---
name: spike-plan
description: Sprint planning for the Spike Board — take a mentee's suggested track and materialize the next few spike tickets in Jira, bucketed under the right epics and sequenced with blocked-by links. Use when the user wants to plan a sprint, plan the next week or two of spikes, create the tickets for a track or path, set up a mentee's queue, or turn a suggested track into real tickets.
---

# Spike sprint planning

You are materializing a mentee's near-term path as real Jira tickets. This normally happens in a planning session with the mentor in the room — if you're talking to a mentee alone, proceed, but say plainly that the plan is a proposal until the mentor has seen it.

Read `${CLAUDE_PLUGIN_ROOT}/references/jira-conventions.md` and `${CLAUDE_PLUGIN_ROOT}/references/topic-catalog.md` before doing anything.

## Ground rules

- **Plan a week or two, not a career.** Materialize 2–4 tickets — roughly the next one to two weeks at the default time-boxes. The rest of the track stays a conversation. Pre-created tickets are drafts that will be refined (or reworked by `spike-pivot`) as presentations reveal shape; the further out a ticket sits, the rougher it is allowed to be.
- **The board is the source of truth.** Before planning, read the mentee's current state from Jira: Done tickets, the spike in flight, and anything already queued. Never plan from memory of a previous conversation, and never create a ticket that duplicates one already on the board.
- **One spike in flight.** Planned tickets land in **Backlog** (or **To do** for the immediate next one). They wait there; nothing you create goes to In progress.
- **The ladder never forks.** Exit questions come verbatim from the catalog. Entry point and ticket size personalize; question wording never does.
- **Prerequisites are links, one hop max.** Sequence the planned tickets with `is blocked by` links. If the plan needs two or more prerequisite detours to reach its goal, the mentee is entering the track too early — stop and say so instead of planning around it.

## The session

1. **Load state.** Query the board for the mentee's tickets in every status. Summarize what you find in two or three sentences and confirm it matches their understanding — a mismatch here means the board needs fixing before planning does.
2. **Agree the path.** Start from the suggested track (from `spike-ticket` or the catalog). Check each proposed spike's exit questions against what the mentee's Done tickets already covered — skip anything already behind them. Adjust order for prerequisites and preference; where the catalog and the mentee disagree, surface the tradeoff and recommend, don't just comply.
3. **Draft each ticket.** Use the structure in `${CLAUDE_PLUGIN_ROOT}/references/ticket-template.md` — same standard as a `spike-ticket` draft: one-sentence goal, verbatim catalog exit questions, out-of-scope fences, scripted demo, real starting resources, day-based time-box. For tickets more than one hop out, a rougher scripted demo and resource list is acceptable; note in the ticket that it's pending refinement.
4. **Show the plan before filing.** Present the full set — titles, time-boxes, sequence, which epic each lands under — and get an explicit go-ahead.
5. **File.** Create the tickets in project `SCRUM` via the `atlassian` MCP tools: assignee = the mentee, status Backlog (To do for the next-up ticket), each under its track's epic (create the epic if the track has none), `is blocked by` links expressing the sequence. If MCP tools are unavailable, output all tickets as paste-ready markdown and list the epic/link/status placements as a manual checklist.
6. **Close.** Restate the plan in one short paragraph: what's queued, what unlocks what, and when to revisit (next presentation, or when something surprises).
