#!/bin/bash
# Spike Board — Jira write gate.
#
# Mentees work Jira by hand (creating and moving tickets in the UI is part of
# the curriculum), so the plugin's Jira WRITE tools are denied by default.
# Confluence writes are not gated — page stubs stay available to everyone.
#
# Operators opt in per machine, either way:
#   touch ~/.config/spike-board/operator
#   export SPIKE_BOARD_OPERATOR=1
#
# This is an anti-accident gate, not a security boundary: every Jira action is
# attributed to the person's own Atlassian account (per-user OAuth), and the
# board itself is the audit trail.

if [ -f "$HOME/.config/spike-board/operator" ] || [ "$SPIKE_BOARD_OPERATOR" = "1" ]; then
  exit 0
fi

cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "Jira writes are disabled on mentee machines (Spike Board convention: mentees create and move tickets by hand in Jira — that practice is part of the curriculum). This is expected, not an error. Produce the paste-ready markdown fallback instead, exactly as if the MCP write tools were unavailable, and tell the mentee to enter it in Jira themselves. Jira reads and all Confluence tools still work."
  }
}
EOF
exit 0
