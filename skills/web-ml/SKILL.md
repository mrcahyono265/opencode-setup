---
name: web-ml
description: Plan and build web applications with ML services while keeping UI, API, model, data, and security boundaries explicit.
compatibility: opencode
---

# Web + ML Workflow

Use `project-context` and `project-planning` for the shared lifecycle: understand, select specs, approve/freeze, implement, verify, and document.

## Domain Focus

- Map frontend, backend/API, ML/inference, and data/model-storage boundaries before implementation.
- Use `architect` for API contracts, service boundaries, model integration, data flow, persistence, deployment, or scale decisions. Do not introduce microservices merely because ML is involved.
- Use `ui-review` and Playwright for user-facing interfaces.
- Keep model input/output, preprocessing, inference failures, versioning, latency/resource constraints, and evaluation explicit.
- Use `security-review` for authentication, authorization, user-owned or tenant data, sensitive inputs/outputs, model controls, uploads, or privileged inference. Verify that users cannot access another user's data or result.

## Verification

Verify affected paths end-to-end when practical: frontend → API → ML → response. Never invent model performance or business impact.
