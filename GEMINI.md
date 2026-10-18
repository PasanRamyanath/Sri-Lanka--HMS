# Sri Lankan Cloud SaaS HMS & QR Room Service Platform — Gemini & Antigravity Context

This workspace orchestrates the multi-tenant Cloud SaaS Hotel Management System (HMS) purpose-built for Sri Lankan hotels, resorts, boutique villas, and rest houses.

## Multi-Repository Workspace Structure
- **Workspace Root**: `/workspaces/Sri-Lanka--HMS` (Orchestrator, devcontainer, master `plan.md`)
- **Backend Monorepo**: `/workspaces/Sri-Lanka--HMS/HMS-Backend`
  - `packages/core` (`@hms/core`): Pure TypeScript Sri Lankan hospitality domain engine. Zero runtime npm dependencies.
  - `packages/graphql` (`@hms/graphql`): 42-entity AppSync GraphQL schema, direct JS DynamoDB resolvers, and TypeScript contract generator.
  - `packages/cdk` (`@hms/cdk`): AWS CDK v2 serverless stack in `ap-south-1` Mumbai targeting permanent AWS Free Tier.
- **Frontend Monorepo**: `/workspaces/Sri-Lanka--HMS/HMS-Frontend`
  - React 19 + Vite + TypeScript + Tailwind CSS v4.
  - `src/qr/`: Zero-login contactless guest ordering PWA.
  - `src/staff/`: Smartphone/tablet KDS, bar BOT, POS, and housekeeping runner.
  - `src/admin/`: Full multi-tenant hotel PMS, tape chart, folios, and super-admin portal.

## Ponytail & Agent Skills Calibration
- **Ponytail Mode**: `full` (calibrated for Sri Lanka HMS in `.agents/rules/ponytail.md`).
- **No Arbitrary LOC Limits**: Prioritize readability, explicit naming, and complete domain modeling over line golfing.
- **Zero Console / Debugger Noise**: Strictly ban `console.log`, `console.error`, and `debugger` (`suspicious.noConsole: "error"` in Biome). Use explicit `Result<T, DomainError>` returns.
- **Protected Domain Invariants**: Never simplify 4-stage tax compounding (`SC -> TDL -> SSCL -> VAT`), LankaQR EMVCo format, NIC/Passport validation, 42 multi-tenant SaaS entities, or SHA-256 hash-chained `ImmutableAuditLog`.
- **Apple HIG & Liquid Glass UI Standard**: Enforced across `HMS-Frontend` via `apple-design` and `ui-ux-pro-max` skills.
- **Verification Gate**: Every step must pass `npx biome check .`, `npx knip`, and unit tests before commit and push.
