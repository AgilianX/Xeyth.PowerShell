XPSRequireCommand gpg

# Set GPG_TTY environment variable in PowerShell
$env:GPG_TTY = [System.Console]::OpenStandardInput().Handle