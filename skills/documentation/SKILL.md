---
name: documentation
description: Keep project documentation synchronized with implementation by maintaining README, PORTFOLIO, CHANGELOG, and engineering decision records.
compatibility: opencode
---

# Documentation Skill

## Purpose

Keep project documentation accurate and synchronized with implementation without creating unnecessary documentation work.

## Project Context

Treat the project-level `AGENTS.md` as AI working context, not as a replacement for human-facing documentation.

## Templates

Use the following Skill references when creating or substantially restructuring the corresponding files:

- `references/README.md.tpl` → output `<project-root>/README.md`
- `references/PORTFOLIO.md.tpl` → output `<project-root>/PORTFOLIO.md`

The `.tpl` files are source templates only. Do not copy them into the project and do not preserve the `.tpl` suffix in output filenames.

Read only the template relevant to the current documentation task. Do not load all templates by default.

When updating an existing document, preserve useful user-written content and use the template as structural guidance rather than blindly replacing the file.

Do not invent metrics, screenshots, business impact, deployment claims, or other portfolio evidence. Use placeholders when information is unavailable.

## Responsibilities

- Prefer updating existing documentation instead of replacing it.
- Preserve user-written content whenever possible.
- Update only artifacts materially affected by the change.

## Decision Flow

Before modifying documentation, determine the type of change.

- New Feature → evaluate README, PORTFOLIO, CHANGELOG
- Architecture Change → evaluate README, PORTFOLIO, decision log
- API Change → evaluate README and API documentation
- Bug Fix → evaluate CHANGELOG; README only if behavior changes
- UI Improvement → evaluate PORTFOLIO and screenshots
- Refactoring → document only meaningful architecture or developer-workflow changes

Do not update documentation unnecessarily.

## Documentation Files

### README.md

Developer-facing documentation covering overview, features, stack, installation, environment variables, development, Docker, structure, tests, and deployment as applicable.

### PORTFOLIO.md

Portfolio-facing documentation covering project overview, problem, solution, users, features, stack, architecture, decisions, challenges, lessons, impact, future improvements, repository, demo, and screenshots as applicable.

### CHANGELOG.md

Record meaningful changes under Added, Changed, Fixed, and Removed. Avoid trivial edits.

### docs/decision-log.md

For important engineering decisions, record Decision, Context, Alternatives, Chosen Solution, Trade-offs, and Date.

## Screenshots

When a completed feature materially changes the UI, recommend updating screenshots. If screenshots are unavailable, use placeholders rather than inventing images.

## Synchronization Rules

Whenever implementation changes, evaluate whether README, PORTFOLIO, CHANGELOG, or decision log is actually affected. Update only what is necessary.

## Writing Style

Clear, professional, concise, scannable, Markdown-friendly. Prefer headings, bullets, short paragraphs, and useful tables.

## Review

Before finishing, verify that documentation matches implementation, technology and feature lists are current, links are correct, screenshots are accurately referenced, and no outdated instructions remain.
