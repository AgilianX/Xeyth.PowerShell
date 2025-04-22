# Git Alias Management Strategy

## Status

Accepted

## Date

April 21, 2025

## Context

This repository utilizes several Git workflows and AI-assisted tools that benefit from standardized Git command aliases. Specifically, these aliases enhance developer productivity and ensure consistent workflows when working with AI prompts, commit conventions, and repository navigation.

We needed a solution to ensure these aliases are available to all contributors, including those who fork the repository.

## Decision Factors

We explored several approaches to manage repository-specific Git aliases:

1. **Manual Setup**: Requiring developers to manually configure aliases
2. **Git Template Directories**: Using Git's built-in template feature
3. **Git Hook-Based Solution**: Automatically setting up aliases via hooks

### Git Template Directory Approach (REJECTED)

Git provides a "template directory" feature that can populate the `.git` directory of new repositories when they're initialized or cloned:

```bash
git config --global init.templatedir "path/to/template/directory"
```

**Advantages:**

- Cleaner approach - aliases would be set automatically upon clone
- No need for post-clone setup scripts
- Could include other standard configurations

**Disadvantages:**

- Requires users to configure Git globally *before* cloning the repository
- Not automatically applied to forks on GitHub/GitLab
- Higher barrier to entry for contributors
- Requires global Git configuration changes (invasive)
- Problematic when working with multiple repositories with different template needs

### Git Hook-Based Solution

This approach uses a pre-command hook to check for and set up repository-specific aliases:

**Advantages:**

- Repository-specific without requiring global Git changes
- More transparent - contributors can see what's happening
- Simpler to document and support
- Can be triggered automatically

**Disadvantages:**

- Requires an installation step after cloning
- Slight performance impact (mitigated by optimizations)
- May require separate platform-specific implementations

## Decision

We initially considered implementing a **Git Hook-Based Solution** using a pre-command hook, but later decided to use a more direct and standard approach for managing repository aliases. Key components include:

1. A `.agx/aliases/agx.aliases` file that defines repository-specific aliases
2. Installation scripts (`.agx/aliases/install-aliases.ps1` and `.agx/aliases/install-aliases.sh`) that set up these aliases
3. Integration with repository initialization scripts that call the appropriate installer

All repository-specific aliases use the `agx-` prefix to avoid conflicts with personal aliases.
All repository-ai-specific aliases use the `agx-ai-` prefix to avoid conflicts with personal aliases.

## Implementation

The Git alias management system consists of these components:

```directory
.agx/aliases/
├── agx.aliases              # Defines repository-specific aliases
├── install-aliases.ps1      # PowerShell script to install aliases
└── install-aliases.sh       # Bash script to install aliases
```

### Key Features

1. **Cross-Platform**: Works on Windows with PowerShell/Bash and Unix-like systems
2. **Idempotent**: Can run multiple times without issues
3. **Extensible**: Easily add new aliases by updating the central aliases file
4. **Prefix-Based**: All aliases use the `agx-` or `agx-ai-` prefix to avoid conflicts
5. **Centralized**: All aliases defined in a single `agx.aliases` file

## Repository-Specific Aliases

These aliases are designed to support our repository workflows:

| Alias            | Command                                  | Purpose                                    |
|------------------|------------------------------------------|--------------------------------------------|
| `agx-setup-test` | `status`                                 | Simple test alias to verify configuration  |
| `agx-ai-lg`      | `!git --no-pager log --oneline -n 100`   | Extended log format for AI context         |

## Setup Instructions

**Recommended**: Follow the repository setup guide in [.agx/docs/setup/README.md](../../setup/README.md) and run the initialization script.

> When registering a new alias, simply run the initialization script again.

The instructions below are provided **only for manual troubleshooting** in case you need to reconfigure the Git aliases module when things break:

1. Run the appropriate alias installation script:

    ```bash
    # For Bash/Unix (from the repository root)
    bash .agx/aliases/install-aliases.sh
    ```

    ```powershell
    # For PowerShell/Windows (from the repository root)
    .\.agx\aliases\install-aliases.ps1
    ```

2. Verify aliases are working:

    ```bash
    git agx-setup-test
    ```

## Why Aliases Are Necessary for AI Workflows

Several AI-assisted workflows depend on these aliases to operate effectively:

1. **AI commit message generation**: The `agx-ai-lg` command provides sufficient context for our AI agents to understand commit history patterns.

2. **AI prompt execution**: Some prompt files like [ai.create-commit-message.prompt.md](../../../../.github/prompts/ai.create-commit-message.prompt.md) explicitly reference these aliases in their execution steps.

3. **Consistent context gathering**: When agents need to understand repository state, these aliases ensure they receive consistent and sufficient information, free of halucinated extra arguments that come from training data around the command.

4. **Enhanced collaboration**: By standardizing commands, we reduce the learning curve for new contributors and improve team efficiency.

## Consequences

### Positive

- Ensures all contributors work with the same commands and workflows
- Simplifies onboarding and documentation
- Makes AI prompt files more reliable and consistent
- Centralized alias management through a single aliases file
- More transparent approach with dedicated installation scripts
- No ongoing performance impact since aliases are installed once

### Negative

- Requires a manual installation step after cloning
- May cause confusion if users have personal aliases with the same names (very unlikely)

## References

- [Git Config Documentation](https://git-scm.com/docs/git-config)
- [Git Template Directories](https://git-scm.com/docs/git-init#_template_directory)
- [Git Hooks Documentation](https://git-scm.com/docs/githooks)
