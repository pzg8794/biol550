#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 1 ]]; then
  echo "Usage: $0 SRR1 [SRR2 ...]"
  exit 1
fi

# Check required commands
for cmd in fasterq-dump fastp fastqc multiqc salmon; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "ERROR: $cmd not found in PATH. Please install it or activate the conda env." >&2
    exit 1
  fi
done

OUTDIR=data
FASTQ_DIR="$OUTDIR/fastq"
TRIM_DIR="$OUTDIR/trimmed"
QC_DIR=qc
SALMON_INDEX="$OUTDIR/salmon_index"
QUANT_DIR=quant/salmon

mkdir -p "$FASTQ_DIR" "$TRIM_DIR" "$QC_DIR/fastqc" "$QC_DIR/fastp" "$QUANT_DIR"

for SRR in "$@"; do
  echo "--- Processing $SRR ---"

  # Download (fast) using fasterq-dump; fall back to prefetch if necessary
  if [[ ! -f "$FASTQ_DIR/${SRR}_1.fastq" ]]; then
    echo "Downloading $SRR..."
    fasterq-dump --split-files -O "$FASTQ_DIR" "$SRR"
  fi

  R1="$FASTQ_DIR/${SRR}_1.fastq"
  R2="$FASTQ_DIR/${SRR}_2.fastq"

  # Trim with fastp
  out1="$TRIM_DIR/${SRR}_1.trim.fastq"
  out2="$TRIM_DIR/${SRR}_2.trim.fastq"
  html="$QC_DIR/fastp/${SRR}_fastp.html"
  json="$QC_DIR/fastp/${SRR}_fastp.json"
  echo "Running fastp for $SRR"
  fastp -i "$R1" -I "$R2" -o "$out1" -O "$out2" -h "$html" -j "$json" -w 4

  # FastQC
  echo "Running FastQC for $SRR"
  fastqc -o "$QC_DIR/fastqc" "$out1" "$out2" -t 4

  # Salmon quant (requires prebuilt index)
  if [[ -d "$SALMON_INDEX" ]]; then
    echo "Running salmon quant for $SRR"
    salmon quant -i "$SALMON_INDEX" -l A \
      -1 "$out1" -2 "$out2" \
      -p 8 --validateMappings -o "$QUANT_DIR/${SRR}_quant"
  else
    echo "WARNING: Salmon index not found at $SALMON_INDEX; skipping quant for $SRR"
  fi

  echo "Finished $SRR"
done

# Aggregate QC
multiqc -o qc .

echo "All done. Outputs are in $OUTDIR/ (fastq, trimmed, salmon_index) and qc/ and quant/"