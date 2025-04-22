# Repository Initialization Script for Windows
#
# This script sets up your local development environment after cloning this repository.
# It configures Git aliases, hooks, and other tools necessary for consistent development workflows.

Write-Host '📦 Initializing repository setup...' -ForegroundColor Cyan

# Determine repository root
try {
    $REPO_ROOT = git rev-parse --show-toplevel
    if ($LASTEXITCODE -ne 0) {
        throw 'Not in a Git repository'
    }
}
catch {
    Write-Host '❌ Error: Not in a Git repository' -ForegroundColor Red
    exit 1
}

# Windows doesn't require making hook files executable
Write-Host '🔧 Windows environment detected, skipping executable permissions step...' -ForegroundColor Cyan

# 1. Install Git hooks
Write-Host '🔧 Installing Git hooks...' -ForegroundColor Cyan
$installHooksPath = Join-Path $REPO_ROOT '.agx\hooks\install-hooks.ps1'
if (Test-Path $installHooksPath) {
    & $installHooksPath
}
elseif (Test-Path (Join-Path $REPO_ROOT '.agx\hooks\install-hooks.sh')) {
    Write-Host 'Using bash fallback for hook installation...' -ForegroundColor Yellow
    bash (Join-Path $REPO_ROOT '.agx\hooks\install-hooks.sh')
}
else {
    Write-Host '⚠️ Warning: Hook installation script not found' -ForegroundColor Yellow
}

# 2. Install Git aliases
Write-Host '🔧 Installing Git aliases...' -ForegroundColor Cyan
$installAliasesPath = Join-Path $REPO_ROOT '.agx\aliases\install-aliases.ps1'
if (Test-Path $installAliasesPath) {
    & $installAliasesPath
}
else {
    Write-Host '⚠️ Warning: Alias installation script not found' -ForegroundColor Yellow
}

# Verify aliases were configured properly
Write-Host '🔍 Verifying Git aliases...' -ForegroundColor Cyan
$aliasCheck = git config --local --get alias.agx-setup-test
if (-not $aliasCheck) {
    Write-Host "⚠️ Warning: Git aliases don't appear to be configured correctly" -ForegroundColor Yellow
}
else {
    Write-Host '✅ Git aliases configured successfully' -ForegroundColor Green
}

Write-Host '🎉 Repository initialization complete!' -ForegroundColor Green
$partialReadmePath = '.agx\docs\setup\README.md'
$readmePath = Join-Path $REPO_ROOT $partialReadmePath -Resolve -ErrorAction SilentlyContinue
if ($readmePath) {
    Write-Host "📚 See $readmePath for more information on repository configuration" -ForegroundColor Cyan
}
else {
    Write-Host "📚 See $partialReadmePath for more information on repository configuration" -ForegroundColor Cyan
}
