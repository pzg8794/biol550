## Candidate datasets (meets constraints)

**Shortlist summary:** `dataset_shortlist_summary.md` — concise one‑page shortlist with starter SRR lists and suggested first‑steps (see project folder).

1) **PRJNA1406761 / SRP665664** — iPSC small‑intestine organoids (human)  
   - Samples: **21** (meets >=20)  
   - Read config: **2×150 bp** (AvgSpotLen ≈ 300)  
   - Typical depth: **~30–50M spots / sample** (e.g., SRR36938303 = 41,097,756 spots)  
   - Access: **Public**  
   - Why it fits: Eukaryotic RNA‑seq, paired 150 bp, per‑sample depth ≥40M for many runs.  
   - Link: https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP665664

2) **PRJNA717662 / SRP312283** — Long‑term blood transcriptome after SARS‑CoV‑2 infection (human)  
   - Samples: **152** (>>20)  
   - Read config: **2×150 bp** (stated)  
   - Typical depth: **tens to >100M spots / sample** (example SRR15510543 = 70.9M spots)  
   - Access: **Public**  
   - Why it fits: large cohort, deep 2×150 sequencing suitable for differential expression and subgroup analyses.  
   - Link: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662

3) **PRJNA292477 (TOPMed / Framingham)** — Whole‑transcriptome RNA‑seq from NHLBI TOPMed cohorts (human)  
   - Samples: **many (cohort-level; dozens to hundreds)**  
   - Read config: **2×150 bp** (AvgSpotLen ≈ 300; targeted 50–75M reads)  
   - Typical depth: **~40–75M reads per sample** (example SRR36534089 = 55.8M spots)  
   - Access: **Controlled (dbGaP)** — requires dbGaP approval for individual-level access  
   - Why it fits: large population cohort ideal for population / ancestry stratified analyses (diabetes, CVD, etc.).  
   - Link (example run): https://www.ncbi.nlm.nih.gov/sra/SRX31552375

---

## New candidate studies (high level) ✅

1. **CPTAC — Triple Negative Breast Cancer (TNBC)**  
   - Example: PRJNA748788 / SRP387588 (CPTAC: Molecular Dissection of Chemotherapy Response in TNBC)  
   - Why promising: many samples, Illumina NovaSeq runs with per‑run spots ~35–48M and base_count → ≈300 bases/spot (≈2×150).  
   - Example run: SRX16459773 (SRR20427233: 42.3M spots, 12.8G bases).  
   - Access: Public (some CPTAC datasets reference dbGaP — check sample-level access).  
   - Link: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA748788

2. **CPTAC — Ovarian (HGSOC) proteogenomic study**  
   - Example: PRJNA910283 / SRP422337 (CPTAC: Proteogenomic studies of ovarian tumor responses)  
   - Why promising: many tumor samples, very deep NovaSeq runs (examples with 60–150M spots).  
   - Note: some runs are 2×100 bp (check run‑level read length; many runs are deep enough but read length varies).  
   - Example run: SRX19356952 (SRR23447671: 87.1M spots, 17.4G bases — **100 bp pairs** per metadata)  
   - Access: Public / some controlled elements; check per‑sample access.  
   - Link: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA910283

3. **PsychENCODE — autism / human brain RNA‑seq (post‑mortem)**  
   - Example umbrella projects: PRJNA308995 / PRJNA304334 (PsychENCODE brain RNA‑seq collections)  
   - Why promising: large sample counts (many 20+ cohorts aggregated), many high‑depth runs for brain tissue — excellent for brain‑related ideas (THC/sleep/neurological disorders).  
   - Note: access & read lengths vary by subproject; many datasets are controlled-access (Synapse / dbGaP) — will verify which subprojects are public and have ≥2×150.  
   - Link: https://www.ncbi.nlm.nih.gov/bioproject/?term=psychENCODE

---
