[CmdletBinding()]
param(
  [string]$EnvFile = (Join-Path $PSScriptRoot "..\.env")
)

$required = @(
  'CONTEXT7_API_KEY',
  'GPTIMAGE_DIR',
  'MYSQL_MCP_PORT',
  'MYSQL_MCP_USER',
  'MYSQL_MCP_PASSWORD',
  'POSTGRES_MCP_URI'
)

if (-not (Test-Path -LiteralPath $EnvFile -PathType Leaf)) {
  throw "Environment file not found: $EnvFile. Copy .env.example to .env first."
}

$values = @{}
foreach ($line in Get-Content -LiteralPath $EnvFile) {
  $line = $line.Trim()
  if (-not $line -or $line.StartsWith('#')) { continue }

  if ($line -notmatch '^([A-Za-z_][A-Za-z0-9_]*)=(.*)$') {
    throw "Invalid .env entry: $line"
  }

  $key = $Matches[1]
  $value = $Matches[2]
  if ($key -notin $required) { throw "Unsupported .env variable: $key" }
  if ($value.Length -ge 2 -and $value[0] -eq $value[-1] -and $value[0] -in "'", '"') {
    $value = $value.Substring(1, $value.Length - 2)
  }
  if ([string]::IsNullOrWhiteSpace($value)) { throw "Missing value for $key" }
  $values[$key] = $value
}

$missing = $required | Where-Object { -not $values.ContainsKey($_) }
if ($missing) { throw "Missing required variables: $($missing -join ', ')" }

foreach ($key in $required) {
  [Environment]::SetEnvironmentVariable($key, $values[$key], 'User')
  Set-Item -Path "Env:$key" -Value $values[$key]
}

Write-Host 'Saved OpenCode variables to the current and Windows user environments. Restart OpenCode to apply them to its service.'
