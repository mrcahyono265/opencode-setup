# Per-project Compose template.
# Keep only services required by this project.
# Do not add infrastructure (Redis, workers, reverse proxy, etc.) without a reason.

services:
  app:
    # TODO: Adjust build context and Dockerfile path to the real project.
    build:
      context: .
      dockerfile: Dockerfile
    # TODO: Add only the environment variables required by the application.
    env_file:
      - .env
    # TODO: Map ports only when the service must be reachable from the host.
    ports:
      - "<HOST_PORT>:<CONTAINER_PORT>"
    restart: unless-stopped

  # Optional PostgreSQL service.
  # Uncomment and adapt only if the project requires a containerized database.
  # postgres:
  #   image: postgres:<VERSION>
  #   environment:
  #     POSTGRES_DB: ${POSTGRES_DB}
  #     POSTGRES_USER: ${POSTGRES_USER}
  #     POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
  #   volumes:
  #     - postgres_data:/var/lib/postgresql/data
  #   restart: unless-stopped
  #   healthcheck:
  #     test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB}"]
  #     interval: 10s
  #     timeout: 5s
  #     retries: 5

# Uncomment only when the PostgreSQL service above is enabled.
# volumes:
#   postgres_data:
