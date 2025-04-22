# 📝 Commit Standard

This document outlines our internal commit message standard, designed to improve clarity, automation, and collaboration across teams. It is based on the [Conventional Commits](https://www.conventionalcommits.org/) specification and extended with ergonomic conventions that support semantic versioning, CI/CD workflows, changelogs, and more.

---

## 📌 Structure

A commit message consists of:

```xml
<type>(scope): <summary>

- <bullet describing what changed>
- <bullet describing why or how, if relevant>

BREAKING CHANGE: <optional breaking change description>
<metadata @key:value>
```

Notes:

- **Scope** is optional but recommended.
- **BREAKING CHANGE** is optional but must appear before any metadata.
- **Metadata** are prefixed with `@` and placed on the final line.

---

## ✅ Accepted Commit Types

| Type       | Purpose                                                            |
|------------|--------------------------------------------------------------------|
| `feat`     | Introduces a new feature                                           |
| `fix`      | Fixes a bug                                                        |
| `chore`    | Routine tasks: configs, build scripts, formatting, etc.            |
| `refactor` | Code change that neither fixes a bug nor adds a feature            |
| `test`     | Adding or updating tests                                           |
| `style`    | Code style or formatting changes                                   |
| `perf`     | Performance improvements                                           |
| `revert`   | Reverts a previous commit                                          |
| `repo`     | Changes to the repository itself (e.g. .gitignore,  git hooks)     |
| `ci`       | CI/CD pipeline and build-related changes                           |
| `ai`       | AI agent instructions, prompts, workflows, or configuration files  |
| `docs`     | Documentation of the source code or solutions provided in the repo |
| `learn`    | Documentation related to research                                  |

> Note: If the commit has [multiple types](#clarification-on-commit-types-with-mixed-changes), use the most relevant one. For example, if adds a feature,
and documents it, use `feat`.

---

## 🔀 Merge Commit Message Conventions

Merge commits must follow the same enhanced standard, with emphasis on clarity, semantic relevance, and tooling compatibility.

### 📥 Merge Types & Patterns

| Merge Type                  | Format Example                                              |
|-----------------------------|-------------------------------------------------------------|
| **Feature → Develop**       | `feat(auth): merge feature/auth-oauth into develop`         |
| **External PR → Develop**   | `feat(auth): merge external feature/auth-oauth into develop`|
| **Bugfix → Develop**        | `fix(api): merge bugfix/fix-null-response into develop`     |
| **Hotfix → Master/Develop** | `fix(0.3.2): apply hotfix v0.3.2 to master and develop`     |
| **Release → Master/Develop**| `release(0.4.0): finalize release v0.4.0`                   |

### 🧩 Template for Merge Commits

```xml
<type>(<scope>): merge <source> into <target>

- Summary of the branch purpose
- Optional list of key changes or areas affected
- Credit to the author of the branch (if external)

@semver:<level> @nuke:<target> @issue:<id>
```

---

## 🧩 Metadata Footer Format

All machine-readable metadata must be placed in the **footer**, on the final line(s) of the commit message. Each entry:

- Begins with `@`
- Uses a `key:value` format
- Is separated by spaces (single-line preferred)

[gitVersion]: https://gitversion.net
[gitIssues]: https://docs.github.com/en/issues/tracking-your-work-with-issues/about-issues
[azureDevOpsIssues]: https://learn.microsoft.com/en-us/azure/devops/boards/work-items/about-work-items

| Metadata Key | Purpose                                                                                       | Example                           |
|--------------|-----------------------------------------------------------------------------------------------|-----------------------------------|
| `@semver`    | Overrides [GitVersion][gitVersion] version bumping                                            | `@semver:minor`                   |
| `@issue`     | Links to relevant issues or prs (e.g. [GitHub][gitIssues], [Azure DevOps][azureDevOpsIssues]) | `@issue:#342`, `@issue:#123,#234` |
| `@nuke`      | Triggers [Nuke](https://nuke.build/) build targets in CI/CD pipelines                         | `@nuke:feature`                   |

This list is extensible — future metadata tags may be added as tooling evolves.

---

## 🔠 Format Examples

### 🟢 Minimal Commit

```text
feat(core): add login button
```

### 🟡 Typical Commit With Bullet Points

```text
fix(auth): prevent double form submission

- Added submit lock to prevent re-triggering
- Prevents rapid keypresses on Enter
```

### 🔵 Commit With Metadata Footer

```text
chore(assets): move icons to Icons folder

- Cleaned up folder structure for clarity
- Updated all import paths to match

@issue:122 @nuke:test
```

### 🔴 Commit With Breaking Change + Metadata

```text
feat(auth): implement OAuth2 provider support

- Added external identity provider integration
- Refactored login and token validation logic

BREAKING CHANGE: Existing SSO flows must be updated
@semver:minor @issue:#340,#420 @nuke:feature
```

---

### AI Type

AI agent instructions, prompts, workflows, or configuration files (e.g., `ai.*`, `*.prompt.md`, or Copilot-related files) should be committed with the `ai` type. This includes any changes to the AI agent's behavior, configuration, or instructions.

### Clarification on Commit Types with Mixed Changes

If a commit contains both documentation and code changes, the commit type should reflect the most significant change. For example:

- If the commit introduces a new feature and includes documentation for that feature, use `feat`.
- If the commit fixes a bug and includes documentation for the fix, use `fix`.
- If the commit adds, updates, renames or removes AI agent instructions, prompts, workflows, or configuration (such as ai-instructions.*, or copilot related files), use `ai`.
- For research documentation, between `docs` and `learn`, use `learn`.

The `docs` or `learn` types should only be used for commits that contain **only** documentation changes, with no other code modifications, and do not affect AI agent instructions, prompts, workflows, or configuration. They have the lowest significance. They should not be used if there are any other types of changes present.
