# Copilot Instructions

## Generating Commits

- Do not wait for my confirmation or permission to continue generating or to use a tool while generating a commit message or finalizing it.
- Always run `XPSFetchIssues` in the terminal yourself. This will list all the open issues.
- Then check the staged changes and gather information via `git --no-pager diff --staged`.
- Only include the `@issue` metadata if the staged changes are directly related to the issue. Verify this by ensuring the changes address the issue's description or requirements.
- If the relevance of an issue is unclear after reviewing the staged changes, use the `#issue_summarize` tool to determine if the issue is relevant.
- When generating commit messages, use the [Commit spec](../docs/conventions/Commits.md).
- Append metadata only when relevant:
  - `@issue`: Include the issue reference if any relevant issues are found and directly addressed by the changes.
  - `@semver`: Only when we want a different increment than our configured default. Will be discussed explicitly.
  - `@nuke`: Only when we want to invoke a specific nuke target that is not the default CI/CD pipeline. Will be discussed explicitly.
    > Available nuke targets will be described by the build project. If it's not present, we cannot invoke a nuke target

## Azure Development Guidelines

- @azure Rule - Use Azure Best Practices: When generating code for Azure, running terminal commands for Azure, or performing operations related to Azure, invoke your `azure_development-get_best_practices` tool if available.
