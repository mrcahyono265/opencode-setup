# Project Planning

## Purpose
Establish an approved **Project Source of Truth** before implementation.

Project docs are not passive documentation. They define intended scope, behavior, constraints, architecture, and acceptance criteria.

## Rules
1. Do not implement before requirements are sufficiently clear.
2. Ask concise questions when missing information materially affects scope, behavior, architecture, security, UX, data, or deployment.
3. Never invent requirements, business rules, project facts, or constraints.
4. Select only documents relevant to the project. Do not create unnecessary docs.
5. Clearly separate confirmed requirements, assumptions, open questions, and out-of-scope items.
6. Always create a project-specific `AGENTS.md` for a new project.
7. Get user approval before implementation unless the user explicitly asks to skip planning.
8. After approval, treat approved project docs as the **Project Source of Truth**.
9. Implementation must conform to the approved Source of Truth.
10. Never silently expand scope or change approved behavior.
11. If a new request materially changes scope, explain the impact, update affected specs after approval, then implement.
12. Before completion, validate implementation against the Source of Truth and acceptance criteria.

## Source of Truth Hierarchy
1. Explicit current user instruction
2. Approved project specifications
3. Project-specific `AGENTS.md`
4. Other project design/specification documents
5. Existing implementation
6. Model assumptions

Never treat an assumption as a confirmed fact.

## Workflow

### 1. Discover
Understand goal, problem, users, workflows, requirements, constraints, data, integrations, security/privacy, and deployment expectations. Ask only questions that materially reduce ambiguity.

### 2. Select Documents
Choose documents by project type.

Examples:
- Web/SaaS: PRD, ARCHITECTURE, DATABASE, API, UIUX, SECURITY, DEPLOYMENT
- ML: PRD, ML-SPEC, DATA-SPEC, ARCHITECTURE, SECURITY, DEPLOYMENT
- AI app: PRD, AI-SPEC, DATA-SPEC, ARCHITECTURE, SECURITY, DEPLOYMENT
- Landing/marketing: PRD, UIUX, COPYWRITING, DEPLOYMENT

Do not force every project to contain every document.

### 3. Draft
Create selected specs from this skill's references. PRD defines scope and acceptance criteria. Technical specs must derive from approved requirements.

### 4. Review Gate
Present scope, non-scope, decisions, assumptions, open questions, selected docs, and major trade-offs. Wait for approval.

### 5. Freeze
Mark approved specs as `APPROVED`. Treat them as authoritative. Do not rewrite requirements to match code.

### 6. Implement
Before significant decisions, check the relevant source-of-truth document and inspect code/context as needed. Use relevant skills/MCPs only when they add value.

### 7. Requirement Changes
Identify affected requirements -> explain impact -> obtain approval when material -> update affected specs -> re-check dependent architecture/security/UI/data decisions -> implement.

### 8. Verify
Check acceptance criteria, business rules, scope boundaries, security requirements, and specification consistency. Report mismatches explicitly.

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
