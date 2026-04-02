# 2026-04-01 — Navigating data overload in gene expression analysis

## Overview
We reviewed how easily differential expression results can become an unmanageable list when using a single, arbitrary cutoff (e.g., padj < 0.05) across many contrasts. The meeting emphasized switching to an ordered-p-value/cumulative distribution view to define a bend/"elbow" threshold that yields a defensible gene list for downstream biological interpretation.

## Work / analysis approach
- Keep PCA as the first sanity check to explain intrinsic clustering versus condition-specific effects.
- For each DE contrast, compute ordered p-values, plot the cumulative curve, and identify the bend point.
- Use the bend point gene set as the primary input to GO/KEGG/Reactome enrichment and story selection.
- Clearly describe what is intrinsic variation vs external treatment effects, and how filters/thresholds might bias the narrative.

## Results (as captured for documentation)
- PCA interpretation remained consistent with prior discussion: the first components largely reflect intrinsic structure; differential signal should be reported in the context of that baseline structure.
- The ordered p-value / cumulative distribution method provides a reproducible way to choose a gene list size that avoids both “no genes” and “too many genes” failures.

## Next steps
- Extend bend-point output generation to any remaining contrasts that only had padj-based summaries.
- Generate a volcano plot per contrast, ideally annotating bend-point genes.
- Add explicit documentation sections to the weekly report describing method (inputs, thresholds chosen, and top enriched pathways).
