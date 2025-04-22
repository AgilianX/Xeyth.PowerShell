# Copilot Instructions

- Use emojis sparingly and only when appropriate.
- Avoid HTML in markdown files.

## Repository

Owner: AgilianX
Repository: Xeyth.PowerShell

## Commit Generation

- For `create a commit` prompts:
  - Follow [ai.create-commit-message.prompt.md](prompts/ai.create-commit-message.prompt.md) instruction.
  - Adhere to the [Commits.md](../.agx/docs/conventions/Commits.md) specification.

## Issue Creation

- For `create a staged issue` prompts:
  - Follow [ai.create-staged-issue.prompt.md](prompts/ai.create-staged-issue.prompt.md) instruction.
  - Adhere to the [Issues.md](../.agx/docs/conventions/Issues.md) specification.

## Azure Development Guidelines

- When generating Azure code, running Azure commands, or performing Azure operations:
  - Always invoke the `azure_development-get_best_practices` tool if available.

- @azure Rule - Use Azure Best Practices: When generating code for Azure, running terminal commands for Azure, or performing operations related to Azure, invoke your `azure_development-get_best_practices` tool if available.
