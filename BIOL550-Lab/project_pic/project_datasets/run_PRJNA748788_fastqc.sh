#!/bin/bash
# Script: run_PRJNA748788_fastqc.sh
# Purpose: Download FASTQs for 20 SRRs from PRJNA748788, run FastQC, and zip results

set -euo pipefail

SRR_LIST="/home/pzg8794/BIOL550-Lab/PRJNA748788_20srrs.txt"
RAW_DIR="/home/pzg8794/BIOL550-Lab/fastqc_inputs/PRJNA748788/raw_fastqs_20"
OUT_DIR="/home/pzg8794/BIOL550-Lab/fastqc_output/PRJNA748788_20"

mkdir -p "$RAW_DIR" "$OUT_DIR"
cd "$RAW_DIR"

while read -r srr; do
  echo "Downloading $srr..."
  subdir="${srr: -3}"
  curl -C - -O "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${srr:0:6}/$subdir/$srr/${srr}_1.fastq.gz"
  curl -C - -O "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${srr:0:6}/$subdir/$srr/${srr}_2.fastq.gz"
done < "$SRR_LIST"

# Run FastQC
/usr/local/bin/FASTQC_12.1/fastqc -o "$OUT_DIR" -t 4 *.fastq.gz

# Zip results
cd "$OUT_DIR"
zip -r qc_PRJNA748788_20.zip .
ls -lh qc_PRJNA748788_20.zip
