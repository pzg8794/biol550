# SEMESTER TIMELINE: BIOL550 × DSCI601 Integration Map
## Week-by-Week Coordination & Deliverables

---

## JANUARY (Weeks 1–4: Foundation & Proposal Phase)

### WEEK 1: Sequencing Fundamentals & Project Launch

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Read QC workflow + 3 bias modes (GC bias, polyA, low-complexity regions)
- ✓ Code B: FASTQ parser + basic QC report (mean Q score, N50, adapter %age)
- ✓ Spine Ledger C: "QC threshold decision: reads < Q20 removed; recorded in QC_log.txt"

**DSCI601 Deliverables:**
- ✓ Advisor meeting #1 (30 min): Problem framing, data access, team finalization
- ✓ Initial project pitch (informal, 1 page): Problem statement, why it matters, rough scope

**Sync Point:**
- GitHub repo created with folder structure
- BIOL550 W1 methods memo shared with DSCI601 advisor for context

---

### WEEK 2: Read Mapping & Cross-Contamination Risk

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Dual-mapping strategies, cross-mapping bias, misalignment rates
- ✓ Code B: Toy dual-mapper using k-mer lookup (Bowtie-style); report off-target %age
- ✓ Spine Ledger C: "Mapping protocol: combined reference strategy to reduce off-target risk in low-abundance transcripts"

**DSCI601 Deliverables:**
- ✓ Advisor feedback: Comments on data quality, fairness strategy, timeline
- ✓ Begin literature review (parallel reading, not written yet)

**Sync Point:**
- BIOL550 W2 code merged to GitHub `/biol550/mapping.py`

---

### WEEK 3: Normalization & Batch Effects

**BIOL550 Deliverables:**
- ✓ Methods Memo A: CPM, TMM, quantile normalization; batch effect masking/amplification by subgroup
- ✓ Code B: CPM + robust PCA batch removal; visualize disparate impact by ancestry
- ✓ Spine Ledger C: "Normalization rule: stratified CPM (per batch, then align) to preserve subgroup signal"

**DSCI601 Deliverables:**
- ✓ Literature review outline: 15–20 key papers identified (RNA biomarkers + fairness + ML in health)

**Sync Point:**
- BIOL550 W3 code & memo reviewed by DSCI601 advisor for fairness considerations

---

### WEEK 4: Feature Selection & Dimensionality Reduction

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Variance filtering, DESeq2, PCA; disparate impact audit of each method
- ✓ Code B: DESeq2-like DE calculation; audit which genes lost by percentile cutoff
- ✓ Spine Ledger C: "Feature selection: median variance threshold; validate retained genes by ancestry fairness audit"

**DSCI601 Deliverables:**
- ✓ Preliminary Proposal (2–3 pages):
  - Problem statement (fair RNA biomarker discovery)
  - Data plan (source, N subjects, N genes, protected attributes)
  - Fairness strategy (disparate impact target: < 0.20 difference)
  - Timeline & milestones
- ✓ Preliminary Proposal Presentation (10 min in-class)

**Sync Point:**
- DSCI601 proposal incorporates BIOL550 W1–W4 data insights
- Monthly sync call #1: Review W1–W4 progress; confirm data access; align fairness goals

---

## FEBRUARY (Weeks 5–8: Methods Development & Fairness Baseline)

### WEEK 5: RNA Structure & Secondary Motif Prediction

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Nussinov algorithm, dynamic programming, structural complexity
- ✓ Code B: Implement Nussinov (or use ViennaRNA); classify top 50 biomarker candidates by fold complexity
- ✓ Spine Ledger C: "RNA structure filter: exclude transcripts with Boltzmann complexity > 95th percentile to ensure reliable measurement"

**DSCI601 Deliverables:**
- ✓ Related Work Survey draft (3–4 pages, ~12–15 key papers)
  - RNA biomarkers in disease diagnosis (2–3 papers)
  - Algorithmic fairness & disparate impact (3–4 papers)
  - Machine learning in healthcare (2–3 papers)
  - Fairness-aware modeling strategies (2–3 papers)

**Sync Point:**
- BIOL550 W5 structure predictions used to validate feature selection from W4

---

### WEEK 6: Data Quality & Missing Value Imputation

**BIOL550 Deliverables:**
- ✓ Methods Memo A: KNN, MICE, zero-inflation imputation; missingness patterns by abundance & subgroup
- ✓ Code B: Implement KNN + MICE; compare disparate impact of each on minority groups
- ✓ Spine Ledger C: "Imputation protocol: zero-inflation model with subgroup-stratified parameters to prevent aggregate bias"

**DSCI601 Deliverables:**
- ✓ Related Work Survey final version (5–8 pages, >20 sources)
- ✓ Revised Proposal (incorporating advisor & peer feedback from W4 presentation)

**Sync Point:**
- DSCI601 related work finalized; cites BIOL550 W1–W6 preprocessing decisions

---

### WEEK 7: Exploratory Data Analysis & Subgroup Visualization

**BIOL550 Deliverables:**
- ✓ Methods Memo A: t-SNE, UMAP, heatmaps, PCA; visualization bias & power dynamics
- ✓ Code B: UMAP + supervised PCA; color by case/control AND by ancestry; document visual patterns
- ✓ Spine Ledger C: "Visualization standard: all plots include ancestry/demographic coloring to surface disparities early"
- ✓ Midterm Synthesis Memo (3 pages): Integrate W1–W7 decisions; rationale for each; preliminary disparate impact baseline

**DSCI601 Deliverables:**
- ✓ Advisor Feedback Report #2 (midterm check-in):
  - Progress update (proposal finalized, related work done)
  - Code review of BIOL550 preprocessing pipeline (if available early)
  - Fairness strategy confirmation (equalized odds vs. demographic parity choice, etc.)

**Sync Point:**
- Monthly sync call #2: BIOL550 midterm synthesis + DSCI601 midterm advisor feedback reviewed together
- BIOL550 preprocessing pipeline half-complete; DSCI601 modeling strategy sketched

---

### WEEK 8: Biomarker Validation & Reproducibility

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Cross-tissue/platform validation, replication cohorts, reproducibility metrics (ICC)
- ✓ Code B: Compute ICC stratified by subgroup (target ICC > 0.7 per group); flag subgroups failing
- ✓ Spine Ledger C: "Reproducibility standard: report ICC *within each ancestry group*; flag if ICC < 0.7 in any group (alert for remediation)"

**DSCI601 Deliverables:**
- ✓ Continue modeling preparation (feature engineering strategy, model selection, fairness metrics)

**Sync Point:**
- BIOL550 reproducibility audit informs DSCI601's validation strategy

---

## MARCH (Weeks 9–11: Fairness Audits & Modeling)

### WEEK 9: Statistical Testing & Confounding Adjustment

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Limma, edgeR, GLMs with covariates; confounding-adjustment bias; causal DAGs
- ✓ Code B: Covariate-adjusted DE test; validate results stratified by ancestry (not aggregate)
- ✓ Spine Ledger C: "Adjustment protocol: confounders chosen via causal reasoning; results stratified by ancestry to prevent erasure of subgroup signals"

**DSCI601 Deliverables:**
- ✓ Approach Writeup (2–3 pages):
  - Feature engineering strategy (using BIOL550 W4–W9 decisions)
  - Model architecture (baseline: logistic regression; improved: random forest or gradient boosting)
  - Fairness metrics chosen (disparate impact, equalized odds, calibration error)
  - Cross-validation strategy (stratified by ancestry to avoid leakage)
- ✓ Begin model implementation (code in `/dsci601/modeling.py`)

**Sync Point:**
- DSCI601 approach writeup incorporates BIOL550 W9 insights on confounding
- Monthly sync call #3: Review W9 fairness implications; align on feature engineering

---

### WEEK 10: Machine Learning Readiness & Feature Engineering

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Log-transformation, scaling, interaction terms; feature engineering bias
- ✓ Code B: Robust scaling (e.g., Huber); apply to features stratified by ancestry
- ✓ Spine Ledger C: "ML preprocessing: stratified scaling (robust scaler per ancestry) to preserve within-group variance and avoid aggregation bias"

**DSCI601 Deliverables:**
- ✓ Architecture Writeup (2–3 pages + diagram, CO-AUTHORED with BIOL550):
  - Pipeline diagram: raw data → preprocessing → features → modeling → fairness eval → outputs
  - Tool choices (Python, scikit-learn, pandas, etc.)
  - Data split strategy (train/val/test, stratified by ancestry)
  - Docker containerization for reproducibility
- ✓ Code Review Assignment: Peer review of classmate's code (provide 1 page feedback)
- ✓ Continue model training; baseline + improved versions

**Sync Point:**
- Architecture memo finalized jointly; both instructors sign off
- BIOL550 W1–W10 preprocessing fully documented in code + memos

---

### WEEK 11: Model-Agnostic Fairness & Bias Audit (BIOL550 Baseline)

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Disparate impact, demographic parity, equalized odds; EQUITAS framework applied to preprocessed data
- ✓ Code B: Build fairness audit dashboard (disparate impact matrix, fairness curves, 80-rule compliance tests)
- ✓ Spine Ledger C: "Fairness baseline: current biomarker set achieves X% disparate impact (recorded); target = 100% compliance post-modeling"

**DSCI601 Deliverables:**
- ✓ Ethics & Fairness Writeup (3–5 pages, CO-AUTHORED with BIOL550):
  - Baseline fairness (from BIOL550 W11 audit): disparate impact of preprocessing
  - Model fairness (classifier performance, calibration *by ancestry*)
  - Bias mitigation strategy: Which methods will be applied? (post-hoc calibration, resampling, cost-weighting?)
  - EQUITAS framework application (community co-design, binding governance, civic literacy)
  - Limitations & ethical considerations
- ✓ Model fully trained; fairness evaluation complete

**Sync Point:**
- Ethics writeup integrates BIOL550 W11 baseline disparate impact
- DSCI601 fairness eval uses BIOL550's audit tools

---

## APRIL (Weeks 12–14: Integration, Documentation & Final Submission)

### WEEK 12: Mitigation Strategies & Data Augmentation

**BIOL550 Deliverables:**
- ✓ Methods Memo A: SMOTE, undersampling, fairness-aware augmentation; biological plausibility validation
- ✓ Code B: SMOTE per ancestry group; measure impact on disparate impact metrics
- ✓ Spine Ledger C: "Data augmentation: SMOTE applied separately per ancestry group to preserve within-group variance and minority subgroup signal"

**DSCI601 Deliverables:**
- ✓ Report Rough Draft (10–12 pages):
  - Methods section (BIOL550 W1–W12 summarized)
  - Results section (model performance, fairness metrics, disparate impact before/after mitigation)
  - Discussion (what worked, what didn't, limitations)
  - Incorporate BIOL550 methods memos + DSCI601 modeling results
- ✓ Finalize code; ensure all functions documented

**Sync Point:**
- Monthly sync call #4: Review draft report; identify any missing pieces
- BIOL550 W1–W12 complete; DSCI601 modeling ready for demo

---

### WEEK 13: Reproducibility, Documentation & Endterm Prep

**BIOL550 Deliverables:**
- ✓ Methods Memo A: Docker/conda environments, GitHub workflows, README standards, literate programming
- ✓ Code B: Containerize preprocessing pipeline; test on two machines; verify reproducibility
- ✓ Spine Ledger C: "Reproducibility requirement: code released under CC-BY-4.0; all dependencies pinned to specific versions in environment.yml"

**DSCI601 Deliverables:**
- ✓ Endterm Demo Presentation (15 min, LIVE):
  - Live run-through of the pipeline (data → preprocessing → modeling → fairness eval)
  - Show key results (AUC, disparate impact, before/after mitigation)
  - Explain fairness strategy to mixed audience
  - Q&A from classmates + instructor
- ✓ Endterm Code Submission (GitHub):
  - All code merged to `/biol550/` + `/dsci601/` folders
  - README updated with installation + example run instructions
  - All functions documented; unit tests pass
  - Version control history clean (meaningful commits)

**Sync Point:**
- GitHub repo fully functional & publicly available
- DSCI601 demo showcases integrated BIOL550 + DSCI601 work

---

### WEEK 14: Synthesis, Capstone Presentations & Final Report

**BIOL550 Deliverables:**
- ✓ Methods Memo A (Final Synthesis, 5–8 pages):
  - Executive summary of all 14 weeks of decisions
  - Rationale for each decision
  - Failure modes identified + how mitigated
  - How each decision contributed to fairness goal
  - Links to GitHub commits for each decision
- ✓ Code B (Final Pipeline Integration Test):
  - Full preprocessing pipeline runs end-to-end
  - Generates reproducible results document (CSV with metrics, plots)
- ✓ Spine Ledger C (Final Review):
  - All 14 decisions documented + linked to commits
  - Disparate impact reduction trajectory shown
- ✓ **BIOL550 Capstone Presentation (15–20 min, IN-CLASS):**
  - RNA biology: what biomarkers matter & why
  - 3–4 bias modes discovered + how addressed
  - Fairness strategy: preprocessing decisions that reduced disparate impact
  - Reproducibility: how code enables external audit
  - Handoff to DSCI601 modeling: what data science should focus on
  - Q&A from classmates

**DSCI601 Deliverables:**
- ✓ **Final Report (12–15 pages, SUBMITTED):**
  - Abstract (1 page)
  - Introduction (2 pages, incorporating BIOL550 biology background)
  - Methods (4–5 pages, BIOL550 contributes 2–3 on preprocessing; DSCI601 contributes 2 on modeling)
  - Results (3–4 pages, disparate impact before/after, model performance, fairness metrics)
  - Discussion & Limitations (2–3 pages)
  - Conclusion (0.5–1 page)
  - References (50+ sources)
  - Appendices: fairness audit matrix, architecture diagram, environment setup
- ✓ **Final Code Submission (GitHub):**
  - Shared repo at GitHub with final code
  - All tests passing
  - README fully updated
  - DOI generated (e.g., via Zenodo) for permanence & citation

**Shared Deliverables (Already Finalized):**
- ✓ Data Card (2–3 pages, finalized by W10, reviewed by both instructors)
- ✓ Architecture Memo (2–3 pages + diagram, finalized by W10, jointly signed)
- ✓ Fairness Assessment Report (5–8 pages, finalized by W11, jointly signed)

**Sync Point:**
- **CELEBRATORY FINAL SYNC CALL:** Both instructors, you, and DSCI601 advisor(s) meet to review completed project
- Celebrate integration: One dataset, one fairness story, two capstones, zero duplicate work
- Discuss lessons learned & future directions (research pathway, publication plan, etc.)

---

## SUMMARY: Key Dates & Deadlines

| Week | BIOL550 | DSCI601 | Shared |
|---|---|---|---|
| 1 | Methods W1 + Code | Advisor meeting #1 | GitHub repo created |
| 2 | Methods W2 + Code | Literature review outline | W2 code merged |
| 3 | Methods W3 + Code | Literature review outline | W3 code merged |
| 4 | Methods W4 + Code | **Preliminary Proposal + Presentation** | Data + fairness strategy aligned |
| 5 | Methods W5 + Code | Related work draft | W5 code merged |
| 6 | Methods W6 + Code | **Related Work Final + Revised Proposal** | W6 code merged |
| 7 | Methods W7 + **Midterm Synthesis** | Continue literature | **Monthly sync #1** |
| 8 | Methods W8 + Code | Advisor meeting #2 | W8 code merged |
| 9 | Methods W9 + Code | **Approach Writeup** + Modeling | Approach incorporates W9 insights |
| 10 | Methods W10 + Code | **Architecture Memo + Code Review** | **Architecture jointly signed** |
| 11 | Methods W11 + Code (fairness baseline) | **Ethics & Fairness Writeup** + Model training | Ethics incorporates W11 audit |
| 12 | Methods W12 + Code | **Report Rough Draft** | **Monthly sync #2** |
| 13 | Methods W13 + Code (reproducibility) | **Endterm Demo + Code Submission** | Final GitHub push |
| 14 | **Capstone Presentation + Final Synthesis** | **Final Report** | **Final sync + celebration** |

---

## GitHub Commit Schedule (Example)

```
Week 1:  git add biol550/qc.py + biol550/methods_W1.md
Week 2:  git add biol550/mapping.py + biol550/methods_W2.md
Week 3:  git add biol550/normalization.py + biol550/methods_W3.md
...
Week 13: git add environment.yml + Dockerfile
Week 14: git merge dsci601/ into main; final release tag v1.0
```

---

## Success Criteria

By end of semester:
- ✅ GitHub repo fully reproducible (clone → run → results match).
- ✅ Both instructors have signed off on data card, architecture, and fairness report.
- ✅ Disparate impact documented (baseline → final); improvement >10 percentage points.
- ✅ Both capstones are ready; tell one coherent fairness story.
- ✅ Code is public + documented; enables external audit.
- ✅ BIOL550 (400 pts) + DSCI601 (120 pts) grades reflect integrated excellence.

---

**This timeline ensures zero duplication and maximum intellectual integration. Ready to go?** 🧬📊✨
