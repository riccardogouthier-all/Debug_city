#!/bin/bash
# Creare le directory se non esistono
mkdir -p ./in
while true; do
    # Costruisce il nome del file col timestamp
    filename="file_$(date '+%Y%m%d_%H%M%S').txt"
    filepath="./in/$filename"
    # Scrive il timestamp nel file
    echo "$(date '+%Y-%m-%d %H:%M:%S')" > "$filepath"
    echo "Creato: $filepath"
    # Attendi 10 secondi
    sleep 10
done