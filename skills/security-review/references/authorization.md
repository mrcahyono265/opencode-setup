# Authorization & Resource Ownership

Use this reference when a task involves authenticated users, roles, user-owned resources, tenant isolation, or privileged operations.

## Core Questions

- Who is the actor?
- What resource is being accessed?
- Which organization/tenant/user owns the resource?
- Where is authorization enforced?
- Is authorization checked before the resource is returned or mutated?
- Can an attacker replace an identifier and access another user's resource?
- Are list, detail, update, delete, download, and export paths all scoped consistently?
- Are privileged roles checked server-side rather than only in the UI?

## High-Priority Cases

### IDOR / BOLA

Test whether changing a resource identifier allows access to another user's object.

Example boundary:

`GET /invoices/{invoice_id}`

The server must verify that the authenticated actor is allowed to access that invoice before returning it.

### Multi-Tenant Isolation

Where applicable, verify tenant/organization scoping at the data-access boundary rather than relying only on client-provided identifiers.

### Indirect Paths

Check related operations such as:

- nested resources
- search/filter endpoints
- exports
- downloads
- background jobs
- bulk actions
- websocket/subscription access

Do not claim a vulnerability without tracing the actual request-to-data path.
