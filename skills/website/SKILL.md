---
name: website
description: Plan and build web applications and landing pages with domain-specific UI, visual, and browser validation guidance.
compatibility: opencode
---

# Website Workflow

Use `project-context` and `project-planning` for the shared lifecycle: understand, select specs, approve/freeze, implement, verify, and document.

## Domain Focus

- Establish the audience, core user flows, constraints, and success criteria.
- Use `architect` only for meaningful API, data, integration, or system decisions.
- Use `ui-review` for user-facing pages, visual direction, responsive behavior, and accessibility.
- For landing pages, prioritize hierarchy, typography, composition, copy/CTA clarity, responsive behavior, accessibility, and performance. Do not add effects without a product purpose.
- Use GptImage only for purposeful custom raster assets after defining visual direction and asset purpose.
- Use `canva-deliverables` only for editable mockups, marketing assets, or client-facing visual documents. Canva is not the source for coded UI.

## Implementation And Verification

Follow the existing stack and keep changes focused. Keep UI useful without optional generated images and provide meaningful alt text where images convey content.

Use Playwright for changed browser flows or visual/responsive validation. Invoke `security-review` for security-sensitive features; presentation-only work does not need a broad security review.
