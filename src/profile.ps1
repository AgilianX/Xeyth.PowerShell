# -----------------------------------------------
# Xeyth PowerShell Profile
# -----------------------------------------------

# Initialize the global Xeyth object
$global:Xeyth = @{ XPS = @{ } }

# Load paths and configuration
. (Join-Path -Path $PSScriptRoot -ChildPath 'paths.ps1')
. (Join-Path -Path $Xeyth.XPS.Paths.Root -ChildPath 'configuration.ps1')

# Load core modules
. (Join-Path -Path $Xeyth.XPS.Paths.Root -ChildPath 'types.ps1')
. (Join-Path -Path $Xeyth.XPS.Paths.Root -ChildPath 'security.ps1')
. (Join-Path -Path $Xeyth.XPS.Paths.Root -ChildPath 'xps.ps1')
. (Join-Path -Path $Xeyth.XPS.Paths.Root -ChildPath 'modules.ps1')

if ($Xeyth.IsAgXEnvironment) {
    Write-Host 'AgX environment detected.' -ForegroundColor Cyan
}
