#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 1 ]]; then
  echo "Usage: $0 /path/to/transcripts.fa [index_dir]"
  exit 1
fi

TRANSCRIPT_FASTA="$1"
INDEX_DIR="${2:-data/salmon_index}"
THREADS="${3:-4}"

if [[ ! -f "$TRANSCRIPT_FASTA" ]]; then
  echo "ERROR: transcriptome FASTA not found at $TRANSCRIPT_FASTA" >&2
  exit 1
fi

mkdir -p "$INDEX_DIR"

echo "Building Salmon index from $TRANSCRIPT_FASTA into $INDEX_DIR (k=31, threads=$THREADS)"
salmon index -t "$TRANSCRIPT_FASTA" -i "$INDEX_DIR" -k 31 -p "$THREADS"

echo "Done. Salmon index available at: $INDEX_DIR"