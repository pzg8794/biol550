# Trapnell final — differential expression results

## What I ran

- Comparison: `C1` vs `C2` (3 replicates per condition; see `submission/commands.txt`)
- DE method: `cuffdiff` (Cufflinks suite)
- Primary output table: `exports/cuffdiff_classref_v2_xs/gene_exp.diff`

## Significance definition

- Significant genes: `q_value <= 0.05` (FDR)
- Filter used in analysis: `status == "OK"` (required for valid p/q values)

## Result counts

- Total rows in `gene_exp.diff`: 17,482
- `status == "OK"` rows: 8,289
- Significant genes (`q_value <= 0.05`): 265

## Top hits (quick sanity check)

- Top up (by log2FC): Fatp, crc, scf, CTPsyn, Df31
- Top down (by log2FC): Nep2, RpS19b, Amy-d, CG6847, Aplip1

## Figures

- Volcano: `figures/volcano_gene_exp_labeled.png`
- MA plot: `figures/ma_plot_gene_exp.png`
- Replicate heatmap (top 50 DE genes): `figures/heatmap_top50_replicates.png`
- QC histograms: `figures/pvalue_hist.png`, `figures/qvalue_hist.png`

