# Repository Setup Guide

This guide helps you set up your local development environment after cloning this repository. The setup process configures Git aliases, hooks, and other tools necessary for consistent development workflows.

## Quick Start

Run the initialization script from the repository root:

Windows:

```pwsh
# From the repository root
pwsh .agx/init.ps1
```

Linux/MacOS:

```bash
# From the repository root
bash .agx/init.sh
```

This script will configure all necessary components for development.

## Setup Components

The initialization script configures the following components:

| Component         | Purpose                                                           |
|-------------------|-------------------------------------------------------------------|
| Git Aliases       | Configures repository-specific Git aliases with the `agx-` prefix |
| Git Hooks         | Sets up hooks for workflow automation                             |
| Development Tools | Ensures all required development tools are configured properly    |

## Manual Setup

If you need to re-run specific setup components individually:

### Git Aliases

To set up repository-specific Git aliases:

```bash
# From the repository root
bash .agx/hooks/install-hooks.sh
```

This script installs the pre-command hook that automatically configures aliases such as `agx-ai-lg` for extended Git logs used by AI prompts.

### Git Hooks

To make Git hooks executable and properly set up:

```bash
# From the repository root
bash .agx/hooks/make-hooks-executable.sh
```

## Troubleshooting

### Git Aliases Not Working

If the Git aliases are not working properly:

1. Verify hooks are installed:

   ```bash
   ls -la .git/hooks/pre-command
   ```

2. Manually run the installation script:

   ```bash
   bash .agx/hooks/install-hooks.sh
   ```

3. Check if aliases are registered:

   ```bash
   git config --local --get-regexp "^alias\."
   ```

### All Setup Failed

If the entire setup process failed:

1. Run the initialization script with verbose output:

   ```bash
   bash .agx/init.sh --verbose
   ```

2. Check for permission issues:

   ```bash
   ls -la .agx/hooks/
   ```

## Available Git Aliases

After setup, the following aliases will be available:

| Alias | Command | Purpose |
|-------|---------|---------|
| `agx-ai-lg` | `git --no-pager log --oneline -n 100` | Extended log format for AI context |

## Further Information

For more details about specific setup components:

- [Git Alias Architecture Decision](../adr/repo/Git.AI.md) - Explains the architectural decisions around Git alias management
