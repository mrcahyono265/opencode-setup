---
name: ml
description: Plan and build machine-learning projects with explicit data, model, evaluation, and deployment boundaries while minimizing unnecessary exploration and tool use.
compatibility: opencode
---

# ML Workflow

## Purpose

Orchestrate ML work around the actual objective rather than forcing a web-development workflow onto ML projects.

Workflow:

**Understand → Project Context → Project Planning → Approval/Freeze → Implement → Evaluate → Document**

## Start

1. Clarify the ML objective and success metric.
2. Inspect the relevant project structure and existing artifacts.
3. Use the `project-context` skill to draft or update project `AGENTS.md` with verified context, data boundaries, model assumptions, and constraints.
4. Use `project-planning` to select and draft only the specifications relevant to the project.
5. Identify missing information.
6. Present the plan, wait for explicit approval, mark the selected specifications `APPROVED`, then implement.

## Planning Areas

Evaluate only the areas relevant to the task:

- data sources and quality
- preprocessing
- features
- model choice
- training strategy
- evaluation methodology
- inference
- reproducibility
- resource constraints
- deployment/integration

Use `architect` for significant system or ML architecture decisions.

## Security

Use `security-review` when the work handles user data, sensitive inputs or outputs, uploads, model access controls, external integrations, or privileged inference operations.

## Implementation

- Preserve the existing project structure unless change is justified.
- Avoid unnecessary experiments and dependencies.
- Keep training, evaluation, and inference boundaries explicit.
- Never fabricate evaluation results.
- Make assumptions and data limitations visible.

## MCP Selection

- `codebase-memory-mcp`: high-level structure and dependency/impact exploration.
- `Serena`: precise code navigation/refactoring.
- `Context7`: current library/framework/SDK documentation.

Use only what the task needs.

## Verification

Prefer focused validation:

- data validation
- unit/integration tests
- evaluation metrics and acceptance criteria
- reproducibility checks
- inference checks

State limitations when a meaningful evaluation cannot be performed.

## Documentation

Use `documentation` for meaningful architecture, experiment, model, or developer-workflow changes. Record important technical decisions in the decision log when appropriate.
