#!/bin/bash
#
# Repository Initialization Script
#
# This script sets up your local development environment after cloning this repository.
# It configures Git aliases, hooks, and other tools necessary for consistent development workflows.

echo "📦 Initializing repository setup..."

# Determine script location and repository root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [ $? -ne 0 ]; then
    echo "❌ Error: Not in a Git repository"
    exit 1
fi

# 1. Make all hook scripts executable
echo "🔧 Making Git hooks executable..."
if [ -f "$REPO_ROOT/.agx/hooks/make-hooks-executable.sh" ]; then
    bash "$REPO_ROOT/.agx/hooks/make-hooks-executable.sh"
else
    echo "⚠️ Warning: Hook executable script not found"
fi

# 2. Install Git hooks
echo "🔧 Installing Git hooks..."
if [ -f "$REPO_ROOT/.agx/hooks/install-hooks.sh" ]; then
    bash "$REPO_ROOT/.agx/hooks/install-hooks.sh"
else
    echo "⚠️ Warning: Hook installation script not found"
fi

# 3. Install Git aliases
echo "🔧 Installing Git aliases..."
if [ -f "$REPO_ROOT/.agx/aliases/install-aliases.sh" ]; then
    bash "$REPO_ROOT/.agx/aliases/install-aliases.sh"
else
    echo "⚠️ Warning: Alias installation script not found"
fi

# 4. Check if our aliases are properly configured
echo "🔍 Verifying Git aliases..."
alias_check=$(git config --local --get alias.agx-setup-test)
if [ -z "$alias_check" ]; then
    echo "⚠️ Warning: Git aliases don't appear to be configured correctly"
else
    echo "✅ Git aliases configured successfully"
fi

echo "🎉 Repository initialization complete!"
PARTIAL_README_PATH="$REPO_ROOT/.agx/docs/setup/PARTIAL_README.md"
README_PATH="$REPO_ROOT/$PARTIAL_README_PATH"
if [ -f "$README_PATH" ]; then
    echo "📚 See $README_PATH for more information on repository configuration"
else
    echo "📚 See $PARTIAL_README_PATH for more information on repository configuration"
fi
