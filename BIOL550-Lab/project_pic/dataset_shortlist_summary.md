# Dataset Shortlist — 3 Recommended Datasets ✅

> Concise summary with direct SRA links and starter SRR lists for quick QC/alignment testing. 🔧💡

---

## 1) PRJNA1406761 — iPSC Small Intestine Organoid (PEG platform) 🧬
- **Organism:** Homo sapiens
- **Samples:** 21 (Public)
- **Access:** Public
- **Read layout / nominal:** 2×150 bp (NovaSeq 6000)
- **Representative SRRs (starter list):** `SRR36938303`, `SRR36938304`, `SRR36938310`, `SRR36938314`, `SRR36938333`
  - Example: `SRR36938303` — 41,097,756 spots; 12.3G bases (∼2×150)
- **SRA study:** https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761 (SRP665664)
- **Notes:** Good tissue/organ‑oid model, consistent NovaSeq 2×150 runs; many runs ≥40M spots.

**Suggested first steps (3–5 sample quick test):**
1. Download 3 representative SRRs (use `prefetch`/`fasterq-dump` or `cloud` fastq links).
2. Run **FastQC** for QC; if you need trimming, use **FASTX** (`fastq_quality_trimmer`, `fastx_clipper`) and re-run FastQC; confirm read length and quality.
3. Align with STAR (or Salmon pseudoalign) on GRCh38; check mapping rates and duplication/mito content.

---

## 2) PRJNA717662 — Long-term blood transcriptome after SARS‑CoV‑2 (GEO-linked) 🩸
- **Organism:** Homo sapiens
- **Samples:** 152 (Public)
- **Access:** Public
- **Read layout / nominal:** 2×150 bp (NovaSeq 6000)
- **Representative SRRs (starter list):** `SRR15510543`, `SRR15510542`, `SRR15510604`, `SRR15510603`, `SRR15510544`
  - Example: `SRR15510543` — 70,901,227 spots; 20.5G bases (∼2×150)
- **SRA study:** https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662 (SRP312283)
- **Notes:** Large public blood RNA-seq set (globin depletion/Anydeplete used); excellent for differential expression and time-course analyses.

**Suggested first steps (3–5 sample quick test):**
1. Pick 3 SRRs spanning conditions/timepoints; download and run **FastQC**.
2. If needed, trim with **FASTX** and re-run FastQC on trimmed reads (keep raw vs trimmed outputs separate).
3. Perform rRNA/globin content check and mapping with STAR or Salmon.
4. Consider normalization strategies for blood (e.g., remove globin, check for batch effects).

---

## 3) PRJNA748788 — CPTAC: Triple Negative Breast Cancer (TNBC) chemotherapy response 🎗️
- **Organism:** Homo sapiens
- **Samples:** ~135 experiments (dbGaP-linked; many runs have public FASTQ)
- **Access:** Controlled (dbGaP) for some metadata; many raw runs accessible via SRA (check study-level notes)
- **Read layout / nominal:** NovaSeq 2×150 bp for most RNA-seq runs
- **Representative SRRs (starter list):** `SRR20427233`, `SRR20427232`, `SRR20427265`, `SRR20427264`, `SRR20427266`
  - Example: `SRR20427233` — 42,294,546 spots; 12.8G bases (∼2×150)
- **SRA study:** https://www.ncbi.nlm.nih.gov/bioproject/PRJNA748788 (SRP387588)
- **Notes:** Clinical tumor samples, good depth and read length; check dbGaP restrictions for associated clinical data.

**Suggested first steps (3–5 sample quick test):**
1. Choose 3 publicly‑available SRRs (confirm per‑run access) and run **FastQC**.
2. If needed, trim with **FASTX** and re-run FastQC on trimmed reads (document parameters).
3. Align with STAR and run QC metrics (gene body coverage, duplication, rRNA).
4. If using clinical metadata, check dbGaP access requirements and plan approvals if needed.

---

## Quick recommendations ✅
- All three candidates are **suitable for class projects**: public (or public runs available), deep sequencing, and 2×150 reads for robust downstream analysis.
- If you want, I can prepare a small reproducible starter script to: download 3 SRRs, run **FastQC** → (optional) **FASTX** trim → **FastQC** → **MultiQC** and produce a short QC report.

---

**Files created:** `dataset_shortlist_summary.md` (this document)

**Next action:** confirm which dataset (or two) your group prefers and I’ll create the starter pipeline and a 3‑sample runbook. ✍️
