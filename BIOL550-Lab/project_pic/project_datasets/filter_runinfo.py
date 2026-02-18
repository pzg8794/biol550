"""filter_runinfo.py

Usage:
    python filter_runinfo.py <input_csv> <output_txt> <min_length> <min_spots> <organism>

Notes:
    - Set <organism> to "ANY" (or empty string) to skip organism filtering.
    - If the RunInfo table includes LibraryStrategy, rows will be required to be RNA-Seq.
"""

import sys
import csv

input_csv = sys.argv[1]
output_txt = sys.argv[2]
min_length = int(sys.argv[3])
min_spots = int(sys.argv[4])
organism = (sys.argv[5] if len(sys.argv) > 5 else "").strip().lower()


def to_int(value: str, default: int = 0) -> int:
    try:
        return int(float(value))
    except Exception:
        return default


def is_rnaseq(row: dict) -> bool:
    # Some RunInfo exports omit LibraryStrategy; if it's absent/blank, don't block.
    strategy = (row.get("LibraryStrategy") or "").strip().lower()
    return (strategy == "" or strategy == "rna-seq")

with open(input_csv, newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    filtered = []
    for row in reader:
        if (row.get('LibraryLayout', '').strip().upper() != 'PAIRED'):
            continue
        if to_int(row.get('avgLength', '0')) < min_length:
            continue
        if to_int(row.get('spots', '0')) < min_spots:
            continue
        if not is_rnaseq(row):
            continue

        sci = (row.get('ScientificName', '') or '').strip().lower()
        if organism and organism != 'any' and sci != organism:
            continue

        run = row.get('Run')
        if run:
            filtered.append(run)

with open(output_txt, 'w') as out:
    for srr in filtered:
        out.write(srr + '\n')
