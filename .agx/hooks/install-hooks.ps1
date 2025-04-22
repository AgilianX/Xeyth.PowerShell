# Ensure the script is executed within a Git repository
try {
    git rev-parse --show-toplevel > $null
}
catch {
    Write-Host 'Error: Not in a Git repository' -ForegroundColor Red
    exit 1
}

# Configure Git to use .agx/hooks as the hooks directory
Write-Host 'Configuring Git to use .agx/hooks as the hooks directory...' -ForegroundColor Cyan
git config --local core.hooksPath .agx/hooks

Write-Host 'Git hooks installed successfully!' -ForegroundColor Green
