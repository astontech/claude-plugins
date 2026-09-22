# The readiness record

Where drill results go, so the mentor can see how engineers are doing without sitting in. Written under the engineer's own Atlassian login through the bundled `atlassian` MCP server. Nothing is written in build mode.

## Where

- Site: `astontechnologies.atlassian.net` (use as `cloudId`).
- Space: **Spike Board**, id `1835012`.
- Parent page: **Interview readiness**, id `18513921`. Every engineer's page is a child of it.
- Engineer page title: `Interview readiness — ⟨display name from atlassianUserInfo⟩`. Find it with CQL `parent = 18513921 AND title = "…"`; create it under the parent on first use with the header below as its body. Read it with `contentFormat: markdown`, append, and write it back whole with `updateConfluencePage` (`contentFormat: markdown`) — the tool replaces the body, so always append to what was read.

Page header (first creation only):

```
Readiness record for ⟨name⟩. Appended by the interview-rehearsal skill at the start of each drill, the end of each thread, and the debrief. Open slots = fact-sheet rows still unfilled; it should fall over time.
```

## When — the three write points

A drill writes three times so a session closed early still leaves a record.

1. **Start** — right after the engineer answers "tell me about yourself", before the first thread question:

```
### ⟨YYYY-MM-DD⟩ · drill started
Talk track: ⟨project name⟩ · open slots: ⟨N⟩
```

2. **Thread end** — when a thread's last category has been asked and answered, before the next thread's first question:

```
**Thread ⟨n⟩ — ⟨the claim it started from, a few words⟩**
| Category | Read | Where |
|---|---|---|
⟨one row per category asked: Read is strong or weak per the probe bank; Where is the question number in the thread, or the exact question where the answers stopped getting clearer⟩
Ran out at: ⟨question, or "held to the end"⟩
```

3. **Debrief** — the Template H content, verbatim, minus its closing line.

Each write is one `updateConfluencePage` call appending to the existing body. Confirm nothing to the engineer beyond the disclosure they already saw; the write is silent.

## If the MCP isn't connected

`atlassianUserInfo` failing means the engineer hasn't signed in. Say so in one sentence at the drill opener — *"The readiness record isn't connected: run /mcp, pick atlassian, Authenticate. Drilling anyway; nothing will be recorded this session."* — and run the drill with no writes. Never block the drill on it.

## Local checkpoint (Claude Code only)

When a filesystem exists, keep `drill-log.md` beside `talk-track.md`: rewrite it after every answer with the same content the next write point would post, plus a `posted: yes|no` line per section. It is the engineer's own file. On any skill start, if a `drill-log.md` has sections marked `posted: no`, post them first (as their own write, headed `### ⟨date⟩ · recovered from an unfinished drill`), then delete the file, then send the Step 1 template. Say nothing about the recovery beyond one sentence before the template: *"Posted the record from your unfinished drill on ⟨date⟩."*
