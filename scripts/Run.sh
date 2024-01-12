#!/bin/bash

# Setează directorul rădăcină al proiectului la directorul părinte al scripturilor
project_root="$(dirname "$(realpath "$0")")/.."

# Setează directoarele pentru executabile și output
bin_dir="$project_root/bin"
output_dir="$project_root/output"

# Asigură-te că directorul output există
mkdir -p "$output_dir"

# Identifică și rulează fiecare fișier executabil din directorul bin
find "$bin_dir" -type f -executable | while read executable; do
    # Obține numele fișierului fără calea completă
    exec_name=$(basename "$executable")

    # Rulează executabilul și redirecționează output-ul într-un fișier în directorul output
    "$executable" > "$output_dir/$exec_name.output" 2>&1
done

echo "Execuția programelor și salvarea output-ului au fost completate."
