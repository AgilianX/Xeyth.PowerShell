# -----------------------------------------------
# Xeyth PowerShell XPS Loading
# -----------------------------------------------

foreach ($module in Get-ChildItem -Path $Xeyth.XPS.Paths.XPS -Filter "*.psd1" | Sort-Object FullName) {
    Import-Module $module -Force
} 