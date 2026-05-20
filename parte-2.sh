import os
import shutil
import time
from datetime import datetime

IN_DIR = os.path.join('.', 'in')
PROCESSING_DIR = os.path.join('.', 'processing')

os.makedirs(IN_DIR, exist_ok=True)
os.makedirs(PROCESSING_DIR, exist_ok=True)

print(f"Avvio script Python: controllo ogni 10 secondi la cartella '{IN_DIR}'")

while True:
    files = [f for f in os.listdir(IN_DIR) if os.path.isfile(os.path.join(IN_DIR, f))]

    if files:
        for filename in files:
            source_path = os.path.join(IN_DIR, filename)
            dest_path = os.path.join(PROCESSING_DIR, filename)
            timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(f"[{timestamp}] Sposto '{filename}' in '{PROCESSING_DIR}'")
            shutil.move(source_path, dest_path)
    else:
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print(f"[{timestamp}] Nessun file da spostare in '{IN_DIR}'")

    time.sleep(10)
