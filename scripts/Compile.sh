#!/bin/bash

# Set the project root directory to the parent directory of the scripts
project_root="$(dirname "$(realpath "$0")")/.."

# Set the directories for sources and includes
src_dir="$project_root/src"
include_dir="$project_root/include"
bin_dir="$project_root/bin"

# Ensure the bin directory exists
mkdir -p "$bin_dir"

# Compile each .c source file
find "$src_dir" -name "*.c" | while read src_file; do
    # Get the file name without extension
    base_name=$(basename "$src_file" .c)

    # Set the path for the executable file
    output_executable="$bin_dir/$base_name"

    # Compilation command
    gcc -I "$include_dir" -o "$output_executable" "$src_file"
done

echo "Compilation complete."
