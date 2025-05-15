# -----------------------------------------------
# Xeyth PowerShell Bootstrap Types
# -----------------------------------------------
using namespace System.IO
using namespace System.Collections
using namespace System.Collections.Generic

class XPSMessage {
    [string]$Message
    [ConsoleColor]$Color

    XPSMessage([string]$message, [ConsoleColor]$color) {
        $this.Message = $message
        $this.Color = $color
    }

    [string]ToString() { return $this.Message }
}

class XPSSuccess : XPSMessage { XPSSuccess([string]$message) : base($message, [ConsoleColor]::Green) {} }
class XPSWarning : XPSMessage { XPSWarning([string]$message) : base($message, [ConsoleColor]::Yellow) {} }
class XPSError   : XPSMessage { XPSError([string]$message)   : base($message, [ConsoleColor]::Red) {} }
class XPSInfo    : XPSMessage { XPSInfo([string]$message)    : base($message, [ConsoleColor]::DarkGray) {} }

class XPSBootstrapScript {
    [FileInfo]$Script
    [List[XPSMessage]]$Messages = [List[XPSMessage]]::new()

    [XPSSuccess[]]GetSuccesses() { return $this.Messages | Where-Object { $_ -is [XPSSuccess] } }
    [XPSWarning[]]GetWarnings() { return $this.Messages | Where-Object { $_ -is [XPSWarning] } }
    [XPSError[]]GetErrors() { return $this.Messages | Where-Object { $_ -is [XPSError] } }
    [XPSInfo[]]GetInfos() { return $this.Messages | Where-Object { $_ -is [XPSInfo] } }

    [void]AddMessage([XPSMessage]$message) { $this.Messages.Add($message) }
    [void]AddSuccess([string]$message) { $this.Messages.Add([XPSSuccess]::new($message)) }
    [void]AddWarning([string]$message) { $this.Messages.Add([XPSWarning]::new($message)) }
    [void]AddError([string]$message) { $this.Messages.Add([XPSError]::new($message)) }
    [void]AddInfo([string]$message) { $this.Messages.Add([XPSInfo]::new($message)) }

    [bool]HasError() { return $this.GetErrors().Count -gt 0 }
    [bool]HasWarning() { return $this.GetWarnings().Count -gt 0 }

    XPSBootstrapScript([FileInfo]$script) { $this.Script = $script }

    [void]Run() {
        $output = . $this.Script.FullName
        if ($null -eq $output) { return }
        switch ($output) {
            { $_ -is [XPSMessage] } { $this.AddMessage($_) }
            { $_ -is [string] } { $this.AddSuccess($_) }
            default { $this.AddInfo($_.ToString()) }
        }
    }

    [void]WriteToHost() {
        # Strip ordering prefix and display information
        $scriptDisplayName = $this.Script.BaseName -replace '^\d+\.\d+\.', ''

        $symbol = '✓'
        $symbolColor = [ConsoleColor]::Green
        $color = [ConsoleColor]::DarkGray

        if ($this.HasWarning()) {
            $symbol = '⚠'
            $symbolColor = [ConsoleColor]::Yellow
            $color = [ConsoleColor]::Yellow
        }

        if ($this.HasError()) {
            $symbol = '✗'
            $symbolColor = [ConsoleColor]::Red
            $color = [ConsoleColor]::Red
        }

        Write-Host '[' -NoNewline -ForegroundColor DarkGray
        Write-Host "$symbol" -NoNewline -ForegroundColor $symbolColor
        Write-Host ']' -NoNewline -ForegroundColor DarkGray
        Write-Host " $ScriptDisplayName" -ForegroundColor $color

        $this.Messages | ForEach-Object {
            Write-Host '    > ' -ForegroundColor DarkGray -NoNewline
            Write-Host "$($_.Message)" -ForegroundColor $_.Color
        }
    }
}
