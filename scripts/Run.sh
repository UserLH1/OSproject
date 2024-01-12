#!/bin/bash

# Path to the project root directory
project_root="$(dirname "$(realpath "$0")")/.."

# Directories
bin_dir="$project_root/bin"
output_dir="$project_root/output"
expected_output_dir="$project_root/test_files/expected_output"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Run each executable and check the results
for executable in "$bin_dir"/*; do
    if [ -x "$executable" ]; then
        # Extract the filename without the path
        exec_name=$(basename "$executable")

        # Paths for the actual and expected output
        actual_output="$output_dir/$exec_name.output"
        expected_output="$expected_output_dir/$exec_name.expected"

        # Run the executable and capture the output
        "$executable" > "$actual_output" 2>&1
        exit_code=$?

        # Check the exit code
        if [ $exit_code -ne 0 ]; then
            echo "Error: $exec_name exited with code $exit_code"
            continue
        fi

        # Compare the actual output with the expected output
        if cmp -s "$actual_output" "$expected_output"; then
            echo "Success: $exec_name output matches the expected output."
        else
            echo "Failure: $exec_name output does not match the expected output."
            # Optional: output the diff
            echo "Diff:"
            diff "$actual_output" "$expected_output"
        fi
    else
        echo "Skipping non-executable file: $executable"
    fi
done

echo "Execution correctness check completed."
