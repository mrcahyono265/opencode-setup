---
name: web-ml
description: Plan and build systems that combine web applications with ML services, keeping API, model, data, security, and UI boundaries explicit.
compatibility: opencode
---

# Web + ML Workflow

## Purpose

Coordinate frontend, backend, and ML components without assuming that one layer must always be implemented first.

Workflow:

**Understand → Map Boundaries → Project Context → Plan → User Approval → Implement → Verify → Document**

## Start

1. Define the user goal and ML capability.
2. Identify the system boundaries:
   - frontend
   - backend/API
   - ML service or inference layer
   - data/model storage
3. Use the `project-context` skill to draft or update project `AGENTS.md` with verified architecture, contracts, data boundaries, and constraints.
4. Ask questions when critical information is missing.
5. Produce a plan and wait for explicit approval.

## Architecture

Use `architect` for meaningful decisions involving:

- API contracts
- service boundaries
- model/inference integration
- data flow
- persistence
- deployment
- scalability

Do not introduce microservices merely because an ML component exists.

## UI

Use `ui-review` for user-facing interfaces.

Use `Playwright` for affected browser flows and responsive/visual verification.

## ML

Keep explicit boundaries for:

- model input/output
- preprocessing
- inference errors
- model versioning when relevant
- latency/resource constraints
- evaluation

Never invent model performance or business impact.

## Security

Use `security-review` when the system handles:

- authentication/authorization
- user-owned data
- multi-tenant data
- sensitive inputs/outputs
- model access controls
- file uploads
- privileged inference operations

Pay particular attention to whether one user can access another user's data or inference result.

## MCP Selection

- `codebase-memory`: map relationships and narrow repository exploration.
- `Serena`: symbol-level investigation/refactoring.
- `Context7`: current framework/library/SDK documentation.
- `Playwright`: browser verification.

Avoid redundant exploration.

## Verification

Verify the affected boundary end-to-end when practical:

frontend → API → ML → response

Use focused tests first, then broader checks when justified.

## Documentation

Use `documentation` for meaningful architecture, API, ML, or project-state changes.
