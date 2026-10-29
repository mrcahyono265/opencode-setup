---
name: canva-deliverables
description: Create and edit Canva designs and client-facing visual documents such as posters, banners, presentations, proposals, and branded one-pagers. Use when a requested deliverable needs to remain editable in Canva.
compatibility: opencode
---

# Canva Deliverables

## Purpose

Create editable Canva deliverables without treating Canva as a replacement for code, technical documentation, or product UX work.

## When To Use

Use when the user explicitly requests a Canva design or an editable client-facing deliverable, including:

- posters, banners, social media graphics, and campaign assets
- presentations, proposals, portfolios, and branded one-pagers
- simple client reports or documents where visual layout matters
- mockups or editable marketing assets for a website or mobile product

Do not use for README files, specifications, API documentation, changelogs, ADRs, or other technical documents. Use `documentation` for those.

Do not use Canva as the implementation source for website or mobile UI. Use `ui-review` and the relevant workflow for the coded interface.

## Brief Before Design

Confirm only the details needed to make a coherent deliverable:

1. Deliverable type, audience, and goal.
2. Required content, format, and export destination.
3. Brand assets, colors, fonts, or existing Canva designs to reuse.
4. Visual direction: three product traits and what to avoid.
5. Whether the output should be generated from scratch or edit an existing Canva design.

Do not start with a generic modern layout. Make typography, color, composition, and imagery support the intended product or message.

## Asset Strategy

Use existing approved brand assets first.

Use GptImage only when a custom raster asset has a clear purpose. Define its subject, composition, style, palette, aspect ratio, and text to avoid before generating it.

Generated images remain raster assets. Canva can adjust their crop and placement, but it does not make their internal content fully editable.

## Workflow

1. Establish the brief and visual direction.
2. Choose Canva when the deliverable must remain editable; choose Markdown for technical documentation.
3. Create or edit the Canva design using only the required assets and content.
4. Review hierarchy, typography, contrast, spacing, and export format.
5. Show the preview and get explicit approval before saving edits to an existing Canva design.
6. Export only when the user asks for a specific file format.

## Scope Boundaries

- Use Canva for visual deliverables; use GptImage for custom raster imagery; use HTML/CSS for product UI.
- Do not replace client content, brand assets, or existing designs without explicit direction.
- Do not create extra pages, variants, exports, or files unless requested.
- Keep the design readable and useful if an optional generated image is unavailable.
