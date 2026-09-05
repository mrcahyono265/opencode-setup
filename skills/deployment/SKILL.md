---
name: deployment
description: Optional containerized deployment workflow for projects that need Docker, using conservative production-oriented templates and PostgreSQL support.
compatibility: opencode
---

# Deployment

## Purpose

Handle optional containerized deployment after the application is implemented and verified. Docker is a deployment option, not a development requirement.

## When To Use

Use near project completion when deployment to a server is being prepared, or when the user explicitly asks for Docker/containerization.

Do not introduce Docker merely because the project uses PostgreSQL, Python, Node.js, ML, or multiple services.

Before generating Docker files, ask the user whether Docker is needed for the intended deployment unless the user already explicitly decided to use it.

## Workflow

**Assess → Ask → Plan → Approve → Generate → Local Build/Test → Server Build/Deploy**

1. Determine the deployment target and whether containers are actually useful.
2. Ask for confirmation if Docker has not already been requested.
3. Read the approved deployment specification when it was selected, then inspect the real project structure and runtime requirements.
4. Read only the template references required by the selected architecture.
5. Generate the smallest appropriate Docker configuration.
6. Validate the container locally before a user-requested commit.
7. Keep secrets out of images and source control.
8. Update the approved deployment specification and project documentation with required server environment variables, ports, volumes, and deployment commands.

## Templates

Use references as templates, not files to copy blindly:

- `references/Dockerfile.tpl` — generic application container baseline.
- `references/docker-compose.project.yml.tpl` — per-project Compose baseline.
- `references/docker-compose.postgres.shared.yml.tpl` — reusable PostgreSQL service pattern.
- `references/.dockerignore.tpl` — baseline ignore rules.

The `.tpl` files remain in the skill and are not copied into projects.

## PostgreSQL

Use PostgreSQL only when the project actually requires it.

For a project using PostgreSQL:

- Use a persistent Docker volume for database data.
- Configure database credentials through environment variables or server-side secrets.
- Never hardcode real credentials into Dockerfiles or Compose files.
- Prefer an `.env.example` in source control and a real `.env`/secret configuration only on the deployment environment.
- Do not expose PostgreSQL publicly unless the deployment architecture explicitly requires it.
- Add a healthcheck when it materially improves startup ordering or operational visibility.

The shared PostgreSQL reference provides a reusable pattern; the final project Compose file must still be adapted to the actual application.

## Dockerfile Standards

Prefer production-oriented, project-appropriate practices:

- Use an appropriate maintained base image.
- Pin or constrain runtime/dependency versions according to the project's existing dependency strategy.
- Keep build context small with `.dockerignore`.
- Use multi-stage builds when they provide a meaningful benefit.
- Do not copy secrets into images.
- Run as a non-root user when practical.
- Expose only required application ports.
- Keep development-only tooling out of the production image when practical.
- Do not add unnecessary packages or services.

Do not apply these mechanically when the project runtime makes them inappropriate; verify the actual framework/runtime first.

## Compose Standards

Generate only services that the project needs, such as:

- application/frontend
- backend/API
- ML inference service
- PostgreSQL
- other explicitly required infrastructure

Do not create Redis, queues, reverse proxies, workers, or other services without a project requirement.

Use service names and internal networking consistently. Persist stateful data with named volumes.

## Local Verification

Before a user-requested commit:

1. Build the image(s).
2. Start the relevant Compose services.
3. Check container health/status and logs.
4. Verify the application through the cheapest meaningful path.
5. Run focused tests when relevant.
6. Fix configuration/runtime errors before the change is committed.

Do not treat `docker build` success alone as deployment verification.

## Server Workflow

Default simple deployment flow:

**Laptop → GitHub → Server → clone/pull → Docker build → Compose up → health check**

For the first deployment, clone the repository. For subsequent updates, pull the intended revision.

Build on the server by default for small/simple deployments unless the user has chosen a registry/CI pipeline.

Do not introduce CI/CD, a container registry, orchestration, or zero-downtime infrastructure unless the project actually needs it.

## Security

Never place:

- API keys
- database passwords
- private certificates
- production secrets

inside Dockerfiles, committed Compose files, or images.

Use `security-review` when containerization changes authentication, authorization, network exposure, secrets, file access, or other security-sensitive behavior.

## Output

When Docker is approved, normally produce:

- `Dockerfile` or project-specific Dockerfiles
- `docker-compose.yml` when multiple services are needed
- `.dockerignore`
- `.env.example` when environment configuration is required
- concise deployment notes in the project's documentation when appropriate

Do not create these files if Docker was declined or unnecessary.
