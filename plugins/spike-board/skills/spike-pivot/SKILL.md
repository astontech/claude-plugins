---
name: spike-pivot
description: Handle a discovered gap mid-track on the Spike Board — draft the gap spike, then reconcile the queued tickets behind it (keep and bump, rework, or drop each). Use when a presentation or spike reveals a missing prerequisite or misjudged scope, when the user says a mentee needs to pivot or detour, when the planned path no longer fits, or when a new ticket needs to cut in line.
---

# Spike pivot

A spike or presentation revealed a gap the plan didn't account for — a missing prerequisite, a misjudged depth, a track entered one rung too high. Your job is to draft the spike that closes the gap, then reconcile the pre-created tickets sitting behind it. Pivots restructure the board, so this normally runs with the mentor in the room; alone with a mentee, proceed but label the outcome a proposal for the mentor.

Read `${CLAUDE_PLUGIN_ROOT}/references/atlassian-conventions.md` and `${CLAUDE_PLUGIN_ROOT}/references/topic-catalog.md` first.

## The pass

1. **Load live state.** Query Jira for the mentee's full board: Done, in flight, and everything queued (To Do tickets and their `is blocked by` chains). You are reconciling reality, not the plan as remembered — a queued ticket may already have been refined since planning.
2. **Name the gap precisely.** One sentence, same standard as a Gap section: what can't the mentee do that the path assumed they could? Check it against the catalog — the gap is usually an existing catalog topic entered mid-way, which gives you verbatim exit questions for free.
3. **Check the hop rule.** The gap spike is one prerequisite detour. If closing it would itself need another detour, the track was entered too early — recommend backing out to a different entry spike rather than stacking detours. Two hops is the line; say so plainly.
4. **Draft the gap ticket** to the full `spike-ticket` standard (one-sentence goal, catalog exit questions, fences, scripted demo, real resources, day-based time-box). It becomes the mentee's next spike.
5. **Disposition each queued ticket, one at a time.** Walk the queue in sequence order. For each ticket, recommend exactly one of:
   - **Keep and bump** — still right, just later. Re-link `is blocked by` to sit behind the gap spike.
   - **Rework** — premise changed (scope, prerequisites, or exit-question subset). State what must change; the rework itself is a `spike-refine` pass, which you run next for each ticket marked rework.
   - **Drop** — the gap revealed the ticket shouldn't happen (wrong track, wrong depth, superseded). Closed with a comment saying why, never silently deleted.
   Present the full disposition table and get explicit approval before touching the board.
6. **Apply.** Via the `atlassian` MCP tools: create the gap ticket (To Do, right epic, assignee = mentee), update the blocking links, close any drops with their comment, and run the refine pass on each rework. Then leave one comment on the gap ticket summarizing the pivot — what surfaced it and what moved — so the board tells the story later. If MCP tools are unavailable, output everything as a manual checklist plus paste-ready tickets.

## Boundaries

- A pivot rearranges the queue; it never touches Done history and never moves the in-flight spike's status.
- Dropping is the mentor's call in the end — if you're unsure between rework and drop, recommend rework and flag it.
- If the "gap" is really the whole plan being wrong (three or more tickets dropped or reworked), stop and recommend a fresh `spike-plan` session instead of pivoting piecemeal.
- Feed the catalog: if the gap ticket needed off-catalog exit questions, or the pivot split a flat catalog topic into a sequence, flag it to the mentor for promotion into the catalog (as a topic or a track) so the next mentee inherits the same ladder.
