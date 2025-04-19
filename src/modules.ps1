# -----------------------------------------------
# Xeyth PowerShell Module Scripts
# Loads all module scripts from `xeyth/modules`
#
# File prefix meaning (eg. {prefix}.PsReadLine.ps1)
# 0.* - Global Constants / Shared Values
# 1.* - Core
# 2.* - Tools
# 3.* - Completions
# 4.* - Theme
# -----------------------------------------------

# Load and source each *.ps1 bootstrap script
XPSLoadScripts -directoryPath $Xeyth.XPS.Paths.Modules -description "profile scripts"
if ($Xeyth.XPS.Config.RunTests) { XPSLoadScripts -directoryPath $Xeyth.XPS.Paths.Tests -description "test scripts" } 