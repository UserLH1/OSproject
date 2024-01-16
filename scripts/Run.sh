#!/bin/bash

project_root="$(dirname "$(realpath "$0")")/.."

bin_dir="$project_root/bin"
output_dir="$project_root/output"

mkdir -p "$output_dir"

for executable in "$bin_dir"/*; do
    if [ -x "$executable" ]; then
        exec_name=$(basename "$executable")

        actual_output="$output_dir/$exec_name.output"

        "$executable" > "$actual_output" 2>&1
    else
        echo "Skipping non-executable file: $executable"
    fi
done

echo "All executables have been run."
