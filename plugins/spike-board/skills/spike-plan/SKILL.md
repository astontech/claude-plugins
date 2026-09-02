---
name: spike-plan
description: Re-plan a Spike Board queue with the mentor — negotiate a path change and materialize or reshape the next few spike tickets in Jira, bucketed under the right epics and sequenced with blocked-by links. Use when the user wants to plan or re-plan a sprint or a mentee's path, set up a queue where none exists, or turn an agreed track into real tickets.
---

# Spike sprint planning

You are negotiating and materializing a mentee's near-term path as real Jira tickets. Mentees file their own proposed queue at drafting time (`spike-ticket` ends by filing the whole chain), so this session is usually **re-planning** — agreeing or reshaping a path with the mentor in the room — or standing up a queue where none exists. If you're talking to a mentee alone, proceed, but the closing template says plainly that the plan is a proposal until the mentor has seen it.

Read `${CLAUDE_PLUGIN_ROOT}/references/atlassian-conventions.md`, `${CLAUDE_PLUGIN_ROOT}/references/topic-catalog.md`, `${CLAUDE_PLUGIN_ROOT}/references/catalog-menu.md`, `${CLAUDE_PLUGIN_ROOT}/references/exit-question-rubric.md`, and `${CLAUDE_PLUGIN_ROOT}/references/ticket-template.md` before doing anything. Resolve who the mentee is and load their board per the conventions — silently. Your first visible output is a template.

## Ground rules

- **Plan a week or two, not a career.** Materialize 2–4 tickets — roughly the next one to two weeks at the default time-boxes. The rest of the track stays a conversation. Pre-created tickets are drafts that will be refined (or reworked by `spike-pivot`) as presentations reveal shape; the further out a ticket sits, the rougher it is allowed to be.
- **The board is the source of truth.** Never plan from memory of a previous conversation, and never create a ticket that duplicates one already on the board.
- **One spike in flight.** Planned tickets land in **To Do** — the board has no Backlog status; the queue order lives entirely in `is blocked by` links, and the next-up ticket is the unblocked head of the refined chain. Nothing you create goes to In Progress.
- **The ladder never forks.** Exit questions come verbatim from the catalog. Off-catalog questions go through the research step and rubric in `exit-question-rubric.md`, with the promotion note. Entry point and ticket size personalize; question wording never does.
- **Prerequisites are links, one hop max.** `is blocked by` expresses prerequisites and nothing else. If the plan needs two or more prerequisite detours to reach its goal, the mentee is entering the track too early — stop and say so instead of planning around it. Judge prerequisites against the mentee's *actual state*, not only their Done tickets: a skill the mentor attests to, or a quick spot-check in the session confirms, counts as met. The two-detour halt counts detour *tickets the plan would have to create*, not prerequisites the catalog lists.

## The session — a fixed ladder

One message per step, in this order. Send each template with only the `⟨slots⟩` filled; keep its sentences, order, and formatting. Don't merge steps, don't add questions a step doesn't ask, and don't narrate your setup. You may put one short sentence before a template reacting to what was just said — never one that restates the template's first line. Apply the slot rule from the conventions (*you/your* → the mentee's name on an operator machine).

### Step 1 — Board

Paste **Template S** from the conventions, then this line beneath it:

```
Does that match what you expected? If anything's off, the board gets fixed before we plan.
```

Wait. If the board is **empty** (no spike tickets at all), replace the line with:

```
Nothing on the board yet, so we're standing up a queue from scratch. Which topic starts it?

⟨catalog menu block⟩
```

and wait for a topic.

### Step 2 — Path

Start from the filed To Do chain — it is the standing proposal. Fall back to the catalog track only when no queue exists. Drop anything whose exit questions sit behind a Done ticket; reorder for prerequisites; where the catalog and the mentee disagree, the table shows both and the line beneath recommends. Then send **Template P2**:

```
Proposed path — the next ⟨N⟩ spikes:

| # | Spike | Topic · step | Time-box | Epic | Blocked by |
|---|---|---|---|---|---|
| 1 | ⟨title⟩ | ⟨Topic · step n | Topic | off-catalog⟩ | ⟨d⟩ days | ⟨epic⟩ | ⟨— | KEY | #n⟩ |
⟨one row per spike⟩

⟨One line per difference from the filed queue: "Skipped KEY — its questions are behind your Done tickets." / "Moved KEY after #2 — it needs Docker first." / "Kept as filed." Or the single line: "This is your filed queue, unchanged."⟩

Agree, or tell me what to change.
```

Wait for agreement. Revise the table and re-send only on a requested change.

### Step 3 — Drafts

Draft every ticket in the agreed path to the structure in `ticket-template.md`, at the `spike-ticket` standard for #1 and rougher (demo and resources) for the rest, each carrying *Pending refinement — filed as proposed queue, ⟨date⟩.* Then send **Template P3**:

```
Drafted — ⟨N⟩ tickets, full text below. Each ends with its Filing block.

⟨ticket 1 … ticket N, each in the fenced ticket structure with its Filing block⟩

File these? Yes to go ahead, or name a ticket and what to change.
```

Wait for an explicit yes.

### Step 4 — File and close

**Operator machine:** create the tickets in project `SCRUM` via the `atlassian` MCP tools — assignee = the mentee, status To Do, each under its track's epic (create the epic, named exactly after the topic, if missing), `is blocked by` links exactly as the table's Blocked-by column says. Stub a Confluence page only for the next-up ticket per the conventions. Then send **Template P4a**:

```
Filed: ⟨KEY — title, one per line⟩

Next up is ⟨KEY⟩ once ⟨in-flight KEY⟩ is done. Revisit this plan at the next presentation, or sooner if something surprises you.
```

**Mentee machine** (Jira writes are gated — this is expected, don't explain the gate): send **Template P4b**:

```
Everything above is ready to file. Create each ticket under the epic in its Filing block, add the blocked-by links as listed, and leave them all in To Do.

Your mentor reviews the filed queue at refinement — until then it's a proposal. Next up after ⟨in-flight KEY⟩ is #1.
```

If an off-catalog topic was drafted, the promotion-note block from `exit-question-rubric.md` goes after Template P4a/P4b.
