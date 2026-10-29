# AGENTS.md

## Purpose

Global operating policy for OpenCode projects. Follow project-specific `AGENTS.md` when it adds verified project context.

## Core Principles

Prioritize simplicity, maintainability, readability, appropriate scalability, official conventions, minimal coherent changes, and meaningful verification. Avoid invented facts, speculative infrastructure, unnecessary dependencies, premature optimization, hidden magic, and unrelated refactors.

## Planning And Delivery

For non-trivial work, follow this order: idea → clarification and focused brainstorming → draft `docs/plan.md` and project `AGENTS.md` → user review → mark the plan `APPROVED` → implement → verify → update affected documentation.

Clarify material ambiguity before creating planning documents. Keep the plan concise, goal-oriented, and free of duplicated facts. Start with one `docs/plan.md`; split a topic into another document only when it has substantial independent detail.

For a new project, select the relevant `website`, `ml`, or `web-ml` workflow, then use `project-context` and `project-planning`.

Do not implement planned work before approval unless the user explicitly skips planning. Approved specifications are the Project Source of Truth; material requirement changes need approval and an update to affected specifications.

Source-of-truth order:

1. Current user instruction
2. Approved project specifications
3. Project `AGENTS.md`
4. Other project documentation
5. Existing implementation
6. Assumptions

After approval, make the smallest coherent change, follow project conventions, and verify with the cheapest meaningful checks. Update only documentation materially affected by the change. Preserve user-written content.

Do not invent metrics, screenshots, business impact, or production claims in documentation.

## Tool Budget

All configured MCPs remain available. Select tools by need, not by availability.

1. Start with one primary tool or direct source inspection.
2. Add a second tool only when it answers a different unanswered question.
3. Reuse information already established in the task; do not rediscover it.
4. Load only relevant skills and reference files. Deep checklists are for audits or high-risk decisions, not routine work.

Tool selection:

- `codebase-memory-mcp`: architecture, dependency, or impact exploration.
- Serena: symbol navigation, references, and precise refactors.
- Context7: current library, framework, SDK, API, or CLI documentation.
- Playwright: browser behavior, responsive UI, interaction, and visual validation.
- GptImage: purposeful custom raster imagery after visual direction is approved.
- Canva: explicit editable visual deliverables or existing Canva assets/designs.

Use direct source inspection for small, local changes. Do not use overlapping tools for the same question. GptImage is not for UI layouts, icons, logos, screenshots, or purposeless decoration. Use HTML/CSS for UI, SVG for vector assets, and keep interfaces useful without optional images.

## Skills

Use only the relevant skill:

- Workflows: `website`, `android`, `ml`, `web-ml`
- Planning and context: `project-context`, `project-planning`, `architect`
- Quality: `ui-review`, `security-review`, `documentation`, `teacher`, `stop-slop`
- Delivery: `canva-deliverables`, `deployment`

Workflow skills orchestrate relevant supporting skills. Use `project-planning` for the shared lifecycle; workflow skills provide only domain-specific requirements.

## Boundaries

Use `security-review` for authentication, authorization, ownership, tenant isolation, sensitive data, uploads, payments, external integrations, or privilege boundaries. Do not run a broad review for unrelated cosmetic work.

Use `canva-deliverables` only for explicit editable Canva work. Use `documentation` for technical Markdown documents and HTML/CSS for product UI. Preview and obtain approval before saving changes to an existing Canva design; export only when requested.

Use `mysql` and `postgres` only with explicit local dev, dummy, or sandbox databases on `127.0.0.1`. DDL and DML are never allowed against production, VPS, remote hosts, system databases, superuser accounts, or deployment credentials. Inspect schema before destructive work and keep schema changes in migrations when the project uses them.

Docker is optional. Ask before containerizing unless the user already requested it.

## Communication And Done

Be concise and practical. When multiple realistic options exist, state them briefly, recommend one, and name the trade-off.

Work is complete when requested scope is satisfied, conventions are respected, relevant verification passed or limitations are stated, affected documentation is current, security-sensitive changes were reviewed, and no unrelated changes were introduced.
