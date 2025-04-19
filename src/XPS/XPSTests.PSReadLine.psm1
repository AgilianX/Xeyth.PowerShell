
if (-not($global:Xeyth.Config.EnableTests)) { return }
if (Get-Module XPSTests.PSReadLine) { return }

Write-Host "PSReadLine Tests Module loaded"

# Public function to test token colors
function Test-PsReadLineTokenColors { [CmdletBinding()]
    param()
    
    $TestCases = @(
        @{ Text = "# Comment"; Type = "Comment" }
        @{ Text = "'String Literal'"; Type = "String" }
        @{ Text = "42"; Type = "Number" }
        @{ Text = "=, +, -"; Type = "Operator" }
        @{ Text = "`$value"; Type = "Variable" }
        @{ Text = "[string], [int]"; Type = "Type" }
        @{ Text = "if, else, function"; Type = "Keyword" }
        @{ Text = "Write-Host"; Type = "Command" }
        @{ Text = "-Path, -Recurse"; Type = "Parameter" }
        @{ Text = ".ToString(), .Length"; Type = "Member" }
        @{ Text = "🔥 ERROR!"; Type = "Error" }
        @{ Text = "!!!Important!!!"; Type = "Emphasis" }
        @{ Text = "Ghost text prediction"; Type = "InlinePrediction" }
        @{ Text = "This is plain text"; Type = "Default" }
    )
    
    # Display test cases
    $TestCases | ForEach-Object {
        Write-Host $_.Text -ForegroundColor $script:TokenColors[$_.Type]
    }
}