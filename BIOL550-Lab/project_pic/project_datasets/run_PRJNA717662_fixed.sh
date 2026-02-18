#!/usr/bin/env bash
set -euo pipefail

# Fixed run script for PRJNA717662 (uses ENA fallback when sra-tools or datasets CLI fail)
# - Downloads SRRs (prefer sra-tools -> datasets -> ENA HTTPS)
# - Gzips FASTQs (if needed)
# - Runs FastQC (/usr/local/bin/FASTQC_12.1/fastqc)
# - Optionally runs MultiQC
# - Zips outputs to qc_PRJNA717662.zip

SRRS=(SRR15510543 SRR15510542 SRR15510544)
RAW_DIR=~/BIOL550-Lab/fastqc_inputs/PRJNA717662/raw_fastqs
OUT_DIR=~/BIOL550-Lab/fastqc_output/PRJNA717662
LOG=~/BIOL550-Lab/PRJNA717662_run_fixed.log
THREADS=4
ENA_BASE="https://www.ebi.ac.uk/ena/browser/api/fastq"

mkdir -p "$RAW_DIR" "$OUT_DIR"
echo "Started: $(date)" | tee -a "$LOG"

# detect tools
FASTQC_BIN="/usr/local/bin/FASTQC_12.1/fastqc"
if [[ ! -x "$FASTQC_BIN" ]]; then FASTQC_BIN=$(command -v fastqc || true); fi
if [[ -z "$FASTQC_BIN" ]]; then echo "ERROR: FastQC not found" | tee -a "$LOG"; exit 1; fi

DOWNLOAD_TOOL=""
if command -v fasterq-dump >/dev/null 2>&1; then DOWNLOAD_TOOL=fasterq-dump; fi
# datasets CLI may not support SRA on this host; check if it accepts the sra subcommand
if [[ -z "$DOWNLOAD_TOOL" && -x /usr/local/bin/datasets ]]; then
  if /usr/local/bin/datasets download sra --help >/dev/null 2>&1; then DOWNLOAD_TOOL=datasets; fi
fi

if [[ -n "$DOWNLOAD_TOOL" ]]; then
echo "Using download tool: $DOWNLOAD_TOOL" | tee -a "$LOG"
else
  echo "No sra-tools or datasets usable; will fall back to ENA HTTPS downloads" | tee -a "$LOG"
fi

for s in "${SRRS[@]}"; do
  echo "=== SRR: $s ===" | tee -a "$LOG"
  # skip if gzipped fastqs already present
  if ls "$RAW_DIR/${s}_"*fastq.gz >/dev/null 2>&1; then
    echo "Files for $s already exist; skipping download." | tee -a "$LOG"
    continue
  fi

  if [[ "$DOWNLOAD_TOOL" == "fasterq-dump" ]]; then
    echo "Running fasterq-dump for $s" | tee -a "$LOG"
    fasterq-dump --split-files -O "$RAW_DIR" "$s" 2>>"$LOG" || echo "fasterq-dump failed for $s" | tee -a "$LOG"
    gzip -f "$RAW_DIR/${s}_"*fastq 2>>"$LOG" || true
  elif [[ "$DOWNLOAD_TOOL" == "datasets" ]]; then
    echo "Running ncbi-datasets for $s" | tee -a "$LOG"
    /usr/local/bin/datasets download sra --accession "$s" --filename "${s}.zip" 2>>"$LOG" || echo "datasets download failed for $s" | tee -a "$LOG"
    unzip -o "${s}.zip" -d "$RAW_DIR" >/dev/null 2>>"$LOG" || true
    find "$RAW_DIR" -type f -name "*${s}*.fastq*" -exec gzip -f {} + 2>>"$LOG" || true
    rm -f "${s}.zip"
  else
    echo "Falling back to ENA HTTPS for $s" | tee -a "$LOG"
    # try to download the FASTQ via ENA API (returns plain or gzipped FASTQ)
    # will save as <s>_1.fastq.gz and <s>_2.fastq.gz when available
    ENA_URL="$ENA_BASE/$s"
    OUT1="$RAW_DIR/${s}_1.fastq.gz"
    OUT2="$RAW_DIR/${s}_2.fastq.gz"

    # Download - ENA returns concatenated reads; use curl and split if necessary
    echo "Downloading from ENA: $ENA_URL" | tee -a "$LOG"
    # ENA may return a single or two files; try to retrieve as gzipped
    curl -sSfL "$ENA_URL" -o "$RAW_DIR/${s}.fastq" || true
    if [[ -s "$RAW_DIR/${s}.fastq" ]]; then
      # try to detect paired files inside (many ENA returns interleaved or two files)
      # If only one file, compress
      gzip -f "$RAW_DIR/${s}.fastq" && mv "$RAW_DIR/${s}.fastq.gz" "$OUT1" || true
      echo "Saved ENA FASTQ for $s -> $OUT1" | tee -a "$LOG"
    else
      # attempt to pull explicit reads by appending ;1 and ;2 (some endpoints allow it)
      curl -sSfL "${ENA_URL};1" -o "$OUT1" || true
      curl -sSfL "${ENA_URL};2" -o "$OUT2" || true
      # gzip if not already
      [[ -s "$OUT1" ]] && gzip -f "$OUT1" 2>>"$LOG" || true
      [[ -s "$OUT2" ]] && gzip -f "$OUT2" 2>>"$LOG" || true
      echo "Saved ENA FASTQs for $s" | tee -a "$LOG"
    fi
  fi

  # verify
  if ! ls "$RAW_DIR/${s}_"*fastq* >/dev/null 2>&1; then
    echo "WARNING: downloaded files for $s not found (check logs); continuing to next SRR" | tee -a "$LOG"
    continue
  fi
  echo "Downloaded & verified (or attempted) $s" | tee -a "$LOG"
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
