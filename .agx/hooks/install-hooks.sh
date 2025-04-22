# Get the repository root directory
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [ $? -ne 0 ]; then
    echo "Error: Not in a Git repository"
    exit 1
fi

# Configure git to use .agx/hooks as the hooks directory
echo "Configuring Git to use .agx/hooks as the hooks directory..."
git config --local core.hooksPath .agx/hooks

echo "Git hooks installed successfully!"
echo "The pre-command hook will automatically set up repository aliases"
