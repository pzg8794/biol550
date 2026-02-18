# PRJNA717662 (Long-term blood transcriptome after SARS-CoV-2)
# Filter for paired-end, avgLength >= 300, spots >= 40000000, human
# Usage: python filter_PRJNA717662_runinfo.py PRJNA717662_runinfo.csv PRJNA717662_20srrs.txt

import sys
import csv

input_csv = sys.argv[1]
output_txt = sys.argv[2]

with open(input_csv, newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    filtered = [row['Run'] for row in reader if (
        row.get('LibraryLayout', '').upper() == 'PAIRED' and
        int(row.get('avgLength', '0')) >= 300 and
        int(row.get('spots', '0')) >= 40000000 and
        row.get('ScientificName', '').lower() == 'homo sapiens'
    )]

with open(output_txt, 'w') as out:
    for srr in filtered[:20]:
        out.write(srr + '\n')
