#!/usr/bin/env bash
set -euo pipefail

# Improved run script for PRJNA717662 test SRRs
# - Downloads SRRs (fasterq-dump or ncbi-datasets)
# - Gzips FASTQs
# - Runs professor FastQC (/usr/local/bin/FASTQC_12.1/fastqc)
# - Runs MultiQC if available
# - Zips outputs to qc_PRJNA717662.zip

SRRS=(SRR15510543 SRR15510542 SRR15510544)
RAW_DIR=~/BIOL550-Lab/fastqc_inputs/PRJNA717662/raw_fastqs
OUT_DIR=~/BIOL550-Lab/fastqc_output/PRJNA717662
LOG=~/BIOL550-Lab/PRJNA717662_run.log
THREADS=4

mkdir -p "$RAW_DIR" "$OUT_DIR"
echo "Started: $(date)" | tee -a "$LOG"

# detect tools
FASTQC_BIN="/usr/local/bin/FASTQC_12.1/fastqc"
if [[ ! -x "$FASTQC_BIN" ]]; then FASTQC_BIN=$(command -v fastqc || true); fi
if [[ -z "$FASTQC_BIN" ]]; then echo "ERROR: FastQC not found" | tee -a "$LOG"; exit 1; fi

DOWNLOAD_TOOL=""
if command -v fasterq-dump >/dev/null 2>&1; then DOWNLOAD_TOOL=fasterq-dump; fi
if [[ -z "$DOWNLOAD_TOOL" && -x /usr/local/bin/datasets ]]; then DOWNLOAD_TOOL=datasets; fi
if [[ -z "$DOWNLOAD_TOOL" ]]; then
  echo "ERROR: neither fasterq-dump nor ncbi-datasets found. Install sra-tools or ncbi-datasets." | tee -a "$LOG"
  exit 1
fi

echo "Using download tool: $DOWNLOAD_TOOL" | tee -a "$LOG"

for s in "${SRRS[@]}"; do
  echo "=== SRR: $s ===" | tee -a "$LOG"
  # skip if gzipped fastqs already present
  if ls "$RAW_DIR/${s}_"*fastq.gz >/dev/null 2>&1; then
    echo "Files for $s already exist; skipping download." | tee -a "$LOG"
    continue
  fi

  if [[ "$DOWNLOAD_TOOL" == "fasterq-dump" ]]; then
    echo "Running fasterq-dump for $s" | tee -a "$LOG"
    fasterq-dump --split-files -O "$RAW_DIR" "$s" 2>>"$LOG" || {
      echo "fasterq-dump failed for $s" | tee -a "$LOG"; exit 1; }
    gzip -f "$RAW_DIR/${s}_"*fastq 2>>"$LOG" || true
  else
    echo "Running ncbi-datasets for $s" | tee -a "$LOG"
    /usr/local/bin/datasets download sra --accession "$s" --filename "${s}.zip" 2>>"$LOG"
    unzip -o "${s}.zip" -d "$RAW_DIR" >/dev/null 2>>"$LOG" || true
    find "$RAW_DIR" -type f -name "*${s}*.fastq*" -exec gzip -f {} + 2>>"$LOG" || true
    rm -f "${s}.zip"
  fi

  # verify
  if ! ls "$RAW_DIR/${s}_"*fastq.gz >/dev/null 2>&1; then
    echo "ERROR: downloaded files for $s not found" | tee -a "$LOG"; exit 1
  fi
  echo "Downloaded & verified $s" | tee -a "$LOG"
done

# Run FastQC
NUM_FILES=$(ls -1 "$RAW_DIR"/*fastq* 2>/dev/null | wc -l || true)
echo "Running FastQC on $NUM_FILES files" | tee -a "$LOG"
"$FASTQC_BIN" -o "$OUT_DIR" -t "$THREADS" "$RAW_DIR"/*fastq* 2>>"$LOG" || echo "FastQC returned non-zero (see log)" | tee -a "$LOG"

# Optional MultiQC
if command -v multiqc >/dev/null 2>&1; then
  echo "Running MultiQC" | tee -a "$LOG"
  multiqc "$OUT_DIR" -o "$OUT_DIR" 2>>"$LOG" || true
fi

# Zip outputs
ZIP="$OUT_DIR/qc_PRJNA717662.zip"
cd "$OUT_DIR" && zip -r "$ZIP" . >/dev/null 2>>"$LOG" || true

echo "Finished: $(date)" | tee -a "$LOG"
echo "Results: $ZIP" | tee -a "$LOG"
