---
name: ml
description: Plan and build machine-learning projects with explicit data, model, evaluation, and deployment boundaries.
compatibility: opencode
---

# ML Workflow

Use `project-context` and `project-planning` for the shared lifecycle: understand, select specs, approve/freeze, implement, evaluate, and document.

## Domain Focus

- Clarify the ML objective and success metric.
- Evaluate only relevant areas: data quality, preprocessing, features, model choice, training, evaluation, inference, reproducibility, resource constraints, and integration.
- Use `architect` for significant system or ML architecture decisions.
- Keep training, evaluation, and inference boundaries explicit. Preserve data limitations and never fabricate evaluation results.
- Use `security-review` for user data, sensitive inputs/outputs, uploads, model access controls, external integrations, or privileged inference.

## Verification

Use focused data validation, tests, evaluation metrics and acceptance criteria, reproducibility checks, and inference checks. State limitations when meaningful evaluation is not possible.
