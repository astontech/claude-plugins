# Aston Technologies — Claude Code plugins

Public plugin marketplace for Aston Technologies.

## Install

In any Claude Code session:

```
/plugin marketplace add astontech/claude-plugins
/plugin install spike-board@astontech
```

## First-time setup: connecting Jira

The plugin bundles an `atlassian` MCP server that lets Claude read and write the
spike board as you. It needs a one-time sign-in — do this right after installing:

1. Restart Claude Code (plugins load at session start), then run `/mcp`.
2. Select the `atlassian` server and choose **Authenticate**. A browser window opens.
3. Sign in with your **Aston Atlassian account** (the one you use for Jira) — not a
   personal Atlassian account.
4. When asked which site to authorize, pick **astontechnologies.atlassian.net**. If
   you don't see it listed, you're signed into the wrong account — sign out and use
   your Aston account.
5. Approve the requested access (read and write for Jira work items and Confluence
   pages — spike documentation lives in Confluence). This grants
   *Claude acting as you* access to what your account can already see — it does not
   widen your permissions, and every ticket created or edited is attributed to you.

Back in Claude Code, `/mcp` should now show the server as connected. Verify with a
quick prompt like "list my tickets in the SCRUM project".

If the connection ever breaks, re-run `/mcp` → `atlassian` → Authenticate.

## Plugins

### spike-board

Toolkit for the Spike Board mentee program. Four skills over the shared Jira board:

| Skill | What it does |
|---|---|
| `spike-ticket` | Interview → a scoped spike ticket + suggested track. Start here. |
| `spike-plan` | Sprint planning: materialize the next few track tickets in Jira under the right epics. |
| `spike-refine` | Revise an existing ticket in place against the topic catalog and review feedback. |
| `spike-pivot` | A gap surfaced mid-track: draft the gap ticket, then reconcile the queued tickets behind it. |

The topic catalog (`plugins/spike-board/references/topic-catalog.md`) is the single
source of truth for tracks, prerequisites, and exit-question wording.

Tickets live on the Jira board; every spike documents itself as a Confluence page in
the Spike Board space (write-ups and diagrams live there; demo code stays in git).
Conventions for both are in `plugins/spike-board/references/atlassian-conventions.md`.
