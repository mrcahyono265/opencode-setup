# OpenCode Setup Kit

A portable OpenCode baseline for personal or team use. It includes a global configuration, agent instructions, reusable skills, MCP servers, and project-planning templates.

## Included

| Path | Purpose |
| --- | --- |
| `opencode.jsonc` | Enables LSP, plugins, and MCP servers. |
| `AGENTS.md` | Defines the agent's engineering workflow, planning gate, security baseline, and tool policy. |
| `skills/` | Provides reusable workflows for web, ML, architecture, security, documentation, deployment, and more. |

Enabled MCP servers:

- **Context7**: current library and framework documentation
- **Serena**: code navigation and refactoring
- **Playwright**: browser automation and UI verification
- **Codebase Memory**: repository structure and dependency analysis

Enabled plugins:

- **Ponytail**: favors the smallest correct implementation.

## Requirements

- [OpenCode](https://opencode.ai/)
- `uvx` for Serena
- Node.js and `npx` for Playwright
- `codebase-memory-mcp` available on `PATH`
- A Context7 API key if you want to use Context7

The configuration works on Windows and Linux. Windows resolves `codebase-memory-mcp` to its `.exe` through `PATH`.

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
Copy-Item .\opencode.jsonc, .\AGENTS.md $config
Copy-Item .\skills (Join-Path $config "skills") -Recurse
```

```bash
# Linux, Bash, or Zsh
mkdir -p ~/.config/opencode
cp opencode.jsonc AGENTS.md ~/.config/opencode/
cp -R skills ~/.config/opencode/
```

If you already use OpenCode, do not overwrite your setup. Merge the relevant entries from `opencode.jsonc`, review and merge `AGENTS.md`, then copy only skill folders that do not conflict with your own.

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

## How It Works

The bundled workflows follow a consistent sequence: understand the task, establish project context, plan, get approval, implement, verify, then document meaningful changes. They use MCP tools only when those tools add value.

References under `skills/*/references/` serve different purposes: project-planning templates, deployment-file templates, security review checklists, and writing guidance. Read only the references relevant to the current task.

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

This repository does not currently declare a root license. The bundled Stop Slop skill retains its own license at `skills/stop-slop/LICENSE`.
