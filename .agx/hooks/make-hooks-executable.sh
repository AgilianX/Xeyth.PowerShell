# Get the repository root
REPO_ROOT=$(git rev-parse --show-toplevel)
if [ $? -ne 0 ]; then
    echo "Error: Not in a Git repository"
    exit 1
fi

# Make all hook files executable
echo "Making hook files executable..."

# Recursively find all files without extensions in the hooks directory and make them executable
find "$REPO_ROOT/.agx/hooks" -type f ! -name "*.*" -exec chmod +x {} \;

# Make all shell scripts executable
find "$REPO_ROOT/.agx/hooks" -name "*.sh" -exec chmod +x {} \;

echo "All hooks are now executable!"
