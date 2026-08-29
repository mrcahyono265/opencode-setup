---
name: security-review
description: Perform a targeted application security review focused on authorization, data boundaries, input handling, secrets, and common web/API vulnerabilities.
compatibility: opencode
---

# Security Review

## Purpose

Find realistic security weaknesses in the code and architecture relevant to the current task. Prefer targeted review over broad, repetitive scanning.

## When To Use

Use when a task changes or introduces:

- authentication
- authorization or roles
- user-owned resources
- multi-tenant data
- APIs
- payments
- file uploads/downloads
- sensitive data
- secrets/configuration
- external integrations
- privilege boundaries

Do not use for purely cosmetic, documentation, or isolated UI changes unless the task touches security-sensitive behavior.

## Review Order

1. Identify trust boundaries and actors.
2. Identify the resource ownership model.
3. Trace authorization from request to data access.
4. Check input validation and output handling.
5. Check secrets and sensitive data exposure.
6. Check common vulnerabilities relevant to the stack.
7. Verify with focused tests when practical.

## Reference Selection

Read only the references relevant to the current task:

- `references/authorization.md` — ownership, roles, IDOR/BOLA, tenant isolation
- `references/input-and-output.md` — validation, injection, unsafe sinks, files/URLs
- `references/secrets-and-data.md` — credentials, sensitive data, logs, storage
- `references/web-checklist.md` — targeted web/API baseline checks

Do not read every reference for every review.

## Priority Checks

Pay special attention to:

- IDOR/BOLA: user A accessing user B's resource
- missing organization/tenant scoping
- privilege escalation
- insecure direct object references
- authentication bypass
- mass assignment / unsafe field updates
- injection
- unsafe file access
- sensitive data leakage
- insecure defaults
- secret exposure
- missing rate/abuse controls where materially relevant

## Rules

- Do not claim a vulnerability without evidence.
- Prefer explaining the attack path and affected boundary.
- Do not refactor unrelated code during a security review.
- If a fix is required, keep it scoped and verify the authorization/data boundary after the change.
