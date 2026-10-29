---
name: project-planning
description: Establish approved project specifications before implementation, including scope, constraints, and acceptance criteria.
compatibility: opencode
---

# Project Planning

## Purpose
Establish an approved **Project Source of Truth** before implementation.

Project docs are not passive documentation. They define intended scope, behavior, constraints, architecture, and acceptance criteria.

## Rules
1. Do not implement before requirements are sufficiently clear.
2. Ask concise questions when missing information materially affects scope, behavior, architecture, security, UX, data, or deployment.
3. Never invent requirements, business rules, project facts, or constraints.
4. Start with one `docs/plan.md`. Split details into another document only when they are substantial and independently maintained.
5. Clearly separate confirmed requirements, assumptions, open questions, and out-of-scope items.
6. Always create a concise project-specific `AGENTS.md` for a new project. It links to `docs/plan.md`; it does not repeat planning detail.
7. Get user approval before implementation unless the user explicitly asks to skip planning.
8. After approval, treat approved project docs as the **Project Source of Truth**.
9. Implementation must conform to the approved Source of Truth.
10. Never silently expand scope or change approved behavior.
11. If a new request materially changes scope, explain the impact, update affected specs after approval, then implement.
12. Keep each fact in one source. A supporting document links from `docs/plan.md` and does not repeat its goals, scope, or decisions.
13. Before completion, validate implementation against the Source of Truth and acceptance criteria.

## Source of Truth Hierarchy
1. Explicit current user instruction
2. Approved project specifications
3. Project-specific `AGENTS.md`
4. Other project design/specification documents
5. Existing implementation
6. Model assumptions

Never treat an assumption as a confirmed fact.

## Workflow

### 1. Clarify And Brainstorm
Understand the goal, users, constraints, risks, and success criteria. Ask only questions that materially reduce ambiguity. Do not create planning files until the direction is sufficiently clear.

### 2. Draft The Plan
Use `references/plan.md` to create `docs/plan.md`. Every goal needs an outcome, approach, scope, and acceptance criteria. Prefer bullets to prose.

### 3. Split Only When Needed
Create an API, database, security, ML, or deployment document only when that topic needs substantial independent detail. Link it from the plan and keep the plan as the concise index; do not duplicate facts.

### 4. Draft Project Context
Use `project-context` to create a concise project `AGENTS.md` that records stable context and points to `docs/plan.md`.

### 5. Review And Freeze
Present the plan and project context for user review. After approval, mark `docs/plan.md` as `APPROVED`; it becomes the project Source of Truth.

### 6. Implement And Verify
Before significant decisions, check the relevant approved document. For material changes, explain impact, obtain approval, update the plan, and re-check affected decisions. Verify acceptance criteria, scope boundaries, business rules, and applicable security requirements.

## Efficient Context Usage
- Do not read every reference by default.
- Read only relevant references.
- Use project specs as compact context anchors.
- Inspect source selectively.
- Use Serena for large-codebase navigation when useful.
- Use Context7 for current library/framework/API documentation when relevant.
- Use Playwright for browser/UI validation when relevant.
- Run security review when relevant rather than repeatedly scanning everything.

## Completion
A project is complete only when implementation is consistent with the approved Source of Truth, acceptance criteria are satisfied, validation is performed, and relevant specs remain synchronized.
