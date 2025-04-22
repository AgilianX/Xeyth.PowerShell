#!/bin/sh
# Check for trailing whitespace in staged files
for file in "$@"; do
    # Skip this script itself
    if [ "$file" = "$0" ]; then
        continue
    fi
    if grep -q -nE "[[:blank:]]+$" "$file"; then
        echo "❌ Found trailing whitespace in: $file"
        exit 1
    fi

done
exit 0
