#!/bin/bash

project_root="$(dirname "$(realpath "$0")")/.."

output_dir="$project_root/output"
expected_output_dir="$project_root/test_files/expected_output"

for output_file in "$output_dir"/*.output; do
    exec_name=$(basename "$output_file" .output)

    expected_output="$expected_output_dir/$exec_name.expected"

    if [ ! -f "$expected_output" ]; then
        echo "Expected output file not found for $exec_name"
        continue
    fi

    if cmp -s "$output_file" "$expected_output"; then
        echo "Success: $exec_name output matches the expected output."
    else
        echo "Failure: $exec_name output does not match the expected output."
        echo "Diff:"
        diff "$output_file" "$expected_output"
    fi
done

echo "Execution correctness check completed."
