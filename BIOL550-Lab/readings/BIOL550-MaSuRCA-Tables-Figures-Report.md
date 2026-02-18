# MaSuRCA — Tables & Figures Report

**Source:** `BIOL550-Week3_MaSuRCA.pdf` (A.V. Zimin et al., Bioinformatics 2013)

## Summary
This short report extracts the core tabular results (Tables 1–2) and key figure captions (Fig.2) from the paper and provides a brief interpretation.

---

## Table 1 — R. sphaeroides assemblies (extracted)
(Columns as in the original PDF header)

Assembler / data type | Quast NGA50 | Quast misas- | NGA50 contig (kb) | Scaffold (Mb) | misas- (scaffolds)/Mb
---|---:|---:|---:|---:|---:
Allpaths-LG | 41.5 | 15 | 3.2 | 0.2
SOAPdenovo2 | 17.5 | 5 | 0.067 | 0.9
MaSuRCA | 41.4 | 13 | 3.1 | 0.7
CABOG LR only | 52.7 | 12 | 1.5 | 0.4
MaSuRCA + 1 LR | 63.9 | 21 | 3.2 | 0.7
MaSuRCA + 2 LR | 87.2 | 17 | 3.2 | 0.2
MaSuRCA + 4 LR | 228.4 | 20 | 3.2 | 0.2

**Interpretation:** MaSuRCA (Illumina-only) performs on par with Allpaths-LG; adding long reads (LR) to MaSuRCA substantially increases NGA50 (contiguity).

---

## Table 2 — Mouse chromosome 16 assemblies (extracted)
(Top rows = Illumina-only; bottom rows = Illumina + Sanger LR)

Assembler | Quast NGA50 contig | Quast misassemblies (contig) | NGA50 scaffold (Kb) | Scaffold misas-/Mb
---|---:|---:|---:|---:
Allpaths-LG | 28 | 175 | 261 | 0.03
SOAPdenovo2 | 8 | 369 | 1828 | 0.17
MaSuRCA | 56 | 283 | 3445 | 0.19
MaSuRCA + 1 LR | 70 | 256 | 4472 | 0.04
MaSuRCA + 2 LR | 82 | 248 | 3704 | 0.21
MaSuRCA + 4 LR | 102 | 246 | 4511 | 0.21

**Interpretation:** On the more complex (diploid) chromosome data, MaSuRCA produced far larger scaffolds than Allpaths-LG or SOAPdenovo2, and adding long reads progressively improved contiguity and reduced certain error metrics.

---

## Fig. 2 — caption & description (extracted)
"An example of a read whose super-read has two k-unitigs. Read R contains k-mers M1 and M2 on its ends... K-unitigs K1 and K2 overlap by k-1 bases. We extend read R on both ends producing a super-read..."

**Interpretation:** Fig.2 visually explains how k-unitigs are merged into longer super-reads by unique k-mer extensions and pair connections — the core concept that reduces complexity.

---

## Notes & provenance
- All numbers and captions were extracted directly from the PDF `BIOL550-Week3_MaSuRCA.pdf` using `pdftotext -layout` and lightly reformatted here.
- If you want, I can: (a) convert the numeric tables into CSV/Excel, (b) extract the actual figure images (PNG/SVG), or (c) prepare a short slide deck with these tables and figure(s).

---

*Next step recommendation:* produce a one-slide comparison (MaSuRCA vs Allpaths-LG vs SOAPdenovo) visualizing the key metrics (NGA50, misassemblies, scaffold N50) — ready to make it as a single markdown slide or PNG.
