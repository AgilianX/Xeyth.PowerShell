# Public requirement check
XPSRequireCommand "oh-my-posh" "e.g. 'scoop install oh-my-posh'`nYou can use scoop or choco for Windows`nhttps://ohmyposh.dev/docs"
XPSRequireFont "meslo" "oh-my-posh font install meslo`nSet your terminal to use 'MesloLGM Nerd Font'`nhttps://ohmyposh.dev/docs/fonts"

$script:configFile = Join-Path -Path $Xeyth.XPS.Paths.Modules -ChildPath ".oh-my-posh\theme.json"

try {
	# First attempt: Try to initialize and invoke directly
	oh-my-posh init pwsh --config $configFile | Invoke-Expression
} catch {
	# Second attempt: If direct invocation fails, create and invoke a script block
	& ([ScriptBlock]::Create((oh-my-posh init pwsh --config $configFile --print) -join "`n"))
}
