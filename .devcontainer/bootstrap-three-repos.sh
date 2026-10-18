#!/usr/bin/env bash
set -euo pipefail

cd /workspaces/Sri-Lanka--HMS

# 1. Clone HMS-Backend and HMS-Frontend first into the Codespaces workspace
if [ ! -d "/workspaces/Sri-Lanka--HMS/HMS-Backend/.git" ]; then
  git clone https://github.com/PasanRamyanath/HMS-Backend.git /workspaces/Sri-Lanka--HMS/HMS-Backend || true
fi

if [ ! -d "/workspaces/Sri-Lanka--HMS/HMS-Frontend/.git" ]; then
  git clone https://github.com/PasanRamyanath/HMS-Frontend.git /workspaces/Sri-Lanka--HMS/HMS-Frontend || true
fi

# 2. Install Antigravity CLI (agy) Coding & Apple HIG UI/UX Skills
agy plugin install https://github.com/DietrichGebert/ponytail || true
agy plugin install https://github.com/addyosmani/agent-skills.git || true
npx --yes skills add dickwu/apple-design-skill -a antigravity || true
npx --yes skills add nextlevelbuilder/ui-ux-pro-max-skill -a antigravity || true
npx --yes agentic-awesome-skills --agy || true
