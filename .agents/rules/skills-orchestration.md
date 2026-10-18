# Skills & Plugins Orchestration — Sri Lankan Cloud SaaS HMS

This repository orchestrates a 3-repository cloud SaaS platform using specialized Antigravity skills and plugins.

## 1. Skill Stack & Responsibilities

| Skill / Plugin | Scope & Repository | Primary Duty |
| :--- | :--- | :--- |
| **Ponytail** (`ponytail`) | All Repositories (`Sri-Lanka--HMS`, `HMS-Backend`, `HMS-Frontend`) | Eliminates speculative bloat, unneeded abstractions, and single-use wrappers while respecting zero console noise and no arbitrary LOC limits. |
| **Addy Osmani's `agent-skills`** | All Repositories | Provides `spec-driven-development`, `incremental-implementation`, `code-simplification`, `code-review-and-quality`, and `security-auditor`. |
| **`apple-design`** (`dickwu/apple-design-skill`) | `HMS-Frontend` (`src/qr`, `src/staff`, `src/admin`) | Enforces Apple Human Interface Guidelines, Liquid Glass vibrancy, continuous squircles, SF Pro typography, and spring interaction physics. |
| **`ui-ux-pro-max`** (`nextlevelbuilder/ui-ux-pro-max-skill`) | `HMS-Frontend` | Delivers touch-friendly responsive layouts, POS/KDS bento grids, hospitality color palette reasoning, and WCAG AAA accessibility verification. |
| **`agentic-awesome-skills`** | `HMS-Backend` & `HMS-Frontend` | Provides AWS CDK serverless best practices, AppSync GraphQL schema patterns, DynamoDB single-table design, and OWASP security auditing. |

## 2. Invocation Guidelines

### Backend Tasks (`HMS-Backend`):
- For domain math and logic (`packages/core`): Follow pure TypeScript, zero runtime npm dependencies, and comprehensive unit tests with `node --test`.
- For AppSync GraphQL schemas and JS resolvers (`packages/graphql`): Verify tenant isolation, permission matrix evaluation, and hash-chained audit logging.
- For AWS CDK infrastructure (`packages/cdk`): Use `agentic-awesome-skills` AWS Serverless/CDK patterns targeting `ap-south-1` Mumbai free-tier allowances.
- Apply `ponytail-review` to confirm zero unused abstractions and zero console noise.

### Frontend Tasks (`HMS-Frontend`):
- For Guest QR PWA (`src/qr/`), Staff Apps (`src/staff/`), and Admin Portal (`src/admin/`): Apply `apple-design` and `ui-ux-pro-max` for all visual and interactive elements.
- Verify touch targets are at least 44x44pt.
- Use `tabular-nums` for all currency amounts (LKR) and stay dates.
- Implement `@media (prefers-reduced-transparency: reduce)` and `@media (prefers-reduced-motion: reduce)` fallbacks.

### Code Quality Gates:
- Always run `npx biome check .` and `npx knip` before concluding any step.
