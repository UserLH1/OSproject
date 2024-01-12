#!/bin/bash

# Path to the project root directory
project_root="$(dirname "$(realpath "$0")")/.."

# Directories
bin_dir="$project_root/bin"
output_dir="$project_root/output"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Run each executable
for executable in "$bin_dir"/*; do
    if [ -x "$executable" ]; then
        # Extract the filename without the path
        exec_name=$(basename "$executable")

        # Path for the actual output
        actual_output="$output_dir/$exec_name.output"

        # Run the executable and capture the output
        "$executable" > "$actual_output" 2>&1
    else
        echo "Skipping non-executable file: $executable"
    fi
done

echo "All executables have been run."
