#!/usr/bin/env bash
# Copies every skill in ./skills into your skills folder (existing files with the same name are overwritten).
#   ./install.sh             Claude Code  (~/.claude/skills)
#   ./install.sh --codex     Codex        (~/.agents/skills)
#   ./install.sh --both      both
#   ./install.sh --dest DIR  any folder, e.g. your-repo/.claude/skills
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
dests=("$HOME/.claude/skills")
case "${1:-}" in
  "") ;;
  --codex) dests=("$HOME/.agents/skills") ;;
  --both) dests=("$HOME/.claude/skills" "$HOME/.agents/skills") ;;
  --dest) dests=("${2:?usage: ./install.sh --dest DIR}") ;;
  *) sed -n '2,7p' "$0"; exit 1 ;;
esac
for d in "${dests[@]}"; do
  mkdir -p "$d"; n=0
  for s in "$here"/skills/*/; do
    name="$(basename "$s")"; mkdir -p "$d/$name"; cp -R "$s." "$d/$name/"; n=$((n + 1))
  done
  echo "Installed $n skills into $d"
done
echo "Restart Claude Code / Codex to load them."
