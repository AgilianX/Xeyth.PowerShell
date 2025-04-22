#!/bin/sh
# Check for merge conflict markers in staged files
for file in "$@"; do
    # Skip this script itself
    if [ "$file" = "$0" ]; then
        continue
    fi
    if grep -qE "<<<<<<<|=======|>>>>>>>" "$file"; then
        echo "❌ Found merge conflict markers in: $file"
        exit 1
    fi

done
exit 0
