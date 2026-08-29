---
name: ml
description: Plan and build machine-learning projects with explicit data, model, evaluation, and deployment boundaries while minimizing unnecessary exploration and tool use.
compatibility: opencode
---

# ML Workflow

## Purpose

Orchestrate ML work around the actual objective rather than forcing a web-development workflow onto ML projects.

Workflow:

**Understand → Project Context → Plan → User Approval → Implement → Evaluate → Document**

## Start

1. Clarify the ML objective and success metric.
2. Inspect the relevant project structure and existing artifacts.
3. Use the `project-context` skill to draft or update project `AGENTS.md` with verified context, data boundaries, model assumptions, and constraints.
4. Identify missing information.
5. Produce a plan and wait for explicit approval before implementation.

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

## Implementation

- Preserve the existing project structure unless change is justified.
- Avoid unnecessary experiments and dependencies.
- Keep training, evaluation, and inference boundaries explicit.
- Never fabricate evaluation results.
- Make assumptions and data limitations visible.

## MCP Selection

- `codebase-memory`: high-level structure and dependency/impact exploration.
- `Serena`: precise code navigation/refactoring.
- `Context7`: current library/framework/SDK documentation.

Use only what the task needs.

## Verification

Prefer focused validation:

- data validation
- unit/integration tests
- evaluation metrics
- reproducibility checks
- inference checks

State limitations when a meaningful evaluation cannot be performed.

## Documentation

Use `documentation` for meaningful architecture, experiment, model, or developer-workflow changes. Record important technical decisions in the decision log when appropriate.
