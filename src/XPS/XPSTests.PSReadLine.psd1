@{
    RootModule = 'XPSTests.PSReadLine.psm1'
    ModuleVersion = '0.1.0'
    GUID = 'a1b2c3d4-e5f6-4a5b-8c7d-9e0f1a2b3c4d'
    Author = 'Xeyth'
    CompanyName = 'Xeyth'
    Copyright = '(c) 2025 Xeyth. All rights reserved.'
    Description = 'Test module for PSReadLine functionality in the Xeyth framework'
    PowerShellVersion = '7.0'
    FunctionsToExport = @(
        'Test-PsReadLineTokenColors'
    )
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('Xeyth', 'PSReadLine', 'Testing')
            ProjectUri = 'https://github.com/xeyth/Xeyth.PowerShell'
        }
    }
    RequiredModules = @()
    RequiredAssemblies = @()
    ScriptsToProcess = @()
    TypesToProcess = @()
    FormatsToProcess = @()
}
