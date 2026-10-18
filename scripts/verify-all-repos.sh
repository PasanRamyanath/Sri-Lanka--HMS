#!/usr/bin/env bash
# ==============================================================================
# Master 3-Repository Verification Gate — Sri Lanka HMS Platform
# Orchestrates Biome (anti-noise), Knip (dead-code), TypeScript & Tests across:
#   1. Sri-Lanka--HMS  (Root Orchestrator)
#   2. HMS-Backend     (AWS CDK + AppSync + @hms/core)
#   3. HMS-Frontend    (React 19 + Tailwind CSS v4 + Apple HIG PWA/PMS)
# ==============================================================================

set -euo pipefail
export NODE_OPTIONS="--experimental-strip-types --no-warnings"

ROOT_DIR="/workspaces/Sri-Lanka--HMS"
BACKEND_DIR="${ROOT_DIR}/HMS-Backend"
FRONTEND_DIR="${ROOT_DIR}/HMS-Frontend"

echo "========================================================================"
echo " [HMS Master Gate] Initiating 3-Repository Verification Protocol"
echo " Time: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "========================================================================"

# --- 1. Root Orchestrator Verification ---
echo ""
echo ">>> [1/3] Verifying Root Orchestrator (Sri-Lanka--HMS)..."
cd "${ROOT_DIR}"
echo "  → Running Biome anti-noise check..."
npx biome check .
echo "  → Running Knip dead-code scan..."
npx knip
echo "  ✔ Root Orchestrator verified cleanly."

# --- 2. Backend Verification ---
echo ""
echo ">>> [2/3] Verifying HMS-Backend..."
cd "${BACKEND_DIR}"
echo "  → Running Biome anti-noise check (zero console/debugger)..."
npx biome check .
echo "  → Running Knip dead-code & unused export scanner..."
npx knip
echo "  → Running 42-entity domain unit tests & free-tier cost guardrails..."
npm test
echo "  → Synthesizing AWS CDK serverless infrastructure stack..."
npm run synth > /dev/null
echo "  ✔ HMS-Backend verified cleanly."

# --- 3. Frontend Verification ---
echo ""
echo ">>> [3/3] Verifying HMS-Frontend..."
cd "${FRONTEND_DIR}"
echo "  → Running Biome anti-noise check (zero console/debugger)..."
npx biome check .
echo "  → Running Knip dead-code & unused export scanner..."
npx knip
echo "  → Checking TypeScript 5.x types..."
npx tsc --noEmit
echo "  → Building Apple HIG production bundles (Guest QR + Staff PWA + PMS)..."
npm run build
echo "  ✔ HMS-Frontend verified cleanly."

echo ""
echo "========================================================================"
echo " ✔ ALL 3 REPOSITORIES PASSED 100% OF QUALITY GATES WITHOUT WARNINGS"
echo "========================================================================"
