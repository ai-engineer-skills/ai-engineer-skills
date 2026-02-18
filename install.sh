#!/usr/bin/env bash
# Install Claude Code skills to your personal ~/.claude/skills directory
# Usage: bash install.sh [skill-name...]
# Examples:
#   bash install.sh              # Install all skills
#   bash install.sh python-pro   # Install specific skill
#   bash install.sh python-pro typescript-pro react-specialist

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"
SKILLS_DST="$HOME/.claude/skills"

if [ ! -d "$SKILLS_SRC" ]; then
  echo "Error: skills directory not found at $SKILLS_SRC"
  exit 1
fi

mkdir -p "$SKILLS_DST"

install_skill() {
  local skill_name="$1"
  local src="$SKILLS_SRC/$skill_name"
  local dst="$SKILLS_DST/$skill_name"

  if [ ! -d "$src" ]; then
    echo "  SKIP  $skill_name (not found)"
    return 1
  fi

  if [ -d "$dst" ]; then
    echo "  UPDATE  $skill_name"
  else
    echo "  INSTALL $skill_name"
  fi

  cp -r "$src" "$SKILLS_DST/"
}

echo "Claude Code Skills Installer"
echo "============================"
echo ""
echo "Target: $SKILLS_DST"
echo ""

installed=0
skipped=0

if [ $# -gt 0 ]; then
  # Install specific skills
  for skill in "$@"; do
    if install_skill "$skill"; then
      ((installed++))
    else
      ((skipped++))
    fi
  done
else
  # Install all skills
  for skill_dir in "$SKILLS_SRC"/*/; do
    skill_name="$(basename "$skill_dir")"
    if install_skill "$skill_name"; then
      ((installed++))
    else
      ((skipped++))
    fi
  done
fi

echo ""
echo "Done! $installed skill(s) installed, $skipped skipped."
echo ""
echo "Skills are now available in Claude Code."
echo "Use /skills in Claude Code to see all loaded skills."
