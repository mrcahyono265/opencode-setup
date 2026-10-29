# OpenCode Setup Kit

A portable OpenCode baseline for personal or team use. It includes a global configuration, agent instructions, reusable skills, MCP servers, and project-planning templates.

## Included

| Path | Purpose |
| --- | --- |
| `opencode.jsonc.example` | Example configuration that enables LSP, plugins, and MCP servers. |
| `AGENTS.md` | Defines the agent's engineering workflow, planning gate, security baseline, and tool policy. |
| `skills/` | Provides reusable workflows for web, Android, ML, architecture, security, Canva deliverables, documentation, deployment, and more. |

Enabled MCP servers:

- **Context7**: current library and framework documentation
- **Serena**: code navigation and refactoring
- **Playwright**: browser automation and UI verification
- **Codebase Memory**: repository structure and dependency analysis
- **Canva**: editable visual deliverables and design operations
- **MySQL**: local development database DDL and DML
- **PostgreSQL**: local development database DDL and DML

Enabled plugins:

- **Ponytail**: favors the smallest correct implementation.

## Requirements

- [OpenCode](https://opencode.ai/)
- `uvx` for Serena
- Node.js and `npx` for Playwright
- `codebase-memory-mcp` available on `PATH`
- A Context7 API key
- A local GptImage checkout, configured through `GPTIMAGE_DIR`
- Local MySQL and PostgreSQL development instances, configured through environment variables

The configuration works on Windows and Linux. All MCP servers connect automatically. OpenCode reports a failed connection when a required executable, local service, or environment variable is unavailable; finish the setup below before using the template.

## Installation

Clone this repository anywhere:

```bash
git clone <repository-url>
cd agent_setup
```

OpenCode's global setup directory is:

| Platform | Directory |
| --- | --- |
| Windows | `%USERPROFILE%\.config\opencode` |
| Linux | `~/.config/opencode` |

For a new OpenCode setup, copy the configuration, instructions, and skills:

```powershell
# Windows PowerShell
$config = Join-Path $HOME ".config\opencode"
New-Item -ItemType Directory -Force -Path $config
Copy-Item .\opencode.jsonc.example (Join-Path $config "opencode.jsonc")
Copy-Item .\AGENTS.md $config
Copy-Item .\skills (Join-Path $config "skills") -Recurse
```

```bash
# Linux, Bash, or Zsh
mkdir -p ~/.config/opencode
cp opencode.jsonc.example ~/.config/opencode/opencode.jsonc
cp AGENTS.md ~/.config/opencode/
cp -R skills ~/.config/opencode/
```

If you already use OpenCode, do not overwrite your setup. Merge the relevant entries from `opencode.jsonc.example`, review and merge `AGENTS.md`, then copy only skill folders that do not conflict with your own.

## Environment Variables

OpenCode reads variables from its process environment; it does not load `.env` files itself. This repository includes an ignored local `.env` workflow that imports the values into the environment OpenCode uses. Do not commit secrets, passwords, or a local `.env` file.

| Variable | Used by |
| --- | --- |
| `CONTEXT7_API_KEY` | Context7 |
| `GPTIMAGE_DIR` | GptImage checkout directory |
| `MYSQL_MCP_PORT` | MySQL MCP |
| `MYSQL_MCP_USER` | MySQL MCP |
| `MYSQL_MCP_PASSWORD` | MySQL MCP |
| `POSTGRES_MCP_URI` | PostgreSQL MCP |

### Import a local `.env`

Copy `.env.example` to `.env`, fill every value, then import it for your platform.

```powershell
# Windows PowerShell
Copy-Item .env.example .env
# Edit .env, then:
.\scripts\setup-env.ps1
opencode service restart
```

The PowerShell script saves variables to the current shell and Windows user environment.

```bash
# Linux, Bash, or Zsh
cp .env.example .env
# Edit .env, then:
source ./scripts/setup-env.sh
```

The shell script loads variables for the current shell and writes `~/.config/opencode/env.sh`. Add the printed `source` command to your shell profile before starting OpenCode in future terminals.

## Context7

Context7 reads its API key from `CONTEXT7_API_KEY`; keep the key out of this repository and `opencode.jsonc`.

```powershell
# Windows PowerShell, current session
$env:CONTEXT7_API_KEY = "your-key"
```

```bash
# Linux, Bash, or Zsh, current session
export CONTEXT7_API_KEY="your-key"
```

Add the variable to your shell profile or operating-system environment for a persistent setup.

## GptImage

[GptImage](https://github.com/Connected-Mate/gptimage) generates images through a local MCP server using a ChatGPT subscription. Keep its clone beside the OpenCode config directory:

```text
~/.config/
├── opencode/
└── gptimage/
```

Requirements: Node.js 20 or later and a ChatGPT account with an active plan.

```powershell
# Windows PowerShell
New-Item -ItemType Directory -Force -Path "$HOME\.config"
Set-Location "$HOME\.config"
git clone https://github.com/Connected-Mate/gptimage.git
Set-Location .\gptimage
npm install
npm run login
npm run status
```

```bash
# Linux, Bash, or Zsh
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/Connected-Mate/gptimage.git
cd gptimage
npm install
npm run login
npm run status
```

Do not use GptImage's `install.sh` for OpenCode; it configures Claude Code. Set `GPTIMAGE_DIR` to the cloned repository before starting OpenCode:

```powershell
# Windows PowerShell
$env:GPTIMAGE_DIR = "$HOME\.config\gptimage"
```

```bash
# Linux, Bash, or Zsh
export GPTIMAGE_DIR="$HOME/.config/gptimage"
```

### CLI Test

Test the GptImage CLI once after installation:

```bash
npm run gen -- --prompt "minimal abstract test image" --out test.png --size 1024x1024
```

If the command succeeds, no model override is needed. If it fails because `gpt-5.5` is unavailable, retry the CLI test with `gpt-5.6-terra`:

```powershell
# Windows PowerShell
$env:GPTIMAGE_MODEL = "gpt-5.6-terra"
npm run gen -- --prompt "minimal abstract test image" --out test.png --size 1024x1024
```

```bash
# Linux, Bash, or Zsh
GPTIMAGE_MODEL="gpt-5.6-terra" npm run gen -- --prompt "minimal abstract test image" --out test.png --size 1024x1024
```

The CLI override is separate from OpenCode. If your OpenCode MCP configuration already sets `GPTIMAGE_MODEL` to `gpt-5.6-terra`, leave that setting unchanged.

GptImage uses a ChatGPT subscription token through an unofficial integration. Use it only for personal/local work and expect possible rate limits or account restrictions.

## Canva

Canva connects OpenCode to your Canva designs, assets, and exports through a remote MCP server. No API key is required.

After installing this setup, restart OpenCode. The first Canva tool use opens a browser for Canva login and consent. Each user must authenticate with their own Canva account.

Test the connection with a read-only request:

```text
Show me my most recently edited Canva design
```

Use Canva only when a task needs existing Canva assets or design operations such as creating, editing, commenting on, or exporting a design. Access follows the permissions of the connected Canva account. Some capabilities require Canva Pro or Enterprise.

If authentication cannot return to OpenCode, do not add a proxy first. Canva may require the client redirect URI to be allowed; check the reported error and Canva's MCP connection guidance.

Use the `canva-deliverables` skill for editable posters, banners, presentations, proposals, portfolios, branded one-pagers, and other client-facing visual documents. Use Markdown-based documentation for technical specifications, README files, changelogs, API documentation, and ADRs.

## Local Development Databases

The MySQL and PostgreSQL MCP servers can create, alter, and delete data and schema on local development databases. They are configured only for `127.0.0.1` and read credentials from environment variables.

Use dedicated local development users. Do not use `root`, the PostgreSQL superuser, application production credentials, or a VPS connection.

```sql
-- MySQL: run as an administrator. Repeat the grant only for local development databases the agent may use.
CREATE USER 'mcp_dev_writer'@'127.0.0.1' IDENTIFIED BY 'choose-a-local-password';
GRANT ALL PRIVILEGES ON your_local_database.* TO 'mcp_dev_writer'@'127.0.0.1';
```

```sql
-- PostgreSQL: run as an administrator. Create one local development database per project as needed.
CREATE ROLE mcp_dev_writer LOGIN PASSWORD 'choose-a-local-password';
CREATE DATABASE your_local_database OWNER mcp_dev_writer;
```

Set these variables in the shell that starts OpenCode:

```powershell
# Windows PowerShell
$env:MYSQL_MCP_PORT = "3306"
$env:MYSQL_MCP_USER = "mcp_dev_writer"
$env:MYSQL_MCP_PASSWORD = "your-local-password"
$env:POSTGRES_MCP_URI = "postgresql://mcp_dev_writer:your-local-password@127.0.0.1:5432/your_local_database"
```

```bash
# Linux, Bash, or Zsh
export MYSQL_MCP_PORT="3306"
export MYSQL_MCP_USER="mcp_dev_writer"
export MYSQL_MCP_PASSWORD="your-local-password"
export POSTGRES_MCP_URI="postgresql://mcp_dev_writer:your-local-password@127.0.0.1:5432/your_local_database"
```

The MySQL MCP runs in multi-database mode and can access only databases granted to its local MySQL user. PostgreSQL uses the database named in `POSTGRES_MCP_URI`; change that variable and restart OpenCode to work on another local project database. MySQL enables DML and DDL explicitly, and PostgreSQL uses unrestricted mode for local development. Do not set these variables on a VPS or deployment host.

## How It Works

The bundled workflows follow a consistent sequence: idea → clarification and focused brainstorming → draft `docs/plan.md` and project `AGENTS.md` → user review → approval → implementation → verification → documentation.

`docs/plan.md` is the default project Source of Truth. It keeps goals operational by recording outcome, approach, scope, and acceptance criteria. Create separate API, database, security, ML, or deployment documents only for substantial independent detail; link them from the plan and do not duplicate facts.

All MCPs stay available in one config so work can begin directly from an idea. The agent selects only the tools relevant to the current task, starts with one primary tool, and adds another only when it answers a different unanswered question.

Skills are progressive: their core guidance is concise, while deep review checklists and templates live under `skills/*/references/` and are read only for audits or substantial decisions. This preserves planning, security, accessibility, and design-quality guardrails without loading every detail for routine work.

## Usage

Restart OpenCode after changing its configuration or environment variables, then start it normally:

```bash
opencode
```

## Troubleshooting

- MCP server missing: restart OpenCode after changing its configuration.
- Local MCP server does not start: confirm its command is installed and on `PATH`.
- Context7 fails: confirm `CONTEXT7_API_KEY` is set in the shell that starts OpenCode.
- A skill does not load: confirm its folder is inside the global `skills/` directory and that its `SKILL.md` metadata is intact.

## Security

Do not commit API keys, tokens, user-specific paths, or `.env` files. Review MCP servers and skills before enabling them in a shared environment.

## License

This repository is licensed under the [MIT License](LICENSE). The bundled Stop Slop skill retains its own license at `skills/stop-slop/LICENSE`.
