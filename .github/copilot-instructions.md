# Copilot Instructions

## Repository

Owner: AgilianX
Repository: Xeyth.PowerShell

## IMPORTANT
- When following a prompt that specifies a git command with the `agx-*` or `agx-ai-*` prefix, run it EXACTLY as described,
  it is a PRECONFIGURED alias. Never modify it, never add arguments to it.
  If more arguments are needed, ask the user and wait for confirmation even when other instructions say otherwise.
- If GPG Signing fails, do not attempt to fix it automatically. Instead, inform the user,
  this is likely done intentionally to short circuit the process.
- Never `push` or `pull` without user confirmation.
  Always ask the user for confirmation before executing these commands.

## Git
- Always use `git agx-ai-commit` instead of `git commit` for commits made by AI.
  A draft of the commit message must be generated before running the command.
- Follow the [Commit Specification](../.agx/docs/conventions/Commits.md) for commit messages.
- When running ai workflows with git submodules, check the location of the terminal if a command fails and try again.
- When running a workflow for a submodule, change into the submodule directory and run the workflow there.

## Documentation
- Use emojis sparingly and only when appropriate.
- Avoid HTML in markdown files.
- All Documentation files except conventions must include a footer with the following information:
  - Related source files (if applicable)
