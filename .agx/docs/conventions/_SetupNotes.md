# ⚙️ DevOps Project Setup Notes

This document tracks **non-obvious implementation details**, configuration caveats, and integration gotchas when setting up GitFlow, GitVersion, and CI/CD automation. Use this as a reference when bootstrapping future projects.

- 🚫 [Preventing Direct Pushes to Main Branches][branch-protection]
- 🛠️ [GitFlow + GitVersion: Descriptive Hotfix Branches](#descriptive-hotfix-branches)

---

## Preventing Direct Pushes to Main Branches

[branch-protection]: #preventing-direct-pushes-to-main-branches

**Why:**

- To enforce the use of GitFlow and Nuke targets, and avoid accidental changes to protected branches like `master`.

**Our Convention:**

- Add branch protection rules in GitHub or Azure DevOps:
  - Require pull requests for `master`
  - Require status checks to pass (e.g., CI builds)
  - Optionally block force pushes and direct commits

**CI/CD:**

- If needed, enforce usage of Nuke targets via commit messages or CI scripts.
- Auto-trigger Nuke targets based on [commit message metadata](Commits.md) (e.g., `@nuke:feature`, `@nuke:hotfix`).

---

## Descriptive Hotfix Branches

**Issue:**

- When running `git flow hotfix start descriptive-name`, the default finish command:

  ```bash
  git flow hotfix finish descriptive-name
  ```

  will create a tag named `descriptive-name`, not a semantic version (e.g., `0.2.1`).

**Impact:**

- GitVersion relies on SemVer tags (like `0.2.1`) to properly compute versioning for the `main/master` branch.

**Our Convention:**

- We use descriptive names for hotfix branches.
- Instead of `git flow hotfix finish`, we use the `Hotfix` target from the `Xeyth.Nuke` package via `IUseGitFlow`.

**The `Hotfix` Nuke target performs:**

- Merges the hotfix into `master`
- Merges the hotfix into `develop`
- Checks out `master`
- Uses GitVersion to determine SemVer (e.g., `1.0.1`)
- Creates and pushes the version tag
- Pushes `master` and `develop` branches

**When to use:**

- After creating and pushing your hotfix branch and running CI.

**To run manually:**

```bash
nuke Hotfix
```

---
