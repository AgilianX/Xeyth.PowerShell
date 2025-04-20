@{
    RootModule = 'XPSGitHub.psm1'
    ModuleVersion = '0.1.0'
    GUID = 'a1b2c3d4-e5f6-4a5b-8c7d-9e0f1a2b3c4d'
    Author = 'Xeyth'
    CompanyName = 'Xeyth'
    Copyright = '(c) 2025 Xeyth. All rights reserved.'
    Description = 'Provides GitHub integration for Xeyth PowerShell scripts'
    PowerShellVersion = '7.5.0'
    FunctionsToExport = @(
        'XPSFetchIssues'
    )
    CmdletsToExport = @()
    VariablesToExport = '*'
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('Xeyth', 'GitHub', 'Integration', 'XPS')
            ProjectUri = 'https://github.com/xeyth/Xeyth.PowerShell'
        }
    }
}
