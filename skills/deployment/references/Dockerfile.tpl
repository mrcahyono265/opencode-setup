# Replace the base image and runtime version with the project's actual runtime.
# Prefer a maintained, appropriately small image.
FROM <RUNTIME_IMAGE>:<VERSION>

# Keep application files isolated from the image root.
WORKDIR /app

# TODO: Copy only dependency manifests first when the runtime supports
# dependency-layer caching (for example package.json/lockfile or requirements).
# Install production dependencies using the project's official tooling.

# TODO: Copy the application source required at runtime.
# Do not copy .env files, credentials, local caches, or development artifacts.

# TODO: Expose only the port actually used by the application.
EXPOSE <PORT>

# TODO: Prefer a non-root runtime user when practical for this stack.

# TODO: Replace with the actual production start command.
CMD ["<START_COMMAND>"]
