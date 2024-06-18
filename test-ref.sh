#!/bin/bash

# Directory to search
dir="."

# Flag to track if any files are found
found=0

# Iterate over all .yaml files in the directory
for file in $(find $dir -type f -name "*.yaml"); do
    # Use grep to search for "@" not followed by "main"
    if grep -q "@" "$file" && ! grep -q "@main" "$file"; then
        # Output the file name
        echo $file
        # Set the flag to 1
        found=1
    fi

    if grep -q "push:" "$file" && grep -q "branches:" "$file"; then
        if ! grep -qzP "branches:\n\s*- main" "$file"; then
            # Output the file name
            echo $file
            # Set the flag to 1
            found=1
        fi
    fi
done

# If any files were found, exit with status 1
if [ $found -eq 1 ]; then
    exit 1
fi