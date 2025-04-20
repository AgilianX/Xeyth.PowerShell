if (Get-Module XPSGitHub) { return }

# Update the GetGitHubToken function to trim the token
$script:GetGitHubToken = {
    $TokenFilePath = '.xeyth\.GitHubApiToken'
    if (Test-Path $TokenFilePath) {
        return (Get-Content -Path $TokenFilePath -ErrorAction Stop | Out-String).Trim()
    }
    else {
        throw ".GitHubApiToken file not found at $TokenFilePath. Please create the file and add your GitHub API token."
    }
}

# Automatically determine the owner and repository name from the Git remote URL
$script:GetRepositoryDetails = {
    $GitConfig = git config --get remote.origin.url
    if ($GitConfig -match 'github.com[:/](.+?)/(.+?)(\.git)?$') {
        return @{ Owner = $Matches[1]; Repo = $Matches[2] }
    }
    else {
        throw 'Unable to determine repository details from Git configuration.'
    }
}

# Fetch issues from the GitHub repository
Function XPSFetchIssues {
    [CmdletBinding()]
    $Token = & $GetGitHubToken
    $Headers = @{ Authorization = "token $Token"; Accept = 'application/vnd.github.v3+json' }

    $RepoDetails = & $GetRepositoryDetails
    $Owner = $RepoDetails.Owner
    $Repo = $RepoDetails.Repo
    $Url = "https://api.github.com/repos/$Owner/$Repo/issues"

    $Response = Invoke-RestMethod -Uri $Url -Headers $Headers -Method Get

    if ($Response) {
        Write-Output "Issues in $Owner/$Repo`:"
        foreach ($Issue in $Response) {
            Write-Output "#$($Issue.number): $($Issue.title)"
        }
    }
    else {
        Write-Error 'Failed to fetch issues.'
    }
}
