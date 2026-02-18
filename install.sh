#!/usr/bin/env bash
# Install Agent Skills to Claude Code and/or GitHub Copilot personal directories
# Usage: bash install.sh [--target claude|copilot|both] [skill-name...]
# Examples:
#   bash install.sh                          # Install all skills to both targets
#   bash install.sh --target claude          # Install all skills to Claude Code only
#   bash install.sh --target copilot         # Install all skills to GitHub Copilot only
#   bash install.sh python-pro              # Install specific skill to both targets
#   bash install.sh --target claude python-pro typescript-pro

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"
TARGET="both"

if [ ! -d "$SKILLS_SRC" ]; then
  echo "Error: skills directory not found at $SKILLS_SRC"
  exit 1
fi

# Parse --target flag
ARGS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET="$2"
      shift 2
      ;;
    --target=*)
      TARGET="${1#*=}"
      shift
      ;;
    --help|-h)
      echo "Usage: bash install.sh [--target claude|copilot|both] [skill-name...]"
      echo ""
      echo "Targets:"
      echo "  claude   Install to ~/.claude/skills/ (Claude Code)"
      echo "  copilot  Install to ~/.copilot/skills/ (GitHub Copilot)"
      echo "  both     Install to both (default)"
      echo ""
      echo "Examples:"
      echo "  bash install.sh                          # All skills, both targets"
      echo "  bash install.sh --target claude          # All skills, Claude Code only"
      echo "  bash install.sh python-pro react-specialist  # Specific skills, both targets"
      exit 0
      ;;
    *)
      ARGS+=("$1")
      shift
      ;;
  esac
done

# Determine target directories
TARGETS=()
case "$TARGET" in
  claude)
    TARGETS=("$HOME/.claude/skills")
    ;;
  copilot)
    TARGETS=("$HOME/.copilot/skills")
    ;;
  both)
    TARGETS=("$HOME/.claude/skills" "$HOME/.copilot/skills")
    ;;
  *)
    echo "Error: unknown target '$TARGET'. Use: claude, copilot, or both"
    exit 1
    ;;
esac

# Create target directories
for target_dir in "${TARGETS[@]}"; do
  mkdir -p "$target_dir"
done

install_skill() {
  local skill_name="$1"
  local src="$SKILLS_SRC/$skill_name"

  if [ ! -d "$src" ]; then
    echo "  SKIP    $skill_name (not found)"
    return 1
  fi

  for target_dir in "${TARGETS[@]}"; do
    local dst="$target_dir/$skill_name"
    local label
    label=$(basename "$(dirname "$target_dir")")

    if [ -d "$dst" ]; then
      echo "  UPDATE  $skill_name -> ~/.$label/skills/"
    else
      echo "  INSTALL $skill_name -> ~/.$label/skills/"
    fi

    cp -r "$src" "$target_dir/"
  done
}

echo "Agent Skills Installer"
echo "======================"
echo ""
echo "Targets:"
for target_dir in "${TARGETS[@]}"; do
  echo "  $target_dir"
done
echo ""

installed=0
skipped=0

if [ ${#ARGS[@]} -gt 0 ]; then
  # Install specific skills
  for skill in "${ARGS[@]}"; do
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
echo "Skills are now available in:"
for target_dir in "${TARGETS[@]}"; do
  label=$(basename "$(dirname "$target_dir")")
  case "$label" in
    .claude) echo "  - Claude Code (/skills to verify)" ;;
    .copilot) echo "  - GitHub Copilot (/skills to verify)" ;;
  esac
done
