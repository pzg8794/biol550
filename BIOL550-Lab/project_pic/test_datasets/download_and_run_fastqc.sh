#!/usr/bin/env bash
set -euo pipefail

# download_and_run_fastqc.sh
# Usage: download_and_run_fastqc.sh <sr_list.txt> [-o outdir] [-t threads]

SRLIST=${1:-}
OUTDIR=./test_out
THREADS=4

if [[ -z "$SRLIST" || ! -f "$SRLIST" ]]; then
  echo "Usage: $0 <sr_list.txt> [-o outdir] [-t threads]"
  exit 2
fi

while [[ $# -gt 0 ]]; do
  case "$1" in
    -o) OUTDIR=$2; shift 2;;
    -t) THREADS=$2; shift 2;;
    --) shift; break;;
    *) shift; break;;
  esac
done

RAWDIR="$OUTDIR/raw_fastqs"
FASTQC_OUT="$OUTDIR/fastqc"
mkdir -p "$RAWDIR" "$FASTQC_OUT"

# tools
FASTQC_BIN="/usr/local/bin/FASTQC_12.1/fastqc"
if ! command -v "$FASTQC_BIN" >/dev/null 2>&1; then
  FASTQC_BIN=$(command -v fastqc || true)
fi
if [[ -z "$FASTQC_BIN" ]]; then
  echo "FastQC not found. Please install or adjust FASTQC_BIN path." >&2
  exit 1
fi

download_with_fasterq()
{
  local srr=$1
  echo "Using fasterq-dump to download $srr"
  fasterq-dump --split-files --outdir "$RAWDIR" "$srr"
  # gzip the produced files to save space
  if ls "$RAWDIR/${srr}_"*fastq >/dev/null 2>&1; then
    gzip -f "$RAWDIR/${srr}_"*fastq
  fi
}

download_with_datasets()
{
  local srr=$1
  echo "Using ncbi datasets to download $srr"
  datasets download sra --accession "$srr" --filename "$srr.zip"
  unzip -o "$srr.zip" -d "$OUTDIR" >/dev/null
  # find and move fastqs
  find "$OUTDIR" -type f -name "*${srr}*.fastq*" -exec mv -t "$RAWDIR" {} + || true
  rm -f "$srr.zip"
}

# iterate SRRs
while read -r srr; do
  srr=$(echo "$srr" | tr -d '\r' | tr -s ' ')
  [[ -z "$srr" ]] && continue
  echo "Processing $srr"

  if command -v fasterq-dump >/dev/null 2>&1; then
    download_with_fasterq "$srr"
  elif command -v datasets >/dev/null 2>&1; then
    download_with_datasets "$srr"
  else
    echo "No download tool found (fasterq-dump or datasets)." >&2
    echo "Install sra-tools (conda: mamba/pip install sra-tools) or ncbi-datasets." >&2
    exit 1
  fi

done < "$SRLIST"

# Run FastQC
echo "Running FastQC on: $(ls -1 "$RAWDIR" | wc -l) files"
$FASTQC_BIN -o "$FASTQC_OUT" -t "$THREADS" "$RAWDIR"/*fastq* || true

# Package results
ZIPPATH="$OUTDIR/fastqc_results_$(basename "$SRLIST" .txt).zip"
cd "$FASTQC_OUT" && zip -r "$ZIPPATH" . && cd - >/dev/null

echo "FastQC outputs are in: $FASTQC_OUT"
echo "Zipped results: $ZIPPATH"

# End
