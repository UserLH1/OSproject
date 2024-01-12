#!/bin/bash

# Setează directorul rădăcină al proiectului la directorul părinte al scripturilor
project_root="$(dirname "$(realpath "$0")")/.."

# Setează directoarele pentru surse și include
src_dir="$project_root/src"
include_dir="$project_root/include"
bin_dir="$project_root/bin"

# Asigură-te că directorul bin există
mkdir -p "$bin_dir"

# Compilarea fiecărui fișier sursă .c
find "$src_dir" -name "*.c" | while read src_file; do
    # Obține numele fișierului fără extensie
    base_name=$(basename "$src_file" .c)

    # Setează calea fișierului executabil
    output_executable="$bin_dir/$base_name"

    # Comanda de compilare
    gcc -I "$include_dir" -o "$output_executable" "$src_file"
done

echo "Compilare completă."
