# -----------------------------------------------
# Xeyth PowerShell Configuration
# -----------------------------------------------

$script:ConfigPath = Join-Path -Path $Xeyth.XPS.Paths.Root -ChildPath ".xeyth"
if (-not (Test-Path $ConfigPath)) { New-Item -ItemType File -Path $ConfigPath -Force | Out-Null }
$Xeyth.XPS.Config = Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json