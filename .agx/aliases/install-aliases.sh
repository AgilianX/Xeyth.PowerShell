#!/bin/bash
# install-aliases.sh - Installs Git aliases from a shared aliases file
# Usage: ./install-aliases.sh [path/to/aliases/file]

set -e

# Determine repository root
REPO_ROOT=$(git rev-parse --show-toplevel)
if [ $? -ne 0 ]; then
  echo "Error: Not in a Git repository"
  exit 1
fi

# Get the aliases file path
ALIASES_FILE="${1:-$REPO_ROOT/.agx/aliases/agx.aliases}"
if [ ! -f "$ALIASES_FILE" ]; then
  echo "Error: Aliases file not found at $ALIASES_FILE"
  exit 1
fi

echo "Installing Git aliases from $ALIASES_FILE..."

# Read the aliases file line by line
count=0
while read -r line; do
  # Skip empty lines and comments
  if [ -z "$line" ] || [[ "$line" =~ ^# ]]; then
    continue
  fi

  # Parse the alias name and value
  ALIAS_NAME="${line%%:*}"
  ALIAS_VALUE="${line#*:}"

  if [ -z "$ALIAS_NAME" ] || [ -z "$ALIAS_VALUE" ]; then
    echo "Warning: Invalid alias definition: $line"
    continue
  fi

  # Check if the alias exists and update if different
  CURRENT_VALUE=$(git config --local --get "alias.$ALIAS_NAME" 2>/dev/null)

  if [ -z "$CURRENT_VALUE" ]; then
    echo "Setting Git alias: $ALIAS_NAME -> $ALIAS_VALUE"
    git config --local "alias.$ALIAS_NAME" "$ALIAS_VALUE"
    count=$((count+1))
  elif [ "$CURRENT_VALUE" != "$ALIAS_VALUE" ]; then
    echo "Updating Git alias: $ALIAS_NAME -> $ALIAS_VALUE"
    git config --local "alias.$ALIAS_NAME" "$ALIAS_VALUE"
    count=$((count+1))
  fi
done < "$ALIASES_FILE"

echo "✅ $count Git aliases installed successfully"
