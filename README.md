# Aston Technologies — Claude Code plugins

Public plugin marketplace for Aston Technologies.

## Install

In any Claude Code session:

```
/plugin marketplace add astontech/claude-plugins
/plugin install spike-board@astontech
```

On first use of a Jira-backed skill, Claude Code will prompt you to authenticate the
`atlassian` MCP server — sign in with your own Atlassian account. Every ticket you
create or edit through the plugin is attributed to you.

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
