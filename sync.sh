#!/usr/bin/env bash
# sync.sh - copy whitelisted files from $HOME into this repository working tree.
# Safe allow-list approach: only paths in tracked.txt are mirrored.
set -euo pipefail
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TRACK_FILE="$REPO_DIR/tracked.txt"
HOME_DIR="$HOME"

copy_one() {
  local rel="$1"
  local src="$HOME_DIR/$rel"
  local dst="$REPO_DIR/$rel"
  if [ ! -e "$src" ]; then
    echo "[WARN] Missing: $rel (skipped)" >&2
    return 0
  fi
  mkdir -p "$(dirname "$dst")"
  rsync -a --delete-delay --chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r "$src" "$dst"
  echo "[COPIED] $rel"
}

# Read tracked list
while IFS= read -r line; do
  # strip comments and whitespace
  line="${line%%#*}"; line="${line% }"; line="${line# }"
  [ -z "$line" ] && continue
  copy_one "$line"
done < "$TRACK_FILE"

echo "\nDone. Review changes with: git status"