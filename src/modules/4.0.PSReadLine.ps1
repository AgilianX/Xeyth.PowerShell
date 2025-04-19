# Public requirement check
XPSRequireModule PSReadLine

# Script-scoped token colors
$script:TokenColors = @{
    Command          = [ConsoleColor]::Yellow
    Parameter        = [ConsoleColor]::DarkCyan
    String           = [ConsoleColor]::DarkGreen
    Number           = [ConsoleColor]::Magenta
    Operator         = [ConsoleColor]::DarkBlue
    Variable         = [ConsoleColor]::DarkMagenta
    Type             = [ConsoleColor]::Cyan 
    Comment          = [ConsoleColor]::DarkGreen
    Keyword          = [ConsoleColor]::Blue
    Error            = [ConsoleColor]::Red       
    Member           = [ConsoleColor]::Gray
    Emphasis         = [ConsoleColor]::DarkYellow 
    InlinePrediction = [ConsoleColor]::DarkGray   
    Default          = [ConsoleColor]::White      
}

# Script-scoped PSReadLine options
$script:PsReadLineOptions = @{
    PredictionSource     = 'HistoryAndPlugin'
    PredictionViewStyle  = 'ListView'
    Colors              = $TokenColors
}

# Configure PSReadLine
Set-PSReadLineOption @PsReadLineOptions
