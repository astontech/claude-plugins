# Aston Technologies — Claude Code plugins

Public plugin marketplace for Aston Technologies.

## Install

In any Claude Code session:

```
/plugin marketplace add astontech/claude-plugins
/plugin install spike-board@astontech
```

## First-time setup: connecting Jira

The plugin bundles an `atlassian` MCP server that lets Claude read the spike board
as you. It needs a one-time sign-in — do this right after installing:

1. Restart Claude Code (plugins load at session start), then run `/mcp`.
2. Select the `atlassian` server and choose **Authenticate**. A browser window opens.
3. Sign in with your **Aston Atlassian account** (the one you use for Jira) — not a
   personal Atlassian account.
4. When asked which site to authorize, pick **astontechnologies.atlassian.net**. If
   you don't see it listed, you're signed into the wrong account — sign out and use
   your Aston account.
5. Approve the requested access. This grants *Claude acting as you* read access to
   what your account can already see — it does not widen your permissions, and the
   plugin never creates or edits tickets or pages on your behalf.

Back in Claude Code, `/mcp` should now show the server as connected. Verify with a
quick prompt like "list my tickets in the SCRUM project".

If the connection ever breaks, re-run `/mcp` → `atlassian` → Authenticate.

## Plugins

### spike-board

Toolkit for the Spike Board mentee program: one skill, `spike-ticket`, over the
shared Jira board. It interviews you about a gap, researches exit questions for the
topic against the rubric, and hands you a paste-ready ticket plus stubs for the
spikes behind it. The same skill drafts the next queued stub when the spike ahead of it
is finished — a spike doesn't move to In Review until its successor is drafted — and
drafts the gap spike when something has to cut in line. Refinement happens in Jira
comments; re-linking the queue is done by hand in Jira.

The plugin reads your board and Confluence through the Atlassian MCP server and
never writes to either — you file every ticket yourself, and that's deliberate.

Exit questions are researched per ticket against the rubric
(`plugins/spike-board/references/exit-question-rubric.md`); tracks live on the board
as epics, not in a file. Conventions for Jira and Confluence are in
`plugins/spike-board/references/atlassian-conventions.md`.
