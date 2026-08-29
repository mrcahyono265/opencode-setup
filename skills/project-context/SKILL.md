---
name: project-context
description: Establish and maintain concise project AGENTS.md context from verified project facts, constraints, architecture, and decisions.
compatibility: opencode
---

# Project Context

## Purpose

Create or update the project's `AGENTS.md` as AI working context. It is not a replacement for README or other human-facing documentation.

## When To Use

Use during project initialization or when meaningful project context changes, especially when invoked by a workflow skill such as `website`, `ml`, or `web-ml`.

Do not rewrite the project `AGENTS.md` for ordinary implementation tasks when its context remains accurate.

## Template

Before creating or substantially restructuring the project `AGENTS.md`, read:

`references/PROJECT-AGENTS.md.tpl`

Use that file as the structural template. The template is a source file only; do not copy the `.tpl` file into the project.

Output:

`<project-root>/AGENTS.md`

The source template name and output filename are intentionally different.

## Rules

- Populate only information verified from the project or explicitly provided by the user.
- Do not invent business rules, architecture, security boundaries, metrics, or implementation facts.
- Prefer concise high-value context over exhaustive documentation.
- Keep actual code as the source of truth for implementation details.
- If documentation conflicts with code and the conflict affects the current task, verify and ask when necessary.
- Preserve useful existing project context when updating the file.
- Do not include secrets, credentials, tokens, or unnecessary personal/client data.
- Do not create the file silently after the planning gate if the workflow requires user review; present the draft as part of the plan.

## Suggested Process

1. Inspect the project at the depth needed for the current task.
2. Read `references/PROJECT-AGENTS.md.tpl`.
3. Fill the template with verified project facts.
4. Mark important unknowns rather than guessing.
5. Present the proposed project context during planning.
6. After approval, create or update `<project-root>/AGENTS.md`.
7. Keep it synchronized only when meaningful project context changes.
