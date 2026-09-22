#!/usr/bin/env bash
# interview-rehearsal eval runner — see README.md
set -u
export LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8   # multibyte-safe grep: ⟨ ⟩ ⟪ ⟫ must not match byte-wise
HERE="$(cd "$(dirname "$0")" && pwd)"
PLUGROOT="$(cd "$HERE/.." && pwd)"
CASES="$HERE/cases"; FIX="$HERE/fixtures"
OUT="$HERE/out"; mkdir -p "$OUT"
SIM="$HOME/interview-sim"; mkdir -p "$SIM"
VER="$(python3 -c 'import json,sys;print(json.load(open(sys.argv[1]))["version"])' "$PLUGROOT/.claude-plugin/plugin.json")"

pass=0; fail=0
if [ $# -gt 0 ]; then names=("$@"); else names=(); for f in "$CASES"/*.env; do names+=("$(basename "$f" .env)"); done; fi

for name in "${names[@]}"; do
  f="$CASES/$name.env"; [ -f "$f" ] || { echo "no such case: $name"; fail=$((fail+1)); continue; }
  PROMPT=""; MUST=""; MUST_NOT=""; NEEDS=""
  # shellcheck disable=SC1090
  source "$f"
  rm -f "$SIM/talk-track.md"
  case "$NEEDS" in *talk-track*) cp "$FIX/talk-track.md" "$SIM/talk-track.md";; esac
  out="$OUT/$name.txt"
  ( cd "$SIM" && env -i HOME="$HOME" PATH="$PATH" USER="$USER" \
      claude -p "$PROMPT" --max-turns 15 --output-format text --plugin-dir "$PLUGROOT" --add-dir "$PLUGROOT" --allowedTools Read Write mcp__plugin_interview-rehearsal_atlassian__atlassianUserInfo ) > "$out" 2>&1
  missed=""
  while IFS= read -r rx; do [ -z "$rx" ] && continue; grep -Eq -- "$rx" "$out" || missed+="  MUST      : $rx"$'\n'; done <<< "$MUST"
  while IFS= read -r rx; do [ -z "$rx" ] && continue; grep -Eq -- "$rx" "$out" && missed+="  MUST_NOT  : $rx"$'\n'; done <<< "$MUST_NOT"
  if [ -z "$missed" ]; then echo "PASS  $name"; pass=$((pass+1)); else echo "FAIL  $name"; printf '%s' "$missed"; echo "  output: $out"; fail=$((fail+1)); fi
done
rm -f "$SIM/talk-track.md"
echo "----"; echo "plugin $VER · $pass passed · $fail failed"
[ "$fail" = 0 ]
