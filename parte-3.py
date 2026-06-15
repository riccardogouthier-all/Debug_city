'''
3. 
Terzo script che ogni 30 secondi controlla se ci sono 
file nella cartella ./2-processing e li sposta nella cartella ./3-out
'''

import os
import shutil
import time

# Determina BASE_DIR come la cartella padre di quella dello script
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
BASE_DIR = os.path.dirname(SCRIPT_DIR)
OTHER_DIR = os.path.join(BASE_DIR, "Debug_city")
PROCESSING_DIR = os.path.join(OTHER_DIR, "2-processing")
OUT_DIR = os.path.join(OTHER_DIR, "3-out")

os.makedirs(PROCESSING_DIR, exist_ok=True)
os.makedirs(OUT_DIR, exist_ok=True)

print(f"[move_to_out] Avviato. Controllerò ogni 30 secondi: {PROCESSING_DIR}")

while True:
    found = False

    for filename in os.listdir(PROCESSING_DIR):
        filepath = os.path.join(PROCESSING_DIR, filename)

        if os.path.isfile(filepath):
            shutil.move(filepath, os.path.join(OUT_DIR, filename))
            print(f"[move_to_out] Spostato: {filename} -> {OUT_DIR}")
            found = True

    if not found:
        print("[move_to_out] Nessun file da spostare.")

    time.sleep(30)