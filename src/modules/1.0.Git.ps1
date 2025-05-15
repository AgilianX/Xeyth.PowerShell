# Private class for Git editor configuration
$script:GitEditor = class GitEditor {
	[ValidateNotNullOrEmpty()][string]$Tool
	[ValidateNotNullOrEmpty()][string]$Info

	GitEditor([string]$tool, [string]$info) {
		$this.Tool = $tool
		$this.Info = $info
	}
}

# Private helper function - determines appropriate editor based on environment
$script:GetGitEditorBasedOnEnvironment = {
	param([string]$parent)
	switch -Regex ($parent) {
		{ $_ -match 'Code - Insiders' } { return [GitEditor]::new('code-insiders --wait', 'VS Code Insiders') }
		{ $_ -match 'Code' } { return [GitEditor]::new('code --wait', 'VS Code') }
		{ $_ -match 'Cursor' } { return [GitEditor]::new('cursor --wait', 'Cursor') }
		{ $_ -match 'rider64' } { return [GitEditor]::new('nano', 'nano (via Rider)') }
		{ $_ -match 'ServiceHub.Host' } { return [GitEditor]::new('nano', 'nano (via Visual Studio)') }
		default { return [GitEditor]::new('nano', 'nano (default)') }
	}
}

# Private function - sets environment variable for Git editor
$script:SetGitEditorEnvironmentVariable = {
	$parent = (Get-Process -Id $PID).Parent.ProcessName
	$editor = & $GetGitEditorBasedOnEnvironment $parent

	$env:XEYTH_GIT_EDITOR = $editor.Tool
	return [XPSSuccess]::new("Environment editor: $($editor.Info)")
}

# Private function - configures Git editor
$script:SetGitEditor = {
	$getEditorScript = "`"$(Resolve-Path "$PSScriptRoot\.git-editor\GetEditor.cmd")`""
	$currentEditor = git config --global --get core.editor

	if ($currentEditor -ne $getEditorScript) {
		# Escape backslashes and wrap in quotes for Git config
		# $escapedPath = $getEditorScript.Path.Replace('\', '\\')
		git config --global core.editor $getEditorScript
		$displayPath = $getEditorScript -replace [regex]::Escape($env:USERPROFILE), '$USERPROFILE'
		return "git core.editor set to `"$displayPath`""
	}
}

# Public requirement checks
XPSRequireCommand git 'https://git-scm.com/downloads'
XPSRequireCommand nano "`nchoco install -y nano`nwinget install GNU.Nano"

# Public configuration
return XPSConfigure @( { & $SetGitEditor }, { & $SetGitEditorEnvironmentVariable })
