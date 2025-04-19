using namespace System.Collections
using namespace System.Collections.Generic

if (Get-Module XPSConfiguration) { return }

$script:LogXPSConfiguration =  { [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][scriptblock]$Action,
        [Parameter()][List[XPSMessage]]$Messages
    )

    try {
        $actionOutput = $Action.Invoke() # always returns a collection via scriptblock
        if ($actionOutput.Count -eq 0) { return }
        foreach ($message in $actionOutput.GetEnumerator()) {
            switch ($true) {
                { $message -is [XPSMessage] } { $Messages.Add($message) }
                { $message -is [string] }     { $Messages.Add([XPSSuccess]::new($message)) }
                default                       { $Messages.Add([XPSInfo]::new($message.ToString())) }
            }
        }
    } catch { $Messages.Add([XPSError]::new("Error executing ${Action}: $_")) }
}

function XPSConfigure { [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)][ValidateNotNull()][scriptblock[]]$Actions
    )
    
    [List[XPSMessage]]$Messages = [List[XPSMessage]]::new()
    foreach ($action in $Actions) { & $script:LogXPSConfiguration -Action $action -Messages $Messages }
    return $Messages
}

function XPSRequireFont { [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$FontName,
        [Parameter(Mandatory = $false)][string]$helpUrl
    )

    $fonts = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts'
    $found = $fonts.PSObject.Properties.Name |
        Where-Object { $_ -like "*$FontName*" }

    $condition = $null -ne $found
    XPSRequire -condition $condition -message "Required font '$FontName' not found." -helpUrl $helpUrl
    return 
}

function XPSRequireCommand { [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$command,
        [Parameter(Mandatory = $false)][string]$helpUrl
    )

    $exists = $null -ne (Get-Command $command -ErrorAction SilentlyContinue)
    XPSRequire -condition $exists -message "Required command '$command' not found." -helpUrl $helpUrl 
}

function XPSRequireModule { [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$module,
        [Parameter(Mandatory = $false)][string]$helpUrl
    )

    $exists = $null -ne (Get-Module -ListAvailable -Name $module)
    XPSRequire -condition $exists -message "Required module '$module' not found." -helpUrl $helpUrl 
}

function XPSRequire { [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][bool]$condition,
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$message,
        [Parameter(Mandatory = $false)][string]$helpUrl
    )
    
    if ($condition) { return }

    $errorMessage = "[⚠️ MISSING] $message"
    if ($null -ne $helpUrl) { $errorMessage += "`n`nInstall: $helpUrl`n" }

    throw $errorMessage
}

function XPSLoadScripts { [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$directoryPath,
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$description
    )
    
    if ( -not (Test-Path $directoryPath)) { return }
    
    Write-Host "Loading $description..." -ForegroundColor DarkGray
    $scripts = Get-ChildItem -Path $directoryPath -Filter "*.ps1" | Sort-Object FullName

    foreach ($script in $scripts) {
        if ($global:XeythLoadedScripts -contains $script.FullName) { continue }
        $bootStrapScript = [XPSBootstrapScript]::new($script)

        try {
            # If the script is marked as downloaded from the internet, unblock it. (These files live in a repository for easy setup across machines)
            if (Test-Path "$($script.FullName):Zone.Identifier") { Unblock-File $script.FullName }
            
            $bootStrapScript.Run()
            $global:XeythLoadedScripts += $script.FullName

        } catch { $bootStrapScript.AddError($_.Exception.Message) }
        $bootStrapScript.WriteToHost()
    }
}