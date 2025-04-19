param (
    [string]$RepoPath = "$HOME\source\repos\Xeyth.PowerShell"
)

# Ensure the repo exists or clone it
if (-not (Test-Path $RepoPath)) {
    Write-Host "Cloning PowerShell config repo to: $RepoPath" -ForegroundColor Cyan
    git clone https://github.com/Xeythhhh/Xeyth.PowerShell $RepoPath
} else {
    Write-Host "Using existing repo path: $RepoPath" -ForegroundColor Green
}

# Check and backup existing $PROFILE if it has content
if ((Test-Path $PROFILE) -and ((Get-Content $PROFILE -ErrorAction SilentlyContinue | Where-Object { $_.Trim() -ne "" }))) {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backupPath = "$PROFILE.$timestamp.bak"
    Write-Host "Backing up existing profile to: $backupPath" -ForegroundColor Yellow
    Copy-Item $PROFILE $backupPath -Force
}

# Ensure profile file exists
if (-not (Test-Path $PROFILE)) {
    New-Item -Path $PROFILE -ItemType File -Force | Out-Null
}

# Write new bootstrap content
$script:bootstrapLine = ". `"$RepoPath\src\profile.ps1`""
Set-Content -Path $PROFILE -Value $bootstrapLine -Force

Write-Host "`nBootstrap complete!" -ForegroundColor Green