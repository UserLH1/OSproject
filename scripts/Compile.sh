#!/bin/bash

project_root="./src"

src_dir="./src"
include_dir="./include"

find "$src_dir" -name "*.c" | while read src_file; do
    # Obține numele fișierului fără extensie
    base_name=$(basename "$src_file" .c)

    # Setează calea fișierului executabil
    output_executable="/bin/$base_name"

    # Comanda de compilare
    gcc -I "$include_dir" -o "$output_executable" "$src_file"
done

echo "Compilare completă."



