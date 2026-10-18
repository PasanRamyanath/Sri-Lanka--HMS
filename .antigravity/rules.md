# Sri Lankan Hotel Management System (HMS) & QR Room Service Platform — Antigravity Rules

## 1. 3-Repository GitHub Codespaces Architecture
- **Workspace Root / Orchestrator**: `Sri-Lanka--HMS` (`/workspaces/Sri-Lanka--HMS`)
- **Backend Monorepo**: `HMS-Backend` (`/workspaces/Sri-Lanka--HMS/HMS-Backend`)
  - `@hms/core`: Pure TypeScript domain logic, Sri Lankan 4-stage tax compounding, LankaQR EMVCo MPM, payment crypto, and statutory math. Zero external runtime npm dependencies.
  - `@hms/graphql`: Single source of truth 42-entity GraphQL schema & direct AppSync JS DynamoDB resolvers.
  - `@hms/cdk`: AWS CDK v2 serverless infrastructure in `ap-south-1` Mumbai targeting permanent AWS Free Tier.
- **Frontend Monorepo**: `HMS-Frontend` (`/workspaces/Sri-Lanka--HMS/HMS-Frontend`)
  - React 19 + Vite + TypeScript + Tailwind CSS v4.
  - `src/qr/`: Zero-login contactless guest ordering PWA.
  - `src/staff/`: Smartphone/tablet KDS, Bar BOT, Waiter POS & Housekeeping runner.
  - `src/admin/`: Full multi-tenant hotel PMS, tape chart, folios, and SaaS super-admin.

## 2. 42-Entity Multi-Tenant SaaS DynamoDB Architecture
All entities reside in the single DynamoDB table `HmsTable` with strict tenant isolation via `PK: TENANT#<tid>`:
1. `SaasOrganization`
2. `HotelTenant`
3. `SaasSubscription`
4. `SaasBillingInvoice`
5. `TenantWebhookEndpoint`
6. `TenantApiKey`
7. `StaffUser`
8. `RolePermissionMatrix`
9. `StaffShiftSession`
10. `ImmutableAuditLog` (SHA-256 hash-chained `prevHash -> entryHash`)
11. `RoomType`
12. `PhysicalRoom`
13. `RatePlan`
14. `SeasonalRateCalendar`
15. `PromoAndVoucher`
16. `DriverDormBed`
17. `GuestProfile`
18. `TourOperatorDmcAccount`
19. `Reservation`
20. `ReservationRoomStay` (Atomic per-room-per-night lock)
21. `RoomBlockMaintenance`
22. `PoliceBCardRegistration`
23. `GuestFolio`
24. `FolioLineItem`
25. `FolioPaymentTransaction`
26. `CashierShiftDrawer`
27. `IrdTaxInvoiceRecord`
28. `DiningOutlet`
29. `MenuCategory`
30. `MenuItem`
31. `QrLocationEndpoint`
32. `ServiceOrder`
33. `HousekeepingTask`
34. `MinibarAndLaundryLog`
35. `MaintenanceWorkOrder`
36. `LostAndFoundItem`
37. `BanquetHallAndEventBEO`
38. `AyurvedaSpaAppointment`
39. `ExcursionAndTransferBooking`
40. `SupplierAndStockItem`
41. `InventoryProcurementVoucher`
42. `NightAuditSltdaAndPayroll`

## 3. Apple Human Interface Guidelines (HIG) & Liquid Glass Mandate
- Frosted glass vibrancy surfaces: `backdrop-filter: blur(24px) saturate(180%)` with top/left specular border.
- SF Pro optical scale and `tabular-nums` for all financial figures, LKR currency, and elapsed timers.
- Continuous squircle geometry (`10px` / `16px` / `24px` / `9999px`).
- Fluid spring physics: `cubic-bezier(0.22, 1, 0.36, 1)`.
- Minimum interactive touch targets >= 44x44pt.
- Support `@media (prefers-reduced-transparency: reduce)` and `@media (prefers-reduced-motion: reduce)`.

## 4. Code Quality & Zero-Slop Anti-Noise Rules
- **No arbitrary LOC limit**: Prioritize readable, self-documenting code over golfing.
- **Zero console noise**: `suspicious.noConsole: "error"` and `suspicious.noDebugger: "error"` enforced via Biome. No `console.log`, `console.error`, or `debugger` in application code.
- **Zero dead code**: `knip` enforces zero unused files, exports, types, or dependencies.
- **Cognitive complexity**: Maximum allowable complexity of 12.

## 5. Ponytail Anti-Bloat & Skills Configuration
- **Ponytail Operating Mode**: Calibrated in `.agents/rules/ponytail.md` to prune AI code bloat, speculative wrapper classes, and single-use abstractions.
- **Readability Over Line Budgets**: Never compromise readability, type safety, docstrings, or domain completeness for lower line counts.
- **Protected Domain Invariants**: Never simplify Sri Lankan 4-stage compounding tax calculations, NIC/Passport validations, LankaQR EMVCo structures, 42-entity multi-tenant SaaS schema, or SHA-256 hash-chained `ImmutableAuditLog`.
- **Integrated Skills Stack**:
  - `apple-design` & `ui-ux-pro-max`: Apple HIG tokens, Liquid Glass, squircle geometry, and touch ergonomics in `HMS-Frontend`.
  - `agent-skills`: Spec-driven development, code reviews, and security auditing.
  - `agentic-awesome-skills`: AWS CDK v2 serverless, AppSync GraphQL, and OWASP hardening.

## 6. Execution & Gate Protocol
- Sequential step execution (Steps 001–500).
- Gate check at each step: Biome check + Knip + tests must pass.
- Update checklist status in `plan.md` and repository `PROGRESS.md` from `- [ ]` to `- [x]`.
- Commit changes atomically and push to GitHub remote (`git push origin main`).

