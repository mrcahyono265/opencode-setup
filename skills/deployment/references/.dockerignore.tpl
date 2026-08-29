# Dependencies / caches
node_modules
.venv
venv
__pycache__
.pytest_cache
.mypy_cache
.cache

# Environment / secrets
.env
.env.*
!.env.example
*.pem
*.key

# VCS / editor
.git
.gitignore
.vscode
.idea

# Logs / local artifacts
*.log
coverage
htmlcov

# OS files
.DS_Store
Thumbs.db

# TODO: Add project-specific build output, datasets, model artifacts,
# generated files, and local tooling that must not enter the Docker context.
