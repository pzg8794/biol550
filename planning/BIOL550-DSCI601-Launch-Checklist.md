# BIOL550 × DSCI601 Integration: Launch Checklist
## Before Week 1 & Week-by-Week Verification

---

## PRE-SEMESTER SETUP (Do by January 20, 2026)

### ☐ Communication & Coordination
- [ ] **BIOL550 Instructor Contact**
  - Email/meeting: Confirm syllabus aligns with 14-week structure above
  - Share this integration strategy document
  - Confirm you can devote 12–15 hrs/week to BIOL550
- [ ] **DSCI601 Advisor Contact**
  - Email/meeting: Confirm project scope (Fair RNA Biomarker Discovery)
  - Schedule first advisor meeting for Week 2–3
  - Confirm DSCI601 timeline (proposal due Week 4, etc.)
- [ ] **Monthly Sync Calendar**
  - Schedule 4 meetings with both instructors:
    - End of January (Week 4)
    - End of February (Week 8)
    - End of March (Week 12)
    - End of April (Week 14 — celebration)
  - 30 min each, 1 hr advance notice

### ☐ GitHub & Repo Setup
- [ ] **Create GitHub Repo**
  - Repo name: `equitable-rna-biomarkers` (or similar)
  - Visibility: Public (to enable community audit)
  - Initialize with basic structure:
    ```
    equitable-rna-biomarkers/
    ├── README.md (placeholder)
    ├── biol550/
    │   ├── methods_memos/
    │   └── spine_ledger.md (empty, ready to fill)
    ├── dsci601/
    ├── data/
    ├── docs/
    └── .gitignore
    ```
  - Add both instructors as collaborators
- [ ] **Create README.md (v0.1)**
  - Project title: "Fair RNA Biomarker Discovery for Equitable Disease Risk Stratification"
  - 2–3 sentence description
  - Link to this integration strategy document
  - Placeholder sections: Data, Methods, Results (to be filled)

### ☐ Data & Environment
- [ ] **Secure Data Access**
  - Identify public dataset (GEO, TCGA, or institutional cohort with IRB approval)
  - Download or set up data access link
  - Document: dataset ID, N samples, N genes, source
  - Confirm dataset includes protected attributes (ancestry, sex, age, site of care)
- [ ] **Python/R Environment**
  - Create `environment.yml` (conda) or `requirements.txt` (pip)
  - Include: pandas, numpy, scikit-learn, scipy, matplotlib, seaborn, statsmodels
  - Test on your machine; commit to repo
- [ ] **Compute Resources**
  - Confirm you have access to compute (laptop, university cluster, cloud VM)
  - If using university cluster: Request account + confirm storage quota
  - Document resource plan in README

### ☐ Documentation & Templates
- [ ] **Create Methods Memo Template** (`biol550/methods_memos/TEMPLATE.md`)
  ```
  # Methods Memo W[N]: [Topic]
  
  ## Summary
  [2 sentences on method]
  
  ## Why It Matters
  [2 sentences on biological/computational relevance]
  
  ## Failure Modes
  1. [Failure mode 1 + mitigation]
  2. [Failure mode 2 + mitigation]
  3. [Failure mode 3 + mitigation]
  
  ## Project Spine Connection
  [Explicit link to how this informs the shared pipeline]
  
  ## Key Takeaway for DSCI601
  [1 sentence on what data scientist should know]
  ```
- [ ] **Create Spine Ledger Template** (`biol550/spine_ledger.md`)
  ```
  # Spine Ledger: Shared Pipeline Decisions
  
  ## Week 1: QC Threshold Decision
  - **Decision:** Reads < Q20 removed
  - **Rationale:** [2–3 sentences]
  - **Impact on fairness:** [How does this affect disparate impact?]
  - **GitHub commit:** [Link to code]
  - **Status:** ✓ Implemented (date)
  
  ## Week 2: ...
  ```

### ☐ Learning Resources
- [ ] **Bookmark Key References**
  - BIO630 Phase 3 report (RNA algorithms + EQUITAS)
  - ISTE780 notes (80 rule, cost-weighting, fairness metrics)
  - IDAI700 EQUITAS paper (framework reference)
  - Your capstone presentations from prior semesters
- [ ] **Set Up Reading List**
  - Fairness in ML: Barocas et al., Buolamwini & Gebru, Mitchell et al.
  - Bioinformatics: Li et al. (RNA-seq methods), Love et al. (DESeq2)
  - Health equity: Marko et al. 2025, Lekadir et al. 2025 (from your IDAI700 work)
  - Create shared Google Drive folder or Zotero library with both instructors

---

## WEEK-BY-WEEK LAUNCH CHECKLIST

### WEEK 1: Sequencing Fundamentals
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W1 written (2 pages, QC workflow + 3 bias modes)
- [ ] BIOL550: Code B submitted (`biol550/qc.py` with FASTQ parser functional)
- [ ] BIOL550: Spine Ledger entry #1 logged with GitHub commit link
- [ ] DSCI601: Advisor meeting #1 scheduled (confirm advisor assigned)
- [ ] GitHub: W1 code merged to main branch; README updated
- [ ] Team: Check-in (informal); confirm all 3 parties have access to repo

### WEEK 2: Read Mapping
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W2 written (dual-mapping, cross-mapping bias)
- [ ] BIOL550: Code B submitted (`biol550/mapping.py` functional)
- [ ] BIOL550: Spine Ledger entry #2 logged with GitHub commit link
- [ ] DSCI601: Literature review outline started (15+ key papers identified)
- [ ] GitHub: W2 code merged; methods memo integrated
- [ ] Fairness check: Any bias modes identified in W1–W2 that need baseline measurement?

### WEEK 3: Normalization & Batch Effects
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W3 written (normalization approaches, batch effect masking)
- [ ] BIOL550: Code B submitted (`biol550/normalization.py` functional)
- [ ] BIOL550: Spine Ledger entry #3 logged with visualization showing disparate impact by ancestry
- [ ] DSCI601: Related work outline completed; first draft started
- [ ] GitHub: W3 code merged; first visualization showing batch effects by subgroup
- [ ] Data check: Confirm ancestry/demographic variables are correctly coded in dataset

### WEEK 4: Feature Selection
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W4 written (feature selection bias)
- [ ] BIOL550: Code B submitted (`biol550/feature_selection.py` + fairness audit)
- [ ] BIOL550: Spine Ledger entry #4 logged with disparate impact of feature retention
- [ ] DSCI601: Preliminary Proposal (2–3 pages) submitted
- [ ] DSCI601: In-class presentation (10 min) given; feedback received
- [ ] **FIRST MONTHLY SYNC CALL** (end of week 4): Review W1–W4 progress; align on data/fairness targets
- [ ] GitHub: Feature selection audit results committed; disparate impact visualized

### WEEK 5: RNA Structure Prediction
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W5 written (Nussinov, structural complexity)
- [ ] BIOL550: Code B submitted (`biol550/rna_structure.py` applying BIO630 knowledge)
- [ ] BIOL550: Spine Ledger entry #5 logged (complexity filter decision + threshold)
- [ ] DSCI601: Related work survey draft (3–4 pages) completed
- [ ] GitHub: RNA structure analysis for top 50 biomarker candidates committed
- [ ] Fairness check: Do structured vs. unstructured genes differ by ancestry representation?

### WEEK 6: Missing Data & Imputation
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W6 written (imputation + subgroup missingness patterns)
- [ ] BIOL550: Code B submitted (`biol550/imputation.py` with multiple strategies)
- [ ] BIOL550: Spine Ledger entry #6 logged (zero-inflation model decision)
- [ ] DSCI601: Related work survey final version (5–8 pages, >20 sources) submitted
- [ ] DSCI601: Revised Proposal (incorporating W4 feedback) submitted
- [ ] GitHub: Missingness analysis by ancestry committed; imputation comparison visualized

### WEEK 7: EDA & Visualization
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W7 written (visualization, subgroup visibility, power dynamics)
- [ ] BIOL550: Code B submitted (`biol550/exploratory_analysis.py` with ancestry coloring)
- [ ] BIOL550: **Midterm Synthesis Memo (3 pages)** submitted integrating W1–W7 decisions
- [ ] BIOL550: Spine Ledger entry #7 logged (mandatory demographic coloring standard)
- [ ] DSCI601: Continue advisor feedback incorporation
- [ ] GitHub: EDA plots (UMAP, PCA, heatmaps) with ancestry coloring committed
- [ ] **SECOND MONTHLY SYNC CALL** (end of week 7/8): Midterm check-in; review W1–W7 narrative

### WEEK 8: Reproducibility & Validation
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W8 written (ICC, cross-tissue validation, reproducibility)
- [ ] BIOL550: Code B submitted (`biol550/reproducibility.py` with ICC stratification)
- [ ] BIOL550: Spine Ledger entry #8 logged (reproducibility check per subgroup)
- [ ] DSCI601: Advisor meeting #2 (midterm) held; feedback documented
- [ ] DSCI601: Code review of BIOL550 preprocessing (informal, if DSCI601 has started coding)
- [ ] GitHub: ICC results by subgroup committed; flag any subgroups with ICC < 0.7

### WEEK 9: Statistical Testing & Confounding
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W9 written (DE testing, confounding adjustment, causal reasoning)
- [ ] BIOL550: Code B submitted (`biol550/differential_expression.py` with ancestry-stratified intercepts)
- [ ] BIOL550: Spine Ledger entry #9 logged (confounding adjustment protocol)
- [ ] DSCI601: Approach Writeup (2–3 pages) submitted (feature engineering, model selection, fairness metrics)
- [ ] DSCI601: Begin model implementation (`dsci601/modeling.py`)
- [ ] GitHub: DE results stratified by ancestry committed; causal DAG diagram added

### WEEK 10: ML Preprocessing & Feature Engineering
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W10 written (scaling, transformations, disparate impact of feature engineering)
- [ ] BIOL550: Code B submitted (`biol550/ml_preprocessing.py` with stratified scaling)
- [ ] BIOL550: Spine Ledger entry #10 logged (stratified scaling decision)
- [ ] **BIOL550 & DSCI601: Joint Architecture Memo (2–3 pages + diagram)** submitted and **co-signed**
- [ ] DSCI601: Approach + Architecture confirmed; ready for modeling sprint
- [ ] DSCI601: Code review assignment (peer code feedback) completed
- [ ] GitHub: ML preprocessing comparison (by ancestry) committed; architecture diagram added to `/docs/`
- [ ] **Data Card (DRAFT)** completed jointly; ready for review

### WEEK 11: Fairness Audit Baseline (BIOL550) & Model Fairness (DSCI601)
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W11 written (disparate impact, 80 rule, EQUITAS baseline)
- [ ] BIOL550: Code B submitted (`biol550/fairness_audit.py` with disparate impact calculator + dashboard)
- [ ] BIOL550: Spine Ledger entry #11 logged (baseline disparate impact %; fairness target set)
- [ ] DSCI601: Ethics & Fairness Writeup (3–5 pages, JOINTLY AUTHORED) drafted
  - Baseline fairness (from BIOL550): Disparate impact of preprocessing
  - Model fairness: Classifier performance, calibration, equalized odds *by ancestry*
  - Mitigation strategy: Which techniques applied?
  - Limitations section
- [ ] DSCI601: Model training complete; fairness evaluation finished
- [ ] GitHub: Fairness audit results (before mitigation) committed; disparate impact matrix visualized
- [ ] **THIRD MONTHLY SYNC CALL** (end of week 11/12): Review fairness results; align on mitigation strategies

### WEEK 12: Bias Mitigation & Data Augmentation
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W12 written (SMOTE, oversampling, mitigation plausibility)
- [ ] BIOL550: Code B submitted (`biol550/bias_mitigation.py` with stratified SMOTE)
- [ ] BIOL550: Spine Ledger entry #12 logged (augmentation protocol + rationale)
- [ ] DSCI601: Ethics & Fairness Writeup finalized (including mitigation results + before/after comparison)
- [ ] DSCI601: Report Rough Draft (10–12 pages) submitted (methods, results, discussion integrated)
- [ ] GitHub: Before/after fairness comparison committed; mitigation impact visualized
- [ ] **Fairness Assessment Report (5–8 pages, JOINTLY AUTHORED, CO-SIGNED)** submitted

### WEEK 13: Reproducibility, Documentation & Endterm Prep
**Status Check By Friday:**
- [ ] BIOL550: Methods Memo W13 written (Docker, reproducible environments, open science)
- [ ] BIOL550: Code B submitted (`Dockerfile` + `environment.yml` tested on 2 machines)
- [ ] BIOL550: Spine Ledger entry #13 logged (reproducibility & licensing decision)
- [ ] DSCI601: Endterm Demo Presentation (15 min, LIVE) delivered in class
  - Live run of pipeline: data → preprocessing → modeling → fairness eval
  - Key results shown (AUC, disparate impact before/after)
  - Fairness strategy explained to mixed audience
- [ ] DSCI601: Endterm Code Submission (GitHub final push)
  - All code documented + unit tests pass
  - README fully updated with example run
  - Version control history clean
- [ ] GitHub: Docker build successful; reproducible environment pinned; CC-BY-4.0 license added to repo
- [ ] **FOURTH MONTHLY SYNC CALL** (end of week 13/14): Final review; celebrate integration

### WEEK 14: Synthesis, Capstones & Final Submission
**Status Check By End of Week:**
- [ ] BIOL550: Methods Memo W14 (Final Synthesis, 5–8 pages) submitted
  - Executive summary of all 14 decisions
  - Integration narrative (how each decision fed next)
  - Disparate impact reduction trajectory
  - Links to GitHub commits
- [ ] BIOL550: Final Pipeline Integration Test (all code runs end-to-end; reproducible results generated)
- [ ] BIOL550: Spine Ledger Review (all 14 entries documented + linked)
- [ ] **BIOL550: Capstone Presentation (15–20 min, IN-CLASS)** delivered
  - RNA biology background (why these biomarkers matter)
  - Bias modes discovered + mitigation approach
  - Fairness strategy (preprocessing decisions that reduced disparate impact)
  - Handoff to DSCI601
- [ ] DSCI601: **Final Report (12–15 pages)** submitted
  - Abstract, intro, methods, results, discussion, conclusion
  - Incorporates BIOL550 methods contributions
  - Full fairness assessment integrated
  - >50 references
- [ ] DSCI601: **Final Code Submission** (GitHub release + DOI via Zenodo, if desired)
- [ ] **Data Card (FINAL)** completed & signed by both instructors
- [ ] **Architecture Memo (FINAL)** completed & signed by both instructors
- [ ] **Fairness Report (FINAL)** completed & signed by both instructors
- [ ] GitHub repo cleaned, documented, ready for public use
- [ ] **FINAL CELEBRATION SYNC CALL:** Both instructors, you, DSCI601 advisor review completed project; discuss future directions

---

## GRADING CHECKPOINT VERIFICATION

### BIOL550 Progress (Accumulate 400 points)
| Checkpoint | Target Completion | Points | Status |
|---|---|---|---|
| W1–W14 Methods Memos (A) | Ongoing, W14 | 70 | |
| W1–W14 Code (B) | Ongoing, W14 | 70 | |
| W1–W14 Spine Ledger (C) | Ongoing, W14 | 70 | |
| Midterm Synthesis (W7) | W7 | 40 | |
| Data Card (Joint) | W10–W13 | 50 | |
| Architecture Memo (Joint) | W10–W12 | 50 | |
| Capstone Presentation (W14) | W14 | 30 | |
| Final Code + README | W14 | 20 | |
| **TOTAL** | | **400** | |

### DSCI601 Progress (Accumulate 120 points)
| Checkpoint | Target Completion | Points | Status |
|---|---|---|---|
| Advisor Feedback I (W2–W3) | W3 | 15 | |
| Preliminary Proposal (W4) | W4 | 5 | |
| Proposal Presentation (W4) | W4 | 5 | |
| Related Work (W6–W7) | W7 | 10 | |
| Revised Proposal (W7) | W7 | 5 | |
| Advisor Feedback II (W8) | W8 | 15 | |
| Approach Writeup (W9) | W9 | 5 | |
| Architecture Writeup (W10) | W10 | 5 | |
| Code Review (W10) | W10 | 5 | |
| Ethics & Fairness (W11) | W11 | 5 | |
| Endterm Demo (W13) | W13 | 7 | |
| Final Code (W13) | W13 | 5 | |
| Final Report (W14) | W14 | 8 | |
| **TOTAL** | | **120** | |

---

## RED FLAGS & CONTINGENCY PLANS

### 🚩 If BIOL550 Syllabus Differs from 14-Week Structure
**Action:** Contact BIOL550 instructor by Week 1; map actual syllabus topics to bioinformatics concepts above. Adjust weekly deliverables accordingly but maintain:
- 14 weekly memos + code artifacts
- 1 midterm synthesis (W7–W8)
- 1 capstone presentation (W14)
- Fairness audit at Weeks 4, 8, 11

### 🚩 If Data Access Becomes Blocked
**Action:** Pivot to public dataset by Week 2 (GEO, TCGA, or published cohort). Scope narrows slightly but fairness focus remains. Notify both instructors immediately.

### 🚩 If DSCI601 Advisor Unavailable
**Action:** Contact DSCI601 program coordinator; assign backup advisor by Week 2. Maintain monthly sync calls.

### 🚩 If Code Becomes Unmanageable
**Action:** Week 10 code review checkpoint: ask DSCI601 instructor for refactoring guidance. Clean up `/biol550/` and `/dsci601/` folders; break code into smaller modules.

### 🚩 If Fairness Metrics Show No Improvement Post-Mitigation
**Action:** Document honestly in W14 synthesis memo. Explain what was learned (e.g., "This dataset has structural bias that preprocessing cannot fully address; downstream modeling + governance are needed"). This is a valid research finding, not a failure.

---

## SUCCESS METRICS

**By end of semester, you should have:**

✅ **GitHub Repo**
- Fully functional, reproducible pipeline (anyone can clone + run)
- Clean commit history (meaningful messages)
- Comprehensive README + documentation
- Data card, architecture diagram, fairness report in `/docs/`

✅ **Fairness Journey Documented**
- Week 1–14 decision log (spine ledger) with rationale
- Disparate impact measurement at preprocessing stage (W11)
- Disparate impact reduction post-mitigation (W12–W14)
- Before/after comparison visualized

✅ **Both Courses Integrated**
- BIOL550 capstone explains biology + preprocessing fairness
- DSCI601 report integrates BIOL550 methods + shows model fairness
- Shared deliverables (data card, architecture, fairness report) signed by both instructors

✅ **Community-Ready**
- Code is open-source (CC-BY-4.0 or MIT license)
- Reproducible environment (Docker or conda)
- Invitation for community feedback in README
- Explicit limitation section on which populations this model applies to

---

## CONTACT QUICK REFERENCE

| Role | Name | Email | Phone | Office Hours |
|---|---|---|---|---|
| BIOL550 Instructor | [Insert] | [Email] | [Phone] | [Times] |
| DSCI601 Advisor | [Insert] | [Email] | [Phone] | [Times] |
| Program Coordinator (DSCI) | [Insert] | [Email] | [Phone] | [Times] |
| You | [Your name] | [Your email] | [Your phone] | N/A |

---

## FINAL THOUGHT

This checklist is your **roadmap from Week 1 → Week 14**. Use it to:
- ✅ Track weekly progress
- ✅ Catch blockers early
- ✅ Communicate clearly with instructors
- ✅ Celebrate milestones

By following this structure, you're not just completing two courses—you're **demonstrating that fairness-aware bioinformatics is a teachable, reproducible, integrated discipline**.

**Let's build something remarkable. Good luck.** 🧬📊✨

---

**Checklist Version:** 1.0  
**Last Updated:** January 14, 2026  
**Print & post this on your desk →**
