# BIOL550 — Week 7 (Other applications) — Paper notes

## Kumar et al. (2021) — *One size does not fit all: Tuning eDNA protocols for high- and low-turbidity water sampling*

- PDF: `BIOL550-Week7_Girish_2020_EnvironmentalGenetics.pdf` (filename says “2020”, but the article dates are 2021)
- Journal: *Environmental DNA* (Special Issue)
- DOI: `10.1002/edn3.235`
- Received/Revised/Accepted: 2021-02-25 / 2021-05-24 / 2021-05-26
- Data availability:
  - SRA BioProject: `PRJNA742717`
  - Dryad: `10.5061/dryad.ghx3ffbp6`

### What problem are they solving?

eDNA metabarcoding results depend heavily on *pre-PCR sample processing* (how much water you filter, what filter you use, and how you extract/clean DNA). The paper asks: **how do extraction method, filter pore size, and sampling effort interact with water type (turbid estuary vs clear coastal water) to affect DNA yield, PCR inhibition, and fish community detection?**

### Study system & experimental design

Two habitats on Florida’s east coast:
- **High-turbidity estuarine site:** Geiger Point near Crane Creek in the Indian River Lagoon (Secchi depth ≈ 73 cm).
- **Low-turbidity coastal site:** ~0.5 mile offshore of Sebastian Inlet, sampled outside the plume (Secchi depth ≈ 230 cm).

Sampling:
- 50 × 500 mL surface-water replicates per site (sterile bottles), plus negative field controls (RO water).
- Samples stored on ice and filtered within ~6 hours.

They run two main experiments (fish 16S metabarcoding):

1) **Experiment 1 (extraction method + inhibition):**
   - 25 replicates per habitat filtered on **0.45 µm** MCE filters.
   - Filters cut in half; halves assigned across **5 extraction methods** (≈10 technical replicates per method):
     - `QBT`: Qiagen DNeasy Blood & Tissue
     - `OMT`: Omega Bio-tek E.Z.N.A Tissue DNA
     - `QPW`: Qiagen DNeasy PowerWater
     - `OPW`: Omega Bio-tek E.Z.N.A Water DNA
     - `PCI`: phenol–chloroform–isoamyl alcohol (no lysozyme incubation)
   - PCR inhibition assessed via qPCR across dilution series (undiluted, 1:1, 1:5, 1:10).
   - Inhibitor cleanup evaluated with **Zymo OneStep PCR Inhibitor Removal Kit** (tested on selected turbid-water extractions).

2) **Experiment 2 (filter pore size):**
   - Compare **0.2, 0.45, 1.0, 3.0 µm** MCE filters (0.2 µm omitted for turbid site due to clogging).
   - All extracted with `QBT` and treated with the Zymo inhibitor-removal step.
   - Includes the 0.45 µm set from Experiment 1 plus additional samples from 2019-05-15 (N≈10 per pore-size treatment).

### Wet lab pipeline (important implementation details)

Capture & storage:
- Filtration through MCE membranes; filters stored in **Longmire’s buffer** at **−20°C** until extraction.

PCR / library prep:
- Two-step PCR, targeting fish mitochondrial **16S** (~178–228 bp) with Fish16sF/D and 16s2R primers.
- Illumina MiSeq V3, **2×300** sequencing.

Bioinformatics (high-level):
- Merge reads (USEARCH), primer removal/de-replication/error filtering (VSEARCH), denoise with **UNOISE3** to create ASVs (min 5 reads).
- Taxonomy via BLASTn to NCBI; filters for assignment confidence (e.g., bitscore threshold and full query coverage).
- Species/genus/etc. assignment thresholds (species at ≥99% similarity; genus ≥97%; family ≥95%; order ≥90%; class ≥85%; phylum ≥80%), with additional ecological plausibility checks (regional occurrence).

Statistics / community comparisons:
- ANOVA/Tukey for DNA yield/reads/ASVs/species.
- Bray–Curtis NMDS + ANOSIM to test community differences.
- Species accumulation curves (10,000 permutations).

### Key results (what actually changed outcomes)

**1) Water type dominated everything (turbid vs clear).**
- Turbid samples produced substantially higher DNA yield but also stronger PCR inhibition.
- Clear-water samples produced low DNA yield, weaker inhibition, and *high between-replicate variability* in detected taxa.

**2) Extraction method mattered a lot for DNA yield and inhibition, but less for “standing diversity” in turbid water.**
- DNA yield (turbid; ng/µL, mean ± SD): `PCI` highest (~107), `QPW` (~72), `QBT/OMT` (~49–50), `OPW` lowest (~30).
- DNA yield (clear): low across the board; `OPW` failed to yield detectable DNA in clear-water samples.
- PCR inhibition: strongest in turbid water, especially with `PCI`; power-water kits (`QPW/OPW`) reduced inhibition without extra cleanup, but the other kits typically required cleanup/dilution.
- Species detections in turbid water were *stable across extraction methods*: most species were consistently recovered; few “unique” species were method-specific and tended to be low read count.
- Species detections in clear water were *unstable across replicates and methods*: only a small core set overlapped across treatments; many taxa appeared in only one method/replicate.

**3) Filter pore size (0.2–3.0 µm) had weak effects on DNA yield and mixed/limited effects on composition.**
- Within a habitat, DNA yield did not differ significantly by pore size in their comparisons.
- In turbid water, smaller pores can clog; their practical recommendation favored **1.0–3.0 µm** to reduce clogging while still capturing community signal.
- In clear/oligotrophic settings, they still leaned toward **0.2–0.45 µm** (unless clogging) because target DNA can be sparse.

**4) Replicate variability in clear water implies much larger volumes are needed offshore.**
- Even with same-day samples, offshore (clear) replicates showed “patchy” eDNA distribution and low overlap across detected species.
- Their synthesis recommendation: **filter ≥2 L per replicate** in habitats where eDNA is expected to be low (open ocean/oligotrophic).

**5) Filter storage time in Longmire’s can change apparent DNA yield if you only extract the filter (and discard buffer).**
- They observed ~5× lower DNA yield when filters had been stored much longer before extraction (in their turbid-water batches processed ~18 months later).
- Interpretation: cellular material can lyse into the buffer over time; if you discard the buffer and only extract the filter, you may “lose” DNA that moved off-filter.
- Practical implication: extract soon after collection, or extract **filter + buffer** if storage is prolonged.

### Take-home protocol guidance (actionable)

**If sampling a turbid estuary / high inhibitor load:**
- Expect high DNA yield *and* inhibition; plan for inhibitor management.
- Practical extraction choice (cost-conscious): `OMT` (Omega tissue kit) + **Zymo inhibitor-removal** step (or equivalent).
- Consider **1.0–3.0 µm** filters to reduce clogging (0.2 µm may be impractical).

**If sampling clear, offshore / oligotrophic water:**
- Expect low and patchy eDNA; protocol knobs (extraction/pore size) don’t rescue insufficient sampling effort.
- Increase sampling effort: **≥2 L per replicate** (their recommended minimum), and use many biological replicates.
- Smaller pore sizes (**0.2–0.45 µm**) are reasonable if clogging is not an issue.
- Be cautious with `OPW` (Omega water kit) in low-DNA settings (failed here).

**General best practice:**
- Run a pilot study per new environment: optimize water volume, inhibitor handling, and filtration choices before scaling.

### Limitations / things to keep in mind

- Single geographic region and two sites; generalizability depends on how similar your systems are (inhibitor profiles, turbidity sources, biomass, mixing).
- Marker choice and primer bias: fish 16S metabarcoding captures a particular slice of biodiversity; results may differ for other markers/taxa.
- Offshore conclusions are constrained by their 500 mL baseline (used for comparability); the “patchiness” result is the key message, but exact volume thresholds may vary by habitat and target.
- Storage-time effects are a methodological warning: if comparing studies/batches, you must control storage and extraction timing, or extract buffer+filter.

### BIOL550 “what to remember” (quick prompts)

- Why do turbid waters yield more eDNA but inhibit PCR more?
- Why can dilution relieve inhibition but increase false negatives (especially in clear-water samples)?
- Why might pore size not strongly affect yield (particle-associated eDNA, mitochondria/cells in larger fractions)?
- Why does offshore eDNA look “patchy” across replicates (mixing/advection, low biomass-to-volume, stochastic capture)?
- What’s the cost/performance tradeoff of “power-water kits” vs tissue kits + inhibitor cleanup?

---

## Wang et al. (2022) — *Endothelial progenitor cells stimulate neonatal lung angiogenesis through FOXF1-mediated activation of BMP9/ACVRL1 signaling*

- PDF: `BIOL550-Week7_Wang2022_scRNASeq.pdf`
- Journal: *Nature Communications*
- DOI: `10.1038/s41467-022-29746-y`
- Received/Accepted: 2021-06-28 / 2022-03-28
- Data/code:
  - scRNA-seq (GEO): `GSE178184`
  - ACDMPV microarray dataset reused (GEO): `GSE54780`
  - FOXF1 ChIP-seq (GEO): `GSE77951` (paper also references FLI1 ChIP-seq `GSE69101`; the PDF’s GEO URL appears to contain a typo)
  - Code repo (paper): `github.com/WGLUN/acdmodel`

### Highlights

- Uses scRNA-seq to pinpoint a **gCAP/EPC-specific** defect in `Foxf1WT/S52F` lungs: **ACVRL1 pathway down in gCAPs**, not aCAPs.
- Identifies **FOXF1+cKIT+ EPCs** as a **proliferative** gCAP subset and links their dysfunction to impaired neonatal angiogenesis.
- Mechanism: **FOXF1 + FLI1** transcriptional synergy activates **ACVRL1 (ALK1)** via a conserved promoter element; the **S52F FOXF1** mutant is inactive.
- Functional chain validated: FOXF1 loss → ↓ACVRL1 → ↓BMP9/ACVRL1 → **↓pSMAD1** → reduced angiogenesis (in vitro).
- In vivo perturbation: endothelial `Acvrl1` knockdown in neonates reduces **capillary density**, worsens **alveolarization**, and lowers **oxygenation**.
- Therapeutic angle: **BMP9** administration partially **rescues** angiogenesis/alveolarization metrics in ACVRL1-deficient and FOXF1-mutant contexts.

### What problem are they solving?

Neonatal lung development requires rapid **angiogenesis** (capillary formation) coordinated with **alveolarization**. A lung endothelial progenitor population (FOXF1+ EPCs; a subset of “general capillary” endothelial cells) is known to be important, and **FOXF1 loss-of-function** causes **ACDMPV** (alveolar capillary dysplasia with misalignment of pulmonary veins), a lethal congenital disorder characterized by sparse alveolar capillaries. The core question here is: **what signaling pathway do FOXF1+ EPCs use to drive neonatal lung angiogenesis, and can it be therapeutically rescued?**

### High-level hypothesis / model

FOXF1 (with ETS factor **FLI1**) transcriptionally activates **ACVRL1 (ALK1)**, enabling **BMP9 → ACVRL1 → pSMAD1** signaling in pulmonary EPCs to promote angiogenesis and alveolarization. In FOXF1-deficient ACDMPV models, this axis is reduced; providing BMP9 can restore signaling and improve vascular/alveolar outcomes.

### Experimental system(s)

- **Mouse ACDMPV model:** `Foxf1WT/S52F` heterozygous knock-in (S52F mutation in FOXF1 DNA-binding domain; reported in ACDMPV patients).
- **Human relevance:** reanalysis of published ACDMPV lung expression datasets; key pathway genes are reduced in ACDMPV lungs vs donors.
- **Cell system for mechanisms:** fetal lung endothelial cell line (MFLM-91U) for promoter, signaling, and Matrigel angiogenesis assays.
- **Neonatal in vivo perturbations:** endothelial-targeting nanoparticles delivering `siAcvrl1`, and recombinant **BMP9** rescue.

### scRNA-seq design (what they actually sequenced)

- Tissue: **E18.5 embryonic mouse lung** single-cell suspension.
- **CD45+ immune cells depleted** before sequencing (to enrich non-hematopoietic lineages).
- Platform: **10x Genomics 3' v3**; sequencing depth ~50k reads/cell; UMI-based counts (Cell Ranger v3.0).
- QC filters (as described): remove cells with <500 or >8000 features; remove cells with >20% mitochondrial reads.
- Integration/clustering: Seurat 3.0 anchor-based integration; UMAP; 12 major clusters (epithelial, endothelial, and multiple mesenchymal clusters).

### Key results (story arc)

**1) FOXF1 mutation changes lung cellular composition pre-birth.**
- In `Foxf1WT/S52F` vs WT E18.5 lungs: **endothelial** and **AT1** cell proportions decrease; a “matrix fibroblast” cluster increases.
- Since FOXF1 is expressed in endothelial lineages, they focus downstream analyses on endothelial subtypes.

**2) Endothelial subtype resolution points to a gCAP-specific signaling defect.**
- Endothelial cells subdivide into arterial/venous/lymphatic and two microvascular types:
  - **gCAPs (general capillary)**
  - **aCAPs (aerocytes / alveolar capillary)**
- FOXF1 is enriched in capillary endothelial cells; importantly, **Foxf1 and Acvrl1 drop specifically in gCAPs** (not aCAPs) in the mutant.
- Downstream **ACVRL1 target genes** (e.g., `Tmem100`, `Calcrl`, `Clec14a`, `Id1`, `Id3`) are also reduced in mutant gCAPs, consistent with impaired pathway activity.

**3) gCAPs are heterogeneous; FOXF1+ EPCs are a proliferative gCAP subset.**
- gCAPs split into:
  - **FOXF1+ gCAPs** that express `Kit` and proliferation marker `Mki67` (mapped to FOXF1+ EPCs).
  - **FOXF1− gCAPs** (distinct signature; less proliferative).
- This provides a cell-type explanation for why a gCAP-specific defect can matter for vascular growth.

**4) FOXF1 deficiency reduces ACVRL1 signaling in mouse EPCs and in human ACDMPV.**
- In FACS-purified EPCs (FOXF1+cKIT+CD31+CD45−), mutant EPCs show reduced `Acvrl1` and downstream targets.
- Human ACDMPV lungs show reduced `ACVRL1` and at least one target (`CALCRL`) vs donor lungs in reanalyzed datasets.

**5) Mechanism: FOXF1 directly activates Acvrl1 via an evolutionarily conserved promoter element, requiring FOX–ETS synergy.**
- FOXF1 binds the `Acvrl1` promoter region in ChIP-seq datasets.
- Reporter assays identify a conserved promoter segment (ACE80 within ACE400) that drives FOXF1-dependent transcription.
- The **S52F FOXF1 mutant is transcriptionally inactive** on this element.
- Co-transfection shows **FOXF1 synergizes with ETS factor FLI1** (not ERG/ETS1) to activate `Acvrl1` promoter activity.
- FOXF1 also synergizes with FLI1 to stimulate its **own** promoter (auto-regulatory loop model).

**6) Functional consequence: FOXF1 is required for BMP9 → ACVRL1 → pSMAD1 signaling and angiogenesis in vitro.**
- BMP9 increases pSMAD1 and ACVRL1; **FOXF1 knockdown reduces ACVRL1 and pSMAD1** after BMP9 stimulation.
- A SMAD1-responsive reporter (BRE-LUC) is activated by BMP9; inhibition of **FOXF1, ACVRL1, or ENG** reduces this activation.
- Matrigel assay: FOXF1 knockdown impairs sprouting/branching; **BMP9 partially rescues**, and **ALK1-Fc** (ligand trap) blocks the rescue.

**7) In vivo: endothelial Acvrl1 knockdown impairs neonatal lung vascularization; BMP9 improves outcomes.**
- Nanoparticle delivery of `siAcvrl1` at P2 reduces `Acvrl1` specifically in endothelial cells.
- Phenotypes later include reduced oxygenation, reduced capillary density, and alveolar simplification.
- BMP9 treatment improves oxygenation and capillary density and partially improves alveolarization metrics in the knockdown setting (and is presented as rescue in FOXF1-deficient contexts as well).

### Why this matters (BIOL550 relevance)

- Concrete example of **single-cell RNA-seq used to identify a pathway signature** in a rare cell subpopulation and connect it to:
  - transcriptional mechanism (promoter + ChIP-seq),
  - in vitro signaling + functional assays,
  - and in vivo perturbation/rescue.
- Illustrates the “full stack” of scRNA-seq analysis: QC → integration → clustering → subtype annotation → DE testing → pathway enrichment → targeted validation.

### Limitations / cautions

- scRNA-seq is done at a single developmental time point (E18.5); pathway dynamics across postnatal stages are inferred rather than fully time-resolved.
- Mutant vs WT scRNA-seq uses pooled embryos per genotype; biological replicate structure is limited at the scRNA-seq experiment level.
- The “rescue” framing depends on how broadly BMP9 acts beyond EPCs (systemic ligand; potential effects on other vascular beds/cell types).

### BIOL550 “what to remember” (quick prompts)

- Why does **subclustering** (gCAP vs aCAP; EPC subset) change the biological interpretation versus bulk “endothelial DEGs”?
- What does UMI-based scRNA-seq make easier (and what does it not solve) when you want to compare mutant vs WT?
- How do they go from “Acvrl1 down in gCAPs” → “FOXF1 directly regulates Acvrl1” (what evidence types bridge this)?
- In a pathway chain (FOXF1 → ACVRL1 → pSMAD1), what perturbations best establish directionality vs correlation?
- What are the main threats to validity in scRNA-seq comparisons (batch effects, doublets, ambient RNA, composition shifts), and which ones are addressed here?

---

## Week 7 — Discussion log (interests, questions, project/side-project ideas)

### eDNA protocols (Kumar et al., 2021)

- Can dilution series be used to “normalize” eDNA data?
  - **qPCR:** you can correct concentrations for dilution *after* confirming inhibition is cleared (Ct shifts behave as expected).
  - **metabarcoding:** dilution is **not** a reliable normalizer for read counts/relative abundance (nonlinear PCR + library effects; higher false negatives).
- How can dilution testing be used constructively?
  - As a **QC inhibition score** (minimum dilution/cleanup needed for linear amplification) and as a **covariate** in detection/richness models.
  - As part of a **protocol decision rule**: cleanup vs dilution vs rerun vs increase volume/replicates.
- Side-project directions:
  - **Occupancy/detection modeling**: `P(detect)` (or richness) as a function of turbidity, volume filtered, inhibition score, extraction method, batch.
  - **Protocol recommender / cost optimizer**: choose volume × replicates × pore size × inhibitor-handling under time/budget constraints.
  - **Failure predictor**: predict which samples will inhibit PCR (or have low yield) from quick field/lab measurements.

### scRNA-seq + mechanisms (Wang et al., 2022)

- What are “ATs” in the scRNA-seq clusters?
  - `AT1` = alveolar type I epithelial cells (gas exchange surface)
  - `AT2` = alveolar type II epithelial cells (surfactant + progenitors)
  - `AT1/AT2` often reflects a transitional/intermediate epithelial state.
- Follow-up / interest questions:
  - How robust is the gCAP/aCAP/EPC subtype call across time points and batches (E18.5 vs postnatal)?
  - Does BMP9 rescue act specifically through EPCs, or via broader endothelial/mesenchymal effects (systemic ligand)?
  - What’s the best way to separate “composition shift” effects from true within-cell-state DE in mutant vs WT?
  - If EPCs are the key lever, what would a cleaner causal test look like (cell-type-specific perturbation of FOXF1/FLI1/ACVRL1)?
