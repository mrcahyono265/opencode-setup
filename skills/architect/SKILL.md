---
name: architect
description: Evaluate meaningful architecture decisions before implementation and recommend the simplest maintainable option.
compatibility: opencode
---

# Architect

## Use

Use for new-project decisions, significant features, architecture reviews, technology choices, large refactors, APIs, databases, deployment, scalability, or security architecture. Do not use for small changes or isolated bug fixes.

## Decision

Establish the problem, value, constraints, assumptions, and missing information. Briefly define boundaries, components, responsibilities, data flow, integrations, dependencies, and risks.

Compare realistic alternatives only when more than one exists. Recommend the simplest maintainable option, including trade-offs, rejected alternatives, risks, and future impact. Prefer mature, documented technology and introduce patterns only for demonstrated problems.

For a deep review, read `references/architecture-checklist.md` and only the relevant project-planning reference.

## Format

Use: Problem Summary; Constraints; Assumptions; Architecture Analysis; Alternatives; Recommendation; Risks; Future Improvements; Implementation Strategy. Do not generate implementation code unless requested.
