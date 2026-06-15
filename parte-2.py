import os
import shutil
import time
from datetime import datetime

IN_DIR = "./in"
PROCESSING_DIR = "./processing"

os.makedirs(IN_DIR, exist_ok=True)
os.makedirs(PROCESSING_DIR, exist_ok=True)

print(f"Avvio script: controllo ogni 10 secondi la cartella '{IN_DIR}'")

while True:
    files_found = False

    for filename in os.listdir(IN_DIR):
        filepath = os.path.join(IN_DIR, filename)

        if os.path.isfile(filepath):
            timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(f"[{timestamp}] Sposto {filename} in {PROCESSING_DIR}")
            shutil.move(filepath, os.path.join(PROCESSING_DIR, filename))
            files_found = True

    if not files_found:
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print(f"[{timestamp}] Nessun file da spostare in {IN_DIR}")

    time.sleep(10)