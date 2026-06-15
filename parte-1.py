'''
1. 
Primo script script che ogni 10 secondi scrive un file in una cartella ./in 
(usare il timestamp per costruire il nome del file)
'''

import os
import time
from datetime import datetime

# Crea la directory se non esiste
os.makedirs("./1-in", exist_ok=True)

while True:
    # Costruisce il nome del file col timestamp
    now = datetime.now()
    filename = f"file_{now.strftime('%Y%m%d_%H%M%S')}.txt"
    filepath = os.path.join("./1-in", filename)

    # Scrive il timestamp nel file
    with open(filepath, "w") as f:
        f.write(now.strftime('%Y-%m-%d %H:%M:%S') + "\n")

    print(f"Creato: {filepath}")

    # Attendi 10 secondi
    time.sleep(10)