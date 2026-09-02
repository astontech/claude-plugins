---
name: spike-pivot
description: Handle a discovered gap mid-track on the Spike Board — draft the gap spike, then reconcile the queued tickets behind it (keep and bump, rework, or drop each). Use when a presentation or spike reveals a missing prerequisite or misjudged scope, when the user says a mentee needs to pivot or detour, when the planned path no longer fits, or when a new ticket needs to cut in line.
---

# Spike pivot

A spike or presentation revealed a gap the plan didn't account for — a missing prerequisite, a misjudged depth, a track entered one rung too high. Your job is to draft the spike that closes the gap, then reconcile the pre-created tickets sitting behind it. Pivots restructure the board, so this normally runs with the mentor in the room; alone with a mentee, proceed — the closing template labels the outcome a proposal.

Read `${CLAUDE_PLUGIN_ROOT}/references/atlassian-conventions.md`, `${CLAUDE_PLUGIN_ROOT}/references/topic-catalog.md`, `${CLAUDE_PLUGIN_ROOT}/references/exit-question-rubric.md`, and `${CLAUDE_PLUGIN_ROOT}/references/ticket-template.md` first. Resolve who the mentee is and load their full board per the conventions — silently. You are reconciling reality, not the plan as remembered: a queued ticket may have been refined since planning. Your first visible output is a template.

## The pass — a fixed ladder

One message per step. Send each template with only the `⟨slots⟩` filled; keep its sentences, order, and formatting. Don't narrate your setup. One short sentence before a template is allowed — never one restating its first line. Apply the slot rule (*you/your* → the mentee's name on an operator machine).

### Step 1 — Board and gap

Paste **Template S** (the board block from the conventions). If the request already stated the gap, add **Template V1** in the same message; otherwise add this line and wait:

```
What's the gap — what can't you do that the path assumed you could? One sentence.
```

**Template V1:**

```
The gap, as I understand it: ⟨one sentence, Gap-section standard⟩.

⟨It maps to the catalog topic ⟨Topic⟩⟨, step ⟨n⟩⟩ — its locked exit questions apply. | It's off-catalog — I'll research and draft exit questions per the rubric.⟩

Hop check: ⟨one detour — fine. | closing it needs ⟨Prerequisite⟩ first as well — that's two hops. Recommend backing out to ⟨entry spike⟩ instead of stacking detours.⟩

Right?
```

Wait for confirmation of the gap. If the hop check failed and they agree, stop here — the next act is a `spike-plan` session, not a pivot.

### Step 2 — Gap ticket and dispositions

Draft the gap ticket to the full `spike-ticket` standard (one-sentence goal, exit questions verbatim from the catalog or researched per the rubric, fences, scripted demo, real resources, day-based time-box). Walk the queue in blocked-by order and give every queued ticket exactly one disposition. Then send **Template V2**:

```
Gap spike drafted — full text below. Here's what happens to the queue behind it:

| Ticket | Disposition | Why |
|---|---|---|
| ⟨KEY — title⟩ | ⟨Keep and bump | Rework | Drop⟩ | ⟨one line⟩ |
⟨one row per queued ticket⟩

⟨full gap ticket in the fenced structure, with its Filing block: To Do, the topic's epic, assignee, and `is blocked by` only where a real prerequisite exists⟩

Approve the table? Yes, or name a ticket and a different disposition.
```

Dispositions mean exactly this: **Keep and bump** — still right, just later; only its position changes. **Rework** — the premise changed (scope, prerequisites, or exit-question subset); state what must change, and the rework itself is a `spike-refine` pass run after approval. **Drop** — the gap revealed the ticket shouldn't happen; closed with a comment saying why, never silently deleted. When unsure between rework and drop, recommend rework and say so in the Why column.

If **three or more** tickets are Rework or Drop, don't send V2. Send this and stop:

```
⟨N⟩ of ⟨M⟩ queued tickets would change — this is a re-plan, not a pivot. Run `/spike-board:spike-plan` and rebuild the path from the gap forward.
```

Wait for an explicit yes.

### Step 3 — Apply and close

**Operator machine:** via the `atlassian` MCP tools — create the gap ticket (To Do, its topic's epic, assignee = mentee), re-link `is blocked by` for every Keep-and-bump so the gap spike is its prerequisite, close each Drop with its Why as the comment, and run the `spike-refine` ladder for each Rework. Leave one comment on the gap ticket saying what surfaced it and what moved. Then send **Template V3a**:

```
Pivot applied. Gap spike ⟨KEY⟩ is next up; ⟨n⟩ kept and bumped, ⟨n⟩ reworked, ⟨n⟩ dropped with comments. The gap ticket's comment tells the story.
```

**Mentee machine** (Jira writes are gated — expected, don't explain the gate): send **Template V3b**:

```
Everything above is the proposal. File the gap spike from its Filing block, then apply the table by hand: re-link kept tickets so they're blocked by the new one, close dropped tickets with the Why as a comment, and leave the rework tickets for a `spike-refine` pass. Your mentor confirms the pivot at refinement.
```

If the gap ticket needed off-catalog questions, or the pivot split a flat catalog topic into a sequence, append the promotion-note block from `exit-question-rubric.md`.

## Boundaries

- A pivot rearranges the queue; it never touches Done history and never moves the in-flight spike's status.
- Dropping is the mentor's call in the end.
- `is blocked by` means prerequisite only — the gap spike blocks a kept ticket because it *is* its prerequisite, not to express order.
