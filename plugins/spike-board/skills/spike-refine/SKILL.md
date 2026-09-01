---
name: spike-refine
description: Revise an existing Spike Board ticket in place — against the topic catalog, review feedback, or what a presentation revealed. Use when the user wants to refine, rework, tighten, resize, or update a spike ticket, apply mentor feedback from ticket comments, or fix a ticket's scope, exit questions, demo, or time-box.
---

# Spike ticket refinement

You are revising one existing ticket on the Spike Board. Refinement is how pre-created tickets get their final shape — the program creates tickets early and sharpens them as presentations and reviews reveal what's actually needed.

Read `${CLAUDE_PLUGIN_ROOT}/references/jira-conventions.md`, `${CLAUDE_PLUGIN_ROOT}/references/topic-catalog.md`, and `${CLAUDE_PLUGIN_ROOT}/references/ticket-template.md` before starting.

## The pass

1. **Fetch the ticket and its comments** from Jira. The comments are the refinement history — mentor feedback, progress notes, dead ends. Ask what prompted the refinement only if the comments don't already say.
2. **Audit against the standard.** Check the ticket the way `spike-ticket` would have written it:
   - Goal still one sentence, still one spike? (Learning since creation sometimes reveals it's two.)
   - Exit questions verbatim from the catalog, and still the right subset — none the mentee has since answered in a passed presentation, none missing that a review exposed?
   - Out-of-scope fences still the nearest rabbit holes?
   - Scripted demo still proving the core concept? Time-box still right for the trimmed/grown scope (1 narrow / 2 default / 3 meaty / 5 max)?
   - Starting resources real and still the best entry points?
3. **Propose the revision as a diff**, not a rewrite: what changes, what stays, and why — each change traced to a comment, a catalog line, or a rule. If nothing needs changing, say so; a null refinement is a valid outcome.
4. **Apply on approval.** Update the ticket in place via the `atlassian` MCP tools, then leave a short comment on the ticket summarizing what changed and why, so the refinement history stays on the board. If MCP tools are unavailable, output the revised ticket as paste-ready markdown plus the summary comment text.

## Boundaries

- **Never weaken the ladder.** Rewording an exit question to be easier for one mentee is forbidden — shrink the ticket's scope or split it instead. If a catalog question itself seems wrong, flag it for the mentor: catalog fixes apply to everyone at once, through the catalog file, not through one ticket.
- **Refine one ticket.** If the audit shows the *sequence* is wrong — a gap before this ticket, or downstream tickets invalidated — that's a pivot, not a refinement. Say so and hand off to `spike-pivot`.
- **Don't touch status.** Refinement changes content, never workflow state. Moving tickets between columns is the mentee's act (or the planning session's).
