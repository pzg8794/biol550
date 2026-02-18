#!/bin/bash
# Batch download and FastQC for PRJNA292477 20-SRR subset
SRR_LIST=~/DataScience/Semester5/BIOL550/BIOL550-Lab/PRJNA292477_20srrs.txt
RAW_DIR=~/DataScience/Semester5/BIOL550/BIOL550-Lab/fastqc_inputs/PRJNA292477/raw_fastqs_20
OUT_DIR=~/DataScience/Semester5/BIOL550/BIOL550-Lab/fastqc_output/PRJNA292477_20

mkdir -p "$RAW_DIR" "$OUT_DIR"
cd "$RAW_DIR"

while read -r srr; do
  echo "Downloading $srr..."
  prefetch "$srr"
  fasterq-dump "$srr" -O "$RAW_DIR" --split-files --threads 4
done < "$SRR_LIST"

# Run FastQC on all fastq files
/usr/local/bin/FASTQC_12.1/fastqc -o "$OUT_DIR" -t 4 *.fastq

cd "$OUT_DIR"
zip -r qc_PRJNA292477_20.zip .
ls -lh qc_PRJNA292477_20.zip