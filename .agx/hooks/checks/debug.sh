#!/bin/sh
# Check for debug statements in staged files
for file in "$@"; do
    # Skip this script itself
    if [ "$file" = "$0" ]; then
        continue
    fi
    if grep -qE "console\.log|debugger|print\(" "$file"; then
        echo "❌ Found debug statement in: $file"
        exit 1
    fi

done
exit 0
