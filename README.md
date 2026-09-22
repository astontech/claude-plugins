# Aston Technologies — Claude Code plugins

Public plugin marketplace for Aston Technologies.

## Install

In any Claude Code session:

```
/plugin marketplace add astontech/claude-plugins
/plugin install spike-board@astontech
/plugin install interview-rehearsal@astontech
```

## First-time setup: connecting Jira

Both plugins bundle an `atlassian` MCP server that lets Claude read the spike board
as you (and, for interview-rehearsal, append to your own readiness page). It needs a one-time sign-in — do this right after installing:

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
shared Jira board. Say what you want to learn and where you are with it; the skill
reads your board, researches exit questions for the topic against the rubric, runs a
short self-assessment, and hands you a paste-ready ticket, a filing checklist (project,
epic, links, and where its Confluence page goes), and stubs for the spikes behind it.

The same skill covers the other two moments: when you finish a spike, run it again to
draft the next stub to full standard — that draft has to be on the board before the
spike moves to In Review, so your mentor can refine it before you present — and when
something has to cut in line, it drafts the gap spike and shows what happens to the
queue behind it. Refinement happens in Jira comments; re-linking the queue is done by
hand in Jira.

The plugin reads your board and Confluence through the Atlassian MCP server and
never writes to either — you file every ticket and create every page yourself, and
that's deliberate.

Exit questions are researched per ticket against the rubric
(`plugins/spike-board/references/exit-question-rubric.md`); tracks live on the board
as epics, not in a file. Conventions for Jira and Confluence are in
`plugins/spike-board/references/atlassian-conventions.md`.

### interview-rehearsal

Rehearsal for the client interview: the hour where one or two client engineers ask
"tell me about your last project" and then pull one thread deep. One skill,
`interview-rehearsal`, two modes chosen by state:

- **Build** — no talk track yet. Paste your notes or resume; the skill asks for what's
  missing in three short batches ("don't know" is a fine answer) and writes
  `talk-track.md`: a spoken opening, the project in three depths, the fact sheet an
  interviewer actually digs for, three stories, the probes to expect against *your*
  components, and a list of what to go find out.
- **Drill** — `talk-track.md` exists. The skill plays the interviewer: one question at
  a time, no coaching, pulling a thread until it runs out, then a debrief that scores
  each category strong or weak and lists what to fix.

Start it with "I have an interview coming up" or "drill me". The method is drawn from
interviewers' own guidance (Amazon bar raisers, hiring-manager guides, staffing-firm
interviewer guides); sources are in the skill's `references/interviewer-method.md`.

**On claude.ai without Claude Code:** the same skill works as a custom skill. Download
`plugins/interview-rehearsal/skills/interview-rehearsal/` as a zip and upload it under
Settings → Capabilities → Skills, then keep your `talk-track.md` in a Project so drill
sessions can read it.

**What gets recorded.** Drills, and only drills, are recorded to a page of yours under
*Interview readiness* in the Spike Board Confluence space, under your own login: a line
when a drill starts, a table when each thread ends, and the debrief. A session you
close early still leaves the start line and any finished threads. The record shows
where a thread held, where it ran out, and how many fact-sheet slots are still open —
that last number should fall over time. Your manager reads these pages. The drill
opener says so every time; build mode writes nothing anywhere but `talk-track.md`.
If the Atlassian sign-in isn't done, the drill still runs, just unrecorded.
