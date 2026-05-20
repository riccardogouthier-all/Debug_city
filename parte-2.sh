#!/bin/sh

# Script POSIX sh per spostare file da ./in a ./processing ogni 10 secondi

set -eu

IN_DIR="./in"
PROCESSING_DIR="./processing"

mkdir -p "$IN_DIR" "$PROCESSING_DIR"

printf "Avvio script: controllo ogni 10 secondi la cartella '%s'\n" "$IN_DIR"

while :; do
    files_found=0

    for file in "$IN_DIR"/*; do
        [ -e "$file" ] || continue
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            printf '[%s] Sposto %s in %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$filename" "$PROCESSING_DIR"
            mv -- "$file" "$PROCESSING_DIR"/
            files_found=1
        fi
    done

    if [ "$files_found" -eq 0 ]; then
        printf '[%s] Nessun file da spostare in %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$IN_DIR"
    fi

    sleep 10
done
