---
name: website
description: Plan and build modern web applications and landing pages with a strict understand-plan-approve-build-verify workflow.
compatibility: opencode
---

# Website Workflow

## Purpose

Orchestrate web development without loading every web-related capability at once.

The workflow is:

**Understand → Project Context → Project Planning → Approval/Freeze → Implement → Verify → Document**

## Start

When invoked for a new or unclear project:

1. Understand the goal, audience, core user flows, constraints, and success criteria.
2. Inspect the existing project only as deeply as necessary.
3. Use the `project-context` skill to draft or update the project-level `AGENTS.md` with verified context and important constraints.
4. Use `project-planning` to select and draft only the specifications relevant to the project.
5. If critical information is missing, ask concise questions.
6. Present the plan, wait for explicit approval, mark the selected specifications `APPROVED`, then implement.

Do not silently invent business rules, content, integrations, or architecture.

## Planning

Use `architect` when the task involves meaningful architecture, backend/API boundaries, data models, integrations, or significant technology decisions.

Use `ui-review` for pages, UX, landing pages, responsive behavior, accessibility, and visual direction.

For landing pages, consider:

- visual hierarchy
- typography
- composition and spacing
- copywriting and CTA hierarchy
- responsive behavior
- meaningful motion/interaction
- accessibility
- performance

Do not add visual effects merely because they are available.

## Implementation

After approval:

- Follow the existing stack and project conventions.
- Use official framework tooling.
- Prefer the smallest coherent implementation.
- Keep unrelated areas untouched.
- Use realistic placeholder content/data when real data is unavailable.

For full-stack projects, frontend-first is a preferred workflow only when it provides useful product validation; it is not a universal requirement.

## MCP Selection

- `codebase-memory-mcp`: repository structure and impact exploration when useful.
- `Serena`: symbol-level navigation/refactoring when useful.
- `Context7`: current framework/library/API documentation.
- `Playwright`: browser, responsive, interaction, and visual verification.

Do not use overlapping MCPs for the same exploration unless necessary.

## Security

Invoke `security-review` when the feature touches authentication, authorization, ownership, tenant isolation, sensitive data, uploads, payments, or other security-sensitive behavior.

For ordinary presentation-only work, do not perform a broad security review.

## Verification

Use the cheapest meaningful checks first:

1. lint / format / typecheck
2. focused tests
3. Playwright for affected browser flows
4. targeted security review when applicable

## Documentation

Invoke `documentation` when the change materially affects project behavior, architecture, public usage, or portfolio content.
