# Repository Aliases Installation Script for Windows
#
# This script installs Git aliases from a shared aliases file
# Usage: .\install-aliases.ps1 [path\to\aliases\file]

# Determine repository root
try { git rev-parse --show-toplevel > $null }
catch {
    Write-Host '❌ Error: Not in a Git repository' -ForegroundColor Red
    exit 1
}

# Count existing Git-AgX aliases
$existingCount = 0
$existingAliases = git config --get-regexp '^alias\.agx-' | ForEach-Object { $_.Split(' ')[0].Substring(6) }
$existingCount = $existingAliases.Count
if ($existingCount -ne 0) { Write-Host "ℹ️  $existingCount Git-AgX aliases already configured" -ForegroundColor Cyan }

# Get the aliases file path
$ALIASES_FILE = if ($args[0]) { $args[0] } else { Join-Path $REPO_ROOT '.agx\aliases\agx.aliases' }
if (-not (Test-Path $ALIASES_FILE)) {
    Write-Host "❌ Error: Aliases file not found at $ALIASES_FILE" -ForegroundColor Red
    exit 1
}

# Read the aliases file line by line
$count = 0
foreach ($line in Get-Content $ALIASES_FILE) {
    # Skip empty lines and comments
    if ([string]::IsNullOrWhiteSpace($line) -or $line.StartsWith('#')) { continue }

    # Parse the alias name and value
    $parts = $line -split ':', 2
    if ($parts.Length -ne 2) {
        Write-Host "⚠️ Warning: Invalid alias definition: $line" -ForegroundColor Yellow
        continue
    }

    $ALIAS_NAME = $parts[0].Trim()
    $ALIAS_VALUE = $parts[1].Trim()

    if ([string]::IsNullOrWhiteSpace($ALIAS_NAME) -or [string]::IsNullOrWhiteSpace($ALIAS_VALUE)) {
        Write-Host "⚠️ Warning: Invalid alias definition: $line" -ForegroundColor Yellow
        continue
    }

    # Check if the alias exists and update if different
    $CURRENT_VALUE = git config --local --get "alias.$ALIAS_NAME" 2>$null

    if (-not $CURRENT_VALUE) {
        Write-Host "✅ Setting Git alias: $ALIAS_NAME -> $ALIAS_VALUE" -ForegroundColor Green
        git config --local "alias.$ALIAS_NAME" $ALIAS_VALUE
        $count++
    }
    elseif ($CURRENT_VALUE -ne $ALIAS_VALUE) {
        Write-Host "🔄 Updating Git alias: $ALIAS_NAME -> $ALIAS_VALUE" -ForegroundColor Blue
        git config --local "alias.$ALIAS_NAME" $ALIAS_VALUE
        $count++
    }
}

if ($count -ne 0) { Write-Host "✅ $count Git-AgX aliases installed successfully" -ForegroundColor Green }
