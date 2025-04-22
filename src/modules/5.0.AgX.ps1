# Check if we are in a git repository
$IsInGitRepo = $false
$GitRoot = $null
try {
    $GitRoot = git rev-parse --show-toplevel 2>$null
    if ($LASTEXITCODE -eq 0 -and $GitRoot) { $IsInGitRepo = $true }
}
catch { $IsInGitRepo = $false }

$HasAgxDir = ($IsInGitRepo -and (Test-Path (Join-Path $GitRoot '.agx')))

if ($HasAgxDir) { $Xeyth.IsAgXEnvironment = $true }
