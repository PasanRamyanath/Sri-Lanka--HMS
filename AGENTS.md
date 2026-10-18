# Agent Guidelines & Operational Instructions — Sri Lanka HMS Platform

## 1. Multi-Repository Orchestration
This workspace (`/workspaces/Sri-Lanka--HMS`) orchestrates the Sri Lankan Cloud SaaS Hotel Management System:
- **`Sri-Lanka--HMS`**: Root orchestrator, devcontainer, master `plan.md` tracking.
- **`HMS-Backend`**: AWS CDK v2 (`@hms/cdk`), AppSync GraphQL resolvers (`@hms/graphql`), and zero-dependency core domain engine (`@hms/core`).
- **`HMS-Frontend`**: React 19 + Tailwind CSS v4 Apple HIG PWA & PMS web applications.

## 2. Mandatory Coding Conventions
- **No Line-Count Constraints**: Code should be readable, well-structured, and expressive. Never cram logic onto single lines or delete docstrings to fit an arbitrary LOC budget.
- **Ponytail Anti-Bloat**: Calibrated via `.agents/rules/ponytail.md` to eliminate speculative abstractions and dead code while fully protecting Sri Lankan statutory tax formulas, 42-entity multi-tenant SaaS schema, and Apple HIG standards.
- **Zero Console & Debugger Noise**: Never introduce `console.log`, `console.error`, `console.warn`, or `debugger`. Use explicit typed results (`Result<T, E>`) and proper AppSync / logger constructs.
- **Strict Linting & Dead Code Elimination**: Ensure `npx biome check .` and `npx knip` report zero warnings or errors.
- **Apple HIG & Liquid Glass UI Standard**: All frontend elements must follow Apple Human Interface Guidelines tokens and interaction physics (via `apple-design` and `ui-ux-pro-max`).


## 3. Step Execution & Verification Protocol
1. Follow the sequential order in `plan.md` (Step 001 through Step 500).
2. Run automated validation commands before completing each step (`biome check`, `knip`, unit tests).
3. Update `- [ ] Step XXX` to `- [x] Step XXX` in `plan.md` and the appropriate `PROGRESS.md`.
4. Commit with the specified conventional commit message (`feat(step-XXX): ...`).
5. Push to the appropriate GitHub repository on branch `main`.
