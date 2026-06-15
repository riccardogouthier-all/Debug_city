#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PROCESSING_DIR="$BASE_DIR/processing"
OUT_DIR="$BASE_DIR/out"

mkdir -p "$PROCESSING_DIR" "$OUT_DIR"

echo "[move_to_out] Avviato. Controllerò ogni 30 secondi: $PROCESSING_DIR"

while true; do
    found=false

    for file in "$PROCESSING_DIR"/*; do
        if [ -f "$file" ]; then
            mv "$file" "$OUT_DIR"/
            echo "[move_to_out] Spostato: $(basename "$file") -> $OUT_DIR"
            found=true
        fi
    done

    if [ "$found" = false ]; then
        echo "[move_to_out] Nessun file da spostare."
    fi

    sleep 30
done


