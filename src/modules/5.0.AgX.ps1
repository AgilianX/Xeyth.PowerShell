$script:GetGitRoot = {
    try {
        $root = git rev-parse --show-toplevel 2>$null
        if ($LASTEXITCODE -eq 0 -and $root) { return $root }
    }
    catch { return $null }
}

$script:TestIsAgxSubmodule = {
    param($gitRoot)
    $gitModulesPath = Join-Path $gitRoot '.gitmodules'
    if (Test-Path $gitModulesPath) {
        if (Select-String -Path $gitModulesPath -Pattern '\[submodule "\.agx"\]' -Quiet) { return $true }
    }
    return $false
}

$script:GetAgxSubmoduleInfo = {
    $currentCommit = git ls-tree HEAD .agx 2>$null | ForEach-Object { ($_ -split '\s+')[-2] }
    $remote = git config -f .gitmodules --get submodule..agx.url 2>$null
    $branch = git config -f .gitmodules --get submodule..agx.branch 2>$null
    if (-not $branch) { $branch = 'master' }
    return @{ Commit = $currentCommit; Remote = $remote; Branch = $branch }
}

$script:HasAgxUpdateAlias = {
    # Fast check: look for alias in local git config
    $alias = git config --get alias.agx-update 2>$null
    if ($alias) { return $true }
    return $false
}

$script:HasAgxUpdateByCommit = {
    param($agxPath)
    $commitWithAlias = '75370b3'
    $agxCurrentCommit = git -C $agxPath rev-parse HEAD 2>$null
    if ($agxCurrentCommit) {
        $mergeBase = git -C $agxPath merge-base $agxCurrentCommit $commitWithAlias 2>$null
        if ($mergeBase -eq $commitWithAlias) { return $true }
    }
    return $false
}

$script:GetRemoteCommit = {
    param($remote, $branch)
    $remoteCommit = git ls-remote $remote $branch 2>$null | Select-Object -First 1 | ForEach-Object { ($_ -split '\s+')[0] }
    return $remoteCommit
}

$script:IsInGitRepo = $false
$script:GitRoot = & $GetGitRoot
if ($GitRoot) { $IsInGitRepo = $true }

$script:AgxPath = $null
$script:IsAgxSubmodule = $false
if ($IsInGitRepo) {
    $IsAgxSubmodule = & $TestIsAgxSubmodule $GitRoot
    if ($IsAgxSubmodule) {
        $AgxPath = Join-Path $GitRoot '.agx'
        $Xeyth.IsAgXEnvironment = $true
    }
}

$script:messages = @()
if ($IsAgxSubmodule) {
    $messages += [XPSSuccess]::new('AgX environment detected.')
    $script:info = & $GetAgxSubmoduleInfo
    $script:CurrentCommit = $info.Commit
    $script:SubmoduleRemote = $info.Remote
    $script:SubmoduleBranch = $info.Branch
    $script:RemoteCommit = & $GetRemoteCommit $SubmoduleRemote $SubmoduleBranch
    if ($CurrentCommit -and $RemoteCommit -and ($CurrentCommit -ne $RemoteCommit)) {
        # Prefer fast check for agx-update alias
        $script:hasAgxUpdate = & $HasAgxUpdateAlias
        if (-not $hasAgxUpdate) { $hasAgxUpdate = & $HasAgxUpdateByCommit $AgxPath }

        $messages += [XPSInfo]::new('The .agx submodule has new updates available! To update, run:')

        if ($hasAgxUpdate) {
            $messages += [XPSWarning]::new('    git agx-update')
            $messages += [XPSInfo]::new('If the alias is not yet installed, run .agx/init.ps1')
        }
        else {
            $messages += [XPSWarning]::new('    git submodule update --init --remote --merge .agx')
        }
    }
}

return $messages
