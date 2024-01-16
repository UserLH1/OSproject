#!/bin/bash

project_root="$(dirname "$(realpath "$0")")/.."

src_dir="$project_root/src"
bin_dir="$project_root/bin"

mkdir -p "$bin_dir"


find "$src_dir" -name "*.c" | while read src_file; do
    # Get the file name without extension
    base_name=$(basename "$src_file" .c)

    output_executable="$bin_dir/$base_name"

    gcc -o "$output_executable" "$src_file"
done

echo "Compilation complete."
