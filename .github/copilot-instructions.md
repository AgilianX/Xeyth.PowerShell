# Copilot Instructions

## Azure Development Guidelines

- @azure Rule - Use Azure Best Practices: When generating code for Azure, running terminal commands for Azure, or performing operations related to Azure, invoke your `azure_development-get_best_practices` tool if available.

## Commits

- When generating commit messages use the  [Commit spec](../docs/conventions/Commits.md).
- Append metadata only when relevant
  - `@issue` when we are working on an issue.
  - `@semver` only when we want a different increment than our configured default. Will be discussed explicitly
  - `@nuke` only when we want to invoke a specific nuke target that is not the default CI/CD pipeline. Will be discussed explicitly
    > Available nuke targets will be descibed by the build project, if it's not present, we can not invoke a nuke target
