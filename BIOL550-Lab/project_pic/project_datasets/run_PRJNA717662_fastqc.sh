#!/bin/bash
# Script: run_PRJNA717662_fastqc.sh
# Purpose: Download FASTQs for 20 SRRs from PRJNA717662, run FastQC, and zip results

set -euo pipefail

SRR_LIST="/home/pzg8794/BIOL550-Lab/PRJNA717662_20srrs.txt"
RAW_DIR="/home/pzg8794/BIOL550-Lab/fastqc_inputs/PRJNA717662/raw_fastqs_20"
OUT_DIR="/home/pzg8794/BIOL550-Lab/fastqc_output/PRJNA717662_20"

mkdir -p "$RAW_DIR" "$OUT_DIR"
cd "$RAW_DIR"

while read -r srr; do
  echo "Downloading $srr..."
  # ENA FTP path logic
  subdir="${srr: -3}"
  curl -C - -O "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${srr:0:6}/$subdir/$srr/${srr}_1.fastq.gz"
  curl -C - -O "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${srr:0:6}/$subdir/$srr/${srr}_2.fastq.gz"
done < "$SRR_LIST"

# Run FastQC
/usr/local/bin/FASTQC_12.1/fastqc -o "$OUT_DIR" -t 4 *.fastq.gz

# Zip results
cd "$OUT_DIR"
zip -r qc_PRJNA717662_20.zip .
ls -lh qc_PRJNA717662_20.zip
