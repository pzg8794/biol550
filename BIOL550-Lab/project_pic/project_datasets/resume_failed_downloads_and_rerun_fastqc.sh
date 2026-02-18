#!/bin/bash
# Script: resume_failed_downloads_and_rerun_fastqc.sh
# Purpose: Resume any incomplete FASTQ downloads and re-run FastQC on them
# Usage: bash resume_failed_downloads_and_rerun_fastqc.sh

set -euo pipefail

# Directory with FASTQ files
dir=~/BIOL550-Lab/fastqc_inputs/PRJNA717662/raw_fastqs
cd "$dir"

# List of files to check (edit if you have more SRRs)
files=(
  SRR15510542_1.fastq.gz
  SRR15510542_2.fastq.gz
  SRR15510543_1.fastq.gz
  SRR15510543_2.fastq.gz
  SRR15510544_1.fastq.gz
  SRR15510544_2.fastq.gz
)

# Resume any incomplete downloads
for f in "${files[@]}"; do
  # Get the correct FTP path
  srr=$(echo "$f" | cut -d'_' -f1)
  idx=$(echo "$f" | cut -d'_' -f2 | cut -d'.' -f1)
  ftp_path="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR155/${srr: -3}/${srr}/$f"
  echo "Resuming $f from $ftp_path ..."
  curl -C - -O "$ftp_path"
done

# Run FastQC only on the re-downloaded files
fastqc_out=~/BIOL550-Lab/fastqc_output/PRJNA717662
mkdir -p "$fastqc_out"
/usr/local/bin/FASTQC_12.1/fastqc -o "$fastqc_out" -t 4 *.fastq.gz

# Zip the FastQC results
cd "$fastqc_out"
zip -r qc_PRJNA717662.zip .
ls -lh qc_PRJNA717662.zip
