#!/usr/bin/env bash
# spike-board eval runner — see README.md
set -u
export LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8   # multibyte-safe grep: ⟨ ⟩ — → must not match byte-wise
HERE="$(cd "$(dirname "$0")" && pwd)"
CASES="$HERE/cases"
OUT="$HERE/out"; mkdir -p "$OUT"
MARKER="$HOME/.config/spike-board/operator"
PARKED="$HOME/.spike-board-operator.evalparked"
SIM="$HOME/mentee-sim"; mkdir -p "$SIM"
VER="$(python3 -c 'import json,sys;print(json.load(open(sys.argv[1]))["version"])' "$HERE/../.claude-plugin/plugin.json")"
PLUGDIR="$HOME/.claude/plugins/cache/astontech/spike-board/$VER"
[ -d "$PLUGDIR" ] || { echo "installed plugin $VER not found at $PLUGDIR — run: claude plugin update spike-board@astontech"; exit 2; }
export SPIKE_EVAL_NEXT_KEY="${SPIKE_EVAL_NEXT_KEY:-SCRUM-23}"

had_marker=0; [ -f "$MARKER" ] && had_marker=1
restore() { if [ "$had_marker" = 1 ]; then [ -f "$PARKED" ] && mv "$PARKED" "$MARKER"; touch "$MARKER"; else rm -f "$MARKER" "$PARKED"; fi; }
trap restore EXIT INT TERM

TOOLS=(Read WebFetch WebSearch "Bash(test -f *)"
  mcp__plugin_spike-board_atlassian__atlassianUserInfo
  mcp__plugin_spike-board_atlassian__searchJiraIssuesUsingJql
  mcp__plugin_spike-board_atlassian__getJiraIssue
  mcp__plugin_spike-board_atlassian__getAccessibleAtlassianResources
  mcp__plugin_spike-board_atlassian__lookupJiraAccountId)

pass=0; fail=0
if [ $# -gt 0 ]; then names=("$@"); else names=(); for f in "$CASES"/*.env; do names+=("$(basename "$f" .env)"); done; fi

for name in "${names[@]}"; do
  f="$CASES/$name.env"; [ -f "$f" ] || { echo "no such case: $name"; fail=$((fail+1)); continue; }
  PROMPT=""; MARKER_STATE="off"; MUST=""; MUST_NOT=""; NEEDS=""
  # shellcheck disable=SC1090
  source "$f"
  PROMPT="$(printf '%s' "$PROMPT" | sed "s/{{NEXT_KEY}}/$SPIKE_EVAL_NEXT_KEY/g")"
  if [ "$MARKER_STATE" = on ]; then [ -f "$PARKED" ] && mv "$PARKED" "$MARKER"; touch "$MARKER"; else [ -f "$MARKER" ] && mv "$MARKER" "$PARKED"; fi
  out="$OUT/$name.txt"
  ( cd "$SIM" && env -i HOME="$HOME" PATH="$PATH" USER="$USER" SPIKE_EVAL_NEXT_KEY="$SPIKE_EVAL_NEXT_KEY" \
      claude -p "$PROMPT" --max-turns 25 --output-format text --add-dir "$PLUGDIR" --allowedTools "${TOOLS[@]}" ) > "$out" 2>&1
  missed=""
  while IFS= read -r rx; do [ -z "$rx" ] && continue; rx="${rx//\{\{NEXT_KEY\}\}/$SPIKE_EVAL_NEXT_KEY}"; grep -Eq -- "$rx" "$out" || missed+="  MUST      : $rx"$'\n'; done <<< "$MUST"
  while IFS= read -r rx; do [ -z "$rx" ] && continue; grep -Eq -- "$rx" "$out" && missed+="  MUST_NOT  : $rx"$'\n'; done <<< "$MUST_NOT"
  if [ -z "$missed" ]; then echo "PASS  $name"; pass=$((pass+1)); else echo "FAIL  $name"; printf '%s' "$missed"; echo "  output: $out"; fail=$((fail+1)); fi
done
echo "----"; echo "plugin $VER · $pass passed · $fail failed"
[ "$fail" = 0 ]
