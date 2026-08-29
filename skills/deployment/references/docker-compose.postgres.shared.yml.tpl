# Shared PostgreSQL service pattern.
# This is a reference, not a drop-in project file.
# Adapt the version, credentials, volume name, healthcheck, and network to the project.

services:
  postgres:
    image: postgres:<VERSION>
    environment:
      # Values must come from the deployment environment, not hardcoded secrets.
      POSTGRES_DB: ${POSTGRES_DB}
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    volumes:
      # Persistent volume: database data must survive container recreation.
      - postgres_data:/var/lib/postgresql/data
    # Do not publish 5432 to the public host unless explicitly required.
    # Other Compose services can reach PostgreSQL using the service name: postgres
    restart: unless-stopped
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB}"]
      interval: 10s
      timeout: 5s
      retries: 5

volumes:
  postgres_data:
