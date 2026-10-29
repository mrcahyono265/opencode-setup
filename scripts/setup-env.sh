#!/usr/bin/env bash
# Source this script: source ./scripts/setup-env.sh

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  echo "Source this script instead: source ./scripts/setup-env.sh" >&2
  exit 1
fi

set -euo pipefail

env_file="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/.env}"
required=(CONTEXT7_API_KEY GPTIMAGE_DIR MYSQL_MCP_PORT MYSQL_MCP_USER MYSQL_MCP_PASSWORD POSTGRES_MCP_URI)

if [[ ! -f "$env_file" ]]; then
  echo "Environment file not found: $env_file. Copy .env.example to .env first." >&2
  return 1
fi

while IFS= read -r line || [[ -n "$line" ]]; do
  line="${line%$'\r'}"
  [[ -z "$line" || "$line" == \#* ]] && continue
  [[ "$line" == *=* ]] || { echo "Invalid .env entry: $line" >&2; return 1; }

  key="${line%%=*}"
  value="${line#*=}"
  case "$key" in
    CONTEXT7_API_KEY|GPTIMAGE_DIR|MYSQL_MCP_PORT|MYSQL_MCP_USER|MYSQL_MCP_PASSWORD|POSTGRES_MCP_URI) ;;
    *) echo "Unsupported .env variable: $key" >&2; return 1 ;;
  esac
  if [[ ${#value} -ge 2 && ( "${value:0:1}" == '"' && "${value: -1}" == '"' || "${value:0:1}" == "'" && "${value: -1}" == "'" ) ]]; then
    value="${value:1:${#value}-2}"
  fi
  [[ -n "$value" ]] || { echo "Missing value for $key" >&2; return 1; }
  export "$key=$value"
done < "$env_file"

for key in "${required[@]}"; do
  [[ -n "${!key:-}" ]] || { echo "Missing required variable: $key" >&2; return 1; }
done

target="$HOME/.config/opencode/env.sh"
mkdir -p "$(dirname "$target")"
umask 077
{
  echo '# Generated from .env by scripts/setup-env.sh. Do not commit this file.'
  for key in "${required[@]}"; do
    printf 'export %s=%q\n' "$key" "${!key}"
  done
} > "$target"
chmod 600 "$target"

echo "Variables loaded for this shell and saved to $target. Add 'source $target' to your shell profile before starting OpenCode."
