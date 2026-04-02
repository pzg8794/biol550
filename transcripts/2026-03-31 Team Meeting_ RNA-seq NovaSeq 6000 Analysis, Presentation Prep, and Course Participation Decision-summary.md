# 2026-03-31 — Team meeting: RNA-seq NovaSeq 6000 analysis + presentation prep

## Overview
We reviewed the latest NovaSeq 6000 RNA-seq run and confirmed the pipeline outputs needed for the upcoming presentation and weekly report. The team emphasized the need for clear story selection rather than describing every possible comparison.

## Work / analysis approach
- Validate alignment + DE pipeline outputs for the new dataset.
- Keep PCA as the framing explanation (intrinsic clustering vs condition effects).
- Produce a volcano plot per contrast as a quick way to surface the largest, most interpretable shifts.
- Plan downstream enrichment (GO/KEGG/Reactome) using the same gene selection logic across contrasts so story selection is consistent.

## Results (as captured for documentation)
- Pipeline run confirmed; next step is to finalize the differential expression summaries and supporting plots for the report.
- Strong alignment on narrative structure: move from QC → PCA interpretation → DE evidence → pathway-level interpretation.

## Next steps
- Generate and archive volcano plots alongside DE outputs.
- Document bend-point/cumulative p-value thresholds where applicable.
- Update the weekly report with a focused "most important story" section per contrast.
