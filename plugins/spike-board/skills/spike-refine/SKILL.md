---
name: spike-refine
description: Revise an existing Spike Board ticket in place — against the topic catalog, review feedback, or what a presentation revealed. Use when the user wants to refine, rework, tighten, resize, or update a spike ticket, apply mentor feedback from ticket comments, or fix a ticket's scope, exit questions, demo, or time-box.
---

# Spike ticket refinement

You are revising one existing ticket on the Spike Board. Refinement is how pre-created tickets get their final shape — the program creates tickets early and sharpens them as presentations and reviews reveal what's actually needed.

Read `${CLAUDE_PLUGIN_ROOT}/references/atlassian-conventions.md`, `${CLAUDE_PLUGIN_ROOT}/references/topic-catalog.md`, `${CLAUDE_PLUGIN_ROOT}/references/exit-question-rubric.md`, and `${CLAUDE_PLUGIN_ROOT}/references/ticket-template.md` before starting. Resolve who the mentee is per the conventions — silently. Your first visible output is a template.

## The pass — a fixed ladder

One message per step. Send each template with only the `⟨slots⟩` filled; keep its sentences, order, and formatting. Don't narrate your setup. One short sentence before a template is allowed — never one restating its first line. Apply the slot rule (*you/your* → the mentee's name on an operator machine).

### Step 0 — Which ticket

If the request named a ticket key, skip this step. Otherwise paste **Template S** (the board block from the conventions) and this line:

```
Which ticket are we refining? Give me the key.
```

Wait.

### Step 1 — Audit

Fetch the ticket and its comments. The comments are the refinement history — mentor feedback, progress notes, dead ends; the most recent mentor comment is usually what prompted this. Audit every section against the standard `spike-ticket` writes to: goal one sentence and still one spike; exit questions verbatim from the catalog and still the right subset (none the mentee has since passed, none a review exposed as missing; off-catalog questions checked against the rubric); fences still the nearest rabbit holes; scripted demo still proving the core concept; time-box right for the current scope (1 / 2 / 3 / 5 days); starting resources real and still the best entry points. Then send **Template R1**:

```
⟨KEY — title⟩ — refinement audit⟨, prompted by ⟨author⟩'s comment on ⟨date⟩: "⟨gist, under ten words⟩"⟩.

| Section | Verdict | Change | Why |
|---|---|---|---|
| Goal | ⟨keep | change⟩ | ⟨— | the new text⟩ | ⟨the comment, catalog line, or rule that drives it⟩ |
| Exit questions | ⟨keep | change⟩ | ⟨— | added / removed, verbatim⟩ | ⟨…⟩ |
| Out of scope | ⟨keep | change⟩ | ⟨— | …⟩ | ⟨…⟩ |
| Scripted demo | ⟨keep | change⟩ | ⟨— | …⟩ | ⟨…⟩ |
| Time-box | ⟨keep | change⟩ | ⟨— | n → m days⟩ | ⟨…⟩ |
| Starting resources | ⟨keep | change⟩ | ⟨— | …⟩ | ⟨…⟩ |

⟨"Nothing needs changing — this ticket meets the standard." | "Apply these changes? Yes, or name a row to discuss."⟩
```

If the audit shows the **sequence** is wrong — a gap before this ticket, or downstream tickets invalidated — don't send R1. Send this instead and stop:

```
This isn't a refinement — ⟨one sentence: the gap or the invalidated tickets⟩. That's a pivot: run `/spike-board:spike-pivot` and it will reconcile the queue.
```

Wait for a yes (unless nothing changes, in which case the pass is over).

### Step 2 — Apply and close

**Operator machine:** update the ticket in place via the `atlassian` MCP tools, then leave a comment on it summarizing what changed and why (the Why column, in prose), so the refinement history stays on the board. Send **Template R2a**:

```
Updated ⟨KEY⟩ and left a comment with the changes. Status untouched — ⟨STATUS⟩.
```

**Mentee machine** (Jira writes are gated — expected, don't explain the gate): send **Template R2b** followed by the revised ticket and the comment text:

```
Below is the revised ticket and the comment to leave on it. Paste the ticket over the current description, then add the comment so the history stays on the board. Don't change its status.

⟨full revised ticket in the fenced structure⟩

Comment:
⟨what changed and why, two or three sentences⟩
```

## Boundaries

- **Never weaken the ladder.** Rewording an exit question to be easier for one mentee is forbidden — shrink the ticket's scope or split it instead. If a catalog question itself seems wrong, flag it for the mentor: catalog fixes apply to everyone at once, through the catalog file, not through one ticket.
- **Refine one ticket.** Sequence problems are a pivot — hand off, per Step 1.
- **Don't touch status.** Refinement changes content, never workflow state. Moving tickets between columns is the mentee's act (or the planning session's).
