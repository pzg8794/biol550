#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

OUT_ZIP="trapnell_final_differential_expression_results.zip"
rm -f "$OUT_ZIP"

zip -r "$OUT_ZIP" \
  exports/cuffdiff_classref_v2_xs \
  data \
  figures \
  notes \
  submission \
  >/dev/null

echo "Wrote: $(pwd)/$OUT_ZIP"

