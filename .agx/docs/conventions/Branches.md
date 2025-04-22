# Branching Strategy

🔗 [Git Branching Documentation](https://git-scm.com/docs/git-branch)

This document outlines our Git branching strategy to maintain a clean and efficient development workflow.

- [master](#master)
- [develop](#develop)
- [Feature Branches](#feature-branches)
- [Bugfix Branches](#bugfix-branches)
- [Hotfix Branches](#hotfix-branches)
- [Release Branches](#release-branches)
- [Documentation Branches](#docs-branches)
- [Pull Request Requirements](#pull-request-requirements)
- [Best Practices](#best-practices)

## Main Branches

### `master`

- Primary branch containing production-ready code
- Protected: requires CI/CD pipeline success
- Only accepts merges finalized via Nuke pipeline after PR review (no direct pushes)
- Tagged with semantic versions (e.g., v1.0.0)
- Merge, tag, and push are handled automatically by Nuke

### `develop`

- Integration branch for features
- Protected: requires pull request reviews for external contributions
- Local merges allowed for feature work

## Supporting Branches

> It is recommended that supporting branches merge with `--no-ff`. *(Even if this could be a fast-forward, create a merge commit anyway)*
>
> - Keeps all supporting branches visible in history
> - Allows tools like git log --graph to show actual merges
> - Helpful for code reviews, changelogs, audits, and debugging

### `feature` Branches

- Branch naming: `feature/description-of-feature`
- Created from: `develop`
- Merge back to: `develop`
- Purpose: Develop new features

#### `feature` Lifecycle

> - Create feature branch from `develop`
> - Develop and test locally
> - Merge locally back to `develop` using GitFlow
> - No pull request required for internal development

---

### `bugfix` Branches

- Branch naming: `bugfix/description-of-fix`
- Created from: `develop`
- Merge back to: `develop`
- Purpose: Fix bugs in development

#### `bugfix` Lifecycle

> - Create bugfix branch from `develop`
> - Fix the issue and test locally
> - Merge locally back to `develop` using GitFlow
> - No pull request required for internal development

---

### `hotfix` Branches

- Branch naming: `hotfix/description-of-fix`
- Created from: `master`
- Merge back to: `master` and `develop`
- Purpose: Fix critical production issues
- Not handled via GitFlow locally (intentionally)

#### `Hotfix` Lifecycle

> - Create hotfix branch from `master`
> - Fix the critical issue
> - Finalize via Nuke `Hotfix` target (can be triggered manually or using `@nuke:hotfix` metadata in the last commit)
> - Nuke creates pull request for review
> - After PR approval, Nuke handles merging to both `master` and `develop`
> - Nuke creates and pushes version tags
> - Delete hotfix branch after completion

---

### `release` Branches

- Branch naming: `release/vX.Y.Z`
- Created from: `develop`
- Merge back to: `master` and `develop`
- Purpose: Prepare for new production release
- Not handled via GitFlow locally (intentionally)

#### `release` Lifecycle

> - Create release branch from `develop`
> - Perform final testing and bug fixes
> - Finalize via Nuke `Release` target (can be triggered manually or using `@nuke:release` metadata in the last commit)
> - Nuke creates pull request for review
> - After PR approval, Nuke handles merging to both `master` and `develop`
> - Nuke creates and pushes version tags
> - Delete release branch after completion

---

### `docs` Branches

- Only used for external documentation updates
- Branch naming: `docs/description-of-update`
- Created from: `develop`
- Merge back to: `develop`
- Purpose: Prepare for documentation updates
- Not handled via GitFlow locally (intentionally)

#### `docs` Lifecycle

> - Create docs branch from `develop`
> - Perform final review and updates
> - Author creates pull request for review
> - After PR approval, Nuke handles merging to both `master` and `develop` (`@semver:patch`)
> - Nuke creates and pushes version tags
> - Nuke credits the author of the branch (if external) in contribution history with pull request link and description

## Pull Request Requirements

Pull requests are only required in two scenarios:

1. External forks → `develop`
2. Hotfix/release → `master`

## Best Practices

1. Keep branches up to date with their parent branch
2. Use meaningful branch names
3. Create small, focused branches
4. Review code before creating pull requests
5. Keep commits atomic and well-documented
6. Regularly pull changes from parent branches
7. Delete branches after merging
