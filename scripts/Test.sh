#!/bin/bash

# Path to the project root directory
project_root="$(dirname "$(realpath "$0")")/.."

# Directories
output_dir="$project_root/output"
expected_output_dir="$project_root/test_files/expected_output"

# Compare the output of each program with the expected output
for output_file in "$output_dir"/*.output; do
    # Extract the filename without the path
    exec_name=$(basename "$output_file" .output)

    # Paths for the expected output
    expected_output="$expected_output_dir/$exec_name.expected"

    # Check if the expected output file exists
    if [ ! -f "$expected_output" ]; then
        echo "Expected output file not found for $exec_name"
        continue
    fi

    # Compare the actual output with the expected output
    if cmp -s "$output_file" "$expected_output"; then
        echo "Success: $exec_name output matches the expected output."
    else
        echo "Failure: $exec_name output does not match the expected output."
        # Optional: output the diff
        echo "Diff:"
        diff "$output_file" "$expected_output"
    fi
done

echo "Execution correctness check completed."
