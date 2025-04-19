# -----------------------------------------------
# Xeyth PowerShell Profile Paths
# Defines all relevant paths used in the profile
# -----------------------------------------------

# Base paths for the Xeyth module
$script:XeythRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Module-related paths
$script:XPSPath = Join-Path -Path $XeythRoot -ChildPath "XPS"
$script:ModulesPath = Join-Path -Path $XeythRoot -ChildPath "modules"
$script:TestsPath = Join-Path -Path $ModulesPath -ChildPath "tests"

# Initialize the Paths property in the global Xeyth object
$Xeyth.XPS.Paths = @{
    Root = $XeythRoot
    XPS = $XPSPath
    Modules = $ModulesPath
    Tests = $TestsPath
} 