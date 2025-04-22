#!/bin/sh
# Check for TODO comments in staged files
BLOCKED=0
for file in "$@"; do
    # Skip this script itself
    if [ "$file" = "$0" ]; then
        continue
    fi
    if grep -q "TODO:" "$file"; then
        echo "❌ Found TODO in: $file"
        BLOCKED=1
    fi
done

if [ "$BLOCKED" -eq 1 ]; then
    echo ""
    echo "💡 Use \`TODO:\` for short-lived local todos and create issues and link them to the code via // Issue: #IssueNumber for longer-lived tasks."
    exit 1
fi
exit 0
