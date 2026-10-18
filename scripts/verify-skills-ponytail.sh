#!/usr/bin/env bash
# ==============================================================================
# Verification Script for Ponytail, Plugins & Skills — Sri Lanka HMS Platform
# ==============================================================================

set -euo pipefail

ROOT_DIR="/workspaces/Sri-Lanka--HMS"
cd "${ROOT_DIR}"

echo "========================================================================"
echo " [HMS Gate] Verifying Ponytail, Plugins & Skills Setup"
echo " Time: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "========================================================================"

# 1. Normalize & Verify Node Environment Settings
echo ">>> [1/5] Normalizing & Verifying Node runtime environment..."
export NODE_OPTIONS="--experimental-strip-types --no-warnings"
echo "  ✔ Node runtime settings set to NODE_OPTIONS='${NODE_OPTIONS}'."


# 2. Verify Antigravity CLI and Plugin Status
echo ">>> [2/5] Verifying Antigravity CLI (agy) and installed plugins..."
if ! command -v agy &> /dev/null; then
  echo "  ❌ ERROR: agy command not found."
  exit 1
fi

PLUGIN_LIST=$(agy plugin list)
echo "${PLUGIN_LIST}"

if ! echo "${PLUGIN_LIST}" | grep -q "ponytail (enabled"; then
  echo "  ❌ ERROR: ponytail plugin is not enabled."
  exit 1
fi

if ! echo "${PLUGIN_LIST}" | grep -q "agent-skills (enabled"; then
  echo "  ❌ ERROR: agent-skills plugin is not enabled."
  exit 1
fi
echo "  ✔ Both 'ponytail' and 'agent-skills' plugins are enabled in agy."

# 3. Verify Workspace Skills (.agents/skills)
echo ">>> [3/5] Verifying Workspace Apple Design and UI/UX Skills..."
REQUIRED_SKILLS=("apple-design" "ui-ux-pro-max" "banner-design" "brand" "design" "design-system" "slides" "ui-styling")

for skill in "${REQUIRED_SKILLS[@]}"; do
  if [ ! -f ".agents/skills/${skill}/SKILL.md" ]; then
    echo "  ❌ ERROR: Missing skill file: .agents/skills/${skill}/SKILL.md"
    exit 1
  fi
  echo "  ✔ Verified skill: ${skill}"
done

# 4. Verify Project-Specific Rules (.agents/rules & .antigravity/rules.md)
echo ">>> [4/5] Verifying Project Calibration Rules..."
if [ ! -f ".agents/rules/ponytail.md" ]; then
  echo "  ❌ ERROR: Missing .agents/rules/ponytail.md"
  exit 1
fi

if [ ! -f ".agents/rules/skills-orchestration.md" ]; then
  echo "  ❌ ERROR: Missing .agents/rules/skills-orchestration.md"
  exit 1
fi

if [ ! -f ".antigravity/rules.md" ]; then
  echo "  ❌ ERROR: Missing .antigravity/rules.md"
  exit 1
fi

if [ ! -f "GEMINI.md" ]; then
  echo "  ❌ ERROR: Missing GEMINI.md"
  exit 1
fi
echo "  ✔ All project calibration and rule files are present and active."

# 5. Verify Biome & Knip Quality Checks on Orchestrator
echo ">>> [5/5] Running Biome & Knip quality gates on orchestrator..."
npx biome check .
npx knip
echo "  ✔ Zero console noise and zero dead code verified."

echo ""
echo "========================================================================"
echo " ✔ PONYTAIL & ALL SKILLS/PLUGINS ARE FULLY CONFIGURED & VERIFIED"
echo "========================================================================"
