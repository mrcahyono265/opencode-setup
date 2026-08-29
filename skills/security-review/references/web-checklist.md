# Targeted Web Security Checklist

Use only the sections relevant to the current task.

## Authentication

- Session/token validation occurs server-side.
- Authentication state cannot be forged or bypassed through client-only checks.

## Authorization

- Resource ownership and role checks are enforced server-side.
- Object identifiers cannot bypass ownership checks.

## Data

- Sensitive fields are not returned unnecessarily.
- Tenant boundaries are enforced consistently.

## Files

- Upload type, size, storage location, and access controls are appropriate.
- Download paths cannot escape intended storage boundaries.

## API / Abuse

- Rate limiting or abuse controls are considered when materially relevant.
- CORS, CSRF, and request-origin controls are evaluated according to the authentication model.

## Configuration

- Debug settings and verbose errors are not exposed in production.
- Secrets and privileged configuration remain server-side.
